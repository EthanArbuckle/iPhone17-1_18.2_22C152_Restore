void CoreUARPRestoreLogError(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v12;

  if (a1)
  {
    if (*(void *)(a1 + 80))
    {
      v12 = (char *)calloc(0x400uLL, 1uLL);
      vsnprintf(v12, 0x400uLL, a3, &a9);
      (*(void (**)(void, uint64_t, char *))(a1 + 80))(*(void *)(a1 + 1928), a2, v12);
      free(v12);
    }
  }
}

void CoreUARPRestoreLogInfo(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1)
  {
    if (*(void *)(a1 + 88))
    {
      v12 = (char *)calloc(0x400uLL, 1uLL);
      vsnprintf(v12, 0x400uLL, a3, &a9);
      (*(void (**)(void, uint64_t, char *))(a1 + 88))(*(void *)(a1 + 1928), a2, v12);
      free(v12);
    }
  }
}

void CoreUARPRestoreLogDebug(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1)
  {
    if (*(void *)(a1 + 96))
    {
      v12 = (char *)calloc(0x400uLL, 1uLL);
      vsnprintf(v12, 0x400uLL, a3, &a9);
      (*(void (**)(void, uint64_t, char *))(a1 + 96))(*(void *)(a1 + 1928), a2, v12);
      free(v12);
    }
  }
}

void CoreUARPRestoreLogFault(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1)
  {
    if (*(void *)(a1 + 104))
    {
      v12 = (char *)calloc(0x400uLL, 1uLL);
      vsnprintf(v12, 0x400uLL, a3, &a9);
      (*(void (**)(void, uint64_t, char *))(a1 + 104))(*(void *)(a1 + 1928), a2, v12);
      free(v12);
    }
  }
}

__n128 CoreUARPRestoreEndpointInitialize(void *a1, long long *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *a1 = 0;
  v10 = (char *)uarpZalloc(0x898uLL);
  if (v10)
  {
    v12 = v10;
    *((_WORD *)v10 + 969) = 1;
    *((void *)v10 + 251) = a4;
    v13 = (long long *)(v10 + 112);
    if (a3)
    {
      long long v14 = *(_OWORD *)a3;
      long long v15 = *(_OWORD *)(a3 + 16);
      *((_DWORD *)v10 + 36) = *(_DWORD *)(a3 + 32);
      long long *v13 = v14;
      *((_OWORD *)v10 + 8) = v15;
      BOOL v16 = *((_WORD *)v10 + 64) == 0;
    }
    else
    {
      BOOL v16 = 0;
      *((void *)v10 + 14) = 0x800000008000;
      *((_DWORD *)v10 + 30) = 0x8000;
      *((_WORD *)v10 + 62) = 4;
      v10[126] = 0;
      *((_DWORD *)v10 + 32) = 264144;
      *((_WORD *)v10 + 66) = 1;
      *((_DWORD *)v10 + 34) = 0;
    }
    *((void *)v10 + 19) = 0;
    *((void *)v10 + 20) = 0;
    *((void *)v10 + 23) = fRestoreUARPSendMessage;
    *((void *)v10 + 24) = fRestoreUARPDataTransferPause;
    *((void *)v10 + 25) = fRestoreUARPDataTransferPauseAck;
    *((void *)v10 + 26) = fRestoreUARPDataTransferResume;
    *((void *)v10 + 27) = fRestoreUARPDataTransferResumeAck;
    *((void *)v10 + 28) = fRestoreUARPSuperBinaryOffered;
    *((void *)v10 + 29) = fRestoreUARPDynamicAssetOffered;
    *((void *)v10 + 30) = fRestoreUARPApplyStagedAssets;
    *((void *)v10 + 31) = fRestoreUARPApplyStagedAssetsResponse;
    *((void *)v10 + 32) = fRestoreUARPManufacturerName;
    *((void *)v10 + 33) = fRestoreUARPManufacturerNameResponse;
    *((void *)v10 + 34) = fRestoreUARPModelName;
    *((void *)v10 + 35) = fRestoreUARPModelNameResponse;
    *((void *)v10 + 36) = fRestoreUARPSerialNumber;
    *((void *)v10 + 37) = fRestoreUARPSerialNumberResponse;
    *((void *)v10 + 38) = fRestoreUARPHardwareVersion;
    *((void *)v10 + 39) = fRestoreUARPHardwareVersionResponse;
    *((void *)v10 + 40) = fRestoreUARPActiveFirmwareVersion2;
    *((void *)v10 + 41) = fRestoreUARPActiveFirmwareVersionResponse;
    *((void *)v10 + 42) = fRestoreUARPStagedFirmwareVersion2;
    *((void *)v10 + 43) = fRestoreUARPStagedFirmwareVersionResponse;
    *((void *)v10 + 44) = fRestoreUARPLastError;
    *((void *)v10 + 45) = fRestoreUARPLastErrorResponse;
    *((void *)v10 + 46) = fRestoreUARPStatisticsResponse;
    *((void *)v10 + 47) = fRestoreUARPAssetSolicitation;
    *((void *)v10 + 48) = fRestoreUARPRescindAllAssets;
    *((void *)v10 + 49) = fRestoreUARPRescindAllAssetsAck;
    if (!v16 && *((_WORD *)v10 + 65) && a4)
    {
      *((void *)v10 + 50) = fRestoreUARPTxWatchdogSet;
      *((void *)v10 + 51) = fRestoreUARPTxWatchdogCancel;
    }
    *((void *)v10 + 52) = fRestoreUARPProtocolVersion;
    *((void *)v10 + 53) = fRestoreUARPFriendlyName;
    *((void *)v10 + 54) = fRestoreUARPFriendlyNameResponse;
    *((void *)v10 + 62) = fRestoreUARPPlatformLogPacket;
    *((void *)v10 + 63) = CoreUARPRestoreLogError;
    *((void *)v10 + 64) = CoreUARPRestoreLogInfo;
    *((void *)v10 + 65) = CoreUARPRestoreLogDebug;
    *((void *)v10 + 66) = CoreUARPRestoreLogFault;
    *((void *)v10 + 73) = fRestoreUARPVendorSpecificRecvMsg;
    *((void *)v10 + 74) = fRestoreUARPVendorSpecificCheckExpectedResponse;
    *((void *)v10 + 75) = fRestoreUARPVendorSpecificCheckValidToSend;
    *((void *)v10 + 76) = fRestoreUARPVendorSpecificExceededRetries;
    *((void *)v10 + 159) = fRestoreUARPAppleModelNumberResponse;
    *((void *)v10 + 161) = fRestoreUARPHardwareFusingTypeResponse;
    *((void *)v10 + 163) = fRestoreUARPManifestPrefixResponse;
    *((void *)v10 + 165) = fRestoreUARPBoardIDResponse;
    *((void *)v10 + 167) = fRestoreUARPChipIDResponse;
    *((void *)v10 + 169) = fRestoreUARPChipRevisionResponse;
    *((void *)v10 + 171) = fRestoreUARPECIDResponse;
    *((void *)v10 + 173) = fRestoreUARPECIDDataResponse;
    *((void *)v10 + 175) = fRestoreUARPSecurityDomainResponse;
    *((void *)v10 + 177) = fRestoreUARPSecurityModeResponse;
    *((void *)v10 + 179) = fRestoreUARPProductionModeResponse;
    *((void *)v10 + 181) = fRestoreUARPChipEpochResponse;
    *((void *)v10 + 183) = fRestoreUARPEnableMixMatchResponse;
    *((void *)v10 + 185) = fRestoreUARPSocLiveNonceResponse;
    *((void *)v10 + 187) = fRestoreUARPPrefixNeedsLogicalUnitNumberResponse;
    *((void *)v10 + 189) = fRestoreUARPSuffixNeedsLogicalUnitNumberResponse;
    *((void *)v10 + 191) = fRestoreUARPLogicalUnitNumberResponse;
    *((void *)v10 + 193) = fRestoreUARPTicketLongNameResponse;
    *((void *)v10 + 195) = fRestoreUARPRequiresPersonalizationResponse;
    *((void *)v10 + 197) = fRestoreUARPApBoardIDResponse;
    *((void *)v10 + 199) = fRestoreUARPApChipIDResponse;
    *((void *)v10 + 201) = fRestoreUARPApProductionModeResponse;
    *((void *)v10 + 203) = fRestoreUARPApSecurityModeResponse;
    *((void *)v10 + 205) = fRestoreUARPHardwareSpecificResponse;
    *((void *)v10 + 207) = fRestoreUARPNonceResponse;
    *((void *)v10 + 209) = fRestoreUARPLifeResponse;
    *((void *)v10 + 211) = fRestoreUARPProvisioningResponse;
    *((void *)v10 + 213) = fRestoreUARPManifestEpochResponse;
    *((void *)v10 + 215) = fRestoreUARPManifestSuffixResponse;
    if (!uarpPlatformEndpointInit2(v10 + 648, (uint64_t)v10, 2u, v13, v10 + 152, (uint64_t)(v10 + 1256)))
    {
      long long v17 = *a2;
      long long v18 = a2[2];
      *((_OWORD *)v12 + 1) = a2[1];
      *((_OWORD *)v12 + 2) = v18;
      *(_OWORD *)v12 = v17;
      __n128 result = (__n128)a2[3];
      long long v19 = a2[4];
      long long v20 = a2[6];
      *((_OWORD *)v12 + 5) = a2[5];
      *((_OWORD *)v12 + 6) = v20;
      *((__n128 *)v12 + 3) = result;
      *((_OWORD *)v12 + 4) = v19;
      *((void *)v12 + 241) = a5;
      *a1 = v12;
    }
  }
  return result;
}

uint64_t fRestoreUARPSendMessage(uint64_t a1, uint64_t a2, unsigned __int16 *a3, uint64_t a4)
{
  if (!a1) {
    return 30;
  }
  uarpNtohs(*a3);
  uarpNtohs(a3[1]);
  uarpNtohs(a3[2]);
  CoreUARPRestoreLogDebug(*(void *)(a1 + 1928), 1, "UARP Restore: UARP TX: Buffer = %p, Payload Length = %u, Type = 0x%04x, Total Length = %u, ID = %u", v7, v8, v9, v10, v11, (char)a3);
  uint64_t v17 = (*(uint64_t (**)(void, unsigned __int16 *, uint64_t))a1)(*(void *)(a1 + 1928), a3, a4);
  if (v17) {
    CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP Restore: Failed to tx uarp message", v12, v13, v14, v15, v16, v19);
  }
  return v17;
}

uint64_t fRestoreUARPDataTransferPause(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 30;
  }
  CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP.LAYER3.TRANSFER.PAUSE - Not Implemented", a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t fRestoreUARPDataTransferPauseAck(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 30;
  }
  CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP.LAYER3.TRANSFER.PAUSE.ACK - Not Implemented", a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t fRestoreUARPDataTransferResume(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 30;
  }
  CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP.LAYER3.TRANSFER.RESUME - Not Implemented", a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t fRestoreUARPDataTransferResumeAck(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 30;
  }
  CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP.LAYER3.TRANSFER.RESUME.ACK - Not Implemented", a4, a5, a6, a7, a8, vars0);
  return 0;
}

void fRestoreUARPSuperBinaryOffered(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1) {
    CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP.LAYER3.OFFER.SUPERBINARY - Not Implemented", a4, a5, a6, a7, a8, a9);
  }
}

void fRestoreUARPDynamicAssetOffered(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = uarpZalloc(0x148uLL);
  void *v5 = a3;
  v5[1] = a1;
  v5[40] = *(void *)(a1 + 1920);
  *(void *)(a1 + 1920) = v5;
  memset(v22, 0, sizeof(v22));
  uarpZero(v22, 0xE0uLL);
  v6 = uarpAssetTagStructPersonalization();
  BOOL v7 = uarpAssetTagCompare((unsigned __int8 *)v6, (unsigned __int8 *)(a3 + 48));
  uint64_t v8 = uarpAssetTagStructPersonalizedFirmware();
  BOOL v9 = uarpAssetTagCompare((unsigned __int8 *)v8, (unsigned __int8 *)(a3 + 48));
  if (v7)
  {
    CoreUARPRestoreSetAssetPersonalizationCallbacks((uint64_t)v22);
    goto LABEL_5;
  }
  if (v9)
  {
    CoreUARPRestoreSetAssetPersonalizedFirmwareCallbacks((uint64_t)v22);
LABEL_5:
    int v10 = uarpPlatformEndpointAssetAccept(a1 + 648, a1 + 1728, a3, (uint64_t)v5, v22);
    if (v10) {
      CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP Restore: Failed to accept superbinary; 0x%08x",
    }
        v11,
        v12,
        v13,
        v14,
        v15,
        v10);
    return;
  }
  CoreUARPRestoreSetAssetCallbacks((uint64_t)v22);
  int v16 = uarpPlatformEndpointAssetDeny(a1 + 648, a1 + 1728, a3, 3072, (uint64_t)v5, v22);
  if (v16) {
    CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP Restore: Failed to deny unknown dynamic asset; 0x%08x",
  }
      v17,
      v18,
      v19,
      v20,
      v21,
      v16);
}

uint64_t fRestoreUARPApplyStagedAssets(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 30;
  }
  CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP.LAYER3.APPLY.ASSETS - Not Implemented", a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t fRestoreUARPApplyStagedAssetsResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 30;
  }
  CoreUARPRestoreLogInfo(*(void *)(a1 + 1928), 1, "UARP Restore: Apply Staged Assets; status <0x%04x>, flags <0x%04x>",
    a4,
    a5,
    a6,
    a7,
    a8,
    a4);
  int v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 24);
  uint64_t v17 = *(void *)(a1 + 1928);
  if (v16) {
    v16(v17, a4, a3);
  }
  else {
    CoreUARPRestoreLogError(v17, 1, "UARP Restore: %s: fLayer3ApplyStatus is NULL", v11, v12, v13, v14, v15, (char)"CoreUARPRestoreAssetApplyStatus");
  }
  return 0;
}

uint64_t fRestoreUARPManufacturerName()
{
  return 0;
}

void fRestoreUARPManufacturerNameResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  if (a1)
  {
    uarpFree(*(void **)(a1 + 1944));
    *(void *)(a1 + 1944) = 0;
    if (a3 || a4)
    {
      BOOL v7 = uarpZalloc(a4 + 1);
      *(void *)(a1 + 1944) = v7;
      memcpy(v7, a3, a4);
    }
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(a1 + 56);
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 1928);
      v8(v9, 1);
    }
  }
}

uint64_t fRestoreUARPModelName()
{
  return 0;
}

void fRestoreUARPModelNameResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  if (a1)
  {
    uarpFree(*(void **)(a1 + 1952));
    *(void *)(a1 + 1952) = 0;
    if (a3 || a4)
    {
      BOOL v7 = uarpZalloc(a4 + 1);
      *(void *)(a1 + 1952) = v7;
      memcpy(v7, a3, a4);
    }
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(a1 + 56);
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 1928);
      v8(v9, 2);
    }
  }
}

uint64_t fRestoreUARPSerialNumber()
{
  return 0;
}

void fRestoreUARPSerialNumberResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  if (a1)
  {
    uarpFree(*(void **)(a1 + 1960));
    *(void *)(a1 + 1960) = 0;
    if (a3 || a4)
    {
      BOOL v7 = uarpZalloc(a4 + 1);
      *(void *)(a1 + 1960) = v7;
      memcpy(v7, a3, a4);
    }
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(a1 + 56);
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 1928);
      v8(v9, 3);
    }
  }
}

uint64_t fRestoreUARPHardwareVersion()
{
  return 0;
}

void fRestoreUARPHardwareVersionResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  if (a1)
  {
    uarpFree(*(void **)(a1 + 1968));
    *(void *)(a1 + 1968) = 0;
    if (a3 || a4)
    {
      BOOL v7 = uarpZalloc(a4 + 1);
      *(void *)(a1 + 1968) = v7;
      memcpy(v7, a3, a4);
    }
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(a1 + 56);
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 1928);
      v8(v9, 4);
    }
  }
}

uint64_t fRestoreUARPActiveFirmwareVersion2()
{
  return 0;
}

void *fRestoreUARPActiveFirmwareVersionResponse(void *result, uint64_t a2, _OWORD *a3)
{
  if (result)
  {
    v3 = result + 247;
    if (a3)
    {
      _OWORD *v3 = *a3;
    }
    else
    {
      *(void *)v3 = 0;
      result[248] = 0;
    }
    v4 = (uint64_t (*)(void, uint64_t))result[7];
    if (v4) {
      return (void *)v4(result[241], 5);
    }
  }
  return result;
}

uint64_t fRestoreUARPStagedFirmwareVersion2()
{
  return 0;
}

void *fRestoreUARPStagedFirmwareVersionResponse(void *result, uint64_t a2, _OWORD *a3)
{
  if (result)
  {
    v3 = result + 249;
    if (a3)
    {
      _OWORD *v3 = *a3;
    }
    else
    {
      *(void *)v3 = 0;
      result[250] = 0;
    }
    v4 = (uint64_t (*)(void, uint64_t))result[7];
    if (v4) {
      return (void *)v4(result[241], 6);
    }
  }
  return result;
}

uint64_t fRestoreUARPLastError()
{
  return 0;
}

void fRestoreUARPLastErrorResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1) {
    CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP.RESTORE.LAYER3.INFO.RESPONSE <Last Error> - Not Implemented", a4, a5, a6, a7, a8, a9);
  }
}

void fRestoreUARPStatisticsResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1) {
    CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP.RESTORE.LAYER3.INFO.RESPONSE <Statistics> - Not Implemented", a4, a5, a6, a7, a8, a9);
  }
}

uint64_t fRestoreUARPAssetSolicitation()
{
  return 0;
}

uint64_t fRestoreUARPTxWatchdogSet(dispatch_queue_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 30;
  }
  unsigned int v8 = a3;
  CoreUARPRestoreCancelWatchdogTimer((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8, v13);
  a1[252] = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, a1[251]);
  if (v8) {
    int64_t v10 = 1000000 * v8;
  }
  else {
    int64_t v10 = 1;
  }
  dispatch_time_t v11 = dispatch_time(0, v10);
  dispatch_set_context(a1[252], a1);
  dispatch_source_set_timer(a1[252], v11, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
  dispatch_source_set_event_handler_f(a1[252], (dispatch_function_t)fRestoreUARPWatchdogExpire);
  dispatch_resume(a1[252]);
  return 0;
}

uint64_t fRestoreUARPTxWatchdogCancel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 30;
  }
  CoreUARPRestoreCancelWatchdogTimer(a1, a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t fRestoreUARPProtocolVersion(uint64_t result, uint64_t a2, __int16 a3)
{
  if (result) {
    *(_WORD *)(result + 1938) = a3;
  }
  return result;
}

uint64_t fRestoreUARPFriendlyName()
{
  return 0;
}

void fRestoreUARPFriendlyNameResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  if (a1)
  {
    uarpFree(*(void **)(a1 + 2040));
    *(void *)(a1 + 2040) = 0;
    if (a3 || a4)
    {
      BOOL v7 = uarpZalloc(a4 + 1);
      *(void *)(a1 + 2040) = v7;
      memcpy(v7, a3, a4);
    }
    unsigned int v8 = *(void (**)(uint64_t, uint64_t))(a1 + 56);
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 1928);
      v8(v9, 9);
    }
  }
}

uint64_t fRestoreUARPVendorSpecificRecvMsg(uint64_t a1, uint64_t a2, unsigned __int8 *a3, int a4, unsigned int *a5, unsigned int a6)
{
  if (a1) {
    return uarpApplePlatformEndpointRecvMessage(a1 + 648, a1 + 1728, a3, a4, a5, a6);
  }
  else {
    return 30;
  }
}

BOOL fRestoreUARPVendorSpecificCheckExpectedResponse(BOOL result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  if (result) {
    return uarpApplePlatformMessageCheckExpectedResponse(result + 648, result + 1728, a3, a4, a5, a6);
  }
  return result;
}

uint64_t fRestoreUARPVendorSpecificCheckValidToSend(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (result) {
    return uarpApplePlatformMessageCheckValidToSend(result + 648, result + 1728, a3, a4);
  }
  return result;
}

uint64_t fRestoreUARPVendorSpecificExceededRetries(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (result) {
    return uarpApplePlatformMessageExceededRetries(result + 648, result + 1728, a3, a4);
  }
  return result;
}

void fRestoreUARPAppleModelNumberResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  if (a1)
  {
    uarpFree(*(void **)(a1 + 2024));
    *(void *)(a1 + 2024) = 0;
    if (a3 && a4)
    {
      BOOL v7 = uarpZalloc(a4 + 1);
      *(void *)(a1 + 2024) = v7;
      memcpy(v7, a3, a4);
    }
    unsigned int v8 = *(void (**)(uint64_t, uint64_t))(a1 + 64);
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 1928);
      v8(v9, 1);
    }
  }
}

void fRestoreUARPHardwareFusingTypeResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  if (a1)
  {
    uarpFree(*(void **)(a1 + 2032));
    *(void *)(a1 + 2032) = 0;
    if (a3 && a4)
    {
      BOOL v7 = uarpZalloc(a4 + 1);
      *(void *)(a1 + 2032) = v7;
      memcpy(v7, a3, a4);
    }
    unsigned int v8 = *(void (**)(uint64_t, uint64_t))(a1 + 64);
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 1928);
      v8(v9, 2);
    }
  }
}

void fRestoreUARPManifestPrefixResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  if (a1)
  {
    uarpFree(*(void **)(a1 + 2048));
    *(void *)(a1 + 2048) = 0;
    if (a3 && a4)
    {
      BOOL v7 = uarpZalloc(a4 + 1);
      *(void *)(a1 + 2048) = v7;
      memcpy(v7, a3, a4);
    }
    unsigned int v8 = *(void (**)(uint64_t, uint64_t))(a1 + 64);
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 1928);
      v8(v9, 3);
    }
  }
}

uint64_t fRestoreUARPBoardIDResponse(uint64_t result, uint64_t a2, _DWORD *a3, int a4)
{
  if (result)
  {
    if (a3 && a4 == 4)
    {
      *(_DWORD *)(result + 2056) = *a3;
    }
    else if (a3 && a4 == 8)
    {
      *(void *)(result + 2056) = *(void *)a3;
    }
    else
    {
      *(void *)(result + 2056) = 0;
    }
    v4 = *(uint64_t (**)(void, uint64_t))(result + 64);
    if (v4) {
      return v4(*(void *)(result + 1928), 4);
    }
  }
  return result;
}

uint64_t fRestoreUARPChipIDResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  if (result)
  {
    int v4 = 0;
    if (a3 && a4 == 4) {
      int v4 = *a3;
    }
    *(_DWORD *)(result + 2064) = v4;
    v5 = *(uint64_t (**)(void, uint64_t))(result + 64);
    if (v5) {
      return v5(*(void *)(result + 1928), 5);
    }
  }
  return result;
}

uint64_t fRestoreUARPChipRevisionResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  if (result)
  {
    int v4 = 0;
    if (a3 && a4 == 4) {
      int v4 = *a3;
    }
    *(_DWORD *)(result + 2068) = v4;
    v5 = *(uint64_t (**)(void, uint64_t))(result + 64);
    if (v5) {
      return v5(*(void *)(result + 1928), 6);
    }
  }
  return result;
}

void *fRestoreUARPECIDResponse(void *result, uint64_t a2, uint64_t *a3, int a4)
{
  if (result)
  {
    uint64_t v4 = 0;
    if (a3 && a4 == 8) {
      uint64_t v4 = *a3;
    }
    result[259] = v4;
    v5 = (uint64_t (*)(void, uint64_t))result[8];
    if (v5) {
      return (void *)v5(result[241], 7);
    }
  }
  return result;
}

void fRestoreUARPECIDDataResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  if (a1)
  {
    uarpFree(*(void **)(a1 + 2080));
    *(void *)(a1 + 2080) = 0;
    *(_DWORD *)(a1 + 2088) = 0;
    if (a3 && a4)
    {
      *(_DWORD *)(a1 + 2088) = a4;
      BOOL v7 = uarpZalloc(a4);
      *(void *)(a1 + 2080) = v7;
      memcpy(v7, a3, *(unsigned int *)(a1 + 2088));
    }
    unsigned int v8 = *(void (**)(uint64_t, uint64_t))(a1 + 64);
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 1928);
      v8(v9, 29);
    }
  }
}

uint64_t fRestoreUARPSecurityDomainResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  if (result)
  {
    int v4 = 0;
    if (a3 && a4 == 4) {
      int v4 = *a3;
    }
    *(_DWORD *)(result + 2092) = v4;
    v5 = *(uint64_t (**)(void, uint64_t))(result + 64);
    if (v5) {
      return v5(*(void *)(result + 1928), 8);
    }
  }
  return result;
}

uint64_t fRestoreUARPSecurityModeResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  if (result)
  {
    int v4 = 0;
    if (a3 && a4 == 4) {
      int v4 = *a3;
    }
    *(_DWORD *)(result + 2096) = v4;
    v5 = *(uint64_t (**)(void, uint64_t))(result + 64);
    if (v5) {
      return v5(*(void *)(result + 1928), 9);
    }
  }
  return result;
}

uint64_t fRestoreUARPProductionModeResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  if (result)
  {
    int v4 = 0;
    if (a3 && a4 == 4) {
      int v4 = *a3;
    }
    *(_DWORD *)(result + 2100) = v4;
    v5 = *(uint64_t (**)(void, uint64_t))(result + 64);
    if (v5) {
      return v5(*(void *)(result + 1928), 10);
    }
  }
  return result;
}

uint64_t fRestoreUARPChipEpochResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  if (result)
  {
    int v4 = 0;
    if (a3 && a4 == 4) {
      int v4 = *a3;
    }
    *(_DWORD *)(result + 2104) = v4;
    v5 = *(uint64_t (**)(void, uint64_t))(result + 64);
    if (v5) {
      return v5(*(void *)(result + 1928), 11);
    }
  }
  return result;
}

uint64_t fRestoreUARPEnableMixMatchResponse(uint64_t result, uint64_t a2, char *a3, int a4)
{
  if (result)
  {
    char v4 = 0;
    if (a3 && a4 == 1) {
      char v4 = *a3;
    }
    *(unsigned char *)(result + 2108) = v4;
    v5 = *(uint64_t (**)(void, uint64_t))(result + 64);
    if (v5) {
      return v5(*(void *)(result + 1928), 12);
    }
  }
  return result;
}

uint64_t fRestoreUARPSocLiveNonceResponse(uint64_t result, uint64_t a2, char *a3, int a4)
{
  if (result)
  {
    char v4 = 0;
    if (a3 && a4 == 1) {
      char v4 = *a3;
    }
    *(unsigned char *)(result + 2109) = v4;
    v5 = *(uint64_t (**)(void, uint64_t))(result + 64);
    if (v5) {
      return v5(*(void *)(result + 1928), 13);
    }
  }
  return result;
}

uint64_t fRestoreUARPPrefixNeedsLogicalUnitNumberResponse(uint64_t result, uint64_t a2, char *a3, int a4)
{
  if (result)
  {
    char v4 = 0;
    if (a3 && a4 == 1) {
      char v4 = *a3;
    }
    *(unsigned char *)(result + 2110) = v4;
    v5 = *(uint64_t (**)(void, uint64_t))(result + 64);
    if (v5) {
      return v5(*(void *)(result + 1928), 14);
    }
  }
  return result;
}

uint64_t fRestoreUARPSuffixNeedsLogicalUnitNumberResponse(uint64_t result, uint64_t a2, char *a3, int a4)
{
  if (result)
  {
    char v4 = 0;
    if (a3 && a4 == 1) {
      char v4 = *a3;
    }
    *(unsigned char *)(result + 2111) = v4;
    v5 = *(uint64_t (**)(void, uint64_t))(result + 64);
    if (v5) {
      return v5(*(void *)(result + 1928), 15);
    }
  }
  return result;
}

uint64_t fRestoreUARPLogicalUnitNumberResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  if (result)
  {
    int v4 = 0;
    if (a3 && a4 == 4) {
      int v4 = *a3;
    }
    *(_DWORD *)(result + 2112) = v4;
    v5 = *(uint64_t (**)(void, uint64_t))(result + 64);
    if (v5) {
      return v5(*(void *)(result + 1928), 16);
    }
  }
  return result;
}

void fRestoreUARPTicketLongNameResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  if (a1)
  {
    uarpFree(*(void **)(a1 + 2120));
    *(void *)(a1 + 2120) = 0;
    if (a3 && a4)
    {
      BOOL v7 = uarpZalloc(a4 + 1);
      *(void *)(a1 + 2120) = v7;
      memcpy(v7, a3, a4);
    }
    unsigned int v8 = *(void (**)(uint64_t, uint64_t))(a1 + 64);
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 1928);
      v8(v9, 17);
    }
  }
}

uint64_t fRestoreUARPRequiresPersonalizationResponse(uint64_t result, uint64_t a2, char *a3, int a4)
{
  if (result)
  {
    char v4 = 0;
    if (a3 && a4 == 1) {
      char v4 = *a3;
    }
    *(unsigned char *)(result + 2128) = v4;
    v5 = *(uint64_t (**)(void, uint64_t))(result + 64);
    if (v5) {
      return v5(*(void *)(result + 1928), 18);
    }
  }
  return result;
}

uint64_t fRestoreUARPApBoardIDResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  if (result)
  {
    int v4 = 0;
    if (a3 && a4 == 4) {
      int v4 = *a3;
    }
    *(_DWORD *)(result + 2132) = v4;
    v5 = *(uint64_t (**)(void, uint64_t))(result + 64);
    if (v5) {
      return v5(*(void *)(result + 1928), 19);
    }
  }
  return result;
}

uint64_t fRestoreUARPApChipIDResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  if (result)
  {
    int v4 = 0;
    if (a3 && a4 == 4) {
      int v4 = *a3;
    }
    *(_DWORD *)(result + 2136) = v4;
    v5 = *(uint64_t (**)(void, uint64_t))(result + 64);
    if (v5) {
      return v5(*(void *)(result + 1928), 20);
    }
  }
  return result;
}

uint64_t fRestoreUARPApProductionModeResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  if (result)
  {
    int v4 = 0;
    if (a3 && a4 == 4) {
      int v4 = *a3;
    }
    *(_DWORD *)(result + 2140) = v4;
    v5 = *(uint64_t (**)(void, uint64_t))(result + 64);
    if (v5) {
      return v5(*(void *)(result + 1928), 21);
    }
  }
  return result;
}

uint64_t fRestoreUARPApSecurityModeResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  if (result)
  {
    int v4 = 0;
    if (a3 && a4 == 4) {
      int v4 = *a3;
    }
    *(_DWORD *)(result + 2144) = v4;
    v5 = *(uint64_t (**)(void, uint64_t))(result + 64);
    if (v5) {
      return v5(*(void *)(result + 1928), 22);
    }
  }
  return result;
}

void fRestoreUARPHardwareSpecificResponse(uint64_t a1, uint64_t a2, const void *a3, int a4)
{
  if (a1)
  {
    uarpFree(*(void **)(a1 + 2152));
    *(void *)(a1 + 2152) = 0;
    *(_DWORD *)(a1 + 2160) = 0;
    if (a3 && a4)
    {
      *(_DWORD *)(a1 + 2160) = a4;
      BOOL v7 = uarpZalloc((a4 + 1));
      *(void *)(a1 + 2152) = v7;
      memcpy(v7, a3, *(unsigned int *)(a1 + 2160));
    }
    unsigned int v8 = *(void (**)(uint64_t, uint64_t))(a1 + 64);
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 1928);
      v8(v9, 23);
    }
  }
}

void fRestoreUARPNonceResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  if (a1)
  {
    uarpFree(*(void **)(a1 + 2168));
    *(void *)(a1 + 2168) = 0;
    *(_DWORD *)(a1 + 2176) = 0;
    if (a3 && a4)
    {
      *(_DWORD *)(a1 + 2176) = a4;
      BOOL v7 = uarpZalloc(a4);
      *(void *)(a1 + 2168) = v7;
      memcpy(v7, a3, *(unsigned int *)(a1 + 2176));
    }
    unsigned int v8 = *(void (**)(uint64_t, uint64_t))(a1 + 64);
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 1928);
      v8(v9, 24);
    }
  }
}

uint64_t fRestoreUARPLifeResponse(uint64_t result, uint64_t a2, char *a3, int a4)
{
  if (result)
  {
    char v4 = 0;
    if (a3 && a4 == 1) {
      char v4 = *a3;
    }
    *(unsigned char *)(result + 2180) = v4;
    v5 = *(uint64_t (**)(void, uint64_t))(result + 64);
    if (v5) {
      return v5(*(void *)(result + 1928), 25);
    }
  }
  return result;
}

uint64_t fRestoreUARPProvisioningResponse(uint64_t result, uint64_t a2, char *a3, int a4)
{
  if (result)
  {
    char v4 = 0;
    if (a3 && a4 == 1) {
      char v4 = *a3;
    }
    *(unsigned char *)(result + 2182) = v4;
    v5 = *(uint64_t (**)(void, uint64_t))(result + 64);
    if (v5) {
      return v5(*(void *)(result + 1928), 26);
    }
  }
  return result;
}

uint64_t fRestoreUARPManifestEpochResponse(uint64_t result, uint64_t a2, char *a3, int a4)
{
  if (result)
  {
    char v4 = 0;
    if (a3 && a4 == 1) {
      char v4 = *a3;
    }
    *(unsigned char *)(result + 2181) = v4;
    v5 = *(uint64_t (**)(void, uint64_t))(result + 64);
    if (v5) {
      return v5(*(void *)(result + 1928), 27);
    }
  }
  return result;
}

void fRestoreUARPManifestSuffixResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  if (a1)
  {
    uarpFree(*(void **)(a1 + 2184));
    *(void *)(a1 + 2184) = 0;
    if (a3 && a4)
    {
      BOOL v7 = uarpZalloc(a4 + 1);
      *(void *)(a1 + 2184) = v7;
      memcpy(v7, a3, a4);
    }
    unsigned int v8 = *(void (**)(uint64_t, uint64_t))(a1 + 64);
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 1928);
      v8(v9, 28);
    }
  }
}

uint64_t CoreUARPRestoreEndpointRemoteEndpointAdd(uint64_t a1)
{
  return uarpPlatformRemoteEndpointAdd(a1 + 648, a1 + 1728, (long long *)(a1 + 112), a1);
}

uint64_t CoreUARPRestoreEndpointRemoteEndpointRemove(uint64_t a1)
{
  return uarpPlatformRemoteEndpointRemove(a1 + 648, a1 + 1728);
}

uint64_t CoreUARPRestoreEndpointOfferSuperBinary(uint64_t a1, const char *a2)
{
  char v4 = uarpZalloc(0x148uLL);
  if (!v4)
  {
    CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP Restore: Failed to allocate restore asset", v5, v6, v7, v8, v9, v25);
    return 11;
  }
  int64_t v10 = v4;
  dispatch_time_t v11 = fopen(a2, "r");
  *((void *)v10 + 2) = v11;
  if (!v11)
  {
    CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP Restore: Failed to open file %s", v12, v13, v14, v15, v16, (char)a2);
    uarpFree(v10);
    return 11;
  }
  fseek(v11, 0, 2);
  *((_DWORD *)v10 + 77) = MEMORY[0x263E715B0](*((void *)v10 + 2));
  fseek(*((FILE **)v10 + 2), 0, 0);
  CoreUARPRestoreEndpointOfferSuperBinaryCommon(a1, (uint64_t *)v10);
  uint64_t v23 = v22;
  if (v22)
  {
    CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP Restore: Failed to offer superbinary", v17, v18, v19, v20, v21, v25);
    fclose(*((FILE **)v10 + 2));
    uarpFree(v10);
  }
  return v23;
}

void CoreUARPRestoreEndpointOfferSuperBinaryCommon(uint64_t a1, uint64_t *a2)
{
  memset(v5, 0, sizeof(v5));
  CoreUARPRestoreSetAssetCallbacks((uint64_t)v5);
  uarpPlatformEndpointPrepareSuperBinary(a1 + 648, a1 + 1728, (uint64_t)a2, (uint64_t)v5);
  if (!v4)
  {
    *a2 = uarpPlatformAssetFindByAssetContextAndList(a1 + 648, (uint64_t)a2, 1);
    if (!uarpPlatformEndpointOfferAsset(a1 + 648, a1 + 1728, (uint64_t)a2))
    {
      a2[40] = *(void *)(a1 + 1912);
      *(void *)(a1 + 1912) = a2;
    }
  }
}

uint64_t CoreUARPRestoreEndpointOfferSuperBinaryBuffer(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = uarpZalloc(0x148uLL);
  if (!v6) {
    return 11;
  }
  uint64_t v7 = v6;
  *((void *)v6 + 35) = a2;
  *((_DWORD *)v6 + 77) = a3;
  CoreUARPRestoreEndpointOfferSuperBinaryCommon(a1, (uint64_t *)v6);
  uint64_t v9 = v8;
  if (v8) {
    uarpFree(v7);
  }
  return v9;
}

uint64_t CoreUARPRestoreEndpointMsgRecv(uint64_t a1, unsigned __int16 *a2, unsigned int a3)
{
  uarpNtohs(*a2);
  uarpNtohs(a2[1]);
  uarpNtohs(a2[2]);
  CoreUARPRestoreLogDebug(*(void *)(a1 + 1928), 1, "UARP Restore: UARP RX: Buffer = %p, Payload Length = %u, Type = 0x%04x, Total Length = %u, ID = %u", v6, v7, v8, v9, v10, (char)a2);
  uint64_t v16 = uarpPlatformEndpointRecvMessage(a1 + 648, a1 + 1728, a2, a3);
  if (v16) {
    CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP Restore: Failed to process rx uarp message", v11, v12, v13, v14, v15, v18);
  }
  return v16;
}

uint64_t CoreUARPRestoreEndpointDataRecv(uint64_t a1, char *a2, int a3)
{
  uint64_t v9 = uarpPlatformEndpointStreamingRecvBytes(a1 + 648, a1 + 1728, a2, a3);
  if (v9) {
    CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "uarpPlatformEndpointStreamingRecvBytes() failed; 0x%08x",
  }
      v4,
      v5,
      v6,
      v7,
      v8,
      v9);
  return v9;
}

uint64_t CoreUARPRestoreEndpointRemoteEndpointApplyStagedAssets(uint64_t a1)
{
  return uarpPlatformEndpointApplyStagedAssets(a1 + 648, a1 + 1728);
}

uint64_t CoreUARPRestoreEndpointRemoteEndpointRescindAssets(uint64_t a1)
{
  return uarpPlatformEndpointRescindAllAssets(a1 + 648, a1 + 1728);
}

uint64_t CoreUARPRestoreEndpointQueryAppleProperty(uint64_t a1, unsigned int a2)
{
  int v5 = uarpHtonl(a2);
  v3 = uarpOuiAppleGenericFeatures();
  return uarpPlatformEndpointSendVendorSpecific(a1 + 648, a1 + 1728, v3, 0x20u, &v5, 4u);
}

void CoreUARPRestoreAssetTransferProgress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (a2)
    {
      if (*(void *)a2)
      {
        if (*(void *)(a1 + 8))
        {
          uint64_t v12 = uarpAssetTagStructSuperBinary();
          if (uarpAssetTagCompare((unsigned __int8 *)v12, (unsigned __int8 *)(*(void *)a2 + 48)))
          {
            uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 8);
            uint64_t v14 = *(void *)(a1 + 1928);
            v13(v14, a3, a4);
          }
        }
        else
        {
          CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP Restore: %s: fLayer3FirmwareStageProgress is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetTransferProgress");
        }
      }
      else
      {
        CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP Restore: %s: pAsset->_pAsset is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetTransferProgress");
      }
    }
    else
    {
      CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP Restore: %s: pAsset is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetTransferProgress");
    }
  }
  else
  {
    CoreUARPRestoreLogError(MEMORY[0x788], 1, "UARP Restore: %s: pEndpoint is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetTransferProgress");
  }
}

void CoreUARPRestoreAssetTransferStatus(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (a2)
    {
      if (*(void *)(a1 + 16))
      {
        uint64_t v11 = uarpAssetTagStructSuperBinary();
        if (uarpAssetTagCompare((unsigned __int8 *)v11, (unsigned __int8 *)(*(void *)a2 + 48)))
        {
          uint64_t v12 = *(void (**)(uint64_t, void, void))(a1 + 16);
          uint64_t v13 = *(void *)(a1 + 1928);
          v12(v13, a3, a3 & 0xFF00);
        }
      }
      else
      {
        CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP Restore: %s: fLayer3FirmwareStageStatus is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetTransferStatus");
      }
    }
    else
    {
      CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP Restore: %s: pAsset is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetTransferStatus");
    }
  }
  else
  {
    CoreUARPRestoreLogError(MEMORY[0x788], 1, "UARP Restore: %s: pEndpoint is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetTransferStatus");
  }
}

void CoreUARPRestoreAssetApplyStatus(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v8 = *(void (**)(uint64_t))(a1 + 24);
    uint64_t v9 = *(void *)(a1 + 1928);
    if (v8)
    {
      v8(v9);
    }
    else
    {
      CoreUARPRestoreLogError(v9, 1, "UARP Restore: %s: fLayer3ApplyStatus is NULL", 0, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetApplyStatus");
    }
  }
  else
  {
    CoreUARPRestoreLogError(MEMORY[0x788], 1, "UARP Restore: %s: pEndpoint is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetApplyStatus");
  }
}

void CoreUARPRestoreAssetRescindStatus(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v8 = *(void (**)(uint64_t))(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 1928);
    if (v8)
    {
      v8(v9);
    }
    else
    {
      CoreUARPRestoreLogError(v9, 1, "UARP Restore: %s: fLayer3RescindStatus is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetRescindStatus");
    }
  }
  else
  {
    CoreUARPRestoreLogError(MEMORY[0x788], 1, "UARP Restore: %s: pEndpoint is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetRescindStatus");
  }
}

void CoreUARPRestoreAssetPersonalizedFirmware(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 1928);
    if (v8)
    {
      v8(v9, a2, a3, 0);
    }
    else
    {
      CoreUARPRestoreLogError(v9, 1, "UARP Restore: %s: fLayer3PersonalizedFirmware is NULL", a4, 0, a6, a7, a8, (char)"CoreUARPRestoreAssetPersonalizedFirmware");
    }
  }
  else
  {
    CoreUARPRestoreLogError(MEMORY[0x788], 1, "UARP Restore: %s: pEndpoint is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetPersonalizedFirmware");
  }
}

uint64_t CoreUARPRestoreEndpointPropertyManufacturerName(uint64_t a1)
{
  return *(void *)(a1 + 1944);
}

uint64_t CoreUARPRestoreEndpointPropertyModelName(uint64_t a1)
{
  return *(void *)(a1 + 1952);
}

uint64_t CoreUARPRestoreEndpointPropertySerialNumber(uint64_t a1)
{
  return *(void *)(a1 + 1960);
}

uint64_t CoreUARPRestoreEndpointPropertyHadwareVersion(uint64_t a1)
{
  return *(void *)(a1 + 1968);
}

uint64_t CoreUARPRestoreEndpointPropertyActiveFirmwareVersion(uint64_t a1)
{
  return a1 + 1976;
}

uint64_t CoreUARPRestoreEndpointPropertyStagedFirmwareVersion(uint64_t a1)
{
  return a1 + 1992;
}

uint64_t CoreUARPRestoreEndpointPropertyFriendlyName(uint64_t a1)
{
  return *(void *)(a1 + 2040);
}

uint64_t CoreUARPRestoreEndpointPropertyAppleModelNumber(uint64_t a1)
{
  return *(void *)(a1 + 2024);
}

uint64_t CoreUARPRestoreEndpointPropertyHardwareFusing(uint64_t a1)
{
  return *(void *)(a1 + 2032);
}

void CoreUARPRestoreCancelWatchdogTimer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = *(NSObject **)(a1 + 2016);
  if (v10)
  {
    dispatch_source_cancel(v10);
    dispatch_release(*(dispatch_object_t *)(a1 + 2016));
    *(void *)(a1 + 2016) = 0;
    uint64_t v16 = *(void *)(a1 + 1928);
    CoreUARPRestoreLogError(v16, 1, "UARP.LAYER3.WATCHDOG.CANCEL", v11, v12, v13, v14, v15, a9);
  }
}

uint64_t fRestoreUARPWatchdogExpire(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    uint64_t v8 = result;
    CoreUARPRestoreLogDebug(*(void *)(result + 1928), 1, "UARP.RESTORE.LAYER3.WATCHDOG.EXPIRE", a4, a5, a6, a7, a8, v16);
    CoreUARPRestoreCancelWatchdogTimer(v8, v9, v10, v11, v12, v13, v14, v15, v17);
    return uarpPlatformEndpointWatchDogExpired(v8 + 648, v8 + 1728);
  }
  return result;
}

uint64_t UARPSoCUpdaterExecCommand(void *a1, void *a2, uint64_t a3, void *a4, CFErrorRef *a5)
{
  v25[2] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a1;
  if (!v10)
  {
    *a4 = 0;
    if (a5)
    {
      CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v16 = (const __CFString *)*MEMORY[0x263EFFC60];
      CFIndex v17 = 6;
LABEL_7:
      CFErrorRef v18 = CFErrorCreate(v15, v16, v17, 0);
      uint64_t v14 = 0;
      goto LABEL_8;
    }
LABEL_30:
    uint64_t v14 = 0;
    goto LABEL_31;
  }
  if ([v9 isEqualToString:@"queryTags"])
  {
    v24[0] = @"BuildIdentityTags";
    uint64_t v11 = [v10 firmwareTags];
    v25[0] = v11;
    v24[1] = @"ResponseTags";
    uint64_t v12 = [v10 ticketNameTags];
    v25[1] = v12;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

    *a4 = v13;
LABEL_4:
    uint64_t v14 = 1;
    goto LABEL_31;
  }
  if (![v9 isEqualToString:@"queryInfo"])
  {
    if ([v9 isEqualToString:@"generateMeasurements"])
    {
      if ([v10 offerFirmwareDataWithDictionary:a3])
      {
        uint64_t v21 = [v10 personalizationRequests];

        if (v21)
        {
          if (a4) {
            *a4 = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFDictionaryRef)[v10 personalizationRequests]);
          }
        }
        else
        {
          *a4 = 0;
          if (a5) {
            *a5 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFErrorDomain)*MEMORY[0x263EFFC60], 94, 0);
          }
        }
        goto LABEL_4;
      }
      *a4 = 0;
      if (a5)
      {
        CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFStringRef v16 = (const __CFString *)*MEMORY[0x263EFFC60];
        CFIndex v17 = 95;
        goto LABEL_7;
      }
    }
    else if ([v9 isEqualToString:@"performNextStage"])
    {
      if ([v10 offerPersonalizationDataWithDictionary:a3])
      {
        uint64_t v22 = [v10 applyStagedFirmware];
        uint64_t v14 = v22;
        if (!a5 || (v22 & 1) != 0) {
          goto LABEL_31;
        }
        CFErrorRef v18 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFErrorDomain)*MEMORY[0x263EFFC60], 100, 0);
LABEL_8:
        *a5 = v18;
        goto LABEL_31;
      }
      if (a5)
      {
        CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFStringRef v16 = (const __CFString *)*MEMORY[0x263EFFC60];
        CFIndex v17 = 104;
        goto LABEL_7;
      }
    }
    else if (a5)
    {
      CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v16 = (const __CFString *)*MEMORY[0x263EFFC60];
      CFIndex v17 = 102;
      goto LABEL_7;
    }
    goto LABEL_30;
  }
  uint64_t v19 = [v10 queryInfo];
  uint64_t v20 = v19;
  if (v19)
  {
    *a4 = v19;
    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v14 = 0;
  }

LABEL_31:
  return v14;
}

uint64_t CoreUARPRestorePersonalizationTssResponse(uint64_t a1, uint64_t a2, int a3, CFDictionaryRef theDict, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (theDict)
  {
    uint64_t v10 = *(void *)(a2 + 296);
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue(theDict, *(const void **)(v10 + 56));
    unsigned int Length = CFDataGetLength(Value);
    *(_DWORD *)(v10 + 72) = Length;
    uint64_t v13 = uarpZalloc(Length);
    *(void *)(v10 + 64) = v13;
    BytePtr = CFDataGetBytePtr(Value);
    memcpy(v13, BytePtr, *(unsigned int *)(v10 + 72));
    CFAllocatorRef v15 = *(void (**)(void, void, void))(a1 + 48);
    if (v15) {
      v15(*(void *)(a1 + 1928), *(void *)(v10 + 64), *(unsigned int *)(v10 + 72));
    }
    CFRelease(*(CFTypeRef *)(v10 + 48));
    *(void *)(v10 + 48) = 0;
    CFRelease(*(CFTypeRef *)(v10 + 56));
    *(void *)(v10 + 56) = 0;
    CoreUARPRestoreLogInfo(*(void *)(a1 + 1928), 1, "CoreUARP Restore IM4M: Building Personalization Response", v16, v17, v18, v19, v20, v45);
    if (*(unsigned char *)(a1 + 1936) == 1)
    {
      time_t v46 = time(0);
      uint64_t v21 = localtime(&v46);
      int tm_mon = v21->tm_mon;
      int tm_year = v21->tm_year;
      int tm_hour = v21->tm_hour;
      int tm_mday = v21->tm_mday;
      int tm_sec = v21->tm_sec;
      int tm_min = v21->tm_min;
      *(_OWORD *)(a2 + 24) = 0u;
      *(_OWORD *)(a2 + 40) = 0u;
      *(_OWORD *)(a2 + 56) = 0u;
      *(_OWORD *)(a2 + 72) = 0u;
      *(_OWORD *)(a2 + 88) = 0u;
      *(_OWORD *)(a2 + 104) = 0u;
      *(_OWORD *)(a2 + 120) = 0u;
      *(_OWORD *)(a2 + 136) = 0u;
      *(_OWORD *)(a2 + 152) = 0u;
      *(_OWORD *)(a2 + 168) = 0u;
      *(_OWORD *)(a2 + 184) = 0u;
      *(_OWORD *)(a2 + 200) = 0u;
      *(_OWORD *)(a2 + 216) = 0u;
      *(_OWORD *)(a2 + 232) = 0u;
      *(_OWORD *)(a2 + 248) = 0u;
      *(_OWORD *)(a2 + 264) = 0u;
      snprintf((char *)(a2 + 24), 0x100uLL, "IM4M-CoreUARPRestore-%d-%02d-%02d-%02d-%02d-%02d.uarp", tm_year + 1900, tm_mon + 1, tm_mday, tm_hour, tm_min, tm_sec);
      v28 = fopen((const char *)(a2 + 24), "w+");
      *(void *)(a2 + 16) = v28;
      if (!v28)
      {
        Assetunsigned int Length = 11;
LABEL_23:
        CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "CoreUARP Restore IM4M: CoreUARPRestoreBuildPersonalizationResponse: %d ", v29, v30, v31, v32, v33, AssetLength);
        return AssetLength;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 308) = 0x400000;
      *(void *)(a2 + 280) = uarpZalloc(0x400000uLL);
    }
    Assetunsigned int Length = uarpPersonalizationRequestAssetInitialize(a1 + 648, a2, 1);
    if (AssetLength) {
      goto LABEL_23;
    }
    for (uint64_t i = *(void *)(a2 + 312); i; uint64_t i = *(void *)(i + 16))
    {
      uint64_t v36 = UARPSuperBinaryAddMetaData(a1 + 648, a2, *(_DWORD *)i, *(_DWORD *)(i + 4), *(void *)(i + 8));
      if (v36) {
        goto LABEL_22;
      }
    }
    v37 = *(unsigned __int16 **)(a2 + 296);
    Assetunsigned int Length = uarpPersonalizationRequestPreparePayload(a1 + 648, a2, *v37);
    if (AssetLength) {
      goto LABEL_23;
    }
    uint64_t v38 = *((void *)v37 + 5);
    if (v38)
    {
      while (1)
      {
        uint64_t v36 = UARPSuperBinaryAddPayloadMetaData(a1 + 648, a2, *v37, *(_DWORD *)v38, *(_DWORD *)(v38 + 4), *(void *)(v38 + 8));
        if (v36) {
          break;
        }
        uint64_t v38 = *(void *)(v38 + 16);
        if (!v38) {
          goto LABEL_17;
        }
      }
LABEL_22:
      Assetunsigned int Length = v36;
      goto LABEL_23;
    }
LABEL_17:
    Assetunsigned int Length = UARPSuperBinaryAddPayloadData(a1 + 648, a2, *v37, *((void *)v37 + 8), *((_DWORD *)v37 + 18));
    if (AssetLength) {
      goto LABEL_23;
    }
    Assetunsigned int Length = UARPSuperBinaryFinalizeHeader(a1 + 648, a2);
    if (AssetLength) {
      goto LABEL_23;
    }
    Assetunsigned int Length = UARPSuperBinaryQueryAssetLength(a1 + 648, *(void *)a2, (_DWORD *)(a2 + 308));
    if (AssetLength) {
      goto LABEL_23;
    }
    Assetunsigned int Length = uarpPlatformEndpointOfferAsset(a1 + 648, a1 + 1728, a2);
    if (AssetLength) {
      CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "CoreUARP Restore IM4M: uarpPlatformEndpointOfferAsset: %d ", v39, v40, v41, v42, v43, 0);
    }
  }
  else
  {
    CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "CoreUARP Restore IM4M: Post-Layer3: TSS Response is NULL", 0, a5, a6, a7, a8, v45);
    return 56;
  }
  return AssetLength;
}

double CoreUARPRestoreSetAssetPersonalizationCallbacks(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)a1 = fPersonalizationAssetReady;
  *(void *)(a1 + 88) = fPersonalizationAssetGetBytesAtOffset2;
  *(void *)(a1 + 96) = fPersonalizationAssetSetBytesAtOffset2;
  *(void *)(a1 + 120) = fPersonalizationAssetCorrupt;
  *(void *)(a1 + 128) = fPersonalizationAssetOrphaned;
  *(void *)(a1 + 136) = fPersonalizationAssetReleased2;
  *(void *)(a1 + 144) = fPersonalizationAssetProcessingNotification2;
  *(void *)(a1 + 152) = fPersonalizationAssetProcessingNotificationAck;
  *(void *)(a1 + 160) = fPersonalizationAssetPreProcessingNotification;
  *(void *)(a1 + 168) = fPersonalizationAssetPreProcessingNotificationAck;
  *(void *)(a1 + 176) = fPersonalizationAssetAllHeadersAndMetaDataComplete;
  return result;
}

uint64_t fPersonalizationAssetReady(uint64_t result, uint64_t *a2)
{
  if (result)
  {
    if (a2) {
      return uarpPlatformEndpointPayloadRequestAllHeadersAndMetaData(result + 648, *a2);
    }
  }
  return result;
}

uint64_t fPersonalizationAssetGetBytesAtOffset2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, _WORD *a7, uint64_t a8)
{
  unsigned int v10 = a5;
  size_t v14 = a5;
  CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP Restore (IM4M): Get %u Bytes from offset %u", (uint64_t)a4, a5, a6, (uint64_t)a7, a8, a5);
  if (*(unsigned char *)(a1 + 1936) == 1)
  {
    fseek(*(FILE **)(a3 + 16), a6, 0);
    size_t v19 = fread(a4, 1uLL, v14, *(FILE **)(a3 + 16));
    if (v19 < v10)
    {
      uint64_t v20 = *(FILE **)(a3 + 16);
      int v21 = ferror(v20);
      if (v21)
      {
        CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP Restore: Read error %d, Read %zu bytes", v22, v23, v24, v25, v26, v21);
        return 54;
      }
      int v31 = feof(v20);
      CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP Restore: EOF %d, Read %zu bytes", v32, v33, v34, v35, v36, v31);
      if (!v31) {
        return 54;
      }
    }
  }
  else
  {
    unsigned int v27 = *(_DWORD *)(a3 + 308);
    if (v10 + a6 <= v27) {
      unsigned __int16 v28 = v10;
    }
    else {
      unsigned __int16 v28 = v27 - a6;
    }
    LOWORD(v19) = v28;
    memcpy(a4, (const void *)(*(void *)(a3 + 280) + a6), v28);
  }
  *a7 = v19;
  uint64_t v29 = *(unsigned int *)(a3 + 308);
  if (v29) {
    CoreUARPRestoreAssetTransferProgress(a1, a3, a6, v29, v15, v16, v17, v18);
  }
  return 0;
}

uint64_t fPersonalizationAssetSetBytesAtOffset2(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = a6;
  int v9 = a5;
  size_t v13 = a5;
  CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP Restore (IM4M): Get %u Bytes from offset %u", (uint64_t)a4, a5, a6, a7, a8, a5);
  if (*(unsigned char *)(a1 + 1936) == 1)
  {
    if (fseek(*(FILE **)(a3 + 16), v8, 0) == -1 || fwrite(a4, 1uLL, v13, *(FILE **)(a3 + 16)) != v9) {
      return 54;
    }
    fflush(*(FILE **)(a3 + 16));
  }
  else
  {
    if (v9 + v8 > *(_DWORD *)(a3 + 308)) {
      return 43;
    }
    memcpy((void *)(*(void *)(a3 + 280) + v8), a4, v13);
  }
  return 0;
}

uint64_t fPersonalizationAssetProcessingNotification2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return 0;
}

uint64_t fPersonalizationAssetProcessingNotificationAck()
{
  return 0;
}

uint64_t fPersonalizationAssetPreProcessingNotification()
{
  return 0;
}

uint64_t fPersonalizationAssetPreProcessingNotificationAck()
{
  return 0;
}

void fPersonalizationAssetAllHeadersAndMetaDataComplete(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return;
  }
  if (!a3) {
    return;
  }
  int v5 = uarpZalloc(0x148uLL);
  v5[40] = a1[239];
  a1[239] = v5;
  long long v142 = 0u;
  memset(v143, 0, sizeof(v143));
  long long v140 = 0u;
  long long v141 = 0u;
  memset(v139, 0, sizeof(v139));
  uarpZero(v139, 0xE0uLL);
  memset((char *)v143 + 8, 0, 40);
  *(_OWORD *)((char *)&v139[6] + 8) = 0u;
  memset((char *)v139 + 8, 0, 80);
  *(void *)&v139[0] = fPersonalizationAssetReady;
  *((void *)&v139[5] + 1) = fPersonalizationAssetGetBytesAtOffset2;
  *(void *)&v139[6] = fPersonalizationAssetSetBytesAtOffset2;
  *((void *)&v139[7] + 1) = fPersonalizationAssetCorrupt;
  *(void *)&long long v140 = fPersonalizationAssetOrphaned;
  *((void *)&v140 + 1) = fPersonalizationAssetReleased2;
  *(void *)&long long v141 = fPersonalizationAssetProcessingNotification2;
  *((void *)&v141 + 1) = fPersonalizationAssetProcessingNotificationAck;
  *(void *)&long long v142 = fPersonalizationAssetPreProcessingNotification;
  *((void *)&v142 + 1) = fPersonalizationAssetPreProcessingNotificationAck;
  *(void *)&v143[0] = fPersonalizationAssetAllHeadersAndMetaDataComplete;
  uint64_t v6 = uarpAssetTagStructPersonalization();
  uarpPlatformEndpointPrepareDynamicAsset((uint64_t)(a1 + 81), (uint64_t)(a1 + 216), (uint64_t)v5, v6, (uint64_t)v139);
  if (v7) {
    return;
  }
  void *v5 = uarpPlatformAssetFindByAssetContext((uint64_t)(a1 + 81), (uint64_t)v5);
  v5[1] = a1;
  uint64_t SuperBinaryMetaData = uarpAssetQuerySuperBinaryMetaData((uint64_t)(a1 + 81), *(void *)a3);
  if (SuperBinaryMetaData)
  {
    uint64_t v14 = SuperBinaryMetaData;
    do
    {
      CoreUARPRestoreLogInfo(a1[241], 3, "Payload Metadata <0x%08x>", v9, v10, v11, v12, v13, *(_DWORD *)v14);
      uint64_t v15 = (unsigned int *)uarpZalloc(0x18uLL);
      *uint64_t v15 = *(_DWORD *)v14;
      size_t v16 = *(unsigned int *)(v14 + 4);
      v15[1] = v16;
      uint64_t v17 = uarpZalloc(v16);
      *((void *)v15 + 1) = v17;
      memcpy(v17, *(const void **)(v14 + 8), v15[1]);
      *((void *)v15 + 2) = v5[39];
      v5[39] = v15;
      uint64_t v14 = *(void *)(v14 + 16);
    }
    while (v14);
  }
  *(_WORD *)(a3 + 288) = 0;
  if (uarpPlatformEndpointAssetQueryNumberOfPayloads((uint64_t)(a1 + 81), *(void *)a3, (_WORD *)(a3 + 288)))return; {
  *(void *)(a3 + 296) = uarpZalloc(88 * *(unsigned __int16 *)(a3 + 288));
  }
  unsigned int v18 = *(unsigned __int16 *)(a3 + 288);
  *((_WORD *)v5 + 144) = v18;
  v5[37] = uarpZalloc(88 * v18);
  if (!*(_WORD *)(a3 + 288))
  {
LABEL_16:
    uarpPlatformEndpointAssetFullyStaged((uint64_t)(a1 + 81), *(void *)a3);
    if (!*((_WORD *)v5 + 144)) {
      return;
    }
    v62 = (void *)v5[37];
    CFAllocatorRef v63 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    v134 = v62;
    v70 = (int *)v62[5];
    theDict = Mutable;
    if (!v70)
    {
      v76 = Mutable;
      CFStringRef v77 = 0;
      goto LABEL_55;
    }
    CFStringRef v71 = 0;
    int v137 = 0;
    int v72 = 0;
    uint64_t v135 = 0;
    do
    {
      CoreUARPRestoreLogDebug(a1[241], 1, "CoreUARP Restore IM4M: First Pass on TLV <0x%08x>", v65, v66, v67, v68, v69, *v70);
      int v73 = *v70;
      if (*v70 > -2001563359)
      {
        if (v73 == -2001563358)
        {
          if (v70[1] == 1 && **((unsigned char **)v70 + 1)) {
            int v72 = 1;
          }
        }
        else if (v73 == -2001563355 && v70[1] == 4)
        {
          uint64_t v135 = uarpHtonl(**((_DWORD **)v70 + 1));
        }
      }
      else if (v73 == -2001563389)
      {
        CFStringRef v71 = CFStringCreateWithBytes(v63, *((const UInt8 **)v70 + 1), v70[1], 0x8000100u, 0);
      }
      else if (v73 == -2001563359 && v70[1] == 1)
      {
        int v74 = v137;
        if (**((unsigned char **)v70 + 1)) {
          int v74 = 1;
        }
        int v137 = v74;
      }
      v70 = (int *)*((void *)v70 + 2);
    }
    while (v70);
    int v75 = v72;
    if (v137 != 1 && v72 != 1)
    {
      v76 = theDict;
      CFStringRef v77 = v71;
      goto LABEL_55;
    }
    uint64_t v78 = v135;
    if (!v135)
    {
      CFDictionaryRef v79 = (const __CFDictionary *)CoreUARPRestoreNextLUNForPrefix_lunDictRef;
      if (!CoreUARPRestoreNextLUNForPrefix_lunDictRef)
      {
        CFDictionaryRef v79 = CFDictionaryCreateMutable(v63, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        CoreUARPRestoreNextLUNForPrefix_lunDictRef = (uint64_t)v79;
      }
      value[0] = 0;
      if (CFDictionaryGetValueIfPresent(v79, v71, (const void **)value))
      {
        CFTypeID v80 = CFGetTypeID(value[0]);
        if (v80 == CFNumberGetTypeID() && CFNumberGetType((CFNumberRef)value[0]) == kCFNumberSInt32Type)
        {
          unsigned int valuePtr = 0;
          if (CFNumberGetValue((CFNumberRef)value[0], kCFNumberSInt32Type, &valuePtr))
          {
            ++valuePtr;
            CFNumberRef v81 = CFNumberCreate(v63, kCFNumberSInt32Type, &valuePtr);
            if (v81)
            {
              CFNumberRef v82 = v81;
              CFDictionaryReplaceValue((CFMutableDictionaryRef)CoreUARPRestoreNextLUNForPrefix_lunDictRef, v71, v81);
LABEL_50:
              uint64_t v78 = valuePtr;
              CFRelease(v82);
              goto LABEL_52;
            }
          }
        }
      }
      else
      {
        unsigned int valuePtr = 1;
        CFNumberRef v83 = CFNumberCreate(v63, kCFNumberSInt32Type, &valuePtr);
        if (v83)
        {
          CFNumberRef v82 = v83;
          CFDictionarySetValue((CFMutableDictionaryRef)CoreUARPRestoreNextLUNForPrefix_lunDictRef, v71, v83);
          goto LABEL_50;
        }
      }
      uint64_t v78 = 0;
    }
LABEL_52:
    CFStringRef v77 = CFStringCreateWithFormat(v63, 0, @"%@%d", v71, v78, v121, v122);
    CFRelease(v71);
    BOOL v108 = v75 == 1;
    v76 = theDict;
    if (v108)
    {
      CFStringRef v84 = CFStringCreateWithFormat(v63, 0, @"%@%d", @"BoardID", v78);
      CFStringRef cf = CFStringCreateWithFormat(v63, 0, @"%@%d", @"ChipID", v78);
      CFStringRef v129 = CFStringCreateWithFormat(v63, 0, @"%@%d", @"ECID", v78);
      CFStringRef v128 = CFStringCreateWithFormat(v63, 0, @"%@%d", @"Nonce", v78);
      CFStringRef v127 = CFStringCreateWithFormat(v63, 0, @"%@%d", @"ProductionMode", v78);
      CFStringRef v126 = CFStringCreateWithFormat(v63, 0, @"%@%d", @"SecurityDomain", v78);
      CFStringRef v125 = CFStringCreateWithFormat(v63, 0, @"%@%d", @"SecurityMode", v78);
      CFStringRef v85 = CFStringCreateWithFormat(v63, 0, @"%@%d", @"SocLiveNonce", v78);
LABEL_56:
      CFStringRef v124 = v85;
      v86 = (int *)v134[5];
      v138 = (void *)*MEMORY[0x263EFFB40];
      if (v86)
      {
        int v133 = 0;
        v136 = (const void *)*MEMORY[0x263EFFB38];
        CFStringRef v123 = v84;
        CFStringRef v130 = v77;
        while (2)
        {
          int v87 = *v86;
          switch(*v86)
          {
            case -2001563388:
              if (v86[1] == 4)
              {
                LODWORD(value[0]) = 0;
                LODWORD(value[0]) = uarpHtonl(**((_DWORD **)v86 + 1));
                CFAllocatorRef v91 = v63;
                CFNumberType v92 = kCFNumberSInt32Type;
                goto LABEL_123;
              }
              goto LABEL_131;
            case -2001563387:
              if (v86[1] == 4)
              {
                LODWORD(value[0]) = 0;
                LODWORD(value[0]) = uarpHtonl(**((_DWORD **)v86 + 1));
                CFNumberRef v88 = CFNumberCreate(v63, kCFNumberSInt32Type, value);
                v89 = (__CFString *)cf;
                goto LABEL_72;
              }
              goto LABEL_131;
            case -2001563386:
              if (v86[1] == 8)
              {
                value[0] = 0;
                value[0] = (void *)uarpHtonll(**((void **)v86 + 1));
                CFNumberRef v90 = CFNumberCreate(v63, kCFNumberSInt64Type, value);
                goto LABEL_69;
              }
              goto LABEL_131;
            case -2001563385:
            case -2001563384:
              CFNumberRef v88 = CFDataCreate(v63, *((const UInt8 **)v86 + 1), v86[1]);
              v89 = @"Nonce";
              goto LABEL_72;
            case -2001563383:
              if (v86[1] != 4) {
                goto LABEL_131;
              }
              LODWORD(value[0]) = 0;
              LODWORD(value[0]) = uarpHtonl(**((_DWORD **)v86 + 1));
              CFNumberRef v88 = CFNumberCreate(v63, kCFNumberSInt32Type, value);
              v89 = @"SecurityDomain";
              goto LABEL_72;
            case -2001563382:
              if (v86[1] != 4) {
                goto LABEL_131;
              }
              if (uarpHtonl(**((_DWORD **)v86 + 1))) {
                v94 = v138;
              }
              else {
                v94 = v136;
              }
              v95 = @"SecurityMode";
              goto LABEL_120;
            case -2001563381:
              if (v86[1] != 4) {
                goto LABEL_131;
              }
              if (uarpHtonl(**((_DWORD **)v86 + 1))) {
                v94 = v138;
              }
              else {
                v94 = v136;
              }
              v95 = @"ProductionMode";
              goto LABEL_120;
            case -2001563380:
            case -2001563379:
            case -2001563378:
            case -2001563377:
            case -2001563375:
            case -2001563374:
            case -2001563373:
            case -2001563372:
            case -2001563371:
            case -2001563370:
            case -2001563369:
            case -2001563367:
            case -2001563366:
              goto LABEL_131;
            case -2001563376:
              CFMutableDictionaryRef v96 = CFDictionaryCreateMutable(v63, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
              int v97 = v86[1];
              if (v97)
              {
                v98 = v96;
                CFStringRef v99 = 0;
                v100 = (unsigned int *)*((void *)v86 + 1);
                do
                {
                  int v101 = uarpNtohl(*v100);
                  unsigned int v102 = uarpNtohl(v100[1]);
                  unsigned int v103 = v102;
                  v104 = (const UInt8 *)(v100 + 2);
                  switch(v101)
                  {
                    case -2001563374:
                      CFStringRef v99 = CFStringCreateWithBytes(v63, v104, v102, 0x8000100u, 0);
                      goto LABEL_112;
                    case -2001563373:
                      CFDataRef v105 = CFDataCreate(v63, v104, v102);
                      v106 = v98;
                      v107 = @"Digest";
                      goto LABEL_95;
                    case -2001563371:
                      if (v102 != 2) {
                        goto LABEL_112;
                      }
                      if (uarpHtons(*(unsigned __int16 *)v104)) {
                        v109 = v138;
                      }
                      else {
                        v109 = v136;
                      }
                      v110 = v98;
                      v111 = @"ESEC";
                      break;
                    case -2001563370:
                      if (v102 != 2) {
                        goto LABEL_112;
                      }
                      if (uarpHtons(*(unsigned __int16 *)v104)) {
                        v109 = v138;
                      }
                      else {
                        v109 = v136;
                      }
                      v110 = v98;
                      v111 = @"EPRO";
                      break;
                    case -2001563369:
                      if (v102 != 2) {
                        goto LABEL_112;
                      }
                      if (uarpHtons(*(unsigned __int16 *)v104)) {
                        v109 = v138;
                      }
                      else {
                        v109 = v136;
                      }
                      v110 = v98;
                      v111 = @"Trusted";
                      break;
                    default:
                      BOOL v108 = v101 == -2001563360 && v102 == 4;
                      if (v108)
                      {
                        LODWORD(value[0]) = 0;
                        LODWORD(value[0]) = uarpHtonl(*(_DWORD *)v104);
                        CFDataRef v105 = CFNumberCreate(v63, kCFNumberSInt32Type, value);
                        v106 = v98;
                        v107 = @"DigestListSize";
LABEL_95:
                        CFDictionaryAddValue(v106, v107, v105);
                        CFRelease(v105);
                      }
                      goto LABEL_112;
                  }
                  CFDictionaryAddValue(v110, v111, v109);
LABEL_112:
                  v100 = (unsigned int *)&v104[v103];
                  unsigned int v112 = v97 - v103;
                  int v97 = v97 - v103 - 8;
                }
                while (v112 != 8);
                CFStringRef v77 = v130;
                if (v99)
                {
                  CFStringRef v113 = CFStringCreateWithFormat(v63, 0, @"%@,%@", v130, v99);
                  v76 = theDict;
                  CFDictionaryAddValue(theDict, v113, v98);
                  CFRelease(v113);
                }
                else
                {
                  v76 = theDict;
                }
                CFStringRef v84 = v123;
              }
              else
              {
                CFStringRef v77 = v130;
              }
              goto LABEL_131;
            case -2001563368:
              if (v86[1] != 1) {
                goto LABEL_131;
              }
              if (**((unsigned char **)v86 + 1)) {
                v94 = v138;
              }
              else {
                v94 = v136;
              }
              v95 = @"SocLiveNonce";
LABEL_120:
              CFStringRef v114 = CFStringCreateWithFormat(v63, 0, @"%@,%@", v77, v95);
              CFDictionaryAddValue(v76, v114, v94);
              goto LABEL_131;
            case -2001563365:
              if (v86[1] != 8) {
                goto LABEL_131;
              }
              value[0] = 0;
              value[0] = (void *)uarpHtonll(**((void **)v86 + 1));
              CFAllocatorRef v91 = v63;
              CFNumberType v92 = kCFNumberSInt64Type;
LABEL_123:
              CFNumberRef v88 = CFNumberCreate(v91, v92, value);
              CFStringRef v93 = CFStringCreateWithFormat(v63, 0, @"%@,%@", v77, v84);
              goto LABEL_73;
            default:
              if (v87 == -2001563353)
              {
                if (v86[1] == 1)
                {
                  int v115 = v133;
                  if (**((unsigned char **)v86 + 1)) {
                    int v115 = 1;
                  }
                  int v133 = v115;
                }
              }
              else if (v87 == -2001563339)
              {
                CFNumberRef v90 = CFDataCreate(v63, *((const UInt8 **)v86 + 1), v86[1]);
LABEL_69:
                CFNumberRef v88 = v90;
                v89 = @"ECID";
LABEL_72:
                CFStringRef v93 = CFStringCreateWithFormat(v63, 0, @"%@,%@", v77, v89);
LABEL_73:
                CFDictionaryAddValue(v76, v93, v88);
                CFRelease(v88);
              }
LABEL_131:
              v86 = (int *)*((void *)v86 + 2);
              if (!v86) {
                goto LABEL_134;
              }
              continue;
          }
        }
      }
      LOBYTE(v133) = 0;
LABEL_134:
      CFStringRef v116 = CFStringCreateWithFormat(v63, 0, @"%@,%@", v77, @"Ticket");
      v134[7] = v116;
      CFStringRef v117 = CFStringCreateWithFormat(v63, 0, @"@%@", v116);
      CFDictionaryAddValue(v76, v117, v138);
      CFRelease(v117);
      CFRelease(v77);
      CFRelease(v84);
      CFRelease(cf);
      CFRelease(v129);
      CFRelease(v128);
      CFRelease(v127);
      CFRelease(v126);
      CFRelease(v125);
      CFRelease(v124);
      v134[6] = v76;
      v118 = (void (*)(void, void *, void, const char *, void))a1[5];
      if (v118) {
        v118(a1[241], v5, *(void *)(v5[37] + 48), "https://gs.apple.com:443", v133);
      }
      return;
    }
LABEL_55:
    CFStringRef v84 = CFStringCreateWithFormat(v63, 0, @"%@", @"BoardID", v119);
    CFStringRef cf = CFStringCreateWithFormat(v63, 0, @"%@", @"ChipID");
    CFStringRef v129 = CFStringCreateWithFormat(v63, 0, @"%@", @"ECID");
    CFStringRef v128 = CFStringCreateWithFormat(v63, 0, @"%@", @"Nonce");
    CFStringRef v127 = CFStringCreateWithFormat(v63, 0, @"%@", @"ProductionMode");
    CFStringRef v126 = CFStringCreateWithFormat(v63, 0, @"%@", @"SecurityDomain");
    CFStringRef v125 = CFStringCreateWithFormat(v63, 0, @"%@", @"SecurityMode");
    CFStringRef v85 = CFStringCreateWithFormat(v63, 0, @"%@", @"SocLiveNonce", v120);
    goto LABEL_56;
  }
  uint64_t v19 = 0;
  while (1)
  {
    uint64_t v20 = *(void *)(a3 + 296);
    int v21 = (_WORD *)(v20 + 88 * v19);
    uint64_t v22 = v5[37];
    *int v21 = v19;
    uint64_t v23 = (char *)(v21 + 2);
    if (uarpAssetQueryPayloadInfo((uint64_t)(a1 + 81), *(void *)a3, v19, (uint64_t)v23)) {
      break;
    }
    CoreUARPRestoreLogInfo(a1[241], 3, "Payload Index %u", v24, v25, v26, v27, v28, v19);
    CoreUARPRestoreLogInfo(a1[241], 3, "- Tag is %c%c%c%c", v29, v30, v31, v32, v33, *v23);
    uint64_t v34 = v20 + 88 * v19;
    uint64_t v121 = *(unsigned int *)(v34 + 16);
    uint64_t v122 = *(unsigned int *)(v34 + 20);
    uint64_t v119 = *(unsigned int *)(v34 + 12);
    CoreUARPRestoreLogInfo(a1[241], 3, "- Version is %u.%u.%u.%u", v35, v36, v37, v38, v39, *(_DWORD *)(v34 + 8));
    CoreUARPRestoreLogInfo(a1[241], 3, "- Data length is %u", v40, v41, v42, v43, v44, *(_DWORD *)(v34 + 28));
    CoreUARPRestoreLogInfo(a1[241], 3, "- MetaData length is %u", v45, v46, v47, v48, v49, *(_DWORD *)(v34 + 24));
    uint64_t v50 = v22 + 88 * v19;
    *(_DWORD *)(v50 + 4) = *(_DWORD *)v23;
    *(_OWORD *)(v50 + 8) = *(_OWORD *)(v34 + 8);
    *(void *)(v34 + 80) = uarpZalloc(*(unsigned int *)(v34 + 28));
    uint64_t PayloadMetaData = uarpAssetQueryPayloadMetaData((uint64_t)(a1 + 81), *(void *)a3, v19);
    *(void *)(v34 + 40) = PayloadMetaData;
    if (PayloadMetaData)
    {
      uint64_t v57 = PayloadMetaData;
      v58 = (void *)(v22 + 88 * v19 + 40);
      do
      {
        CoreUARPRestoreLogInfo(a1[241], 3, "Payload Metadata <0x%08x>", v52, v53, v54, v55, v56, *(_DWORD *)v57);
        v59 = (unsigned int *)uarpZalloc(0x18uLL);
        unsigned int *v59 = *(_DWORD *)v57;
        size_t v60 = *(unsigned int *)(v57 + 4);
        v59[1] = v60;
        v61 = uarpZalloc(v60);
        *((void *)v59 + 1) = v61;
        memcpy(v61, *(const void **)(v57 + 8), v59[1]);
        *((void *)v59 + 2) = *v58;
        void *v58 = v59;
        uint64_t v57 = *(void *)(v57 + 16);
      }
      while (v57);
    }
    if (++v19 >= (unint64_t)*(unsigned __int16 *)(a3 + 288)) {
      goto LABEL_16;
    }
  }
}

uint64_t CoreUARPRestoreEndpointPropertyManifestPrefix(uint64_t a1)
{
  return *(void *)(a1 + 2048);
}

uint64_t CoreUARPRestoreEndpointPropertyBoardID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2056);
}

uint64_t CoreUARPRestoreEndpointPropertyBoardID64(uint64_t a1)
{
  return *(void *)(a1 + 2056);
}

uint64_t CoreUARPRestoreEndpointPropertyChipID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2064);
}

uint64_t CoreUARPRestoreEndpointPropertyChipRevision(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2068);
}

uint64_t CoreUARPRestoreEndpointPropertyECID(uint64_t a1)
{
  return *(void *)(a1 + 2072);
}

uint64_t CoreUARPRestoreEndpointPropertySecurityDomain(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2092);
}

uint64_t CoreUARPRestoreEndpointPropertySecurityMode(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2096);
}

uint64_t CoreUARPRestoreEndpointPropertyProductionMode(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2100);
}

uint64_t CoreUARPRestoreEndpointPropertyChipEpoch(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2104);
}

uint64_t CoreUARPRestoreEndpointPropertyEnableMixMatch(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2108);
}

uint64_t CoreUARPRestoreEndpointPropertyLiveNonce(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2109);
}

uint64_t CoreUARPRestoreEndpointPropertyPrefixNeedsLUN(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2110);
}

uint64_t CoreUARPRestoreEndpointPropertySuffixNeedsLUN(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2111);
}

uint64_t CoreUARPRestoreEndpointPropertyLogicalUnitNumber(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2112);
}

uint64_t CoreUARPRestoreEndpointPropertyTicketLongName(uint64_t a1)
{
  return *(void *)(a1 + 2120);
}

uint64_t CoreUARPRestoreEndpointPropertyRequiresPersonalization(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2128);
}

uint64_t CoreUARPRestoreEndpointPropertyApBoardID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2132);
}

uint64_t CoreUARPRestoreEndpointPropertyApChipID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2136);
}

uint64_t CoreUARPRestoreEndpointPropertyApProductionMode(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2140);
}

uint64_t CoreUARPRestoreEndpointPropertyApSecurityMode(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2144);
}

uint64_t CoreUARPRestoreEndpointPropertyHardwareSpecific(uint64_t result, void *a2, _DWORD *a3)
{
  *a2 = *(void *)(result + 2152);
  *a3 = *(_DWORD *)(result + 2160);
  return result;
}

uint64_t CoreUARPRestoreEndpointPropertyNonce(uint64_t result, void *a2, _DWORD *a3)
{
  *a2 = *(void *)(result + 2168);
  *a3 = *(_DWORD *)(result + 2176);
  return result;
}

uint64_t CoreUARPRestoreEndpointPropertyLife(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2180);
}

uint64_t CoreUARPRestoreEndpointPropertyProvisioning(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2182);
}

uint64_t CoreUARPRestoreEndpointPropertyManifestEpoch(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2181);
}

uint64_t CoreUARPRestoreEndpointPropertyManifestSuffix(uint64_t a1)
{
  return *(void *)(a1 + 2184);
}

uint64_t CoreUARPRestoreEndpointPropertyECIDData(uint64_t result, void *a2, _DWORD *a3)
{
  *a2 = *(void *)(result + 2080);
  *a3 = *(_DWORD *)(result + 2088);
  return result;
}

void *UarpRestoreInitializeEndpoint(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4)
{
  return UarpRestoreInitializeEndpoint2(a1, a2, a3, 0, a4);
}

void *UarpRestoreInitializeEndpoint2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5)
{
  if (!a5) {
    return 0;
  }
  v37[0] = UarpRestoreEndpointMsgRecv;
  v37[1] = UarpRestoreEndpointDataRecv;
  uint64_t v10 = uarpZalloc(0x108uLL);
  if (v10)
  {
    uint64_t v11 = uarpZalloc(0x50uLL);
    uint64_t v12 = 0;
    v10[32] = v11;
    do
    {
      uint64_t v13 = uarpLoggingCategoryToString(v12);
      v11[v12++] = os_log_create("com.apple.uarp.layer3.restore", v13);
    }
    while (v12 != 9);
    dispatch_queue_t v14 = dispatch_queue_create(a5, 0);
    v10[7] = a1;
    void *v10 = v14;
    v10[1] = a2;
    long long v15 = *(_OWORD *)(a3 + 80);
    long long v16 = *(_OWORD *)(a3 + 96);
    long long v17 = *(_OWORD *)(a3 + 112);
    v10[24] = *(void *)(a3 + 128);
    *((_OWORD *)v10 + 10) = v16;
    *((_OWORD *)v10 + 11) = v17;
    *((_OWORD *)v10 + 9) = v15;
    long long v18 = *(_OWORD *)(a3 + 16);
    long long v19 = *(_OWORD *)(a3 + 32);
    long long v20 = *(_OWORD *)(a3 + 64);
    *((_OWORD *)v10 + 7) = *(_OWORD *)(a3 + 48);
    *((_OWORD *)v10 + 8) = v20;
    *((_OWORD *)v10 + 5) = v18;
    *((_OWORD *)v10 + 6) = v19;
    *((_OWORD *)v10 + 4) = *(_OWORD *)a3;
    uint64_t v21 = ((uint64_t (*)(uint64_t, void *, void *, void *))v10[8])(a2, v10, v37, v10 + 3);
    v10[6] = v21;
    if (v21)
    {
      *(void *)&long long v24 = UarpRestoreLayer3MsgSend;
      *((void *)&v24 + 1) = UarpRestoreLayer3FirmwareStageProgress;
      uint64_t v25 = UarpRestoreLayer3FirmwareStageStatus;
      uint64_t v26 = UarpRestoreLayer3ApplyStatus;
      uint64_t v27 = UarpRestoreLayer3AssetsRescinded;
      uint64_t v28 = UarpRestoreLayer3TssRequest;
      uint64_t v29 = UarpRestoreLayer3TssResponse;
      uint64_t v30 = UarpRestoreLayer3UarpPropertyUpdate;
      uint64_t v31 = UarpRestoreLayer3ApplePropertyUpdate;
      uint64_t v32 = UarpRestoreLayer3PersonalizedFirmware;
      uint64_t v33 = UarpRestoreLayer3LogError;
      uint64_t v34 = UarpRestoreLayer3LogInfo;
      uint64_t v35 = UarpRestoreLayer3LogDebug;
      uint64_t v36 = UarpRestoreLayer3LogFault;
      CoreUARPRestoreEndpointInitialize(v10 + 5, &v24, a4, *v10, (uint64_t)v10);
      if (!v22)
      {
        dispatch_async_f((dispatch_queue_t)*v10, v10, (dispatch_function_t)UarpRestoreRemoteEndpointAddHandler);
        return v10;
      }
    }
    uarpFree(v10);
    return 0;
  }
  return v10;
}

void UarpRestoreFinalizeEndpoint(uint64_t *a1)
{
  int v2 = CoreUARPRestoreEndpointRemoteEndpointRemove(a1[5]);
  if (v2) {
    UarpRestoreLayer3LogErrorInternal((uint64_t)a1, v3, "UARP Restore: Failed to remove endpoint, status 0x%08x", v4, v5, v6, v7, v8, v2);
  }
  CoreUARPRestoreEndpointFinalize(a1[5]);
  uint64_t v9 = (void *)a1[30];
  if (v9)
  {
    uarpFree(v9);
    a1[30] = 0;
    a1[31] = 0;
  }
  uint64_t v10 = (void *)a1[32];
  if (v10)
  {
    uarpFree(v10);
    a1[32] = 0;
  }

  uarpFree(a1);
}

void UarpRestoreLayer3LogErrorInternal(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

uint64_t UarpRestoreStageFirmwareFilename(uint64_t a1, char *__s1)
{
  uint64_t result = 30;
  if (a1)
  {
    if (__s1)
    {
      *(void *)(a1 + 208) = strdup(__s1);
      dispatch_async_f(*(dispatch_queue_t *)a1, (void *)a1, (dispatch_function_t)UarpRestoreStageFirmwareFilenameQueueHandler);
      return 0;
    }
  }
  return result;
}

void UarpRestoreStageFirmwareFilenameQueueHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    *(unsigned char *)(v9 + 1936) = 1;
    int v10 = CoreUARPRestoreEndpointOfferSuperBinary(v9, *(const char **)(a1 + 208));
    if (v10)
    {
      UarpRestoreLayer3LogErrorInternal(a1, v11, "UARP Restore: Failed to offer superbinary, status 0x%08x", v12, v13, v14, v15, v16, v10);
      UarpRestoreLayer3FirmwareStageStatus((NSObject **)a1, 5, 2560, v17, v18, v19, v20, v21);
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreStageFirmwareFilenameQueueHandler");
  }
}

uint64_t UarpRestoreStageFirmwareDataBuffer(uint64_t a1, const void *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 240))
    {
      UarpRestoreLayer3LogErrorInternal(a1, (uint64_t)a2, "UARP Restore: Offered Firmware with outstanding offer", a4, a5, a6, a7, a8, v13);
      return 54;
    }
    else
    {
      uint64_t v12 = uarpZalloc(a3);
      *(void *)(a1 + 240) = v12;
      *(void *)(a1 + 248) = a3;
      memcpy(v12, a2, a3);
      dispatch_async_f(*(dispatch_queue_t *)a1, (void *)a1, (dispatch_function_t)UarpRestoreStageFirmwareDataBufferQueueHandler);
      return 0;
    }
  }
  return result;
}

void UarpRestoreStageFirmwareDataBufferQueueHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v9 = *(void *)(a1 + 240);
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(unsigned char *)(v10 + 1936) = 0;
      int v11 = CoreUARPRestoreEndpointOfferSuperBinaryBuffer(v10, v9, *(void *)(a1 + 248));
      if (v11)
      {
        UarpRestoreLayer3LogErrorInternal(a1, v12, "UARP Restore: Failed to offer superbinary, status 0x%08x", v13, v14, v15, v16, v17, v11);
        UarpRestoreLayer3FirmwareStageStatus((NSObject **)a1, 5, 2560, v18, v19, v20, v21, v22);
      }
    }
    else
    {
      UarpRestoreLayer3LogErrorInternal(a1, 0, "%s: NULL pBuffer", a4, a5, a6, a7, a8, (char)"UarpRestoreStageFirmwareDataBufferQueueHandler");
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreStageFirmwareDataBufferQueueHandler");
  }
}

uint64_t UarpRestoreApplyStagedAssets(dispatch_queue_t *context)
{
  return 0;
}

void UarpRestoreApplyStagedAssetsHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    CoreUARPRestoreEndpointRemoteEndpointApplyStagedAssets(v8);
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreApplyStagedAssetsHandler");
  }
}

uint64_t UarpRestoreInfoQueries(dispatch_queue_t *a1, const void *a2, int a3, const void *a4, int a5)
{
  if (!a1) {
    return 30;
  }
  if (a2) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = a3 <= 0;
  }
  char v9 = !v8;
  uint64_t result = 30;
  if ((a3 & 0x80000000) == 0 && (v9 & 1) == 0)
  {
    BOOL v13 = a4 || a5 <= 0;
    BOOL v14 = !v13;
    if ((a5 & 0x80000000) == 0 && !v14)
    {
      uint64_t v15 = (int *)uarpZalloc(0x28uLL);
      *(void *)uint64_t v15 = a1;
      v15[2] = a3;
      if (a3 >= 1)
      {
        uint64_t v16 = calloc(a3, 4uLL);
        *((void *)v15 + 2) = v16;
        memcpy(v16, a2, 4 * v15[2]);
      }
      v15[6] = a5;
      if (a5 >= 1)
      {
        uint64_t v17 = calloc(a5, 4uLL);
        *((void *)v15 + 4) = v17;
        memcpy(v17, a4, 4 * v15[6]);
      }
      dispatch_async_f(*a1, v15, (dispatch_function_t)UarpRestoreInfoQueriesQueueHandler);
      return 0;
    }
  }
  return result;
}

void UarpRestoreInfoQueriesQueueHandler(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v9 = *(void *)a1;
    if (*(void *)a1)
    {
      if (a1[2])
      {
        unint64_t v10 = 0;
        do
        {
          if (!uarpPlatformEndpointRequestInfoProperty(*(void *)(v9 + 40) + 648, *(void *)(v9 + 40) + 1728, *(_DWORD *)(*((void *)a1 + 2) + 4 * v10)))++*(_DWORD *)(v9 + 200); {
          ++v10;
          }
        }
        while (v10 < a1[2]);
      }
      if (a1[6])
      {
        unint64_t v11 = 0;
        do
        {
          if (!CoreUARPRestoreEndpointQueryAppleProperty(*(void *)(v9 + 40), *(_DWORD *)(*((void *)a1 + 4) + 4 * v11)))++*(_DWORD *)(v9 + 200); {
          ++v11;
          }
        }
        while (v11 < a1[6]);
      }
      free(*((void **)a1 + 4));
      free(*((void **)a1 + 2));
      free(a1);
    }
    else
    {
      UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreInfoQueriesQueueHandler");
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pBlock", a4, a5, a6, a7, a8, (char)"UarpRestoreInfoQueriesQueueHandler");
  }
}

uint64_t UarpRestoreInfoPropertyManufacturerName(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyManufacturerName(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyModelName(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyModelName(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertySerialNumber(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertySerialNumber(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyHardwareVersion(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyHadwareVersion(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyFirmwareVersion(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyActiveFirmwareVersion(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyStagedFirmwareVersion(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyStagedFirmwareVersion(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyFriendlyName(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyFriendlyName(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyAppleModelNumber(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyAppleModelNumber(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyHardwareFusing(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyHardwareFusing(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyManifestPrefix(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyManifestPrefix(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyBoardID(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyBoardID(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyBoardID64(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyBoardID64(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyChipID(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyChipID(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyChipRevision(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyChipRevision(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyECID(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyECID(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertySecurityDomain(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertySecurityDomain(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertySecurityMode(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertySecurityMode(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyProductionMode(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyProductionMode(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyChipEpoch(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyChipEpoch(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyEnableMixMatch(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyEnableMixMatch(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyLiveNonce(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyLiveNonce(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyPrefixNeedsLUN(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyPrefixNeedsLUN(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertySuffixNeedsLUN(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertySuffixNeedsLUN(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyLogicalUnitNumber(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyLogicalUnitNumber(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyTicketLongName(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyTicketLongName(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyRequiresPersonalization(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyRequiresPersonalization(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyApBoardID(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyApBoardID(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyApChipID(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyApChipID(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyApProductionMode(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyApProductionMode(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyApSecurityMode(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyApSecurityMode(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyHardwareSpecific(uint64_t result, void *a2, _DWORD *a3)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyHardwareSpecific(*(void *)(result + 40), a2, a3);
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyNonce(uint64_t result, void *a2, _DWORD *a3)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyNonce(*(void *)(result + 40), a2, a3);
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyLife(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyLife(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyProvisioning(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyProvisioning(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyManifestEpoch(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyManifestEpoch(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyManifestSuffix(uint64_t result)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyManifestSuffix(*(void *)(result + 40));
  }
  return result;
}

uint64_t UarpRestoreInfoPropertyEcidData(uint64_t result, void *a2, _DWORD *a3)
{
  if (result) {
    return CoreUARPRestoreEndpointPropertyECIDData(*(void *)(result + 40), a2, a3);
  }
  return result;
}

uint64_t UarpRestoreEndpointMsgRecv(dispatch_queue_t *a1, uint64_t a2, const void *a3, unsigned int a4)
{
  uint64_t v7 = uarpZalloc(0x18uLL);
  *uint64_t v7 = a1;
  BOOL v8 = uarpZalloc(a4);
  v7[1] = v8;
  *((_DWORD *)v7 + 4) = a4;
  memcpy(v8, a3, a4);
  dispatch_async_f(*a1, v7, (dispatch_function_t)UarpRestoreEndpointMsgRecvQueueHandler);
  return 0;
}

uint64_t UarpRestoreEndpointDataRecv(dispatch_queue_t *a1, uint64_t a2, const void *a3, unsigned int a4)
{
  uint64_t v7 = uarpZalloc(0x18uLL);
  *uint64_t v7 = a1;
  BOOL v8 = uarpZalloc(a4);
  v7[1] = v8;
  *((_DWORD *)v7 + 4) = a4;
  memcpy(v8, a3, a4);
  dispatch_async_f(*a1, v7, (dispatch_function_t)UarpRestoreEndpointDataRecvQueueHandler);
  return 0;
}

uint64_t UarpRestoreLayer3MsgSend(dispatch_queue_t *a1, uint64_t a2, int a3)
{
  uint64_t v6 = uarpZalloc(0x18uLL);
  void *v6 = a1;
  v6[1] = a2;
  *((_DWORD *)v6 + 4) = a3;
  dispatch_async_f(*a1, v6, (dispatch_function_t)UarpRestoreLayer3MsgSendQueueHandler);
  return 0;
}

uint64_t UarpRestoreLayer3FirmwareStageProgress(uint64_t result)
{
  v1 = *(uint64_t (**)(void))(result + 104);
  if (v1) {
    return v1();
  }
  return result;
}

void UarpRestoreLayer3FirmwareStageStatus(NSObject **a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1[14])
  {
    int v9 = a2;
    UarpRestoreLayer3LogInfoInternal((uint64_t)a1, a2, "UARP Restore Layer 3: Stage Status; status <0x%04x>, reason <0x%04x>",
      a4,
      a5,
      a6,
      a7,
      a8,
      a2);
    unint64_t v11 = uarpZalloc(0x10uLL);
    *(void *)unint64_t v11 = a1;
    v11[2] = v9;
    v11[3] = a3;
    uint64_t v12 = *a1;
    dispatch_async_f(v12, v11, (dispatch_function_t)UarpRestoreLayer3FirmwareStageStatusQueueHandler);
  }
}

void UarpRestoreLayer3ApplyStatus(NSObject **a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1[15])
  {
    int v9 = a2;
    UarpRestoreLayer3LogInfoInternal((uint64_t)a1, a2, "UARP Restore Layer 3: Apply Staged Assets; status <0x%04x>, flags <0x%04x>",
      a4,
      a5,
      a6,
      a7,
      a8,
      a2);
    unint64_t v11 = uarpZalloc(0x10uLL);
    *(void *)unint64_t v11 = a1;
    v11[2] = v9;
    v11[3] = a3;
    uint64_t v12 = *a1;
    dispatch_async_f(v12, v11, (dispatch_function_t)UarpRestoreLayer3FirmwareApplyStatusQueueHandler);
  }
}

void UarpRestoreLayer3AssetsRescinded(NSObject **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void UarpRestoreLayer3TssRequest(NSObject **a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  int v9 = uarpZalloc(0x20uLL);
  *int v9 = a1;
  v9[1] = a2;
  v9[2] = a4;
  *((unsigned char *)v9 + 24) = a5;
  unint64_t v10 = *a1;

  dispatch_async_f(v10, v9, (dispatch_function_t)UarpRestoreLayer3TssRequestQueueHandler);
}

void UarpRestoreLayer3TssResponse(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t v4 = *(const char **)(a1 + 216);
  if (v4)
  {
    uint64_t v7 = fopen(v4, "w+");
    if (v7)
    {
      BOOL v14 = v7;
      if (fwrite(a2, 1uLL, a3, v7) != a3) {
        UarpRestoreLayer3LogErrorInternal(a1, v15, "UARP Restore: Mismatch in writing to manifest file %s.Expected to write %d bytes, actually wrote %d bytes", v16, v17, v18, v19, v20, *(void *)(a1 + 216));
      }
      fclose(v14);
    }
    else
    {
      UarpRestoreLayer3LogErrorInternal(a1, v8, "UARP Restore: Could not open manifest file %s", v9, v10, v11, v12, v13, *(void *)(a1 + 216));
    }
  }
}

void UarpRestoreLayer3UarpPropertyUpdate(NSObject **a1, int a2)
{
  uint64_t v4 = uarpZalloc(0x10uLL);
  *(void *)uint64_t v4 = a1;
  v4[2] = a2;
  uint64_t v5 = *a1;

  dispatch_async_f(v5, v4, (dispatch_function_t)UarpRestoreLayer3UarpPropertyUpdateQueueHandler);
}

void UarpRestoreLayer3ApplePropertyUpdate(NSObject **a1, int a2)
{
  uint64_t v4 = uarpZalloc(0x10uLL);
  *(void *)uint64_t v4 = a1;
  v4[2] = a2;
  uint64_t v5 = *a1;

  dispatch_async_f(v5, v4, (dispatch_function_t)UarpRestoreLayer3ApplePropertyUpdateQueueHandler);
}

void UarpRestoreLayer3PersonalizedFirmware(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    if (a2)
    {
      uint64_t v8 = *(const char **)(a1 + 232);
      if (v8)
      {
        uint64_t v9 = fopen(v8, "w+");
        if (!v9)
        {
          UarpRestoreLayer3LogErrorInternal(a1, v10, "UARP Restore: Could not open personalized firmware file %s", v11, v12, v13, v14, v15, *(void *)(a1 + 232));
          return;
        }
        uint64_t v16 = v9;
        if (fwrite(a2, 1uLL, a3, v9) != a3) {
          UarpRestoreLayer3LogErrorInternal(a1, v17, "UARP Restore: Mismatch in writing to personalized firmware file %s.Expected to write %d bytes, actually wrote %d bytes", v18, v19, v20, v21, v22, *(void *)(a1 + 232));
        }
        fflush(v16);
        fclose(v16);
      }
    }
  }
  uint64_t v23 = *(void (**)(uint64_t, const void *, uint64_t, uint64_t))(a1 + 160);
  if (v23)
  {
    v23(a1, a2, a3, a4);
  }
}

void UarpRestoreLayer3LogError(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a1 && (uint64_t v4 = *(void (**)(void))(a1 + 168)) != 0)
  {
    v4();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 256);
    if (v5)
    {
      uint64_t v6 = a2 <= 9 ? *(NSObject **)(v5 + 8 * a2) : MEMORY[0x263EF8438];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        UarpRestoreLayer3LogError_cold_1(a3, v6);
      }
    }
  }
}

void UarpRestoreLayer3LogInfo(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a1 && (uint64_t v4 = *(void (**)(void))(a1 + 176)) != 0)
  {
    v4();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 256);
    if (v5)
    {
      uint64_t v6 = a2 <= 9 ? *(NSObject **)(v5 + 8 * a2) : MEMORY[0x263EF8438];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = 136315138;
        uint64_t v8 = a3;
        _os_log_impl(&dword_263DF3000, v6, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

void UarpRestoreLayer3LogDebug(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a1 && (uint64_t v4 = *(void (**)(void))(a1 + 184)) != 0)
  {
    v4();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 256);
    if (v5)
    {
      uint64_t v6 = a2 <= 9 ? *(NSObject **)(v5 + 8 * a2) : MEMORY[0x263EF8438];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        UarpRestoreLayer3LogDebug_cold_1(a3, v6);
      }
    }
  }
}

void UarpRestoreLayer3LogFault(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a1 && (uint64_t v4 = *(void (**)(void))(a1 + 192)) != 0)
  {
    v4();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 256);
    if (v5)
    {
      uint64_t v6 = a2 <= 9 ? *(NSObject **)(v5 + 8 * a2) : MEMORY[0x263EF8438];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        UarpRestoreLayer3LogFault_cold_1(a3, v6);
      }
    }
  }
}

void UarpRestoreRemoteEndpointAddHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (CoreUARPRestoreEndpointRemoteEndpointAdd(*(void *)(a1 + 40))) {
      UarpRestoreLayer3LogErrorInternal(0, v8, "%s: ERROR adding remote endpoint, status = 0x%08x", v9, v10, v11, v12, v13, (char)"UarpRestoreRemoteEndpointAddHandler");
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreRemoteEndpointAddHandler");
  }
}

void UarpRestoreEndpointMsgRecvQueueHandler(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v9 = *(void *)a1;
    if (v9)
    {
      uint64_t v10 = (unsigned __int16 *)*((void *)a1 + 1);
      if (v10)
      {
        CoreUARPRestoreEndpointMsgRecv(*(void *)(v9 + 40), v10, *((_DWORD *)a1 + 4));
        uarpFree(*((void **)a1 + 1));
        uarpFree(a1);
      }
      else
      {
        UarpRestoreLayer3LogErrorInternal(v9, 0, "%s: NULL pBuffer", a4, a5, a6, a7, a8, (char)"UarpRestoreEndpointMsgRecvQueueHandler");
      }
    }
    else
    {
      UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreEndpointMsgRecvQueueHandler");
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pBlock", a4, a5, a6, a7, a8, (char)"UarpRestoreEndpointMsgRecvQueueHandler");
  }
}

void UarpRestoreEndpointDataRecvQueueHandler(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v9 = *(void *)a1;
    if (v9)
    {
      uint64_t v10 = (char *)*((void *)a1 + 1);
      if (v10)
      {
        CoreUARPRestoreEndpointDataRecv(*(void *)(v9 + 40), v10, *((_DWORD *)a1 + 4));
        uarpFree(*((void **)a1 + 1));
        uarpFree(a1);
      }
      else
      {
        UarpRestoreLayer3LogErrorInternal(v9, 0, "%s: NULL pBuffer", a4, a5, a6, a7, a8, (char)"UarpRestoreEndpointDataRecvQueueHandler");
      }
    }
    else
    {
      UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreEndpointDataRecvQueueHandler");
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pBlock", a4, a5, a6, a7, a8, (char)"UarpRestoreEndpointDataRecvQueueHandler");
  }
}

void UarpRestoreLayer3MsgSendQueueHandler(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v9 = (void *)*a1;
    if (*a1)
    {
      if (a1[1])
      {
        uint64_t v10 = (uint64_t (*)(void *, void, void *, void))v9[3];
        uint64_t v11 = uarpZalloc(*((unsigned int *)a1 + 4));
        memcpy(v11, (const void *)a1[1], *((unsigned int *)a1 + 4));
        unsigned int v12 = v10(v9, v9[6], v11, *((unsigned int *)a1 + 4));
        if (v12)
        {
          char v13 = v12;
          uarpStatusCodeToString(v12);
          UarpRestoreLayer3LogErrorInternal((uint64_t)v9, v14, "UARP Restore: Failed to tx uarp message to uarp silicon updater;status <0x%08x>, %s",
            v15,
            v16,
            v17,
            v18,
            v19,
            v13);
        }
        uarpPlatformEndpointSendMessageComplete(v9[5] + 648, v9[5] + 1728, a1[1]);
        uarpFree(a1);
        uarpFree(v11);
      }
      else
      {
        UarpRestoreLayer3LogErrorInternal((uint64_t)v9, a2, "%s: NULL pBuffer", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3MsgSendQueueHandler");
      }
    }
    else
    {
      UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3MsgSendQueueHandler");
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pBlock", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3MsgSendQueueHandler");
  }
}

void UarpRestoreLayer3LogInfoInternal(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void UarpRestoreLayer3FirmwareStageStatusQueueHandler(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v9 = *(void *)a1;
    if (v9)
    {
      (*(void (**)(uint64_t, void, void))(v9 + 112))(v9, a1[2], a1[3]);
      uarpFree(a1);
    }
    else
    {
      UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3FirmwareStageStatusQueueHandler");
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pBlock", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3FirmwareStageStatusQueueHandler");
  }
}

void UarpRestoreLayer3FirmwareApplyStatusQueueHandler(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v9 = *(void *)a1;
    if (v9)
    {
      (*(void (**)(uint64_t, void, void))(v9 + 120))(v9, a1[2], a1[3]);
      uarpFree(a1);
    }
    else
    {
      UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3FirmwareApplyStatusQueueHandler");
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pBlock", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3FirmwareApplyStatusQueueHandler");
  }
}

void UarpRestoreLayer3TssRequestQueueHandler(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pBlock", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3TssRequestQueueHandler");
    return;
  }
  uint64_t v9 = *a1;
  if (!*a1)
  {
    uint64_t v15 = "%s: NULL pUarpCtx";
LABEL_14:
    UarpRestoreLayer3LogErrorInternal(0, a2, v15, a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3TssRequestQueueHandler");
    return;
  }
  uint64_t v10 = a1[1];
  if (!v10)
  {
    uint64_t v15 = "%s: NULL pIM4M";
    goto LABEL_14;
  }
  uint64_t v11 = *(void *)(v10 + 296);
  if (!v11)
  {
    uint64_t v15 = "%s: NULL pIM4M->payloads";
    goto LABEL_14;
  }
  uint64_t v12 = *(void *)(v11 + 48);
  if (!v12)
  {
    uint64_t v15 = "%s: NULL tssOptions";
    goto LABEL_14;
  }
  uint64_t v13 = *((unsigned __int8 *)a1 + 24);
  uint64_t v14 = a1[2];
  UarpRestoreLayer3LogInfoInternal(v9, a2, "UARP Restore: Tatsu Server set to %s", a4, a5, a6, a7, a8, v14);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 128))(v9, v10, v12, v14, v13);

  uarpFree(a1);
}

void UarpRestoreLayer3UarpPropertyUpdateQueueHandler(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v9 = *(void *)a1;
    if (*(void *)a1)
    {
      int v10 = *(_DWORD *)(v9 + 200) - 1;
      *(_DWORD *)(v9 + 200) = v10;
      uint64_t v11 = *(void (**)(uint64_t, void))(v9 + 136);
      if (v11)
      {
        v11(v9, a1[2]);
        int v10 = *(_DWORD *)(v9 + 200);
      }
      if (!v10)
      {
        uint64_t v12 = *(void (**)(uint64_t))(v9 + 152);
        if (v12) {
          v12(v9);
        }
      }
      uarpFree(a1);
    }
    else
    {
      UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3UarpPropertyUpdateQueueHandler");
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pBlock", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3UarpPropertyUpdateQueueHandler");
  }
}

void UarpRestoreLayer3ApplePropertyUpdateQueueHandler(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v9 = *(void *)a1;
    if (*(void *)a1)
    {
      int v10 = *(_DWORD *)(v9 + 200) - 1;
      *(_DWORD *)(v9 + 200) = v10;
      uint64_t v11 = *(void (**)(uint64_t, void))(v9 + 144);
      if (v11)
      {
        v11(v9, a1[2]);
        int v10 = *(_DWORD *)(v9 + 200);
      }
      if (!v10)
      {
        uint64_t v12 = *(void (**)(uint64_t))(v9 + 152);
        if (v12) {
          v12(v9);
        }
      }
      uarpFree(a1);
    }
    else
    {
      UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3ApplePropertyUpdateQueueHandler");
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pBlock", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3ApplePropertyUpdateQueueHandler");
  }
}

double CoreUARPRestoreSetAssetCallbacks(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(void *)a1 = fAssetReady;
  *(void *)(a1 + 8) = fAssetMetaDataTLV;
  *(void *)(a1 + 16) = fAssetMetaDataComplete;
  *(void *)(a1 + 24) = fAssetMetaDataProcessingError;
  *(void *)(a1 + 32) = fPayloadReady;
  *(void *)(a1 + 40) = fPayloadMetaDataTLV;
  *(void *)(a1 + 48) = fPayloadMetaDataComplete;
  *(void *)(a1 + 56) = fPayloadMetaDataProcessingError;
  *(void *)(a1 + 64) = fPayloadData;
  *(void *)(a1 + 72) = fPayloadDataComplete;
  *(void *)(a1 + 80) = fPayloadDataComplete2;
  *(void *)(a1 + 88) = fAssetGetBytesAtOffset2;
  *(void *)(a1 + 96) = fAssetSetBytesAtOffset2;
  *(void *)(a1 + 104) = fAssetRescinded;
  *(void *)(a1 + 112) = fAssetRescindedAck;
  *(void *)(a1 + 120) = fAssetCorrupt;
  *(void *)(a1 + 128) = fAssetOrphaned;
  *(void *)(a1 + 136) = fAssetReleased2;
  *(void *)(a1 + 144) = fAssetProcessingNotification2;
  *(void *)(a1 + 152) = fAssetProcessingNotificationAck;
  *(void *)(a1 + 160) = fAssetPreProcessingNotification;
  *(void *)(a1 + 168) = fAssetPreProcessingNotificationAck;
  *(void *)(a1 + 176) = fAssetAllHeadersAndMetaDataComplete;
  return result;
}

uint64_t fAssetGetBytesAtOffset2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, _WORD *a7, uint64_t a8)
{
  unsigned int v10 = a5;
  size_t v14 = a5;
  CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP Restore: Get %u Bytes from offset %u", (uint64_t)a4, a5, a6, (uint64_t)a7, a8, a5);
  uint64_t v15 = *(FILE **)(a3 + 16);
  if (v15)
  {
    fseek(v15, a6, 0);
    size_t v20 = fread(a4, 1uLL, v14, *(FILE **)(a3 + 16));
    if (v20 < v10)
    {
      uint64_t v21 = *(FILE **)(a3 + 16);
      int v22 = ferror(v21);
      if (v22)
      {
        CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP Restore: Read error %d, Read %zu bytes", v23, v24, v25, v26, v27, v22);
        return 54;
      }
      int v32 = feof(v21);
      CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "UARP Restore: EOF %d, Read %zu bytes", v33, v34, v35, v36, v37, v32);
      if (!v32) {
        return 54;
      }
    }
  }
  else
  {
    unsigned int v28 = *(_DWORD *)(a3 + 308);
    if (v10 + a6 <= v28) {
      unsigned __int16 v29 = v10;
    }
    else {
      unsigned __int16 v29 = v28 - a6;
    }
    LOWORD(v20) = v29;
    memcpy(a4, (const void *)(*(void *)(a3 + 280) + a6), v29);
  }
  *a7 = v20;
  uint64_t v30 = *(unsigned int *)(a3 + 308);
  if (v30) {
    CoreUARPRestoreAssetTransferProgress(a1, a3, a6, v30, v16, v17, v18, v19);
  }
  return 0;
}

uint64_t fAssetSetBytesAtOffset2()
{
  return 26;
}

uint64_t fAssetProcessingNotification2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return 0;
}

uint64_t fAssetProcessingNotificationAck()
{
  return 0;
}

uint64_t fAssetPreProcessingNotification()
{
  return 0;
}

uint64_t fAssetPreProcessingNotificationAck()
{
  return 0;
}

double CoreUARPRestoreSetAssetPersonalizedFirmwareCallbacks(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)a1 = fPersonalizedFirmwareAssetReady;
  *(void *)(a1 + 64) = fPersonalizedFirmwarePayloadData;
  *(void *)(a1 + 80) = fPersonalizedFirmwarePayloadDataComplete;
  *(void *)(a1 + 120) = fPersonalizedFirmwareAssetCorrupt;
  *(void *)(a1 + 128) = fPersonalizedFirmwareAssetOrphaned;
  *(void *)(a1 + 136) = fPersonalizedFirmwareAssetReleased2;
  *(void *)(a1 + 144) = fPersonalizedFirmwareAssetProcessingNotification2;
  *(void *)(a1 + 152) = fPersonalizedFirmwareAssetProcessingNotificationAck;
  *(void *)(a1 + 160) = fPersonalizedFirmwareAssetPreProcessingNotification;
  *(void *)(a1 + 168) = fPersonalizedFirmwareAssetPreProcessingNotificationAck;
  *(void *)(a1 + 176) = fPersonalizedFirmwareAssetAllHeadersAndMetaDataComplete;
  return result;
}

uint64_t fPersonalizedFirmwareAssetReady(uint64_t result, uint64_t *a2)
{
  if (result)
  {
    if (a2) {
      return uarpPlatformEndpointPayloadRequestAllHeadersAndMetaData(result + 648, *a2);
    }
  }
  return result;
}

void *fPersonalizedFirmwarePayloadData(void *result, uint64_t a2, void *__src, size_t __n, unsigned int a5)
{
  if (result)
  {
    if (a2) {
      return memcpy((void *)(*(void *)(*(void *)(a2 + 296) + 88 * *(unsigned __int16 *)(a2 + 304) + 80) + a5), __src, __n);
    }
  }
  return result;
}

uint64_t fPersonalizedFirmwarePayloadDataComplete(uint64_t result, uint64_t *a2)
{
  if (result)
  {
    if (a2) {
      return uarpPlatformEndpointAssetFullyStaged(result + 648, *a2);
    }
  }
  return result;
}

uint64_t fPersonalizedFirmwareAssetProcessingNotification2()
{
  return 0;
}

uint64_t fPersonalizedFirmwareAssetProcessingNotificationAck(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 30;
  if (a1 && a3)
  {
    CoreUARPRestoreAssetPersonalizedFirmware(a1, *(void *)(*(void *)(a3 + 296) + 80), *(unsigned int *)(*(void *)(a3 + 296) + 28), a4, a5, a6, a7, a8);
    return 0;
  }
  return v8;
}

uint64_t fPersonalizedFirmwareAssetPreProcessingNotification()
{
  return 0;
}

uint64_t fPersonalizedFirmwareAssetPreProcessingNotificationAck()
{
  return 0;
}

void fPersonalizedFirmwareAssetAllHeadersAndMetaDataComplete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a3)
    {
      uint64_t v5 = (void *)(a1 + 648);
      if (!uarpPlatformEndpointAssetQueryNumberOfPayloads(a1 + 648, *(void *)a3, (_WORD *)(a3 + 288)))
      {
        *(void *)(a3 + 296) = uarpZalloc(88 * *(unsigned __int16 *)(a3 + 288));
        if (*(_WORD *)(a3 + 288))
        {
          uint64_t v6 = 0;
          unint64_t v7 = 0;
          while (1)
          {
            uint64_t v8 = *(void *)(a3 + 296) + v6;
            *(_WORD *)uint64_t v8 = v7;
            if (uarpAssetQueryPayloadInfo((uint64_t)v5, *(void *)a3, v7, v8 + 4)) {
              break;
            }
            *(void *)(v8 + 80) = uarpZalloc(*(unsigned int *)(v8 + 28));
            ++v7;
            v6 += 88;
            if (v7 >= *(unsigned __int16 *)(a3 + 288)) {
              goto LABEL_8;
            }
          }
        }
        else
        {
LABEL_8:
          int v9 = uarpPlatformEndpointAssetSetPayloadIndex(v5, *(void *)a3, 0);
          if (v9) {
            CoreUARPRestoreLogError(*(void *)(a1 + 1928), 1, "Failed to set FIRM payload index; %u",
          }
              v10,
              v11,
              v12,
              v13,
              v14,
              v9);
        }
      }
    }
  }
}

uint64_t SoCUpdaterShouldSkipSameVersion(void *a1)
{
  v1 = [a1 objectForKeyedSubscript:@"Options"];
  int v2 = [v1 objectForKeyedSubscript:@"RestoreInternal"];
  int v3 = [v2 BOOLValue];
  uint64_t v4 = [v1 objectForKeyedSubscript:@"SkipSameVersion"];
  unsigned int v5 = [v4 BOOLValue];
  if ((v5 & 1) != 0 || !v3)
  {
    if (v4) {
      int v7 = v3;
    }
    else {
      int v7 = 1;
    }
    uint64_t v6 = v7 | v5;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t SoCUpdaterRunningInTetheredMode(void *a1)
{
  v1 = [a1 objectForKeyedSubscript:@"Options"];
  int v2 = [v1 objectForKeyedSubscript:@"PreflightRequired"];
  uint64_t v3 = [v2 BOOLValue] ^ 1;

  return v3;
}

uint64_t SoCUpdaterDeferredCommitEnabled(void *a1)
{
  v1 = [a1 objectForKeyedSubscript:@"Options"];
  int v2 = [v1 objectForKeyedSubscript:@"DeferredCommit"];
  uint64_t v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 BOOLValue];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t SoCUpdaterGetMode(void *a1)
{
  id v1 = a1;
  int v2 = [v1 objectForKeyedSubscript:@"Options"];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"PreflightContext"];
  int v4 = SoCUpdaterDeferredCommitEnabled(v1);

  if ([v3 isEqual:@"Limited"])
  {
    unsigned int v5 = [v2 objectForKeyedSubscript:@"PreflightTickets"];
    if (v5) {
      int v4 = 1;
    }

    if (v4 == 1)
    {
      if (os_variant_is_recovery()) {
        uint64_t v6 = 6;
      }
      else {
        uint64_t v6 = 4;
      }
    }
    else
    {
      uint64_t v6 = 1;
    }
  }
  else if ([v3 isEqual:@"BootedOS"])
  {
    int v7 = [v2 objectForKeyedSubscript:@"PreflightTickets"];

    if (v7)
    {
      uint64_t v6 = 3;
    }
    else
    {
      uint64_t v8 = [v2 objectForKeyedSubscript:@"PreflightRequired"];
      if ([v8 BOOLValue]) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = 3;
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

const char *StringForSoCRestoreUpdateMode(unsigned int a1)
{
  if (a1 > 8) {
    return "Unrecognized";
  }
  else {
    return off_2655E8868[a1];
  }
}

void UARPSoCUpdaterLayer4UARPPropertyUpdate(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 56) log];
  [v3 verboseLog:@"%s (%d)", @"void UARPSoCUpdaterLayer4UARPPropertyUpdate(void *, uint32_t)", a2];
}

void UARPSoCUpdaterLayer4ApplePropertyUpdate(uint64_t a1, uint64_t a2)
{
  id v5 = *(id *)(a1 + 56);
  int v4 = [v5 log];
  [v4 verboseLog:@"%s (%d)", @"void UARPSoCUpdaterLayer4ApplePropertyUpdate(void *, uint32_t)", a2];

  [v5 updateAppleProperty:a2 siliconCtx:a1];
}

void UARPSoCUpdaterLayer4PropertiesComplete(uint64_t a1)
{
  id v2 = *(id *)(a1 + 56);
  id v1 = [v2 log];
  [v1 verboseLog:@"%s", @"void UARPSoCUpdaterLayer4PropertiesComplete(void *)"];

  [v2 initUARPComplete];
}

uint64_t UARPSoCUpdaterStagingProgress(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 56) updateStagingProgressWithBytesSent:a2 bytesTotal:a3];
}

void UARPSoCUpdaterStagingComplete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = *(id *)(a1 + 56);
  [v6 setStagingStatus:a2];
  [v6 setStagingStatusReason:a3];
  id v5 = [v6 log];
  [v5 verboseLog:@"%s", @"void UARPSoCUpdaterStagingComplete(void *, uint32_t, uint32_t)"]

  [v6 stagingCompleteWithStatus:a2 reason:a3];
}

void UARPSoCUpdaterApplyComplete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(id *)(a1 + 56);
  [v5 setApplyFlags:a3];
  int v4 = [v5 log];
  [v4 log:@"%s Update Finished For Unit (LUN:%d,RouterID:%hhu)", "void UARPSoCUpdaterApplyComplete(void *, uint32_t, uint32_t)", objc_msgSend(v5, "logicUnitNumber"), objc_msgSend(v5, "routerID")];

  [v5 applyAssetComplete];
}

void UARPSoCUpdaterFirmwareTssRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  id v13 = *(id *)(a1 + 56);
  uint64_t v10 = [v13 log];
  [v10 verboseLog:@"%s", @"void UARPSoCUpdaterFirmwareTssRequest(void *, void *, void *, char *, UARPBool)"]

  uint64_t v11 = [NSString stringWithUTF8String:a4];
  [v13 tssRequestWithOptions:a3 serverURL:v11 assetCtx:a2 siliconCtx:a1];

  if (a5)
  {
    uint64_t v12 = [v13 log];
    [v12 log:@"%s: More tss request for next round.", @"void UARPSoCUpdaterFirmwareTssRequest(void *, void *, void *, char *, UARPBool)"]
  }
}

void UARPSoCUpdaterFirmwareLogCommon(uint64_t a1, unsigned int a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 56) log];
  [v5 log:@"[%s:%s] %s", @"[com.apple.uarp.layer3.soc:%s] %s", uarpLoggingCategoryToString(a2), a3];
}

uint64_t Ace3UpdaterCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [Ace3UpdateController alloc];

  return (uint64_t)[(UARPSoCUpdaterController *)v6 initWithOptions:a1 logFunction:a2 logContext:a3];
}

uint64_t Ace3UpdaterIsDone(void *a1)
{
  if (a1) {
    return [a1 isDone];
  }
  else {
    return USBCUpdateEndpointQueryNumberOfAccessories() == 0;
  }
}

uint64_t uarpPlatformEndpointStreamingRecvInit(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    int v7 = 0;
    UARPLayer2RequestBuffer(a1, &v7, 0x18u);
    if (v7)
    {
      unsigned int v5 = *(_DWORD *)(a2 + 4) + 36;
      UARPLayer2RequestBuffer(a1, v7, v5);
      id v6 = v7;
      if (*(void *)v7)
      {
        uint64_t result = 0;
        *((_DWORD *)v7 + 2) = v5;
        *(void *)(a2 + 88) = v6;
        return result;
      }
      UARPLayer2ReturnBuffer(a1, v7);
    }
    return 11;
  }
  return result;
}

void uarpPlatformEndpointStreamingRecvDeinit(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
    {
      id v3 = *(void ***)(a2 + 88);
      if (v3)
      {
        if (*v3)
        {
          UARPLayer2ReturnBuffer(a1, *v3);
          id v3 = *(void ***)(a2 + 88);
          void *v3 = 0;
        }
        UARPLayer2ReturnBuffer(a1, v3);
        *(void *)(a2 + 88) = 0;
      }
    }
  }
}

uint64_t uarpPlatformEndpointStreamingRecvBytes(uint64_t a1, uint64_t a2, char *a3, int a4)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      int v7 = a3;
      if (a3)
      {
        LODWORD(v8) = a4;
        if (a4)
        {
          int v9 = *(_DWORD **)(a2 + 88);
          if (v9) {
            goto LABEL_6;
          }
          uint64_t result = uarpPlatformEndpointStreamingRecvInit(a1, a2);
          if (result) {
            return result;
          }
          int v9 = *(_DWORD **)(a2 + 88);
          if (v9)
          {
LABEL_6:
            if (v9[2] >= v8)
            {
              uint64_t v8 = v8;
              unsigned int v10 = v9[4];
              do
              {
                char v11 = *v7++;
                *(unsigned char *)(*(void *)v9 + v10) = v11;
                unsigned int v10 = v9[4] + 1;
                v9[4] = v10;
                if (v10 == 6)
                {
                  unsigned int v12 = uarpNtohs(*(unsigned __int16 *)(*(void *)v9 + 2)) + 6;
                  v9[3] = v12;
                  unsigned int v10 = v9[4];
                }
                else
                {
                  unsigned int v12 = v9[3];
                }
                if (v10 == v12)
                {
                  uint64_t result = uarpPlatformEndpointRecvMessage(a1, a2, *(unsigned __int16 **)v9, v12);
                  if (result) {
                    return result;
                  }
                  bzero(*(void **)v9, v9[2]);
                  unsigned int v10 = 0;
                  v9[3] = 0;
                  v9[4] = 0;
                }
                --v8;
              }
              while (v8);
              return 0;
            }
            else
            {
              return 30;
            }
          }
          else
          {
            return 27;
          }
        }
      }
    }
  }
  return result;
}

char *uarpAssetTagPersonalization4cc()
{
  uint64_t result = uarpAssetTagPersonalization4cc_assetTag;
  uarpAssetTagPersonalization4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagPersonalization()
{
  uarpAssetTagPersonalization4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagPersonalization4cc_assetTag);
}

int *uarpAssetTagStructPersonalization()
{
  uarpAssetTagPersonalization4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructPersonalization_myTag;
  uarpAssetTagStructPersonalization_myTag = *(_DWORD *)uarpAssetTagPersonalization4cc_assetTag;
  return result;
}

char *uarpAssetTagPersonalizedFirmware4cc()
{
  uint64_t result = uarpAssetTagPersonalizedFirmware4cc_assetTag;
  uarpAssetTagPersonalizedFirmware4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagPersonalizedFirmware()
{
  uarpAssetTagPersonalizedFirmware4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagPersonalizedFirmware4cc_assetTag);
}

int *uarpAssetTagStructPersonalizedFirmware()
{
  uarpAssetTagPersonalizedFirmware4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructPersonalizedFirmware_myTag;
  uarpAssetTagStructPersonalizedFirmware_myTag = *(_DWORD *)uarpAssetTagPersonalizedFirmware4cc_assetTag;
  return result;
}

__int16 *uarpOuiPersonalization()
{
  uint64_t result = &uarpOuiPersonalization_myOui;
  uarpOuiPersonalization_myOuuint64_t i = -19832;
  byte_26AA396D2 = -111;
  return result;
}

uint64_t uarpPersonalizationRequestAssetInitialize(uint64_t a1, uint64_t a2, int a3)
{
  long long v4 = 0uLL;
  return UARPSuperBinarySetupHeader(a1, a2, 2u, &v4, a3);
}

uint64_t uarpPersonalizationRequestPreparePayload(uint64_t a1, uint64_t a2, int a3)
{
  long long v4 = 0uLL;
  uarpAssetTagPersonalization4cc_assetTag[4] = 0;
  uarpAssetTagStructPersonalization_myTag = *(_DWORD *)uarpAssetTagPersonalization4cc_assetTag;
  return UARPSuperBinaryPreparePayload(a1, a2, a3, (unsigned int *)&uarpAssetTagStructPersonalization_myTag, &v4);
}

uint64_t uarpPersonalizationRequestAddPayloadTag(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29101, 4u, a4);
}

uint64_t uarpPersonalizationRequestAddRemoteAssetID(uint64_t a1, uint64_t a2, unsigned int a3)
{
  __int16 v6 = uarpHtons(a3);
  return UARPSuperBinaryAddMetaData(a1, a2, 0x88B29102, 2u, (uint64_t)&v6);
}

uint64_t uarpPersonalizationRequestAddManifestPrefix(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29103, a5, a4);
}

uint64_t uarpPersonalizationRequestAddBoardID(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29104, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddBoardID64(uint64_t a1, uint64_t a2, int a3, unint64_t a4)
{
  unint64_t v8 = uarpHtonll(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2911B, 8u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddChipID(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29105, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddECID(uint64_t a1, uint64_t a2, int a3, unint64_t a4)
{
  unint64_t v8 = uarpHtonll(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29106, 8u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddNonce(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29107, a5, a4);
}

uint64_t uarpPersonalizationRequestAddNonceHash(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29108, a5, a4);
}

uint64_t uarpPersonalizationRequestAddDigest(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29113, a5, a4);
}

uint64_t uarpPersonalizationRequestAddSecurityDomain(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29109, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddSecurityMode(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910A, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddProductionMode(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910B, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddChipEpoch(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910C, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddChipRevision(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910F, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddEnableMixMatch(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910D, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddSoCLiveNonce(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29118, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddTicketPrefixLUN(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29126, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddPrefixNeedsLUN(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29121, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddPrefixLUN(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29121, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddSuffixLUN(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29122, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestMoreRequestsToFollow(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29127, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddRemoteAssetPayloadIndex(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910E, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddLogicalUnitNumber(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29125, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddMeasurementWithOverrides(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned int a7)
{
  unsigned int v10 = uarpHtons(a6);
  unsigned int v11 = uarpHtons(a7);
  if (a5)
  {
    unsigned int v12 = v11;
    id v13 = (unsigned int *)a4;
    unsigned int v14 = a5;
    while (1)
    {
      unsigned int v15 = v14 - 8;
      if (v14 < 8) {
        return 30;
      }
      int v16 = uarpHtonl(*v13);
      unsigned int v17 = uarpHtonl(v13[1]);
      if (v15 < v17) {
        return 30;
      }
      unsigned int v18 = v17;
      uint64_t v19 = v13 + 2;
      unsigned int v20 = v10;
      if (v16 == -2001563371) {
        goto LABEL_8;
      }
      if (v16 == -2001563370) {
        break;
      }
LABEL_9:
      id v13 = (unsigned int *)((char *)v19 + v18);
      unsigned int v14 = v15 - v18;
      if (v15 == v18) {
        goto LABEL_10;
      }
    }
    unsigned int v20 = v12;
LABEL_8:
    *uint64_t v19 = uarpHtons(v20);
    goto LABEL_9;
  }
LABEL_10:

  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29110, a5, a4);
}

uint64_t uarpPersonalizationRequestAddMeasurement(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29110, a5, a4);
}

uint64_t uarpPlatformAssetProcessingCompleteInternal(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, int a6)
{
  uint64_t result = 30;
  if (a1 && a3)
  {
    if (uarpPlatformAssetIsKnown(a1, a2, a3))
    {
      *(unsigned char *)(a3 + 392) = 0;
      *(unsigned char *)(a3 + 72) = 1;
      *(void *)(a3 + 696) = 0;
      if (!a2 || (uint64_t result = uarpAssetProcessingComplete(a1, a2, a3, a5 | a4), !result))
      {
        uint64_t result = 0;
        if (a4 == 4 && !a6)
        {
          UARPLayer2AssetCorrupt(a1, a3);
          return 0;
        }
      }
    }
    else
    {
      return 23;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetRequestData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 30;
  }
  uint64_t v3 = *(void *)(a2 + 696);
  if (!v3) {
    return 30;
  }
  if (*(unsigned char *)(a3 + 80) == 1) {
    return 16;
  }
  if (*(unsigned char *)(a2 + 73) == 1 || !*(unsigned char *)(v3 + 56)) {
    return 31;
  }
  int v6 = *(_DWORD *)(a3 + 8);
  int v7 = *(_DWORD *)(a3 + 84);
  unsigned int v8 = v7 + v6 + *(_DWORD *)a3;
  unsigned int v9 = *(_DWORD *)(a3 + 4) - (v7 + v6);
  if (v9 >= *(_DWORD *)(a3 + 24) - v7) {
    unsigned int v9 = *(_DWORD *)(a3 + 24) - v7;
  }
  *(_DWORD *)(a3 + 92) = v8;
  *(_DWORD *)(a3 + 96) = v9;
  if (v9 >= *(_DWORD *)(*(void *)(a2 + 696) + 4)) {
    unsigned int v10 = *(_DWORD *)(*(void *)(a2 + 696) + 4);
  }
  else {
    unsigned int v10 = v9;
  }
  *(_DWORD *)(a3 + 96) = v10;
  uint64_t result = uarpSendAssetRequestData(a1, *(void *)(a2 + 696), *(unsigned __int16 *)(a2 + 44), v8, v10);
  if (!result) {
    *(unsigned char *)(a3 + 80) = 1;
  }
  return result;
}

uint64_t uarpPlatformAssetResponseData(uint64_t a1, uint64_t a2, uint64_t a3, void *__src, int a5, int a6, size_t __n)
{
  if (!*(unsigned char *)(a2 + 392)) {
    return 29;
  }
  uint64_t v7 = a3;
  if (a3)
  {
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
    return v7;
  }
  if (*(_DWORD *)(a2 + 404) != a5) {
    return 29;
  }
  if (*(_DWORD *)(a2 + 408) != a6) {
    return 29;
  }
  uint64_t v10 = *(unsigned int *)(a2 + 396);
  if ((v10 + __n) > *(_DWORD *)(a2 + 336)) {
    return 29;
  }
  *(unsigned char *)(a2 + 392) = 0;
  *(_DWORD *)(a2 + 412) = __n;
  memcpy((void *)(*(void *)(a2 + 328) + v10), __src, __n);
  int v12 = *(_DWORD *)(a2 + 396) + *(_DWORD *)(a2 + 412);
  *(_DWORD *)(a2 + 396) = v12;
  int v13 = *(_DWORD *)(a2 + 320) + v12;
  int v14 = *(_DWORD *)(a2 + 316);
  if (v12 == *(_DWORD *)(a2 + 336) || v13 == v14)
  {
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 376))(a1, a2, a2 + 312);
    if (v7) {
      return v7;
    }
    int v15 = *(_DWORD *)(a2 + 396);
    uint64_t v16 = *(unsigned int *)(a2 + 400);
    int v17 = v15 - v16;
    if (v15 != v16)
    {
      memcpy(*(void **)(a2 + 328), (const void *)(*(void *)(a2 + 328) + v16), (v15 - v16));
      int v15 = *(_DWORD *)(a2 + 400);
    }
    *(_DWORD *)(a2 + 396) = v17;
    *(_DWORD *)(a2 + 320) += v15;
    *(_DWORD *)(a2 + 400) = 0;
  }
  if (v13 == v14)
  {
    unsigned int v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 384);
    return v18(a1, a2, a2 + 312);
  }
  else
  {
    return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
  }
}

uint64_t uarpPlatformAssetUpdateMetaData(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))
{
  unsigned int v4 = *(_DWORD *)(a3 + 84);
  if (v4 < 8) {
    return 0;
  }
  unsigned int v9 = *(unsigned int **)(a3 + 16);
  while (1)
  {
    uint64_t v10 = uarpNtohl(*v9);
    uint64_t v11 = uarpNtohl(v9[1]);
    if (v11 > *(_DWORD *)(a3 + 24) - 8) {
      break;
    }
    unsigned int v12 = v11;
    unsigned int v13 = v4 - 8;
    unsigned int v4 = v4 - 8 - v11;
    if (v13 >= v11)
    {
      int v14 = v9 + 2;
      int v15 = *(_DWORD *)(a3 + 88) + 8;
      *(_DWORD *)(a3 + 88) = v15;
      if (a4)
      {
        a4(a1, a2, v10, v11, v14);
        int v15 = *(_DWORD *)(a3 + 88);
      }
      unsigned int v9 = (unsigned int *)((char *)v14 + v12);
      *(_DWORD *)(a3 + 88) = v15 + v12;
      if (v4 > 7) {
        continue;
      }
    }
    return 0;
  }
  return 53;
}

uint64_t uarpPlatformAssetSuperBinaryPullHeader(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a2 + 392) == 1)
    {
      return 16;
    }
    else
    {
      uarpZero((void *)(a2 + 312), 0x88uLL);
      *(void *)(a2 + 312) = 0x2C00000000;
      *(void *)(a2 + 328) = *(void *)(a2 + 640);
      *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
      *(void *)(a2 + 376) = uarpPlatformAssetSuperBinaryRequestWindowFilled;
      *(void *)(a2 + 384) = uarpPlatformAssetSuperBinaryRequestCompleted;
      return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
    }
  }
  return result;
}

uint64_t uarpPlatformAssetSuperBinaryRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  UARPLayer2AssetStore(a1, a2);
  int v6 = *(unsigned int **)(a3 + 16);
  *(_DWORD *)a2 = uarpNtohl(*v6);
  *(_DWORD *)(a2 + 4) = uarpNtohl(v6[1]);
  *(_DWORD *)(a2 + 8) = uarpNtohl(v6[2]);
  uarpVersionEndianSwap(v6 + 3, (_DWORD *)(a2 + 12));
  *(_DWORD *)(a2 + 28) = uarpNtohl(v6[7]);
  *(_DWORD *)(a2 + 32) = uarpNtohl(v6[8]);
  *(_DWORD *)(a2 + 36) = uarpNtohl(v6[9]);
  int v7 = uarpNtohl(v6[10]);
  *(_DWORD *)(a2 + 40) = v7;
  *(_DWORD *)(a3 + 88) = *(_DWORD *)(a3 + 84);
  unsigned int v8 = *(_DWORD *)(a2 + 68);
  if (*(_DWORD *)(a2 + 36) + v7 > v8
    || *(_DWORD *)(a2 + 32) + *(_DWORD *)(a2 + 28) > v8
    || *(_DWORD *)(a2 + 4) != 44
    || (uint64_t result = 0, *(_DWORD *)a2 >= 4u))
  {
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
    return 47;
  }
  return result;
}

uint64_t uarpPlatformAssetSuperBinaryRequestCompleted(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t uarpPlatformAssetSuperBinaryPullMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 32))
    {
      *(_DWORD *)(a2 + 688) = 0;
      if (*(unsigned char *)(a2 + 392) == 1)
      {
        return 16;
      }
      else
      {
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(void *)(a2 + 312) = *(void *)(a2 + 28);
        *(void *)(a2 + 328) = *(void *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(void *)(a2 + 376) = uarpPlatformAssetSuperBinaryMetaDataRequestWindowFilled;
        *(void *)(a2 + 384) = uarpPlatformAssetSuperBinaryMetaDataRequestCompleted;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
    }
    else
    {
      return 40;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetSuperBinaryMetaDataRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  UARPLayer2AssetStore(a1, a2);
  uint64_t updated = uarpPlatformAssetUpdateMetaData(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))UARPLayer2AssetMetaDataTLV);
  if (updated) {
    UARPLayer2AssetMetaDataProcessingError(a1, a2);
  }
  else {
    *(_DWORD *)(a2 + 688) += *(_DWORD *)(a3 + 88);
  }
  return updated;
}

uint64_t uarpPlatformAssetSuperBinaryMetaDataRequestCompleted(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t uarpPlatformAssetSuperBinaryPullProposedPayloadHeader(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2 && *(_DWORD *)(a2 + 456) <= *(_DWORD *)(a2 + 448))
  {
    if (*(unsigned char *)(a2 + 392) == 1)
    {
      return 16;
    }
    else
    {
      uarpZero((void *)(a2 + 312), 0x88uLL);
      *(_DWORD *)(a2 + 312) = 40 * *(_DWORD *)(a2 + 456) + 44;
      *(_DWORD *)(a2 + 316) = 40;
      *(void *)(a2 + 328) = *(void *)(a2 + 640);
      *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
      *(void *)(a2 + 376) = uarpPlatformAssetPayloadHeaderRequestWindowFilled;
      *(void *)(a2 + 384) = uarpPlatformAssetPayloadHeaderRequestCompleted;
      return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
    }
  }
  return result;
}

uint64_t uarpPlatformAssetPayloadHeaderRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  UARPLayer2AssetStore(a1, a2);
  uint64_t v6 = uarpPlatformAssetPayloadHeaderProcess(*(unsigned int **)(a3 + 16), a2 + 464, *(_DWORD *)(a2 + 68));
  if (v6) {
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
  }
  else {
    *(_DWORD *)(a3 + 88) = *(_DWORD *)(a3 + 84);
  }
  return v6;
}

uint64_t uarpPlatformAssetPayloadHeaderRequestCompleted(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 452) = *(_DWORD *)(a2 + 456);
  UARPLayer2PayloadReady(a1, a2);
  return 0;
}

uint64_t uarpPlatformAssetPayloadHeaderProcess(unsigned int *a1, uint64_t a2, unsigned int a3)
{
  *(_DWORD *)a2 = uarpNtohl(*a1);
  *(_DWORD *)(a2 + 4) = a1[1];
  uarpVersionEndianSwap(a1 + 2, (_DWORD *)(a2 + 8));
  *(_DWORD *)(a2 + 24) = uarpNtohl(a1[6]);
  *(_DWORD *)(a2 + 28) = uarpNtohl(a1[7]);
  *(_DWORD *)(a2 + 32) = uarpNtohl(a1[8]);
  int v6 = uarpNtohl(a1[9]);
  *(_DWORD *)(a2 + 36) = v6;
  *(unsigned char *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 56) = 0;
  *(_DWORD *)(a2 + 76) = 0;
  *(_DWORD *)(a2 + 128) = v6;
  uint64_t v7 = 48;
  if (*(_DWORD *)(a2 + 28) + *(_DWORD *)(a2 + 24) <= a3)
  {
    if (*(_DWORD *)(a2 + 32) + v6 <= a3) {
      return 0;
    }
    else {
      return 48;
    }
  }
  return v7;
}

uint64_t uarpPlatformAssetPayloadPullMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 44;
    }
    else if (*(_DWORD *)(a2 + 492))
    {
      *(_DWORD *)(a2 + 512) = 0;
      if (*(unsigned char *)(a2 + 392) == 1)
      {
        return 16;
      }
      else
      {
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(void *)(a2 + 312) = *(void *)(a2 + 488);
        *(void *)(a2 + 328) = *(void *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(void *)(a2 + 376) = uarpPlatformAssetPayloadMetaDataRequestWindowFilled;
        *(void *)(a2 + 384) = uarpPlatformAssetPayloadMetaDataRequestCompleted;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
    }
    else
    {
      return 40;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetPayloadMetaDataRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  UARPLayer2AssetStore(a1, a2);
  uint64_t updated = uarpPlatformAssetUpdateMetaData(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))UARPLayer2PayloadMetaDataTLV);
  if (updated) {
    UARPLayer2PayloadMetaDataProcessingError(a1, a2);
  }
  else {
    *(_DWORD *)(a2 + 512) += *(_DWORD *)(a3 + 88);
  }
  return updated;
}

uint64_t uarpPlatformAssetPayloadMetaDataRequestCompleted(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t uarpPlatformAssetPayloadPullData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 452) == -1) {
      return 44;
    }
    unsigned int v5 = *(_DWORD *)(a2 + 508);
    if (v5 > *(_DWORD *)(a2 + 500) || *(_DWORD *)(a2 + 496) + v5 > *(_DWORD *)(a2 + 8)) {
      return 43;
    }
    if (*(unsigned char *)(a2 + 392) == 1) {
      return 16;
    }
    uarpZero((void *)(a2 + 312), 0x88uLL);
    int v6 = *(_DWORD *)(a2 + 508);
    *(_DWORD *)(a2 + 312) = v6 + *(_DWORD *)(a2 + 496);
    *(_DWORD *)(a2 + 316) = *(_DWORD *)(a2 + 500) - v6;
    *(void *)(a2 + 328) = *(void *)(a2 + 640);
    int v7 = *(_DWORD *)(a2 + 648);
    *(_DWORD *)(a2 + 336) = v7;
    *(_DWORD *)(a2 + 368) = v7;
    *(void *)(a2 + 376) = uarpPlatformAssetPayloadDataRequestWindowFilled;
    *(void *)(a2 + 384) = uarpPlatformAssetPayloadDataRequestCompleted;
    if (*(unsigned char *)(a2 + 516) == 1)
    {
      *(unsigned char *)(a2 + 356) = 1;
      *(_DWORD *)(a2 + 336) = 10;
      *(void *)(a2 + 344) = *(void *)(a2 + 656);
      *(_DWORD *)(a2 + 352) = *(_DWORD *)(a2 + 664);
      *(void *)(a2 + 376) = uarpPlatformAssetPayloadDataRequestCompressionHeader;
    }
    uint64_t v8 = *(unsigned int *)(a2 + 520);
    *(_DWORD *)(a2 + 416) = v8;
    UARPLayer2HashInfo(a1, v8, (_DWORD *)(a2 + 420), (_DWORD *)(a2 + 432));
    unsigned int v9 = *(_DWORD *)(a2 + 420);
    if (v9)
    {
      uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 424), v9);
      if (result) {
        return result;
      }
      if (!*(void *)(a2 + 424)) {
        return 11;
      }
    }
    unsigned int v10 = *(_DWORD *)(a2 + 432);
    if (v10)
    {
      uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 440), v10);
      if (result) {
        return result;
      }
      if (!*(void *)(a2 + 440)) {
        return 11;
      }
    }
    UARPLayer2HashInit(a1, *(unsigned int *)(a2 + 416), *(void *)(a2 + 424));
    return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
  }
  return result;
}

uint64_t uarpPlatformAssetPayloadDataRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  UARPLayer2HashUpdate(a1, *(unsigned int *)(a3 + 104), *(void *)(a3 + 112), *(void *)(a3 + 16), *(unsigned int *)(a3 + 84));
  UARPLayer2PayloadData(a1, a2);
  int v6 = *(_DWORD *)(a3 + 84);
  *(_DWORD *)(a3 + 88) = v6;
  *(_DWORD *)(a2 + 508) += v6;
  return 0;
}

uint64_t uarpPlatformAssetPayloadDataRequestCompleted(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(unsigned int *)(a2 + 520);
  if (!v5) {
    goto LABEL_7;
  }
  UARPLayer2HashFinal(a1, v5, *(void *)(a3 + 112), *(void *)(a3 + 128), *(unsigned int *)(a3 + 120));
  BOOL v7 = uarpPlatformCompareHash(a1, *(void **)(a3 + 128), *(unsigned int *)(a3 + 120), *(void **)(a2 + 528), *(_DWORD *)(a2 + 536));
  uint64_t v8 = *(void **)(a3 + 112);
  if (v8)
  {
    UARPLayer2ReturnBuffer(a1, v8);
    *(void *)(a3 + 112) = 0;
    *(_DWORD *)(a3 + 108) = 0;
  }
  unsigned int v9 = *(void **)(a3 + 128);
  if (v9)
  {
    UARPLayer2ReturnBuffer(a1, v9);
    *(void *)(a3 + 128) = 0;
    *(_DWORD *)(a3 + 120) = 0;
  }
  *(_DWORD *)(a3 + 104) = 0;
  if (!v7) {
    UARPLayer2AssetCorrupt(a1, a2);
  }
  else {
LABEL_7:
  }
    UARPLayer2PayloadDataComplete2(a1, (void *)a2);
  return 0;
}

uint64_t uarpPlatformAssetPayloadDataRequestCompressionHeader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uarpCompressionHeaderEndianSwap(*(unsigned __int16 **)(a3 + 16), a3 + 45);
  int v5 = *(_DWORD *)(a3 + 84);
  *(_DWORD *)(a3 + 88) = v5;
  *(_DWORD *)(a2 + 508) += v5;
  *(unsigned char *)(a3 + 44) = 0;
  unsigned int v6 = *(unsigned __int16 *)(a3 + 51);
  *(_DWORD *)(a3 + 24) = v6;
  if (*(_DWORD *)(a3 + 56) < v6 || *(_DWORD *)(a3 + 40) < *(unsigned __int16 *)(a3 + 53)) {
    return 51;
  }
  uint64_t result = 0;
  *(void *)(a3 + 64) = uarpPlatformAssetPayloadDataRequestCompressedBlock;
  return result;
}

uint64_t uarpPlatformAssetPullAllPayloadHeaders(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a2 + 392) == 1)
    {
      return 16;
    }
    else
    {
      uint64_t v7 = 0;
      if (*(int *)(a2 + 448) < 1)
      {
LABEL_9:
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(void *)(a2 + 312) = *(void *)(a2 + 36);
        *(void *)(a2 + 328) = *(void *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(void *)(a2 + 376) = uarpPlatformAssetAllPayloadHeadersRequestWindowFilled;
        *(void *)(a2 + 384) = uarpPlatformAssetAllPayloadHeadersRequestCompleted;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
      else
      {
        int v5 = 0;
        while (1)
        {
          uint64_t result = UARPLayer2RequestBuffer(a1, &v7, 0xB8u);
          if (result) {
            break;
          }
          uint64_t v6 = v7;
          *(void *)(v7 + 176) = *(void *)(a2 + 632);
          *(void *)(a2 + 632) = v6;
          if (++v5 >= *(_DWORD *)(a2 + 448)) {
            goto LABEL_9;
          }
        }
      }
    }
  }
  return result;
}

uint64_t uarpPlatformAssetAllPayloadHeadersRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(int *)(a2 + 448) < 1) {
    return 0;
  }
  uint64_t v6 = 0;
  uint64_t v7 = *(unsigned int **)(a3 + 16);
  uint64_t v8 = *(void *)(a2 + 632);
  while (1)
  {
    if (!v8) {
      return 11;
    }
    uint64_t v9 = uarpPlatformAssetPayloadHeaderProcess(v7, v8, *(_DWORD *)(a2 + 68));
    if (v9) {
      break;
    }
    *(_DWORD *)(v8 + 124) = v6;
    uint64_t v8 = *(void *)(v8 + 176);
    *(_DWORD *)(a3 + 88) += 40;
    ++v6;
    v7 += 10;
    if (v6 >= *(int *)(a2 + 448)) {
      return 0;
    }
  }
  uint64_t v10 = v9;
  uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
  return v10;
}

_DWORD *uarpProcessTLV(uint64_t a1, unsigned int *a2)
{
  int v4 = uarpNtohl(*a2);
  unsigned int v5 = uarpNtohl(a2[1]);
  uint64_t v9 = 0;
  int v6 = UARPLayer2RequestBuffer(a1, &v9, v5 + 24);
  uint64_t v7 = 0;
  if (!v6)
  {
    uint64_t v7 = v9;
    *uint64_t v9 = v4;
    v7[1] = v5;
    memcpy(v7 + 6, a2 + 2, v5);
    *((void *)v7 + 1) = v7 + 6;
  }
  return v7;
}

uint64_t uarpPlatformAssetPullAllMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (!a1 || !a2) {
    return result;
  }
  if (*(unsigned char *)(a2 + 392) == 1) {
    return 16;
  }
  uarpZero((void *)(a2 + 312), 0x88uLL);
  int v6 = *(_DWORD *)(a2 + 28);
  unsigned int v5 = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a2 + 312) = v6;
  *(_DWORD *)(a2 + 316) = v5;
  for (uint64_t i = *(void *)(a2 + 632); i; uint64_t i = *(void *)(i + 176))
  {
    int v8 = *(_DWORD *)(i + 24);
    if (v8)
    {
      if (v8 != v5 + v6) {
        return 43;
      }
      v5 += *(_DWORD *)(i + 28);
      *(_DWORD *)(a2 + 316) = v5;
    }
  }
  *(_DWORD *)(a2 + 680) = v5;
  *(void *)(a2 + 672) = 0;
  if (!v5)
  {
    *(void *)(a2 + 328) = 0;
    *(_DWORD *)(a2 + 336) = 0;
    *(void *)(a2 + 376) = uarpPlatformAssetAllMetaDataWindowFilled;
    *(void *)(a2 + 384) = uarpPlatformAssetAllMetaDataRequestCompleted;
LABEL_17:
    UARPLayer2AssetAllHeadersAndMetaDataComplete(a1, *(void *)(a2 + 696), a2);
    return 0;
  }
  uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 672), v5);
  if (result) {
    return result;
  }
  int v9 = *(_DWORD *)(a2 + 680);
  int v10 = *(_DWORD *)(a2 + 316);
  *(void *)(a2 + 328) = *(void *)(a2 + 672);
  *(_DWORD *)(a2 + 336) = v9;
  *(void *)(a2 + 376) = uarpPlatformAssetAllMetaDataWindowFilled;
  *(void *)(a2 + 384) = uarpPlatformAssetAllMetaDataRequestCompleted;
  if (!v10) {
    goto LABEL_17;
  }

  return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
}

uint64_t uarpPlatformAssetAllMetaDataWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(a2 + 32);
  int v4 = *(_DWORD *)(a3 + 88);
  if (*(_DWORD *)(a3 + 84) - v4 < v3) {
    return 18;
  }
  if (v3)
  {
    int v9 = *(unsigned int **)(a3 + 16);
    while (1)
    {
      int v10 = uarpProcessTLV(a1, v9);
      if (!v10) {
        return 10;
      }
      uint64_t v11 = (v10[1] + 8);
      int v9 = (unsigned int *)((char *)v9 + v11);
      *((void *)v10 + 2) = *(void *)(a2 + 720);
      *(void *)(a2 + 720) = v10;
      v3 -= v11;
      if (!v3)
      {
        int v12 = *(_DWORD *)(a2 + 32);
        int v4 = *(_DWORD *)(a3 + 88);
        goto LABEL_9;
      }
    }
  }
  else
  {
    int v12 = 0;
LABEL_9:
    unsigned int v13 = v4 + v12;
    *(_DWORD *)(a3 + 88) = v13;
    uint64_t v14 = *(void *)(a2 + 632);
    if (v14)
    {
      while (1)
      {
        unsigned int v15 = *(_DWORD *)(v14 + 28);
        if (*(_DWORD *)(a3 + 84) - v13 < v15) {
          return 18;
        }
        if (v15)
        {
          uint64_t v16 = (unsigned int *)(*(void *)(a3 + 16) + v13);
          while (1)
          {
            int v17 = uarpProcessTLV(a1, v16);
            if (!v17) {
              return 10;
            }
            uint64_t v18 = (v17[1] + 8);
            uint64_t v16 = (unsigned int *)((char *)v16 + v18);
            *((void *)v17 + 2) = *(void *)(v14 + 168);
            *(void *)(v14 + 168) = v17;
            v15 -= v18;
            if (!v15)
            {
              int v19 = *(_DWORD *)(v14 + 28);
              unsigned int v13 = *(_DWORD *)(a3 + 88);
              goto LABEL_17;
            }
          }
        }
        int v19 = 0;
LABEL_17:
        uint64_t result = 0;
        v13 += v19;
        *(_DWORD *)(a3 + 88) = v13;
        uint64_t v14 = *(void *)(v14 + 176);
        if (!v14) {
          return result;
        }
      }
    }
    return 0;
  }
}

uint64_t uarpPlatformAssetAllMetaDataRequestCompleted(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t uarpPlatformAssetPayloadDataRequestCompressedBlock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = UARPLayer2DecompressBuffer(a1, *(unsigned __int16 *)(a3 + 45), *(void *)(a3 + 16), *(unsigned __int16 *)(a3 + 51), *(void *)(a3 + 32), *(unsigned __int16 *)(a3 + 53));
  if (v6)
  {
    uint64_t v7 = *(void (**)(void, uint64_t, const char *))(a1 + 400);
    if (v7) {
      v7(*(void *)(a1 + 544), 2, "Error decompressing buffer for payload");
    }
    else {
      uarpLogError(2u, "Error decompressing buffer for payload");
    }
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
  }
  else
  {
    UARPLayer2HashUpdate(a1, *(unsigned int *)(a3 + 104), *(void *)(a3 + 112), *(void *)(a3 + 32), *(unsigned __int16 *)(a3 + 53));
    UARPLayer2PayloadData(a1, a2);
    int v8 = *(_DWORD *)(a3 + 24);
    *(_DWORD *)(a3 + 88) = v8;
    *(_DWORD *)(a2 + 508) += v8;
    *(unsigned char *)(a3 + 44) = 1;
    *(_DWORD *)(a3 + 24) = 10;
    *(void *)(a3 + 64) = uarpPlatformAssetPayloadDataRequestCompressionHeader;
  }
  return v6;
}

uint64_t UARPLayer2RequestBuffer(uint64_t a1, void *a2, unsigned int a3)
{
  int v4 = *(uint64_t (**)(uint64_t))(a1 + 48);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 544);
    return v4(v5);
  }
  else
  {
    uint64_t v7 = uarpZalloc(a3);
    *a2 = v7;
    if (v7) {
      return 0;
    }
    else {
      return 11;
    }
  }
}

void UARPLayer2ReturnBuffer(uint64_t a1, void *a2)
{
  id v2 = *(void (**)(void, void *))(a1 + 56);
  if (v2) {
    v2(*(void *)(a1 + 544), a2);
  }
  else {
    uarpFree(a2);
  }
}

uint64_t UARPLayer2RequestTransmitMsgBuffer(uint64_t a1, uint64_t a2, void *a3, unsigned int *a4)
{
  size_t v5 = *a4;
  uint64_t v6 = *(uint64_t (**)(uint64_t, void *, size_t))(a1 + 48);
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 544);
    return v6(v7, a3, v5);
  }
  else
  {
    int v9 = uarpZalloc(v5);
    *a3 = v9;
    if (v9) {
      return 0;
    }
    else {
      return 11;
    }
  }
}

void UARPLayer2ReturnTransmitMsgBuffer(uint64_t a1, int a2, void *a3)
{
  unsigned int v3 = *(void (**)(void, void *))(a1 + 56);
  if (v3) {
    v3(*(void *)(a1 + 544), a3);
  }
  else {
    uarpFree(a3);
  }
}

uint64_t UARPLayer2SendMessage(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  int v4 = *(uint64_t (**)(uint64_t, uint64_t, const void *, uint64_t, uint64_t))(a1 + 80);
  if (!v4) {
    return 14;
  }
  if (*(_WORD *)(a2 + 136))
  {
    uarpPlatformDownstreamEndpointSendMessageInternal(a1, *(void *)(a2 + 176), a2, a3, a4);
    uarpPlatformEndpointSendMessageComplete(a1, a2, (uint64_t)a3);
    return 0;
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 544);
    uint64_t v10 = *(void *)(a2 + 40);
    return v4(v9, v10, a3, a4, a4);
  }
}

uint64_t UARPLayer2DataTransferPause(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 88);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2DataTransferPauseAck(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 96);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2DataTransferResume(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 104);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2DataTransferResumeAck(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 112);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2SuperBinaryOffered(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 120);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2DynamicAssetOffered(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 128);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2ApplyStagedAssets(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 136);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2ApplyStagedAssetsResponse(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 144);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2ManufacturerName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t))(a1 + 152);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 544);
    return v3(v4);
  }
  else
  {
    *a3 = uarpCopyDefaultInfoString(a2, *a3);
    return 0;
  }
}

uint64_t UARPLayer2ManufacturerNameResponse(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 160);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2ModelName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t))(a1 + 168);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 544);
    return v3(v4);
  }
  else
  {
    *a3 = uarpCopyDefaultInfoString(a2, *a3);
    return 0;
  }
}

uint64_t UARPLayer2ModelNameResponse(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 176);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2SerialNumber(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t))(a1 + 184);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 544);
    return v3(v4);
  }
  else
  {
    *a3 = uarpCopyDefaultInfoString(a2, *a3);
    return 0;
  }
}

uint64_t UARPLayer2SerialNumberResponse(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 192);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2HardwareVersion(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t))(a1 + 200);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 544);
    return v3(v4);
  }
  else
  {
    *a3 = uarpCopyDefaultInfoString(a2, *a3);
    return 0;
  }
}

uint64_t UARPLayer2HardwareVersionResponse(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 208);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2ActiveFirmwareVersion2(void *a1, unsigned int *a2, void *a3)
{
  size_t v5 = (uint64_t (*)(uint64_t))a1[27];
  if (v5)
  {
    uint64_t v6 = a1[68];
    return v5(v6);
  }
  else
  {
    int v8 = (uint64_t (*)(uint64_t, unsigned int *, void *))a1[64];
    if (v8)
    {
      if (a2)
      {
        a2 = (unsigned int *)uarpTagStructPack32(a2);
        int v8 = (uint64_t (*)(uint64_t, unsigned int *, void *))a1[64];
      }
      uint64_t v9 = a1[68];
      return v8(v9, a2, a3);
    }
    else
    {
      *a3 = -1;
      a3[1] = -1;
      return 0;
    }
  }
}

uint64_t UARPLayer2ActiveFirmwareVersionResponse(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 224);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2StagedFirmwareVersion2(void *a1, unsigned int *a2, void *a3)
{
  size_t v5 = (uint64_t (*)(uint64_t))a1[29];
  if (v5)
  {
    uint64_t v6 = a1[68];
    return v5(v6);
  }
  else
  {
    int v8 = (uint64_t (*)(uint64_t, unsigned int *, void *))a1[65];
    if (v8)
    {
      if (a2)
      {
        a2 = (unsigned int *)uarpTagStructPack32(a2);
        int v8 = (uint64_t (*)(uint64_t, unsigned int *, void *))a1[65];
      }
      uint64_t v9 = a1[68];
      return v8(v9, a2, a3);
    }
    else
    {
      *a3 = -1;
      a3[1] = -1;
      return 0;
    }
  }
}

uint64_t UARPLayer2StagedFirmwareVersionResponse(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 240);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2LastError(uint64_t a1, void *a2)
{
  id v2 = *(uint64_t (**)(void))(a1 + 248);
  if (v2) {
    return v2(*(void *)(a1 + 544));
  }
  *a2 = -1;
  return 0;
}

uint64_t UARPLayer2LastErrorResponse(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 256);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2StatisticsResponse(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 264);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2AssetSolicitation(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 272);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2RescindAllAssets(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, uint64_t, uint64_t))(result + 280);
  if (v3)
  {
    if (a2) {
      a2 = *(void *)(a2 + 40);
    }
    if (a3) {
      a3 = *(void *)(a3 + 704);
    }
    return v3(*(void *)(result + 544), a2, a3);
  }
  return result;
}

uint64_t UARPLayer2RescindAllAssetsAck(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, uint64_t))(result + 288);
  if (v3)
  {
    if (a3) {
      a3 = *(void *)(a3 + 704);
    }
    return v3(*(void *)(result + 544), *(void *)(a2 + 40), a3);
  }
  return result;
}

uint64_t UARPLayer2WatchdogSet(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 296);
  if (!v2) {
    return 14;
  }
  *(unsigned char *)(a2 + 50) = 1;
  return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
}

uint64_t UARPLayer2WatchdogCancel(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 304);
  if (!v2) {
    return 14;
  }
  *(unsigned char *)(a2 + 50) = 0;
  return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
}

uint64_t UARPLayer2ProtocolVersion(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 312);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2FriendlyName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t))(a1 + 320);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 544);
    return v3(v4);
  }
  else
  {
    *a3 = uarpCopyDefaultInfoString(a2, *a3);
    return 0;
  }
}

uint64_t UARPLayer2FriendlyNameResponse(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 328);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2DecompressBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 336);
  if (v6) {
    return v6(a2, a3, a4, a5, a6);
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2CompressBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 344);
  if (v6) {
    return v6(a2, a3, a4, a5, a6);
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2HashInfo(uint64_t result, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t, _DWORD *, _DWORD *))(result + 352);
  if (v4) {
    return v4(a2, a3, a4);
  }
  *a3 = 0;
  *a4 = 0;
  return result;
}

uint64_t UARPLayer2HashInit(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t))(result + 360);
  if (v3) {
    return v3(a2, a3);
  }
  return result;
}

uint64_t UARPLayer2HashUpdate(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  size_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 368);
  if (v5) {
    return v5(a2, a3, a4, a5);
  }
  return result;
}

uint64_t UARPLayer2HashFinal(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  size_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 376);
  if (v5) {
    return v5(a2, a3, a4, a5);
  }
  return result;
}

uint64_t UARPLayer2HashLog(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t))(result + 384);
  if (v3) {
    return v3(a2, a3);
  }
  return result;
}

uint64_t UARPLayer2LogPacket(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 392);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t fUarpLayer3DownstreamEndpointDiscovery(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 432);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t fUarpLayer3DownstreamEndpointReachable(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 440);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t fUarpLayer3DownstreamEndpointUnreachable(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 448);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t fUarpLayer3DownstreamEndpointReleased(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 456);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t fUarpLayer3DownstreamEndpointRecvMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a1 + 464);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 40));
  }
  else {
    return 14;
  }
}

uint64_t fUarpLayer3NoFirmwareUpdateAvailable(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 472);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2VendorSpecificRecvMessage(void *a1, uint64_t a2)
{
  id v2 = (uint64_t (*)(void, void))a1[60];
  if (v2) {
    return v2(a1[68], *(void *)(a2 + 40));
  }
  uint64_t v4 = (uint64_t (*)(void))a1[74];
  if (v4) {
    return v4();
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2VendorSpecificCheckExpectedResponse(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 488);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 1;
  }
}

uint64_t UARPLayer2VendorSpecificCheckValidToSend(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 496);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 1;
  }
}

uint64_t UARPLayer2VendorSpecificExceededRetries(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 504);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2AssetReady(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 80);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetMetaDataTLV(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 88);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetMetaDataComplete(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 96);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetMetaDataProcessingError(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 104);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadReady(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 112);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

void *UARPLayer2PayloadMetaDataTLV(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int *a5)
{
  uint64_t result = uarpProcessPayloadTLVInternal(a1, a2, a2 + 464, a3, a4, a5);
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))(a2 + 120);
  if (v11)
  {
    uint64_t v12 = a1[68];
    uint64_t v13 = *(void *)(a2 + 704);
    return (void *)v11(v12, v13, a3, a4, a5);
  }
  return result;
}

uint64_t UARPLayer2PayloadMetaDataComplete(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(unsigned int *)(a2 + 540);
  if (!result) {
    goto LABEL_5;
  }
  size_t v5 = *(void (**)(void))(a1 + 376);
  if (v5) {
    v5();
  }
  uint64_t result = uarpPlatformCompareHash(a1, *(void **)(a2 + 560), *(unsigned int *)(a2 + 568), *(void **)(a2 + 576), *(_DWORD *)(a2 + 584));
  if (!result)
  {
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 200);
    if (!v6) {
      return result;
    }
  }
  else
  {
LABEL_5:
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 128);
    if (!v6) {
      return result;
    }
  }
  uint64_t v7 = *(void *)(a1 + 544);
  uint64_t v8 = *(void *)(a2 + 704);

  return v6(v7, v8);
}

uint64_t UARPLayer2AssetCorrupt(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 200);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadMetaDataProcessingError(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 136);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadData(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 144);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadDataComplete(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 152);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadDataComplete2(uint64_t result, void *a2)
{
  id v2 = (uint64_t (*)(void, void))a2[20];
  if (v2) {
    return v2(*(void *)(result + 544), a2[88]);
  }
  unsigned int v3 = (uint64_t (*)(void, void))a2[19];
  if (v3) {
    return v3(*(void *)(result + 544), a2[88]);
  }
  return result;
}

uint64_t UARPLayer2AssetGetBytesAtOffset2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  uint64_t v7 = (uint64_t (*)(void, uint64_t, void))a3[21];
  if (v7) {
    return v7(*(void *)(a1 + 544), a2, a3[88]);
  }
  uint64_t v9 = (uint64_t (*)(void, void, uint64_t, uint64_t, uint64_t, uint64_t))a3[34];
  if (v9) {
    return v9(*(void *)(a1 + 544), a3[88], a4, a5, a6, a7);
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2AssetSetBytesAtOffset2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  uint64_t v6 = (uint64_t (*)(void, uint64_t, void))a3[22];
  if (v6) {
    return v6(*(void *)(a1 + 544), a2, a3[88]);
  }
  uint64_t v8 = (uint64_t (*)(void, void, uint64_t, uint64_t, uint64_t))a3[35];
  if (v8) {
    return v8(*(void *)(a1 + 544), a3[88], a4, a5, a6);
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2AssetRescinded(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  unsigned int v3 = *(uint64_t (**)(void, uint64_t, void))(a3 + 184);
  if (v3) {
    return v3(*(void *)(result + 544), a2, *(void *)(a3 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetRescindedAck(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  unsigned int v3 = *(uint64_t (**)(void, uint64_t, void))(a3 + 192);
  if (v3) {
    return v3(*(void *)(result + 544), a2, *(void *)(a3 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetOrphaned(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 208);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetReleased2(uint64_t result, uint64_t a2, void *a3)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  unsigned int v3 = (uint64_t (*)(void, uint64_t, void))a3[27];
  if (v3) {
    return v3(*(void *)(result + 544), a2, a3[88]);
  }
  uint64_t v4 = (uint64_t (*)(void, void))a3[36];
  if (v4) {
    return v4(*(void *)(result + 544), a3[88]);
  }
  return result;
}

uint64_t UARPLayer2AssetProcessingNotification2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4 = (uint64_t (*)(void, void, void))a3[28];
  if (v4) {
    return v4(*(void *)(a1 + 544), *(void *)(a2 + 40), a3[88]);
  }
  uint64_t v6 = (uint64_t (*)(void, void, uint64_t))a3[37];
  if (v6) {
    return v6(*(void *)(a1 + 544), a3[88], a4);
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2AssetProcessingNotificationAck(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 232);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2AssetPreProcessingNotification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 240);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2AssetPreProcessingNotificationAck(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 248);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2AssetAllHeadersAndMetaDataComplete(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 256);
  if (v3) {
    return v3(*(void *)(result + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetStore(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 264);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t uarpPlatformEndpointQueryActiveFirmwareVersion(void *a1, uint64_t a2, void *a3)
{
  unsigned int v4 = 0;
  if (a2) {
    unsigned int v4 = *(_DWORD *)(a2 + 48);
  }
  return UARPLayer2ActiveFirmwareVersion2(a1, &v4, a3);
}

uint64_t uarpPlatformEndpointQueryStagedFirmwareVersion(void *a1, uint64_t a2, void *a3)
{
  unsigned int v4 = 0;
  if (a2) {
    unsigned int v4 = *(_DWORD *)(a2 + 48);
  }
  return UARPLayer2StagedFirmwareVersion2(a1, &v4, a3);
}

uint64_t uarpPlatformAssetFindByAssetID(uint64_t a1, uint64_t a2, int a3, int a4)
{
  for (uint64_t result = *(void *)(a1 + 568); result; uint64_t result = *(void *)(result + 712))
  {
    if (*(_DWORD *)(result + 304) == a3 && *(void *)(result + 696) == a2 && *(unsigned __int16 *)(result + 44) == a4) {
      break;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetFindByTag(uint64_t a1, uint64_t a2, int a3, unsigned __int8 *a4)
{
  for (uint64_t i = *(void *)(a1 + 568); i; uint64_t i = *(void *)(i + 712))
  {
    if (*(_DWORD *)(i + 304) == a3
      && *(void *)(i + 696) == a2
      && uarpAssetTagCompare((unsigned __int8 *)(i + 48), a4))
    {
      break;
    }
  }
  return i;
}

void uarpPlatformCleanupAssetsForRemoteEndpoint(uint64_t a1, uint64_t a2, int a3)
{
  if (*(unsigned char *)(a1 + 580) != 1)
  {
    uint64_t v4 = *(void *)(a1 + 568);
    for (*(void *)(a1 + 568) = 0; v4; *(void *)(a1 + 568) = v7)
    {
      while (1)
      {
        uint64_t v7 = v4;
        uint64_t v4 = *(void *)(v4 + 712);
        *(void *)(v7 + 712) = 0;
        uint64_t v8 = *(void *)(v7 + 696);
        BOOL v9 = v8 == a2 || a2 == 0;
        if (!v9 && v8 != 0) {
          break;
        }
        if (a3 == 1)
        {
          if (*(_WORD *)(v7 + 46))
          {
            *(void *)(v7 + 696) = 0;
            UARPLayer2AssetOrphaned(a1, v7);
          }
          else
          {
            *(unsigned char *)(v7 + 72) = 1;
          }
        }
        if (*(unsigned char *)(v7 + 72) != 1) {
          break;
        }
        UARPLayer2AssetReleased2(a1, a2, (void *)v7);
        *(void *)(v7 + 704) = 0;
        uarpPlatformAssetCleanup(a1, v7);
        if (!v4) {
          return;
        }
      }
      *(void *)(v7 + 712) = *(void *)(a1 + 568);
    }
  }
}

uint64_t uarpPlatformAssetOrphan(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 696) = 0;
  return UARPLayer2AssetOrphaned(result, a2);
}

uint64_t uarpPlatformAssetRelease(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = UARPLayer2AssetReleased2(a1, a2, a3);
  a3[88] = 0;
  return result;
}

void uarpPlatformAssetCleanup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 640);
  if (v4 && !*(unsigned char *)(a2 + 652)) {
    UARPLayer2ReturnBuffer(a1, v4);
  }
  *(void *)(a2 + 640) = 0;
  *(_DWORD *)(a2 + 648) = 0;
  size_t v5 = *(void **)(a2 + 656);
  if (v5 && !*(unsigned char *)(a2 + 668)) {
    UARPLayer2ReturnBuffer(a1, v5);
  }
  *(void *)(a2 + 656) = 0;
  *(_DWORD *)(a2 + 664) = 0;
  uint64_t v6 = *(void **)(a2 + 672);
  if (v6)
  {
    UARPLayer2ReturnBuffer(a1, v6);
    *(void *)(a2 + 672) = 0;
  }
  *(_DWORD *)(a2 + 680) = 0;
  uint64_t v7 = *(void **)(a2 + 720);
  if (v7)
  {
    do
    {
      uint64_t v8 = (void *)v7[2];
      v7[2] = 0;
      UARPLayer2ReturnBuffer(a1, v7);
      uint64_t v7 = v8;
    }
    while (v8);
  }
  *(void *)(a2 + 720) = 0;
  BOOL v9 = *(void **)(a2 + 632);
  if (v9)
  {
    do
    {
      uint64_t v10 = (void *)v9[21];
      uint64_t v11 = (void *)v9[22];
      if (v10)
      {
        do
        {
          uint64_t v12 = (void *)v10[2];
          v10[2] = 0;
          UARPLayer2ReturnBuffer(a1, v10);
          uint64_t v10 = v12;
        }
        while (v12);
      }
      v9[21] = 0;
      uarpPlatformPayloadCleanup(a1, (uint64_t)v9);
      UARPLayer2ReturnBuffer(a1, v9);
      BOOL v9 = v11;
    }
    while (v11);
  }
  uarpPlatformPayloadCleanup(a1, a2 + 464);

  UARPLayer2ReturnBuffer(a1, (void *)a2);
}

uint64_t uarpPlatformAssetIsKnown(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 568);
  if (!v3) {
    return 0;
  }
  while (v3 != a3)
  {
    uint64_t v3 = *(void *)(v3 + 712);
    if (!v3) {
      return 0;
    }
  }
  return 1;
}

void uarpPlatformPrepareAsset(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5, int a6)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v16 = 0;
        if (!UARPLayer2RequestBuffer(a1, &v16, 0x2D8u))
        {
          uint64_t v12 = v16;
          if (v16)
          {
            *(void *)(v16 + 704) = a3;
            *(void *)(v12 + 696) = a2;
            uarpPlatformEndpointAssetSetCallbacks(a1, v12, a5);
            if (!v13)
            {
              uint64_t v14 = v16;
              if (a6 == 1)
              {
                *(_DWORD *)(v16 + 304) = 1;
                int v15 = *(_DWORD *)(a1 + 576);
                if (v15 == 65534) {
                  int v15 = 1;
                }
                *(_DWORD *)(a1 + 576) = v15 + 1;
              }
              else
              {
                LOWORD(v15) = 0;
                *(_DWORD *)(v16 + 304) = 0;
              }
              *(_WORD *)(v14 + 44) = v15;
              *(void *)(v14 + 712) = *(void *)(a1 + 568);
              *(void *)(a1 + 568) = v14;
              if (a4)
              {
                *(_WORD *)(v14 + 46) = 2;
                *(_DWORD *)(v14 + 48) = *a4;
              }
              else
              {
                *(_WORD *)(v14 + 46) = 1;
              }
            }
          }
        }
      }
    }
  }
}

void uarpPlatformPayloadCleanup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 80);
  if (v4)
  {
    UARPLayer2ReturnBuffer(a1, v4);
    *(void *)(a2 + 80) = 0;
    *(_DWORD *)(a2 + 88) = 0;
  }
  size_t v5 = *(void **)(a2 + 96);
  if (v5)
  {
    UARPLayer2ReturnBuffer(a1, v5);
    *(void *)(a2 + 96) = 0;
    *(_DWORD *)(a2 + 104) = 0;
  }
  uint64_t v6 = *(void **)(a2 + 112);
  if (v6)
  {
    UARPLayer2ReturnBuffer(a1, v6);
    *(void *)(a2 + 112) = 0;
    *(_DWORD *)(a2 + 120) = 0;
  }
  uint64_t v7 = *(void **)(a2 + 64);
  if (v7)
  {
    UARPLayer2ReturnBuffer(a1, v7);
    *(void *)(a2 + 64) = 0;
    *(_DWORD *)(a2 + 72) = 0;
  }
  uint64_t v8 = *(void **)(a2 + 152);
  if (v8)
  {
    UARPLayer2ReturnBuffer(a1, v8);
    *(void *)(a2 + 152) = 0;
    *(_DWORD *)(a2 + 160) = 0;
  }
  BOOL v9 = *(void **)(a2 + 136);
  if (v9)
  {
    UARPLayer2ReturnBuffer(a1, v9);
    *(void *)(a2 + 136) = 0;
    *(_DWORD *)(a2 + 144) = 0;
  }
}

uint64_t uarpPlatformEndpointAssetStore(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 <= 4) {
    return UARPLayer2AssetStore(result, a2);
  }
  return result;
}

uint64_t uarpPlatformAssetRescind(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v5 = result;
    if (a3)
    {
      uarpTransmitQueueAssetRescinded(result, a2, a3);
      *(unsigned char *)(a3 + 392) = 0;
      *(unsigned char *)(a3 + 72) = 1;
      return UARPLayer2AssetRescinded(v5, a2, a3);
    }
    else
    {
      return UARPLayer2RescindAllAssets(result, a2, 0);
    }
  }
  return result;
}

uint64_t uarpPlatformReOfferFirmware(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 568);
  if (v2)
  {
    uint64_t v4 = result;
    do
    {
      if (*(_DWORD *)(v2 + 304) == 1 && *(void *)(v2 + 696) == a2 && (*(_WORD *)(v2 + 46) & 2) == 0) {
        uint64_t result = uarpPlatformEndpointOfferAsset(v4, a2, *(void *)(v2 + 704));
      }
      uint64_t v2 = *(void *)(v2 + 712);
    }
    while (v2);
  }
  return result;
}

uint64_t uarpCallbackUpdateInformationTLV(void *a1, uint64_t a2, _DWORD *a3)
{
  int v5 = *a3;
  unsigned int v6 = a3[1];
  unsigned int v9 = v6;
  if (v5 != 7)
  {
    uint64_t result = uarpPlatformQueryAccessoryInfo(a1, v5, a3 + 2, v6, &v9);
    if (result) {
      return result;
    }
    unsigned int v7 = v9;
    goto LABEL_6;
  }
  if (v6 >= 0x10)
  {
    a3[2] = uarpHtonl(*(_DWORD *)(a2 + 62));
    a3[3] = uarpHtonl(*(_DWORD *)(a2 + 66));
    a3[4] = uarpHtonl(*(_DWORD *)(a2 + 70));
    a3[5] = uarpHtonl(*(_DWORD *)(a2 + 74));
    unsigned int v7 = 16;
LABEL_6:
    uint64_t result = 0;
    a3[1] = v7;
    return result;
  }
  return 39;
}

uint64_t uarpPlatformQueryAccessoryInfo(void *a1, int a2, unsigned int *a3, unsigned int a4, unsigned int *a5)
{
  *a5 = a4;
  switch(a2)
  {
    case 1:
      return UARPLayer2ManufacturerName((uint64_t)a1, a3, a5);
    case 2:
      return UARPLayer2ModelName((uint64_t)a1, a3, a5);
    case 3:
      return UARPLayer2SerialNumber((uint64_t)a1, a3, a5);
    case 4:
      return UARPLayer2HardwareVersion((uint64_t)a1, a3, a5);
    case 9:
      return UARPLayer2FriendlyName((uint64_t)a1, a3, a5);
    default:
      if ((a2 - 5) > 1)
      {
        if (a2 != 8)
        {
          *a5 = 0;
          return 28;
        }
        *a5 = 8;
        if (a4 >= 8)
        {
          uint64_t Error = UARPLayer2LastError((uint64_t)a1, a3);
          *a3 = uarpHtonl(*a3);
          a3[1] = uarpHtonl(a3[1]);
          return Error;
        }
      }
      else
      {
        *a5 = 16;
        if (a4 >= 0x10)
        {
          if (a2 == 5)
          {
            unsigned int v9 = 0;
            uint64_t active = UARPLayer2ActiveFirmwareVersion2(a1, &v9, a3);
          }
          else
          {
            unsigned int v10 = 0;
            uint64_t active = UARPLayer2StagedFirmwareVersion2(a1, &v10, a3);
          }
          uint64_t Error = active;
          *a3 = uarpHtonl(*a3);
          a3[1] = uarpHtonl(a3[1]);
          a3[2] = uarpHtonl(a3[2]);
          a3[3] = uarpHtonl(a3[3]);
          return Error;
        }
      }
      return 39;
  }
}

uint64_t uarpPlatformResponseAccessoryInfo(uint64_t result, uint64_t a2, uint64_t a3, int a4, unsigned int a5, unsigned int *a6)
{
  uint64_t v8 = result;
  switch(a4)
  {
    case 1:
      uint64_t result = UARPLayer2ManufacturerNameResponse(result, a2);
      break;
    case 2:
      uint64_t result = UARPLayer2ModelNameResponse(result, a2);
      break;
    case 3:
      uint64_t result = UARPLayer2SerialNumberResponse(result, a2);
      break;
    case 4:
      uint64_t result = UARPLayer2HardwareVersionResponse(result, a2);
      break;
    case 5:
      if (a5 >= 0x10)
      {
        uarpVersionEndianSwap(a6, a6);
        uint64_t result = UARPLayer2ActiveFirmwareVersionResponse(v8, a2);
        *(_OWORD *)(a2 + 138) = *(_OWORD *)a6;
      }
      break;
    case 6:
      if (a5 >= 0x10)
      {
        uarpVersionEndianSwap(a6, a6);
        uint64_t result = UARPLayer2StagedFirmwareVersionResponse(v8, a2);
        *(_OWORD *)(a2 + 154) = *(_OWORD *)a6;
      }
      break;
    case 7:
      if (a5 >= 0x10)
      {
        *a6 = uarpNtohl(*a6);
        a6[1] = uarpNtohl(a6[1]);
        a6[2] = uarpNtohl(a6[2]);
        a6[3] = uarpNtohl(a6[3]);
        uint64_t result = UARPLayer2StatisticsResponse(v8, a2);
      }
      break;
    case 8:
      if (a5 >= 8)
      {
        *a6 = uarpNtohl(*a6);
        a6[1] = uarpNtohl(a6[1]);
        uint64_t result = UARPLayer2LastErrorResponse(v8, a2);
      }
      break;
    case 9:
      uint64_t result = UARPLayer2FriendlyNameResponse(result, a2);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t uarpPlatformAssetDataRequest(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, void *__dst, unsigned __int16 *a7)
{
  uint64_t v8 = *(void *)(a1 + 568);
  if (!v8) {
    return 17;
  }
  while (*(_DWORD *)(v8 + 304) != 1 || *(void *)(v8 + 696) != a2 || *(unsigned __int16 *)(v8 + 44) != a3)
  {
    uint64_t v8 = *(void *)(v8 + 712);
    if (!v8) {
      return 17;
    }
  }
  unsigned int v10 = *(_DWORD *)(v8 + 68);
  if (v10 < a4 + (int)a5) {
    unsigned __int16 v11 = v10 - a5;
  }
  else {
    unsigned __int16 v11 = a4;
  }
  if (v10 >= a5) {
    unsigned __int16 v12 = v11;
  }
  else {
    unsigned __int16 v12 = 0;
  }
  return uarpPlatformEndpointAssetGetBytesAtOffset(a1, a2, v8, __dst, v12, a5, a7);
}

uint64_t uarpPlatformDataTransferResume(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 568);
  if (v4)
  {
    while (1)
    {
      if (!*(_DWORD *)(v4 + 304) && *(void *)(v4 + 696) == a2)
      {
        uint64_t result = uarpPlatformAssetRequestData(a1, v4, v4 + 312);
        if (result) {
          break;
        }
      }
      uint64_t v4 = *(void *)(v4 + 712);
      if (!v4) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    return UARPLayer2DataTransferResume(a1, a2);
  }
  return result;
}

uint64_t uarpPlatformAssetRescinded(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(result + 568);
  if (a3 == 0xFFFF)
  {
    if (!v4) {
      return uarpPlatformAssetRescind(result, a2, v4);
    }
    uint64_t v5 = *(void *)(result + 568);
    do
    {
      if (!*(_DWORD *)(v5 + 304) && *(void *)(v5 + 696) == a2) {
        *(unsigned char *)(v5 + 72) = 1;
      }
      uint64_t v5 = *(void *)(v5 + 712);
    }
    while (v5);
  }
  if (v4)
  {
    while (*(_DWORD *)(v4 + 304) || *(void *)(v4 + 696) != a2 || *(unsigned __int16 *)(v4 + 44) != a3)
    {
      uint64_t v4 = *(void *)(v4 + 712);
      if (!v4) {
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    if (a3 != 0xFFFF) {
      return result;
    }
    uint64_t v4 = 0;
  }
  return uarpPlatformAssetRescind(result, a2, v4);
}

uint64_t uarpAssetProcessingComplete(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a2)
  {
    uint64_t v8 = uarpAllocPrepareTransmitBuffer2(a1, a2, 9u, 0xAu, 1);
    if (v8)
    {
      uint64_t v9 = (uint64_t)v8;
      uint64_t v10 = v8[2];
      *(_WORD *)(v10 + 6) = uarpHtons(*(unsigned __int16 *)(a3 + 44));
      *(_WORD *)(v10 + 8) = uarpHtons(a4);
      return uarpTransmitBuffer2(a1, a2, v9);
    }
    else
    {
      return 11;
    }
  }
  else if (a4 == 3)
  {
    return 0;
  }
  else
  {
    return 13;
  }
}

uint64_t uarpOfferAssetToRemoteEP(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 5u, 0x24u, 1);
  if (!v6) {
    return 11;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_DWORD *)(v8 + 6) = uarpTagStructPack32((unsigned int *)(a3 + 48));
  *(_WORD *)(v8 + 10) = uarpHtons(*(unsigned __int16 *)(a3 + 46));
  *(_WORD *)(v8 + 12) = uarpHtons(*(unsigned __int16 *)(a3 + 44));
  uarpVersionEndianSwap((unsigned int *)(a3 + 52), (_DWORD *)(v8 + 14));
  *(_DWORD *)(v8 + 30) = uarpHtonl(*(_DWORD *)(a3 + 68));
  *(_WORD *)(v8 + 34) = uarpHtons(*(unsigned __int16 *)(a3 + 448));

  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpAssetRescind(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xCu, 8u, 1);
  if (!v6) {
    return 11;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_WORD *)(v8 + 6) = uarpHtons(a3);

  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpSolicitDynamicAsset(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  unsigned int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x11u, 0xAu, 1);
  if (!v6) {
    return 11;
  }
  *(_DWORD *)(v6[2] + 6) = *a3;

  return uarpTransmitBuffer2(a1, a2, (uint64_t)v6);
}

uint64_t uarpPlatformFindPreparedAsset(uint64_t a1, uint64_t a2, uint64_t a3, char a4, unsigned __int8 *a5)
{
  if ((a4 & 2) == 0) {
    return 0;
  }
  for (uint64_t result = *(void *)(a1 + 568); result; uint64_t result = *(void *)(result + 712))
  {
    if (!*(_DWORD *)(result + 304)
      && *(void *)(result + 696) == a2
      && !*(_WORD *)(result + 44)
      && *(unsigned __int8 *)(result + 48) == *a5
      && *(unsigned __int8 *)(result + 49) == a5[1]
      && *(unsigned __int8 *)(result + 50) == a5[2]
      && *(unsigned __int8 *)(result + 51) == a5[3])
    {
      break;
    }
  }
  return result;
}

uint64_t uarpPlatformCreateRxAsset(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  int v4 = UARPLayer2RequestBuffer(a1, &v6, 0x2D8u);
  uint64_t result = 0;
  if (!v4)
  {
    uint64_t result = v6;
    if (v6)
    {
      *(void *)(v6 + 696) = a2;
      *(_DWORD *)(result + 304) = 0;
      *(void *)(result + 712) = *(void *)(a1 + 568);
      *(void *)(a1 + 568) = result;
    }
  }
  return result;
}

BOOL uarpPlatformCompareHash(uint64_t a1, void *__s1, size_t __n, void *__s2, int a5)
{
  if (!*(void *)(a1 + 376)) {
    return 1;
  }
  if (__n == a5) {
    return memcmp(__s1, __s2, __n) == 0;
  }
  return 0;
}

uint64_t uarpAssetQueueSolicitation(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!*(void *)(a2 + 80)) {
    return 1;
  }
  if (!*(_WORD *)(a2 + 28)) {
    return 2;
  }
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  while (uarpAssetTagIsValid((unsigned char *)(*(void *)(a2 + 80) + v5)))
  {
    ++v6;
    v5 += 4;
    if (v6 >= *(unsigned __int16 *)(a2 + 28)) {
      return 2;
    }
  }
  *(_DWORD *)(*(void *)(a2 + 80) + 4 * v6) = *a3;
  return v6 == 0;
}

uint64_t uarpPlatformEndpointSendMessageCompleteInternal(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v3 = *(unsigned __int16 *)(a2 + 112);
        if (*(_WORD *)(a2 + 112))
        {
          for (uint64_t i = *(uint64_t **)(a2 + 120); ; ++i)
          {
            uint64_t v5 = *i;
            if (*i)
            {
              if (*(void *)v5 == a3) {
                break;
              }
            }
            if (!--v3) {
              return result;
            }
          }
          *(unsigned char *)(v5 + 32) = 0;
          if (!*(_WORD *)(a2 + 18) || !*(unsigned char *)(v5 + 31)) {
            return uarpTransmitQueuePendingEntryComplete(result, a2, v5);
          }
        }
      }
    }
  }
  return result;
}

uint64_t UARPPlatformDownstreamEndpointByID(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = 0;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(unsigned int *)(a1 + 556);
    if (v5)
    {
      for (uint64_t i = *(uint64_t **)(a1 + 560); ; ++i)
      {
        uint64_t result = *i;
        if (*i)
        {
          if (*(void *)(result + 176) == a2 && *(unsigned __int16 *)(result + 136) == a3) {
            break;
          }
        }
        if (!--v5) {
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t UARPPlatformDownstreamEndpointByDelegate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 0;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(unsigned int *)(a1 + 556);
    if (v5)
    {
      for (uint64_t i = *(uint64_t **)(a1 + 560); ; ++i)
      {
        uint64_t result = *i;
        if (*(void *)(*i + 176) == a2 && *(void *)(result + 40) == a3) {
          break;
        }
        if (!--v5) {
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t uarpPlatformDownstreamEndpointSendMessageInternal(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, unsigned int a5)
{
  return uarpTransmitBufferUpstream(a1, a2, *(unsigned __int16 *)(a3 + 136), a4, a5);
}

uint64_t uarpPlatformRemoteEndpointAddEntry(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a1 + 556);
  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 560);
    uint64_t v6 = *(unsigned int *)(a1 + 556);
    while (*v5)
    {
      ++v5;
      if (!--v6) {
        goto LABEL_5;
      }
    }
    uint64_t result = 0;
    void *v5 = a2;
  }
  else
  {
LABEL_5:
    int v7 = v4 + 1;
    uint64_t v11 = 0;
    uint64_t result = UARPLayer2RequestBuffer(a1, &v11, 8 * (v4 + 1));
    if (!result)
    {
      uint64_t v9 = *(unsigned int *)(a1 + 556);
      if (v9)
      {
        uint64_t v10 = 0;
        do
        {
          *(void *)(v11 + v10) = *(void *)(*(void *)(a1 + 560) + v10);
          v10 += 8;
        }
        while (8 * v9 != v10);
      }
      else
      {
        uint64_t v9 = 0;
      }
      *(void *)(v11 + 8 * v9) = a2;
      UARPLayer2ReturnBuffer(a1, *(void **)(a1 + 560));
      uint64_t result = 0;
      *(_DWORD *)(a1 + 556) = v7;
      *(void *)(a1 + 560) = v11;
    }
  }
  return result;
}

uint64_t uarpPlatformRemoteEndpointAlloc(uint64_t a1)
{
  uint64_t v4 = 0;
  int v2 = UARPLayer2RequestBuffer(a1, &v4, 0xB8u);
  uint64_t result = 0;
  if (!v2)
  {
    if (uarpPlatformRemoteEndpointAddEntry(a1, v4)) {
      return 0;
    }
    else {
      return v4;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetApproveOfferVersion(uint64_t a1, uint64_t a2)
{
  if (*(_WORD *)(a2 + 46) != 1 || !*(unsigned char *)(a1 + 32)) {
    return 0;
  }
  uint64_t v3 = (_DWORD *)(a2 + 52);
  int v4 = uarpVersionCompare((_DWORD *)(a1 + 138), (_DWORD *)(a2 + 52));
  if (v4 == 2) {
    return 59;
  }
  if (!v4) {
    return 60;
  }
  int v6 = uarpVersionCompare((_DWORD *)(a1 + 154), v3);
  if (v6) {
    unsigned int v7 = 0;
  }
  else {
    unsigned int v7 = 62;
  }
  if (v6 == 2) {
    return 61;
  }
  else {
    return v7;
  }
}

uint64_t uarpPlatformEndpointSendSyncMsg(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    uint64_t v5 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0, 6u, *(_DWORD *)(a1 + 552) != 0);
    if (v5)
    {
      return uarpTransmitBuffer2(a1, a2, (uint64_t)v5);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t uarpSendVersionDiscoveryRequest(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    unsigned int v7 = uarpAllocPrepareTransmitBuffer2(a1, a2, 1u, 8u, 1);
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      uint64_t v9 = v7[2];
      if (a3 >= 4) {
        unsigned int v10 = 4;
      }
      else {
        unsigned int v10 = a3;
      }
      *(_WORD *)(a2 + 48) = v10;
      *(_WORD *)(v9 + 6) = uarpHtons(v10);
      return uarpTransmitBuffer2(a1, a2, v8);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t uarpSendVersionDiscoveryResponse(uint64_t a1, uint64_t a2, __int16 a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    *(_WORD *)(a2 + 48) = a3;
    int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 2u, 0xAu, 0);
    if (v6)
    {
      uint64_t v7 = (uint64_t)v6;
      uint64_t v8 = v6[2];
      *(_WORD *)(v8 + 6) = uarpHtons(0);
      *(_WORD *)(v8 + 8) = uarpHtons(*(unsigned __int16 *)(a2 + 48));
      return uarpTransmitBuffer2(a1, a2, v7);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t uarpSendInformationRequest(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 3u, 0xAu, 1);
  if (!v6) {
    return 11;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_DWORD *)(v8 + 6) = uarpHtonl(a3);

  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpSendDataTransferNotificationPause(uint64_t a1, uint64_t a2)
{
  return uarpSendDataTransferNotification(a1, a2, 1u);
}

uint64_t uarpSendDataTransferNotification(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    uint64_t v7 = uarpAllocPrepareTransmitBuffer2(a1, a2, 8u, 8u, 1);
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      uint64_t v9 = v7[2];
      *(_WORD *)(v9 + 6) = uarpHtons(a3);
      return uarpTransmitBuffer2(a1, a2, v8);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t uarpSendDataTransferNotificationResume(uint64_t a1, uint64_t a2)
{
  return uarpSendDataTransferNotification(a1, a2, 2u);
}

uint64_t uarpSendDynamicAssetPreProcessingStatus(uint64_t a1, uint64_t a2, _DWORD *a3, unsigned int a4, int a5)
{
  unsigned int v10 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x13u, 0xCu, 1);
  if (!v10) {
    return 11;
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = v10[2];
  *(_DWORD *)(v12 + 6) = *a3;
  *(_WORD *)(v12 + 10) = uarpHtons(a5 | a4);

  return uarpTransmitBuffer2(a1, a2, v11);
}

uint64_t uarpSendAssetRequestData(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  unsigned int v10 = uarpAllocPrepareTransmitBuffer2(a1, a2, 6u, 0xEu, 1);
  if (!v10) {
    return 11;
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = v10[2];
  *(_WORD *)(v12 + 6) = uarpHtons(a3);
  *(_DWORD *)(v12 + 8) = uarpHtonl(a4);
  if (a5 >= 0xFFFF) {
    unsigned int v13 = 0xFFFF;
  }
  else {
    unsigned int v13 = a5;
  }
  *(_WORD *)(v12 + 12) = uarpHtons(v13);

  return uarpTransmitBuffer2(a1, a2, v11);
}

uint64_t uarpSendVendorSpecific(uint64_t a1, uint64_t a2, __int16 *a3, unsigned int a4, const void *a5, unsigned int a6)
{
  if (!a2) {
    return 13;
  }
  uint64_t v12 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xFFFFu, (unsigned __int16)(a6 + 11), a4 == 32);
  if (!v12) {
    return 11;
  }
  uint64_t v13 = (uint64_t)v12;
  uint64_t v14 = v12[2];
  __int16 v15 = *a3;
  *(unsigned char *)(v14 + 8) = *((unsigned char *)a3 + 2);
  *(_WORD *)(v14 + 6) = v15;
  *(_WORD *)(v14 + 9) = uarpHtons(a4);
  if (a5 && a6) {
    memcpy((void *)(v14 + 11), a5, a6);
  }

  return uarpTransmitBuffer2(a1, a2, v13);
}

uint64_t uarpSendDownstreamEndpointDiscovery(uint64_t a1, uint64_t a2)
{
  int v4 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x15u, 6u, 1);
  if (!v4) {
    return 11;
  }

  return uarpTransmitBuffer2(a1, a2, (uint64_t)v4);
}

uint64_t uarpSendDownstreamEndpointReachable(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x17u, 8u, 1);
  if (!v6) {
    return 11;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_WORD *)(v8 + 6) = uarpHtons(a3);

  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpSendDownstreamEndpointUnreachable(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x19u, 8u, 1);
  if (!v6) {
    return 11;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_WORD *)(v8 + 6) = uarpHtons(a3);

  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpTransmitBufferUpstream(uint64_t a1, uint64_t a2, unsigned int a3, const void *a4, unsigned int a5)
{
  unsigned int v10 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Bu, (unsigned __int16)(a5 + 8), 1);
  if (!v10) {
    return 11;
  }
  uint64_t v11 = v10;
  uint64_t v12 = v10[2];
  *(_WORD *)(v12 + 6) = uarpHtons(a3);
  memcpy((void *)(v12 + 8), a4, a5);

  return uarpTransmitBuffer2(a1, a2, v11);
}

uint64_t uarpPlatformEndpointRecvMessage(uint64_t a1, uint64_t a2, unsigned __int16 *a3, unsigned int a4)
{
  uint64_t v4 = 30;
  if (!a1 || !a2 || !a3) {
    return v4;
  }
  UARPLayer2LogPacket(a1, a2);
  if (a4 < 6) {
    return 9;
  }
  *a3 = uarpNtohs(*a3);
  a3[1] = uarpNtohs(a3[1]);
  unsigned __int16 v9 = uarpNtohs(a3[2]);
  a3[2] = v9;
  *(_WORD *)(a2 + 60) = v9;
  if (a3[1] + 6 != a4) {
    return 9;
  }
  uint64_t v4 = 1;
  *(unsigned char *)(a1 + 580) = 1;
  switch(*a3)
  {
    case 0u:
      if (!*(_DWORD *)(a1 + 552))
      {
        uarpPlatformEndpointSendSyncMsg(a1, a2);
        goto LABEL_183;
      }
      unsigned int v12 = *(unsigned __int16 *)(a2 + 112);
      if (!*(_WORD *)(a2 + 112)) {
        goto LABEL_165;
      }
      uint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *(void *)(*(void *)(a2 + 120) + 8 * v13);
        if (v14)
        {
          if (!uarpNtohs(**(unsigned __int16 **)(v14 + 16)))
          {
            UARPLayer2WatchdogCancel(a1, a2);
            uarpTransmitQueuePendingEntryComplete(a1, a2, v14);
LABEL_165:
            *(void *)(a2 + 146) = 0;
            *(void *)(a2 + 138) = 0;
            *(void *)(a2 + 162) = 0;
            *(void *)(a2 + 154) = 0;
            int v123 = *(_DWORD *)(a1 + 552);
            if (v123 == 1
              || v123 == 2
              && !uarpPlatformEndpointIsMessageTypePending(a1, a2, 1)
              && *(void *)(a1 + 296))
            {
              uarpSendVersionDiscoveryRequest(a1, a2, *(unsigned __int16 *)(a2 + 12));
            }
            if (*(unsigned char *)(a2 + 14) == 1) {
              uarpPlatformReOfferFirmware(a1, a2);
            }
            goto LABEL_183;
          }
          unsigned int v12 = *(unsigned __int16 *)(a2 + 112);
        }
        if (++v13 >= (unint64_t)v12) {
          goto LABEL_165;
        }
      }
    case 1u:
      if (a4 < 8) {
        goto LABEL_94;
      }
      unsigned int v15 = uarpNtohs(a3[3]);
      unsigned int v16 = *(unsigned __int16 *)(a1 + 12);
      if (v15 < v16) {
        unsigned int v16 = v15;
      }
      if (v16 <= 1) {
        __int16 v17 = 1;
      }
      else {
        __int16 v17 = v16;
      }
      *(_WORD *)(a2 + 48) = v17;
      UARPLayer2ProtocolVersion(a1, a2);
      uarpSendVersionDiscoveryResponse(a1, a2, *(_WORD *)(a2 + 48));
      goto LABEL_183;
    case 2u:
      if (a4 < 0xA) {
        goto LABEL_94;
      }
      int v18 = uarpNtohs(a3[3]);
      a3[3] = v18;
      if (v18)
      {
        uint64_t v4 = 2;
        goto LABEL_184;
      }
      unsigned int v118 = uarpNtohs(a3[4]);
      if (v118 <= 1) {
        unsigned int v119 = 1;
      }
      else {
        unsigned int v119 = v118;
      }
      if (v119 >= 4) {
        LOWORD(v119) = 4;
      }
      *(_WORD *)(a2 + 48) = v119;
      unsigned int v120 = *(unsigned __int16 *)(a2 + 112);
      if (!*(_WORD *)(a2 + 112)) {
        goto LABEL_182;
      }
      uint64_t v121 = 0;
      break;
    case 3u:
      if (a4 < 0xA) {
        goto LABEL_94;
      }
      int v19 = uarpAllocPrepareTransmitBuffer2(a1, a2, 4u, 0x10u, 0);
      if (!v19) {
        goto LABEL_147;
      }
      unsigned int v20 = v19;
      uint64_t v21 = v19[2];
      *(_DWORD *)(v21 + 8) = uarpNtohl(*(_DWORD *)(a3 + 3));
      *(_DWORD *)(v21 + 12) = *((_DWORD *)v20 + 6) - 16;
      int updated = uarpCallbackUpdateInformationTLV((void *)a1, a2, (_DWORD *)(v21 + 8));
      unsigned __int16 v23 = updated;
      if (updated)
      {
        __int16 v24 = 16;
      }
      else
      {
        __int16 v124 = *(_WORD *)(v21 + 12);
        *(_WORD *)(v21 + 2) = uarpHtons((unsigned __int16)(v124 + 10));
        *(_DWORD *)(v21 + 8) = uarpHtonl(*(_DWORD *)(v21 + 8));
        *(_DWORD *)(v21 + 12) = uarpHtonl(*(_DWORD *)(v21 + 12));
        __int16 v24 = v124 + 16;
      }
      *(_WORD *)(v21 + 6) = uarpHtons(v23);
      *((_WORD *)v20 + 14) = v24;
      goto LABEL_175;
    case 4u:
      if (a4 < 8) {
        goto LABEL_94;
      }
      uint64_t v25 = uarpNtohs(a3[3]);
      int v26 = uarpNtohl(*((_DWORD *)a3 + 2));
      unsigned int v27 = uarpNtohl(*((_DWORD *)a3 + 3));
      uarpPlatformResponseAccessoryInfo(a1, a2, v25, v26, v27, (unsigned int *)a3 + 4);
      goto LABEL_183;
    case 5u:
      if (a4 < 0x24) {
        goto LABEL_94;
      }
      unsigned int v130 = 0;
      uarpTagStructUnpack32(*(unsigned int *)(a3 + 3), &v130);
      unsigned int v28 = uarpNtohs(a3[5]);
      uint64_t v29 = uarpNtohs(a3[6]);
      *(_OWORD *)CFStringRef v129 = 0uLL;
      uarpVersionEndianSwap((unsigned int *)(a3 + 7), v129);
      unsigned int v30 = uarpNtohl(*(_DWORD *)(a3 + 15));
      unsigned int v31 = uarpNtohs(a3[17]);
      int v32 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xDu, 0x24u, 0);
      if (!v32) {
        goto LABEL_147;
      }
      uint64_t v33 = (uint64_t)v32;
      uint64_t v34 = v32[2];
      *(_DWORD *)(v34 + 6) = uarpTagStructPack32(&v130);
      *(_WORD *)(v34 + 10) = uarpHtons(v28);
      *(_WORD *)(v34 + 12) = uarpHtons(v29);
      uarpVersionEndianSwap(v129, (_DWORD *)(v34 + 14));
      *(_DWORD *)(v34 + 30) = uarpHtonl(v30);
      *(_WORD *)(v34 + 34) = uarpHtons(v31);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v33);
      if (v4) {
        goto LABEL_184;
      }
      uint64_t v35 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v29);
      if (v35 && !*(_DWORD *)(v35 + 8)) {
        goto LABEL_183;
      }
      uint64_t PreparedAsset = uarpPlatformFindPreparedAsset(a1, a2, v29, v28, (unsigned __int8 *)&v130);
      if (!PreparedAsset)
      {
        uint64_t PreparedAsset = uarpPlatformCreateRxAsset(a1, a2);
        if (!PreparedAsset) {
          goto LABEL_147;
        }
      }
      *(void *)(PreparedAsset + 452) = -1;
      *(_DWORD *)(PreparedAsset + 448) = uarpNtohs(a3[17]);
      *(_WORD *)(PreparedAsset + 44) = v29;
      *(_WORD *)(PreparedAsset + 46) = v28;
      *(_DWORD *)(PreparedAsset + 48) = v130;
      *(_OWORD *)(PreparedAsset + 52) = *(_OWORD *)v129;
      *(_DWORD *)(PreparedAsset + 68) = uarpNtohl(*(_DWORD *)(a3 + 15));
      __int16 v37 = *(_WORD *)(PreparedAsset + 46);
      if (v37)
      {
        UARPLayer2SuperBinaryOffered(a1, a2);
      }
      else
      {
        if ((v37 & 2) == 0)
        {
          uint64_t v4 = 22;
          goto LABEL_184;
        }
        UARPLayer2DynamicAssetOffered(a1, a2);
      }
      goto LABEL_183;
    case 6u:
      if (a4 < 0xE) {
        goto LABEL_94;
      }
      unsigned int v38 = uarpNtohs(a3[6]);
      if (*(_DWORD *)a2 >= v38) {
        unsigned __int16 v39 = v38;
      }
      else {
        unsigned __int16 v39 = *(_DWORD *)a2;
      }
      LOWORD(v129[0]) = v39;
      uint64_t v40 = uarpNtohl(*((_DWORD *)a3 + 2));
      int v41 = uarpNtohs(a3[3]);
      uint64_t v42 = uarpAllocPrepareTransmitBuffer2(a1, a2, 7u, (unsigned __int16)(v39 + 18), 0);
      if (!v42) {
        goto LABEL_147;
      }
      unsigned int v20 = v42;
      uint64_t v43 = v42[2];
      unsigned __int16 v44 = uarpPlatformAssetDataRequest(a1, a2, v41, v39, v40, (void *)(v43 + 18), (unsigned __int16 *)v129);
      *(_WORD *)(v43 + 6) = uarpHtons(v44);
      *(_WORD *)(v43 + 8) = a3[3];
      *(_DWORD *)(v43 + 10) = *((_DWORD *)a3 + 2);
      *(_WORD *)(v43 + 14) = a3[6];
      *(_WORD *)(v43 + 16) = uarpHtons(LOWORD(v129[0]));
      __int16 v45 = LOWORD(v129[0]) + 18;
      *(_WORD *)(v43 + 2) = uarpHtons((unsigned __int16)(LOWORD(v129[0]) + 12));
      *((_WORD *)v20 + 14) = v45;
LABEL_175:
      uint64_t v70 = a1;
      uint64_t v71 = a2;
      uint64_t v72 = (uint64_t)v20;
LABEL_176:
      uint64_t v11 = uarpTransmitBuffer2(v70, v71, v72);
      goto LABEL_177;
    case 7u:
      if (a4 < 0x12) {
        goto LABEL_94;
      }
      int v46 = uarpNtohs(a3[4]);
      uint64_t v47 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v46);
      if (!v47) {
        goto LABEL_149;
      }
      uint64_t v48 = v47;
      uint64_t v49 = uarpNtohs(a3[3]);
      int v50 = uarpNtohl(*(_DWORD *)(a3 + 5));
      int v51 = uarpNtohs(a3[7]);
      size_t v52 = uarpNtohs(a3[8]);
      unsigned int v53 = uarpPlatformAssetResponseData(a1, v48, v49, a3 + 9, v50, v51, v52);
      if (v53 == 29) {
        uint64_t v4 = 0;
      }
      else {
        uint64_t v4 = v53;
      }
      goto LABEL_184;
    case 8u:
      if (a4 < 8) {
        goto LABEL_94;
      }
      char v54 = uarpNtohs(a3[3]);
      uint64_t v55 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xEu, 8u, 0);
      if (!v55) {
        goto LABEL_147;
      }
      *(_WORD *)(v55[2] + 6) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, (uint64_t)v55);
      if (v4) {
        goto LABEL_184;
      }
      if ((v54 & 1) != 0 && *(unsigned char *)(a2 + 56) == 1)
      {
        *(unsigned char *)(a2 + 56) = 0;
        uint64_t v11 = UARPLayer2DataTransferPause(a1, a2);
        goto LABEL_177;
      }
      if ((v54 & 2) == 0 || *(unsigned char *)(a2 + 56))
      {
        uint64_t v4 = 33;
        goto LABEL_184;
      }
      *(unsigned char *)(a2 + 56) = 1;
      uint64_t v11 = uarpPlatformDataTransferResume(a1, a2);
      goto LABEL_177;
    case 9u:
      if (a4 < 0xA) {
        goto LABEL_94;
      }
      unsigned int v56 = uarpNtohs(a3[3]);
      uint64_t v57 = uarpNtohs(a3[4]);
      uint64_t v58 = uarpPlatformAssetFindByAssetID(a1, a2, 1, v56);
      if (!v58) {
        goto LABEL_183;
      }
      v59 = (void *)v58;
      v129[0] = *(_DWORD *)(v58 + 48);
      __int16 v60 = *(_WORD *)(v58 + 46);
      v61 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xFu, 0xAu, 0);
      if (!v61) {
        goto LABEL_147;
      }
      uint64_t v62 = (uint64_t)v61;
      uint64_t v63 = v61[2];
      *(_WORD *)(v63 + 6) = uarpHtons(v56);
      *(_WORD *)(v63 + 8) = uarpHtons(v57);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v62);
      if (v4) {
        goto LABEL_184;
      }
      uint64_t v4 = UARPLayer2AssetProcessingNotification2(a1, a2, v59, v57);
      if (v4) {
        goto LABEL_184;
      }
      if ((v60 & 2) != 0)
      {
        v64 = *(unsigned __int8 **)(a2 + 80);
        if (v64)
        {
          if (uarp4ccCompare((unsigned __int8 *)v129, v64))
          {
            if (*(_WORD *)(a2 + 28) == 1)
            {
              unint64_t v65 = 0;
            }
            else
            {
              unint64_t v127 = 0;
              do
              {
                *(_DWORD *)(*(void *)(a2 + 80) + 4 * v127) = *(_DWORD *)(*(void *)(a2 + 80) + 4 * v127 + 4);
                unint64_t v65 = *(unsigned __int16 *)(a2 + 28) - 1;
                ++v127;
              }
              while (v127 < v65);
            }
            CFStringRef v128 = *(unsigned char **)(a2 + 80);
            *(_DWORD *)&v128[4 * v65] = 0;
            if (uarpAssetTagIsValid(v128)) {
              goto LABEL_189;
            }
          }
        }
      }
      goto LABEL_183;
    case 0xAu:
      LOWORD(v129[0]) = 0;
      unsigned __int16 v66 = UARPLayer2ApplyStagedAssets(a1, a2);
      uint64_t v4 = 11;
      uint64_t v67 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xBu, 0xAu, 0);
      if (!v67) {
        goto LABEL_184;
      }
      uint64_t v68 = v67;
      uint64_t v69 = v67[2];
      *(_WORD *)(v69 + 6) = uarpHtons(v66);
      *(_WORD *)(v69 + 8) = uarpHtons(LOWORD(v129[0]));
      uint64_t v70 = a1;
      uint64_t v71 = a2;
      uint64_t v72 = (uint64_t)v68;
      goto LABEL_176;
    case 0xBu:
      if (a4 < 0xA) {
        goto LABEL_131;
      }
      uarpNtohs(a3[3]);
      uarpNtohs(a3[4]);
      uint64_t v11 = UARPLayer2ApplyStagedAssetsResponse(a1, a2);
      goto LABEL_177;
    case 0xCu:
      if (a4 < 8) {
        goto LABEL_94;
      }
      int v73 = uarpNtohs(a3[3]);
      int v74 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x10u, 8u, 0);
      if (!v74) {
        goto LABEL_147;
      }
      *(_WORD *)(v74[2] + 6) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, (uint64_t)v74);
      if (!v4) {
        uarpPlatformAssetRescinded(a1, a2, v73);
      }
      goto LABEL_184;
    case 0xDu:
      BOOL v10 = a4 >= 0x24;
      goto LABEL_109;
    case 0xEu:
      if (a4 < 8) {
        goto LABEL_131;
      }
      char v75 = uarpNtohs(a3[3]);
      if (v75)
      {
        uint64_t v11 = UARPLayer2DataTransferPauseAck(a1, a2);
      }
      else
      {
        if ((v75 & 2) == 0)
        {
          uint64_t v4 = 26;
          goto LABEL_184;
        }
        uint64_t v11 = UARPLayer2DataTransferResumeAck(a1, a2);
      }
      goto LABEL_177;
    case 0xFu:
      if (a4 < 0xA) {
        goto LABEL_131;
      }
      int v76 = uarpNtohs(a3[3]);
      uarpNtohs(a3[4]);
      uint64_t v77 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v76);
      if (!v77) {
        goto LABEL_183;
      }
      uint64_t v78 = v77;
      uint64_t v4 = UARPLayer2AssetProcessingNotificationAck(a1, a2, v77);
      *(unsigned char *)(v78 + 72) = 1;
      goto LABEL_184;
    case 0x10u:
      if (a4 < 8) {
        goto LABEL_131;
      }
      int v79 = uarpNtohs(a3[3]);
      if (v79 == 0xFFFF)
      {
        UARPLayer2RescindAllAssetsAck(a1, a2, 0);
        goto LABEL_183;
      }
      uint64_t v80 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v79);
      if (v80)
      {
        UARPLayer2AssetRescindedAck(a1, a2, v80);
        goto LABEL_183;
      }
LABEL_149:
      uint64_t v4 = 17;
      goto LABEL_184;
    case 0x11u:
      if (a4 < 0xA)
      {
LABEL_94:
        uint64_t v4 = 9;
        goto LABEL_184;
      }
      BOOL v108 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x12u, 0xEu, 0);
      if (!v108)
      {
LABEL_147:
        uint64_t v4 = 11;
        goto LABEL_184;
      }
      uint64_t v109 = (uint64_t)v108;
      uint64_t v110 = v108[2];
      *(_DWORD *)(v110 + 6) = uarpHtonl(0);
      *(_DWORD *)(v110 + 10) = *(_DWORD *)(a3 + 3);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v109);
      if (v4) {
        goto LABEL_184;
      }
      v129[0] = *(_DWORD *)(a3 + 3);
      int v111 = uarpAssetQueueSolicitation(a1, a2, v129);
      if (v111 == 1)
      {
LABEL_189:
        UARPLayer2AssetSolicitation(a1, a2);
      }
      else if (v111 == 2)
      {
        uarpSendDynamicAssetPreProcessingStatus(a1, a2, v129, 2u, 3328);
      }
      goto LABEL_183;
    case 0x12u:
      BOOL v10 = a4 >= 0xE;
      goto LABEL_109;
    case 0x13u:
      if (a4 < 0xC) {
        goto LABEL_131;
      }
      unsigned int v81 = uarpNtohs(a3[5]);
      unsigned int v82 = *(_DWORD *)(a3 + 3);
      v129[0] = v82;
      CFNumberRef v83 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x14u, 0xCu, 0);
      if (!v83) {
        goto LABEL_147;
      }
      uint64_t v84 = (uint64_t)v83;
      uint64_t v85 = v83[2];
      *(_DWORD *)(v85 + 6) = v82;
      *(_WORD *)(v85 + 10) = uarpHtons(v81);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v84);
      if (v4) {
        goto LABEL_184;
      }
      uint64_t v86 = uarpPlatformAssetFindByTag(a1, a2, 0, (unsigned __int8 *)v129);
      if (v86)
      {
        *(unsigned char *)(v86 + 72) = 1;
        uint64_t v11 = UARPLayer2AssetPreProcessingNotification(a1, a2, v86);
        goto LABEL_177;
      }
      uint64_t v4 = 3;
      goto LABEL_184;
    case 0x14u:
      if (a4 < 0xC) {
        goto LABEL_131;
      }
      uarpNtohs(a3[5]);
      v129[0] = *(_DWORD *)(a3 + 3);
      uint64_t v87 = uarpPlatformAssetFindByTag(a1, a2, 1, (unsigned __int8 *)v129);
      if (v87)
      {
        *(unsigned char *)(v87 + 72) = 1;
        uint64_t v4 = UARPLayer2AssetPreProcessingNotificationAck(a1, a2, v87);
        if (v4 != 3) {
          goto LABEL_184;
        }
      }
      goto LABEL_183;
    case 0x15u:
      CFNumberRef v88 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x16u, 8u, 0);
      if (!v88) {
        goto LABEL_147;
      }
      uint64_t v89 = (uint64_t)v88;
      uint64_t v90 = v88[2];
      *(_WORD *)(v90 + 6) = uarpHtons(0);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v89);
      if (v4) {
        goto LABEL_184;
      }
      uint64_t v11 = fUarpLayer3DownstreamEndpointDiscovery(a1, a2);
      goto LABEL_177;
    case 0x16u:
      BOOL v10 = a4 >= 8;
      goto LABEL_109;
    case 0x17u:
      if (a4 < 8) {
        goto LABEL_131;
      }
      CFNumberType v92 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x18u, 0xAu, 0);
      if (!v92) {
        goto LABEL_147;
      }
      uint64_t v93 = (uint64_t)v92;
      uint64_t v94 = v92[2];
      *(_WORD *)(v94 + 6) = uarpHtons(0);
      *(_WORD *)(v94 + 8) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v93);
      if (v4) {
        goto LABEL_184;
      }
      uint64_t v95 = uarpPlatformRemoteEndpointAlloc(a1);
      if (!v95) {
        goto LABEL_147;
      }
      CFMutableDictionaryRef v96 = (void *)v95;
      *(_WORD *)(v95 + 136) = uarpNtohs(a3[3]);
      v96[22] = a2;
      uint64_t v4 = fUarpLayer3DownstreamEndpointReachable(a1, a2);
      if (v4) {
        UARPLayer2ReturnBuffer(a1, v96);
      }
      goto LABEL_184;
    case 0x18u:
    case 0x1Cu:
      BOOL v10 = a4 >= 0xA;
LABEL_109:
      int v91 = !v10;
      uint64_t v4 = (8 * v91);
      goto LABEL_184;
    case 0x19u:
      if (a4 < 8) {
        goto LABEL_131;
      }
      int v97 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Au, 0xAu, 0);
      if (!v97) {
        goto LABEL_147;
      }
      uint64_t v98 = (uint64_t)v97;
      int v99 = uarpNtohs(a3[3]);
      uint64_t v100 = UARPPlatformDownstreamEndpointByID(a1, a2, v99);
      uint64_t v101 = *(void *)(v98 + 16);
      if (v100) {
        unsigned int v102 = 0;
      }
      else {
        unsigned int v102 = 58;
      }
      *(_WORD *)(v101 + 6) = uarpHtons(v102);
      *(_WORD *)(v101 + 8) = a3[3];
      uint64_t v103 = uarpTransmitBuffer2(a1, a2, v98);
      uint64_t v4 = v103;
      if (!v100 || v103) {
        goto LABEL_184;
      }
      uint64_t v11 = fUarpLayer3DownstreamEndpointUnreachable(a1, a2);
      goto LABEL_177;
    case 0x1Au:
      if (a4 < 0xA) {
        goto LABEL_131;
      }
      int v104 = uarpHtons(a3[4]);
      if (!UARPPlatformDownstreamEndpointByID(a1, a2, v104)) {
        goto LABEL_194;
      }
      fUarpLayer3DownstreamEndpointReleased(a1, a2);
      goto LABEL_183;
    case 0x1Bu:
      if (a4 < 0xE) {
        goto LABEL_131;
      }
      unsigned int v112 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Cu, 0xAu, 0);
      if (!v112) {
        goto LABEL_147;
      }
      uint64_t v113 = (uint64_t)v112;
      int v114 = uarpNtohs(a3[3]);
      uint64_t v115 = UARPPlatformDownstreamEndpointByID(a1, a2, v114);
      uint64_t v116 = *(void *)(v113 + 16);
      if (v115) {
        unsigned int v117 = 0;
      }
      else {
        unsigned int v117 = 58;
      }
      *(_WORD *)(v116 + 6) = uarpHtons(v117);
      *(_WORD *)(v116 + 8) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v113);
      if (v4) {
        goto LABEL_184;
      }
      if (v115)
      {
        uint64_t v11 = fUarpLayer3DownstreamEndpointRecvMessage(a1, a2, v115);
        goto LABEL_177;
      }
      CFStringRef v126 = *(void (**)(void, uint64_t, const char *, ...))(a1 + 400);
      if (v126) {
        v126(*(void *)(a1 + 544), 8, "UARP.LAYER2 <%s> Cannot find downstream endpoint", "uarpMsgRecvDownstreamEndpointMessage");
      }
      else {
        uarpLogError(8u, "UARP.LAYER2 <%s> Cannot find downstream endpoint", "uarpMsgRecvDownstreamEndpointMessage");
      }
LABEL_194:
      uint64_t v4 = 58;
      goto LABEL_184;
    case 0x1Du:
      CFDataRef v105 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Eu, 8u, 0);
      if (!v105) {
        goto LABEL_147;
      }
      uint64_t v106 = (uint64_t)v105;
      uint64_t v107 = v105[2];
      *(_WORD *)(v107 + 6) = uarpHtons(0);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v106);
      if (!v4) {
        fUarpLayer3NoFirmwareUpdateAvailable(a1, a2);
      }
      goto LABEL_184;
    case 0x1Eu:
      goto LABEL_183;
    default:
      if (*a3 != 0xFFFF) {
        goto LABEL_184;
      }
      if (a4 < 0xB)
      {
LABEL_131:
        uint64_t v4 = 8;
      }
      else
      {
        uarpNtohs(*(unsigned __int16 *)((char *)a3 + 9));
        uint64_t v11 = UARPLayer2VendorSpecificRecvMessage((void *)a1, a2);
LABEL_177:
        uint64_t v4 = v11;
      }
      goto LABEL_184;
  }
  while (1)
  {
    uint64_t v122 = *(void *)(*(void *)(a2 + 120) + 8 * v121);
    if (v122) {
      break;
    }
LABEL_161:
    if (++v121 >= (unint64_t)v120) {
      goto LABEL_182;
    }
  }
  if (uarpNtohs(**(unsigned __int16 **)(v122 + 16)) != 1)
  {
    unsigned int v120 = *(unsigned __int16 *)(a2 + 112);
    goto LABEL_161;
  }
  UARPLayer2WatchdogCancel(a1, a2);
  uarpTransmitQueuePendingEntryComplete(a1, a2, v122);
LABEL_182:
  UARPLayer2ProtocolVersion(a1, a2);
LABEL_183:
  uint64_t v4 = 0;
LABEL_184:
  *a3 = uarpHtons(*a3);
  a3[1] = uarpHtons(a3[1]);
  a3[2] = uarpHtons(a3[2]);
  uarpTransmitQueueProcessRecv(a1, a2, a3, a4);
  *(unsigned char *)(a1 + 580) = 0;
  uarpTransmitQueueService(a1, a2);
  uarpPlatformGarbageCollection(a1, a2);
  return v4;
}

__int16 *uarpOuiAppleGenericFeatures()
{
  uint64_t result = &uarpOuiAppleGenericFeatures_myOui;
  uarpOuiAppleGenericFeatures_myOuuint64_t i = 2492;
  byte_26AA396D5 = 99;
  return result;
}

uint64_t uarpApplePlatformEndpointRecvMessage(uint64_t a1, uint64_t a2, unsigned __int8 *a3, int a4, unsigned int *a5, unsigned int a6)
{
  uint64_t result = 30;
  if (!a1 || !a2 || !a3 || !a5) {
    return result;
  }
  uarpOuiAppleGenericFeatures_myOuuint64_t i = 2492;
  byte_26AA396D5 = 99;
  if (!uarpOuiCompare(a3, (unsigned __int8 *)&uarpOuiAppleGenericFeatures_myOui)) {
    return 9;
  }
  if (a4 != 33)
  {
    if (a4 == 32 && a6 >= 4)
    {
      int v12 = *(_DWORD *)a2;
      uint64_t v13 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xFFFFu, (unsigned __int16)*(_DWORD *)a2, 0);
      if (!v13) {
        return 11;
      }
      uint64_t v14 = (uint64_t)v13;
      uint64_t v15 = v13[2];
      uarpOuiAppleGenericFeatures_myOuuint64_t i = 2492;
      byte_26AA396D5 = 99;
      *(_WORD *)(v15 + 6) = 2492;
      *(unsigned char *)(v15 + 8) = 99;
      *(_WORD *)(v15 + 9) = uarpHtons(0x21u);
      unsigned int v16 = *(void **)(a1 + 40);
      unsigned int v46 = 0;
      unsigned int v17 = uarpNtohl(*a5);
      int v18 = (unint64_t *)(v15 + 23);
      uint64_t v19 = (v12 - 23);
      switch(v17)
      {
        case 1u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[1];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 1;
          goto LABEL_90;
        case 2u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[3];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 2;
          goto LABEL_90;
        case 3u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[5];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 3;
          goto LABEL_90;
        case 4u:
          uint64_t v29 = (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, unsigned int *))v16[7];
          if (!v29) {
            goto LABEL_91;
          }
          unsigned int v30 = v29(*(void *)(a1 + 544), 4, v15 + 23, v19, &v46);
          if (*(unsigned __int16 *)(a2 + 48) < 4u) {
            break;
          }
          unsigned int v31 = v46;
          if (v46 != 8) {
            goto LABEL_74;
          }
LABEL_41:
          *int v18 = uarpHtonll(*v18);
          break;
        case 5u:
          int v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[9];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 5;
          goto LABEL_72;
        case 6u:
          int v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[11];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 6;
          goto LABEL_72;
        case 7u:
          uint64_t v35 = (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, unsigned int *))v16[13];
          if (!v35) {
            goto LABEL_91;
          }
          unsigned int v30 = v35(*(void *)(a1 + 544), 7, v15 + 23, v19, &v46);
          if (*(unsigned __int16 *)(a2 + 48) >= 4u && v46 == 8) {
            goto LABEL_41;
          }
          break;
        case 8u:
          int v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[17];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 8;
          goto LABEL_72;
        case 9u:
          int v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[19];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 9;
          goto LABEL_72;
        case 0xAu:
          int v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[21];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 10;
          goto LABEL_72;
        case 0xBu:
          int v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[23];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 11;
          goto LABEL_72;
        case 0xCu:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[25];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 12;
          goto LABEL_90;
        case 0xDu:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[27];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 13;
          goto LABEL_90;
        case 0xEu:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[29];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 14;
          goto LABEL_90;
        case 0xFu:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[31];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 15;
          goto LABEL_90;
        case 0x10u:
          int v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[33];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 16;
          goto LABEL_72;
        case 0x11u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[35];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 17;
          goto LABEL_90;
        case 0x12u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[37];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 18;
          goto LABEL_90;
        case 0x13u:
          int v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[39];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 19;
          goto LABEL_72;
        case 0x14u:
          int v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[41];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 20;
          goto LABEL_72;
        case 0x15u:
          int v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[43];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 21;
          goto LABEL_72;
        case 0x16u:
          int v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[45];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 22;
LABEL_72:
          unsigned int v30 = v32(v33, v34, v15 + 23, v19, &v46);
          if (*(unsigned __int16 *)(a2 + 48) < 4u) {
            break;
          }
          unsigned int v31 = v46;
LABEL_74:
          if (v31 == 4) {
            *(_DWORD *)int v18 = uarpHtonl(*(_DWORD *)v18);
          }
          break;
        case 0x17u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[47];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 23;
          goto LABEL_90;
        case 0x18u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[49];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 24;
          goto LABEL_90;
        case 0x19u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[51];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 25;
          goto LABEL_90;
        case 0x1Au:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[53];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 26;
          goto LABEL_90;
        case 0x1Bu:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[55];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 27;
          goto LABEL_90;
        case 0x1Cu:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[57];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 28;
          goto LABEL_90;
        case 0x1Du:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[15];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 29;
LABEL_90:
          unsigned int v30 = v20(v21, v22, v15 + 23, v19, &v46);
          break;
        default:
LABEL_91:
          unsigned int v30 = 26;
          break;
      }
      *(_DWORD *)(v15 + 11) = uarpHtonl(v30);
      *(_DWORD *)(v15 + 15) = uarpHtonl(v17);
      *(_DWORD *)(v15 + 19) = uarpHtonl(v46);
      __int16 v36 = v46 + 23;
      *(_WORD *)(v15 + 2) = uarpHtons((unsigned __int16)(v46 + 17));
      *(_WORD *)(v14 + 28) = v36;
      return uarpTransmitBuffer2(a1, a2, v14);
    }
    return 9;
  }
  if (a6 < 4) {
    return 9;
  }
  if (a6 < 0xC) {
    return 8;
  }
  int v23 = uarpNtohl(a5[1]);
  uint64_t v24 = uarpNtohl(a5[2]);
  if ((int)v24 + 12 > a6) {
    return 8;
  }
  uint64_t v25 = v24;
  if (v24) {
    int v26 = (unint64_t *)(a5 + 3);
  }
  else {
    int v26 = 0;
  }
  unsigned int v27 = *(void **)(a1 + 40);
  switch(v23)
  {
    case 1:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[2];
      if (v28) {
        goto LABEL_118;
      }
      return 1;
    case 2:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[4];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 3:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[6];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 4:
      uint64_t v38 = v27[8];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 8);
      if (!v38) {
        return 1;
      }
      if (v24 == 8) {
        goto LABEL_107;
      }
      if (v24 != 4) {
        goto LABEL_117;
      }
      break;
    case 5:
      unsigned __int16 v39 = (void (*)(void, void, unint64_t *, uint64_t))v27[10];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 10);
      unsigned int v28 = v39;
      if (!v39) {
        return 1;
      }
      goto LABEL_115;
    case 6:
      uint64_t v40 = (void (*)(void, void, unint64_t *, uint64_t))v27[12];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 12);
      unsigned int v28 = v40;
      if (!v40) {
        return 1;
      }
      goto LABEL_115;
    case 7:
      int v41 = (void (*)(void, void, unint64_t *, uint64_t))v27[14];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 14);
      unsigned int v28 = v41;
      if (!v41) {
        return 1;
      }
      if (v24 != 8) {
        goto LABEL_118;
      }
LABEL_107:
      *int v26 = uarpNtohll(*v26);
      goto LABEL_117;
    case 8:
      uint64_t v42 = (void (*)(void, void, unint64_t *, uint64_t))v27[18];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 18);
      unsigned int v28 = v42;
      if (!v42) {
        return 1;
      }
      goto LABEL_115;
    case 9:
      uint64_t v43 = (void (*)(void, void, unint64_t *, uint64_t))v27[20];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 20);
      unsigned int v28 = v43;
      if (!v43) {
        return 1;
      }
      goto LABEL_115;
    case 10:
      unsigned __int16 v44 = (void (*)(void, void, unint64_t *, uint64_t))v27[22];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 22);
      unsigned int v28 = v44;
      if (!v44) {
        return 1;
      }
      goto LABEL_115;
    case 11:
      __int16 v45 = (void (*)(void, void, unint64_t *, uint64_t))v27[24];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 24);
      unsigned int v28 = v45;
      if (!v45) {
        return 1;
      }
LABEL_115:
      if (v24 == 4) {
        break;
      }
      goto LABEL_118;
    case 12:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[26];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 13:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[28];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 14:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[30];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 15:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[32];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 16:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[34];
      if (!v28) {
        return 1;
      }
      if (v24 != 4) {
        goto LABEL_118;
      }
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 34);
      break;
    case 17:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[36];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 18:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[38];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 19:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[40];
      if (!v28) {
        return 1;
      }
      if (v24 != 4) {
        goto LABEL_118;
      }
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 40);
      break;
    case 20:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[42];
      if (!v28) {
        return 1;
      }
      if (v24 != 4) {
        goto LABEL_118;
      }
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 42);
      break;
    case 21:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[44];
      if (!v28) {
        return 1;
      }
      if (v24 != 4) {
        goto LABEL_118;
      }
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 44);
      break;
    case 22:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[46];
      if (!v28) {
        return 1;
      }
      if (v24 != 4) {
        goto LABEL_118;
      }
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 46);
      break;
    case 23:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[48];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 24:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[50];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 25:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[52];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 26:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[54];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 27:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[56];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 28:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[58];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 29:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[16];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    default:
      return 1;
  }
  *(_DWORD *)int v26 = uarpNtohl(*(_DWORD *)v26);
LABEL_117:
  unsigned int v28 = *v37;
LABEL_118:
  v28(*(void *)(a1 + 544), *(void *)(a2 + 40), v26, v25);
  return 0;
}

BOOL uarpApplePlatformMessageCheckExpectedResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  if (a6 < 0xB) {
    return 0;
  }
  if (*(unsigned __int16 *)(a5 + 6) != *(unsigned __int16 *)(a3 + 6)
    || *(unsigned __int8 *)(a5 + 8) != *(unsigned __int8 *)(a3 + 8))
  {
    return 0;
  }
  uarpOuiAppleGenericFeatures_myOuuint64_t i = 2492;
  byte_26AA396D5 = 99;
  BOOL v10 = *(_WORD *)(a5 + 6) == 2492 && *(unsigned char *)(a5 + 8) == 99;
  if (!v10 || uarpNtohs(*(unsigned __int16 *)(a5 + 9)) != 33) {
    return 0;
  }
  int v12 = uarpNtohs(*(unsigned __int16 *)(a3 + 9));
  BOOL result = 0;
  if (a6 >= 0x17 && v12 == 32) {
    return *(_DWORD *)(a5 + 15) == *(_DWORD *)(a3 + 11);
  }
  return result;
}

uint64_t uarpApplePlatformMessageCheckValidToSend(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (!v4) {
    return 1;
  }
  uarpOuiAppleGenericFeatures_myOuuint64_t i = 2492;
  byte_26AA396D5 = 99;
  if (*(_WORD *)(a3 + 6) != 2492 || *(unsigned char *)(a3 + 8) != 99) {
    return 1;
  }
  int v11 = uarpNtohs(*(unsigned __int16 *)(a3 + 9));
  uint64_t result = 1;
  if (a4 >= 0xF && v11 == 32)
  {
    if (uarpNtohl(*(_DWORD *)(a3 + 11)) == 2
      && (*(unsigned __int16 *)(a2 + 48) < 2u || *(_DWORD *)(a2 + 24)))
    {
      int v12 = *(void (**)(void, void, void, void))(v4 + 32);
      if (v12) {
LABEL_14:
      }
        v12(*(void *)(a1 + 544), *(void *)(a2 + 40), 0, 0);
    }
    else
    {
      if (uarpNtohl(*(_DWORD *)(a3 + 11)) != 1
        || *(unsigned __int16 *)(a2 + 48) >= 2u && !*(_DWORD *)(a2 + 24))
      {
        return 1;
      }
      int v12 = *(void (**)(void, void, void, void))(v4 + 16);
      if (v12) {
        goto LABEL_14;
      }
    }
    return 0;
  }
  return result;
}

uint64_t uarpApplePlatformMessageExceededRetries(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4 = *(void **)(result + 40);
  if (v4)
  {
    uarpOuiAppleGenericFeatures_myOuuint64_t i = 2492;
    byte_26AA396D5 = 99;
    if (*(_WORD *)(a3 + 6) == 2492 && *(unsigned char *)(a3 + 8) == 99)
    {
      uint64_t v9 = result;
      uint64_t result = uarpHtons(*(unsigned __int16 *)(a3 + 9));
      if (a4 >= 0xF && result == 32)
      {
        uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
        if (result == 1)
        {
          BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[2];
          if (!v10) {
            return result;
          }
        }
        else
        {
          uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
          if (result == 2)
          {
            BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[4];
            if (!v10) {
              return result;
            }
          }
          else
          {
            uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
            if (result == 3)
            {
              BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[6];
              if (!v10) {
                return result;
              }
            }
            else
            {
              uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
              if (result == 4)
              {
                BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[8];
                if (!v10) {
                  return result;
                }
              }
              else
              {
                uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                if (result == 5)
                {
                  BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[10];
                  if (!v10) {
                    return result;
                  }
                }
                else
                {
                  uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                  if (result == 6)
                  {
                    BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[12];
                    if (!v10) {
                      return result;
                    }
                  }
                  else
                  {
                    uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                    if (result == 7)
                    {
                      BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[14];
                      if (!v10) {
                        return result;
                      }
                    }
                    else
                    {
                      uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                      if (result == 29)
                      {
                        BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[16];
                        if (!v10) {
                          return result;
                        }
                      }
                      else
                      {
                        uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                        if (result == 8)
                        {
                          BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[18];
                          if (!v10) {
                            return result;
                          }
                        }
                        else
                        {
                          uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                          if (result == 9)
                          {
                            BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[20];
                            if (!v10) {
                              return result;
                            }
                          }
                          else
                          {
                            uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                            if (result == 10)
                            {
                              BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[22];
                              if (!v10) {
                                return result;
                              }
                            }
                            else
                            {
                              uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                              if (result == 11)
                              {
                                BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[24];
                                if (!v10) {
                                  return result;
                                }
                              }
                              else
                              {
                                uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                if (result == 12)
                                {
                                  BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[26];
                                  if (!v10) {
                                    return result;
                                  }
                                }
                                else
                                {
                                  uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                  if (result == 13)
                                  {
                                    BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[28];
                                    if (!v10) {
                                      return result;
                                    }
                                  }
                                  else
                                  {
                                    uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                    if (result == 14)
                                    {
                                      BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[30];
                                      if (!v10) {
                                        return result;
                                      }
                                    }
                                    else
                                    {
                                      uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                      if (result == 15)
                                      {
                                        BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[32];
                                        if (!v10) {
                                          return result;
                                        }
                                      }
                                      else
                                      {
                                        uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                        if (result == 16)
                                        {
                                          BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[34];
                                          if (!v10) {
                                            return result;
                                          }
                                        }
                                        else
                                        {
                                          uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                          if (result == 17)
                                          {
                                            BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[36];
                                            if (!v10) {
                                              return result;
                                            }
                                          }
                                          else
                                          {
                                            uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                            if (result == 18)
                                            {
                                              BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[38];
                                              if (!v10) {
                                                return result;
                                              }
                                            }
                                            else
                                            {
                                              uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                              if (result == 19)
                                              {
                                                BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[40];
                                                if (!v10) {
                                                  return result;
                                                }
                                              }
                                              else
                                              {
                                                uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                if (result == 20)
                                                {
                                                  BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[42];
                                                  if (!v10) {
                                                    return result;
                                                  }
                                                }
                                                else
                                                {
                                                  uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                  if (result == 21)
                                                  {
                                                    BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[44];
                                                    if (!v10) {
                                                      return result;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                    if (result == 22)
                                                    {
                                                      BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[46];
                                                      if (!v10) {
                                                        return result;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                      if (result == 23)
                                                      {
                                                        BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[48];
                                                        if (!v10) {
                                                          return result;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                        if (result != 24) {
                                                          return result;
                                                        }
                                                        BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[50];
                                                        if (!v10) {
                                                          return result;
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
        }
        uint64_t v11 = *(void *)(v9 + 544);
        uint64_t v12 = *(void *)(a2 + 40);
        return v10(v11, v12, 0, 0);
      }
    }
  }
  return result;
}

uint64_t uarpCompressionHeaderEndianSwap(unsigned __int16 *a1, uint64_t a2)
{
  *(_WORD *)a2 = uarpHtons(*a1);
  *(_DWORD *)(a2 + 2) = uarpHtonl(*(_DWORD *)(a1 + 1));
  *(_WORD *)(a2 + 6) = uarpHtons(a1[3]);
  uint64_t result = uarpHtons(a1[4]);
  *(_WORD *)(a2 + 8) = result;
  return result;
}

char *uarpAssetTagChdr4cc()
{
  uint64_t result = uarpAssetTagChdr4cc_assetTag;
  uarpAssetTagChdr4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagChdr()
{
  uarpAssetTagChdr4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagChdr4cc_assetTag);
}

int *uarpAssetTagStructChdr()
{
  uarpAssetTagChdr4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructChdr_myTag;
  uarpAssetTagStructChdr_myTag = *(_DWORD *)uarpAssetTagChdr4cc_assetTag;
  return result;
}

uint64_t uarpPayloadTagPack(unsigned int *a1)
{
  return *a1;
}

uint64_t uarpPayloadTagUnpack(uint64_t result, char *a2)
{
  unsigned int v2 = result >> 8;
  unsigned int v3 = WORD1(result);
  if (result) {
    char v4 = result;
  }
  else {
    char v4 = 48;
  }
  if (!result)
  {
    LOBYTE(v2) = 48;
    LOBYTE(v3) = 48;
  }
  *a2 = v4;
  a2[1] = v2;
  if (result) {
    char v5 = BYTE3(result);
  }
  else {
    char v5 = 48;
  }
  a2[2] = v3;
  a2[3] = v5;
  return result;
}

unsigned char *uarpPayloadTagStructPack(unsigned char *result, unsigned char *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[2] = result[2];
  a2[3] = result[3];
  return result;
}

unsigned char *uarpPayloadTagStructUnpack(unsigned char *result, unsigned char *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[2] = result[2];
  a2[3] = result[3];
  return result;
}

uint64_t uarpTagStructPack32(unsigned int *a1)
{
  return *a1;
}

uint64_t uarpTagStructUnpack32(uint64_t result, _DWORD *a2)
{
  *a2 = result;
  return result;
}

BOOL uarp4ccCompare(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

BOOL uarpOuiCompare(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

uint64_t uarpVersionCompare(_DWORD *a1, _DWORD *a2)
{
  if (*a1 > *a2) {
    return 2;
  }
  if (*a1 < *a2) {
    return 1;
  }
  unsigned int v2 = a1[1];
  unsigned int v3 = a2[1];
  if (v2 > v3) {
    return 2;
  }
  if (v2 < v3) {
    return 1;
  }
  unsigned int v4 = a1[2];
  unsigned int v5 = a2[2];
  if (v4 > v5) {
    return 2;
  }
  if (v4 < v5) {
    return 1;
  }
  unsigned int v7 = a1[3];
  unsigned int v8 = a2[3];
  BOOL v9 = v7 >= v8;
  BOOL v10 = v7 == v8;
  BOOL v11 = v7 < v8;
  if (!v10 && v9) {
    return 2;
  }
  else {
    return v11;
  }
}

uint64_t uarpAssetCompare(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int16 *)(a1 + 46) == *(unsigned __int16 *)(a2 + 46)
    && *(unsigned __int8 *)(a1 + 48) == *(unsigned __int8 *)(a2 + 48)
    && *(unsigned __int8 *)(a1 + 49) == *(unsigned __int8 *)(a2 + 49)
    && *(unsigned __int8 *)(a1 + 50) == *(unsigned __int8 *)(a2 + 50)
    && *(unsigned __int8 *)(a1 + 51) == *(unsigned __int8 *)(a2 + 51)
    && *(_DWORD *)(a1 + 68) == *(_DWORD *)(a2 + 68)
    && *(_DWORD *)(a1 + 448) == *(_DWORD *)(a2 + 448))
  {
    return uarpVersionCompare((_DWORD *)(a1 + 52), (_DWORD *)(a2 + 52));
  }
  else
  {
    return 3;
  }
}

BOOL uarpAssetTagCompare(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

uint64_t uarpVersionEndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpNtohl(*a1);
  a2[1] = uarpNtohl(a1[1]);
  a2[2] = uarpNtohl(a1[2]);
  uint64_t result = uarpNtohl(a1[3]);
  a2[3] = result;
  return result;
}

const char *uarpStatusCodeToString(unsigned int a1)
{
  if (a1 > 0x3E) {
    return "<unknown>";
  }
  else {
    return off_2655E8938[a1];
  }
}

BOOL uarpAssetTagIsValid(unsigned char *a1)
{
  return *a1 || a1[1] || a1[2] || a1[3];
}

int *uarpAssetTagStructSuperBinary()
{
  uint64_t result = &uarpAssetTagStructSuperBinary_myTag;
  uarpAssetTagStructSuperBinary_myTag = 0;
  return result;
}

const char *uarpApplyFlagsToString(int a1)
{
  if ((a1 - 1) > 5) {
    return "<unknown>";
  }
  else {
    return off_2655E8B30[a1 - 1];
  }
}

const char *uarpProcessingFlagsReasonToString(int a1)
{
  HIDWORD(v2) = a1;
  LODWORD(v2) = a1 - 256;
  unsigned int v1 = v2 >> 8;
  if (v1 > 0xE) {
    return "<unknown>";
  }
  else {
    return off_2655E8B60[v1];
  }
}

const char *uarpProcessingStatusToString(int a1)
{
  if ((a1 - 1) > 4) {
    return "<unknown>";
  }
  else {
    return off_2655E8BD8[(__int16)(a1 - 1)];
  }
}

long long *uarpStageStatusToString(unsigned __int16 a1)
{
  unsigned int v1 = "Upload Denied";
  switch((char)a1)
  {
    case 1:
      strcpy((char *)uarpStageStatusToString_stageStatusString, "Upload Complete");
      return uarpStageStatusToString_stageStatusString;
    case 2:
      goto LABEL_7;
    case 3:
      unsigned int v1 = "Upload Abandoned";
      goto LABEL_7;
    case 4:
      unsigned int v1 = "Asset Corrupt";
      goto LABEL_7;
    case 5:
      unsigned int v1 = "Asset Not Found";
      goto LABEL_7;
    default:
      unsigned int v1 = "<unknown>";
LABEL_7:
      unint64_t v2 = uarpProcessingFlagsReasonToString(a1 & 0xFF00);
      snprintf((char *)uarpStageStatusToString_stageStatusString, 0x100uLL, "%s (%s)", v1, v2);
      return uarpStageStatusToString_stageStatusString;
  }
}

const char *uarpEndpointRoleToString(unsigned int a1)
{
  if (a1 > 2) {
    return "<unknown>";
  }
  else {
    return off_2655E8C48[a1];
  }
}

const char *uarpLoggingCategoryToString(unsigned int a1)
{
  if (a1 > 8) {
    return "<unknown>";
  }
  else {
    return off_2655E8C00[a1];
  }
}

void *uarpProcessPayloadTLVInternal(void *result, uint64_t a2, uint64_t a3, signed int a4, uint64_t a5, unsigned int *a6)
{
  uint64_t v10 = (uint64_t)result;
  if (a4 != -858619624)
  {
    if (a4 == -858619625)
    {
      if (a5 == 2)
      {
        uint64_t v12 = uarpNtohs(*(unsigned __int16 *)a6);
        *(_DWORD *)(a3 + 76) = v12;
        UARPLayer2HashInfo(v10, v12, (_DWORD *)(a3 + 88), (_DWORD *)(a3 + 104));
        unsigned int v13 = *(_DWORD *)(a3 + 88);
        if (!v13 || !UARPLayer2RequestBuffer(v10, (void *)(a3 + 80), v13) && *(void *)(a3 + 80))
        {
          unsigned int v14 = *(_DWORD *)(a3 + 104);
          if (!v14 || !UARPLayer2RequestBuffer(v10, (void *)(a3 + 96), v14) && *(void *)(a3 + 96))
          {
            uint64_t v19 = *(unsigned int *)(a3 + 76);
            uint64_t v20 = *(void *)(a3 + 80);
            return (void *)UARPLayer2HashInit(v10, v19, v20);
          }
        }
        *(_DWORD *)(a3 + 76) = 0;
      }
LABEL_11:
      return (void *)UARPLayer2AssetCorrupt(v10, a2);
    }
    if (*(_DWORD *)(a3 + 76))
    {
      int v22 = uarpHtonl(a4);
      UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(void *)(a3 + 80), (uint64_t)&v22, 4);
      int v21 = uarpHtonl(a5);
      UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(void *)(a3 + 80), (uint64_t)&v21, 4);
      uint64_t result = (void *)UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(void *)(a3 + 80), (uint64_t)a6, a5);
    }
    if (a4 > -858619631)
    {
      if (a4 == -858619630)
      {
        if (a5 == 2)
        {
          uint64_t result = (void *)uarpNtohs(*(unsigned __int16 *)a6);
          *(_DWORD *)(a3 + 56) = result;
          return result;
        }
      }
      else
      {
        if (a4 != -858619623) {
          return result;
        }
        if (a5 == 4)
        {
          uint64_t result = (void *)uarpNtohl(*a6);
          *(_DWORD *)(a3 + 128) = result;
          return result;
        }
      }
    }
    else if (a4 == -858619641)
    {
      *(_DWORD *)(a3 + 72) = a5;
      int v18 = (void **)(a3 + 64);
      if (!UARPLayer2RequestBuffer(v10, (void *)(a3 + 64), a5) && *v18) {
        return memcpy(*v18, a6, *(unsigned int *)(a3 + 72));
      }
    }
    else
    {
      if (a4 != -858619636) {
        return result;
      }
      if (a5 == 4)
      {
        uint64_t result = (void *)uarpNtohl(*a6);
        if (result)
        {
          *(unsigned char *)(a3 + 52) = 1;
          if (!*(void *)(a2 + 656))
          {
            uint64_t result = (void *)UARPLayer2RequestBuffer(v10, (void *)(a2 + 656), *(_DWORD *)(a2 + 648));
            if (*(void *)(a2 + 656))
            {
              *(_DWORD *)(a2 + 664) = *(_DWORD *)(a2 + 648);
              *(unsigned char *)(a2 + 668) = 0;
            }
          }
          return result;
        }
      }
    }
    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }
  *(_DWORD *)(a3 + 120) = a5;
  uint64_t v15 = (void **)(a3 + 112);
  if (UARPLayer2RequestBuffer((uint64_t)result, (void *)(a3 + 112), a5)) {
    goto LABEL_11;
  }
  unsigned int v16 = *v15;
  if (!*v15) {
    goto LABEL_11;
  }
  size_t v17 = *(unsigned int *)(a3 + 120);

  return memcpy(v16, a6, v17);
}

uint64_t uarpAssetSuperBinaryVersionForProtocolVersion(unsigned int a1)
{
  if (a1 < 3) {
    return 2;
  }
  else {
    return 3;
  }
}

uint64_t uarpDownstreamEndpointGetID(uint64_t a1, _WORD *a2)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(_WORD *)(a1 + 136);
    }
  }
  return result;
}

void uarpPrintDataResponseDetails(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, int a6, int a7)
{
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, const char *, ...))(a1 + 408);
  if (v12)
  {
    uint64_t v13 = *(void *)(a1 + 544);
    uint64_t v14 = *(int *)(a1 + 552);
    if (v14 > 2) {
      uint64_t v15 = "<unknown>";
    }
    else {
      uint64_t v15 = off_2655E8C48[v14];
    }
    int v18 = uarpStatusCodeToString(a4);
    v12(v13, 1, "<ROLE=%s> UARP.LAYER2.DATA.RESP status=<%s>, offset=0x%08x, requestedlength=%u, respondedlength=%u", v15, v18, a5, a6, a7);
  }
  else
  {
    uint64_t v16 = *(int *)(a1 + 552);
    if (v16 > 2) {
      size_t v17 = "<unknown>";
    }
    else {
      size_t v17 = off_2655E8C48[v16];
    }
    uint64_t v19 = uarpStatusCodeToString(a4);
    uarpLogInfo(1u, "<ROLE=%s> UARP.LAYER2.DATA.RESP status=<%s>, offset=0x%08x, requestedlength=%u, respondedlength=%u", v17, v19, a5, a6, a7);
  }
  uint64_t v20 = *(void (**)(void, uint64_t, const char *, ...))(a1 + 408);
  if (v20)
  {
    uint64_t v21 = *(int *)(a1 + 552);
    if (v21 > 2) {
      int v22 = "<unknown>";
    }
    else {
      int v22 = off_2655E8C48[v21];
    }
    if (*(unsigned char *)(a3 + 80) == 1) {
      uint64_t v25 = "YES";
    }
    else {
      uint64_t v25 = "NO";
    }
    v20(*(void *)(a1 + 544), 1, "<ROLE=%s> UARP.LAYER2.DATA.RESP Outstanding Data Request <%s>, offset=0x%08x, requestedlength=%u", v22, v25, *(_DWORD *)(a3 + 92), *(_DWORD *)(a3 + 96));
  }
  else
  {
    uint64_t v23 = *(int *)(a1 + 552);
    if (v23 > 2) {
      uint64_t v24 = "<unknown>";
    }
    else {
      uint64_t v24 = off_2655E8C48[v23];
    }
    if (*(unsigned char *)(a3 + 80) == 1) {
      int v26 = "YES";
    }
    else {
      int v26 = "NO";
    }
    uarpLogInfo(1u, "<ROLE=%s> UARP.LAYER2.DATA.RESP Outstanding Data Request <%s>, offset=0x%08x, requestedlength=%u", v24, v26, *(_DWORD *)(a3 + 92), *(_DWORD *)(a3 + 96));
  }
}

uint64_t uarpCopyDefaultInfoString(_DWORD *a1, uint64_t a2)
{
  if (a2 < 7) {
    return 0;
  }
  *(_DWORD *)((char *)a1 + 3) = 1314344782;
  *a1 = 1313558101;
  return a2;
}

void *uarpAllocateTransmitBuffer2(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v12 = 0;
  int v6 = UARPLayer2RequestBuffer(a1, &v12, 0x28u);
  uint64_t result = 0;
  if (!v6)
  {
    unsigned int v8 = *(_DWORD *)a2 + *(unsigned __int16 *)(a2 + 30) + 26;
    if (v8 <= a3) {
      unsigned int v8 = a3;
    }
    unsigned int v11 = v8;
    if (UARPLayer2RequestTransmitMsgBuffer(a1, a2, v12, &v11))
    {
      UARPLayer2ReturnBuffer(a1, v12);
      return 0;
    }
    else
    {
      unsigned int v9 = v11;
      uint64_t result = v12;
      *((_DWORD *)v12 + 2) = v11;
      uint64_t v10 = *(unsigned __int16 *)(a2 + 30);
      result[2] = *result + v10;
      *((_DWORD *)result + 6) = v9 - v10;
      *((_WORD *)result + 14) = 0;
    }
  }
  return result;
}

void *uarpAllocPrepareTransmitBuffer2(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, char a5)
{
  uint64_t v10 = uarpAvailableTransmitBuffer(a1, a2, a4);
  if (v10) {
    goto LABEL_2;
  }
  __int16 v14 = *(_WORD *)(a2 + 96);
  uint64_t v23 = 0;
  unsigned int v15 = 16 * (v14 & 0x7FFF);
  if (UARPLayer2RequestBuffer(a1, &v23, v15)) {
    return 0;
  }
  unsigned __int16 v16 = 2 * v14;
  uint64_t v17 = *(unsigned __int16 *)(a2 + 96);
  if (v17 < v16)
  {
    do
    {
      TransmitBuffer2 = uarpAllocateTransmitBuffer2(a1, a2, 0);
      *(void *)(v23 + 8 * v17++) = TransmitBuffer2;
    }
    while (v16 != v17);
  }
  *(_WORD *)(a2 + 96) = v16;
  UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 104));
  *(void *)(a2 + 104) = v23;
  uint64_t v22 = 0;
  if (UARPLayer2RequestBuffer(a1, &v22, v15)) {
    return 0;
  }
  if (*(_WORD *)(a2 + 112))
  {
    uint64_t v20 = 0;
    uint64_t v21 = 8 * *(unsigned __int16 *)(a2 + 112);
    do
    {
      *(void *)(v22 + v20) = *(void *)(*(void *)(a2 + 120) + v20);
      v20 += 8;
    }
    while (v21 != v20);
  }
  *(_WORD *)(a2 + 112) = v16;
  UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 120));
  *(void *)(a2 + 120) = v22;
  uint64_t v10 = uarpAvailableTransmitBuffer(a1, a2, a4);
  if (v10)
  {
LABEL_2:
    size_t v11 = *((unsigned int *)v10 + 6);
    if (v11 >= a4)
    {
      *((_WORD *)v10 + 14) = a4;
      *((unsigned char *)v10 + 31) = a5;
      bzero((void *)v10[2], v11);
      *(_WORD *)v10[2] = uarpHtons(a3);
      __int16 v12 = uarpHtons((unsigned __int16)(a4 - 6));
      uint64_t v13 = v10[2];
      *(_WORD *)(v13 + 2) = v12;
      *(_WORD *)(v13 + 4) = 0;
      return v10;
    }
    return 0;
  }
  return v10;
}

uint64_t uarpTransmitBuffer2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned __int16 *)(a2 + 112);
  if (v3 >= 2)
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = *(void *)(a2 + 120);
      if (!*(void *)(v5 + v4))
      {
        *(void *)(v5 + v4) = *(void *)(v5 + v4 + 8);
        *(void *)(*(void *)(a2 + 120) + v4 + 8) = 0;
      }
      v4 += 8;
    }
    while (8 * (v3 - 1) != v4);
  }
  if (!v3) {
    return 11;
  }
  for (uint64_t i = *(void **)(a2 + 120); *i; ++i)
  {
    if (!--v3) {
      return 11;
    }
  }
  *uint64_t i = a3;
  uarpTransmitQueueService(a1, a2);
  return 0;
}

uint64_t uarpTransmitQueueService(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int16 *)(a2 + 112);
  if (!*(_WORD *)(a2 + 112)) {
    return 0;
  }
  uint64_t v4 = a1;
  while (1)
  {
    uint64_t v5 = 0;
    while (1)
    {
      while (1)
      {
        uint64_t v6 = *(void *)(*(void *)(a2 + 120) + 8 * v5);
        if (v6) {
          break;
        }
        if (++v5 == v2) {
          return 0;
        }
      }
      if (*(unsigned char *)(v6 + 32) != 1) {
        break;
      }
      ++v5;
      if (*(void *)(v4 + 296)) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = v5 == v2;
      }
      if (v7) {
        return 0;
      }
    }
    if (*(unsigned char *)(v6 + 33) == 1) {
      goto LABEL_21;
    }
    int v8 = uarpNtohs(**(unsigned __int16 **)(v6 + 16));
    if (v8 != 0xFFFF) {
      break;
    }
    a1 = UARPLayer2VendorSpecificCheckValidToSend(v4, a2);
    if (a1) {
      goto LABEL_23;
    }
LABEL_21:
    a1 = uarpTransmitQueuePendingEntryComplete(a1, a2, v6);
    uint64_t v9 = 0;
    int v2 = *(unsigned __int16 *)(a2 + 112);
    if (!*(_WORD *)(a2 + 112)) {
      return v9;
    }
  }
  if (v8 == 3
    && uarpNtohl(*(_DWORD *)(*(void *)(v6 + 16) + 6)) == 9
    && *(unsigned __int16 *)(a2 + 48) <= 2u)
  {
    a1 = UARPLayer2FriendlyNameResponse(v4, a2);
    goto LABEL_21;
  }
LABEL_23:
  if (*(unsigned char *)(a2 + 50) == 1) {
    return 0;
  }
  unsigned int v10 = *(unsigned __int8 *)(v6 + 30);
  if (*(unsigned __int16 *)(a2 + 18) >= v10)
  {
    *(unsigned char *)(v6 + 30) = v10 + 1;
    *(unsigned char *)(v6 + 32) = 1;
    if (*(unsigned char *)(v6 + 31) == 1) {
      UARPLayer2WatchdogSet(v4, a2);
    }
    *(_WORD *)(*(void *)(v6 + 16) + 4) = uarpHtons(*(unsigned __int16 *)(a2 + 58));
    ++*(_WORD *)(a2 + 58);
    uint64_t v9 = UARPLayer2SendMessage(v4, a2, *(const void **)v6, *(unsigned __int16 *)(a2 + 30) + *(unsigned __int16 *)(v6 + 28));
    UARPLayer2LogPacket(v4, a2);
    if (v9)
    {
      *(unsigned char *)(v6 + 32) = 0;
      uarpPlatformEndpointSendMessageCompleteInternal(v4, a2, *(void *)(v6 + 16));
    }
  }
  else
  {
    uint64_t active = uarpNtohs(**(unsigned __int16 **)(v6 + 16));
    switch(active)
    {
      case 0xFFFF:
        uint64_t active = UARPLayer2VendorSpecificExceededRetries(v4, a2);
        break;
      case 3:
        uint64_t active = uarpNtohl(*(_DWORD *)(*(void *)(v6 + 16) + 6));
        switch((int)active)
        {
          case 1:
            uint64_t active = UARPLayer2ManufacturerNameResponse(v4, a2);
            break;
          case 2:
            uint64_t active = UARPLayer2ModelNameResponse(v4, a2);
            break;
          case 3:
            uint64_t active = UARPLayer2SerialNumberResponse(v4, a2);
            break;
          case 4:
            uint64_t active = UARPLayer2HardwareVersionResponse(v4, a2);
            break;
          case 5:
            uint64_t active = UARPLayer2ActiveFirmwareVersionResponse(v4, a2);
            break;
          case 6:
            uint64_t active = UARPLayer2StagedFirmwareVersionResponse(v4, a2);
            break;
          case 7:
            uint64_t active = UARPLayer2StatisticsResponse(v4, a2);
            break;
          case 8:
            uint64_t active = UARPLayer2LastErrorResponse(v4, a2);
            break;
          case 9:
            uint64_t active = UARPLayer2FriendlyNameResponse(v4, a2);
            break;
          default:
            goto LABEL_34;
        }
        break;
      case 1:
        *(_WORD *)(a2 + 48) = 0;
        uint64_t active = UARPLayer2ProtocolVersion(v4, a2);
        break;
    }
LABEL_34:
    uarpTransmitQueuePendingEntryComplete(active, a2, v6);
    uarpTransmitQueueService(v4, a2);
    return 0;
  }
  return v9;
}

uint64_t uarpTransmitQueuePendingEntryComplete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(unsigned __int16 *)(a2 + 112);
  if (*(_WORD *)(a2 + 112))
  {
    uint64_t v4 = *(void **)(a2 + 120);
    uint64_t v5 = *(unsigned __int16 *)(a2 + 112);
    while (!*v4 || *v4 != a3)
    {
      ++v4;
      if (!--v5) {
        goto LABEL_15;
      }
    }
    *uint64_t v4 = 0;
    *(_WORD *)(a3 + 32) = 0;
    *(_DWORD *)(a3 + 28) = 0;
    uint64_t v7 = *(unsigned __int16 *)(a2 + 96);
    if (*(_WORD *)(a2 + 96))
    {
      int v8 = *(void **)(a2 + 104);
      while (*v8)
      {
        ++v8;
        if (!--v7) {
          goto LABEL_15;
        }
      }
      *int v8 = a3;
    }
LABEL_15:
    if (v3 >= 2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = 8 * (v3 - 1);
      do
      {
        uint64_t v11 = *(void *)(a2 + 120);
        if (!*(void *)(v11 + v9))
        {
          *(void *)(v11 + v9) = *(void *)(v11 + v9 + 8);
          *(void *)(*(void *)(a2 + 120) + v9 + 8) = 0;
        }
        v9 += 8;
      }
      while (v10 != v9);
    }
  }
  return 0;
}

uint64_t uarpTransmitQueueProcessRecv(uint64_t a1, uint64_t a2, unsigned __int16 *a3, unsigned __int16 a4)
{
  if (*(_WORD *)(a2 + 112))
  {
    uint64_t v8 = 0;
    uint64_t v9 = (unsigned __int8 *)(a3 + 3);
    uint64_t v10 = (unsigned __int8 *)(a3 + 5);
    int v25 = a4 & 0xFFF8;
    int v11 = a4 & 0xFFF0;
    while (1)
    {
      uint64_t v12 = *(void *)(*(void *)(a2 + 120) + 8 * v8);
      if (!v12) {
        goto LABEL_38;
      }
      int v13 = uarpNtohs(*a3);
      int v14 = uarpNtohs(**(unsigned __int16 **)(v12 + 16));
      if (v13 == 4 && v14 == 3)
      {
        if (!v11) {
          goto LABEL_38;
        }
        int v19 = *((_DWORD *)a3 + 2);
        int v20 = *(_DWORD *)(*(void *)(v12 + 16) + 6);
        goto LABEL_37;
      }
      if (v13 == 7 && v14 == 6)
      {
        if (a4 < 0x12u) {
          goto LABEL_38;
        }
        uint64_t v18 = *(void *)(v12 + 16);
        if (a3[4] != *(unsigned __int16 *)(v18 + 6) || *(_DWORD *)v10 != *(_DWORD *)(v18 + 8)) {
          goto LABEL_38;
        }
        int v19 = a3[7];
        goto LABEL_26;
      }
      if (v13 == 11 && v14 == 10)
      {
LABEL_63:
        uint64_t v23 = UARPLayer2WatchdogCancel(a1, a2);
        uarpTransmitQueuePendingEntryComplete(v23, a2, v12);
        return 0;
      }
      if (v13 == 13 && v14 == 5)
      {
        if (a4 < 0x24u) {
          goto LABEL_38;
        }
        uint64_t v18 = *(void *)(v12 + 16);
        int v19 = a3[6];
LABEL_26:
        int v20 = *(unsigned __int16 *)(v18 + 12);
        goto LABEL_37;
      }
      if (v13 == 14 && v14 == 8) {
        goto LABEL_63;
      }
      if (v13 == 15 && v14 == 9)
      {
        if (a4 < 0xAu) {
          goto LABEL_38;
        }
        goto LABEL_36;
      }
      if (v13 == 16 && v14 == 12)
      {
        if (!v25) {
          goto LABEL_38;
        }
LABEL_36:
        int v19 = *(unsigned __int16 *)v9;
        int v20 = *(unsigned __int16 *)(*(void *)(v12 + 16) + 6);
LABEL_37:
        if (v19 == v20) {
          goto LABEL_63;
        }
        goto LABEL_38;
      }
      if (v13 == 18 && v14 == 17) {
        break;
      }
      if (v13 == 20 && v14 == 19)
      {
        if (a4 < 0xCu) {
          goto LABEL_38;
        }
        uint64_t v21 = (unsigned __int8 *)(*(void *)(v12 + 16) + 6);
        uint64_t v22 = v9;
LABEL_48:
        if (uarpAssetTagCompare(v22, v21)) {
          goto LABEL_63;
        }
        goto LABEL_38;
      }
      if (v13 == 22 && v14 == 21
        || v13 == 24 && v14 == 23
        || v13 == 26 && v14 == 25
        || v13 == 28 && v14 == 27
        || v13 == 30 && v14 == 29
        || v13 == 0xFFFF && v14 == 0xFFFF && UARPLayer2VendorSpecificCheckExpectedResponse(a1, a2) == 1)
      {
        goto LABEL_63;
      }
LABEL_38:
      if (++v8 >= (unint64_t)*(unsigned __int16 *)(a2 + 112)) {
        return 0;
      }
    }
    if (a4 < 0xEu) {
      goto LABEL_38;
    }
    uint64_t v21 = (unsigned __int8 *)(*(void *)(v12 + 16) + 6);
    uint64_t v22 = v10;
    goto LABEL_48;
  }
  return 0;
}

void uarpTransmitQueuesCleanup(uint64_t a1, uint64_t a2)
{
  UARPLayer2WatchdogCancel(a1, a2);
  uint64_t v4 = *(void **)(a2 + 104);
  if (v4)
  {
    unsigned int v5 = *(unsigned __int16 *)(a2 + 96);
    if (*(_WORD *)(a2 + 96))
    {
      unint64_t v6 = 0;
      do
      {
        uint64_t v7 = *(void ***)(*(void *)(a2 + 104) + 8 * v6);
        if (v7)
        {
          UARPLayer2ReturnTransmitMsgBuffer(a1, a2, *v7);
          UARPLayer2ReturnBuffer(a1, v7);
          *(void *)(*(void *)(a2 + 104) + 8 * v6) = 0;
          unsigned int v5 = *(unsigned __int16 *)(a2 + 96);
        }
        ++v6;
      }
      while (v6 < v5);
      uint64_t v4 = *(void **)(a2 + 104);
    }
    UARPLayer2ReturnBuffer(a1, v4);
    *(void *)(a2 + 104) = 0;
    *(_WORD *)(a2 + 96) = 0;
  }
  uint64_t v8 = *(void **)(a2 + 120);
  if (v8)
  {
    unsigned int v9 = *(unsigned __int16 *)(a2 + 112);
    if (*(_WORD *)(a2 + 112))
    {
      unint64_t v10 = 0;
      do
      {
        int v11 = *(void ***)(*(void *)(a2 + 120) + 8 * v10);
        if (v11)
        {
          UARPLayer2ReturnTransmitMsgBuffer(a1, a2, *v11);
          UARPLayer2ReturnBuffer(a1, v11);
          *(void *)(*(void *)(a2 + 120) + 8 * v10) = 0;
          unsigned int v9 = *(unsigned __int16 *)(a2 + 112);
        }
        ++v10;
      }
      while (v10 < v9);
      uint64_t v8 = *(void **)(a2 + 120);
    }
    UARPLayer2ReturnBuffer(a1, v8);
    *(void *)(a2 + 120) = 0;
    *(_WORD *)(a2 + 112) = 0;
  }
}

uint64_t uarpPlatformEndpointIsMessageTypePending(uint64_t a1, uint64_t a2, int a3)
{
  if (!*(_WORD *)(a2 + 112)) {
    return 0;
  }
  uint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = *(void *)(*(void *)(a2 + 120) + 8 * v5);
    if (v6)
    {
      if (uarpNtohs(**(unsigned __int16 **)(v6 + 16)) == a3
        && *(unsigned char *)(*(void *)(*(void *)(a2 + 120) + 8 * v5) + 33) != 1)
      {
        break;
      }
    }
    if (++v5 >= (unint64_t)*(unsigned __int16 *)(a2 + 112)) {
      return 0;
    }
  }
  return 1;
}

void uarpTransmitQueueAssetRescinded(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && *(_WORD *)(a2 + 112))
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(*(void *)(a2 + 120) + 8 * v5);
      if (v6)
      {
        if (uarpNtohs(**(unsigned __int16 **)(v6 + 16)) == 6)
        {
          int v7 = uarpNtohs(*(unsigned __int16 *)(*(void *)(v6 + 16) + 6));
          if (!a3 || v7 == *(unsigned __int16 *)(a3 + 44)) {
            *(unsigned char *)(v6 + 33) = 1;
          }
        }
      }
      ++v5;
    }
    while (v5 < *(unsigned __int16 *)(a2 + 112));
  }
}

void *uarpAvailableTransmitBuffer(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = *(unsigned __int16 *)(a2 + 96);
  if (!*(_WORD *)(a2 + 96)) {
    return 0;
  }
  for (uint64_t i = *(_DWORD ***)(a2 + 104); ; ++i)
  {
    uint64_t v8 = *i;
    if (*i) {
      break;
    }
    if (!--v3) {
      return 0;
    }
  }
  *uint64_t i = 0;
  if (v8[6] >= a3) {
    return v8;
  }
  UARPLayer2ReturnTransmitMsgBuffer(a1, a2, v8);

  return uarpAllocateTransmitBuffer2(a1, a2, a3);
}

void *uarpZalloc(size_t a1)
{
  return calloc(a1, 1uLL);
}

unint64_t uarpHtonll(unint64_t a1)
{
  return bswap64(a1);
}

unint64_t uarpNtohll(unint64_t a1)
{
  return bswap64(a1);
}

uint64_t uarpHtonl(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t uarpNtohl(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t uarpHtons(unsigned int a1)
{
  return __rev16(a1);
}

uint64_t uarpNtohs(unsigned int a1)
{
  return __rev16(a1);
}

uint64_t uarpPlatformDarwinDecompressBuffer(int a1, void *__src, size_t src_size, void *__dst, size_t __n)
{
  compression_algorithm v5 = 1538;
  switch(a1)
  {
    case 0:
      if (src_size != __n) {
        return 51;
      }
      memcpy(__dst, __src, __n);
      return 0;
    case 1:
      goto LABEL_6;
    case 2:
      compression_algorithm v5 = COMPRESSION_LZBITMAP;
      goto LABEL_6;
    case 3:
      compression_algorithm v5 = COMPRESSION_LZ4;
LABEL_6:
      if (compression_decode_buffer((uint8_t *)__dst, __n, (const uint8_t *)__src, src_size, 0, v5) == __n)uint64_t result = 0; {
      else
      }
        uint64_t result = 51;
      break;
    default:
      uint64_t result = 50;
      break;
  }
  return result;
}

uint64_t uarpPlatformDarwinCompressBuffer()
{
  return 50;
}

uint64_t uarpPlatformDarwinHashInfo(uint64_t result, _DWORD *a2, int *a3)
{
  int v3 = result - 1;
  if ((result - 1) > 2)
  {
    int v4 = 0;
    int v5 = 0;
  }
  else
  {
    int v4 = *(_DWORD *)&aH[4 * v3];
    int v5 = 16 * v3 + 32;
  }
  *a2 = v4;
  *a3 = v5;
  return result;
}

uint64_t uarpPlatformDarwinHashInit(uint64_t result, CC_SHA512_CTX *c)
{
  switch(result)
  {
    case 3:
      return CC_SHA512_Init(c);
    case 2:
      return CC_SHA384_Init(c);
    case 1:
      return CC_SHA256_Init((CC_SHA256_CTX *)c);
  }
  return result;
}

uint64_t uarpPlatformDarwinHashUpdate(uint64_t result, CC_SHA512_CTX *c, void *data, CC_LONG len)
{
  switch(result)
  {
    case 3:
      return CC_SHA512_Update(c, data, len);
    case 2:
      return CC_SHA384_Update(c, data, len);
    case 1:
      return CC_SHA256_Update((CC_SHA256_CTX *)c, data, len);
  }
  return result;
}

uint64_t uarpPlatformDarwinHashFinal(uint64_t result, CC_SHA512_CTX *a2, unsigned __int8 *md, int a4)
{
  if (result == 2)
  {
    if (a4 == 48) {
      return CC_SHA384_Final(md, a2);
    }
  }
  else if (result == 1)
  {
    if (a4 == 32) {
      return CC_SHA256_Final(md, (CC_SHA256_CTX *)a2);
    }
  }
  else if (result == 3 && a4 == 64)
  {
    return CC_SHA512_Final(md, a2);
  }
  return result;
}

void uarpLogError(unsigned int a1, char *__format, ...)
{
  va_start(va, __format);
  vsnprintf(uarpLogError_logBuffer, 0x200uLL, __format, va);
  int v3 = uarpLogToken(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    uarpLogError_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

uint64_t uarpLogToken(unsigned int a1)
{
  for (uint64_t i = 0; i != 9; ++i)
  {
    int v3 = uarpLoggingCategoryToString(i);
    uarpLogToken_tokens[i] = os_log_create("com.apple.uarp.embedded", v3);
  }
  if (a1 <= 8) {
    return uarpLogToken_tokens[a1];
  }
  else {
    return MEMORY[0x263EF8438];
  }
}

void uarpLogDebug(unsigned int a1, char *__format, ...)
{
  va_start(va, __format);
  vsnprintf(uarpLogDebug_logBuffer, 0x200uLL, __format, va);
  int v3 = uarpLogToken(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    uarpLogDebug_cold_1(v3);
  }
}

void uarpLogInfo(unsigned int a1, char *__format, ...)
{
  va_start(va, __format);
  uint64_t v6 = *MEMORY[0x263EF8340];
  vsnprintf(uarpLogInfo_logBuffer, 0x200uLL, __format, va);
  int v3 = uarpLogToken(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v5 = uarpLogInfo_logBuffer;
    _os_log_impl(&dword_263DF3000, v3, OS_LOG_TYPE_INFO, "%s\n", buf, 0xCu);
  }
}

void uarpLogFault(unsigned int a1, char *__format, ...)
{
  va_start(va, __format);
  vsnprintf(uarpLogFault_logBuffer, 0x200uLL, __format, va);
  int v3 = uarpLogToken(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    uarpLogFault_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

void uarpPlatformDarwinLogError(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsnprintf(uarpPlatformDarwinLogError_logBuffer, 0x200uLL, a3, &a9);
  uint64_t v10 = uarpLogToken(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    uarpPlatformDarwinLogError_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

void uarpPlatformDarwinLogInfo(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  vsnprintf(uarpPlatformDarwinLogInfo_logBuffer, 0x200uLL, a3, &a9);
  uint64_t v10 = uarpLogToken(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = uarpPlatformDarwinLogInfo_logBuffer;
    _os_log_impl(&dword_263DF3000, v10, OS_LOG_TYPE_INFO, "%s\n", buf, 0xCu);
  }
}

void uarpPlatformDarwinLogDebug(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsnprintf(uarpPlatformDarwinLogDebug_logBuffer, 0x200uLL, a3, &a9);
  uint64_t v10 = uarpLogToken(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    uarpPlatformDarwinLogDebug_cold_1(v10);
  }
}

void uarpPlatformDarwinLogFault(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsnprintf(uarpPlatformDarwinLogFault_logBuffer, 0x200uLL, a3, &a9);
  uint64_t v10 = uarpLogToken(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    uarpPlatformDarwinLogFault_cold_1(v10);
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t UARPSuperBinarySetupHeader(uint64_t a1, uint64_t a2, unsigned int a3, _OWORD *a4, int a5)
{
  uint64_t v9 = (void *)uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  uint64_t result = 30;
  if (a3 >= 2)
  {
    if (v9)
    {
      memset(v14, 0, 44);
      uarpZero(v14, 0x2CuLL);
      *(void *)&v14[0] = 0x2C00000002;
      *(_OWORD *)((char *)v14 + 12) = *a4;
      DWORD1(v14[2]) = 44;
      DWORD2(v14[2]) = 40 * a5;
      HIDWORD(v14[1]) = 40 * a5 + 44;
      DWORD2(v14[0]) = HIDWORD(v14[1]);
      uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v9, (uint64_t)v14, 44, 0);
      if (!result)
      {
        if (a5)
        {
          uint64_t v11 = 44;
          while (1)
          {
            uint64_t v13 = 0;
            memset(v12, 0, sizeof(v12));
            uarpZero(v12, 0x28uLL);
            LODWORD(v12[0]) = 40;
            uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v9, (uint64_t)v12, 40, v11);
            if (result) {
              break;
            }
            uint64_t v11 = (v11 + 40);
            if (!--a5) {
              return 0;
            }
          }
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t UARPSuperBinaryAddMetaData(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5)
{
  uint64_t v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9) {
    return 30;
  }
  uint64_t v10 = (void *)v9;
  unsigned int __dst = 0;
  LOWORD(v18[0]) = 0;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v9, &__dst, 4, 0, (unsigned __int16 *)v18);
  int v12 = result;
  if (LOWORD(v18[0]) == 4) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = 11;
  }
  if (result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v13;
  }
  if (v12 || LOWORD(v18[0]) != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30;
  }
  memset(v18, 0, 44);
  unsigned __int16 v17 = 0;
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v10, v18, 44, 0, &v17);
  if (!result)
  {
    if (v17 == 44)
    {
      uint64_t v14 = (LODWORD(v18[2]) + HIDWORD(v18[1]));
      v16[0] = uarpHtonl(a3);
      v16[1] = uarpHtonl(a4);
      uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, (uint64_t)v16, 8, v14);
      if (!result)
      {
        LODWORD(v18[2]) += 8;
        DWORD2(v18[0]) += 8;
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, a5, (unsigned __int16)a4, (HIDWORD(v18[1]) + LODWORD(v18[2])));
        if (!result)
        {
          LODWORD(v18[2]) += (unsigned __int16)a4;
          DWORD2(v18[0]) += (unsigned __int16)a4;
          return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, (uint64_t)v18, 44, 0);
        }
      }
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t UARPSuperBinaryPreparePayload(uint64_t a1, uint64_t a2, int a3, unsigned int *a4, _OWORD *a5)
{
  uint64_t v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9) {
    return 30;
  }
  uint64_t v10 = (void *)v9;
  unsigned int __dst = 0;
  LOWORD(v16[0]) = 0;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v9, &__dst, 4, 0, (unsigned __int16 *)v16);
  int v12 = result;
  if (LOWORD(v16[0]) == 4) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = 11;
  }
  if (result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v13;
  }
  if (v12 || LOWORD(v16[0]) != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30;
  }
  unsigned __int16 v19 = 0;
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  memset(v16, 0, 44);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v10, v16, 44, 0, &v19);
  if (!result)
  {
    if (v19 != 44) {
      return 11;
    }
    uint64_t v14 = (DWORD1(v16[2]) + 40 * a3);
    uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v10, v17, 40, v14, &v19);
    if (!result)
    {
      if (v19 == 40)
      {
        DWORD1(v17[0]) = uarpTagStructPack32(a4);
        *(_OWORD *)((char *)v17 + 8) = *a5;
        return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, (uint64_t)v17, 40, v14);
      }
      return 11;
    }
  }
  return result;
}

uint64_t UARPSuperBinaryAddPayloadMetaData(uint64_t a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, uint64_t a6)
{
  uint64_t v11 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v11) {
    return 30;
  }
  int v12 = (void *)v11;
  unsigned int __dst = 0;
  LOWORD(v21[0]) = 0;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v11, &__dst, 4, 0, (unsigned __int16 *)v21);
  int v14 = result;
  if (LOWORD(v21[0]) == 4) {
    unsigned int v15 = 0;
  }
  else {
    unsigned int v15 = 11;
  }
  if (result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v15;
  }
  if (v14 || LOWORD(v21[0]) != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30;
  }
  unsigned __int16 v25 = 0;
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  memset(v21, 0, 44);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v12, v21, 44, 0, &v25);
  if (result) {
    return result;
  }
  if (v25 != 44) {
    return 11;
  }
  uint64_t v16 = (DWORD1(v21[2]) + 40 * a3);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v12, &v22, 40, v16, &v25);
  if (result) {
    return result;
  }
  if (v25 != 40) {
    return 11;
  }
  int v17 = DWORD2(v23);
  if (!DWORD2(v23))
  {
    int v17 = DWORD2(v21[0]);
    DWORD2(v23) = DWORD2(v21[0]);
  }
  uint64_t v18 = (HIDWORD(v23) + v17);
  v20[0] = uarpHtonl(a4);
  v20[1] = uarpHtonl(a5);
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v12, (uint64_t)v20, 8, v18);
  if (!result)
  {
    HIDWORD(v23) += 8;
    DWORD2(v21[0]) += 8;
    uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v12, a6, (unsigned __int16)a5, (DWORD2(v23) + HIDWORD(v23)));
    if (!result)
    {
      HIDWORD(v23) += (unsigned __int16)a5;
      DWORD2(v21[0]) += (unsigned __int16)a5;
      uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v12, (uint64_t)&v22, 40, v16);
      if (!result) {
        return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v12, (uint64_t)v21, 44, 0);
      }
    }
  }
  return result;
}

uint64_t UARPSuperBinaryAddPayloadDataLarge(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  unsigned int v10 = 0;
  while (a5)
  {
    if (a5 >= 0xFFFF) {
      unsigned int v11 = 0xFFFF;
    }
    else {
      unsigned int v11 = a5;
    }
    uint64_t result = UARPSuperBinaryAddPayloadData(a1, a2, a3, a4 + v10, v11);
    v10 += v11;
    a5 -= v11;
    if (result) {
      return result;
    }
  }
  return 0;
}

uint64_t UARPSuperBinaryAddPayloadData(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  if (HIWORD(a5)) {
    return 39;
  }
  uint64_t v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9) {
    return 30;
  }
  unsigned int v10 = (void *)v9;
  unsigned int __dst = 0;
  LOWORD(v17[0]) = 0;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v9, &__dst, 4, 0, (unsigned __int16 *)v17);
  int v12 = result;
  if (LOWORD(v17[0]) == 4) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = 11;
  }
  if (result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v13;
  }
  if (v12 || LOWORD(v17[0]) != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30;
  }
  unsigned __int16 v20 = 0;
  uint64_t v19 = 0;
  memset(v18, 0, sizeof(v18));
  memset(v17, 0, 44);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v10, v17, 44, 0, &v20);
  if (result) {
    return result;
  }
  if (v20 != 44) {
    return 11;
  }
  uint64_t v14 = (DWORD1(v17[2]) + 40 * a3);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v10, v18, 40, v14, &v20);
  if (result) {
    return result;
  }
  if (v20 != 40) {
    return 11;
  }
  int v15 = v19;
  if (!v19)
  {
    int v15 = DWORD2(v17[0]);
    LODWORD(v19) = DWORD2(v17[0]);
  }
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, a4, (unsigned __int16)a5, (HIDWORD(v19) + v15));
  if (!result)
  {
    HIDWORD(v19) += a5;
    DWORD2(v17[0]) += a5;
    uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, (uint64_t)v18, 40, v14);
    if (!result) {
      return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, (uint64_t)v17, 44, 0);
    }
  }
  return result;
}

uint64_t UARPSuperBinaryFinalizeHeader(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v3) {
    return 30;
  }
  uint64_t v4 = v3;
  unsigned __int16 v12 = 0;
  unsigned int __dst = 0;
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v3, &__dst, 4, 0, &v12);
  if (result) {
    return result;
  }
  if (v12 != 4) {
    return 11;
  }
  if (__dst < 2) {
    return 30;
  }
  unsigned __int16 v16 = 0;
  uint64_t v15 = 0;
  memset(v14, 0, sizeof(v14));
  memset(v13, 0, 44);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v4, v13, 44, 0, &v16);
  if (result) {
    return result;
  }
  if (v16 != 44) {
    return 11;
  }
  long long v6 = v13[0];
  long long v7 = v13[1];
  *(_OWORD *)(v4 + 28) = *(_OWORD *)((char *)&v13[1] + 12);
  *(_OWORD *)uint64_t v4 = v6;
  *(_OWORD *)(v4 + 16) = v7;
  uarpSuperBinaryHeaderEndianSwap((unsigned int *)v13, v13);
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)v4, (uint64_t)v13, 44, 0);
  if (!result)
  {
    unsigned int v8 = *(_DWORD *)(v4 + 40);
    if (v8 >= 0x28)
    {
      unsigned int v9 = v8 / 0x28;
      uint64_t v10 = *(unsigned int *)(v4 + 36);
      do
      {
        uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v4, v14, 40, v10, &v16);
        if (result) {
          break;
        }
        if (v16 != 40) {
          return 11;
        }
        uarpPayloadHeaderEndianSwap((unsigned int *)v14, v14);
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)v4, (uint64_t)v14, 40, v10);
        if (result) {
          break;
        }
        uint64_t v10 = (v10 + 40);
        --v9;
      }
      while (v9);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t uarpSuperBinaryHeaderEndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  a2[1] = uarpHtonl(a1[1]);
  a2[2] = uarpHtonl(a1[2]);
  a2[3] = uarpHtonl(a1[3]);
  a2[4] = uarpHtonl(a1[4]);
  a2[5] = uarpHtonl(a1[5]);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  a2[9] = uarpHtonl(a1[9]);
  uint64_t result = uarpHtonl(a1[10]);
  a2[10] = result;
  return result;
}

uint64_t uarpPayloadHeaderEndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  a2[2] = uarpHtonl(a1[2]);
  a2[3] = uarpHtonl(a1[3]);
  a2[4] = uarpHtonl(a1[4]);
  a2[5] = uarpHtonl(a1[5]);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  uint64_t result = uarpHtonl(a1[9]);
  a2[9] = result;
  return result;
}

uint64_t uarpPayloadHeader2EndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  uarpVersionEndianSwap(a1 + 2, a2 + 2);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  uint64_t result = uarpHtonl(a1[9]);
  a2[9] = result;
  return result;
}

uint64_t UARPSuperBinaryQueryAssetLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  memset(__dst, 0, 44);
  unsigned __int16 v5 = 0;
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, a2, __dst, 44, 0, &v5);
  if (!result)
  {
    if (v5 == 44)
    {
      uarpSuperBinaryHeaderEndianSwap((unsigned int *)__dst, __dst);
      uint64_t result = 0;
      *a3 = DWORD2(__dst[0]);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t UARPSuperBinaryPrepareDynamicAsset(int a1, char *a2, uint64_t a3, uint64_t a4, int a5)
{
  *(void *)(a2 + 12) = a3;
  *(void *)(a2 + 20) = a4;
  *((_DWORD *)a2 + 2) = 44;
  *(void *)a2 = 0x2C00000002;
  *(_OWORD *)(a2 + 28) = xmmword_263E16C70;
  *((_DWORD *)a2 + 12) = a5;
  *((_DWORD *)a2 + 112) = 0;
  *((void *)a2 + 79) = 0;
  *((void *)a2 + 90) = 0;
  *((_OWORD *)a2 + 42) = 0u;
  return 0;
}

uint64_t UARPSuperBinaryAddSuperBinaryMetaData(uint64_t a1, uint64_t a2, int a3, unsigned int a4, const void *a5)
{
  uint64_t v13 = 0;
  size_t v9 = a4;
  UARPLayer2RequestBuffer(a1, &v13, a4 + 24);
  uint64_t v10 = v13;
  unsigned int v11 = (void *)(v13 + 24);
  *(void *)(v13 + 8) = v13 + 24;
  *(_DWORD *)uint64_t v10 = a3;
  *(_DWORD *)(v10 + 4) = a4;
  memcpy(v11, a5, v9);
  *(void *)(v10 + 16) = *(void *)(a2 + 720);
  *(void *)(a2 + 720) = v10;
  *(_DWORD *)(a2 + 8) += a4 + 8;
  *(_DWORD *)(a2 + 32) += a4 + 8;
  *(_WORD *)(a2 + 46) |= 0x80u;
  return 0;
}

uint64_t UARPSuperBinaryAddPayload(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, const void *a7, unsigned int a8)
{
  return 0;
}

uint64_t UARPSuperBinaryAddPayload2(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, const void *a7, unsigned int a8, char a9)
{
  uint64_t v21 = 0;
  UARPLayer2RequestBuffer(a1, &v21, 0xB8u);
  unsigned __int16 v16 = v21;
  *((void *)v21 + 22) = *(void *)(a2 + 632);
  *(void *)(a2 + 632) = v16;
  uarpZero(v16, 0x28uLL);
  *unsigned __int16 v16 = 40;
  v16[1] = a4;
  *((void *)v16 + 1) = a5;
  *((void *)v16 + 2) = a6;
  v16[9] = a8;
  v16[7] = 0;
  v16[31] = a3;
  if (!a9)
  {
    unsigned __int16 v20 = 0;
    UARPLayer2RequestBuffer(a1, &v20, a8);
    int v17 = v20;
    *((void *)v16 + 17) = v20;
    memcpy(v17, a7, a8);
  }
  *((unsigned char *)v16 + 148) = a9;
  v16[36] = a8;
  *((void *)v16 + 21) = 0;
  *(_DWORD *)(a2 + 8) += a8 + 40;
  *(_DWORD *)(a2 + 40) += 40;
  *(_DWORD *)(a2 + 28) += 40;
  ++*(_DWORD *)(a2 + 448);
  return 0;
}

uint64_t UARPSuperBinaryAppendPayloadMetaData(uint64_t a1, uint64_t a2, int a3, int a4, unsigned int a5, const void *a6)
{
  unsigned int v6 = *(_DWORD *)(a2 + 448);
  uint64_t v7 = *(void *)(a2 + 632);
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    return 11;
  }
  unsigned int v14 = 1;
  while (*(_DWORD *)(v7 + 124) != a3)
  {
    uint64_t v9 = 11;
    if (v14 < v6)
    {
      uint64_t v7 = *(void *)(v7 + 176);
      ++v14;
      if (v7) {
        continue;
      }
    }
    return v9;
  }
  uint64_t v18 = 0;
  UARPLayer2RequestBuffer(a1, &v18, a5 + 24);
  uint64_t v15 = v18;
  unsigned __int16 v16 = (void *)(v18 + 24);
  *(void *)(v18 + 8) = v18 + 24;
  *(_DWORD *)uint64_t v15 = a4;
  *(_DWORD *)(v15 + 4) = a5;
  memcpy(v16, a6, a5);
  uint64_t v9 = 0;
  *(void *)(v15 + 16) = *(void *)(v7 + 168);
  *(void *)(v7 + 168) = v15;
  *(_DWORD *)(v7 + 28) += a5 + 8;
  *(_DWORD *)(a2 + 8) += a5 + 8;
  *(_DWORD *)(a2 + 684) += a5 + 8;
  *(_WORD *)(a2 + 46) |= 8u;
  return v9;
}

uint64_t UARPSuperBinaryAppendPayloadMetaDataBlob(uint64_t a1, uint64_t a2, int a3, const void *a4, unsigned int a5)
{
  unsigned int v5 = *(_DWORD *)(a2 + 448);
  uint64_t v6 = *(void *)(a2 + 632);
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    return 11;
  }
  unsigned int v12 = 1;
  uint64_t result = 11;
  while (*(_DWORD *)(v6 + 124) != a3)
  {
    if (v12 < v5)
    {
      uint64_t v6 = *(void *)(v6 + 176);
      ++v12;
      if (v6) {
        continue;
      }
    }
    return result;
  }
  if (*(void *)(v6 + 152)) {
    return 27;
  }
  UARPLayer2ReturnBuffer(a1, 0);
  *(void *)(v6 + 152) = 0;
  *(_DWORD *)(v6 + 160) = 0;
  UARPLayer2RequestBuffer(a1, 0, a5);
  memcpy(*(void **)(v6 + 152), a4, a5);
  uint64_t result = 0;
  *(_DWORD *)(v6 + 160) = a5;
  *(_DWORD *)(v6 + 28) += a5;
  *(_DWORD *)(a2 + 8) += a5;
  *(_DWORD *)(a2 + 684) += a5;
  *(_WORD *)(a2 + 46) |= 8u;
  return result;
}

uint64_t UARPSuperBinaryBuildMetaData(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t **a4, unsigned int a5, unsigned int *a6)
{
  unsigned int v8 = *a6;
  uint64_t v9 = *a4;
  if (a3)
  {
    uint64_t v11 = a3;
    while (1)
    {
      unsigned int v12 = uarpNtohl(*(_DWORD *)v11);
      uint64_t v13 = uarpNtohl(*(_DWORD *)(v11 + 4));
      v8 += *(_DWORD *)(v11 + 4) + 8;
      if (v8 > a5) {
        return 11;
      }
      *uint64_t v9 = v12 | (unint64_t)(v13 << 32);
      unsigned int v14 = (char *)(v9 + 1);
      memcpy(v14, *(const void **)(v11 + 8), *(unsigned int *)(v11 + 4));
      uint64_t v9 = (unint64_t *)&v14[*(unsigned int *)(v11 + 4)];
      uint64_t v11 = *(void *)(v11 + 16);
      if (!v11) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t result = 0;
    *a6 = v8;
    *a4 = v9;
  }
  return result;
}

uint64_t UARPSuperBinaryFinalizeDynamicAsset(uint64_t a1, uint64_t a2)
{
  uarpSuperBinaryHeaderEndianSwap((unsigned int *)a2, (_DWORD *)a2);
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)a2, a2, 44, 0);
  if (!result)
  {
    uarpSuperBinaryHeaderEndianSwap((unsigned int *)a2, (_DWORD *)a2);
    uint64_t v5 = *(unsigned int *)(a2 + 4);
    unsigned int v6 = *(_DWORD *)(a2 + 32);
    BOOL v7 = (uint64_t *)(a2 + 632);
    unsigned int v8 = *(_DWORD *)(a2 + 448);
    if (v8)
    {
      unsigned int v9 = 0;
      unsigned int v10 = *(_DWORD *)(a2 + 40) + v5 + v6;
      unsigned int v11 = v10 + *(_DWORD *)(a2 + 684);
      unsigned int v12 = (unsigned int **)(a2 + 632);
      while (1)
      {
        uint64_t v13 = *v12;
        v13[6] = v10;
        v13[8] = v11;
        uarpPayloadHeader2EndianSwap(v13, v13);
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)a2, (uint64_t)v13, 40, v5);
        if (result) {
          break;
        }
        uarpPayloadHeader2EndianSwap(v13, v13);
        uint64_t v5 = *v13 + v5;
        v10 += v13[7];
        v11 += v13[9];
        unsigned int v12 = (unsigned int **)(v13 + 44);
        ++v9;
        unsigned int v8 = *(_DWORD *)(a2 + 448);
        if (v9 >= v8)
        {
          unsigned int v6 = *(_DWORD *)(a2 + 32);
          goto LABEL_8;
        }
      }
    }
    else
    {
LABEL_8:
      if (v6)
      {
        unsigned int __dst = 0;
        unsigned int v28 = 0;
        uint64_t result = UARPLayer2RequestBuffer(a1, &__dst, v6);
        if (result) {
          return result;
        }
        unsigned int v27 = (unint64_t *)__dst;
        uint64_t result = UARPSuperBinaryBuildMetaData(result, v14, *(void *)(a2 + 720), &v27, *(_DWORD *)(a2 + 32), &v28);
        if (result) {
          return result;
        }
        uint64_t v15 = __dst;
        *(void *)(a2 + 672) = __dst;
        unsigned int v16 = v28;
        *(_DWORD *)(a2 + 680) = v28;
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)a2, (uint64_t)v15, (unsigned __int16)v16, v5);
        if (result) {
          return result;
        }
        uint64_t v5 = v16 + v5;
        unsigned int v8 = *(_DWORD *)(a2 + 448);
      }
      if (!v8) {
        return 0;
      }
      unsigned int v17 = 0;
      uint64_t v18 = a2 + 632;
      do
      {
        uint64_t v19 = *(void *)v18;
        unsigned int v20 = *(_DWORD *)(*(void *)v18 + 28);
        if (v20)
        {
          unsigned int __dst = 0;
          unsigned int v28 = 0;
          uint64_t result = UARPLayer2RequestBuffer(a1, &__dst, v20);
          if (result) {
            return result;
          }
          uint64_t v21 = __dst;
          unsigned int v27 = (unint64_t *)__dst;
          long long v22 = *(const void **)(v19 + 152);
          if (v22)
          {
            uint64_t v21 = memcpy(__dst, v22, *(unsigned int *)(v19 + 160));
            unsigned int v28 = *(_DWORD *)(v19 + 160);
          }
          uint64_t result = UARPSuperBinaryBuildMetaData((uint64_t)v21, (uint64_t)v22, *(void *)(v19 + 168), &v27, *(_DWORD *)(v19 + 28), &v28);
          if (result) {
            return result;
          }
          long long v23 = __dst;
          *(void *)(v19 + 152) = __dst;
          unsigned int v24 = v28;
          *(_DWORD *)(v19 + 160) = v28;
          uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)a2, (uint64_t)v23, (unsigned __int16)v24, v5);
          if (result) {
            return result;
          }
          uint64_t v5 = v24 + v5;
          unsigned int v8 = *(_DWORD *)(a2 + 448);
        }
        uint64_t v18 = v19 + 176;
        ++v17;
      }
      while (v17 < v8);
      if (v8)
      {
        for (unsigned int i = 0; i < v8; ++i)
        {
          uint64_t v26 = *v7;
          if (!*(unsigned char *)(v26 + 148))
          {
            uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)a2, *(void *)(v26 + 136), *(unsigned __int16 *)(v26 + 144), v5);
            if (result) {
              return result;
            }
            unsigned int v8 = *(_DWORD *)(a2 + 448);
          }
          uint64_t result = 0;
          uint64_t v5 = (*(_DWORD *)(v26 + 144) + v5);
          BOOL v7 = (uint64_t *)(v26 + 176);
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t UARPSuperBinaryGetInternalSuperBinaryMetaData(int a1, uint64_t a2, void *__dst, unsigned int a4, unsigned int a5, unsigned __int16 *a6)
{
  int v7 = *(_DWORD *)(a2 + 32);
  if (v7
    && ((unsigned int v8 = *(_DWORD *)(a2 + 28), v9 = v7 + v8, v10 = a5 >= v8, v11 = a5 - v8, v10) ? (v12 = v9 > a5) : (v12 = 0), v12))
  {
    unsigned __int16 v15 = v7 - v11;
    if (a4 >= v15) {
      unsigned __int16 v13 = v15;
    }
    else {
      unsigned __int16 v13 = a4;
    }
    memcpy(__dst, (const void *)(*(void *)(a2 + 672) + v11), v13);
    uint64_t result = 0;
  }
  else
  {
    unsigned __int16 v13 = 0;
    uint64_t result = 40;
  }
  *a6 = v13;
  return result;
}

uint64_t UARPSuperBinaryGetInternalPayloadMetaData(int a1, uint64_t a2, void *__dst, unsigned int a4, unsigned int a5, unsigned __int16 *a6)
{
  uint64_t v7 = *(void *)(a2 + 632);
  if (!v7)
  {
LABEL_9:
    unsigned __int16 v14 = 0;
    uint64_t result = 40;
    goto LABEL_14;
  }
  while (1)
  {
    int v8 = *(_DWORD *)(v7 + 28);
    if (v8) {
      break;
    }
LABEL_8:
    if (!v7) {
      goto LABEL_9;
    }
  }
  unsigned int v9 = *(_DWORD *)(v7 + 24);
  unsigned int v10 = v8 + v9;
  BOOL v11 = a5 >= v9;
  uint64_t v12 = a5 - v9;
  if (!v11 || v10 <= a5)
  {
    uint64_t v7 = *(void *)(v7 + 176);
    goto LABEL_8;
  }
  unsigned __int16 v16 = v8 - v12;
  if (a4 >= v16) {
    unsigned __int16 v14 = v16;
  }
  else {
    unsigned __int16 v14 = a4;
  }
  memcpy(__dst, (const void *)(*(void *)(v7 + 152) + v12), v14);
  uint64_t result = 0;
LABEL_14:
  *a6 = v14;
  return result;
}

uint64_t uarpPlatformEndpointInit2(char *a1, uint64_t a2, unsigned int a3, long long *a4, const void *a5, uint64_t a6)
{
  return uarpPlatformEndpointInit(a1, a2, a3, a4, a5, a6, 0);
}

uint64_t uarpPlatformEndpointInit(char *a1, uint64_t a2, unsigned int a3, long long *a4, const void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = 30;
  if (a3 <= 2 && a2 && a1 && a4 && a5)
  {
    uarpZero(a1, 0x260uLL);
    memcpy(a1 + 48, a5, 0x1F0uLL);
    *((void *)a1 + 68) = a2;
    *((void *)a1 + 5) = a6;
    *((_DWORD *)a1 + 144) = 1;
    *((void *)a1 + 74) = a7;
    long long v16 = *a4;
    long long v15 = a4[1];
    *((_DWORD *)a1 + 8) = *((_DWORD *)a4 + 8);
    *(_OWORD *)a1 = v16;
    *((_OWORD *)a1 + 1) = v15;
    if (!*((_WORD *)a1 + 6)) {
      *((_WORD *)a1 + 6) = 4;
    }
    uint64_t result = 0;
    *((_DWORD *)a1 + 138) = a3;
    a1[580] = 0;
    *((_DWORD *)a1 + 146) = 1;
    *((_WORD *)a1 + 300) = 1;
  }
  return result;
}

uint64_t uarpPlatformRemoteEndpointAdd(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      if (a4)
      {
        *(void *)(a2 + 40) = a4;
        long long v7 = *(_OWORD *)a1;
        long long v8 = *(_OWORD *)(a1 + 16);
        *(_DWORD *)(a2 + 32) = *(_DWORD *)(a1 + 32);
        *(_OWORD *)a2 = v7;
        *(_OWORD *)(a2 + 16) = v8;
        if (!a3
          || (long long v10 = *a3,
              long long v9 = a3[1],
              *(_DWORD *)(a2 + 32) = *((_DWORD *)a3 + 8),
              *(_OWORD *)a2 = v10,
              *(_OWORD *)(a2 + 16) = v9,
              (unsigned int v11 = *(_DWORD *)(a2 + 4)) != 0)
          && *(_DWORD *)a2
          && *(_DWORD *)(a2 + 8) >= v11)
        {
          if (!*(_WORD *)(a2 + 12)) {
            *(_WORD *)(a2 + 12) = *(_WORD *)(a1 + 12);
          }
          *(_WORD *)(a2 + 48) = 0;
          int v12 = *(_DWORD *)(a1 + 584);
          *(_DWORD *)(a1 + 584) = v12 + 1;
          *(_DWORD *)(a2 + 52) = v12;
          *(unsigned char *)(a2 + 56) = 1;
          *(_DWORD *)(a2 + 58) = 1;
          if (!*(_WORD *)(a2 + 28)
            || (uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 80), 4 * *(unsigned __int16 *)(a2 + 28)), !result))
          {
            uint64_t result = uarpPlatformRemoteEndpointAddEntry(a1, a2);
            if (!result)
            {
              int v13 = *(unsigned __int16 *)(a2 + 20);
              if (!*(_WORD *)(a2 + 20))
              {
                int v13 = 1;
                *(_WORD *)(a2 + 20) = 1;
              }
              *(_WORD *)(a2 + 96) = v13;
              uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 104), 8 * v13);
              if (!result)
              {
                if (*(_WORD *)(a2 + 96))
                {
                  unint64_t v14 = 0;
                  do
                    *(void *)(*(void *)(a2 + 104) + 8 * v14++) = uarpAllocateTransmitBuffer2(a1, a2, 0);
                  while (v14 < *(unsigned __int16 *)(a2 + 96));
                }
                int v15 = *(unsigned __int16 *)(a2 + 20);
                *(_WORD *)(a2 + 112) = v15;
                uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 120), 8 * v15);
                if (!result)
                {
                  if ((*(_DWORD *)(a1 + 552) - 1) > 1) {
                    return 0;
                  }
                  uint64_t result = uarpPlatformEndpointSendSyncMsg(a1, a2);
                  if (!result)
                  {
                    if (*(_DWORD *)(a1 + 552) != 2) {
                      return 0;
                    }
                    uint64_t result = uarpSendVersionDiscoveryRequest(a1, a2, *(unsigned __int16 *)(a2 + 12));
                    if (!result) {
                      return 0;
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
  return result;
}

uint64_t uarpPlatformRemoteEndpointRemove(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    uarpTransmitQueuesCleanup(a1, a2);
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, a2, 1);
    uint64_t v5 = *(unsigned int *)(a1 + 556);
    if (v5)
    {
      uint64_t v6 = 0;
      uint64_t v7 = 8 * v5;
      do
      {
        uint64_t v8 = *(void *)(a1 + 560);
        if (*(void *)(v8 + v6) == a2) {
          *(void *)(v8 + v6) = 0;
        }
        v6 += 8;
      }
      while (v7 != v6);
    }
    uarpPlatformEndpointStreamingRecvDeinit(a1, a2);
    UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 80));
    uint64_t result = 0;
    *(void *)(a2 + 80) = 0;
  }
  return result;
}

uint64_t uarpPlatformEndpointRequestInfoProperty(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a1 && a2 && a3 - 10 >= 0xFFFFFFF7) {
    return uarpSendInformationRequest(a1, a2, a3);
  }
  else {
    return 30;
  }
}

uint64_t uarpPlatformEndpointAssetIsAcceptable(void *a1, uint64_t a2, unsigned char *a3, __int16 *a4)
{
  uint64_t ActiveFirmwareVersion = 30;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          *a3 = 1;
          *a4 = 0;
          v16[0] = 0;
          v16[1] = 0;
          uint64_t ActiveFirmwareVersion = uarpPlatformEndpointQueryActiveFirmwareVersion(a1, a2, v16);
          if (!ActiveFirmwareVersion)
          {
            int v9 = uarpVersionCompare(v16, (_DWORD *)(a2 + 52));
            if (v9 == 1)
            {
              v15[0] = 0;
              v15[1] = 0;
              uint64_t ActiveFirmwareVersion = uarpPlatformEndpointQueryStagedFirmwareVersion(a1, a2, v15);
              if (ActiveFirmwareVersion) {
                return ActiveFirmwareVersion;
              }
              int v10 = uarpVersionCompare(v15, (_DWORD *)(a2 + 52));
              if (v10 == 1) {
                return ActiveFirmwareVersion;
              }
              *a3 = 0;
              BOOL v11 = v10 == 0;
              __int16 v12 = 1280;
              __int16 v13 = 768;
            }
            else
            {
              uint64_t ActiveFirmwareVersion = 0;
              *a3 = 0;
              BOOL v11 = v9 == 0;
              __int16 v12 = 1536;
              __int16 v13 = 1024;
            }
            if (v11) {
              __int16 v12 = v13;
            }
            *a4 = v12;
          }
        }
      }
    }
  }
  return ActiveFirmwareVersion;
}

uint64_t uarpPlatformEndpointAssetAccept(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  return uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows(a1, a2, a3, a4, a5, 0, 0, 0, 0);
}

uint64_t uarpPlatformEndpointAssetAcceptWithPayloadWindow(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5, uint64_t a6, unsigned int a7)
{
  return uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows(a1, a2, a3, a4, a5, a6, a7, 0, 0);
}

uint64_t uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5, uint64_t a6, unsigned int a7, uint64_t a8, unsigned int a9)
{
  uint64_t result = 30;
  if (a1 && a2 && a3 && (!a6 || a7 && *(_DWORD *)(a2 + 8) <= a7) && (!a8 || a9 && *(_DWORD *)(a2 + 8) <= a9))
  {
    uint64_t v15 = *(void *)(a1 + 568);
    if (v15)
    {
      uint64_t v16 = *(void *)(a1 + 568);
      while (v16 != a3 || *(_DWORD *)(v16 + 304))
      {
        uint64_t v16 = *(void *)(v16 + 712);
        if (!v16) {
          goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_15:
      *(void *)(a3 + 712) = v15;
      *(void *)(a1 + 568) = a3;
    }
    if (a4) {
      *(void *)(a3 + 704) = a4;
    }
    *(_WORD *)(a3 + 72) = 0;
    if (!a5) {
      return 30;
    }
    long long v17 = a5[1];
    *(_OWORD *)(a3 + 80) = *a5;
    *(_OWORD *)(a3 + 96) = v17;
    long long v18 = a5[2];
    long long v19 = a5[3];
    long long v20 = a5[5];
    *(_OWORD *)(a3 + 144) = a5[4];
    *(_OWORD *)(a3 + 160) = v20;
    *(_OWORD *)(a3 + 112) = v18;
    *(_OWORD *)(a3 + 128) = v19;
    long long v21 = a5[6];
    long long v22 = a5[7];
    long long v23 = a5[9];
    *(_OWORD *)(a3 + 208) = a5[8];
    *(_OWORD *)(a3 + 224) = v23;
    *(_OWORD *)(a3 + 176) = v21;
    *(_OWORD *)(a3 + 192) = v22;
    long long v24 = a5[10];
    long long v25 = a5[11];
    long long v26 = a5[13];
    *(_OWORD *)(a3 + 272) = a5[12];
    *(_OWORD *)(a3 + 288) = v26;
    *(_OWORD *)(a3 + 240) = v24;
    *(_OWORD *)(a3 + 256) = v25;
    if (a6)
    {
      if (!*(unsigned char *)(a3 + 652)) {
        UARPLayer2ReturnBuffer(a1, *(void **)(a3 + 640));
      }
      *(void *)(a3 + 640) = a6;
      *(_DWORD *)(a3 + 648) = a7;
      *(unsigned char *)(a3 + 652) = 1;
    }
    else if (!*(void *)(a3 + 640))
    {
      uint64_t v29 = (void *)(a3 + 640);
      *(unsigned char *)(a3 + 652) = 0;
      unsigned int v30 = *(_DWORD *)(a2 + 8);
      *(_DWORD *)(a3 + 648) = v30;
      uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a3 + 640), v30);
      if (result) {
        return result;
      }
      if (!*v29) {
        return 11;
      }
    }
    if (a8)
    {
      if (!*(unsigned char *)(a3 + 668)) {
        UARPLayer2ReturnBuffer(a1, *(void **)(a3 + 656));
      }
      *(void *)(a3 + 656) = a8;
      *(_DWORD *)(a3 + 664) = a9;
      char v27 = 1;
    }
    else
    {
      char v27 = 0;
    }
    *(unsigned char *)(a3 + 668) = v27;
    if (uarpVersionCompare((_DWORD *)(a3 + 52), (_DWORD *)(a3 + 12))
      || *(_DWORD *)(a3 + 68) != *(_DWORD *)(a3 + 8))
    {
      return uarpPlatformAssetSuperBinaryPullHeader(a1, a3);
    }
    else if (*(_DWORD *)(a3 + 688) == *(_DWORD *)(a3 + 32))
    {
      int v28 = *(_DWORD *)(a3 + 452);
      if (v28 == -1)
      {
        UARPLayer2AssetMetaDataComplete(a1, a3);
        return 0;
      }
      else if (v28 == *(_DWORD *)(a3 + 456))
      {
        if (*(_DWORD *)(a3 + 512) == *(_DWORD *)(a3 + 492))
        {
          if (*(_DWORD *)(a3 + 508) || (uint64_t result = uarpPlatformAssetPayloadPullData(a1, a3), !result))
          {
            return uarpPlatformAssetRequestData(a1, a3, a3 + 312);
          }
        }
        else
        {
          return uarpPlatformAssetPayloadPullMetaData(a1, a3);
        }
      }
      else
      {
        return uarpPlatformAssetSuperBinaryPullProposedPayloadHeader(a1, a3);
      }
    }
    else
    {
      return uarpPlatformAssetSuperBinaryPullMetaData(a1, a3);
    }
  }
  return result;
}

__n128 uarpPlatformEndpointAssetSetCallbacks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a2)
  {
    if (a3)
    {
      long long v3 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)(a2 + 80) = *(_OWORD *)a3;
      *(_OWORD *)(a2 + 96) = v3;
      long long v4 = *(_OWORD *)(a3 + 32);
      long long v5 = *(_OWORD *)(a3 + 48);
      long long v6 = *(_OWORD *)(a3 + 80);
      *(_OWORD *)(a2 + 144) = *(_OWORD *)(a3 + 64);
      *(_OWORD *)(a2 + 160) = v6;
      *(_OWORD *)(a2 + 112) = v4;
      *(_OWORD *)(a2 + 128) = v5;
      long long v7 = *(_OWORD *)(a3 + 96);
      long long v8 = *(_OWORD *)(a3 + 112);
      long long v9 = *(_OWORD *)(a3 + 144);
      *(_OWORD *)(a2 + 208) = *(_OWORD *)(a3 + 128);
      *(_OWORD *)(a2 + 224) = v9;
      *(_OWORD *)(a2 + 176) = v7;
      *(_OWORD *)(a2 + 192) = v8;
      __n128 result = *(__n128 *)(a3 + 160);
      long long v11 = *(_OWORD *)(a3 + 176);
      long long v12 = *(_OWORD *)(a3 + 208);
      *(_OWORD *)(a2 + 272) = *(_OWORD *)(a3 + 192);
      *(_OWORD *)(a2 + 288) = v12;
      *(__n128 *)(a2 + 240) = result;
      *(_OWORD *)(a2 + 256) = v11;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetDeny(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, _OWORD *a6)
{
  uint64_t v6 = 30;
  if (a1 && a2 && a3)
  {
    if (a5) {
      *(void *)(a3 + 704) = a5;
    }
    if (a6)
    {
      long long v8 = a6[1];
      *(_OWORD *)(a3 + 80) = *a6;
      *(_OWORD *)(a3 + 96) = v8;
      long long v9 = a6[2];
      long long v10 = a6[3];
      long long v11 = a6[5];
      *(_OWORD *)(a3 + 144) = a6[4];
      *(_OWORD *)(a3 + 160) = v11;
      *(_OWORD *)(a3 + 112) = v9;
      *(_OWORD *)(a3 + 128) = v10;
      long long v12 = a6[6];
      long long v13 = a6[7];
      long long v14 = a6[9];
      *(_OWORD *)(a3 + 208) = a6[8];
      *(_OWORD *)(a3 + 224) = v14;
      *(_OWORD *)(a3 + 176) = v12;
      *(_OWORD *)(a3 + 192) = v13;
      long long v15 = a6[10];
      long long v16 = a6[11];
      long long v17 = a6[13];
      *(_OWORD *)(a3 + 272) = a6[12];
      *(_OWORD *)(a3 + 288) = v17;
      *(_OWORD *)(a3 + 240) = v15;
      *(_OWORD *)(a3 + 256) = v16;
      uint64_t v6 = uarpAssetProcessingComplete(a1, a2, a3, a4 | 2u);
      if (!v6) {
        *(unsigned char *)(a3 + 72) = 1;
      }
    }
    else
    {
      return 30;
    }
  }
  return v6;
}

uint64_t uarpPlatformEndpointAssetAbandon(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return uarpPlatformAssetProcessingCompleteInternal(a1, a2, a3, 3u, a4, 1);
}

uint64_t uarpPlatformEndpointAssetCorrupt(uint64_t a1, uint64_t a2)
{
  return uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 1);
}

uint64_t uarpPlatformEndpointAssetRelease(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = uarpPlatformAssetFindByAssetContext(a1, *(void *)(a3 + 704));

  return uarpPlatformAssetProcessingCompleteInternal(a1, 0, v4, 1u, 0, 1);
}

uint64_t uarpPlatformEndpointAssetRelease2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = uarpPlatformAssetFindByAssetContext(a1, a3);

  return uarpPlatformAssetProcessingCompleteInternal(a1, 0, v4, 1u, 0, 1);
}

uint64_t uarpPlatformAssetFindByAssetContext(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    uint64_t v4 = *(void *)(a1 + 568);
    if (v4)
    {
      uint64_t result = v4;
      while (*(_DWORD *)(result + 304) != 1 || *(void *)(result + 704) != a2)
      {
        uint64_t result = *(void *)(result + 712);
        if (!result)
        {
          while (v4)
          {
            if (!*(_DWORD *)(v4 + 304) && *(void *)(v4 + 704) == a2) {
              return v4;
            }
            uint64_t v4 = *(void *)(v4 + 712);
          }
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetQueryNumberOfPayloads(uint64_t a1, uint64_t a2, _WORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(a2 + 448);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetQueryFormatVersion(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *a2;
    }
  }
  return result;
}

__n128 uarpPlatformEndpointAssetQueryAssetVersion(uint64_t a1, uint64_t a2, __n128 *a3)
{
  if (a1 && a2)
  {
    if (a3)
    {
      __n128 result = *(__n128 *)(a2 + 12);
      *a3 = result;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetQueryAssetLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(a2 + 68);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetQueryTag(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(a2 + 48);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetSetPayloadIndex(void *a1, uint64_t a2, int a3)
{
  return uarpPlatformEndpointAssetSetPayloadIndex2(a1, a2, a3);
}

uint64_t uarpPlatformEndpointAssetSetPayloadIndex2(void *a1, uint64_t a2, int a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 448) <= a3)
    {
      return 44;
    }
    else
    {
      *(_DWORD *)(a2 + 456) = a3;
      uint64_t v6 = (_OWORD *)(a2 + 464);
      *(void *)(a2 + 508) = 0;
      if (*(unsigned char *)(a2 + 460) == 1)
      {
        long long v7 = *(long long **)(a2 + 632);
        if (v7)
        {
          while (1)
          {
            int v8 = *((_DWORD *)v7 + 31);
            if (v8 == *(_DWORD *)(a2 + 456))
            {
              *(_DWORD *)(a2 + 452) = v8;
              long long v9 = *v7;
              long long v10 = v7[2];
              *(_OWORD *)(a2 + 480) = v7[1];
              *(_OWORD *)(a2 + 496) = v10;
              _OWORD *v6 = v9;
              long long v11 = v7[3];
              long long v12 = v7[4];
              long long v13 = v7[6];
              *(_OWORD *)(a2 + 544) = v7[5];
              *(_OWORD *)(a2 + 560) = v13;
              *(_OWORD *)(a2 + 512) = v11;
              *(_OWORD *)(a2 + 528) = v12;
              long long v14 = v7[7];
              long long v15 = v7[8];
              long long v16 = v7[9];
              *(void *)(a2 + 624) = *((void *)v7 + 20);
              *(_OWORD *)(a2 + 592) = v15;
              *(_OWORD *)(a2 + 608) = v16;
              *(_OWORD *)(a2 + 576) = v14;
              for (uint64_t i = *((void *)v7 + 21); i; uint64_t i = *(void *)(i + 16))
                uarpProcessPayloadTLVInternal(a1, a2, a2 + 464, *(_DWORD *)i, *(unsigned int *)(i + 4), *(unsigned int **)(i + 8));
              uint64_t v18 = *((unsigned int *)v7 + 19);
              if (v18)
              {
                UARPLayer2HashFinal((uint64_t)a1, v18, *((void *)v7 + 10), *((void *)v7 + 12), *((unsigned int *)v7 + 26));
                if (memcmp(*((const void **)v7 + 12), *((const void **)v7 + 14), *((unsigned int *)v7 + 30))) {
                  return 54;
                }
              }
            }
            long long v7 = (long long *)*((void *)v7 + 22);
            if (!v7) {
              goto LABEL_12;
            }
          }
        }
        else
        {
LABEL_12:
          return uarpPlatformEndpointPayloadRequestData((uint64_t)a1, a2);
        }
      }
      else
      {
        return uarpPlatformAssetSuperBinaryPullProposedPayloadHeader((uint64_t)a1, a2);
      }
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestData(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 30;
  if (!a1 || !a2) {
    return v2;
  }
  unsigned int v3 = *(_DWORD *)(a2 + 500);
  if (v3) {
    v3 -= *(_DWORD *)(a2 + 508);
  }
  if (v3 >= *(_DWORD *)(a2 + 648)) {
    unsigned int v3 = *(_DWORD *)(a2 + 648);
  }
  if (!v3)
  {
    UARPLayer2PayloadDataComplete2(a1, (void *)a2);
    return 0;
  }

  return uarpPlatformAssetPayloadPullData(a1, a2);
}

uint64_t uarpPlatformEndpointAssetPayloadVersion(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2 && a3)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 32;
    }
    else
    {
      uint64_t result = 0;
      *a3 = *(_OWORD *)(a2 + 472);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetPayloadTag(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2 && a3)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 32;
    }
    else
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(a2 + 468);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestAllHeadersAndMetaData(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 460) = 1;
  if (*(int *)(a2 + 448) < 1)
  {
    if (*(_DWORD *)(a2 + 32))
    {
      return uarpPlatformAssetPullAllMetaData(a1, a2);
    }
    else
    {
      UARPLayer2AssetAllHeadersAndMetaDataComplete(a1, *(void *)(a2 + 696), a2);
      return 0;
    }
  }
  else
  {
    return uarpPlatformAssetPullAllPayloadHeaders(a1, a2);
  }
}

uint64_t uarpPlatformEndpointAssetSetPayloadOffset(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (!a2) {
    return 30;
  }
  if (*(_DWORD *)(a2 + 452) == -1) {
    return 44;
  }
  if (*(_DWORD *)(a2 + 500) <= a3) {
    return 43;
  }
  if (*(unsigned char *)(a2 + 392) == 1) {
    return 16;
  }
  uint64_t result = 0;
  *(_DWORD *)(a2 + 508) = a3;
  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestDataPause(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *(unsigned char *)(a2 + 73) = 1;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestDataResume(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 30;
  if (!a1) {
    return v2;
  }
  if (!a2) {
    return v2;
  }
  uint64_t v2 = *(unsigned __int8 *)(a2 + 73);
  if (!*(unsigned char *)(a2 + 73)) {
    return v2;
  }
  *(unsigned char *)(a2 + 73) = 0;
  uint64_t v2 = *(void *)(a2 + 696);
  if (!v2) {
    return v2;
  }
  if (*(unsigned char *)(a2 + 392) == 1) {
    return 0;
  }
  return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
}

uint64_t uarpPlatformEndpointAssetFullyStaged(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpAssetProcessingComplete(a1, *(void *)(a2 + 696), a2, 1u);
  }
  else {
    return 30;
  }
}

double uarpPlatformEndpointSuperBinaryMerge(uint64_t a1, long long *a2, uint64_t a3)
{
  if (a1 && a2)
  {
    if (a3)
    {
      long long v3 = *a2;
      long long v4 = a2[1];
      *(_OWORD *)(a3 + 28) = *(long long *)((char *)a2 + 28);
      *(_OWORD *)a3 = v3;
      *(_OWORD *)(a3 + 16) = v4;
      *((unsigned char *)a2 + 72) = 1;
      *(unsigned char *)(a3 + 72) = 0;
      *(unsigned char *)(a3 + 73) = *((unsigned char *)a2 + 73);
      *((unsigned char *)a2 + 392) = 0;
      long long v6 = *(long long *)((char *)a2 + 360);
      long long v5 = *(long long *)((char *)a2 + 376);
      long long v7 = *(long long *)((char *)a2 + 344);
      *(_OWORD *)(a3 + 328) = *(long long *)((char *)a2 + 328);
      *(_OWORD *)(a3 + 344) = v7;
      *(_OWORD *)(a3 + 360) = v6;
      *(_OWORD *)(a3 + 376) = v5;
      *(_OWORD *)(a3 + 312) = *(long long *)((char *)a2 + 312);
      long long v8 = *(long long *)((char *)a2 + 392);
      long long v9 = *(long long *)((char *)a2 + 408);
      long long v10 = *(long long *)((char *)a2 + 424);
      *(void *)(a3 + 440) = *((void *)a2 + 55);
      *(_OWORD *)(a3 + 408) = v9;
      *(_OWORD *)(a3 + 424) = v10;
      *(_OWORD *)(a3 + 392) = v8;
      *(_DWORD *)(a3 + 452) = *((_DWORD *)a2 + 113);
      *(_DWORD *)(a3 + 456) = *((_DWORD *)a2 + 114);
      long long v11 = a2[29];
      long long v12 = a2[31];
      *(_OWORD *)(a3 + 480) = a2[30];
      *(_OWORD *)(a3 + 496) = v12;
      *(_OWORD *)(a3 + 464) = v11;
      long long v13 = a2[32];
      long long v14 = a2[33];
      long long v15 = a2[35];
      *(_OWORD *)(a3 + 544) = a2[34];
      *(_OWORD *)(a3 + 560) = v15;
      *(_OWORD *)(a3 + 512) = v13;
      *(_OWORD *)(a3 + 528) = v14;
      long long v16 = a2[36];
      long long v17 = a2[37];
      long long v18 = a2[38];
      *(void *)(a3 + 624) = *((void *)a2 + 78);
      *(_OWORD *)(a3 + 592) = v17;
      *(_OWORD *)(a3 + 608) = v18;
      *(_OWORD *)(a3 + 576) = v16;
      *((void *)a2 + 78) = 0;
      double result = 0.0;
      a2[37] = 0u;
      a2[38] = 0u;
      a2[35] = 0u;
      a2[36] = 0u;
      a2[33] = 0u;
      a2[34] = 0u;
      a2[31] = 0u;
      a2[32] = 0u;
      a2[29] = 0u;
      a2[30] = 0u;
      *(void *)(a3 + 640) = *((void *)a2 + 80);
      *((void *)a2 + 80) = 0;
      *(unsigned char *)(a3 + 652) = *((unsigned char *)a2 + 652);
      *(_DWORD *)(a3 + 648) = *((_DWORD *)a2 + 162);
      *((_DWORD *)a2 + 162) = 0;
      *(void *)(a3 + 656) = *((void *)a2 + 82);
      *((void *)a2 + 82) = 0;
      *(unsigned char *)(a3 + 668) = *((unsigned char *)a2 + 668);
      *(_DWORD *)(a3 + 664) = *((_DWORD *)a2 + 166);
      *((_DWORD *)a2 + 166) = 0;
      *(_DWORD *)(a3 + 688) = *((_DWORD *)a2 + 172);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointSendMessageComplete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = uarpPlatformEndpointSendMessageCompleteInternal(a1, a2, a3);
  if (!*(unsigned char *)(a1 + 580))
  {
    return uarpTransmitQueueService(a1, a2);
  }
  return result;
}

void uarpPlatformEndpointCleanupAssets(uint64_t a1)
{
  if (a1) {
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, 0, 0);
  }
}

void uarpPlatformEndpointCleanupAssets2(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, a2, 0);
  }
}

void uarpPlatformEndpointPrepareDynamicAsset(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
}

void uarpPlatformEndpointPrepareSolicitedDynamicAsset(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
}

void uarpPlatformEndpointPrepareSuperBinary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t uarpPlatformEndpointOfferAsset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v6 = *(void *)(a1 + 568);
        if (v6)
        {
          while (*(_DWORD *)(v6 + 304) != 1 || *(void *)(v6 + 704) != a3)
          {
            uint64_t v6 = *(void *)(v6 + 712);
            if (!v6) {
              return 30;
            }
          }
          memset(__dst, 0, 44);
          unsigned __int16 v7 = 0;
          uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, a2, v6, __dst, 44, 0, &v7);
          if (!result)
          {
            uarpSuperBinaryHeaderEndianSwap((unsigned int *)__dst, (_DWORD *)v6);
            *(_OWORD *)(v6 + 52) = *(_OWORD *)(v6 + 12);
            *(_DWORD *)(v6 + 68) = *(_DWORD *)(v6 + 8);
            *(_DWORD *)(v6 + 448) = *(unsigned __int16 *)(v6 + 40) / 0x28u;
            uint64_t result = uarpPlatformAssetApproveOfferVersion(a2, v6);
            if (!result) {
              return uarpOfferAssetToRemoteEP(a1, a2, v6);
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t uarpPlatformAssetFindByAssetContextAndList(uint64_t result, uint64_t a2, int a3)
{
  if (result)
  {
    for (uint64_t result = *(void *)(result + 568); result; uint64_t result = *(void *)(result + 712))
    {
      if (*(_DWORD *)(result + 304) == a3 && *(void *)(result + 704) == a2) {
        break;
      }
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetGetBytesAtOffset(uint64_t a1, uint64_t a2, uint64_t a3, void *__dst, uint64_t a5, uint64_t a6, unsigned __int16 *a7)
{
  uint64_t result = 30;
  if (a1 && a3 && __dst && a5)
  {
    __int16 v15 = *(_WORD *)(a3 + 46);
    if ((v15 & 0x80) != 0)
    {
      uint64_t result = UARPSuperBinaryGetInternalSuperBinaryMetaData(a1, a3, __dst, a5, a6, a7);
      if (result != 40) {
        return result;
      }
      __int16 v15 = *(_WORD *)(a3 + 46);
    }
    if ((v15 & 8) == 0
      || (uint64_t result = UARPSuperBinaryGetInternalPayloadMetaData(a1, a3, __dst, a5, a6, a7), result == 40))
    {
      return UARPLayer2AssetGetBytesAtOffset2(a1, a2, (void *)a3, (uint64_t)__dst, a5, a6, (uint64_t)a7);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointRemoveAssetPayloadWindow(uint64_t a1, uint64_t a2, void *a3, _DWORD *a4)
{
  uint64_t result = 30;
  if (a3)
  {
    if (a4)
    {
      uint64_t result = 0;
      *a3 = *(void *)(a2 + 640);
      *(void *)(a2 + 640) = 0;
      *a4 = *(_DWORD *)(a2 + 648);
      *(_DWORD *)(a2 + 648) = 0;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointProvideAssetPayloadWindow(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t result = 30;
  if (a3 && a4)
  {
    long long v9 = *(void **)(a2 + 640);
    if (v9)
    {
      if (!*(unsigned char *)(a2 + 652)) {
        UARPLayer2ReturnBuffer(a1, v9);
      }
    }
    uint64_t result = 0;
    *(void *)(a2 + 640) = a3;
    *(_DWORD *)(a2 + 648) = a4;
    *(unsigned char *)(a2 + 652) = 1;
  }
  return result;
}

uint64_t uarpPlatformEndpointDynamicAssetSolicitationDeny(uint64_t a1, uint64_t a2, _DWORD *a3, int a4)
{
  if (a1 && a2 && a3) {
    return uarpSendDynamicAssetPreProcessingStatus(a1, a2, a3, 2u, a4);
  }
  else {
    return 30;
  }
}

uint64_t uarpPlatformEndpointAssetSetBytesAtOffset(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 && a3 && a4 && a5) {
    return UARPLayer2AssetSetBytesAtOffset2(a1, a2, a3, a4, a5, a6);
  }
  else {
    return 30;
  }
}

uint64_t uarpPlatformEndpointWatchDogExpired(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    uint64_t result = 0;
    *(unsigned char *)(a2 + 50) = 0;
    if (!*(unsigned char *)(a1 + 580))
    {
      uarpTransmitQueueService(a1, a2);
      return 0;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointRescindAsset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 30;
  }
  if (!a2) {
    return 30;
  }
  if (!a3) {
    return 30;
  }
  uint64_t v3 = *(void *)(a1 + 568);
  if (!v3) {
    return 30;
  }
  while (*(_DWORD *)(v3 + 304) != 1 || *(void *)(v3 + 704) != a3)
  {
    uint64_t v3 = *(void *)(v3 + 712);
    if (!v3) {
      return 30;
    }
  }
  return uarpAssetRescind(a1, a2, *(unsigned __int16 *)(v3 + 44));
}

uint64_t uarpPlatformEndpointRescindAllAssets(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpAssetRescind(a1, a2, 0xFFFFu);
  }
  else {
    return 30;
  }
}

uint64_t uarpPlatformEndpointApplyStagedAssets(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    long long v5 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xAu, 6u, 1);
    if (v5)
    {
      return uarpTransmitBuffer2(a1, a2, (uint64_t)v5);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointPauseAssetTransfers(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpSendDataTransferNotificationPause(a1, a2);
  }
  else {
    return 30;
  }
}

uint64_t uarpPlatformEndpointResumeAssetTransfers(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpSendDataTransferNotificationResume(a1, a2);
  }
  else {
    return 30;
  }
}

uint64_t uarpPlatformEndpointSolicitDynamicAsset(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4)
{
  if (!a1) {
    return 30;
  }
  if (!a2) {
    return 30;
  }
  if (!a4) {
    return 30;
  }
  uint64_t v4 = *(void *)(a1 + 568);
  if (!v4) {
    return 30;
  }
  while (*(_DWORD *)(v4 + 304) || *(void *)(v4 + 704) != a4)
  {
    uint64_t v4 = *(void *)(v4 + 712);
    if (!v4) {
      return 30;
    }
  }
  return uarpSolicitDynamicAsset(a1, a2, a3);
}

uint64_t uarpPlatformEndpointSendVendorSpecific(uint64_t a1, uint64_t a2, __int16 *a3, unsigned int a4, const void *a5, unsigned int a6)
{
  if (a1 && a2 && a3 && a5) {
    return uarpSendVendorSpecific(a1, a2, a3, a4, a5, a6);
  }
  else {
    return 30;
  }
}

uint64_t uarpPlatformDownstreamEndpointAdd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 30;
  }
  unsigned __int16 v6 = *(_WORD *)(a1 + 600);
  do
  {
    if (!v6)
    {
      *(_WORD *)(a1 + 600) = 1;
      return 11;
    }
    uint64_t v7 = UARPPlatformDownstreamEndpointByID(a1, a2, v6);
    unsigned int v8 = *(unsigned __int16 *)(a1 + 600);
    unsigned __int16 v6 = v8 + 1;
    *(_WORD *)(a1 + 600) = v8 + 1;
  }
  while (!v7 || !v8);

  return uarpPlatformDownstreamEndpointAddWithID(a1, a2, a3, v8);
}

uint64_t uarpPlatformDownstreamEndpointAddWithID(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (!a1) {
    return 30;
  }
  uint64_t v8 = uarpPlatformRemoteEndpointAlloc(a1);
  if (!v8) {
    return 11;
  }
  *(void *)(v8 + 40) = a3;
  *(void *)(v8 + 176) = a2;
  *(_WORD *)(v8 + 136) = a4;

  return uarpSendDownstreamEndpointReachable(a1, a2, a4);
}

uint64_t uarpPlatformDownstreamEndpointRemove(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = UARPPlatformDownstreamEndpointByDelegate(a1, a2, a3);
  if (!v5) {
    return 58;
  }
  unsigned int v6 = *(unsigned __int16 *)(v5 + 136);

  return uarpSendDownstreamEndpointUnreachable(a1, a2, v6);
}

uint64_t uarpPlatformDownstreamEndpointSendMessage(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, unsigned int a5)
{
  uint64_t v9 = UARPPlatformDownstreamEndpointByDelegate(a1, a2, a3);
  if (!v9) {
    return 58;
  }

  return uarpPlatformDownstreamEndpointSendMessageInternal(a1, a2, v9, a4, a5);
}

uint64_t uarpPlatformNoFirmwareUpdateAvailable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Du, 6u, 1);
  if (!v4) {
    return 11;
  }

  return uarpTransmitBuffer2(a1, a2, (uint64_t)v4);
}

uint64_t uarpRemoteEndpointID(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 52);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t uarpRemoteEndpointIDForAsset(uint64_t a1)
{
  if (a1 && (uint64_t v1 = *(void *)(a1 + 696)) != 0) {
    return *(unsigned int *)(v1 + 52);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t uarpPlatformRemoteDelegateForAssetDelegate(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 696);
    if (v1) {
      return *(void *)(v1 + 40);
    }
    else {
      return 0;
    }
  }
  return result;
}

__n128 uarpPlatformAssetSelectedPayloadInfo(uint64_t a1, char *a2)
{
  if (a1 && a2 && *(_DWORD *)(a1 + 452) != -1 && *(unsigned char *)(a1 + 460) != 1)
  {
    uarpZero(a2, 0x20uLL);
    *(_DWORD *)a2 = *(_DWORD *)(a1 + 468);
    __n128 result = *(__n128 *)(a1 + 472);
    *(__n128 *)(a2 + 4) = result;
    int v5 = *(_DWORD *)(a1 + 500);
    *((_DWORD *)a2 + 5) = *(_DWORD *)(a1 + 492);
    *((_DWORD *)a2 + 6) = v5;
  }
  return result;
}

uint64_t uarpAssetQuerySuperBinaryMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a2 + 460)) {
      return *(void *)(a2 + 720);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t uarpAssetQueryPayloadMetaData(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a2 + 460) && (uint64_t v5 = *(void *)(a2 + 632)) != 0)
    {
      while (*(_DWORD *)(v5 + 124) != a3)
      {
        uint64_t v5 = *(void *)(v5 + 176);
        if (!v5) {
          return 0;
        }
      }
      return *(void *)(v5 + 168);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t uarpAssetQueryPayloadInfo(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a4)
    {
      if (*(unsigned char *)(a2 + 460))
      {
        uint64_t v6 = *(void *)(a2 + 632);
        if (!v6) {
          return 54;
        }
        while (*(_DWORD *)(v6 + 124) != a3)
        {
          uint64_t v6 = *(void *)(v6 + 176);
          if (!v6) {
            return 54;
          }
        }
        *(_DWORD *)a4 = *(_DWORD *)(v6 + 4);
        *(_OWORD *)(a4 + 4) = *(_OWORD *)(v6 + 8);
        int v9 = *(_DWORD *)(v6 + 36);
        *(_DWORD *)(a4 + 20) = *(_DWORD *)(v6 + 28);
        *(_DWORD *)(a4 + 24) = v9;
        uint64_t v8 = (_DWORD *)(v6 + 128);
        goto LABEL_14;
      }
      if (*(_DWORD *)(a2 + 452) == a3)
      {
        *(_DWORD *)a4 = *(_DWORD *)(a2 + 468);
        *(_OWORD *)(a4 + 4) = *(_OWORD *)(a2 + 472);
        int v7 = *(_DWORD *)(a2 + 500);
        *(_DWORD *)(a4 + 20) = *(_DWORD *)(a2 + 492);
        *(_DWORD *)(a4 + 24) = v7;
        uint64_t v8 = (_DWORD *)(a2 + 592);
LABEL_14:
        uint64_t result = 0;
        *(_DWORD *)(a4 + 28) = *v8;
        return result;
      }
      return 44;
    }
    else
    {
      return 26;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetQueryAssetID(uint64_t a1, _WORD *a2)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(_WORD *)(a1 + 44);
    }
  }
  return result;
}

__n128 uarpPlatformAssetQueryAssetVersion(uint64_t a1, __n128 *a2)
{
  if (a1)
  {
    if (a2)
    {
      __n128 result = *(__n128 *)(a1 + 52);
      *a2 = result;
    }
  }
  return result;
}

uint64_t uarpPlatformSetMaxTxPayloadLength(uint64_t a1, _DWORD *a2, int a3)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = a3;
    }
  }
  return result;
}

uint64_t uarpPlatformGetMaxTxPayloadLength(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *a2;
    }
  }
  return result;
}

uint64_t uarpPlatformSetMaxRxPayloadLength(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *(_DWORD *)(a2 + 4) = a3;
    }
  }
  return result;
}

uint64_t uarpPlatformGetMaxRxPayloadLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(a2 + 4);
    }
  }
  return result;
}

uint64_t simulationBackendCreate(uint64_t *a1)
{
  uint64_t v2 = (char *)uarpZalloc(0x40uLL);
  *a1 = (uint64_t)v2;
  *(_DWORD *)uint64_t v2 = -1;
  v2[4] = 119;
  *((_DWORD *)v2 + 2) = 34;
  *((_DWORD *)v2 + 3) = 65793;
  *((void *)v2 + 2) = 0x123456789ABCDEFLL;
  *(_OWORD *)(v2 + 24) = xmmword_263E16C90;
  uint64_t v3 = *a1;
  *(_DWORD *)(v3 + 40) = 1;
  *(unsigned char *)(v3 + 44) = 0;
  return 0;
}

uint64_t simulationBackendDestroy(void **a1)
{
  *a1 = 0;
  return 0;
}

uint64_t simulationBackendGetPersParam(int *a1, int a2, void *a3, uint64_t a4, int *a5)
{
  uint64_t result = 26;
  switch(a2)
  {
    case 0:
      char v7 = *((unsigned char *)a1 + 4);
      goto LABEL_13;
    case 1:
      int v8 = a1[2];
      goto LABEL_16;
    case 2:
      int v8 = *a1;
      goto LABEL_16;
    case 3:
      *a3 = *((void *)a1 + 2);
      if (!a5) {
        return 0;
      }
      int v9 = 8;
      goto LABEL_18;
    case 4:
      char v7 = *((unsigned char *)a1 + 15);
      goto LABEL_13;
    case 5:
      char v7 = *((unsigned char *)a1 + 14);
      goto LABEL_13;
    case 6:
      *(_OWORD *)a3 = *(_OWORD *)(a1 + 6);
      if (!a5) {
        return 0;
      }
      int v9 = 16;
      goto LABEL_18;
    case 7:
      char v7 = *((unsigned char *)a1 + 12);
      goto LABEL_13;
    case 8:
      char v7 = *((unsigned char *)a1 + 13);
LABEL_13:
      *(unsigned char *)a3 = v7;
      if (!a5) {
        return 0;
      }
      int v9 = 1;
      goto LABEL_18;
    case 10:
      int v8 = a1[10];
LABEL_16:
      *(_DWORD *)a3 = v8;
      if (!a5) {
        return 0;
      }
      int v9 = 4;
LABEL_18:
      uint64_t result = 0;
      *a5 = v9;
      return result;
    default:
      return result;
  }
}

uint64_t simulationBackendFlash(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  *(unsigned char *)(a1 + 44) = 1;
  *(_OWORD *)(a1 + 45) = *a4;
  return 0;
}

uint64_t simulationBackendGetFlags(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 44)) {
    return 6;
  }
  else {
    return 4;
  }
}

uint64_t simulationBackendGetActiveVersion(uint64_t a1, _DWORD *a2, _WORD *a3)
{
  *a2 = 0;
  *a3 = 0;
  return 0;
}

uint64_t simulationBackendGetStagedVersion(uint64_t a1, _OWORD *a2)
{
  *a2 = *(_OWORD *)(a1 + 45);
  return 0;
}

uint64_t personalizationBackendCreate(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 30;
  }
  uint64_t v6 = (char *)uarpZalloc(0x40uLL);
  if (!v6) {
    return 11;
  }
  *(void *)uint64_t v6 = *(void *)a2;
  *((_WORD *)v6 + 4) = *(_WORD *)(a2 + 8);
  *((void *)v6 + 2) = *(void *)(a2 + 16);
  v7.i32[0] = *(_DWORD *)(a2 + 40);
  int16x8_t v8 = (int16x8_t)vmovl_u8(v7);
  *(int8x8_t *)v8.i8 = vext_s8(*(int8x8_t *)v8.i8, (int8x8_t)vuzp1_s16(*(int16x4_t *)v8.i8, vdup_lane_s16(*(int16x4_t *)v8.i8, 1)), 6uLL);
  *((_DWORD *)v6 + 10) = vmovn_s16(v8).u32[0];
  *((_DWORD *)v6 + 11) = *(_DWORD *)(a2 + 44);
  unint64_t v9 = *(void *)(a2 + 32);
  if (v9)
  {
    if (v9 <= 0xF)
    {
      uarpFree(v6);
      return 30;
    }
    *(_OWORD *)(v6 + 24) = *(_OWORD *)*(void *)(a2 + 24);
  }
  else
  {
    *((void *)v6 + 3) = 0;
    *((void *)v6 + 4) = 0;
  }
  uint64_t v10 = 0;
  *((void *)v6 + 7) = a3;
  *a1 = v6;
  return v10;
}

uint64_t personalizationBackendDestroy(void **a1)
{
  *a1 = 0;
  return 0;
}

uint64_t personalizationBackendGetPersParam(_DWORD *__src, int a2, void *__dst, unsigned int a4, unsigned int *a5)
{
  uint64_t result = 30;
  if (__src && __dst)
  {
    uint64_t result = 26;
    unsigned int v10 = 8;
    switch(a2)
    {
      case 0:
        __src += 10;
        goto LABEL_11;
      case 1:
        __src += 2;
        unsigned int v10 = 2;
        goto LABEL_19;
      case 2:
        goto LABEL_19;
      case 3:
        __src += 4;
        goto LABEL_19;
      case 4:
        __src = (_DWORD *)((char *)__src + 41);
        goto LABEL_11;
      case 5:
        __src = (_DWORD *)((char *)__src + 43);
        goto LABEL_11;
      case 6:
        __src += 6;
        unsigned int v10 = 16;
        goto LABEL_19;
      case 8:
        __src = (_DWORD *)((char *)__src + 42);
LABEL_11:
        unsigned int v10 = 1;
        goto LABEL_19;
      case 10:
        int v11 = __src[11];
        __src += 11;
        if (!v11)
        {
          if (inRestore && (logLevel & 2) != 0) {
            puts("Overriding LUN to 1 since it was 0 or unspecified");
          }
          else {
            uarpLogInfo(3u, "Overriding LUN to 1 since it was 0 or unspecified\n");
          }
          *__src = 1;
        }
        unsigned int v10 = 4;
LABEL_19:
        if (v10 > a4)
        {
          uint64_t result = 30;
        }
        else
        {
          memcpy(__dst, __src, v10);
          uint64_t result = 0;
          if (a5) {
            *a5 = v10;
          }
        }
        break;
      default:
        return result;
    }
  }
  return result;
}

uint64_t personalizationBackendGetFlags(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    int v1 = 10;
  }
  else {
    int v1 = 8;
  }
  return v1 | (4 * *(unsigned __int8 *)(a1 + 43));
}

uint64_t personalizationBackendGetActiveVersion(uint64_t a1, _DWORD *a2, _WORD *a3)
{
  *a2 = 0;
  *a3 = 0;
  return 0;
}

uint64_t personalizationBackendFlash(uint64_t a1, uint64_t a2, unsigned int a3, _OWORD *a4)
{
  if (inRestore && (logLevel & 2) != 0) {
    puts("Staging FW in personalization backend");
  }
  else {
    uarpLogInfo(3u, "Staging FW in personalization backend\n");
  }
  uint64_t v8 = *(void *)(a1 + 56);
  unint64_t v9 = *(uint64_t **)(v8 + 1368);
  v23[0] = 0;
  uint64_t result = DynamicAssetCreate(v23);
  if (!result)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
    memset(v13, 0, sizeof(v13));
    uarpZero(v13, 0xE0uLL);
    *((void *)&v14 + 1) = DynamicAssetUARPGetBytes;
    *(void *)&long long v15 = DynamicAssetUARPSetBytes;
    *(void *)&long long v18 = fAssetProcessingNotification2_0;
    unsigned int v12 = 1297238342;
    uarpPlatformEndpointPrepareDynamicAsset(v8, v8 + 1080, v23[0], &v12, (uint64_t)v13);
    uint64_t result = uarpPersonalizationRequestAssetInitialize(v8, v23[0], 1);
    if (!result)
    {
      unsigned __int16 v11 = 0;
      uint64_t result = uarpPlatformAssetQueryAssetID(*v9, &v11);
      if (!result)
      {
        uint64_t result = uarpPersonalizationRequestAddRemoteAssetID(v8, v23[0], v11);
        if (!result)
        {
          uint64_t result = UARPSuperBinaryPreparePayload(v8, v23[0], 0, &v12, a4);
          if (!result)
          {
            uint64_t result = UARPSuperBinaryAddPayloadMetaData(v8, v23[0], 0, 0xCCD28111, 4u, (uint64_t)&v12);
            if (!result)
            {
              uint64_t result = UARPSuperBinaryAddPayloadDataLarge(v8, v23[0], 0, a2, a3);
              if (!result)
              {
                uint64_t result = UARPSuperBinaryFinalizeHeader(v8, v23[0]);
                if (!result)
                {
                  if (inRestore && (logLevel & 2) != 0) {
                    puts("Offering FIRM to controller");
                  }
                  else {
                    uarpLogInfo(3u, "Offering FIRM to controller\n");
                  }
                  uint64_t result = uarpPlatformEndpointOfferAsset(v8, v8 + 1080, v23[0]);
                  if (!result) {
                    *(unsigned char *)(a1 + 48) = 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t fAssetProcessingNotification2_0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a3;
  DynamicAssetDestroy(&v5);
  if (inRestore && (logLevel & 2) != 0) {
    puts("USBCUpdate: Calling Asset Fully Staged from Processing Notification");
  }
  else {
    uarpLogInfo(3u, "USBCUpdate: Calling Asset Fully Staged from Processing Notification\n");
  }
  return uarpPlatformEndpointAssetFullyStaged(a1, **(void **)(a1 + 1368));
}

uint64_t personalizationBackendTagHint(uint64_t a1, int a2)
{
  if (!a1) {
    return 30;
  }
  int v4 = *(_DWORD *)(a1 + 44);
  if (v4)
  {
    if (v4 != a2)
    {
      if (inRestore) {
        printf("Warning: Frontend expects tag to be %d, but Backend is using tag %d\n", a2, v4);
      }
      else {
        uarpLogError(3u, "Warning: Frontend expects tag to be %d, but Backend is using tag %d\n", a2, v4);
      }
    }
    return 0;
  }
  else
  {
    if (inRestore && (logLevel & 2) != 0) {
      printf("Switching to using LUN %d based on hint\n", a2);
    }
    else {
      uarpLogInfo(3u, "Switching to using LUN %d based on hint\n", a2);
    }
    uint64_t result = 0;
    *(_DWORD *)(a1 + 44) = a2;
  }
  return result;
}

uint64_t BackendCreate(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v6 = uarpZalloc(0x50uLL);
  uint8x8_t v7 = v6;
  uint64_t v8 = (char *)*((void *)a2 + 3);
  if (!v8)
  {
    uint64_t v12 = *((void *)a2 + 2);
    if (v12)
    {
      v6[1] = personalizationBackendDestroy;
      v6[2] = personalizationBackendGetPersParam;
      v6[3] = personalizationBackendFlash;
      v6[4] = personalizationBackendGetFlags;
      v6[6] = personalizationBackendGetActiveVersion;
      v6[9] = personalizationBackendTagHint;
      uint64_t v9 = personalizationBackendCreate(v6, v12, a3);
      if (!v9) {
        goto LABEL_3;
      }
    }
    else if (a2[2])
    {
      v6[1] = simulationBackendDestroy;
      v6[2] = simulationBackendGetPersParam;
      v6[3] = simulationBackendFlash;
      v6[4] = simulationBackendGetFlags;
      v6[6] = simulationBackendGetActiveVersion;
      v6[7] = simulationBackendGetStagedVersion;
      uint64_t v9 = simulationBackendCreate(v6);
      if (!v9) {
        goto LABEL_3;
      }
    }
    else
    {
      v6[1] = internalBackendDestroy;
      v6[2] = internalBackendGetPersParam;
      v6[3] = internalBackendFlash;
      v6[4] = internalBackendGetFlags;
      v6[6] = internalBackendGetActiveVersion;
      v6[7] = internalBackendGetStagedVersion;
      v6[8] = internalBackendApply;
      uint64_t v9 = internalBackendCreate((uint64_t **)v6, *a2, *((_DWORD *)a2 + 1), a2[8], a2[1] != 0, a2[9], a2[10], *((_DWORD *)a2 + 18));
      if (!v9) {
        goto LABEL_3;
      }
    }
LABEL_7:
    uint64_t v10 = v9;
    uarpFree(v7);
    return v10;
  }
  v6[1] = externalBackendDestroy;
  v6[2] = externalBackendGetPersParam;
  v6[3] = externalBackendFlash;
  v6[4] = externalBackendGetFlags;
  v6[9] = externalBackendTagHint;
  uint64_t v9 = externalBackendCreate(v6, v8, a3, a2[9]);
  if (v9) {
    goto LABEL_7;
  }
LABEL_3:
  uint64_t v10 = 0;
  *a1 = v7;
  return v10;
}

uint64_t BackendDestroy(void **a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (uint64_t (*)(void))v2[1];
  if (v3)
  {
    uint64_t v4 = v3();
    uint64_t v2 = *a1;
  }
  else
  {
    uint64_t v4 = 26;
  }
  uarpFree(v2);
  *a1 = 0;
  return v4;
}

uint64_t BackendGetPersParam(void *a1)
{
  int v1 = (uint64_t (*)(void))a1[2];
  if (v1) {
    return v1(*a1);
  }
  else {
    return 26;
  }
}

uint64_t BackendFlash(void *a1)
{
  int v1 = (uint64_t (*)(void))a1[3];
  if (v1) {
    return v1(*a1);
  }
  else {
    return 26;
  }
}

uint64_t BackendGetFlags(void *a1)
{
  int v1 = (uint64_t (*)(void))a1[4];
  if (v1) {
    return v1(*a1);
  }
  else {
    return 0;
  }
}

uint64_t BackendGetActiveVersion(void *a1)
{
  int v1 = (uint64_t (*)(void))a1[6];
  if (v1) {
    return v1(*a1);
  }
  else {
    return 26;
  }
}

uint64_t BackendGetStagedVersion(void *a1)
{
  int v1 = (uint64_t (*)(void))a1[7];
  if (v1) {
    return v1(*a1);
  }
  else {
    return 26;
  }
}

uint64_t BackendApplyAssets(void *a1)
{
  int v1 = (uint64_t (*)(void))a1[8];
  if (v1) {
    return v1(*a1);
  }
  else {
    return 26;
  }
}

uint64_t BackendTagHint(void *a1)
{
  int v1 = (uint64_t (*)(void))a1[9];
  if (v1) {
    return v1(*a1);
  }
  else {
    return 26;
  }
}

uint64_t FWImageCreate(void *a1)
{
  if (!a1) {
    return 30;
  }
  uint64_t v2 = uarpZalloc(0x48uLL);
  *a1 = v2;
  if (v2) {
    return 0;
  }
  else {
    return 11;
  }
}

uint64_t FWImageDestroy(void **a1)
{
  if (!a1) {
    return 30;
  }
  if (!*a1) {
    return 30;
  }
  for (uint64_t i = 32; i != 64; i += 8)
  {
    uint64_t v3 = *(void **)((char *)*a1 + i);
    if (v3)
    {
      uarpFree(v3);
      *(void *)((char *)*a1 + i) = 0;
    }
  }
  uarpFree(*a1);
  uint64_t result = 0;
  *a1 = 0;
  return result;
}

uint64_t FWImageCreateImageBuffer(uint32x4_t *a1, void *a2, _DWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2 && a3)
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      if (a1[1].i32[i] != a1->i32[i]) {
        return 49;
      }
    }
    unint64_t v8 = vaddlvq_u32(*a1);
    int v9 = v8 + 64;
    if ((v8 + 64) >> 32) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v9 == 0;
    }
    if (v10)
    {
      return 54;
    }
    else
    {
      uint64_t result = (uint64_t)uarpZalloc(v8 + 64);
      if (result)
      {
        unsigned __int16 v11 = (_DWORD *)result;
        uint64_t v12 = 0;
        *(void *)&long long v13 = -1;
        *((void *)&v13 + 1) = -1;
        *(_OWORD *)(result + 32) = v13;
        *(_OWORD *)(result + 48) = v13;
        *(_OWORD *)uint64_t result = v13;
        *(_OWORD *)(result + 16) = v13;
        *(_DWORD *)uint64_t result = -1394606077;
        *(_DWORD *)(result + 4) = a1[4].i32[0];
        *(void *)(result + 8) = 0x4000002800;
        *(_DWORD *)(result + 16) = a1->i32[0];
        *(_DWORD *)(result + 20) = a1->i32[1];
        *(_DWORD *)(result + 24) = a1->i32[0] + a1->i32[1] + 64;
        *(_DWORD *)(result + 28) = a1->i32[3] + a1->i32[2];
        *(_DWORD *)(result + 32) = v9 - 64;
        unsigned int v14 = 64;
        do
        {
          memcpy((char *)v11 + v14, (const void *)a1[2].i64[v12], a1->u32[v12]);
          v14 += a1->u32[v12++];
        }
        while (v12 != 4);
        if (v14 == v9)
        {
          int v15 = CRCBuffer((uint64_t)(v11 + 16), v9 - 64, 0xFFFFFFFFLL);
          uint64_t result = 0;
          v11[9] = v15;
          *a2 = v11;
          *a3 = v9;
        }
        else
        {
          uarpFree(v11);
          return 39;
        }
      }
    }
  }
  return result;
}

uint64_t FWImageDestroyImageBuffer(void **a1)
{
  if (!a1) {
    return 30;
  }
  uint64_t v2 = *a1;
  if (!v2) {
    return 30;
  }
  uarpFree(v2);
  uint64_t result = 0;
  *a1 = 0;
  return result;
}

uint64_t FWImageSetComponentSize(uint32x4_t *a1, unsigned int a2, unsigned __int32 a3)
{
  uint64_t result = 30;
  if (a1 && a2 <= 3)
  {
    a1->i32[a2] = 0;
    uint8x8_t v7 = &a1->i8[8 * a2];
    BOOL v10 = (void *)*((void *)v7 + 4);
    int v9 = v7 + 32;
    unint64_t v8 = v10;
    if (v10)
    {
      uarpFree(v8);
      *int v9 = 0;
    }
    unint64_t v11 = vaddlvq_u32(*a1);
    if ((v11 + 64) >> 32) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = (v11 + 64);
    }
    if (v12 + (unint64_t)a3 > 0x7C000)
    {
      return 39;
    }
    else
    {
      long long v13 = uarpZalloc(a3);
      *int v9 = v13;
      if (v13)
      {
        uint64_t result = 0;
        unsigned int v14 = &a1->i32[a2];
        *unsigned int v14 = a3;
        v14[4] = 0;
      }
      else
      {
        return 11;
      }
    }
  }
  return result;
}

uint64_t FWImageSetActiveComponent(uint64_t a1, int a2)
{
  if (!a1) {
    return 30;
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 68) = a2;
  return result;
}

uint64_t FWImageAddBytes(uint64_t a1, const void *a2, size_t __n)
{
  uint64_t result = 30;
  if (a1 && a2 && __n)
  {
    uint64_t v5 = *(int *)(a1 + 68);
    uint64_t v6 = (_DWORD *)(a1 + 4 * v5);
    uint64_t v7 = v6[4];
    int v8 = v7 + __n;
    if ((v7 + __n) > *v6)
    {
      return 39;
    }
    else
    {
      memcpy((void *)(*(void *)(a1 + 8 * v5 + 32) + v7), a2, __n);
      uint64_t result = 0;
      *(_DWORD *)(a1 + 4 * *(int *)(a1 + 68) + 16) = v8;
    }
  }
  return result;
}

uint64_t FWImageSetFWVersion(uint64_t a1, int a2)
{
  if (!a1) {
    return 30;
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 64) = a2;
  return result;
}

uint64_t getAHPMAddressForRID(char a1, void *a2)
{
  kern_return_t MatchingServices;
  uint64_t CFProperty;
  io_registry_entry_t v8;
  io_object_t v9;
  CFTypeID TypeID;
  const char *v11;
  io_iterator_t existing;
  char valuePtr;

  unsigned int valuePtr = a1;
  CFDictionaryRef v3 = IOServiceMatching("AppleHPMDeviceHALType3");
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt8Type, &valuePtr);
  add_property_match(v3, @"RID", v5);
  existing = 0;
  MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x263F0EC90], v3, &existing);
  if (MatchingServices)
  {
    CFProperty = 3758097136;
    if (inRestore) {
      printf("Error finding IOKit service: 0x%x\n", MatchingServices);
    }
    else {
      uarpLogError(3u, "Error finding IOKit service: 0x%x\n");
    }
    return CFProperty;
  }
  if (!existing)
  {
    CFProperty = 3758097136;
    if (inRestore) {
      puts("Found no matching services");
    }
    else {
      uarpLogError(3u, "Found no matching services\n");
    }
    return CFProperty;
  }
  int v8 = IOIteratorNext(existing);
  if (!v8) {
    goto LABEL_22;
  }
  int v9 = v8;
  CFProperty = (uint64_t)IORegistryEntryCreateCFProperty(v8, @"Address", v4, 0);
  IOObjectRelease(v9);
  if (!CFProperty)
  {
    if (inRestore) {
      puts("Cannot find address");
    }
    else {
      uarpLogError(3u, "Cannot find address\n");
    }
LABEL_22:
    CFProperty = 0;
    goto LABEL_23;
  }
  TypeID = CFNumberGetTypeID();
  if (TypeID == CFGetTypeID((CFTypeRef)CFProperty))
  {
    if (!inRestore)
    {
      uarpLogError(3u, "Address not number type\n");
      goto LABEL_23;
    }
    unint64_t v11 = "Address not number type";
    goto LABEL_20;
  }
  if (!CFNumberGetValue((CFNumberRef)CFProperty, kCFNumberSInt32Type, a2))
  {
    if (!inRestore)
    {
      uarpLogError(3u, "Couldn't get number value\n");
      goto LABEL_23;
    }
    unint64_t v11 = "Couldn't get number value";
LABEL_20:
    puts(v11);
  }
LABEL_23:
  if (existing) {
    IOObjectRelease(existing);
  }
  if (CFProperty)
  {
    CFRelease((CFTypeRef)CFProperty);
    return 0;
  }
  return CFProperty;
}

CFDictionaryRef add_property_match(const __CFDictionary *a1, const void *a2, const void *a3)
{
  int v6 = CFDictionaryContainsKey(a1, @"IOPropertyMatch");
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (v6)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"IOPropertyMatch");
    MutableCopy = CFDictionaryCreateMutableCopy(v7, 2, Value);
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  BOOL v10 = MutableCopy;
  CFDictionaryAddValue(MutableCopy, a2, a3);
  CFDictionaryAddValue(a1, @"IOPropertyMatch", v10);
  CFRelease(v10);
  CFRelease(a3);
  return a1;
}

uint64_t getAHPMLibInterfaceForRID(int a1, void *a2)
{
  kern_return_t MatchingServices;
  uint64_t v6;
  io_object_t v7;
  io_service_t v8;
  CFUUIDRef v9;
  CFUUIDRef v10;
  IOCFPlugInInterface **v11;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  CFUUIDRef v13;
  CFUUIDBytes v14;
  int v15;
  IOCFPlugInInterface **theInterface;
  SInt32 theScore;
  io_iterator_t existing;
  uint64_t v20;
  char valuePtr;

  unsigned int valuePtr = a1;
  if (inRestore && (logLevel & 2) != 0) {
    printf("Trying to find AHPMLibInterface for RID 0x%02x\n", a1);
  }
  else {
    uarpLogInfo(3u, "Trying to find AHPMLibInterface for RID 0x%02x\n", a1);
  }
  CFDictionaryRef v3 = IOServiceMatching("AppleHPMARM");
  CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt8Type, &valuePtr);
  add_property_match(v3, @"RID", v4);
  long long v20 = 0;
  existing = 0;
  MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x263F0EC90], v3, &existing);
  int v6 = 3758097136;
  if (MatchingServices)
  {
    if (inRestore) {
      printf("Error finding IOKit service: 0x%x\n", MatchingServices);
    }
    else {
      uarpLogError(3u, "Error finding IOKit service: 0x%x\n");
    }
  }
  else if (existing)
  {
    CFAllocatorRef v7 = IOIteratorNext(existing);
    int v6 = 3758097088;
    if (v7)
    {
      int v8 = v7;
      do
      {
        theScore = 0;
        theInterface = 0;
        int v9 = CFUUIDGetConstantUUIDWithBytes(0, 0x12u, 0xA1u, 0xDCu, 0xCFu, 0xCFu, 0x7Au, 0x47u, 0x75u, 0xBEu, 0xE5u, 0x9Cu, 0x43u, 0x19u, 0xF4u, 0xCDu, 0x2Bu);
        BOOL v10 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
        if (!IOCreatePlugInInterfaceForService(v8, v9, v10, &theInterface, &theScore))
        {
          unint64_t v11 = theInterface;
          QueryInterface = (*theInterface)->QueryInterface;
          long long v13 = CFUUIDGetConstantUUIDWithBytes(0, 0xC1u, 0x3Au, 0xCDu, 0xD9u, 0x20u, 0x9Eu, 0x4Bu, 1u, 0xB7u, 0xBEu, 0xE0u, 0x5Cu, 0xD8u, 0x83u, 0xC7u, 0xB1u);
          unsigned int v14 = CFUUIDGetUUIDBytes(v13);
          int v15 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t *))QueryInterface)(v11, *(void *)&v14.byte0, *(void *)&v14.byte8, &v20);
          if (v15)
          {
            if (inRestore) {
              printf("QueryInterface returned 0x%08x\n", v15);
            }
            else {
              uarpLogError(3u, "QueryInterface returned 0x%08x\n", v15);
            }
          }
          ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
        }
        IOObjectRelease(v8);
        int v8 = IOIteratorNext(existing);
      }
      while (v8);
      if (v20)
      {
        int v6 = 0;
        *a2 = v20;
      }
    }
    if (existing) {
      IOObjectRelease(existing);
    }
  }
  else if (inRestore)
  {
    puts("Found no matching services");
  }
  else
  {
    uarpLogError(3u, "Found no matching services\n");
  }
  return v6;
}

uint64_t destroyAHPMLibInterface(uint64_t *a1)
{
  if (!a1) {
    return 3758097090;
  }
  uint64_t v2 = *a1;
  if (!v2) {
    return 3758097090;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 24))(v2);
  *a1 = 0;
  return result;
}

uint64_t readBootArg()
{
  if (os_parse_boot_arg_int()) {
    return 0;
  }
  else {
    return 3758097136;
  }
}

uint64_t delay_ms(unsigned int a1)
{
  uint64_t v1 = 1000 * a1;
  if ((v1 & 0xFFFFFFFF00000000) != 0) {
    return 3758097090;
  }
  usleep(v1);
  return 0;
}

uint64_t num_updatable_hpms()
{
  if (!ace_lookup_complete) {
    lookup_updatable_aces();
  }
  return num_updatable_aces;
}

void *lookup_updatable_aces()
{
  ace_lookup_complete = 0;
  num_updatable_aces = 0;
  edt_matching_dict = get_edt_matching_dict();
  io_iterator_t existing = 0;
  uint64_t result = (void *)IOServiceGetMatchingServices(*MEMORY[0x263F0EC90], edt_matching_dict, &existing);
  if (!result)
  {
    io_object_t v2 = IOIteratorNext(existing);
    unsigned int v3 = num_updatable_aces;
    if (v2) {
      BOOL v4 = num_updatable_aces > 7;
    }
    else {
      BOOL v4 = 1;
    }
    if (!v4)
    {
      io_registry_entry_t v9 = v2;
      while (1)
      {
        uint64_t v16 = 0;
        if (os_parse_boot_arg_int() && v16 == 1) {
          break;
        }
        int v15 = 0;
        if (!get_u32_from_edt_prop(v9, @"usbc-update-protocol", (UInt8 *)&v15))
        {
          if ((v15 - 1) > 1)
          {
            if (inRestore && (logLevel & 2) != 0) {
              printf("Unexpected usbc-update-protocol value %d\n");
            }
            else {
              uarpLogInfo(3u, "Unexpected usbc-update-protocol value %d\n", v15);
            }
            goto LABEL_48;
          }
          if (!inRestore || (logLevel & 2) == 0)
          {
            uarpLogInfo(3u, "Found updatable Ace based on usbc-update-protocol value\n");
LABEL_37:
            LODWORD(v16) = -1;
            if (get_u32_from_edt_prop(v9, @"rid", (UInt8 *)&v16) || v16 >= 0x100)
            {
              if (inRestore) {
                puts("Couldn't find RID for service, skipping!");
              }
              else {
                uarpLogError(3u, "Couldn't find RID for service, skipping!\n");
              }
            }
            else
            {
              int v12 = num_updatable_aces;
              lun_to_rid_lookup[num_updatable_aces] = v16;
              num_updatable_aces = v12 + 1;
            }
            goto LABEL_48;
          }
          unint64_t v11 = "Found updatable Ace based on usbc-update-protocol value";
LABEL_36:
          puts(v11);
          goto LABEL_37;
        }
        if (inRestore) {
          printf("Error when reading usbc-update-protocol: 0x%x\n");
        }
        else {
          uarpLogError(3u, "Error when reading usbc-update-protocol: 0x%x\n");
        }
LABEL_48:
        IOObjectRelease(v9);
        io_object_t v13 = IOIteratorNext(existing);
        unsigned int v3 = num_updatable_aces;
        if (v13)
        {
          io_registry_entry_t v9 = v13;
          if (num_updatable_aces < 8) {
            continue;
          }
        }
        goto LABEL_7;
      }
      if (!inRestore || (logLevel & 2) == 0)
      {
        uarpLogInfo(3u, "Skipping updatable check due to bootarg\n");
        goto LABEL_37;
      }
      unint64_t v11 = "Skipping updatable check due to bootarg";
      goto LABEL_36;
    }
LABEL_7:
    if (existing)
    {
      IOObjectRelease(existing);
      unsigned int v3 = num_updatable_aces;
    }
    uint64_t result = &unk_26AA3A000;
    if (v3 >= 2)
    {
      for (uint64_t i = 1; i != v3; ++i)
      {
        unint64_t v6 = 0;
        unsigned int v7 = lun_to_rid_lookup[0];
        do
        {
          unsigned int v8 = lun_to_rid_lookup[v6 + 1];
          if (v7 <= v8)
          {
            unsigned int v7 = lun_to_rid_lookup[v6 + 1];
          }
          else
          {
            lun_to_rid_lookup[v6] = v8;
            lun_to_rid_lookup[v6 + 1] = v7;
          }
          ++v6;
        }
        while (v6 < v3 - i);
      }
    }
    ace_lookup_complete = 1;
  }
  return result;
}

uint64_t get_rid_for_lun(int a1, unsigned char *a2)
{
  if (!ace_lookup_complete) {
    lookup_updatable_aces();
  }
  uint64_t result = 3758097090;
  if (a1 >= 1 && num_updatable_aces >= a1)
  {
    uint64_t result = 0;
    *a2 = lun_to_rid_lookup[a1 - 1];
  }
  return result;
}

uint64_t get_tag_for_rid(int a1, int *a2)
{
  kern_return_t MatchingServices;
  uint64_t v7;
  io_object_t v8;
  io_registry_entry_t v9;
  io_iterator_t existing;
  UInt8 bytes[4];
  int v13;

  io_object_t v13 = 1;
  edt_matching_dict = get_edt_matching_dict();
  *(_DWORD *)bytes = a1;
  CFDataRef v5 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, 4);
  add_property_match(edt_matching_dict, @"rid", v5);
  io_iterator_t existing = 0;
  MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x263F0EC90], edt_matching_dict, &existing);
  if (MatchingServices)
  {
    unsigned int v7 = 3758097136;
    if (inRestore) {
      printf("Error finding matching device tree nodes: 0x%x\n", MatchingServices);
    }
    else {
      uarpLogError(3u, "Error finding matching device tree nodes: 0x%x\n");
    }
  }
  else if (existing)
  {
    unsigned int v8 = IOIteratorNext(existing);
    if (v8)
    {
      io_registry_entry_t v9 = v8;
      do
      {
        get_u32_from_edt_prop(v9, @"tag-number", (UInt8 *)&v13);
        if (inRestore && (logLevel & 2) != 0) {
          printf("Found tag value %d for RID %d\n", v13, a1);
        }
        else {
          uarpLogInfo(3u, "Found tag value %d for RID %d\n", v13, a1);
        }
        IOObjectRelease(v9);
        io_registry_entry_t v9 = IOIteratorNext(existing);
      }
      while (v9);
    }
    if (existing) {
      IOObjectRelease(existing);
    }
    unsigned int v7 = 0;
    *a2 = v13;
  }
  else
  {
    unsigned int v7 = 3758097136;
    if (inRestore) {
      puts("Found no matching device tree nodes");
    }
    else {
      uarpLogError(3u, "Found no matching device tree nodes\n");
    }
  }
  return v7;
}

__CFDictionary *get_edt_matching_dict()
{
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 2, MEMORY[0x263EFFF70]);
  CFArrayAppendValue(Mutable, @"usbc,sn201202x,spmi");
  CFArrayAppendValue(Mutable, @"usbc,sn201202x,iic");
  uint64_t v1 = CFDictionaryCreateMutable(0, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v1, @"IONameMatch", Mutable);
  CFRelease(Mutable);
  return v1;
}

uint64_t get_u32_from_edt_prop(io_registry_entry_t a1, const __CFString *a2, UInt8 *a3)
{
  uint64_t v4 = 3758097084;
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a1, a2, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!CFProperty) {
    return 3758097136;
  }
  CFDataRef v6 = CFProperty;
  if (CFDataGetLength(CFProperty) >= 4)
  {
    v8.location = 0;
    v8.length = 4;
    CFDataGetBytes(v6, v8, a3);
    uint64_t v4 = 0;
  }
  CFRelease(v6);
  return v4;
}

uint64_t set_nvram_variable(const char *a1, const UInt8 *a2, CFIndex a3)
{
  kern_return_t v14;

  uint64_t v6 = 3758097086;
  io_registry_entry_t v7 = IORegistryEntryFromPath(*MEMORY[0x263F0EC90], "IODeviceTree:/options");
  if (!v7) {
    return 3758097136;
  }
  io_registry_entry_t v8 = v7;
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v10 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], a1, 0x600u);
  if (v10)
  {
    CFStringRef v11 = v10;
    CFDataRef v12 = CFDataCreateWithBytesNoCopy(v9, a2, a3, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
    if (v12)
    {
      CFDataRef v13 = v12;
      unsigned int v14 = IORegistryEntrySetCFProperty(v8, v11, v12);
      if (v14)
      {
        if (inRestore) {
          printf("Failed to set nvram variable %s: 0x%x\n", a1, v14);
        }
        else {
          uarpLogError(3u, "Failed to set nvram variable %s: 0x%x\n", a1, v14);
        }
        uint64_t v6 = 3758097129;
      }
      else
      {
        uint64_t v6 = 0;
      }
      CFRelease(v13);
    }
    CFRelease(v11);
  }
  IOObjectRelease(v8);
  return v6;
}

uint64_t get_number_of_uart_hpms(int a1, uint64_t a2, unsigned int a3, unsigned char *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  *(void *)buffer = 0;
  uint64_t v23 = 0;
  uint64_t v8 = 3758097136;
  int v25 = 0;
  uint64_t v24 = 0;
  *a4 = 0;
  edt_matching_dict = get_edt_matching_dict();
  *(_DWORD *)bytes = a1;
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v11 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, 4);
  add_property_match(edt_matching_dict, @"rid", v11);
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC90], edt_matching_dict);
  if (MatchingService)
  {
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, @"uart-hpm-rids", v10, 0);
    if (CFProperty)
    {
      CFDataRef v14 = CFProperty;
      unint64_t Length = CFDataGetLength(CFProperty);
      if (Length >= 4)
      {
        unint64_t v16 = Length;
        if (Length > 0x1C) {
          return 3758096385;
        }
        if ((Length & 3) == 0)
        {
          v27.length = CFDataGetLength(v14);
          v27.location = 0;
          CFDataGetBytes(v14, v27, buffer);
          if (!a3)
          {
LABEL_16:
            uint64_t v8 = 0;
LABEL_17:
            CFRelease(v14);
            return v8;
          }
          uint64_t v17 = 0;
          if (a3 >= v16 >> 2) {
            unint64_t v18 = v16 >> 2;
          }
          else {
            unint64_t v18 = a3;
          }
          while (1)
          {
            unsigned int v19 = *(_DWORD *)&buffer[4 * v17];
            if (v19 >= 0x100)
            {
              if (inRestore) {
                printf("Invalid UART RID 0x%x for SPI RID 0x%x\n", *(_DWORD *)&buffer[4 * v17], a1);
              }
              else {
                uarpLogError(3u, "Invalid UART RID 0x%x for SPI RID 0x%x\n", *(_DWORD *)&buffer[4 * v17], a1);
              }
              unsigned int v19 = *(_DWORD *)&buffer[4 * v17];
              if (v19 > 0xFF) {
                break;
              }
            }
            *(unsigned char *)(a2 + v17) = v19;
            ++*a4;
            if (++v17 >= v18) {
              goto LABEL_16;
            }
          }
        }
      }
      uint64_t v8 = 3758096385;
      goto LABEL_17;
    }
  }
  return v8;
}

uint64_t get_retimer_service(int a1, _DWORD *a2)
{
  *a2 = 0;
  edt_matching_dict = get_edt_matching_dict();
  *(_DWORD *)bytes = a1;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, 4);
  add_property_match(edt_matching_dict, @"rid", v6);
  mach_port_t v7 = *MEMORY[0x263F0EC90];
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC90], edt_matching_dict);
  if (MatchingService)
  {
    io_registry_entry_t v9 = MatchingService;
    int v19 = 0;
    unsigned int u32_from_edt_prop = get_u32_from_edt_prop(MatchingService, @"usbc-update-protocol", (UInt8 *)&v19);
    if (u32_from_edt_prop)
    {
      if (u32_from_edt_prop == -536870160) {
        return 0;
      }
      else {
        return u32_from_edt_prop;
      }
    }
    else if (v19 == 2)
    {
      int v18 = 0;
      uint64_t v11 = get_u32_from_edt_prop(v9, @"spi-flash-parent", (UInt8 *)&v18);
      *(_DWORD *)long long v21 = v18;
      CFDataRef v12 = IOServiceMatching("AppleARMIICDevice");
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v5, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFDataRef v14 = CFDataCreate(v5, v21, 4);
      if (v14)
      {
        CFDataRef v15 = v14;
        CFDictionaryAddValue(Mutable, @"AAPL,phandle", v14);
        CFRelease(v15);
      }
      CFDictionarySetValue(v12, @"IOPropertyMatch", Mutable);
      io_service_t v16 = IOServiceGetMatchingService(v7, v12);
      if (v16)
      {
        *(_DWORD *)long long v21 = 0;
        IORegistryEntryGetChildEntry(v16, "IOService", (io_registry_entry_t *)v21);
        if (*(_DWORD *)v21)
        {
          *a2 = *(_DWORD *)v21;
        }
        else
        {
          uint64_t v11 = 3758097088;
          if (inRestore) {
            puts("Error finding the atcrt service (found the iic service)");
          }
          else {
            uarpLogError(3u, "Error finding the atcrt service (found the iic service)\n");
          }
        }
      }
      if (!*a2)
      {
        uint64_t v11 = 3758097088;
        if (inRestore) {
          puts("Error finding the spi-flash-parent");
        }
        else {
          uarpLogError(3u, "Error finding the spi-flash-parent\n");
        }
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (inRestore) {
      printf("Error finding matching device tree nodes: 0x%x\n", 0);
    }
    else {
      uarpLogError(3u, "Error finding matching device tree nodes: 0x%x\n", 0);
    }
    return 3758097088;
  }
  return v11;
}

uint64_t get_retimer_nor_access(io_service_t a1, unsigned int a2)
{
  io_connect_t connect = 0;
  uint64_t v3 = IOServiceOpen(a1, *MEMORY[0x263EF8960], 0, &connect);
  if (v3
    || (input = a2, outputCnt = 0, uint64_t v3 = IOConnectCallScalarMethod(connect, 3u, &input, 1u, 0, &outputCnt), v3))
  {
    if (inRestore) {
      printf("Retimer SPI NOR access failed, value = %u, status = 0x%X\n", a2, v3);
    }
    else {
      uarpLogError(3u, "Retimer SPI NOR access failed, value = %u, status = 0x%X\n", a2, v3);
    }
  }
  if (connect) {
    IOServiceClose(connect);
  }
  return v3;
}

uint64_t USBCUpdateSendManifestRequest(uint64_t a1, uint64_t a2)
{
  v29[2] = *MEMORY[0x263EF8340];
  uint64_t v19 = 0;
  uint64_t result = DynamicAssetCreate(&v19);
  if (!result)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
    memset(v9, 0, sizeof(v9));
    uarpZero(v9, 0xE0uLL);
    *((void *)&v10 + 1) = DynamicAssetUARPGetBytes;
    *(void *)&long long v11 = DynamicAssetUARPSetBytes;
    *((void *)&v13 + 1) = DynamicAssetUARPReleased;
    *(void *)&long long v14 = fAssetProcessingNotification2_1;
    *((void *)&v14 + 1) = fAssetProcessingNotificationAck_0;
    CFAllocatorRef v5 = uarpAssetTagStructPersonalization();
    uarpPlatformEndpointPrepareDynamicAsset(a1, a1 + 1080, v19, v5, (uint64_t)v9);
    uint64_t v6 = v19;
    int v28 = 0;
    uint64_t result = uarpPersonalizationRequestAssetInitialize(a1, v19, 1);
    if (!result)
    {
      unsigned __int16 v27 = 0;
      uint64_t result = uarpPlatformAssetQueryAssetID(*(void *)a2, &v27);
      if (!result)
      {
        uint64_t result = uarpPersonalizationRequestAddRemoteAssetID(a1, v6, v27);
        if (!result)
        {
          uint64_t result = uarpPersonalizationRequestPreparePayload(a1, v6, 0);
          if (!result)
          {
            mach_port_t v7 = uarpAssetTagStructPersonalization();
            uint64_t result = uarpPersonalizationRequestAddPayloadTag(a1, v6, 0, (uint64_t)v7);
            if (!result)
            {
              uint64_t result = uarpPersonalizationRequestAddRemoteAssetPayloadIndex(a1, v6, 0, *(unsigned __int16 *)(a2 + 16));
              if (!result)
              {
                uint64_t result = uarpPersonalizationRequestAddManifestPrefix(a1, v6, 0, (uint64_t)"USBPortController", 0x11u);
                if (!result)
                {
                  uint64_t result = uarpPersonalizationRequestAddPrefixNeedsLUN(a1, v6, 0, 1);
                  if (!result)
                  {
                    unsigned int v26 = 0;
                    BackendGetPersParam(*(void **)(a1 + 1384));
                    if (v26)
                    {
                      uint64_t result = uarpPersonalizationRequestAddLogicalUnitNumber(a1, v6, 0, v26);
                      if (!result)
                      {
                        unsigned int v25 = 0;
                        uint64_t result = BackendGetPersParam(*(void **)(a1 + 1384));
                        if (!result)
                        {
                          uint64_t result = uarpPersonalizationRequestAddChipID(a1, v6, 0, v25);
                          if (!result)
                          {
                            unint64_t v24 = 0;
                            uint64_t result = BackendGetPersParam(*(void **)(a1 + 1384));
                            if (!result)
                            {
                              uint64_t result = uarpPersonalizationRequestAddBoardID64(a1, v6, 0, v24);
                              if (!result)
                              {
                                unint64_t v23 = 0;
                                uint64_t result = BackendGetPersParam(*(void **)(a1 + 1384));
                                if (!result)
                                {
                                  uint64_t result = uarpPersonalizationRequestAddECID(a1, v6, 0, v23);
                                  if (!result)
                                  {
                                    unsigned __int8 v22 = 0;
                                    uint64_t result = BackendGetPersParam(*(void **)(a1 + 1384));
                                    if (!result)
                                    {
                                      uint64_t result = uarpPersonalizationRequestAddSecurityDomain(a1, v6, 0, v22);
                                      if (!result)
                                      {
                                        unsigned __int8 v21 = 0;
                                        uint64_t result = BackendGetPersParam(*(void **)(a1 + 1384));
                                        if (!result)
                                        {
                                          uint64_t result = uarpPersonalizationRequestAddProductionMode(a1, v6, 0, v21);
                                          if (!result)
                                          {
                                            unsigned __int8 v20 = 0;
                                            uint64_t result = BackendGetPersParam(*(void **)(a1 + 1384));
                                            if (!result)
                                            {
                                              uint64_t result = uarpPersonalizationRequestAddSecurityMode(a1, v6, 0, v20);
                                              if (!result)
                                              {
                                                v29[0] = 0;
                                                v29[1] = 0;
                                                uint64_t result = BackendGetPersParam(*(void **)(a1 + 1384));
                                                if (!result)
                                                {
                                                  uint64_t result = uarpPersonalizationRequestAddNonceHash(a1, v6, 0, (uint64_t)v29, 0x10u);
                                                  if (!result)
                                                  {
                                                    char Flags = BackendGetFlags(*(void **)(a1 + 1384));
                                                    uint64_t result = uarpPersonalizationRequestMoreRequestsToFollow(a1, v6, 0, (Flags & 0x10) != 0);
                                                    if (!result)
                                                    {
                                                      uint64_t result = uarpPersonalizationRequestAddMeasurement(a1, v6, 0, *(void *)(a2 + 40), *(_DWORD *)(a2 + 48));
                                                      if (!result)
                                                      {
                                                        uint64_t result = uarpPersonalizationRequestAssetFinalize(a1, v6);
                                                        if (!result)
                                                        {
                                                          if (inRestore && (logLevel & 2) != 0) {
                                                            puts("Offering IM4M to controller");
                                                          }
                                                          else {
                                                            uarpLogInfo(3u, "Offering IM4M to controller\n");
                                                          }
                                                          return uarpPlatformEndpointOfferAsset(a1, a1 + 1080, v19);
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
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                    else
                    {
                      return 54;
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
  return result;
}

uint64_t DynamicAssetUARPReleased(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  return DynamicAssetDestroy(&v4);
}

uint64_t fAssetProcessingNotification2_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 0;
}

uint64_t fAssetProcessingNotificationAck_0()
{
  return 0;
}

uint64_t DynamicAssetCreate(void *a1)
{
  io_object_t v2 = uarpZalloc(0x10uLL);
  v2[1] = uarpZalloc(0x64uLL);
  *((_DWORD *)v2 + 1) = 100;
  *a1 = v2;
  return 0;
}

uint64_t DynamicAssetDestroy(void **a1)
{
  *a1 = 0;
  return 0;
}

uint64_t DynamicAssetGetBytesAtOffset(uint64_t a1, void *__dst, unsigned int a3, unsigned int a4, _WORD *a5)
{
  unsigned int v6 = *(_DWORD *)a1 - a4;
  if (*(_DWORD *)a1 >= a4)
  {
    if (v6 >= a3) {
      size_t v7 = a3;
    }
    else {
      size_t v7 = v6;
    }
    memcpy(__dst, (const void *)(*(void *)(a1 + 8) + a4), v7);
    uint64_t result = 0;
  }
  else
  {
    LOWORD(v7) = 0;
    uint64_t result = 43;
  }
  *a5 = v7;
  return result;
}

uint64_t DynamicAssetSetBytesAtOffset(unsigned int *a1, const void *a2, unsigned int a3, unsigned int a4)
{
  uint64_t v4 = *a1;
  if (v4 < a4) {
    return 43;
  }
  unsigned int v10 = a3 - (v4 - a4);
  if (a3 < v4 - a4) {
    unsigned int v10 = 0;
  }
  if (v4 == a4) {
    unsigned int v11 = a3;
  }
  else {
    unsigned int v11 = v10;
  }
  unsigned int v12 = a1[1];
  if (v11 + v4 <= v12)
  {
    long long v16 = (char *)*((void *)a1 + 1);
    goto LABEL_15;
  }
  unint64_t v13 = v4 + v11;
  if (v13 > 0x773593FF) {
    return 39;
  }
  do
  {
    unsigned int v14 = v12;
    v12 *= 2;
  }
  while (v13 > v14);
  if (v14 > 0x773593FF) {
    return 39;
  }
  long long v15 = (char *)uarpZalloc(v14);
  if (v15)
  {
    long long v16 = v15;
    memcpy(v15, *((const void **)a1 + 1), *a1);
    uarpFree(*((void **)a1 + 1));
    *((void *)a1 + 1) = v16;
    a1[1] = v14;
LABEL_15:
    memcpy(&v16[a4], a2, a3);
    uint64_t result = 0;
    *a1 += v11;
    return result;
  }
  return 11;
}

uint64_t DynamicAssetUARPGetBytes(int a1, int a2, uint64_t a3, void *__dst, unsigned int a5, unsigned int a6, _WORD *a7)
{
  if (!a3) {
    return 30;
  }
  unsigned int v8 = *(_DWORD *)a3 - a6;
  if (*(_DWORD *)a3 >= a6)
  {
    if (v8 >= a5) {
      size_t v9 = a5;
    }
    else {
      size_t v9 = v8;
    }
    memcpy(__dst, (const void *)(*(void *)(a3 + 8) + a6), v9);
    uint64_t result = 0;
  }
  else
  {
    LOWORD(v9) = 0;
    uint64_t result = 43;
  }
  *a7 = v9;
  return result;
}

uint64_t DynamicAssetUARPSetBytes(uint64_t a1, uint64_t a2, unsigned int *a3, const void *a4, unsigned int a5, unsigned int a6)
{
  if (a3) {
    return DynamicAssetSetBytesAtOffset(a3, a4, a5, a6);
  }
  else {
    return 30;
  }
}

uint64_t internalBackendCreate(uint64_t **a1, int a2, int a3, int a4, int a5, int a6, char a7, int a8)
{
  int v14 = a2;
  unsigned __int8 v35 = a2;
  if (os_parse_boot_arg_string()) {
    inRestore = 1;
  }
  if ((os_parse_boot_arg_int() & 1) == 0) {
    logLevel = 1;
  }
  if (inRestore)
  {
    printf("-restore is %u\n", 1);
    if (a1) {
      goto LABEL_7;
    }
    return 30;
  }
  uarpLogError(3u, "-restore is %u\n", 0);
  if (!a1) {
    return 30;
  }
LABEL_7:
  long long v16 = (uint64_t *)uarpZalloc(0x70uLL);
  *a1 = v16;
  if (!v16) {
    return 11;
  }
  uint64_t v34 = 0;
  readBootArg();
  long long v17 = *a1;
  if (a6) {
    *((unsigned char *)v17 + 82) = 1;
  }
  *((unsigned char *)v17 + 83) = a4;
  uint64_t v33 = 0;
  if (a4) {
    readBootArg();
  }
  uint64_t v32 = 0;
  readBootArg();
  uint64_t v19 = *a1;
  *((unsigned char *)v19 + 85) = a7;
  *((_DWORD *)v19 + 27) = a8;
  uint64_t v31 = 0;
  readBootArg();
  if (a3 >= 1)
  {
    uint64_t rid_for_lun = get_rid_for_lun(a3, &v35);
    if (rid_for_lun) {
      return rid_for_lun;
    }
    int v14 = v35;
  }
  unsigned __int8 v21 = *a1;
  *((unsigned char *)v21 + 102) = v14;
  uint64_t rid_for_lun = get_tag_for_rid(v14, (int *)v21 + 3);
  if (rid_for_lun) {
    return rid_for_lun;
  }
  uint64_t AHPMLibInterfaceForRID = getAHPMLibInterfaceForRID(v35, *a1);
  if (AHPMLibInterfaceForRID)
  {
    uint64_t v18 = AHPMLibInterfaceForRID;
    goto LABEL_36;
  }
  int v30 = 0;
  uint64_t v29 = 0;
  uint64_t v23 = (*(uint64_t (**)(uint64_t, void, void, int *, uint64_t, void, uint64_t *))(*(void *)**a1 + 40))(**a1, 0, 0, &v30, 4, 0, &v29);
  if (v23) {
    goto LABEL_30;
  }
  if (v30 != 40)
  {
    if (inRestore) {
      printf("Error: Got unexpected VID 0x%x\n");
    }
    else {
      uarpLogError(3u, "Error: Got unexpected VID 0x%x\n");
    }
    goto LABEL_34;
  }
  uint64_t v23 = (*(uint64_t (**)(uint64_t, void, uint64_t, int *, uint64_t, void, uint64_t *))(*(void *)**a1 + 40))(**a1, 0, 1, &v30, 4, 0, &v29);
  if (v23) {
    goto LABEL_30;
  }
  if ((v30 - 33628200) <= 0xFFFFFFFB)
  {
    if (inRestore) {
      printf("Error: Got unexpected DID 0x%x\n");
    }
    else {
      uarpLogError(3u, "Error: Got unexpected DID 0x%x\n");
    }
LABEL_34:
    uint64_t v18 = 30;
    goto LABEL_35;
  }
  unint64_t v24 = *a1;
  *((unsigned char *)v24 + 80) = 0;
  *((unsigned char *)v24 + 104) = a5;
  if (a5)
  {
    char v28 = 1;
    uint64_t v25 = *v24;
    int v36 = 1094993493;
    LOWORD(v27) = 0;
    uint64_t v23 = (*(uint64_t (**)(uint64_t, uint64_t, int *, char *, void, void, void, uint64_t, int, uint64_t, void, _DWORD))(*(void *)v25 + 104))(v25, 1, &v36, &v28, 0, 0, 0, 1, v27, 10, 0, 0);
    if (v23 || (uint64_t v23 = wait_for_mode(**a1, 1094993493, 0, 1), v23))
    {
LABEL_30:
      uint64_t v18 = v23;
LABEL_35:
      destroyAHPMLibInterface(*a1);
LABEL_36:
      uarpFree(*a1);
      *a1 = 0;
      return v18;
    }
  }
  return 0;
}

uint64_t wait_for_mode(uint64_t a1, int a2, int a3, int a4)
{
  int v14 = 0;
  int v8 = 10;
  while (1)
  {
    int mode = get_mode(a1, &v14);
    if (!mode) {
      break;
    }
    if (inRestore) {
      printf("Warning: Received status 0x%x when reading mode, delaying 1000ms and trying again", mode);
    }
    else {
      uarpLogError(3u, "Warning: Received status 0x%x when reading mode, delaying 1000ms and trying again", mode);
    }
    delay_ms(0x3E8u);
LABEL_28:
    if (!--v8)
    {
      if (inRestore)
      {
        uint64_t v12 = 3758097129;
        printf("Ace never enterred mode 0x%x\n");
      }
      else
      {
        uint64_t v12 = 3758097129;
        uarpLogError(3u, "Ace never enterred mode 0x%x\n");
      }
      return v12;
    }
  }
  if (v14 == a2) {
    return 0;
  }
  if (v14 == 1112493908)
  {
    if (!inRestore || (logLevel & 2) == 0)
    {
      uarpLogInfo(3u, "Ace is in boot mode, trying to read mode again after 1000ms\n");
      goto LABEL_27;
    }
    unsigned int v10 = "Ace is in boot mode, trying to read mode again after 1000ms";
    goto LABEL_26;
  }
  if (v14 == 1094993493 && a3)
  {
    if (!inRestore || (logLevel & 2) == 0)
    {
      uarpLogInfo(3u, "Ace is in ADFU mode, trying to read mode again after 1000ms\n");
      goto LABEL_27;
    }
    unsigned int v10 = "Ace is in ADFU mode, trying to read mode again after 1000ms";
    goto LABEL_26;
  }
  if (v14 == 1095782432 && a4)
  {
    if (!inRestore || (logLevel & 2) == 0)
    {
      uarpLogInfo(3u, "Ace is in APP mode, trying to read mode again after 1000ms\n");
LABEL_27:
      uint64_t v11 = delay_ms(0x3E8u);
      if (v11) {
        return v11;
      }
      goto LABEL_28;
    }
    unsigned int v10 = "Ace is in APP mode, trying to read mode again after 1000ms";
LABEL_26:
    puts(v10);
    goto LABEL_27;
  }
  uint64_t v12 = 3758097129;
  if (inRestore) {
    printf("Ace in unexpected mode 0x%08x\n");
  }
  else {
    uarpLogError(3u, "Ace in unexpected mode 0x%08x\n");
  }
  return v12;
}

uint64_t internalBackendDestroy(uint64_t **a1)
{
  if (!a1) {
    return 30;
  }
  io_object_t v2 = *a1;
  if (!v2) {
    return 30;
  }
  handle_shared_spi(v2, 0);
  uint64_t v3 = *a1;
  if (**a1)
  {
    destroyAHPMLibInterface(v3);
    uint64_t v3 = *a1;
  }
  uarpFree(v3);
  uint64_t result = 0;
  *a1 = 0;
  return result;
}

uint64_t handle_shared_spi(uint64_t *a1, uint64_t a2)
{
  if (!a2)
  {
    if (*((unsigned char *)a1 + 103)) {
      goto LABEL_5;
    }
    return 0;
  }
  if (*((unsigned char *)a1 + 103)) {
    return 0;
  }
LABEL_5:
  io_service_t v4 = *((_DWORD *)a1 + 2);
  if (v4)
  {
    if (a2) {
      goto LABEL_7;
    }
LABEL_19:
    uint64_t retimer_nor_access = get_retimer_nor_access(v4, 0);
    if (retimer_nor_access)
    {
      if (inRestore) {
        printf("Error when relinquishing shared SPI access on RID%u status=0x%X\n");
      }
      else {
        uarpLogError(3u, "Error when relinquishing shared SPI access on RID%u status=0x%X\n");
      }
    }
    else
    {
      *((unsigned char *)a1 + 103) = 0;
    }
    return retimer_nor_access;
  }
  io_service_t v13 = 0;
  uint64_t retimer_nor_access = get_retimer_service(*((unsigned __int8 *)a1 + 102), &v13);
  if (retimer_nor_access) {
    return retimer_nor_access;
  }
  io_service_t v4 = v13;
  if (!v13) {
    return retimer_nor_access;
  }
  *((_DWORD *)a1 + 2) = v13;
  if (!a2) {
    goto LABEL_19;
  }
LABEL_7:
  uint64_t v5 = *a1;
  unsigned int v14 = 0;
  getAHPMAddressForRID(*((unsigned char *)a1 + 102), &v14);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, void, uint64_t, void))(*(void *)v5 + 128))(v5, v14, a2, 0);
  if (v6)
  {
    uint64_t retimer_nor_access = v6;
    if (inRestore) {
      printf("Error when powering on retimer on RID%u status=0x%X\n");
    }
    else {
      uarpLogError(3u, "Error when powering on retimer on RID%u status=0x%X\n");
    }
    return retimer_nor_access;
  }
  delay_ms(0x3E8u);
  unsigned int v7 = 0;
  do
  {
    uint64_t retimer_nor_access = get_retimer_nor_access(*((_DWORD *)a1 + 2), 1u);
    if (!retimer_nor_access)
    {
      *((unsigned char *)a1 + 103) = 1;
      return retimer_nor_access;
    }
    delay_ms(0x64u);
  }
  while (v7++ < 2);
  if (!os_parse_boot_arg_string())
  {
    if (inRestore) {
      printf("RID%u not in restore and getting exclusive access failed, status=0%X\n");
    }
    else {
      uarpLogError(3u, "RID%u not in restore and getting exclusive access failed, status=0%X\n");
    }
    return retimer_nor_access;
  }
  if (!*((unsigned char *)a1 + 102))
  {
    if (inRestore) {
      printf("RID0 cannot get exlusive access from retimer, status=0x%X, will assume implicit permission\n", retimer_nor_access);
    }
    else {
      uarpLogError(3u, "RID0 cannot get exlusive access from retimer, status=0x%X, will assume implicit permission\n", retimer_nor_access);
    }
    return 0;
  }
  if (inRestore) {
    printf("Forcing retimer at RID%u into DFU due to failure to get exclusive access, status=0x%X\n", *((unsigned __int8 *)a1 + 102), retimer_nor_access);
  }
  else {
    uarpLogError(3u, "Forcing retimer at RID%u into DFU due to failure to get exclusive access, status=0x%X\n", *((unsigned __int8 *)a1 + 102), retimer_nor_access);
  }
  uint64_t v10 = *a1;
  unsigned int v15 = 0;
  getAHPMAddressForRID(*((unsigned char *)a1 + 102), &v15);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, void, uint64_t, void))(*(void *)v10 + 120))(v10, v15, 1, 0);
  uint64_t retimer_nor_access = v11;
  if (v11)
  {
    if (inRestore) {
      printf("Error when forcing ATCRT update on RID%u status=0x%X\n", *((unsigned __int8 *)a1 + 102), v11);
    }
    else {
      uarpLogError(3u, "Error when forcing ATCRT update on RID%u status=0x%X\n", *((unsigned __int8 *)a1 + 102), v11);
    }
    (*(void (**)(uint64_t, void, void, void))(*(void *)v10 + 120))(v10, v15, 0, 0);
    if (inRestore) {
      printf("Failed to force retimer at RID%u into DFU, status=0x%X\n");
    }
    else {
      uarpLogError(3u, "Failed to force retimer at RID%u into DFU, status=0x%X\n");
    }
  }
  return retimer_nor_access;
}

uint64_t internalBackendGetPersParam(uint64_t a1, int a2, void *__dst, unsigned int a4, unsigned int *a5)
{
  uint64_t result = 30;
  if (a1 && __dst)
  {
    if (*(unsigned char *)(a1 + 81))
    {
      return 26;
    }
    else
    {
      switch(a2)
      {
        case 0:
          size_t v9 = (const void *)(a1 + 24);
          goto LABEL_22;
        case 1:
          size_t v9 = (const void *)(a1 + 26);
          goto LABEL_16;
        case 2:
          size_t v9 = (const void *)(a1 + 32);
          goto LABEL_9;
        case 3:
          size_t v9 = (const void *)(a1 + 40);
LABEL_9:
          unsigned int v10 = 8;
          goto LABEL_23;
        case 4:
          size_t v9 = (const void *)(a1 + 48);
          goto LABEL_22;
        case 5:
          size_t v9 = (const void *)(a1 + 49);
          goto LABEL_22;
        case 6:
          size_t v9 = (const void *)(a1 + 52);
          unsigned int v10 = 16;
          goto LABEL_23;
        case 7:
          size_t v9 = (const void *)(a1 + 50);
          goto LABEL_22;
        case 8:
          size_t v9 = (const void *)(a1 + 51);
          goto LABEL_22;
        case 9:
          size_t v9 = (const void *)(a1 + 28);
LABEL_16:
          unsigned int v10 = 2;
          goto LABEL_23;
        case 10:
          size_t v9 = (const void *)(a1 + 12);
          goto LABEL_20;
        case 11:
          size_t v9 = (const void *)(a1 + 68);
          goto LABEL_20;
        case 12:
          size_t v9 = (const void *)(a1 + 72);
LABEL_20:
          unsigned int v10 = 4;
          goto LABEL_23;
        case 13:
          size_t v9 = (const void *)(a1 + 102);
LABEL_22:
          unsigned int v10 = 1;
LABEL_23:
          if (v10 > a4) {
            return result;
          }
          if (*(unsigned char *)(a1 + 16)) {
            goto LABEL_27;
          }
          uint64_t result = get_pers_params((uint64_t *)a1);
          if (!result)
          {
            *(unsigned char *)(a1 + 16) = 1;
LABEL_27:
            memcpy(__dst, v9, v10);
            uint64_t result = 0;
            if (a5) {
              *a5 = v10;
            }
          }
          break;
        default:
          return result;
      }
    }
  }
  return result;
}

uint64_t get_pers_params(uint64_t *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  if (*((unsigned char *)a1 + 81))
  {
    uint64_t v3 = 26;
  }
  else
  {
    uint64_t v2 = (*(uint64_t (**)(void))(*(void *)*a1 + 40))();
    if (v2)
    {
      uint64_t v3 = v2;
    }
    else
    {
      if (inRestore) {
        printf("ERROR: Unexpected read length for register 0x2c: 0x%llx\n");
      }
      else {
        uarpLogError(3u, "ERROR: Unexpected read length for register 0x2c: 0x%llx\n");
      }
      uint64_t v3 = 39;
    }
  }
  handle_shared_spi(a1, 0);
  return v3;
}

uint64_t internalBackendFlash(void *a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v4 = 30;
  if (!a1 || !a2) {
    return v4;
  }
  if (*((unsigned char *)a1 + 81)) {
    return 26;
  }
  int v33 = 0;
  uint64_t mode = get_mode(*a1, &v33);
  if (mode) {
    return mode;
  }
  if (v33 == 1112493908)
  {
    uint64_t v4 = 3758097129;
    if (!inRestore)
    {
      uarpLogError(3u, "Ace in boot mode: Can't be updated!\n");
      return v4;
    }
    size_t v9 = "Ace in boot mode: Can't be updated!";
    goto LABEL_12;
  }
  if (v33 != 1094993493)
  {
    if (a4)
    {
      int v37 = 0;
      unsigned int v35 = 0;
      unsigned __int16 v36 = 0;
      uint64_t v34 = 0;
      if ((*(unsigned int (**)(void, void, uint64_t, int *, uint64_t, void, uint64_t *))(*(void *)*a1 + 40))(*a1, 0, 45, &v37, 4, 0, &v34))
      {
        if (inRestore) {
          printf("Bad return value from boot flags register read: 0x%x\n");
        }
        else {
          uarpLogError(3u, "Bad return value from boot flags register read: 0x%x\n");
        }
      }
      else if (v34 == 4)
      {
        int v10 = BYTE1(v37) & 7;
        if (v10 == 1 || v10 == 7 && (*((_WORD *)a1 + 14) & 0xFEu) >= 0xA2)
        {
          if (inRestore) {
            printf("Proceeding with update to %u.%u.%u.%u because Ace is booted from ramdisk\n");
          }
          else {
            uarpLogError(3u, "Proceeding with update to %u.%u.%u.%u because Ace is booted from ramdisk\n");
          }
        }
        else if (*((unsigned char *)a1 + 83) || *((unsigned char *)a1 + 84))
        {
          if ((*(unsigned int (**)(void, void, uint64_t, unsigned int *, uint64_t, void, uint64_t *))(*(void *)*a1 + 40))(*a1, 0, 15, &v35, 6, 0, &v34))
          {
            if (inRestore) {
              printf("Bad return value from version register read: 0x%x\n");
            }
            else {
              uarpLogError(3u, "Bad return value from version register read: 0x%x\n");
            }
          }
          else if (v34 == 6)
          {
            memset(__str, 0, sizeof(__str));
            if (!aceVersionToUARPVersion(v35, v36, __str))
            {
              unsigned int v11 = *a4;
              unsigned int v12 = a4[1];
              unsigned int v13 = a4[3];
              if (inRestore) {
                printf("Current firmware version: %u.%u.%u.%u, new version: %u.%u.%u.%u\n", *(_DWORD *)__str, *(_DWORD *)&__str[4], *(_DWORD *)&__str[8], *(_DWORD *)&__str[12], v11, v12, a4[2], v13);
              }
              else {
                uarpLogError(3u, "Current firmware version: %u.%u.%u.%u, new version: %u.%u.%u.%u\n", *(_DWORD *)__str, *(_DWORD *)&__str[4], *(_DWORD *)&__str[8], *(_DWORD *)&__str[12], v11, v12, a4[2], v13);
              }
              if ((*(_WORD *)__str & 0xE00) == 0)
              {
                unsigned int v14 = *a4;
                if ((*a4 & 0xE00) == 0)
                {
                  if (*(_DWORD *)__str == v14
                    && *((unsigned char *)a1 + 83)
                    && *(_DWORD *)&__str[4] == a4[1]
                    && *(_DWORD *)&__str[12] == a4[3]
                    && *(_DWORD *)&__str[8] == a4[2]
                    || *((unsigned char *)a1 + 84)
                    && (*(_DWORD *)__str > v14
                     || *(_DWORD *)__str == v14
                     && ((unsigned int v29 = a4[1], *(_DWORD *)&__str[4] > v29)
                      || *(_DWORD *)&__str[4] == v29
                      && ((unsigned int v30 = a4[2], *(_DWORD *)&__str[8] > v30)
                       || *(_DWORD *)&__str[8] == v30 && *(_DWORD *)&__str[12] > a4[3]))))
                  {
                    *((unsigned char *)a1 + 80) = 1;
                    if (inRestore) {
                      puts("Skipping firmware update due to version number check");
                    }
                    else {
                      uarpLogError(3u, "Skipping firmware update due to version number check\n");
                    }
                    goto LABEL_70;
                  }
                }
              }
            }
          }
          else if (inRestore)
          {
            printf("Unexpected version register length %llu\n");
          }
          else
          {
            uarpLogError(3u, "Unexpected version register length %llu\n");
          }
        }
        else if (inRestore)
        {
          printf("Updating to version %u.%u.%u.%u\n");
        }
        else
        {
          uarpLogError(3u, "Updating to version %u.%u.%u.%u\n");
        }
      }
      else if (inRestore)
      {
        printf("Unexpected boot flags register length %llu\n");
      }
      else
      {
        uarpLogError(3u, "Unexpected boot flags register length %llu\n");
      }
    }
    if (inRestore) {
      printf("Ace in mode 0x%08x, performing SFW flash\n", v33);
    }
    else {
      uarpLogError(3u, "Ace in mode 0x%08x, performing SFW flash\n", v33);
    }
    uint64_t mode = flash();
    if (mode) {
      return mode;
    }
    if (inRestore && (logLevel & 2) != 0) {
      puts("Persistent flash successful");
    }
    else {
      uarpLogInfo(3u, "Persistent flash successful\n");
    }
    *((unsigned char *)a1 + 80) = 1;
    if (a4)
    {
      *(_OWORD *)((char *)a1 + 86) = *(_OWORD *)a4;
      int v15 = *((unsigned __int8 *)a1 + 102);
      unsigned int v35 = 0;
      LOWORD(v37) = 0;
      uarpVersionToAceVersion(a4, &v35, &v37);
      unsigned int v16 = v35;
      LODWORD(v34) = v35;
      unsigned int v17 = (unsigned __int16)v37;
      WORD2(v34) = v37;
      *(_OWORD *)__str = 0u;
      long long v40 = 0u;
      snprintf(__str, 0x20uLL, "usbc,version,rid%d", v15);
      if (!inRestore) {
        goto LABEL_64;
      }
      if ((logLevel & 2) != 0) {
        printf("Writing NVRAM variable %s to {0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x}\n", __str, v16, BYTE1(v16), BYTE2(v16), HIBYTE(v16), v17, v17 >> 8);
      }
      else {
LABEL_64:
      }
        uarpLogInfo(3u, "Writing NVRAM variable %s to {0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x}\n", __str, v16, BYTE1(v16), BYTE2(v16), HIBYTE(v16), v17, v17 >> 8);
      int v18 = set_nvram_variable(__str, (const UInt8 *)&v34, 6);
      if (v18)
      {
        if (inRestore) {
          printf("Failed to persist FW version: 0x%x, treating as non-fatal\n", v18);
        }
        else {
          uarpLogError(3u, "Failed to persist FW version: 0x%x, treating as non-fatal\n");
        }
      }
    }
LABEL_70:
    *(_DWORD *)((char *)&v34 + 3) = 0;
    LODWORD(v34) = 0;
    unsigned __int8 v38 = 0;
    *(void *)__str = 0;
    uint64_t number_of_uart_hpms = get_number_of_uart_hpms(*((unsigned __int8 *)a1 + 102), (uint64_t)&v34, 7u, &v38);
    if (number_of_uart_hpms)
    {
      uint64_t v4 = number_of_uart_hpms;
    }
    else
    {
      if (!v38) {
        return 0;
      }
      for (unint64_t i = 0; i < v38; ++i)
      {
        uint64_t AHPMLibInterfaceForRID = getAHPMLibInterfaceForRID(*((unsigned __int8 *)&v34 + i), __str);
        if (AHPMLibInterfaceForRID)
        {
          uint64_t v22 = AHPMLibInterfaceForRID;
          if (inRestore) {
            printf("Failed to get AHPMLibInterface for RID %d: 0x%x\n", *((unsigned __int8 *)&v34 + i), AHPMLibInterfaceForRID);
          }
          else {
            uarpLogError(3u, "Failed to get AHPMLibInterface for RID %d: 0x%x\n", *((unsigned __int8 *)&v34 + i), AHPMLibInterfaceForRID);
          }
        }
        else if (*(void *)__str)
        {
          int v37 = 0;
          uint64_t v23 = get_mode(*(uint64_t *)__str, &v37);
          uint64_t v22 = v23;
          if (v23)
          {
            if (inRestore) {
              printf("Failed to get mode for RID %d: 0x%x\n");
            }
            else {
              uarpLogError(3u, "Failed to get mode for RID %d: 0x%x\n", *((unsigned __int8 *)&v34 + i), v23);
            }
          }
          else if (v37 == 1094993493)
          {
            unsigned int v35 = 1195460932;
            LOWORD(v32) = 0;
            (*(void (**)(void, uint64_t, unsigned int *, void, void, void, void, void, uint64_t, uint64_t, void, _DWORD))(**(void **)__str + 104))(*(void *)__str, 1, &v35, 0, 0, 0, 0, 0, v32, 10, 0, 0);
            if (inRestore && (logLevel & 2) != 0) {
              printf("Return value from GAID on RID %d: 0x%x\n");
            }
            else {
              uarpLogInfo(3u, "Return value from GAID on RID %d: 0x%x\n");
            }
          }
          else if (inRestore && (logLevel & 2) != 0)
          {
            printf("Not resetting RID %d in mode 0x%x\n");
          }
          else
          {
            uarpLogInfo(3u, "Not resetting RID %d in mode 0x%x\n");
          }
          destroyAHPMLibInterface((uint64_t *)__str);
        }
        else
        {
          if (inRestore) {
            printf("UART HPM interface is NULL for RID %d\n", *((unsigned __int8 *)&v34 + i));
          }
          else {
            uarpLogError(3u, "UART HPM interface is NULL for RID %d\n", *((unsigned __int8 *)&v34 + i));
          }
          uint64_t v22 = 0;
        }
      }
      uint64_t v4 = v22;
      if (v38)
      {
        for (unint64_t j = 0; j < v38; ++j)
        {
          uint64_t v25 = getAHPMLibInterfaceForRID(*((unsigned __int8 *)&v34 + j), __str);
          if (v25)
          {
            uint64_t v4 = v25;
            if (inRestore) {
              printf("Failed to get AHPMLibInterface for RID %d: 0x%x\n", *((unsigned __int8 *)&v34 + j), v25);
            }
            else {
              uarpLogError(3u, "Failed to get AHPMLibInterface for RID %d: 0x%x\n", *((unsigned __int8 *)&v34 + j), v25);
            }
          }
          else if (*(void *)__str)
          {
            unsigned int v35 = 0;
            uint64_t v26 = get_mode(*(uint64_t *)__str, &v35);
            if (v26)
            {
              uint64_t v4 = v26;
              if (inRestore) {
                printf("Failed to get mode for RID %d: 0x%x\n", *((unsigned __int8 *)&v34 + j), v26);
              }
              else {
                uarpLogError(3u, "Failed to get mode for RID %d: 0x%x\n", *((unsigned __int8 *)&v34 + j), v26);
              }
            }
            else if (v35 == 1448039764)
            {
              if (inRestore) {
                printf("UART HPM RID%d in VOUT, GAID skipped and APP mode check will be skipped\n", *((unsigned __int8 *)&v34 + j));
              }
              else {
                uarpLogError(3u, "UART HPM RID%d in VOUT, GAID skipped and APP mode check will be skipped\n", *((unsigned __int8 *)&v34 + j));
              }
              uint64_t v4 = 0;
            }
            else
            {
              uint64_t v27 = wait_for_mode(*(uint64_t *)__str, 1095782432, 1, 0);
              uint64_t v4 = 0;
              if (v27)
              {
                uint64_t v28 = v27;
                print_fw_update_regs(*(uint64_t *)__str);
                uint64_t v4 = v28;
              }
            }
            destroyAHPMLibInterface((uint64_t *)__str);
          }
          else
          {
            if (inRestore) {
              printf("UART HPM interface is NULL for RID %d\n", *((unsigned __int8 *)&v34 + j));
            }
            else {
              uarpLogError(3u, "UART HPM interface is NULL for RID %d\n", *((unsigned __int8 *)&v34 + j));
            }
            uint64_t v4 = 0;
          }
        }
      }
    }
    if (!v4) {
      return v4;
    }
    if (v4 == -536870160)
    {
      if (inRestore) {
        puts("UART HPMs not found, treating as non-fatal");
      }
      else {
        uarpLogError(3u, "UART HPMs not found, treating as non-fatal\n");
      }
    }
    else if (inRestore)
    {
      printf("UART HPMs reset failed, status=0x%X, treating as non-fatal\n", v4);
    }
    else
    {
      uarpLogError(3u, "UART HPMs reset failed, status=0x%X, treating as non-fatal\n");
    }
    return 0;
  }
  int v8 = *((_DWORD *)a1 + 27);
  if (v8 == 4)
  {
    if (!inRestore)
    {
      uint64_t v4 = 3758097129;
      uarpLogError(3u, "HPM in ADFU in OTA stage2\n");
      return v4;
    }
    uint64_t v4 = 3758097129;
    size_t v9 = "HPM in ADFU in OTA stage2";
    goto LABEL_12;
  }
  if (!v8 && !*((unsigned char *)a1 + 104))
  {
    if (inRestore) {
      puts("WARNING: HPM in ADFU in Unknown Mode and force_dfu not set");
    }
    else {
      uarpLogError(3u, "WARNING: HPM in ADFU in Unknown Mode and force_dfu not set\n");
    }
  }
  if (*((_DWORD *)a1 + 27) == 3)
  {
    uint64_t v4 = 3758097129;
    if (!inRestore)
    {
      uarpLogError(3u, "HPM in ADFU in OTA Stage 1\n");
      return v4;
    }
    size_t v9 = "HPM in ADFU in OTA Stage 1";
LABEL_12:
    puts(v9);
    return v4;
  }
  if (inRestore) {
    puts("Performing ramdisk, ADFU detected");
  }
  else {
    uarpLogError(3u, "Performing ramdisk, ADFU detected\n");
  }
  uint64_t mode = flash();
  if (mode) {
    return mode;
  }
  uint64_t mode = wait_for_mode(*a1, 1095782432, 1, 0);
  if (mode) {
    return mode;
  }
  LODWORD(v34) = 0;
  *(void *)__str = 0;
  uint64_t v4 = (*(uint64_t (**)(void, void, uint64_t, uint64_t *, uint64_t, void, char *))(*(void *)*a1 + 40))(*a1, 0, 45, &v34, 4, 0, __str);
  if (!v4)
  {
    if ((BYTE1(v34) & 7) != 1)
    {
      if (inRestore && (logLevel & 2) != 0) {
        printf("Unexpected boot source after ADF* update: 0x%x\n", BYTE1(v34) & 7);
      }
      else {
        uarpLogInfo(3u, "Unexpected boot source after ADF* update: 0x%x\n", BYTE1(v34) & 7);
      }
    }
    *((unsigned char *)a1 + 16) = 0;
  }
  return v4;
}

uint64_t get_mode(uint64_t a1, _DWORD *a2)
{
  unint64_t v4 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, unsigned int *, uint64_t, void, unint64_t *))(*(void *)a1 + 40))(a1, 0, 3, &v5, 4, 0, &v4);
  if (!result)
  {
    if (v4 < 4)
    {
      return 3758097129;
    }
    else
    {
      uint64_t result = 0;
      *a2 = bswap32(v5);
    }
  }
  return result;
}

int flash(void)
{
  uint64_t v3 = v0;
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  memset(v31, 0, sizeof(v31));
  if (v2) {
    unsigned int v4 = 1094993513;
  }
  else {
    unsigned int v4 = 1397118825;
  }
  if (v2) {
    unsigned int v5 = 1094993508;
  }
  else {
    unsigned int v5 = 1397118820;
  }
  if (v2) {
    int v6 = 1094993507;
  }
  else {
    int v6 = 1397118819;
  }
  if (*(unsigned char *)(v0 + 85))
  {
    if (inRestore) {
      puts("verify_only set! Should not be attempting to flash!");
    }
    else {
      uarpLogError(3u, "verify_only set! Should not be attempting to flash!\n");
    }
    int v9 = 30;
    goto LABEL_56;
  }
  int v7 = v2;
  int v8 = v1;
  if (inRestore && (logLevel & 2) != 0)
  {
    printf("Preparing to flash 0x%x bytes of image to rid %d\n", v1, *(unsigned __int8 *)(v0 + 102));
    if (v7) {
      goto LABEL_21;
    }
  }
  else
  {
    uarpLogInfo(3u, "Preparing to flash 0x%x bytes of image to rid %d\n", v1, *(unsigned __int8 *)(v0 + 102));
    if (v7) {
      goto LABEL_21;
    }
  }
  int v10 = handle_shared_spi((uint64_t *)v3, 1);
  if (v10) {
    goto LABEL_67;
  }
LABEL_21:
  uint64_t v11 = *(void *)v3;
  unsigned int v30 = v4;
  LOWORD(v25) = 64;
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t, unsigned int *, long long *, void, _OWORD *, void, uint64_t, int, uint64_t, void, _DWORD))(*(void *)v11 + 104))(v11, 1, &v30, &v32, 0, v31, 0, 64, v25, 10, 0, 0);
  if (v10) {
    goto LABEL_67;
  }
  int v12 = check_task_result(v31[0], v4);
  if ((v7 & 1) != 0 || v12 != 4)
  {
    unsigned int v28 = v6;
    if (v12 || (BYTE2(v31[0]) & 0xC0) != 0x80) {
      goto LABEL_59;
    }
    if (v8)
    {
      int v13 = 0;
      if (v7) {
        uint64_t v14 = 4;
      }
      else {
        uint64_t v14 = 3;
      }
      unsigned __int16 v15 = 1;
      if (v7) {
        uint64_t v16 = 2;
      }
      else {
        uint64_t v16 = 1;
      }
      uint64_t v17 = 0xFFFFFFFFLL;
      uint64_t v29 = v14;
      while (1)
      {
        int v18 = (v8 - v13) >= 0x40 ? 64 : v8 - v13;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        __memcpy_chk();
        uint64_t v19 = CRCBuffer((uint64_t)&v32, 64, v17);
        uint64_t v17 = v19;
        if (inRestore && (logLevel & 2) != 0) {
          printf("Flashing block %d, CRC = 0x%08x\n", v15, v19);
        }
        else {
          uarpLogInfo(3u, "Flashing block %d, CRC = 0x%08x\n", v15, v19);
        }
        uint64_t v20 = *(void *)v3;
        unsigned int v30 = v5;
        LOWORD(v27) = 64;
        int v21 = (*(uint64_t (**)(uint64_t, uint64_t, unsigned int *, long long *, void, _OWORD *, void, uint64_t, int, uint64_t, void, _DWORD))(*(void *)v20 + 104))(v20, 1, &v30, &v32, 0, v31, 0, 64, v27, 10, 0, 0);
        if (v21) {
          break;
        }
        if (check_task_result(v31[0], v5)
          || v17 != *(_DWORD *)((char *)v31 + v29)
          || *(unsigned __int16 *)((char *)v31 + v16) != v15)
        {
          goto LABEL_59;
        }
        v13 += v18;
        int v22 = LOBYTE(v31[0]) >> 7;
        if (v22 != (v13 != v8))
        {
          if (inRestore && (logLevel & 2) != 0) {
            printf("Expected more data: actual_more_data=0x%X, length=0x%X, (current_index + bytes_to_write) = 0x%X\n", v22, v8, v13);
          }
          else {
            uarpLogInfo(3u, "Expected more data: actual_more_data=0x%X, length=0x%X, (current_index + bytes_to_write) = 0x%X\n", v22, v8, v13);
          }
        }
        ++v15;
        if (v13 == v8) {
          goto LABEL_53;
        }
      }
      int v9 = v21;
LABEL_65:
      handle_shared_spi((uint64_t *)v3, 0);
      if (v9 != -536870167) {
        return v9;
      }
      goto LABEL_60;
    }
LABEL_53:
    uint64_t v23 = *(void *)v3;
    unsigned int v30 = v28;
    LOWORD(v26) = 64;
    int v10 = (*(uint64_t (**)(uint64_t, uint64_t, unsigned int *, void, void, _OWORD *, void, void, int, uint64_t, void, _DWORD))(*(void *)v23 + 104))(v23, 1, &v30, 0, 0, v31, 0, 0, v26, 10, 0, 0);
    if (!v10)
    {
      if (!check_task_result(v31[0], v28))
      {
        int v9 = 0;
LABEL_56:
        handle_shared_spi((uint64_t *)v3, 0);
        return v9;
      }
      goto LABEL_59;
    }
LABEL_67:
    int v9 = v10;
    goto LABEL_65;
  }
  if (inRestore) {
    printf("Failed SFWi on RID %d with 'Flash Busy' error - check SPI flash seating\n", *(unsigned __int8 *)(v3 + 102));
  }
  else {
    uarpLogError(3u, "Failed SFWi on RID %d with 'Flash Busy' error - check SPI flash seating\n", *(unsigned __int8 *)(v3 + 102));
  }
LABEL_59:
  handle_shared_spi((uint64_t *)v3, 0);
LABEL_60:
  if (inRestore) {
    printf("Device error RID=0x%d\n", *(unsigned __int8 *)(v3 + 102));
  }
  else {
    uarpLogError(3u, "Device error RID=0x%d\n", *(unsigned __int8 *)(v3 + 102));
  }
  int v9 = -536870167;
  print_fw_update_regs(*(void *)v3);
  return v9;
}

uint64_t internalBackendGetFlags(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 81) | (2 * *(unsigned __int8 *)(a1 + 80));
  if (!*(unsigned char *)(a1 + 16))
  {
    if (get_pers_params((uint64_t *)a1)) {
      return v2;
    }
    *(unsigned char *)(a1 + 16) = 1;
  }
  if (!*(unsigned char *)(a1 + 85) && (*(unsigned char *)(a1 + 49) || *(unsigned char *)(a1 + 82))) {
    LODWORD(v2) = v2 | 4;
  }
  int v6 = 0;
  int mode = get_mode(*(void *)a1, &v6);
  if (v6 == 1094993493 && mode == 0) {
    return v2 | 0x10;
  }
  else {
    return v2;
  }
}

uint64_t internalBackendGetActiveVersion(void *a1, _DWORD *a2, _WORD *a3)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t result = 30;
  if (a1 && a2 && a3)
  {
    uint64_t v7 = 0;
    v8[0] = 0;
    uint64_t result = (*(uint64_t (**)(void, void, uint64_t, void *, uint64_t, void, uint64_t *))(*(void *)*a1 + 40))(*a1, 0, 15, v8, 8, 0, &v7);
    if (v7 == 8)
    {
      *a2 = v8[0];
      *a3 = WORD2(v8[0]);
    }
    else if (v7 == 4)
    {
      *a2 = 0;
      *a3 = 0;
    }
    else
    {
      return 54;
    }
  }
  return result;
}

__n128 internalBackendGetStagedVersion(uint64_t a1, __n128 *a2)
{
  if (a1)
  {
    if (a2)
    {
      __n128 result = *(__n128 *)(a1 + 86);
      *a2 = result;
    }
  }
  return result;
}

uint64_t internalBackendApply(void *a1, _WORD *a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    int v5 = (*(uint64_t (**)(void, uint64_t, int *, void, void, void, void, void, _WORD, uint64_t, void, uint64_t))(*(void *)*a1 + 104))(*a1, 1, &v6, 0, 0, 0, 0, 0, 0, 10, 0, 0x4741494400000000);
    if (v5)
    {
      if (inRestore) {
        printf("Received error 0x%x from GAID, silencing\n", v5);
      }
      else {
        uarpLogError(3u, "Received error 0x%x from GAID, silencing\n", v5);
      }
    }
    uint64_t result = 0;
    *a2 |= 1u;
  }
  return result;
}

uint64_t check_task_result(char a1, unsigned int a2)
{
  uint64_t v2 = a1 & 0xF;
  if ((a1 & 0xF) != 0)
  {
    if (inRestore) {
      printf("Bad task result from %c%c%c%c 4CC: 0x%x\n", HIBYTE(a2), BYTE2(a2), BYTE1(a2), a2, a1 & 0xF);
    }
    else {
      uarpLogError(3u, "Bad task result from %c%c%c%c 4CC: 0x%x\n", HIBYTE(a2), BYTE2(a2), BYTE1(a2), a2, a1 & 0xF);
    }
  }
  return v2;
}

void print_fw_update_regs(uint64_t a1)
{
  uint64_t v2 = (unsigned __int8 *)uarpZalloc(0x34uLL);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v5 = 0;
    (*(void (**)(uint64_t, void, uint64_t, unsigned __int8 *, uint64_t, void, uint64_t *))(*(void *)a1 + 40))(a1, 0, 45, v2, 52, 0, &v5);
    if (inRestore) {
      puts("otpBuf:");
    }
    else {
      uarpLogError(3u, "otpBuf:\n");
    }
    uint64_t v4 = 0;
    do
    {
      if (inRestore) {
        printf("%02X", v3[v4]);
      }
      else {
        uarpLogError(3u, "%02X", v3[v4]);
      }
      if ((++v4 & 0xF) == 0)
      {
        if (inRestore) {
          putchar(10);
        }
        else {
          uarpLogError(3u, "\n");
        }
      }
    }
    while (v4 != 52);
    uarpFree(v3);
  }
}

uint64_t USBCUpdateManifestPrefix(uint64_t a1, int a2, char *__dst, size_t __n, _DWORD *a5)
{
  uint64_t result = 30;
  if (__n >= 0x12 && a1)
  {
    if (a5)
    {
      strncpy(__dst, "USBPortController", __n);
      uint64_t result = 0;
      *a5 = 18;
    }
  }
  return result;
}

uint64_t USBCUpdateLongName(uint64_t a1, int a2, char *__dst, size_t __n, _DWORD *a5)
{
  uint64_t result = 30;
  if (__n >= 0xC && a1)
  {
    if (a5)
    {
      strncpy(__dst, "USBFirmware", __n);
      uint64_t result = 0;
      *a5 = 12;
    }
  }
  return result;
}

uint64_t USBCUpdateBoardID(uint64_t a1, int a2, void *a3, unsigned int a4, int *a5)
{
  if (!a1 || a4 < 8 || BackendGetPersParam(*(void **)(a1 + 1384)))
  {
    generic_copyout(0, a3, a4, a5);
  }
  else
  {
    *a3 = 0;
    *a5 = 8;
  }
  return 0;
}

void generic_copyout(uint64_t a1, unsigned char *a2, unsigned int a3, int *a4)
{
  int v5 = a3;
  switch(a3)
  {
    case 1u:
      *a2 = a1;
      int v5 = 1;
      break;
    case 2u:
      *(_WORD *)a2 = a1;
      int v5 = 2;
      break;
    case 4u:
      *(_DWORD *)a2 = a1;
      int v5 = 4;
      break;
    case 8u:
      *(void *)a2 = a1;
      int v5 = 8;
      break;
    default:
      bzero(a2, a3);
      break;
  }
  *a4 = v5;
}

uint64_t USBCUpdateChipID(uint64_t a1, int a2, _DWORD *a3, unsigned int a4, int *a5)
{
  if (!a1 || a4 < 4 || BackendGetPersParam(*(void **)(a1 + 1384)))
  {
    generic_copyout(0, a3, a4, a5);
  }
  else
  {
    *a3 = 0;
    *a5 = 4;
  }
  return 0;
}

uint64_t USBCUpdateChipRevision(uint64_t a1, int a2, _DWORD *a3, unsigned int a4, int *a5)
{
  if (!a1 || a4 < 4 || BackendGetPersParam(*(void **)(a1 + 1384)))
  {
    generic_copyout(0, a3, a4, a5);
  }
  else
  {
    *a3 = 0;
    *a5 = 4;
  }
  return 0;
}

uint64_t USBCUpdateECID(uint64_t a1, int a2, void *a3, unsigned int a4, int *a5)
{
  if (!a1 || a4 < 8 || BackendGetPersParam(*(void **)(a1 + 1384)))
  {
    generic_copyout(0, a3, a4, a5);
  }
  else
  {
    *a3 = 0;
    *a5 = 8;
  }
  return 0;
}

uint64_t USBCUpdateSecurityDomain(uint64_t a1, int a2, _DWORD *a3, unsigned int a4, int *a5)
{
  if (!a1 || a4 < 4 || BackendGetPersParam(*(void **)(a1 + 1384)))
  {
    generic_copyout(0, a3, a4, a5);
  }
  else
  {
    *a3 = 0;
    *a5 = 4;
  }
  return 0;
}

uint64_t USBCUpdateSecurityMode(uint64_t a1, int a2, _DWORD *a3, unsigned int a4, int *a5)
{
  if (!a1 || a4 < 4 || BackendGetPersParam(*(void **)(a1 + 1384)))
  {
    generic_copyout(0, a3, a4, a5);
  }
  else
  {
    *a3 = 0;
    *a5 = 4;
  }
  return 0;
}

uint64_t USBCUpdateProductionMode(uint64_t a1, int a2, _DWORD *a3, unsigned int a4, int *a5)
{
  if (!a1 || a4 < 4 || BackendGetPersParam(*(void **)(a1 + 1384)))
  {
    generic_copyout(0, a3, a4, a5);
  }
  else
  {
    *a3 = 0;
    *a5 = 4;
  }
  return 0;
}

uint64_t USBCUpdateChipEpoch(uint64_t a1, int a2, _DWORD *a3, unsigned int a4, int *a5)
{
  if (!a1 || a4 < 4 || BackendGetPersParam(*(void **)(a1 + 1384)))
  {
    generic_copyout(0, a3, a4, a5);
  }
  else
  {
    *a3 = 0;
    *a5 = 4;
  }
  return 0;
}

uint64_t USBCUpdatePrefixNeedsLUN(int a1, int a2, unsigned char *a3, unsigned int a4, int *a5)
{
  if (a3 && a4)
  {
    *a3 = 1;
    *a5 = 1;
  }
  else
  {
    generic_copyout(0, a3, a4, a5);
  }
  return 0;
}

uint64_t USBCUpdateSuffixNeedsLUN(int a1, int a2, unsigned char *a3, unsigned int a4, int *a5)
{
  if (a3 && a4)
  {
    *a3 = 0;
    *a5 = 1;
  }
  else
  {
    generic_copyout(0, a3, a4, a5);
  }
  return 0;
}

uint64_t USBCUpdateTag(uint64_t a1, int a2, _DWORD *a3, unsigned int a4, int *a5)
{
  if (a1 && a3 && a4 >= 4 && !BackendGetPersParam(*(void **)(a1 + 1384)))
  {
    *a3 = 0;
    *a5 = 4;
  }
  else
  {
    generic_copyout(0, a3, a4, a5);
  }
  return 0;
}

uint64_t USBCUpdateRequiresPersonalization(uint64_t a1, int a2, BOOL *a3, unsigned int a4, int *a5)
{
  if (a1 && a3 && a4)
  {
    *a3 = (BackendGetFlags(*(void **)(a1 + 1384)) & 4) != 0;
    *a5 = 1;
  }
  else
  {
    generic_copyout(0, a3, a4, a5);
  }
  return 0;
}

uint64_t USBCUpdateAPBoardID(uint64_t a1, int a2, _DWORD *a3, unsigned int a4, int *a5)
{
  if (!a1 || a4 < 4 || BackendGetPersParam(*(void **)(a1 + 1384)))
  {
    generic_copyout(0, a3, a4, a5);
  }
  else
  {
    *a3 = 0;
    *a5 = 4;
  }
  return 0;
}

uint64_t USBCUpdateAPChipID(uint64_t a1, int a2, _DWORD *a3, unsigned int a4, int *a5)
{
  if (!a1 || a4 < 4 || BackendGetPersParam(*(void **)(a1 + 1384)))
  {
    generic_copyout(0, a3, a4, a5);
  }
  else
  {
    *a3 = 0;
    *a5 = 4;
  }
  return 0;
}

uint64_t USBCUpdateInfoUnsupported(int a1, int a2, unsigned char *a3, unsigned int a4, int *a5)
{
  if (a4 >= 4) {
    int v6 = 4;
  }
  else {
    int v6 = a4;
  }
  if (a2 == 22) {
    int v7 = v6;
  }
  else {
    int v7 = a4;
  }
  if (a2 != 21) {
    int v6 = v7;
  }
  BOOL v8 = a4 != 0;
  unsigned int v9 = v8;
  if (a2 != 13) {
    unsigned int v9 = a4;
  }
  if (a2 != 12) {
    BOOL v8 = v9;
  }
  if (a2 <= 20) {
    unsigned int v10 = v8;
  }
  else {
    unsigned int v10 = v6;
  }
  generic_copyout(0, a3, v10, a5);
  return 0;
}

uint64_t externalBackendCreate(void *a1, char *a2, uint64_t a3, char a4)
{
  BOOL v8 = uarpZalloc(0x50uLL);
  if (!v8) {
    return 11;
  }
  unsigned int v9 = v8;
  unint64_t v21 = 0;
  uint64_t result = parse_serial_string_u64(a2, "SDOM", &v21);
  if (result) {
    return result;
  }
  if (inRestore && (logLevel & 2) != 0) {
    printf("SDOM=0x%llX [8b]\n", v21);
  }
  else {
    uarpLogInfo(3u, "SDOM=0x%llX [8b]\n", v21);
  }
  if (v21 > 0xFF) {
    return 39;
  }
  *((unsigned char *)v9 + 42) = v21;
  uint64_t result = parse_serial_string_u64(a2, "CPID", &v21);
  if (result) {
    return result;
  }
  if (inRestore && (logLevel & 2) != 0) {
    printf("CPID=0x%llX [16b]\n", v21);
  }
  else {
    uarpLogInfo(3u, "CPID=0x%llX [16b]\n", v21);
  }
  if (v21 >> 16) {
    return 39;
  }
  *((_WORD *)v9 + 4) = v21;
  uint64_t result = parse_serial_string_u64(a2, "BDID", &v21);
  if (result) {
    return result;
  }
  if (inRestore && (logLevel & 2) != 0) {
    printf("BDID=0x%llX\n", v21);
  }
  else {
    uarpLogInfo(3u, "BDID=0x%llX\n", v21);
  }
  *unsigned int v9 = v21;
  uint64_t result = parse_serial_string_u64(a2, "ECID", &v21);
  if (result) {
    return result;
  }
  if (inRestore && (logLevel & 2) != 0) {
    printf("ECID=0x%llX\n", v21);
  }
  else {
    uarpLogInfo(3u, "ECID=0x%llX\n", v21);
  }
  v9[2] = v21;
  uint64_t result = parse_serial_string_u64(a2, "CPFM", &v21);
  if (result) {
    return result;
  }
  if (inRestore && (logLevel & 2) != 0) {
    printf("CPFM=0x%llX [8b]\n", v21);
  }
  else {
    uarpLogInfo(3u, "CPFM=0x%llX [8b]\n", v21);
  }
  char v11 = v21;
  if (v21 > 0xFF) {
    return 39;
  }
  *((unsigned char *)v9 + 41) = v21 & 1;
  *((unsigned char *)v9 + 40) = (v11 & 2) != 0;
  uint64_t result = parse_serial_string_u64(a2, "PREV", &v21);
  if (result) {
    return result;
  }
  if (inRestore && (logLevel & 2) != 0) {
    printf("PREV=0x%llX [8b]\n", v21);
  }
  else {
    uarpLogInfo(3u, "PREV=0x%llX [8b]\n", v21);
  }
  if (v21 > 0xFF) {
    return 39;
  }
  *((unsigned char *)v9 + 43) = v21;
  int v12 = (unsigned __int8 *)uarpZalloc(0x10uLL);
  v9[3] = v12;
  if (!v12) {
    return 11;
  }
  v9[4] = 16;
  uint64_t result = parse_serial_string_buffer(a2, "NONC", v12, 16);
  if (result) {
    return result;
  }
  uint64_t result = parse_serial_string_u64(a2, "CPRV", &v21);
  if (result) {
    return result;
  }
  if (inRestore && (logLevel & 2) != 0) {
    printf("CRPV=0x%llX [16b]\n", v21);
  }
  else {
    uarpLogInfo(3u, "CRPV=0x%llX [16b]\n", v21);
  }
  if (v21 >> 16) {
    return 39;
  }
  if (v21 != 160)
  {
    unint64_t v13 = v9[3];
    uint64_t v14 = (unsigned char *)(v13 + v9[4] - 1);
    if (v13 < (unint64_t)v14)
    {
      unint64_t v15 = v13 + 1;
      do
      {
        char v16 = *(unsigned char *)(v15 - 1);
        *(unsigned char *)(v15 - 1) = *v14;
        *v14-- = v16;
      }
      while (v15++ < (unint64_t)v14);
    }
    goto LABEL_51;
  }
  *((_WORD *)v9 + 4) = uarpNtohs(*((unsigned __int16 *)v9 + 4));
  v9[2] = uarpNtohll(v9[2]);
  if (HIDWORD(*v9)) {
    return 39;
  }
  *unsigned int v9 = uarpNtohl(*v9);
LABEL_51:
  int v18 = *((unsigned __int8 *)v9 + 41);
  if ((v21 & 0xFFFFFFFFFFFFFEFFLL) == 0xA0)
  {
    int v19 = *((unsigned __int8 *)v9 + 40);
    *((unsigned char *)v9 + 41) = v19;
    *((unsigned char *)v9 + 40) = v18;
    int v18 = v19;
  }
  if (v18) {
    char v20 = 1;
  }
  else {
    char v20 = a4;
  }
  *((unsigned char *)v9 + 60) = v20;
  *((_DWORD *)v9 + 13) = apBoardForAceBoard(*v9);
  *((_DWORD *)v9 + 14) = apChipForAceBoard(*v9);
  if (inRestore && (logLevel & 2) != 0) {
    puts("Final params, after accounting for any endianness quirks:");
  }
  else {
    uarpLogInfo(3u, "Final params, after accounting for any endianness quirks:\n");
  }
  if (inRestore && (logLevel & 2) != 0) {
    printf("boardID=0x%llX\n", *v9);
  }
  else {
    uarpLogInfo(3u, "boardID=0x%llX\n", *v9);
  }
  if (inRestore && (logLevel & 2) != 0) {
    printf("ECID=0x%llX\n", v9[2]);
  }
  else {
    uarpLogInfo(3u, "ECID=0x%llX\n", v9[2]);
  }
  if (inRestore && (logLevel & 2) != 0) {
    printf("chipID=0x%X\n", *((unsigned __int16 *)v9 + 4));
  }
  else {
    uarpLogInfo(3u, "chipID=0x%X\n", *((unsigned __int16 *)v9 + 4));
  }
  if (inRestore && (logLevel & 2) != 0) {
    printf("pStatus=%d, secMode=%d, SDOM=0x%X, PREV=0x%X\n", *((unsigned __int8 *)v9 + 40), *((unsigned __int8 *)v9 + 41), *((unsigned __int8 *)v9 + 42), *((unsigned __int8 *)v9 + 43));
  }
  else {
    uarpLogInfo(3u, "pStatus=%d, secMode=%d, SDOM=0x%X, PREV=0x%X\n", *((unsigned __int8 *)v9 + 40), *((unsigned __int8 *)v9 + 41), *((unsigned __int8 *)v9 + 42), *((unsigned __int8 *)v9 + 43));
  }
  if (inRestore && (logLevel & 2) != 0) {
    printf("apBORD=0x%X, apChip=0x%X\n", *((_DWORD *)v9 + 13), *((_DWORD *)v9 + 14));
  }
  else {
    uarpLogInfo(3u, "apBORD=0x%X, apChip=0x%X\n", *((_DWORD *)v9 + 13), *((_DWORD *)v9 + 14));
  }
  uint64_t result = 0;
  *((_DWORD *)v9 + 12) = 1;
  v9[8] = a3;
  *a1 = v9;
  return result;
}

uint64_t externalBackendDestroy(void ***a1)
{
  if (!a1) {
    return 30;
  }
  uint64_t v2 = *a1;
  if (!v2) {
    return 30;
  }
  if (v2[3])
  {
    uarpFree(v2[3]);
    (*a1)[3] = 0;
    uint64_t v2 = *a1;
  }
  uarpFree(v2);
  uint64_t result = 0;
  *a1 = 0;
  return result;
}

uint64_t externalBackendGetPersParam(_DWORD *__src, int a2, void *__dst, unsigned int a4, unsigned int *a5)
{
  uint64_t result = 30;
  if (__src && __dst)
  {
    uint64_t result = 26;
    unsigned int v8 = 8;
    switch(a2)
    {
      case 0:
        __src = (_DWORD *)((char *)__src + 43);
        goto LABEL_11;
      case 1:
        __src += 2;
        unsigned int v8 = 2;
        goto LABEL_16;
      case 2:
        goto LABEL_16;
      case 3:
        __src += 4;
        goto LABEL_16;
      case 4:
        __src += 10;
        goto LABEL_11;
      case 5:
        __src = (_DWORD *)((char *)__src + 41);
        goto LABEL_11;
      case 6:
        unsigned int v8 = __src[8];
        __src = (_DWORD *)*((void *)__src + 3);
        goto LABEL_16;
      case 8:
        __src = (_DWORD *)((char *)__src + 42);
LABEL_11:
        unsigned int v8 = 1;
        goto LABEL_16;
      case 10:
        __src += 12;
        goto LABEL_15;
      case 11:
        __src += 13;
        goto LABEL_15;
      case 12:
        __src += 14;
LABEL_15:
        unsigned int v8 = 4;
LABEL_16:
        uint64_t result = 30;
        if (__src && v8 <= a4)
        {
          memcpy(__dst, __src, v8);
          uint64_t result = 0;
          if (a5) {
            *a5 = v8;
          }
        }
        break;
      default:
        return result;
    }
  }
  return result;
}

uint64_t externalBackendGetFlags(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72)) {
    int v1 = 10;
  }
  else {
    int v1 = 8;
  }
  return v1 | (4 * *(unsigned __int8 *)(a1 + 60));
}

uint64_t externalBackendFlash(uint64_t a1, uint64_t a2, unsigned int a3, _OWORD *a4)
{
  uint64_t v8 = *(void *)(a1 + 64);
  unsigned int v9 = *(uint64_t **)(v8 + 1368);
  uint64_t v24 = 0;
  uint64_t result = DynamicAssetCreate(&v24);
  if (!result)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
    memset(v14, 0, sizeof(v14));
    uarpZero(v14, 0xE0uLL);
    *((void *)&v15 + 1) = DynamicAssetUARPGetBytes;
    *(void *)&long long v16 = DynamicAssetUARPSetBytes;
    *(void *)&long long v19 = fAssetProcessingNotification2_2;
    int v13 = 1297238342;
    uarpPlatformEndpointPrepareDynamicAsset(v8, v8 + 1080, v24, &v13, (uint64_t)v14);
    uint64_t result = uarpPersonalizationRequestAssetInitialize(v8, v24, 1);
    if (!result)
    {
      unsigned __int16 v12 = 0;
      uint64_t result = uarpPlatformAssetQueryAssetID(*v9, &v12);
      if (!result)
      {
        uint64_t result = uarpPersonalizationRequestAddRemoteAssetID(v8, v24, v12);
        if (!result)
        {
          unsigned int v11 = 1297238342;
          uint64_t result = UARPSuperBinaryPreparePayload(v8, v24, 0, &v11, a4);
          if (!result)
          {
            uint64_t result = UARPSuperBinaryAddPayloadMetaData(v8, v24, 0, 0xCCD28111, 4u, (uint64_t)&v11);
            if (!result)
            {
              uint64_t result = UARPSuperBinaryAddPayloadDataLarge(v8, v24, 0, a2, a3);
              if (!result)
              {
                uint64_t result = UARPSuperBinaryFinalizeHeader(v8, v24);
                if (!result)
                {
                  uint64_t result = uarpPlatformEndpointOfferAsset(v8, v8 + 1080, v24);
                  if (!result) {
                    *(unsigned char *)(a1 + 72) = 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t fAssetProcessingNotification2_2(uint64_t a1, uint64_t a2, void *a3)
{
  int v5 = a3;
  DynamicAssetDestroy(&v5);
  if (inRestore && (logLevel & 2) != 0) {
    puts("USBCUpdate: Calling Asset Fully Staged from Processing Notification");
  }
  else {
    uarpLogInfo(3u, "USBCUpdate: Calling Asset Fully Staged from Processing Notification\n");
  }
  return uarpPlatformEndpointAssetFullyStaged(a1, **(void **)(a1 + 1368));
}

uint64_t externalBackendTagHint(uint64_t a1, int a2)
{
  if (!a1) {
    return 30;
  }
  if (inRestore && (logLevel & 2) != 0) {
    printf("Overriding tag value to 0x%x (was 0x%x) based on metadata hint\n", a2, *(_DWORD *)(a1 + 48));
  }
  else {
    uarpLogInfo(3u, "Overriding tag value to 0x%x (was 0x%x) based on metadata hint\n", a2, *(_DWORD *)(a1 + 48));
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 48) = a2;
  return result;
}

uint64_t USBCUpdateEndpointInitialize(_OWORD *a1, uint64_t a2, _OWORD *a3, uint64_t (**a4)(uint64_t a1, uint64_t a2, unsigned __int16 *a3, unsigned int a4))
{
  uint64_t v4 = 0;
  if (a2)
  {
    if (a1)
    {
      if (a3)
      {
        if (a4)
        {
          unsigned int v9 = uarpZalloc(0x658uLL);
          uint64_t v4 = (uint64_t)v9;
          if (v9)
          {
            v9[79] = *a3;
            *((void *)v9 + 160) = a2;
            *(_OWORD *)((char *)v9 + 1288) = *a1;
            long long v10 = a1[1];
            long long v11 = a1[2];
            long long v12 = a1[4];
            *(_OWORD *)((char *)v9 + 1336) = a1[3];
            *(_OWORD *)((char *)v9 + 1352) = v12;
            *(_OWORD *)((char *)v9 + 1304) = v10;
            *(_OWORD *)((char *)v9 + 1320) = v11;
            uint64_t v51 = 4;
            uint64_t v53 = 0;
            uint64_t v52 = 0;
            uint64_t v49 = 0x800000008000;
            int v50 = 0x8000;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            uint64_t v28 = 0;
            long long v30 = 0u;
            long long v25 = 0u;
            uint64_t v26 = 0;
            long long v23 = 0u;
            long long v24 = 0u;
            long long v22 = 0u;
            long long v17 = 0u;
            uint64_t v18 = 0;
            uint64_t v16 = 0;
            memset(v14, 0, sizeof(v14));
            long long v15 = fSendMessage;
            long long v19 = fSuperBinaryOffered;
            long long v20 = fDynamicAssetOffered;
            long long v21 = fApplyStagedAssets;
            int v27 = fActiveFirmwareVersion2;
            uint64_t v29 = fStagedFirmwareVersion2;
            *((_WORD *)v9 + 304) = 1;
            *((unsigned char *)v9 + 611) = 0;
            *((void *)v9 + 77) = USBCUpdateInfoUnsupported;
            *((void *)v9 + 79) = USBCUpdateInfoUnsupported;
            *((void *)v9 + 101) = USBCUpdateInfoUnsupported;
            *((void *)v9 + 103) = USBCUpdateInfoUnsupported;
            *((void *)v9 + 121) = USBCUpdateInfoUnsupported;
            *((void *)v9 + 119) = USBCUpdateInfoUnsupported;
            *((void *)v9 + 81) = USBCUpdateManifestPrefix;
            *((void *)v9 + 83) = USBCUpdateBoardID;
            *((void *)v9 + 85) = USBCUpdateChipID;
            *((void *)v9 + 115) = USBCUpdateAPBoardID;
            *((void *)v9 + 117) = USBCUpdateAPChipID;
            *((void *)v9 + 87) = USBCUpdateChipRevision;
            *((void *)v9 + 89) = USBCUpdateECID;
            *((void *)v9 + 93) = USBCUpdateSecurityDomain;
            *((void *)v9 + 95) = USBCUpdateSecurityMode;
            *((void *)v9 + 97) = USBCUpdateProductionMode;
            *((void *)v9 + 99) = USBCUpdateChipEpoch;
            *((void *)v9 + 105) = USBCUpdatePrefixNeedsLUN;
            *((void *)v9 + 107) = USBCUpdateSuffixNeedsLUN;
            *((void *)v9 + 109) = USBCUpdateTag;
            *((void *)v9 + 111) = USBCUpdateLongName;
            *((void *)v9 + 113) = USBCUpdateRequiresPersonalization;
            if (uarpPlatformEndpointInit((char *)v9, (uint64_t)v9, 0, (long long *)&v49, v14, (uint64_t)(v9 + 38), (uint64_t)uarpPlatformEndpointCallbackAppleSpecific)|| uarpPlatformRemoteEndpointAdd(v4, v4 + 1080, (long long *)&v49, v4)|| (*a4 = _sendMsgToAccessory, a4[1] = (uint64_t (*)(uint64_t, uint64_t, unsigned __int16 *, unsigned int))_USBCUpdateFinalize, BackendCreate((void *)(v4 + 1384), (unsigned __int8 *)(v4 + 1288), v4)))
            {
              uarpFree((void *)v4);
              return 0;
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t fSendMessage(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t result = 30;
  if (a1 && a3 && a4)
  {
    uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(a1 + 1264))(*(void *)(a1 + 1280), a1, a3);
    if (!result)
    {
      uarpPlatformEndpointSendMessageComplete(a1, a1 + 1080, a3);
      return 0;
    }
  }
  return result;
}

uint64_t fSuperBinaryOffered(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    if (a3)
    {
      uint64_t v4 = result;
      uint64_t result = (uint64_t)uarpZalloc(0x48uLL);
      if (result)
      {
        uint64_t v5 = result;
        uint64_t v6 = *(void *)(v4 + 1368);
        if (v6)
        {
          FWImageDestroy((void **)(v6 + 24));
          uarpFree(*(void **)(v4 + 1368));
        }
        *(void *)(v4 + 1368) = v5;
        *(void *)uint64_t v5 = a3;
        uint64_t result = FWImageCreate((void *)(v5 + 24));
        if (!result)
        {
          *(_WORD *)(v5 + 32) = 0;
          uint64_t v16 = 0;
          uint64_t v18 = 0;
          memset(&v19[56], 0, 40);
          memset(&v15[8], 0, 48);
          memset(&v20[8], 0, 40);
          memset(&v19[8], 0, 48);
          *(void *)long long v15 = fAssetReady_0;
          long long v17 = fPayloadData_0;
          *(void *)long long v19 = fPayloadDataComplete2_0;
          *(void *)&v19[56] = fAssetReleased2_0;
          *(void *)long long v20 = fAssetAllHeadersAndMetaDataComplete_0;
          *(void *)&v19[72] = fAssetProcessingNotificationAck_1;
          long long v7 = *(_OWORD *)&v15[32];
          *(_OWORD *)(v4 + 1472) = *(_OWORD *)v19;
          *(_OWORD *)(v4 + 1456) = (unint64_t)fPayloadData_0;
          *(_OWORD *)(v4 + 1440) = 0uLL;
          *(_OWORD *)(v4 + 1424) = v7;
          long long v8 = *(_OWORD *)v15;
          *(_OWORD *)(v4 + 1408) = *(_OWORD *)&v15[16];
          *(_OWORD *)(v4 + 1392) = v8;
          long long v9 = *(_OWORD *)&v19[16];
          long long v10 = *(_OWORD *)&v19[32];
          long long v11 = *(_OWORD *)&v19[48];
          *(_OWORD *)(v4 + 1536) = *(_OWORD *)&v19[64];
          *(_OWORD *)(v4 + 1520) = v11;
          *(_OWORD *)(v4 + 1504) = v10;
          *(_OWORD *)(v4 + 1488) = v9;
          long long v12 = *(_OWORD *)&v19[80];
          long long v13 = *(_OWORD *)v20;
          long long v14 = *(_OWORD *)&v20[16];
          *(_OWORD *)(v4 + 1600) = *(_OWORD *)&v20[32];
          *(_OWORD *)(v4 + 1584) = v14;
          *(_OWORD *)(v4 + 1568) = v13;
          *(_OWORD *)(v4 + 1552) = v12;
          return uarpPlatformEndpointAssetAccept(v4, v4 + 1080, a3, v5, v15);
        }
      }
    }
  }
  return result;
}

uint64_t fDynamicAssetOffered(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = uarpAssetTagStructPersonalization();
  if (uarpAssetTagCompare((unsigned __int8 *)v5, (unsigned __int8 *)(a3 + 48)))
  {
    *(void *)(a1 + 1376) = a3;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    memset(v7, 0, sizeof(v7));
    uarpZero(v7, 0xE0uLL);
    *(void *)&v7[0] = IM4MReady;
    *(void *)&long long v8 = IM4MData;
    *((void *)&v10 + 1) = 0;
    *(void *)&long long v11 = 0;
    *(void *)&long long v9 = IM4MDataComplete;
    *((void *)&v12 + 1) = IM4MReleased;
    *(void *)&long long v15 = IM4MHeadersAndMetadataComplete;
    *((void *)&v13 + 1) = fAssetProcessingNotificationAck_1;
    return uarpPlatformEndpointAssetAccept(a1, a1 + 1080, a3, a3, v7);
  }
  else
  {
    if (inRestore && (logLevel & 2) != 0) {
      puts("WARNING: Unexpected tag for offered Dynamic Asset");
    }
    else {
      uarpLogInfo(3u, "WARNING: Unexpected tag for offered Dynamic Asset\n");
    }
    return uarpPlatformEndpointAssetDeny(a1, a1 + 1080, a3, 3072, a3, 0);
  }
}

uint64_t fApplyStagedAssets(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a3) {
    return BackendApplyAssets(*(void **)(a1 + 1384));
  }
  else {
    return 30;
  }
}

uint64_t fActiveFirmwareVersion2(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a3)
  {
    uint64_t result = BackendGetActiveVersion(*(void **)(a1 + 1384));
    if (!result) {
      return aceVersionToUARPVersion(0, 0, a3);
    }
  }
  return result;
}

uint64_t fStagedFirmwareVersion2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a3) {
    BackendGetStagedVersion(*(void **)(a1 + 1384));
  }
  return 0;
}

uint64_t _sendMsgToAccessory(uint64_t a1, uint64_t a2, unsigned __int16 *a3, unsigned int a4)
{
  uint64_t v4 = 30;
  if (a2)
  {
    if (a3)
    {
      if (a4)
      {
        uint64_t v7 = uarpPlatformEndpointRecvMessage(a2, a2 + 1080, a3, a4);
        uint64_t v4 = v7;
        if (v7)
        {
          if (inRestore) {
            printf("Failed to recv message, status = 0x%x\n", v7);
          }
          else {
            uarpLogError(3u, "Failed to recv message, status = 0x%x\n", v7);
          }
          if (a4 >= 6)
          {
            int v8 = *(unsigned __int8 *)a3;
            int v9 = *((unsigned __int8 *)a3 + 1);
            int v10 = *((unsigned __int8 *)a3 + 2);
            int v11 = *((unsigned __int8 *)a3 + 3);
            int v12 = *((unsigned __int8 *)a3 + 5);
            if (inRestore) {
              printf("Failing message: 0x%02x%02x%02x%02x%02x%02x", v8, v9, v10, v11, *((unsigned __int8 *)a3 + 4), v12);
            }
            else {
              uarpLogError(3u, "Failing message: 0x%02x%02x%02x%02x%02x%02x", v8, v9, v10, v11, *((unsigned __int8 *)a3 + 4), v12);
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t _USBCUpdateFinalize(int a1, void **a2)
{
  if (!a2) {
    return 30;
  }
  if (a2[173]) {
    BackendDestroy(a2 + 173);
  }
  uint64_t v3 = (void **)a2[171];
  if (v3)
  {
    if (v3[3])
    {
      FWImageDestroy(v3 + 3);
      uint64_t v3 = (void **)a2[171];
    }
    if (v3[5])
    {
      uarpFree(v3[5]);
      uint64_t v3 = (void **)a2[171];
      v3[5] = 0;
      *((_DWORD *)v3 + 12) = 0;
    }
    uarpFree(v3);
    a2[171] = 0;
  }
  uarpFree(a2);
  if (inRestore && (logLevel & 2) != 0) {
    puts("libUSBCUpdate: Fully torn down");
  }
  else {
    uarpLogInfo(3u, "libUSBCUpdate: Fully torn down\n");
  }
  return 0;
}

void IM4MData(uint64_t a1, int a2, const void *a3, size_t __n)
{
  int v4 = __n;
  if (!FWImageAddBytes(*(void *)(*(void *)(a1 + 1368) + 24), a3, __n))
  {
    if (inRestore && (logLevel & 2) != 0) {
      printf("Received %d bytes of IM4M\n", v4);
    }
    else {
      uarpLogInfo(3u, "Received %d bytes of IM4M\n", v4);
    }
  }
}

uint64_t IM4MDataComplete(uint64_t a1, uint64_t a2)
{
  if (inRestore && (logLevel & 2) != 0) {
    puts("Received the whole IM4M");
  }
  else {
    uarpLogInfo(3u, "Received the whole IM4M\n");
  }
  int v4 = buildAndStageImage(a1, *(void *)(a1 + 1368));
  if (v4)
  {
    if (inRestore) {
      printf("Failed to build and Stage personalized FW: 0x%x\n", v4);
    }
    else {
      uarpLogError(3u, "Failed to build and Stage personalized FW: 0x%x\n", v4);
    }
    return uarpPlatformEndpointAssetAbandon(a1, a1 + 1080, a2, 2560);
  }
  else
  {
    if (inRestore && (logLevel & 2) != 0) {
      puts("Built and Staged the personalized FW");
    }
    else {
      uarpLogInfo(3u, "Built and Staged the personalized FW\n");
    }
    return uarpPlatformEndpointAssetFullyStaged(a1, a2);
  }
}

uint64_t buildAndStageImage(uint64_t a1, uint64_t a2)
{
  int v12 = 0;
  int v11 = 0;
  uint64_t v4 = FWImageCreateImageBuffer(*(uint32x4_t **)(a2 + 24), &v12, &v11);
  if (v4) {
    return v4;
  }
  uint64_t v5 = BackendFlash(*(void **)(a1 + 1384));
  if (v5)
  {
    uint64_t v6 = v5;
    if (inRestore) {
      printf("Error staging FW: 0x%x, abandoning asset\n", v5);
    }
    else {
      uarpLogError(3u, "Error staging FW: 0x%x, abandoning asset\n", v5);
    }
    uarpPlatformEndpointAssetAbandon(a1, a1 + 1080, *(void *)a2, 2560);
  }
  else
  {
    if ((BackendGetFlags(*(void **)(a1 + 1384)) & 2) != 0)
    {
      if ((BackendGetFlags(*(void **)(a1 + 1384)) & 8) != 0)
      {
        if (inRestore && (logLevel & 2) != 0) {
          puts("Waiting for processing notification before closing");
        }
        else {
          uarpLogInfo(3u, "Waiting for processing notification before closing\n");
        }
        uint64_t v6 = 0;
        *(unsigned char *)(a1 + 1616) = 1;
        goto LABEL_17;
      }
      uint64_t v7 = uarpPlatformEndpointAssetFullyStaged(a1, *(void *)a2);
    }
    else
    {
      uint64_t v7 = stage4_beginning(a1, a2);
    }
    uint64_t v6 = v7;
  }
LABEL_17:
  if (!v12) {
    return v6;
  }
  uint64_t v8 = FWImageDestroyImageBuffer(&v12);
  if (!v8) {
    return v6;
  }
  uint64_t v9 = v8;
  if (inRestore) {
    printf("Failed to free FW Image buffer, stageImage status = 0x%x, DestroyImageBuffer status = 0x%x\n", v6, v8);
  }
  else {
    uarpLogError(3u, "Failed to free FW Image buffer, stageImage status = 0x%x, DestroyImageBuffer status = 0x%x\n", v6, v8);
  }
  return v9;
}

uint64_t USBCUpdateQueryLogicalUnitNumber(int a1)
{
  memset(v9, 0, sizeof(v9));
  DWORD1(v9[0]) = a1;
  uint64_t v8 = 0;
  int v1 = uarpZalloc(0x658uLL);
  if (v1)
  {
    uint64_t v2 = v1;
    int v3 = BackendCreate(&v8, (unsigned __int8 *)v9, (uint64_t)v1);
    if (v3)
    {
      if (inRestore) {
        printf("Error creating backend: 0x%x\n", v3);
      }
      else {
        uarpLogError(3u, "Error creating backend: 0x%x\n", v3);
      }
LABEL_24:
      uarpFree(v2);
      return 0;
    }
    uint64_t v4 = uarpZalloc(0x12uLL);
    if (v4)
    {
      uint64_t v5 = v4;
      if (BackendGetPersParam(v8))
      {
        if (inRestore) {
          printf("Error querying RID: 0x%x\n");
        }
        else {
          uarpLogError(3u, "Error querying RID: 0x%x\n");
        }
      }
      else if (inRestore)
      {
        printf("Unexpected RID size: 0x%x\n");
      }
      else
      {
        uarpLogError(3u, "Unexpected RID size: 0x%x\n");
      }
      uarpFree(v5);
      BackendDestroy(&v8);
      goto LABEL_24;
    }
    if (!inRestore)
    {
      uarpLogError(3u, "Error allocating info\n");
      return 0;
    }
    uint64_t v7 = "Error allocating info";
  }
  else
  {
    if (!inRestore)
    {
      uarpLogError(3u, "Error allocating accessory\n");
      return 0;
    }
    uint64_t v7 = "Error allocating accessory";
  }
  puts(v7);
  return 0;
}

uint64_t fAssetReady_0(uint64_t result, uint64_t a2)
{
  if (result && a2)
  {
    uint64_t v3 = result;
    if (BackendGetFlags(*(void **)(result + 1384)))
    {
      uint64_t v5 = *(void *)a2;
      return uarpPlatformEndpointAssetFullyStaged(v3, v5);
    }
    else
    {
      if ((BackendGetFlags(*(void **)(v3 + 1384)) & 4) != 0) {
        *(unsigned char *)(a2 + 33) = 1;
      }
      if (inRestore && (logLevel & 2) != 0)
      {
        if (*(unsigned char *)(a2 + 33)) {
          uint64_t v6 = "True";
        }
        else {
          uint64_t v6 = "False";
        }
        printf("Require Personalization = %s\n", v6);
      }
      else
      {
        if (*(unsigned char *)(a2 + 33)) {
          uint64_t v4 = "True";
        }
        else {
          uint64_t v4 = "False";
        }
        uarpLogInfo(3u, "Require Personalization = %s\n", v4);
      }
      uint64_t result = uarpPlatformEndpointPayloadRequestAllHeadersAndMetaData(v3, *(void *)a2);
      if (result)
      {
        uint64_t v7 = *(void *)a2;
        return uarpPlatformEndpointAssetAbandon(v3, v3 + 1080, v7, 2304);
      }
    }
  }
  return result;
}

void fPayloadData_0(uint64_t a1, uint64_t a2, const void *a3, size_t a4)
{
  if (inRestore && (logLevel & 2) != 0) {
    puts("Received some payload data");
  }
  else {
    uarpLogInfo(3u, "Received some payload data\n");
  }
  if (*(unsigned char *)(a2 + 33) || *(unsigned __int16 *)(a2 + 10) != *(unsigned __int16 *)(a2 + 16))
  {
    if (FWImageAddBytes(*(void *)(a2 + 24), a3, a4))
    {
      uint64_t v8 = *(void *)a2;
      uarpPlatformEndpointAssetAbandon(a1, a1 + 1080, v8, 2304);
    }
  }
  else if (inRestore && (logLevel & 2) != 0)
  {
    puts("Workaround: not putting any bits of the digest list into the image, due to no personalization");
  }
  else
  {
    uarpLogInfo(3u, "Workaround: not putting any bits of the digest list into the image, due to no personalization\n");
  }
}

void fPayloadDataComplete2_0(void *a1, uint64_t a2)
{
  if (inRestore && (logLevel & 2) != 0) {
    puts("Payload Data complete");
  }
  else {
    uarpLogInfo(3u, "Payload Data complete\n");
  }
  int v4 = *(unsigned __int16 *)(a2 + 10);
  if (v4 == *(unsigned __int16 *)(a2 + 12))
  {
    if (inRestore && (logLevel & 2) != 0) {
      puts("Finished Patch");
    }
    else {
      uarpLogInfo(3u, "Finished Patch\n");
    }
    *(_WORD *)(a2 + 10) = *(_WORD *)(a2 + 14);
    uint64_t v5 = *(void *)(a2 + 24);
    int v6 = 1;
    goto LABEL_21;
  }
  if (v4 == *(unsigned __int16 *)(a2 + 14))
  {
    if (inRestore && (logLevel & 2) != 0) {
      puts("Finished AC");
    }
    else {
      uarpLogInfo(3u, "Finished AC\n");
    }
    *(_WORD *)(a2 + 10) = *(_WORD *)(a2 + 16);
    uint64_t v5 = *(void *)(a2 + 24);
    int v6 = 3;
LABEL_21:
    if (!FWImageSetActiveComponent(v5, v6)
      && !uarpPlatformEndpointAssetSetPayloadIndex(a1, *(void *)a2, *(unsigned __int16 *)(a2 + 10)))
    {
      return;
    }
    goto LABEL_26;
  }
  if (v4 == *(unsigned __int16 *)(a2 + 16))
  {
    if (inRestore && (logLevel & 2) != 0) {
      puts("Finished DL");
    }
    else {
      uarpLogInfo(3u, "Finished DL\n");
    }
    if (stage4_beginning((uint64_t)a1, a2))
    {
LABEL_26:
      uint64_t v7 = *(void *)a2;
      uarpPlatformEndpointAssetAbandon((uint64_t)a1, (uint64_t)a1 + 1080, v7, 2304);
    }
  }
}

void fAssetReleased2_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 && !FWImageDestroy((void **)(a3 + 24)))
  {
    if (inRestore && (logLevel & 2) != 0)
    {
      puts("fAssetReleased2 called");
    }
    else
    {
      uarpLogInfo(3u, "fAssetReleased2 called\n");
    }
  }
}

void fAssetAllHeadersAndMetaDataComplete_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  unsigned int v3 = 30;
  if (!a1) {
    goto LABEL_111;
  }
  int v4 = a3;
  if (!a3) {
    goto LABEL_111;
  }
  uint64_t v5 = a1;
  uint64_t SuperBinaryMetaData = uarpAssetQuerySuperBinaryMetaData(a1, *a3);
  if (SuperBinaryMetaData)
  {
    uint64_t v7 = SuperBinaryMetaData;
    do
    {
      if (*(_DWORD *)v7 == -858619645)
      {
        if (*(_DWORD *)(v7 + 4) != 4)
        {
          unsigned int v3 = 0;
          goto LABEL_110;
        }
        *((unsigned char *)v4 + 32) = uarpNtohl(**(_DWORD **)(v7 + 8)) != 0;
      }
      uint64_t v7 = *(void *)(v7 + 16);
    }
    while (v7);
  }
  unint64_t v8 = 0x26AA38000uLL;
  if (inRestore && (logLevel & 2) != 0)
  {
    if (*((unsigned char *)v4 + 32)) {
      int v10 = "True";
    }
    else {
      int v10 = "False";
    }
    printf("Ignore Version = %s\n", v10);
  }
  else
  {
    if (*((unsigned char *)v4 + 32)) {
      uint64_t v9 = "True";
    }
    else {
      uint64_t v9 = "False";
    }
    uarpLogInfo(3u, "Ignore Version = %s\n", v9);
  }
  unsigned int NumberOfPayloads = uarpPlatformEndpointAssetQueryNumberOfPayloads(v5, *v4, (_WORD *)v4 + 4);
  if (NumberOfPayloads) {
    goto LABEL_152;
  }
  if (!*(void *)(v5 + 1384)) {
    goto LABEL_153;
  }
  uint64_t v57 = *((unsigned __int16 *)v4 + 4);
  uint64_t v58 = uarpZalloc(4 * v57);
  if (!v58)
  {
    unsigned int v3 = 11;
    goto LABEL_110;
  }
  uint64_t v68 = 0;
  int v67 = 0;
  unsigned int PersParam = BackendGetPersParam(*(void **)(v5 + 1384));
  if (PersParam) {
    goto LABEL_141;
  }
  if (inRestore && (logLevel & 2) != 0) {
    printf("Searching for Board ID 0x%llx\n", v68);
  }
  else {
    uarpLogInfo(3u, "Searching for Board ID 0x%llx\n", v68);
  }
  if (!v57)
  {
LABEL_108:
    unsigned int v3 = 15;
    goto LABEL_109;
  }
  uint64_t v13 = 0;
  int v14 = 0;
  int v60 = 0;
  int v61 = 0;
  int v54 = 0xFFFF;
  uint64_t v55 = v4;
  uint64_t v56 = v5;
  while (1)
  {
    memset(v66, 0, sizeof(v66));
    unsigned int PersParam = uarpAssetQueryPayloadInfo(v5, *v4, v14, (uint64_t)v66);
    if (PersParam) {
      goto LABEL_141;
    }
    unsigned int v15 = uarpTagStructPack32((unsigned int *)v66);
    v58[v13] = uarpNtohl(v15);
    uint64_t PayloadMetaData = uarpAssetQueryPayloadMetaData(v5, *v4, v14);
    uint64_t v59 = v13;
    if (PayloadMetaData) {
      break;
    }
LABEL_98:
    uint64_t v13 = v59 + 1;
    int v14 = v59 + 1;
    if (v59 + 1 == v57)
    {
      if (v61)
      {
        uint64_t v45 = 0;
        while (v58[v45] != v61)
        {
          if (v57 == ++v45) {
            goto LABEL_108;
          }
        }
        *((_WORD *)v4 + 6) = v45;
        if (v60)
        {
          uint64_t v46 = 0;
          while (v58[v46] != v60)
          {
            if (v57 == ++v46) {
              goto LABEL_108;
            }
          }
          *((_WORD *)v4 + 7) = v46;
          if (v54 != 0xFFFF)
          {
            *((_WORD *)v4 + 8) = v54;
            uarpFree(v58);
            memset(v63, 0, sizeof(v63));
            unsigned int NumberOfPayloads = uarpAssetQueryPayloadInfo(v5, *v4, *((unsigned __int16 *)v4 + 6), (uint64_t)v63);
            if (NumberOfPayloads) {
              goto LABEL_152;
            }
            unsigned int NumberOfPayloads = FWImageSetComponentSize((uint32x4_t *)v4[3], 0, DWORD2(v63[1]));
            if (NumberOfPayloads) {
              goto LABEL_152;
            }
            *(_OWORD *)((char *)v4 + 52) = *(_OWORD *)((char *)v63 + 4);
            int v62 = 0;
            unsigned int NumberOfPayloads = uarpVersionToAceVersion((unsigned int *)v63 + 1, (unsigned int *)&v62, 0);
            if (NumberOfPayloads) {
              goto LABEL_152;
            }
            unsigned int NumberOfPayloads = FWImageSetFWVersion(v4[3], v62);
            if (NumberOfPayloads) {
              goto LABEL_152;
            }
            unsigned int NumberOfPayloads = uarpAssetQueryPayloadInfo(v5, *v4, *((unsigned __int16 *)v4 + 7), (uint64_t)v63);
            if (NumberOfPayloads) {
              goto LABEL_152;
            }
            unsigned __int32 v49 = DWORD2(v63[1]);
            *((_DWORD *)v4 + 16) = BYTE4(v63[0]) | (BYTE8(v63[0]) << 8);
            unsigned int NumberOfPayloads = FWImageSetComponentSize((uint32x4_t *)v4[3], 1u, v49);
            if (NumberOfPayloads) {
              goto LABEL_152;
            }
            if (!*(unsigned char *)(v5 + 1298))
            {
              unsigned int NumberOfPayloads = uarpAssetQueryPayloadInfo(v5, *v4, *((unsigned __int16 *)v4 + 8), (uint64_t)v63);
              if (!NumberOfPayloads)
              {
                if (*((unsigned char *)v4 + 33))
                {
                  uint64_t v51 = (uint32x4_t *)v4[3];
                  unsigned __int32 v52 = DWORD2(v63[1]);
                }
                else
                {
                  if (inRestore && (*(unsigned char *)(v8 + 3768) & 2) != 0) {
                    puts("Workaround: setting digest list length to 0 because we aren't doing personalization");
                  }
                  else {
                    uarpLogInfo(3u, "Workaround: setting digest list length to 0 because we aren't doing personalization\n");
                  }
                  uint64_t v51 = (uint32x4_t *)v4[3];
                  unsigned __int32 v52 = 0;
                }
                unsigned int v3 = FWImageSetComponentSize(v51, 3u, v52);
                if (v3) {
                  goto LABEL_110;
                }
                *((_WORD *)v4 + 5) = *((_WORD *)v4 + 6);
                unsigned int NumberOfPayloads = FWImageSetActiveComponent(v4[3], 0);
                if (!NumberOfPayloads)
                {
                  if (inRestore && (*(unsigned char *)(v8 + 3768) & 2) != 0) {
                    puts("Setting payload index");
                  }
                  else {
                    uarpLogInfo(3u, "Setting payload index\n");
                  }
                  unsigned int NumberOfPayloads = uarpPlatformEndpointAssetSetPayloadIndex((void *)v5, *v4, *((unsigned __int16 *)v4 + 5));
                  if (!NumberOfPayloads) {
                    return;
                  }
                }
              }
LABEL_152:
              unsigned int v3 = NumberOfPayloads;
              goto LABEL_110;
            }
            int v50 = *(void **)(v5 + 1384);
            if (v50)
            {
              v66[0] = 0uLL;
              LODWORD(v69) = 0;
              LOWORD(v68) = 0;
              unsigned int NumberOfPayloads = BackendGetActiveVersion(v50);
              if (!NumberOfPayloads)
              {
                unsigned int NumberOfPayloads = aceVersionToUARPVersion(v69, (unsigned __int16)v68, v66);
                if (!NumberOfPayloads)
                {
                  if (inRestore && (*(unsigned char *)(v8 + 3768) & 2) != 0) {
                    printf("validate_same_version: io_iterator_t existing = %d.%d.%d.%d, new = %d.%d.%d.%d\n", LODWORD(v66[0]), DWORD1(v66[0]), DWORD2(v66[0]), HIDWORD(v66[0]), *((_DWORD *)v4 + 13), *((_DWORD *)v4 + 14), *((_DWORD *)v4 + 15), *((_DWORD *)v4 + 16));
                  }
                  else {
                    uarpLogInfo(3u, "validate_same_version: io_iterator_t existing = %d.%d.%d.%d, new = %d.%d.%d.%d\n", LODWORD(v66[0]), DWORD1(v66[0]), DWORD2(v66[0]), HIDWORD(v66[0]), *((_DWORD *)v4 + 13), *((_DWORD *)v4 + 14), *((_DWORD *)v4 + 15), *((_DWORD *)v4 + 16));
                  }
                  if (uarpVersionCompare(v66, (_DWORD *)v4 + 13))
                  {
                    unsigned int v3 = 24;
                    goto LABEL_110;
                  }
                  unsigned int v53 = uarpPlatformEndpointAssetFullyStaged(v5, *v4);
                  if (v53)
                  {
                    unsigned int v3 = v53;
                    if (inRestore) {
                      printf("Failed to mark asset as fully staged when verifying version: 0x%x\n", v53);
                    }
                    else {
                      uarpLogError(3u, "Failed to mark asset as fully staged when verifying version: 0x%x\n", v53);
                    }
                    int v4 = v55;
                    uint64_t v5 = v56;
                    goto LABEL_110;
                  }
                  return;
                }
              }
              goto LABEL_152;
            }
LABEL_153:
            unsigned int v3 = 30;
            goto LABEL_110;
          }
        }
      }
      goto LABEL_108;
    }
  }
  uint64_t v17 = PayloadMetaData;
  char v18 = 0;
  uint64_t v19 = PayloadMetaData;
  do
  {
    while (1)
    {
      if (*(_DWORD *)v19 == -2001563365)
      {
        if (*(_DWORD *)(v19 + 4) != 8) {
          goto LABEL_108;
        }
        unint64_t v20 = uarpNtohll(**(void **)(v19 + 8));
        unint64_t v21 = v20;
        if (inRestore && (*(unsigned char *)(v8 + 3768) & 2) != 0) {
          printf("Found Board ID 0x%llx\n", v20);
        }
        else {
          uarpLogInfo(3u, "Found Board ID 0x%llx\n", v20);
        }
        if (v21 == v68) {
          break;
        }
      }
      uint64_t v19 = *(void *)(v19 + 16);
      if (!v19)
      {
        if (v18) {
          goto LABEL_47;
        }
        goto LABEL_98;
      }
    }
    unsigned int v3 = 15;
    if (LOBYTE(v66[0]) != 68 || BYTE1(v66[0]) != 76 || v54 != 0xFFFF) {
      goto LABEL_109;
    }
    uint64_t v19 = *(void *)(v19 + 16);
    char v18 = 1;
    int v54 = (unsigned __int16)v13;
  }
  while (v19);
  int v54 = (unsigned __int16)v13;
LABEL_47:
  unsigned __int8 v65 = 0;
  int v64 = 0;
  unsigned int PersParam = BackendGetPersParam(*(void **)(v5 + 1384));
  if (!PersParam)
  {
    while (1)
    {
      int v22 = *(_DWORD *)v17;
      if (*(_DWORD *)v17 == -2001563376)
      {
        if (v4[5]) {
          goto LABEL_108;
        }
        long long v43 = uarpZalloc(*(unsigned int *)(v17 + 4));
        v4[5] = (uint64_t)v43;
        if (!v43)
        {
          unsigned int v3 = 11;
          goto LABEL_109;
        }
        size_t v44 = *(unsigned int *)(v17 + 4);
        *((_DWORD *)v4 + 12) = v44;
        memcpy(v43, *(const void **)(v17 + 8), v44);
      }
      else if (v22 == -2001563355)
      {
        if (*(_DWORD *)(v17 + 4) != 4) {
          goto LABEL_108;
        }
        long long v40 = *(unsigned int **)(v17 + 8);
        if (!v40) {
          goto LABEL_108;
        }
        int v41 = uarpNtohl(*v40);
        int v42 = BackendTagHint(*(void **)(v5 + 1384));
        if (v42)
        {
          if (inRestore) {
            printf("Non-Fatal error sending tag hint(0x%x) to backend: 0x%x\n", v41, v42);
          }
          else {
            uarpLogError(3u, "Non-Fatal error sending tag hint(0x%x) to backend: 0x%x\n", v41, v42);
          }
        }
      }
      else if (v22 == -2001563364)
      {
        unsigned int v23 = *(_DWORD *)(v17 + 4);
        if (v23 >= 9)
        {
          unsigned int v24 = 0;
          int v25 = 0;
          int v26 = 0;
          int v27 = *(char **)(v17 + 8);
          unsigned int v28 = 255;
          do
          {
            int v29 = uarpNtohl(*(_DWORD *)v27);
            unsigned int v30 = v23 - 8;
            unsigned int v31 = uarpNtohl(*((_DWORD *)v27 + 1));
            unsigned int v23 = v23 - 8 - v31;
            if (v30 < v31) {
              goto LABEL_96;
            }
            unsigned int v32 = v31;
            long long v33 = (unsigned int *)(v27 + 8);
            switch(v29)
            {
              case -2001563361:
                if (v31 != 9) {
                  goto LABEL_96;
                }
                uint64_t v69 = *(void *)v33;
                char v70 = v27[16];
                char v71 = 0;
                if (inRestore && (logLevel & 2) != 0) {
                  printf("Found matching tags %s\n", (const char *)&v69);
                }
                else {
                  uarpLogInfo(3u, "Found matching tags %s\n", (const char *)&v69);
                }
                unsigned int v34 = *(_DWORD *)(v27 + 13);
                int v26 = uarpNtohl(*((_DWORD *)v27 + 2));
                int v25 = uarpNtohl(v34);
                break;
              case -2001563362:
                if (v31 != 4) {
                  goto LABEL_96;
                }
                unsigned int v24 = uarpNtohl(*v33);
                break;
              case -2001563363:
                if (v31 != 4) {
                  goto LABEL_96;
                }
                unsigned int v28 = uarpNtohl(*v33);
                break;
            }
            int v27 = (char *)v33 + v32;
          }
          while (v23 > 8);
          if (v28 > v24)
          {
LABEL_96:
            int v4 = v55;
            uint64_t v5 = v56;
            unint64_t v8 = 0x26AA38000;
            goto LABEL_93;
          }
          uint64_t v5 = v56;
          if (v26)
          {
            if (v25)
            {
              BOOL v36 = v65 < v28 || v65 > v24;
              BOOL v37 = !v36;
              if (v36) {
                int v38 = v61;
              }
              else {
                int v38 = v26;
              }
              int v39 = v60;
              if (v37) {
                int v39 = v25;
              }
              int v60 = v39;
              int v61 = v38;
            }
            int v4 = v55;
            unint64_t v8 = 0x26AA38000;
          }
          else
          {
            int v4 = v55;
            unint64_t v8 = 0x26AA38000;
          }
        }
      }
LABEL_93:
      uint64_t v17 = *(void *)(v17 + 16);
      if (!v17) {
        goto LABEL_98;
      }
    }
  }
LABEL_141:
  unsigned int v3 = PersParam;
LABEL_109:
  uarpFree(v58);
LABEL_110:
  uarpPlatformEndpointAssetAbandon(v5, v5 + 1080, *v4, 2304);
LABEL_111:
  int v47 = inRestore;
  long long v48 = uarpStatusCodeToString(v3);
  if (v47) {
    printf("ERROR: failed in fAssetAllHeadersAndMetaDataComplete, status = 0x%x (%s)\n", v3, v48);
  }
  else {
    uarpLogError(3u, "ERROR: failed in fAssetAllHeadersAndMetaDataComplete, status = 0x%x (%s)\n", v3, v48);
  }
}

uint64_t fAssetProcessingNotificationAck_1()
{
  if (inRestore && (logLevel & 2) != 0) {
    puts("fAssetProcessingNotificationAck called");
  }
  else {
    uarpLogInfo(3u, "fAssetProcessingNotificationAck called\n");
  }
  return 0;
}

uint64_t stage4_beginning(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 33))
  {
    if (inRestore && (logLevel & 2) != 0) {
      puts("Begin Manifest Request");
    }
    else {
      uarpLogInfo(3u, "Begin Manifest Request\n");
    }
    return USBCUpdateSendManifestRequest(a1, a2);
  }
  else
  {
    if (inRestore && (logLevel & 2) != 0) {
      puts("Stage image");
    }
    else {
      uarpLogInfo(3u, "Stage image\n");
    }
    return buildAndStageImage(a1, a2);
  }
}

uint64_t IM4MHeadersAndMetadataComplete(void *a1, uint64_t a2, uint64_t a3)
{
  __int16 v8 = 0;
  uint64_t result = uarpPlatformEndpointAssetQueryNumberOfPayloads((uint64_t)a1, a3, &v8);
  if (!result && v8 == 1)
  {
    long long v6 = 0u;
    long long v7 = 0u;
    uint64_t result = uarpAssetQueryPayloadInfo((uint64_t)a1, a3, 0, (uint64_t)&v6);
    if (!result)
    {
      FWImageSetComponentSize(*(uint32x4_t **)(a1[171] + 24), 2u, DWORD2(v7));
      FWImageSetActiveComponent(*(void *)(a1[171] + 24), 2);
      return uarpPlatformEndpointAssetSetPayloadIndex(a1, a1[172], 0);
    }
  }
  return result;
}

uint64_t CRCByte(unsigned int a1, uint64_t a2)
{
  for (int i = 0; i != 8; ++i)
  {
    if (((a1 >> i) & 1) != a2 >> 31) {
      a2 = ((a1 >> i) & 1 ^ (a2 >> 31) | (2 * a2)) ^ 0x4C11DB6;
    }
    else {
      a2 = (2 * a2);
    }
  }
  return a2;
}

uint64_t CRCBuffer(uint64_t a1, int a2, uint64_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (a2)
  {
    for (uint64_t i = 0; i != a2; ++i)
    {
      int v4 = 0;
      unsigned int v5 = *(unsigned __int8 *)(a1 + i);
      do
      {
        if (((v5 >> v4) & 1) != a3 >> 31) {
          a3 = ((v5 >> v4) & 1 ^ (a3 >> 31) | (2 * a3)) ^ 0x4C11DB6;
        }
        else {
          a3 = (2 * a3);
        }
        ++v4;
      }
      while (v4 != 8);
    }
  }
  return a3;
}

uint64_t parse_serial_string_u64(char *a1, const char *a2, unint64_t *a3)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v9 = 0;
        unint64_t v10 = 0;
        uint64_t result = parse_serial_string(a1, a2, (unsigned __int8 *)&v10, 8, &v9);
        if (!result)
        {
          switch(v9)
          {
            case 1:
              uint64_t result = 0;
              unint64_t v7 = v10;
              goto LABEL_13;
            case 2:
              int v8 = uarpNtohs((unsigned __int16)v10);
              goto LABEL_11;
            case 4:
              int v8 = uarpNtohl(v10);
LABEL_11:
              LODWORD(v7) = v8;
              uint64_t result = 0;
              unint64_t v7 = v7;
              goto LABEL_13;
            case 8:
              unint64_t v7 = uarpNtohll(v10);
              uint64_t result = 0;
LABEL_13:
              *a3 = v7;
              break;
            default:
              if (inRestore) {
                printf("Unexpected length of field %s in USB string: 0x%lx bytes\n", a2, v9);
              }
              else {
                uarpLogError(3u, "Unexpected length of field %s in USB string: 0x%lx bytes\n", a2, v9);
              }
              uint64_t result = 39;
              break;
          }
        }
      }
    }
  }
  return result;
}

uint64_t parse_serial_string(char *a1, const char *a2, unsigned __int8 *a3, uint64_t a4, uint64_t *a5)
{
  int v8 = strstr(a1, a2);
  if (!v8)
  {
    if (!inRestore)
    {
      uarpLogError(3u, "Cannot find start_of_needle\n");
      return 30;
    }
    uint64_t v9 = "Cannot find start_of_needle";
LABEL_7:
    puts(v9);
    return 30;
  }
  unint64_t v10 = strchr(v8, 58);
  if (!v10)
  {
    if (!inRestore)
    {
      uarpLogError(3u, "Cannot find start of buffer\n");
      return 30;
    }
    uint64_t v9 = "Cannot find start of buffer";
    goto LABEL_7;
  }
  int v11 = v10;
  int v12 = v10 + 1;
  uint64_t v13 = strchr(v10 + 1, 32);
  if (v13)
  {
    size_t v14 = v13 - v12;
    if (((v13 - v12) & 1) == 0)
    {
LABEL_10:
      uint64_t v15 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    size_t v14 = strlen(v12);
    if ((v14 & 1) == 0) {
      goto LABEL_10;
    }
  }
  unsigned __int8 v19 = 0;
  if (sscanf(v12, "%1hhx", &v19) != 1)
  {
    if (inRestore) {
      puts("Reading of start_of_buffer failed");
    }
    else {
      uarpLogError(3u, "Reading of start_of_buffer failed\n");
    }
  }
  if (sscanf(v12, "%1hhx", &v19) != 1) {
    return 54;
  }
  *a3++ = v19;
  --a4;
  int v12 = v11 + 2;
  --v14;
  uint64_t v15 = 1;
LABEL_21:
  if (!v14)
  {
LABEL_39:
    uint64_t result = 0;
    *a5 = v15;
    return result;
  }
  while (1)
  {
    unsigned __int8 v18 = 0;
    if (sscanf(v12, "%2hhx", &v18) != 1)
    {
      int v17 = *a3;
      if (inRestore) {
        printf("Reading bytes failed, nibbles_in_field=0x%zX, buffer=%p, *buffer=0x%hhX, buffer_size=0x%zX, count=0x%zX, start_of_buf=%s\n", v14, a3, v17, a4, v15, v12);
      }
      else {
        uarpLogError(3u, "Reading bytes failed, nibbles_in_field=0x%zX, buffer=%p, *buffer=0x%hhX, buffer_size=0x%zX, count=0x%zX, start_of_buf=%s\n", v14, a3, v17, a4, v15, v12);
      }
    }
    if (sscanf(v12, "%2hhx", &v18) != 1) {
      return 54;
    }
    if (a3)
    {
      if (!a4) {
        return 39;
      }
    }
    else
    {
      if (inRestore) {
        printf("Buffer size = 0! ");
      }
      else {
        uarpLogError(3u, "Buffer size = 0! ");
      }
      if (inRestore)
      {
        printf("nibbles_in_field=0x%zX, buffer=%p, *buffer=0x%hhX, buffer_size=0x%zX, count=0x%zX, start_of_buf=%s\n", v14, 0, 0, a4, v15, v12);
        if (!a4) {
          return 39;
        }
      }
      else
      {
        uarpLogError(3u, "nibbles_in_field=0x%zX, buffer=%p, *buffer=0x%hhX, buffer_size=0x%zX, count=0x%zX, start_of_buf=%s\n", v14, 0, 0, a4, v15, v12);
        if (!a4) {
          return 39;
        }
      }
    }
    *a3++ = v18;
    --a4;
    ++v15;
    v12 += 2;
    v14 -= 2;
    if (!v14) {
      goto LABEL_39;
    }
  }
}

uint64_t parse_serial_string_buffer(char *a1, const char *a2, unsigned __int8 *a3, uint64_t a4)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a3) {
      return parse_serial_string(a1, a2, a3, a4, &v6);
    }
  }
  return result;
}

uint64_t apBoardForAceBoard(uint64_t a1)
{
  if (a1 == 90190080)
  {
    unint64_t v1 = 0;
    return apBoardForAceBoard_lookup[4 * v1 + 2];
  }
  else
  {
    unint64_t v2 = -1;
    unsigned int v3 = &qword_263E16CB8;
    while (v2 != 6)
    {
      uint64_t v4 = *v3;
      v3 += 2;
      ++v2;
      if (v4 == a1)
      {
        BOOL v5 = v2 > 6;
        unint64_t v1 = v2 + 1;
        if (!v5) {
          return apBoardForAceBoard_lookup[4 * v1 + 2];
        }
        return BYTE3(a1);
      }
    }
    return BYTE3(a1);
  }
}

uint64_t apChipForAceBoard(uint64_t a1)
{
  if (a1 == 1612777216)
  {
    BOOL v1 = 0;
  }
  else
  {
    unint64_t v2 = 0;
    unsigned int v3 = &qword_263E16D38;
    do
    {
      unint64_t v4 = v2;
      if (v2 == 3) {
        break;
      }
      uint64_t v5 = *v3;
      v3 += 2;
      ++v2;
    }
    while (v5 != a1);
    BOOL v1 = v4 > 2;
  }
  if (v1) {
    return (unsigned __int16)(a1 >> 8);
  }
  else {
    return 24609;
  }
}

uint64_t uarpVersionToAceVersion(unsigned int *a1, unsigned int *a2, _WORD *a3)
{
  if (!a1) {
    return 30;
  }
  if (*a1 <= 0xDFF) {
    unsigned int v3 = *a1;
  }
  else {
    unsigned int v3 = *a1 - 3584;
  }
  if (v3 > 0x63) {
    return 0;
  }
  int v4 = *a1 <= 0xDFF ? 0 : 3584;
  unsigned int v5 = a1[1];
  if (v5 > 0x3E7) {
    return 0;
  }
  unsigned int v6 = a1[2];
  if (v6 > 0x63) {
    return 0;
  }
  if (a2) {
    *a2 = ((((5243 * ((unsigned __int16)v5 >> 2)) >> 9) & 0x3FF00 | (16
  }
                                                                                 * ((((unsigned __int16)v5 / 0xAu)
                                                                                   % 0xAu) & 0xF)) | ((unsigned __int16)v5 % 0xAu)) << 8) | (((v3 % 0xAu) | (16 * (v3 / 0xAu)) | v4) << 20) | (v6 % 0xAu) | ((205 * v6) >> 7) & 0xF0;
  if (!a3) {
    return 0;
  }
  uint64_t v7 = 0;
  *a3 = a1[3];
  return v7;
}

uint64_t aceVersionToUARPVersion(unsigned int a1, int a2, _DWORD *a3)
{
  if (!a3) {
    return 30;
  }
  uint64_t result = 0;
  *a3 = ((a1 >> 20) & 0xFFFFFF0F) + 10 * (HIBYTE(a1) & 0xF);
  a3[1] = ((a1 >> 8) & 0xF) + 10 * ((unsigned __int16)a1 >> 12) + 100 * (HIWORD(a1) & 0xF);
  a3[2] = (a1 & 0xF) + 10 * (a1 >> 4);
  a3[3] = a2;
  return result;
}

void UarpRestoreLayer3LogError_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_263DF3000, a2, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v2, 0xCu);
}

void UarpRestoreLayer3LogDebug_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_263DF3000, a2, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v2, 0xCu);
}

void UarpRestoreLayer3LogFault_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_263DF3000, a2, OS_LOG_TYPE_FAULT, "%s", (uint8_t *)&v2, 0xCu);
}

void uarpLogError_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void uarpLogDebug_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = &uarpLogDebug_logBuffer;
  _os_log_debug_impl(&dword_263DF3000, log, OS_LOG_TYPE_DEBUG, "%s\n", (uint8_t *)&v1, 0xCu);
}

void uarpLogFault_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void uarpPlatformDarwinLogError_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void uarpPlatformDarwinLogDebug_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = &uarpPlatformDarwinLogDebug_logBuffer;
  _os_log_debug_impl(&dword_263DF3000, log, OS_LOG_TYPE_DEBUG, "%s\n", (uint8_t *)&v1, 0xCu);
}

void uarpPlatformDarwinLogFault_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = &uarpPlatformDarwinLogFault_logBuffer;
  _os_log_fault_impl(&dword_263DF3000, log, OS_LOG_TYPE_FAULT, "%s\n", (uint8_t *)&v1, 0xCu);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return (*(uint64_t (**)(unsigned __int8 *, CC_SHA256_CTX *))&sel_offerPersonalizationResponse_[8])(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return (*(uint64_t (**)(CC_SHA256_CTX *))&sel_offerPersonalizationResponse_[16])(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return (*(uint64_t (**)(CC_SHA256_CTX *, const void *, void))&sel_offerPersonalizationResponse_[24])(c, data, *(void *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return sel_personalizationRequestDict(md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return ((uint64_t (*)(CC_SHA512_CTX *))*(&sel_personalizationRequestDict + 1))(c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return ((uint64_t (*)(CC_SHA512_CTX *, const void *, void))*(&sel_personalizationRequestDict + 2))(c, data, *(void *)&len);
}

#error "263E11584: call analysis failed (funcsize=3)"

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return sel_printUpdaterMode(c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return ((uint64_t (*)(CC_SHA512_CTX *, const void *, void))*(&sel_printUpdaterMode + 1))(c, data, *(void *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x270EE4910](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x270EE4C50](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x270EE5498](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x270EE54A8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x270EF3FC8](*(void *)&service, pluginType, interfaceType, theInterface, theScore);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x270EF49E8](*(void *)&mainPort, path);
}

kern_return_t IORegistryEntryGetChildEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *child)
{
  return MEMORY[0x270EF49F0](*(void *)&entry, plane, child);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x270EF4A60](*(void *)&entry, propertyName, property);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t __memcpy_chk()
{
  return off_270ED7E38();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)_feof((FILE *)__count);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F48](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x270ED9910](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x270ED9918](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270EDA098](a1);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_parse_boot_arg_int()
{
  return MEMORY[0x270EDAA30]();
}

uint64_t os_parse_boot_arg_string()
{
  return MEMORY[0x270EDAA38]();
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x270EDAB58]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int putchar(int a1)
{
  return MEMORY[0x270EDB090](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}