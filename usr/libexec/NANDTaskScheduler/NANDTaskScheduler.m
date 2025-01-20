uint64_t sendTunnelBuffer(char **a1, int a2, uint64_t a3, int a4)
{
  FILE *v4;
  const char *v5;
  size_t v6;
  mach_port_t v10;
  kern_return_t v11;
  uint64_t v12;
  char **v14;
  size_t outputStructCnt;
  int outputStruct;
  uint64_t inputStruct;
  uint64_t v18;
  uint64_t v19;

  inputStruct = 0;
  v18 = 0;
  v19 = 0;
  outputStruct = 0;
  v14 = 0;
  outputStructCnt = 4;
  if ((a3 == 0) != (a4 == 0))
  {
    v4 = __stderrp;
    v5 = "Error in inputBuffer or inputBufSize for sendTunnelBuffer\n";
    v6 = 58;
LABEL_11:
    fwrite(v5, v6, 1uLL, v4);
    goto LABEL_12;
  }
  if (a1)
  {
    v10 = *((_DWORD *)a1 + 4);
  }
  else if (!findNandExporter_tunnel(&v14) || (a1 = v14) == 0 || (v10 = *((_DWORD *)v14 + 4)) == 0)
  {
    v4 = __stderrp;
    v5 = "Unable to get nand connection\n";
    v6 = 30;
    goto LABEL_11;
  }
  v19 = a3;
  LODWORD(inputStruct) = a2;
  HIDWORD(v18) = a4;
  v11 = IOConnectCallStructMethod(v10, *((_DWORD *)a1 + 7), &inputStruct, 0x18uLL, &outputStruct, &outputStructCnt);
  if (v11)
  {
    fprintf(__stderrp, "Failed to send tunnel buffer: 0x%08x\n", v11);
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  v12 = 1;
LABEL_13:
  if (v14) {
    ReleaseIOInterfaces((uint64_t)v14);
  }
  return v12;
}

void *fetchTunnelBufferWithInVal(char **a1, int a2, int a3, int a4, void *a5, char a6, char a7)
{
  v13 = a1;
  v21 = 0;
  *a5 = 0;
  if (!a1 && (!findNandExporter_tunnel(&v21) || (v13 = v21) == 0 || !*((_DWORD *)v21 + 4)))
  {
    fwrite("Err: Finding internal NAND exporter failed for fetch tunnel buffer.\n", 0x44uLL, 1uLL, __stderrp);
LABEL_11:
    v19 = 0;
    goto LABEL_14;
  }
  int v14 = a3;
  unsigned int v15 = sub_100001298((uint64_t)v13, a2, a3, a4, a7);
  if (!v15)
  {
    fprintf(__stderrp, "failed to get data size for cmd option %d\n", a2);
    goto LABEL_11;
  }
  uint64_t v16 = v15;
  size_t v17 = (vm_page_size + v15 - 1) / vm_page_size * vm_page_size;
  v18 = malloc_type_valloc(v17, 0x7C7CDE6BuLL);
  v19 = v18;
  if (v18)
  {
    bzero(v18, v17);
    if (sub_100001360((uint64_t)v13, a2, v14, a4, v19, v17, a6, a7))
    {
      *a5 = v16;
    }
    else
    {
      free(v19);
      v19 = 0;
      *a5 = 0;
    }
  }
  else
  {
    fwrite("can't allocate buffer!\n", 0x17uLL, 1uLL, __stderrp);
  }
LABEL_14:
  if (v21) {
    ReleaseIOInterfaces((uint64_t)v21);
  }
  return v19;
}

uint64_t sub_100001298(uint64_t a1, int a2, int a3, int a4, char a5)
{
  kern_return_t v7;
  uint64_t result;
  size_t outputStructCnt;
  unsigned int outputStruct;
  _DWORD inputStruct[3];
  uint64_t v12;
  int v13;

  v13 = 0;
  v12 = 0;
  outputStruct = 0;
  inputStruct[0] = a2;
  outputStructCnt = 4;
  inputStruct[2] = a4;
  inputStruct[1] = a3 | 1;
  v7 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 16), *(_DWORD *)(a1 + 28), inputStruct, 0x18uLL, &outputStruct, &outputStructCnt);
  if (v7)
  {
    if ((a5 & 1) == 0) {
      fprintf(__stderrp, "Error calling CoreDebugTunnel method! - 0x%X\n", v7);
    }
    return 0;
  }
  else
  {
    result = outputStruct;
    if (!outputStruct && (a5 & 1) == 0)
    {
      fprintf(__stderrp, "SizeOnly for tunnel command 0x%x returned 0\n", a2);
      return outputStruct;
    }
  }
  return result;
}

uint64_t sub_100001360(uint64_t a1, int a2, int a3, int a4, void *outputStruct, size_t a6, char a7, char a8)
{
  kern_return_t v15;
  size_t v16;
  _DWORD inputStruct[3];
  uint64_t v19;
  int v20;
  size_t outputStructCnt;

  LOBYTE(v9) = a7;
  outputStructCnt = a6;
  v20 = 0;
  v19 = 0;
  while (1)
  {
    inputStruct[0] = a2;
    inputStruct[1] = a3;
    inputStruct[2] = a4;
    unsigned int v15 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 16), *(_DWORD *)(a1 + 28), inputStruct, 0x18uLL, outputStruct, &outputStructCnt);
    if (v15 != -536870211) {
      break;
    }
    if ((v9 & 1) == 0) {
      goto LABEL_10;
    }
    if ((a8 & 1) == 0) {
      fprintf(__stderrp, "CoreDebugTunnel 0x%x returned kIOReturnNoMemory\n", a2);
    }
    uint64_t v16 = outputStructCnt;
    outputStructCnt = vm_page_size;
    uint64_t v9 = 1;
    if (vm_page_size == v16) {
      return v9;
    }
  }
  if (!v15) {
    return 1;
  }
LABEL_10:
  if ((a8 & 1) == 0) {
    fprintf(__stderrp, "Error calling CoreDebugTunnel method! - 0x%X\n", v15);
  }
  return 0;
}

void *fetchTunnelBuffer(char **a1, int a2, int a3, void *a4, char a5, char a6)
{
  return fetchTunnelBufferWithInVal(a1, a2, a3, 0, a4, a5, a6);
}

void *fetchTunnelBuffer_zeroflag(char **a1, int a2, void *a3, char a4, char a5)
{
  return fetchTunnelBufferWithInVal(a1, a2, 0, 0, a3, a4, a5);
}

void *fetchTunnelBuffer_simple(int a1, void *a2)
{
  return fetchTunnelBufferWithInVal(0, a1, 0, 0, a2, 0, 0);
}

void *fetchTunnelBufferSkipSizeWrap(char **a1, int a2, void *a3)
{
  v5 = a1;
  v11 = 0;
  if (a1 || findNandExporter_tunnel(&v11) && (v5 = v11) != 0 && *((_DWORD *)v11 + 4))
  {
    uint64_t v6 = *(unsigned int *)a3;
    size_t v7 = (v6 + vm_page_size - 1) / vm_page_size * vm_page_size;
    v8 = malloc_type_valloc(v7, 0x6787D965uLL);
    uint64_t v9 = v8;
    if (v8)
    {
      bzero(v8, v7);
      if (sub_100001360((uint64_t)v5, a2, 0, 0, v9, v7, 0, 1))
      {
        *a3 = v6;
      }
      else
      {
        free(v9);
        uint64_t v9 = 0;
        *a3 = 0;
      }
    }
    else
    {
      fwrite("can't allocate buffer!\n", 0x17uLL, 1uLL, __stderrp);
    }
  }
  else
  {
    fwrite("Err: Finding internal NAND exporter failed for fetch tunnel buffer.\n", 0x44uLL, 1uLL, __stderrp);
    uint64_t v9 = 0;
  }
  if (v11) {
    ReleaseIOInterfaces((uint64_t)v11);
  }
  return v9;
}

uint64_t populateTunnelBuffer(uint64_t a1, void *a2, void *a3, int a4, int a5, int a6, char a7, char a8)
{
  if (!a1)
  {
    v18 = __stderrp;
    v19 = "Err: Need a valid nand exporter here.\n";
    size_t v20 = 38;
    goto LABEL_10;
  }
  if (!a2 || !a3)
  {
    v18 = __stderrp;
    v19 = "Err: Need a valid outputbuffer and bufferSize";
    size_t v20 = 45;
    goto LABEL_10;
  }
  unsigned int v16 = sub_100001298(a1, a4, a5, a6, a8);
  if (!v16)
  {
    uint64_t v21 = 0;
    goto LABEL_16;
  }
  unsigned int v17 = v16;
  if (!*a3 || v16 <= *a3)
  {
    size_t v23 = (vm_page_size + v16 - 1) / vm_page_size * vm_page_size;
    bzero(a2, v23);
    if ((sub_100001360(a1, a4, a5, a6, a2, v23, a7, a8) & 1) == 0) {
      goto LABEL_11;
    }
    uint64_t v21 = v17;
LABEL_16:
    uint64_t result = 1;
    goto LABEL_12;
  }
  v18 = __stderrp;
  v19 = "Err: Allocated buffer not large enough for the command.\n";
  size_t v20 = 56;
LABEL_10:
  fwrite(v19, v20, 1uLL, v18);
LABEL_11:
  uint64_t v21 = 0;
  uint64_t result = 0;
LABEL_12:
  *a3 = v21;
  return result;
}

uint64_t populateTunnelOutputBufferWithoutSizeQuery_withFlags(char **a1, int a2, int a3, int a4, void *outputStruct, size_t a6, char a7, char a8)
{
  unsigned int v17 = 0;
  if (a1 || findNandExporter_tunnel(&v17) && (a1 = v17) != 0 && *((_DWORD *)v17 + 4))
  {
    if (sub_100001360((uint64_t)a1, a2, a3, a4, outputStruct, a6, a7, a8))
    {
      uint64_t v15 = 1;
      goto LABEL_10;
    }
    fprintf(__stderrp, "Error fetching the tunnel output buffer for opcode [%d]\n", a2);
  }
  else
  {
    fwrite("Err: Finding internal NAND exporter failed.\n", 0x2CuLL, 1uLL, __stderrp);
  }
  uint64_t v15 = 0;
LABEL_10:
  if (v17) {
    ReleaseIOInterfaces((uint64_t)v17);
  }
  return v15;
}

uint64_t populateTunnelOutputBufferWithoutSizeQuery(char **a1, int a2, int a3, void *outputStruct, size_t a5, char a6, char a7)
{
  return populateTunnelOutputBufferWithoutSizeQuery_withFlags(a1, a2, 0, a3, outputStruct, a5, a6, a7);
}

uint64_t getTunnelOutputThroughSizeOnlyHandling(char **a1, int a2, int a3, void *outputStruct)
{
  kern_return_t v7;
  uint64_t v8;
  size_t outputStructCnt;
  char **v11;
  _DWORD inputStruct[3];
  uint64_t v13;
  int v14;

  v13 = 0;
  int v14 = 0;
  outputStructCnt = 4;
  v11 = 0;
  inputStruct[0] = a2;
  inputStruct[1] = 1;
  inputStruct[2] = a3;
  if (!outputStruct)
  {
    syslog(3, "Error: must provide valid pointer for output value");
    goto LABEL_11;
  }
  if (a1)
  {
    mach_port_t v6 = *((_DWORD *)a1 + 4);
  }
  else if (!findNandExporter_tunnel(&v11) || (a1 = v11) == 0 || (mach_port_t v6 = *((_DWORD *)v11 + 4)) == 0)
  {
    fwrite("Err: Finding internal NAND exporter failed.\n", 0x2CuLL, 1uLL, __stderrp);
    goto LABEL_11;
  }
  size_t v7 = IOConnectCallStructMethod(v6, *((_DWORD *)a1 + 8), inputStruct, 0x18uLL, outputStruct, &outputStructCnt);
  if (v7)
  {
    fprintf(__stderrp, "Error fetching the tunnel output buffer for opcode [%d], Result [0x%X]\n", a2, v7);
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  v8 = 1;
LABEL_12:
  if (v11) {
    ReleaseIOInterfaces((uint64_t)v11);
  }
  return v8;
}

uint64_t ASPParseBufferToCxt(uint64_t a1, uint64_t *a2, unsigned int a3)
{
  *(_DWORD *)(a1 + 36) = -1;
  if (a3 < 8) {
    return 0;
  }
  unsigned int v6 = a3 >> 3;
  while (2)
  {
    unint64_t v9 = *a2;
    v8 = a2 + 1;
    int v7 = v9;
    unint64_t v10 = HIDWORD(v9);
    unsigned int v11 = v6 - 1;
    if (v9 <= 0x30000000 && v11 >= v10)
    {
      switch(v7)
      {
        case 1:
          uint64_t v13 = *v8;
          int v14 = "version";
          goto LABEL_77;
        case 2:
          uint64_t v13 = *v8;
          int v14 = "hostWriteXacts";
          goto LABEL_77;
        case 3:
          uint64_t v13 = *v8;
          int v14 = "hostReadXacts";
          goto LABEL_77;
        case 4:
          uint64_t v13 = *v8;
          *(void *)(a1 + 72) = *v8;
          int v14 = "hostWrites";
          goto LABEL_77;
        case 5:
          uint64_t v13 = *v8;
          int v14 = "hostWritesDyn";
          goto LABEL_77;
        case 6:
          uint64_t v13 = *v8;
          int v14 = "hostWritesStatic";
          goto LABEL_77;
        case 7:
          uint64_t v13 = *v8;
          *(void *)(a1 + 64) = *v8;
          int v14 = "hostReads";
          goto LABEL_77;
        case 8:
          uint64_t v13 = *v8;
          int v14 = "validLbas";
          goto LABEL_77;
        case 9:
          uint64_t v13 = *v8;
          int v14 = "shutdowns";
          goto LABEL_77;
        case 10:
          uint64_t v13 = *v8;
          int v14 = "boots";
          goto LABEL_77;
        case 11:
          uint64_t v13 = *v8;
          int v14 = "uncleanBoots";
          goto LABEL_77;
        case 12:
          uint64_t v13 = *v8;
          *(void *)(a1 + 144) = *v8;
          int v14 = "IND_pool_free";
          goto LABEL_77;
        case 13:
          uint64_t v13 = *v8;
          *(void *)(a1 + 152) = *v8;
          int v14 = "IND_pool_count";
          goto LABEL_77;
        case 14:
          uint64_t v15 = "hostWriteLogHisto";
          uint64_t v16 = a1;
          int v17 = 14;
          goto LABEL_44;
        case 15:
          uint64_t v15 = "hostReadLogHisto";
          uint64_t v16 = a1;
          int v17 = 15;
LABEL_44:
          v18 = v8;
          unsigned int v19 = 10;
          goto LABEL_51;
        case 16:
          uint64_t v13 = *v8;
          int v14 = "gcWrites";
          goto LABEL_77;
        case 17:
          uint64_t v13 = *v8;
          *(void *)(a1 + 88) = *v8;
          int v14 = "wearLevMoves";
          goto LABEL_77;
        case 18:
          uint64_t v13 = *v8;
          *(void *)(a1 + 104) = *v8;
          int v14 = "nandWrites";
          goto LABEL_77;
        case 19:
          uint64_t v13 = *v8;
          *(void *)(a1 + 96) = *v8;
          int v14 = "nandReads";
          goto LABEL_77;
        case 20:
          uint64_t v13 = *v8;
          *(void *)(a1 + 112) = *v8;
          int v14 = "bandErases";
          goto LABEL_77;
        case 22:
          uint64_t v13 = *v8;
          int v14 = "numPfail";
          goto LABEL_77;
        case 23:
          uint64_t v13 = *v8;
          int v14 = "numEfail";
          goto LABEL_77;
        case 24:
          uint64_t v13 = *v8;
          int v14 = "numPerformanceRefreshes";
          goto LABEL_77;
        case 27:
          uint64_t v13 = *v8;
          int v14 = "hostWritesMeta";
          goto LABEL_77;
        case 28:
          uint64_t v13 = *v8;
          *(void *)(a1 + 168) = *v8;
          int v14 = "numSleepOps";
          goto LABEL_77;
        case 30:
          uint64_t v13 = *v8;
          int v14 = "cntTimeWentBackWardOnBoot";
          goto LABEL_77;
        case 31:
          uint64_t v13 = *v8;
          int v14 = "cntTimeWentBackWard";
          goto LABEL_77;
        case 34:
          uint64_t v13 = *v8;
          int v14 = "powerOnHours";
          goto LABEL_77;
        case 36:
          uint64_t v13 = *v8;
          int v14 = "smartCritWarnings";
          goto LABEL_77;
        case 37:
          uint64_t v13 = *v8;
          int v14 = "numFlushes";
          goto LABEL_77;
        case 38:
          uint64_t v13 = *v8;
          int v14 = "numUnmap";
          goto LABEL_77;
        case 39:
          uint64_t v13 = *v8;
          int v14 = "numUnmapSec";
          goto LABEL_77;
        case 41:
          uint64_t v13 = *v8;
          int v14 = "clogProgram";
          goto LABEL_77;
        case 42:
          uint64_t v13 = *v8;
          int v14 = "clogPFail";
          goto LABEL_77;
        case 43:
          uint64_t v13 = *v8;
          int v14 = "clogRead";
          goto LABEL_77;
        case 44:
          uint64_t v13 = *v8;
          int v14 = "clogRFail";
          goto LABEL_77;
        case 45:
          uint64_t v13 = *v8;
          *(void *)(a1 + 176) = *v8;
          int v14 = "maxHighEnduranceBlockErases";
          goto LABEL_77;
        case 46:
          uint64_t v13 = *v8;
          int v14 = "numFactoryBad";
          goto LABEL_77;
        case 47:
          uint64_t v13 = *v8;
          int v14 = "numGrownBad";
          goto LABEL_77;
        case 48:
          uint64_t v13 = *v8;
          *(void *)(a1 + 80) = *v8;
          int v14 = "numFreeVirtualBlocks";
          goto LABEL_77;
        case 49:
          uint64_t v13 = *v8;
          *(_DWORD *)(a1 + 56) = *v8;
          int v14 = "bytesPerPage";
          goto LABEL_77;
        case 50:
          uint64_t v13 = *v8;
          *(_DWORD *)(a1 + 52) = *v8;
          int v14 = "pagesPerVirtualBlock";
          goto LABEL_77;
        case 51:
          uint64_t v13 = *v8;
          *(_DWORD *)(a1 + 48) = *v8;
          int v14 = "blocksPerVirtualBlock";
          goto LABEL_77;
        case 52:
          uint64_t v13 = *v8;
          *(_DWORD *)(a1 + 44) = *v8;
          int v14 = "numVirtualBlocks";
          goto LABEL_77;
        case 53:
          uint64_t v13 = *v8;
          *(_DWORD *)(a1 + 32) = *v8;
          int v14 = "exportVersion";
          goto LABEL_77;
        case 54:
          uint64_t v15 = "ECBins";
          uint64_t v16 = a1;
          int v17 = 54;
          goto LABEL_50;
        case 55:
          uint64_t v15 = "RCBins";
          uint64_t v16 = a1;
          int v17 = 55;
LABEL_50:
          v18 = v8;
          unsigned int v19 = 100;
          goto LABEL_51;
        case 56:
          uint64_t v13 = *v8;
          *(void *)(a1 + 160) = *v8;
          int v14 = "utilFormatTime";
          goto LABEL_77;
        case 57:
          uint64_t v13 = *v8;
          int v14 = "calendarTime";
          goto LABEL_77;
        case 58:
          uint64_t v13 = *v8;
          int v14 = "wallTime";
          goto LABEL_77;
        case 59:
          uint64_t v13 = *v8;
          int v14 = "cmdq_flush_us";
          goto LABEL_77;
        case 60:
          uint64_t v13 = *v8;
          int v14 = "cmdq_unmap_us";
          goto LABEL_77;
        case 61:
          uint64_t v13 = *v8;
          int v14 = "cmdq_pri0_r_us";
          goto LABEL_77;
        case 62:
          uint64_t v13 = *v8;
          int v14 = "cmdq_pri0_w_us";
          goto LABEL_77;
        case 63:
          uint64_t v13 = *v8;
          int v14 = "cmdq_pri1_r_us";
          goto LABEL_77;
        case 64:
          uint64_t v13 = *v8;
          int v14 = "cmdq_pri1_w_us";
          goto LABEL_77;
        case 65:
          uint64_t v13 = *v8;
          int v14 = "cmdq_pri2_r_us";
          goto LABEL_77;
        case 66:
          uint64_t v13 = *v8;
          int v14 = "cmdq_pri2_w_us";
          goto LABEL_77;
        case 67:
          uint64_t v13 = *v8;
          int v14 = "cmdq_pri3_r_us";
          goto LABEL_77;
        case 68:
          uint64_t v13 = *v8;
          int v14 = "cmdq_pri3_w_us";
          goto LABEL_77;
        case 69:
          uint64_t v13 = *v8;
          int v14 = "host_idle_ms";
          goto LABEL_77;
        case 70:
          uint64_t v13 = *v8;
          int v14 = "cmd_hysteresis_window_us";
          goto LABEL_77;
        case 71:
          uint64_t v13 = *v8;
          int v14 = "cmd_lowPriHoldoffDelay_us";
          goto LABEL_77;
        case 72:
          uint64_t v13 = *v8;
          int v14 = "cmd_lowPriHoldoffEnabled";
LABEL_77:
          size_t v20 = (void *)a1;
          goto LABEL_78;
        default:
          switch(v7)
          {
            case 73:
              uint64_t v13 = *v8;
              int v14 = "cmd_expedite_num_success";
              goto LABEL_77;
            case 75:
              uint64_t v13 = *v8;
              int v14 = "cmd_expedite_num_failures";
              goto LABEL_77;
            case 76:
              uint64_t v13 = *v8;
              int v14 = "num_trimerase";
              goto LABEL_77;
            case 77:
              uint64_t v13 = *v8;
              int v14 = "staticSizeInMB";
              goto LABEL_77;
            case 80:
              uint64_t v13 = *v8;
              int v14 = "slcInvalidations";
              goto LABEL_77;
            case 81:
              uint64_t v13 = *v8;
              int v14 = "slcGCInvalidations";
              goto LABEL_77;
            case 82:
              uint64_t v13 = *v8;
              int v14 = "hostSectorsDuringGCon";
              goto LABEL_77;
            case 83:
              uint64_t v13 = *v8;
              int v14 = "highWaterMarkSLCUsed";
              goto LABEL_77;
            case 84:
              uint64_t v13 = *v8;
              int v14 = "intermediateBandErases";
              goto LABEL_77;
            case 85:
              uint64_t v13 = *v8;
              int v14 = "intermediatePartitionStart";
              goto LABEL_77;
            case 86:
              uint64_t v13 = *v8;
              int v14 = "userPartitionStart";
              goto LABEL_77;
            case 87:
              uint64_t v13 = *v8;
              int v14 = "iolog_lbas";
              goto LABEL_77;
            case 88:
              uint64_t v15 = "bandsAgeBins";
              uint64_t v16 = a1;
              int v17 = 88;
              goto LABEL_44;
            case 89:
              uint64_t v15 = "intermediateBandsAgeBins";
              uint64_t v16 = a1;
              int v17 = 89;
              goto LABEL_44;
            case 90:
              uint64_t v15 = "qosPerCmdQ";
              uint64_t v16 = a1;
              int v17 = 90;
              v18 = v8;
              unsigned int v19 = 160;
              goto LABEL_51;
            case 91:
              uint64_t v15 = "maxQosPerCmdQ";
              uint64_t v16 = a1;
              int v17 = 91;
              goto LABEL_44;
            case 92:
              uint64_t v13 = *v8;
              int v14 = "shutdownDuringGC";
              goto LABEL_77;
            case 93:
              uint64_t v15 = "numBandsRefreshedForAgePerTier";
              uint64_t v16 = a1;
              int v17 = 93;
LABEL_130:
              v18 = v8;
              unsigned int v19 = 3;
              goto LABEL_51;
            case 94:
              uint64_t v15 = "bdrDeltaHot";
              uint64_t v16 = a1;
              int v17 = 94;
LABEL_93:
              v18 = v8;
              unsigned int v19 = 20;
              goto LABEL_51;
            case 95:
              uint64_t v13 = *v8;
              int v14 = "numRefreshOnClockLoss";
              goto LABEL_77;
            case 96:
              uint64_t v13 = *v8;
              int v14 = "numRefreshOnErrNandRefreshRel";
              goto LABEL_77;
            case 97:
              uint64_t v13 = *v8;
              int v14 = "numBGRefreshMoves";
              goto LABEL_77;
            case 98:
              uint64_t v13 = *v8;
              int v14 = "numBGPaddingMoves";
              goto LABEL_77;
            case 99:
              uint64_t v13 = *v8;
              int v14 = "hostWritesPhoto";
              goto LABEL_77;
            case 100:
              uint64_t v13 = *v8;
              int v14 = "INDPooldFree";
              goto LABEL_77;
            case 101:
              uint64_t v13 = *v8;
              int v14 = "INDContigCount";
              goto LABEL_77;
            case 102:
              uint64_t v13 = *v8;
              int v14 = "INDValidContigCount";
              goto LABEL_77;
            case 103:
              uint64_t v13 = *v8;
              int v14 = "INDMinContigSize";
              goto LABEL_77;
            case 104:
              uint64_t v13 = *v8;
              int v14 = "INDMaxContigSize";
              goto LABEL_77;
            case 105:
              uint64_t v13 = *v8;
              int v14 = "INDAveContigSize";
              goto LABEL_77;
            case 106:
              uint64_t v13 = *v8;
              int v14 = "INDpoolSize";
              goto LABEL_77;
            case 107:
              uint64_t v13 = *v8;
              int v14 = "pushSyncWrites";
              goto LABEL_77;
            case 109:
              uint64_t v13 = *v8;
              int v14 = "cmd_rw_hysteresis_us";
              goto LABEL_77;
            case 110:
              uint64_t v13 = *v8;
              int v14 = "photoFlowMode";
              goto LABEL_77;
            case 112:
              uint64_t v13 = *v8;
              int v14 = "numBandsPaddedForAge";
              goto LABEL_77;
            case 113:
              uint64_t v15 = "bandsPerHostFlow";
              uint64_t v16 = a1;
              int v17 = 113;
              goto LABEL_144;
            case 114:
              uint64_t v15 = "bandsPerSpecialFlow";
              uint64_t v16 = a1;
              int v17 = 114;
              goto LABEL_102;
            case 115:
              uint64_t v15 = "secsPerHostFlow";
              uint64_t v16 = a1;
              int v17 = 115;
              goto LABEL_144;
            case 116:
              uint64_t v15 = "secsPerSpecialFlow";
              uint64_t v16 = a1;
              int v17 = 116;
              goto LABEL_102;
            case 118:
              uint64_t v15 = "overWritesPerHostFlow";
              uint64_t v16 = a1;
              int v17 = 118;
              goto LABEL_144;
            case 119:
              uint64_t v15 = "overWritesPerSpecialFlow";
              uint64_t v16 = a1;
              int v17 = 119;
              goto LABEL_102;
            case 120:
              uint64_t v15 = "padSectorsPerFlow";
              uint64_t v16 = a1;
              int v17 = 120;
              goto LABEL_44;
            case 121:
              uint64_t v15 = "padSizes";
              uint64_t v16 = a1;
              int v17 = 121;
              goto LABEL_144;
            case 122:
              uint64_t v15 = "unmapsPerHostFlow";
              uint64_t v16 = a1;
              int v17 = 122;
LABEL_144:
              v18 = v8;
              unsigned int v19 = 4;
              goto LABEL_51;
            case 123:
              uint64_t v15 = "unmapsPerSpecialFlow";
              uint64_t v16 = a1;
              int v17 = 123;
LABEL_102:
              v18 = v8;
              unsigned int v19 = 5;
              goto LABEL_51;
            case 124:
              uint64_t v15 = "coldestCycle";
              uint64_t v16 = a1;
              int v17 = 124;
              goto LABEL_123;
            case 125:
              uint64_t v15 = "hottestCycle";
              uint64_t v16 = a1;
              int v17 = 125;
LABEL_123:
              v18 = v8;
              unsigned int v19 = 2;
              goto LABEL_51;
            case 126:
              uint64_t v13 = *v8;
              int v14 = "gcLonlyWrites";
              goto LABEL_77;
            case 127:
              uint64_t v13 = *v8;
              int v14 = "gcPLWrites";
              goto LABEL_77;
            case 129:
              uint64_t v13 = *v8;
              int v14 = "pagesPerVirtualBlockSlc";
              goto LABEL_77;
            case 130:
              uint64_t v13 = *v8;
              int v14 = "bdrPadding";
              goto LABEL_77;
            case 131:
              uint64_t v15 = "errInjCounters";
              uint64_t v16 = a1;
              int v17 = 131;
LABEL_149:
              v18 = v8;
              unsigned int v19 = 8;
              goto LABEL_51;
            case 132:
              uint64_t v13 = *v8;
              int v14 = "raidSuccessfulReconstructionInternal";
              goto LABEL_77;
            case 133:
              uint64_t v13 = *v8;
              int v14 = "raidSuccessfulReconstructionHost";
              goto LABEL_77;
            case 134:
              uint64_t v13 = *v8;
              int v14 = "raidFailedReconstructionInternal";
              goto LABEL_77;
            case 135:
              uint64_t v13 = *v8;
              int v14 = "raidFailedReconstructionHost";
              goto LABEL_77;
            case 136:
              uint64_t v13 = *v8;
              int v14 = "raidBandsPerHostFlow";
              goto LABEL_77;
            case 137:
              uint64_t v13 = *v8;
              int v14 = "raidSecsPerHostFlow";
              goto LABEL_77;
            case 138:
              uint64_t v13 = *v8;
              int v14 = "gcFreeL";
              goto LABEL_77;
            case 139:
              uint64_t v13 = *v8;
              int v14 = "gcDestinations";
              goto LABEL_77;
            case 140:
              uint64_t v13 = *v8;
              int v14 = "gcFragments";
              goto LABEL_77;
            case 141:
              uint64_t v13 = *v8;
              int v14 = "numMemChoke";
              goto LABEL_77;
            case 142:
              uint64_t v13 = *v8;
              int v14 = "maxMemChokeDuration";
              goto LABEL_77;
            case 143:
              uint64_t v13 = *v8;
              int v14 = "memChokeDuration";
              goto LABEL_77;
            default:
              switch(v7)
              {
                case 144:
                  uint64_t v13 = *v8;
                  int v14 = "numMemExtreme";
                  goto LABEL_77;
                case 145:
                  uint64_t v13 = *v8;
                  int v14 = "maxMemExtremeDuration";
                  goto LABEL_77;
                case 146:
                  uint64_t v13 = *v8;
                  int v14 = "memExtremeDuration";
                  goto LABEL_77;
                case 147:
                  uint64_t v13 = *v8;
                  int v14 = "bandGetsExtreme";
                  goto LABEL_77;
                case 148:
                  uint64_t v13 = *v8;
                  int v14 = "bandGetsLow";
                  goto LABEL_77;
                case 149:
                  uint64_t v13 = *v8;
                  int v14 = "numHostChoke";
                  goto LABEL_77;
                case 152:
                  uint64_t v13 = *v8;
                  int v14 = "AbortSkip_ProgramError";
                  goto LABEL_77;
                case 153:
                  uint64_t v13 = *v8;
                  int v14 = "AbortSkip_ReadErrorOpenBand";
                  goto LABEL_77;
                case 154:
                  uint64_t v13 = *v8;
                  int v14 = "AbortSkip_FailedRebuildingParity";
                  goto LABEL_77;
                case 155:
                  uint64_t v13 = *v8;
                  int v14 = "AbortPad_OpenRefreshBand";
                  goto LABEL_77;
                case 156:
                  uint64_t v13 = *v8;
                  int v14 = "AbortPad_CloseBands";
                  goto LABEL_77;
                case 157:
                  uint64_t v13 = *v8;
                  int v14 = "AbortPad_SetPhoto";
                  goto LABEL_77;
                case 158:
                  uint64_t v13 = *v8;
                  int v14 = "AbortPad_GcNoSource";
                  goto LABEL_77;
                case 159:
                  uint64_t v13 = *v8;
                  int v14 = "AbortPad_Format";
                  goto LABEL_77;
                case 160:
                  uint64_t v13 = *v8;
                  int v14 = "nandDiscoveryDuration";
                  goto LABEL_77;
                case 161:
                  uint64_t v13 = *v8;
                  int v14 = "coreCCEnableDuration";
                  goto LABEL_77;
                case 163:
                  uint64_t v13 = *v8;
                  int v14 = "coreOpenDuration";
                  goto LABEL_77;
                case 164:
                  uint64_t v13 = *v8;
                  int v14 = "coreWritableDuration";
                  goto LABEL_77;
                case 165:
                  uint64_t v13 = *v8;
                  int v14 = "coreClogLoadDuration";
                  goto LABEL_77;
                case 167:
                  uint64_t v13 = *v8;
                  int v14 = "bulkPFail";
                  goto LABEL_77;
                case 169:
                  uint64_t v13 = *v8;
                  int v14 = "bulkRFail";
                  goto LABEL_77;
                case 172:
                  uint64_t v13 = *v8;
                  int v14 = "raidSmartErrors";
                  goto LABEL_77;
                case 182:
                  uint64_t v13 = *v8;
                  int v14 = "internalUeccs";
                  goto LABEL_77;
                case 183:
                  uint64_t v13 = *v8;
                  int v14 = "e2eFail";
                  goto LABEL_77;
                case 184:
                  uint64_t v13 = *v8;
                  int v14 = "TempSensorMax";
                  goto LABEL_77;
                case 185:
                  uint64_t v13 = *v8;
                  int v14 = "TempSensorMin";
                  goto LABEL_77;
                case 186:
                  uint64_t v13 = *v8;
                  int v14 = "powerUpFromDDR";
                  goto LABEL_77;
                case 187:
                  uint64_t v13 = *v8;
                  int v14 = "numMemLow";
                  goto LABEL_77;
                case 188:
                  uint64_t v13 = *v8;
                  int v14 = "maxMemLowDuration";
                  goto LABEL_77;
                case 189:
                  uint64_t v13 = *v8;
                  int v14 = "memLowDuration";
                  goto LABEL_77;
                case 190:
                  uint64_t v13 = *v8;
                  int v14 = "numFences";
                  goto LABEL_77;
                case 191:
                  uint64_t v13 = *v8;
                  int v14 = "hostPassiveIO";
                  goto LABEL_77;
                case 192:
                  uint64_t v13 = *v8;
                  int v14 = "odtsMax";
                  goto LABEL_77;
                case 193:
                  uint64_t v13 = *v8;
                  int v14 = "defragMFromOrphans";
                  goto LABEL_77;
                case 194:
                  uint64_t v13 = *v8;
                  int v14 = "defragMFromFragments";
                  goto LABEL_77;
                case 195:
                  uint64_t v13 = *v8;
                  int v14 = "defragMTime";
                  goto LABEL_77;
                case 196:
                  uint64_t v13 = *v8;
                  int v14 = "defragMMaxTime";
                  goto LABEL_77;
                case 197:
                  uint64_t v13 = *v8;
                  int v14 = "raidFailedLbaMismatch";
                  goto LABEL_77;
                case 198:
                  uint64_t v13 = *v8;
                  int v14 = "numSyscfgWrites";
                  goto LABEL_77;
                case 199:
                  uint64_t v13 = *v8;
                  int v14 = "indmbUnitsXfer";
                  goto LABEL_77;
                case 200:
                  uint64_t v13 = *v8;
                  int v14 = "indmbUnitsCache";
                  goto LABEL_77;
                case 201:
                  uint64_t v13 = *v8;
                  int v14 = "indmbUnitsInd";
                  goto LABEL_77;
                case 202:
                  uint64_t v13 = *v8;
                  int v14 = "wcacheFS_Mbytes";
                  goto LABEL_77;
                case 203:
                  uint64_t v13 = *v8;
                  int v14 = "wcacheDS_Mbytes";
                  goto LABEL_77;
                case 204:
                  uint64_t v13 = *v8;
                  int v14 = "powerOnSeconds";
                  goto LABEL_77;
                case 205:
                  uint64_t v13 = *v8;
                  int v14 = "numUnknownTokenHostRead";
                  goto LABEL_77;
                case 206:
                  uint64_t v13 = *v8;
                  int v14 = "numUnmmapedTokenHostRead";
                  goto LABEL_77;
                case 207:
                  uint64_t v15 = "numOfThrottlingEntriesPerLevel";
                  uint64_t v16 = a1;
                  int v17 = 207;
LABEL_213:
                  v18 = v8;
                  unsigned int v19 = 16;
                  goto LABEL_51;
                case 208:
                  uint64_t v13 = *v8;
                  int v14 = "wcacheFS_MbytesMin";
                  goto LABEL_77;
                case 209:
                  uint64_t v13 = *v8;
                  int v14 = "wcacheFS_MbytesMax";
                  goto LABEL_77;
                case 210:
                  uint64_t v13 = *v8;
                  int v14 = "prepareForShutdownFailCounter";
                  goto LABEL_77;
                case 211:
                  uint64_t v13 = *v8;
                  int v14 = "lpsrEntry";
                  goto LABEL_77;
                case 212:
                  uint64_t v13 = *v8;
                  int v14 = "lpsrExit";
                  goto LABEL_77;
                case 213:
                  uint64_t v15 = "crcInternalReadFail";
                  uint64_t v16 = a1;
                  int v17 = 213;
                  goto LABEL_149;
                case 214:
                  uint64_t v13 = *v8;
                  int v14 = "wcacheFSEvictCnt";
                  goto LABEL_77;
                case 215:
                  uint64_t v13 = *v8;
                  int v14 = "wcacheFSEvictSize";
                  goto LABEL_77;
                case 216:
                  uint64_t v13 = *v8;
                  int v14 = "wcacheFSWr";
                  goto LABEL_77;
                case 217:
                  uint64_t v13 = *v8;
                  int v14 = "wcacheDSWr";
                  goto LABEL_77;
                case 218:
                  uint64_t v15 = "wcacheFSEvictSizeLogDist";
                  uint64_t v16 = a1;
                  int v17 = 218;
                  goto LABEL_44;
                case 219:
                  uint64_t v13 = *v8;
                  int v14 = "prepareForShutdownTimeoutCounter";
                  goto LABEL_77;
                case 220:
                  uint64_t v13 = *v8;
                  int v14 = "prepareForShutdownCancelCounter";
                  goto LABEL_77;
                case 221:
                  uint64_t v13 = *v8;
                  int v14 = "RD_openBandCount";
                  goto LABEL_77;
                case 222:
                  uint64_t v13 = *v8;
                  int v14 = "RD_openBandNops";
                  goto LABEL_77;
                case 223:
                  uint64_t v13 = *v8;
                  int v14 = "RD_closedBandEvictCount";
                  goto LABEL_77;
                default:
                  switch(v7)
                  {
                    case 224:
                      uint64_t v13 = *v8;
                      int v14 = "RD_closedBandEvictSectors";
                      goto LABEL_77;
                    case 225:
                      uint64_t v13 = *v8;
                      int v14 = "RD_closedBandFragmentCount";
                      goto LABEL_77;
                    case 226:
                      uint64_t v13 = *v8;
                      int v14 = "RD_closedBandFragmentSectors";
                      goto LABEL_77;
                    case 227:
                      uint64_t v15 = "wcacheFSOverWrLogSizeCnts";
                      uint64_t v16 = a1;
                      int v17 = 227;
                      goto LABEL_44;
                    case 228:
                      uint64_t v15 = "wcacheFSOverWrSizeByFlow";
                      uint64_t v16 = a1;
                      int v17 = 228;
                      goto LABEL_144;
                    case 229:
                      uint64_t v15 = "indmbXferCountTo";
                      uint64_t v16 = a1;
                      int v17 = 229;
                      goto LABEL_123;
                    case 230:
                      uint64_t v15 = "indmbAccumulatedTimeBetweenXfers";
                      uint64_t v16 = a1;
                      int v17 = 230;
                      goto LABEL_123;
                    case 231:
                      uint64_t v13 = *v8;
                      int v14 = "maxGracefulBootTimeMs";
                      goto LABEL_77;
                    case 232:
                      uint64_t v13 = *v8;
                      int v14 = "maxUngracefulBootTimeMs";
                      goto LABEL_77;
                    case 233:
                      uint64_t v13 = *v8;
                      int v14 = "averageGracefulBootTimeMs";
                      goto LABEL_77;
                    case 234:
                      uint64_t v13 = *v8;
                      int v14 = "averageUngracefulBootTimeMs";
                      goto LABEL_77;
                    case 235:
                      uint64_t v15 = "gracefulBootTimeLogMs";
                      uint64_t v16 = a1;
                      int v17 = 235;
                      goto LABEL_149;
                    case 236:
                      uint64_t v15 = "ungracefulBootTimeLogMs";
                      uint64_t v16 = a1;
                      int v17 = 236;
                      goto LABEL_149;
                    case 237:
                      uint64_t v15 = "CalibrationCount";
                      uint64_t v16 = a1;
                      int v17 = 237;
                      goto LABEL_144;
                    case 238:
                      uint64_t v13 = *v8;
                      int v14 = "CalibrationLastTmp";
                      goto LABEL_77;
                    case 239:
                      uint64_t v13 = *v8;
                      int v14 = "CalibrationMaxTmp";
                      goto LABEL_77;
                    case 240:
                      uint64_t v13 = *v8;
                      int v14 = "CalibrationMinTmp";
                      goto LABEL_77;
                    case 241:
                      uint64_t v13 = *v8;
                      int v14 = "ungracefulBootWorstIndicator";
                      goto LABEL_77;
                    case 242:
                      uint64_t v13 = *v8;
                      int v14 = "metaMismatchReread";
                      goto LABEL_77;
                    case 243:
                      uint64_t v13 = *v8;
                      int v14 = "numS3SleepOps";
                      goto LABEL_77;
                    case 244:
                      uint64_t v13 = *v8;
                      int v14 = "odtsCurrent";
                      goto LABEL_77;
                    case 245:
                      uint64_t v13 = *v8;
                      int v14 = "prefetchReads";
                      goto LABEL_77;
                    case 246:
                      uint64_t v13 = *v8;
                      int v14 = "prefetchHits";
                      goto LABEL_77;
                    case 247:
                      uint64_t v13 = *v8;
                      int v14 = "prefetchWritesInvalidation";
                      goto LABEL_77;
                    case 248:
                      uint64_t v13 = *v8;
                      int v14 = "indmbUnitsTotal";
                      goto LABEL_77;
                    case 249:
                      uint64_t v13 = *v8;
                      int v14 = "selfThrottlingEngage";
                      goto LABEL_77;
                    case 250:
                      uint64_t v13 = *v8;
                      int v14 = "selfThrottlingDisengage";
                      goto LABEL_77;
                    case 252:
                      uint64_t v13 = *v8;
                      int v14 = "AbortSkip_WlpMode";
                      goto LABEL_77;
                    case 253:
                      uint64_t v13 = *v8;
                      int v14 = "hostWritesWlpMode";
                      goto LABEL_77;
                    case 254:
                      uint64_t v13 = *v8;
                      int v14 = "numClogDoubleUnc";
                      goto LABEL_77;
                    case 256:
                      uint64_t v13 = *v8;
                      int v14 = "AbortPad_WlpMode";
                      goto LABEL_77;
                    case 257:
                      uint64_t v13 = *v8;
                      int v14 = "bonfireIntermediateBandErases";
                      goto LABEL_77;
                    case 258:
                      uint64_t v13 = *v8;
                      int v14 = "bonfireUserBandErases";
                      goto LABEL_77;
                    case 259:
                      uint64_t v13 = *v8;
                      int v14 = "bonfireIntermediateBandProgs";
                      goto LABEL_77;
                    case 260:
                      uint64_t v13 = *v8;
                      int v14 = "bonfireUserBandProgs";
                      goto LABEL_77;
                    case 261:
                      uint64_t v13 = *v8;
                      int v14 = "bonfireIntermediatePageReads";
                      goto LABEL_77;
                    case 262:
                      uint64_t v13 = *v8;
                      int v14 = "bonfireUserPageReads";
                      goto LABEL_77;
                    case 263:
                      uint64_t v13 = *v8;
                      int v14 = "refreshUtil00";
                      goto LABEL_77;
                    case 264:
                      uint64_t v13 = *v8;
                      int v14 = "failToReadUtil00";
                      goto LABEL_77;
                    case 265:
                      uint64_t v15 = "readCountHisto";
                      uint64_t v16 = a1;
                      int v17 = 265;
                      goto LABEL_102;
                    case 266:
                      uint64_t v15 = "readAmpHisto";
                      uint64_t v16 = a1;
                      int v17 = 266;
                      goto LABEL_213;
                    case 267:
                      uint64_t v13 = *v8;
                      int v14 = "totalReadAmp";
                      goto LABEL_77;
                    case 268:
                      uint64_t v15 = "nvmeModeSelect";
                      uint64_t v16 = a1;
                      int v17 = 268;
                      goto LABEL_144;
                    case 269:
                      uint64_t v15 = "numBootBlockRefreshSuccess";
                      uint64_t v16 = a1;
                      int v17 = 269;
                      goto LABEL_149;
                    case 270:
                      uint64_t v15 = "numBootBlockRefreshFail";
                      uint64_t v16 = a1;
                      int v17 = 270;
                      goto LABEL_149;
                    case 271:
                      uint64_t v13 = *v8;
                      int v14 = "numUnsupportedAsi";
                      goto LABEL_77;
                    case 272:
                      uint64_t v13 = *v8;
                      int v14 = "NumTerminatedProgramSegs";
                      goto LABEL_77;
                    case 273:
                      uint64_t v13 = *v8;
                      int v14 = "indParityPagesDrops";
                      goto LABEL_77;
                    case 274:
                      uint64_t v13 = *v8;
                      int v14 = "indFlowPrograms";
                      goto LABEL_77;
                    case 277:
                      uint64_t v15 = "powerBudgetSelect";
                      uint64_t v16 = a1;
                      int v17 = 277;
                      goto LABEL_144;
                    case 279:
                      uint64_t v13 = *v8;
                      int v14 = "RxBurnNandWrites";
                      goto LABEL_77;
                    case 280:
                      uint64_t v15 = "E2EDPErrorCounters";
                      uint64_t v16 = a1;
                      int v17 = 280;
LABEL_281:
                      v18 = v8;
                      unsigned int v19 = 12;
                      goto LABEL_51;
                    case 281:
                      uint64_t v13 = *v8;
                      int v14 = "wcacheSectorsMax";
                      goto LABEL_77;
                    case 282:
                      uint64_t v13 = *v8;
                      int v14 = "wcacheSectorsMin";
                      goto LABEL_77;
                    case 283:
                      uint64_t v13 = *v8;
                      int v14 = "wcacheSectorsCur";
                      goto LABEL_77;
                    case 284:
                      uint64_t v13 = *v8;
                      int v14 = "wcacheDS_SectorsMax";
                      goto LABEL_77;
                    case 285:
                      uint64_t v13 = *v8;
                      int v14 = "wcacheDS_SectorsMin";
                      goto LABEL_77;
                    case 286:
                      uint64_t v13 = *v8;
                      int v14 = "wcacheDS_SectorsCur";
                      goto LABEL_77;
                    case 287:
                      uint64_t v13 = *v8;
                      int v14 = "wcacheFS_Reads";
                      goto LABEL_77;
                    case 288:
                      uint64_t v13 = *v8;
                      int v14 = "wcacheDS_Reads";
                      goto LABEL_77;
                    case 289:
                      uint64_t v15 = "mspBootBlockReadFail";
                      uint64_t v16 = a1;
                      int v17 = 289;
                      goto LABEL_283;
                    case 290:
                      uint64_t v15 = "mspBootBlockProgFail";
                      uint64_t v16 = a1;
                      int v17 = 290;
                      goto LABEL_283;
                    case 291:
                      uint64_t v15 = "mspBootBlockEraseFail";
                      uint64_t v16 = a1;
                      int v17 = 291;
                      goto LABEL_283;
                    case 292:
                      uint64_t v13 = *v8;
                      int v14 = "bandsRefreshedOnError";
                      goto LABEL_77;
                    default:
                      switch(v7)
                      {
                        case 298:
                          uint64_t v15 = "perHostReads";
                          uint64_t v16 = a1;
                          int v17 = 298;
                          goto LABEL_123;
                        case 299:
                          uint64_t v15 = "perHostReadXacts";
                          uint64_t v16 = a1;
                          int v17 = 299;
                          goto LABEL_123;
                        case 300:
                          uint64_t v15 = "perHostWrites";
                          uint64_t v16 = a1;
                          int v17 = 300;
                          goto LABEL_123;
                        case 301:
                          uint64_t v15 = "perHostWriteXacts";
                          uint64_t v16 = a1;
                          int v17 = 301;
                          goto LABEL_123;
                        case 302:
                          uint64_t v15 = "perHostNumFlushes";
                          uint64_t v16 = a1;
                          int v17 = 302;
                          goto LABEL_123;
                        case 303:
                          uint64_t v15 = "perHostNumFences";
                          uint64_t v16 = a1;
                          int v17 = 303;
                          goto LABEL_123;
                        case 304:
                          uint64_t v15 = "commitPadSectorsPerFlow";
                          uint64_t v16 = a1;
                          int v17 = 304;
                          goto LABEL_44;
                        case 305:
                          uint64_t v15 = "wcacheDSOverWrLogSizeCnts";
                          uint64_t v16 = a1;
                          int v17 = 305;
                          goto LABEL_44;
                        case 306:
                          uint64_t v15 = "wcacheDSOverWrSizeByFlow";
                          uint64_t v16 = a1;
                          int v17 = 306;
                          goto LABEL_144;
                        case 307:
                          uint64_t v15 = "CmdRaisePrioiryEvents";
                          uint64_t v16 = a1;
                          int v17 = 307;
                          goto LABEL_44;
                        case 308:
                          uint64_t v13 = *v8;
                          int v14 = "utilNumVerification";
                          goto LABEL_77;
                        case 309:
                          uint64_t v13 = *v8;
                          int v14 = "utilRefreshes";
                          goto LABEL_77;
                        case 310:
                          uint64_t v13 = *v8;
                          int v14 = "utilBDRErrors";
                          goto LABEL_77;
                        case 311:
                          uint64_t v13 = *v8;
                          int v14 = "indBandsPerFlow";
                          goto LABEL_77;
                        case 312:
                          uint64_t v13 = *v8;
                          int v14 = "secsPerIndFlow";
                          goto LABEL_77;
                        case 313:
                          uint64_t v13 = *v8;
                          int v14 = "indDecodedECC";
                          goto LABEL_77;
                        case 314:
                          uint64_t v15 = "numBootBlockValidateSuccess";
                          uint64_t v16 = a1;
                          int v17 = 314;
                          goto LABEL_149;
                        case 315:
                          uint64_t v15 = "numBootBlockValidateFail";
                          uint64_t v16 = a1;
                          int v17 = 315;
                          goto LABEL_149;
                        case 316:
                          uint64_t v15 = "clogPagesFillingPercentage";
                          uint64_t v16 = a1;
                          int v17 = 316;
                          goto LABEL_144;
                        case 317:
                          uint64_t v13 = *v8;
                          int v14 = "bdrCalTimeAccFactor";
                          goto LABEL_77;
                        case 318:
                          uint64_t v13 = *v8;
                          int v14 = "bootChainRdError";
                          goto LABEL_77;
                        case 319:
                          uint64_t v13 = *v8;
                          int v14 = "bootChainBlankError";
                          goto LABEL_77;
                        case 320:
                          uint64_t v13 = *v8;
                          int v14 = "bootChainRefreshError";
                          goto LABEL_77;
                        case 321:
                          uint64_t v13 = *v8;
                          int v14 = "bootChainVersionError";
                          goto LABEL_77;
                        case 322:
                          uint64_t v13 = *v8;
                          int v14 = "mspBootBlockMismatch";
                          goto LABEL_77;
                        case 323:
                          uint64_t v13 = *v8;
                          int v14 = "mspBootBlockMismatchErr";
                          goto LABEL_77;
                        case 324:
                          uint64_t v15 = "bitflipAddr";
                          uint64_t v16 = a1;
                          int v17 = 324;
                          goto LABEL_102;
                        case 325:
                          uint64_t v15 = "bitflipCount";
                          uint64_t v16 = a1;
                          int v17 = 325;
                          goto LABEL_102;
                        case 326:
                          uint64_t v15 = "bitflipDupes";
                          uint64_t v16 = a1;
                          int v17 = 326;
                          goto LABEL_102;
                        case 327:
                          uint64_t v15 = "bandsMaxTempHisto";
                          uint64_t v16 = a1;
                          int v17 = 327;
                          goto LABEL_324;
                        case 328:
                          uint64_t v15 = "bandsMinTempHisto";
                          uint64_t v16 = a1;
                          int v17 = 328;
                          goto LABEL_324;
                        case 329:
                          uint64_t v15 = "bandsLifeTimeTempHisto";
                          uint64_t v16 = a1;
                          int v17 = 329;
LABEL_324:
                          v18 = v8;
                          unsigned int v19 = 30;
                          goto LABEL_51;
                        case 330:
                          uint64_t v15 = "bandsDeltaTempHisto";
                          uint64_t v16 = a1;
                          int v17 = 330;
                          v18 = v8;
                          unsigned int v19 = 22;
                          goto LABEL_51;
                        case 331:
                          uint64_t v15 = "bandsCrossTempHisto";
                          uint64_t v16 = a1;
                          int v17 = 331;
                          v18 = v8;
                          unsigned int v19 = 45;
                          goto LABEL_51;
                        case 332:
                          uint64_t v15 = "wcacheWaitLogMs";
                          uint64_t v16 = a1;
                          int v17 = 332;
                          goto LABEL_44;
                        case 333:
                          uint64_t v15 = "wcacheDS_segsSortedLogSize";
                          uint64_t v16 = a1;
                          int v17 = 333;
                          goto LABEL_44;
                        case 334:
                          uint64_t v13 = *v8;
                          int v14 = "numFirmwareWrites";
                          goto LABEL_77;
                        case 335:
                          uint64_t v13 = *v8;
                          int v14 = "numBisWrites";
                          goto LABEL_77;
                        case 336:
                          uint64_t v13 = *v8;
                          int v14 = "numBootChainUpdates";
                          goto LABEL_77;
                        case 337:
                          uint64_t v13 = *v8;
                          int v14 = "cntCalTimeWentBackWard";
                          goto LABEL_77;
                        case 338:
                          uint64_t v13 = *v8;
                          int v14 = "indBoRecoveries";
                          goto LABEL_77;
                        case 340:
                          uint64_t v13 = *v8;
                          int v14 = "numCrossTempUecc";
                          goto LABEL_77;
                        case 341:
                          uint64_t v13 = *v8;
                          int v14 = "latencyMonitorError";
                          goto LABEL_77;
                        case 343:
                          uint64_t v13 = *v8;
                          int v14 = "utilUeccReads";
                          goto LABEL_77;
                        case 344:
                          uint64_t v13 = *v8;
                          int v14 = "numOfAvoidedGCDueToTemp";
                          goto LABEL_77;
                        case 345:
                          uint64_t v13 = *v8;
                          int v14 = "forceShutdowns";
                          goto LABEL_77;
                        case 346:
                          uint64_t v13 = *v8;
                          int v14 = "gcSlcDestinations";
                          goto LABEL_77;
                        case 347:
                          uint64_t v13 = *v8;
                          int v14 = "indReplayExtUsed";
                          goto LABEL_77;
                        case 348:
                          uint64_t v13 = *v8;
                          int v14 = "defectsPerPackageOverflow";
                          goto LABEL_77;
                        case 349:
                          uint64_t v13 = *v8;
                          int v14 = "RxBurnIntBandsProgrammed";
                          goto LABEL_77;
                        case 350:
                          uint64_t v13 = *v8;
                          int v14 = "RxBurnUsrBandsProgrammed";
                          goto LABEL_77;
                        case 351:
                          uint64_t v13 = *v8;
                          int v14 = "RxBurnIntNandWrites";
                          goto LABEL_77;
                        case 352:
                          uint64_t v13 = *v8;
                          int v14 = "RxBurnUsrNandWrites";
                          goto LABEL_77;
                        case 353:
                          uint64_t v13 = *v8;
                          int v14 = "clogLastStripeUeccs";
                          goto LABEL_77;
                        case 354:
                          uint64_t v13 = *v8;
                          int v14 = "GC_MidDestSrcSwitchSLC2TLC";
                          goto LABEL_77;
                        case 355:
                          uint64_t v13 = *v8;
                          int v14 = "GC_MidDestSrcSwitchTLC2SLC";
                          goto LABEL_77;
                        case 356:
                          uint64_t v13 = *v8;
                          int v14 = "nvme_stats_shutdown_count_host0_normal";
                          goto LABEL_77;
                        case 357:
                          uint64_t v13 = *v8;
                          int v14 = "nvme_stats_shutdown_count_host1_normal";
                          goto LABEL_77;
                        case 358:
                          uint64_t v13 = *v8;
                          int v14 = "nvme_stats_shutdown_count_host0_s2r";
                          goto LABEL_77;
                        case 359:
                          uint64_t v13 = *v8;
                          int v14 = "nvme_stats_shutdown_count_host1_s2r";
                          goto LABEL_77;
                        case 360:
                          uint64_t v15 = "gcPDusterIntrSrcValidityHisto";
                          uint64_t v16 = a1;
                          int v17 = 360;
                          goto LABEL_213;
                        case 361:
                          uint64_t v15 = "gcPDusterUserSrcValidityHisto";
                          uint64_t v16 = a1;
                          int v17 = 361;
                          goto LABEL_213;
                        case 362:
                          uint64_t v13 = *v8;
                          int v14 = "raidFailedReadParity";
                          goto LABEL_77;
                        case 364:
                          uint64_t v13 = *v8;
                          int v14 = "lhotNumSkipes";
                          goto LABEL_77;
                        default:
                          switch(v7)
                          {
                            case 365:
                              uint64_t v13 = *v8;
                              int v14 = "lhotNumIsHotCalls";
                              goto LABEL_77;
                            case 366:
                              uint64_t v13 = *v8;
                              int v14 = "lhotFullLap";
                              goto LABEL_77;
                            case 367:
                              uint64_t v13 = *v8;
                              int v14 = "lhotSkipPrecent";
                              goto LABEL_77;
                            case 368:
                              uint64_t v13 = *v8;
                              int v14 = "eraseSuspendEvents";
                              goto LABEL_77;
                            case 369:
                              uint64_t v13 = *v8;
                              int v14 = "eraseSuspendedStatuses";
                              goto LABEL_77;
                            case 370:
                              uint64_t v13 = *v8;
                              int v14 = "eraseSuspendedBands";
                              goto LABEL_77;
                            case 371:
                              uint64_t v13 = *v8;
                              int v14 = "eraseSuspendSituationsBelowThreshold";
                              goto LABEL_77;
                            case 372:
                              uint64_t v13 = *v8;
                              int v14 = "eraseSuspendSituationsAboveThreshold";
                              goto LABEL_77;
                            case 373:
                              uint64_t v13 = *v8;
                              int v14 = "eraseSuspendReadChainsProcessed";
                              goto LABEL_77;
                            case 374:
                              uint64_t v13 = *v8;
                              int v14 = "bdrLastDoneHr";
                              goto LABEL_77;
                            case 375:
                              uint64_t v13 = *v8;
                              int v14 = "bdrBackupThreshHrs";
                              goto LABEL_77;
                            case 376:
                              uint64_t v13 = *v8;
                              int v14 = "clogPortableProgBufs";
                              goto LABEL_77;
                            case 377:
                              uint64_t v13 = *v8;
                              int v14 = "clogPortableDropBufs";
                              goto LABEL_77;
                            case 378:
                              uint64_t v13 = *v8;
                              int v14 = "clogPortablePadSectors";
                              goto LABEL_77;
                            case 379:
                              uint64_t v13 = *v8;
                              int v14 = "numRetiredBlocks";
                              goto LABEL_77;
                            case 381:
                              uint64_t v13 = *v8;
                              int v14 = "numRefreshOnErrNandRefreshPerf";
                              goto LABEL_77;
                            case 382:
                              uint64_t v13 = *v8;
                              int v14 = "raidReconstructReads";
                              goto LABEL_77;
                            case 383:
                              uint64_t v13 = *v8;
                              int v14 = "gcReadsNoBlog";
                              goto LABEL_77;
                            case 384:
                              uint64_t v13 = *v8;
                              int v14 = "AbortSkip_MPBXReadVerifyClosedBand";
                              goto LABEL_77;
                            case 385:
                              uint64_t v13 = *v8;
                              int v14 = "openBandReadFail";
                              goto LABEL_77;
                            case 386:
                              uint64_t v13 = *v8;
                              int v14 = "AbortSkip_MPBXReadVerifyOpenBand";
                              goto LABEL_77;
                            case 387:
                              uint64_t v13 = *v8;
                              int v14 = "AbortSkip_MBPXFailedRebuildingParity";
                              goto LABEL_77;
                            case 388:
                              uint64_t v13 = *v8;
                              int v14 = "raidSuccessfulPMXReconstructionInternal";
                              goto LABEL_77;
                            case 389:
                              uint64_t v13 = *v8;
                              int v14 = "raidSuccessfulPMXReconstructionHost";
                              goto LABEL_77;
                            case 390:
                              uint64_t v13 = *v8;
                              int v14 = "raidFailedPMXReconstructionInternal";
                              goto LABEL_77;
                            case 391:
                              uint64_t v13 = *v8;
                              int v14 = "raidFailedPMXReconstructionHost";
                              goto LABEL_77;
                            case 392:
                              uint64_t v13 = *v8;
                              int v14 = "raidSuccessfulRMXReconstructionInternal";
                              goto LABEL_77;
                            case 393:
                              uint64_t v13 = *v8;
                              int v14 = "raidSuccessfulRMXReconstructionHost";
                              goto LABEL_77;
                            case 394:
                              uint64_t v13 = *v8;
                              int v14 = "raidFailedRMXReconstructionInternal";
                              goto LABEL_77;
                            case 395:
                              uint64_t v13 = *v8;
                              int v14 = "raidFailedRMXReconstructionHost";
                              goto LABEL_77;
                            case 396:
                              uint64_t v13 = *v8;
                              int v14 = "raidFailedReadParityInternal";
                              goto LABEL_77;
                            case 397:
                              uint64_t v13 = *v8;
                              int v14 = "raidFailedReadQParityInternal";
                              goto LABEL_77;
                            case 398:
                              uint64_t v13 = *v8;
                              int v14 = "raidFailedReadQParity";
                              goto LABEL_77;
                            case 399:
                              uint64_t v13 = *v8;
                              int v14 = "raidFailedReadQCopy";
                              goto LABEL_77;
                            case 400:
                              uint64_t v13 = *v8;
                              int v14 = "raidFailedReconstructionQParity";
                              goto LABEL_77;
                            case 401:
                              uint64_t v13 = *v8;
                              int v14 = "offlineBlocksCnt";
                              goto LABEL_77;
                            case 402:
                              uint64_t v13 = *v8;
                              int v14 = "bork0Revectors";
                              goto LABEL_77;
                            case 403:
                              uint64_t v13 = *v8;
                              int v14 = "raidFailedReadBlog";
                              goto LABEL_77;
                            case 404:
                              uint64_t v13 = *v8;
                              int v14 = "numReliabilityRefreshes";
                              goto LABEL_77;
                            case 405:
                              uint64_t v13 = *v8;
                              int v14 = "raidFailedReadQCopyInternal";
                              goto LABEL_77;
                            case 406:
                              uint64_t v15 = "raidReconstructSuccessFlow";
                              uint64_t v16 = a1;
                              int v17 = 406;
                              goto LABEL_102;
                            case 407:
                              uint64_t v15 = "raidReconstructFailFlow";
                              uint64_t v16 = a1;
                              int v17 = 407;
                              goto LABEL_102;
                            case 408:
                              uint64_t v13 = *v8;
                              int v14 = "raidReconstructFailP";
                              goto LABEL_77;
                            case 409:
                              uint64_t v13 = *v8;
                              int v14 = "raidReconstructFailQ";
                              goto LABEL_77;
                            case 410:
                              uint64_t v13 = *v8;
                              int v14 = "raidReconstructFailUECC";
                              goto LABEL_77;
                            case 411:
                              uint64_t v13 = *v8;
                              int v14 = "raidReconstructFailUnsupp";
                              goto LABEL_77;
                            case 412:
                              uint64_t v13 = *v8;
                              int v14 = "raidUECCOpenBand";
                              goto LABEL_77;
                            case 414:
                              uint64_t v13 = *v8;
                              int v14 = "ueccReads";
                              goto LABEL_77;
                            case 416:
                              uint64_t v13 = *v8;
                              int v14 = "raidSuccessfulVerify";
                              goto LABEL_77;
                            case 417:
                              uint64_t v13 = *v8;
                              int v14 = "raidFailedVerify";
                              goto LABEL_77;
                            case 418:
                              uint64_t v13 = *v8;
                              int v14 = "numBandsVerified";
                              goto LABEL_77;
                            case 419:
                              uint64_t v13 = *v8;
                              int v14 = "cache_heads";
                              goto LABEL_77;
                            case 420:
                              uint64_t v13 = *v8;
                              int v14 = "AbortSkip_RMXtoMPBX";
                              goto LABEL_77;
                            case 421:
                              uint64_t v13 = *v8;
                              int v14 = "s3eFwVer";
                              goto LABEL_77;
                            case 422:
                              uint64_t v13 = *v8;
                              int v14 = "readVerifyNative";
                              goto LABEL_77;
                            case 423:
                              uint64_t v13 = *v8;
                              int v14 = "reducedReadVerifyNative";
                              goto LABEL_77;
                            case 424:
                              uint64_t v13 = *v8;
                              int v14 = "readVerifySlc";
                              goto LABEL_77;
                            case 425:
                              uint64_t v13 = *v8;
                              int v14 = "reducedReadVerifySlc";
                              goto LABEL_77;
                            case 426:
                              uint64_t v13 = *v8;
                              int v14 = "RxBurnEvictions";
                              goto LABEL_77;
                            case 427:
                              uint64_t v13 = *v8;
                              int v14 = "directToTLCBands";
                              goto LABEL_77;
                            case 428:
                              uint64_t v13 = *v8;
                              int v14 = "nandDesc";
                              goto LABEL_77;
                            case 429:
                              uint64_t v13 = *v8;
                              int v14 = "fwUpdatesPercentUsed";
                              goto LABEL_77;
                            case 430:
                              uint64_t v13 = *v8;
                              int v14 = "slcPercentUsed";
                              goto LABEL_77;
                            case 431:
                              uint64_t v13 = *v8;
                              int v14 = "percentUsed";
                              goto LABEL_77;
                            default:
                              switch(v7)
                              {
                                case 432:
                                  uint64_t v13 = *v8;
                                  int v14 = "hostAutoWrites";
                                  goto LABEL_77;
                                case 433:
                                  uint64_t v13 = *v8;
                                  int v14 = "hostAutoWriteXacts";
                                  goto LABEL_77;
                                case 434:
                                  uint64_t v13 = *v8;
                                  int v14 = "gcDestDynamic";
                                  goto LABEL_77;
                                case 435:
                                  uint64_t v13 = *v8;
                                  int v14 = "gcDestStatic";
                                  goto LABEL_77;
                                case 436:
                                  uint64_t v13 = *v8;
                                  int v14 = "gcDestWearlevel";
                                  goto LABEL_77;
                                case 437:
                                  uint64_t v13 = *v8;
                                  int v14 = "gcDestParity";
                                  goto LABEL_77;
                                case 438:
                                  uint64_t v13 = *v8;
                                  int v14 = "AbortSkip_Format";
                                  goto LABEL_77;
                                case 440:
                                  uint64_t v13 = *v8;
                                  int v14 = "raidSLCPadding";
                                  goto LABEL_77;
                                case 441:
                                  uint64_t v13 = *v8;
                                  int v14 = "raidGCBands";
                                  goto LABEL_77;
                                case 442:
                                  uint64_t v13 = *v8;
                                  int v14 = "raidGCSectors";
                                  goto LABEL_77;
                                case 443:
                                  uint64_t v13 = *v8;
                                  int v14 = "raidGCPadding";
                                  goto LABEL_77;
                                case 444:
                                  uint64_t v13 = *v8;
                                  int v14 = "raidSLCBandsPerHostFlow";
                                  goto LABEL_77;
                                case 445:
                                  uint64_t v13 = *v8;
                                  int v14 = "raidSLCSecsPerHostFlow";
                                  goto LABEL_77;
                                case 446:
                                  uint64_t v13 = *v8;
                                  int v14 = "rxBurnMinCycleRuns";
                                  goto LABEL_77;
                                case 447:
                                  uint64_t v13 = *v8;
                                  int v14 = "clogNumFastCxt";
                                  goto LABEL_77;
                                case 448:
                                  uint64_t v13 = *v8;
                                  int v14 = "clogNumRapidReboots";
                                  goto LABEL_77;
                                case 449:
                                  uint64_t v13 = *v8;
                                  int v14 = "clogFastCxtAbvThr";
                                  goto LABEL_77;
                                case 450:
                                  uint64_t v13 = *v8;
                                  int v14 = "rxBurnDiffModeRuns";
                                  goto LABEL_77;
                                case 452:
                                  uint64_t v13 = *v8;
                                  int v14 = "indReadVerifyFail";
                                  goto LABEL_77;
                                case 453:
                                  uint64_t v15 = "numOfThrottlingEntriesPerReadLevel";
                                  uint64_t v16 = a1;
                                  int v17 = 453;
                                  goto LABEL_213;
                                case 454:
                                  uint64_t v15 = "numOfThrottlingEntriesPerWriteLevel";
                                  uint64_t v16 = a1;
                                  int v17 = 454;
                                  goto LABEL_213;
                                case 456:
                                  uint64_t v15 = "slcFifoDepth";
                                  uint64_t v16 = a1;
                                  int v17 = 456;
                                  goto LABEL_44;
                                case 457:
                                  uint64_t v13 = *v8;
                                  int v14 = "wcacheSectorsDirtyIdle";
                                  goto LABEL_77;
                                case 458:
                                  uint64_t v13 = *v8;
                                  int v14 = "wcacheDS_SectorsDirtyIdle";
                                  goto LABEL_77;
                                case 459:
                                  uint64_t v13 = *v8;
                                  int v14 = "wcacheFS_MbytesDirtyIdle";
                                  goto LABEL_77;
                                case 460:
                                  uint64_t v15 = "CacheDepthVsThroughput";
                                  uint64_t v16 = a1;
                                  int v17 = 460;
                                  v18 = v8;
                                  unsigned int v19 = 256;
                                  goto LABEL_51;
                                case 461:
                                  uint64_t v13 = *v8;
                                  int v14 = "directToTLCSectors";
                                  goto LABEL_77;
                                case 462:
                                  uint64_t v13 = *v8;
                                  int v14 = "fallbackToWaterfall";
                                  goto LABEL_77;
                                case 463:
                                  uint64_t v15 = "balanceProportionBucketsHistogram";
                                  uint64_t v16 = a1;
                                  int v17 = 463;
LABEL_448:
                                  v18 = v8;
                                  unsigned int v19 = 11;
                                  goto LABEL_51;
                                case 464:
                                  uint64_t v13 = *v8;
                                  int v14 = "lockToTlc";
                                  goto LABEL_77;
                                case 465:
                                  uint64_t v15 = "burstSizeHistogram";
                                  uint64_t v16 = a1;
                                  int v17 = 465;
                                  goto LABEL_44;
                                case 466:
                                  uint64_t v15 = "qosDirectToTLC";
                                  uint64_t v16 = a1;
                                  int v17 = 466;
                                  goto LABEL_470;
                                case 467:
                                  uint64_t v15 = "maxQosDirectToTLC";
                                  uint64_t v16 = a1;
                                  int v17 = 467;
                                  goto LABEL_144;
                                case 468:
                                  uint64_t v15 = "wcacheDirtyAtFlush";
                                  uint64_t v16 = a1;
                                  int v17 = 468;
                                  goto LABEL_213;
                                case 469:
                                  uint64_t v15 = "raidReconstructSuccessPartition";
                                  uint64_t v16 = a1;
                                  int v17 = 469;
                                  goto LABEL_123;
                                case 470:
                                  uint64_t v15 = "raidReconstructFailPartition";
                                  uint64_t v16 = a1;
                                  int v17 = 470;
                                  goto LABEL_123;
                                case 471:
                                  uint64_t v13 = *v8;
                                  int v14 = "raidUncleanBootBandFail";
                                  goto LABEL_77;
                                case 472:
                                  uint64_t v13 = *v8;
                                  int v14 = "raidReconstructFailBandFlowHost";
                                  goto LABEL_77;
                                case 473:
                                  uint64_t v13 = *v8;
                                  int v14 = "raidReconstructFailBandFlowGC";
                                  goto LABEL_77;
                                case 476:
                                  uint64_t v15 = "raidSuccessfulRecoLbaRange";
                                  uint64_t v16 = a1;
                                  int v17 = 476;
                                  goto LABEL_123;
                                case 477:
                                  uint64_t v15 = "raidFailedRecoLbaRange";
                                  uint64_t v16 = a1;
                                  int v17 = 477;
                                  goto LABEL_123;
                                case 481:
                                  uint64_t v15 = "skinnyBandErases_481";
                                  uint64_t v16 = a1;
                                  int v17 = 481;
                                  goto LABEL_283;
                                case 483:
                                  uint64_t v13 = *v8;
                                  int v14 = "tlcOverHeatWaterfall";
                                  goto LABEL_77;
                                case 484:
                                  uint64_t v13 = *v8;
                                  int v14 = "skinnyCyclesConvert";
                                  goto LABEL_77;
                                case 485:
                                  uint64_t v13 = *v8;
                                  int v14 = "non_proportional_directToTLCSectors";
                                  goto LABEL_77;
                                case 486:
                                  uint64_t v13 = *v8;
                                  int v14 = "maxFailedFastCxtSync";
                                  goto LABEL_77;
                                case 487:
                                  uint64_t v13 = *v8;
                                  int v14 = "numFormatUserArea";
                                  goto LABEL_77;
                                case 488:
                                  uint64_t v13 = *v8;
                                  int v14 = "clogFastCxtSyncAborted";
                                  goto LABEL_77;
                                case 489:
                                  uint64_t v15 = "clogOccupationSectors";
                                  uint64_t v16 = a1;
                                  int v17 = 489;
                                  goto LABEL_102;
                                case 490:
                                  uint64_t v15 = "bdrTmpHist";
                                  uint64_t v16 = a1;
                                  int v17 = 490;
LABEL_470:
                                  v18 = v8;
                                  unsigned int v19 = 64;
                                  goto LABEL_51;
                                case 491:
                                  uint64_t v13 = *v8;
                                  int v14 = "numFWUpdates";
                                  goto LABEL_77;
                                case 492:
                                  uint64_t v13 = *v8;
                                  int v14 = "numClogLoadFails";
                                  goto LABEL_77;
                                case 493:
                                  uint64_t v13 = *v8;
                                  int v14 = "rxBurnNumForcedDiffMode";
                                  goto LABEL_77;
                                case 494:
                                  uint64_t v13 = *v8;
                                  int v14 = "RD_numSaves";
                                  goto LABEL_77;
                                case 495:
                                  uint64_t v13 = *v8;
                                  int v14 = "eanCompressWrites";
                                  goto LABEL_77;
                                case 496:
                                  uint64_t v13 = *v8;
                                  int v14 = "eanHostWrites";
                                  goto LABEL_77;
                                case 497:
                                  uint64_t v13 = *v8;
                                  int v14 = "bandPreErases";
                                  goto LABEL_77;
                                case 498:
                                  uint64_t v13 = *v8;
                                  int v14 = "eanHostUnmaps";
                                  goto LABEL_77;
                                case 499:
                                  uint64_t v13 = *v8;
                                  int v14 = "eanHostFlushes";
                                  goto LABEL_77;
                                case 500:
                                  uint64_t v13 = *v8;
                                  int v14 = "eanFastWrites";
                                  goto LABEL_77;
                                case 501:
                                  uint64_t v13 = *v8;
                                  int v14 = "autowriteDS2FSCollisions";
                                  goto LABEL_77;
                                case 502:
                                  uint64_t v13 = *v8;
                                  int v14 = "autowriteWaitTransferTaskBlocks";
                                  goto LABEL_77;
                                case 503:
                                  uint64_t v15 = "avgCycle";
                                  uint64_t v16 = a1;
                                  int v17 = 503;
                                  goto LABEL_123;
                                case 504:
                                  uint64_t v13 = *v8;
                                  int v14 = "RD_DeferredClearsOverflowCnt";
                                  goto LABEL_77;
                                default:
                                  switch(v7)
                                  {
                                    case 505:
                                      uint64_t v13 = *v8;
                                      int v14 = "maxVerticsInBand";
                                      goto LABEL_77;
                                    case 506:
                                      uint64_t v13 = *v8;
                                      int v14 = "numVertics";
                                      goto LABEL_77;
                                    case 507:
                                      uint64_t v13 = *v8;
                                      int v14 = "exceededCVertics";
                                      goto LABEL_77;
                                    case 510:
                                      uint64_t v13 = *v8;
                                      int v14 = "raidReconstructFailMismatch";
                                      goto LABEL_77;
                                    case 511:
                                      uint64_t v15 = "mspbootBlockRefreshCnt";
                                      uint64_t v16 = a1;
                                      int v17 = 511;
                                      goto LABEL_283;
                                    case 516:
                                      uint64_t v15 = "mspBootBlockRefreshTime";
                                      uint64_t v16 = a1;
                                      int v17 = 516;
                                      goto LABEL_283;
                                    case 517:
                                      uint64_t v13 = *v8;
                                      int v14 = "mspBootBlockCountPerMsp";
                                      goto LABEL_77;
                                    case 518:
                                      uint64_t v13 = *v8;
                                      int v14 = "skinnyRevectorSLC";
                                      goto LABEL_77;
                                    case 519:
                                      uint64_t v13 = *v8;
                                      int v14 = "skinnyRevectorTLC";
                                      goto LABEL_77;
                                    case 520:
                                      uint64_t v13 = *v8;
                                      int v14 = "perfSetupAttempts";
                                      goto LABEL_77;
                                    case 521:
                                      uint64_t v13 = *v8;
                                      int v14 = "perfSetupSuccesses";
                                      goto LABEL_77;
                                    case 522:
                                      uint64_t v13 = *v8;
                                      int v14 = "perfWriteAttempts";
                                      goto LABEL_77;
                                    case 523:
                                      uint64_t v13 = *v8;
                                      int v14 = "perfWriteSuccesses";
                                      goto LABEL_77;
                                    case 524:
                                      uint64_t v13 = *v8;
                                      int v14 = "perfReadAttempts";
                                      goto LABEL_77;
                                    case 525:
                                      uint64_t v13 = *v8;
                                      int v14 = "perfReadSuccesses";
                                      goto LABEL_77;
                                    case 526:
                                      uint64_t v13 = *v8;
                                      int v14 = "perfCleanupAttempts";
                                      goto LABEL_77;
                                    case 527:
                                      uint64_t v13 = *v8;
                                      int v14 = "perfCleanupSuccesses";
                                      goto LABEL_77;
                                    case 530:
                                      uint64_t v13 = *v8;
                                      int v14 = "firstFailedDieId";
                                      goto LABEL_77;
                                    case 531:
                                      uint64_t v13 = *v8;
                                      int v14 = "numDieFailures";
                                      goto LABEL_77;
                                    case 532:
                                      uint64_t v13 = *v8;
                                      int v14 = "spareAvailablePercent";
                                      goto LABEL_77;
                                    case 533:
                                      uint64_t v13 = *v8;
                                      int v14 = "dataFabricErr";
                                      goto LABEL_77;
                                    case 534:
                                      uint64_t v13 = *v8;
                                      int v14 = "downlinkFabricErr";
                                      goto LABEL_77;
                                    case 535:
                                      uint64_t v13 = *v8;
                                      int v14 = "prpAccTimeoutErr";
                                      goto LABEL_77;
                                    case 537:
                                      uint64_t v13 = *v8;
                                      int v14 = "uplinkFabricErr";
                                      goto LABEL_77;
                                    case 538:
                                      uint64_t v13 = *v8;
                                      int v14 = "skinnyBandsGBB";
                                      goto LABEL_77;
                                    case 539:
                                      uint64_t v13 = *v8;
                                      int v14 = "AbortPad_GcMustPadBand";
                                      goto LABEL_77;
                                    case 540:
                                      uint64_t v13 = *v8;
                                      int v14 = "AbortPad_GcMustPadSkinny";
                                      goto LABEL_77;
                                    case 541:
                                      uint64_t v13 = *v8;
                                      int v14 = "bdrHostPingInitial";
                                      goto LABEL_77;
                                    case 542:
                                      uint64_t v13 = *v8;
                                      int v14 = "bdrHostPingMoreNeeded";
                                      goto LABEL_77;
                                    case 543:
                                      uint64_t v13 = *v8;
                                      int v14 = "bandParityAllocationFailed";
                                      goto LABEL_77;
                                    case 544:
                                      uint64_t v13 = *v8;
                                      int v14 = "fastHwBurstToSlc";
                                      goto LABEL_77;
                                    case 545:
                                      uint64_t v13 = *v8;
                                      int v14 = "slowHwToTlc";
                                      goto LABEL_77;
                                    case 546:
                                      uint64_t v15 = "slcDemandBurstSizeDetected";
                                      uint64_t v16 = a1;
                                      int v17 = 546;
                                      goto LABEL_44;
                                    case 547:
                                      uint64_t v15 = "slcDemandBurstDur";
                                      uint64_t v16 = a1;
                                      int v17 = 547;
                                      goto LABEL_44;
                                    case 548:
                                      uint64_t v13 = *v8;
                                      int v14 = "fastHwToTlcBurst";
                                      goto LABEL_77;
                                    case 549:
                                      uint64_t v15 = "slcDemandBurstSizeSlc";
                                      uint64_t v16 = a1;
                                      int v17 = 549;
                                      goto LABEL_44;
                                    case 551:
                                      uint64_t v15 = "balanceProportionBucketsHistogramTlc";
                                      uint64_t v16 = a1;
                                      int v17 = 551;
                                      goto LABEL_448;
                                    case 553:
                                      uint64_t v13 = *v8;
                                      int v14 = "slowHwFlushToSlc";
                                      goto LABEL_77;
                                    case 557:
                                      uint64_t v13 = *v8;
                                      int v14 = "slowHwToSlc";
                                      goto LABEL_77;
                                    case 558:
                                      uint64_t v13 = *v8;
                                      int v14 = "flushNwToSlc";
                                      goto LABEL_77;
                                    case 559:
                                      uint64_t v13 = *v8;
                                      int v14 = "flushNwToTlc";
                                      goto LABEL_77;
                                    case 560:
                                      uint64_t v13 = *v8;
                                      int v14 = "oslcHw";
                                      goto LABEL_77;
                                    case 561:
                                      uint64_t v13 = *v8;
                                      int v14 = "oslcTransitions";
                                      goto LABEL_77;
                                    case 563:
                                      uint64_t v13 = *v8;
                                      int v14 = "slcDemandFlushCount";
                                      goto LABEL_77;
                                    case 564:
                                      uint64_t v13 = *v8;
                                      int v14 = "slcDemandBurstCount";
                                      goto LABEL_77;
                                    case 565:
                                      uint64_t v13 = *v8;
                                      int v14 = "oslcBaseAvgPE";
                                      goto LABEL_77;
                                    case 566:
                                      uint64_t v13 = *v8;
                                      int v14 = "raidReconstructFailNoSPBX";
                                      goto LABEL_77;
                                    case 567:
                                      uint64_t v13 = *v8;
                                      int v14 = "raidReconstructFailDouble";
                                      goto LABEL_77;
                                    case 568:
                                      uint64_t v13 = *v8;
                                      int v14 = "oslcFastWAmpUOnOff";
                                      goto LABEL_77;
                                    case 569:
                                      uint64_t v13 = *v8;
                                      int v14 = "oslcSlowWAmpUOnOff";
                                      goto LABEL_77;
                                    case 570:
                                      uint64_t v13 = *v8;
                                      int v14 = "raidReconstructFailInvalid";
                                      goto LABEL_77;
                                    case 572:
                                      uint64_t v13 = *v8;
                                      int v14 = "oslcLastWAmpUx10";
                                      goto LABEL_77;
                                    case 573:
                                      uint64_t v13 = *v8;
                                      int v14 = "raidFailedReadNoBlog";
                                      goto LABEL_77;
                                    case 574:
                                      uint64_t v13 = *v8;
                                      int v14 = "raidReconstructFailBlank";
                                      goto LABEL_77;
                                    case 575:
                                      uint64_t v13 = *v8;
                                      int v14 = "oslcHotTLCOnOff";
                                      goto LABEL_77;
                                    case 576:
                                      uint64_t v13 = *v8;
                                      int v14 = "gcVPackDestinations";
                                      goto LABEL_77;
                                    case 581:
                                      uint64_t v13 = *v8;
                                      int v14 = "averageTLCPECycles";
                                      goto LABEL_77;
                                    case 582:
                                      uint64_t v13 = *v8;
                                      int v14 = "averageSLCPECycles";
                                      goto LABEL_77;
                                    case 583:
                                      uint64_t v13 = *v8;
                                      int v14 = "numAtomicBoots";
                                      goto LABEL_77;
                                    case 584:
                                      uint64_t v13 = *v8;
                                      int v14 = "clogMinorMismatch";
                                      goto LABEL_77;
                                    case 586:
                                      uint64_t v13 = *v8;
                                      int v14 = "raidExpectedFailRMXReconstructionInternal";
                                      goto LABEL_77;
                                    case 587:
                                      uint64_t v13 = *v8;
                                      int v14 = "raidExpectedFailRMXReconstructionHost";
                                      goto LABEL_77;
                                    case 588:
                                      uint64_t v13 = *v8;
                                      int v14 = "oslcGCinvalidations";
                                      goto LABEL_77;
                                    case 589:
                                      uint64_t v13 = *v8;
                                      int v14 = "oslcGCActivateReason";
                                      goto LABEL_77;
                                    default:
                                      switch(v7)
                                      {
                                        case 590:
                                          uint64_t v13 = *v8;
                                          int v14 = "oslcLowCleanBandsUOnOff";
                                          goto LABEL_77;
                                        case 591:
                                          uint64_t v13 = *v8;
                                          int v14 = "oslcTooManyGCMustOnOff";
                                          goto LABEL_77;
                                        case 592:
                                          uint64_t v13 = *v8;
                                          int v14 = "oslcBaseHostWrites";
                                          goto LABEL_77;
                                        case 593:
                                          uint64_t v13 = *v8;
                                          int v14 = "oslcBaseBandErases";
                                          goto LABEL_77;
                                        case 594:
                                          uint64_t v13 = *v8;
                                          int v14 = "oslcBdrBands";
                                          goto LABEL_77;
                                        case 595:
                                          uint64_t v13 = *v8;
                                          int v14 = "oslcBdrValid";
                                          goto LABEL_77;
                                        case 596:
                                          uint64_t v13 = *v8;
                                          int v14 = "unexpectedBlanksInternal";
                                          goto LABEL_77;
                                        case 597:
                                          uint64_t v13 = *v8;
                                          int v14 = "unexpectedBlanksOnRV";
                                          goto LABEL_77;
                                        case 601:
                                          uint64_t v13 = *v8;
                                          int v14 = "waterfallLockSectors";
                                          goto LABEL_77;
                                        case 602:
                                          uint64_t v13 = *v8;
                                          int v14 = "oslcGCActiveWrites";
                                          goto LABEL_77;
                                        case 603:
                                          uint64_t v13 = *v8;
                                          int v14 = "chipIdTemperatureSample";
                                          goto LABEL_77;
                                        case 604:
                                          uint64_t v13 = *v8;
                                          int v14 = "gcVPackWrites";
                                          goto LABEL_77;
                                        case 605:
                                          uint64_t v15 = "gcActiveReasons";
                                          uint64_t v16 = a1;
                                          int v17 = 605;
                                          goto LABEL_44;
                                        case 606:
                                          uint64_t v13 = *v8;
                                          int v14 = "eanMaxInitTimeMs";
                                          goto LABEL_77;
                                        case 607:
                                          uint64_t v13 = *v8;
                                          int v14 = "eanMinToFirstReadTimeMs";
                                          goto LABEL_77;
                                        case 608:
                                          uint64_t v13 = *v8;
                                          int v14 = "skinnyAPGMRetire";
                                          goto LABEL_77;
                                        case 609:
                                          uint64_t v13 = *v8;
                                          int v14 = "unexpectedBlanksHost";
                                          goto LABEL_77;
                                        case 610:
                                          uint64_t v15 = "pcieAerCounters";
                                          uint64_t v16 = a1;
                                          int v17 = 610;
                                          goto LABEL_470;
                                        case 611:
                                          uint64_t v13 = *v8;
                                          int v14 = "fastHwToTlcBalance";
                                          goto LABEL_77;
                                        case 612:
                                          uint64_t v13 = *v8;
                                          int v14 = "perfOSLCRuns";
                                          goto LABEL_77;
                                        case 613:
                                          uint64_t v13 = *v8;
                                          int v14 = "slcDemandBurstWritesInGC";
                                          goto LABEL_77;
                                        case 614:
                                          uint64_t v13 = *v8;
                                          int v14 = "slcDemandBurstWritesInTT";
                                          goto LABEL_77;
                                        case 615:
                                          uint64_t v13 = *v8;
                                          int v14 = "slcDemandBurstWritesInNRP";
                                          goto LABEL_77;
                                        case 616:
                                          uint64_t v13 = *v8;
                                          int v14 = "perfTotalDmaMb";
                                          goto LABEL_77;
                                        case 617:
                                          uint64_t v13 = *v8;
                                          int v14 = "eanAvgInitTimeMs";
                                          goto LABEL_77;
                                        case 618:
                                          uint64_t v13 = *v8;
                                          int v14 = "eanAvgToFirstReadTimeMs";
                                          goto LABEL_77;
                                        case 619:
                                          uint64_t v13 = *v8;
                                          int v14 = "eanMaxBootReadTimeMs";
                                          goto LABEL_77;
                                        case 620:
                                          uint64_t v13 = *v8;
                                          int v14 = "eanAvgBootReadTimeMs";
                                          goto LABEL_77;
                                        case 621:
                                          uint64_t v15 = "eanBootReadsHist";
                                          uint64_t v16 = a1;
                                          int v17 = 621;
                                          goto LABEL_44;
                                        case 622:
                                          uint64_t v13 = *v8;
                                          int v14 = "maxBgInitTimeMs";
                                          goto LABEL_77;
                                        case 623:
                                          uint64_t v13 = *v8;
                                          int v14 = "avgBgInitTimeMs";
                                          goto LABEL_77;
                                        case 624:
                                          uint64_t v15 = "clogFailReason";
                                          uint64_t v16 = a1;
                                          int v17 = 624;
                                          goto LABEL_213;
                                        case 625:
                                          uint64_t v13 = *v8;
                                          int v14 = "eanMinBootReadMBPerSec";
                                          goto LABEL_77;
                                        case 626:
                                          uint64_t v13 = *v8;
                                          int v14 = "eanAvgBootReadMBPerSec";
                                          goto LABEL_77;
                                        case 627:
                                          uint64_t v13 = *v8;
                                          int v14 = "minSkinnyPECycles";
                                          goto LABEL_77;
                                        case 628:
                                          uint64_t v13 = *v8;
                                          int v14 = "maxSkinnyPECycles";
                                          goto LABEL_77;
                                        case 629:
                                          uint64_t v13 = *v8;
                                          int v14 = "averageSkinnyPECycles";
                                          goto LABEL_77;
                                        case 630:
                                          uint64_t v15 = "raidSuccessfulRecoEAN";
                                          uint64_t v16 = a1;
                                          int v17 = 630;
                                          goto LABEL_591;
                                        case 631:
                                          uint64_t v15 = "raidFailedRecoEAN";
                                          uint64_t v16 = a1;
                                          int v17 = 631;
                                          goto LABEL_591;
                                        case 632:
                                          uint64_t v15 = "eanFirstReadMode";
                                          uint64_t v16 = a1;
                                          int v17 = 632;
LABEL_591:
                                          v18 = v8;
                                          unsigned int v19 = 6;
                                          goto LABEL_51;
                                        case 635:
                                          uint64_t v13 = *v8;
                                          int v14 = "oslcHwGC";
                                          goto LABEL_77;
                                        case 636:
                                          uint64_t v13 = *v8;
                                          int v14 = "oslcHwTT";
                                          goto LABEL_77;
                                        case 637:
                                          uint64_t v13 = *v8;
                                          int v14 = "oslcHwNRP";
                                          goto LABEL_77;
                                        case 638:
                                          uint64_t v15 = "oslcDemandBurstSize";
                                          uint64_t v16 = a1;
                                          int v17 = 638;
                                          goto LABEL_44;
                                        case 639:
                                          uint64_t v13 = *v8;
                                          int v14 = "raidReconstructSuccessBandFlowOslc";
                                          goto LABEL_77;
                                        case 640:
                                          uint64_t v13 = *v8;
                                          int v14 = "raidReconstructFailBandFlowOslc";
                                          goto LABEL_77;
                                        case 641:
                                          uint64_t v13 = *v8;
                                          int v14 = "raidFailSectors";
                                          goto LABEL_77;
                                        case 642:
                                          uint64_t v13 = *v8;
                                          int v14 = "eanFailSectors";
                                          goto LABEL_77;
                                        case 643:
                                          uint64_t v13 = *v8;
                                          int v14 = "bdrTimeMode";
                                          goto LABEL_77;
                                        case 644:
                                          uint64_t v13 = *v8;
                                          int v14 = "raidParityNotSavedP";
                                          goto LABEL_77;
                                        case 645:
                                          uint64_t v13 = *v8;
                                          int v14 = "raidParityNotSavedQ";
                                          goto LABEL_77;
                                        case 646:
                                          uint64_t v13 = *v8;
                                          int v14 = "raidParityInvalid";
                                          goto LABEL_77;
                                        case 647:
                                          uint64_t v13 = *v8;
                                          int v14 = "raidParityUnknown";
                                          goto LABEL_77;
                                        case 648:
                                          uint64_t v13 = *v8;
                                          int v14 = "raidParityUnmapped";
                                          goto LABEL_77;
                                        case 649:
                                          uint64_t v13 = *v8;
                                          int v14 = "raidParityGCUnc";
                                          goto LABEL_77;
                                        case 657:
                                          uint64_t v13 = *v8;
                                          int v14 = "AbortSkip_MPBXProbational";
                                          goto LABEL_77;
                                        case 659:
                                          uint64_t v13 = *v8;
                                          int v14 = "raidVerificationReads";
                                          goto LABEL_77;
                                        case 666:
                                          uint64_t v13 = *v8;
                                          int v14 = "nofDies";
                                          goto LABEL_77;
                                        case 671:
                                          uint64_t v13 = *v8;
                                          int v14 = "skinnyBandsNum";
                                          goto LABEL_77;
                                        case 672:
                                          uint64_t v13 = *v8;
                                          int v14 = "skinnyBandsNumDips";
                                          goto LABEL_77;
                                        case 674:
                                          uint64_t v15 = "oslcNoVotesHw";
                                          uint64_t v16 = a1;
                                          int v17 = 674;
                                          goto LABEL_149;
                                        case 675:
                                          uint64_t v13 = *v8;
                                          int v14 = "totalLbas";
                                          goto LABEL_77;
                                        case 676:
                                          uint64_t v13 = *v8;
                                          int v14 = "bdrHostPingExtra";
                                          goto LABEL_77;
                                        case 677:
                                          uint64_t v13 = *v8;
                                          int v14 = "magazineInstanceMeta";
                                          goto LABEL_77;
                                        default:
                                          switch(v7)
                                          {
                                            case 680:
                                              uint64_t v15 = "magazineFWVersion";
                                              uint64_t v16 = a1;
                                              int v17 = 680;
                                              goto LABEL_130;
                                            case 681:
                                              uint64_t v13 = *v8;
                                              int v14 = "raidReconstructFailPMXUnsup";
                                              goto LABEL_77;
                                            case 682:
                                              uint64_t v13 = *v8;
                                              int v14 = "raidReconstructFailBMXUnsup";
                                              goto LABEL_77;
                                            case 683:
                                              uint64_t v13 = *v8;
                                              int v14 = "iBootNANDResets";
                                              goto LABEL_77;
                                            case 684:
                                              uint64_t v13 = *v8;
                                              int v14 = "pcieClkreqHighTimeout";
                                              goto LABEL_77;
                                            case 687:
                                              uint64_t v15 = "cbdrInitSent";
                                              uint64_t v16 = a1;
                                              int v17 = 687;
                                              goto LABEL_130;
                                            case 688:
                                              uint64_t v13 = *v8;
                                              int v14 = "cbdrPauseSent";
                                              goto LABEL_77;
                                            case 689:
                                              uint64_t v13 = *v8;
                                              int v14 = "cbdrResumeSent";
                                              goto LABEL_77;
                                            case 690:
                                              uint64_t v13 = *v8;
                                              int v14 = "cbdrGetResultSent";
                                              goto LABEL_77;
                                            case 691:
                                              uint64_t v13 = *v8;
                                              int v14 = "cbdrEarlyExits";
                                              goto LABEL_77;
                                            case 694:
                                              uint64_t v15 = "cbdrRefreshGrades";
                                              uint64_t v16 = a1;
                                              int v17 = 694;
                                              goto LABEL_44;
                                            case 695:
                                              uint64_t v13 = *v8;
                                              int v14 = "cbdrNotEnoughReads";
                                              goto LABEL_77;
                                            case 696:
                                              uint64_t v13 = *v8;
                                              int v14 = "cbdrAborts";
                                              goto LABEL_77;
                                            case 697:
                                              uint64_t v13 = *v8;
                                              int v14 = "TurboRaidHostClassifications";
                                              goto LABEL_77;
                                            case 698:
                                              uint64_t v13 = *v8;
                                              int v14 = "TurboRaidInternalClassifications";
                                              goto LABEL_77;
                                            case 699:
                                              uint64_t v13 = *v8;
                                              int v14 = "cbdrFullyDone";
                                              goto LABEL_77;
                                            case 702:
                                              uint64_t v15 = "vcurve";
                                              uint64_t v16 = a1;
                                              int v17 = 702;
                                              goto LABEL_283;
                                            case 703:
                                              uint64_t v15 = "injDepth";
                                              uint64_t v16 = a1;
                                              int v17 = 703;
                                              goto LABEL_281;
                                            case 704:
                                              uint64_t v13 = *v8;
                                              int v14 = "logical_disk_occupied_promiles";
                                              goto LABEL_77;
                                            case 711:
                                              uint64_t v13 = *v8;
                                              int v14 = "raidPrevFailedReconstructSkip";
                                              goto LABEL_77;
                                            case 712:
                                              uint64_t v13 = *v8;
                                              int v14 = "TurboRaidSuccessfulHostAuxReads";
                                              goto LABEL_77;
                                            case 713:
                                              uint64_t v13 = *v8;
                                              int v14 = "TurboRaidSuccessfulInternalAuxReads";
                                              goto LABEL_77;
                                            case 714:
                                              uint64_t v13 = *v8;
                                              int v14 = "turboRaidClassificationReliabilityHost";
                                              goto LABEL_77;
                                            case 715:
                                              uint64_t v13 = *v8;
                                              int v14 = "turboRaidClassificationReliabilityInternal";
                                              goto LABEL_77;
                                            case 716:
                                              uint64_t v13 = *v8;
                                              int v14 = "turboRaidClassificationQualityHost";
                                              goto LABEL_77;
                                            case 717:
                                              uint64_t v13 = *v8;
                                              int v14 = "turboRaidClassificationQualityInternal";
                                              goto LABEL_77;
                                            case 719:
                                              uint64_t v13 = *v8;
                                              int v14 = "skinnyBandErases";
                                              goto LABEL_77;
                                            case 721:
                                              uint64_t v13 = *v8;
                                              int v14 = "gcPDusterDestinations";
                                              goto LABEL_77;
                                            case 722:
                                              uint64_t v13 = *v8;
                                              int v14 = "gcPDusterWrites";
                                              goto LABEL_77;
                                            case 730:
                                              uint64_t v13 = *v8;
                                              int v14 = "rvFails";
                                              goto LABEL_77;
                                            case 737:
                                              uint64_t v13 = *v8;
                                              int v14 = "TurboRaidFailedHostAuxReads";
                                              goto LABEL_77;
                                            case 738:
                                              uint64_t v13 = *v8;
                                              int v14 = "TurboRaidFailedInternalAuxReads";
                                              goto LABEL_77;
                                            case 741:
                                              uint64_t v13 = *v8;
                                              int v14 = "autoSkipTriggers";
                                              goto LABEL_77;
                                            case 742:
                                              uint64_t v13 = *v8;
                                              int v14 = "autoSkipPlanes";
                                              goto LABEL_77;
                                            case 744:
                                              uint64_t v15 = "raidReconstructDurationHisto";
                                              uint64_t v16 = a1;
                                              int v17 = 744;
                                              goto LABEL_149;
                                            case 745:
                                              uint64_t v15 = "failsOnReconstructHisto";
                                              uint64_t v16 = a1;
                                              int v17 = 745;
                                              goto LABEL_149;
                                            case 746:
                                              uint64_t v13 = *v8;
                                              int v14 = "bandKill_userFlattenExcessive";
                                              goto LABEL_77;
                                            case 747:
                                              uint64_t v13 = *v8;
                                              int v14 = "bandKill_IntFlattenExcessive";
                                              goto LABEL_77;
                                            case 748:
                                              uint64_t v13 = *v8;
                                              int v14 = "bandKill_userFlattenBalance";
                                              goto LABEL_77;
                                            case 749:
                                              uint64_t v13 = *v8;
                                              int v14 = "bandKill_intFlattenBalance";
                                              goto LABEL_77;
                                            case 750:
                                              uint64_t v13 = *v8;
                                              int v14 = "bandKill_formatVertExcessive";
                                              goto LABEL_77;
                                            case 751:
                                              uint64_t v13 = *v8;
                                              int v14 = "bandKill_formatVertBalance";
                                              goto LABEL_77;
                                            case 753:
                                              uint64_t v13 = *v8;
                                              int v14 = "cbdrNumSlowRefreshes";
                                              goto LABEL_77;
                                            case 754:
                                              uint64_t v13 = *v8;
                                              int v14 = "cbdrNumFastRefreshes";
                                              goto LABEL_77;
                                            case 755:
                                              uint64_t v13 = *v8;
                                              int v14 = "cbdrTotalRefreshValidity";
                                              goto LABEL_77;
                                            case 756:
                                              uint64_t v15 = "cbdrRefreshedAges";
                                              uint64_t v16 = a1;
                                              int v17 = 756;
                                              goto LABEL_673;
                                            case 758:
                                              uint64_t v13 = *v8;
                                              int v14 = "cbdrSkippedBlocks";
                                              goto LABEL_77;
                                            case 759:
                                              uint64_t v15 = "cbdrScanPct";
                                              uint64_t v16 = a1;
                                              int v17 = 759;
                                              goto LABEL_102;
                                            case 760:
                                              uint64_t v13 = *v8;
                                              int v14 = "raidSuccessfulBMXReconstructionInternal";
                                              goto LABEL_77;
                                            case 761:
                                              uint64_t v13 = *v8;
                                              int v14 = "raidSuccessfulBMXReconstructionHost";
                                              goto LABEL_77;
                                            case 762:
                                              uint64_t v13 = *v8;
                                              int v14 = "raidFailedBMXReconstructionInternal";
                                              goto LABEL_77;
                                            case 763:
                                              uint64_t v13 = *v8;
                                              int v14 = "raidFailedBMXReconstructionHost";
                                              goto LABEL_77;
                                            case 764:
                                              uint64_t v13 = *v8;
                                              int v14 = "ricSPRVFail";
                                              goto LABEL_77;
                                            case 765:
                                              uint64_t v13 = *v8;
                                              int v14 = "ricMPRVFail";
                                              goto LABEL_77;
                                            case 767:
                                              uint64_t v15 = "cbdrRefreshGradesSLC";
                                              uint64_t v16 = a1;
                                              int v17 = 767;
                                              goto LABEL_44;
                                            case 768:
                                              uint64_t v15 = "cbdrRefreshedAgesSLC";
                                              uint64_t v16 = a1;
                                              int v17 = 768;
LABEL_673:
                                              v18 = v8;
                                              unsigned int v19 = 9;
                                              goto LABEL_51;
                                            case 769:
                                              uint64_t v15 = "cbdrScanPctSLC";
                                              uint64_t v16 = a1;
                                              int v17 = 769;
                                              goto LABEL_102;
                                            case 770:
                                              uint64_t v15 = "cpuBurstLength";
                                              uint64_t v16 = a1;
                                              int v17 = 770;
                                              goto LABEL_149;
                                            case 771:
                                              uint64_t v13 = *v8;
                                              int v14 = "autoSkipRaidRecoFail";
                                              goto LABEL_77;
                                            case 772:
                                              uint64_t v15 = "dmReasonsSlc";
                                              uint64_t v16 = a1;
                                              int v17 = 772;
                                              goto LABEL_283;
                                            case 773:
                                              uint64_t v15 = "dmReasonsTlc";
                                              uint64_t v16 = a1;
                                              int v17 = 773;
                                              goto LABEL_283;
                                            case 774:
                                              uint64_t v13 = *v8;
                                              int v14 = "raidReconstructFailBMXAbort";
                                              goto LABEL_77;
                                            case 775:
                                              uint64_t v13 = *v8;
                                              int v14 = "bandKill_fatBindingNoBlocks";
                                              goto LABEL_77;
                                            case 776:
                                              uint64_t v13 = *v8;
                                              int v14 = "bandKill_fatBindingFewBlocks";
                                              goto LABEL_77;
                                            default:
                                              switch(v7)
                                              {
                                                case 777:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "numBadBootBlocks";
                                                  goto LABEL_77;
                                                case 778:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "snapshotCPUHigh";
                                                  goto LABEL_77;
                                                case 779:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "snapshotCPULow";
                                                  goto LABEL_77;
                                                case 780:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "gcWithoutBMs";
                                                  goto LABEL_77;
                                                case 781:
                                                  uint64_t v15 = "gcSearchTimeHistory";
                                                  uint64_t v16 = a1;
                                                  int v17 = 781;
                                                  goto LABEL_44;
                                                case 785:
                                                  uint64_t v15 = "gcSearchPortion";
                                                  uint64_t v16 = a1;
                                                  int v17 = 785;
                                                  goto LABEL_213;
                                                case 786:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "raidReconstructFailBmxMp";
                                                  goto LABEL_77;
                                                case 787:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "raidReconstructFailBmx";
                                                  goto LABEL_77;
                                                case 788:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "raidReconstructFailBMXUECC";
                                                  goto LABEL_77;
                                                case 789:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "raidReconstructFailBMXBlank";
                                                  goto LABEL_77;
                                                case 790:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "raidPrevFailedReconstructBmxMpSkip";
                                                  goto LABEL_77;
                                                case 792:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "numTLCFatBands";
                                                  goto LABEL_77;
                                                case 793:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "fatValidity";
                                                  goto LABEL_77;
                                                case 794:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "fatTotal";
                                                  goto LABEL_77;
                                                case 798:
                                                  uint64_t v15 = "raidBMXFailP";
                                                  uint64_t v16 = a1;
                                                  int v17 = 798;
                                                  goto LABEL_144;
                                                case 799:
                                                  uint64_t v15 = "raidBMXFailUECC";
                                                  uint64_t v16 = a1;
                                                  int v17 = 799;
                                                  goto LABEL_144;
                                                case 804:
                                                  uint64_t v15 = "raidBMXFailNoSPBX";
                                                  uint64_t v16 = a1;
                                                  int v17 = 804;
                                                  goto LABEL_144;
                                                case 806:
                                                  uint64_t v15 = "raidBMXFailBlank";
                                                  uint64_t v16 = a1;
                                                  int v17 = 806;
                                                  goto LABEL_144;
                                                case 809:
                                                  uint64_t v15 = "raidBMXFailUnsup";
                                                  uint64_t v16 = a1;
                                                  int v17 = 809;
                                                  goto LABEL_144;
                                                case 811:
                                                  uint64_t v15 = "raidBMXFailMpSkip";
                                                  uint64_t v16 = a1;
                                                  int v17 = 811;
                                                  goto LABEL_144;
                                                case 812:
                                                  uint64_t v15 = "raidBMXFailAbort";
                                                  uint64_t v16 = a1;
                                                  int v17 = 812;
                                                  goto LABEL_144;
                                                case 813:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "TurboRaidIsEnabled";
                                                  goto LABEL_77;
                                                case 814:
                                                  uint64_t v15 = "raidBMXFailOther";
                                                  uint64_t v16 = a1;
                                                  int v17 = 814;
                                                  goto LABEL_144;
                                                case 815:
                                                  uint64_t v15 = "raidBMXSuccess";
                                                  uint64_t v16 = a1;
                                                  int v17 = 815;
                                                  goto LABEL_144;
                                                case 816:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "skinnyBandsExtraDip";
                                                  goto LABEL_77;
                                                case 821:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "writeAmp";
                                                  goto LABEL_77;
                                                case 822:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "ricMaxClogOnlyPages";
                                                  goto LABEL_77;
                                                case 823:
                                                  uint64_t v15 = "readClassifyStatusesHisto";
                                                  uint64_t v16 = a1;
                                                  int v17 = 823;
                                                  goto LABEL_130;
                                                case 824:
                                                  uint64_t v15 = "readWithAuxStatusesHisto";
                                                  uint64_t v16 = a1;
                                                  int v17 = 824;
                                                  goto LABEL_44;
                                                case 825:
                                                  uint64_t v15 = "readReconstructStatusesHisto";
                                                  uint64_t v16 = a1;
                                                  int v17 = 825;
                                                  goto LABEL_44;
                                                case 826:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "bdrBackupChecks";
                                                  goto LABEL_77;
                                                case 827:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "ricExceedClogOnlyPagesTH";
                                                  goto LABEL_77;
                                                case 828:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "numDipFailures";
                                                  goto LABEL_77;
                                                case 831:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "prefetchNextRange";
                                                  goto LABEL_77;
                                                case 862:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "raidSuccessfulSkip";
                                                  goto LABEL_77;
                                                case 863:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "raidFailedSkip";
                                                  goto LABEL_77;
                                                case 864:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "raidSkipAttempts";
                                                  goto LABEL_77;
                                                case 865:
                                                  uint64_t v15 = "timeOfThrottlingPerLevel";
                                                  uint64_t v16 = a1;
                                                  int v17 = 865;
                                                  goto LABEL_213;
                                                case 866:
                                                  uint64_t v15 = "timeOfThrottlingPerReadLevel";
                                                  uint64_t v16 = a1;
                                                  int v17 = 866;
                                                  goto LABEL_213;
                                                case 867:
                                                  uint64_t v15 = "timeOfThrottlingPerWriteLevel";
                                                  uint64_t v16 = a1;
                                                  int v17 = 867;
                                                  goto LABEL_213;
                                                case 868:
                                                  uint64_t v15 = "dmReasonsSlc_1bc";
                                                  uint64_t v16 = a1;
                                                  int v17 = 868;
                                                  goto LABEL_283;
                                                case 869:
                                                  uint64_t v15 = "dmReasonsTlc_1bc";
                                                  uint64_t v16 = a1;
                                                  int v17 = 869;
                                                  goto LABEL_283;
                                                case 870:
                                                  uint64_t v15 = "dmReasonsSlc_1bc_he";
                                                  uint64_t v16 = a1;
                                                  int v17 = 870;
                                                  goto LABEL_283;
                                                case 871:
                                                  uint64_t v15 = "dmReasonsTlc_1bc_he";
                                                  uint64_t v16 = a1;
                                                  int v17 = 871;
                                                  goto LABEL_283;
                                                case 876:
                                                  uint64_t v15 = "dmReasonsSlc_mbc";
                                                  uint64_t v16 = a1;
                                                  int v17 = 876;
                                                  goto LABEL_283;
                                                case 877:
                                                  uint64_t v15 = "dmReasonsTlc_mbc";
                                                  uint64_t v16 = a1;
                                                  int v17 = 877;
                                                  goto LABEL_283;
                                                case 883:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "clogEmptyProgramms";
                                                  goto LABEL_77;
                                                case 884:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "oslcHwCloseBand";
                                                  goto LABEL_77;
                                                case 891:
                                                  uint64_t v15 = "turboRaidSuccessAuxPartition";
                                                  uint64_t v16 = a1;
                                                  int v17 = 891;
                                                  goto LABEL_123;
                                                case 892:
                                                  uint64_t v15 = "turboRaidFailAuxPartition";
                                                  uint64_t v16 = a1;
                                                  int v17 = 892;
                                                  goto LABEL_123;
                                                case 893:
                                                  uint64_t v15 = "turboRaidClassifyQualPartition";
                                                  uint64_t v16 = a1;
                                                  int v17 = 893;
                                                  goto LABEL_123;
                                                case 894:
                                                  uint64_t v15 = "turboRaidClassifyRelPartition";
                                                  uint64_t v16 = a1;
                                                  int v17 = 894;
                                                  goto LABEL_123;
                                                case 895:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "IND_pool_freeMinSilo";
                                                  goto LABEL_77;
                                                case 896:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "autoSweepBlocks";
                                                  goto LABEL_77;
                                                case 897:
                                                  uint64_t v15 = "wcWrFragSizes";
                                                  uint64_t v16 = a1;
                                                  int v17 = 897;
                                                  goto LABEL_213;
                                                case 898:
                                                  uint64_t v15 = "indStateAcrossGcDidNoL";
                                                  uint64_t v16 = a1;
                                                  int v17 = 898;
                                                  goto LABEL_213;
                                                case 899:
                                                  uint64_t v15 = "indStateAcrossGcDidL";
                                                  uint64_t v16 = a1;
                                                  int v17 = 899;
                                                  goto LABEL_213;
                                                case 900:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "turboRaidNoClassifyDueToWasRetire";
                                                  goto LABEL_77;
                                                case 901:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "turboRaidNoClassifyDueToOpenBand";
                                                  goto LABEL_77;
                                                case 902:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "turboRaidNoClassifyDueToQualityBlock";
                                                  goto LABEL_77;
                                                case 903:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "turboRaidGbbOpenBand";
                                                  goto LABEL_77;
                                                case 904:
                                                  uint64_t v13 = *v8;
                                                  int v14 = "turboRaidGbbShouldRetireOnRefresh";
                                                  goto LABEL_77;
                                                case 905:
                                                  uint64_t v15 = "turboRaidRelPerBlock";
                                                  uint64_t v16 = a1;
                                                  int v17 = 905;
                                                  goto LABEL_213;
                                                case 906:
                                                  uint64_t v15 = "turboRaidRelBetweenRefreshesPerBlock";
                                                  uint64_t v16 = a1;
                                                  int v17 = 906;
                                                  goto LABEL_213;
                                                default:
                                                  if (v7 <= 1039)
                                                  {
                                                    switch(v7)
                                                    {
                                                      case 907:
                                                        uint64_t v15 = "turboRaidMaxRelBetweenRefreshesPerBlock";
                                                        uint64_t v16 = a1;
                                                        int v17 = 907;
                                                        goto LABEL_213;
                                                      case 908:
                                                        uint64_t v15 = "turboRaidMinRelBetweenRefreshesPerBlock";
                                                        uint64_t v16 = a1;
                                                        int v17 = 908;
                                                        goto LABEL_213;
                                                      case 909:
                                                      case 910:
                                                      case 911:
                                                      case 912:
                                                      case 913:
                                                      case 914:
                                                      case 915:
                                                      case 916:
                                                      case 917:
                                                      case 924:
                                                      case 925:
                                                      case 926:
                                                      case 927:
                                                      case 928:
                                                      case 929:
                                                      case 936:
                                                      case 941:
                                                      case 945:
                                                      case 946:
                                                      case 947:
                                                      case 949:
                                                      case 950:
                                                      case 952:
                                                      case 954:
                                                      case 955:
                                                      case 956:
                                                      case 957:
                                                      case 958:
                                                      case 959:
                                                      case 960:
                                                      case 963:
                                                      case 964:
                                                      case 965:
                                                      case 966:
                                                      case 968:
                                                      case 969:
                                                      case 970:
                                                        goto LABEL_824;
                                                      case 918:
                                                        uint64_t v15 = "turboRaidMaxCyclesBetweenRel";
                                                        uint64_t v16 = a1;
                                                        int v17 = 918;
                                                        goto LABEL_213;
                                                      case 919:
                                                        uint64_t v15 = "turboRaidMinCyclesBetweenRel";
                                                        uint64_t v16 = a1;
                                                        int v17 = 919;
                                                        goto LABEL_213;
                                                      case 920:
                                                        uint64_t v15 = "turboRaidAuxPerBlock";
                                                        uint64_t v16 = a1;
                                                        int v17 = 920;
                                                        goto LABEL_213;
                                                      case 921:
                                                        uint64_t v15 = "turboRaidAuxBetweenRefreshesPerBlock";
                                                        uint64_t v16 = a1;
                                                        int v17 = 921;
                                                        goto LABEL_213;
                                                      case 922:
                                                        uint64_t v13 = *v8;
                                                        int v14 = "turboRaidRelLockMark";
                                                        goto LABEL_77;
                                                      case 923:
                                                        uint64_t v13 = *v8;
                                                        int v14 = "turboRaidAuxLockMark";
                                                        goto LABEL_77;
                                                      case 930:
                                                        uint64_t v15 = "turboRaidMaxCyclesBetweenAux";
                                                        uint64_t v16 = a1;
                                                        int v17 = 930;
                                                        goto LABEL_213;
                                                      case 931:
                                                        uint64_t v15 = "turboRaidMinCyclesBetweenAux";
                                                        uint64_t v16 = a1;
                                                        int v17 = 931;
                                                        goto LABEL_213;
                                                      case 932:
                                                        uint64_t v15 = "turboRaidLastRelPECycles";
                                                        uint64_t v16 = a1;
                                                        int v17 = 932;
                                                        goto LABEL_213;
                                                      case 933:
                                                        uint64_t v15 = "turboRaidRelQualPECycles";
                                                        uint64_t v16 = a1;
                                                        int v17 = 933;
                                                        goto LABEL_213;
                                                      case 934:
                                                        uint64_t v15 = "turboRaidLastAuxPECycles";
                                                        uint64_t v16 = a1;
                                                        int v17 = 934;
                                                        goto LABEL_213;
                                                      case 935:
                                                        uint64_t v15 = "turboRaidAuxQualPECycles";
                                                        uint64_t v16 = a1;
                                                        int v17 = 935;
                                                        goto LABEL_213;
                                                      case 937:
                                                        uint64_t v13 = *v8;
                                                        int v14 = "turboRaidPEFailAfterRel";
                                                        goto LABEL_77;
                                                      case 938:
                                                        uint64_t v13 = *v8;
                                                        int v14 = "turboRaidPEFailAfterAux";
                                                        goto LABEL_77;
                                                      case 939:
                                                        uint64_t v13 = *v8;
                                                        int v14 = "dvfmVotesCPU";
                                                        goto LABEL_77;
                                                      case 940:
                                                        uint64_t v13 = *v8;
                                                        int v14 = "dvfmVotesBandwidth";
                                                        goto LABEL_77;
                                                      case 942:
                                                        uint64_t v13 = *v8;
                                                        int v14 = "maxSLCEndurance";
                                                        goto LABEL_77;
                                                      case 943:
                                                        uint64_t v13 = *v8;
                                                        int v14 = "maxMixedEndurance";
                                                        goto LABEL_77;
                                                      case 944:
                                                        uint64_t v13 = *v8;
                                                        int v14 = "maxNativeEndurance";
                                                        goto LABEL_77;
                                                      case 948:
                                                        uint64_t v15 = "assertHistory";
                                                        uint64_t v16 = a1;
                                                        int v17 = 948;
                                                        v18 = v8;
                                                        unsigned int v19 = 40;
                                                        goto LABEL_51;
                                                      case 951:
                                                        uint64_t v13 = *v8;
                                                        int v14 = "asp3Support";
                                                        goto LABEL_77;
                                                      case 953:
                                                        uint64_t v13 = *v8;
                                                        int v14 = "numCrossTempRaidUecc";
                                                        goto LABEL_77;
                                                      case 961:
                                                        uint64_t v13 = *v8;
                                                        int v14 = "osBuildStr";
                                                        goto LABEL_77;
                                                      case 962:
                                                        uint64_t v13 = *v8;
                                                        int v14 = "raidConfig";
                                                        goto LABEL_77;
                                                      case 967:
                                                        uint64_t v15 = "indTrimFrags";
                                                        uint64_t v16 = a1;
                                                        int v17 = 967;
                                                        goto LABEL_281;
                                                      case 971:
                                                        uint64_t v15 = "indUsedFrags";
                                                        uint64_t v16 = a1;
                                                        int v17 = 971;
                                                        goto LABEL_281;
                                                      default:
                                                        switch(v7)
                                                        {
                                                          case 996:
                                                            uint64_t v13 = *v8;
                                                            size_t v20 = (void *)a1;
                                                            int v14 = "clogFindFail";
                                                            goto LABEL_78;
                                                          case 997:
                                                            uint64_t v13 = *v8;
                                                            size_t v20 = (void *)a1;
                                                            int v14 = "clogFindBlank";
                                                            goto LABEL_78;
                                                          case 998:
                                                            uint64_t v13 = *v8;
                                                            size_t v20 = (void *)a1;
                                                            int v14 = "clogFindUnc";
                                                            goto LABEL_78;
                                                          case 999:
                                                            uint64_t v13 = *v8;
                                                            size_t v20 = (void *)a1;
                                                            int v14 = "clogFindUnexpected";
                                                            goto LABEL_78;
                                                          case 1001:
                                                            uint64_t v16 = a1;
                                                            int v17 = 1001;
                                                            uint64_t v15 = "clogReplayFailReason";
                                                            goto LABEL_149;
                                                          case 1002:
                                                            uint64_t v13 = *v8;
                                                            size_t v20 = (void *)a1;
                                                            int v14 = "clogReplayTransientError";
                                                            goto LABEL_78;
                                                          case 1003:
                                                            uint64_t v13 = *v8;
                                                            size_t v20 = (void *)a1;
                                                            int v14 = "clogReplaySpfError";
                                                            goto LABEL_78;
                                                          case 1015:
                                                            uint64_t v16 = a1;
                                                            int v17 = 1015;
                                                            uint64_t v15 = "eanEarlyBootUeccPage";
                                                            goto LABEL_144;
                                                          case 1016:
                                                            uint64_t v13 = *v8;
                                                            size_t v20 = (void *)a1;
                                                            int v14 = "eanEarlyBootNumUeccPages";
                                                            goto LABEL_78;
                                                          case 1017:
                                                            uint64_t v13 = *v8;
                                                            size_t v20 = (void *)a1;
                                                            int v14 = "eanEarlyBootUeccMultiplane";
                                                            goto LABEL_78;
                                                          default:
                                                            goto LABEL_824;
                                                        }
                                                    }
                                                  }
                                                  if (v7 <= 1137)
                                                  {
                                                    if (v7 > 1104)
                                                    {
                                                      if (v7 > 1115)
                                                      {
                                                        if (v7 == 1116)
                                                        {
                                                          uint64_t v16 = a1;
                                                          int v17 = 1116;
                                                          uint64_t v15 = "gcwamp";
LABEL_283:
                                                          v18 = v8;
                                                          unsigned int v19 = 32;
                                                          goto LABEL_51;
                                                        }
                                                        if (v7 == 1137)
                                                        {
                                                          uint64_t v13 = *v8;
                                                          size_t v20 = (void *)a1;
                                                          int v14 = "numOfToUnhappySwitches";
                                                          goto LABEL_78;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        if (v7 == 1105)
                                                        {
                                                          uint64_t v16 = a1;
                                                          int v17 = 1105;
                                                          uint64_t v15 = "hostReadSequential";
                                                          goto LABEL_831;
                                                        }
                                                        if (v7 == 1106)
                                                        {
                                                          uint64_t v16 = a1;
                                                          int v17 = 1106;
                                                          uint64_t v15 = "GCReadSequential";
LABEL_831:
                                                          v18 = v8;
                                                          unsigned int v19 = 14;
                                                          goto LABEL_51;
                                                        }
                                                      }
                                                    }
                                                    else
                                                    {
                                                      if (v7 <= 1041)
                                                      {
                                                        uint64_t v16 = a1;
                                                        if (v7 == 1040)
                                                        {
                                                          int v17 = 1040;
                                                          uint64_t v15 = "bandsAgeBinsV2";
                                                        }
                                                        else
                                                        {
                                                          int v17 = 1041;
                                                          uint64_t v15 = "bandsAgeBinsSnapshot";
                                                        }
                                                        v18 = v8;
                                                        unsigned int v19 = 31;
                                                        goto LABEL_51;
                                                      }
                                                      if (v7 == 1042)
                                                      {
                                                        uint64_t v16 = a1;
                                                        int v17 = 1042;
                                                        uint64_t v15 = "bandsAgeBinsReadSectors";
                                                        v18 = v8;
                                                        unsigned int v19 = 15;
LABEL_51:
                                                        sub_100007654(v16, v17, v15, v18, v19);
                                                        goto LABEL_79;
                                                      }
                                                      if (v7 == 1080)
                                                      {
                                                        uint64_t v13 = *v8;
                                                        size_t v20 = (void *)a1;
                                                        int v14 = "raidForceClogLoad";
                                                        goto LABEL_78;
                                                      }
                                                    }
LABEL_824:
                                                    switch(v7)
                                                    {
                                                      case 1196:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1196;
                                                        uint64_t v15 = "poDetectGBBedTotalCost";
                                                        goto LABEL_102;
                                                      case 1197:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1197;
                                                        uint64_t v15 = "poDetectGBBedAge";
                                                        goto LABEL_44;
                                                      case 1198:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1198;
                                                        uint64_t v15 = "poDetectPERemovalMostSevereCost";
                                                        goto LABEL_130;
                                                      case 1199:
                                                        uint64_t v13 = *v8;
                                                        size_t v20 = (void *)a1;
                                                        int v14 = "poDetectCurrentSize";
                                                        goto LABEL_78;
                                                      case 1200:
                                                      case 1203:
                                                      case 1204:
                                                      case 1205:
                                                      case 1206:
                                                      case 1207:
                                                      case 1208:
                                                      case 1209:
                                                      case 1210:
                                                      case 1212:
                                                      case 1213:
                                                      case 1214:
                                                      case 1219:
                                                      case 1220:
                                                      case 1221:
                                                      case 1222:
                                                      case 1223:
                                                        break;
                                                      case 1201:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1201;
                                                        uint64_t v15 = "gcVerticalSuccssfulAlignments";
                                                        goto LABEL_144;
                                                      case 1202:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1202;
                                                        uint64_t v15 = "gcVerticalNoAlignmentDueToMissingSegs";
                                                        goto LABEL_144;
                                                      case 1211:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1211;
                                                        uint64_t v15 = "forcedAllocationSmallEraseQ";
                                                        goto LABEL_844;
                                                      case 1215:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1215;
                                                        uint64_t v15 = "hostWritesPerThrottleZone";
                                                        goto LABEL_102;
                                                      case 1216:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1216;
                                                        uint64_t v15 = "tlcWLPerDipAvgPEC";
                                                        goto LABEL_844;
                                                      case 1217:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1217;
                                                        uint64_t v15 = "tlcWLPerDipMaxPEC";
                                                        goto LABEL_844;
                                                      case 1218:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1218;
                                                        uint64_t v15 = "tlcWLPerDipMinPEC";
                                                        goto LABEL_844;
                                                      case 1224:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1224;
                                                        uint64_t v15 = "apfsValidLbaOvershoot";
                                                        goto LABEL_93;
                                                      default:
                                                        switch(v7)
                                                        {
                                                          case 1232:
                                                            uint64_t v13 = *v8;
                                                            size_t v20 = (void *)a1;
                                                            int v14 = "eanFastSize";
                                                            goto LABEL_78;
                                                          case 1233:
                                                            uint64_t v13 = *v8;
                                                            size_t v20 = (void *)a1;
                                                            int v14 = "eanNumSlcEvictions";
                                                            goto LABEL_78;
                                                          case 1234:
                                                            uint64_t v13 = *v8;
                                                            size_t v20 = (void *)a1;
                                                            int v14 = "eanNumForcedCompress";
                                                            goto LABEL_78;
                                                          case 1235:
                                                          case 1236:
                                                          case 1237:
                                                          case 1238:
                                                          case 1239:
                                                          case 1240:
                                                          case 1242:
                                                          case 1243:
                                                          case 1245:
                                                            goto LABEL_79;
                                                          case 1241:
                                                            uint64_t v16 = a1;
                                                            int v17 = 1241;
                                                            uint64_t v15 = "s2rTimeHisto";
                                                            goto LABEL_44;
                                                          case 1244:
                                                            uint64_t v13 = *v8;
                                                            size_t v20 = (void *)a1;
                                                            int v14 = "calendarTimeWentBackward";
                                                            goto LABEL_78;
                                                          case 1246:
                                                            uint64_t v16 = a1;
                                                            int v17 = 1246;
                                                            uint64_t v15 = "bandsUeccCrossTempHisto";
                                                            goto LABEL_149;
                                                          default:
                                                            if (v7 != 1190) {
                                                              goto LABEL_79;
                                                            }
                                                            uint64_t v16 = a1;
                                                            int v17 = 1190;
                                                            uint64_t v15 = "powerDownTime";
                                                            break;
                                                        }
                                                        goto LABEL_281;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    switch(v7)
                                                    {
                                                      case 1147:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1147;
                                                        uint64_t v15 = "gc_concurrent_dw_gc12";
                                                        goto LABEL_844;
                                                      case 1148:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1148;
                                                        uint64_t v15 = "gc_concurrent_dw_gc1";
                                                        goto LABEL_844;
                                                      case 1149:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1149;
                                                        uint64_t v15 = "gc_concurrent_dw_gc2";
LABEL_844:
                                                        v18 = v8;
                                                        unsigned int v19 = 24;
                                                        goto LABEL_51;
                                                      case 1150:
                                                      case 1151:
                                                      case 1152:
                                                      case 1153:
                                                      case 1154:
                                                      case 1155:
                                                      case 1156:
                                                      case 1159:
                                                      case 1160:
                                                      case 1161:
                                                      case 1162:
                                                      case 1163:
                                                      case 1164:
                                                      case 1165:
                                                      case 1166:
                                                      case 1167:
                                                      case 1170:
                                                      case 1173:
                                                      case 1174:
                                                      case 1175:
                                                      case 1176:
                                                      case 1177:
                                                      case 1178:
                                                        goto LABEL_824;
                                                      case 1157:
                                                        uint64_t v13 = *v8;
                                                        size_t v20 = (void *)a1;
                                                        int v14 = "eanMaxForceROTimeMs";
                                                        break;
                                                      case 1158:
                                                        uint64_t v13 = *v8;
                                                        size_t v20 = (void *)a1;
                                                        int v14 = "eanMaxForceRORecoTimeMs";
                                                        break;
                                                      case 1168:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1168;
                                                        uint64_t v15 = "poDetectPERemovalTotalCost";
                                                        goto LABEL_123;
                                                      case 1169:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1169;
                                                        uint64_t v15 = "poDetectEmptySpotRemovalTotalCost";
                                                        goto LABEL_123;
                                                      case 1171:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1171;
                                                        uint64_t v15 = "poDetectEmptySpotRemovalAge";
                                                        goto LABEL_44;
                                                      case 1172:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1172;
                                                        uint64_t v15 = "poDetectGBBedMostSevereCost";
                                                        goto LABEL_130;
                                                      case 1179:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1179;
                                                        uint64_t v15 = "gc_cur_dw_gc1";
                                                        goto LABEL_144;
                                                      case 1180:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1180;
                                                        uint64_t v15 = "gc_cur_dw_gc2";
                                                        goto LABEL_144;
                                                      case 1181:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1181;
                                                        uint64_t v15 = "gc_cur_dw_gc3";
                                                        goto LABEL_144;
                                                      case 1182:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1182;
                                                        uint64_t v15 = "gc_tot_dw_gc1";
                                                        goto LABEL_144;
                                                      case 1183:
                                                        uint64_t v16 = a1;
                                                        int v17 = 1183;
                                                        uint64_t v15 = "gc_tot_dw_gc2";
                                                        goto LABEL_144;
                                                      case 1184:
                                                        uint64_t v13 = *v8;
                                                        size_t v20 = (void *)a1;
                                                        int v14 = "unhappy_state";
                                                        break;
                                                      case 1185:
                                                        uint64_t v13 = *v8;
                                                        size_t v20 = (void *)a1;
                                                        int v14 = "unhappy_level";
                                                        break;
                                                      default:
                                                        if (v7 == 1138)
                                                        {
                                                          uint64_t v13 = *v8;
                                                          size_t v20 = (void *)a1;
                                                          int v14 = "numOfToHappySwitches";
                                                        }
                                                        else
                                                        {
                                                          if (v7 != 1189) {
                                                            goto LABEL_824;
                                                          }
                                                          uint64_t v13 = *v8;
                                                          size_t v20 = (void *)a1;
                                                          int v14 = "lastLbaFormatTime";
                                                        }
                                                        break;
                                                    }
LABEL_78:
                                                    sub_10001A604(v20, (const char *)&unk_10004356B, v14, v13);
                                                  }
LABEL_79:
                                                  a2 = &v8[v10];
                                                  unsigned int v6 = v11 - v10;
                                                  if (v11 != v10) {
                                                    continue;
                                                  }
                                                  uint64_t result = 1;
                                                  break;
                                              }
                                              break;
                                          }
                                          break;
                                      }
                                      break;
                                  }
                                  break;
                              }
                              break;
                          }
                          break;
                      }
                      break;
                  }
                  break;
              }
              break;
          }
          break;
      }
    }
    else
    {
      uint64_t result = 0;
      *(_DWORD *)(a1 + 32) = 0;
    }
    return result;
  }
}

uint64_t sub_100007654(uint64_t result, int a2, const char *a3, uint64_t *a4, unsigned int a5)
{
  int v7 = (void *)result;
  uint64_t v8 = *a4;
  if (a2 <= 44)
  {
    switch(a2)
    {
      case 4:
        *(void *)(result + 72) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 5:
      case 6:
      case 8:
      case 9:
      case 10:
      case 11:
      case 14:
      case 15:
      case 16:
        goto LABEL_41;
      case 7:
        *(void *)(result + 64) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 12:
        *(void *)(result + 144) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 13:
        *(void *)(result + 152) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 17:
        *(void *)(result + 88) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 18:
        *(void *)(result + 104) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 19:
        *(void *)(result + 96) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 20:
        *(void *)(result + 112) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      default:
        if (a2 != 28) {
          goto LABEL_41;
        }
        *(void *)(result + 168) = v8;
        if (!a5) {
          return result;
        }
        goto LABEL_42;
    }
  }
  switch(a2)
  {
    case '-':
      *(void *)(result + 176) = v8;
      if (a5) {
        goto LABEL_42;
      }
      return result;
    case '.':
    case '/':
    case '6':
    case '7':
      goto LABEL_41;
    case '0':
      *(void *)(result + 80) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '1':
      *(_DWORD *)(result + 56) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '2':
      *(_DWORD *)(result + 52) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '3':
      *(_DWORD *)(result + 48) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '4':
      *(_DWORD *)(result + 44) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '5':
      *(_DWORD *)(result + 32) = v8;
      goto LABEL_41;
    case '8':
      *(void *)(result + 160) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    default:
      if (a2 != 265) {
        goto LABEL_41;
      }
      if (a5)
      {
        uint64_t v9 = a5;
        unint64_t v10 = (void *)(result + 184);
        unsigned int v11 = a4;
        do
        {
          uint64_t v12 = *v11++;
          *v10++ = v12;
          --v9;
        }
        while (v9);
LABEL_41:
        if (a5)
        {
LABEL_42:
          if (a5 == 1)
          {
            return sub_10001A604((void *)result, (const char *)&unk_10004356B, a3, v8);
          }
          else
          {
            uint64_t v13 = 0;
            uint64_t v14 = a5;
            do
            {
              snprintf(__str, 0x64uLL, "%d", v13);
              __str[100] = 0;
              uint64_t result = sub_10001A604(v7, a3, __str, a4[v13++]);
            }
            while (v14 != v13);
          }
        }
      }
      return result;
  }
}

double ASPReleaseContext(uint64_t a1)
{
  v2 = *(void **)a1;
  if (v2)
  {
    do
    {
      v3 = (void *)v2[14];
      free(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)(a1 + 16);
  if (v4)
  {
    do
    {
      v5 = (void *)v4[14];
      free(v4);
      v4 = v5;
    }
    while (v5);
  }
  double result = 0.0;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t ASPFTLParseBufferToCxt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (uint64_t *)a2;
  uint64_t v10 = 0;
  unsigned int v11 = a3 >> 3;
  *(_OWORD *)__str = 0u;
  long long v23 = 0u;
  do
  {
LABEL_2:
    if (!v11) {
      return v10;
    }
    unint64_t v13 = *v8++;
    int v12 = v13;
    unint64_t v14 = HIDWORD(v13);
    --v11;
  }
  while (!HIDWORD(v13));
  if (v12 == 0xFFFF || v12 > 0x30000000 || v11 < v14) {
    return v10;
  }
  switch(v12)
  {
    case 1:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "version", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: version(1) cannot add 1 element to context";
      goto LABEL_161;
    case 2:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "hostWriteXacts", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: hostWriteXacts(2) cannot add 1 element to context";
      goto LABEL_161;
    case 3:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "hostReadXacts", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: hostReadXacts(3) cannot add 1 element to context";
      goto LABEL_161;
    case 4:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "hostWrites", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: hostWrites(4) cannot add 1 element to context";
      goto LABEL_161;
    case 5:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "hostWritesDyn", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: hostWritesDyn(5) cannot add 1 element to context";
      goto LABEL_161;
    case 6:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "hostWritesStatic", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: hostWritesStatic(6) cannot add 1 element to context";
      goto LABEL_161;
    case 7:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "hostReads", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: hostReads(7) cannot add 1 element to context";
      goto LABEL_161;
    case 8:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "validLbas", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: validLbas(8) cannot add 1 element to context";
      goto LABEL_161;
    case 9:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "shutdowns", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: shutdowns(9) cannot add 1 element to context";
      goto LABEL_161;
    case 10:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "boots", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: boots(10) cannot add 1 element to context";
      goto LABEL_161;
    case 11:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "uncleanBoots", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: uncleanBoots(11) cannot add 1 element to context";
      goto LABEL_161;
    case 12:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "IND_pool_free", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: IND_pool_free(12) cannot add 1 element to context";
      goto LABEL_161;
    case 13:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "IND_pool_count", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: IND_pool_count(13) cannot add 1 element to context";
      goto LABEL_161;
    case 14:
      if (v14 != 10) {
        SetAPIErrorMessage("ASPFTLParseBufferToCxt: hostWriteLogHisto(14): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
      }
      if (v14 >= 0xA) {
        unsigned int v18 = 10;
      }
      else {
        unsigned int v18 = v14;
      }
      if (AddMultipleFieldsToGenericContext(a1, "hostWriteLogHisto_", (uint64_t)v8, 8u, v18)) {
        goto LABEL_110;
      }
      unsigned int v19 = "ASPFTLParseBufferToCxt: hostWriteLogHisto(14): Cannot add 10 elements to context";
      goto LABEL_2616;
    case 15:
      if (v14 != 10) {
        SetAPIErrorMessage("ASPFTLParseBufferToCxt: hostReadLogHisto(15): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
      }
      if (v14 >= 0xA) {
        unsigned int v18 = 10;
      }
      else {
        unsigned int v18 = v14;
      }
      if (AddMultipleFieldsToGenericContext(a1, "hostReadLogHisto_", (uint64_t)v8, 8u, v18)) {
        goto LABEL_110;
      }
      unsigned int v19 = "ASPFTLParseBufferToCxt: hostReadLogHisto(15): Cannot add 10 elements to context";
      goto LABEL_2616;
    case 16:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "gcWrites", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: gcWrites(16) cannot add 1 element to context";
      goto LABEL_161;
    case 17:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "wearLevMoves", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: wearLevMoves(17) cannot add 1 element to context";
      goto LABEL_161;
    case 18:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "nandWrites", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: nandWrites(18) cannot add 1 element to context";
      goto LABEL_161;
    case 19:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "nandReads", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: nandReads(19) cannot add 1 element to context";
      goto LABEL_161;
    case 20:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "bandErases", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: bandErases(20) cannot add 1 element to context";
      goto LABEL_161;
    case 22:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "numPfail", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: numPfail(22) cannot add 1 element to context";
      goto LABEL_161;
    case 23:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "numEfail", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: numEfail(23) cannot add 1 element to context";
      goto LABEL_161;
    case 24:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "numPerformanceRefreshes", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: numPerformanceRefreshes(24) cannot add 1 element to context";
      goto LABEL_161;
    case 27:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "hostWritesMeta", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: hostWritesMeta(27) cannot add 1 element to context";
      goto LABEL_161;
    case 28:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "numSleepOps", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: numSleepOps(28) cannot add 1 element to context";
      goto LABEL_161;
    case 30:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "cntTimeWentBackWardOnBoot", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: cntTimeWentBackWardOnBoot(30) cannot add 1 element to context";
      goto LABEL_161;
    case 31:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "cntTimeWentBackWard", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: cntTimeWentBackWard(31) cannot add 1 element to context";
      goto LABEL_161;
    case 34:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "powerOnHours", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: powerOnHours(34) cannot add 1 element to context";
      goto LABEL_161;
    case 36:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "smartCritWarnings", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: smartCritWarnings(36) cannot add 1 element to context";
      goto LABEL_161;
    case 37:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "numFlushes", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: numFlushes(37) cannot add 1 element to context";
      goto LABEL_161;
    case 38:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "numUnmap", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: numUnmap(38) cannot add 1 element to context";
      goto LABEL_161;
    case 39:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "numUnmapSec", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: numUnmapSec(39) cannot add 1 element to context";
      goto LABEL_161;
    case 41:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "clogProgram", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: clogProgram(41) cannot add 1 element to context";
      goto LABEL_161;
    case 42:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "clogPFail", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: clogPFail(42) cannot add 1 element to context";
      goto LABEL_161;
    case 43:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "clogRead", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: clogRead(43) cannot add 1 element to context";
      goto LABEL_161;
    case 44:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "clogRFail", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: clogRFail(44) cannot add 1 element to context";
      goto LABEL_161;
    case 45:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "maxHighEnduranceBlockErases", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: maxHighEnduranceBlockErases(45) cannot add 1 element to context";
      goto LABEL_161;
    case 46:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "numFactoryBad", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: numFactoryBad(46) cannot add 1 element to context";
      goto LABEL_161;
    case 47:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "numGrownBad", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: numGrownBad(47) cannot add 1 element to context";
      goto LABEL_161;
    case 48:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "numFreeVirtualBlocks", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: numFreeVirtualBlocks(48) cannot add 1 element to context";
      goto LABEL_161;
    case 49:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "bytesPerPage", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: bytesPerPage(49) cannot add 1 element to context";
      goto LABEL_161;
    case 50:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "pagesPerVirtualBlock", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: pagesPerVirtualBlock(50) cannot add 1 element to context";
      goto LABEL_161;
    case 51:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "blocksPerVirtualBlock", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: blocksPerVirtualBlock(51) cannot add 1 element to context";
      goto LABEL_161;
    case 52:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "numVirtualBlocks", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: numVirtualBlocks(52) cannot add 1 element to context";
      goto LABEL_161;
    case 53:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "exportVersion", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: exportVersion(53) cannot add 1 element to context";
      goto LABEL_161;
    case 54:
      if (v14 != 100) {
        SetAPIErrorMessage("ASPFTLParseBufferToCxt: ECBins(54): (#100) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
      }
      if (v14 >= 0x64) {
        unsigned int v18 = 100;
      }
      else {
        unsigned int v18 = v14;
      }
      if (AddMultipleFieldsToGenericContext(a1, "ECBins_", (uint64_t)v8, 8u, v18)) {
        goto LABEL_110;
      }
      unsigned int v19 = "ASPFTLParseBufferToCxt: ECBins(54): Cannot add 100 elements to context";
      goto LABEL_2616;
    case 55:
      if (v14 != 100) {
        SetAPIErrorMessage("ASPFTLParseBufferToCxt: RCBins(55): (#100) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
      }
      if (v14 >= 0x64) {
        unsigned int v18 = 100;
      }
      else {
        unsigned int v18 = v14;
      }
      if (AddMultipleFieldsToGenericContext(a1, "RCBins_", (uint64_t)v8, 8u, v18)) {
        goto LABEL_110;
      }
      unsigned int v19 = "ASPFTLParseBufferToCxt: RCBins(55): Cannot add 100 elements to context";
      goto LABEL_2616;
    case 56:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "utilFormatTime", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: utilFormatTime(56) cannot add 1 element to context";
      goto LABEL_161;
    case 57:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "calendarTime", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: calendarTime(57) cannot add 1 element to context";
      goto LABEL_161;
    case 58:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "wallTime", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: wallTime(58) cannot add 1 element to context";
      goto LABEL_161;
    case 59:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "cmdq_flush_us", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: cmdq_flush_us(59) cannot add 1 element to context";
      goto LABEL_161;
    case 60:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "cmdq_unmap_us", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: cmdq_unmap_us(60) cannot add 1 element to context";
      goto LABEL_161;
    case 61:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "cmdq_pri0_r_us", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: cmdq_pri0_r_us(61) cannot add 1 element to context";
      goto LABEL_161;
    case 62:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "cmdq_pri0_w_us", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: cmdq_pri0_w_us(62) cannot add 1 element to context";
      goto LABEL_161;
    case 63:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "cmdq_pri1_r_us", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: cmdq_pri1_r_us(63) cannot add 1 element to context";
      goto LABEL_161;
    case 64:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "cmdq_pri1_w_us", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: cmdq_pri1_w_us(64) cannot add 1 element to context";
      goto LABEL_161;
    case 65:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "cmdq_pri2_r_us", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: cmdq_pri2_r_us(65) cannot add 1 element to context";
      goto LABEL_161;
    case 66:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "cmdq_pri2_w_us", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: cmdq_pri2_w_us(66) cannot add 1 element to context";
      goto LABEL_161;
    case 67:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "cmdq_pri3_r_us", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: cmdq_pri3_r_us(67) cannot add 1 element to context";
      goto LABEL_161;
    case 68:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "cmdq_pri3_w_us", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: cmdq_pri3_w_us(68) cannot add 1 element to context";
      goto LABEL_161;
    case 69:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "host_idle_ms", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: host_idle_ms(69) cannot add 1 element to context";
      goto LABEL_161;
    case 70:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "cmd_hysteresis_window_us", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: cmd_hysteresis_window_us(70) cannot add 1 element to context";
      goto LABEL_161;
    case 71:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "cmd_lowPriHoldoffDelay_us", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: cmd_lowPriHoldoffDelay_us(71) cannot add 1 element to context";
      goto LABEL_161;
    case 72:
      if (AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, "cmd_lowPriHoldoffEnabled", *v8)) {
        goto LABEL_162;
      }
      int v17 = "ASPFTLParseBufferToCxt: cmd_lowPriHoldoffEnabled(72) cannot add 1 element to context";
      goto LABEL_161;
    default:
      switch(v12)
      {
        case 73:
          if (AddMultipleFieldsToGenericContext(a1, "cmd_expedite_num_success", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: cmd_expedite_num_success(73) cannot add 1 element to context";
          goto LABEL_161;
        case 75:
          if (AddMultipleFieldsToGenericContext(a1, "cmd_expedite_num_failures", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: cmd_expedite_num_failures(75) cannot add 1 element to context";
          goto LABEL_161;
        case 76:
          if (AddMultipleFieldsToGenericContext(a1, "num_trimerase", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: num_trimerase(76) cannot add 1 element to context";
          goto LABEL_161;
        case 77:
          if (AddMultipleFieldsToGenericContext(a1, "staticSizeInMB", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: staticSizeInMB(77) cannot add 1 element to context";
          goto LABEL_161;
        case 80:
          if (AddMultipleFieldsToGenericContext(a1, "slcInvalidations", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: slcInvalidations(80) cannot add 1 element to context";
          goto LABEL_161;
        case 81:
          if (AddMultipleFieldsToGenericContext(a1, "slcGCInvalidations", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: slcGCInvalidations(81) cannot add 1 element to context";
          goto LABEL_161;
        case 82:
          if (AddMultipleFieldsToGenericContext(a1, "hostSectorsDuringGCon", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: hostSectorsDuringGCon(82) cannot add 1 element to context";
          goto LABEL_161;
        case 83:
          if (AddMultipleFieldsToGenericContext(a1, "highWaterMarkSLCUsed", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: highWaterMarkSLCUsed(83) cannot add 1 element to context";
          goto LABEL_161;
        case 84:
          if (AddMultipleFieldsToGenericContext(a1, "intermediateBandErases", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: intermediateBandErases(84) cannot add 1 element to context";
          goto LABEL_161;
        case 85:
          if (AddMultipleFieldsToGenericContext(a1, "intermediatePartitionStart", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: intermediatePartitionStart(85) cannot add 1 element to context";
          goto LABEL_161;
        case 86:
          if (AddMultipleFieldsToGenericContext(a1, "userPartitionStart", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: userPartitionStart(86) cannot add 1 element to context";
          goto LABEL_161;
        case 87:
          if (AddMultipleFieldsToGenericContext(a1, "iolog_lbas", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: iolog_lbas(87) cannot add 1 element to context";
          goto LABEL_161;
        case 88:
          if (v14 != 10) {
            SetAPIErrorMessage("ASPFTLParseBufferToCxt: bandsAgeBins(88): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          }
          if (v14 >= 0xA) {
            unsigned int v18 = 10;
          }
          else {
            unsigned int v18 = v14;
          }
          if (AddMultipleFieldsToGenericContext(a1, "bandsAgeBins_", (uint64_t)v8, 8u, v18)) {
            goto LABEL_110;
          }
          unsigned int v19 = "ASPFTLParseBufferToCxt: bandsAgeBins(88): Cannot add 10 elements to context";
          goto LABEL_2616;
        case 89:
          if (v14 != 10) {
            SetAPIErrorMessage("ASPFTLParseBufferToCxt: intermediateBandsAgeBins(89): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          }
          if (v14 >= 0xA) {
            unsigned int v18 = 10;
          }
          else {
            unsigned int v18 = v14;
          }
          if (AddMultipleFieldsToGenericContext(a1, "intermediateBandsAgeBins_", (uint64_t)v8, 8u, v18)) {
            goto LABEL_110;
          }
          unsigned int v19 = "ASPFTLParseBufferToCxt: intermediateBandsAgeBins(89): Cannot add 10 elements to context";
          goto LABEL_2616;
        case 90:
          if (v14 != 160) {
            SetAPIErrorMessage("ASPFTLParseBufferToCxt: qosPerCmdQ(90): (#160) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          }
          if (v14 >= 0xA0) {
            unsigned int v18 = 160;
          }
          else {
            unsigned int v18 = v14;
          }
          if (AddMultipleFieldsToGenericContext(a1, "qosPerCmdQ_", (uint64_t)v8, 8u, v18)) {
            goto LABEL_110;
          }
          unsigned int v19 = "ASPFTLParseBufferToCxt: qosPerCmdQ(90): Cannot add 160 elements to context";
          goto LABEL_2616;
        case 91:
          if (v14 != 10) {
            SetAPIErrorMessage("ASPFTLParseBufferToCxt: maxQosPerCmdQ(91): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          }
          if (v14 >= 0xA) {
            unsigned int v18 = 10;
          }
          else {
            unsigned int v18 = v14;
          }
          if (AddMultipleFieldsToGenericContext(a1, "maxQosPerCmdQ_", (uint64_t)v8, 8u, v18)) {
            goto LABEL_110;
          }
          unsigned int v19 = "ASPFTLParseBufferToCxt: maxQosPerCmdQ(91): Cannot add 10 elements to context";
          goto LABEL_2616;
        case 92:
          if (AddMultipleFieldsToGenericContext(a1, "shutdownDuringGC", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: shutdownDuringGC(92) cannot add 1 element to context";
          goto LABEL_161;
        case 93:
          if (v14 != 3) {
            SetAPIErrorMessage("ASPFTLParseBufferToCxt: numBandsRefreshedForAgePerTier(93): (#3) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          }
          if (v14 >= 3) {
            unsigned int v18 = 3;
          }
          else {
            unsigned int v18 = v14;
          }
          if (AddMultipleFieldsToGenericContext(a1, "numBandsRefreshedForAgePerTier_", (uint64_t)v8, 8u, v18)) {
            goto LABEL_110;
          }
          unsigned int v19 = "ASPFTLParseBufferToCxt: numBandsRefreshedForAgePerTier(93): Cannot add 3 elements to context";
          goto LABEL_2616;
        case 94:
          if (v14 != 20) {
            SetAPIErrorMessage("ASPFTLParseBufferToCxt: bdrDeltaHot(94): (#20) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          }
          if (v14 >= 0x14) {
            unsigned int v18 = 20;
          }
          else {
            unsigned int v18 = v14;
          }
          if (AddMultipleFieldsToGenericContext(a1, "bdrDeltaHot_", (uint64_t)v8, 8u, v18)) {
            goto LABEL_110;
          }
          unsigned int v19 = "ASPFTLParseBufferToCxt: bdrDeltaHot(94): Cannot add 20 elements to context";
          goto LABEL_2616;
        case 95:
          if (AddMultipleFieldsToGenericContext(a1, "numRefreshOnClockLoss", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: numRefreshOnClockLoss(95) cannot add 1 element to context";
          goto LABEL_161;
        case 96:
          if (AddMultipleFieldsToGenericContext(a1, "numRefreshOnErrNandRefreshRel", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: numRefreshOnErrNandRefreshRel(96) cannot add 1 element to context";
          goto LABEL_161;
        case 97:
          if (AddMultipleFieldsToGenericContext(a1, "numBGRefreshMoves", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: numBGRefreshMoves(97) cannot add 1 element to context";
          goto LABEL_161;
        case 98:
          if (AddMultipleFieldsToGenericContext(a1, "numBGPaddingMoves", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: numBGPaddingMoves(98) cannot add 1 element to context";
          goto LABEL_161;
        case 99:
          if (AddMultipleFieldsToGenericContext(a1, "hostWritesPhoto", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: hostWritesPhoto(99) cannot add 1 element to context";
          goto LABEL_161;
        case 100:
          if (AddMultipleFieldsToGenericContext(a1, "INDPooldFree", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: INDPooldFree(100) cannot add 1 element to context";
          goto LABEL_161;
        case 101:
          if (AddMultipleFieldsToGenericContext(a1, "INDContigCount", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: INDContigCount(101) cannot add 1 element to context";
          goto LABEL_161;
        case 102:
          if (AddMultipleFieldsToGenericContext(a1, "INDValidContigCount", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: INDValidContigCount(102) cannot add 1 element to context";
          goto LABEL_161;
        case 103:
          if (AddMultipleFieldsToGenericContext(a1, "INDMinContigSize", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: INDMinContigSize(103) cannot add 1 element to context";
          goto LABEL_161;
        case 104:
          if (AddMultipleFieldsToGenericContext(a1, "INDMaxContigSize", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: INDMaxContigSize(104) cannot add 1 element to context";
          goto LABEL_161;
        case 105:
          if (AddMultipleFieldsToGenericContext(a1, "INDAveContigSize", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: INDAveContigSize(105) cannot add 1 element to context";
          goto LABEL_161;
        case 106:
          if (AddMultipleFieldsToGenericContext(a1, "INDpoolSize", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: INDpoolSize(106) cannot add 1 element to context";
          goto LABEL_161;
        case 107:
          if (AddMultipleFieldsToGenericContext(a1, "pushSyncWrites", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: pushSyncWrites(107) cannot add 1 element to context";
          goto LABEL_161;
        case 109:
          if (AddMultipleFieldsToGenericContext(a1, "cmd_rw_hysteresis_us", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: cmd_rw_hysteresis_us(109) cannot add 1 element to context";
          goto LABEL_161;
        case 110:
          if (AddMultipleFieldsToGenericContext(a1, "photoFlowMode", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: photoFlowMode(110) cannot add 1 element to context";
          goto LABEL_161;
        case 112:
          if (AddMultipleFieldsToGenericContext(a1, "numBandsPaddedForAge", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: numBandsPaddedForAge(112) cannot add 1 element to context";
          goto LABEL_161;
        case 113:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPFTLParseBufferToCxt: bandsPerHostFlow(113): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          }
          if (v14 >= 4) {
            unsigned int v18 = 4;
          }
          else {
            unsigned int v18 = v14;
          }
          if (AddMultipleFieldsToGenericContext(a1, "bandsPerHostFlow_", (uint64_t)v8, 8u, v18)) {
            goto LABEL_110;
          }
          unsigned int v19 = "ASPFTLParseBufferToCxt: bandsPerHostFlow(113): Cannot add 4 elements to context";
          goto LABEL_2616;
        case 114:
          if (v14 != 5) {
            SetAPIErrorMessage("ASPFTLParseBufferToCxt: bandsPerSpecialFlow(114): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          }
          if (v14 >= 5) {
            unsigned int v18 = 5;
          }
          else {
            unsigned int v18 = v14;
          }
          if (AddMultipleFieldsToGenericContext(a1, "bandsPerSpecialFlow_", (uint64_t)v8, 8u, v18)) {
            goto LABEL_110;
          }
          unsigned int v19 = "ASPFTLParseBufferToCxt: bandsPerSpecialFlow(114): Cannot add 5 elements to context";
          goto LABEL_2616;
        case 115:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPFTLParseBufferToCxt: secsPerHostFlow(115): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          }
          if (v14 >= 4) {
            unsigned int v18 = 4;
          }
          else {
            unsigned int v18 = v14;
          }
          if (AddMultipleFieldsToGenericContext(a1, "secsPerHostFlow_", (uint64_t)v8, 8u, v18)) {
            goto LABEL_110;
          }
          unsigned int v19 = "ASPFTLParseBufferToCxt: secsPerHostFlow(115): Cannot add 4 elements to context";
          goto LABEL_2616;
        case 116:
          if (v14 != 5) {
            SetAPIErrorMessage("ASPFTLParseBufferToCxt: secsPerSpecialFlow(116): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          }
          if (v14 >= 5) {
            unsigned int v18 = 5;
          }
          else {
            unsigned int v18 = v14;
          }
          if (AddMultipleFieldsToGenericContext(a1, "secsPerSpecialFlow_", (uint64_t)v8, 8u, v18)) {
            goto LABEL_110;
          }
          unsigned int v19 = "ASPFTLParseBufferToCxt: secsPerSpecialFlow(116): Cannot add 5 elements to context";
          goto LABEL_2616;
        case 118:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPFTLParseBufferToCxt: overWritesPerHostFlow(118): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          }
          if (v14 >= 4) {
            unsigned int v18 = 4;
          }
          else {
            unsigned int v18 = v14;
          }
          if (AddMultipleFieldsToGenericContext(a1, "overWritesPerHostFlow_", (uint64_t)v8, 8u, v18)) {
            goto LABEL_110;
          }
          unsigned int v19 = "ASPFTLParseBufferToCxt: overWritesPerHostFlow(118): Cannot add 4 elements to context";
          goto LABEL_2616;
        case 119:
          if (v14 != 5) {
            SetAPIErrorMessage("ASPFTLParseBufferToCxt: overWritesPerSpecialFlow(119): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          }
          if (v14 >= 5) {
            unsigned int v18 = 5;
          }
          else {
            unsigned int v18 = v14;
          }
          if (AddMultipleFieldsToGenericContext(a1, "overWritesPerSpecialFlow_", (uint64_t)v8, 8u, v18)) {
            goto LABEL_110;
          }
          unsigned int v19 = "ASPFTLParseBufferToCxt: overWritesPerSpecialFlow(119): Cannot add 5 elements to context";
          goto LABEL_2616;
        case 120:
          if (v14 != 10) {
            SetAPIErrorMessage("ASPFTLParseBufferToCxt: padSectorsPerFlow(120): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          }
          if (v14 >= 0xA) {
            unsigned int v18 = 10;
          }
          else {
            unsigned int v18 = v14;
          }
          if (AddMultipleFieldsToGenericContext(a1, "padSectorsPerFlow_", (uint64_t)v8, 8u, v18)) {
            goto LABEL_110;
          }
          unsigned int v19 = "ASPFTLParseBufferToCxt: padSectorsPerFlow(120): Cannot add 10 elements to context";
          goto LABEL_2616;
        case 121:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPFTLParseBufferToCxt: padSizes(121): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          }
          if (v14 >= 4) {
            unsigned int v18 = 4;
          }
          else {
            unsigned int v18 = v14;
          }
          if (AddMultipleFieldsToGenericContext(a1, "padSizes_", (uint64_t)v8, 8u, v18)) {
            goto LABEL_110;
          }
          unsigned int v19 = "ASPFTLParseBufferToCxt: padSizes(121): Cannot add 4 elements to context";
          goto LABEL_2616;
        case 122:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPFTLParseBufferToCxt: unmapsPerHostFlow(122): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          }
          if (v14 >= 4) {
            unsigned int v18 = 4;
          }
          else {
            unsigned int v18 = v14;
          }
          if (AddMultipleFieldsToGenericContext(a1, "unmapsPerHostFlow_", (uint64_t)v8, 8u, v18)) {
            goto LABEL_110;
          }
          unsigned int v19 = "ASPFTLParseBufferToCxt: unmapsPerHostFlow(122): Cannot add 4 elements to context";
          goto LABEL_2616;
        case 123:
          if (v14 != 5) {
            SetAPIErrorMessage("ASPFTLParseBufferToCxt: unmapsPerSpecialFlow(123): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          }
          if (v14 >= 5) {
            unsigned int v18 = 5;
          }
          else {
            unsigned int v18 = v14;
          }
          if (AddMultipleFieldsToGenericContext(a1, "unmapsPerSpecialFlow_", (uint64_t)v8, 8u, v18)) {
            goto LABEL_110;
          }
          unsigned int v19 = "ASPFTLParseBufferToCxt: unmapsPerSpecialFlow(123): Cannot add 5 elements to context";
          goto LABEL_2616;
        case 124:
          if (v14 != 2) {
            SetAPIErrorMessage("ASPFTLParseBufferToCxt: coldestCycle(124): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          }
          if (v14 >= 2) {
            unsigned int v18 = 2;
          }
          else {
            unsigned int v18 = v14;
          }
          if (AddMultipleFieldsToGenericContext(a1, "coldestCycle_", (uint64_t)v8, 8u, v18)) {
            goto LABEL_110;
          }
          unsigned int v19 = "ASPFTLParseBufferToCxt: coldestCycle(124): Cannot add 2 elements to context";
          goto LABEL_2616;
        case 125:
          if (v14 != 2) {
            SetAPIErrorMessage("ASPFTLParseBufferToCxt: hottestCycle(125): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          }
          if (v14 >= 2) {
            unsigned int v18 = 2;
          }
          else {
            unsigned int v18 = v14;
          }
          if (AddMultipleFieldsToGenericContext(a1, "hottestCycle_", (uint64_t)v8, 8u, v18)) {
            goto LABEL_110;
          }
          unsigned int v19 = "ASPFTLParseBufferToCxt: hottestCycle(125): Cannot add 2 elements to context";
          goto LABEL_2616;
        case 126:
          if (AddMultipleFieldsToGenericContext(a1, "gcLonlyWrites", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: gcLonlyWrites(126) cannot add 1 element to context";
          goto LABEL_161;
        case 127:
          if (AddMultipleFieldsToGenericContext(a1, "gcPLWrites", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: gcPLWrites(127) cannot add 1 element to context";
          goto LABEL_161;
        case 129:
          if (AddMultipleFieldsToGenericContext(a1, "pagesPerVirtualBlockSlc", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: pagesPerVirtualBlockSlc(129) cannot add 1 element to context";
          goto LABEL_161;
        case 130:
          if (AddMultipleFieldsToGenericContext(a1, "bdrPadding", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: bdrPadding(130) cannot add 1 element to context";
          goto LABEL_161;
        case 131:
          if (v14 != 8) {
            SetAPIErrorMessage("ASPFTLParseBufferToCxt: errInjCounters(131): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          }
          if (v14 >= 8) {
            unsigned int v18 = 8;
          }
          else {
            unsigned int v18 = v14;
          }
          if (AddMultipleFieldsToGenericContext(a1, "errInjCounters_", (uint64_t)v8, 8u, v18)) {
            goto LABEL_110;
          }
          unsigned int v19 = "ASPFTLParseBufferToCxt: errInjCounters(131): Cannot add 8 elements to context";
          goto LABEL_2616;
        case 132:
          if (AddMultipleFieldsToGenericContext(a1, "raidSuccessfulReconstructionInternal", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: raidSuccessfulReconstructionInternal(132) cannot add 1 element to context";
          goto LABEL_161;
        case 133:
          if (AddMultipleFieldsToGenericContext(a1, "raidSuccessfulReconstructionHost", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: raidSuccessfulReconstructionHost(133) cannot add 1 element to context";
          goto LABEL_161;
        case 134:
          if (AddMultipleFieldsToGenericContext(a1, "raidFailedReconstructionInternal", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: raidFailedReconstructionInternal(134) cannot add 1 element to context";
          goto LABEL_161;
        case 135:
          if (AddMultipleFieldsToGenericContext(a1, "raidFailedReconstructionHost", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: raidFailedReconstructionHost(135) cannot add 1 element to context";
          goto LABEL_161;
        case 136:
          if (AddMultipleFieldsToGenericContext(a1, "raidBandsPerHostFlow", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: raidBandsPerHostFlow(136) cannot add 1 element to context";
          goto LABEL_161;
        case 137:
          if (AddMultipleFieldsToGenericContext(a1, "raidSecsPerHostFlow", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: raidSecsPerHostFlow(137) cannot add 1 element to context";
          goto LABEL_161;
        case 138:
          if (AddMultipleFieldsToGenericContext(a1, "gcFreeL", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: gcFreeL(138) cannot add 1 element to context";
          goto LABEL_161;
        case 139:
          if (AddMultipleFieldsToGenericContext(a1, "gcDestinations", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: gcDestinations(139) cannot add 1 element to context";
          goto LABEL_161;
        case 140:
          if (AddMultipleFieldsToGenericContext(a1, "gcFragments", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: gcFragments(140) cannot add 1 element to context";
          goto LABEL_161;
        case 141:
          if (AddMultipleFieldsToGenericContext(a1, "numMemChoke", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: numMemChoke(141) cannot add 1 element to context";
          goto LABEL_161;
        case 142:
          if (AddMultipleFieldsToGenericContext(a1, "maxMemChokeDuration", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: maxMemChokeDuration(142) cannot add 1 element to context";
          goto LABEL_161;
        case 143:
          if (AddMultipleFieldsToGenericContext(a1, "memChokeDuration", (uint64_t)v8, 8u, 1u)) {
            goto LABEL_162;
          }
          int v17 = "ASPFTLParseBufferToCxt: memChokeDuration(143) cannot add 1 element to context";
          goto LABEL_161;
        default:
          switch(v12)
          {
            case 144:
              if (AddMultipleFieldsToGenericContext(a1, "numMemExtreme", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: numMemExtreme(144) cannot add 1 element to context";
              goto LABEL_161;
            case 145:
              if (AddMultipleFieldsToGenericContext(a1, "maxMemExtremeDuration", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: maxMemExtremeDuration(145) cannot add 1 element to context";
              goto LABEL_161;
            case 146:
              if (AddMultipleFieldsToGenericContext(a1, "memExtremeDuration", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: memExtremeDuration(146) cannot add 1 element to context";
              goto LABEL_161;
            case 147:
              if (AddMultipleFieldsToGenericContext(a1, "bandGetsExtreme", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: bandGetsExtreme(147) cannot add 1 element to context";
              goto LABEL_161;
            case 148:
              if (AddMultipleFieldsToGenericContext(a1, "bandGetsLow", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: bandGetsLow(148) cannot add 1 element to context";
              goto LABEL_161;
            case 149:
              if (AddMultipleFieldsToGenericContext(a1, "numHostChoke", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: numHostChoke(149) cannot add 1 element to context";
              goto LABEL_161;
            case 152:
              if (AddMultipleFieldsToGenericContext(a1, "AbortSkip_ProgramError", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: AbortSkip_ProgramError(152) cannot add 1 element to context";
              goto LABEL_161;
            case 153:
              if (AddMultipleFieldsToGenericContext(a1, "AbortSkip_ReadErrorOpenBand", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: AbortSkip_ReadErrorOpenBand(153) cannot add 1 element to context";
              goto LABEL_161;
            case 154:
              if (AddMultipleFieldsToGenericContext(a1, "AbortSkip_FailedRebuildingParity", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: AbortSkip_FailedRebuildingParity(154) cannot add 1 element to context";
              goto LABEL_161;
            case 155:
              if (AddMultipleFieldsToGenericContext(a1, "AbortPad_OpenRefreshBand", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: AbortPad_OpenRefreshBand(155) cannot add 1 element to context";
              goto LABEL_161;
            case 156:
              if (AddMultipleFieldsToGenericContext(a1, "AbortPad_CloseBands", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: AbortPad_CloseBands(156) cannot add 1 element to context";
              goto LABEL_161;
            case 157:
              if (AddMultipleFieldsToGenericContext(a1, "AbortPad_SetPhoto", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: AbortPad_SetPhoto(157) cannot add 1 element to context";
              goto LABEL_161;
            case 158:
              if (AddMultipleFieldsToGenericContext(a1, "AbortPad_GcNoSource", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: AbortPad_GcNoSource(158) cannot add 1 element to context";
              goto LABEL_161;
            case 159:
              if (AddMultipleFieldsToGenericContext(a1, "AbortPad_Format", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: AbortPad_Format(159) cannot add 1 element to context";
              goto LABEL_161;
            case 160:
              if (AddMultipleFieldsToGenericContext(a1, "nandDiscoveryDuration", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: nandDiscoveryDuration(160) cannot add 1 element to context";
              goto LABEL_161;
            case 161:
              if (AddMultipleFieldsToGenericContext(a1, "coreCCEnableDuration", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: coreCCEnableDuration(161) cannot add 1 element to context";
              goto LABEL_161;
            case 163:
              if (AddMultipleFieldsToGenericContext(a1, "coreOpenDuration", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: coreOpenDuration(163) cannot add 1 element to context";
              goto LABEL_161;
            case 164:
              if (AddMultipleFieldsToGenericContext(a1, "coreWritableDuration", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: coreWritableDuration(164) cannot add 1 element to context";
              goto LABEL_161;
            case 165:
              if (AddMultipleFieldsToGenericContext(a1, "coreClogLoadDuration", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: coreClogLoadDuration(165) cannot add 1 element to context";
              goto LABEL_161;
            case 167:
              if (AddMultipleFieldsToGenericContext(a1, "bulkPFail", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: bulkPFail(167) cannot add 1 element to context";
              goto LABEL_161;
            case 169:
              if (AddMultipleFieldsToGenericContext(a1, "bulkRFail", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: bulkRFail(169) cannot add 1 element to context";
              goto LABEL_161;
            case 172:
              if (AddMultipleFieldsToGenericContext(a1, "raidSmartErrors", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: raidSmartErrors(172) cannot add 1 element to context";
              goto LABEL_161;
            case 182:
              if (AddMultipleFieldsToGenericContext(a1, "internalUeccs", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: internalUeccs(182) cannot add 1 element to context";
              goto LABEL_161;
            case 183:
              if (AddMultipleFieldsToGenericContext(a1, "e2eFail", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: e2eFail(183) cannot add 1 element to context";
              goto LABEL_161;
            case 184:
              if (AddMultipleFieldsToGenericContext(a1, "TempSensorMax", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: TempSensorMax(184) cannot add 1 element to context";
              goto LABEL_161;
            case 185:
              if (AddMultipleFieldsToGenericContext(a1, "TempSensorMin", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: TempSensorMin(185) cannot add 1 element to context";
              goto LABEL_161;
            case 186:
              if (AddMultipleFieldsToGenericContext(a1, "powerUpFromDDR", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: powerUpFromDDR(186) cannot add 1 element to context";
              goto LABEL_161;
            case 187:
              if (AddMultipleFieldsToGenericContext(a1, "numMemLow", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: numMemLow(187) cannot add 1 element to context";
              goto LABEL_161;
            case 188:
              if (AddMultipleFieldsToGenericContext(a1, "maxMemLowDuration", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: maxMemLowDuration(188) cannot add 1 element to context";
              goto LABEL_161;
            case 189:
              if (AddMultipleFieldsToGenericContext(a1, "memLowDuration", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: memLowDuration(189) cannot add 1 element to context";
              goto LABEL_161;
            case 190:
              if (AddMultipleFieldsToGenericContext(a1, "numFences", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: numFences(190) cannot add 1 element to context";
              goto LABEL_161;
            case 191:
              if (AddMultipleFieldsToGenericContext(a1, "hostPassiveIO", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: hostPassiveIO(191) cannot add 1 element to context";
              goto LABEL_161;
            case 192:
              if (AddMultipleFieldsToGenericContext(a1, "odtsMax", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: odtsMax(192) cannot add 1 element to context";
              goto LABEL_161;
            case 193:
              if (AddMultipleFieldsToGenericContext(a1, "defragMFromOrphans", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: defragMFromOrphans(193) cannot add 1 element to context";
              goto LABEL_161;
            case 194:
              if (AddMultipleFieldsToGenericContext(a1, "defragMFromFragments", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: defragMFromFragments(194) cannot add 1 element to context";
              goto LABEL_161;
            case 195:
              if (AddMultipleFieldsToGenericContext(a1, "defragMTime", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: defragMTime(195) cannot add 1 element to context";
              goto LABEL_161;
            case 196:
              if (AddMultipleFieldsToGenericContext(a1, "defragMMaxTime", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: defragMMaxTime(196) cannot add 1 element to context";
              goto LABEL_161;
            case 197:
              if (AddMultipleFieldsToGenericContext(a1, "raidFailedLbaMismatch", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: raidFailedLbaMismatch(197) cannot add 1 element to context";
              goto LABEL_161;
            case 198:
              if (AddMultipleFieldsToGenericContext(a1, "numSyscfgWrites", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: numSyscfgWrites(198) cannot add 1 element to context";
              goto LABEL_161;
            case 199:
              if (AddMultipleFieldsToGenericContext(a1, "indmbUnitsXfer", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: indmbUnitsXfer(199) cannot add 1 element to context";
              goto LABEL_161;
            case 200:
              if (AddMultipleFieldsToGenericContext(a1, "indmbUnitsCache", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: indmbUnitsCache(200) cannot add 1 element to context";
              goto LABEL_161;
            case 201:
              if (AddMultipleFieldsToGenericContext(a1, "indmbUnitsInd", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: indmbUnitsInd(201) cannot add 1 element to context";
              goto LABEL_161;
            case 202:
              if (AddMultipleFieldsToGenericContext(a1, "wcacheFS_Mbytes", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: wcacheFS_Mbytes(202) cannot add 1 element to context";
              goto LABEL_161;
            case 203:
              if (AddMultipleFieldsToGenericContext(a1, "wcacheDS_Mbytes", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: wcacheDS_Mbytes(203) cannot add 1 element to context";
              goto LABEL_161;
            case 204:
              if (AddMultipleFieldsToGenericContext(a1, "powerOnSeconds", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: powerOnSeconds(204) cannot add 1 element to context";
              goto LABEL_161;
            case 205:
              if (AddMultipleFieldsToGenericContext(a1, "numUnknownTokenHostRead", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: numUnknownTokenHostRead(205) cannot add 1 element to context";
              goto LABEL_161;
            case 206:
              if (AddMultipleFieldsToGenericContext(a1, "numUnmmapedTokenHostRead", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: numUnmmapedTokenHostRead(206) cannot add 1 element to context";
              goto LABEL_161;
            case 207:
              if (v14 != 16) {
                SetAPIErrorMessage("ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerLevel(207): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              }
              if (v14 >= 0x10) {
                unsigned int v18 = 16;
              }
              else {
                unsigned int v18 = v14;
              }
              if (AddMultipleFieldsToGenericContext(a1, "numOfThrottlingEntriesPerLevel_", (uint64_t)v8, 8u, v18)) {
                goto LABEL_110;
              }
              unsigned int v19 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerLevel(207): Cannot add 16 elements to context";
              goto LABEL_2616;
            case 208:
              if (AddMultipleFieldsToGenericContext(a1, "wcacheFS_MbytesMin", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesMin(208) cannot add 1 element to context";
              goto LABEL_161;
            case 209:
              if (AddMultipleFieldsToGenericContext(a1, "wcacheFS_MbytesMax", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesMax(209) cannot add 1 element to context";
              goto LABEL_161;
            case 210:
              if (AddMultipleFieldsToGenericContext(a1, "prepareForShutdownFailCounter", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: prepareForShutdownFailCounter(210) cannot add 1 element to context";
              goto LABEL_161;
            case 211:
              if (AddMultipleFieldsToGenericContext(a1, "lpsrEntry", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: lpsrEntry(211) cannot add 1 element to context";
              goto LABEL_161;
            case 212:
              if (AddMultipleFieldsToGenericContext(a1, "lpsrExit", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: lpsrExit(212) cannot add 1 element to context";
              goto LABEL_161;
            case 213:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPFTLParseBufferToCxt: crcInternalReadFail(213): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              }
              if (v14 >= 8) {
                unsigned int v18 = 8;
              }
              else {
                unsigned int v18 = v14;
              }
              if (AddMultipleFieldsToGenericContext(a1, "crcInternalReadFail_", (uint64_t)v8, 8u, v18)) {
                goto LABEL_110;
              }
              unsigned int v19 = "ASPFTLParseBufferToCxt: crcInternalReadFail(213): Cannot add 8 elements to context";
              goto LABEL_2616;
            case 214:
              if (AddMultipleFieldsToGenericContext(a1, "wcacheFSEvictCnt", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: wcacheFSEvictCnt(214) cannot add 1 element to context";
              goto LABEL_161;
            case 215:
              if (AddMultipleFieldsToGenericContext(a1, "wcacheFSEvictSize", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: wcacheFSEvictSize(215) cannot add 1 element to context";
              goto LABEL_161;
            case 216:
              if (AddMultipleFieldsToGenericContext(a1, "wcacheFSWr", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: wcacheFSWr(216) cannot add 1 element to context";
              goto LABEL_161;
            case 217:
              if (AddMultipleFieldsToGenericContext(a1, "wcacheDSWr", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: wcacheDSWr(217) cannot add 1 element to context";
              goto LABEL_161;
            case 218:
              if (v14 != 10) {
                SetAPIErrorMessage("ASPFTLParseBufferToCxt: wcacheFSEvictSizeLogDist(218): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              }
              if (v14 >= 0xA) {
                unsigned int v18 = 10;
              }
              else {
                unsigned int v18 = v14;
              }
              if (AddMultipleFieldsToGenericContext(a1, "wcacheFSEvictSizeLogDist_", (uint64_t)v8, 8u, v18)) {
                goto LABEL_110;
              }
              unsigned int v19 = "ASPFTLParseBufferToCxt: wcacheFSEvictSizeLogDist(218): Cannot add 10 elements to context";
              goto LABEL_2616;
            case 219:
              if (AddMultipleFieldsToGenericContext(a1, "prepareForShutdownTimeoutCounter", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: prepareForShutdownTimeoutCounter(219) cannot add 1 element to context";
              goto LABEL_161;
            case 220:
              if (AddMultipleFieldsToGenericContext(a1, "prepareForShutdownCancelCounter", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: prepareForShutdownCancelCounter(220) cannot add 1 element to context";
              goto LABEL_161;
            case 221:
              if (AddMultipleFieldsToGenericContext(a1, "RD_openBandCount", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: RD_openBandCount(221) cannot add 1 element to context";
              goto LABEL_161;
            case 222:
              if (AddMultipleFieldsToGenericContext(a1, "RD_openBandNops", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: RD_openBandNops(222) cannot add 1 element to context";
              goto LABEL_161;
            case 223:
              if (AddMultipleFieldsToGenericContext(a1, "RD_closedBandEvictCount", (uint64_t)v8, 8u, 1u)) {
                goto LABEL_162;
              }
              int v17 = "ASPFTLParseBufferToCxt: RD_closedBandEvictCount(223) cannot add 1 element to context";
              goto LABEL_161;
            default:
              switch(v12)
              {
                case 224:
                  if (AddMultipleFieldsToGenericContext(a1, "RD_closedBandEvictSectors", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: RD_closedBandEvictSectors(224) cannot add 1 element to context";
                  goto LABEL_161;
                case 225:
                  if (AddMultipleFieldsToGenericContext(a1, "RD_closedBandFragmentCount", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: RD_closedBandFragmentCount(225) cannot add 1 element to context";
                  goto LABEL_161;
                case 226:
                  if (AddMultipleFieldsToGenericContext(a1, "RD_closedBandFragmentSectors", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: RD_closedBandFragmentSectors(226) cannot add 1 element to context";
                  goto LABEL_161;
                case 227:
                  if (v14 != 10) {
                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: wcacheFSOverWrLogSizeCnts(227): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                  }
                  if (v14 >= 0xA) {
                    unsigned int v18 = 10;
                  }
                  else {
                    unsigned int v18 = v14;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "wcacheFSOverWrLogSizeCnts_", (uint64_t)v8, 8u, v18)) {
                    goto LABEL_110;
                  }
                  unsigned int v19 = "ASPFTLParseBufferToCxt: wcacheFSOverWrLogSizeCnts(227): Cannot add 10 elements to context";
                  goto LABEL_2616;
                case 228:
                  if (v14 != 4) {
                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: wcacheFSOverWrSizeByFlow(228): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                  }
                  if (v14 >= 4) {
                    unsigned int v18 = 4;
                  }
                  else {
                    unsigned int v18 = v14;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "wcacheFSOverWrSizeByFlow_", (uint64_t)v8, 8u, v18)) {
                    goto LABEL_110;
                  }
                  unsigned int v19 = "ASPFTLParseBufferToCxt: wcacheFSOverWrSizeByFlow(228): Cannot add 4 elements to context";
                  goto LABEL_2616;
                case 229:
                  if (v14 != 2) {
                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: indmbXferCountTo(229): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                  }
                  if (v14 >= 2) {
                    unsigned int v18 = 2;
                  }
                  else {
                    unsigned int v18 = v14;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "indmbXferCountTo_", (uint64_t)v8, 8u, v18)) {
                    goto LABEL_110;
                  }
                  unsigned int v19 = "ASPFTLParseBufferToCxt: indmbXferCountTo(229): Cannot add 2 elements to context";
                  goto LABEL_2616;
                case 230:
                  if (v14 != 2) {
                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: indmbAccumulatedTimeBetweenXfers(230): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                  }
                  if (v14 >= 2) {
                    unsigned int v18 = 2;
                  }
                  else {
                    unsigned int v18 = v14;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "indmbAccumulatedTimeBetweenXfers_", (uint64_t)v8, 8u, v18)) {
                    goto LABEL_110;
                  }
                  unsigned int v19 = "ASPFTLParseBufferToCxt: indmbAccumulatedTimeBetweenXfers(230): Cannot add 2 elements to context";
                  goto LABEL_2616;
                case 231:
                  if (AddMultipleFieldsToGenericContext(a1, "maxGracefulBootTimeMs", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: maxGracefulBootTimeMs(231) cannot add 1 element to context";
                  goto LABEL_161;
                case 232:
                  if (AddMultipleFieldsToGenericContext(a1, "maxUngracefulBootTimeMs", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: maxUngracefulBootTimeMs(232) cannot add 1 element to context";
                  goto LABEL_161;
                case 233:
                  if (AddMultipleFieldsToGenericContext(a1, "averageGracefulBootTimeMs", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: averageGracefulBootTimeMs(233) cannot add 1 element to context";
                  goto LABEL_161;
                case 234:
                  if (AddMultipleFieldsToGenericContext(a1, "averageUngracefulBootTimeMs", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: averageUngracefulBootTimeMs(234) cannot add 1 element to context";
                  goto LABEL_161;
                case 235:
                  if (v14 != 8) {
                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: gracefulBootTimeLogMs(235): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                  }
                  if (v14 >= 8) {
                    unsigned int v18 = 8;
                  }
                  else {
                    unsigned int v18 = v14;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "gracefulBootTimeLogMs_", (uint64_t)v8, 8u, v18)) {
                    goto LABEL_110;
                  }
                  unsigned int v19 = "ASPFTLParseBufferToCxt: gracefulBootTimeLogMs(235): Cannot add 8 elements to context";
                  goto LABEL_2616;
                case 236:
                  if (v14 != 8) {
                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: ungracefulBootTimeLogMs(236): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                  }
                  if (v14 >= 8) {
                    unsigned int v18 = 8;
                  }
                  else {
                    unsigned int v18 = v14;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "ungracefulBootTimeLogMs_", (uint64_t)v8, 8u, v18)) {
                    goto LABEL_110;
                  }
                  unsigned int v19 = "ASPFTLParseBufferToCxt: ungracefulBootTimeLogMs(236): Cannot add 8 elements to context";
                  goto LABEL_2616;
                case 237:
                  if (v14 != 4) {
                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: CalibrationCount(237): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                  }
                  if (v14 >= 4) {
                    unsigned int v18 = 4;
                  }
                  else {
                    unsigned int v18 = v14;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "CalibrationCount_", (uint64_t)v8, 8u, v18)) {
                    goto LABEL_110;
                  }
                  unsigned int v19 = "ASPFTLParseBufferToCxt: CalibrationCount(237): Cannot add 4 elements to context";
                  goto LABEL_2616;
                case 238:
                  if (AddMultipleFieldsToGenericContext(a1, "CalibrationLastTmp", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: CalibrationLastTmp(238) cannot add 1 element to context";
                  goto LABEL_161;
                case 239:
                  if (AddMultipleFieldsToGenericContext(a1, "CalibrationMaxTmp", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: CalibrationMaxTmp(239) cannot add 1 element to context";
                  goto LABEL_161;
                case 240:
                  if (AddMultipleFieldsToGenericContext(a1, "CalibrationMinTmp", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: CalibrationMinTmp(240) cannot add 1 element to context";
                  goto LABEL_161;
                case 241:
                  if (AddMultipleFieldsToGenericContext(a1, "ungracefulBootWorstIndicator", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: ungracefulBootWorstIndicator(241) cannot add 1 element to context";
                  goto LABEL_161;
                case 242:
                  if (AddMultipleFieldsToGenericContext(a1, "metaMismatchReread", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: metaMismatchReread(242) cannot add 1 element to context";
                  goto LABEL_161;
                case 243:
                  if (AddMultipleFieldsToGenericContext(a1, "numS3SleepOps", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: numS3SleepOps(243) cannot add 1 element to context";
                  goto LABEL_161;
                case 244:
                  if (AddMultipleFieldsToGenericContext(a1, "odtsCurrent", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: odtsCurrent(244) cannot add 1 element to context";
                  goto LABEL_161;
                case 245:
                  if (AddMultipleFieldsToGenericContext(a1, "prefetchReads", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: prefetchReads(245) cannot add 1 element to context";
                  goto LABEL_161;
                case 246:
                  if (AddMultipleFieldsToGenericContext(a1, "prefetchHits", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: prefetchHits(246) cannot add 1 element to context";
                  goto LABEL_161;
                case 247:
                  if (AddMultipleFieldsToGenericContext(a1, "prefetchWritesInvalidation", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: prefetchWritesInvalidation(247) cannot add 1 element to context";
                  goto LABEL_161;
                case 248:
                  if (AddMultipleFieldsToGenericContext(a1, "indmbUnitsTotal", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: indmbUnitsTotal(248) cannot add 1 element to context";
                  goto LABEL_161;
                case 249:
                  if (AddMultipleFieldsToGenericContext(a1, "selfThrottlingEngage", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: selfThrottlingEngage(249) cannot add 1 element to context";
                  goto LABEL_161;
                case 250:
                  if (AddMultipleFieldsToGenericContext(a1, "selfThrottlingDisengage", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: selfThrottlingDisengage(250) cannot add 1 element to context";
                  goto LABEL_161;
                case 252:
                  if (AddMultipleFieldsToGenericContext(a1, "AbortSkip_WlpMode", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: AbortSkip_WlpMode(252) cannot add 1 element to context";
                  goto LABEL_161;
                case 253:
                  if (AddMultipleFieldsToGenericContext(a1, "hostWritesWlpMode", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: hostWritesWlpMode(253) cannot add 1 element to context";
                  goto LABEL_161;
                case 254:
                  if (AddMultipleFieldsToGenericContext(a1, "numClogDoubleUnc", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: numClogDoubleUnc(254) cannot add 1 element to context";
                  goto LABEL_161;
                case 256:
                  if (AddMultipleFieldsToGenericContext(a1, "AbortPad_WlpMode", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: AbortPad_WlpMode(256) cannot add 1 element to context";
                  goto LABEL_161;
                case 257:
                  if (AddMultipleFieldsToGenericContext(a1, "bonfireIntermediateBandErases", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: bonfireIntermediateBandErases(257) cannot add 1 element to context";
                  goto LABEL_161;
                case 258:
                  if (AddMultipleFieldsToGenericContext(a1, "bonfireUserBandErases", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: bonfireUserBandErases(258) cannot add 1 element to context";
                  goto LABEL_161;
                case 259:
                  if (AddMultipleFieldsToGenericContext(a1, "bonfireIntermediateBandProgs", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: bonfireIntermediateBandProgs(259) cannot add 1 element to context";
                  goto LABEL_161;
                case 260:
                  if (AddMultipleFieldsToGenericContext(a1, "bonfireUserBandProgs", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: bonfireUserBandProgs(260) cannot add 1 element to context";
                  goto LABEL_161;
                case 261:
                  if (AddMultipleFieldsToGenericContext(a1, "bonfireIntermediatePageReads", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: bonfireIntermediatePageReads(261) cannot add 1 element to context";
                  goto LABEL_161;
                case 262:
                  if (AddMultipleFieldsToGenericContext(a1, "bonfireUserPageReads", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: bonfireUserPageReads(262) cannot add 1 element to context";
                  goto LABEL_161;
                case 263:
                  if (AddMultipleFieldsToGenericContext(a1, "refreshUtil00", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: refreshUtil00(263) cannot add 1 element to context";
                  goto LABEL_161;
                case 264:
                  if (AddMultipleFieldsToGenericContext(a1, "failToReadUtil00", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: failToReadUtil00(264) cannot add 1 element to context";
                  goto LABEL_161;
                case 265:
                  if (v14 != 5) {
                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: readCountHisto(265): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                  }
                  if (v14 >= 5) {
                    unsigned int v18 = 5;
                  }
                  else {
                    unsigned int v18 = v14;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "readCountHisto_", (uint64_t)v8, 8u, v18)) {
                    goto LABEL_110;
                  }
                  unsigned int v19 = "ASPFTLParseBufferToCxt: readCountHisto(265): Cannot add 5 elements to context";
                  goto LABEL_2616;
                case 266:
                  if (v14 != 16) {
                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: readAmpHisto(266): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                  }
                  if (v14 >= 0x10) {
                    unsigned int v18 = 16;
                  }
                  else {
                    unsigned int v18 = v14;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "readAmpHisto_", (uint64_t)v8, 8u, v18)) {
                    goto LABEL_110;
                  }
                  unsigned int v19 = "ASPFTLParseBufferToCxt: readAmpHisto(266): Cannot add 16 elements to context";
                  goto LABEL_2616;
                case 267:
                  if (AddMultipleFieldsToGenericContext(a1, "totalReadAmp", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: totalReadAmp(267) cannot add 1 element to context";
                  goto LABEL_161;
                case 268:
                  if (v14 != 4) {
                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: nvmeModeSelect(268): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                  }
                  if (v14 >= 4) {
                    unsigned int v18 = 4;
                  }
                  else {
                    unsigned int v18 = v14;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "nvmeModeSelect_", (uint64_t)v8, 8u, v18)) {
                    goto LABEL_110;
                  }
                  unsigned int v19 = "ASPFTLParseBufferToCxt: nvmeModeSelect(268): Cannot add 4 elements to context";
                  goto LABEL_2616;
                case 269:
                  if (v14 != 8) {
                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: numBootBlockRefreshSuccess(269): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                  }
                  if (v14 >= 8) {
                    unsigned int v18 = 8;
                  }
                  else {
                    unsigned int v18 = v14;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "numBootBlockRefreshSuccess_", (uint64_t)v8, 8u, v18)) {
                    goto LABEL_110;
                  }
                  unsigned int v19 = "ASPFTLParseBufferToCxt: numBootBlockRefreshSuccess(269): Cannot add 8 elements to context";
                  goto LABEL_2616;
                case 270:
                  if (v14 != 8) {
                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: numBootBlockRefreshFail(270): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                  }
                  if (v14 >= 8) {
                    unsigned int v18 = 8;
                  }
                  else {
                    unsigned int v18 = v14;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "numBootBlockRefreshFail_", (uint64_t)v8, 8u, v18)) {
                    goto LABEL_110;
                  }
                  unsigned int v19 = "ASPFTLParseBufferToCxt: numBootBlockRefreshFail(270): Cannot add 8 elements to context";
                  goto LABEL_2616;
                case 271:
                  if (AddMultipleFieldsToGenericContext(a1, "numUnsupportedAsi", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: numUnsupportedAsi(271) cannot add 1 element to context";
                  goto LABEL_161;
                case 272:
                  if (AddMultipleFieldsToGenericContext(a1, "NumTerminatedProgramSegs", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: NumTerminatedProgramSegs(272) cannot add 1 element to context";
                  goto LABEL_161;
                case 273:
                  if (AddMultipleFieldsToGenericContext(a1, "indParityPagesDrops", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: indParityPagesDrops(273) cannot add 1 element to context";
                  goto LABEL_161;
                case 274:
                  if (AddMultipleFieldsToGenericContext(a1, "indFlowPrograms", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: indFlowPrograms(274) cannot add 1 element to context";
                  goto LABEL_161;
                case 277:
                  if (v14 != 4) {
                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: powerBudgetSelect(277): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                  }
                  if (v14 >= 4) {
                    unsigned int v18 = 4;
                  }
                  else {
                    unsigned int v18 = v14;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "powerBudgetSelect_", (uint64_t)v8, 8u, v18)) {
                    goto LABEL_110;
                  }
                  unsigned int v19 = "ASPFTLParseBufferToCxt: powerBudgetSelect(277): Cannot add 4 elements to context";
                  goto LABEL_2616;
                case 279:
                  if (AddMultipleFieldsToGenericContext(a1, "RxBurnNandWrites", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: RxBurnNandWrites(279) cannot add 1 element to context";
                  goto LABEL_161;
                case 280:
                  if (v14 != 12) {
                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: E2EDPErrorCounters(280): (#12) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                  }
                  if (v14 >= 0xC) {
                    unsigned int v18 = 12;
                  }
                  else {
                    unsigned int v18 = v14;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "E2EDPErrorCounters_", (uint64_t)v8, 8u, v18)) {
                    goto LABEL_110;
                  }
                  unsigned int v19 = "ASPFTLParseBufferToCxt: E2EDPErrorCounters(280): Cannot add 12 elements to context";
                  goto LABEL_2616;
                case 281:
                  if (AddMultipleFieldsToGenericContext(a1, "wcacheSectorsMax", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: wcacheSectorsMax(281) cannot add 1 element to context";
                  goto LABEL_161;
                case 282:
                  if (AddMultipleFieldsToGenericContext(a1, "wcacheSectorsMin", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: wcacheSectorsMin(282) cannot add 1 element to context";
                  goto LABEL_161;
                case 283:
                  if (AddMultipleFieldsToGenericContext(a1, "wcacheSectorsCur", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: wcacheSectorsCur(283) cannot add 1 element to context";
                  goto LABEL_161;
                case 284:
                  if (AddMultipleFieldsToGenericContext(a1, "wcacheDS_SectorsMax", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsMax(284) cannot add 1 element to context";
                  goto LABEL_161;
                case 285:
                  if (AddMultipleFieldsToGenericContext(a1, "wcacheDS_SectorsMin", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsMin(285) cannot add 1 element to context";
                  goto LABEL_161;
                case 286:
                  if (AddMultipleFieldsToGenericContext(a1, "wcacheDS_SectorsCur", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsCur(286) cannot add 1 element to context";
                  goto LABEL_161;
                case 287:
                  if (AddMultipleFieldsToGenericContext(a1, "wcacheFS_Reads", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: wcacheFS_Reads(287) cannot add 1 element to context";
                  goto LABEL_161;
                case 288:
                  if (AddMultipleFieldsToGenericContext(a1, "wcacheDS_Reads", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: wcacheDS_Reads(288) cannot add 1 element to context";
                  goto LABEL_161;
                case 289:
                  if (v14 != 32) {
                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: mspBootBlockReadFail(289): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                  }
                  if (v14 >= 0x20) {
                    unsigned int v18 = 32;
                  }
                  else {
                    unsigned int v18 = v14;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "mspBootBlockReadFail_", (uint64_t)v8, 8u, v18)) {
                    goto LABEL_110;
                  }
                  unsigned int v19 = "ASPFTLParseBufferToCxt: mspBootBlockReadFail(289): Cannot add 32 elements to context";
                  goto LABEL_2616;
                case 290:
                  if (v14 != 32) {
                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: mspBootBlockProgFail(290): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                  }
                  if (v14 >= 0x20) {
                    unsigned int v18 = 32;
                  }
                  else {
                    unsigned int v18 = v14;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "mspBootBlockProgFail_", (uint64_t)v8, 8u, v18)) {
                    goto LABEL_110;
                  }
                  unsigned int v19 = "ASPFTLParseBufferToCxt: mspBootBlockProgFail(290): Cannot add 32 elements to context";
                  goto LABEL_2616;
                case 291:
                  if (v14 != 32) {
                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: mspBootBlockEraseFail(291): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                  }
                  if (v14 >= 0x20) {
                    unsigned int v18 = 32;
                  }
                  else {
                    unsigned int v18 = v14;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "mspBootBlockEraseFail_", (uint64_t)v8, 8u, v18)) {
                    goto LABEL_110;
                  }
                  unsigned int v19 = "ASPFTLParseBufferToCxt: mspBootBlockEraseFail(291): Cannot add 32 elements to context";
                  goto LABEL_2616;
                case 292:
                  if (AddMultipleFieldsToGenericContext(a1, "bandsRefreshedOnError", (uint64_t)v8, 8u, 1u)) {
                    goto LABEL_162;
                  }
                  int v17 = "ASPFTLParseBufferToCxt: bandsRefreshedOnError(292) cannot add 1 element to context";
                  goto LABEL_161;
                default:
                  switch(v12)
                  {
                    case 298:
                      if (v14 != 2) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: perHostReads(298): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 2) {
                        unsigned int v18 = 2;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "perHostReads_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: perHostReads(298): Cannot add 2 elements to context";
                      goto LABEL_2616;
                    case 299:
                      if (v14 != 2) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: perHostReadXacts(299): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 2) {
                        unsigned int v18 = 2;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "perHostReadXacts_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: perHostReadXacts(299): Cannot add 2 elements to context";
                      goto LABEL_2616;
                    case 300:
                      if (v14 != 2) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: perHostWrites(300): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 2) {
                        unsigned int v18 = 2;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "perHostWrites_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: perHostWrites(300): Cannot add 2 elements to context";
                      goto LABEL_2616;
                    case 301:
                      if (v14 != 2) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: perHostWriteXacts(301): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 2) {
                        unsigned int v18 = 2;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "perHostWriteXacts_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: perHostWriteXacts(301): Cannot add 2 elements to context";
                      goto LABEL_2616;
                    case 302:
                      if (v14 != 2) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: perHostNumFlushes(302): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 2) {
                        unsigned int v18 = 2;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "perHostNumFlushes_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: perHostNumFlushes(302): Cannot add 2 elements to context";
                      goto LABEL_2616;
                    case 303:
                      if (v14 != 2) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: perHostNumFences(303): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 2) {
                        unsigned int v18 = 2;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "perHostNumFences_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: perHostNumFences(303): Cannot add 2 elements to context";
                      goto LABEL_2616;
                    case 304:
                      if (v14 != 10) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: commitPadSectorsPerFlow(304): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 0xA) {
                        unsigned int v18 = 10;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "commitPadSectorsPerFlow_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: commitPadSectorsPerFlow(304): Cannot add 10 elements to context";
                      goto LABEL_2616;
                    case 305:
                      if (v14 != 10) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: wcacheDSOverWrLogSizeCnts(305): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 0xA) {
                        unsigned int v18 = 10;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "wcacheDSOverWrLogSizeCnts_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: wcacheDSOverWrLogSizeCnts(305): Cannot add 10 elements to context";
                      goto LABEL_2616;
                    case 306:
                      if (v14 != 4) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: wcacheDSOverWrSizeByFlow(306): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 4) {
                        unsigned int v18 = 4;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "wcacheDSOverWrSizeByFlow_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: wcacheDSOverWrSizeByFlow(306): Cannot add 4 elements to context";
                      goto LABEL_2616;
                    case 307:
                      if (v14 != 10) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: CmdRaisePrioiryEvents(307): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 0xA) {
                        unsigned int v18 = 10;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "CmdRaisePrioiryEvents_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: CmdRaisePrioiryEvents(307): Cannot add 10 elements to context";
                      goto LABEL_2616;
                    case 308:
                      if (AddMultipleFieldsToGenericContext(a1, "utilNumVerification", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: utilNumVerification(308) cannot add 1 element to context";
                      goto LABEL_161;
                    case 309:
                      if (AddMultipleFieldsToGenericContext(a1, "utilRefreshes", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: utilRefreshes(309) cannot add 1 element to context";
                      goto LABEL_161;
                    case 310:
                      if (AddMultipleFieldsToGenericContext(a1, "utilBDRErrors", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: utilBDRErrors(310) cannot add 1 element to context";
                      goto LABEL_161;
                    case 311:
                      if (AddMultipleFieldsToGenericContext(a1, "indBandsPerFlow", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: indBandsPerFlow(311) cannot add 1 element to context";
                      goto LABEL_161;
                    case 312:
                      if (AddMultipleFieldsToGenericContext(a1, "secsPerIndFlow", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: secsPerIndFlow(312) cannot add 1 element to context";
                      goto LABEL_161;
                    case 313:
                      if (AddMultipleFieldsToGenericContext(a1, "indDecodedECC", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: indDecodedECC(313) cannot add 1 element to context";
                      goto LABEL_161;
                    case 314:
                      if (v14 != 8) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: numBootBlockValidateSuccess(314): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 8) {
                        unsigned int v18 = 8;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "numBootBlockValidateSuccess_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: numBootBlockValidateSuccess(314): Cannot add 8 elements to context";
                      goto LABEL_2616;
                    case 315:
                      if (v14 != 8) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: numBootBlockValidateFail(315): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 8) {
                        unsigned int v18 = 8;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "numBootBlockValidateFail_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: numBootBlockValidateFail(315): Cannot add 8 elements to context";
                      goto LABEL_2616;
                    case 316:
                      if (v14 != 4) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: clogPagesFillingPercentage(316): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 4) {
                        unsigned int v18 = 4;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "clogPagesFillingPercentage_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: clogPagesFillingPercentage(316): Cannot add 4 elements to context";
                      goto LABEL_2616;
                    case 317:
                      if (AddMultipleFieldsToGenericContext(a1, "bdrCalTimeAccFactor", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: bdrCalTimeAccFactor(317) cannot add 1 element to context";
                      goto LABEL_161;
                    case 318:
                      if (AddMultipleFieldsToGenericContext(a1, "bootChainRdError", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: bootChainRdError(318) cannot add 1 element to context";
                      goto LABEL_161;
                    case 319:
                      if (AddMultipleFieldsToGenericContext(a1, "bootChainBlankError", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: bootChainBlankError(319) cannot add 1 element to context";
                      goto LABEL_161;
                    case 320:
                      if (AddMultipleFieldsToGenericContext(a1, "bootChainRefreshError", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: bootChainRefreshError(320) cannot add 1 element to context";
                      goto LABEL_161;
                    case 321:
                      if (AddMultipleFieldsToGenericContext(a1, "bootChainVersionError", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: bootChainVersionError(321) cannot add 1 element to context";
                      goto LABEL_161;
                    case 322:
                      if (AddMultipleFieldsToGenericContext(a1, "mspBootBlockMismatch", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: mspBootBlockMismatch(322) cannot add 1 element to context";
                      goto LABEL_161;
                    case 323:
                      if (AddMultipleFieldsToGenericContext(a1, "mspBootBlockMismatchErr", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: mspBootBlockMismatchErr(323) cannot add 1 element to context";
                      goto LABEL_161;
                    case 324:
                      if (v14 != 5) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: bitflipAddr(324): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 5) {
                        unsigned int v18 = 5;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "bitflipAddr_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: bitflipAddr(324): Cannot add 5 elements to context";
                      goto LABEL_2616;
                    case 325:
                      if (v14 != 5) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: bitflipCount(325): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 5) {
                        unsigned int v18 = 5;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "bitflipCount_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: bitflipCount(325): Cannot add 5 elements to context";
                      goto LABEL_2616;
                    case 326:
                      if (v14 != 5) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: bitflipDupes(326): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 5) {
                        unsigned int v18 = 5;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "bitflipDupes_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: bitflipDupes(326): Cannot add 5 elements to context";
                      goto LABEL_2616;
                    case 327:
                      if (v14 != 30) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: bandsMaxTempHisto(327): (#30) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 0x1E) {
                        unsigned int v18 = 30;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "bandsMaxTempHisto_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: bandsMaxTempHisto(327): Cannot add 30 elements to context";
                      goto LABEL_2616;
                    case 328:
                      if (v14 != 30) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: bandsMinTempHisto(328): (#30) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 0x1E) {
                        unsigned int v18 = 30;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "bandsMinTempHisto_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: bandsMinTempHisto(328): Cannot add 30 elements to context";
                      goto LABEL_2616;
                    case 329:
                      if (v14 != 30) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: bandsLifeTimeTempHisto(329): (#30) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 0x1E) {
                        unsigned int v18 = 30;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "bandsLifeTimeTempHisto_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: bandsLifeTimeTempHisto(329): Cannot add 30 elements to context";
                      goto LABEL_2616;
                    case 330:
                      if (v14 != 22) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: bandsDeltaTempHisto(330): (#22) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 0x16) {
                        unsigned int v18 = 22;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "bandsDeltaTempHisto_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: bandsDeltaTempHisto(330): Cannot add 22 elements to context";
                      goto LABEL_2616;
                    case 331:
                      if (v14 != 45) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: bandsCrossTempHisto(331): (#45) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 0x2D) {
                        unsigned int v18 = 45;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "bandsCrossTempHisto_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: bandsCrossTempHisto(331): Cannot add 45 elements to context";
                      goto LABEL_2616;
                    case 332:
                      if (v14 != 10) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: wcacheWaitLogMs(332): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 0xA) {
                        unsigned int v18 = 10;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "wcacheWaitLogMs_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: wcacheWaitLogMs(332): Cannot add 10 elements to context";
                      goto LABEL_2616;
                    case 333:
                      if (v14 != 10) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: wcacheDS_segsSortedLogSize(333): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 0xA) {
                        unsigned int v18 = 10;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "wcacheDS_segsSortedLogSize_", (uint64_t)v8, 8u, v18)) {
                        goto LABEL_110;
                      }
                      unsigned int v19 = "ASPFTLParseBufferToCxt: wcacheDS_segsSortedLogSize(333): Cannot add 10 elements to context";
                      goto LABEL_2616;
                    case 334:
                      if (AddMultipleFieldsToGenericContext(a1, "numFirmwareWrites", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: numFirmwareWrites(334) cannot add 1 element to context";
                      goto LABEL_161;
                    case 335:
                      if (AddMultipleFieldsToGenericContext(a1, "numBisWrites", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: numBisWrites(335) cannot add 1 element to context";
                      goto LABEL_161;
                    case 336:
                      if (AddMultipleFieldsToGenericContext(a1, "numBootChainUpdates", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: numBootChainUpdates(336) cannot add 1 element to context";
                      goto LABEL_161;
                    case 337:
                      if (AddMultipleFieldsToGenericContext(a1, "cntCalTimeWentBackWard", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: cntCalTimeWentBackWard(337) cannot add 1 element to context";
                      goto LABEL_161;
                    case 338:
                      if (AddMultipleFieldsToGenericContext(a1, "indBoRecoveries", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: indBoRecoveries(338) cannot add 1 element to context";
                      goto LABEL_161;
                    case 340:
                      if (AddMultipleFieldsToGenericContext(a1, "numCrossTempUecc", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: numCrossTempUecc(340) cannot add 1 element to context";
                      goto LABEL_161;
                    case 341:
                      if (AddMultipleFieldsToGenericContext(a1, "latencyMonitorError", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: latencyMonitorError(341) cannot add 1 element to context";
                      goto LABEL_161;
                    case 343:
                      if (AddMultipleFieldsToGenericContext(a1, "utilUeccReads", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: utilUeccReads(343) cannot add 1 element to context";
                      goto LABEL_161;
                    case 344:
                      if (AddMultipleFieldsToGenericContext(a1, "numOfAvoidedGCDueToTemp", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: numOfAvoidedGCDueToTemp(344) cannot add 1 element to context";
                      goto LABEL_161;
                    case 345:
                      if (AddMultipleFieldsToGenericContext(a1, "forceShutdowns", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: forceShutdowns(345) cannot add 1 element to context";
                      goto LABEL_161;
                    case 346:
                      if (AddMultipleFieldsToGenericContext(a1, "gcSlcDestinations", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: gcSlcDestinations(346) cannot add 1 element to context";
                      goto LABEL_161;
                    case 347:
                      if (AddMultipleFieldsToGenericContext(a1, "indReplayExtUsed", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: indReplayExtUsed(347) cannot add 1 element to context";
                      goto LABEL_161;
                    case 348:
                      if (AddMultipleFieldsToGenericContext(a1, "defectsPerPackageOverflow", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: defectsPerPackageOverflow(348) cannot add 1 element to context";
                      goto LABEL_161;
                    case 349:
                      if (AddMultipleFieldsToGenericContext(a1, "RxBurnIntBandsProgrammed", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: RxBurnIntBandsProgrammed(349) cannot add 1 element to context";
                      goto LABEL_161;
                    case 350:
                      if (AddMultipleFieldsToGenericContext(a1, "RxBurnUsrBandsProgrammed", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: RxBurnUsrBandsProgrammed(350) cannot add 1 element to context";
                      goto LABEL_161;
                    case 351:
                      if (AddMultipleFieldsToGenericContext(a1, "RxBurnIntNandWrites", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: RxBurnIntNandWrites(351) cannot add 1 element to context";
                      goto LABEL_161;
                    case 352:
                      if (AddMultipleFieldsToGenericContext(a1, "RxBurnUsrNandWrites", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: RxBurnUsrNandWrites(352) cannot add 1 element to context";
                      goto LABEL_161;
                    case 353:
                      if (AddMultipleFieldsToGenericContext(a1, "clogLastStripeUeccs", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: clogLastStripeUeccs(353) cannot add 1 element to context";
                      goto LABEL_161;
                    case 354:
                      if (AddMultipleFieldsToGenericContext(a1, "GC_MidDestSrcSwitchSLC2TLC", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: GC_MidDestSrcSwitchSLC2TLC(354) cannot add 1 element to context";
                      goto LABEL_161;
                    case 355:
                      if (AddMultipleFieldsToGenericContext(a1, "GC_MidDestSrcSwitchTLC2SLC", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: GC_MidDestSrcSwitchTLC2SLC(355) cannot add 1 element to context";
                      goto LABEL_161;
                    case 356:
                      if (AddMultipleFieldsToGenericContext(a1, "nvme_stats_shutdown_count_host0_normal", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                      int v17 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host0_normal(356) cannot add 1 element to context";
                      }
                      goto LABEL_161;
                    case 357:
                      if (AddMultipleFieldsToGenericContext(a1, "nvme_stats_shutdown_count_host1_normal", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                      int v17 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host1_normal(357) cannot add 1 element to context";
                      }
                      goto LABEL_161;
                    case 358:
                      if (AddMultipleFieldsToGenericContext(a1, "nvme_stats_shutdown_count_host0_s2r", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                      int v17 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host0_s2r(358) cannot add 1 element to context";
                      }
                      goto LABEL_161;
                    case 359:
                      if (AddMultipleFieldsToGenericContext(a1, "nvme_stats_shutdown_count_host1_s2r", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                      int v17 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host1_s2r(359) cannot add 1 element to context";
                      }
                      goto LABEL_161;
                    case 360:
                      if (v14 != 16) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: gcPDusterIntrSrcValidityHisto(360): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 0x10) {
                        unsigned int v18 = 16;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "gcPDusterIntrSrcValidityHisto_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                      unsigned int v19 = "ASPFTLParseBufferToCxt: gcPDusterIntrSrcValidityHisto(360): Cannot add 16 elements to context";
                      }
                      goto LABEL_2616;
                    case 361:
                      if (v14 != 16) {
                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: gcPDusterUserSrcValidityHisto(361): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      }
                      if (v14 >= 0x10) {
                        unsigned int v18 = 16;
                      }
                      else {
                        unsigned int v18 = v14;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "gcPDusterUserSrcValidityHisto_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                      unsigned int v19 = "ASPFTLParseBufferToCxt: gcPDusterUserSrcValidityHisto(361): Cannot add 16 elements to context";
                      }
                      goto LABEL_2616;
                    case 362:
                      if (AddMultipleFieldsToGenericContext(a1, "raidFailedReadParity", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: raidFailedReadParity(362) cannot add 1 element to context";
                      goto LABEL_161;
                    case 364:
                      if (AddMultipleFieldsToGenericContext(a1, "lhotNumSkipes", (uint64_t)v8, 8u, 1u)) {
                        goto LABEL_162;
                      }
                      int v17 = "ASPFTLParseBufferToCxt: lhotNumSkipes(364) cannot add 1 element to context";
                      goto LABEL_161;
                    default:
                      switch(v12)
                      {
                        case 365:
                          if (AddMultipleFieldsToGenericContext(a1, "lhotNumIsHotCalls", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: lhotNumIsHotCalls(365) cannot add 1 element to context";
                          goto LABEL_161;
                        case 366:
                          if (AddMultipleFieldsToGenericContext(a1, "lhotFullLap", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: lhotFullLap(366) cannot add 1 element to context";
                          goto LABEL_161;
                        case 367:
                          if (AddMultipleFieldsToGenericContext(a1, "lhotSkipPrecent", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: lhotSkipPrecent(367) cannot add 1 element to context";
                          goto LABEL_161;
                        case 368:
                          if (AddMultipleFieldsToGenericContext(a1, "eraseSuspendEvents", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: eraseSuspendEvents(368) cannot add 1 element to context";
                          goto LABEL_161;
                        case 369:
                          if (AddMultipleFieldsToGenericContext(a1, "eraseSuspendedStatuses", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: eraseSuspendedStatuses(369) cannot add 1 element to context";
                          goto LABEL_161;
                        case 370:
                          if (AddMultipleFieldsToGenericContext(a1, "eraseSuspendedBands", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: eraseSuspendedBands(370) cannot add 1 element to context";
                          goto LABEL_161;
                        case 371:
                          if (AddMultipleFieldsToGenericContext(a1, "eraseSuspendSituationsBelowThreshold", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                          int v17 = "ASPFTLParseBufferToCxt: eraseSuspendSituationsBelowThreshold(371) cannot add 1 element to context";
                          }
                          goto LABEL_161;
                        case 372:
                          if (AddMultipleFieldsToGenericContext(a1, "eraseSuspendSituationsAboveThreshold", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                          int v17 = "ASPFTLParseBufferToCxt: eraseSuspendSituationsAboveThreshold(372) cannot add 1 element to context";
                          }
                          goto LABEL_161;
                        case 373:
                          if (AddMultipleFieldsToGenericContext(a1, "eraseSuspendReadChainsProcessed", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                          int v17 = "ASPFTLParseBufferToCxt: eraseSuspendReadChainsProcessed(373) cannot add 1 element to context";
                          }
                          goto LABEL_161;
                        case 374:
                          if (AddMultipleFieldsToGenericContext(a1, "bdrLastDoneHr", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: bdrLastDoneHr(374) cannot add 1 element to context";
                          goto LABEL_161;
                        case 375:
                          if (AddMultipleFieldsToGenericContext(a1, "bdrBackupThreshHrs", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: bdrBackupThreshHrs(375) cannot add 1 element to context";
                          goto LABEL_161;
                        case 376:
                          if (AddMultipleFieldsToGenericContext(a1, "clogPortableProgBufs", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: clogPortableProgBufs(376) cannot add 1 element to context";
                          goto LABEL_161;
                        case 377:
                          if (AddMultipleFieldsToGenericContext(a1, "clogPortableDropBufs", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: clogPortableDropBufs(377) cannot add 1 element to context";
                          goto LABEL_161;
                        case 378:
                          if (AddMultipleFieldsToGenericContext(a1, "clogPortablePadSectors", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: clogPortablePadSectors(378) cannot add 1 element to context";
                          goto LABEL_161;
                        case 379:
                          if (AddMultipleFieldsToGenericContext(a1, "numRetiredBlocks", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: numRetiredBlocks(379) cannot add 1 element to context";
                          goto LABEL_161;
                        case 381:
                          if (AddMultipleFieldsToGenericContext(a1, "numRefreshOnErrNandRefreshPerf", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                          int v17 = "ASPFTLParseBufferToCxt: numRefreshOnErrNandRefreshPerf(381) cannot add 1 element to context";
                          }
                          goto LABEL_161;
                        case 382:
                          if (AddMultipleFieldsToGenericContext(a1, "raidReconstructReads", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: raidReconstructReads(382) cannot add 1 element to context";
                          goto LABEL_161;
                        case 383:
                          if (AddMultipleFieldsToGenericContext(a1, "gcReadsNoBlog", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: gcReadsNoBlog(383) cannot add 1 element to context";
                          goto LABEL_161;
                        case 384:
                          if (AddMultipleFieldsToGenericContext(a1, "AbortSkip_MPBXReadVerifyClosedBand", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                          int v17 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXReadVerifyClosedBand(384) cannot add 1 element to context";
                          }
                          goto LABEL_161;
                        case 385:
                          if (AddMultipleFieldsToGenericContext(a1, "openBandReadFail", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: openBandReadFail(385) cannot add 1 element to context";
                          goto LABEL_161;
                        case 386:
                          if (AddMultipleFieldsToGenericContext(a1, "AbortSkip_MPBXReadVerifyOpenBand", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                          int v17 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXReadVerifyOpenBand(386) cannot add 1 element to context";
                          }
                          goto LABEL_161;
                        case 387:
                          if (AddMultipleFieldsToGenericContext(a1, "AbortSkip_MBPXFailedRebuildingParity", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                          int v17 = "ASPFTLParseBufferToCxt: AbortSkip_MBPXFailedRebuildingParity(387) cannot add 1 element to context";
                          }
                          goto LABEL_161;
                        case 388:
                          if (AddMultipleFieldsToGenericContext(a1, "raidSuccessfulPMXReconstructionInternal", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                          int v17 = "ASPFTLParseBufferToCxt: raidSuccessfulPMXReconstructionInternal(388) cannot add 1 element to context";
                          }
                          goto LABEL_161;
                        case 389:
                          if (AddMultipleFieldsToGenericContext(a1, "raidSuccessfulPMXReconstructionHost", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                          int v17 = "ASPFTLParseBufferToCxt: raidSuccessfulPMXReconstructionHost(389) cannot add 1 element to context";
                          }
                          goto LABEL_161;
                        case 390:
                          if (AddMultipleFieldsToGenericContext(a1, "raidFailedPMXReconstructionInternal", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                          int v17 = "ASPFTLParseBufferToCxt: raidFailedPMXReconstructionInternal(390) cannot add 1 element to context";
                          }
                          goto LABEL_161;
                        case 391:
                          if (AddMultipleFieldsToGenericContext(a1, "raidFailedPMXReconstructionHost", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                          int v17 = "ASPFTLParseBufferToCxt: raidFailedPMXReconstructionHost(391) cannot add 1 element to context";
                          }
                          goto LABEL_161;
                        case 392:
                          if (AddMultipleFieldsToGenericContext(a1, "raidSuccessfulRMXReconstructionInternal", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                          int v17 = "ASPFTLParseBufferToCxt: raidSuccessfulRMXReconstructionInternal(392) cannot add 1 element to context";
                          }
                          goto LABEL_161;
                        case 393:
                          if (AddMultipleFieldsToGenericContext(a1, "raidSuccessfulRMXReconstructionHost", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                          int v17 = "ASPFTLParseBufferToCxt: raidSuccessfulRMXReconstructionHost(393) cannot add 1 element to context";
                          }
                          goto LABEL_161;
                        case 394:
                          if (AddMultipleFieldsToGenericContext(a1, "raidFailedRMXReconstructionInternal", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                          int v17 = "ASPFTLParseBufferToCxt: raidFailedRMXReconstructionInternal(394) cannot add 1 element to context";
                          }
                          goto LABEL_161;
                        case 395:
                          if (AddMultipleFieldsToGenericContext(a1, "raidFailedRMXReconstructionHost", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                          int v17 = "ASPFTLParseBufferToCxt: raidFailedRMXReconstructionHost(395) cannot add 1 element to context";
                          }
                          goto LABEL_161;
                        case 396:
                          if (AddMultipleFieldsToGenericContext(a1, "raidFailedReadParityInternal", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                          int v17 = "ASPFTLParseBufferToCxt: raidFailedReadParityInternal(396) cannot add 1 element to context";
                          }
                          goto LABEL_161;
                        case 397:
                          if (AddMultipleFieldsToGenericContext(a1, "raidFailedReadQParityInternal", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                          int v17 = "ASPFTLParseBufferToCxt: raidFailedReadQParityInternal(397) cannot add 1 element to context";
                          }
                          goto LABEL_161;
                        case 398:
                          if (AddMultipleFieldsToGenericContext(a1, "raidFailedReadQParity", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: raidFailedReadQParity(398) cannot add 1 element to context";
                          goto LABEL_161;
                        case 399:
                          if (AddMultipleFieldsToGenericContext(a1, "raidFailedReadQCopy", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: raidFailedReadQCopy(399) cannot add 1 element to context";
                          goto LABEL_161;
                        case 400:
                          if (AddMultipleFieldsToGenericContext(a1, "raidFailedReconstructionQParity", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                          int v17 = "ASPFTLParseBufferToCxt: raidFailedReconstructionQParity(400) cannot add 1 element to context";
                          }
                          goto LABEL_161;
                        case 401:
                          if (AddMultipleFieldsToGenericContext(a1, "offlineBlocksCnt", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: offlineBlocksCnt(401) cannot add 1 element to context";
                          goto LABEL_161;
                        case 402:
                          if (AddMultipleFieldsToGenericContext(a1, "bork0Revectors", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: bork0Revectors(402) cannot add 1 element to context";
                          goto LABEL_161;
                        case 403:
                          if (AddMultipleFieldsToGenericContext(a1, "raidFailedReadBlog", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: raidFailedReadBlog(403) cannot add 1 element to context";
                          goto LABEL_161;
                        case 404:
                          if (AddMultipleFieldsToGenericContext(a1, "numReliabilityRefreshes", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: numReliabilityRefreshes(404) cannot add 1 element to context";
                          goto LABEL_161;
                        case 405:
                          if (AddMultipleFieldsToGenericContext(a1, "raidFailedReadQCopyInternal", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                          int v17 = "ASPFTLParseBufferToCxt: raidFailedReadQCopyInternal(405) cannot add 1 element to context";
                          }
                          goto LABEL_161;
                        case 406:
                          if (v14 != 5) {
                            SetAPIErrorMessage("ASPFTLParseBufferToCxt: raidReconstructSuccessFlow(406): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                          }
                          if (v14 >= 5) {
                            unsigned int v18 = 5;
                          }
                          else {
                            unsigned int v18 = v14;
                          }
                          if (AddMultipleFieldsToGenericContext(a1, "raidReconstructSuccessFlow_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                          unsigned int v19 = "ASPFTLParseBufferToCxt: raidReconstructSuccessFlow(406): Cannot add 5 elements to context";
                          }
                          goto LABEL_2616;
                        case 407:
                          if (v14 != 5) {
                            SetAPIErrorMessage("ASPFTLParseBufferToCxt: raidReconstructFailFlow(407): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                          }
                          if (v14 >= 5) {
                            unsigned int v18 = 5;
                          }
                          else {
                            unsigned int v18 = v14;
                          }
                          if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailFlow_", (uint64_t)v8, 8u, v18)) {
                            goto LABEL_110;
                          }
                          unsigned int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailFlow(407): Cannot add 5 elements to context";
                          goto LABEL_2616;
                        case 408:
                          if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailP", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: raidReconstructFailP(408) cannot add 1 element to context";
                          goto LABEL_161;
                        case 409:
                          if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailQ", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: raidReconstructFailQ(409) cannot add 1 element to context";
                          goto LABEL_161;
                        case 410:
                          if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailUECC", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: raidReconstructFailUECC(410) cannot add 1 element to context";
                          goto LABEL_161;
                        case 411:
                          if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailUnsupp", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: raidReconstructFailUnsupp(411) cannot add 1 element to context";
                          goto LABEL_161;
                        case 412:
                          if (AddMultipleFieldsToGenericContext(a1, "raidUECCOpenBand", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: raidUECCOpenBand(412) cannot add 1 element to context";
                          goto LABEL_161;
                        case 414:
                          if (AddMultipleFieldsToGenericContext(a1, "ueccReads", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: ueccReads(414) cannot add 1 element to context";
                          goto LABEL_161;
                        case 416:
                          if (AddMultipleFieldsToGenericContext(a1, "raidSuccessfulVerify", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: raidSuccessfulVerify(416) cannot add 1 element to context";
                          goto LABEL_161;
                        case 417:
                          if (AddMultipleFieldsToGenericContext(a1, "raidFailedVerify", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: raidFailedVerify(417) cannot add 1 element to context";
                          goto LABEL_161;
                        case 418:
                          if (AddMultipleFieldsToGenericContext(a1, "numBandsVerified", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: numBandsVerified(418) cannot add 1 element to context";
                          goto LABEL_161;
                        case 419:
                          if (AddMultipleFieldsToGenericContext(a1, "cache_heads", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: cache_heads(419) cannot add 1 element to context";
                          goto LABEL_161;
                        case 420:
                          if (AddMultipleFieldsToGenericContext(a1, "AbortSkip_RMXtoMPBX", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: AbortSkip_RMXtoMPBX(420) cannot add 1 element to context";
                          goto LABEL_161;
                        case 421:
                          if (AddMultipleFieldsToGenericContext(a1, "s3eFwVer", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: s3eFwVer(421) cannot add 1 element to context";
                          goto LABEL_161;
                        case 422:
                          if (AddMultipleFieldsToGenericContext(a1, "readVerifyNative", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: readVerifyNative(422) cannot add 1 element to context";
                          goto LABEL_161;
                        case 423:
                          if (AddMultipleFieldsToGenericContext(a1, "reducedReadVerifyNative", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: reducedReadVerifyNative(423) cannot add 1 element to context";
                          goto LABEL_161;
                        case 424:
                          if (AddMultipleFieldsToGenericContext(a1, "readVerifySlc", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: readVerifySlc(424) cannot add 1 element to context";
                          goto LABEL_161;
                        case 425:
                          if (AddMultipleFieldsToGenericContext(a1, "reducedReadVerifySlc", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: reducedReadVerifySlc(425) cannot add 1 element to context";
                          goto LABEL_161;
                        case 426:
                          if (AddMultipleFieldsToGenericContext(a1, "RxBurnEvictions", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: RxBurnEvictions(426) cannot add 1 element to context";
                          goto LABEL_161;
                        case 427:
                          if (AddMultipleFieldsToGenericContext(a1, "directToTLCBands", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: directToTLCBands(427) cannot add 1 element to context";
                          goto LABEL_161;
                        case 428:
                          if (AddMultipleFieldsToGenericContext(a1, "nandDesc", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: nandDesc(428) cannot add 1 element to context";
                          goto LABEL_161;
                        case 429:
                          if (AddMultipleFieldsToGenericContext(a1, "fwUpdatesPercentUsed", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: fwUpdatesPercentUsed(429) cannot add 1 element to context";
                          goto LABEL_161;
                        case 430:
                          if (AddMultipleFieldsToGenericContext(a1, "slcPercentUsed", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: slcPercentUsed(430) cannot add 1 element to context";
                          goto LABEL_161;
                        case 431:
                          if (AddMultipleFieldsToGenericContext(a1, "percentUsed", (uint64_t)v8, 8u, 1u)) {
                            goto LABEL_162;
                          }
                          int v17 = "ASPFTLParseBufferToCxt: percentUsed(431) cannot add 1 element to context";
                          goto LABEL_161;
                        default:
                          switch(v12)
                          {
                            case 432:
                              if (AddMultipleFieldsToGenericContext(a1, "hostAutoWrites", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: hostAutoWrites(432) cannot add 1 element to context";
                              goto LABEL_161;
                            case 433:
                              if (AddMultipleFieldsToGenericContext(a1, "hostAutoWriteXacts", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: hostAutoWriteXacts(433) cannot add 1 element to context";
                              goto LABEL_161;
                            case 434:
                              if (AddMultipleFieldsToGenericContext(a1, "gcDestDynamic", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: gcDestDynamic(434) cannot add 1 element to context";
                              goto LABEL_161;
                            case 435:
                              if (AddMultipleFieldsToGenericContext(a1, "gcDestStatic", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: gcDestStatic(435) cannot add 1 element to context";
                              goto LABEL_161;
                            case 436:
                              if (AddMultipleFieldsToGenericContext(a1, "gcDestWearlevel", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: gcDestWearlevel(436) cannot add 1 element to context";
                              goto LABEL_161;
                            case 437:
                              if (AddMultipleFieldsToGenericContext(a1, "gcDestParity", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: gcDestParity(437) cannot add 1 element to context";
                              goto LABEL_161;
                            case 438:
                              if (AddMultipleFieldsToGenericContext(a1, "AbortSkip_Format", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: AbortSkip_Format(438) cannot add 1 element to context";
                              goto LABEL_161;
                            case 440:
                              if (AddMultipleFieldsToGenericContext(a1, "raidSLCPadding", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: raidSLCPadding(440) cannot add 1 element to context";
                              goto LABEL_161;
                            case 441:
                              if (AddMultipleFieldsToGenericContext(a1, "raidGCBands", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: raidGCBands(441) cannot add 1 element to context";
                              goto LABEL_161;
                            case 442:
                              if (AddMultipleFieldsToGenericContext(a1, "raidGCSectors", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: raidGCSectors(442) cannot add 1 element to context";
                              goto LABEL_161;
                            case 443:
                              if (AddMultipleFieldsToGenericContext(a1, "raidGCPadding", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: raidGCPadding(443) cannot add 1 element to context";
                              goto LABEL_161;
                            case 444:
                              if (AddMultipleFieldsToGenericContext(a1, "raidSLCBandsPerHostFlow", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                              int v17 = "ASPFTLParseBufferToCxt: raidSLCBandsPerHostFlow(444) cannot add 1 element to context";
                              }
                              goto LABEL_161;
                            case 445:
                              if (AddMultipleFieldsToGenericContext(a1, "raidSLCSecsPerHostFlow", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: raidSLCSecsPerHostFlow(445) cannot add 1 element to context";
                              goto LABEL_161;
                            case 446:
                              if (AddMultipleFieldsToGenericContext(a1, "rxBurnMinCycleRuns", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: rxBurnMinCycleRuns(446) cannot add 1 element to context";
                              goto LABEL_161;
                            case 447:
                              if (AddMultipleFieldsToGenericContext(a1, "clogNumFastCxt", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: clogNumFastCxt(447) cannot add 1 element to context";
                              goto LABEL_161;
                            case 448:
                              if (AddMultipleFieldsToGenericContext(a1, "clogNumRapidReboots", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: clogNumRapidReboots(448) cannot add 1 element to context";
                              goto LABEL_161;
                            case 449:
                              if (AddMultipleFieldsToGenericContext(a1, "clogFastCxtAbvThr", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: clogFastCxtAbvThr(449) cannot add 1 element to context";
                              goto LABEL_161;
                            case 450:
                              if (AddMultipleFieldsToGenericContext(a1, "rxBurnDiffModeRuns", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: rxBurnDiffModeRuns(450) cannot add 1 element to context";
                              goto LABEL_161;
                            case 452:
                              if (AddMultipleFieldsToGenericContext(a1, "indReadVerifyFail", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: indReadVerifyFail(452) cannot add 1 element to context";
                              goto LABEL_161;
                            case 453:
                              if (v14 != 16) {
                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerReadLevel(453): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              }
                              if (v14 >= 0x10) {
                                unsigned int v18 = 16;
                              }
                              else {
                                unsigned int v18 = v14;
                              }
                              if (AddMultipleFieldsToGenericContext(a1, "numOfThrottlingEntriesPerReadLevel_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                              unsigned int v19 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerReadLevel(453): Cannot add 16 elements to context";
                              }
                              goto LABEL_2616;
                            case 454:
                              if (v14 != 16) {
                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerWriteLevel(454): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              }
                              if (v14 >= 0x10) {
                                unsigned int v18 = 16;
                              }
                              else {
                                unsigned int v18 = v14;
                              }
                              if (AddMultipleFieldsToGenericContext(a1, "numOfThrottlingEntriesPerWriteLevel_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                              unsigned int v19 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerWriteLevel(454): Cannot add 16 elements to context";
                              }
                              goto LABEL_2616;
                            case 456:
                              if (v14 != 10) {
                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: slcFifoDepth(456): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              }
                              if (v14 >= 0xA) {
                                unsigned int v18 = 10;
                              }
                              else {
                                unsigned int v18 = v14;
                              }
                              if (AddMultipleFieldsToGenericContext(a1, "slcFifoDepth_", (uint64_t)v8, 8u, v18)) {
                                goto LABEL_110;
                              }
                              unsigned int v19 = "ASPFTLParseBufferToCxt: slcFifoDepth(456): Cannot add 10 elements to context";
                              goto LABEL_2616;
                            case 457:
                              if (AddMultipleFieldsToGenericContext(a1, "wcacheSectorsDirtyIdle", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: wcacheSectorsDirtyIdle(457) cannot add 1 element to context";
                              goto LABEL_161;
                            case 458:
                              if (AddMultipleFieldsToGenericContext(a1, "wcacheDS_SectorsDirtyIdle", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                              int v17 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsDirtyIdle(458) cannot add 1 element to context";
                              }
                              goto LABEL_161;
                            case 459:
                              if (AddMultipleFieldsToGenericContext(a1, "wcacheFS_MbytesDirtyIdle", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                              int v17 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesDirtyIdle(459) cannot add 1 element to context";
                              }
                              goto LABEL_161;
                            case 460:
                              if (v14 != 256) {
                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: CacheDepthVsThroughput(460): (#256) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              }
                              if (v14 >= 0x100) {
                                unsigned int v18 = 256;
                              }
                              else {
                                unsigned int v18 = v14;
                              }
                              if (AddMultipleFieldsToGenericContext(a1, "CacheDepthVsThroughput_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                              unsigned int v19 = "ASPFTLParseBufferToCxt: CacheDepthVsThroughput(460): Cannot add 256 elements to context";
                              }
                              goto LABEL_2616;
                            case 461:
                              if (AddMultipleFieldsToGenericContext(a1, "directToTLCSectors", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: directToTLCSectors(461) cannot add 1 element to context";
                              goto LABEL_161;
                            case 462:
                              if (AddMultipleFieldsToGenericContext(a1, "fallbackToWaterfall", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: fallbackToWaterfall(462) cannot add 1 element to context";
                              goto LABEL_161;
                            case 463:
                              if (v14 != 11) {
                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: balanceProportionBucketsHistogram(463): (#11) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              }
                              if (v14 >= 0xB) {
                                unsigned int v18 = 11;
                              }
                              else {
                                unsigned int v18 = v14;
                              }
                              if (AddMultipleFieldsToGenericContext(a1, "balanceProportionBucketsHistogram_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                              unsigned int v19 = "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogram(463): Cannot add 11 elements to context";
                              }
                              goto LABEL_2616;
                            case 464:
                              if (AddMultipleFieldsToGenericContext(a1, "lockToTlc", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: lockToTlc(464) cannot add 1 element to context";
                              goto LABEL_161;
                            case 465:
                              if (v14 != 10) {
                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: burstSizeHistogram(465): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              }
                              if (v14 >= 0xA) {
                                unsigned int v18 = 10;
                              }
                              else {
                                unsigned int v18 = v14;
                              }
                              if (AddMultipleFieldsToGenericContext(a1, "burstSizeHistogram_", (uint64_t)v8, 8u, v18)) {
                                goto LABEL_110;
                              }
                              unsigned int v19 = "ASPFTLParseBufferToCxt: burstSizeHistogram(465): Cannot add 10 elements to context";
                              goto LABEL_2616;
                            case 466:
                              if (v14 != 64) {
                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: qosDirectToTLC(466): (#64) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              }
                              if (v14 >= 0x40) {
                                unsigned int v18 = 64;
                              }
                              else {
                                unsigned int v18 = v14;
                              }
                              if (AddMultipleFieldsToGenericContext(a1, "qosDirectToTLC_", (uint64_t)v8, 8u, v18)) {
                                goto LABEL_110;
                              }
                              unsigned int v19 = "ASPFTLParseBufferToCxt: qosDirectToTLC(466): Cannot add 64 elements to context";
                              goto LABEL_2616;
                            case 467:
                              if (v14 != 4) {
                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: maxQosDirectToTLC(467): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              }
                              if (v14 >= 4) {
                                unsigned int v18 = 4;
                              }
                              else {
                                unsigned int v18 = v14;
                              }
                              if (AddMultipleFieldsToGenericContext(a1, "maxQosDirectToTLC_", (uint64_t)v8, 8u, v18)) {
                                goto LABEL_110;
                              }
                              unsigned int v19 = "ASPFTLParseBufferToCxt: maxQosDirectToTLC(467): Cannot add 4 elements to context";
                              goto LABEL_2616;
                            case 468:
                              if (v14 != 16) {
                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: wcacheDirtyAtFlush(468): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              }
                              if (v14 >= 0x10) {
                                unsigned int v18 = 16;
                              }
                              else {
                                unsigned int v18 = v14;
                              }
                              if (AddMultipleFieldsToGenericContext(a1, "wcacheDirtyAtFlush_", (uint64_t)v8, 8u, v18)) {
                                goto LABEL_110;
                              }
                              unsigned int v19 = "ASPFTLParseBufferToCxt: wcacheDirtyAtFlush(468): Cannot add 16 elements to context";
                              goto LABEL_2616;
                            case 469:
                              if (v14 != 2) {
                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: raidReconstructSuccessPartition(469): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              }
                              if (v14 >= 2) {
                                unsigned int v18 = 2;
                              }
                              else {
                                unsigned int v18 = v14;
                              }
                              if (AddMultipleFieldsToGenericContext(a1, "raidReconstructSuccessPartition_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                              unsigned int v19 = "ASPFTLParseBufferToCxt: raidReconstructSuccessPartition(469): Cannot add 2 elements to context";
                              }
                              goto LABEL_2616;
                            case 470:
                              if (v14 != 2) {
                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: raidReconstructFailPartition(470): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              }
                              if (v14 >= 2) {
                                unsigned int v18 = 2;
                              }
                              else {
                                unsigned int v18 = v14;
                              }
                              if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailPartition_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                              unsigned int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailPartition(470): Cannot add 2 elements to context";
                              }
                              goto LABEL_2616;
                            case 471:
                              if (AddMultipleFieldsToGenericContext(a1, "raidUncleanBootBandFail", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                              int v17 = "ASPFTLParseBufferToCxt: raidUncleanBootBandFail(471) cannot add 1 element to context";
                              }
                              goto LABEL_161;
                            case 472:
                              if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailBandFlowHost", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                              int v17 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowHost(472) cannot add 1 element to context";
                              }
                              goto LABEL_161;
                            case 473:
                              if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailBandFlowGC", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                              int v17 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowGC(473) cannot add 1 element to context";
                              }
                              goto LABEL_161;
                            case 476:
                              if (v14 != 2) {
                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: raidSuccessfulRecoLbaRange(476): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              }
                              if (v14 >= 2) {
                                unsigned int v18 = 2;
                              }
                              else {
                                unsigned int v18 = v14;
                              }
                              if (AddMultipleFieldsToGenericContext(a1, "raidSuccessfulRecoLbaRange_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                              unsigned int v19 = "ASPFTLParseBufferToCxt: raidSuccessfulRecoLbaRange(476): Cannot add 2 elements to context";
                              }
                              goto LABEL_2616;
                            case 477:
                              if (v14 != 2) {
                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: raidFailedRecoLbaRange(477): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              }
                              if (v14 >= 2) {
                                unsigned int v18 = 2;
                              }
                              else {
                                unsigned int v18 = v14;
                              }
                              if (AddMultipleFieldsToGenericContext(a1, "raidFailedRecoLbaRange_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                              unsigned int v19 = "ASPFTLParseBufferToCxt: raidFailedRecoLbaRange(477): Cannot add 2 elements to context";
                              }
                              goto LABEL_2616;
                            case 481:
                              if (v14 != 32) {
                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: skinnyBandErases_481(481): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              }
                              if (v14 >= 0x20) {
                                unsigned int v18 = 32;
                              }
                              else {
                                unsigned int v18 = v14;
                              }
                              if (AddMultipleFieldsToGenericContext(a1, "skinnyBandErases_481_", (uint64_t)v8, 8u, v18)) {
                                goto LABEL_110;
                              }
                              unsigned int v19 = "ASPFTLParseBufferToCxt: skinnyBandErases_481(481): Cannot add 32 elements to context";
                              goto LABEL_2616;
                            case 483:
                              if (AddMultipleFieldsToGenericContext(a1, "tlcOverHeatWaterfall", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: tlcOverHeatWaterfall(483) cannot add 1 element to context";
                              goto LABEL_161;
                            case 484:
                              if (AddMultipleFieldsToGenericContext(a1, "skinnyCyclesConvert", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: skinnyCyclesConvert(484) cannot add 1 element to context";
                              goto LABEL_161;
                            case 485:
                              if (AddMultipleFieldsToGenericContext(a1, "non_proportional_directToTLCSectors", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                              int v17 = "ASPFTLParseBufferToCxt: non_proportional_directToTLCSectors(485) cannot add 1 element to context";
                              }
                              goto LABEL_161;
                            case 486:
                              if (AddMultipleFieldsToGenericContext(a1, "maxFailedFastCxtSync", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: maxFailedFastCxtSync(486) cannot add 1 element to context";
                              goto LABEL_161;
                            case 487:
                              if (AddMultipleFieldsToGenericContext(a1, "numFormatUserArea", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: numFormatUserArea(487) cannot add 1 element to context";
                              goto LABEL_161;
                            case 488:
                              if (AddMultipleFieldsToGenericContext(a1, "clogFastCxtSyncAborted", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: clogFastCxtSyncAborted(488) cannot add 1 element to context";
                              goto LABEL_161;
                            case 489:
                              if (v14 != 5) {
                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: clogOccupationSectors(489): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              }
                              if (v14 >= 5) {
                                unsigned int v18 = 5;
                              }
                              else {
                                unsigned int v18 = v14;
                              }
                              if (AddMultipleFieldsToGenericContext(a1, "clogOccupationSectors_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                              unsigned int v19 = "ASPFTLParseBufferToCxt: clogOccupationSectors(489): Cannot add 5 elements to context";
                              }
                              goto LABEL_2616;
                            case 490:
                              if (v14 != 64) {
                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: bdrTmpHist(490): (#64) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              }
                              if (v14 >= 0x40) {
                                unsigned int v18 = 64;
                              }
                              else {
                                unsigned int v18 = v14;
                              }
                              if (AddMultipleFieldsToGenericContext(a1, "bdrTmpHist_", (uint64_t)v8, 8u, v18)) {
                                goto LABEL_110;
                              }
                              unsigned int v19 = "ASPFTLParseBufferToCxt: bdrTmpHist(490): Cannot add 64 elements to context";
                              goto LABEL_2616;
                            case 491:
                              if (AddMultipleFieldsToGenericContext(a1, "numFWUpdates", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: numFWUpdates(491) cannot add 1 element to context";
                              goto LABEL_161;
                            case 492:
                              if (AddMultipleFieldsToGenericContext(a1, "numClogLoadFails", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: numClogLoadFails(492) cannot add 1 element to context";
                              goto LABEL_161;
                            case 493:
                              if (AddMultipleFieldsToGenericContext(a1, "rxBurnNumForcedDiffMode", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                              int v17 = "ASPFTLParseBufferToCxt: rxBurnNumForcedDiffMode(493) cannot add 1 element to context";
                              }
                              goto LABEL_161;
                            case 494:
                              if (AddMultipleFieldsToGenericContext(a1, "RD_numSaves", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: RD_numSaves(494) cannot add 1 element to context";
                              goto LABEL_161;
                            case 495:
                              if (AddMultipleFieldsToGenericContext(a1, "eanCompressWrites", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: eanCompressWrites(495) cannot add 1 element to context";
                              goto LABEL_161;
                            case 496:
                              if (AddMultipleFieldsToGenericContext(a1, "eanHostWrites", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: eanHostWrites(496) cannot add 1 element to context";
                              goto LABEL_161;
                            case 497:
                              if (AddMultipleFieldsToGenericContext(a1, "bandPreErases", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: bandPreErases(497) cannot add 1 element to context";
                              goto LABEL_161;
                            case 498:
                              if (AddMultipleFieldsToGenericContext(a1, "eanHostUnmaps", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: eanHostUnmaps(498) cannot add 1 element to context";
                              goto LABEL_161;
                            case 499:
                              if (AddMultipleFieldsToGenericContext(a1, "eanHostFlushes", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: eanHostFlushes(499) cannot add 1 element to context";
                              goto LABEL_161;
                            case 500:
                              if (AddMultipleFieldsToGenericContext(a1, "eanFastWrites", (uint64_t)v8, 8u, 1u)) {
                                goto LABEL_162;
                              }
                              int v17 = "ASPFTLParseBufferToCxt: eanFastWrites(500) cannot add 1 element to context";
                              goto LABEL_161;
                            case 501:
                              if (AddMultipleFieldsToGenericContext(a1, "autowriteDS2FSCollisions", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                              int v17 = "ASPFTLParseBufferToCxt: autowriteDS2FSCollisions(501) cannot add 1 element to context";
                              }
                              goto LABEL_161;
                            case 502:
                              if (AddMultipleFieldsToGenericContext(a1, "autowriteWaitTransferTaskBlocks", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                              int v17 = "ASPFTLParseBufferToCxt: autowriteWaitTransferTaskBlocks(502) cannot add 1 element to context";
                              }
                              goto LABEL_161;
                            case 503:
                              if (v14 != 2) {
                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: avgCycle(503): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              }
                              if (v14 >= 2) {
                                unsigned int v18 = 2;
                              }
                              else {
                                unsigned int v18 = v14;
                              }
                              if (AddMultipleFieldsToGenericContext(a1, "avgCycle_", (uint64_t)v8, 8u, v18)) {
                                goto LABEL_110;
                              }
                              unsigned int v19 = "ASPFTLParseBufferToCxt: avgCycle(503): Cannot add 2 elements to context";
                              goto LABEL_2616;
                            case 504:
                              if (AddMultipleFieldsToGenericContext(a1, "RD_DeferredClearsOverflowCnt", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                              int v17 = "ASPFTLParseBufferToCxt: RD_DeferredClearsOverflowCnt(504) cannot add 1 element to context";
                              }
                              goto LABEL_161;
                            default:
                              switch(v12)
                              {
                                case 505:
                                  if (AddMultipleFieldsToGenericContext(a1, "maxVerticsInBand", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: maxVerticsInBand(505) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 506:
                                  if (AddMultipleFieldsToGenericContext(a1, "numVertics", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: numVertics(506) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 507:
                                  if (AddMultipleFieldsToGenericContext(a1, "exceededCVertics", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: exceededCVertics(507) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 510:
                                  if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailMismatch", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: raidReconstructFailMismatch(510) cannot add 1 element to context";
                                  }
                                  goto LABEL_161;
                                case 511:
                                  if (v14 != 32) {
                                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: mspbootBlockRefreshCnt(511): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                  }
                                  if (v14 >= 0x20) {
                                    unsigned int v18 = 32;
                                  }
                                  else {
                                    unsigned int v18 = v14;
                                  }
                                  if (AddMultipleFieldsToGenericContext(a1, "mspbootBlockRefreshCnt_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                  unsigned int v19 = "ASPFTLParseBufferToCxt: mspbootBlockRefreshCnt(511): Cannot add 32 elements to context";
                                  }
                                  goto LABEL_2616;
                                case 516:
                                  if (v14 != 32) {
                                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: mspBootBlockRefreshTime(516): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                  }
                                  if (v14 >= 0x20) {
                                    unsigned int v18 = 32;
                                  }
                                  else {
                                    unsigned int v18 = v14;
                                  }
                                  if (AddMultipleFieldsToGenericContext(a1, "mspBootBlockRefreshTime_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                  unsigned int v19 = "ASPFTLParseBufferToCxt: mspBootBlockRefreshTime(516): Cannot add 32 elements to context";
                                  }
                                  goto LABEL_2616;
                                case 517:
                                  if (AddMultipleFieldsToGenericContext(a1, "mspBootBlockCountPerMsp", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: mspBootBlockCountPerMsp(517) cannot add 1 element to context";
                                  }
                                  goto LABEL_161;
                                case 518:
                                  if (AddMultipleFieldsToGenericContext(a1, "skinnyRevectorSLC", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: skinnyRevectorSLC(518) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 519:
                                  if (AddMultipleFieldsToGenericContext(a1, "skinnyRevectorTLC", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: skinnyRevectorTLC(519) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 520:
                                  if (AddMultipleFieldsToGenericContext(a1, "perfSetupAttempts", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: perfSetupAttempts(520) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 521:
                                  if (AddMultipleFieldsToGenericContext(a1, "perfSetupSuccesses", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: perfSetupSuccesses(521) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 522:
                                  if (AddMultipleFieldsToGenericContext(a1, "perfWriteAttempts", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: perfWriteAttempts(522) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 523:
                                  if (AddMultipleFieldsToGenericContext(a1, "perfWriteSuccesses", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: perfWriteSuccesses(523) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 524:
                                  if (AddMultipleFieldsToGenericContext(a1, "perfReadAttempts", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: perfReadAttempts(524) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 525:
                                  if (AddMultipleFieldsToGenericContext(a1, "perfReadSuccesses", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: perfReadSuccesses(525) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 526:
                                  if (AddMultipleFieldsToGenericContext(a1, "perfCleanupAttempts", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: perfCleanupAttempts(526) cannot add 1 element to context";
                                  }
                                  goto LABEL_161;
                                case 527:
                                  if (AddMultipleFieldsToGenericContext(a1, "perfCleanupSuccesses", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: perfCleanupSuccesses(527) cannot add 1 element to context";
                                  }
                                  goto LABEL_161;
                                case 530:
                                  if (AddMultipleFieldsToGenericContext(a1, "firstFailedDieId", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: firstFailedDieId(530) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 531:
                                  if (AddMultipleFieldsToGenericContext(a1, "numDieFailures", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: numDieFailures(531) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 532:
                                  if (AddMultipleFieldsToGenericContext(a1, "spareAvailablePercent", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: spareAvailablePercent(532) cannot add 1 element to context";
                                  }
                                  goto LABEL_161;
                                case 533:
                                  if (AddMultipleFieldsToGenericContext(a1, "dataFabricErr", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: dataFabricErr(533) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 534:
                                  if (AddMultipleFieldsToGenericContext(a1, "downlinkFabricErr", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: downlinkFabricErr(534) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 535:
                                  if (AddMultipleFieldsToGenericContext(a1, "prpAccTimeoutErr", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: prpAccTimeoutErr(535) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 537:
                                  if (AddMultipleFieldsToGenericContext(a1, "uplinkFabricErr", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: uplinkFabricErr(537) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 538:
                                  if (AddMultipleFieldsToGenericContext(a1, "skinnyBandsGBB", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: skinnyBandsGBB(538) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 539:
                                  if (AddMultipleFieldsToGenericContext(a1, "AbortPad_GcMustPadBand", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: AbortPad_GcMustPadBand(539) cannot add 1 element to context";
                                  }
                                  goto LABEL_161;
                                case 540:
                                  if (AddMultipleFieldsToGenericContext(a1, "AbortPad_GcMustPadSkinny", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: AbortPad_GcMustPadSkinny(540) cannot add 1 element to context";
                                  }
                                  goto LABEL_161;
                                case 541:
                                  if (AddMultipleFieldsToGenericContext(a1, "bdrHostPingInitial", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: bdrHostPingInitial(541) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 542:
                                  if (AddMultipleFieldsToGenericContext(a1, "bdrHostPingMoreNeeded", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: bdrHostPingMoreNeeded(542) cannot add 1 element to context";
                                  }
                                  goto LABEL_161;
                                case 543:
                                  if (AddMultipleFieldsToGenericContext(a1, "bandParityAllocationFailed", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: bandParityAllocationFailed(543) cannot add 1 element to context";
                                  }
                                  goto LABEL_161;
                                case 544:
                                  if (AddMultipleFieldsToGenericContext(a1, "fastHwBurstToSlc", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: fastHwBurstToSlc(544) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 545:
                                  if (AddMultipleFieldsToGenericContext(a1, "slowHwToTlc", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: slowHwToTlc(545) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 546:
                                  if (v14 != 10) {
                                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: slcDemandBurstSizeDetected(546): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                  }
                                  if (v14 >= 0xA) {
                                    unsigned int v18 = 10;
                                  }
                                  else {
                                    unsigned int v18 = v14;
                                  }
                                  if (AddMultipleFieldsToGenericContext(a1, "slcDemandBurstSizeDetected_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                  unsigned int v19 = "ASPFTLParseBufferToCxt: slcDemandBurstSizeDetected(546): Cannot add 10 elements to context";
                                  }
                                  goto LABEL_2616;
                                case 547:
                                  if (v14 != 10) {
                                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: slcDemandBurstDur(547): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                  }
                                  if (v14 >= 0xA) {
                                    unsigned int v18 = 10;
                                  }
                                  else {
                                    unsigned int v18 = v14;
                                  }
                                  if (AddMultipleFieldsToGenericContext(a1, "slcDemandBurstDur_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                  unsigned int v19 = "ASPFTLParseBufferToCxt: slcDemandBurstDur(547): Cannot add 10 elements to context";
                                  }
                                  goto LABEL_2616;
                                case 548:
                                  if (AddMultipleFieldsToGenericContext(a1, "fastHwToTlcBurst", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: fastHwToTlcBurst(548) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 549:
                                  if (v14 != 10) {
                                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: slcDemandBurstSizeSlc(549): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                  }
                                  if (v14 >= 0xA) {
                                    unsigned int v18 = 10;
                                  }
                                  else {
                                    unsigned int v18 = v14;
                                  }
                                  if (AddMultipleFieldsToGenericContext(a1, "slcDemandBurstSizeSlc_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                  unsigned int v19 = "ASPFTLParseBufferToCxt: slcDemandBurstSizeSlc(549): Cannot add 10 elements to context";
                                  }
                                  goto LABEL_2616;
                                case 551:
                                  if (v14 != 11) {
                                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: balanceProportionBucketsHistogramTlc(551): (#11) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                  }
                                  if (v14 >= 0xB) {
                                    unsigned int v18 = 11;
                                  }
                                  else {
                                    unsigned int v18 = v14;
                                  }
                                  if (AddMultipleFieldsToGenericContext(a1, "balanceProportionBucketsHistogramTlc_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                  unsigned int v19 = "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogramTlc(551): Cannot add 11"
                                  }
                                        " elements to context";
                                  goto LABEL_2616;
                                case 553:
                                  if (AddMultipleFieldsToGenericContext(a1, "slowHwFlushToSlc", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: slowHwFlushToSlc(553) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 557:
                                  if (AddMultipleFieldsToGenericContext(a1, "slowHwToSlc", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: slowHwToSlc(557) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 558:
                                  if (AddMultipleFieldsToGenericContext(a1, "flushNwToSlc", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: flushNwToSlc(558) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 559:
                                  if (AddMultipleFieldsToGenericContext(a1, "flushNwToTlc", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: flushNwToTlc(559) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 560:
                                  if (AddMultipleFieldsToGenericContext(a1, "oslcHw", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: oslcHw(560) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 561:
                                  if (AddMultipleFieldsToGenericContext(a1, "oslcTransitions", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: oslcTransitions(561) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 563:
                                  if (AddMultipleFieldsToGenericContext(a1, "slcDemandFlushCount", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: slcDemandFlushCount(563) cannot add 1 element to context";
                                  }
                                  goto LABEL_161;
                                case 564:
                                  if (AddMultipleFieldsToGenericContext(a1, "slcDemandBurstCount", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: slcDemandBurstCount(564) cannot add 1 element to context";
                                  }
                                  goto LABEL_161;
                                case 565:
                                  if (AddMultipleFieldsToGenericContext(a1, "oslcBaseAvgPE", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: oslcBaseAvgPE(565) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 566:
                                  if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailNoSPBX", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: raidReconstructFailNoSPBX(566) cannot add 1 element to context";
                                  }
                                  goto LABEL_161;
                                case 567:
                                  if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailDouble", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: raidReconstructFailDouble(567) cannot add 1 element to context";
                                  }
                                  goto LABEL_161;
                                case 568:
                                  if (AddMultipleFieldsToGenericContext(a1, "oslcFastWAmpUOnOff", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: oslcFastWAmpUOnOff(568) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 569:
                                  if (AddMultipleFieldsToGenericContext(a1, "oslcSlowWAmpUOnOff", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: oslcSlowWAmpUOnOff(569) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 570:
                                  if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailInvalid", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: raidReconstructFailInvalid(570) cannot add 1 element to context";
                                  }
                                  goto LABEL_161;
                                case 572:
                                  if (AddMultipleFieldsToGenericContext(a1, "oslcLastWAmpUx10", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: oslcLastWAmpUx10(572) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 573:
                                  if (AddMultipleFieldsToGenericContext(a1, "raidFailedReadNoBlog", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: raidFailedReadNoBlog(573) cannot add 1 element to context";
                                  }
                                  goto LABEL_161;
                                case 574:
                                  if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailBlank", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: raidReconstructFailBlank(574) cannot add 1 element to context";
                                  }
                                  goto LABEL_161;
                                case 575:
                                  if (AddMultipleFieldsToGenericContext(a1, "oslcHotTLCOnOff", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: oslcHotTLCOnOff(575) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 576:
                                  if (AddMultipleFieldsToGenericContext(a1, "gcVPackDestinations", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: gcVPackDestinations(576) cannot add 1 element to context";
                                  }
                                  goto LABEL_161;
                                case 581:
                                  if (AddMultipleFieldsToGenericContext(a1, "averageTLCPECycles", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: averageTLCPECycles(581) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 582:
                                  if (AddMultipleFieldsToGenericContext(a1, "averageSLCPECycles", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: averageSLCPECycles(582) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 583:
                                  if (AddMultipleFieldsToGenericContext(a1, "numAtomicBoots", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: numAtomicBoots(583) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 584:
                                  if (AddMultipleFieldsToGenericContext(a1, "clogMinorMismatch", (uint64_t)v8, 8u, 1u)) {
                                    goto LABEL_162;
                                  }
                                  int v17 = "ASPFTLParseBufferToCxt: clogMinorMismatch(584) cannot add 1 element to context";
                                  goto LABEL_161;
                                case 586:
                                  if (AddMultipleFieldsToGenericContext(a1, "raidExpectedFailRMXReconstructionInternal", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: raidExpectedFailRMXReconstructionInternal(586) cannot ad"
                                  }
                                        "d 1 element to context";
                                  goto LABEL_161;
                                case 587:
                                  if (AddMultipleFieldsToGenericContext(a1, "raidExpectedFailRMXReconstructionHost", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: raidExpectedFailRMXReconstructionHost(587) cannot add 1 "
                                  }
                                        "element to context";
                                  goto LABEL_161;
                                case 588:
                                  if (AddMultipleFieldsToGenericContext(a1, "oslcGCinvalidations", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: oslcGCinvalidations(588) cannot add 1 element to context";
                                  }
                                  goto LABEL_161;
                                case 589:
                                  if (AddMultipleFieldsToGenericContext(a1, "oslcGCActivateReason", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                  int v17 = "ASPFTLParseBufferToCxt: oslcGCActivateReason(589) cannot add 1 element to context";
                                  }
                                  goto LABEL_161;
                                default:
                                  switch(v12)
                                  {
                                    case 590:
                                      if (AddMultipleFieldsToGenericContext(a1, "oslcLowCleanBandsUOnOff", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: oslcLowCleanBandsUOnOff(590) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 591:
                                      if (AddMultipleFieldsToGenericContext(a1, "oslcTooManyGCMustOnOff", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: oslcTooManyGCMustOnOff(591) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 592:
                                      if (AddMultipleFieldsToGenericContext(a1, "oslcBaseHostWrites", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: oslcBaseHostWrites(592) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 593:
                                      if (AddMultipleFieldsToGenericContext(a1, "oslcBaseBandErases", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: oslcBaseBandErases(593) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 594:
                                      if (AddMultipleFieldsToGenericContext(a1, "oslcBdrBands", (uint64_t)v8, 8u, 1u)) {
                                        goto LABEL_162;
                                      }
                                      int v17 = "ASPFTLParseBufferToCxt: oslcBdrBands(594) cannot add 1 element to context";
                                      goto LABEL_161;
                                    case 595:
                                      if (AddMultipleFieldsToGenericContext(a1, "oslcBdrValid", (uint64_t)v8, 8u, 1u)) {
                                        goto LABEL_162;
                                      }
                                      int v17 = "ASPFTLParseBufferToCxt: oslcBdrValid(595) cannot add 1 element to context";
                                      goto LABEL_161;
                                    case 596:
                                      if (AddMultipleFieldsToGenericContext(a1, "unexpectedBlanksInternal", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: unexpectedBlanksInternal(596) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 597:
                                      if (AddMultipleFieldsToGenericContext(a1, "unexpectedBlanksOnRV", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: unexpectedBlanksOnRV(597) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 601:
                                      if (AddMultipleFieldsToGenericContext(a1, "waterfallLockSectors", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: waterfallLockSectors(601) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 602:
                                      if (AddMultipleFieldsToGenericContext(a1, "oslcGCActiveWrites", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: oslcGCActiveWrites(602) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 603:
                                      if (AddMultipleFieldsToGenericContext(a1, "chipIdTemperatureSample", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: chipIdTemperatureSample(603) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 604:
                                      if (AddMultipleFieldsToGenericContext(a1, "gcVPackWrites", (uint64_t)v8, 8u, 1u)) {
                                        goto LABEL_162;
                                      }
                                      int v17 = "ASPFTLParseBufferToCxt: gcVPackWrites(604) cannot add 1 element to context";
                                      goto LABEL_161;
                                    case 605:
                                      if (v14 != 10) {
                                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: gcActiveReasons(605): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      }
                                      if (v14 >= 0xA) {
                                        unsigned int v18 = 10;
                                      }
                                      else {
                                        unsigned int v18 = v14;
                                      }
                                      if (AddMultipleFieldsToGenericContext(a1, "gcActiveReasons_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                      unsigned int v19 = "ASPFTLParseBufferToCxt: gcActiveReasons(605): Cannot add 10 elements to context";
                                      }
                                      goto LABEL_2616;
                                    case 606:
                                      if (AddMultipleFieldsToGenericContext(a1, "eanMaxInitTimeMs", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: eanMaxInitTimeMs(606) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 607:
                                      if (AddMultipleFieldsToGenericContext(a1, "eanMinToFirstReadTimeMs", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: eanMinToFirstReadTimeMs(607) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 608:
                                      if (AddMultipleFieldsToGenericContext(a1, "skinnyAPGMRetire", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: skinnyAPGMRetire(608) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 609:
                                      if (AddMultipleFieldsToGenericContext(a1, "unexpectedBlanksHost", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: unexpectedBlanksHost(609) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 610:
                                      if (v14 != 64) {
                                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: pcieAerCounters(610): (#64) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      }
                                      if (v14 >= 0x40) {
                                        unsigned int v18 = 64;
                                      }
                                      else {
                                        unsigned int v18 = v14;
                                      }
                                      if (AddMultipleFieldsToGenericContext(a1, "pcieAerCounters_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                      unsigned int v19 = "ASPFTLParseBufferToCxt: pcieAerCounters(610): Cannot add 64 elements to context";
                                      }
                                      goto LABEL_2616;
                                    case 611:
                                      if (AddMultipleFieldsToGenericContext(a1, "fastHwToTlcBalance", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: fastHwToTlcBalance(611) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 612:
                                      if (AddMultipleFieldsToGenericContext(a1, "perfOSLCRuns", (uint64_t)v8, 8u, 1u)) {
                                        goto LABEL_162;
                                      }
                                      int v17 = "ASPFTLParseBufferToCxt: perfOSLCRuns(612) cannot add 1 element to context";
                                      goto LABEL_161;
                                    case 613:
                                      if (AddMultipleFieldsToGenericContext(a1, "slcDemandBurstWritesInGC", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInGC(613) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 614:
                                      if (AddMultipleFieldsToGenericContext(a1, "slcDemandBurstWritesInTT", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInTT(614) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 615:
                                      if (AddMultipleFieldsToGenericContext(a1, "slcDemandBurstWritesInNRP", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInNRP(615) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 616:
                                      if (AddMultipleFieldsToGenericContext(a1, "perfTotalDmaMb", (uint64_t)v8, 8u, 1u)) {
                                        goto LABEL_162;
                                      }
                                      int v17 = "ASPFTLParseBufferToCxt: perfTotalDmaMb(616) cannot add 1 element to context";
                                      goto LABEL_161;
                                    case 617:
                                      if (AddMultipleFieldsToGenericContext(a1, "eanAvgInitTimeMs", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: eanAvgInitTimeMs(617) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 618:
                                      if (AddMultipleFieldsToGenericContext(a1, "eanAvgToFirstReadTimeMs", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: eanAvgToFirstReadTimeMs(618) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 619:
                                      if (AddMultipleFieldsToGenericContext(a1, "eanMaxBootReadTimeMs", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: eanMaxBootReadTimeMs(619) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 620:
                                      if (AddMultipleFieldsToGenericContext(a1, "eanAvgBootReadTimeMs", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: eanAvgBootReadTimeMs(620) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 621:
                                      if (v14 != 10) {
                                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: eanBootReadsHist(621): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      }
                                      if (v14 >= 0xA) {
                                        unsigned int v18 = 10;
                                      }
                                      else {
                                        unsigned int v18 = v14;
                                      }
                                      if (AddMultipleFieldsToGenericContext(a1, "eanBootReadsHist_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                      unsigned int v19 = "ASPFTLParseBufferToCxt: eanBootReadsHist(621): Cannot add 10 elements to context";
                                      }
                                      goto LABEL_2616;
                                    case 622:
                                      if (AddMultipleFieldsToGenericContext(a1, "maxBgInitTimeMs", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: maxBgInitTimeMs(622) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 623:
                                      if (AddMultipleFieldsToGenericContext(a1, "avgBgInitTimeMs", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: avgBgInitTimeMs(623) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 624:
                                      if (v14 != 16) {
                                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: clogFailReason(624): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      }
                                      if (v14 >= 0x10) {
                                        unsigned int v18 = 16;
                                      }
                                      else {
                                        unsigned int v18 = v14;
                                      }
                                      if (AddMultipleFieldsToGenericContext(a1, "clogFailReason_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                      unsigned int v19 = "ASPFTLParseBufferToCxt: clogFailReason(624): Cannot add 16 elements to context";
                                      }
                                      goto LABEL_2616;
                                    case 625:
                                      if (AddMultipleFieldsToGenericContext(a1, "eanMinBootReadMBPerSec", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: eanMinBootReadMBPerSec(625) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 626:
                                      if (AddMultipleFieldsToGenericContext(a1, "eanAvgBootReadMBPerSec", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: eanAvgBootReadMBPerSec(626) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 627:
                                      if (AddMultipleFieldsToGenericContext(a1, "minSkinnyPECycles", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: minSkinnyPECycles(627) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 628:
                                      if (AddMultipleFieldsToGenericContext(a1, "maxSkinnyPECycles", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: maxSkinnyPECycles(628) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 629:
                                      if (AddMultipleFieldsToGenericContext(a1, "averageSkinnyPECycles", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: averageSkinnyPECycles(629) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 630:
                                      if (v14 != 6) {
                                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: raidSuccessfulRecoEAN(630): (#6) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      }
                                      if (v14 >= 6) {
                                        unsigned int v18 = 6;
                                      }
                                      else {
                                        unsigned int v18 = v14;
                                      }
                                      if (AddMultipleFieldsToGenericContext(a1, "raidSuccessfulRecoEAN_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                      unsigned int v19 = "ASPFTLParseBufferToCxt: raidSuccessfulRecoEAN(630): Cannot add 6 elements to context";
                                      }
                                      goto LABEL_2616;
                                    case 631:
                                      if (v14 != 6) {
                                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: raidFailedRecoEAN(631): (#6) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      }
                                      if (v14 >= 6) {
                                        unsigned int v18 = 6;
                                      }
                                      else {
                                        unsigned int v18 = v14;
                                      }
                                      if (AddMultipleFieldsToGenericContext(a1, "raidFailedRecoEAN_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                      unsigned int v19 = "ASPFTLParseBufferToCxt: raidFailedRecoEAN(631): Cannot add 6 elements to context";
                                      }
                                      goto LABEL_2616;
                                    case 632:
                                      if (v14 != 6) {
                                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: eanFirstReadMode(632): (#6) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      }
                                      if (v14 >= 6) {
                                        unsigned int v18 = 6;
                                      }
                                      else {
                                        unsigned int v18 = v14;
                                      }
                                      if (AddMultipleFieldsToGenericContext(a1, "eanFirstReadMode_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                      unsigned int v19 = "ASPFTLParseBufferToCxt: eanFirstReadMode(632): Cannot add 6 elements to context";
                                      }
                                      goto LABEL_2616;
                                    case 635:
                                      if (AddMultipleFieldsToGenericContext(a1, "oslcHwGC", (uint64_t)v8, 8u, 1u)) {
                                        goto LABEL_162;
                                      }
                                      int v17 = "ASPFTLParseBufferToCxt: oslcHwGC(635) cannot add 1 element to context";
                                      goto LABEL_161;
                                    case 636:
                                      if (AddMultipleFieldsToGenericContext(a1, "oslcHwTT", (uint64_t)v8, 8u, 1u)) {
                                        goto LABEL_162;
                                      }
                                      int v17 = "ASPFTLParseBufferToCxt: oslcHwTT(636) cannot add 1 element to context";
                                      goto LABEL_161;
                                    case 637:
                                      if (AddMultipleFieldsToGenericContext(a1, "oslcHwNRP", (uint64_t)v8, 8u, 1u)) {
                                        goto LABEL_162;
                                      }
                                      int v17 = "ASPFTLParseBufferToCxt: oslcHwNRP(637) cannot add 1 element to context";
                                      goto LABEL_161;
                                    case 638:
                                      if (v14 != 10) {
                                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: oslcDemandBurstSize(638): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      }
                                      if (v14 >= 0xA) {
                                        unsigned int v18 = 10;
                                      }
                                      else {
                                        unsigned int v18 = v14;
                                      }
                                      if (AddMultipleFieldsToGenericContext(a1, "oslcDemandBurstSize_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                      unsigned int v19 = "ASPFTLParseBufferToCxt: oslcDemandBurstSize(638): Cannot add 10 elements to context";
                                      }
                                      goto LABEL_2616;
                                    case 639:
                                      if (AddMultipleFieldsToGenericContext(a1, "raidReconstructSuccessBandFlowOslc", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: raidReconstructSuccessBandFlowOslc(639) cannot add 1"
                                      }
                                            " element to context";
                                      goto LABEL_161;
                                    case 640:
                                      if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailBandFlowOslc", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowOslc(640) cannot add 1 el"
                                      }
                                            "ement to context";
                                      goto LABEL_161;
                                    case 641:
                                      if (AddMultipleFieldsToGenericContext(a1, "raidFailSectors", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: raidFailSectors(641) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 642:
                                      if (AddMultipleFieldsToGenericContext(a1, "eanFailSectors", (uint64_t)v8, 8u, 1u)) {
                                        goto LABEL_162;
                                      }
                                      int v17 = "ASPFTLParseBufferToCxt: eanFailSectors(642) cannot add 1 element to context";
                                      goto LABEL_161;
                                    case 643:
                                      if (AddMultipleFieldsToGenericContext(a1, "bdrTimeMode", (uint64_t)v8, 8u, 1u)) {
                                        goto LABEL_162;
                                      }
                                      int v17 = "ASPFTLParseBufferToCxt: bdrTimeMode(643) cannot add 1 element to context";
                                      goto LABEL_161;
                                    case 644:
                                      if (AddMultipleFieldsToGenericContext(a1, "raidParityNotSavedP", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: raidParityNotSavedP(644) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 645:
                                      if (AddMultipleFieldsToGenericContext(a1, "raidParityNotSavedQ", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: raidParityNotSavedQ(645) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 646:
                                      if (AddMultipleFieldsToGenericContext(a1, "raidParityInvalid", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: raidParityInvalid(646) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 647:
                                      if (AddMultipleFieldsToGenericContext(a1, "raidParityUnknown", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: raidParityUnknown(647) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 648:
                                      if (AddMultipleFieldsToGenericContext(a1, "raidParityUnmapped", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: raidParityUnmapped(648) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 649:
                                      if (AddMultipleFieldsToGenericContext(a1, "raidParityGCUnc", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: raidParityGCUnc(649) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 657:
                                      if (AddMultipleFieldsToGenericContext(a1, "AbortSkip_MPBXProbational", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXProbational(657) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 659:
                                      if (AddMultipleFieldsToGenericContext(a1, "raidVerificationReads", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: raidVerificationReads(659) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 666:
                                      if (AddMultipleFieldsToGenericContext(a1, "nofDies", (uint64_t)v8, 8u, 1u)) {
                                        goto LABEL_162;
                                      }
                                      int v17 = "ASPFTLParseBufferToCxt: nofDies(666) cannot add 1 element to context";
                                      goto LABEL_161;
                                    case 671:
                                      if (AddMultipleFieldsToGenericContext(a1, "skinnyBandsNum", (uint64_t)v8, 8u, 1u)) {
                                        goto LABEL_162;
                                      }
                                      int v17 = "ASPFTLParseBufferToCxt: skinnyBandsNum(671) cannot add 1 element to context";
                                      goto LABEL_161;
                                    case 672:
                                      if (AddMultipleFieldsToGenericContext(a1, "skinnyBandsNumDips", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: skinnyBandsNumDips(672) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 674:
                                      if (v14 != 8) {
                                        SetAPIErrorMessage("ASPFTLParseBufferToCxt: oslcNoVotesHw(674): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      }
                                      if (v14 >= 8) {
                                        unsigned int v18 = 8;
                                      }
                                      else {
                                        unsigned int v18 = v14;
                                      }
                                      if (AddMultipleFieldsToGenericContext(a1, "oslcNoVotesHw_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                      unsigned int v19 = "ASPFTLParseBufferToCxt: oslcNoVotesHw(674): Cannot add 8 elements to context";
                                      }
                                      goto LABEL_2616;
                                    case 675:
                                      if (AddMultipleFieldsToGenericContext(a1, "totalLbas", (uint64_t)v8, 8u, 1u)) {
                                        goto LABEL_162;
                                      }
                                      int v17 = "ASPFTLParseBufferToCxt: totalLbas(675) cannot add 1 element to context";
                                      goto LABEL_161;
                                    case 676:
                                      if (AddMultipleFieldsToGenericContext(a1, "bdrHostPingExtra", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: bdrHostPingExtra(676) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    case 677:
                                      if (AddMultipleFieldsToGenericContext(a1, "magazineInstanceMeta", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                      int v17 = "ASPFTLParseBufferToCxt: magazineInstanceMeta(677) cannot add 1 element to context";
                                      }
                                      goto LABEL_161;
                                    default:
                                      switch(v12)
                                      {
                                        case 680:
                                          if (v14 != 3) {
                                            SetAPIErrorMessage("ASPFTLParseBufferToCxt: magazineFWVersion(680): (#3) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          }
                                          if (v14 >= 3) {
                                            unsigned int v18 = 3;
                                          }
                                          else {
                                            unsigned int v18 = v14;
                                          }
                                          if (AddMultipleFieldsToGenericContext(a1, "magazineFWVersion_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                          unsigned int v19 = "ASPFTLParseBufferToCxt: magazineFWVersion(680): Cannot add 3 elements to context";
                                          }
                                          goto LABEL_2616;
                                        case 681:
                                          if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailPMXUnsup", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: raidReconstructFailPMXUnsup(681) cannot add 1 el"
                                          }
                                                "ement to context";
                                          goto LABEL_161;
                                        case 682:
                                          if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailBMXUnsup", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXUnsup(682) cannot add 1 el"
                                          }
                                                "ement to context";
                                          goto LABEL_161;
                                        case 683:
                                          if (AddMultipleFieldsToGenericContext(a1, "iBootNANDResets", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: iBootNANDResets(683) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 684:
                                          if (AddMultipleFieldsToGenericContext(a1, "pcieClkreqHighTimeout", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: pcieClkreqHighTimeout(684) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 687:
                                          if (v14 != 3) {
                                            SetAPIErrorMessage("ASPFTLParseBufferToCxt: cbdrInitSent(687): (#3) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          }
                                          if (v14 >= 3) {
                                            unsigned int v18 = 3;
                                          }
                                          else {
                                            unsigned int v18 = v14;
                                          }
                                          if (AddMultipleFieldsToGenericContext(a1, "cbdrInitSent_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                          unsigned int v19 = "ASPFTLParseBufferToCxt: cbdrInitSent(687): Cannot add 3 elements to context";
                                          }
                                          goto LABEL_2616;
                                        case 688:
                                          if (AddMultipleFieldsToGenericContext(a1, "cbdrPauseSent", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: cbdrPauseSent(688) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 689:
                                          if (AddMultipleFieldsToGenericContext(a1, "cbdrResumeSent", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: cbdrResumeSent(689) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 690:
                                          if (AddMultipleFieldsToGenericContext(a1, "cbdrGetResultSent", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: cbdrGetResultSent(690) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 691:
                                          if (AddMultipleFieldsToGenericContext(a1, "cbdrEarlyExits", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: cbdrEarlyExits(691) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 694:
                                          if (v14 != 10) {
                                            SetAPIErrorMessage("ASPFTLParseBufferToCxt: cbdrRefreshGrades(694): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          }
                                          if (v14 >= 0xA) {
                                            unsigned int v18 = 10;
                                          }
                                          else {
                                            unsigned int v18 = v14;
                                          }
                                          if (AddMultipleFieldsToGenericContext(a1, "cbdrRefreshGrades_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                          unsigned int v19 = "ASPFTLParseBufferToCxt: cbdrRefreshGrades(694): Cannot add 10 elements to context";
                                          }
                                          goto LABEL_2616;
                                        case 695:
                                          if (AddMultipleFieldsToGenericContext(a1, "cbdrNotEnoughReads", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: cbdrNotEnoughReads(695) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 696:
                                          if (AddMultipleFieldsToGenericContext(a1, "cbdrAborts", (uint64_t)v8, 8u, 1u)) {
                                            goto LABEL_162;
                                          }
                                          int v17 = "ASPFTLParseBufferToCxt: cbdrAborts(696) cannot add 1 element to context";
                                          goto LABEL_161;
                                        case 697:
                                          if (AddMultipleFieldsToGenericContext(a1, "TurboRaidHostClassifications", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: TurboRaidHostClassifications(697) cannot add 1 e"
                                          }
                                                "lement to context";
                                          goto LABEL_161;
                                        case 698:
                                          if (AddMultipleFieldsToGenericContext(a1, "TurboRaidInternalClassifications", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: TurboRaidInternalClassifications(698) cannot add"
                                          }
                                                " 1 element to context";
                                          goto LABEL_161;
                                        case 699:
                                          if (AddMultipleFieldsToGenericContext(a1, "cbdrFullyDone", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: cbdrFullyDone(699) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 702:
                                          if (v14 != 32) {
                                            SetAPIErrorMessage("ASPFTLParseBufferToCxt: vcurve(702): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          }
                                          if (v14 >= 0x20) {
                                            unsigned int v18 = 32;
                                          }
                                          else {
                                            unsigned int v18 = v14;
                                          }
                                          if (AddMultipleFieldsToGenericContext(a1, "vcurve_", (uint64_t)v8, 8u, v18)) {
                                            goto LABEL_110;
                                          }
                                          unsigned int v19 = "ASPFTLParseBufferToCxt: vcurve(702): Cannot add 32 elements to context";
                                          goto LABEL_2616;
                                        case 703:
                                          if (v14 != 12) {
                                            SetAPIErrorMessage("ASPFTLParseBufferToCxt: injDepth(703): (#12) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          }
                                          if (v14 >= 0xC) {
                                            unsigned int v18 = 12;
                                          }
                                          else {
                                            unsigned int v18 = v14;
                                          }
                                          if (AddMultipleFieldsToGenericContext(a1, "injDepth_", (uint64_t)v8, 8u, v18)) {
                                            goto LABEL_110;
                                          }
                                          unsigned int v19 = "ASPFTLParseBufferToCxt: injDepth(703): Cannot add 12 elements to context";
                                          goto LABEL_2616;
                                        case 704:
                                          if (AddMultipleFieldsToGenericContext(a1, "logical_disk_occupied_promiles", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: logical_disk_occupied_promiles(704) cannot add 1"
                                          }
                                                " element to context";
                                          goto LABEL_161;
                                        case 711:
                                          if (AddMultipleFieldsToGenericContext(a1, "raidPrevFailedReconstructSkip", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: raidPrevFailedReconstructSkip(711) cannot add 1 "
                                          }
                                                "element to context";
                                          goto LABEL_161;
                                        case 712:
                                          if (AddMultipleFieldsToGenericContext(a1, "TurboRaidSuccessfulHostAuxReads", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: TurboRaidSuccessfulHostAuxReads(712) cannot add "
                                          }
                                                "1 element to context";
                                          goto LABEL_161;
                                        case 713:
                                          if (AddMultipleFieldsToGenericContext(a1, "TurboRaidSuccessfulInternalAuxReads", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: TurboRaidSuccessfulInternalAuxReads(713) cannot "
                                          }
                                                "add 1 element to context";
                                          goto LABEL_161;
                                        case 714:
                                          if (AddMultipleFieldsToGenericContext(a1, "turboRaidClassificationReliabilityHost", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: turboRaidClassificationReliabilityHost(714) cann"
                                          }
                                                "ot add 1 element to context";
                                          goto LABEL_161;
                                        case 715:
                                          if (AddMultipleFieldsToGenericContext(a1, "turboRaidClassificationReliabilityInternal", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: turboRaidClassificationReliabilityInternal(715) "
                                          }
                                                "cannot add 1 element to context";
                                          goto LABEL_161;
                                        case 716:
                                          if (AddMultipleFieldsToGenericContext(a1, "turboRaidClassificationQualityHost", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: turboRaidClassificationQualityHost(716) cannot a"
                                          }
                                                "dd 1 element to context";
                                          goto LABEL_161;
                                        case 717:
                                          if (AddMultipleFieldsToGenericContext(a1, "turboRaidClassificationQualityInternal", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: turboRaidClassificationQualityInternal(717) cann"
                                          }
                                                "ot add 1 element to context";
                                          goto LABEL_161;
                                        case 719:
                                          if (AddMultipleFieldsToGenericContext(a1, "skinnyBandErases", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: skinnyBandErases(719) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 721:
                                          if (AddMultipleFieldsToGenericContext(a1, "gcPDusterDestinations", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: gcPDusterDestinations(721) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 722:
                                          if (AddMultipleFieldsToGenericContext(a1, "gcPDusterWrites", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: gcPDusterWrites(722) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 730:
                                          if (AddMultipleFieldsToGenericContext(a1, "rvFails", (uint64_t)v8, 8u, 1u)) {
                                            goto LABEL_162;
                                          }
                                          int v17 = "ASPFTLParseBufferToCxt: rvFails(730) cannot add 1 element to context";
                                          goto LABEL_161;
                                        case 737:
                                          if (AddMultipleFieldsToGenericContext(a1, "TurboRaidFailedHostAuxReads", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: TurboRaidFailedHostAuxReads(737) cannot add 1 el"
                                          }
                                                "ement to context";
                                          goto LABEL_161;
                                        case 738:
                                          if (AddMultipleFieldsToGenericContext(a1, "TurboRaidFailedInternalAuxReads", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: TurboRaidFailedInternalAuxReads(738) cannot add "
                                          }
                                                "1 element to context";
                                          goto LABEL_161;
                                        case 741:
                                          if (AddMultipleFieldsToGenericContext(a1, "autoSkipTriggers", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: autoSkipTriggers(741) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 742:
                                          if (AddMultipleFieldsToGenericContext(a1, "autoSkipPlanes", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: autoSkipPlanes(742) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 744:
                                          if (v14 != 8) {
                                            SetAPIErrorMessage("ASPFTLParseBufferToCxt: raidReconstructDurationHisto(744): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          }
                                          if (v14 >= 8) {
                                            unsigned int v18 = 8;
                                          }
                                          else {
                                            unsigned int v18 = v14;
                                          }
                                          if (AddMultipleFieldsToGenericContext(a1, "raidReconstructDurationHisto_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                          unsigned int v19 = "ASPFTLParseBufferToCxt: raidReconstructDurationHisto(744): Cannot add 8 "
                                          }
                                                "elements to context";
                                          goto LABEL_2616;
                                        case 745:
                                          if (v14 != 8) {
                                            SetAPIErrorMessage("ASPFTLParseBufferToCxt: failsOnReconstructHisto(745): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          }
                                          if (v14 >= 8) {
                                            unsigned int v18 = 8;
                                          }
                                          else {
                                            unsigned int v18 = v14;
                                          }
                                          if (AddMultipleFieldsToGenericContext(a1, "failsOnReconstructHisto_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                          unsigned int v19 = "ASPFTLParseBufferToCxt: failsOnReconstructHisto(745): Cannot add 8 elements to context";
                                          }
                                          goto LABEL_2616;
                                        case 746:
                                          if (AddMultipleFieldsToGenericContext(a1, "bandKill_userFlattenExcessive", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: bandKill_userFlattenExcessive(746) cannot add 1 "
                                          }
                                                "element to context";
                                          goto LABEL_161;
                                        case 747:
                                          if (AddMultipleFieldsToGenericContext(a1, "bandKill_IntFlattenExcessive", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: bandKill_IntFlattenExcessive(747) cannot add 1 e"
                                          }
                                                "lement to context";
                                          goto LABEL_161;
                                        case 748:
                                          if (AddMultipleFieldsToGenericContext(a1, "bandKill_userFlattenBalance", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: bandKill_userFlattenBalance(748) cannot add 1 el"
                                          }
                                                "ement to context";
                                          goto LABEL_161;
                                        case 749:
                                          if (AddMultipleFieldsToGenericContext(a1, "bandKill_intFlattenBalance", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: bandKill_intFlattenBalance(749) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 750:
                                          if (AddMultipleFieldsToGenericContext(a1, "bandKill_formatVertExcessive", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: bandKill_formatVertExcessive(750) cannot add 1 e"
                                          }
                                                "lement to context";
                                          goto LABEL_161;
                                        case 751:
                                          if (AddMultipleFieldsToGenericContext(a1, "bandKill_formatVertBalance", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: bandKill_formatVertBalance(751) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 753:
                                          if (AddMultipleFieldsToGenericContext(a1, "cbdrNumSlowRefreshes", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: cbdrNumSlowRefreshes(753) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 754:
                                          if (AddMultipleFieldsToGenericContext(a1, "cbdrNumFastRefreshes", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: cbdrNumFastRefreshes(754) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 755:
                                          if (AddMultipleFieldsToGenericContext(a1, "cbdrTotalRefreshValidity", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: cbdrTotalRefreshValidity(755) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 756:
                                          if (v14 != 9) {
                                            SetAPIErrorMessage("ASPFTLParseBufferToCxt: cbdrRefreshedAges(756): (#9) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          }
                                          if (v14 >= 9) {
                                            unsigned int v18 = 9;
                                          }
                                          else {
                                            unsigned int v18 = v14;
                                          }
                                          if (AddMultipleFieldsToGenericContext(a1, "cbdrRefreshedAges_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                          unsigned int v19 = "ASPFTLParseBufferToCxt: cbdrRefreshedAges(756): Cannot add 9 elements to context";
                                          }
                                          goto LABEL_2616;
                                        case 758:
                                          if (AddMultipleFieldsToGenericContext(a1, "cbdrSkippedBlocks", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: cbdrSkippedBlocks(758) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 759:
                                          if (v14 != 5) {
                                            SetAPIErrorMessage("ASPFTLParseBufferToCxt: cbdrScanPct(759): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          }
                                          if (v14 >= 5) {
                                            unsigned int v18 = 5;
                                          }
                                          else {
                                            unsigned int v18 = v14;
                                          }
                                          if (AddMultipleFieldsToGenericContext(a1, "cbdrScanPct_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                          unsigned int v19 = "ASPFTLParseBufferToCxt: cbdrScanPct(759): Cannot add 5 elements to context";
                                          }
                                          goto LABEL_2616;
                                        case 760:
                                          if (AddMultipleFieldsToGenericContext(a1, "raidSuccessfulBMXReconstructionInternal", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: raidSuccessfulBMXReconstructionInternal(760) can"
                                          }
                                                "not add 1 element to context";
                                          goto LABEL_161;
                                        case 761:
                                          if (AddMultipleFieldsToGenericContext(a1, "raidSuccessfulBMXReconstructionHost", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: raidSuccessfulBMXReconstructionHost(761) cannot "
                                          }
                                                "add 1 element to context";
                                          goto LABEL_161;
                                        case 762:
                                          if (AddMultipleFieldsToGenericContext(a1, "raidFailedBMXReconstructionInternal", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: raidFailedBMXReconstructionInternal(762) cannot "
                                          }
                                                "add 1 element to context";
                                          goto LABEL_161;
                                        case 763:
                                          if (AddMultipleFieldsToGenericContext(a1, "raidFailedBMXReconstructionHost", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: raidFailedBMXReconstructionHost(763) cannot add "
                                          }
                                                "1 element to context";
                                          goto LABEL_161;
                                        case 764:
                                          if (AddMultipleFieldsToGenericContext(a1, "ricSPRVFail", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: ricSPRVFail(764) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 765:
                                          if (AddMultipleFieldsToGenericContext(a1, "ricMPRVFail", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: ricMPRVFail(765) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 767:
                                          if (v14 != 10) {
                                            SetAPIErrorMessage("ASPFTLParseBufferToCxt: cbdrRefreshGradesSLC(767): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          }
                                          if (v14 >= 0xA) {
                                            unsigned int v18 = 10;
                                          }
                                          else {
                                            unsigned int v18 = v14;
                                          }
                                          if (AddMultipleFieldsToGenericContext(a1, "cbdrRefreshGradesSLC_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                          unsigned int v19 = "ASPFTLParseBufferToCxt: cbdrRefreshGradesSLC(767): Cannot add 10 elements to context";
                                          }
                                          goto LABEL_2616;
                                        case 768:
                                          if (v14 != 9) {
                                            SetAPIErrorMessage("ASPFTLParseBufferToCxt: cbdrRefreshedAgesSLC(768): (#9) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          }
                                          if (v14 >= 9) {
                                            unsigned int v18 = 9;
                                          }
                                          else {
                                            unsigned int v18 = v14;
                                          }
                                          if (AddMultipleFieldsToGenericContext(a1, "cbdrRefreshedAgesSLC_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                          unsigned int v19 = "ASPFTLParseBufferToCxt: cbdrRefreshedAgesSLC(768): Cannot add 9 elements to context";
                                          }
                                          goto LABEL_2616;
                                        case 769:
                                          if (v14 != 5) {
                                            SetAPIErrorMessage("ASPFTLParseBufferToCxt: cbdrScanPctSLC(769): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          }
                                          if (v14 >= 5) {
                                            unsigned int v18 = 5;
                                          }
                                          else {
                                            unsigned int v18 = v14;
                                          }
                                          if (AddMultipleFieldsToGenericContext(a1, "cbdrScanPctSLC_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                          unsigned int v19 = "ASPFTLParseBufferToCxt: cbdrScanPctSLC(769): Cannot add 5 elements to context";
                                          }
                                          goto LABEL_2616;
                                        case 770:
                                          if (v14 != 8) {
                                            SetAPIErrorMessage("ASPFTLParseBufferToCxt: cpuBurstLength(770): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          }
                                          if (v14 >= 8) {
                                            unsigned int v18 = 8;
                                          }
                                          else {
                                            unsigned int v18 = v14;
                                          }
                                          if (AddMultipleFieldsToGenericContext(a1, "cpuBurstLength_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                          unsigned int v19 = "ASPFTLParseBufferToCxt: cpuBurstLength(770): Cannot add 8 elements to context";
                                          }
                                          goto LABEL_2616;
                                        case 771:
                                          if (AddMultipleFieldsToGenericContext(a1, "autoSkipRaidRecoFail", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: autoSkipRaidRecoFail(771) cannot add 1 element to context";
                                          }
                                          goto LABEL_161;
                                        case 772:
                                          if (v14 != 32) {
                                            SetAPIErrorMessage("ASPFTLParseBufferToCxt: dmReasonsSlc(772): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          }
                                          if (v14 >= 0x20) {
                                            unsigned int v18 = 32;
                                          }
                                          else {
                                            unsigned int v18 = v14;
                                          }
                                          if (AddMultipleFieldsToGenericContext(a1, "dmReasonsSlc_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                          unsigned int v19 = "ASPFTLParseBufferToCxt: dmReasonsSlc(772): Cannot add 32 elements to context";
                                          }
                                          goto LABEL_2616;
                                        case 773:
                                          if (v14 != 32) {
                                            SetAPIErrorMessage("ASPFTLParseBufferToCxt: dmReasonsTlc(773): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          }
                                          if (v14 >= 0x20) {
                                            unsigned int v18 = 32;
                                          }
                                          else {
                                            unsigned int v18 = v14;
                                          }
                                          if (AddMultipleFieldsToGenericContext(a1, "dmReasonsTlc_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                          unsigned int v19 = "ASPFTLParseBufferToCxt: dmReasonsTlc(773): Cannot add 32 elements to context";
                                          }
                                          goto LABEL_2616;
                                        case 774:
                                          if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailBMXAbort", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXAbort(774) cannot add 1 el"
                                          }
                                                "ement to context";
                                          goto LABEL_161;
                                        case 775:
                                          if (AddMultipleFieldsToGenericContext(a1, "bandKill_fatBindingNoBlocks", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: bandKill_fatBindingNoBlocks(775) cannot add 1 el"
                                          }
                                                "ement to context";
                                          goto LABEL_161;
                                        case 776:
                                          if (AddMultipleFieldsToGenericContext(a1, "bandKill_fatBindingFewBlocks", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                          int v17 = "ASPFTLParseBufferToCxt: bandKill_fatBindingFewBlocks(776) cannot add 1 e"
                                          }
                                                "lement to context";
                                          goto LABEL_161;
                                        default:
                                          switch(v12)
                                          {
                                            case 777:
                                              if (AddMultipleFieldsToGenericContext(a1, "numBadBootBlocks", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: numBadBootBlocks(777) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 778:
                                              if (AddMultipleFieldsToGenericContext(a1, "snapshotCPUHigh", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: snapshotCPUHigh(778) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 779:
                                              if (AddMultipleFieldsToGenericContext(a1, "snapshotCPULow", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: snapshotCPULow(779) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 780:
                                              if (AddMultipleFieldsToGenericContext(a1, "gcWithoutBMs", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: gcWithoutBMs(780) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 781:
                                              if (v14 != 10) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: gcSearchTimeHistory(781): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 0xA) {
                                                unsigned int v18 = 10;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "gcSearchTimeHistory_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: gcSearchTimeHistory(781): Cannot add 10 elements to context";
                                              }
                                              goto LABEL_2616;
                                            case 785:
                                              if (v14 != 16) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: gcSearchPortion(785): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 0x10) {
                                                unsigned int v18 = 16;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "gcSearchPortion_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: gcSearchPortion(785): Cannot add 16 elements to context";
                                              }
                                              goto LABEL_2616;
                                            case 786:
                                              if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailBmxMp", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: raidReconstructFailBmxMp(786) cannot add 1 e"
                                              }
                                                    "lement to context";
                                              goto LABEL_161;
                                            case 787:
                                              if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailBmx", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: raidReconstructFailBmx(787) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 788:
                                              if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailBMXUECC", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXUECC(788) cannot add 1"
                                              }
                                                    " element to context";
                                              goto LABEL_161;
                                            case 789:
                                              if (AddMultipleFieldsToGenericContext(a1, "raidReconstructFailBMXBlank", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXBlank(789) cannot add "
                                              }
                                                    "1 element to context";
                                              goto LABEL_161;
                                            case 790:
                                              if (AddMultipleFieldsToGenericContext(a1, "raidPrevFailedReconstructBmxMpSkip", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: raidPrevFailedReconstructBmxMpSkip(790) cann"
                                              }
                                                    "ot add 1 element to context";
                                              goto LABEL_161;
                                            case 792:
                                              if (AddMultipleFieldsToGenericContext(a1, "numTLCFatBands", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: numTLCFatBands(792) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 793:
                                              if (AddMultipleFieldsToGenericContext(a1, "fatValidity", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: fatValidity(793) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 794:
                                              if (AddMultipleFieldsToGenericContext(a1, "fatTotal", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: fatTotal(794) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 798:
                                              if (v14 != 4) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: raidBMXFailP(798): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 4) {
                                                unsigned int v18 = 4;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "raidBMXFailP_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: raidBMXFailP(798): Cannot add 4 elements to context";
                                              }
                                              goto LABEL_2616;
                                            case 799:
                                              if (v14 != 4) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: raidBMXFailUECC(799): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 4) {
                                                unsigned int v18 = 4;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "raidBMXFailUECC_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: raidBMXFailUECC(799): Cannot add 4 elements to context";
                                              }
                                              goto LABEL_2616;
                                            case 804:
                                              if (v14 != 4) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: raidBMXFailNoSPBX(804): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 4) {
                                                unsigned int v18 = 4;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "raidBMXFailNoSPBX_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: raidBMXFailNoSPBX(804): Cannot add 4 elements to context";
                                              }
                                              goto LABEL_2616;
                                            case 806:
                                              if (v14 != 4) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: raidBMXFailBlank(806): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 4) {
                                                unsigned int v18 = 4;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "raidBMXFailBlank_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: raidBMXFailBlank(806): Cannot add 4 elements to context";
                                              }
                                              goto LABEL_2616;
                                            case 809:
                                              if (v14 != 4) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: raidBMXFailUnsup(809): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 4) {
                                                unsigned int v18 = 4;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "raidBMXFailUnsup_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: raidBMXFailUnsup(809): Cannot add 4 elements to context";
                                              }
                                              goto LABEL_2616;
                                            case 811:
                                              if (v14 != 4) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: raidBMXFailMpSkip(811): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 4) {
                                                unsigned int v18 = 4;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "raidBMXFailMpSkip_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: raidBMXFailMpSkip(811): Cannot add 4 elements to context";
                                              }
                                              goto LABEL_2616;
                                            case 812:
                                              if (v14 != 4) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: raidBMXFailAbort(812): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 4) {
                                                unsigned int v18 = 4;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "raidBMXFailAbort_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: raidBMXFailAbort(812): Cannot add 4 elements to context";
                                              }
                                              goto LABEL_2616;
                                            case 813:
                                              if (AddMultipleFieldsToGenericContext(a1, "TurboRaidIsEnabled", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: TurboRaidIsEnabled(813) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 814:
                                              if (v14 != 4) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: raidBMXFailOther(814): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 4) {
                                                unsigned int v18 = 4;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "raidBMXFailOther_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: raidBMXFailOther(814): Cannot add 4 elements to context";
                                              }
                                              goto LABEL_2616;
                                            case 815:
                                              if (v14 != 4) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: raidBMXSuccess(815): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 4) {
                                                unsigned int v18 = 4;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "raidBMXSuccess_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: raidBMXSuccess(815): Cannot add 4 elements to context";
                                              }
                                              goto LABEL_2616;
                                            case 816:
                                              if (AddMultipleFieldsToGenericContext(a1, "skinnyBandsExtraDip", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: skinnyBandsExtraDip(816) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 821:
                                              if (AddMultipleFieldsToGenericContext(a1, "writeAmp", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: writeAmp(821) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 822:
                                              if (AddMultipleFieldsToGenericContext(a1, "ricMaxClogOnlyPages", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: ricMaxClogOnlyPages(822) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 823:
                                              if (v14 != 3) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: readClassifyStatusesHisto(823): (#3) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 3) {
                                                unsigned int v18 = 3;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "readClassifyStatusesHisto_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: readClassifyStatusesHisto(823): Cannot add 3"
                                              }
                                                    " elements to context";
                                              goto LABEL_2616;
                                            case 824:
                                              if (v14 != 10) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: readWithAuxStatusesHisto(824): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 0xA) {
                                                unsigned int v18 = 10;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "readWithAuxStatusesHisto_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: readWithAuxStatusesHisto(824): Cannot add 10"
                                              }
                                                    " elements to context";
                                              goto LABEL_2616;
                                            case 825:
                                              if (v14 != 10) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: readReconstructStatusesHisto(825): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 0xA) {
                                                unsigned int v18 = 10;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "readReconstructStatusesHisto_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: readReconstructStatusesHisto(825): Cannot ad"
                                              }
                                                    "d 10 elements to context";
                                              goto LABEL_2616;
                                            case 826:
                                              if (AddMultipleFieldsToGenericContext(a1, "bdrBackupChecks", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: bdrBackupChecks(826) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 827:
                                              if (AddMultipleFieldsToGenericContext(a1, "ricExceedClogOnlyPagesTH", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: ricExceedClogOnlyPagesTH(827) cannot add 1 e"
                                              }
                                                    "lement to context";
                                              goto LABEL_161;
                                            case 828:
                                              if (AddMultipleFieldsToGenericContext(a1, "numDipFailures", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: numDipFailures(828) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 831:
                                              if (AddMultipleFieldsToGenericContext(a1, "prefetchNextRange", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: prefetchNextRange(831) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 862:
                                              if (AddMultipleFieldsToGenericContext(a1, "raidSuccessfulSkip", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: raidSuccessfulSkip(862) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 863:
                                              if (AddMultipleFieldsToGenericContext(a1, "raidFailedSkip", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: raidFailedSkip(863) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 864:
                                              if (AddMultipleFieldsToGenericContext(a1, "raidSkipAttempts", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: raidSkipAttempts(864) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 865:
                                              if (v14 != 16) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: timeOfThrottlingPerLevel(865): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 0x10) {
                                                unsigned int v18 = 16;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "timeOfThrottlingPerLevel_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerLevel(865): Cannot add 16"
                                              }
                                                    " elements to context";
                                              goto LABEL_2616;
                                            case 866:
                                              if (v14 != 16) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: timeOfThrottlingPerReadLevel(866): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 0x10) {
                                                unsigned int v18 = 16;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "timeOfThrottlingPerReadLevel_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerReadLevel(866): Cannot ad"
                                              }
                                                    "d 16 elements to context";
                                              goto LABEL_2616;
                                            case 867:
                                              if (v14 != 16) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: timeOfThrottlingPerWriteLevel(867): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 0x10) {
                                                unsigned int v18 = 16;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "timeOfThrottlingPerWriteLevel_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerWriteLevel(867): Cannot a"
                                              }
                                                    "dd 16 elements to context";
                                              goto LABEL_2616;
                                            case 868:
                                              if (v14 != 32) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: dmReasonsSlc_1bc(868): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 0x20) {
                                                unsigned int v18 = 32;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "dmReasonsSlc_1bc_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc(868): Cannot add 32 elements to context";
                                              }
                                              goto LABEL_2616;
                                            case 869:
                                              if (v14 != 32) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: dmReasonsTlc_1bc(869): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 0x20) {
                                                unsigned int v18 = 32;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "dmReasonsTlc_1bc_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc(869): Cannot add 32 elements to context";
                                              }
                                              goto LABEL_2616;
                                            case 870:
                                              if (v14 != 32) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: dmReasonsSlc_1bc_he(870): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 0x20) {
                                                unsigned int v18 = 32;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "dmReasonsSlc_1bc_he_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc_he(870): Cannot add 32 elements to context";
                                              }
                                              goto LABEL_2616;
                                            case 871:
                                              if (v14 != 32) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: dmReasonsTlc_1bc_he(871): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 0x20) {
                                                unsigned int v18 = 32;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "dmReasonsTlc_1bc_he_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc_he(871): Cannot add 32 elements to context";
                                              }
                                              goto LABEL_2616;
                                            case 876:
                                              if (v14 != 32) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: dmReasonsSlc_mbc(876): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 0x20) {
                                                unsigned int v18 = 32;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "dmReasonsSlc_mbc_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: dmReasonsSlc_mbc(876): Cannot add 32 elements to context";
                                              }
                                              goto LABEL_2616;
                                            case 877:
                                              if (v14 != 32) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: dmReasonsTlc_mbc(877): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 0x20) {
                                                unsigned int v18 = 32;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "dmReasonsTlc_mbc_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: dmReasonsTlc_mbc(877): Cannot add 32 elements to context";
                                              }
                                              goto LABEL_2616;
                                            case 883:
                                              if (AddMultipleFieldsToGenericContext(a1, "clogEmptyProgramms", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: clogEmptyProgramms(883) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 884:
                                              if (AddMultipleFieldsToGenericContext(a1, "oslcHwCloseBand", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: oslcHwCloseBand(884) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 891:
                                              if (v14 != 2) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: turboRaidSuccessAuxPartition(891): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 2) {
                                                unsigned int v18 = 2;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "turboRaidSuccessAuxPartition_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: turboRaidSuccessAuxPartition(891): Cannot ad"
                                              }
                                                    "d 2 elements to context";
                                              goto LABEL_2616;
                                            case 892:
                                              if (v14 != 2) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: turboRaidFailAuxPartition(892): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 2) {
                                                unsigned int v18 = 2;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "turboRaidFailAuxPartition_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: turboRaidFailAuxPartition(892): Cannot add 2"
                                              }
                                                    " elements to context";
                                              goto LABEL_2616;
                                            case 893:
                                              if (v14 != 2) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: turboRaidClassifyQualPartition(893): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 2) {
                                                unsigned int v18 = 2;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "turboRaidClassifyQualPartition_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: turboRaidClassifyQualPartition(893): Cannot "
                                              }
                                                    "add 2 elements to context";
                                              goto LABEL_2616;
                                            case 894:
                                              if (v14 != 2) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: turboRaidClassifyRelPartition(894): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 2) {
                                                unsigned int v18 = 2;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "turboRaidClassifyRelPartition_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: turboRaidClassifyRelPartition(894): Cannot a"
                                              }
                                                    "dd 2 elements to context";
                                              goto LABEL_2616;
                                            case 895:
                                              if (AddMultipleFieldsToGenericContext(a1, "IND_pool_freeMinSilo", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: IND_pool_freeMinSilo(895) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 896:
                                              if (AddMultipleFieldsToGenericContext(a1, "autoSweepBlocks", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: autoSweepBlocks(896) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 897:
                                              if (v14 != 16) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: wcWrFragSizes(897): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 0x10) {
                                                unsigned int v18 = 16;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "wcWrFragSizes_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: wcWrFragSizes(897): Cannot add 16 elements to context";
                                              }
                                              goto LABEL_2616;
                                            case 898:
                                              if (v14 != 16) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: indStateAcrossGcDidNoL(898): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 0x10) {
                                                unsigned int v18 = 16;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "indStateAcrossGcDidNoL_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: indStateAcrossGcDidNoL(898): Cannot add 16 e"
                                              }
                                                    "lements to context";
                                              goto LABEL_2616;
                                            case 899:
                                              if (v14 != 16) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: indStateAcrossGcDidL(899): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 0x10) {
                                                unsigned int v18 = 16;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "indStateAcrossGcDidL_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: indStateAcrossGcDidL(899): Cannot add 16 ele"
                                              }
                                                    "ments to context";
                                              goto LABEL_2616;
                                            case 900:
                                              if (AddMultipleFieldsToGenericContext(a1, "turboRaidNoClassifyDueToWasRetire", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToWasRetire(900) canno"
                                              }
                                                    "t add 1 element to context";
                                              goto LABEL_161;
                                            case 901:
                                              if (AddMultipleFieldsToGenericContext(a1, "turboRaidNoClassifyDueToOpenBand", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToOpenBand(901) cannot"
                                              }
                                                    " add 1 element to context";
                                              goto LABEL_161;
                                            case 902:
                                              if (AddMultipleFieldsToGenericContext(a1, "turboRaidNoClassifyDueToQualityBlock", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToQualityBlock(902) ca"
                                              }
                                                    "nnot add 1 element to context";
                                              goto LABEL_161;
                                            case 903:
                                              if (AddMultipleFieldsToGenericContext(a1, "turboRaidGbbOpenBand", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: turboRaidGbbOpenBand(903) cannot add 1 element to context";
                                              }
                                              goto LABEL_161;
                                            case 904:
                                              if (AddMultipleFieldsToGenericContext(a1, "turboRaidGbbShouldRetireOnRefresh", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                              int v17 = "ASPFTLParseBufferToCxt: turboRaidGbbShouldRetireOnRefresh(904) canno"
                                              }
                                                    "t add 1 element to context";
                                              goto LABEL_161;
                                            case 905:
                                              if (v14 != 16) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: turboRaidRelPerBlock(905): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 0x10) {
                                                unsigned int v18 = 16;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "turboRaidRelPerBlock_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: turboRaidRelPerBlock(905): Cannot add 16 ele"
                                              }
                                                    "ments to context";
                                              goto LABEL_2616;
                                            case 906:
                                              if (v14 != 16) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: turboRaidRelBetweenRefreshesPerBlock(906): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 0x10) {
                                                unsigned int v18 = 16;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "turboRaidRelBetweenRefreshesPerBlock_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: turboRaidRelBetweenRefreshesPerBlock(906): C"
                                              }
                                                    "annot add 16 elements to context";
                                              goto LABEL_2616;
                                            default:
                                              if (v12 <= 1039)
                                              {
                                                switch(v12)
                                                {
                                                  case 907:
                                                    if (v14 != 16) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: turboRaidMaxRelBetweenRefreshesPerBlock(907): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x10) {
                                                      unsigned int v18 = 16;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "turboRaidMaxRelBetweenRefreshesPerBlock_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: turboRaidMaxRelBetweenRefreshesPerBloc"
                                                    }
                                                          "k(907): Cannot add 16 elements to context";
                                                    goto LABEL_2616;
                                                  case 908:
                                                    if (v14 != 16) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: turboRaidMinRelBetweenRefreshesPerBlock(908): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x10) {
                                                      unsigned int v18 = 16;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "turboRaidMinRelBetweenRefreshesPerBlock_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: turboRaidMinRelBetweenRefreshesPerBloc"
                                                    }
                                                          "k(908): Cannot add 16 elements to context";
                                                    goto LABEL_2616;
                                                  case 909:
                                                  case 910:
                                                  case 911:
                                                  case 912:
                                                  case 913:
                                                  case 914:
                                                  case 915:
                                                  case 916:
                                                  case 917:
                                                  case 924:
                                                  case 925:
                                                  case 926:
                                                  case 927:
                                                  case 928:
                                                  case 929:
                                                  case 936:
                                                  case 941:
                                                  case 945:
                                                  case 946:
                                                  case 947:
                                                  case 949:
                                                  case 950:
                                                  case 952:
                                                  case 954:
                                                  case 955:
                                                  case 956:
                                                  case 957:
                                                  case 958:
                                                  case 959:
                                                  case 960:
                                                  case 963:
                                                  case 964:
                                                  case 965:
                                                  case 966:
                                                  case 968:
                                                  case 969:
                                                  case 970:
                                                    goto LABEL_2478;
                                                  case 918:
                                                    if (v14 != 16) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenRel(918): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x10) {
                                                      unsigned int v18 = 16;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "turboRaidMaxCyclesBetweenRel_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenRel(918): Can"
                                                    }
                                                          "not add 16 elements to context";
                                                    goto LABEL_2616;
                                                  case 919:
                                                    if (v14 != 16) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenRel(919): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x10) {
                                                      unsigned int v18 = 16;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "turboRaidMinCyclesBetweenRel_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenRel(919): Can"
                                                    }
                                                          "not add 16 elements to context";
                                                    goto LABEL_2616;
                                                  case 920:
                                                    if (v14 != 16) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: turboRaidAuxPerBlock(920): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x10) {
                                                      unsigned int v18 = 16;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "turboRaidAuxPerBlock_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: turboRaidAuxPerBlock(920): Cannot add "
                                                    }
                                                          "16 elements to context";
                                                    goto LABEL_2616;
                                                  case 921:
                                                    if (v14 != 16) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: turboRaidAuxBetweenRefreshesPerBlock(921): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x10) {
                                                      unsigned int v18 = 16;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "turboRaidAuxBetweenRefreshesPerBlock_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: turboRaidAuxBetweenRefreshesPerBlock(9"
                                                    }
                                                          "21): Cannot add 16 elements to context";
                                                    goto LABEL_2616;
                                                  case 922:
                                                    if (AddMultipleFieldsToGenericContext(a1, "turboRaidRelLockMark", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                    int v17 = "ASPFTLParseBufferToCxt: turboRaidRelLockMark(922) cannot add 1"
                                                    }
                                                          " element to context";
                                                    goto LABEL_161;
                                                  case 923:
                                                    if (AddMultipleFieldsToGenericContext(a1, "turboRaidAuxLockMark", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                    int v17 = "ASPFTLParseBufferToCxt: turboRaidAuxLockMark(923) cannot add 1"
                                                    }
                                                          " element to context";
                                                    goto LABEL_161;
                                                  case 930:
                                                    if (v14 != 16) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenAux(930): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x10) {
                                                      unsigned int v18 = 16;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "turboRaidMaxCyclesBetweenAux_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenAux(930): Can"
                                                    }
                                                          "not add 16 elements to context";
                                                    goto LABEL_2616;
                                                  case 931:
                                                    if (v14 != 16) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenAux(931): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x10) {
                                                      unsigned int v18 = 16;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "turboRaidMinCyclesBetweenAux_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenAux(931): Can"
                                                    }
                                                          "not add 16 elements to context";
                                                    goto LABEL_2616;
                                                  case 932:
                                                    if (v14 != 16) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: turboRaidLastRelPECycles(932): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x10) {
                                                      unsigned int v18 = 16;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "turboRaidLastRelPECycles_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: turboRaidLastRelPECycles(932): Cannot "
                                                    }
                                                          "add 16 elements to context";
                                                    goto LABEL_2616;
                                                  case 933:
                                                    if (v14 != 16) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: turboRaidRelQualPECycles(933): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x10) {
                                                      unsigned int v18 = 16;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "turboRaidRelQualPECycles_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: turboRaidRelQualPECycles(933): Cannot "
                                                    }
                                                          "add 16 elements to context";
                                                    goto LABEL_2616;
                                                  case 934:
                                                    if (v14 != 16) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: turboRaidLastAuxPECycles(934): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x10) {
                                                      unsigned int v18 = 16;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "turboRaidLastAuxPECycles_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: turboRaidLastAuxPECycles(934): Cannot "
                                                    }
                                                          "add 16 elements to context";
                                                    goto LABEL_2616;
                                                  case 935:
                                                    if (v14 != 16) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: turboRaidAuxQualPECycles(935): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x10) {
                                                      unsigned int v18 = 16;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "turboRaidAuxQualPECycles_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: turboRaidAuxQualPECycles(935): Cannot "
                                                    }
                                                          "add 16 elements to context";
                                                    goto LABEL_2616;
                                                  case 937:
                                                    if (AddMultipleFieldsToGenericContext(a1, "turboRaidPEFailAfterRel", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                    int v17 = "ASPFTLParseBufferToCxt: turboRaidPEFailAfterRel(937) cannot ad"
                                                    }
                                                          "d 1 element to context";
                                                    goto LABEL_161;
                                                  case 938:
                                                    if (AddMultipleFieldsToGenericContext(a1, "turboRaidPEFailAfterAux", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                    int v17 = "ASPFTLParseBufferToCxt: turboRaidPEFailAfterAux(938) cannot ad"
                                                    }
                                                          "d 1 element to context";
                                                    goto LABEL_161;
                                                  case 939:
                                                    if (AddMultipleFieldsToGenericContext(a1, "dvfmVotesCPU", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                    int v17 = "ASPFTLParseBufferToCxt: dvfmVotesCPU(939) cannot add 1 element to context";
                                                    }
                                                    goto LABEL_161;
                                                  case 940:
                                                    if (AddMultipleFieldsToGenericContext(a1, "dvfmVotesBandwidth", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                    int v17 = "ASPFTLParseBufferToCxt: dvfmVotesBandwidth(940) cannot add 1 e"
                                                    }
                                                          "lement to context";
                                                    goto LABEL_161;
                                                  case 942:
                                                    if (AddMultipleFieldsToGenericContext(a1, "maxSLCEndurance", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                    int v17 = "ASPFTLParseBufferToCxt: maxSLCEndurance(942) cannot add 1 element to context";
                                                    }
                                                    goto LABEL_161;
                                                  case 943:
                                                    if (AddMultipleFieldsToGenericContext(a1, "maxMixedEndurance", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                    int v17 = "ASPFTLParseBufferToCxt: maxMixedEndurance(943) cannot add 1 el"
                                                    }
                                                          "ement to context";
                                                    goto LABEL_161;
                                                  case 944:
                                                    if (AddMultipleFieldsToGenericContext(a1, "maxNativeEndurance", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                    int v17 = "ASPFTLParseBufferToCxt: maxNativeEndurance(944) cannot add 1 e"
                                                    }
                                                          "lement to context";
                                                    goto LABEL_161;
                                                  case 948:
                                                    if (v14 != 40) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: assertHistory(948): (#40) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x28) {
                                                      unsigned int v18 = 40;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "assertHistory_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: assertHistory(948): Cannot add 40 elements to context";
                                                    }
                                                    goto LABEL_2616;
                                                  case 951:
                                                    if (AddMultipleFieldsToGenericContext(a1, "asp3Support", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                    int v17 = "ASPFTLParseBufferToCxt: asp3Support(951) cannot add 1 element to context";
                                                    }
                                                    goto LABEL_161;
                                                  case 953:
                                                    if (AddMultipleFieldsToGenericContext(a1, "numCrossTempRaidUecc", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                    int v17 = "ASPFTLParseBufferToCxt: numCrossTempRaidUecc(953) cannot add 1"
                                                    }
                                                          " element to context";
                                                    goto LABEL_161;
                                                  case 961:
                                                    if (AddMultipleFieldsToGenericContext(a1, "osBuildStr", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                    int v17 = "ASPFTLParseBufferToCxt: osBuildStr(961) cannot add 1 element to context";
                                                    }
                                                    goto LABEL_161;
                                                  case 962:
                                                    if (AddMultipleFieldsToGenericContext(a1, "raidConfig", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                    int v17 = "ASPFTLParseBufferToCxt: raidConfig(962) cannot add 1 element to context";
                                                    }
                                                    goto LABEL_161;
                                                  case 967:
                                                    if (v14 != 12) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: indTrimFrags(967): (#12) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0xC) {
                                                      unsigned int v18 = 12;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "indTrimFrags_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: indTrimFrags(967): Cannot add 12 elements to context";
                                                    }
                                                    goto LABEL_2616;
                                                  case 971:
                                                    if (v14 != 12) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: indUsedFrags(971): (#12) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0xC) {
                                                      unsigned int v18 = 12;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "indUsedFrags_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: indUsedFrags(971): Cannot add 12 elements to context";
                                                    }
                                                    goto LABEL_2616;
                                                  default:
                                                    switch(v12)
                                                    {
                                                      case 996:
                                                        if (AddMultipleFieldsToGenericContext(a1, "clogFindFail", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                        int v17 = "ASPFTLParseBufferToCxt: clogFindFail(996) cannot add 1 element to context";
                                                        }
                                                        goto LABEL_161;
                                                      case 997:
                                                        if (AddMultipleFieldsToGenericContext(a1, "clogFindBlank", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                        int v17 = "ASPFTLParseBufferToCxt: clogFindBlank(997) cannot add 1 el"
                                                        }
                                                              "ement to context";
                                                        goto LABEL_161;
                                                      case 998:
                                                        if (AddMultipleFieldsToGenericContext(a1, "clogFindUnc", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                        int v17 = "ASPFTLParseBufferToCxt: clogFindUnc(998) cannot add 1 element to context";
                                                        }
                                                        goto LABEL_161;
                                                      case 999:
                                                        if (AddMultipleFieldsToGenericContext(a1, "clogFindUnexpected", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                        int v17 = "ASPFTLParseBufferToCxt: clogFindUnexpected(999) cannot add"
                                                        }
                                                              " 1 element to context";
                                                        goto LABEL_161;
                                                      case 1001:
                                                        if (v14 != 8) {
                                                          SetAPIErrorMessage("ASPFTLParseBufferToCxt: clogReplayFailReason(1001): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                        }
                                                        if (v14 >= 8) {
                                                          unsigned int v18 = 8;
                                                        }
                                                        else {
                                                          unsigned int v18 = v14;
                                                        }
                                                        if (AddMultipleFieldsToGenericContext(a1, "clogReplayFailReason_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                        unsigned int v19 = "ASPFTLParseBufferToCxt: clogReplayFailReason(1001): Cannot"
                                                        }
                                                              " add 8 elements to context";
                                                        goto LABEL_2616;
                                                      case 1002:
                                                        if (AddMultipleFieldsToGenericContext(a1, "clogReplayTransientError", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                        int v17 = "ASPFTLParseBufferToCxt: clogReplayTransientError(1002) can"
                                                        }
                                                              "not add 1 element to context";
                                                        goto LABEL_161;
                                                      case 1003:
                                                        if (AddMultipleFieldsToGenericContext(a1, "clogReplaySpfError", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                        int v17 = "ASPFTLParseBufferToCxt: clogReplaySpfError(1003) cannot ad"
                                                        }
                                                              "d 1 element to context";
                                                        goto LABEL_161;
                                                      case 1015:
                                                        if (v14 != 4) {
                                                          SetAPIErrorMessage("ASPFTLParseBufferToCxt: eanEarlyBootUeccPage(1015): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                        }
                                                        if (v14 >= 4) {
                                                          unsigned int v18 = 4;
                                                        }
                                                        else {
                                                          unsigned int v18 = v14;
                                                        }
                                                        if (AddMultipleFieldsToGenericContext(a1, "eanEarlyBootUeccPage_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                        unsigned int v19 = "ASPFTLParseBufferToCxt: eanEarlyBootUeccPage(1015): Cannot"
                                                        }
                                                              " add 4 elements to context";
                                                        goto LABEL_2616;
                                                      case 1016:
                                                        if (AddMultipleFieldsToGenericContext(a1, "eanEarlyBootNumUeccPages", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                        int v17 = "ASPFTLParseBufferToCxt: eanEarlyBootNumUeccPages(1016) can"
                                                        }
                                                              "not add 1 element to context";
                                                        goto LABEL_161;
                                                      case 1017:
                                                        if (AddMultipleFieldsToGenericContext(a1, "eanEarlyBootUeccMultiplane", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                        int v17 = "ASPFTLParseBufferToCxt: eanEarlyBootUeccMultiplane(1017) c"
                                                        }
                                                              "annot add 1 element to context";
                                                        goto LABEL_161;
                                                      default:
                                                        goto LABEL_2478;
                                                    }
                                                }
                                              }
                                              if (v12 > 1137)
                                              {
                                                switch(v12)
                                                {
                                                  case 1147:
                                                    if (v14 != 24) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: gc_concurrent_dw_gc12(1147): (#24) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x18) {
                                                      unsigned int v18 = 24;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "gc_concurrent_dw_gc12_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc12(1147): Cannot ad"
                                                    }
                                                          "d 24 elements to context";
                                                    goto LABEL_2616;
                                                  case 1148:
                                                    if (v14 != 24) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: gc_concurrent_dw_gc1(1148): (#24) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x18) {
                                                      unsigned int v18 = 24;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "gc_concurrent_dw_gc1_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc1(1148): Cannot add"
                                                    }
                                                          " 24 elements to context";
                                                    goto LABEL_2616;
                                                  case 1149:
                                                    if (v14 != 24) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: gc_concurrent_dw_gc2(1149): (#24) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x18) {
                                                      unsigned int v18 = 24;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "gc_concurrent_dw_gc2_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc2(1149): Cannot add"
                                                    }
                                                          " 24 elements to context";
                                                    goto LABEL_2616;
                                                  case 1150:
                                                  case 1151:
                                                  case 1152:
                                                  case 1153:
                                                  case 1154:
                                                  case 1155:
                                                  case 1156:
                                                  case 1159:
                                                  case 1160:
                                                  case 1161:
                                                  case 1162:
                                                  case 1163:
                                                  case 1164:
                                                  case 1165:
                                                  case 1166:
                                                  case 1167:
                                                  case 1170:
                                                  case 1173:
                                                  case 1174:
                                                  case 1175:
                                                  case 1176:
                                                  case 1177:
                                                  case 1178:
                                                    goto LABEL_2478;
                                                  case 1157:
                                                    if (AddMultipleFieldsToGenericContext(a1, "eanMaxForceROTimeMs", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                    int v17 = "ASPFTLParseBufferToCxt: eanMaxForceROTimeMs(1157) cannot add 1"
                                                    }
                                                          " element to context";
                                                    break;
                                                  case 1158:
                                                    if (AddMultipleFieldsToGenericContext(a1, "eanMaxForceRORecoTimeMs", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                    int v17 = "ASPFTLParseBufferToCxt: eanMaxForceRORecoTimeMs(1158) cannot a"
                                                    }
                                                          "dd 1 element to context";
                                                    break;
                                                  case 1168:
                                                    if (v14 != 2) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: poDetectPERemovalTotalCost(1168): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 2) {
                                                      unsigned int v18 = 2;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "poDetectPERemovalTotalCost_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: poDetectPERemovalTotalCost(1168): Cann"
                                                    }
                                                          "ot add 2 elements to context";
                                                    goto LABEL_2616;
                                                  case 1169:
                                                    if (v14 != 2) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalTotalCost(1169): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 2) {
                                                      unsigned int v18 = 2;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "poDetectEmptySpotRemovalTotalCost_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalTotalCost(1169"
                                                    }
                                                          "): Cannot add 2 elements to context";
                                                    goto LABEL_2616;
                                                  case 1171:
                                                    if (v14 != 10) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalAge(1171): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0xA) {
                                                      unsigned int v18 = 10;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "poDetectEmptySpotRemovalAge_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalAge(1171): Can"
                                                    }
                                                          "not add 10 elements to context";
                                                    goto LABEL_2616;
                                                  case 1172:
                                                    if (v14 != 3) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: poDetectGBBedMostSevereCost(1172): (#3) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 3) {
                                                      unsigned int v18 = 3;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "poDetectGBBedMostSevereCost_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: poDetectGBBedMostSevereCost(1172): Can"
                                                    }
                                                          "not add 3 elements to context";
                                                    goto LABEL_2616;
                                                  case 1179:
                                                    if (v14 != 4) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: gc_cur_dw_gc1(1179): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 4) {
                                                      unsigned int v18 = 4;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "gc_cur_dw_gc1_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc1(1179): Cannot add 4 elements to context";
                                                    }
                                                    goto LABEL_2616;
                                                  case 1180:
                                                    if (v14 != 4) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: gc_cur_dw_gc2(1180): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 4) {
                                                      unsigned int v18 = 4;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "gc_cur_dw_gc2_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc2(1180): Cannot add 4 elements to context";
                                                    }
                                                    goto LABEL_2616;
                                                  case 1181:
                                                    if (v14 != 4) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: gc_cur_dw_gc3(1181): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 4) {
                                                      unsigned int v18 = 4;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "gc_cur_dw_gc3_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc3(1181): Cannot add 4 elements to context";
                                                    }
                                                    goto LABEL_2616;
                                                  case 1182:
                                                    if (v14 != 4) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: gc_tot_dw_gc1(1182): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 4) {
                                                      unsigned int v18 = 4;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "gc_tot_dw_gc1_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: gc_tot_dw_gc1(1182): Cannot add 4 elements to context";
                                                    }
                                                    goto LABEL_2616;
                                                  case 1183:
                                                    if (v14 != 4) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: gc_tot_dw_gc2(1183): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 4) {
                                                      unsigned int v18 = 4;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "gc_tot_dw_gc2_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: gc_tot_dw_gc2(1183): Cannot add 4 elements to context";
                                                    }
                                                    goto LABEL_2616;
                                                  case 1184:
                                                    if (AddMultipleFieldsToGenericContext(a1, "unhappy_state", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                    int v17 = "ASPFTLParseBufferToCxt: unhappy_state(1184) cannot add 1 element to context";
                                                    }
                                                    break;
                                                  case 1185:
                                                    if (AddMultipleFieldsToGenericContext(a1, "unhappy_level", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                    int v17 = "ASPFTLParseBufferToCxt: unhappy_level(1185) cannot add 1 element to context";
                                                    }
                                                    break;
                                                  default:
                                                    if (v12 != 1138)
                                                    {
                                                      if (v12 != 1189) {
                                                        goto LABEL_2478;
                                                      }
                                                      if ((AddMultipleFieldsToGenericContext(a1, "lastLbaFormatTime", (uint64_t)v8, 8u, 1u) & 1) == 0)
                                                      {
                                                        int v17 = "ASPFTLParseBufferToCxt: lastLbaFormatTime(1189) cannot add"
                                                              " 1 element to context";
                                                        break;
                                                      }
                                                      goto LABEL_162;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "numOfToHappySwitches", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                    int v17 = "ASPFTLParseBufferToCxt: numOfToHappySwitches(1138) cannot add "
                                                    }
                                                          "1 element to context";
                                                    break;
                                                }
LABEL_161:
                                                SetAPIErrorMessage(v17, a2, a3, a4, a5, a6, a7, a8, v21);
                                                goto LABEL_162;
                                              }
                                              if (v12 <= 1104)
                                              {
                                                if (v12 <= 1041)
                                                {
                                                  if (v12 == 1040)
                                                  {
                                                    if (v14 != 31) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: bandsAgeBinsV2(1040): (#31) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x1F) {
                                                      unsigned int v18 = 31;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if ((AddMultipleFieldsToGenericContext(a1, "bandsAgeBinsV2_", (uint64_t)v8, 8u, v18) & 1) == 0)
                                                    {
                                                      unsigned int v19 = "ASPFTLParseBufferToCxt: bandsAgeBinsV2(1040): Cannot add 31 "
                                                            "elements to context";
                                                      goto LABEL_2616;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    if (v14 != 31) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: bandsAgeBinsSnapshot(1041): (#31) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x1F) {
                                                      unsigned int v18 = 31;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if ((AddMultipleFieldsToGenericContext(a1, "bandsAgeBinsSnapshot_", (uint64_t)v8, 8u, v18) & 1) == 0)
                                                    {
                                                      unsigned int v19 = "ASPFTLParseBufferToCxt: bandsAgeBinsSnapshot(1041): Cannot a"
                                                            "dd 31 elements to context";
                                                      goto LABEL_2616;
                                                    }
                                                  }
                                                  goto LABEL_110;
                                                }
                                                if (v12 == 1042)
                                                {
                                                  if (v14 != 15) {
                                                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: bandsAgeBinsReadSectors(1042): (#15) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                  }
                                                  if (v14 >= 0xF) {
                                                    unsigned int v18 = 15;
                                                  }
                                                  else {
                                                    unsigned int v18 = v14;
                                                  }
                                                  if ((AddMultipleFieldsToGenericContext(a1, "bandsAgeBinsReadSectors_", (uint64_t)v8, 8u, v18) & 1) == 0)
                                                  {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: bandsAgeBinsReadSectors(1042): Cannot "
                                                          "add 15 elements to context";
                                                    goto LABEL_2616;
                                                  }
                                                  goto LABEL_110;
                                                }
                                                if (v12 == 1080)
                                                {
                                                  if ((AddMultipleFieldsToGenericContext(a1, "raidForceClogLoad", (uint64_t)v8, 8u, 1u) & 1) == 0)
                                                  {
                                                    int v17 = "ASPFTLParseBufferToCxt: raidForceClogLoad(1080) cannot add 1 e"
                                                          "lement to context";
                                                    goto LABEL_161;
                                                  }
LABEL_162:
                                                  uint64_t v10 = (v10 + 1);
                                                  goto LABEL_163;
                                                }
                                                goto LABEL_2478;
                                              }
                                              if (v12 > 1115)
                                              {
                                                if (v12 == 1116)
                                                {
                                                  if (v14 != 32) {
                                                    SetAPIErrorMessage("ASPFTLParseBufferToCxt: gcwamp(1116): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                  }
                                                  if (v14 >= 0x20) {
                                                    unsigned int v18 = 32;
                                                  }
                                                  else {
                                                    unsigned int v18 = v14;
                                                  }
                                                  if ((AddMultipleFieldsToGenericContext(a1, "gcwamp_", (uint64_t)v8, 8u, v18) & 1) == 0)
                                                  {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: gcwamp(1116): Cannot add 32 elements to context";
                                                    goto LABEL_2616;
                                                  }
                                                  goto LABEL_110;
                                                }
                                                if (v12 == 1137)
                                                {
                                                  if (AddMultipleFieldsToGenericContext(a1, "numOfToUnhappySwitches", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                  int v17 = "ASPFTLParseBufferToCxt: numOfToUnhappySwitches(1137) cannot add "
                                                  }
                                                        "1 element to context";
                                                  goto LABEL_161;
                                                }
LABEL_2478:
                                                switch(v12)
                                                {
                                                  case 1196:
                                                    if (v14 != 5) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: poDetectGBBedTotalCost(1196): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 5) {
                                                      unsigned int v18 = 5;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "poDetectGBBedTotalCost_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: poDetectGBBedTotalCost(1196): Cannot a"
                                                    }
                                                          "dd 5 elements to context";
                                                    goto LABEL_2616;
                                                  case 1197:
                                                    if (v14 != 10) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: poDetectGBBedAge(1197): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0xA) {
                                                      unsigned int v18 = 10;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "poDetectGBBedAge_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: poDetectGBBedAge(1197): Cannot add 10 "
                                                    }
                                                          "elements to context";
                                                    goto LABEL_2616;
                                                  case 1198:
                                                    if (v14 != 3) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: poDetectPERemovalMostSevereCost(1198): (#3) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 3) {
                                                      unsigned int v18 = 3;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "poDetectPERemovalMostSevereCost_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: poDetectPERemovalMostSevereCost(1198):"
                                                    }
                                                          " Cannot add 3 elements to context";
                                                    goto LABEL_2616;
                                                  case 1199:
                                                    if (AddMultipleFieldsToGenericContext(a1, "poDetectCurrentSize", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                    int v17 = "ASPFTLParseBufferToCxt: poDetectCurrentSize(1199) cannot add 1"
                                                    }
                                                          " element to context";
                                                    goto LABEL_161;
                                                  case 1200:
                                                  case 1203:
                                                  case 1204:
                                                  case 1205:
                                                  case 1206:
                                                  case 1207:
                                                  case 1208:
                                                  case 1209:
                                                  case 1210:
                                                  case 1212:
                                                  case 1213:
                                                  case 1214:
                                                  case 1219:
                                                  case 1220:
                                                  case 1221:
                                                  case 1222:
                                                  case 1223:
LABEL_2610:
                                                    if (v14 <= 1) {
                                                      snprintf(__str, 0x20uLL, "Stat_%d");
                                                    }
                                                    else {
                                                      snprintf(__str, 0x20uLL, "Stat_%d_");
                                                    }
                                                    if ((AddMultipleFieldsToGenericContext(a1, __str, (uint64_t)v8, 8u, v14) & 1) == 0)
                                                    {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt %d: Cannot add %d elements to context", a2, a3, a4, a5, a6, a7, a8, v12);
                                                      return v10;
                                                    }
                                                    uint64_t v10 = (v10 + v14);
                                                    break;
                                                  case 1201:
                                                    if (v14 != 4) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: gcVerticalSuccssfulAlignments(1201): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 4) {
                                                      unsigned int v18 = 4;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "gcVerticalSuccssfulAlignments_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: gcVerticalSuccssfulAlignments(1201): C"
                                                    }
                                                          "annot add 4 elements to context";
                                                    goto LABEL_2616;
                                                  case 1202:
                                                    if (v14 != 4) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: gcVerticalNoAlignmentDueToMissingSegs(1202): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 4) {
                                                      unsigned int v18 = 4;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "gcVerticalNoAlignmentDueToMissingSegs_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: gcVerticalNoAlignmentDueToMissingSegs("
                                                    }
                                                          "1202): Cannot add 4 elements to context";
                                                    goto LABEL_2616;
                                                  case 1211:
                                                    if (v14 != 24) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: forcedAllocationSmallEraseQ(1211): (#24) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x18) {
                                                      unsigned int v18 = 24;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "forcedAllocationSmallEraseQ_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: forcedAllocationSmallEraseQ(1211): Can"
                                                    }
                                                          "not add 24 elements to context";
                                                    goto LABEL_2616;
                                                  case 1215:
                                                    if (v14 != 5) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: hostWritesPerThrottleZone(1215): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 5) {
                                                      unsigned int v18 = 5;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "hostWritesPerThrottleZone_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: hostWritesPerThrottleZone(1215): Canno"
                                                    }
                                                          "t add 5 elements to context";
                                                    goto LABEL_2616;
                                                  case 1216:
                                                    if (v14 != 24) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: tlcWLPerDipAvgPEC(1216): (#24) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x18) {
                                                      unsigned int v18 = 24;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "tlcWLPerDipAvgPEC_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: tlcWLPerDipAvgPEC(1216): Cannot add 24"
                                                    }
                                                          " elements to context";
                                                    goto LABEL_2616;
                                                  case 1217:
                                                    if (v14 != 24) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: tlcWLPerDipMaxPEC(1217): (#24) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x18) {
                                                      unsigned int v18 = 24;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "tlcWLPerDipMaxPEC_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: tlcWLPerDipMaxPEC(1217): Cannot add 24"
                                                    }
                                                          " elements to context";
                                                    goto LABEL_2616;
                                                  case 1218:
                                                    if (v14 != 24) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: tlcWLPerDipMinPEC(1218): (#24) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x18) {
                                                      unsigned int v18 = 24;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "tlcWLPerDipMinPEC_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: tlcWLPerDipMinPEC(1218): Cannot add 24"
                                                    }
                                                          " elements to context";
                                                    goto LABEL_2616;
                                                  case 1224:
                                                    if (v14 != 20) {
                                                      SetAPIErrorMessage("ASPFTLParseBufferToCxt: apfsValidLbaOvershoot(1224): (#20) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                    }
                                                    if (v14 >= 0x14) {
                                                      unsigned int v18 = 20;
                                                    }
                                                    else {
                                                      unsigned int v18 = v14;
                                                    }
                                                    if (AddMultipleFieldsToGenericContext(a1, "apfsValidLbaOvershoot_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                    unsigned int v19 = "ASPFTLParseBufferToCxt: apfsValidLbaOvershoot(1224): Cannot ad"
                                                    }
                                                          "d 20 elements to context";
                                                    goto LABEL_2616;
                                                  default:
                                                    switch(v12)
                                                    {
                                                      case 1232:
                                                        if (AddMultipleFieldsToGenericContext(a1, "eanFastSize", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                        int v17 = "ASPFTLParseBufferToCxt: eanFastSize(1232) cannot add 1 element to context";
                                                        }
                                                        goto LABEL_161;
                                                      case 1233:
                                                        if (AddMultipleFieldsToGenericContext(a1, "eanNumSlcEvictions", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                        int v17 = "ASPFTLParseBufferToCxt: eanNumSlcEvictions(1233) cannot ad"
                                                        }
                                                              "d 1 element to context";
                                                        goto LABEL_161;
                                                      case 1234:
                                                        if (AddMultipleFieldsToGenericContext(a1, "eanNumForcedCompress", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                        int v17 = "ASPFTLParseBufferToCxt: eanNumForcedCompress(1234) cannot "
                                                        }
                                                              "add 1 element to context";
                                                        goto LABEL_161;
                                                      case 1235:
                                                      case 1236:
                                                      case 1237:
                                                      case 1238:
                                                      case 1239:
                                                      case 1240:
                                                      case 1242:
                                                      case 1243:
                                                      case 1245:
                                                        goto LABEL_2610;
                                                      case 1241:
                                                        if (v14 != 10) {
                                                          SetAPIErrorMessage("ASPFTLParseBufferToCxt: s2rTimeHisto(1241): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                        }
                                                        if (v14 >= 0xA) {
                                                          unsigned int v18 = 10;
                                                        }
                                                        else {
                                                          unsigned int v18 = v14;
                                                        }
                                                        if (AddMultipleFieldsToGenericContext(a1, "s2rTimeHisto_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                        unsigned int v19 = "ASPFTLParseBufferToCxt: s2rTimeHisto(1241): Cannot add 10 "
                                                        }
                                                              "elements to context";
                                                        goto LABEL_2616;
                                                      case 1244:
                                                        if (AddMultipleFieldsToGenericContext(a1, "calendarTimeWentBackward", (uint64_t)v8, 8u, 1u))goto LABEL_162; {
                                                        int v17 = "ASPFTLParseBufferToCxt: calendarTimeWentBackward(1244) can"
                                                        }
                                                              "not add 1 element to context";
                                                        goto LABEL_161;
                                                      case 1246:
                                                        if (v14 != 8) {
                                                          SetAPIErrorMessage("ASPFTLParseBufferToCxt: bandsUeccCrossTempHisto(1246): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                        }
                                                        if (v14 >= 8) {
                                                          unsigned int v18 = 8;
                                                        }
                                                        else {
                                                          unsigned int v18 = v14;
                                                        }
                                                        if (AddMultipleFieldsToGenericContext(a1, "bandsUeccCrossTempHisto_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                        unsigned int v19 = "ASPFTLParseBufferToCxt: bandsUeccCrossTempHisto(1246): Can"
                                                        }
                                                              "not add 8 elements to context";
                                                        goto LABEL_2616;
                                                      default:
                                                        if (v12 != 1190) {
                                                          goto LABEL_2610;
                                                        }
                                                        if (v14 != 12) {
                                                          SetAPIErrorMessage("ASPFTLParseBufferToCxt: powerDownTime(1190): (#12) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                        }
                                                        if (v14 >= 0xC) {
                                                          unsigned int v18 = 12;
                                                        }
                                                        else {
                                                          unsigned int v18 = v14;
                                                        }
                                                        if (AddMultipleFieldsToGenericContext(a1, "powerDownTime_", (uint64_t)v8, 8u, v18))goto LABEL_110; {
                                                        unsigned int v19 = "ASPFTLParseBufferToCxt: powerDownTime(1190): Cannot add 12"
                                                        }
                                                              " elements to context";
                                                        break;
                                                    }
                                                    goto LABEL_2616;
                                                }
LABEL_163:
                                                v8 += v14;
                                                v11 -= v14;
                                                goto LABEL_2;
                                              }
                                              if (v12 == 1105)
                                              {
                                                if (v14 != 14) {
                                                  SetAPIErrorMessage("ASPFTLParseBufferToCxt: hostReadSequential(1105): (#14) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                }
                                                if (v14 >= 0xE) {
                                                  unsigned int v18 = 14;
                                                }
                                                else {
                                                  unsigned int v18 = v14;
                                                }
                                                if ((AddMultipleFieldsToGenericContext(a1, "hostReadSequential_", (uint64_t)v8, 8u, v18) & 1) == 0)
                                                {
                                                  unsigned int v19 = "ASPFTLParseBufferToCxt: hostReadSequential(1105): Cannot add 14 "
                                                        "elements to context";
                                                  goto LABEL_2616;
                                                }
                                                goto LABEL_110;
                                              }
                                              if (v12 != 1106) {
                                                goto LABEL_2478;
                                              }
                                              if (v14 != 14) {
                                                SetAPIErrorMessage("ASPFTLParseBufferToCxt: GCReadSequential(1106): (#14) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              }
                                              if (v14 >= 0xE) {
                                                unsigned int v18 = 14;
                                              }
                                              else {
                                                unsigned int v18 = v14;
                                              }
                                              if (AddMultipleFieldsToGenericContext(a1, "GCReadSequential_", (uint64_t)v8, 8u, v18))
                                              {
LABEL_110:
                                                uint64_t v10 = v18 + v10;
                                                goto LABEL_163;
                                              }
                                              unsigned int v19 = "ASPFTLParseBufferToCxt: GCReadSequential(1106): Cannot add 14 elements to context";
LABEL_2616:
                                              SetAPIErrorMessage(v19, a2, a3, a4, a5, a6, a7, a8, v21);
                                              return v10;
                                          }
                                      }
                                  }
                              }
                          }
                      }
                  }
              }
          }
      }
  }
}

uint64_t AddMultipleFieldsToGenericContext(uint64_t a1, const char *a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  uint64_t v5 = 1;
  if (a4 && a5)
  {
    if (a5 == 1)
    {
      if (a4 <= 8)
      {
        __memmove_chk();
        return AddSingleValueToGenericContext(a1, (const char *)&unk_10004356B, a2, 0);
      }
      else
      {
        return 0;
      }
    }
    else
    {
      int v10 = 0;
      int v11 = 0;
      do
      {
        if (a4 <= 8)
        {
          __memmove_chk();
          snprintf(__str, 0x64uLL, "%d", v10);
          __str[100] = 0;
          uint64_t v5 = AddSingleValueToGenericContext(a1, a2, __str, 0) & v5;
        }
        else
        {
          uint64_t v5 = 0;
        }
        int v10 = (unsigned __int16)++v11;
      }
      while ((unsigned __int16)v11 < a5);
    }
  }
  return v5;
}

uint64_t ASPFTLParseStatKeyBufferToCxt(uint64_t a1, unint64_t *a2, unsigned int a3)
{
  uint64_t v5 = 0;
  unsigned int v6 = a3 >> 3;
  *(_OWORD *)__str = 0u;
  long long v22 = 0u;
LABEL_2:
  int v7 = -v6;
  while (v7)
  {
    unint64_t v9 = *a2++;
    unsigned int v8 = v9;
    unint64_t v10 = HIDWORD(v9);
    ++v7;
    if (HIDWORD(v9))
    {
      if (v8 != 0xFFFF && v8 <= 0x30000000 && -v7 >= v10)
      {
        if (v10 <= 1) {
          snprintf(__str, 0x20uLL, "Stat_%d");
        }
        else {
          snprintf(__str, 0x20uLL, "Stat_%d_");
        }
        if (AddMultipleFieldsToGenericContext(a1, __str, (uint64_t)a2, 8u, v10))
        {
          uint64_t v5 = (v5 + v10);
          a2 += v10;
          unsigned int v6 = -v7 - v10;
          goto LABEL_2;
        }
        SetAPIErrorMessage("ASPFTLParseBufferToCxt %d: Cannot add %d elements to context", v13, v14, v15, v16, v17, v18, v19, v8);
      }
      return v5;
    }
  }
  return v5;
}

uint64_t ASPMSPParseBufferToCxt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 0;
  unint64_t v9 = "ASPMSPParseBufferToCxt: Passed in invalid buffer or empty buffer";
  if (!a2) {
    goto LABEL_1980;
  }
  unsigned int v10 = a3;
  if (!a3) {
    goto LABEL_1980;
  }
  uint64_t v11 = a2;
  uint64_t v8 = 0;
  unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_5(4256): Error adding 10 elements to context";
  while (1)
  {
    do
    {
      if (!v10) {
        return v8;
      }
      uint64_t v13 = (unsigned __int16 *)v11;
      uint64_t v14 = *(unsigned __int16 *)(v11 + 2);
      v11 += 4;
      v10 -= 4;
    }
    while (!v14);
    int v15 = *v13;
    if (v15 != 12286) {
      break;
    }
LABEL_461:
    v11 += v14;
    v10 -= v14;
  }
  if (v15 == 12287 || v10 < v14) {
    return v8;
  }
  switch(v15)
  {
    case 4096:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: passWithTmodeHard(4096): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "passWithTmodeHard", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeHard(4096): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4097:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: passWithTmodeFS1_2b(4097): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "passWithTmodeFS1_2b", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b(4097): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4098:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: passWithTmodeFS1_4b(4098): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "passWithTmodeFS1_4b", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b(4098): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4099:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: passWithTmodeHard_fast(4099): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "passWithTmodeHard_fast", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeHard_fast(4099): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4100:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: passWithTmodeFS1_2b_fast(4100): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "passWithTmodeFS1_2b_fast", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b_fast(4100): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4101:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: passWithTmodeFS1_4b_fast(4101): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "passWithTmodeFS1_4b_fast", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b_fast(4101): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4102:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_EOL(4102): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "numOfCwFailedInTmodeFS2_EOL", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_EOL(4102): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4103:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_DSP_EOL(4103): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "numOfCwFailedInTmodeFS2_DSP_EOL", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_DSP_EOL(4103): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4104:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterAcq(4104): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassWithHardAfterAcq", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterAcq(4104): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4105:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDBFastRead(4105): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "firstReadWasHardWithDefaultBDBFastRead", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDBFastRead(4105): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4106:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readalgoPassWithDS1(4106): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readalgoPassWithDS1", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS1(4106): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4107:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readalgoPassWithDYCE1(4107): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readalgoPassWithDYCE1", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1(4107): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4108:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readalgoPassWithDS2(4108): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readalgoPassWithDS2", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS2(4108): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4109:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readalgoPassWithDYCE2(4109): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readalgoPassWithDYCE2", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE2(4109): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4110:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: firstReadWasHardWithAcq(4110): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "firstReadWasHardWithAcq", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithAcq(4110): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4111:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_LSB(4111): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "bdbDynamicMovedToEOL_LSB", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_LSB(4111): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4112:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_MSB(4112): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "bdbDynamicMovedToEOL_MSB", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_MSB(4112): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4113:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_USB(4113): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "bdbDynamicMovedToEOL_USB", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_USB(4113): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4114:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_LSB(4114): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "bdbDynamicMovedToSOL_LSB", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_LSB(4114): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4115:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_MSB(4115): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "bdbDynamicMovedToSOL_MSB", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_MSB(4115): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4116:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_USB(4116): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "bdbDynamicMovedToSOL_USB", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_USB(4116): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4117:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDB(4117): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "firstReadWasHardWithDefaultBDB", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDB(4117): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4118:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition(4118): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassedThroughSyndSumAcquisition", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition(4118): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4119:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip(4119): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassedThroughSlip", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip(4119): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4120:
      if (v14 != 44) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: FS2decodedBitFlips(4120): cfg 11 elements; (11*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 0x30) {
        unsigned int v17 = 11;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "FS2decodedBitFlips", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: FS2decodedBitFlips(4120): Error adding 11 elements to context";
      goto LABEL_1980;
    case 4121:
      if (v14 != 16) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: slipTrackingAfterFs1ForceFailChangedVthInTicksHist(4121): cfg 4 elements; (4*4) cfg by"
      }
          "tes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 0x14) {
        unsigned int v17 = 4;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "slipTrackingAfterFs1ForceFailChangedVthInTicksHist", v11, 4u, v17))goto LABEL_460; {
      unint64_t v9 = "ASPMSPParseBufferToCxt: slipTrackingAfterFs1ForceFailChangedVthInTicksHist(4121): Error adding 4 elements to context";
      }
      goto LABEL_1980;
    case 4122:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b_fast(4122): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassWithFS2_4b_fast", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b_fast(4122): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4123:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip_fast(4123): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassWithHardAfterSlip_fast", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip_fast(4123): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4124:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip_fast(4124): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassWithFS12BitAfterSlip_fast", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip_fast(4124): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4125:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip_fast(4125): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassWithFS14BitAfterSlip_fast", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip_fast(4125): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4126:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassWithFS3_fast(4126): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassWithFS3_fast", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS3_fast(4126): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4127:
      if (v14 != 40) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: deepSoft1Decoded(4127): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 0x2C) {
        unsigned int v17 = 10;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "deepSoft1Decoded", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: deepSoft1Decoded(4127): Error adding 10 elements to context";
      goto LABEL_1980;
    case 4128:
      if (v14 != 40) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: deepSoft2Decoded(4128): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 0x2C) {
        unsigned int v17 = 10;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "deepSoft2Decoded", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: deepSoft2Decoded(4128): Error adding 10 elements to context";
      goto LABEL_1980;
    case 4129:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b_fast(4129): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassedThroughFS2_2b_fast", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b_fast(4129): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4130:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b_fast(4130): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassedThroughFS2_4b_fast", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b_fast(4130): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4131:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip_fast(4131): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassedThroughSlip_fast", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip_fast(4131): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4132:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3_fast(4132): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassedThroughFS3_fast", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3_fast(4132): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4133:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readalgoPassWithEXH(4133): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readalgoPassWithEXH", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithEXH(4133): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4134:
      if (v14 != 44) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: FS1decodedbitflips(4134): cfg 11 elements; (11*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 0x30) {
        unsigned int v17 = 11;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "FS1decodedbitflips", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: FS1decodedbitflips(4134): Error adding 11 elements to context";
      goto LABEL_1980;
    case 4135:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readZeroPage(4135): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readZeroPage", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readZeroPage(4135): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4136:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readErasedPage(4136): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readErasedPage", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readErasedPage(4136): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4137:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readFail(4137): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readFail", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readFail(4137): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4138:
      if (v14 != 20) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: numOfSensesWereSentDuringSyndSumAcq(4138): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 0x18) {
        unsigned int v17 = 5;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "numOfSensesWereSentDuringSyndSumAcq", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringSyndSumAcq(4138): Error adding 5 elements to context";
      goto LABEL_1980;
    case 4139:
      if (v14 != 12) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: numOfSensesWereSentDuringMiniAcq(4139): cfg 3 elements; (3*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 0x10) {
        unsigned int v17 = 3;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "numOfSensesWereSentDuringMiniAcq", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringMiniAcq(4139): Error adding 3 elements to context";
      goto LABEL_1980;
    case 4140:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: bdbDefaultMoveFastToNormal(4140): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "bdbDefaultMoveFastToNormal", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDefaultMoveFastToNormal(4140): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4141:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: bdbDefaultMoveNormalToFast(4141): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "bdbDefaultMoveNormalToFast", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDefaultMoveNormalToFast(4141): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4142:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readalgoPassWithEXH_DSP(4142): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readalgoPassWithEXH_DSP", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithEXH_DSP(4142): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4143:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readalgoPassWithDS1_DSP(4143): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readalgoPassWithDS1_DSP", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS1_DSP(4143): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4144:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readalgoPassWithDYCE1_DSP(4144): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readalgoPassWithDYCE1_DSP", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1_DSP(4144): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4145:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: firstReadWasFS2EOL_DSP(4145): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "firstReadWasFS2EOL_DSP", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasFS2EOL_DSP(4145): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4146:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: firstReadWasFS2EOL(4146): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "firstReadWasFS2EOL", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasFS2EOL(4146): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4147:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b(4147): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassedThroughFS2_4b", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b(4147): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4148:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b(4148): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassWithFS2_4b", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b(4148): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4149:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b(4149): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassedThroughFS2_2b", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b(4149): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4150:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3(4150): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassedThroughFS3", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3(4150): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4151:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1(4151): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassedThroughDS1", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1(4151): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4152:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassedThroughDS2(4152): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassedThroughDS2", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS2(4152): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4153:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip(4153): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassWithHardAfterSlip", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip(4153): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4154:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip(4154): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassWithFS12BitAfterSlip", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip(4154): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4155:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip(4155): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassWithFS14BitAfterSlip", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip(4155): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4156:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassWithFS3(4156): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassWithFS3", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS3(4156): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4157:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition_DSP(4157): cfg 1 elements; (1*4) cfg bytes != "
      }
          "(%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassedThroughSyndSumAcquisition_DSP", v11, 4u, v17))goto LABEL_460; {
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition_DSP(4157): Error adding 1 elements to context";
      }
      goto LABEL_1980;
    case 4158:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterAcq(4158): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassWithFS12BitAfterAcq", v11, 4u, v17)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterAcq(4158): Error adding 1 elements to context";
      goto LABEL_1980;
    case 4159:
      if (v14 != 4) {
        SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterAcq(4159): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v14);
      if (v14 >= 8) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v14 >> 2;
      }
      if (!AddMultipleFieldsToGenericContext(a1, "readAlgoPassWithFS14BitAfterAcq", v11, 4u, v17))
      {
        unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterAcq(4159): Error adding 1 elements to context";
        goto LABEL_1980;
      }
LABEL_460:
      uint64_t v8 = v8 + v17;
      goto LABEL_461;
    default:
      switch(v15)
      {
        case 4160:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1_DSP(4160): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassedThroughDS1_DSP", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1_DSP(4160): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4161:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: numOfSlipTracking(4161): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "numOfSlipTracking", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: numOfSlipTracking(4161): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4162:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_QSB(4162): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "bdbDynamicMovedToEOL_QSB", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_QSB(4162): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4163:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_QSB(4163): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "bdbDynamicMovedToSOL_QSB", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_QSB(4163): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4196:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStageNumOfFails100(4196): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStageNumOfFails100", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails100(4196): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4197:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStageNumOfFails101(4197): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStageNumOfFails101", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails101(4197): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4198:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage100(4198): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStage100", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage100(4198): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4199:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage101(4199): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStage101", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage101(4199): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4200:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStage100(4200): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "initialReadStage100", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage100(4200): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4201:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage102(4201): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStage102", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage102(4201): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4202:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStage101(4202): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "initialReadStage101", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage101(4202): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4203:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: nandStageOfLife100(4203): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "nandStageOfLife100", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife100(4203): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4204:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: nandStageOfLife101(4204): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "nandStageOfLife101", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife101(4204): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4205:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStageNumOfFails102(4205): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStageNumOfFails102", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails102(4205): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4206:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStage102(4206): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "initialReadStage102", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage102(4206): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4207:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage103(4207): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStage103", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage103(4207): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4208:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage104(4208): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStage104", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage104(4208): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4209:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage105(4209): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStage105", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage105(4209): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4210:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage106(4210): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStage106", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage106(4210): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4211:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter100(4211): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter100", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter100(4211): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4212:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter101(4212): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter101", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter101(4212): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4213:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStage103(4213): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "initialReadStage103", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage103(4213): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4214:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStage104(4214): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "initialReadStage104", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage104(4214): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4215:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage107(4215): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStage107", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage107(4215): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4216:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage108(4216): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStage108", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage108(4216): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4217:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: nandStageOfLife102(4217): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "nandStageOfLife102", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife102(4217): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4218:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: nandStageOfLife103(4218): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "nandStageOfLife103", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife103(4218): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4219:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: nandStageOfLife104(4219): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "nandStageOfLife104", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife104(4219): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4220:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter102(4220): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter102", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter102(4220): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4221:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter103(4221): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter103", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter103(4221): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4222:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter104(4222): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter104", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter104(4222): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4223:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter105(4223): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter105", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter105(4223): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4224:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter106(4224): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter106", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter106(4224): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4225:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter107(4225): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter107", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter107(4225): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4226:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter108(4226): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter108", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter108(4226): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4227:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter109(4227): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter109", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter109(4227): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4228:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter110(4228): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter110", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter110(4228): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4229:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter111(4229): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter111", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter111(4229): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4230:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter112(4230): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter112", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter112(4230): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4231:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter113(4231): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter113", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter113(4231): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4232:
          if (v14 != 256) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStageNumOfFails108(4232): cfg 64 elements; (64*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x104) {
            unsigned int v17 = 64;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStageNumOfFails108", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails108(4232): Error adding 64 elements to context";
          goto LABEL_1980;
        case 4233:
          if (v14 != 256) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStageNumOfFails103(4233): cfg 64 elements; (64*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x104) {
            unsigned int v17 = 64;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStageNumOfFails103", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails103(4233): Error adding 64 elements to context";
          goto LABEL_1980;
        case 4234:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStageNumOfFails104(4234): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStageNumOfFails104", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails104(4234): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4235:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStageNumOfFails105(4235): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStageNumOfFails105", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails105(4235): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4236:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStageNumOfFails106(4236): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStageNumOfFails106", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails106(4236): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4237:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStageNumOfFails107(4237): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStageNumOfFails107", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails107(4237): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4238:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage109(4238): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStage109", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage109(4238): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4239:
          if (v14 != 16) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage110(4239): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x14) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStage110", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage110(4239): Error adding 4 elements to context";
          goto LABEL_1980;
        case 4240:
          if (v14 != 80) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStageNumOfErrorsBin100(4240): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x54) {
            unsigned int v17 = 20;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "readStageNumOfErrorsBin100", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfErrorsBin100(4240): Error adding 20 elements to context";
          goto LABEL_1980;
        case 4241:
          if (v14 != 80) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter114(4241): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x54) {
            unsigned int v17 = 20;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter114", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter114(4241): Error adding 20 elements to context";
          goto LABEL_1980;
        case 4242:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter115(4242): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter115", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter115(4242): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4243:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter116(4243): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter116", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter116(4243): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4244:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter117(4244): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter117", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter117(4244): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4245:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter118(4245): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter118", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter118(4245): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4246:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter119(4246): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter119", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter119(4246): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4247:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter120(4247): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter120", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter120(4247): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4248:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter121(4248): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter121", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter121(4248): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4249:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: cbdr_ref_1(4249): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "cbdr_ref_1", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_ref_1(4249): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4250:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: cbdr_ref_2(4250): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "cbdr_ref_2", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_ref_2(4250): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4251:
          if (v14 != 4) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: cbdr_outlier(4251): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 8) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "cbdr_outlier", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_outlier(4251): Error adding 1 elements to context";
          goto LABEL_1980;
        case 4252:
          if (v14 != 40) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: cbdr_step_1(4252): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x2C) {
            unsigned int v17 = 10;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "cbdr_step_1", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_1(4252): Error adding 10 elements to context";
          goto LABEL_1980;
        case 4253:
          if (v14 != 40) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: cbdr_step_2(4253): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x2C) {
            unsigned int v17 = 10;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "cbdr_step_2", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_2(4253): Error adding 10 elements to context";
          goto LABEL_1980;
        case 4254:
          if (v14 != 40) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: cbdr_step_3(4254): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x2C) {
            unsigned int v17 = 10;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "cbdr_step_3", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_3(4254): Error adding 10 elements to context";
          goto LABEL_1980;
        case 4255:
          if (v14 != 40) {
            SetAPIErrorMessage("ASPMSPParseBufferToCxt: cbdr_step_4(4255): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v14);
          if (v14 >= 0x2C) {
            unsigned int v17 = 10;
          }
          else {
            unsigned int v17 = v14 >> 2;
          }
          if (AddMultipleFieldsToGenericContext(a1, "cbdr_step_4", v11, 4u, v17)) {
            goto LABEL_460;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_4(4255): Error adding 10 elements to context";
          goto LABEL_1980;
        default:
          switch(v15)
          {
            case 12288:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStageNumOfFails200(12288): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "readStageNumOfFails200", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails200(12288): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12289:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStage200(12289): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "initialReadStage200", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage200(12289): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12290:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStage201(12290): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "initialReadStage201", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage201(12290): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12291:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStageNumOfFails201(12291): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "readStageNumOfFails201", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails201(12291): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12292:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStage202(12292): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "initialReadStage202", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage202(12292): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12293:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStage203(12293): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "initialReadStage203", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage203(12293): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12294:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStageNumOfFails202(12294): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "readStageNumOfFails202", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails202(12294): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12295:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStageNumOfFails203(12295): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "readStageNumOfFails203", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails203(12295): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12296:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStage204(12296): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "initialReadStage204", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage204(12296): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12297:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStage205(12297): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "initialReadStage205", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage205(12297): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12298:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStage206(12298): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "initialReadStage206", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage206(12298): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12299:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStage207(12299): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "initialReadStage207", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage207(12299): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12300:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStage208(12300): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "initialReadStage208", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage208(12300): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12301:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStage209(12301): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "initialReadStage209", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage209(12301): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12302:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage200(12302): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "readStage200", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage200(12302): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12303:
              if (v14 != 32) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage201(12303): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x28) {
                unsigned int v18 = 4;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "readStage201", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage201(12303): Error adding 4 elements to context";
              goto LABEL_1980;
            case 12304:
              if (v14 != 32) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage202(12304): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x28) {
                unsigned int v18 = 4;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "readStage202", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage202(12304): Error adding 4 elements to context";
              goto LABEL_1980;
            case 12305:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStage210(12305): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "initialReadStage210", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage210(12305): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12306:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStage211(12306): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "initialReadStage211", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage211(12306): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12307:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage203(12307): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "readStage203", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage203(12307): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12308:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage204(12308): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "readStage204", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage204(12308): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12309:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage205(12309): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "readStage205", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage205(12309): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12310:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage206(12310): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "readStage206", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage206(12310): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12311:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage207(12311): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "readStage207", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage207(12311): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12312:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage208(12312): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "readStage208", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage208(12312): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12313:
              if (v14 != 32) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage209(12313): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x28) {
                unsigned int v18 = 4;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "readStage209", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage209(12313): Error adding 4 elements to context";
              goto LABEL_1980;
            case 12314:
              if (v14 != 32) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage210(12314): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x28) {
                unsigned int v18 = 4;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "readStage210", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage210(12314): Error adding 4 elements to context";
              goto LABEL_1980;
            case 12315:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStage212(12315): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "initialReadStage212", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage212(12315): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12316:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStage213(12316): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "initialReadStage213", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage213(12316): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12317:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage211(12317): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "readStage211", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage211(12317): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12318:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage212(12318): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "readStage212", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage212(12318): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12319:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage213(12319): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "readStage213", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage213(12319): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12320:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage214(12320): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "readStage214", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage214(12320): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12321:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: readStage215(12321): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "readStage215", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage215(12321): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12322:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter142(12322): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter142", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter142(12322): Error adding 1 elements to context";
              goto LABEL_1980;
            case 12323:
              if (v14 != 8) {
                SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter143(12323): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v14);
              if (v14 >= 0x10) {
                unsigned int v18 = 1;
              }
              else {
                unsigned int v18 = v14 >> 3;
              }
              if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter143", v11, 8u, v18)) {
                goto LABEL_1372;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter143(12323): Error adding 1 elements to context";
              goto LABEL_1980;
            default:
              switch(v15)
              {
                case 4256:
                  if (v14 != 40) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: cbdr_step_5(4256): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 0x2C) {
                    unsigned int v18 = 10;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (!AddMultipleFieldsToGenericContext(a1, "cbdr_step_5", v11, 4u, v18)) {
                    goto LABEL_1980;
                  }
                  goto LABEL_1372;
                case 4257:
                  if (v14 != 40) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: cbdr_step_6(4257): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 0x2C) {
                    unsigned int v18 = 10;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "cbdr_step_6", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_6(4257): Error adding 10 elements to context";
                  goto LABEL_1980;
                case 4258:
                  if (v14 != 40) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: cbdr_step_7(4258): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 0x2C) {
                    unsigned int v18 = 10;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "cbdr_step_7", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_7(4258): Error adding 10 elements to context";
                  goto LABEL_1980;
                case 4259:
                  if (v14 != 80) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter122(4259): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 0x54) {
                    unsigned int v18 = 20;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter122", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter122(4259): Error adding 20 elements to context";
                  goto LABEL_1980;
                case 4260:
                  if (v14 != 32) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter123(4260): cfg 8 elements; (8*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 0x24) {
                    unsigned int v18 = 8;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter123", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter123(4260): Error adding 8 elements to context";
                  goto LABEL_1980;
                case 4261:
                  if (v14 != 4) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter124(4261): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 8) {
                    unsigned int v18 = 1;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter124", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter124(4261): Error adding 1 elements to context";
                  goto LABEL_1980;
                case 4262:
                  if (v14 != 4) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter125(4262): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 8) {
                    unsigned int v18 = 1;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter125", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter125(4262): Error adding 1 elements to context";
                  goto LABEL_1980;
                case 4263:
                  if (v14 != 4) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter126(4263): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 8) {
                    unsigned int v18 = 1;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter126", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter126(4263): Error adding 1 elements to context";
                  goto LABEL_1980;
                case 4264:
                  if (v14 != 16) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter127(4264): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 0x14) {
                    unsigned int v18 = 4;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter127", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter127(4264): Error adding 4 elements to context";
                  goto LABEL_1980;
                case 4265:
                  if (v14 != 16) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter128(4265): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 0x14) {
                    unsigned int v18 = 4;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter128", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter128(4265): Error adding 4 elements to context";
                  goto LABEL_1980;
                case 4266:
                  if (v14 != 16) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter129(4266): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 0x14) {
                    unsigned int v18 = 4;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter129", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter129(4266): Error adding 4 elements to context";
                  goto LABEL_1980;
                case 4267:
                  if (v14 != 16) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter130(4267): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 0x14) {
                    unsigned int v18 = 4;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter130", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter130(4267): Error adding 4 elements to context";
                  goto LABEL_1980;
                case 4268:
                  if (v14 != 16) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter131(4268): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 0x14) {
                    unsigned int v18 = 4;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter131", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter131(4268): Error adding 4 elements to context";
                  goto LABEL_1980;
                case 4269:
                  if (v14 != 40) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter132(4269): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 0x2C) {
                    unsigned int v18 = 10;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter132", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter132(4269): Error adding 10 elements to context";
                  goto LABEL_1980;
                case 4270:
                  if (v14 != 40) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter133(4270): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 0x2C) {
                    unsigned int v18 = 10;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter133", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter133(4270): Error adding 10 elements to context";
                  goto LABEL_1980;
                case 4271:
                  if (v14 != 4) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter134(4271): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 8) {
                    unsigned int v18 = 1;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter134", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter134(4271): Error adding 1 elements to context";
                  goto LABEL_1980;
                case 4272:
                  if (v14 != 4) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter135(4272): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 8) {
                    unsigned int v18 = 1;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter135", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter135(4272): Error adding 1 elements to context";
                  goto LABEL_1980;
                case 4273:
                  if (v14 != 4) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter136(4273): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 8) {
                    unsigned int v18 = 1;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter136", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter136(4273): Error adding 1 elements to context";
                  goto LABEL_1980;
                case 4274:
                  if (v14 != 4) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter137(4274): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 8) {
                    unsigned int v18 = 1;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter137", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter137(4274): Error adding 1 elements to context";
                  goto LABEL_1980;
                case 4275:
                  if (v14 != 4) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter138(4275): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 8) {
                    unsigned int v18 = 1;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter138", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter138(4275): Error adding 1 elements to context";
                  goto LABEL_1980;
                case 4276:
                  if (v14 != 16) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter139(4276): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 0x14) {
                    unsigned int v18 = 4;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter139", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter139(4276): Error adding 4 elements to context";
                  goto LABEL_1980;
                case 4277:
                  if (v14 != 4) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter140(4277): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 8) {
                    unsigned int v18 = 1;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter140", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter140(4277): Error adding 1 elements to context";
                  goto LABEL_1980;
                case 4278:
                  if (v14 != 4) {
                    SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter141(4278): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v14);
                  if (v14 >= 8) {
                    unsigned int v18 = 1;
                  }
                  else {
                    unsigned int v18 = v14 >> 2;
                  }
                  if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter141", v11, 4u, v18)) {
                    goto LABEL_1372;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter141(4278): Error adding 1 elements to context";
                  goto LABEL_1980;
                default:
                  switch(v15)
                  {
                    case 4164:
                      if (v14 != 4) {
                        SetAPIErrorMessage("ASPMSPParseBufferToCxt: syndSumAcqConvergedToStaticWalls(4164): cfg 1 elements; (1*4) cfg byte"
                      }
                          "s != (%d) buffer bytes",
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v14);
                      if (v14 >= 8) {
                        unsigned int v18 = 1;
                      }
                      else {
                        unsigned int v18 = v14 >> 2;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "syndSumAcqConvergedToStaticWalls", v11, 4u, v18))goto LABEL_1372; {
                      unint64_t v9 = "ASPMSPParseBufferToCxt: syndSumAcqConvergedToStaticWalls(4164): Error adding 1 elements to context";
                      }
                      goto LABEL_1980;
                    case 4165:
                      if (v14 != 60) {
                        SetAPIErrorMessage("ASPMSPParseBufferToCxt: DYCE1_Decoded_Bitflips(4165): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v14);
                      if (v14 >= 0x40) {
                        unsigned int v18 = 15;
                      }
                      else {
                        unsigned int v18 = v14 >> 2;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "DYCE1_Decoded_Bitflips", v11, 4u, v18)) {
                        goto LABEL_1372;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE1_Decoded_Bitflips(4165): Error adding 15 elements to context";
                      goto LABEL_1980;
                    case 4166:
                      if (v14 != 80) {
                        SetAPIErrorMessage("ASPMSPParseBufferToCxt: DYCE1_Target_Bitflips(4166): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v14);
                      if (v14 >= 0x54) {
                        unsigned int v18 = 20;
                      }
                      else {
                        unsigned int v18 = v14 >> 2;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "DYCE1_Target_Bitflips", v11, 4u, v18)) {
                        goto LABEL_1372;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE1_Target_Bitflips(4166): Error adding 20 elements to context";
                      goto LABEL_1980;
                    case 4167:
                      if (v14 != 60) {
                        SetAPIErrorMessage("ASPMSPParseBufferToCxt: DYCE2_Decoded_Bitflips(4167): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v14);
                      if (v14 >= 0x40) {
                        unsigned int v18 = 15;
                      }
                      else {
                        unsigned int v18 = v14 >> 2;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "DYCE2_Decoded_Bitflips", v11, 4u, v18)) {
                        goto LABEL_1372;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE2_Decoded_Bitflips(4167): Error adding 15 elements to context";
                      goto LABEL_1980;
                    case 4168:
                      if (v14 != 80) {
                        SetAPIErrorMessage("ASPMSPParseBufferToCxt: DYCE2_Target_Bitflips(4168): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v14);
                      if (v14 >= 0x54) {
                        unsigned int v18 = 20;
                      }
                      else {
                        unsigned int v18 = v14 >> 2;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "DYCE2_Target_Bitflips", v11, 4u, v18)) {
                        goto LABEL_1372;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE2_Target_Bitflips(4168): Error adding 20 elements to context";
                      goto LABEL_1980;
                    default:
                      if (v15 <= 12323)
                      {
                        switch(v15)
                        {
                          case 8193:
                            if (v14 != 20) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: avg_rd_window_size(8193): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x18) {
                              unsigned int v18 = 5;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "avg_rd_window_size", v11, 4u, v18)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: avg_rd_window_size(8193): Error adding 5 elements to context";
                            break;
                          case 8194:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: num_zq_failures(8194): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "num_zq_failures", v11, 4u, v18)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: num_zq_failures(8194): Error adding 1 elements to context";
                            break;
                          case 8195:
                            if (v14 != 64) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: lower_die_temperature(8195): cfg 16 elements; (16*4) cfg bytes !"
                            }
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x44) {
                              unsigned int v18 = 16;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "lower_die_temperature", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8195): Error adding 16 elements to context";
                            }
                            break;
                          case 8196:
                            if (v14 != 64) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: higher_die_temperature(8196): cfg 16 elements; (16*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x44) {
                              unsigned int v18 = 16;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "higher_die_temperature", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8196): Error adding 16 elements to context";
                            }
                            break;
                          case 8197:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: number_of_sram_flips(8197): cfg 1 elements; (1*4) cfg bytes != ("
                            }
                                "%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "number_of_sram_flips", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_sram_flips(8197): Error adding 1 elements to context";
                            }
                            break;
                          case 8198:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: number_of_reset_failures(8198): cfg 1 elements; (1*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "number_of_reset_failures", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_reset_failures(8198): Error adding 1 elements to context";
                            }
                            break;
                          case 8199:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: device_config(8199): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "device_config", v11, 4u, v18)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: device_config(8199): Error adding 1 elements to context";
                            break;
                          case 8200:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: number_of_throttling_events(8200): cfg 1 elements; (1*4) cfg byt"
                            }
                                "es != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "number_of_throttling_events", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_throttling_events(8200): Error adding 1 elements to context";
                            }
                            break;
                          case 8201:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: link_speed_recoveries(8201): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "link_speed_recoveries", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: link_speed_recoveries(8201): Error adding 1 elements to context";
                            }
                            break;
                          case 8202:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: fw_updates(8202): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "fw_updates", v11, 4u, v18)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: fw_updates(8202): Error adding 1 elements to context";
                            break;
                          case 8203:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: maintenance_backup_to_main(8203): cfg 1 elements; (1*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "maintenance_backup_to_main", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: maintenance_backup_to_main(8203): Error adding 1 elements to context";
                            }
                            break;
                          case 8204:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: maintenance_main_to_backup(8204): cfg 1 elements; (1*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "maintenance_main_to_backup", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: maintenance_main_to_backup(8204): Error adding 1 elements to context";
                            }
                            break;
                          case 8205:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: boot_block_erase_failures(8205): cfg 1 elements; (1*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "boot_block_erase_failures", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_erase_failures(8205): Error adding 1 elements to context";
                            }
                            break;
                          case 8206:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: boot_block_program_failures(8206): cfg 1 elements; (1*4) cfg byt"
                            }
                                "es != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "boot_block_program_failures", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_program_failures(8206): Error adding 1 elements to context";
                            }
                            break;
                          case 8207:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: boot_block_read_verify_failures(8207): cfg 1 elements; (1*4) cfg"
                            }
                                " bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "boot_block_read_verify_failures", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_read_verify_failures(8207): Error adding 1 elements to context";
                            }
                            break;
                          case 8208:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: boot_block_read_failures(8208): cfg 1 elements; (1*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "boot_block_read_failures", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_read_failures(8208): Error adding 1 elements to context";
                            }
                            break;
                          case 8209:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: boot_block_refresh(8209): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "boot_block_refresh", v11, 4u, v18)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_refresh(8209): Error adding 1 elements to context";
                            break;
                          case 8210:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: boot_block_convert_to_main(8210): cfg 1 elements; (1*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "boot_block_convert_to_main", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_convert_to_main(8210): Error adding 1 elements to context";
                            }
                            break;
                          case 8211:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: boot_block_read_source_changed(8211): cfg 1 elements; (1*4) cfg "
                            }
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "boot_block_read_source_changed", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_read_source_changed(8211): Error adding 1 elements to context";
                            }
                            break;
                          case 8212:
                            if (v14 != 16) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: open_blocks_hist(8212): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x14) {
                              unsigned int v18 = 4;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "open_blocks_hist", v11, 4u, v18)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: open_blocks_hist(8212): Error adding 4 elements to context";
                            break;
                          case 8213:
                            if (v14 != 24) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8213): cfg 6 elements; (6*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x1C) {
                              unsigned int v18 = 6;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "random_read_hit_ratio_hist", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8213): Error adding 6 elements to context";
                            }
                            break;
                          case 8214:
                            if (v14 != 20) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: active_time_hist(8214): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x18) {
                              unsigned int v18 = 5;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "active_time_hist", v11, 4u, v18)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_hist(8214): Error adding 5 elements to context";
                            break;
                          case 8215:
                            if (v14 != 8) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: rd_retraining_failures(8215): cfg 2 elements; (2*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0xC) {
                              unsigned int v18 = 2;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "rd_retraining_failures", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: rd_retraining_failures(8215): Error adding 2 elements to context";
                            }
                            break;
                          case 8216:
                            if (v14 != 8) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: wr_retraining_failures(8216): cfg 2 elements; (2*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0xC) {
                              unsigned int v18 = 2;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "wr_retraining_failures", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: wr_retraining_failures(8216): Error adding 2 elements to context";
                            }
                            break;
                          case 8217:
                            if (v14 != 20) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: auto_skip(8217): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x18) {
                              unsigned int v18 = 5;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "auto_skip", v11, 4u, v18)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: auto_skip(8217): Error adding 5 elements to context";
                            break;
                          case 8218:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: number_of_dcc_pass_after_retry(8218): cfg 1 elements; (1*4) cfg "
                            }
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "number_of_dcc_pass_after_retry", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_dcc_pass_after_retry(8218): Error adding 1 elements to context";
                            }
                            break;
                          case 8219:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: number_of_dcc_failures(8219): cfg 1 elements; (1*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "number_of_dcc_failures", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_dcc_failures(8219): Error adding 1 elements to context";
                            }
                            break;
                          case 8220:
                            if (v14 != 28) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: open_blocks_hist(8220): cfg 7 elements; (7*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x20) {
                              unsigned int v18 = 7;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "open_blocks_hist", v11, 4u, v18)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: open_blocks_hist(8220): Error adding 7 elements to context";
                            break;
                          case 8221:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: max_size_open_blocks_list(8221): cfg 1 elements; (1*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "max_size_open_blocks_list", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: max_size_open_blocks_list(8221): Error adding 1 elements to context";
                            }
                            break;
                          case 8222:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: gps_max_num_of_failures(8222): cfg 1 elements; (1*4) cfg bytes !"
                            }
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "gps_max_num_of_failures", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: gps_max_num_of_failures(8222): Error adding 1 elements to context";
                            }
                            break;
                          case 8223:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: gps_num_of_failures_max_overflow(8223): cfg 1 elements; (1*4) cf"
                            }
                                "g bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "gps_num_of_failures_max_overflow", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: gps_num_of_failures_max_overflow(8223): Error adding 1 elements to context";
                            }
                            break;
                          case 8224:
                            if (v14 != 32) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: active_time_hist(8224): cfg 8 elements; (8*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x24) {
                              unsigned int v18 = 8;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "active_time_hist", v11, 4u, v18)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_hist(8224): Error adding 8 elements to context";
                            break;
                          case 8225:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: num_auto_program_cache_terminations(8225): cfg 1 elements; (1*4)"
                            }
                                " cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "num_auto_program_cache_terminations", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: num_auto_program_cache_terminations(8225): Error adding 1 elements to context";
                            }
                            break;
                          case 8226:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: number_of_read_cache_auto_terminations(8226): cfg 1 elements; (1"
                            }
                                "*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "number_of_read_cache_auto_terminations", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_read_cache_auto_terminations(8226): Error adding 1 el"
                            }
                                 "ements to context";
                            break;
                          case 8227:
                            if (v14 != 28) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: external_etags_usage_hist(8227): cfg 7 elements; (7*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x20) {
                              unsigned int v18 = 7;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "external_etags_usage_hist", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: external_etags_usage_hist(8227): Error adding 7 elements to context";
                            }
                            break;
                          case 8228:
                            if (v14 != 16) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: internal_etags_usage_hist(8228): cfg 4 elements; (4*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x14) {
                              unsigned int v18 = 4;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "internal_etags_usage_hist", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: internal_etags_usage_hist(8228): Error adding 4 elements to context";
                            }
                            break;
                          case 8229:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: max_heap_usage(8229): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "max_heap_usage", v11, 4u, v18)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: max_heap_usage(8229): Error adding 1 elements to context";
                            break;
                          case 8230:
                            if (v14 != 24) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: rom_num_hard_resets(8230): cfg 6 elements; (6*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x1C) {
                              unsigned int v18 = 6;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "rom_num_hard_resets", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: rom_num_hard_resets(8230): Error adding 6 elements to context";
                            }
                            break;
                          case 8231:
                            if (v14 != 64) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: lower_die_temperature(8231): cfg 16 elements; (16*4) cfg bytes !"
                            }
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x44) {
                              unsigned int v18 = 16;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "lower_die_temperature", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8231): Error adding 16 elements to context";
                            }
                            break;
                          case 8232:
                            if (v14 != 64) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: higher_die_temperature(8232): cfg 16 elements; (16*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x44) {
                              unsigned int v18 = 16;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "higher_die_temperature", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8232): Error adding 16 elements to context";
                            }
                            break;
                          case 8233:
                            if (v14 != 24) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8233): cfg 6 elements; (6*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x1C) {
                              unsigned int v18 = 6;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "random_read_hit_ratio_hist", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8233): Error adding 6 elements to context";
                            }
                            break;
                          case 8234:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: msp_number_sram_flips(8234): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "msp_number_sram_flips", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: msp_number_sram_flips(8234): Error adding 1 elements to context";
                            }
                            break;
                          case 8235:
                            if (v14 != 28) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: boot_time_normal_power(8235): cfg 7 elements; (7*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x20) {
                              unsigned int v18 = 7;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "boot_time_normal_power", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_time_normal_power(8235): Error adding 7 elements to context";
                            }
                            break;
                          case 8236:
                            if (v14 != 28) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: boot_time_low_power(8236): cfg 7 elements; (7*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x20) {
                              unsigned int v18 = 7;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "boot_time_low_power", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_time_low_power(8236): Error adding 7 elements to context";
                            }
                            break;
                          case 8237:
                            if (v14 != 40) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: active_time_bw_pg_hist(8237): cfg 10 elements; (10*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x2C) {
                              unsigned int v18 = 10;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "active_time_bw_pg_hist", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_hist(8237): Error adding 10 elements to context";
                            }
                            break;
                          case 8238:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: active_time_bw_pg_min(8238): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "active_time_bw_pg_min", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_min(8238): Error adding 1 elements to context";
                            }
                            break;
                          case 8239:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: active_time_bw_pg_max(8239): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "active_time_bw_pg_max", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_max(8239): Error adding 1 elements to context";
                            }
                            break;
                          case 8240:
                            if (v14 != 20) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: mdll_relative_offset(8240): cfg 5 elements; (5*4) cfg bytes != ("
                            }
                                "%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x18) {
                              unsigned int v18 = 5;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "mdll_relative_offset", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: mdll_relative_offset(8240): Error adding 5 elements to context";
                            }
                            break;
                          case 8241:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: num_pg_regrets(8241): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "num_pg_regrets", v11, 4u, v18)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: num_pg_regrets(8241): Error adding 1 elements to context";
                            break;
                          case 8242:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: spi_image_overall_duration_acc(8242): cfg 1 elements; (1*4) cfg "
                            }
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "spi_image_overall_duration_acc", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: spi_image_overall_duration_acc(8242): Error adding 1 elements to context";
                            }
                            break;
                          case 8243:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_acc(8243): cfg 1 elements; (1*4) cfg"
                            }
                                " bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "spi_image_cw_fetch_duration_acc", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_acc(8243): Error adding 1 elements to context";
                            }
                            break;
                          case 8244:
                            if (v14 != 20) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_hist(8244): cfg 5 elements; (5*4) cf"
                            }
                                "g bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x18) {
                              unsigned int v18 = 5;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "spi_image_cw_fetch_duration_hist", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_hist(8244): Error adding 5 elements to context";
                            }
                            break;
                          default:
                            switch(v15)
                            {
                              case 4279:
                                if (v14 != 16) {
                                  SetAPIErrorMessage("ASPMSPParseBufferToCxt: fs1_4b_fail(4279): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v14);
                                if (v14 >= 0x14) {
                                  unsigned int v18 = 4;
                                }
                                else {
                                  unsigned int v18 = v14 >> 2;
                                }
                                if (AddMultipleFieldsToGenericContext(a1, "fs1_4b_fail_", v11, 4u, v18)) {
                                  goto LABEL_1372;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: fs1_4b_fail(4279): Error adding 4 elements to context";
                                break;
                              case 4280:
                                if (v14 != 16) {
                                  SetAPIErrorMessage("ASPMSPParseBufferToCxt: fs1_4b_fast_fail(4280): cfg 4 elements; (4*4) cfg bytes != ("
                                }
                                    "%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v14);
                                if (v14 >= 0x14) {
                                  unsigned int v18 = 4;
                                }
                                else {
                                  unsigned int v18 = v14 >> 2;
                                }
                                if (AddMultipleFieldsToGenericContext(a1, "fs1_4b_fast_fail_", v11, 4u, v18))goto LABEL_1372; {
                                unint64_t v9 = "ASPMSPParseBufferToCxt: fs1_4b_fast_fail(4280): Error adding 4 elements to context";
                                }
                                break;
                              case 4281:
                                if (v14 != 40) {
                                  SetAPIErrorMessage("ASPMSPParseBufferToCxt: dyce_decoded_bit_flips(4281): cfg 10 elements; (10*4) cfg by"
                                }
                                    "tes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v14);
                                if (v14 >= 0x2C) {
                                  unsigned int v18 = 10;
                                }
                                else {
                                  unsigned int v18 = v14 >> 2;
                                }
                                if (AddMultipleFieldsToGenericContext(a1, "dyce_decoded_bit_flips_", v11, 4u, v18))goto LABEL_1372; {
                                unint64_t v9 = "ASPMSPParseBufferToCxt: dyce_decoded_bit_flips(4281): Error adding 10 elements to context";
                                }
                                break;
                              case 4282:
                                if (v14 != 60) {
                                  SetAPIErrorMessage("ASPMSPParseBufferToCxt: slip_bch(4282): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v14);
                                if (v14 >= 0x40) {
                                  unsigned int v18 = 15;
                                }
                                else {
                                  unsigned int v18 = v14 >> 2;
                                }
                                if (AddMultipleFieldsToGenericContext(a1, "slip_bch_", v11, 4u, v18)) {
                                  goto LABEL_1372;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: slip_bch(4282): Error adding 15 elements to context";
                                break;
                              case 4283:
                                if (v14 != 40) {
                                  SetAPIErrorMessage("ASPMSPParseBufferToCxt: read_fail(4283): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v14);
                                if (v14 >= 0x2C) {
                                  unsigned int v18 = 10;
                                }
                                else {
                                  unsigned int v18 = v14 >> 2;
                                }
                                if (AddMultipleFieldsToGenericContext(a1, "read_fail_", v11, 4u, v18)) {
                                  goto LABEL_1372;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: read_fail(4283): Error adding 10 elements to context";
                                break;
                              case 4284:
                                if (v14 != 40) {
                                  SetAPIErrorMessage("ASPMSPParseBufferToCxt: tr_read_fail(4284): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v14);
                                if (v14 >= 0x2C) {
                                  unsigned int v18 = 10;
                                }
                                else {
                                  unsigned int v18 = v14 >> 2;
                                }
                                if (AddMultipleFieldsToGenericContext(a1, "tr_read_fail_", v11, 4u, v18)) {
                                  goto LABEL_1372;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_read_fail(4284): Error adding 10 elements to context";
                                break;
                              case 4285:
                                if (v14 != 40) {
                                  SetAPIErrorMessage("ASPMSPParseBufferToCxt: tr_aux_bfs_percent(4285): cfg 10 elements; (10*4) cfg bytes "
                                }
                                    "!= (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v14);
                                if (v14 >= 0x2C) {
                                  unsigned int v18 = 10;
                                }
                                else {
                                  unsigned int v18 = v14 >> 2;
                                }
                                if (AddMultipleFieldsToGenericContext(a1, "tr_aux_bfs_percent_", v11, 4u, v18))goto LABEL_1372; {
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_aux_bfs_percent(4285): Error adding 10 elements to context";
                                }
                                break;
                              case 4286:
                                if (v14 != 20) {
                                  SetAPIErrorMessage("ASPMSPParseBufferToCxt: tr_reconstruct_pass_step(4286): cfg 5 elements; (5*4) cfg by"
                                }
                                    "tes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v14);
                                if (v14 >= 0x18) {
                                  unsigned int v18 = 5;
                                }
                                else {
                                  unsigned int v18 = v14 >> 2;
                                }
                                if (AddMultipleFieldsToGenericContext(a1, "tr_reconstruct_pass_step_", v11, 4u, v18))goto LABEL_1372; {
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_reconstruct_pass_step(4286): Error adding 5 elements to context";
                                }
                                break;
                              case 4287:
                                if (v14 != 4) {
                                  SetAPIErrorMessage("ASPMSPParseBufferToCxt: tr_reconstruct_num(4287): cfg 1 elements; (1*4) cfg bytes !="
                                }
                                    " (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v14);
                                if (v14 >= 8) {
                                  unsigned int v18 = 1;
                                }
                                else {
                                  unsigned int v18 = v14 >> 2;
                                }
                                if (AddMultipleFieldsToGenericContext(a1, "tr_reconstruct_num", v11, 4u, v18))goto LABEL_1372; {
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_reconstruct_num(4287): Error adding 1 elements to context";
                                }
                                break;
                              default:
                                goto LABEL_1403;
                            }
                            goto LABEL_1980;
                        }
                        goto LABEL_1980;
                      }
                      if (v15 == 12326)
                      {
                        if (v14 != 8) {
                          SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStageParameter2(12326): cfg 1 elements; (1*8) cfg bytes !"
                        }
                            "= (%d) buffer bytes",
                            a2,
                            a3,
                            a4,
                            a5,
                            a6,
                            a7,
                            a8,
                            v14);
                        if (v14 >= 0x10) {
                          unsigned int v18 = 1;
                        }
                        else {
                          unsigned int v18 = v14 >> 3;
                        }
                        if (!AddMultipleFieldsToGenericContext(a1, "initialReadStageParameter2", v11, 8u, v18))
                        {
                          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStageParameter2(12326): Error adding 1 elements to context";
                          goto LABEL_1980;
                        }
                        goto LABEL_1372;
                      }
                      if (v15 == 12325)
                      {
                        if (v14 != 8) {
                          SetAPIErrorMessage("ASPMSPParseBufferToCxt: initialReadStageParameter1(12325): cfg 1 elements; (1*8) cfg bytes !"
                        }
                            "= (%d) buffer bytes",
                            a2,
                            a3,
                            a4,
                            a5,
                            a6,
                            a7,
                            a8,
                            v14);
                        if (v14 >= 0x10) {
                          unsigned int v18 = 1;
                        }
                        else {
                          unsigned int v18 = v14 >> 3;
                        }
                        if (!AddMultipleFieldsToGenericContext(a1, "initialReadStageParameter1", v11, 8u, v18))
                        {
                          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStageParameter1(12325): Error adding 1 elements to context";
                          goto LABEL_1980;
                        }
                        goto LABEL_1372;
                      }
                      if (v15 != 12324)
                      {
LABEL_1403:
                        switch(v15)
                        {
                          case 8245:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: spi_num_uses(8245): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "spi_num_uses", v11, 4u, v18)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: spi_num_uses(8245): Error adding 1 elements to context";
                            break;
                          case 8246:
                            if (v14 != 20) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: e2e_error_count_tmode(8246): cfg 5 elements; (5*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x18) {
                              unsigned int v18 = 5;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "e2e_error_count_tmode", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: e2e_error_count_tmode(8246): Error adding 5 elements to context";
                            }
                            break;
                          case 8247:
                            if (v14 != 36) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: rd_window_dist(8247): cfg 9 elements; (9*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x28) {
                              unsigned int v18 = 9;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "rd_window_dist", v11, 4u, v18)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: rd_window_dist(8247): Error adding 9 elements to context";
                            break;
                          case 8248:
                            if (v14 != 36) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: extended_rd_window_diff_dist(8248): cfg 9 elements; (9*4) cfg by"
                            }
                                "tes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x28) {
                              unsigned int v18 = 9;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "extended_rd_window_diff_dist", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: extended_rd_window_diff_dist(8248): Error adding 9 elements to context";
                            }
                            break;
                          case 8249:
                            if (v14 != 8) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: rd_retraining_failures_v2(8249): cfg 2 elements; (2*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0xC) {
                              unsigned int v18 = 2;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "rd_retraining_failures_v2", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: rd_retraining_failures_v2(8249): Error adding 2 elements to context";
                            }
                            break;
                          case 8250:
                            if (v14 != 120) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: lower_die_temperature(8250): cfg 30 elements; (30*4) cfg bytes !"
                            }
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x7C) {
                              unsigned int v18 = 30;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "lower_die_temperature", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8250): Error adding 30 elements to context";
                            }
                            break;
                          case 8251:
                            if (v14 != 120) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: higher_die_temperature(8251): cfg 30 elements; (30*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x7C) {
                              unsigned int v18 = 30;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "higher_die_temperature", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8251): Error adding 30 elements to context";
                            }
                            break;
                          case 8252:
                            if (v14 != 36) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: rd_window_dist_single_die(8252): cfg 9 elements; (9*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x28) {
                              unsigned int v18 = 9;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "rd_window_dist_single_die", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: rd_window_dist_single_die(8252): Error adding 9 elements to context";
                            }
                            break;
                          case 8253:
                            if (v14 != 16) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: parallel_slip_drops_hist(8253): cfg 4 elements; (4*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0x14) {
                              unsigned int v18 = 4;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "parallel_slip_drops_hist", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: parallel_slip_drops_hist(8253): Error adding 4 elements to context";
                            }
                            break;
                          case 8254:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: sys_halt_max_latency(8254): cfg 1 elements; (1*4) cfg bytes != ("
                            }
                                "%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "sys_halt_max_latency", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: sys_halt_max_latency(8254): Error adding 1 elements to context";
                            }
                            break;
                          case 8255:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: sys_halt_max_latency_opcode(8255): cfg 1 elements; (1*4) cfg byt"
                            }
                                "es != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "sys_halt_max_latency_opcode", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: sys_halt_max_latency_opcode(8255): Error adding 1 elements to context";
                            }
                            break;
                          case 8256:
                            if (v14 != 4) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: channel_halt_max_latency(8256): cfg 1 elements; (1*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 8) {
                              unsigned int v18 = 1;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "channel_halt_max_latency", v11, 4u, v18))goto LABEL_1372; {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: channel_halt_max_latency(8256): Error adding 1 elements to context";
                            }
                            break;
                          case 8257:
                            if (v14 != 8) {
                              SetAPIErrorMessage("ASPMSPParseBufferToCxt: max_heap_usage_v2(8257): cfg 2 elements; (2*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v14);
                            if (v14 >= 0xC) {
                              unsigned int v18 = 2;
                            }
                            else {
                              unsigned int v18 = v14 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext(a1, "max_heap_usage_v2", v11, 4u, v18)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: max_heap_usage_v2(8257): Error adding 2 elements to context";
                            break;
                          default:
                            switch(v15)
                            {
                              case 16384:
                                if (v14 != 8) {
                                  SetAPIErrorMessage("ASPMSPParseBufferToCxt: fw_version_identifier(16384): cfg 1 elements; (1*8) cfg byte"
                                }
                                    "s != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v14);
                                if (v14 >= 0x10) {
                                  unsigned int v18 = 1;
                                }
                                else {
                                  unsigned int v18 = v14 >> 3;
                                }
                                if (AddMultipleFieldsToGenericContext(a1, "fw_version_identifier", v11, 8u, v18))goto LABEL_1372; {
                                unint64_t v9 = "ASPMSPParseBufferToCxt: fw_version_identifier(16384): Error adding 1 elements to context";
                                }
                                break;
                              case 16385:
                                if (v14 != 40) {
                                  SetAPIErrorMessage("ASPMSPParseBufferToCxt: random_read_size_ratio(16385): cfg 5 elements; (5*8) cfg byt"
                                }
                                    "es != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v14);
                                if (v14 >= 0x30) {
                                  unsigned int v18 = 5;
                                }
                                else {
                                  unsigned int v18 = v14 >> 3;
                                }
                                if (AddMultipleFieldsToGenericContext(a1, "random_read_size_ratio", v11, 8u, v18))goto LABEL_1372; {
                                unint64_t v9 = "ASPMSPParseBufferToCxt: random_read_size_ratio(16385): Error adding 5 elements to context";
                                }
                                break;
                              case 16386:
                                if (v14 != 8) {
                                  SetAPIErrorMessage("ASPMSPParseBufferToCxt: number_gracefull_read_terminations(16386): cfg 1 elements; ("
                                }
                                    "1*8) cfg bytes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v14);
                                if (v14 >= 0x10) {
                                  unsigned int v18 = 1;
                                }
                                else {
                                  unsigned int v18 = v14 >> 3;
                                }
                                if (AddMultipleFieldsToGenericContext(a1, "number_gracefull_read_terminations", v11, 8u, v18))goto LABEL_1372; {
                                unint64_t v9 = "ASPMSPParseBufferToCxt: number_gracefull_read_terminations(16386): Error adding 1 e"
                                }
                                     "lements to context";
                                break;
                              case 16387:
                                if (v14 != 8) {
                                  SetAPIErrorMessage("ASPMSPParseBufferToCxt: active_time_bw_pg_acc(16387): cfg 1 elements; (1*8) cfg byte"
                                }
                                    "s != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v14);
                                if (v14 >= 0x10) {
                                  unsigned int v18 = 1;
                                }
                                else {
                                  unsigned int v18 = v14 >> 3;
                                }
                                if (AddMultipleFieldsToGenericContext(a1, "active_time_bw_pg_acc", v11, 8u, v18))goto LABEL_1372; {
                                unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_acc(16387): Error adding 1 elements to context";
                                }
                                break;
                              case 16388:
                                if (v14 != 8) {
                                  SetAPIErrorMessage("ASPMSPParseBufferToCxt: num_pg_events(16388): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v14);
                                if (v14 >= 0x10) {
                                  unsigned int v18 = 1;
                                }
                                else {
                                  unsigned int v18 = v14 >> 3;
                                }
                                if (AddMultipleFieldsToGenericContext(a1, "num_pg_events", v11, 8u, v18)) {
                                  goto LABEL_1372;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: num_pg_events(16388): Error adding 1 elements to context";
                                break;
                              case 16389:
                                if (v14 != 128) {
                                  SetAPIErrorMessage("ASPMSPParseBufferToCxt: algo_queue_depth(16389): cfg 16 elements; (16*8) cfg bytes !"
                                }
                                    "= (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v14);
                                if (v14 >= 0x88) {
                                  unsigned int v18 = 16;
                                }
                                else {
                                  unsigned int v18 = v14 >> 3;
                                }
                                if (AddMultipleFieldsToGenericContext(a1, "algo_queue_depth", v11, 8u, v18))goto LABEL_1372; {
                                unint64_t v9 = "ASPMSPParseBufferToCxt: algo_queue_depth(16389): Error adding 16 elements to context";
                                }
                                break;
                              case 16390:
                                if (v14 != 128) {
                                  SetAPIErrorMessage("ASPMSPParseBufferToCxt: parallel_slip_hist(16390): cfg 16 elements; (16*8) cfg bytes"
                                }
                                    " != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v14);
                                if (v14 >= 0x88) {
                                  unsigned int v18 = 16;
                                }
                                else {
                                  unsigned int v18 = v14 >> 3;
                                }
                                if (AddMultipleFieldsToGenericContext(a1, "parallel_slip_hist", v11, 8u, v18))goto LABEL_1372; {
                                unint64_t v9 = "ASPMSPParseBufferToCxt: parallel_slip_hist(16390): Error adding 16 elements to context";
                                }
                                break;
                              case 16391:
                                if (v14 != 48) {
                                  SetAPIErrorMessage("ASPMSPParseBufferToCxt: sys_halt_latency_hist(16391): cfg 6 elements; (6*8) cfg byte"
                                }
                                    "s != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v14);
                                if (v14 >= 0x38) {
                                  unsigned int v18 = 6;
                                }
                                else {
                                  unsigned int v18 = v14 >> 3;
                                }
                                if (AddMultipleFieldsToGenericContext(a1, "sys_halt_latency_hist", v11, 8u, v18))goto LABEL_1372; {
                                unint64_t v9 = "ASPMSPParseBufferToCxt: sys_halt_latency_hist(16391): Error adding 6 elements to context";
                                }
                                break;
                              case 16392:
                                if (v14 != 48) {
                                  SetAPIErrorMessage("ASPMSPParseBufferToCxt: channel_halt_latency_hist(16392): cfg 6 elements; (6*8) cfg "
                                }
                                    "bytes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v14);
                                if (v14 >= 0x38) {
                                  unsigned int v18 = 6;
                                }
                                else {
                                  unsigned int v18 = v14 >> 3;
                                }
                                if (AddMultipleFieldsToGenericContext(a1, "channel_halt_latency_hist", v11, 8u, v18))goto LABEL_1372; {
                                unint64_t v9 = "ASPMSPParseBufferToCxt: channel_halt_latency_hist(16392): Error adding 6 elements to context";
                                }
                                break;
                              case 16393:
                                if (v14 != 8) {
                                  SetAPIErrorMessage("ASPMSPParseBufferToCxt: num_idle_die_read_cache_terminate(16393): cfg 1 elements; (1"
                                }
                                    "*8) cfg bytes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v14);
                                if (v14 >= 0x10) {
                                  unsigned int v18 = 1;
                                }
                                else {
                                  unsigned int v18 = v14 >> 3;
                                }
                                if (AddMultipleFieldsToGenericContext(a1, "num_idle_die_read_cache_terminate", v11, 8u, v18))goto LABEL_1372; {
                                unint64_t v9 = "ASPMSPParseBufferToCxt: num_idle_die_read_cache_terminate(16393): Error adding 1 el"
                                }
                                     "ements to context";
                                break;
                              default:
                                goto LABEL_461;
                            }
                            goto LABEL_1980;
                        }
                        goto LABEL_1980;
                      }
                      if (v14 != 8) {
                        SetAPIErrorMessage("ASPMSPParseBufferToCxt: dspExceptionParameter144(12324): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v14);
                      if (v14 >= 0x10) {
                        unsigned int v18 = 1;
                      }
                      else {
                        unsigned int v18 = v14 >> 3;
                      }
                      if (AddMultipleFieldsToGenericContext(a1, "dspExceptionParameter144", v11, 8u, v18))
                      {
LABEL_1372:
                        uint64_t v8 = v8 + v18;
                        goto LABEL_461;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter144(12324): Error adding 1 elements to context";
LABEL_1980:
                      SetAPIErrorMessage(v9, a2, a3, a4, a5, a6, a7, a8, v20);
                      return v8;
                  }
              }
          }
      }
  }
}

uint64_t AddSingleValueToGenericContext(uint64_t result, const char *a2, const char *a3, uint64_t a4)
{
  if (result)
  {
    int v7 = (void *)result;
    uint64_t v8 = (char *)malloc_type_calloc(1uLL, 0x78uLL, 0x102004060B2607BuLL);
    unint64_t v9 = malloc_type_calloc(1uLL, 0x78uLL, 0x102004060B2607BuLL);
    unsigned int v10 = v9;
    if (v8 && v9)
    {
      uint64_t v11 = v7[1];
      if (v11 && (uint64_t v12 = v7[3]) != 0)
      {
        *(void *)(v11 + 112) = v9;
        uint64_t v13 = (char **)(v12 + 112);
      }
      else
      {
        *int v7 = v9;
        uint64_t v13 = (char **)(v7 + 2);
      }
      *uint64_t v13 = v8;
      v7[1] = v9;
      v7[3] = v8;
      *((void *)v8 + 14) = 0;
      *((void *)v9 + 14) = 0;
      snprintf(v9, 0x63uLL, "%s%s", a2, a3);
      v10[99] = 0;
      snprintf(v8, 0x63uLL, "%llu", a4);
      v8[99] = 0;
      *((void *)v8 + 13) = a4;
      return 1;
    }
    else
    {
      if (v8) {
        free(v8);
      }
      if (v10) {
        free(v10);
      }
      return 0;
    }
  }
  return result;
}

double ReleaseGenericParserCxt(uint64_t a1)
{
  if (a1)
  {
    v2 = *(void **)a1;
    if (v2)
    {
      do
      {
        v3 = (void *)v2[14];
        free(v2);
        v2 = v3;
      }
      while (v3);
    }
    v4 = *(void **)(a1 + 16);
    if (v4)
    {
      do
      {
        uint64_t v5 = (void *)v4[14];
        free(v4);
        v4 = v5;
      }
      while (v5);
    }
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t sub_10001A604(void *a1, const char *a2, const char *a3, uint64_t a4)
{
  uint64_t v8 = (char *)malloc_type_malloc(0x78uLL, 0x102004060B2607BuLL);
  unint64_t v9 = malloc_type_malloc(0x78uLL, 0x102004060B2607BuLL);
  unsigned int v10 = v9;
  uint64_t v11 = a1[1];
  if (v11 && (uint64_t v12 = a1[3]) != 0)
  {
    *(void *)(v11 + 112) = v9;
    uint64_t v13 = (char **)(v12 + 112);
  }
  else
  {
    *a1 = v9;
    uint64_t v13 = (char **)(a1 + 2);
  }
  *uint64_t v13 = v8;
  a1[1] = v9;
  a1[3] = v8;
  *((void *)v8 + 14) = 0;
  v9[14] = 0;
  snprintf((char *)v9, 0x63uLL, "%s%s", a2, a3);
  *((unsigned char *)v10 + 99) = 0;
  uint64_t result = snprintf(v8, 0x63uLL, "%llu", a4);
  v8[99] = 0;
  *((void *)v8 + 13) = a4;
  return result;
}

void SetAPIErrorMessage(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  bzero(__str, 0x400uLL);
  if (!GlobalAPIErrorMessage)
  {
    GlobalAPIErrorMessage = (uint64_t)malloc_type_calloc(0x400uLL, 1uLL, 0x100004077774924uLL);
    vsnprintf(__str, 0x400uLL, a1, &a9);
    snprintf((char *)GlobalAPIErrorMessage, 0x400uLL, "%s", __str);
  }
}

const char *GetAPIErrorMessage()
{
  if (GlobalAPIErrorMessage) {
    return (const char *)GlobalAPIErrorMessage;
  }
  else {
    return "NA";
  }
}

unint64_t roundSig(unint64_t a1, unint64_t a2)
{
  unint64_t v2 = a1;
  if (a1)
  {
    long double v4 = log10((double)a1) + 1.0;
    unint64_t v5 = (unint64_t)v4 - a2;
    if ((unint64_t)v4 > a2)
    {
      if (v5 > 0x12)
      {
        return 0;
      }
      else
      {
        unint64_t v6 = qword_100043828[v5];
        unint64_t v7 = v2 / v6;
        if (v2 % v6 >= v6 >> 1) {
          ++v7;
        }
        return v7 * v6;
      }
    }
  }
  return v2;
}

int main(int argc, const char **argv, const char **envp)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start nand_task_scheduler", v3, 2u);
  }
  sub_10001A8B0();
  dispatch_main();
}

void sub_10001A8B0()
{
}

void sub_10001A8D0(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2) != 2) {
    goto LABEL_41;
  }
  int outputStruct = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "running nand_task_scheduler", buf, 2u);
  }
  int v3 = 1;
LABEL_5:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "iter# %u - BEGIN", buf, 8u);
  }
  int v4 = populateTunnelOutputBufferWithoutSizeQuery_withFlags(0, 39, 1025, 0, &outputStruct, 4uLL, 0, 0);
  if (v4)
  {
    int v5 = outputStruct;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error: BDR tunnel cmd failed", buf, 2u);
    }
    int v5 = 0;
    int outputStruct = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    unint64_t v6 = "fail";
    if (v4) {
      unint64_t v6 = "pass";
    }
    int v14 = v3;
    unint64_t v7 = "NO";
    if (!v5) {
      unint64_t v7 = "YES";
    }
    __int16 v15 = 2080;
    *(void *)uint64_t v16 = v6;
    *(_WORD *)&v16[8] = 2080;
    unsigned int v17 = v7;
    __int16 v18 = 1024;
    int v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "iter# %u - ASP status %s - is BDR done: %s (%u)", buf, 0x22u);
    int v5 = outputStruct;
  }
  if (v5)
  {
    int v8 = 0;
    while (1)
    {
      BOOL should_defer = xpc_activity_should_defer(a2);
      BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (should_defer) {
        break;
      }
      ++v8;
      if (v10)
      {
        *(_DWORD *)buf = 67109632;
        int v14 = v8;
        __int16 v15 = 1024;
        *(_DWORD *)uint64_t v16 = 6;
        *(_WORD *)&v16[4] = 1024;
        *(_DWORD *)&v16[6] = 5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "  - defer chck %u/%u - sleeping for %us", buf, 0x14u);
      }
      sleep(5u);
      if (v8 == 6)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v14 = v3;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "iter# %u - DONE sleeping - more BDR", buf, 8u);
        }
        ++v3;
        goto LABEL_5;
      }
    }
    if (v10)
    {
      *(_DWORD *)buf = 67109376;
      int v14 = v8 + 1;
      __int16 v15 = 1024;
      *(_DWORD *)uint64_t v16 = 6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "  - defer chck %u/%u - deferring!!!!", buf, 0xEu);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = v3;
      uint64_t v11 = "iter# %u - DONE for now - more BDR";
      goto LABEL_31;
    }
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 67109120;
    int v14 = v3;
    uint64_t v11 = "iter# %u - DONE - no more BDR";
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v11, buf, 8u);
  }
  if (outputStruct && xpc_activity_should_defer(a2))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "deferring nand_task_scheduler daemon\n", buf, 2u);
    }
    xpc_activity_set_state(a2, 3);
    goto LABEL_41;
  }
LABEL_39:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "stopping nand_task_scheduler daemon\n", buf, 2u);
  }
LABEL_41:
  xpc_transaction_exit_clean();
}

void *sub_10001AD50()
{
  return &statsSelector;
}

void *sub_10001AD5C()
{
  return &readStatsSelector;
}

void *sub_10001AD68()
{
  return &mspStatsSelector;
}

void *sub_10001AD74()
{
  return &defectsListSelector;
}

void *sub_10001AD80()
{
  return &telemetryListSelectors;
}

void *sub_10001AD8C()
{
  return &taskSchedulerSelectors;
}

void *sub_10001AD98()
{
  return &snapshotSelectors;
}

void *sub_10001ADA4()
{
  return &snapshotHeaderSelectors;
}

void *sub_10001ADB0()
{
  return &bandStatsSelector;
}

void *sub_10001ADBC()
{
  return &geomErrPayloadSelectors;
}

uint64_t FindServiceUsingIterator(const char *a1)
{
  io_iterator_t iterator = 0;
  io_registry_entry_t RootEntry = IORegistryGetRootEntry(kIOMainPortDefault);
  if (!RootEntry) {
    return 0;
  }
  io_object_t v3 = RootEntry;
  if (IORegistryEntryCreateIterator(RootEntry, "IOService", 1u, &iterator))
  {
    uint64_t v4 = 0;
  }
  else
  {
    while (1)
    {
      uint64_t v5 = IOIteratorNext(iterator);
      uint64_t v4 = v5;
      if (!v5 || IOObjectConformsTo(v5, a1)) {
        break;
      }
      IOObjectRelease(v4);
    }
  }
  if (iterator)
  {
    IOObjectRelease(iterator);
    io_iterator_t iterator = 0;
  }
  IOObjectRelease(v3);
  return v4;
}

uint64_t findNandExporter(char ***a1)
{
  unint64_t v2 = nand_exporters_tunnel;
  if (nand_exporters_tunnel)
  {
    io_object_t v3 = &nand_exporters_tunnel;
    uint64_t v4 = "NANDInfo: findNandExporter: Controller found: %s\n";
    do
    {
      CFDictionaryRef v5 = IOServiceMatching(v2);
      if (v5)
      {
        uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
        if (MatchingService) {
          goto LABEL_11;
        }
      }
      unint64_t v7 = v3[21];
      v3 += 21;
      unint64_t v2 = v7;
    }
    while (v7);
  }
  io_object_t v3 = &nand_exporters_tunnel;
  fwrite("Failed to find matching service with IOServiceGetMatchingService, trying iterator...\n", 0x55uLL, 1uLL, __stderrp);
  int v8 = nand_exporters_tunnel;
  if (nand_exporters_tunnel)
  {
    uint64_t v4 = "Find service for class %s\n";
    while (1)
    {
      uint64_t MatchingService = FindServiceUsingIterator(v8);
      if (MatchingService) {
        break;
      }
      unint64_t v9 = v3[21];
      v3 += 21;
      int v8 = v9;
      if (!v9) {
        goto LABEL_10;
      }
    }
LABEL_11:
    uint64_t v10 = MatchingService;
    syslog(5, v4, *v3);
    goto LABEL_12;
  }
LABEL_10:
  uint64_t v10 = 0;
LABEL_12:
  *a1 = v3;
  return v10;
}

char *findNandExporter_tunnel(char ***a1)
{
  io_connect_t connect = 0;
  *a1 = 0;
  int v2 = pthread_mutex_trylock(&serializeAccess);
  if (v2)
  {
    if (v2 != 16
      || (syslog(4, "Warning: NANDInfo: NANDExporter: serializeAccess already locked. waiting for lock !\n"),
          pthread_mutex_lock(&serializeAccess)))
    {
      io_object_t v3 = __error();
      syslog(3, "Error: NANDInfo: NANDExporter: pthread_mutex_trylock() (%d) failed \n", *v3);
      return 0;
    }
  }
  syslog(5, "NANDInfo: NANDExporter object locked ! \n");
  CFDictionaryRef v5 = &nand_exporters_tunnel;
  uint64_t result = nand_exporters_tunnel;
  if (!nand_exporters_tunnel)
  {
LABEL_11:
    io_object_t v8 = 0;
    goto LABEL_12;
  }
  while (1)
  {
    CFDictionaryRef v6 = IOServiceMatching(result);
    if (!v6) {
      goto LABEL_10;
    }
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
    if (!MatchingService) {
      goto LABEL_10;
    }
    io_object_t v8 = MatchingService;
    if (!IOServiceOpen(MatchingService, mach_task_self_, 0, &connect)) {
      break;
    }
    IOServiceClose(connect);
    io_connect_t connect = 0;
    IOObjectRelease(v8);
LABEL_10:
    unint64_t v9 = v5[21];
    v5 += 21;
    uint64_t result = (char *)v9;
    if (!v9) {
      goto LABEL_11;
    }
  }
  syslog(5, "NANDInfo: findNandExporter_tunnel: Controller found: %s\n", *v5);
  uint64_t result = (char *)1;
LABEL_12:
  *((_DWORD *)v5 + 4) = connect;
  *((_DWORD *)v5 + 5) = v8;
  *a1 = v5;
  return result;
}

uint64_t ReleaseIOInterfaces(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 16);
  if (v2)
  {
    IOServiceClose(v2);
    *(_DWORD *)(a1 + 16) = 0;
  }
  io_object_t v3 = *(_DWORD *)(a1 + 20);
  if (v3)
  {
    IOObjectRelease(v3);
    *(_DWORD *)(a1 + 20) = 0;
  }
  syslog(5, "NANDInfo: NANDExporter object unlocked ! \n");

  return pthread_mutex_unlock(&serializeAccess);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return _IORegistryEntryCreateIterator(entry, plane, options, iterator);
}

io_registry_entry_t IORegistryGetRootEntry(mach_port_t mainPort)
{
  return _IORegistryGetRootEntry(mainPort);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

int *__error(void)
{
  return ___error();
}

uint64_t __memmove_chk()
{
  return ___memmove_chk();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_main(void)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

long double log10(long double __x)
{
  return _log10(__x);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_valloc(size, type_id);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return _pthread_mutex_trylock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

void syslog(int a1, const char *a2, ...)
{
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}