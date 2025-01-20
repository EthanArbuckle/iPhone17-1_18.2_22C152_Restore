uint64_t __sb__runningInSpringBoard()
{
  void *v0;
  uint64_t vars8;

  if (__sb__runningInSpringBoard___once != -1) {
    dispatch_once(&__sb__runningInSpringBoard___once, &__block_literal_global_21);
  }
  v0 = (void *)__sb__overrideRunningInSpringBoard;
  if (!__sb__overrideRunningInSpringBoard) {
    return __sb__runningInSpringBoard___result;
  }
  return [v0 BOOLValue];
}

id SBLogAnalytics()
{
  if (SBLogAnalytics_onceToken != -1) {
    dispatch_once(&SBLogAnalytics_onceToken, &__block_literal_global_93);
  }
  v0 = (void *)SBLogAnalytics___logObj;
  return v0;
}

id SBLogTraitsArbiter()
{
  if (SBLogTraitsArbiter_onceToken != -1) {
    dispatch_once(&SBLogTraitsArbiter_onceToken, &__block_literal_global_153);
  }
  v0 = (void *)SBLogTraitsArbiter___logObj;
  return v0;
}

id SBLogStatusBarish()
{
  if (SBLogStatusBarish_onceToken != -1) {
    dispatch_once(&SBLogStatusBarish_onceToken, &__block_literal_global_102);
  }
  v0 = (void *)SBLogStatusBarish___logObj;
  return v0;
}

id SBLogKeyboardFocus()
{
  if (SBLogKeyboardFocus_onceToken != -1) {
    dispatch_once(&SBLogKeyboardFocus_onceToken, &__block_literal_global_150);
  }
  v0 = (void *)SBLogKeyboardFocus___logObj;
  return v0;
}

id SBLogAuthenticationController()
{
  if (SBLogAuthenticationController_onceToken != -1) {
    dispatch_once(&SBLogAuthenticationController_onceToken, &__block_literal_global_215);
  }
  v0 = (void *)SBLogAuthenticationController___logObj;
  return v0;
}

id SBLogIdleTimer()
{
  if (SBLogIdleTimer_onceToken != -1) {
    dispatch_once(&SBLogIdleTimer_onceToken, &__block_literal_global_54);
  }
  v0 = (void *)SBLogIdleTimer___logObj;
  return v0;
}

BOOL SBSDisplayLayoutRoleIsDefined(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0xA;
}

uint64_t _XSetApplicationNetworkFlags(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 40) && *(_DWORD *)(result + 44) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      uint64_t v5 = *(unsigned __int8 *)(result + 32);
      uint64_t v6 = *(unsigned __int8 *)(result + 36);
      long long v7 = *(_OWORD *)(result + 76);
      v8[0] = *(_OWORD *)(result + 60);
      v8[1] = v7;
      result = _SBMigSetApplicationNetworkFlags(v4, v5, v6, v8);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_8;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
LABEL_8:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _SBMigSetApplicationNetworkFlags(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetApplicationNetworkFlags");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

void _XSetAlertSuppressionContexts(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(unsigned char *)(a1 + 39) == 1 && (int v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        int v6 = *(_DWORD *)(a1 + 12);
        uint64_t v7 = *(void *)(a1 + 28);
        long long v8 = *(_OWORD *)(a1 + 92);
        v9[0] = *(_OWORD *)(a1 + 76);
        v9[1] = v8;
        *(_DWORD *)(a2 + 32) = _SBMigSetAlertSuppressionContexts(v6, v7, v4, v9);
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 28) = 0;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }
      int v5 = -309;
    }
    else
    {
      int v5 = -300;
    }
  }
  else
  {
    int v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

uint64_t _SBMigSetAlertSuppressionContexts(int a1, uint64_t a2, int a3, long long *a4)
{
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXSetAlertSuppressionContexts");
  if (!FunctionForSymbol) {
    return 5;
  }
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___SBMigSetAlertSuppressionContexts_block_invoke;
  v12[3] = &unk_1E566C3D0;
  v12[4] = &v17;
  v12[5] = FunctionForSymbol;
  v12[6] = a2;
  int v13 = a1;
  int v14 = a3;
  long long v9 = a4[1];
  long long v15 = *a4;
  long long v16 = v9;
  dispatch_sync(MEMORY[0x1E4F14428], v12);
  uint64_t v10 = *((unsigned int *)v18 + 6);
  _Block_object_dispose(&v17, 8);
  return v10;
}

BOOL SBSGetScreenLockStatus(BOOL *a1)
{
  __int16 v4 = 0;
  uint64_t v2 = SBSSpringBoardServerPort();
  SBGetScreenLockStatus(v2, (char *)&v4 + 1, &v4);
  if (a1) {
    *a1 = (_BYTE)v4 != 0;
  }
  return HIBYTE(v4) != 0;
}

uint64_t _SBSGetScreenLockStatus(int a1, unsigned char *a2, unsigned char *a3)
{
  *(_OWORD *)&msg[20] = 0u;
  long long v12 = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0x186A700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 100107)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v8 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a2 = v12;
                *a3 = BYTE4(v12);
                return v8;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = *(_DWORD *)&msg[32] == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = *(unsigned int *)&msg[32];
            }
            goto LABEL_25;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_25;
  }
  return v8;
}

uint64_t _XAddWallpaperAnimationSuspensionAssertion(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v4 = result;
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x38 || v5 > 0x438) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_3;
  }
  unsigned int v6 = *(_DWORD *)(result + 52);
  int v3 = -304;
  if (v6 > 0x400 || (int)v5 - 56 < v6) {
    goto LABEL_3;
  }
  if (v5 == ((v6 + 3) & 0xFFFFFFFC) + 56 && (result = (uint64_t)memchr((void *)(result + 56), 0, v5 - 56)) != 0)
  {
    uint64_t v7 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
    if (!*(_DWORD *)v7 && *(_DWORD *)(v7 + 4) > 0x1Fu)
    {
      uint64_t v8 = *(unsigned int *)(v4 + 12);
      uint64_t v9 = *(unsigned int *)(v4 + 28);
      long long v10 = *(_OWORD *)(v7 + 36);
      v11[0] = *(_OWORD *)(v7 + 20);
      v11[1] = v10;
      result = _SBMigAddWallpaperAnimationSuspensionAssertion(v8, v4 + 56, v9, v11);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
    int v3 = -309;
  }
  else
  {
LABEL_2:
    int v3 = -304;
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _SBMigAddWallpaperAnimationSuspensionAssertion(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXAddWallpaperAnimationSuspensionAssertion");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _XAddBiometricAssertion(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v4 = result;
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x3C || v5 > 0x43C) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_3;
  }
  unsigned int v6 = *(_DWORD *)(result + 52);
  if (v6 > 0x400) {
    goto LABEL_2;
  }
  int v3 = -304;
  if ((int)v5 - 60 < v6) {
    goto LABEL_3;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v5 != v7 + 60) {
    goto LABEL_3;
  }
  uint64_t v8 = 1080;
  if (*(unsigned int *)(result + 4) < 0x438uLL) {
    uint64_t v8 = *(unsigned int *)(result + 4);
  }
  result = (uint64_t)memchr((void *)(result + 56), 0, v8 - 56);
  if (result)
  {
    uint64_t v9 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
    if (!*(_DWORD *)v9 && *(_DWORD *)(v9 + 4) > 0x1Fu)
    {
      uint64_t v10 = *(unsigned int *)(v4 + 12);
      uint64_t v11 = *(unsigned int *)(v4 + 28);
      uint64_t v12 = *(unsigned __int8 *)(v4 + v7 + 56);
      long long v13 = *(_OWORD *)(v9 + 36);
      v14[0] = *(_OWORD *)(v9 + 20);
      v14[1] = v13;
      result = _SBMigAddBiometricAssertion(v10, v4 + 56, v11, v12, v14);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
    int v3 = -309;
  }
  else
  {
LABEL_2:
    int v3 = -304;
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _SBMigAddBiometricAssertion(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXAddBiometricAssertion");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v11 = a5[1];
  v13[0] = *a5;
  v13[1] = v11;
  return FunctionForSymbol(a1, a2, a3, a4, v13);
}

uint64_t _XSetWantsVolumeButtonEvents(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      uint64_t v5 = *(unsigned int *)(result + 32);
      long long v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      result = _SBMigSetWantsVolumeButtonEvents(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _SBMigSetWantsVolumeButtonEvents(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetWantsVolumeButtonEvents");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

_DWORD *_XGetScreenLockStatus(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x1E4F14068];
    goto LABEL_8;
  }
  result = (_DWORD *)_SBMigGetScreenLockStatus(result[3], (unsigned char *)(a2 + 36), (unsigned char *)(a2 + 40));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }
LABEL_8:
  *(void *)(a2 + 24) = v4;
  return result;
}

uint64_t _SBMigGetScreenLockStatus(int a1, unsigned char *a2, unsigned char *a3)
{
  *a2 = 0;
  *a3 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetScreenLockStatus");
  if (!FunctionForSymbol) {
    return 5;
  }
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___SBMigGetScreenLockStatus_block_invoke;
  block[3] = &unk_1E566C330;
  block[4] = &v11;
  block[5] = FunctionForSymbol;
  int v10 = a1;
  block[6] = a2;
  block[7] = a3;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  uint64_t v7 = *((unsigned int *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t _SBSAddWallpaperAnimationSuspensionAssertion(mach_port_t a1, const char *a2, int a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  memset(v14, 0, 464);
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v11 = 1;
  int v12 = a3;
  DWORD1(v13) = 1310720;
  *((void *)&v13 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v4 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  }
  else {
    int v4 = mig_strncpy((char *)v14 + 8, a2, 1024);
  }
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v4;
  mach_msg_size_t v5 = ((v4 + 3) & 0xFFFFFFFC) + 56;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(void *)&rcv_name.msgh_voucher_port = 0x186D700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t special_reply_port = rcv_name.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&rcv_name, 3162115, v5, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0) {
    goto LABEL_17;
  }
  if (v7)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v8 - 268435459) > 1) {
      return v8;
    }
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
LABEL_22:
    mach_msg_destroy(&rcv_name);
    return v8;
  }
  if (rcv_name.msgh_id == 71)
  {
    uint64_t v8 = 4294966988;
    goto LABEL_22;
  }
  if (rcv_name.msgh_id != 100155)
  {
    uint64_t v8 = 4294966995;
    goto LABEL_22;
  }
  uint64_t v8 = 4294966996;
  if ((rcv_name.msgh_bits & 0x80000000) != 0) {
    goto LABEL_22;
  }
  if (rcv_name.msgh_size != 36) {
    goto LABEL_22;
  }
  if (rcv_name.msgh_remote_port) {
    goto LABEL_22;
  }
  uint64_t v8 = v13;
  if (v13) {
    goto LABEL_22;
  }
  return v8;
}

uint64_t SBSIsSystemApertureAvailable()
{
  if (SBSIsSystemApertureAvailable___onceToken != -1) {
    dispatch_once(&SBSIsSystemApertureAvailable___onceToken, &__block_literal_global_53);
  }
  return SBSIsSystemApertureAvailable___isSystemApertureAvailable;
}

void __SBSIsSystemApertureAvailable_block_invoke()
{
  CFDictionaryRef v0 = (const __CFDictionary *)MGCopyAnswer();
  if (v0)
  {
    CFDictionaryRef v1 = v0;
    uint64_t v2 = CFDictionaryGetValue(v0, @"ArtworkDeviceSubType");
    int v3 = v2;
    if (v2) {
      _block_invoke_deviceSubtype = (int)[v2 intValue];
    }
    CFRelease(v1);
  }
  char v4 = 1;
  if (_block_invoke_deviceSubtype > 2795)
  {
    if (_block_invoke_deviceSubtype != 2796 && _block_invoke_deviceSubtype != 2868) {
      goto LABEL_11;
    }
  }
  else if (_block_invoke_deviceSubtype != 2556 && _block_invoke_deviceSubtype != 2622)
  {
LABEL_11:
    char v4 = 0;
  }
  SBSIsSystemApertureAvailable___isSystemApertureAvailable = v4;
}

void __SBSServerPortHelper_block_invoke()
{
  CFDictionaryRef v0 = (void *)MGCopyAnswer();
  int v1 = [v0 intValue];
  if (v0) {
    CFRelease(v0);
  }
  SBSServerPortHelper_isAppleTV = v1 == 4;
}

_DWORD *_XSetApplicationShowsProgress(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  if (v4 < 0x2C) {
    goto LABEL_16;
  }
  if (v4 > 0x42C) {
    goto LABEL_16;
  }
  unsigned int v5 = result[9];
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || v4 != v6 + 44) {
    goto LABEL_16;
  }
  uint64_t v8 = 1064;
  if (result[1] < 0x428uLL) {
    uint64_t v8 = result[1];
  }
  result = memchr(result + 10, 0, v8 - 40);
  if (result)
  {
    uint64_t v9 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      uint64_t v11 = v3[3];
      uint64_t v12 = *(unsigned int *)((char *)v3 + v6 + 40);
      long long v13 = *(_OWORD *)(v9 + 36);
      v14[0] = *(_OWORD *)(v9 + 20);
      v14[1] = v13;
      result = (_DWORD *)_SBMigSetApplicationShowsProgress(v11, (uint64_t)(v3 + 10), v12, v14);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v10 = -309;
  }
  else
  {
LABEL_16:
    int v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _SBMigSetApplicationShowsProgress(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetApplicationShowsProgress");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

BOOL SBSProcessIDForDisplayIdentifier(uint64_t a1, int *a2)
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F62AF8]);
  int v5 = [v4 pidForApplication:a1];
  if (a2 && v5 >= 1) {
    *a2 = v5;
  }
  BOOL v6 = v5 > 0;

  return v6;
}

void SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary(void *a1)
{
  id v1 = a1;
  if (SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary_onceToken != -1) {
    dispatch_once(&SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary_onceToken, &__block_literal_global_2);
  }
  uint64_t v2 = (void *)SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary___oldToNewKeys;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary_block_invoke_2;
  v4[3] = &unk_1E566B310;
  id v5 = v1;
  id v3 = v1;
  [v2 enumerateKeysAndObjectsUsingBlock:v4];
}

void __SBApplicationStateBeginGeneratingChangeNotifications_block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SBApplicationNotificationStateChanged" object:0 userInfo:*(void *)(a1 + 32)];
}

uint64_t _SBSDeactivateReachability(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x186D600000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

void __SBApplicationStateBeginGeneratingChangeNotifications_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __SBApplicationStateBeginGeneratingChangeNotifications_block_invoke_2;
  block[3] = &unk_1E566BCE8;
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void *SBSCopyBundleInfoValueForKeyAndProcessID(uint64_t a1, uint64_t a2)
{
  id v4 = _SBApplicationStateGetMonitor();
  id v5 = [v4 bundleInfoValueForKey:a1 PID:a2];
  BOOL v6 = v5;
  if (v5) {
    id v7 = v5;
  }

  return v6;
}

id _SBApplicationStateGetMonitor()
{
  pthread_mutex_lock(&sRegistrationCountLock);
  CFDictionaryRef v0 = _SBApplicationStateGetMonitor_Locked();
  pthread_mutex_unlock(&sRegistrationCountLock);
  return v0;
}

id _SBApplicationStateGetMonitor_Locked()
{
  CFDictionaryRef v0 = (void *)sMonitor;
  if (!sMonitor)
  {
    id v1 = objc_alloc(MEMORY[0x1E4F4F228]);
    uint64_t v2 = [v1 initWithBundleIDs:0 states:*MEMORY[0x1E4F4F190] elevatedPriority:1];
    id v3 = (void *)sMonitor;
    sMonitor = v2;

    CFDictionaryRef v0 = (void *)sMonitor;
  }
  return v0;
}

_DWORD *_XDeactivateReachability(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
  }
  else
  {
    id v3 = result + 6;
    if (!result[6] && result[7] > 0x1Fu)
    {
      uint64_t v5 = result[3];
      long long v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      result = (_DWORD *)_SBMigDeactivateReachability(v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _SBMigDeactivateReachability(uint64_t a1, _OWORD *a2)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXDeactivateReachability");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v5 = a2[1];
  v7[0] = *a2;
  v7[1] = v5;
  return FunctionForSymbol(a1, v7);
}

void *SBMigGetFunctionForSymbol(const void *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)__SharedWorkloop);
  uint64_t context = dispatch_mach_mig_demux_get_context();
  if (context)
  {
    uint64_t v3 = context;
    value = 0;
    NSMapMember((NSMapTable *)__FunctionMap, a1, 0, &value);
    if (value) {
      int v4 = "implemented";
    }
    else {
      int v4 = "not implemented";
    }
    int v5 = *(_DWORD *)(*(void *)(v3 + 8) + 20);
    int v6 = [*(id *)(v3 + 16) pid];
    id v7 = SBLogCommon();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

    if (v8)
    {
      long long v9 = BSProcessNameForPID();
      int v10 = SBLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v22 = [MEMORY[0x1E4F28F80] processInfo];
        v23 = [v22 processName];
        *(_DWORD *)buf = 138544642;
        *(void *)v26 = v9;
        *(_WORD *)&v26[8] = 1024;
        *(_DWORD *)&v26[10] = v6;
        __int16 v27 = 2082;
        *(void *)v28 = a1;
        *(_WORD *)&v28[8] = 1024;
        *(_DWORD *)&v28[10] = v5;
        __int16 v29 = 2082;
        v30 = v4;
        __int16 v31 = 2114;
        v32 = v23;
        _os_log_debug_impl(&dword_18FBC5000, v10, OS_LOG_TYPE_DEBUG, "[SBMig] %{public}@:%d calling %{public}s (msgID %d) --> %{public}s by %{public}@.", buf, 0x36u);
      }
    }
    else
    {
      long long v9 = SBLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v20 = [MEMORY[0x1E4F28F80] processInfo];
        v21 = [v20 processName];
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v26 = v6;
        *(_WORD *)&v26[4] = 2082;
        *(void *)&v26[6] = a1;
        __int16 v27 = 1024;
        *(_DWORD *)v28 = v5;
        *(_WORD *)&v28[4] = 2082;
        *(void *)&v28[6] = v4;
        __int16 v29 = 2114;
        v30 = v21;
        _os_log_impl(&dword_18FBC5000, v9, OS_LOG_TYPE_INFO, "[SBMig] Process %d calling %{public}s (msgID %d) --> %{public}s by %{public}@.", buf, 0x2Cu);
      }
    }

    return value;
  }
  else
  {
    uint64_t v11 = SBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      SBMigGetFunctionForSymbol_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    return 0;
  }
}

id SBLogCommon()
{
  if (SBLogCommon_onceToken != -1) {
    dispatch_once(&SBLogCommon_onceToken, &__block_literal_global_13);
  }
  CFDictionaryRef v0 = (void *)SBLogCommon___logObj;
  return v0;
}

void SBMachChannelHandleEvent(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  switch(a2)
  {
    case 7:
      BOOL v8 = SBLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        SBMachChannelHandleEvent_cold_5(v8, v9, v10, v11, v12, v13, v14, v15);
      }

      if (a1)
      {
        BSMachReceiveRightRelease();
        *((_DWORD *)a1 + 2) = 0;
        uint64_t v16 = (void *)a1[5];
        a1[5] = 0;
      }
      break;
    case 2:
      uint64_t v26 = 0;
      dispatch_mach_msg_get_msg();
      uint64_t v18 = SBLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        SBMachChannelHandleEvent_cold_4(v18, v19, v20, v21, v22, v23, v24, v25);
      }

      break;
    case 1:
      if (a1)
      {
        int v6 = SBLogCommon();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          uint64_t v7 = *a1;
          int buf = 136446210;
          *(void *)buf_4 = v7;
          _os_log_impl(&dword_18FBC5000, v6, OS_LOG_TYPE_INFO, "[SBMig] Service connected: %{public}s", (uint8_t *)&buf, 0xCu);
        }
      }
      break;
    default:
      uint64_t v17 = SBLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int buf = 134217984;
        *(void *)buf_4 = a2;
        _os_log_impl(&dword_18FBC5000, v17, OS_LOG_TYPE_INFO, "[SBMig] Unhandled dispatch mach reason %lu.", (uint8_t *)&buf, 0xCu);
      }

      break;
  }
}

uint64_t _SBSupportedType(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v19;
      int v6 = 1;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v19 != v5) {
            objc_enumerationMutation(v2);
          }
          BOOL v8 = [v2 objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          v6 &= _SBSupportedType(v8);
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v4);
      goto LABEL_20;
    }
LABEL_19:
    LOBYTE(v6) = 1;
LABEL_20:

    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = [v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      int v6 = 1;
      do
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v2);
          }
          v6 &= _SBSupportedType(*(void *)(*((void *)&v14 + 1) + 8 * j));
        }
        uint64_t v10 = [v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v10);
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    LOBYTE(v6) = objc_opt_isKindOfClass();
  }
LABEL_25:

  return v6 & 1;
}

double __sb__mainScreenReferenceBounds()
{
  CFDictionaryRef v0 = __sb__mainDisplayConfiguration();
  [v0 bounds];
  double v2 = v1;

  return v2;
}

id __sb__mainDisplayConfiguration()
{
  if (__sb__mainDisplayConfiguration___once != -1) {
    dispatch_once(&__sb__mainDisplayConfiguration___once, &__block_literal_global_3);
  }
  CFDictionaryRef v0 = (void *)__sb__mainDisplayConfiguration___mainDisplayConfiguration;
  return v0;
}

id SBLogPIP()
{
  if (SBLogPIP_onceToken != -1) {
    dispatch_once(&SBLogPIP_onceToken, &__block_literal_global_144);
  }
  CFDictionaryRef v0 = (void *)SBLogPIP___logObj;
  return v0;
}

id SBLogZStack()
{
  if (SBLogZStack_onceToken != -1) {
    dispatch_once(&SBLogZStack_onceToken, &__block_literal_global_147);
  }
  CFDictionaryRef v0 = (void *)SBLogZStack___logObj;
  return v0;
}

id SBLogDockRecents()
{
  if (SBLogDockRecents_onceToken != -1) {
    dispatch_once(&SBLogDockRecents_onceToken, &__block_literal_global_84);
  }
  CFDictionaryRef v0 = (void *)SBLogDockRecents___logObj;
  return v0;
}

void SBSSetAlertSuppressionContexts(void *a1)
{
  id v8 = a1;
  double v1 = (void *)MEMORY[0x192FC0BD0]();
  double v2 = [MEMORY[0x1E4F1C9B8] data];
  if (v8)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28F98];
    uint64_t v4 = [v8 allObjects];
    uint64_t v5 = [v3 dataWithPropertyList:v4 format:200 options:0 error:0];

    double v2 = (void *)v5;
  }
  uint64_t v6 = SBSSpringBoardServerPort();
  id v7 = v2;
  SBSetAlertSuppressionContexts(v6, [v7 bytes], [v7 length]);
}

uint64_t _SBSSetAlertSuppressionContexts(int a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v7 = 16777472;
  int v8 = a3;
  uint64_t v9 = *MEMORY[0x1E4F14068];
  int v10 = a3;
  *(void *)mach_msg_header_t msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18FC490E0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

void sub_18FBCB388(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (([v8 isEqualToString:v5] & 1) == 0)
  {
    uint64_t v6 = [*(id *)(a1 + 32) objectForKey:v5];

    if (!v6)
    {
      int v7 = [*(id *)(a1 + 32) objectForKey:v8];
      if (v7) {
        [*(id *)(a1 + 32) setObject:v7 forKey:v5];
      }
    }
    [*(id *)(a1 + 32) removeObjectForKey:v8];
  }
}

uint64_t SBSBacklightChangeSourceForDisplayLayoutTransitionReason(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.programmatic"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.homeButton"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.lockButton"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.volumeButton"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.otherButton"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.keyboard"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.smartCover"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.idleTimer"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.touch"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.plugin"])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.notification"])
  {
    uint64_t v2 = 12;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.prox"])
  {
    uint64_t v2 = 13;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.siri"])
  {
    uint64_t v2 = 14;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.boot"])
  {
    uint64_t v2 = 15;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.pocketState"])
  {
    uint64_t v2 = 16;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.externalRequest"])
  {
    uint64_t v2 = 17;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.externalAppRequest"])
  {
    uint64_t v2 = 18;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.springboardRequest"])
  {
    uint64_t v2 = 19;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.liftToWake"])
  {
    uint64_t v2 = 20;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.logout"])
  {
    uint64_t v2 = 21;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.notificationCenter"])
  {
    uint64_t v2 = 22;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.acPowerChange"])
  {
    uint64_t v2 = 23;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.chargingAccessoryChange"])
  {
    uint64_t v2 = 24;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.restoring"])
  {
    uint64_t v2 = 25;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.fullScreenAlert"])
  {
    uint64_t v2 = 26;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.languageChange"])
  {
    uint64_t v2 = 27;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.unknownUserEvent"])
  {
    uint64_t v2 = 28;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.coverSheet"])
  {
    uint64_t v2 = 29;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.SOSDismiss"])
  {
    uint64_t v2 = 30;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.actionButton"])
  {
    uint64_t v2 = 31;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.cameraButton"])
  {
    uint64_t v2 = 32;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.PowerDownDismiss"])
  {
    uint64_t v2 = 33;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.mouseButton"])
  {
    uint64_t v2 = 34;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.accessibility"])
  {
    uint64_t v2 = 35;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.accessoryAttached"])
  {
    uint64_t v2 = 36;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.authentication"])
  {
    uint64_t v2 = 37;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.sessionAlert"])
  {
    uint64_t v2 = 40;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.systemApertureClientRequest"])
  {
    uint64_t v2 = 41;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.ambient"])
  {
    uint64_t v2 = 42;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.bumpToWake"])
  {
    uint64_t v2 = 43;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.motionDetection"])
  {
    uint64_t v2 = 44;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.captureButton"])
  {
    uint64_t v2 = 46;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.captureButtonAccidentalActivationMitigation"])
  {
    uint64_t v2 = 48;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.magicKeyboardExtended"])
  {
    uint64_t v2 = 47;
  }
  else if ([v1 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.captureExtension"])
  {
    uint64_t v2 = 49;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *SBSDisplayLayoutRoleDescription(unint64_t a1)
{
  if (a1 >= 0xC)
  {
    [NSString stringWithFormat:@"unknown (%d)", a1];
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E566C650[a1];
  }
  return v1;
}

void sub_18FBCD618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *_SBFScreenTimeNameForCategory(unsigned int a1)
{
  if (a1 > 0x13) {
    return 0;
  }
  else {
    return off_1E566B168[a1];
  }
}

uint64_t soft_ADClientAddValueForScalarKey(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(uint64_t, uint64_t))getADClientAddValueForScalarKeySymbolLoc_ptr;
  id v8 = getADClientAddValueForScalarKeySymbolLoc_ptr;
  if (!getADClientAddValueForScalarKeySymbolLoc_ptr)
  {
    uint64_t v3 = (void *)AggregateDictionaryLibrary();
    v6[3] = (uint64_t)dlsym(v3, "ADClientAddValueForScalarKey");
    getADClientAddValueForScalarKeySymbolLoc_ptr = (_UNKNOWN *)v6[3];
    uint64_t v2 = (uint64_t (*)(uint64_t, uint64_t))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    soft_ADClientAddValueForScalarKey_cold_1();
  }
  return v2(a1, 1);
}

void sub_18FBCD770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _SBFScreenTimePostExternalChangeNotification(uint64_t state64)
{
  unsigned int v1 = state64;
  LODWORD(state64) = _SBFScreenTimePostExternalChangeNotification_token;
  if (_SBFScreenTimePostExternalChangeNotification_token != -1
    || (notify_register_check("com.apple.springboard.screenchanged", &_SBFScreenTimePostExternalChangeNotification_token), state64 = _SBFScreenTimePostExternalChangeNotification_token, _SBFScreenTimePostExternalChangeNotification_token != -1))
  {
    notify_set_state(state64, v1);
    return notify_post("com.apple.springboard.screenchanged");
  }
  return state64;
}

__CFString *NSStringFromSBSHardwareButtonKind(unint64_t a1)
{
  if (a1 >= 0xB)
  {
    [NSString stringWithFormat:@"<unknown:%d>", a1];
    unsigned int v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned int v1 = off_1E566BC10[a1];
  }
  return v1;
}

void sub_18FBCDD70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBSUIAppSetWantsVolumeButtonEvents(uint64_t a1)
{
  uint64_t v2 = SBSSpringBoardServerPort();
  return SBSetWantsVolumeButtonEvents(v2, a1);
}

void SBSSetStatusBarShowsActivityForApplication(int a1, void *a2, int a3)
{
  uint64_t v6 = (void *)MEMORY[0x192FC0BD0]();
  id v7 = a2;
  if (!v7 || (id v8 = v7, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    SBSSetStatusBarShowsActivityForApplication_cold_1();
  }
  if ((unint64_t)[v8 lengthOfBytesUsingEncoding:4] <= 0x3FF)
  {
    uint64_t v9 = (const void *)[NSString stringWithFormat:@"SBSSetStatusBarShowsActivityForApplication-%@", v8];
    _SBSRestartLock();
    int v10 = _SBSRestartGetInfoForIdentifier(v9);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = [v10 unsignedIntegerValue];
    }
    else {
      uint64_t v11 = 0;
    }
    if (v11 == (a1 == 0))
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __SBSSetStatusBarShowsActivityForApplication_block_invoke;
      v17[3] = &unk_1E566C4F0;
      id v18 = v8;
      char v20 = a1;
      int v19 = a3;
      uint64_t v12 = MEMORY[0x192FC0DF0](v17);
      uint64_t v13 = (void (**)(void))v12;
      if (a1) {
        long long v14 = (void *)v12;
      }
      else {
        long long v14 = 0;
      }
      _SBSRestartScheduleBlockForIdentifier(v9, v14);
    }
    else
    {
      uint64_t v13 = 0;
    }
    if (a1) {
      uint64_t v15 = v11 + 1;
    }
    else {
      uint64_t v15 = v11 - 1;
    }
    if (v15) {
      long long v16 = (const void *)[MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:];
    }
    else {
      long long v16 = 0;
    }
    _SBSRestartSetInfoForIdentifier(v9, v16);
    if (v13) {
      v13[2](v13);
    }
    _SBSRestartUnlock();
  }
}

uint64_t __SBSSetStatusBarShowsActivityForApplication_block_invoke(uint64_t a1)
{
  uint64_t v2 = SBSSpringBoardServerPort();
  uint64_t v3 = [*(id *)(a1 + 32) UTF8String];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 44);
  uint64_t v5 = *(unsigned int *)(a1 + 40);
  return SBSetApplicationShowsProgress(v2, v3, v4, v5);
}

uint64_t SBSUIAppDeactivateReachability()
{
  uint64_t v0 = SBSSpringBoardServerPort();
  return SBDeactivateReachability(v0);
}

uint64_t SBSSpringBoardServerPort()
{
  return SBSServerPortHelper("com.apple.springboard.services", springboardServerPort);
}

uint64_t SBSServerPortHelper(const char *a1, mach_port_name_t *a2)
{
  if (SBSServerPortHelper_onceToken != -1) {
    dispatch_once(&SBSServerPortHelper_onceToken, &__block_literal_global_6);
  }
  if (SBSServerPortHelper_isAppleTV) {
    return 0;
  }
  pthread_mutex_lock(&springboardServerPortLock);
  mach_port_type_t ptype = 0;
  uint64_t v5 = (ipc_space_t *)MEMORY[0x1E4F14960];
  if (mach_port_type(*MEMORY[0x1E4F14960], *a2, &ptype) || (ptype & 0x100000) != 0)
  {
    if (*a2 + 1 >= 2) {
      mach_port_deallocate(*v5, *a2);
    }
    *a2 = 0;
    bootstrap_look_up(*MEMORY[0x1E4F14638], a1, a2);
  }
  uint64_t v4 = *a2;
  pthread_mutex_unlock(&springboardServerPortLock);
  return v4;
}

uint64_t _SBSSetApplicationShowsProgress(mach_port_name_t a1, const char *a2, int a3, mach_msg_timeout_t a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(v14, 0, 480);
  *(_OWORD *)name = 0u;
  long long v13 = 0u;
  *((void *)&v13 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v7 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  }
  else {
    int v7 = mig_strncpy((char *)v14 + 8, a2, 1024);
  }
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v7;
  uint64_t v8 = (v7 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v9 = v8 + 44;
  *(_DWORD *)((char *)v14 + v8 + 8) = a3;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(void *)&long long v13 = 0x186D900000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)name);
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)name, 2097169, v9, 0, 0, a4, 0);
  if ((v10 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name[3]);
    }
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v10;
}

uint64_t _SBSRestartUnlock()
{
  return [(id)__SBSRestartLock unlock];
}

uint64_t _SBSRestartSetInfoForIdentifier(CFTypeRef cf, const void *a2)
{
  if (!cf || (CFTypeID v4 = CFGetTypeID(cf), v4 != CFStringGetTypeID())) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"identifier must be valid"];
  }
  _SBSRestartLock();
  if (a2) {
    CFDictionarySetValue((CFMutableDictionaryRef)__SBSRestartInfo, cf, a2);
  }
  else {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)__SBSRestartInfo, cf);
  }
  uint64_t v5 = (void *)__SBSRestartLock;
  return [v5 unlock];
}

uint64_t _SBSRestartLock()
{
  if (_SBSRestartLock_once != -1) {
    dispatch_once(&_SBSRestartLock_once, &__block_literal_global_35);
  }
  uint64_t v0 = (void *)__SBSRestartLock;
  return [v0 lock];
}

void _SBSRestartScheduleBlockForIdentifier(const void *a1, void *a2)
{
  id v6 = a2;
  if (!a1 || (CFTypeID v3 = CFGetTypeID(a1), v3 != CFStringGetTypeID())) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"identifier must be valid"];
  }
  _SBSRestartLock();
  CFTypeID v4 = (void *)__SBSRestartBlocks;
  if (v6)
  {
    uint64_t v5 = (void *)[v6 copy];
    [v4 setObject:v5 forKey:a1];
  }
  else
  {
    [(id)__SBSRestartBlocks removeObjectForKey:a1];
  }
  [(id)__SBSRestartLock unlock];
}

void sub_18FBCEA8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const void *_SBSRestartGetInfoForIdentifier(CFTypeRef cf)
{
  if (!cf || (CFTypeID v2 = CFGetTypeID(cf), v2 != CFStringGetTypeID())) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"identifier must be valid"];
  }
  _SBSRestartLock();
  Value = CFDictionaryGetValue((CFDictionaryRef)__SBSRestartInfo, cf);
  [(id)__SBSRestartLock unlock];
  return Value;
}

uint64_t _SBSAddBiometricAssertion(mach_port_t a1, const char *a2, int a3, char a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  memset(v18, 0, 464);
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v15 = 1;
  int v16 = a3;
  DWORD1(v17) = 1310720;
  *((void *)&v17 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v6 = mig_strncpy_zerofill((char *)v18 + 8, a2, 1024);
  }
  else {
    int v6 = mig_strncpy((char *)v18 + 8, a2, 1024);
  }
  LODWORD(v18[0]) = 0;
  DWORD1(v18[0]) = v6;
  uint64_t v7 = (v6 + 3) & 0xFFFFFFFC;
  uint64_t v8 = (char *)&rcv_name + v7;
  v8[56] = a4;
  *(_WORD *)(v8 + 57) = 0;
  v8[59] = 0;
  mach_msg_size_t v9 = v7 + 60;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(void *)&rcv_name.msgh_voucher_port = 0x186CE00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t special_reply_port = rcv_name.msgh_local_port;
  }
  uint64_t v11 = mach_msg(&rcv_name, 3162115, v9, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0) {
    goto LABEL_17;
  }
  if (v11)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v12 - 268435459) > 1) {
      return v12;
    }
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
LABEL_22:
    mach_msg_destroy(&rcv_name);
    return v12;
  }
  if (rcv_name.msgh_id == 71)
  {
    uint64_t v12 = 4294966988;
    goto LABEL_22;
  }
  if (rcv_name.msgh_id != 100146)
  {
    uint64_t v12 = 4294966995;
    goto LABEL_22;
  }
  uint64_t v12 = 4294966996;
  if ((rcv_name.msgh_bits & 0x80000000) != 0) {
    goto LABEL_22;
  }
  if (rcv_name.msgh_size != 36) {
    goto LABEL_22;
  }
  if (rcv_name.msgh_remote_port) {
    goto LABEL_22;
  }
  uint64_t v12 = v17;
  if (v17) {
    goto LABEL_22;
  }
  return v12;
}

id SBLogMedusaKeyboard()
{
  if (SBLogMedusaKeyboard_onceToken != -1) {
    dispatch_once(&SBLogMedusaKeyboard_onceToken, &__block_literal_global_156);
  }
  uint64_t v0 = (void *)SBLogMedusaKeyboard___logObj;
  return v0;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

id SBLogDashBoard()
{
  if (SBLogDashBoard_onceToken != -1) {
    dispatch_once(&SBLogDashBoard_onceToken, &__block_literal_global_6);
  }
  uint64_t v0 = (void *)SBLogDashBoard___logObj;
  return v0;
}

id SBLogAppShortcuts()
{
  if (SBLogAppShortcuts_onceToken != -1) {
    dispatch_once(&SBLogAppShortcuts_onceToken, &__block_literal_global_105);
  }
  uint64_t v0 = (void *)SBLogAppShortcuts___logObj;
  return v0;
}

id SBLogIconDragging()
{
  if (SBLogIconDragging_onceToken != -1) {
    dispatch_once(&SBLogIconDragging_onceToken, &__block_literal_global_87);
  }
  uint64_t v0 = (void *)SBLogIconDragging___logObj;
  return v0;
}

id SBLogHearingTestMode()
{
  if (SBLogHearingTestMode_onceToken != -1) {
    dispatch_once(&SBLogHearingTestMode_onceToken, &__block_literal_global_171);
  }
  uint64_t v0 = (void *)SBLogHearingTestMode___logObj;
  return v0;
}

id SBLogInputUI()
{
  if (SBLogInputUI_onceToken != -1) {
    dispatch_once(&SBLogInputUI_onceToken, &__block_literal_global_177);
  }
  uint64_t v0 = (void *)SBLogInputUI___logObj;
  return v0;
}

id SBLogSpotlight()
{
  if (SBLogSpotlight_onceToken != -1) {
    dispatch_once(&SBLogSpotlight_onceToken, &__block_literal_global_168);
  }
  uint64_t v0 = (void *)SBLogSpotlight___logObj;
  return v0;
}

__CFString *SBApplicationStateGetDescription(int a1)
{
  result = @"Unknown";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = @"Terminated";
      break;
    case 2:
      result = @"Background Task Suspended";
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_6;
    case 4:
      result = @"Background Running";
      break;
    case 8:
      result = @"Foreground Running";
      break;
    default:
      if (a1 == 16)
      {
        result = @"Process Server";
      }
      else if (a1 == 32)
      {
        result = @"Foreground Running Obscured";
      }
      else
      {
LABEL_6:
        result = 0;
      }
      break;
  }
  return result;
}

uint64_t __SBLogCommon_block_invoke()
{
  SBLogCommon___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "Common");
  return MEMORY[0x1F41817F8]();
}

uint64_t _SBSSetWantsVolumeButtonEvents(mach_port_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  int v6 = a2;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 200016;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

id SBLogLockScreenBiometricCoordinator()
{
  if (SBLogLockScreenBiometricCoordinator_onceToken != -1) {
    dispatch_once(&SBLogLockScreenBiometricCoordinator_onceToken, &__block_literal_global_195);
  }
  uint64_t v0 = (void *)SBLogLockScreenBiometricCoordinator___logObj;
  return v0;
}

id SBLogDisplayControlling()
{
  if (SBLogDisplayControlling_onceToken != -1) {
    dispatch_once(&SBLogDisplayControlling_onceToken, &__block_literal_global_24);
  }
  uint64_t v0 = (void *)SBLogDisplayControlling___logObj;
  return v0;
}

uint64_t _SBSSetApplicationNetworkFlags(int a1, char a2, char a3)
{
  *(_OWORD *)&msg[20] = 0u;
  uint64_t v9 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x1E4F14068];
  msg[32] = a2;
  *(_WORD *)&msg[33] = 0;
  msg[35] = 0;
  LOBYTE(v9) = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x186B300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x28u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0) {
    goto LABEL_14;
  }
  if (v5)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v6 - 268435459) > 1) {
      return v6;
    }
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
LABEL_19:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v6;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    uint64_t v6 = 4294966988;
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[20] != 100119)
  {
    uint64_t v6 = 4294966995;
    goto LABEL_19;
  }
  uint64_t v6 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0) {
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[4] != 36) {
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[8]) {
    goto LABEL_19;
  }
  uint64_t v6 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32]) {
    goto LABEL_19;
  }
  return v6;
}

void sub_18FBD02B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _SBFScreenTimeRegisterForExternalChangeNotification()
{
  if (_SBFScreenTimeRegisterForExternalChangeNotification___once != -1) {
    dispatch_once(&_SBFScreenTimeRegisterForExternalChangeNotification___once, &__block_literal_global_1);
  }
}

void sub_18FBD0E2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SBSCopyDisplayIdentifierForProcessID(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  memset(v5, 0, 512);
  uint64_t v2 = SBSSpringBoardBackgroundServerPort();
  int v3 = SBDisplayIdentifierForPID(v2, a1, v5);
  uint64_t result = 0;
  if (!v3)
  {
    if (LOBYTE(v5[0])) {
      return [[NSString alloc] initWithUTF8String:v5];
    }
  }
  return result;
}

CFPropertyListRef SBSCopyDisplayIdentifiersForProcessID(uint64_t a1)
{
  uint64_t v9 = 0;
  unsigned int v8 = 0;
  uint64_t v2 = SBSSpringBoardBackgroundServerPort();
  int v3 = SBDisplayIdentifiersForPID(v2, a1, &v9, &v8);
  CFPropertyListRef v4 = 0;
  if (!v3)
  {
    if (v9)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      CFDataRef v6 = (const __CFData *)[v5 initWithBytesNoCopy:v9 length:v8 freeWhenDone:0];
      CFPropertyListRef v4 = CFPropertyListCreateWithData(0, v6, 0, 0, 0);
      MEMORY[0x192FC0FE0](*MEMORY[0x1E4F14960], v9, v8);

      if (v4)
      {
        if (!CFArrayGetCount((CFArrayRef)v4))
        {
          CFRelease(v4);
          return 0;
        }
      }
    }
  }
  return v4;
}

BOOL SBSSuspendFrontmostApplication()
{
  uint64_t v0 = SBSSpringBoardServerPort();
  return SBSuspendFrontmostApp(v0) == 0;
}

BOOL SBSInterruptKeybagRefetch()
{
  uint64_t v0 = SBSSpringBoardServerPort();
  return SBInterruptKeybagRefetch(v0) == 0;
}

CFPropertyListRef SBSCopyApplicationDisplayIdentifiers(uint64_t a1, uint64_t a2)
{
  memset(length, 0, sizeof(length));
  uint64_t v4 = SBSSpringBoardBackgroundServerPort();
  int v5 = SBApplicationDisplayIdentifiers(v4, a1, a2, &length[1], length);
  CFPropertyListRef v6 = 0;
  if (!v5 && *(void *)&length[1])
  {
    CFDataRef v7 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)&length[1], length[0], (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    CFPropertyListRef v6 = CFPropertyListCreateWithData(0, v7, 0, 0, 0);
    CFRelease(v7);
    MEMORY[0x192FC0FE0](*MEMORY[0x1E4F14960], *(void *)&length[1], length[0]);
  }
  return v6;
}

CFStringRef SBSCopyFrontmostApplicationDisplayIdentifier()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  memset(v3, 0, 512);
  uint64_t v0 = SBSSpringBoardBackgroundServerPort();
  int v1 = SBFrontmostApplicationDisplayIdentifier(v0, v3);
  CFStringRef result = 0;
  if (!v1)
  {
    if (LOBYTE(v3[0])) {
      return CFStringCreateWithCString(0, (const char *)v3, 0x8000100u);
    }
  }
  return result;
}

CFStringRef SBSCopyBundlePathForDisplayIdentifier(const __CFString *a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  long long v29 = 0u;
  long long v28 = 0u;
  long long v27 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  long long v12 = 0u;
  long long v11 = 0u;
  long long v10 = 0u;
  long long v9 = 0u;
  long long v8 = 0u;
  long long v7 = 0u;
  long long v6 = 0u;
  long long v5 = 0u;
  *(_OWORD *)buffer = 0u;
  memset(v3, 0, 512);
  if (CFStringGetCString(a1, buffer, 1024, 0x8000100u)
    && (uint64_t v1 = SBSSpringBoardBackgroundServerPort(), !SBBundlePathForDisplayIdentifier(v1, buffer, v3)))
  {
    return CFStringCreateWithCString(0, (const char *)v3, 0x8000100u);
  }
  else
  {
    return 0;
  }
}

const UInt8 *SBSCopyIconImagePNGDataForDisplayIdentifier(const __CFString *a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v7 = 0;
  unsigned int v6 = 0;
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
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  *(_OWORD *)buffer = 0u;
  if (!CFStringGetCString(a1, buffer, 1024, 0x8000100u)) {
    return 0;
  }
  uint64_t v1 = SBSSpringBoardBackgroundServerPort();
  SBGetIconPNGData(v1, buffer, 0, &v7, &v6);
  uint64_t v2 = v7;
  if (v7)
  {
    CFIndex v3 = v6;
    context.version = 0;
    memset(&context.retain, 0, 40);
    context.info = (void *)v6;
    context.deallocate = (CFAllocatorDeallocateCallBack)vmDeallocateCallback;
    context.preferredSize = 0;
    CFAllocatorRef v4 = CFAllocatorCreate(0, &context);
    uint64_t v2 = (const UInt8 *)CFDataCreateWithBytesNoCopy(0, v2, v3, v4);
    CFRelease(v4);
  }
  return v2;
}

CFURLRef SBSCopyExecutablePathForDisplayIdentifier(const __CFString *a1)
{
  CFStringRef v1 = SBSCopyBundlePathForDisplayIdentifier(a1);
  if (v1)
  {
    uint64_t v2 = (__CFBundle *)v1;
    CFURLRef v3 = CFURLCreateWithFileSystemPath(0, v1, kCFURLPOSIXPathStyle, 1u);
    if (!v3)
    {
      CFBundleRef v4 = v2;
LABEL_12:
      CFRelease(v4);
      return v3;
    }
    CFBundleRef v4 = CFBundleCreate(0, v3);
    CFRelease(v3);
    CFRelease(v2);
    if (v4)
    {
      CFURLRef v5 = CFBundleCopyExecutableURL(v4);
      if (v5)
      {
        CFURLRef v6 = v5;
        CFURLRef v7 = CFURLCopyAbsoluteURL(v5);
        if (v7)
        {
          CFURLRef v8 = v7;
          CFURLRef v3 = (const __CFURL *)CFURLCopyFileSystemPath(v7, kCFURLPOSIXPathStyle);
          CFRelease(v8);
        }
        else
        {
          CFURLRef v3 = 0;
        }
        CFRelease(v6);
      }
      else
      {
        CFURLRef v3 = 0;
      }
      goto LABEL_12;
    }
  }
  return 0;
}

uint64_t SBSCopyIconImagePathForDisplayIdentifier()
{
  return 0;
}

CFStringRef SBSCopyLocalizedApplicationNameForDisplayIdentifier(const __CFString *a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  long long v29 = 0u;
  long long v28 = 0u;
  long long v27 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  long long v12 = 0u;
  long long v11 = 0u;
  long long v10 = 0u;
  long long v9 = 0u;
  long long v8 = 0u;
  long long v7 = 0u;
  long long v6 = 0u;
  long long v5 = 0u;
  *(_OWORD *)buffer = 0u;
  memset(v3, 0, 512);
  if (CFStringGetCString(a1, buffer, 1024, 0x8000100u)
    && (uint64_t v1 = SBSSpringBoardBackgroundServerPort(),
        !SBLocalizedApplicationNameForDisplayIdentifier(v1, buffer, v3)))
  {
    return CFStringCreateWithCString(0, (const char *)v3, 0x8000100u);
  }
  else
  {
    return 0;
  }
}

__CFString *SBSApplicationLaunchingErrorString(int a1)
{
  if ((a1 - 1) > 0xB) {
    return @"unknown error";
  }
  else {
    return off_1E566B380[a1 - 1];
  }
}

uint64_t __SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary_block_invoke()
{
  SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary___oldToNewKeys = [MEMORY[0x1E4F1C9E8] dictionaryWithObjectsAndKeys:*MEMORY[0x1E4F625F8], @"launchSuspended", *MEMORY[0x1E4F625E8], @"launchInClassic", *MEMORY[0x1E4F626A0], @"unlockDevice", *MEMORY[0x1E4F626A0], @"unlockDevice", *MEMORY[0x1E4F62688], @"promptUnlock", 0];
  return MEMORY[0x1F41817F8]();
}

uint64_t SBSApplicationCanBeLaunched(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F62AF8]);
  unint64_t v5 = 1;
  [v2 canOpenApplication:a1 reason:&v5];
  if (v5 > 8) {
    uint64_t v3 = 12;
  }
  else {
    uint64_t v3 = dword_18FC48BB8[v5];
  }

  return v3;
}

uint64_t SBSLaunchApplicationWithIdentifier(uint64_t a1, int a2)
{
  return SBSLaunchApplicationWithIdentifierAndURLAndLaunchOptions(a1, 0, 0, 0, a2);
}

uint64_t SBSLaunchApplicationWithIdentifierAndURLAndLaunchOptions(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5)
{
  if (!a1) {
    return 2;
  }
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x2020000000;
  int v36 = 0;
  long long v10 = (void *)MEMORY[0x192FC0BD0]();
  id v11 = objc_alloc_init(MEMORY[0x1E4F62AF8]);
  uint64_t v12 = [v11 createClientPort];

  long long v13 = [MEMORY[0x1E4F1CA60] dictionary];
  id v31 = v13;
  id v32 = 0;
  _splitOptionsIntoApplicationOptionsAndRealOptions(a4, &v32, &v31);
  id v14 = v32;
  id v15 = v31;

  SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary(v15);
  [v15 bs_setSafeObject:a2 forKey:*MEMORY[0x1E4F62678]];
  [v15 bs_setSafeObject:a3 forKey:*MEMORY[0x1E4F62660]];
  long long v16 = [MEMORY[0x1E4F28ED0] numberWithBool:a5 != 0];
  [v15 bs_setSafeObject:v16 forKey:*MEMORY[0x1E4F625F8]];

  [v15 bs_setSafeObject:v14 forKey:*MEMORY[0x1E4F62670]];
  dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  id v18 = objc_alloc_init(MEMORY[0x1E4F62AF8]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __SBSLaunchApplicationWithIdentifierAndURLAndLaunchOptions_block_invoke;
  v23[3] = &unk_1E566B338;
  long long v25 = &v33;
  long long v26 = &v27;
  long long v19 = v17;
  long long v24 = v19;
  [v18 openApplication:a1 options:v15 clientPort:v12 withResult:v23];
  dispatch_time_t v20 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v19, v20);
  if (!*((unsigned char *)v28 + 24)) {
    *((_DWORD *)v34 + 6) = 11;
  }

  _Block_object_dispose(&v27, 8);
  uint64_t v21 = *((unsigned int *)v34 + 6);
  _Block_object_dispose(&v33, 8);
  return v21;
}

void sub_18FBD1D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBSLaunchApplicationWithIdentifierAndURL(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return SBSLaunchApplicationWithIdentifierAndURLAndLaunchOptions(a1, a2, a3, 0, a4);
}

uint64_t SBSLaunchApplicationWithIdentifierAndLaunchOptions(uint64_t a1, void *a2, int a3)
{
  return SBSLaunchApplicationWithIdentifierAndURLAndLaunchOptions(a1, 0, 0, a2, a3);
}

uint64_t SBSCreateClientEntitlementEnforcementPort()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F62AF8]);
  uint64_t v1 = [v0 createClientPort];

  return v1;
}

void _splitOptionsIntoApplicationOptionsAndRealOptions(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  if (_splitOptionsIntoApplicationOptionsAndRealOptions_onceToken != -1) {
    dispatch_once(&_splitOptionsIntoApplicationOptionsAndRealOptions_onceToken, &__block_literal_global_85);
  }
  if (v5) {
    [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v5];
  }
  else {
  long long v6 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  long long v7 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v5)
  {
    id v15 = a3;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = (id)_splitOptionsIntoApplicationOptionsAndRealOptions___realOptionsThatArentApplicationOptions;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          id v14 = [v5 objectForKey:v13];
          if (v14) {
            [v7 setObject:v14 forKey:v13];
          }
          [v6 removeObjectForKey:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    a3 = v15;
  }
  if (a2)
  {
    if (!v6) {
      _splitOptionsIntoApplicationOptionsAndRealOptions_cold_2();
    }
    *a2 = v6;
  }
  if (a3)
  {
    if (!v7) {
      _splitOptionsIntoApplicationOptionsAndRealOptions_cold_1();
    }
    *a3 = v7;
  }
}

intptr_t __SBSLaunchApplicationWithIdentifierAndURLAndLaunchOptions_block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    unint64_t v3 = [a2 code];
    if (v3 > 8) {
      unsigned int v4 = 12;
    }
    else {
      unsigned int v4 = dword_18FC48BB8[v3];
    }
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = v4;
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  id v5 = a1[4];
  return dispatch_semaphore_signal(v5);
}

void SBSCleanupClientEntitlementEnforcementPort(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F62AF8]);
  [v2 cleanupClientPort:a1];
}

uint64_t SBSLaunchApplicationForDebugging(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, __int16 a7)
{
  return SBSLaunchApplicationForDebuggingWithOptions(a1, a2, a3, a4, 0, 0, a5, a6, a7);
}

uint64_t SBSLaunchApplicationForDebuggingWithOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, __int16 a9)
{
  if (!(a1 | a2)) {
    return 2;
  }
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  int v47 = 0;
  CFAllocatorContext context = (void *)MEMORY[0x192FC0BD0]();
  id v17 = objc_alloc_init(MEMORY[0x1E4F62AF8]);
  unsigned int v38 = [v17 createClientPort];

  long long v18 = [MEMORY[0x1E4F1CA60] dictionary];
  [v18 bs_setSafeObject:a3 forKey:*MEMORY[0x1E4F62558]];
  [v18 bs_setSafeObject:a4 forKey:*MEMORY[0x1E4F62578]];
  [v18 bs_setSafeObject:a7 forKey:*MEMORY[0x1E4F62598]];
  [v18 bs_setSafeObject:a8 forKey:*MEMORY[0x1E4F62590]];
  if ((a9 & 2) != 0)
  {
    long long v19 = [MEMORY[0x1E4F28ED0] numberWithBool:1 context:context];
    [v18 bs_setSafeObject:v19 forKey:*MEMORY[0x1E4F625A0]];
  }
  if ((a9 & 0x10) != 0)
  {
    dispatch_time_t v20 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v18 bs_setSafeObject:v20 forKey:*MEMORY[0x1E4F62570]];
  }
  if ((a9 & 0x400) != 0)
  {
    uint64_t v21 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v18 bs_setSafeObject:v21 forKey:*MEMORY[0x1E4F62568]];
  }
  if ((a9 & 0x800) != 0)
  {
    long long v22 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v18 bs_setSafeObject:v22 forKey:*MEMORY[0x1E4F62560]];
  }
  long long v23 = [MEMORY[0x1E4F1CA60] dictionary:context];
  id v42 = v23;
  id v43 = 0;
  _splitOptionsIntoApplicationOptionsAndRealOptions(a6, &v43, &v42);
  id v24 = v43;
  id v25 = v42;

  SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary(v25);
  [v25 bs_setSafeObject:a2 forKey:*MEMORY[0x1E4F62678]];
  [v25 bs_setSafeObject:v18 forKey:*MEMORY[0x1E4F62618]];
  [v25 bs_setSafeObject:a5 forKey:*MEMORY[0x1E4F62660]];
  [v25 bs_setSafeObject:v24 forKey:*MEMORY[0x1E4F62670]];
  if (a9)
  {
    long long v26 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v25 bs_setSafeObject:v26 forKey:*MEMORY[0x1E4F625F8]];
  }
  if ((a9 & 0x2000) != 0)
  {
    uint64_t v27 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v25 bs_setSafeObject:v27 forKey:*MEMORY[0x1E4F625E8]];
  }
  if ((a9 & 4) != 0)
  {
    long long v28 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v25 bs_setSafeObject:v28 forKey:*MEMORY[0x1E4F626A0]];
  }
  if ((a9 & 8) != 0)
  {
    uint64_t v29 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v25 bs_setSafeObject:v29 forKey:@"revealIcon"];
  }
  if ((a9 & 0x1000) != 0)
  {
    char v30 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v25 bs_setSafeObject:v30 forKey:*MEMORY[0x1E4F62688]];
  }
  dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
  id v32 = objc_alloc_init(MEMORY[0x1E4F62AF8]);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __SBSLaunchApplicationForDebuggingWithOptions_block_invoke;
  v39[3] = &unk_1E566B360;
  uint64_t v41 = &v44;
  uint64_t v33 = v31;
  long long v40 = v33;
  [v32 openApplication:a1 options:v25 clientPort:v38 withResult:v39];
  dispatch_semaphore_wait(v33, 0xFFFFFFFFFFFFFFFFLL);

  uint64_t v34 = *((unsigned int *)v45 + 6);
  _Block_object_dispose(&v44, 8);
  return v34;
}

void sub_18FBD2520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t __SBSLaunchApplicationForDebuggingWithOptions_block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    unint64_t v3 = [a2 code];
    if (v3 > 8) {
      unsigned int v4 = 12;
    }
    else {
      unsigned int v4 = dword_18FC48BB8[v3];
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  }
  id v5 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v5);
}

uint64_t SBSOpenSensitiveURL(uint64_t a1)
{
  return SBSOpenSensitiveURLAndUnlock(a1, 0);
}

uint64_t SBSOpenSensitiveURLAndUnlock(uint64_t a1, int a2)
{
  if (__loadLSIfNecessary_onceToken != -1) {
    dispatch_once(&__loadLSIfNecessary_onceToken, &__block_literal_global_94);
  }
  if (!__loadLSIfNecessary_mobileCoreServices) {
    return 0;
  }
  if (a2)
  {
    unsigned int v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    long long v6 = [v4 dictionaryWithObject:v5 forKey:*MEMORY[0x1E4F626A0]];
  }
  else
  {
    long long v6 = 0;
  }
  id v8 = [NSClassFromString(&cfstr_Lsapplicationw.isa) defaultWorkspace];
  uint64_t v7 = [v8 openSensitiveURL:a1 withOptions:v6];

  return v7;
}

uint64_t SBSOpenDataActivationURL(uint64_t a1)
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x192FC0BD0]();
  uint64_t v20 = 0;
  v21[0] = &v20;
  v21[1] = 0x2020000000;
  int v22 = 0;
  id v3 = objc_alloc_init(MEMORY[0x1E4F62AF8]);
  uint64_t v4 = *MEMORY[0x1E4F625F8];
  v23[0] = *MEMORY[0x1E4F62628];
  v23[1] = v4;
  v24[0] = MEMORY[0x1E4F1CC38];
  v24[1] = MEMORY[0x1E4F1CC38];
  v23[2] = *MEMORY[0x1E4F62678];
  v24[2] = a1;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __SBSOpenDataActivationURL_block_invoke;
  v12[3] = &unk_1E566B338;
  id v14 = &v20;
  id v15 = &v16;
  uint64_t v7 = v6;
  uint64_t v13 = v7;
  [v3 openApplication:@"com.apple.DataActivation" options:v5 withResult:v12];
  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v7, v8);
  if (*((unsigned char *)v17 + 24))
  {
    if (!*(_DWORD *)(v21[0] + 24))
    {
      uint64_t v9 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    *(_DWORD *)(v21[0] + 24) = 11;
  }
  uint64_t v10 = SBLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    SBSOpenDataActivationURL_cold_1((uint64_t)v21, v10);
  }

  uint64_t v9 = 0;
LABEL_8:

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v9;
}

void sub_18FBD28DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

intptr_t __SBSOpenDataActivationURL_block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    unint64_t v3 = [a2 code];
    if (v3 > 8) {
      unsigned int v4 = 12;
    }
    else {
      unsigned int v4 = dword_18FC48BB8[v3];
    }
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = v4;
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  id v5 = a1[4];
  return dispatch_semaphore_signal(v5);
}

uint64_t ___splitOptionsIntoApplicationOptionsAndRealOptions_block_invoke()
{
  _splitOptionsIntoApplicationOptionsAndRealOptions___realOptionsThatArentApplicationOptions = [MEMORY[0x1E4F1CAD0] setWithObjects:@"launchSuspended", @"launchInClassic", @"unlockDevice", @"unlockDevice", @"promptUnlock", @"revealIcon", @"LSOpenSensitiveURLOption", nil];
  return MEMORY[0x1F41817F8]();
}

void *____loadLSIfNecessary_block_invoke()
{
  CFStringRef result = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 1);
  __loadLSIfNecessary_mobileCoreServices = (uint64_t)result;
  return result;
}

void vmDeallocateCallback()
{
}

void sub_18FBD2CEC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18FBD2E64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18FBD3AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

__CFString *NSStringFromSBSSmartCoverState(unint64_t a1)
{
  if (a1 >= 4)
  {
    [NSString stringWithFormat:@"<0x%X>", a1];
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E566B548[a1];
  }
  return v1;
}

void sub_18FBD5B78(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

uint64_t SBSSpringBoardBlockableServerPort()
{
  return SBSServerPortHelper("com.apple.springboard.blockableservices", &springboardBlockableServerPort);
}

uint64_t SBSSpringBoardBackgroundServerPort()
{
  return SBSServerPortHelper("com.apple.springboard.backgroundappservices", springboardServerPort2);
}

void sub_18FBD65E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18FBD71FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18FBD72D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18FBD7594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18FBD766C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18FBD792C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18FBD7A04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id NSStringFromSBSLibraryPodPresentationErrorCode(unint64_t a1)
{
  if (a1 >= 0xA)
  {
    uint64_t v1 = [NSString stringWithFormat:@"(unknown - %ld)", a1];
  }
  else
  {
    uint64_t v1 = (void *)*((void *)&off_1E566B630 + a1);
  }
  return v1;
}

uint64_t SBSWatchdogAssertionGetTypeID()
{
  return __SBSWatchdogTypeID;
}

uint64_t SBSWatchdogAssertionRegisterClass()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __SBSWatchdogTypeID = result;
  return result;
}

uint64_t SBSWatchdogAssertionCreateForPID(double a1)
{
  pthread_once(&__SBSWatchdogAssertionRegisterOnce, (void (*)(void))SBSWatchdogAssertionRegisterClass);
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v3 = BKSWatchdogAssertionCreateForPID();
  *(void *)(Instance + 16) = 850045863;
  *(_OWORD *)(Instance + 24) = 0u;
  *(_OWORD *)(Instance + 40) = 0u;
  *(_OWORD *)(Instance + 56) = 0u;
  *(void *)(Instance + 72) = 0;
  *(void *)(Instance + 80) = v3;
  *(double *)(Instance + 88) = a1;
  if (!v3)
  {
    CFRelease((CFTypeRef)Instance);
    return 0;
  }
  return Instance;
}

uint64_t SBSWatchdogAssertionCancel(uint64_t a1)
{
  uint64_t v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  uint64_t v3 = *(const void **)(a1 + 80);
  if (v3) {
    CFRelease(v3);
  }
  *(void *)(a1 + 80) = 0;
  return pthread_mutex_unlock(v2);
}

double SBSWatchdogAssertionGetRenewalInterval(uint64_t a1)
{
  uint64_t v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(double *)(a1 + 88) <= 0.0) {
    double v3 = 60.0;
  }
  else {
    double v3 = *(double *)(a1 + 88);
  }
  pthread_mutex_unlock(v2);
  return v3;
}

BOOL SBSWatchdogAssertionRenew(uint64_t a1)
{
  uint64_t v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  BOOL v3 = *(void *)(a1 + 80) != 0;
  pthread_mutex_unlock(v2);
  return v3;
}

void SBSWatchdogAssertionDestroy(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  uint64_t v2 = *(const void **)(a1 + 80);
  if (v2) {
    CFRelease(v2);
  }
  *(void *)(a1 + 80) = 0;
}

BOOL SBSWatchdogAssertionEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef SBSWatchdogAssertionDescribe(void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, @"<SBSWatchdogAssertion %p> %p", a1, a1[10]);
}

id SBExternalDisplayLayoutServiceInstanceIdentifierForDisplay(void *a1)
{
  id v1 = a1;
  if (([v1 isExternal] & 1) == 0)
  {
    dispatch_semaphore_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"NSString * _Nonnull SBExternalDisplayLayoutServiceInstanceIdentifierForDisplay(FBSDisplayIdentity *__strong _Nonnull)"];
    [v6 handleFailureInFunction:v7, @"SBSExternalDisplayLayout.m", 19, @"Invalid parameter not satisfying: %@", @"[displayIdentity isExternal]" file lineNumber description];
  }
  CFAllocatorRef v2 = NSString;
  BOOL v3 = [v1 rootIdentity];
  unsigned int v4 = [v2 stringWithFormat:@"com.apple.springboard.external:%@", v3];

  return v4;
}

id SBSCreateExternalDisplayLayoutServiceEndpoint()
{
  id v0 = (void *)MEMORY[0x1E4F50BB8];
  id v1 = [MEMORY[0x1E4F62940] serviceIdentifier];
  CFAllocatorRef v2 = [v0 endpointForMachName:@"com.apple.frontboard.systemappservices" service:v1 instance:@"com.apple.springboard.external"];

  return v2;
}

id SBSCreateLayoutServiceEndpointForExternalDisplay(void *a1)
{
  id v1 = a1;
  if (([v1 isExternal] & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    dispatch_time_t v8 = [NSString stringWithUTF8String:"BSServiceConnectionEndpoint * _Nullable SBSCreateLayoutServiceEndpointForExternalDisplay(FBSDisplayIdentity *__strong _Nonnull)"];
    [v7 handleFailureInFunction:v8, @"SBSExternalDisplayLayout.m", 29, @"Invalid parameter not satisfying: %@", @"[identity isExternal]" file lineNumber description];
  }
  CFAllocatorRef v2 = (void *)MEMORY[0x1E4F50BB8];
  BOOL v3 = [MEMORY[0x1E4F62940] serviceIdentifier];
  unsigned int v4 = SBExternalDisplayLayoutServiceInstanceIdentifierForDisplay(v1);

  id v5 = [v2 endpointForMachName:@"com.apple.frontboard.systemappservices" service:v3 instance:v4];

  return v5;
}

uint64_t SBSApplicationShortcutSystemIconTypeForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeCompose"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypePlay"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypePause"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeAdd"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeLocation"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeSearch"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeShare"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeProhibit"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeContact"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeHome"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeMarkLocation"])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeFavorite"])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeLove"])
  {
    uint64_t v2 = 12;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeCloud"])
  {
    uint64_t v2 = 13;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeInvitation"])
  {
    uint64_t v2 = 14;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeConfirmation"])
  {
    uint64_t v2 = 15;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeMail"])
  {
    uint64_t v2 = 16;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeMessage"])
  {
    uint64_t v2 = 17;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeDate"])
  {
    uint64_t v2 = 18;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeTime"])
  {
    uint64_t v2 = 19;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeCapturePhoto"])
  {
    uint64_t v2 = 20;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeCaptureVideo"])
  {
    uint64_t v2 = 21;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeTask"])
  {
    uint64_t v2 = 22;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeTaskCompleted"])
  {
    uint64_t v2 = 23;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeAlarm"])
  {
    uint64_t v2 = 24;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeBookmark"])
  {
    uint64_t v2 = 25;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeShuffle"])
  {
    uint64_t v2 = 26;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeAudio"])
  {
    uint64_t v2 = 27;
  }
  else if ([v1 isEqualToString:@"UIApplicationShortcutIconTypeUpdate"])
  {
    uint64_t v2 = 28;
  }
  else
  {
    uint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v2;
}

uint64_t SBSApplicationShortcutItemActivationModeForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"foreground"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"background"])
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v2;
}

CFPropertyListRef SBSCopyDisplayIdentifiersForExternalAccessoryProtocol(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x192FC0BD0]();
  memset(length, 0, sizeof(length));
  uint64_t v3 = SBSSpringBoardBackgroundServerPort();
  SBGetDisplayIdentifiersForExternalAccessoryProtocols(v3, [a1 UTF8String], &length[1], length);
  if (length[0]
    && (CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80],
        (CFDataRef v5 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(const UInt8 **)&length[1], length[0], (CFAllocatorRef)*MEMORY[0x1E4F1CFA0])) != 0))
  {
    CFDataRef v6 = v5;
    CFPropertyListRef v7 = CFPropertyListCreateWithData(v4, v5, 0, 0, 0);
    CFRelease(v6);
  }
  else
  {
    CFPropertyListRef v7 = 0;
  }
  if (*(void *)&length[1]) {
    MEMORY[0x192FC0FE0](*MEMORY[0x1E4F14960], *(void *)&length[1], length[0]);
  }
  return v7;
}

uint64_t SBSCopyNowPlayingAppBundleIdentifier()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  memset(v2, 0, 512);
  uint64_t v0 = SBSSpringBoardServerPort();
  if (SBGetNowPlayingAppBundleIdentifier(v0, v2)) {
    return 0;
  }
  else {
    return [[NSString alloc] initWithUTF8String:v2];
  }
}

uint64_t SBSTopButtonFramesForPosters@<X0>(void *a1@<X8>)
{
  long long v2 = *MEMORY[0x1E4F1DB28];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  *(_OWORD *)a1 = *MEMORY[0x1E4F1DB28];
  *((_OWORD *)a1 + 1) = v3;
  *((_OWORD *)a1 + 2) = v2;
  *((_OWORD *)a1 + 3) = v3;
  int v4 = SBSSpringBoardServerPort();
  return SBGetTopButtonFrames(v4, a1, a1 + 1, a1 + 2, a1 + 3, a1 + 4, a1 + 5, a1 + 6, a1 + 7);
}

uint64_t SBSIsSystemApplication(unsigned char *a1)
{
  __int16 v4 = 0;
  uint64_t v2 = SBSSpringBoardBackgroundServerPort();
  SBIsSystemApplication(v2, (char *)&v4 + 1, &v4);
  if (a1) {
    *a1 = v4;
  }
  return HIBYTE(v4);
}

uint64_t SBSSetInterceptsMenuButton(uint64_t a1)
{
  uint64_t v2 = SBSSpringBoardServerPort();
  return SBSetInterceptsMenuButton(v2, a1, 0);
}

uint64_t SBSSetInterceptsMenuButtonForever(uint64_t a1)
{
  uint64_t v2 = SBSSpringBoardServerPort();
  return SBSetInterceptsMenuButton(v2, a1, 1);
}

void SBSSetVoiceRecognitionAudioInputPaths(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9B8] data];
  if (a1)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a1 format:200 options:0 error:0];

    uint64_t v2 = (void *)v3;
  }
  uint64_t v4 = SBSSpringBoardServerPort();
  id v5 = v2;
  SBSetVoiceRecognitionAudioInputPaths(v4, [v5 bytes], [v5 length]);
}

void SBSSetAssistantRecognitionStrings(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9B8] data];
  if (a1)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a1 format:200 options:0 error:0];

    uint64_t v2 = (void *)v3;
  }
  uint64_t v4 = SBSSpringBoardServerPort();
  id v5 = v2;
  SBSetAssistantRecognitionStrings(v4, [v5 bytes], [v5 length]);
}

uint64_t SBSUndimScreen()
{
  uint64_t v0 = SBSSpringBoardServerPort();
  return SBDimScreen(v0, 0);
}

uint64_t SBSLockDevice(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = SBSSpringBoardServerPort();
  return SBLockDeviceAndFeatures(v4, a1, a2);
}

void SBSRequestPasscodeUnlockUI(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_alloc_init(SBSLockScreenService);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __SBSRequestPasscodeUnlockUI_block_invoke;
  v5[3] = &unk_1E566B9F0;
  CFDataRef v6 = v2;
  id v7 = v1;
  uint64_t v3 = v2;
  id v4 = v1;
  [(SBSLockScreenService *)v3 requestPasscodeUnlockUIWithOptions:0 withCompletion:v5];
}

void __SBSRequestPasscodeUnlockUI_block_invoke(uint64_t a1, char a2)
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  CFDataRef v6 = __SBSRequestPasscodeUnlockUI_block_invoke_2;
  id v7 = &unk_1E566B9C8;
  id v8 = *(id *)(a1 + 40);
  char v9 = a2;
  dispatch_async(MEMORY[0x1E4F14428], &v4);
  [*(id *)(a1 + 32) invalidate:v4, v5, v6, v7];
}

uint64_t __SBSRequestPasscodeUnlockUI_block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

void SBSRequestPasscodeUnlockAlertUI(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_alloc_init(SBSLockScreenService);
  uint64_t v3 = objc_alloc_init(SBSUnlockOptions);
  [(SBSUnlockOptions *)v3 _setAboveOtherContexts:1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __SBSRequestPasscodeUnlockAlertUI_block_invoke;
  v6[3] = &unk_1E566B9F0;
  id v7 = v2;
  id v8 = v1;
  uint64_t v4 = v2;
  id v5 = v1;
  [(SBSLockScreenService *)v4 requestPasscodeUnlockUIWithOptions:v3 withCompletion:v6];
}

void __SBSRequestPasscodeUnlockAlertUI_block_invoke(uint64_t a1, char a2)
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  CFDataRef v6 = __SBSRequestPasscodeUnlockAlertUI_block_invoke_2;
  id v7 = &unk_1E566B9C8;
  id v8 = *(id *)(a1 + 40);
  char v9 = a2;
  dispatch_async(MEMORY[0x1E4F14428], &v4);
  [*(id *)(a1 + 32) invalidate:v4, v5, v6, v7];
}

uint64_t __SBSRequestPasscodeUnlockAlertUI_block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

void SBSRequestPasscodeCheckUI(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  id v8 = objc_alloc_init(SBSLockScreenService);
  char v9 = objc_alloc_init(SBSUnlockOptions);
  [(SBSUnlockOptions *)v9 _setTitle:v7];

  [(SBSUnlockOptions *)v9 _setSubtitle:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __SBSRequestPasscodeCheckUI_block_invoke;
  v12[3] = &unk_1E566B9F0;
  uint64_t v13 = v8;
  id v14 = v5;
  uint64_t v10 = v8;
  id v11 = v5;
  [(SBSLockScreenService *)v10 requestPasscodeCheckUIWithOptions:v9 withCompletion:v12];
}

void __SBSRequestPasscodeCheckUI_block_invoke(uint64_t a1, char a2)
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __SBSRequestPasscodeCheckUI_block_invoke_2;
  id v7 = &unk_1E566B9C8;
  id v8 = *(id *)(a1 + 40);
  char v9 = a2;
  dispatch_async(MEMORY[0x1E4F14428], &v4);
  [*(id *)(a1 + 32) invalidate:v4, v5, v6, v7];
}

uint64_t __SBSRequestPasscodeCheckUI_block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

void SBSResetHomeScreenLayout(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_alloc_init(SBSHomeScreenService);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __SBSResetHomeScreenLayout_block_invoke;
  v4[3] = &unk_1E566BA18;
  id v5 = v1;
  id v3 = v1;
  [(SBSHomeScreenService *)v2 resetHomeScreenLayoutWithCompletion:v4];
}

void __SBSResetHomeScreenLayout_block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __SBSResetHomeScreenLayout_block_invoke_2;
  v3[3] = &unk_1E566B9C8;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __SBSResetHomeScreenLayout_block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

void SBSRequestSuggestedApplication(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  char v5 = objc_alloc_init(SBSHomeScreenService);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _OWORD v7[2] = __SBSRequestSuggestedApplication_block_invoke;
  v7[3] = &unk_1E566BA40;
  id v8 = v3;
  id v6 = v3;
  [(SBSHomeScreenService *)v5 requestSuggestedApplicationWithBundleIdentifier:v4 completion:v7];
}

void __SBSRequestSuggestedApplication_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __SBSRequestSuggestedApplication_block_invoke_2;
  v6[3] = &unk_1E566B4B0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __SBSRequestSuggestedApplication_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    return (*(uint64_t (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 32));
  }
  else {
    return [*(id *)(a1 + 32) invalidate];
  }
}

void SBSRequestAppSwitcherAppearanceForHiddenApplication(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = objc_alloc_init(SBSAppSwitcherSystemService);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _OWORD v8[2] = __SBSRequestAppSwitcherAppearanceForHiddenApplication_block_invoke;
  v8[3] = &unk_1E566BA68;
  char v9 = v5;
  id v10 = v3;
  id v6 = v5;
  id v7 = v3;
  [(SBSAppSwitcherSystemService *)v6 requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier:v4 completion:v8];
}

void __SBSRequestAppSwitcherAppearanceForHiddenApplication_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __SBSRequestAppSwitcherAppearanceForHiddenApplication_block_invoke_2;
  char v9 = &unk_1E566B4B0;
  id v4 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], &v6);
  [*(id *)(a1 + 32) invalidate:v6, v7, v8, v9];
}

uint64_t __SBSRequestAppSwitcherAppearanceForHiddenApplication_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    return (*(uint64_t (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 32));
  }
  else {
    return [*(id *)(a1 + 32) invalidate];
  }
}

uint64_t SBSShutDown()
{
  uint64_t v0 = SBSSpringBoardServerPort();
  return SBShutDown(v0);
}

BOOL SBSActivateAssistant(uint64_t a1)
{
  return SBSActivateAssistantWithContext(a1, 0);
}

BOOL SBSActivateAssistantWithContext(uint64_t a1, uint64_t a2)
{
  id v4 = [MEMORY[0x1E4F1C9B8] data];
  if (a2)
  {
    uint64_t v5 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a2 format:200 options:0 error:0];

    id v4 = (void *)v5;
  }
  uint64_t v6 = SBSSpringBoardServerPort();
  id v7 = v4;
  BOOL v8 = SBActivateAssistantWithContext(v6, a1, [v7 bytes], [v7 length]) == 0;

  return v8;
}

uint64_t SBSSetTypingActive(uint64_t a1)
{
  uint64_t v2 = SBSSpringBoardBackgroundServerPort();
  return SBSetTypingActive(v2, a1);
}

uint64_t SBSTagTouchForTypingMenu(uint64_t a1)
{
  uint64_t v2 = SBSSpringBoardBackgroundServerPort();
  return SBTagTouchForTypingMenu(v2, a1);
}

void SBSAcquireFocusPreventingFullScreenPresentationAssertion(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  id v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F768]);
  if ([v5 isUsable])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __SBSAcquireFocusPreventingFullScreenPresentationAssertion_block_invoke;
    v6[3] = &unk_1E566BA90;
    id v7 = v3;
    char v9 = &v10;
    id v8 = v5;
    [v8 accessPort:v6];
  }
  v4[2](v4, v11[5]);

  _Block_object_dispose(&v10, 8);
}

void sub_18FBDAEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __SBSAcquireFocusPreventingFullScreenPresentationAssertion_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  memset(v8, 0, 512);
  if ([*(id *)(a1 + 32) getCString:v8 maxLength:1024 encoding:4])
  {
    uint64_t v4 = SBSSpringBoardServerPort();
    if (!SBAcquireFocusPreventingFullScreenPresentationAssertion(v4, v8, a2))
    {
      id v5 = [[SBSAssertion alloc] initWithAssertionName:@"SBSAcquireFocusPreventingFullScreenPresentationAssertion" reason:*(void *)(a1 + 32) receiveRight:*(void *)(a1 + 40)];
      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
  }
}

uint64_t SBSIsReachabilityEnabled()
{
  unsigned __int8 v2 = 0;
  uint64_t v0 = SBSSpringBoardServerPort();
  SBIsReachabilityEnabled(v0, &v2);
  return v2;
}

uint64_t SBSSetReachabilityEnabled(uint64_t a1)
{
  uint64_t v2 = SBSSpringBoardServerPort();
  return SBSetReachabilityEnabled(v2, a1);
}

uint64_t SBSPresentPowerDownUI()
{
  uint64_t v0 = SBSSpringBoardServerPort();
  return SBPresentPowerDownUI(v0);
}

uint64_t SBSOverrideDisplayedDate(const __CFString *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  memset(v3, 0, 512);
  CFStringGetCString(a1, (char *)v3, 1024, 0x8000100u);
  uint64_t v1 = SBSSpringBoardServerPort();
  return SBOverrideDisplayedDate(v1, v3);
}

uint64_t SBSSetIdleText(const __CFString *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  memset(v3, 0, 512);
  CFStringGetCString(a1, (char *)v3, 1024, 0x8000100u);
  uint64_t v1 = SBSSpringBoardServerPort();
  return SBSetIdleText(v1, v3);
}

void sub_18FBDB4A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromSBIdleTimerConfigSettingPrecedence(uint64_t a1)
{
  uint64_t v1 = @"Normal";
  if (a1 == 1) {
    uint64_t v1 = @"High";
  }
  if (a1 == 2) {
    return @"Critical";
  }
  else {
    return v1;
  }
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t __SBLogDashBoard_block_invoke()
{
  SBLogDashBoard___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "DashBoard");
  return MEMORY[0x1F41817F8]();
}

id SBLogDashBoardScrollGestures()
{
  if (SBLogDashBoardScrollGestures_onceToken != -1) {
    dispatch_once(&SBLogDashBoardScrollGestures_onceToken, &__block_literal_global_9);
  }
  uint64_t v0 = (void *)SBLogDashBoardScrollGestures___logObj;
  return v0;
}

uint64_t __SBLogDashBoardScrollGestures_block_invoke()
{
  SBLogDashBoardScrollGestures___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "DashBoardScrollGestures");
  return MEMORY[0x1F41817F8]();
}

id SBLogDashBoardHostedAppViewController()
{
  if (SBLogDashBoardHostedAppViewController_onceToken != -1) {
    dispatch_once(&SBLogDashBoardHostedAppViewController_onceToken, &__block_literal_global_12);
  }
  uint64_t v0 = (void *)SBLogDashBoardHostedAppViewController___logObj;
  return v0;
}

uint64_t __SBLogDashBoardHostedAppViewController_block_invoke()
{
  SBLogDashBoardHostedAppViewController___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "DashBoardHostedAppViewController");
  return MEMORY[0x1F41817F8]();
}

id SBLogDashBoardCallToActionLabel()
{
  if (SBLogDashBoardCallToActionLabel_onceToken != -1) {
    dispatch_once(&SBLogDashBoardCallToActionLabel_onceToken, &__block_literal_global_15_0);
  }
  uint64_t v0 = (void *)SBLogDashBoardCallToActionLabel___logObj;
  return v0;
}

uint64_t __SBLogDashBoardCallToActionLabel_block_invoke()
{
  SBLogDashBoardCallToActionLabel___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "DashBoardCallToActionLabel");
  return MEMORY[0x1F41817F8]();
}

id SBLogDashBoardTelemetrySignposts()
{
  if (SBLogDashBoardTelemetrySignposts_onceToken != -1) {
    dispatch_once(&SBLogDashBoardTelemetrySignposts_onceToken, &__block_literal_global_18);
  }
  uint64_t v0 = (void *)SBLogDashBoardTelemetrySignposts___logObj;
  return v0;
}

uint64_t __SBLogDashBoardTelemetrySignposts_block_invoke()
{
  SBLogDashBoardTelemetrySignposts___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "DashBoardTelemetrySignposts");
  return MEMORY[0x1F41817F8]();
}

id SBLogDisplayAssertions()
{
  if (SBLogDisplayAssertions_onceToken != -1) {
    dispatch_once(&SBLogDisplayAssertions_onceToken, &__block_literal_global_21_0);
  }
  uint64_t v0 = (void *)SBLogDisplayAssertions___logObj;
  return v0;
}

uint64_t __SBLogDisplayAssertions_block_invoke()
{
  SBLogDisplayAssertions___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "DisplayAssertions");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SBLogDisplayControlling_block_invoke()
{
  SBLogDisplayControlling___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "DisplayControlling");
  return MEMORY[0x1F41817F8]();
}

id SBLogDisplayEducation()
{
  if (SBLogDisplayEducation_onceToken != -1) {
    dispatch_once(&SBLogDisplayEducation_onceToken, &__block_literal_global_27);
  }
  uint64_t v0 = (void *)SBLogDisplayEducation___logObj;
  return v0;
}

uint64_t __SBLogDisplayEducation_block_invoke()
{
  SBLogDisplayEducation___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "DisplayEducation");
  return MEMORY[0x1F41817F8]();
}

id SBLogDisplayScaleMapping()
{
  if (SBLogDisplayScaleMapping_onceToken != -1) {
    dispatch_once(&SBLogDisplayScaleMapping_onceToken, &__block_literal_global_30);
  }
  uint64_t v0 = (void *)SBLogDisplayScaleMapping___logObj;
  return v0;
}

uint64_t __SBLogDisplayScaleMapping_block_invoke()
{
  SBLogDisplayScaleMapping___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "DisplayScaleMapping");
  return MEMORY[0x1F41817F8]();
}

id SBLogDisplayTransforming()
{
  if (SBLogDisplayTransforming_onceToken != -1) {
    dispatch_once(&SBLogDisplayTransforming_onceToken, &__block_literal_global_33);
  }
  uint64_t v0 = (void *)SBLogDisplayTransforming___logObj;
  return v0;
}

uint64_t __SBLogDisplayTransforming_block_invoke()
{
  SBLogDisplayTransforming___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "DisplayTransforming");
  return MEMORY[0x1F41817F8]();
}

id SBLogFBDisplayManagerCallbacks()
{
  if (SBLogFBDisplayManagerCallbacks_onceToken != -1) {
    dispatch_once(&SBLogFBDisplayManagerCallbacks_onceToken, &__block_literal_global_36);
  }
  uint64_t v0 = (void *)SBLogFBDisplayManagerCallbacks___logObj;
  return v0;
}

uint64_t __SBLogFBDisplayManagerCallbacks_block_invoke()
{
  SBLogFBDisplayManagerCallbacks___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "FBDisplayManagerCallbacks");
  return MEMORY[0x1F41817F8]();
}

id SBLogDoNotDisturbWhileDriving()
{
  if (SBLogDoNotDisturbWhileDriving_onceToken != -1) {
    dispatch_once(&SBLogDoNotDisturbWhileDriving_onceToken, &__block_literal_global_39);
  }
  uint64_t v0 = (void *)SBLogDoNotDisturbWhileDriving___logObj;
  return v0;
}

uint64_t __SBLogDoNotDisturbWhileDriving_block_invoke()
{
  SBLogDoNotDisturbWhileDriving___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "DoNotDisturbWhileDriving");
  return MEMORY[0x1F41817F8]();
}

id SBLogDoNotDisturbBedtime()
{
  if (SBLogDoNotDisturbBedtime_onceToken != -1) {
    dispatch_once(&SBLogDoNotDisturbBedtime_onceToken, &__block_literal_global_42);
  }
  uint64_t v0 = (void *)SBLogDoNotDisturbBedtime___logObj;
  return v0;
}

uint64_t __SBLogDoNotDisturbBedtime_block_invoke()
{
  SBLogDoNotDisturbBedtime___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "DoNotDisturbBedtime");
  return MEMORY[0x1F41817F8]();
}

id SBLogFocusModes()
{
  if (SBLogFocusModes_onceToken != -1) {
    dispatch_once(&SBLogFocusModes_onceToken, &__block_literal_global_45);
  }
  uint64_t v0 = (void *)SBLogFocusModes___logObj;
  return v0;
}

uint64_t __SBLogFocusModes_block_invoke()
{
  SBLogFocusModes___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "FocusModes");
  return MEMORY[0x1F41817F8]();
}

id SBLogApplicationRestrictionMonitoring()
{
  if (SBLogApplicationRestrictionMonitoring_onceToken != -1) {
    dispatch_once(&SBLogApplicationRestrictionMonitoring_onceToken, &__block_literal_global_48);
  }
  uint64_t v0 = (void *)SBLogApplicationRestrictionMonitoring___logObj;
  return v0;
}

uint64_t __SBLogApplicationRestrictionMonitoring_block_invoke()
{
  SBLogApplicationRestrictionMonitoring___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "ApplicationRestrictionMonitoring");
  return MEMORY[0x1F41817F8]();
}

id SBLogHomeScreenConfiguration()
{
  if (SBLogHomeScreenConfiguration_onceToken != -1) {
    dispatch_once(&SBLogHomeScreenConfiguration_onceToken, &__block_literal_global_51);
  }
  uint64_t v0 = (void *)SBLogHomeScreenConfiguration___logObj;
  return v0;
}

uint64_t __SBLogHomeScreenConfiguration_block_invoke()
{
  SBLogHomeScreenConfiguration___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "HomeScreenConfiguration");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SBLogIdleTimer_block_invoke()
{
  SBLogIdleTimer___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "IdleTimer");
  return MEMORY[0x1F41817F8]();
}

id SBLogMotionGesture()
{
  if (SBLogMotionGesture_onceToken != -1) {
    dispatch_once(&SBLogMotionGesture_onceToken, &__block_literal_global_57);
  }
  uint64_t v0 = (void *)SBLogMotionGesture___logObj;
  return v0;
}

uint64_t __SBLogMotionGesture_block_invoke()
{
  SBLogMotionGesture___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "MotionGesture");
  return MEMORY[0x1F41817F8]();
}

id SBLogMotionAlarm()
{
  if (SBLogMotionAlarm_onceToken != -1) {
    dispatch_once(&SBLogMotionAlarm_onceToken, &__block_literal_global_60);
  }
  uint64_t v0 = (void *)SBLogMotionAlarm___logObj;
  return v0;
}

uint64_t __SBLogMotionAlarm_block_invoke()
{
  SBLogMotionAlarm___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "MotionAlarm");
  return MEMORY[0x1F41817F8]();
}

id SBLogPrototypeController()
{
  if (SBLogPrototypeController_onceToken != -1) {
    dispatch_once(&SBLogPrototypeController_onceToken, &__block_literal_global_63);
  }
  uint64_t v0 = (void *)SBLogPrototypeController___logObj;
  return v0;
}

uint64_t __SBLogPrototypeController_block_invoke()
{
  SBLogPrototypeController___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "PrototypeController");
  return MEMORY[0x1F41817F8]();
}

id SBLogWallet()
{
  if (SBLogWallet_onceToken != -1) {
    dispatch_once(&SBLogWallet_onceToken, &__block_literal_global_66);
  }
  uint64_t v0 = (void *)SBLogWallet___logObj;
  return v0;
}

uint64_t __SBLogWallet_block_invoke()
{
  SBLogWallet___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "Wallet");
  return MEMORY[0x1F41817F8]();
}

id SBLogLiquidDetection()
{
  if (SBLogLiquidDetection_onceToken != -1) {
    dispatch_once(&SBLogLiquidDetection_onceToken, &__block_literal_global_69);
  }
  uint64_t v0 = (void *)SBLogLiquidDetection___logObj;
  return v0;
}

uint64_t __SBLogLiquidDetection_block_invoke()
{
  SBLogLiquidDetection___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "LiquidDetection");
  return MEMORY[0x1F41817F8]();
}

id SBLogAutoLaunching()
{
  if (SBLogAutoLaunching_onceToken != -1) {
    dispatch_once(&SBLogAutoLaunching_onceToken, &__block_literal_global_72);
  }
  uint64_t v0 = (void *)SBLogAutoLaunching___logObj;
  return v0;
}

uint64_t __SBLogAutoLaunching_block_invoke()
{
  SBLogAutoLaunching___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "AutoLaunching");
  return MEMORY[0x1F41817F8]();
}

id SBLogCoverSheet()
{
  if (SBLogCoverSheet_onceToken != -1) {
    dispatch_once(&SBLogCoverSheet_onceToken, &__block_literal_global_75);
  }
  uint64_t v0 = (void *)SBLogCoverSheet___logObj;
  return v0;
}

uint64_t __SBLogCoverSheet_block_invoke()
{
  SBLogCoverSheet___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "CoverSheet");
  return MEMORY[0x1F41817F8]();
}

id SBLogCoverSheetActivities()
{
  if (SBLogCoverSheetActivities_onceToken != -1) {
    dispatch_once(&SBLogCoverSheetActivities_onceToken, &__block_literal_global_78);
  }
  uint64_t v0 = (void *)SBLogCoverSheetActivities___logObj;
  return v0;
}

uint64_t __SBLogCoverSheetActivities_block_invoke()
{
  SBLogCoverSheetActivities___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "CoverSheetActivities");
  return MEMORY[0x1F41817F8]();
}

id SBLogCoverSheetWidgets()
{
  if (SBLogCoverSheetWidgets_onceToken != -1) {
    dispatch_once(&SBLogCoverSheetWidgets_onceToken, &__block_literal_global_81);
  }
  uint64_t v0 = (void *)SBLogCoverSheetWidgets___logObj;
  return v0;
}

uint64_t __SBLogCoverSheetWidgets_block_invoke()
{
  SBLogCoverSheetWidgets___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "CoverSheetWidgets");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SBLogDockRecents_block_invoke()
{
  SBLogDockRecents___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "DockRecents");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SBLogIconDragging_block_invoke()
{
  SBLogIconDragging___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "IconDragging");
  return MEMORY[0x1F41817F8]();
}

id SBLogMedusaDropDestination()
{
  if (SBLogMedusaDropDestination_onceToken != -1) {
    dispatch_once(&SBLogMedusaDropDestination_onceToken, &__block_literal_global_90);
  }
  uint64_t v0 = (void *)SBLogMedusaDropDestination___logObj;
  return v0;
}

uint64_t __SBLogMedusaDropDestination_block_invoke()
{
  SBLogMedusaDropDestination___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "MedusaDropDestination");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SBLogAnalytics_block_invoke()
{
  SBLogAnalytics___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "Analytics");
  return MEMORY[0x1F41817F8]();
}

id SBLogLockScreenNowPlaying()
{
  if (SBLogLockScreenNowPlaying_onceToken != -1) {
    dispatch_once(&SBLogLockScreenNowPlaying_onceToken, &__block_literal_global_96);
  }
  uint64_t v0 = (void *)SBLogLockScreenNowPlaying___logObj;
  return v0;
}

uint64_t __SBLogLockScreenNowPlaying_block_invoke()
{
  SBLogLockScreenNowPlaying___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "LockScreenNowPlaying");
  return MEMORY[0x1F41817F8]();
}

id SBLogScreenWake()
{
  if (SBLogScreenWake_onceToken != -1) {
    dispatch_once(&SBLogScreenWake_onceToken, &__block_literal_global_99);
  }
  uint64_t v0 = (void *)SBLogScreenWake___logObj;
  return v0;
}

uint64_t __SBLogScreenWake_block_invoke()
{
  SBLogScreenWake___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "ScreenWake");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SBLogStatusBarish_block_invoke()
{
  SBLogStatusBarish___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "StatusBarish");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SBLogAppShortcuts_block_invoke()
{
  SBLogAppShortcuts___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "AppShortcuts");
  return MEMORY[0x1F41817F8]();
}

id SBLogWallpaper()
{
  if (SBLogWallpaper_onceToken != -1) {
    dispatch_once(&SBLogWallpaper_onceToken, &__block_literal_global_108);
  }
  uint64_t v0 = (void *)SBLogWallpaper___logObj;
  return v0;
}

uint64_t __SBLogWallpaper_block_invoke()
{
  SBLogWallpaper___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "Wallpaper");
  return MEMORY[0x1F41817F8]();
}

id SBLogCFUserNotifications()
{
  if (SBLogCFUserNotifications_onceToken != -1) {
    dispatch_once(&SBLogCFUserNotifications_onceToken, &__block_literal_global_111);
  }
  uint64_t v0 = (void *)SBLogCFUserNotifications___logObj;
  return v0;
}

uint64_t __SBLogCFUserNotifications_block_invoke()
{
  SBLogCFUserNotifications___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "CFUserNotifications");
  return MEMORY[0x1F41817F8]();
}

id SBLogTransientOverlay()
{
  if (SBLogTransientOverlay_onceToken != -1) {
    dispatch_once(&SBLogTransientOverlay_onceToken, &__block_literal_global_114);
  }
  uint64_t v0 = (void *)SBLogTransientOverlay___logObj;
  return v0;
}

uint64_t __SBLogTransientOverlay_block_invoke()
{
  SBLogTransientOverlay___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "TransientOverlay");
  return MEMORY[0x1F41817F8]();
}

id SBLogRootController()
{
  if (SBLogRootController_onceToken != -1) {
    dispatch_once(&SBLogRootController_onceToken, &__block_literal_global_117);
  }
  uint64_t v0 = (void *)SBLogRootController___logObj;
  return v0;
}

uint64_t __SBLogRootController_block_invoke()
{
  SBLogRootController___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "RootController");
  return MEMORY[0x1F41817F8]();
}

id SBLogWidgets()
{
  if (SBLogWidgets_onceToken != -1) {
    dispatch_once(&SBLogWidgets_onceToken, &__block_literal_global_120);
  }
  uint64_t v0 = (void *)SBLogWidgets___logObj;
  return v0;
}

uint64_t __SBLogWidgets_block_invoke()
{
  SBLogWidgets___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "Widgets");
  return MEMORY[0x1F41817F8]();
}

id SBLogAppQuitMonitor()
{
  if (SBLogAppQuitMonitor_onceToken != -1) {
    dispatch_once(&SBLogAppQuitMonitor_onceToken, &__block_literal_global_123);
  }
  uint64_t v0 = (void *)SBLogAppQuitMonitor___logObj;
  return v0;
}

uint64_t __SBLogAppQuitMonitor_block_invoke()
{
  SBLogAppQuitMonitor___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "AppQuitMonitor");
  return MEMORY[0x1F41817F8]();
}

id SBLogInCallPresentation()
{
  if (SBLogInCallPresentation_onceToken != -1) {
    dispatch_once(&SBLogInCallPresentation_onceToken, &__block_literal_global_126);
  }
  uint64_t v0 = (void *)SBLogInCallPresentation___logObj;
  return v0;
}

uint64_t __SBLogInCallPresentation_block_invoke()
{
  SBLogInCallPresentation___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "InCallPresentation");
  return MEMORY[0x1F41817F8]();
}

id SBLogSystemNotes()
{
  if (SBLogSystemNotes_onceToken != -1) {
    dispatch_once(&SBLogSystemNotes_onceToken, &__block_literal_global_129);
  }
  uint64_t v0 = (void *)SBLogSystemNotes___logObj;
  return v0;
}

uint64_t __SBLogSystemNotes_block_invoke()
{
  SBLogSystemNotes___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "SystemNotes");
  return MEMORY[0x1F41817F8]();
}

id SBLogAccessibilityWindowHosting()
{
  if (SBLogAccessibilityWindowHosting_onceToken != -1) {
    dispatch_once(&SBLogAccessibilityWindowHosting_onceToken, &__block_literal_global_132);
  }
  uint64_t v0 = (void *)SBLogAccessibilityWindowHosting___logObj;
  return v0;
}

uint64_t __SBLogAccessibilityWindowHosting_block_invoke()
{
  SBLogAccessibilityWindowHosting___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "AccessibilityWindowHosting");
  return MEMORY[0x1F41817F8]();
}

id SBLogBanners()
{
  if (SBLogBanners_onceToken != -1) {
    dispatch_once(&SBLogBanners_onceToken, &__block_literal_global_135);
  }
  uint64_t v0 = (void *)SBLogBanners___logObj;
  return v0;
}

uint64_t __SBLogBanners_block_invoke()
{
  SBLogBanners___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "Banners");
  return MEMORY[0x1F41817F8]();
}

id SBLogNotifications()
{
  if (SBLogNotifications_onceToken != -1) {
    dispatch_once(&SBLogNotifications_onceToken, &__block_literal_global_138);
  }
  uint64_t v0 = (void *)SBLogNotifications___logObj;
  return v0;
}

uint64_t __SBLogNotifications_block_invoke()
{
  SBLogNotifications___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "Notifications");
  return MEMORY[0x1F41817F8]();
}

id SBLogWebClip()
{
  if (SBLogWebClip_onceToken != -1) {
    dispatch_once(&SBLogWebClip_onceToken, &__block_literal_global_141);
  }
  uint64_t v0 = (void *)SBLogWebClip___logObj;
  return v0;
}

uint64_t __SBLogWebClip_block_invoke()
{
  SBLogWebClip___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "WebClip");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SBLogPIP_block_invoke()
{
  SBLogPIP___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "PIP");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SBLogZStack_block_invoke()
{
  SBLogZStack___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "ZStack");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SBLogKeyboardFocus_block_invoke()
{
  SBLogKeyboardFocus___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "KeyboardFocus");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SBLogTraitsArbiter_block_invoke()
{
  SBLogTraitsArbiter___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "TraitsArbiter");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SBLogMedusaKeyboard_block_invoke()
{
  SBLogMedusaKeyboard___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "MedusaKeyboard");
  return MEMORY[0x1F41817F8]();
}

id SBLogKeyboardDismissal()
{
  if (SBLogKeyboardDismissal_onceToken != -1) {
    dispatch_once(&SBLogKeyboardDismissal_onceToken, &__block_literal_global_159);
  }
  uint64_t v0 = (void *)SBLogKeyboardDismissal___logObj;
  return v0;
}

uint64_t __SBLogKeyboardDismissal_block_invoke()
{
  SBLogKeyboardDismissal___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "KeyboardDismissal");
  return MEMORY[0x1F41817F8]();
}

id SBLogActiveDisplay()
{
  if (SBLogActiveDisplay_onceToken != -1) {
    dispatch_once(&SBLogActiveDisplay_onceToken, &__block_literal_global_162);
  }
  uint64_t v0 = (void *)SBLogActiveDisplay___logObj;
  return v0;
}

uint64_t __SBLogActiveDisplay_block_invoke()
{
  SBLogActiveDisplay___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "ActiveDisplay");
  return MEMORY[0x1F41817F8]();
}

id SBLogZStackSystemApertureSuppression()
{
  if (SBLogZStackSystemApertureSuppression_onceToken != -1) {
    dispatch_once(&SBLogZStackSystemApertureSuppression_onceToken, &__block_literal_global_165);
  }
  uint64_t v0 = (void *)SBLogZStackSystemApertureSuppression___logObj;
  return v0;
}

uint64_t __SBLogZStackSystemApertureSuppression_block_invoke()
{
  SBLogZStackSystemApertureSuppression___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "ZStackSystemApertureSuppression");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SBLogSpotlight_block_invoke()
{
  SBLogSpotlight___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "Spotlight");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SBLogHearingTestMode_block_invoke()
{
  SBLogHearingTestMode___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "HearingTestMode");
  return MEMORY[0x1F41817F8]();
}

id SBLogPhoneUnlockWithWatch()
{
  if (SBLogPhoneUnlockWithWatch_onceToken != -1) {
    dispatch_once(&SBLogPhoneUnlockWithWatch_onceToken, &__block_literal_global_174);
  }
  uint64_t v0 = (void *)SBLogPhoneUnlockWithWatch___logObj;
  return v0;
}

uint64_t __SBLogPhoneUnlockWithWatch_block_invoke()
{
  SBLogPhoneUnlockWithWatch___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "PhoneUnlockWithWatch");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SBLogInputUI_block_invoke()
{
  SBLogInputUI___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "InputUI");
  return MEMORY[0x1F41817F8]();
}

id SBLogProductivityGestures()
{
  if (SBLogProductivityGestures_onceToken != -1) {
    dispatch_once(&SBLogProductivityGestures_onceToken, &__block_literal_global_180);
  }
  uint64_t v0 = (void *)SBLogProductivityGestures___logObj;
  return v0;
}

uint64_t __SBLogProductivityGestures_block_invoke()
{
  SBLogProductivityGestures___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "ProductivityGestures");
  return MEMORY[0x1F41817F8]();
}

id SBLogSceneSnapshots()
{
  if (SBLogSceneSnapshots_onceToken != -1) {
    dispatch_once(&SBLogSceneSnapshots_onceToken, &__block_literal_global_183);
  }
  uint64_t v0 = (void *)SBLogSceneSnapshots___logObj;
  return v0;
}

uint64_t __SBLogSceneSnapshots_block_invoke()
{
  SBLogSceneSnapshots___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "SceneSnapshots");
  return MEMORY[0x1F41817F8]();
}

id SBLogSceneResolution()
{
  if (SBLogSceneResolution_onceToken != -1) {
    dispatch_once(&SBLogSceneResolution_onceToken, &__block_literal_global_186);
  }
  uint64_t v0 = (void *)SBLogSceneResolution___logObj;
  return v0;
}

uint64_t __SBLogSceneResolution_block_invoke()
{
  SBLogSceneResolution___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "SceneResolution");
  return MEMORY[0x1F41817F8]();
}

id SBLogSystemUIScene()
{
  if (SBLogSystemUIScene_onceToken != -1) {
    dispatch_once(&SBLogSystemUIScene_onceToken, &__block_literal_global_189);
  }
  uint64_t v0 = (void *)SBLogSystemUIScene___logObj;
  return v0;
}

uint64_t __SBLogSystemUIScene_block_invoke()
{
  SBLogSystemUIScene___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "SystemUIScene");
  return MEMORY[0x1F41817F8]();
}

id SBLogBiometricResource()
{
  if (SBLogBiometricResource_onceToken != -1) {
    dispatch_once(&SBLogBiometricResource_onceToken, &__block_literal_global_192);
  }
  uint64_t v0 = (void *)SBLogBiometricResource___logObj;
  return v0;
}

uint64_t __SBLogBiometricResource_block_invoke()
{
  SBLogBiometricResource___logObuint64_t j = (uint64_t)os_log_create((const char *)SBBiometricLoggingSubsystem, "Resource");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SBLogLockScreenBiometricCoordinator_block_invoke()
{
  SBLogLockScreenBiometricCoordinator___logObuint64_t j = (uint64_t)os_log_create((const char *)SBBiometricLoggingSubsystem, "Coordinator");
  return MEMORY[0x1F41817F8]();
}

id SBLogLockScreenBiometricWalletPreArm()
{
  if (SBLogLockScreenBiometricWalletPreArm_onceToken != -1) {
    dispatch_once(&SBLogLockScreenBiometricWalletPreArm_onceToken, &__block_literal_global_198);
  }
  uint64_t v0 = (void *)SBLogLockScreenBiometricWalletPreArm___logObj;
  return v0;
}

uint64_t __SBLogLockScreenBiometricWalletPreArm_block_invoke()
{
  SBLogLockScreenBiometricWalletPreArm___logObuint64_t j = (uint64_t)os_log_create((const char *)SBBiometricLoggingSubsystem, "WalletPreArm");
  return MEMORY[0x1F41817F8]();
}

id SBLogLockScreenBiometricFaceIDCoaching()
{
  if (SBLogLockScreenBiometricFaceIDCoaching_onceToken != -1) {
    dispatch_once(&SBLogLockScreenBiometricFaceIDCoaching_onceToken, &__block_literal_global_201);
  }
  uint64_t v0 = (void *)SBLogLockScreenBiometricFaceIDCoaching___logObj;
  return v0;
}

uint64_t __SBLogLockScreenBiometricFaceIDCoaching_block_invoke()
{
  SBLogLockScreenBiometricFaceIDCoaching___logObuint64_t j = (uint64_t)os_log_create((const char *)SBBiometricLoggingSubsystem, "FaceIDCoaching");
  return MEMORY[0x1F41817F8]();
}

id SBLogLockScreenMesaWalletPreArm()
{
  if (SBLogLockScreenMesaWalletPreArm_onceToken != -1) {
    dispatch_once(&SBLogLockScreenMesaWalletPreArm_onceToken, &__block_literal_global_204);
  }
  uint64_t v0 = (void *)SBLogLockScreenMesaWalletPreArm___logObj;
  return v0;
}

uint64_t __SBLogLockScreenMesaWalletPreArm_block_invoke()
{
  SBLogLockScreenMesaWalletPreArm___logObuint64_t j = (uint64_t)os_log_create((const char *)SBBiometricLoggingSubsystem, "WalletPreArm");
  return MEMORY[0x1F41817F8]();
}

id SBLogLockScreenMesaUnlockBehaviors()
{
  if (SBLogLockScreenMesaUnlockBehaviors_onceToken != -1) {
    dispatch_once(&SBLogLockScreenMesaUnlockBehaviors_onceToken, &__block_literal_global_206);
  }
  uint64_t v0 = (void *)SBLogLockScreenMesaUnlockBehaviors___logObj;
  return v0;
}

uint64_t __SBLogLockScreenMesaUnlockBehaviors_block_invoke()
{
  SBLogLockScreenMesaUnlockBehaviors___logObuint64_t j = (uint64_t)os_log_create((const char *)SBBiometricLoggingSubsystem, "UnlockBehaviors");
  return MEMORY[0x1F41817F8]();
}

id SBLogLockScreenMesaHomeButtonPasscodeRecognizer()
{
  if (SBLogLockScreenMesaHomeButtonPasscodeRecognizer_onceToken != -1) {
    dispatch_once(&SBLogLockScreenMesaHomeButtonPasscodeRecognizer_onceToken, &__block_literal_global_209);
  }
  uint64_t v0 = (void *)SBLogLockScreenMesaHomeButtonPasscodeRecognizer___logObj;
  return v0;
}

uint64_t __SBLogLockScreenMesaHomeButtonPasscodeRecognizer_block_invoke()
{
  SBLogLockScreenMesaHomeButtonPasscodeRecognizer___logObuint64_t j = (uint64_t)os_log_create((const char *)SBBiometricLoggingSubsystem, "HomeButtonPasscodeRecognizer");
  return MEMORY[0x1F41817F8]();
}

id SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer()
{
  if (SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer_onceToken != -1) {
    dispatch_once(&SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer_onceToken, &__block_literal_global_212);
  }
  uint64_t v0 = (void *)SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer___logObj;
  return v0;
}

uint64_t __SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer_block_invoke()
{
  SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer___logObuint64_t j = (uint64_t)os_log_create((const char *)SBBiometricLoggingSubsystem, "HomeButtonSuppressAfterUnlockRecognizer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SBLogAuthenticationController_block_invoke()
{
  SBLogAuthenticationController___logObuint64_t j = (uint64_t)os_log_create((const char *)SBAuthLoggingSubsystem, "Controller");
  return MEMORY[0x1F41817F8]();
}

id SBLogAuthenticationRequests()
{
  if (SBLogAuthenticationRequests_onceToken != -1) {
    dispatch_once(&SBLogAuthenticationRequests_onceToken, &__block_literal_global_218);
  }
  uint64_t v0 = (void *)SBLogAuthenticationRequests___logObj;
  return v0;
}

uint64_t __SBLogAuthenticationRequests_block_invoke()
{
  SBLogAuthenticationRequests___logObuint64_t j = (uint64_t)os_log_create((const char *)SBAuthLoggingSubsystem, "Requests");
  return MEMORY[0x1F41817F8]();
}

id SBLogAuthenticationKeybag()
{
  if (SBLogAuthenticationKeybag_onceToken != -1) {
    dispatch_once(&SBLogAuthenticationKeybag_onceToken, &__block_literal_global_221);
  }
  uint64_t v0 = (void *)SBLogAuthenticationKeybag___logObj;
  return v0;
}

uint64_t __SBLogAuthenticationKeybag_block_invoke()
{
  SBLogAuthenticationKeybag___logObuint64_t j = (uint64_t)os_log_create((const char *)SBAuthLoggingSubsystem, "Keybag");
  return MEMORY[0x1F41817F8]();
}

id SBLogAuthenticationAssertions()
{
  if (SBLogAuthenticationAssertions_onceToken != -1) {
    dispatch_once(&SBLogAuthenticationAssertions_onceToken, &__block_literal_global_224);
  }
  uint64_t v0 = (void *)SBLogAuthenticationAssertions___logObj;
  return v0;
}

uint64_t __SBLogAuthenticationAssertions_block_invoke()
{
  SBLogAuthenticationAssertions___logObuint64_t j = (uint64_t)os_log_create((const char *)SBAuthLoggingSubsystem, "Assertions");
  return MEMORY[0x1F41817F8]();
}

id SBLogAuthenticationModel()
{
  if (SBLogAuthenticationModel_onceToken != -1) {
    dispatch_once(&SBLogAuthenticationModel_onceToken, &__block_literal_global_227);
  }
  uint64_t v0 = (void *)SBLogAuthenticationModel___logObj;
  return v0;
}

uint64_t __SBLogAuthenticationModel_block_invoke()
{
  SBLogAuthenticationModel___logObuint64_t j = (uint64_t)os_log_create((const char *)SBAuthLoggingSubsystem, "Model");
  return MEMORY[0x1F41817F8]();
}

id SBLogCameraCaptureAccidentalActivationMitigationSession()
{
  if (SBLogCameraCaptureAccidentalActivationMitigationSession_onceToken != -1) {
    dispatch_once(&SBLogCameraCaptureAccidentalActivationMitigationSession_onceToken, &__block_literal_global_230);
  }
  uint64_t v0 = (void *)SBLogCameraCaptureAccidentalActivationMitigationSession___logObj;
  return v0;
}

uint64_t __SBLogCameraCaptureAccidentalActivationMitigationSession_block_invoke()
{
  SBLogCameraCaptureAccidentalActivationMitigationSession___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "CameraCaptureAccidentalActivationMitigationSession");
  return MEMORY[0x1F41817F8]();
}

id SBLogCameraCaptureAppConfiguration()
{
  if (SBLogCameraCaptureAppConfiguration_onceToken != -1) {
    dispatch_once(&SBLogCameraCaptureAppConfiguration_onceToken, &__block_literal_global_233);
  }
  uint64_t v0 = (void *)SBLogCameraCaptureAppConfiguration___logObj;
  return v0;
}

uint64_t __SBLogCameraCaptureAppConfiguration_block_invoke()
{
  SBLogCameraCaptureAppConfiguration___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "CameraCaptureAppConfiguration");
  return MEMORY[0x1F41817F8]();
}

id SBLogCameraCaptureRestriction()
{
  if (SBLogCameraCaptureRestriction_onceToken != -1) {
    dispatch_once(&SBLogCameraCaptureRestriction_onceToken, &__block_literal_global_236);
  }
  uint64_t v0 = (void *)SBLogCameraCaptureRestriction___logObj;
  return v0;
}

uint64_t __SBLogCameraCaptureRestriction_block_invoke()
{
  SBLogCameraCaptureRestriction___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "CameraCaptureRestriction");
  return MEMORY[0x1F41817F8]();
}

id SBLogHardwareButtonService()
{
  if (SBLogHardwareButtonService_onceToken != -1) {
    dispatch_once(&SBLogHardwareButtonService_onceToken, &__block_literal_global_239);
  }
  uint64_t v0 = (void *)SBLogHardwareButtonService___logObj;
  return v0;
}

uint64_t __SBLogHardwareButtonService_block_invoke()
{
  SBLogHardwareButtonService___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "HardwareButtonService");
  return MEMORY[0x1F41817F8]();
}

id SBLogSystemApertureHosting()
{
  if (SBLogSystemApertureHosting_onceToken != -1) {
    dispatch_once(&SBLogSystemApertureHosting_onceToken, &__block_literal_global_242);
  }
  uint64_t v0 = (void *)SBLogSystemApertureHosting___logObj;
  return v0;
}

uint64_t __SBLogSystemApertureHosting_block_invoke()
{
  SBLogSystemApertureHosting___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "SystemApertureHosting");
  return MEMORY[0x1F41817F8]();
}

id SBLogHangTracer()
{
  if (SBLogHangTracer_onceToken != -1) {
    dispatch_once(&SBLogHangTracer_onceToken, &__block_literal_global_245);
  }
  uint64_t v0 = (void *)SBLogHangTracer___logObj;
  return v0;
}

uint64_t __SBLogHangTracer_block_invoke()
{
  SBLogHangTracer___logObuint64_t j = (uint64_t)os_log_create((const char *)SBLoggingSubsystem, "HangTracer");
  return MEMORY[0x1F41817F8]();
}

__CFString *NSStringFromSBSHardwareButtonHapticType(unint64_t a1)
{
  if (a1 >= 4)
  {
    [NSString stringWithFormat:@"<unknown:%d>", a1];
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E566BBF0[a1];
  }
  return v1;
}

__CFString *NSStringFromSBSHardwareButtonToggleState(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) >= 3)
  {
    [NSString stringWithFormat:@"<unknown:%d>", a1];
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E566BC68[a1 + 1];
  }
  return v1;
}

__CFString *NSStringFromSBSHardwareButtonEventPriority(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 100)
    {
      uint64_t v2 = @"lockScreenPluginView";
    }
    else if (a1 == 300)
    {
      uint64_t v2 = @"aboveGuidedAccess";
    }
    else
    {
      [NSString stringWithFormat:@"<unknown:%d>", a1];
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v2 = @"normal";
  }
  return v2;
}

__CFString *NSStringFromSBSHardwareButtonHintContentAppearState(uint64_t a1)
{
  uint64_t v1 = @"<unknown>";
  if (a1 == 1) {
    uint64_t v1 = @"visible";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"hidden";
  }
}

__CFString *NSStringFromSBSHardwareButtonSystemGlowStyle(uint64_t a1)
{
  uint64_t v1 = @"<unknown>";
  if (a1 == 1) {
    uint64_t v1 = @"fullyPresented";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"activating";
  }
}

__CFString *NSStringFromSBSCaptureButtonSuppressionOptions(uint64_t a1)
{
  if (a1)
  {
    [NSString stringWithFormat:@"<unrecognized:0x%X>", a1];
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v2 = @"complete";
  }
  return v2;
}

uint64_t SBApplicationStateBeginGeneratingChangeNotifications()
{
  uint64_t v0 = pthread_mutex_lock(&sRegistrationCountLock);
  if (!sRegisterCount++)
  {
    uint64_t v2 = (void *)MEMORY[0x192FC0BD0](v0);
    id v3 = _SBApplicationStateGetMonitor_Locked();
    [v3 setHandler:&__block_literal_global_14];
  }
  return pthread_mutex_unlock(&sRegistrationCountLock);
}

uint64_t SBApplicationStateEndGeneratingChangeNotifications()
{
  uint64_t v0 = pthread_mutex_lock(&sRegistrationCountLock);
  if (!--sRegisterCount)
  {
    uint64_t v1 = (void *)MEMORY[0x192FC0BD0](v0);
    uint64_t v2 = _SBApplicationStateGetMonitor_Locked();
    [v2 setHandler:0];
  }
  return pthread_mutex_unlock(&sRegistrationCountLock);
}

uint64_t SBSGetApplicationState(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x192FC0BD0]();
  id v3 = _SBApplicationStateGetMonitor();
  uint64_t v4 = [v3 applicationStateForApplication:a1];

  return v4;
}

uint64_t SBSGetMostElevatedApplicationStateForProcessID(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x192FC0BD0]();
  id v3 = _SBApplicationStateGetMonitor();
  uint64_t v4 = [v3 mostElevatedApplicationStateForPID:a1];

  return v4;
}

uint64_t SBSCopyInfoForApplicationWithProcessID(uint64_t a1)
{
  uint64_t v2 = _SBApplicationStateGetMonitor();
  uint64_t v3 = [v2 applicationInfoForPID:a1];

  return v3;
}

void sub_18FBE1CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getATXHomeScreenPageClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AppPredictionClientLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __AppPredictionClientLibraryCore_block_invoke;
    void v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E566BD30;
    uint64_t v5 = 0;
    AppPredictionClientLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppPredictionClientLibraryCore_frameworkLibrary) {
    __getATXHomeScreenPageClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("ATXHomeScreenPage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getATXHomeScreenPageClass_block_invoke_cold_2();
  }
  getATXHomeScreenPageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppPredictionClientLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppPredictionClientLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_18FBE25C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18FBE26EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t SBSProcessAssertionGetNameForReason(uint64_t a1)
{
  return [MEMORY[0x1E4F4F390] NameForReason:a1];
}

uint64_t SBSProcessAssertionGetTypeID()
{
  return __SBSProcessAssertionTypeID;
}

uint64_t SBSProcessAssertionRegisterClass()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __SBSProcessAssertionTypeID = result;
  return result;
}

uint64_t SBSProcessAssertionCreateForPID(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  pthread_once(&__SBSProcessAssertionRegisterOnce, (void (*)(void))SBSProcessAssertionRegisterClass);
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    uint64_t v10 = (void *)MEMORY[0x192FC0BD0]();
    *(void *)(Instance + 16) = 850045863;
    *(_OWORD *)(Instance + 24) = 0u;
    *(_OWORD *)(Instance + 40) = 0u;
    *(_OWORD *)(Instance + 56) = 0u;
    *(void *)(Instance + 72) = 0;
    *(_DWORD *)(Instance + 80) = a2;
    *(unsigned char *)(Instance + 84) = 1;
    *(void *)(Instance + 88) = 0;
    *(void *)(Instance + 96) = 0;
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F4F390]) initWithPID:a2 flags:a3 reason:a4 name:a5];
    *(void *)(Instance + 104) = v11;
    if ([v11 acquire])
    {
      uint64_t v12 = *(void **)(Instance + 104);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __SBSProcessAssertionCreateForPID_block_invoke;
      v15[3] = &__block_descriptor_36_e5_v8__0l;
      int v16 = a2;
      [v12 setInvalidationHandler:v15];
      pthread_mutex_lock(&sAssertionArrayLock);
      Mutable = (__CFArray *)sAssertionArray;
      if (!sAssertionArray)
      {
        Mutable = CFArrayCreateMutable(0, 0, 0);
        sAssertionArray = (uint64_t)Mutable;
      }
      CFArrayAppendValue(Mutable, (const void *)Instance);
      pthread_mutex_unlock(&sAssertionArrayLock);
    }
    else
    {
      CFRelease((CFTypeRef)Instance);
      uint64_t Instance = 0;
    }
  }
  return Instance;
}

void __SBSProcessAssertionCreateForPID_block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __SBSProcessAssertionCreateForPID_block_invoke_2;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  int v2 = *(_DWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __SBSProcessAssertionCreateForPID_block_invoke_2(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32);
  if (v1)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    if (Mutable)
    {
      uint64_t v3 = Mutable;
      pthread_mutex_lock(&sAssertionArrayLock);
      if (sAssertionArray)
      {
        CFIndex Count = CFArrayGetCount((CFArrayRef)sAssertionArray);
        if (Count >= 1)
        {
          unint64_t v5 = Count + 1;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)sAssertionArray, v5 - 2);
            if (ValueAtIndex[20] == v1)
            {
              id v7 = ValueAtIndex;
              CFArrayAppendValue(v3, ValueAtIndex);
              CFArrayRemoveValueAtIndex((CFMutableArrayRef)sAssertionArray, v5 - 2);
              *((unsigned char *)v7 + 84) = 0;
            }
            --v5;
          }
          while (v5 > 1);
        }
      }
      pthread_mutex_unlock(&sAssertionArrayLock);
      CFIndex v8 = CFArrayGetCount(v3);
      if (v8 >= 1)
      {
        CFIndex v9 = v8;
        for (CFIndex i = 0; i != v9; ++i)
        {
          id v11 = CFArrayGetValueAtIndex(v3, i);
          uint64_t v12 = (void (*)(void *, void))v11[11];
          if (v12) {
            v12(v11, v11[12]);
          }
        }
      }
      CFRelease(v3);
    }
  }
}

uint64_t SBSProcessAssertionSetFlags(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    long long v4 = (pthread_mutex_t *)(result + 16);
    uint64_t v5 = pthread_mutex_lock((pthread_mutex_t *)(result + 16));
    uint64_t v6 = (void *)MEMORY[0x192FC0BD0](v5);
    if (*(unsigned char *)(v3 + 84)) {
      [*(id *)(v3 + 104) setFlags:a2];
    }
    return pthread_mutex_unlock(v4);
  }
  return result;
}

uint64_t SBSProcessAssertionSetInvalidationCallBack(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = (pthread_mutex_t *)(result + 16);
    pthread_mutex_lock((pthread_mutex_t *)(result + 16));
    if (*(unsigned char *)(v5 + 84))
    {
      *(void *)(v5 + 88) = a2;
      *(void *)(v5 + 96) = a3;
    }
    return pthread_mutex_unlock(v6);
  }
  return result;
}

uint64_t SBSProcessAssertionIsValid(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    int v2 = (pthread_mutex_t *)(a1 + 16);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
    uint64_t v1 = *(unsigned __int8 *)(v1 + 84);
    pthread_mutex_unlock(v2);
  }
  return v1;
}

CFTypeRef SBSProcessAssertionCopyIdentifier(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  int v2 = (pthread_mutex_t *)(a1 + 16);
  uint64_t v3 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  long long v4 = (void *)MEMORY[0x192FC0BD0](v3);
  uint64_t v5 = [objc_msgSend(*(id *)(a1 + 104), "name") copy];
  pthread_mutex_unlock(v2);
  id v6 = v5;
  if (!v6) {
    return 0;
  }
  return CFRetain(v6);
}

uint64_t SBSProcessAssertionDealloc(uint64_t a1)
{
  int v2 = (pthread_mutex_t *)(a1 + 16);
  uint64_t v3 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(unsigned char *)(a1 + 84))
  {
    long long v4 = (void *)MEMORY[0x192FC0BD0](v3);
    pthread_mutex_lock(&sAssertionArrayLock);
    CFArrayRef v5 = (const __CFArray *)sAssertionArray;
    if (sAssertionArray)
    {
      v9.length = CFArrayGetCount((CFArrayRef)sAssertionArray);
      v9.location = 0;
      CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v5, v9, (const void *)a1);
      if (FirstIndexOfValue != -1) {
        CFArrayRemoveValueAtIndex((CFMutableArrayRef)sAssertionArray, FirstIndexOfValue);
      }
    }
    pthread_mutex_unlock(&sAssertionArrayLock);
    *(unsigned char *)(a1 + 84) = 0;
  }
  [*(id *)(a1 + 104) setInvalidationHandler:0];
  [*(id *)(a1 + 104) invalidate];

  *(void *)(a1 + 104) = 0;
  return pthread_mutex_unlock(v2);
}

BOOL SBSProcessAssertionEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef SBSProcessAssertionDescribe(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x192FC0BD0]();
  CFAllocatorRef v3 = CFGetAllocator((CFTypeRef)a1);
  if (*(unsigned char *)(a1 + 84)) {
    long long v4 = @"engaged";
  }
  else {
    long long v4 = @"invalid";
  }
  CFStringRef v5 = CFStringCreateWithFormat(v3, 0, @"<SBSProcessAssertion %p> pid = %d %@ reason = %@", a1, *(unsigned int *)(a1 + 80), v4, [MEMORY[0x1E4F4F390] NameForReason:objc_msgSend(*(id *)(a1 + 104), "reason")]);
  return v5;
}

uint64_t SBDataReset(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2050000000;
  CFAllocatorRef v3 = (void *)getDDRResetOptionsClass_softClass;
  uint64_t v22 = getDDRResetOptionsClass_softClass;
  if (!getDDRResetOptionsClass_softClass)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    int v16 = __getDDRResetOptionsClass_block_invoke;
    id v17 = &unk_1E566BD10;
    uint64_t v18 = &v19;
    __getDDRResetOptionsClass_block_invoke((uint64_t)&v14);
    CFAllocatorRef v3 = (void *)v20[3];
  }
  long long v4 = v3;
  _Block_object_dispose(&v19, 8);
  id v5 = objc_alloc_init(v4);
  id v6 = v5;
  uint64_t v2 = v2;
  switch((int)v2)
  {
    case 1:
      uint64_t v2 = 3;
      goto LABEL_8;
    case 2:
      goto LABEL_8;
    case 3:
    case 6:
      goto LABEL_7;
    case 4:
    case 7:
      [v5 setEraseDataPlan:1];
      goto LABEL_7;
    case 5:
      [v5 setEraseDataPlan:1];
      [v6 setHideProgress:1];
LABEL_7:
      uint64_t v2 = 4;
      goto LABEL_8;
    case 8:
      [v5 setEraseDataPlan:1];
      [v6 setHideProgress:1];
      uint64_t v2 = 5;
LABEL_8:
      uint64_t v19 = 0;
      uint64_t v20 = &v19;
      uint64_t v21 = 0x2050000000;
      id v7 = (void *)getDDRResetRequestClass_softClass;
      uint64_t v22 = getDDRResetRequestClass_softClass;
      if (!getDDRResetRequestClass_softClass)
      {
        uint64_t v14 = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        int v16 = __getDDRResetRequestClass_block_invoke;
        id v17 = &unk_1E566BD10;
        uint64_t v18 = &v19;
        __getDDRResetRequestClass_block_invoke((uint64_t)&v14);
        id v7 = (void *)v20[3];
      }
      CFIndex v8 = v7;
      _Block_object_dispose(&v19, 8);
      CFRange v9 = (void *)[[v8 alloc] initWithMode:v2 options:v6 reason:@"unknown"];
      uint64_t v19 = 0;
      uint64_t v20 = &v19;
      uint64_t v21 = 0x2050000000;
      uint64_t v10 = (void *)getDDRResetServiceClass_softClass;
      uint64_t v22 = getDDRResetServiceClass_softClass;
      if (!getDDRResetServiceClass_softClass)
      {
        uint64_t v14 = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        int v16 = __getDDRResetServiceClass_block_invoke;
        id v17 = &unk_1E566BD10;
        uint64_t v18 = &v19;
        __getDDRResetServiceClass_block_invoke((uint64_t)&v14);
        uint64_t v10 = (void *)v20[3];
      }
      id v11 = v10;
      _Block_object_dispose(&v19, 8);
      uint64_t v12 = [v11 sharedInstance];
      [v12 resetWithRequest:v9 completion:0];

      break;
    default:
      break;
  }

  return 0;
}

void sub_18FBE392C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBGetTopButtonFrames(int a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  return _SBSGetTopButtonFrames(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t SBRegisterRemoteView()
{
  return 5;
}

uint64_t SBUnregisterRemoteView()
{
  return 5;
}

uint64_t SBPresentSheetView()
{
  return 5;
}

uint64_t SBDismissSheetView()
{
  return 5;
}

uint64_t SBGetHomeScreenIconMetrics(int a1, void *a2, void *a3, void *a4, void *a5, _DWORD *a6, _DWORD *a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  return _SBSGetHomeScreenIconMetrics(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t SBSetWallpaperImageForLocations(mach_port_t a1, uint64_t a2, int a3, char a4, char a5, char a6, char a7, char *src, float a9, float a10, float a11, float a12, float a13, float a14, double a15, char a16, char a17, char a18, uint64_t a19, unsigned int a20,unsigned char *a21)
{
  return _SBSSetWallpaperImageForLocations(a1, a2, a3, a4, a5, a6, a7, src, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21);
}

uint64_t SBSetWallpaperImageSurfaceForLocations(mach_port_t a1, int a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, char a8, float a9, float a10, float a11, float a12, float a13, float a14, double a15, char a16, char a17, char a18, char *src, char a20,char a21,char a22,uint64_t a23,int a24,unsigned char *a25)
{
  return _SBSSetWallpaperImageSurfaceForLocations(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, src,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t SBGetWallpaperOptions(int a1, char a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6, _DWORD *a7, _DWORD *a8, unsigned char *a9, unsigned char *a10, unsigned char *a11, void *a12, void *a13, _DWORD *a14)
{
  return _SBSGetWallpaperOptions(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

Class __getDDRResetOptionsClass_block_invoke(uint64_t a1)
{
  EmbeddedDataResetLibrary();
  Class result = objc_getClass("DDRResetOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getDDRResetOptionsClass_block_invoke_cold_1();
  }
  getDDRResetOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void EmbeddedDataResetLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!EmbeddedDataResetLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __EmbeddedDataResetLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E566BD68;
    uint64_t v2 = 0;
    EmbeddedDataResetLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!EmbeddedDataResetLibraryCore_frameworkLibrary) {
    EmbeddedDataResetLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __EmbeddedDataResetLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  EmbeddedDataResetLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getDDRResetRequestClass_block_invoke(uint64_t a1)
{
  EmbeddedDataResetLibrary();
  Class result = objc_getClass("DDRResetRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getDDRResetRequestClass_block_invoke_cold_1();
  }
  getDDRResetRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getDDRResetServiceClass_block_invoke(uint64_t a1)
{
  EmbeddedDataResetLibrary();
  Class result = objc_getClass("DDRResetService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getDDRResetServiceClass_block_invoke_cold_1();
  }
  getDDRResetServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void SBSAcquireBiometricUnlockSuppressionAssertion(void *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = a1;
    id v5 = objc_alloc_init(SBSBiometricsService);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    _OWORD v7[2] = __SBSAcquireBiometricUnlockSuppressionAssertion_block_invoke;
    v7[3] = &unk_1E566BA68;
    CFIndex v8 = v5;
    id v9 = v3;
    id v6 = v5;
    [(SBSBiometricsService *)v6 acquireUnlockSuppressionAssertionForReason:v4 completion:v7];
  }
}

uint64_t __SBSAcquireBiometricUnlockSuppressionAssertion_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 invalidate];
}

void *__getADClientAddValueForScalarKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AggregateDictionaryLibrary();
  Class result = dlsym(v2, "ADClientAddValueForScalarKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getADClientAddValueForScalarKeySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AggregateDictionaryLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!AggregateDictionaryLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __AggregateDictionaryLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E566BDC8;
    uint64_t v4 = 0;
    AggregateDictionaryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AggregateDictionaryLibraryCore_frameworkLibrary;
  if (!AggregateDictionaryLibraryCore_frameworkLibrary) {
    AggregateDictionaryLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __AggregateDictionaryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AggregateDictionaryLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getADPushTimeIntervalForDistributionKeySinceStartTimeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AggregateDictionaryLibrary();
  uint64_t result = dlsym(v2, "ADPushTimeIntervalForDistributionKeySinceStartTime");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getADPushTimeIntervalForDistributionKeySinceStartTimeSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32)
                                                                                                + 8)
                                                                                    + 24);
  return result;
}

void *__getADMonotonicTimeGetCurrentSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AggregateDictionaryLibrary();
  uint64_t result = dlsym(v2, "ADMonotonicTimeGetCurrent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getADMonotonicTimeGetCurrentSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *SBSDisplayScaleDescription(uint64_t a1)
{
  uint64_t result = @".LargerText";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = @".Standard";
      break;
    case 2:
      uint64_t result = @".MoreSpace";
      break;
    case 3:
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      id v7 = [NSString stringWithUTF8String:"NSString * _Nonnull SBSDisplayScaleDescription(SBSDisplayScale)"];
      [v6 handleFailureInFunction:v7 file:@"SBSDisplayModeSettings.m" lineNumber:20 description:@"invalid scale: %lu" arguments:3];

      goto LABEL_6;
    default:
      uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"NSString * _Nonnull SBSDisplayScaleDescription(SBSDisplayScale)"];
      [v4 handleFailureInFunction:v5 file:@"SBSDisplayModeSettings.m" lineNumber:24 description:@"invalid scale: %lu" a1];

LABEL_6:
      uint64_t result = @"-INVALID-";
      break;
  }
  return result;
}

__CFString *SBSDisplayOverscanCompensationDescription(unint64_t a1)
{
  if (a1 < 3) {
    return off_1E566BE20[a1];
  }
  long long v3 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v4 = [NSString stringWithUTF8String:"NSString * _Nonnull SBSDisplayOverscanCompensationDescription(SBSDisplayOverscanCompensation)"];
  [v3 handleFailureInFunction:v4 file:@"SBSDisplayModeSettings.m" lineNumber:34 description:@"invalid compensation: %lu" a1];

  return @"-INVALID-";
}

__CFString *SBSDisplayScaleMaskDescription(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F28E78] string];
    v14[0] = 0;
    v14[1] = v14;
    _OWORD v14[2] = 0x2020000000;
    char v15 = 1;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    uint64_t v10 = __SBSDisplayScaleMaskDescription_block_invoke;
    id v11 = &unk_1E566BE00;
    uint64_t v13 = v14;
    long long v3 = v2;
    uint64_t v12 = v3;
    uint64_t v4 = v9;
    char v16 = 0;
    uint8x8_t v5 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
    v5.i16[0] = vaddlv_u8(v5);
    int v6 = v5.i32[0];
    if (v5.i32[0])
    {
      unint64_t v7 = 0;
      do
      {
        if (((1 << v7) & a1) != 0)
        {
          ((void (*)(void *))v10)(v4);
          if (v16) {
            break;
          }
          --v6;
        }
        if (v7 > 0x3E) {
          break;
        }
        ++v7;
      }
      while (v6 > 0);
    }

    _Block_object_dispose(v14, 8);
  }
  else
  {
    long long v3 = @".None";
  }
  return v3;
}

void sub_18FBE4684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __SBSDisplayScaleMaskDescription_block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [*(id *)(a1 + 32) appendString:@"|"];
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] != 1)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = [NSString stringWithUTF8String:"SBSDisplayScale _SBSDisplayScaleFromSingleBitMask(SBSDisplayScaleMask)"];
    [v10 handleFailureInFunction:v11 file:@"SBSDisplayModeSettings.m" lineNumber:39 description:@"invalid mask"];
  }
  if (a2 == 1)
  {
    uint64_t v7 = 0;
  }
  else if (a2 == 4)
  {
    uint64_t v7 = 2;
  }
  else
  {
    if (a2 != 2)
    {
      uint8x8_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      int v6 = [NSString stringWithUTF8String:"SBSDisplayScale _SBSDisplayScaleFromSingleBitMask(SBSDisplayScaleMask)"];
      [v5 handleFailureInFunction:v6 file:@"SBSDisplayModeSettings.m" lineNumber:47 description:@"invalid mask"];
    }
    uint64_t v7 = 1;
  }
  CFIndex v8 = *(void **)(a1 + 32);
  id v9 = SBSDisplayScaleDescription(v7);
  [v8 appendString:v9];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

uint64_t SBSDisplayScaleMaskFromScale(uint64_t a1)
{
  if (a1 == 3)
  {
    long long v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint8x8_t v4 = [NSString stringWithUTF8String:"SBSDisplayScaleMask SBSDisplayScaleMaskFromScale(SBSDisplayScale)"];
    [v3 handleFailureInFunction:v4 file:@"SBSDisplayModeSettings.m" lineNumber:82 description:@"invalid scale: %lu", 3];

    return 0;
  }
  else
  {
    uint64_t v1 = 1;
    if (a1 == 1) {
      uint64_t v1 = 2;
    }
    if (a1 == 2) {
      return 4;
    }
    else {
      return v1;
    }
  }
}

uint64_t FBSDisplayOverscanCompensationForDisplayValue(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >= 3)
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v3 = [NSString stringWithUTF8String:"FBSDisplayOverscanCompensation FBSDisplayOverscanCompensationForDisplayValue(SBSDisplayOverscanCompensation)"];
    [v2 handleFailureInFunction:v3 file:@"SBSDisplayModeSettings.m" lineNumber:97 description:@"invalid value: %lu" argument:v1];

    return -1;
  }
  return v1;
}

__CFString *NSStringFromSBSRemoteContentDismissType(unint64_t a1)
{
  if (a1 >= 9)
  {
    [NSString stringWithFormat:@"Unknown dismiss type (%ld)", a1];
    unint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v1 = off_1E566BE58[a1];
  }
  return v1;
}

__CFString *SBSInCallPresentationModeDescription(unint64_t a1)
{
  if (a1 > 3) {
    return @"unknown";
  }
  else {
    return off_1E566BEA0[a1];
  }
}

void sub_18FBE9070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FBE92C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18FBE9538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18FBE97A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromSBSAccidentalActivationMitigationSessionState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"initial";
  }
  else {
    return off_1E566BF10[a1 - 1];
  }
}

void __SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  objc_initWeak(&location, v3);
  uint8x8_t v5 = objc_alloc_init(SBSAppSwitcherSystemService);
  int v6 = [(SBSAbstractSystemService *)v5 client];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = ____SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion_block_invoke;
  v9[3] = &unk_1E566BF80;
  id v7 = v4;
  id v10 = v7;
  objc_copyWeak(&v12, &location);
  CFIndex v8 = v5;
  id v11 = v8;
  [v6 requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier:v7 reacquiringExistingAssertion:v3 completion:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void sub_18FBEA85C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18FBEAA04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __sb__setOverrideRunningInSpringBoard(id obj)
{
}

void ____sb__runningInSpringBoard_block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v0 = [v1 bundleIdentifier];
  __sb__runningInSpringBoard___uint64_t result = [v0 isEqualToString:@"com.apple.springboard"];
}

double __sb__mainScreenScale()
{
  uint64_t v0 = __sb__mainDisplayConfiguration();
  [v0 scale];
  double v2 = v1;

  return v2;
}

void ____sb__mainDisplayConfiguration_block_invoke()
{
  if ((__sb__runningInSpringBoard() & 1) == 0)
  {
    uint8x8_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    int v6 = [NSString stringWithUTF8String:"FBSDisplayConfiguration *__sb__mainDisplayConfiguration(void)_block_invoke"];
    [v5 handleFailureInFunction:v6 file:@"_SBSPrefixHelper.m" lineNumber:45 description:@"Must be running in SpringBoard to compute the reference bounds for SpringBoard."];
  }
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2050000000;
  uint64_t v0 = (void *)getFBDisplayManagerClass_softClass;
  uint64_t v11 = getFBDisplayManagerClass_softClass;
  if (!getFBDisplayManagerClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    _OWORD v7[2] = __getFBDisplayManagerClass_block_invoke;
    v7[3] = &unk_1E566BD10;
    void v7[4] = &v8;
    __getFBDisplayManagerClass_block_invoke((uint64_t)v7);
    uint64_t v0 = (void *)v9[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v8, 8);
  double v2 = [v1 sharedInstance];
  uint64_t v3 = [v2 mainConfiguration];
  id v4 = (void *)__sb__mainDisplayConfiguration___mainDisplayConfiguration;
  __sb__mainDisplayConfiguration___mainDisplayConfiguration = v3;
}

void sub_18FBEAEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFBDisplayManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!FrontBoardLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __FrontBoardLibraryCore_block_invoke;
    void v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E566BFC8;
    uint64_t v5 = 0;
    FrontBoardLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!FrontBoardLibraryCore_frameworkLibrary) {
    __getFBDisplayManagerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("FBDisplayManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getFBDisplayManagerClass_block_invoke_cold_2();
  }
  getFBDisplayManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FrontBoardLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FrontBoardLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_18FBEC048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18FBEF288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FBEF52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FBEF7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FBEFAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FBEFEF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FBF0060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FBF03AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18FBF04F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

unsigned char *OUTLINED_FUNCTION_6(unsigned char *result, unsigned char *a2)
{
  __CFString *result = 0;
  *a2 = 0;
  return result;
}

void sub_18FBF5ED4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

uint64_t _SBMigGetIsAlive(uint64_t a1, unsigned char *a2)
{
  *a2 = 1;
  return 0;
}

uint64_t _SBMigDisplayIdentifierForPID(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXDisplayIdentifierForPID");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _SBMigDisplayIdentifiersForPID(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXDisplayIdentifiersForPID");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v11 = a5[1];
  v13[0] = *a5;
  v13[1] = v11;
  return FunctionForSymbol(a1, a2, a3, a4, v13);
}

uint64_t _SBMigAppSwitcherServiceRegister(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXAppSwitcherServiceRegister");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v11 = a5[1];
  v13[0] = *a5;
  v13[1] = v11;
  return FunctionForSymbol(a1, a2, a3, a4, v13);
}

uint64_t _SBMigApplicationDisplayIdentifiers(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _OWORD *a6)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXApplicationDisplayIdentifiers");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v13 = a6[1];
  v15[0] = *a6;
  v15[1] = v13;
  return FunctionForSymbol(a1, a2, a3, a4, a5, v15);
}

uint64_t _SBMigFrontmostApplicationDisplayIdentifier(int a1, uint64_t a2, long long *a3)
{
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXFrontmostApplicationDisplayIdentifier");
  if (!FunctionForSymbol) {
    return 5;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v7 = a3[1];
  long long v11 = *a3;
  block[2] = ___SBMigFrontmostApplicationDisplayIdentifier_block_invoke;
  block[3] = &__block_descriptor_84_e5_v8__0l;
  int v10 = a1;
  void block[4] = FunctionForSymbol;
  block[5] = a2;
  long long v12 = v7;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  return 0;
}

uint64_t _SBMigBundlePathForDisplayIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXBundlePathForDisplayIdentifier");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _SBMigLocalizedApplicationNameForDisplayIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXLocalizedApplicationNameForDisplayIdentifier");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _SBMigSuspendFrontmostApp(int a1, long long *a2)
{
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXSuspendFrontmostApp");
  if (!FunctionForSymbol) {
    return 5;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  long long v5 = a2[1];
  long long v9 = *a2;
  _OWORD v7[2] = ___SBMigSuspendFrontmostApp_block_invoke;
  v7[3] = &__block_descriptor_76_e5_v8__0l;
  void v7[4] = FunctionForSymbol;
  int v8 = a1;
  long long v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
  return 0;
}

uint64_t _SBMigInterruptKeybagRefetch(uint64_t a1, _OWORD *a2)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXInterruptKeybagRefetch");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v5 = a2[1];
  v7[0] = *a2;
  v7[1] = v5;
  return FunctionForSymbol(a1, v7);
}

uint64_t _SBMigGetActiveInterfaceOrientation(int a1, uint64_t a2)
{
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetInterfaceOrientation");
  if (!FunctionForSymbol) {
    return 5;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___SBMigGetActiveInterfaceOrientation_block_invoke;
  block[3] = &__block_descriptor_52_e5_v8__0l;
  int v7 = a1;
  void block[4] = FunctionForSymbol;
  block[5] = a2;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  return 0;
}

uint64_t _SBMigSetWantsLockButtonEvents(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetWantsLockButtonEvents");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigPresentPowerDownUI(uint64_t a1, _OWORD *a2)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXPresentPowerDownUI");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v5 = a2[1];
  v7[0] = *a2;
  v7[1] = v5;
  return FunctionForSymbol(a1, v7);
}

uint64_t _SBMigReboot(int a1, long long *a2)
{
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXReboot");
  if (!FunctionForSymbol) {
    return 5;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  long long v5 = a2[1];
  long long v9 = *a2;
  _OWORD v7[2] = ___SBMigReboot_block_invoke;
  v7[3] = &__block_descriptor_76_e5_v8__0l;
  void v7[4] = FunctionForSymbol;
  int v8 = a1;
  long long v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
  return 0;
}

uint64_t _SBMigShutDown(int a1, long long *a2)
{
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXShutDown");
  if (!FunctionForSymbol) {
    return 5;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  long long v5 = a2[1];
  long long v9 = *a2;
  _OWORD v7[2] = ___SBMigShutDown_block_invoke;
  v7[3] = &__block_descriptor_76_e5_v8__0l;
  void v7[4] = FunctionForSymbol;
  int v8 = a1;
  long long v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
  return 0;
}

uint64_t _SBMigIsSystemApplication(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXIsSystemApplication");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _SBMigSetApplicationBadgeNumber(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetApplicationBadgeNumber");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _SBMigSetApplicationBadgeString(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetApplicationBadgeString");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _SBMigSetShowsProgress(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetShowsProgress");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigSetAllApplicationsShowProgress(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetAllApplicationsShowProgress");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigSetAllApplicationsShowSyncIndicator(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetAllApplicationsShowSyncIndicator");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigSetShowsOverridesForRecording(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetShowsOverridesForRecording");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigEnableLockScreenBundle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _OWORD *a6)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXEnableLockScreenBundle");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v13 = a6[1];
  v15[0] = *a6;
  v15[1] = v13;
  return FunctionForSymbol(a1, a2, a3, a4, a5, v15);
}

uint64_t _SBMigLockDeviceAndFeatures(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXLockDeviceAndFeatures");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _SBMigLockDevice(uint64_t a1, uint64_t a2, long long *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v5 = a3[1];
  long long v9 = *a3;
  long long v10 = v5;
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXLockDeviceAndFeatures");
  if (!FunctionForSymbol) {
    return 5;
  }
  v8[0] = v9;
  v8[1] = v10;
  return FunctionForSymbol(a1, a2, 1, v8);
}

uint64_t _SBMigShowNetworkPromptsIfNecessary(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXShowNetworkPromptsIfNecessary");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigGetCurrentBacklightFactor(int a1, _DWORD *a2)
{
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetCurrentBacklightFactor");
  if (FunctionForSymbol)
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    int v13 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    _OWORD v8[2] = ___SBMigGetCurrentBacklightFactor_block_invoke;
    v8[3] = &unk_1E566C358;
    void v8[4] = &v10;
    v8[5] = FunctionForSymbol;
    int v9 = a1;
    v8[6] = a2;
    dispatch_sync(MEMORY[0x1E4F14428], v8);
    uint64_t v5 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    BKSHIDServicesGetBacklightFactor();
    *a2 = v6;
    return 5;
  }
  return v5;
}

uint64_t _SBMigDimScreen(int a1, char a2, long long *a3)
{
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXDimScreen");
  if (!FunctionForSymbol) {
    return 5;
  }
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v7 = a3[1];
  long long v12 = *a3;
  block[2] = ___SBMigDimScreen_block_invoke;
  block[3] = &unk_1E566C380;
  void block[4] = &v15;
  block[5] = FunctionForSymbol;
  int v11 = a1;
  char v14 = a2;
  long long v13 = v7;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  uint64_t v8 = *((unsigned int *)v16 + 6);
  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t _SBMigGetBatteryAwakeTime(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXGetBatteryAwakeTime");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigGetRecentSleepsWakes(uint64_t a1, void *a2, _DWORD *a3, _OWORD *a4)
{
  *a2 = 0;
  *a3 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetRecentSleepsWakes");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return ((uint64_t (*)(uint64_t, void *, _DWORD *, _OWORD *))FunctionForSymbol)(a1, a2, a3, v11);
}

uint64_t _SBMigGetScheduledPowerEvents(uint64_t a1, void *a2, _DWORD *a3, _OWORD *a4)
{
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetScheduledPowerEvents");
  if (FunctionForSymbol)
  {
    long long v9 = a4[1];
    v11[0] = *a4;
    v11[1] = v9;
    return ((uint64_t (*)(uint64_t, void *, _DWORD *, _OWORD *))FunctionForSymbol)(a1, a2, a3, v11);
  }
  else
  {
    *a2 = 0;
    *a3 = 0;
    return 5;
  }
}

uint64_t _SBMigGetBatteryUsageTimesInSeconds(int a1, _DWORD *a2, _DWORD *a3, unsigned char *a4, unsigned char *a5, long long *a6)
{
  *a2 = 0;
  *a3 = 0;
  *a4 = 0;
  *a5 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetBatteryUsageTimesInSeconds");
  if (!FunctionForSymbol) {
    return 5;
  }
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___SBMigGetBatteryUsageTimesInSeconds_block_invoke;
  block[3] = &unk_1E566C3A8;
  void block[4] = &v20;
  block[5] = FunctionForSymbol;
  int v17 = a1;
  void block[6] = a2;
  block[7] = a3;
  void block[8] = a4;
  block[9] = a5;
  long long v13 = *a6;
  long long v19 = a6[1];
  long long v18 = v13;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  uint64_t v14 = *((unsigned int *)v21 + 6);
  _Block_object_dispose(&v20, 8);
  return v14;
}

uint64_t _SBMigAddWebClipToHomeScreen(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXAddWebClipToHomeScreen");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigRemoveWebClipFromHomeScreen(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXRemoveWebClipFromHomeScreen");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigReloadIconForIdentifier(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXReloadIconForIdentifier");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigAddDownloadingIconForDisplayIdentifier()
{
  return 5;
}

uint64_t _SBMigScrollToIconWithDisplayIdentifier()
{
  return 5;
}

uint64_t _SBMigGetNowPlayingAppBundleIdentifier(uint64_t a1, unsigned char *a2, _OWORD *a3)
{
  *a2 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetNowPlayingAppBundleIdentifier");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return ((uint64_t (*)(uint64_t, unsigned char *, _OWORD *))FunctionForSymbol)(a1, a2, v9);
}

uint64_t _SBMigGetTopButtonFrames(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _OWORD *a10)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXGetTopButtonFrames");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v19 = a10[1];
  v21[0] = *a10;
  v21[1] = v19;
  return FunctionForSymbol(a1, a2, a3, a4, a5, a6, a7, a8, a9, v21);
}

uint64_t _SBMigGetApplicationNetworkFlags(uint64_t a1, unsigned char *a2, unsigned char *a3, _OWORD *a4)
{
  *a2 = 0;
  *a3 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetApplicationNetworkFlags");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return ((uint64_t (*)(uint64_t, unsigned char *, unsigned char *, _OWORD *))FunctionForSymbol)(a1, a2, a3, v11);
}

uint64_t _SBMigGetDisplayIdentifiers(uint64_t a1, void *a2, _DWORD *a3, _OWORD *a4)
{
  *a2 = 0;
  *a3 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetDisplayIdentifiers");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return ((uint64_t (*)(uint64_t, void *, _DWORD *, _OWORD *))FunctionForSymbol)(a1, a2, a3, v11);
}

uint64_t _SBMigGetDisplayIdentifiersForExternalAccessoryProtocols(uint64_t a1, uint64_t a2, void *a3, _DWORD *a4, _OWORD *a5)
{
  *a3 = 0;
  *a4 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetDisplayIdentifiersForExternalAccessoryProtocols");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v11 = a5[1];
  v13[0] = *a5;
  v13[1] = v11;
  return ((uint64_t (*)(uint64_t, uint64_t, void *, _DWORD *, _OWORD *))FunctionForSymbol)(a1, a2, a3, a4, v13);
}

uint64_t _SBMigSetVoiceControlEnabled(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetVoiceControlEnabled");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigSetInterceptsMenuButton(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetInterceptsMenuButton");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

void *_SBMigGetMediaVolume(uint64_t a1, _DWORD *a2, _OWORD *a3)
{
  uint64_t result = SBMigGetFunctionForSymbol("_SBXXGetMediaVolume");
  if (result)
  {
    long long v7 = a3[1];
    v8[0] = *a3;
    v8[1] = v7;
    return (void *)((uint64_t (*)(uint64_t, _DWORD *, _OWORD *))result)(a1, a2, v8);
  }
  else
  {
    *a2 = 0;
  }
  return result;
}

uint64_t _SBMigSetMediaVolume(uint64_t a1, _OWORD *a2, float a3)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, _OWORD *, float))SBMigGetFunctionForSymbol("_SBXXSetMediaVolume");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v7 = a2[1];
  v9[0] = *a2;
  v9[1] = v7;
  return FunctionForSymbol(a1, v9, a3);
}

uint64_t _SBMigGetHomeScreenIconMetrics(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))SBMigGetFunctionForSymbol("_SBXXGetHomeScreenIconMetrics");
  if (!FunctionForSymbol) {
    return 5;
  }
  return FunctionForSymbol(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t _SBMigGetIconState(uint64_t a1, uint64_t a2, void *a3, _DWORD *a4, _OWORD *a5)
{
  *a3 = 0;
  *a4 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetIconState");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v11 = a5[1];
  v13[0] = *a5;
  v13[1] = v11;
  return ((uint64_t (*)(uint64_t, uint64_t, void *, _DWORD *, _OWORD *))FunctionForSymbol)(a1, a2, a3, a4, v13);
}

uint64_t _SBMigGetPendingIconState(uint64_t a1, uint64_t a2, void *a3, _DWORD *a4, _OWORD *a5)
{
  *a3 = 0;
  *a4 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetPendingIconState");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v11 = a5[1];
  v13[0] = *a5;
  v13[1] = v11;
  return ((uint64_t (*)(uint64_t, uint64_t, void *, _DWORD *, _OWORD *))FunctionForSymbol)(a1, a2, a3, a4, v13);
}

uint64_t _SBMigGetFlattenedIconState(uint64_t a1, uint64_t a2, void *a3, _DWORD *a4, _OWORD *a5)
{
  *a3 = 0;
  *a4 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetFlattenedIconState");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v11 = a5[1];
  v13[0] = *a5;
  v13[1] = v11;
  return ((uint64_t (*)(uint64_t, uint64_t, void *, _DWORD *, _OWORD *))FunctionForSymbol)(a1, a2, a3, a4, v13);
}

uint64_t _SBMigSetIconState(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetIconState");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _SBMigGetIconPNGData(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, _DWORD *a5, _OWORD *a6)
{
  *a4 = 0;
  *a5 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetIconPNGData");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v13 = a6[1];
  v15[0] = *a6;
  v15[1] = v13;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, _DWORD *, _OWORD *))FunctionForSymbol)(a1, a2, a3, a4, a5, v15);
}

uint64_t _SBMigFlashColor(uint64_t a1, float a2, float a3, float a4)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, __n128, __n128, __n128))SBMigGetFunctionForSymbol("_SBXXFlashColor");
  if (!FunctionForSymbol) {
    return 5;
  }
  v9.n128_f32[0] = a2;
  v10.n128_f32[0] = a3;
  v11.n128_f32[0] = a4;
  return FunctionForSymbol(a1, v9, v10, v11);
}

uint64_t _SBMigProgrammaticSwitchAppGestureMoveToLeft(uint64_t a1, _OWORD *a2)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXProgrammaticSwitchAppGestureMoveToLeft");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v5 = a2[1];
  v7[0] = *a2;
  v7[1] = v5;
  return FunctionForSymbol(a1, v7);
}

uint64_t _SBMigProgrammaticSwitchAppGestureMoveToRight(uint64_t a1, _OWORD *a2)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXProgrammaticSwitchAppGestureMoveToRight");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v5 = a2[1];
  v7[0] = *a2;
  v7[1] = v5;
  return FunctionForSymbol(a1, v7);
}

uint64_t _SBMigSetVoiceRecognitionAudioInputPaths(int a1, uint64_t a2, int a3, long long *a4)
{
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXSetVoiceRecognitionAudioInputPaths");
  if (!FunctionForSymbol) {
    return 5;
  }
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___SBMigSetVoiceRecognitionAudioInputPaths_block_invoke;
  v12[3] = &unk_1E566C3D0;
  void v12[4] = &v17;
  v12[5] = FunctionForSymbol;
  v12[6] = a2;
  int v13 = a1;
  int v14 = a3;
  long long v9 = a4[1];
  long long v15 = *a4;
  long long v16 = v9;
  dispatch_sync(MEMORY[0x1E4F14428], v12);
  uint64_t v10 = *((unsigned int *)v18 + 6);
  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t _SBMigSetAssistantRecognitionStrings(int a1, uint64_t a2, int a3, long long *a4)
{
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXSetAssistantRecognitionStrings");
  if (!FunctionForSymbol) {
    return 5;
  }
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___SBMigSetAssistantRecognitionStrings_block_invoke;
  v12[3] = &unk_1E566C3D0;
  void v12[4] = &v17;
  v12[5] = FunctionForSymbol;
  v12[6] = a2;
  int v13 = a1;
  int v14 = a3;
  long long v9 = a4[1];
  long long v15 = *a4;
  long long v16 = v9;
  dispatch_sync(MEMORY[0x1E4F14428], v12);
  uint64_t v10 = *((unsigned int *)v18 + 6);
  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t _SBMigSetAlertSuppressionContextsBySectionIdentifier(int a1, uint64_t a2, int a3, long long *a4)
{
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXSetAlertSuppressionContextsBySectionIdentifier");
  if (!FunctionForSymbol) {
    return 5;
  }
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___SBMigSetAlertSuppressionContextsBySectionIdentifier_block_invoke;
  v12[3] = &unk_1E566C3D0;
  void v12[4] = &v17;
  v12[5] = FunctionForSymbol;
  v12[6] = a2;
  int v13 = a1;
  int v14 = a3;
  long long v9 = a4[1];
  long long v15 = *a4;
  long long v16 = v9;
  dispatch_sync(MEMORY[0x1E4F14428], v12);
  uint64_t v10 = *((unsigned int *)v18 + 6);
  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t _SBMigSetAppIsConnectedToEA(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetAppIsConnectedToEA");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _SBMigGetWallpaperPreviewSurface(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, _OWORD *a6, double a7)
{
  *a5 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetWallpaperPreviewSurface");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v15 = a6[1];
  v17[0] = *a6;
  v17[1] = v15;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *, _OWORD *, double))FunctionForSymbol)(a1, a2, a3, a4, a5, v17, a7);
}

uint64_t _SBMigGetWallpaperPreview(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _DWORD *a7, _OWORD *a8, double a9)
{
  *a7 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetWallpaperPreview");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v19 = a8[1];
  v21[0] = *a8;
  v21[1] = v19;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *, _OWORD *, double))FunctionForSymbol)(a1, a2, a3, a4, a5, a6, a7, v21, a9);
}

uint64_t _SBMigSetWallpaperOptionsForLocations(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7, _OWORD *a8, float a9, float a10, float a11, float a12, float a13, float a14, double a15)
{
  *a7 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXSetWallpaperOptionsForLocations");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v31 = a8[1];
  v33[0] = *a8;
  v33[1] = v31;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned char *, _OWORD *, float, float, float, float, float, float, double))FunctionForSymbol)(a1, a2, a3, a4, a5, a6, a7, v33, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t _SBMigActivateAssistantWithContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t))SBMigGetFunctionForSymbol("_SBXXActivateAssistantWithContext");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v11 = a5[1];
  v13[0] = *a5;
  v13[1] = v11;
  return FunctionForSymbol(a1, v13, a2, a3, a4);
}

uint64_t _SBMigSetProceduralWallpaper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _OWORD *a6)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetProceduralWallpaper");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v13 = a6[1];
  v15[0] = *a6;
  v15[1] = v13;
  return FunctionForSymbol(a1, a2, a3, a4, a5, v15);
}

uint64_t _SBMigSetWallpaperImageForLocations(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9, float a10, float a11, float a12, float a13, float a14, double a15, char a16, unsigned __int8 a17, unsigned __int8 a18, uint64_t a19, int a20,unsigned char *a21,_OWORD *a22)
{
  *a21 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXSetWallpaperImageForLocations");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v38 = a22[1];
  v41[0] = *a22;
  v41[1] = v38;
  *(_WORD *)((char *)&v40 + 1) = __PAIR16__(a18, a17);
  LOBYTE(v40) = a16;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, float, float, float, float, float, float, double, int, uint64_t, int, unsigned char *, _OWORD *))FunctionForSymbol)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, v40, a19, a20, a21,
           v41);
}

uint64_t _SBMigSetWallpaperImageSurfaceForLocations(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9, float a10, float a11, float a12, float a13, float a14, double a15, char a16, unsigned __int8 a17, unsigned __int8 a18, uint64_t a19, char a20,unsigned __int8 a21,unsigned __int8 a22,uint64_t a23,int a24,unsigned char *a25,_OWORD *a26)
{
  *a25 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXSetWallpaperImageSurfaceForLocations");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v42 = a26[1];
  v46[0] = *a26;
  v46[1] = v42;
  *(_WORD *)((char *)&v45 + 1) = __PAIR16__(a22, a21);
  LOBYTE(v45) = a20;
  *(_WORD *)((char *)&v44 + 1) = __PAIR16__(a18, a17);
  LOBYTE(v44) = a16;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, float, float, float, float, float, float, double, int, uint64_t, int, uint64_t, int, unsigned char *, _OWORD *))FunctionForSymbol)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, v44, a19, v45, a23,
           a24,
           a25,
           v46);
}

uint64_t _SBMigClearWallpaperAsset(uint64_t a1, unsigned char *a2, _OWORD *a3)
{
  *a2 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXClearWallpaperAsset");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return ((uint64_t (*)(uint64_t, unsigned char *, _OWORD *))FunctionForSymbol)(a1, a2, v9);
}

uint64_t _SBMigGetWallpaperOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _OWORD *a15)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXGetWallpaperOptions");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v24 = a15[1];
  v26[0] = *a15;
  v26[1] = v24;
  return FunctionForSymbol(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, v26);
}

uint64_t _SBMigSetWallpaperVariant(uint64_t a1, uint64_t a2, unsigned char *a3, _OWORD *a4)
{
  *a3 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXSetWallpaperVariant");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return ((uint64_t (*)(uint64_t, uint64_t, unsigned char *, _OWORD *))FunctionForSymbol)(a1, a2, a3, v11);
}

uint64_t _SBMigGetWallpaperLegibilitySettings(uint64_t a1, uint64_t a2, void *a3, _DWORD *a4, _OWORD *a5)
{
  *a3 = 0;
  *a4 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetWallpaperLegibilitySettings");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v11 = a5[1];
  v13[0] = *a5;
  v13[1] = v11;
  return ((uint64_t (*)(uint64_t, uint64_t, void *, _DWORD *, _OWORD *))FunctionForSymbol)(a1, a2, a3, a4, v13);
}

uint64_t _SBMigAddAlertItemsSuppressionAssertion(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXAddAlertItemsSuppressionAssertion");
  if (FunctionForSymbol)
  {
    long long v9 = FunctionForSymbol;
    if (BSMachPortIsType())
    {
      long long v10 = a4[1];
      v13[0] = *a4;
      v13[1] = v10;
      return v9(a1, a2, a3, v13);
    }
    long long v12 = SBLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      _SBMigAddAlertItemsSuppressionAssertion_cold_1(v12);
    }
  }
  return 5;
}

uint64_t _SBMigSetTypingActive(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetTypingActive");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigTagTouchForTypingMenu(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXTagTouchForTypingMenu");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigAcquireFocusPreventingFullScreenPresentationAssertion(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXAcquireFocusPreventingFullScreenPresentationAssertion");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

void *_SBMigIsReachabilityEnabled(uint64_t a1, unsigned char *a2, _OWORD *a3)
{
  *a2 = 0;
  uint64_t result = SBMigGetFunctionForSymbol("_SBXXIsReachabilityEnabled");
  if (result)
  {
    long long v7 = a3[1];
    v8[0] = *a3;
    v8[1] = v7;
    return (void *)((uint64_t (*)(uint64_t, unsigned char *, _OWORD *))result)(a1, a2, v8);
  }
  return result;
}

uint64_t _SBMigSetReachabilityEnabled(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetReachabilityEnabled");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigOverrideDisplayedDate(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXOverrideDisplayedDate");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigSetIdleText(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetIdleText");
  if (!FunctionForSymbol) {
    return 5;
  }
  long long v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t SBSSetStatusBarShowsActivity(uint64_t a1)
{
  uint64_t v2 = SBSSpringBoardServerPort();
  return SBSetShowsProgress(v2, a1);
}

void SBSSetAllApplicationsShowProgress(int a1, int a2)
{
  long long v4 = (void *)MEMORY[0x192FC0BD0]();
  _SBSRestartLock();
  long long v5 = _SBSRestartGetInfoForIdentifier(@"SBSSetAllApplicationsShowProgress");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = [v5 unsignedIntegerValue];
  }
  else {
    uint64_t v6 = 0;
  }
  if (v6 == (a1 == 0))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __SBSSetAllApplicationsShowProgress_block_invoke;
    v12[3] = &__block_descriptor_37_e5_v8__0l;
    char v14 = a1;
    int v13 = a2;
    uint64_t v7 = MEMORY[0x192FC0DF0](v12);
    uint64_t v8 = (void (**)(void))v7;
    if (a1) {
      long long v9 = (void *)v7;
    }
    else {
      long long v9 = 0;
    }
    _SBSRestartScheduleBlockForIdentifier(@"SBSSetAllApplicationsShowProgress", v9);
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (a1) {
    uint64_t v10 = v6 + 1;
  }
  else {
    uint64_t v10 = v6 - 1;
  }
  if (v10) {
    long long v11 = (const void *)[MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:];
  }
  else {
    long long v11 = 0;
  }
  _SBSRestartSetInfoForIdentifier(@"SBSSetAllApplicationsShowProgress", v11);
  if (v8) {
    v8[2](v8);
  }
  _SBSRestartUnlock();
}

uint64_t __SBSSetAllApplicationsShowProgress_block_invoke(uint64_t a1)
{
  uint64_t v2 = SBSSpringBoardServerPort();
  uint64_t v3 = *(unsigned __int8 *)(a1 + 36);
  uint64_t v4 = *(unsigned int *)(a1 + 32);
  return SBSetAllApplicationsShowProgress(v2, v3, v4);
}

void SBSSetStatusBarShowsSyncActivity(int a1, int a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __SBSSetStatusBarShowsSyncActivity_block_invoke;
  v5[3] = &__block_descriptor_37_e5_v8__0l;
  char v7 = a1;
  int v6 = a2;
  uint64_t v3 = (void (**)(void))MEMORY[0x192FC0DF0](v5);
  _SBSRestartLock();
  if (a1) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  _SBSRestartScheduleBlockForIdentifier(@"SBSSetStatusBarShowsSyncActivity", v4);
  v3[2](v3);
  _SBSRestartUnlock();
}

uint64_t __SBSSetStatusBarShowsSyncActivity_block_invoke(uint64_t a1)
{
  uint64_t v2 = SBSSpringBoardServerPort();
  uint64_t v3 = *(unsigned __int8 *)(a1 + 36);
  uint64_t v4 = *(unsigned int *)(a1 + 32);
  return SBSetAllApplicationsShowSyncIndicator(v2, v3, v4);
}

void SBSSetStatusBarShowsOverridesForRecording(int a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __SBSSetStatusBarShowsOverridesForRecording_block_invoke;
  v4[3] = &__block_descriptor_33_e5_v8__0l;
  char v5 = a1;
  uint64_t v2 = (void (**)(void))MEMORY[0x192FC0DF0](v4);
  _SBSRestartLock();
  if (a1) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  _SBSRestartScheduleBlockForIdentifier(@"SBSSetStatusBarOverridesForRecording", v3);
  v2[2](v2);
  _SBSRestartUnlock();
}

uint64_t __SBSSetStatusBarShowsOverridesForRecording_block_invoke(uint64_t a1)
{
  uint64_t v2 = SBSSpringBoardServerPort();
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  return SBSetShowsOverridesForRecording(v2, v3);
}

uint64_t SBSAlertItemsSuppressionAssertionGetTypeID()
{
  if (SBSAlertItemsSuppressionAssertionGetTypeID_once != -1) {
    dispatch_once(&SBSAlertItemsSuppressionAssertionGetTypeID_once, &__block_literal_global_26);
  }
  return SBSAlertItemsSuppressionAssertionGetTypeID_typeID;
}

uint64_t __SBSAlertItemsSuppressionAssertionGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  SBSAlertItemsSuppressionAssertionGetTypeID_typeID = result;
  return result;
}

uint64_t SBSAlertItemsSuppressionAssertionDestroy(uint64_t a1)
{
  uint64_t v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  mach_port_name_t v3 = *(_DWORD *)(a1 + 80);
  if (v3 + 1 >= 2)
  {
    mach_port_mod_refs(*MEMORY[0x1E4F14960], v3, 1u, -1);
    *(_DWORD *)(a1 + 80) = 0;
    uint64_t v4 = *(const void **)(a1 + 88);
    if (v4) {
      CFRelease(v4);
    }
  }
  return pthread_mutex_unlock(v2);
}

BOOL SBSAlertItemsSuppressionAssertionEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef SBSAlertItemsSuppressionAssertionDescribe(void *cf)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  memset(v20, 0, sizeof(v20));
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  long long v12 = 0u;
  long long v11 = 0u;
  long long v10 = 0u;
  long long v9 = 0u;
  long long v8 = 0u;
  long long v7 = 0u;
  long long v6 = 0u;
  char buffer = 48;
  CFStringRef v2 = (const __CFString *)cf[11];
  if (v2) {
    CFStringGetCString(v2, &buffer, 256, 0x8000100u);
  }
  CFAllocatorRef v3 = CFGetAllocator(cf);
  return CFStringCreateWithFormat(v3, 0, @"<SBSAlertItemsSuppressionAssertion %p: reason='%s'>", cf, &buffer);
}

uint64_t SBSAlertItemsSuppressionAssertionCreate(const __CFAllocator *a1, const __CFString *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (SBSAlertItemsSuppressionAssertionGetTypeID_once != -1) {
    dispatch_once(&SBSAlertItemsSuppressionAssertionGetTypeID_once, &__block_literal_global_26);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  *(void *)(Instance + 16) = 850045863;
  *(_OWORD *)(Instance + 24) = 0u;
  *(_OWORD *)(Instance + 40) = 0u;
  *(_OWORD *)(Instance + 56) = 0u;
  *(void *)(Instance + 72) = 0;
  if (a2) {
    CFStringRef Copy = CFStringCreateCopy(a1, a2);
  }
  else {
    CFStringRef Copy = 0;
  }
  *(void *)(Instance + 88) = Copy;
  mach_port_name_t name = 0;
  if (mach_port_allocate(*MEMORY[0x1E4F14960], 1u, &name))
  {
    SBSSpringBoardServerPort();
LABEL_9:
    CFRelease((CFTypeRef)Instance);
    return 0;
  }
  *(_DWORD *)(Instance + 80) = name;
  uint64_t v6 = SBSSpringBoardServerPort();
  if ((v6 + 1) < 2) {
    goto LABEL_9;
  }
  uint64_t v8 = v6;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  *(_OWORD *)char buffer = 0u;
  long long v11 = 0u;
  if (!CFStringGetCString(a2, buffer, 1024, 0x8000100u)
    || SBAddAlertItemsSuppressionAssertion(v8, buffer, name))
  {
    goto LABEL_9;
  }
  return Instance;
}

void sub_18FBF9E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18FBFA3E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *SBSRemoteAlertHandleInvalidationErrorDescription(unint64_t a1)
{
  if (a1 > 8) {
    return @"invalidated due to unknown reason";
  }
  else {
    return off_1E566C730[a1];
  }
}

uint64_t SBSRemoteAlertHandleInvalidationErrorCodeForInvalidationReason(unint64_t a1)
{
  if (a1 > 5) {
    return 1;
  }
  else {
    return qword_18FC48DF8[a1];
  }
}

__CFString *SBSHearingTestModeDescription(uint64_t a1)
{
  if (a1) {
    return @"active";
  }
  else {
    return @"inactive";
  }
}

void sub_18FBFC0BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_18FBFC8A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FBFD25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FBFDB2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FBFF3C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FBFF608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FBFF850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FBFFA98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FBFFE18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FC000C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FC004A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FC006A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *SBSStringFromWebClipServiceLaunchOrigin(unint64_t a1)
{
  if (a1 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E566CA18[a1];
  }
}

void sub_18FC053CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18FC056A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id SBSCreateOpenApplicationServiceEndpoint()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F50BB8];
  id v1 = [MEMORY[0x1E4F629E0] serviceName];
  uint64_t v2 = [v0 endpointForMachName:@"com.apple.frontboard.systemappservices" service:v1 instance:0];

  return v2;
}

uint64_t SBSCreateOpenApplicationService()
{
  return [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
}

uint64_t SBSApplicationTerminationAssertionGetTypeID()
{
  if (SBSApplicationTerminationAssertionGetTypeID_pred != -1) {
    dispatch_once(&SBSApplicationTerminationAssertionGetTypeID_pred, &__block_literal_global_34);
  }
  return SBSApplicationTerminationAssertionGetTypeID_typeID;
}

uint64_t SBSApplicationTerminationAssertionEqual(id *a1, void *a2)
{
  CFTypeID v4 = CFGetTypeID(a1);
  uint64_t v5 = v4 == CFGetTypeID(a2);
  if (SBSApplicationTerminationAssertionGetTypeID_pred != -1) {
    dispatch_once(&SBSApplicationTerminationAssertionGetTypeID_pred, &__block_literal_global_34);
  }
  if (SBSApplicationTerminationAssertionGetTypeID_typeID == v5) {
    return [a1[2] isEqual:a2[2]];
  }
  else {
    return 0;
  }
}

uint64_t SBSApplicationTerminationAssertionHash(uint64_t a1)
{
  return [*(id *)(a1 + 16) hash];
}

CFStringRef SBSApplicationTerminationAssertionCopyDebugDescription(uint64_t a1)
{
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = [*(id *)(a1 + 16) isValid];
  uint64_t v5 = @"false";
  if (v4) {
    uint64_t v5 = @"true";
  }
  return CFStringCreateWithFormat(v2, 0, @"<SBSApplicationTerminationAssertion %p> identifier = %@, valid = %@", a1, v3, v5);
}

uint64_t __SBSApplicationTerminationAssertionGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  SBSApplicationTerminationAssertionGetTypeID_typeID = result;
  return result;
}

void *SBSApplicationTerminationAssertionCreate(uint64_t a1, const void *a2, int a3)
{
  return SBSApplicationTerminationAssertionCreateWithError(a1, a2, a3, 0);
}

void *SBSApplicationTerminationAssertionCreateWithError(uint64_t a1, const void *a2, int a3, unsigned char *a4)
{
  if (SBSApplicationTerminationAssertionGetTypeID_pred != -1) {
    dispatch_once(&SBSApplicationTerminationAssertionGetTypeID_pred, &__block_literal_global_34);
  }
  uint64_t Instance = (void *)_CFRuntimeCreateInstance();
  if (Instance)
  {
    if (a3) {
      unsigned int v8 = 20;
    }
    else {
      unsigned int v8 = 30;
    }
    if (a3 == 255) {
      uint64_t v9 = 40;
    }
    else {
      uint64_t v9 = v8;
    }
    long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F96488]) initWithExplanation:@"SBSApplicationTerminationAssertion"];
    [v10 setReportType:0];
    [v10 setExceptionCode:95805101];
    [v10 setExceptionDomain:0];
    [v10 setMaximumTerminationResistance:v9];
    uint64_t v11 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:a2];
    long long v12 = (void *)[objc_alloc(MEMORY[0x1E4F96498]) initWithPredicate:v11 context:v10];
    id v17 = 0;
    int v13 = [v12 acquireWithError:&v17];

    if (v13)
    {
      Instance[2] = v12;
      CFTypeRef v14 = CFRetain(a2);
      int v15 = 0;
      Instance[3] = v14;
      if (!a4) {
        goto LABEL_15;
      }
    }
    else
    {
      [v12 invalidate];

      if ([v17 code] == 4) {
        int v15 = 1;
      }
      else {
        int v15 = 4;
      }
      if (!a4) {
        goto LABEL_15;
      }
    }
    goto LABEL_14;
  }
  int v15 = 4;
  if (a4) {
LABEL_14:
  }
    *a4 = v15;
LABEL_15:
  if (Instance && v15)
  {
    CFRelease(Instance);
    return 0;
  }
  return Instance;
}

uint64_t SBSApplicationTerminationAssertionGetDisplayIdentifier(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t SBSApplicationTerminationAssertionGetIsValid(uint64_t a1)
{
  return [*(id *)(a1 + 16) isValid];
}

void SBSApplicationTerminationAssertionInvalidate(uint64_t a1)
{
  [*(id *)(a1 + 16) invalidate];

  *(void *)(a1 + 16) = 0;
  CFAllocatorRef v2 = *(const void **)(a1 + 24);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 24) = 0;
  }
}

__CFString *SBSApplicationTerminationAssertionErrorString(unsigned int a1)
{
  if (a1 > 4) {
    return @"unknown error";
  }
  else {
    return off_1E566CBA0[(char)a1];
  }
}

void sub_18FC082AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

uint64_t SBSSystemApertureRootWindowRequestPortalSource(uint64_t a1)
{
  return +[SBSSystemAperturePortalSourceInfoRequest rootWindowPortalSourceWithCompletion:a1];
}

uint64_t SBSDiffSystemNotesPresentationConfigurations(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  uint64_t v6 = 15;
  if (v3 && v4)
  {
    long long v7 = [v3 sceneBundleIdentifier];
    unsigned int v8 = [v5 sceneBundleIdentifier];
    int v9 = [v7 isEqual:v8];

    uint64_t v10 = [v3 preferredPresentationMode];
    if (v10 == [v5 preferredPresentationMode]) {
      uint64_t v11 = v9 ^ 1u;
    }
    else {
      uint64_t v11 = v9 ^ 1u | 2;
    }
    long long v12 = [v3 userActivity];
    int v13 = [v5 userActivity];
    if ([v12 isEqual:v13])
    {
    }
    else
    {
      CFTypeRef v14 = [v3 userActivity];
      if (v14)
      {
        BOOL v15 = 1;
      }
      else
      {
        long long v16 = [v5 userActivity];
        BOOL v15 = v16 != 0;
      }
      if (v15) {
        v11 |= 4uLL;
      }
    }
    id v17 = [v3 identifier];
    long long v18 = [v5 identifier];
    int v19 = [v17 isEqual:v18];

    if (v19) {
      uint64_t v6 = v11;
    }
    else {
      uint64_t v6 = v11 | 8;
    }
  }

  return v6;
}

__CFString *NSStringFromSBSMultitaskingApplicationSupportedShortcutActionMask(char a1)
{
  CFAllocatorRef v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = v2;
  if (a1)
  {
    [v2 addObject:@"fullscreen"];
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"leftSplit"];
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  [v3 addObject:@"rightSplit"];
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_12:
  [v3 addObject:@"allWindows"];
  if ((a1 & 0x10) != 0) {
LABEL_6:
  }
    [v3 addObject:@"addToWindowSet"];
LABEL_7:
  if ([v3 count])
  {
    id v4 = [v3 componentsJoinedByString:@", "];
  }
  else
  {
    id v4 = @"none";
  }

  return v4;
}

void sub_18FC09804(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

__CFString *SBSSystemNotesConnectionSourceDescription(unint64_t a1)
{
  if (a1 >= 3)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"NSString * _Nonnull SBSSystemNotesConnectionSourceDescription(SBSSystemNotesSceneConnectionSource)"];
    [v3 handleFailureInFunction:v4, @"SBSSystemNotesSceneConnectionSource.m", 12, @"Invalid parameter not satisfying: %@", @"source < SBSSystemNotesSceneConnectionSourceCount" file lineNumber description];
  }
  if (a1 > 2) {
    return @"-unknown-";
  }
  else {
    return (__CFString *)*((void *)&off_1E566CCE0 + a1);
  }
}

void _SBSRestarted()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x192FC0BD0]();
  _SBSRestartLock();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  id v1 = [[__SBSRestartBlocks allValues] copy];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5++) + 16))();
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }

  [(id)__SBSRestartLock unlock];
}

void SBSSetAlertSuppressionContextsBySectionIdentifier(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)MEMORY[0x192FC0BD0]();
  uint64_t v3 = [MEMORY[0x1E4F1C9B8] data];
  if (v1)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:[v1 count]];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    _OWORD v9[2] = __SBSSetAlertSuppressionContextsBySectionIdentifier_block_invoke;
    v9[3] = &unk_1E566B310;
    id v10 = v4;
    id v5 = v4;
    [v1 enumerateKeysAndObjectsUsingBlock:v9];
    uint64_t v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:200 options:0 error:0];

    uint64_t v3 = (void *)v6;
  }
  uint64_t v7 = SBSSpringBoardServerPort();
  id v8 = v3;
  SBSetAlertSuppressionContextsBySectionIdentifier(v7, [v8 bytes], [v8 length]);
}

void __SBSSetAlertSuppressionContextsBySectionIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 allObjects];
  [v4 setObject:v6 forKey:v5];
}

__CFString *secureAppTypeName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xD) {
    return @"SBSSecureAppTypeNone";
  }
  else {
    return (__CFString *)*((void *)&off_1E566CD88 + a1 - 1);
  }
}

uint64_t SBSSecureAppTypeForIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.calculator"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"com.apple.mobiletimer"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"com.apple.mobilenotes"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"com.apple.camera"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"com.apple.Magnifier"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"com.apple.Maps"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"com.apple.purplebuddy"])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:@"com.apple.VoiceMemos"])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:@"com.apple.TVRemoteUIService"])
  {
    uint64_t v2 = 12;
  }
  else if ([v1 isEqualToString:@"com.apple.VirtualDisplayTest"])
  {
    uint64_t v2 = 13;
  }
  else if ([v1 isEqualToString:@"com.apple.sidecar"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"com.apple.ContinuityCaptureShieldUI"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"com.apple.BarcodeScanner"])
  {
    uint64_t v2 = 8;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t SBSIdentifierForSecureAppType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xC) {
    return 0;
  }
  else {
    return *((void *)&off_1E566CDF8 + a1 - 1);
  }
}

__CFString *SBSDisplayLayoutBacklightTransitionReasonForBacklightChangeSource(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x30) {
    return 0;
  }
  else {
    return off_1E566D1A8[a1 - 1];
  }
}

id SBSDisplayLayoutTransitionReasonForSourceApplication(void *a1)
{
  if (a1)
  {
    a1 = [NSString stringWithFormat:@"%@%@", @"SBSourceApplication:", a1];
    uint64_t v1 = vars8;
  }
  return a1;
}

id SBSDisplayLayoutTransitionSourceApplicationFromReason(void *a1)
{
  id v1 = a1;
  if ([v1 hasPrefix:@"SBSourceApplication:"])
  {
    uint64_t v2 = [v1 substringFromIndex:SBSourceApplication.length];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

double SBSConvertPointFromDisplayToNeighboringDisplay(void *a1, double a2, uint64_t a3, void *a4)
{
  id v6 = a1;
  id v7 = a4;
  id v8 = [v6 hardwareIdentifier];
  if (v8) {
    int v9 = 0;
  }
  else {
    int v9 = [v6 isMainDisplay];
  }

  id v10 = [v7 hardwareIdentifier];
  if (!v10)
  {
    if (v9 != [v7 isMainDisplay]) {
      goto LABEL_6;
    }
LABEL_9:
    a2 = 1.79769313e308;
    goto LABEL_48;
  }

  if ((v9 & 1) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  if (__sb__runningInSpringBoard())
  {
    uint64_t v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  else
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.springboard"];
  }
  long long v12 = v11;
  int v13 = [v11 objectForKey:@"SBExternalDisplayArrangementEdge"];
  CFTypeRef v14 = v13;
  if (v13) {
    int v15 = [v13 unsignedIntValue];
  }
  else {
    int v15 = 1;
  }
  if (v9) {
    long long v16 = v6;
  }
  else {
    long long v16 = v7;
  }
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  if (BSInterfaceOrientationIsLandscape() && v18 < v20
    || BSInterfaceOrientationIsPortrait() && v20 < v18)
  {
    double v21 = v18;
  }
  else
  {
    double v21 = v20;
    double v20 = v18;
  }
  if (v9) {
    long long v22 = v7;
  }
  else {
    long long v22 = v6;
  }
  [v22 bounds];
  double v24 = v23;
  double v26 = v25;
  if (BSInterfaceOrientationIsLandscape() && v24 < v26
    || BSInterfaceOrientationIsPortrait() && v26 < v24)
  {
    double v27 = v26;
  }
  else
  {
    double v27 = v24;
    double v24 = v26;
  }
  double v28 = v21 - v24;
  if ((v15 & 0xFFFFFFFD) == 1) {
    double v28 = v20 - v27;
  }
  double v29 = fabs(v28 * 0.5);
  switch(v15)
  {
    case 0:
      if (!v9) {
        double v27 = -v27;
      }
      goto LABEL_43;
    case 1:
      double v30 = -v29;
      if (v9) {
        double v30 = v29;
      }
      a2 = a2 + v30;
      break;
    case 2:
      double v27 = -v20;
      if (!v9) {
        double v27 = v20;
      }
LABEL_43:
      a2 = a2 + v27;
      break;
    case 3:
      double v31 = -v29;
      if (v9) {
        double v31 = v29;
      }
      a2 = a2 + v31;
      break;
    default:
      break;
  }

LABEL_48:
  return a2;
}

void SBSConvertRectFromDisplayToNeighboringDisplay(void *a1, uint64_t a2, void *a3, double a4)
{
}

BOOL SBSRectOnDisplayIntersectsNeighboringDisplay(void *a1, uint64_t a2, void *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13 = a1;
  id v14 = a3;
  int v15 = [v13 hardwareIdentifier];
  if (v15) {
    int v16 = 0;
  }
  else {
    int v16 = [v13 isMainDisplay];
  }

  double v17 = [v14 hardwareIdentifier];
  if (v17) {
    int v18 = 0;
  }
  else {
    int v18 = [v14 isMainDisplay];
  }

  if (v18 == v16) {
    goto LABEL_40;
  }
  id v19 = v16 ? v13 : v14;
  [v19 bounds];
  uint64_t v62 = v20;
  double v22 = v21;
  double v24 = v23;
  CGFloat v60 = a7;
  uint64_t v61 = v25;
  CGFloat v58 = a5;
  CGFloat v59 = a6;
  if (BSInterfaceOrientationIsLandscape())
  {
    if (v22 < v24) {
      goto LABEL_15;
    }
  }
  if (BSInterfaceOrientationIsPortrait() && v24 < v22)
  {
LABEL_15:
    double v26 = v24;
  }
  else
  {
    double v26 = v22;
    double v22 = v24;
  }
  id v27 = v16 ? v14 : v13;
  [v27 bounds];
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  double v33 = v32;
  double v35 = v34;
  int IsLandscape = BSInterfaceOrientationIsLandscape();
  double v37 = v33;
  if (IsLandscape)
  {
    if (v33 < v35) {
      goto LABEL_24;
    }
  }
  double v38 = v33;
  if (BSInterfaceOrientationIsPortrait() && (double v37 = v33, v35 < v33)) {
LABEL_24:
  }
    double v38 = v35;
  else {
    double v37 = v35;
  }
  double v39 = v16 ? v22 : v37;
  double v40 = v16 ? v26 : v38;
  double v57 = v26;
  uint64_t v41 = v16 ? v61 : v31;
  uint64_t v56 = v31;
  uint64_t v42 = v29;
  uint64_t v43 = v16 ? v62 : v29;
  v63.origin.CGFloat x = a4;
  double v44 = v38;
  v63.origin.CGFloat y = v58;
  double v45 = v37;
  v63.size.CGFloat width = v59;
  v63.size.CGFloat height = v60;
  if (!CGRectIntersectsRect(v63, *(CGRect *)(&v39 - 3))
    || (SBSConvertRectFromDisplayToNeighboringDisplay(v13, a2, v14, a4),
        CGFloat x = v64.origin.x,
        CGFloat y = v64.origin.y,
        CGFloat width = v64.size.width,
        CGFloat height = v64.size.height,
        CGRectIsNull(v64)))
  {
LABEL_40:
    BOOL v50 = 0;
  }
  else
  {
    if (v16) {
      double v52 = v45;
    }
    else {
      double v52 = v22;
    }
    if (v16) {
      double v53 = v44;
    }
    else {
      double v53 = v57;
    }
    if (v16) {
      uint64_t v54 = v56;
    }
    else {
      uint64_t v54 = v61;
    }
    if (v16) {
      uint64_t v55 = v42;
    }
    else {
      uint64_t v55 = v62;
    }
    v65.origin.CGFloat x = x;
    v65.origin.CGFloat y = y;
    v65.size.CGFloat width = width;
    v65.size.CGFloat height = height;
    BOOL v50 = CGRectIntersectsRect(v65, *(CGRect *)(&v52 - 3));
  }

  return v50;
}

uint64_t SBSDisplayEdgeAdjacentToNeighboringDisplay(void *a1)
{
  id v1 = a1;
  if (__sb__runningInSpringBoard())
  {
    uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  else
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.springboard"];
  }
  uint64_t v3 = v2;
  uint64_t v4 = [v2 objectForKey:@"SBExternalDisplayArrangementEdge"];
  id v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 unsignedIntValue];
  }
  else {
    uint64_t v6 = 1;
  }
  id v7 = [v1 hardwareIdentifier];
  if (v7)
  {
  }
  else if ([v1 isMainDisplay])
  {
    goto LABEL_13;
  }
  if ((v6 - 1) > 2) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = dword_18FC48E40[(int)v6 - 1];
  }
LABEL_13:

  return v6;
}

__CFString *SBSSystemNotesPresentationModeDescription(uint64_t a1)
{
  id v1 = @"unknown";
  if (!a1) {
    id v1 = @"floating-window";
  }
  if (a1 == 1) {
    return @"minimized";
  }
  else {
    return v1;
  }
}

BOOL SBSSystemNotesPresentationModeIsValid(unint64_t a1)
{
  return a1 < 2;
}

__CFString *SBSSystemNotesCreateReasonDescription(unint64_t a1)
{
  if (a1 >= 3)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"NSString * _Nonnull SBSSystemNotesCreateReasonDescription(SBSSystemNotesCreateReason)"];
    [v3 handleFailureInFunction:v4, @"SBSSystemNotesCreateReason.m", 12, @"Invalid parameter not satisfying: %@", @"reason >= SBSSystemNotesCreateReasonInvalid && reason <= SBSSystemNotesCreateReasonCount" file lineNumber description];
  }
  if (a1 > 2) {
    return @"-unknown-";
  }
  else {
    return off_1E566D338[a1];
  }
}

uint64_t SBCardItemsControllerClientInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDF660F0];
}

id SBCardItemsControllerServerInterface()
{
  _OWORD v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDF6C4D8];
  id v1 = (void *)MEMORY[0x1E4F1CAD0];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v3 = [v1 setWithArray:v2];
  [v0 setClasses:v3 forSelector:sel_setCardItems_forControllerWithIdentifier_ argumentIndex:0 ofReply:0];

  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  uint64_t v6 = [v4 setWithArray:v5];
  [v0 setClasses:v6 forSelector:sel_getCardItemsForControllerWithIdentifier_withHandler_ argumentIndex:0 ofReply:1];

  return v0;
}

void sub_18FC0F4E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SystemStatusLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = SystemStatusLibraryCore_frameworkLibrary;
  uint64_t v5 = SystemStatusLibraryCore_frameworkLibrary;
  if (!SystemStatusLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E566D458;
    long long v7 = *(_OWORD *)&off_1E566D468;
    v3[3] = _sl_dlopen();
    SystemStatusLibraryCore_frameworkLibrarCGFloat y = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18FC0FCE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SystemStatusLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  SystemStatusLibraryCore_frameworkLibrarCGFloat y = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SystemStatusLibrary()
{
  id v1 = 0;
  uint64_t result = SystemStatusLibraryCore();
  if (!result) {
    SystemStatusLibrary_cold_1(&v1);
  }
  return result;
}

uint64_t getSTBackgroundActivityIdentifierBackgroundLocationSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getSTBackgroundActivityIdentifierBackgroundLocationSymbolLoc_ptr;
  uint64_t v6 = getSTBackgroundActivityIdentifierBackgroundLocationSymbolLoc_ptr;
  if (!getSTBackgroundActivityIdentifierBackgroundLocationSymbolLoc_ptr)
  {
    id v1 = (void *)SystemStatusLibrary();
    v4[3] = (uint64_t)dlsym(v1, "STBackgroundActivityIdentifierBackgroundLocation");
    getSTBackgroundActivityIdentifierBackgroundLocationSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18FC0FEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSTBackgroundActivityIdentifierBackgroundLocationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SystemStatusLibrary();
  uint64_t result = dlsym(v2, "STBackgroundActivityIdentifierBackgroundLocation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSTBackgroundActivityIdentifierBackgroundLocationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                               + 24);
  return result;
}

id getSTBackgroundActivityIdentifierBackgroundLocation()
{
  STBackgroundActivityIdentifierBackgroundLocationSymbolLoc = (void **)getSTBackgroundActivityIdentifierBackgroundLocationSymbolLoc();
  if (!STBackgroundActivityIdentifierBackgroundLocationSymbolLoc) {
    getSTBackgroundActivityIdentifierBackgroundLocation_cold_1();
  }
  id v1 = *STBackgroundActivityIdentifierBackgroundLocationSymbolLoc;
  return v1;
}

uint64_t getSTBackgroundActivityIdentifiersDescriptionSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getSTBackgroundActivityIdentifiersDescriptionSymbolLoc_ptr;
  uint64_t v6 = getSTBackgroundActivityIdentifiersDescriptionSymbolLoc_ptr;
  if (!getSTBackgroundActivityIdentifiersDescriptionSymbolLoc_ptr)
  {
    id v1 = (void *)SystemStatusLibrary();
    v4[3] = (uint64_t)dlsym(v1, "STBackgroundActivityIdentifiersDescription");
    getSTBackgroundActivityIdentifiersDescriptionSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18FC1002C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSTBackgroundActivityIdentifiersDescriptionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SystemStatusLibrary();
  uint64_t result = dlsym(v2, "STBackgroundActivityIdentifiersDescription");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSTBackgroundActivityIdentifiersDescriptionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_STBackgroundActivityIdentifiersDescription(uint64_t a1)
{
  STBackgroundActivityIdentifiersDescriptionSymbolLoc = (uint64_t (*)(uint64_t))getSTBackgroundActivityIdentifiersDescriptionSymbolLoc();
  if (!STBackgroundActivityIdentifiersDescriptionSymbolLoc) {
    soft_STBackgroundActivityIdentifiersDescription_cold_1();
  }
  return STBackgroundActivityIdentifiersDescriptionSymbolLoc(a1);
}

uint64_t SystemStatusUILibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = SystemStatusUILibraryCore_frameworkLibrary;
  uint64_t v5 = SystemStatusUILibraryCore_frameworkLibrary;
  if (!SystemStatusUILibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E566D4A0;
    long long v7 = *(_OWORD *)&off_1E566D4B0;
    v3[3] = _sl_dlopen();
    SystemStatusUILibraryCore_frameworkLibrarCGFloat y = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18FC101E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SystemStatusUILibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  SystemStatusUILibraryCore_frameworkLibrarCGFloat y = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SystemStatusUILibrary()
{
  id v1 = 0;
  uint64_t result = SystemStatusUILibraryCore();
  if (!result) {
    SystemStatusUILibrary_cold_1(&v1);
  }
  return result;
}

uint64_t getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc_ptr;
  uint64_t v6 = getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc_ptr;
  if (!getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc_ptr)
  {
    id v1 = (void *)SystemStatusUILibrary();
    v4[3] = (uint64_t)dlsym(v1, "STUIBackgroundActivityIdentifiersForStyleOverrides");
    getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18FC103BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SystemStatusUILibrary();
  uint64_t result = dlsym(v2, "STUIBackgroundActivityIdentifiersForStyleOverrides");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

uint64_t soft_STUIBackgroundActivityIdentifiersForStyleOverrides(uint64_t a1)
{
  STUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc = (uint64_t (*)(uint64_t))getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc();
  if (!STUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc) {
    soft_STUIBackgroundActivityIdentifiersForStyleOverrides_cold_1();
  }
  return STUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc(a1);
}

uint64_t getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc_ptr;
  uint64_t v6 = getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc_ptr;
  if (!getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc_ptr)
  {
    id v1 = (void *)SystemStatusUILibrary();
    v4[3] = (uint64_t)dlsym(v1, "STUIStyleOverridesForBackgroundActivityIdentifiers");
    getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18FC10540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SystemStatusUILibrary();
  uint64_t result = dlsym(v2, "STUIStyleOverridesForBackgroundActivityIdentifiers");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

uint64_t soft_STUIStyleOverridesForBackgroundActivityIdentifiers(uint64_t a1)
{
  STUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc = (uint64_t (*)(uint64_t))getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc();
  if (!STUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc) {
    soft_STUIStyleOverridesForBackgroundActivityIdentifiers_cold_1();
  }
  return STUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc(a1);
}

void sub_18FC11060(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void SBSEventObserverInitialize(NSObject *a1, void *a2)
{
  id v3 = a2;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __SBSEventObserverInitialize_block_invoke;
  handler[3] = &unk_1E566D728;
  id v6 = v3;
  id v4 = v3;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", a1, handler);
}

void __SBSEventObserverInitialize_block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  BOOL v3 = MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590];
  id v4 = xdict;
  if (v3)
  {
    string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14560]);
    id v4 = xdict;
    if (string)
    {
      id v6 = [NSString stringWithCString:string encoding:4];
      if ([v6 hasPrefix:@"com.apple.springboardservices.eventobserver.internal"])
      {
        id v7 = [v6 substringFromIndex:[@"com.apple.springboardservices.eventobserver.internal" length]];
      }
      else
      {
        id v7 = v6;
      }
      uint64_t v8 = v7;

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      id v4 = xdict;
    }
  }
}

void SBSEventObserverStartObservingEvent(void *a1)
{
  id v1 = a1;
  if (!CFEqual(a1, @"SignificantTimeChangeNotification")) {
    id v1 = (void *)[@"com.apple.springboardservices.eventobserver.internal" stringByAppendingString:v1];
  }
  uint64_t v2 = (const char *)[v1 UTF8String];
  id v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "Notification", v2);
  xpc_set_event();
}

uint64_t __SBSEventObserverGetDarwinNotificationFromEvent(const void *a1)
{
  if (CFEqual(a1, @"SignificantTimeChangeNotification")) {
    return (uint64_t)a1;
  }
  return [@"com.apple.springboardservices.eventobserver.internal" stringByAppendingString:a1];
}

uint64_t SBSEventObserverStopObservingEvent(void *a1)
{
  id v1 = a1;
  if (!CFEqual(a1, @"SignificantTimeChangeNotification")) {
    id v1 = (void *)[@"com.apple.springboardservices.eventobserver.internal" stringByAppendingString:v1];
  }
  [v1 UTF8String];
  return xpc_set_event();
}

void SBSEventObserverStopObservingAllEvents()
{
  id v0 = (id)xpc_copy_event();
  xpc_dictionary_apply(v0, &__block_literal_global_39);
}

uint64_t __SBSEventObserverStopObservingAllEvents_block_invoke()
{
  return 1;
}

uint64_t SBSEventObserverGetValueForState(void *a1)
{
  id v1 = a1;
  if (!CFEqual(a1, @"SignificantTimeChangeNotification")) {
    id v1 = (void *)[@"com.apple.springboardservices.eventobserver.internal" stringByAppendingString:v1];
  }
  int out_token = 0;
  uint32_t v2 = notify_register_check((const char *)[v1 UTF8String], &out_token);
  uint64_t v3 = 0;
  if (!v2)
  {
    uint64_t v6 = 0;
    if (notify_get_state(out_token, &v6)) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = v6 == 0;
    }
    uint64_t v3 = !v4;
    notify_cancel(out_token);
  }
  return v3;
}

void _SBSAutolockTimerRegisterForExternalChangeNotification()
{
  if (_SBSAutolockTimerRegisterForExternalChangeNotification___once != -1) {
    dispatch_once(&_SBSAutolockTimerRegisterForExternalChangeNotification___once, &__block_literal_global_40);
  }
}

uint64_t _SBSAutolockTimerPostExternalChangeNotification(uint64_t state64)
{
  unsigned int v1 = state64;
  LODWORD(state64) = _SBSAutolockTimerPostExternalChangeNotification_token;
  if (_SBSAutolockTimerPostExternalChangeNotification_token != -1
    || (notify_register_check("com.apple.springboard.autolockfired", &_SBSAutolockTimerPostExternalChangeNotification_token), state64 = _SBSAutolockTimerPostExternalChangeNotification_token, _SBSAutolockTimerPostExternalChangeNotification_token != -1))
  {
    notify_set_state(state64, v1);
    return notify_post("com.apple.springboard.autolockfired");
  }
  return state64;
}

void sub_18FC11D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18FC12230(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t SBSUIAppSetWantsLockButtonEvents(uint64_t a1)
{
  uint64_t v2 = SBSSpringBoardServerPort();
  return SBSetWantsLockButtonEvents(v2, a1);
}

id SBSBackgroundActivityAssertionClientInterface()
{
  id v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDF665F8];
  unsigned int v1 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = [v1 setWithObjects:v2, nil];
  [v0 setClasses:v3 forSelector:sel_invalidateBackgroundActivityAssertionsWithIdentifiers_ argumentIndex:0 ofReply:0];

  return v0;
}

id SBBackgroundActivityAssertionServerInterface()
{
  id v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDF6C778];
  unsigned int v1 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = [v1 setWithObjects:v2, nil];
  [v0 setClasses:v3 forSelector:sel_activateBackgroundActivityAssertions_reply_ argumentIndex:0 ofReply:0];

  BOOL v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  id v7 = [v4 setWithObjects:v5, v6, nil];
  [v0 setClasses:v7 forSelector:sel_activateBackgroundActivityAssertions_reply_ argumentIndex:0 ofReply:1];

  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  id v10 = [v8 setWithObjects:v9, nil];
  [v0 setClasses:v10 forSelector:sel_deactivateBackgroundActivityAssertionsWithIdentifiers_ argumentIndex:0 ofReply:0];

  uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithObjects:objc_opt_class(), 0];
  [v0 setClasses:v11 forSelector:sel_setStatusString_forAssertionWithIdentifier_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v11 forSelector:sel_setStatusString_forAssertionWithIdentifier_ argumentIndex:1 ofReply:0];

  return v0;
}

void sub_18FC1290C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18FC12BB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_18FC15B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18FC15C90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18FC16EA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_18FC17618(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18FC177F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18FC17E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18FC17F68(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18FC1921C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_18FC1B198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_18FC1B2F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromPreferredNotificationListMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"inherit";
  }
  else {
    return off_1E566DAC8[a1 - 1];
  }
}

__CFString *NSStringFromPreferredLayout(uint64_t a1)
{
  if (a1) {
    return @"centeredY";
  }
  else {
    return @"default";
  }
}

__CFString *NSStringFromRemoteContentBackgroundStyle(unint64_t a1)
{
  if (a1 > 4) {
    return @"dark";
  }
  else {
    return off_1E566DAE8[a1];
  }
}

uint64_t SBSAppSwitcherServiceRegistrationGetTypeID()
{
  if (SBSAppSwitcherServiceRegistrationGetTypeID_onceToken != -1) {
    dispatch_once(&SBSAppSwitcherServiceRegistrationGetTypeID_onceToken, &__block_literal_global_51);
  }
  return SBSAppSwitcherServiceRegistrationGetTypeID_typeID;
}

void SBSAppSwitcherServiceRegistrationFinalize(uint64_t a1)
{
  mach_port_name_t v1 = *(_DWORD *)(a1 + 80);
  if (v1)
  {
    mach_port_mod_refs(*MEMORY[0x1E4F14960], v1, 1u, -1);
    *(_DWORD *)(a1 + 80) = 0;
    uint64_t v3 = *(const void **)(a1 + 88);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 88) = 0;
    }
    uint64_t v4 = *(const void **)(a1 + 96);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(a1 + 96) = 0;
    }
  }
}

uint64_t SBSAppSwitcherServiceRegistrationEqual(const __CFString *a1, const __CFString *a2)
{
  ComposedKeCGFloat y = _SBSAppSwitcherServiceRegistrationCreateComposedKey(a1);
  CFStringRef v5 = _SBSAppSwitcherServiceRegistrationCreateComposedKey(a2);
  CFTypeID v6 = CFGetTypeID(a1);
  CFTypeID v7 = CFGetTypeID(a2);
  if (SBSAppSwitcherServiceRegistrationGetTypeID_onceToken != -1) {
    dispatch_once(&SBSAppSwitcherServiceRegistrationGetTypeID_onceToken, &__block_literal_global_51);
  }
  uint64_t v8 = SBSAppSwitcherServiceRegistrationGetTypeID_typeID;
  Boolean v9 = CFEqual(ComposedKey, v5);
  if (ComposedKey) {
    CFRelease(ComposedKey);
  }
  if (v5) {
    CFRelease(v5);
  }
  return (v8 == (v6 == v7)) & v9;
}

CFHashCode SBSAppSwitcherServiceRegistrationHash(const __CFString *a1)
{
  ComposedKeCGFloat y = _SBSAppSwitcherServiceRegistrationCreateComposedKey(a1);
  CFHashCode v3 = CFHash(a1[3].isa);
  if (ComposedKey) {
    CFRelease(ComposedKey);
  }
  return v3;
}

uint64_t __SBSAppSwitcherServiceRegistrationGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  SBSAppSwitcherServiceRegistrationGetTypeID_typeID = result;
  return result;
}

uint64_t SBSAppSwitcherServiceRegister(const __CFAllocator *a1, const __CFString *a2, const __CFString *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    uint64_t v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      SBSAppSwitcherServiceRegister_cold_1(v8);
    }
    goto LABEL_13;
  }
  if (!a3)
  {
    uint64_t v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      SBSAppSwitcherServiceRegister_cold_2(v8);
    }
LABEL_13:

    return 0;
  }
  if (SBSAppSwitcherServiceRegistrationGetTypeID_onceToken != -1) {
    dispatch_once(&SBSAppSwitcherServiceRegistrationGetTypeID_onceToken, &__block_literal_global_51);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    mach_port_name_t name = 0;
    if (mach_port_allocate(*MEMORY[0x1E4F14960], 1u, &name)) {
      goto LABEL_8;
    }
    *(_DWORD *)(Instance + 80) = name;
    *(void *)(Instance + 88) = CFStringCreateCopy(a1, a2);
    *(void *)(Instance + 96) = CFStringCreateCopy(a1, a3);
    memset(buffer, 0, 512);
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
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    *(_OWORD *)uint64_t v11 = 0u;
    long long v12 = 0u;
    CFStringGetCString(*(CFStringRef *)(Instance + 88), (char *)buffer, 1024, 0x8000100u);
    CFStringGetCString(*(CFStringRef *)(Instance + 96), v11, 1024, 0x8000100u);
    uint64_t v7 = SBSSpringBoardServerPort();
    if (SBAppSwitcherServiceRegister(v7, *(unsigned int *)(Instance + 80), buffer, v11))
    {
LABEL_8:
      CFRelease((CFTypeRef)Instance);
      return 0;
    }
  }
  return Instance;
}

uint64_t SBSAppSwitcherServiceRegistrationGetBundleID(uint64_t result)
{
  if (result)
  {
    if (*(_DWORD *)(result + 80)) {
      return *(void *)(result + 88);
    }
    else {
      return 0;
    }
  }
  return result;
}

BOOL SBSAppSwitcherServiceRegistrationGetIsValid(BOOL result)
{
  if (result) {
    return *(_DWORD *)(result + 80) != 0;
  }
  return result;
}

uint64_t SBSAppSwitcherServiceRegistrationGetViewControllerClassName(uint64_t result)
{
  if (result)
  {
    if (*(_DWORD *)(result + 80)) {
      return *(void *)(result + 96);
    }
    else {
      return 0;
    }
  }
  return result;
}

CFStringRef _SBSAppSwitcherServiceRegistrationCreateComposedKey(const __CFString *a1)
{
  CFStringRef v1 = a1;
  v6[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = (void *)MEMORY[0x192FC0BD0]();
    isa = v1[3].isa;
    v6[0] = v1[2].length;
    v6[1] = isa;
    CFArrayRef v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
    CFStringRef v1 = CFStringCreateByCombiningStrings((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4, @":");
  }
  return v1;
}

uint64_t SBSThermalWarningAssertionCreateForBundleID()
{
  return 0;
}

void sub_18FC1E3C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SBSCopyDisplayIdentifiers()
{
  id v0 = (void *)MEMORY[0x192FC0BD0]();
  CFStringRef v1 = +[_SBSDisplayIdentifiersCache sharedInstance];
  uint64_t v2 = [v1 displayIdentifiers];
  uint64_t v3 = [v2 copy];

  return v3;
}

void SBSRegisterDisplayIdentifiersChangedBlock(void *a1)
{
  id v1 = a1;
  id v2 = +[_SBSDisplayIdentifiersCache sharedInstance];
  [v2 registerChangedBlock:v1];
}

uint64_t SBSSetRequiredContextIdsForMedusaDragAndDropForSpotlightOnly(void *a1)
{
  _requiredContextIdsForMedusaDragAndDrop = [a1 copy];
  return MEMORY[0x1F41817F8]();
}

id SBSRequiredContextIdsForMedusaDragAndDropForSpotlightOnly()
{
  return (id)_requiredContextIdsForMedusaDragAndDrop;
}

uint64_t SBSEnableJindo()
{
  return 1;
}

__CFString *NSStringFromSBSAccessoryType(unint64_t a1)
{
  if (a1 > 7) {
    return @"Unknown";
  }
  else {
    return off_1E566DC98[a1];
  }
}

void sub_18FC21D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_18FC21EC4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18FC235F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void __copy_assignment_8_8_t0w40_s40_s48(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  long long v5 = a2[1];
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  objc_storeStrong((id *)(a1 + 40), *((id *)a2 + 5));
  CFTypeID v6 = (void *)*((void *)a2 + 6);
  objc_storeStrong((id *)(a1 + 48), v6);
}

void SBMachServiceInitialize(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)a1;
  if (*(void *)(a1 + 40))
  {
    id v2 = SBLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      SBMachServiceInitialize_cold_2(v1, v2);
    }
LABEL_13:

    return;
  }
  if (!v1 || !*(void *)(a1 + 32) || !*(void *)(a1 + 16))
  {
    id v2 = SBLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      SBMachServiceInitialize_cold_1(v1, v2);
    }
    goto LABEL_13;
  }
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  int v5 = *(_DWORD *)(*(void *)(a1 + 24) + 8);
  char IsUsable = BSMachPortIsUsable();
  uint64_t v7 = SBLogCommon();
  uint64_t v8 = v7;
  if (IsUsable)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v12 = 136446466;
      uint64_t v13 = v1;
      __int16 v14 = 1024;
      int v15 = v5;
      _os_log_impl(&dword_18FBC5000, v8, OS_LOG_TYPE_INFO, "[SBMig] Service initialized: %{public}s (ID %d)", (uint8_t *)&v12, 0x12u);
    }

    int v12 = 16;
    MEMORY[0x192FC0AB0](*MEMORY[0x1E4F14960], v4, 1, &v12, 1);
    f = (void *)dispatch_mach_create_f();
    dispatch_set_qos_class_fallback();
    id v10 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = f;
    id v11 = f;

    dispatch_mach_connect();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136446210;
      uint64_t v13 = v1;
      _os_log_impl(&dword_18FBC5000, v8, OS_LOG_TYPE_DEFAULT, "[SBMig] Service \"%{public}s\" cannot be initialized because the receive port is invalid.", (uint8_t *)&v12, 0xCu);
    }
  }
}

uint64_t SBSUIActivateRemoteAlert(void *a1, void *a2)
{
  return SBSUIActivateRemoteAlertWithLifecycleNotifications(a1, a2, 0, 0);
}

uint64_t SBSUIActivateRemoteAlertWithLifecycleNotifications(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a3;
  id v8 = a4;
  id v9 = a1;
  if (v9)
  {
    id v10 = a2;
    id v11 = [v10 bs_safeStringForKey:@"ViewControllerClass"];
    if (v11)
    {
      int v12 = [[SBSRemoteAlertDefinition alloc] initWithServiceName:v9 viewControllerClassName:v11];
      -[SBSRemoteAlertDefinition setForCarPlay:](v12, [v10 bs_BOOLForKey:@"CarDisplay"]);
      uint64_t v13 = +[SBSRemoteAlertConfigurationContext configurationContextWithLegacyAlertOptions:v10];
      __int16 v14 = +[SBSRemoteAlertHandle lookupHandlesForDefinition:v12 creatingIfNone:1 configurationContext:v13];
      int v15 = [v14 firstObject];

      if (v15)
      {
        uint64_t v29 = 0;
        long long v30 = &v29;
        uint64_t v31 = 0x3032000000;
        long long v32 = __Block_byref_object_copy__4;
        long long v33 = __Block_byref_object_dispose__4;
        long long v34 = objc_alloc_init(_SBSUIRemoteAlertServiceObserverHandle);
        [v15 registerObserver:v30[5]];
        uint64_t v16 = (void *)v30[5];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        _OWORD v26[2] = __SBSUIActivateRemoteAlertWithLifecycleNotifications_block_invoke;
        v26[3] = &unk_1E566DDC8;
        id v27 = v8;
        long long v28 = &v29;
        [v16 setDeactivationHandler:v26];
        if ([v15 isActive])
        {
          if (v7) {
            v7[2](v7, 1);
          }
        }
        else
        {
          long long v18 = (void *)v30[5];
          uint64_t v21 = MEMORY[0x1E4F143A8];
          uint64_t v22 = 3221225472;
          long long v23 = __SBSUIActivateRemoteAlertWithLifecycleNotifications_block_invoke_2;
          long long v24 = &unk_1E566BA18;
          long long v25 = v7;
          [v18 setActivationHandler:&v21];
          long long v19 = +[SBSRemoteAlertActivationContext activationContextWithLegacyAlertOptions:](SBSRemoteAlertActivationContext, "activationContextWithLegacyAlertOptions:", v10, v21, v22, v23, v24);
          [v19 setShouldInvalidateWhenDeactivated:1];
          [v15 activateWithContext:v19];
        }
        _Block_object_dispose(&v29, 8);

        uint64_t v17 = 1;
      }
      else
      {
        uint64_t v17 = 0;
      }
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

void sub_18FC24480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __SBSUIActivateRemoteAlertWithLifecycleNotifications_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

uint64_t __SBSUIActivateRemoteAlertWithLifecycleNotifications_block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

BOOL SBSUIIsNamedRemoteAlertCurrentlyActive(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 length] && [v4 length])
  {
    int v5 = [[SBSRemoteAlertDefinition alloc] initWithServiceName:v3 viewControllerClassName:v4];
    CFTypeID v6 = +[SBSRemoteAlertHandle lookupHandlesForDefinition:v5 creatingIfNone:0];
    BOOL v7 = [v6 count] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

__CFString *NSStringFromAnalyticsQueryName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"FolderStats";
  }
  else {
    return off_1E566DE40[a1 - 1];
  }
}

__CFString *NSStringFromAnalyticsEventType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x43) {
    return @"HomeButtonPressed";
  }
  else {
    return off_1E566E0B0[a1 - 1];
  }
}

__CFString *NSStringFromSBSAnalyticsActionButtonInteractionType(uint64_t a1)
{
  uint64_t v1 = @"Pressed";
  if (a1 == 1) {
    uint64_t v1 = @"LongPressed";
  }
  if (a1 == 2) {
    return @"Suppressed";
  }
  else {
    return v1;
  }
}

uint64_t _SBSGetIsAlive(int a1, unsigned char *a2, mach_msg_timeout_t a3)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v11 = 5395;
  *(void *)rcv_name_12 = 0x30D4000000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v11);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)&v11, 3162387, 0x18u, 0x30u, special_reply_port, a3, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 200100)
      {
        if ((v11 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v8 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v8;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((v11 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v8;
}

uint64_t _SBSDisplayIdentifierForPID(mach_port_t a1, mach_port_t a2, char *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memset(&msg[20].msgh_size, 0, 28);
  memset(&msg[1].msgh_local_port, 0, 448);
  *(_OWORD *)&msg[0].msgh_id = 0u;
  *(_OWORD *)&msg[0].msgh_size = 0u;
  *(void *)&msg[1].msgh_bits = *MEMORY[0x1E4F14068];
  msg[1].uint64_t msgh_remote_port = a2;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg[0].uint64_t msgh_remote_port = a1;
  msg[0].msgh_local_port = special_reply_port;
  msg[0].msgh_bits = 5395;
  *(void *)&msg[0].msgh_voucher_port = 0x30D4100000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(msg);
    mach_port_t special_reply_port = msg[0].msgh_local_port;
  }
  uint64_t v6 = mach_msg(msg, 3162115, 0x24u, 0x434u, special_reply_port, 0, 0);
  uint64_t msgh_remote_port = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (msg[0].msgh_id == 71)
      {
        uint64_t msgh_remote_port = 4294966988;
      }
      else if (msg[0].msgh_id == 200101)
      {
        if ((msg[0].msgh_bits & 0x80000000) == 0)
        {
          if (msg[0].msgh_size - 1069 <= 0xFFFFFBFE)
          {
            if (msg[0].msgh_remote_port) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = msg[1].msgh_remote_port == 0;
            }
            if (!v8 && msg[0].msgh_size == 36) {
              uint64_t msgh_remote_port = msg[1].msgh_remote_port;
            }
            else {
              uint64_t msgh_remote_port = 4294966996;
            }
            goto LABEL_27;
          }
          if (!msg[0].msgh_remote_port)
          {
            uint64_t msgh_remote_port = msg[1].msgh_remote_port;
            if (!msg[1].msgh_remote_port)
            {
              uint64_t msgh_remote_port = 4294966996;
              if (msg[1].msgh_voucher_port <= 0x400
                && msg[0].msgh_size - 44 >= msg[1].msgh_voucher_port
                && msg[0].msgh_size == ((msg[1].msgh_voucher_port + 3) & 0xFFFFFFFC) + 44)
              {
                mig_strncpy(a3, (const char *)&msg[1].msgh_id, 1024);
                return 0;
              }
            }
            goto LABEL_27;
          }
        }
        uint64_t msgh_remote_port = 4294966996;
      }
      else
      {
        uint64_t msgh_remote_port = 4294966995;
      }
LABEL_27:
      mach_msg_destroy(msg);
      return msgh_remote_port;
    }
    mig_dealloc_special_reply_port();
  }
  if ((msgh_remote_port - 268435459) <= 1)
  {
    if ((msg[0].msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg[0].msgh_local_port);
    }
    goto LABEL_27;
  }
  return msgh_remote_port;
}

uint64_t _SBSDisplayIdentifiersForPID(int a1, int a2, void *a3, _DWORD *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)msg_4 = 0u;
  *(void *)&msg_4[20] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&msg_4[28] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = special_reply_port;
  int msg = 5395;
  *(void *)&msg_4[12] = 0x30D4200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg_4[8];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x24u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg_4[16] == 200102)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)msg_4 == 36)
          {
            uint64_t v9 = 4294966996;
            if (*(_DWORD *)&msg_4[28])
            {
              if (*(_DWORD *)&msg_4[4]) {
                uint64_t v9 = 4294966996;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg_4[28];
              }
            }
          }
          else
          {
            uint64_t v9 = 4294966996;
          }
          goto LABEL_27;
        }
        uint64_t v9 = 4294966996;
        if (*(_DWORD *)&msg_4[20] == 1 && *(_DWORD *)msg_4 == 56 && !*(_DWORD *)&msg_4[4] && msg_4[35] == 1)
        {
          int v10 = *(_DWORD *)&msg_4[36];
          if (*(_DWORD *)&msg_4[36] == *(_DWORD *)&msg_4[48])
          {
            uint64_t v9 = 0;
            *a3 = *(void *)&msg_4[24];
            *a4 = v10;
            return v9;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg_4[8]);
    }
    goto LABEL_27;
  }
  return v9;
}

uint64_t _SBSApplicationDisplayIdentifiers(int a1, char a2, char a3, void *a4, _DWORD *a5)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)msg_4 = 0u;
  *(void *)&msg_4[20] = *MEMORY[0x1E4F14068];
  msg_4[28] = a2;
  *(_WORD *)&msg_4[29] = 0;
  msg_4[31] = 0;
  msg_4[32] = a3;
  *(_WORD *)&msg_4[33] = 0;
  msg_4[35] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = special_reply_port;
  int msg = 5395;
  *(void *)&msg_4[12] = 0x30D4300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg_4[8];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x28u, 0x40u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg_4[16] == 200103)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)msg_4 == 36)
          {
            uint64_t v10 = 4294966996;
            if (*(_DWORD *)&msg_4[28])
            {
              if (*(_DWORD *)&msg_4[4]) {
                uint64_t v10 = 4294966996;
              }
              else {
                uint64_t v10 = *(unsigned int *)&msg_4[28];
              }
            }
          }
          else
          {
            uint64_t v10 = 4294966996;
          }
          goto LABEL_27;
        }
        uint64_t v10 = 4294966996;
        if (*(_DWORD *)&msg_4[20] == 1 && *(_DWORD *)msg_4 == 56 && !*(_DWORD *)&msg_4[4] && msg_4[35] == 1)
        {
          int v11 = *(_DWORD *)&msg_4[36];
          if (*(_DWORD *)&msg_4[36] == *(_DWORD *)&msg_4[48])
          {
            uint64_t v10 = 0;
            *a4 = *(void *)&msg_4[24];
            *a5 = v11;
            return v10;
          }
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v10 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg_4[8]);
    }
    goto LABEL_27;
  }
  return v10;
}

uint64_t _SBSFrontmostApplicationDisplayIdentifier(mach_port_t a1, char *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  memset(&msg[20].msgh_size, 0, 28);
  memset(&msg[1].msgh_local_port, 0, 448);
  *(_OWORD *)&msg[0].msgh_id = 0u;
  msg[0].msgh_size = 0;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg[0].uint64_t msgh_remote_port = a1;
  msg[0].msgh_local_port = special_reply_port;
  msg[0].msgh_bits = 5395;
  *(void *)&msg[0].msgh_voucher_port = 0x30D4400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(msg);
    mach_port_t special_reply_port = msg[0].msgh_local_port;
  }
  uint64_t v5 = mach_msg(msg, 3162115, 0x18u, 0x434u, special_reply_port, 0, 0);
  uint64_t msgh_remote_port = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (msg[0].msgh_id == 71)
      {
        uint64_t msgh_remote_port = 4294966988;
      }
      else if (msg[0].msgh_id == 200104)
      {
        if ((msg[0].msgh_bits & 0x80000000) == 0)
        {
          if (msg[0].msgh_size - 1069 <= 0xFFFFFBFE)
          {
            if (msg[0].msgh_remote_port) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = msg[1].msgh_remote_port == 0;
            }
            if (!v7 && msg[0].msgh_size == 36) {
              uint64_t msgh_remote_port = msg[1].msgh_remote_port;
            }
            else {
              uint64_t msgh_remote_port = 4294966996;
            }
            goto LABEL_27;
          }
          if (!msg[0].msgh_remote_port)
          {
            uint64_t msgh_remote_port = msg[1].msgh_remote_port;
            if (!msg[1].msgh_remote_port)
            {
              uint64_t msgh_remote_port = 4294966996;
              if (msg[1].msgh_voucher_port <= 0x400
                && msg[0].msgh_size - 44 >= msg[1].msgh_voucher_port
                && msg[0].msgh_size == ((msg[1].msgh_voucher_port + 3) & 0xFFFFFFFC) + 44)
              {
                mig_strncpy(a2, (const char *)&msg[1].msgh_id, 1024);
                return 0;
              }
            }
            goto LABEL_27;
          }
        }
        uint64_t msgh_remote_port = 4294966996;
      }
      else
      {
        uint64_t msgh_remote_port = 4294966995;
      }
LABEL_27:
      mach_msg_destroy(msg);
      return msgh_remote_port;
    }
    mig_dealloc_special_reply_port();
  }
  if ((msgh_remote_port - 268435459) <= 1)
  {
    if ((msg[0].msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg[0].msgh_local_port);
    }
    goto LABEL_27;
  }
  return msgh_remote_port;
}

uint64_t _SBSBundlePathForDisplayIdentifier(mach_port_name_t a1, const char *a2, char *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(v15, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v14 = 0u;
  *((void *)&v14 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v5 = mig_strncpy_zerofill((char *)v15 + 8, a2, 1024);
  }
  else {
    int v5 = mig_strncpy((char *)v15 + 8, a2, 1024);
  }
  LODWORD(v15[0]) = 0;
  DWORD1(v15[0]) = v5;
  mach_msg_size_t v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v14 = 0x30D4500000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v6, 0x434u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (DWORD1(v14) == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (DWORD1(v14) == 200105)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] - 1069 <= 0xFFFFFBFE)
          {
            if (rcv_name[2]) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = LODWORD(v15[0]) == 0;
            }
            if (!v10 && rcv_name[1] == 36) {
              uint64_t v9 = LODWORD(v15[0]);
            }
            else {
              uint64_t v9 = 4294966996;
            }
            goto LABEL_30;
          }
          if (!rcv_name[2])
          {
            uint64_t v9 = LODWORD(v15[0]);
            if (!LODWORD(v15[0]))
            {
              uint64_t v9 = 4294966996;
              if (DWORD2(v15[0]) <= 0x400
                && rcv_name[1] - 44 >= DWORD2(v15[0])
                && rcv_name[1] == ((DWORD2(v15[0]) + 3) & 0xFFFFFFFC) + 44)
              {
                mig_strncpy(a3, (const char *)v15 + 12, 1024);
                return 0;
              }
            }
            goto LABEL_30;
          }
        }
        uint64_t v9 = 4294966996;
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
    goto LABEL_30;
  }
  return v9;
}

uint64_t _SBSGetDisplayIdentifiers(int a1, void *a2, _DWORD *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(&msg_16[4], 0, 44);
  int msg_4 = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int msg_8 = a1;
  mach_port_name_t msg_12 = special_reply_port;
  int msg = 5395;
  *(void *)msg_16 = 0x30D4600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_name_t special_reply_port = msg_12;
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (*(_DWORD *)&msg_16[4] == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg_16[4] == 200106)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (msg_4 == 36)
          {
            uint64_t v8 = 4294966996;
            if (*(_DWORD *)&msg_16[16])
            {
              if (msg_8) {
                uint64_t v8 = 4294966996;
              }
              else {
                uint64_t v8 = *(unsigned int *)&msg_16[16];
              }
            }
          }
          else
          {
            uint64_t v8 = 4294966996;
          }
          goto LABEL_27;
        }
        uint64_t v8 = 4294966996;
        if (*(_DWORD *)&msg_16[8] == 1 && msg_4 == 56 && !msg_8 && msg_16[23] == 1)
        {
          int v9 = *(_DWORD *)&msg_16[24];
          if (*(_DWORD *)&msg_16[24] == *(_DWORD *)&msg_16[36])
          {
            uint64_t v8 = 0;
            *a2 = *(void *)&msg_16[12];
            *a3 = v9;
            return v8;
          }
        }
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg_12);
    }
    goto LABEL_27;
  }
  return v8;
}

uint64_t _SBSIsSystemApplication(int a1, unsigned char *a2, unsigned char *a3)
{
  *(_OWORD *)&msg[20] = 0u;
  long long v12 = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)int msg = 5395;
  *(void *)&msg[16] = 0x30D4700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 200107)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v8 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a2 = v12;
                *a3 = BYTE4(v12);
                return v8;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = *(_DWORD *)&msg[32] == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = *(unsigned int *)&msg[32];
            }
            goto LABEL_25;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_25;
  }
  return v8;
}

uint64_t _SBSLocalizedApplicationNameForDisplayIdentifier(mach_port_name_t a1, const char *a2, char *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(v15, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v14 = 0u;
  *((void *)&v14 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v5 = mig_strncpy_zerofill((char *)v15 + 8, a2, 1024);
  }
  else {
    int v5 = mig_strncpy((char *)v15 + 8, a2, 1024);
  }
  LODWORD(v15[0]) = 0;
  DWORD1(v15[0]) = v5;
  mach_msg_size_t v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v14 = 0x30D4800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v6, 0x434u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (DWORD1(v14) == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (DWORD1(v14) == 200108)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] - 1069 <= 0xFFFFFBFE)
          {
            if (rcv_name[2]) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = LODWORD(v15[0]) == 0;
            }
            if (!v10 && rcv_name[1] == 36) {
              uint64_t v9 = LODWORD(v15[0]);
            }
            else {
              uint64_t v9 = 4294966996;
            }
            goto LABEL_30;
          }
          if (!rcv_name[2])
          {
            uint64_t v9 = LODWORD(v15[0]);
            if (!LODWORD(v15[0]))
            {
              uint64_t v9 = 4294966996;
              if (DWORD2(v15[0]) <= 0x400
                && rcv_name[1] - 44 >= DWORD2(v15[0])
                && rcv_name[1] == ((DWORD2(v15[0]) + 3) & 0xFFFFFFFC) + 44)
              {
                mig_strncpy(a3, (const char *)v15 + 12, 1024);
                return 0;
              }
            }
            goto LABEL_30;
          }
        }
        uint64_t v9 = 4294966996;
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
    goto LABEL_30;
  }
  return v9;
}

uint64_t _SBSGetDisplayIdentifiersForExternalAccessoryProtocols(mach_port_name_t a1, const char *a2, void *a3, _DWORD *a4)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
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
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  *(_OWORD *)int rcv_name = 0u;
  memset(v15, 0, sizeof(v15));
  *((void *)&v15[0] + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v7 = mig_strncpy_zerofill((char *)&v15[1] + 8, a2, 1024);
  }
  else {
    int v7 = mig_strncpy((char *)&v15[1] + 8, a2, 1024);
  }
  LODWORD(v15[1]) = 0;
  DWORD1(v15[1]) = v7;
  mach_msg_size_t v8 = ((v7 + 3) & 0xFFFFFFFC) + 40;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&v15[0] = 0x30D4900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v8, 0x40u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (DWORD1(v15[0]) == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (DWORD1(v15[0]) == 200109)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 36)
          {
            uint64_t v11 = 4294966996;
            if (LODWORD(v15[1]))
            {
              if (rcv_name[2]) {
                uint64_t v11 = 4294966996;
              }
              else {
                uint64_t v11 = LODWORD(v15[1]);
              }
            }
          }
          else
          {
            uint64_t v11 = 4294966996;
          }
          goto LABEL_30;
        }
        uint64_t v11 = 4294966996;
        if (DWORD2(v15[0]) == 1 && rcv_name[1] == 56 && !rcv_name[2] && BYTE7(v15[1]) == 1)
        {
          int v12 = DWORD2(v15[1]);
          if (DWORD2(v15[1]) == DWORD1(v16))
          {
            uint64_t v11 = 0;
            *a3 = *(void *)((char *)v15 + 12);
            *a4 = v12;
            return v11;
          }
        }
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v11 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
    goto LABEL_30;
  }
  return v11;
}

uint64_t _SBSGetIconState(int a1, char a2, void *a3, _DWORD *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)int msg_4 = 0u;
  *(void *)&msg_4[20] = *MEMORY[0x1E4F14068];
  msg_4[28] = a2;
  *(_WORD *)&msg_4[29] = 0;
  msg_4[31] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = special_reply_port;
  int msg = 5395;
  *(void *)&msg_4[12] = 0x30D4A00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg_4[8];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x24u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg_4[16] == 200110)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)msg_4 == 36)
          {
            uint64_t v9 = 4294966996;
            if (*(_DWORD *)&msg_4[28])
            {
              if (*(_DWORD *)&msg_4[4]) {
                uint64_t v9 = 4294966996;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg_4[28];
              }
            }
          }
          else
          {
            uint64_t v9 = 4294966996;
          }
          goto LABEL_27;
        }
        uint64_t v9 = 4294966996;
        if (*(_DWORD *)&msg_4[20] == 1 && *(_DWORD *)msg_4 == 56 && !*(_DWORD *)&msg_4[4] && msg_4[35] == 1)
        {
          int v10 = *(_DWORD *)&msg_4[36];
          if (*(_DWORD *)&msg_4[36] == *(_DWORD *)&msg_4[48])
          {
            uint64_t v9 = 0;
            *a3 = *(void *)&msg_4[24];
            *a4 = v10;
            return v9;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg_4[8]);
    }
    goto LABEL_27;
  }
  return v9;
}

uint64_t _SBSGetPendingIconState(int a1, char a2, void *a3, _DWORD *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)int msg_4 = 0u;
  *(void *)&msg_4[20] = *MEMORY[0x1E4F14068];
  msg_4[28] = a2;
  *(_WORD *)&msg_4[29] = 0;
  msg_4[31] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = special_reply_port;
  int msg = 5395;
  *(void *)&msg_4[12] = 0x30D4B00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg_4[8];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x24u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg_4[16] == 200111)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)msg_4 == 36)
          {
            uint64_t v9 = 4294966996;
            if (*(_DWORD *)&msg_4[28])
            {
              if (*(_DWORD *)&msg_4[4]) {
                uint64_t v9 = 4294966996;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg_4[28];
              }
            }
          }
          else
          {
            uint64_t v9 = 4294966996;
          }
          goto LABEL_27;
        }
        uint64_t v9 = 4294966996;
        if (*(_DWORD *)&msg_4[20] == 1 && *(_DWORD *)msg_4 == 56 && !*(_DWORD *)&msg_4[4] && msg_4[35] == 1)
        {
          int v10 = *(_DWORD *)&msg_4[36];
          if (*(_DWORD *)&msg_4[36] == *(_DWORD *)&msg_4[48])
          {
            uint64_t v9 = 0;
            *a3 = *(void *)&msg_4[24];
            *a4 = v10;
            return v9;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg_4[8]);
    }
    goto LABEL_27;
  }
  return v9;
}

uint64_t _SBSGetFlattenedIconState(int a1, char a2, void *a3, _DWORD *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)int msg_4 = 0u;
  *(void *)&msg_4[20] = *MEMORY[0x1E4F14068];
  msg_4[28] = a2;
  *(_WORD *)&msg_4[29] = 0;
  msg_4[31] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = special_reply_port;
  int msg = 5395;
  *(void *)&msg_4[12] = 0x30D4C00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg_4[8];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x24u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg_4[16] == 200112)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)msg_4 == 36)
          {
            uint64_t v9 = 4294966996;
            if (*(_DWORD *)&msg_4[28])
            {
              if (*(_DWORD *)&msg_4[4]) {
                uint64_t v9 = 4294966996;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg_4[28];
              }
            }
          }
          else
          {
            uint64_t v9 = 4294966996;
          }
          goto LABEL_27;
        }
        uint64_t v9 = 4294966996;
        if (*(_DWORD *)&msg_4[20] == 1 && *(_DWORD *)msg_4 == 56 && !*(_DWORD *)&msg_4[4] && msg_4[35] == 1)
        {
          int v10 = *(_DWORD *)&msg_4[36];
          if (*(_DWORD *)&msg_4[36] == *(_DWORD *)&msg_4[48])
          {
            uint64_t v9 = 0;
            *a3 = *(void *)&msg_4[24];
            *a4 = v10;
            return v9;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg_4[8]);
    }
    goto LABEL_27;
  }
  return v9;
}

uint64_t _SBSSetIconState(mach_port_t a1, uint64_t a2, int a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v9 = 1;
  uint64_t v10 = a2;
  int v11 = 16777472;
  int v12 = a3;
  uint64_t v13 = *MEMORY[0x1E4F14068];
  int v14 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v8.msgh_bits = 2147489043;
  v8.uint64_t msgh_remote_port = a1;
  v8.msgh_local_port = special_reply_port;
  *(void *)&v8.msgh_voucher_port = 0x30D4D00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v8);
    mach_port_t special_reply_port = v8.msgh_local_port;
  }
  uint64_t v5 = mach_msg(&v8, 3162115, 0x38u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0) {
    goto LABEL_13;
  }
  if (v5)
  {
    mig_dealloc_special_reply_port();
LABEL_13:
    if ((v6 - 268435459) > 1) {
      return v6;
    }
    if ((v8.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v8.msgh_local_port);
    }
LABEL_18:
    mach_msg_destroy(&v8);
    return v6;
  }
  if (v8.msgh_id == 71)
  {
    uint64_t v6 = 4294966988;
    goto LABEL_18;
  }
  if (v8.msgh_id != 200113)
  {
    uint64_t v6 = 4294966995;
    goto LABEL_18;
  }
  uint64_t v6 = 4294966996;
  if ((v8.msgh_bits & 0x80000000) != 0) {
    goto LABEL_18;
  }
  if (*(void *)&v8.msgh_size != 36) {
    goto LABEL_18;
  }
  uint64_t v6 = HIDWORD(v10);
  if (HIDWORD(v10)) {
    goto LABEL_18;
  }
  return v6;
}

uint64_t _SBSSetApplicationBadgeNumber(mach_port_name_t a1, const char *a2, int a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  memset(v12, 0, 480);
  *(_OWORD *)mach_port_name_t name = 0u;
  long long v11 = 0u;
  *((void *)&v11 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v5 = mig_strncpy_zerofill((char *)v12 + 8, a2, 1024);
  }
  else {
    int v5 = mig_strncpy((char *)v12 + 8, a2, 1024);
  }
  LODWORD(v12[0]) = 0;
  DWORD1(v12[0]) = v5;
  uint64_t v6 = (v5 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v7 = v6 + 44;
  *(_DWORD *)((char *)v12 + v6 + 8) = a3;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(void *)&long long v11 = 0x30D4E00000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)name);
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)name, 2097153, v7, 0, 0, 0, 0);
  if ((v8 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name[3]);
    }
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v8;
}

uint64_t _SBSSetApplicationBadgeString(mach_port_name_t a1, const char *a2, const char *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  memset(v18, 0, 480);
  *(_OWORD *)mach_port_name_t name = 0u;
  long long v17 = 0u;
  *((void *)&v17 + 1) = *MEMORY[0x1E4F14068];
  uint64_t v5 = MEMORY[0x1E4F149B0];
  if (MEMORY[0x1E4F149B0]) {
    int v6 = mig_strncpy_zerofill((char *)v18 + 8, a2, 1024);
  }
  else {
    int v6 = mig_strncpy((char *)v18 + 8, a2, 1024);
  }
  LODWORD(v18[0]) = 0;
  DWORD1(v18[0]) = v6;
  uint64_t v7 = (v6 + 3) & 0xFFFFFFFC;
  int v8 = v7 + 48;
  int v9 = (char *)name + v7;
  uint64_t v10 = v9 - 1024;
  long long v11 = v9 + 48;
  if (v5) {
    int v12 = mig_strncpy_zerofill(v11, a3, 1024);
  }
  else {
    int v12 = mig_strncpy(v11, a3, 1024);
  }
  *((_DWORD *)v10 + 267) = v12;
  *((_DWORD *)v10 + 266) = 0;
  mach_msg_size_t v13 = v8 + ((v12 + 3) & 0xFFFFFFFC);
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(void *)&long long v17 = 0x30D4F00000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)name);
  }
  uint64_t v14 = mach_msg((mach_msg_header_t *)name, 2097153, v13, 0, 0, 0, 0);
  if ((v14 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name[3]);
    }
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v14;
}

uint64_t _SBSGetIconPNGData(mach_port_name_t a1, const char *a2, char a3, void *a4, _DWORD *a5)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
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
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  *(_OWORD *)int rcv_name = 0u;
  memset(v19, 0, sizeof(v19));
  *((void *)&v19[0] + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v9 = mig_strncpy_zerofill((char *)&v19[1] + 8, a2, 1024);
  }
  else {
    int v9 = mig_strncpy((char *)&v19[1] + 8, a2, 1024);
  }
  LODWORD(v19[1]) = 0;
  DWORD1(v19[1]) = v9;
  uint64_t v10 = (v9 + 3) & 0xFFFFFFFC;
  long long v11 = (char *)rcv_name + v10;
  v11[40] = a3;
  *(_WORD *)(v11 + 41) = 0;
  v11[43] = 0;
  mach_msg_size_t v12 = v10 + 44;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&v19[0] = 0x30D5100000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v14 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v12, 0x40u, special_reply_port, 0, 0);
  uint64_t v15 = v14;
  if ((v14 - 268435458) > 0xE || ((1 << (v14 - 2)) & 0x4003) == 0)
  {
    if (!v14)
    {
      if (DWORD1(v19[0]) == 71)
      {
        uint64_t v15 = 4294966988;
      }
      else if (DWORD1(v19[0]) == 200117)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 36)
          {
            uint64_t v15 = 4294966996;
            if (LODWORD(v19[1]))
            {
              if (rcv_name[2]) {
                uint64_t v15 = 4294966996;
              }
              else {
                uint64_t v15 = LODWORD(v19[1]);
              }
            }
          }
          else
          {
            uint64_t v15 = 4294966996;
          }
          goto LABEL_30;
        }
        uint64_t v15 = 4294966996;
        if (DWORD2(v19[0]) == 1 && rcv_name[1] == 56 && !rcv_name[2] && BYTE7(v19[1]) == 1)
        {
          int v16 = DWORD2(v19[1]);
          if (DWORD2(v19[1]) == DWORD1(v20))
          {
            uint64_t v15 = 0;
            *a4 = *(void *)((char *)v19 + 12);
            *a5 = v16;
            return v15;
          }
        }
      }
      else
      {
        uint64_t v15 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v15;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v15 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
    goto LABEL_30;
  }
  return v15;
}

uint64_t (*SpringBoardUtility_server_routine(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 200018) >= 0xFFFFFFEE) {
    return _SBMigSpringBoardUtility_subsystem[5 * (v1 - 200000) + 5];
  }
  else {
    return 0;
  }
}

_DWORD *_XGetIsAlive(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x1E4F14068];
    goto LABEL_8;
  }
  uint64_t result = (_DWORD *)_SBMigGetIsAlive(result[3], (unsigned char *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(void *)(a2 + 24) = v4;
  return result;
}

size_t _XDisplayIdentifierForPID(size_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  uint64_t v4 = *(unsigned int *)(result + 12);
  uint64_t v5 = *(unsigned int *)(result + 32);
  long long v6 = *(_OWORD *)(result + 72);
  v8[0] = *(_OWORD *)(result + 56);
  v8[1] = v6;
  uint64_t result = _SBMigDisplayIdentifierForPID(v4, v5, a2 + 44, v8);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v7 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v7;
    uint64_t result = strlen((const char *)(a2 + 44));
    if (!((result + 1) >> 32))
    {
      *(_DWORD *)(a2 + 36) = 0;
      *(_DWORD *)(a2 + 40) = result + 1;
      *(_DWORD *)(a2 + 4) = ((result + 4) & 0xFFFFFFFC) + 44;
      return result;
    }
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(void *)(a2 + 24) = v7;
  return result;
}

uint64_t _XDisplayIdentifiersForPID(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 0;
  uint64_t v4 = a2 + 52;
  uint64_t v5 = a2 + 28;
  *(_DWORD *)(a2 + 36) = 16777472;
  uint64_t v6 = *(unsigned int *)(result + 12);
  uint64_t v7 = *(unsigned int *)(result + 32);
  long long v8 = *(_OWORD *)(result + 72);
  v9[0] = *(_OWORD *)(result + 56);
  v9[1] = v8;
  uint64_t result = _SBMigDisplayIdentifiersForPID(v6, v7, v5, v4, v9);
  if (!result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XApplicationDisplayIdentifiers(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 40) || *(_DWORD *)(result + 44) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 0;
  uint64_t v4 = a2 + 52;
  uint64_t v5 = a2 + 28;
  *(_DWORD *)(a2 + 36) = 16777472;
  uint64_t v6 = *(unsigned int *)(result + 12);
  uint64_t v7 = *(unsigned __int8 *)(result + 32);
  uint64_t v8 = *(unsigned __int8 *)(result + 36);
  long long v9 = *(_OWORD *)(result + 76);
  v10[0] = *(_OWORD *)(result + 60);
  v10[1] = v9;
  uint64_t result = _SBMigApplicationDisplayIdentifiers(v6, v7, v8, v5, v4, v10);
  if (!result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XFrontmostApplicationDisplayIdentifier(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }
  int v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  int v5 = result[3];
  long long v6 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v6;
  uint64_t result = (_DWORD *)_SBMigFrontmostApplicationDisplayIdentifier(v5, a2 + 44, v8);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v7 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v7;
    uint64_t result = (_DWORD *)strlen((const char *)(a2 + 44));
    if (!(((unint64_t)result + 1) >> 32))
    {
      *(_DWORD *)(a2 + 36) = 0;
      *(_DWORD *)(a2 + 40) = result + 1;
      *(_DWORD *)(a2 + 4) = ((result + 4) & 0xFFFFFFFC) + 44;
      return result;
    }
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(void *)(a2 + 24) = v7;
  return result;
}

_DWORD *_XBundlePathForDisplayIdentifier(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0
    || (int v3 = result, v4 = result[1], v4 < 0x28)
    || v4 > 0x428
    || ((unsigned int v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = v4 == v7) : (v8 = 0),
        !v8 || (uint64_t result = memchr(result + 10, 0, v4 - 40)) == 0))
  {
    int v9 = -304;
LABEL_12:
    *(_DWORD *)(a2 + 32) = v9;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  uint64_t v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v10 || *((_DWORD *)v10 + 1) <= 0x1Fu)
  {
    int v9 = -309;
    goto LABEL_12;
  }
  uint64_t v11 = v3[3];
  long long v12 = *(_OWORD *)(v10 + 36);
  v14[0] = *(_OWORD *)(v10 + 20);
  v14[1] = v12;
  uint64_t result = (_DWORD *)_SBMigBundlePathForDisplayIdentifier(v11, (uint64_t)(v3 + 10), a2 + 44, v14);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v13 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v13;
    uint64_t result = (_DWORD *)strlen((const char *)(a2 + 44));
    if (!(((unint64_t)result + 1) >> 32))
    {
      *(_DWORD *)(a2 + 36) = 0;
      *(_DWORD *)(a2 + 40) = result + 1;
      *(_DWORD *)(a2 + 4) = ((result + 4) & 0xFFFFFFFC) + 44;
      return result;
    }
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(void *)(a2 + 24) = v13;
  return result;
}

_DWORD *_XGetDisplayIdentifiers(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }
  int v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  uint64_t v5 = result[3];
  long long v6 = *(_OWORD *)(v3 + 9);
  v7[0] = *(_OWORD *)(v3 + 5);
  v7[1] = v6;
  uint64_t result = (_DWORD *)_SBMigGetDisplayIdentifiers(v5, (void *)(a2 + 28), (_DWORD *)(a2 + 52), v7);
  if (!result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XIsSystemApplication(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }
  int v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    uint64_t v5 = *MEMORY[0x1E4F14068];
    goto LABEL_8;
  }
  uint64_t v6 = result[3];
  long long v7 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v7;
  uint64_t result = (_DWORD *)_SBMigIsSystemApplication(v6, a2 + 36, a2 + 40, v8);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v5 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }
LABEL_8:
  *(void *)(a2 + 24) = v5;
  return result;
}

_DWORD *_XLocalizedApplicationNameForDisplayIdentifier(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0
    || (int v3 = result, v4 = result[1], v4 < 0x28)
    || v4 > 0x428
    || ((unsigned int v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = v4 == v7) : (v8 = 0),
        !v8 || (uint64_t result = memchr(result + 10, 0, v4 - 40)) == 0))
  {
    int v9 = -304;
LABEL_12:
    *(_DWORD *)(a2 + 32) = v9;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  uint64_t v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v10 || *((_DWORD *)v10 + 1) <= 0x1Fu)
  {
    int v9 = -309;
    goto LABEL_12;
  }
  uint64_t v11 = v3[3];
  long long v12 = *(_OWORD *)(v10 + 36);
  v14[0] = *(_OWORD *)(v10 + 20);
  v14[1] = v12;
  uint64_t result = (_DWORD *)_SBMigLocalizedApplicationNameForDisplayIdentifier(v11, (uint64_t)(v3 + 10), a2 + 44, v14);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v13 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v13;
    uint64_t result = (_DWORD *)strlen((const char *)(a2 + 44));
    if (!(((unint64_t)result + 1) >> 32))
    {
      *(_DWORD *)(a2 + 36) = 0;
      *(_DWORD *)(a2 + 40) = result + 1;
      *(_DWORD *)(a2 + 4) = ((result + 4) & 0xFFFFFFFC) + 44;
      return result;
    }
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(void *)(a2 + 24) = v13;
  return result;
}

_DWORD *_XGetDisplayIdentifiersForExternalAccessoryProtocols(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0
    || (int v3 = result, v4 = result[1], v4 < 0x28)
    || v4 > 0x428
    || ((unsigned int v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = v4 == v7) : (v8 = 0),
        !v8 || (uint64_t result = memchr(result + 10, 0, v4 - 40)) == 0))
  {
    int v9 = -304;
LABEL_12:
    *(_DWORD *)(a2 + 32) = v9;
    goto LABEL_13;
  }
  uint64_t v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v10 || *((_DWORD *)v10 + 1) <= 0x1Fu)
  {
    int v9 = -309;
    goto LABEL_12;
  }
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  uint64_t v11 = v3[3];
  long long v12 = *(_OWORD *)(v10 + 36);
  v13[0] = *(_OWORD *)(v10 + 20);
  v13[1] = v12;
  uint64_t result = (_DWORD *)_SBMigGetDisplayIdentifiersForExternalAccessoryProtocols(v11, (uint64_t)(v3 + 10), (void *)(a2 + 28), (_DWORD *)(a2 + 52), v13);
  if (!result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_13:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XGetIconState(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 0;
  uint64_t v4 = (_DWORD *)(a2 + 52);
  unsigned int v5 = (void *)(a2 + 28);
  *(_DWORD *)(a2 + 36) = 16777472;
  uint64_t v6 = *(unsigned int *)(result + 12);
  uint64_t v7 = *(unsigned __int8 *)(result + 32);
  long long v8 = *(_OWORD *)(result + 72);
  v9[0] = *(_OWORD *)(result + 56);
  v9[1] = v8;
  uint64_t result = _SBMigGetIconState(v6, v7, v5, v4, v9);
  if (!result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XGetPendingIconState(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 0;
  uint64_t v4 = (_DWORD *)(a2 + 52);
  unsigned int v5 = (void *)(a2 + 28);
  *(_DWORD *)(a2 + 36) = 16777472;
  uint64_t v6 = *(unsigned int *)(result + 12);
  uint64_t v7 = *(unsigned __int8 *)(result + 32);
  long long v8 = *(_OWORD *)(result + 72);
  v9[0] = *(_OWORD *)(result + 56);
  v9[1] = v8;
  uint64_t result = _SBMigGetPendingIconState(v6, v7, v5, v4, v9);
  if (!result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XGetFlattenedIconState(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 0;
  uint64_t v4 = (_DWORD *)(a2 + 52);
  unsigned int v5 = (void *)(a2 + 28);
  *(_DWORD *)(a2 + 36) = 16777472;
  uint64_t v6 = *(unsigned int *)(result + 12);
  uint64_t v7 = *(unsigned __int8 *)(result + 32);
  long long v8 = *(_OWORD *)(result + 72);
  v9[0] = *(_OWORD *)(result + 56);
  v9[1] = v8;
  uint64_t result = _SBMigGetFlattenedIconState(v6, v7, v5, v4, v9);
  if (!result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

void _XSetIconState(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(unsigned char *)(a1 + 39) == 1 && (uint64_t v4 = *(unsigned int *)(a1 + 40), v4 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        uint64_t v6 = *(unsigned int *)(a1 + 12);
        uint64_t v7 = *(void *)(a1 + 28);
        long long v8 = *(_OWORD *)(a1 + 92);
        v9[0] = *(_OWORD *)(a1 + 76);
        v9[1] = v8;
        *(_DWORD *)(a2 + 32) = _SBMigSetIconState(v6, v7, v4, v9);
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 28) = 0;
        *(_DWORD *)(a1 + 40) = 0;
        goto LABEL_11;
      }
      int v5 = -309;
    }
    else
    {
      int v5 = -300;
    }
  }
  else
  {
    int v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
LABEL_11:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

_DWORD *_XSetApplicationBadgeNumber(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  if (v4 < 0x2C) {
    goto LABEL_16;
  }
  if (v4 > 0x42C) {
    goto LABEL_16;
  }
  unsigned int v5 = result[9];
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || v4 != v6 + 44) {
    goto LABEL_16;
  }
  uint64_t v8 = 1064;
  if (result[1] < 0x428uLL) {
    uint64_t v8 = result[1];
  }
  uint64_t result = memchr(result + 10, 0, v8 - 40);
  if (result)
  {
    int v9 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      uint64_t v11 = v3[3];
      uint64_t v12 = *(unsigned int *)((char *)v3 + v6 + 40);
      long long v13 = *(_OWORD *)(v9 + 36);
      v14[0] = *(_OWORD *)(v9 + 20);
      v14[1] = v13;
      uint64_t result = (_DWORD *)_SBMigSetApplicationBadgeNumber(v11, (uint64_t)(v3 + 10), v12, v14);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v10 = -309;
  }
  else
  {
LABEL_16:
    int v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XSetApplicationBadgeString(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_17;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  if (v4 < 0x30) {
    goto LABEL_17;
  }
  if (v4 > 0x830) {
    goto LABEL_17;
  }
  unsigned int v5 = result[9];
  if (v5 > 0x400) {
    goto LABEL_17;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 48 < v5 || v4 < v6 + 48) {
    goto LABEL_17;
  }
  int v8 = v4 - v6;
  int v9 = (char *)result + v6;
  unsigned int v10 = *((_DWORD *)v9 + 11);
  BOOL v11 = v10 <= 0x400 && v8 - 48 >= v10;
  unsigned int v12 = ((v10 + 3) & 0xFFFFFFFC) + 48;
  if (!v11 || v8 != v12) {
    goto LABEL_17;
  }
  uint64_t v15 = 1064;
  if (result[1] < 0x428uLL) {
    uint64_t v15 = result[1];
  }
  uint64_t result = memchr(result + 10, 0, v15 - 40);
  if (result
    && ((int v16 = v9 + 48, (char *)v3 + v4 - v16 >= 1024) ? (v17 = 1024) : (v17 = (char *)v3 + v4 - v16),
        (uint64_t result = memchr(v16, 0, v17)) != 0))
  {
    long long v18 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v18 && *((_DWORD *)v18 + 1) > 0x1Fu)
    {
      uint64_t v19 = v3[3];
      long long v20 = *(_OWORD *)(v18 + 36);
      v21[0] = *(_OWORD *)(v18 + 20);
      v21[1] = v20;
      uint64_t result = (_DWORD *)_SBMigSetApplicationBadgeString(v19, (uint64_t)(v3 + 10), (uint64_t)v16, v21);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v14 = -309;
  }
  else
  {
LABEL_17:
    int v14 = -304;
  }
  *(_DWORD *)(a2 + 32) = v14;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XGetIconPNGData(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  if (v4 < 0x2C) {
    goto LABEL_16;
  }
  if (v4 > 0x42C) {
    goto LABEL_16;
  }
  unsigned int v5 = result[9];
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || v4 != v6 + 44) {
    goto LABEL_16;
  }
  uint64_t v8 = 1064;
  if (result[1] < 0x428uLL) {
    uint64_t v8 = result[1];
  }
  uint64_t result = memchr(result + 10, 0, v8 - 40);
  if (!result)
  {
LABEL_16:
    int v10 = -304;
    goto LABEL_17;
  }
  int v9 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v9 || *((_DWORD *)v9 + 1) <= 0x1Fu)
  {
    int v10 = -309;
LABEL_17:
    *(_DWORD *)(a2 + 32) = v10;
    goto LABEL_18;
  }
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  uint64_t v11 = v3[3];
  uint64_t v12 = *((unsigned __int8 *)v3 + v6 + 40);
  long long v13 = *(_OWORD *)(v9 + 36);
  v14[0] = *(_OWORD *)(v9 + 20);
  v14[1] = v13;
  uint64_t result = (_DWORD *)_SBMigGetIconPNGData(v11, (uint64_t)(v3 + 10), v12, (void *)(a2 + 28), (_DWORD *)(a2 + 52), v14);
  if (!result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_18:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t SpringBoardUtility_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 200018) >= 0xFFFFFFEE
    && (unsigned int v5 = (void (*)(void))_SBMigSpringBoardUtility_subsystem[5 * (v4 - 200000) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t _SBSSuspendFrontmostApp(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x186A000000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _SBSInterruptKeybagRefetch(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x186A100000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _SBSGetActiveInterfaceOrientation(int a1, _DWORD *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x186A200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 100102)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

uint64_t _SBSPresentPowerDownUI(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x186A300000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _SBSReboot(int a1)
{
  uint64_t v7 = 0;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x186A400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0) {
    goto LABEL_14;
  }
  if (v3)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v4 - 268435459) > 1) {
      return v4;
    }
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
LABEL_19:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v4;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    uint64_t v4 = 4294966988;
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[20] != 100104)
  {
    uint64_t v4 = 4294966995;
    goto LABEL_19;
  }
  uint64_t v4 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0) {
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[4] != 36) {
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[8]) {
    goto LABEL_19;
  }
  uint64_t v4 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32]) {
    goto LABEL_19;
  }
  return v4;
}

uint64_t _SBSShutDown(int a1)
{
  uint64_t v7 = 0;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x186A500000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0) {
    goto LABEL_14;
  }
  if (v3)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v4 - 268435459) > 1) {
      return v4;
    }
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
LABEL_19:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v4;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    uint64_t v4 = 4294966988;
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[20] != 100105)
  {
    uint64_t v4 = 4294966995;
    goto LABEL_19;
  }
  uint64_t v4 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0) {
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[4] != 36) {
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[8]) {
    goto LABEL_19;
  }
  uint64_t v4 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32]) {
    goto LABEL_19;
  }
  return v4;
}

uint64_t _SBSEnableLockScreenBundle(mach_port_t a1, char a2, char *src, uint64_t a4, unsigned int a5)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  memset(v17, 0, 448);
  *(_OWORD *)&v16[8] = 0u;
  memset(&name, 0, sizeof(name));
  int v13 = 1;
  uint64_t v14 = a4;
  int v15 = 16777472;
  *(void *)int v16 = a5;
  *(void *)&v16[4] = *MEMORY[0x1E4F14068];
  v16[12] = a2;
  *(_WORD *)&v16[13] = 0;
  v16[15] = 0;
  if (MEMORY[0x1E4F149B0]) {
    int v7 = mig_strncpy_zerofill((char *)v17, src, 1024);
  }
  else {
    int v7 = mig_strncpy((char *)v17, src, 1024);
  }
  *(_DWORD *)&v16[16] = 0;
  *(_DWORD *)&v16[20] = v7;
  uint64_t v8 = (v7 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v9 = v8 + 68;
  *(_DWORD *)((char *)v17 + v8) = a5;
  name.msgh_bits = -2147483629;
  name.uint64_t msgh_remote_port = a1;
  name.msgh_local_port = 0;
  *(void *)&name.msgh_voucher_port = 0x186A600000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&name);
  }
  uint64_t v10 = mach_msg(&name, 2097153, v9, 0, 0, 0, 0);
  if ((v10 - 268435459) <= 1)
  {
    if ((name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name.msgh_local_port);
    }
    mach_msg_destroy(&name);
  }
  return v10;
}

uint64_t _SBSLockDevice(mach_port_t a1, char a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  char v6 = a2;
  __int16 v7 = 0;
  char v8 = 0;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100008;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSShowNetworkPromptsIfNecessary(mach_port_t a1, char a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  char v6 = a2;
  __int16 v7 = 0;
  char v8 = 0;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100009;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSGetCurrentBacklightFactor(int a1, _DWORD *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x186AA00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 100110)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

uint64_t _SBSDimScreen(mach_port_t a1, char a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  char v6 = a2;
  __int16 v7 = 0;
  char v8 = 0;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100011;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSAddWebClipToHomeScreen(mach_port_name_t a1, const char *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memset(v11, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v10 = 0u;
  *((void *)&v10 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v3 = mig_strncpy_zerofill((char *)v11 + 8, a2, 1024);
  }
  else {
    int v3 = mig_strncpy((char *)v11 + 8, a2, 1024);
  }
  LODWORD(v11[0]) = 0;
  DWORD1(v11[0]) = v3;
  mach_msg_size_t v4 = ((v3 + 3) & 0xFFFFFFFC) + 40;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v10 = 0x186AC00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v4, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0) {
    goto LABEL_17;
  }
  if (v6)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v7 - 268435459) > 1) {
      return v7;
    }
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
LABEL_22:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v7;
  }
  if (DWORD1(v10) == 71)
  {
    uint64_t v7 = 4294966988;
    goto LABEL_22;
  }
  if (DWORD1(v10) != 100112)
  {
    uint64_t v7 = 4294966995;
    goto LABEL_22;
  }
  uint64_t v7 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0) {
    goto LABEL_22;
  }
  if (rcv_name[1] != 36) {
    goto LABEL_22;
  }
  if (rcv_name[2]) {
    goto LABEL_22;
  }
  uint64_t v7 = LODWORD(v11[0]);
  if (LODWORD(v11[0])) {
    goto LABEL_22;
  }
  return v7;
}

uint64_t _SBSRemoveWebClipFromHomeScreen(mach_port_name_t a1, const char *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memset(v11, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v10 = 0u;
  *((void *)&v10 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v3 = mig_strncpy_zerofill((char *)v11 + 8, a2, 1024);
  }
  else {
    int v3 = mig_strncpy((char *)v11 + 8, a2, 1024);
  }
  LODWORD(v11[0]) = 0;
  DWORD1(v11[0]) = v3;
  mach_msg_size_t v4 = ((v3 + 3) & 0xFFFFFFFC) + 40;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v10 = 0x186AD00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v4, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0) {
    goto LABEL_17;
  }
  if (v6)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v7 - 268435459) > 1) {
      return v7;
    }
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
LABEL_22:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v7;
  }
  if (DWORD1(v10) == 71)
  {
    uint64_t v7 = 4294966988;
    goto LABEL_22;
  }
  if (DWORD1(v10) != 100113)
  {
    uint64_t v7 = 4294966995;
    goto LABEL_22;
  }
  uint64_t v7 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0) {
    goto LABEL_22;
  }
  if (rcv_name[1] != 36) {
    goto LABEL_22;
  }
  if (rcv_name[2]) {
    goto LABEL_22;
  }
  uint64_t v7 = LODWORD(v11[0]);
  if (LODWORD(v11[0])) {
    goto LABEL_22;
  }
  return v7;
}

uint64_t _SBSReloadIconForIdentifier(mach_port_name_t a1, const char *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(v9, 0, 480);
  *(_OWORD *)mach_msg_header_t name = 0u;
  long long v8 = 0u;
  *((void *)&v8 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 1024);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 1024);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  mach_msg_size_t v4 = ((v3 + 3) & 0xFFFFFFFC) + 40;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(void *)&long long v8 = 0x186AE00000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)name);
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)name, 2097153, v4, 0, 0, 0, 0);
  if ((v5 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name[3]);
    }
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v5;
}

uint64_t _SBSAddDownloadingIconForDisplayIdentifier(mach_port_name_t a1, const char *a2, const char *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  memset(v20, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v19 = 0u;
  *((void *)&v19 + 1) = *MEMORY[0x1E4F14068];
  uint64_t v5 = MEMORY[0x1E4F149B0];
  if (MEMORY[0x1E4F149B0]) {
    int v6 = mig_strncpy_zerofill((char *)v20 + 8, a2, 1024);
  }
  else {
    int v6 = mig_strncpy((char *)v20 + 8, a2, 1024);
  }
  LODWORD(v20[0]) = 0;
  DWORD1(v20[0]) = v6;
  uint64_t v7 = (v6 + 3) & 0xFFFFFFFC;
  int v8 = v7 + 48;
  int v9 = (char *)rcv_name + v7;
  uint64_t v10 = v9 - 1024;
  uint64_t v11 = v9 + 48;
  if (v5) {
    int v12 = mig_strncpy_zerofill(v11, a3, 1024);
  }
  else {
    int v12 = mig_strncpy(v11, a3, 1024);
  }
  *((_DWORD *)v10 + 267) = v12;
  *((_DWORD *)v10 + 266) = 0;
  mach_msg_size_t v13 = v8 + ((v12 + 3) & 0xFFFFFFFC);
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v19 = 0x186AF00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v15 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v13, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v16 = v15;
  if ((v15 - 268435458) <= 0xE && ((1 << (v15 - 2)) & 0x4003) != 0) {
    goto LABEL_20;
  }
  if (v15)
  {
    mig_dealloc_special_reply_port();
LABEL_20:
    if ((v16 - 268435459) > 1) {
      return v16;
    }
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
LABEL_25:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v16;
  }
  if (DWORD1(v19) == 71)
  {
    uint64_t v16 = 4294966988;
    goto LABEL_25;
  }
  if (DWORD1(v19) != 100115)
  {
    uint64_t v16 = 4294966995;
    goto LABEL_25;
  }
  uint64_t v16 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0) {
    goto LABEL_25;
  }
  if (rcv_name[1] != 36) {
    goto LABEL_25;
  }
  if (rcv_name[2]) {
    goto LABEL_25;
  }
  uint64_t v16 = LODWORD(v20[0]);
  if (LODWORD(v20[0])) {
    goto LABEL_25;
  }
  return v16;
}

uint64_t _SBSScrollToIconWithDisplayIdentifier(mach_port_name_t a1, const char *a2, char a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  memset(v13, 0, 480);
  *(_OWORD *)mach_msg_header_t name = 0u;
  long long v12 = 0u;
  *((void *)&v12 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v5 = mig_strncpy_zerofill((char *)v13 + 8, a2, 1024);
  }
  else {
    int v5 = mig_strncpy((char *)v13 + 8, a2, 1024);
  }
  LODWORD(v13[0]) = 0;
  DWORD1(v13[0]) = v5;
  uint64_t v6 = (v5 + 3) & 0xFFFFFFFC;
  uint64_t v7 = (char *)name + v6;
  v7[40] = a3;
  *(_WORD *)(v7 + 41) = 0;
  v7[43] = 0;
  mach_msg_size_t v8 = v6 + 44;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(void *)&long long v12 = 0x186B000000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)name);
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)name, 2097153, v8, 0, 0, 0, 0);
  if ((v9 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name[3]);
    }
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v9;
}

uint64_t _SBSGetNowPlayingAppBundleIdentifier(mach_port_t a1, char *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  memset(&msg[20].msgh_size, 0, 28);
  memset(&msg[1].msgh_local_port, 0, 448);
  *(_OWORD *)&msg[0].msgh_id = 0u;
  msg[0].msgh_size = 0;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg[0].uint64_t msgh_remote_port = a1;
  msg[0].msgh_local_port = special_reply_port;
  msg[0].msgh_bits = 5395;
  *(void *)&msg[0].msgh_voucher_port = 0x186B100000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(msg);
    mach_port_t special_reply_port = msg[0].msgh_local_port;
  }
  uint64_t v5 = mach_msg(msg, 3162115, 0x18u, 0x434u, special_reply_port, 0, 0);
  uint64_t msgh_remote_port = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (msg[0].msgh_id == 71)
      {
        uint64_t msgh_remote_port = 4294966988;
      }
      else if (msg[0].msgh_id == 100117)
      {
        if ((msg[0].msgh_bits & 0x80000000) == 0)
        {
          if (msg[0].msgh_size - 1069 <= 0xFFFFFBFE)
          {
            if (msg[0].msgh_remote_port) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = msg[1].msgh_remote_port == 0;
            }
            if (!v7 && msg[0].msgh_size == 36) {
              uint64_t msgh_remote_port = msg[1].msgh_remote_port;
            }
            else {
              uint64_t msgh_remote_port = 4294966996;
            }
            goto LABEL_27;
          }
          if (!msg[0].msgh_remote_port)
          {
            uint64_t msgh_remote_port = msg[1].msgh_remote_port;
            if (!msg[1].msgh_remote_port)
            {
              uint64_t msgh_remote_port = 4294966996;
              if (msg[1].msgh_voucher_port <= 0x400
                && msg[0].msgh_size - 44 >= msg[1].msgh_voucher_port
                && msg[0].msgh_size == ((msg[1].msgh_voucher_port + 3) & 0xFFFFFFFC) + 44)
              {
                mig_strncpy(a2, (const char *)&msg[1].msgh_id, 1024);
                return 0;
              }
            }
            goto LABEL_27;
          }
        }
        uint64_t msgh_remote_port = 4294966996;
      }
      else
      {
        uint64_t msgh_remote_port = 4294966995;
      }
LABEL_27:
      mach_msg_destroy(msg);
      return msgh_remote_port;
    }
    mig_dealloc_special_reply_port();
  }
  if ((msgh_remote_port - 268435459) <= 1)
  {
    if ((msg[0].msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg[0].msgh_local_port);
    }
    goto LABEL_27;
  }
  return msgh_remote_port;
}

uint64_t _SBSGetTopButtonFrames(int a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v27 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  *(_DWORD *)&msg[4] = 0;
  *(_OWORD *)&msg[20] = 0u;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x186B200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v18 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x6Cu, special_reply_port, 0, 0);
  uint64_t v19 = v18;
  if ((v18 - 268435458) > 0xE || ((1 << (v18 - 2)) & 0x4003) == 0)
  {
    if (!v18)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v19 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 100118)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 100)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v19 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a2 = v23;
                *a3 = *((void *)&v23 + 1);
                *a4 = v24;
                *a5 = *((void *)&v24 + 1);
                *a6 = v25;
                *a7 = *((void *)&v25 + 1);
                *a8 = v26;
                *a9 = *((void *)&v26 + 1);
                return v19;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v20 = 1;
            }
            else {
              BOOL v20 = *(_DWORD *)&msg[32] == 0;
            }
            if (v20) {
              uint64_t v19 = 4294966996;
            }
            else {
              uint64_t v19 = *(unsigned int *)&msg[32];
            }
            goto LABEL_25;
          }
        }
        uint64_t v19 = 4294966996;
      }
      else
      {
        uint64_t v19 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v19;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v19 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_25;
  }
  return v19;
}

uint64_t _SBSGetApplicationNetworkFlags(int a1, unsigned char *a2, unsigned char *a3)
{
  *(_OWORD *)&msg[20] = 0u;
  long long v12 = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x186B400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 100120)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v8 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a2 = v12;
                *a3 = BYTE4(v12);
                return v8;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = *(_DWORD *)&msg[32] == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = *(unsigned int *)&msg[32];
            }
            goto LABEL_25;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_25;
  }
  return v8;
}

uint64_t _SBSAppSwitcherServiceRegister(mach_port_t a1, int a2, char *src, const char *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  memset(v23, 0, 464);
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v20 = 1;
  int v21 = a2;
  DWORD1(v22) = 1310720;
  *((void *)&v22 + 1) = *MEMORY[0x1E4F14068];
  uint64_t v6 = MEMORY[0x1E4F149B0];
  if (MEMORY[0x1E4F149B0]) {
    int v7 = mig_strncpy_zerofill((char *)v23 + 8, src, 1024);
  }
  else {
    int v7 = mig_strncpy((char *)v23 + 8, src, 1024);
  }
  LODWORD(v23[0]) = 0;
  DWORD1(v23[0]) = v7;
  uint64_t v8 = (v7 + 3) & 0xFFFFFFFC;
  int v9 = v8 + 64;
  uint64_t v10 = (char *)&rcv_name + v8;
  uint64_t v11 = v10 - 1024;
  long long v12 = v10 + 64;
  if (v6) {
    int v13 = mig_strncpy_zerofill(v12, a4, 1024);
  }
  else {
    int v13 = mig_strncpy(v12, a4, 1024);
  }
  *((_DWORD *)v11 + 271) = v13;
  *((_DWORD *)v11 + 270) = 0;
  mach_msg_size_t v14 = v9 + ((v13 + 3) & 0xFFFFFFFC);
  mach_port_t special_reply_port = mig_get_special_reply_port();
  rcv_name.uint64_t msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(void *)&rcv_name.msgh_voucher_port = 0x186B500000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t special_reply_port = rcv_name.msgh_local_port;
  }
  uint64_t v16 = mach_msg(&rcv_name, 3162115, v14, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v17 = v16;
  if ((v16 - 268435458) <= 0xE && ((1 << (v16 - 2)) & 0x4003) != 0) {
    goto LABEL_20;
  }
  if (v16)
  {
    mig_dealloc_special_reply_port();
LABEL_20:
    if ((v17 - 268435459) > 1) {
      return v17;
    }
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
LABEL_25:
    mach_msg_destroy(&rcv_name);
    return v17;
  }
  if (rcv_name.msgh_id == 71)
  {
    uint64_t v17 = 4294966988;
    goto LABEL_25;
  }
  if (rcv_name.msgh_id != 100121)
  {
    uint64_t v17 = 4294966995;
    goto LABEL_25;
  }
  uint64_t v17 = 4294966996;
  if ((rcv_name.msgh_bits & 0x80000000) != 0) {
    goto LABEL_25;
  }
  if (rcv_name.msgh_size != 36) {
    goto LABEL_25;
  }
  if (rcv_name.msgh_remote_port) {
    goto LABEL_25;
  }
  uint64_t v17 = v22;
  if (v22) {
    goto LABEL_25;
  }
  return v17;
}

uint64_t _SBSSetVoiceControlEnabled(mach_port_t a1, char a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  char v6 = a2;
  __int16 v7 = 0;
  char v8 = 0;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100022;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSSetInterceptsMenuButton(mach_port_t a1, char a2, char a3)
{
  uint64_t v6 = *MEMORY[0x1E4F14068];
  char v7 = a2;
  __int16 v8 = 0;
  char v9 = 0;
  char v10 = a3;
  __int16 v11 = 0;
  char v12 = 0;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100023;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v3 = mach_msg(&msg, 2097153, 0x28u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v3;
}

uint64_t _SBSSetWantsLockButtonEvents(mach_port_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  int v6 = a2;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100024;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSGetMediaVolume(int a1, _DWORD *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x186B900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 100125)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

uint64_t _SBSSetMediaVolume(mach_port_t a1, float a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  float v6 = a2;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100026;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSGetHomeScreenIconMetrics(int a1, void *a2, void *a3, void *a4, void *a5, _DWORD *a6, _DWORD *a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int v37 = 0;
  long long v36 = 0u;
  long long v35 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  *(_OWORD *)&rcv_name_12[4] = 0u;
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v28 = 5395;
  *(void *)rcv_name_12 = 0x186BB00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v28);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v21 = mach_msg((mach_msg_header_t *)&v28, 3162115, 0x18u, 0x68u, special_reply_port, 0, 0);
  uint64_t v22 = v21;
  if ((v21 - 268435458) > 0xE || ((1 << (v21 - 2)) & 0x4003) == 0)
  {
    if (!v21)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v22 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 100127)
      {
        if ((v28 & 0x80000000) == 0)
        {
          if (rcv_name == 96)
          {
            if (!rcv_name_4)
            {
              uint64_t v22 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = v33;
                *a3 = *((void *)&v33 + 1);
                *a4 = v34;
                *a5 = *((void *)&v34 + 1);
                int v25 = DWORD1(v35);
                *a6 = v35;
                *a7 = v25;
                int v26 = HIDWORD(v35);
                *a8 = DWORD2(v35);
                *a9 = v26;
                int v27 = DWORD1(v36);
                *a10 = v36;
                *a11 = v27;
                *a12 = DWORD2(v36);
                return v22;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v23 = 1;
            }
            else {
              BOOL v23 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v23) {
              uint64_t v22 = 4294966996;
            }
            else {
              uint64_t v22 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v22 = 4294966996;
      }
      else
      {
        uint64_t v22 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v28);
      return v22;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v22 - 268435459) <= 1)
  {
    if ((v28 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v22;
}

uint64_t _SBSFlashColor(mach_port_t a1, float a2, float a3, float a4)
{
  uint64_t v10 = *MEMORY[0x1E4F14068];
  float v11 = a2;
  float v12 = a3;
  float v13 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v9.msgh_bits = 5395;
  v9.uint64_t msgh_remote_port = a1;
  v9.msgh_local_port = special_reply_port;
  *(void *)&v9.msgh_voucher_port = 0x186BC00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v9);
    mach_port_t special_reply_port = v9.msgh_local_port;
  }
  uint64_t v6 = mach_msg(&v9, 3162115, 0x2Cu, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0) {
    goto LABEL_13;
  }
  if (v6)
  {
    mig_dealloc_special_reply_port();
LABEL_13:
    if ((v7 - 268435459) > 1) {
      return v7;
    }
    if ((v9.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v9.msgh_local_port);
    }
LABEL_18:
    mach_msg_destroy(&v9);
    return v7;
  }
  if (v9.msgh_id == 71)
  {
    uint64_t v7 = 4294966988;
    goto LABEL_18;
  }
  if (v9.msgh_id != 100128)
  {
    uint64_t v7 = 4294966995;
    goto LABEL_18;
  }
  uint64_t v7 = 4294966996;
  if ((v9.msgh_bits & 0x80000000) != 0) {
    goto LABEL_18;
  }
  if (*(void *)&v9.msgh_size != 36) {
    goto LABEL_18;
  }
  uint64_t v7 = LODWORD(v11);
  if (v11 != 0.0) {
    goto LABEL_18;
  }
  return v7;
}

uint64_t _SBSProgrammaticSwitchAppGestureMoveToLeft(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x186BD00000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _SBSProgrammaticSwitchAppGestureMoveToRight(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x186BE00000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _SBSSetVoiceRecognitionAudioInputPaths(int a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v7 = 16777472;
  int v8 = a3;
  uint64_t v9 = *MEMORY[0x1E4F14068];
  int v10 = a3;
  *(void *)mach_msg_header_t msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18FC490C0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _SBSSetAssistantRecognitionStrings(int a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v7 = 16777472;
  int v8 = a3;
  uint64_t v9 = *MEMORY[0x1E4F14068];
  int v10 = a3;
  *(void *)mach_msg_header_t msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18FC490D0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _SBSSetAlertSuppressionContextsBySectionIdentifier(int a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v7 = 16777472;
  int v8 = a3;
  uint64_t v9 = *MEMORY[0x1E4F14068];
  int v10 = a3;
  *(void *)mach_msg_header_t msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18FC490F0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _SBSSetAppIsConnectedToEA(mach_port_t a1, int a2, char a3)
{
  uint64_t v6 = *MEMORY[0x1E4F14068];
  int v7 = a2;
  char v8 = a3;
  __int16 v9 = 0;
  char v10 = 0;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100035;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v3 = mach_msg(&msg, 2097153, 0x28u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v3;
}

uint64_t _SBSLockDeviceAndFeatures(mach_port_t a1, char a2, char a3)
{
  uint64_t v6 = *MEMORY[0x1E4F14068];
  char v7 = a2;
  __int16 v8 = 0;
  char v9 = 0;
  char v10 = a3;
  __int16 v11 = 0;
  char v12 = 0;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100036;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v3 = mach_msg(&msg, 2097153, 0x28u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v3;
}

uint64_t _SBSActivateAssistantWithContext(mach_port_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v10 = 1;
  uint64_t v11 = a3;
  int v12 = 16777472;
  int v13 = a4;
  uint64_t v14 = *MEMORY[0x1E4F14068];
  int v15 = a2;
  int v16 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 2147489043;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x186C500000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v6 = mach_msg(&msg, 3162115, 0x3Cu, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0) {
    goto LABEL_14;
  }
  if (v6)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v7 - 268435459) > 1) {
      return v7;
    }
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
LABEL_19:
    mach_msg_destroy(&msg);
    return v7;
  }
  if (msg.msgh_id == 71)
  {
    uint64_t v7 = 4294966988;
    goto LABEL_19;
  }
  if (msg.msgh_id != 100137)
  {
    uint64_t v7 = 4294966995;
    goto LABEL_19;
  }
  uint64_t v7 = 4294966996;
  if ((msg.msgh_bits & 0x80000000) != 0) {
    goto LABEL_19;
  }
  if (msg.msgh_size != 36) {
    goto LABEL_19;
  }
  if (msg.msgh_remote_port) {
    goto LABEL_19;
  }
  uint64_t v7 = HIDWORD(v11);
  if (HIDWORD(v11)) {
    goto LABEL_19;
  }
  return v7;
}

uint64_t _SBSSetProceduralWallpaper(mach_port_t a1, const char *a2, char a3, uint64_t a4, unsigned int a5)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
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
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  *(_OWORD *)&v20[8] = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v17 = 1;
  uint64_t v18 = a4;
  int v19 = 16777472;
  *(void *)int v20 = a5;
  *(void *)&v20[4] = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v8 = mig_strncpy_zerofill(&v20[20], a2, 1024);
  }
  else {
    int v8 = mig_strncpy(&v20[20], a2, 1024);
  }
  *(_DWORD *)&v20[12] = 0;
  *(_DWORD *)&v20[16] = v8;
  uint64_t v9 = (v8 + 3) & 0xFFFFFFFC;
  int v10 = (char *)&rcv_name + v9;
  v10[60] = a3;
  *(_WORD *)(v10 + 61) = 0;
  v10[63] = 0;
  mach_msg_size_t v11 = v9 + 68;
  *((_DWORD *)v10 + 16) = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  rcv_name.uint64_t msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(void *)&rcv_name.msgh_voucher_port = 0x186C600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t special_reply_port = rcv_name.msgh_local_port;
  }
  uint64_t v13 = mach_msg(&rcv_name, 3162115, v11, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0) {
    goto LABEL_17;
  }
  if (v13)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v14 - 268435459) > 1) {
      return v14;
    }
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
LABEL_22:
    mach_msg_destroy(&rcv_name);
    return v14;
  }
  if (rcv_name.msgh_id == 71)
  {
    uint64_t v14 = 4294966988;
    goto LABEL_22;
  }
  if (rcv_name.msgh_id != 100138)
  {
    uint64_t v14 = 4294966995;
    goto LABEL_22;
  }
  uint64_t v14 = 4294966996;
  if ((rcv_name.msgh_bits & 0x80000000) != 0) {
    goto LABEL_22;
  }
  if (rcv_name.msgh_size != 36) {
    goto LABEL_22;
  }
  if (rcv_name.msgh_remote_port) {
    goto LABEL_22;
  }
  uint64_t v14 = HIDWORD(v18);
  if (HIDWORD(v18)) {
    goto LABEL_22;
  }
  return v14;
}

uint64_t _SBSSetWallpaperImageForLocations(mach_port_t a1, uint64_t a2, int a3, char a4, char a5, char a6, char a7, char *src, float a9, float a10, float a11, float a12, float a13, float a14, double a15, char a16, char a17, char a18, uint64_t a19, unsigned int a20,unsigned char *a21)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  memset(v42, 0, 384);
  long long v40 = 0u;
  long long v41 = 0u;
  *(_OWORD *)&v38[8] = 0u;
  long long v39 = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v32 = 2;
  uint64_t v33 = a2;
  int v34 = 16777472;
  int v35 = a3;
  uint64_t v36 = a19;
  int v37 = 16777472;
  *(void *)long long v38 = a20;
  *(void *)&v38[4] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&v38[12] = a3;
  v38[16] = a4;
  *(_WORD *)&v38[17] = 0;
  v38[19] = 0;
  *(float *)&v38[20] = a9;
  *(void *)&long long v39 = __PAIR64__(LODWORD(a11), LODWORD(a10));
  *((void *)&v39 + 1) = __PAIR64__(LODWORD(a13), LODWORD(a12));
  *(float *)&long long v40 = a14;
  BYTE4(v40) = a5;
  BYTE7(v40) = 0;
  *(_WORD *)((char *)&v40 + 5) = 0;
  BYTE8(v40) = a6;
  BYTE11(v40) = 0;
  *(_WORD *)((char *)&v40 + 9) = 0;
  BYTE12(v40) = a7;
  HIBYTE(v40) = 0;
  *(_WORD *)((char *)&v40 + 13) = 0;
  *(double *)&long long v41 = a15;
  if (MEMORY[0x1E4F149B0]) {
    int v22 = mig_strncpy_zerofill((char *)v42, src, 1024);
  }
  else {
    int v22 = mig_strncpy((char *)v42, src, 1024);
  }
  DWORD2(v41) = 0;
  HIDWORD(v41) = v22;
  uint64_t v23 = (v22 + 3) & 0xFFFFFFFC;
  long long v24 = (char *)&rcv_name + v23;
  v24[128] = a16;
  *(_WORD *)(v24 + 129) = 0;
  v24[131] = 0;
  v24[132] = a17;
  *(_WORD *)(v24 + 133) = 0;
  v24[135] = 0;
  v24[136] = a18;
  *(_WORD *)(v24 + 137) = 0;
  v24[139] = 0;
  mach_msg_size_t v25 = v23 + 144;
  *((_DWORD *)v24 + 35) = a20;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  rcv_name.uint64_t msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(void *)&rcv_name.msgh_voucher_port = 0x186C700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t special_reply_port = rcv_name.msgh_local_port;
  }
  uint64_t v27 = mach_msg(&rcv_name, 3162115, v25, 0x30u, special_reply_port, 0, 0);
  uint64_t v28 = v27;
  if ((v27 - 268435458) > 0xE || ((1 << (v27 - 2)) & 0x4003) == 0)
  {
    if (!v27)
    {
      if (rcv_name.msgh_id == 71)
      {
        uint64_t v28 = 4294966988;
      }
      else if (rcv_name.msgh_id == 100139)
      {
        if ((rcv_name.msgh_bits & 0x80000000) == 0)
        {
          if (rcv_name.msgh_size == 40)
          {
            if (!rcv_name.msgh_remote_port)
            {
              uint64_t v28 = HIDWORD(v33);
              if (!HIDWORD(v33))
              {
                *a21 = v34;
                return v28;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name.msgh_size == 36)
          {
            if (rcv_name.msgh_remote_port) {
              BOOL v29 = 1;
            }
            else {
              BOOL v29 = HIDWORD(v33) == 0;
            }
            if (v29) {
              uint64_t v28 = 4294966996;
            }
            else {
              uint64_t v28 = HIDWORD(v33);
            }
            goto LABEL_28;
          }
        }
        uint64_t v28 = 4294966996;
      }
      else
      {
        uint64_t v28 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy(&rcv_name);
      return v28;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v28 - 268435459) <= 1)
  {
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
    goto LABEL_28;
  }
  return v28;
}

uint64_t _SBSSetWallpaperImageSurfaceForLocations(mach_port_t a1, int a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, char a8, float a9, float a10, float a11, float a12, float a13, float a14, double a15, char a16, char a17, char a18, char *src, char a20,char a21,char a22,uint64_t a23,int a24,unsigned char *a25)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  *(_OWORD *)&v51[16] = 0u;
  long long v52 = 0u;
  long long v50 = 0u;
  *(_OWORD *)v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v38 = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v36 = 5;
  int v37 = a2;
  DWORD1(v38) = 1245184;
  DWORD2(v38) = a3;
  int v39 = 1245184;
  uint64_t v40 = a4;
  int v41 = 16777472;
  int v42 = a5;
  uint64_t v43 = a6;
  int v44 = 16777472;
  int v45 = a7;
  uint64_t v46 = a23;
  int v47 = 16777472;
  LODWORD(v48) = a24;
  *(void *)((char *)&v48 + 4) = *MEMORY[0x1E4F14068];
  HIDWORD(v48) = a5;
  LODWORD(v49) = a7;
  BYTE4(v49) = a8;
  BYTE7(v49) = 0;
  *(_WORD *)((char *)&v49 + 5) = 0;
  *((void *)&v49 + 1) = __PAIR64__(LODWORD(a10), LODWORD(a9));
  *(void *)&long long v50 = __PAIR64__(LODWORD(a12), LODWORD(a11));
  *((void *)&v50 + 1) = __PAIR64__(LODWORD(a14), LODWORD(a13));
  v51[0] = a16;
  v51[3] = 0;
  *(_WORD *)&v51[1] = 0;
  v51[4] = a17;
  v51[7] = 0;
  *(_WORD *)&v51[5] = 0;
  v51[8] = a18;
  v51[11] = 0;
  *(_WORD *)&v51[9] = 0;
  *(double *)&v51[12] = a15;
  if (MEMORY[0x1E4F149B0]) {
    int v26 = mig_strncpy_zerofill(&v51[28], src, 1024);
  }
  else {
    int v26 = mig_strncpy(&v51[28], src, 1024);
  }
  *(_DWORD *)&v51[20] = 0;
  *(_DWORD *)&v51[24] = v26;
  uint64_t v27 = (v26 + 3) & 0xFFFFFFFC;
  uint64_t v28 = (char *)&rcv_name + v27;
  v28[172] = a20;
  *(_WORD *)(v28 + 173) = 0;
  v28[175] = 0;
  v28[176] = a21;
  *(_WORD *)(v28 + 177) = 0;
  v28[179] = 0;
  v28[180] = a22;
  *(_WORD *)(v28 + 181) = 0;
  v28[183] = 0;
  mach_msg_size_t v29 = v27 + 188;
  *((_DWORD *)v28 + 46) = a24;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  rcv_name.uint64_t msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(void *)&rcv_name.msgh_voucher_port = 0x186C800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t special_reply_port = rcv_name.msgh_local_port;
  }
  uint64_t v31 = mach_msg(&rcv_name, 3162115, v29, 0x30u, special_reply_port, 0, 0);
  uint64_t v32 = v31;
  if ((v31 - 268435458) > 0xE || ((1 << (v31 - 2)) & 0x4003) == 0)
  {
    if (!v31)
    {
      if (rcv_name.msgh_id == 71)
      {
        uint64_t v32 = 4294966988;
      }
      else if (rcv_name.msgh_id == 100140)
      {
        if ((rcv_name.msgh_bits & 0x80000000) == 0)
        {
          if (rcv_name.msgh_size == 40)
          {
            if (!rcv_name.msgh_remote_port)
            {
              uint64_t v32 = v38;
              if (!v38)
              {
                *a25 = BYTE4(v38);
                return v32;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name.msgh_size == 36)
          {
            if (rcv_name.msgh_remote_port) {
              BOOL v33 = 1;
            }
            else {
              BOOL v33 = v38 == 0;
            }
            if (v33) {
              uint64_t v32 = 4294966996;
            }
            else {
              uint64_t v32 = v38;
            }
            goto LABEL_28;
          }
        }
        uint64_t v32 = 4294966996;
      }
      else
      {
        uint64_t v32 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy(&rcv_name);
      return v32;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v32 - 268435459) <= 1)
  {
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
    goto LABEL_28;
  }
  return v32;
}

uint64_t _SBSClearWallpaperAsset(int a1, unsigned char *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x186C900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 100141)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

uint64_t _SBSGetWallpaperOptions(int a1, char a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6, _DWORD *a7, _DWORD *a8, unsigned char *a9, unsigned char *a10, unsigned char *a11, void *a12, void *a13, _DWORD *a14)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&msg[20] = 0u;
  long long v30 = 0u;
  uint64_t v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x1E4F14068];
  msg[32] = a2;
  *(_WORD *)&msg[33] = 0;
  msg[35] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x186CA00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v22 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x6Cu, special_reply_port, 0, 0);
  uint64_t v23 = v22;
  if ((v22 - 268435458) > 0xE || ((1 << (v22 - 2)) & 0x4003) == 0)
  {
    if (!v22)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v23 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 100142)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v23 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v23 = 4294966996;
              }
              else {
                uint64_t v23 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v23 = 4294966996;
          }
          goto LABEL_27;
        }
        uint64_t v23 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 100 && !*(_DWORD *)&msg[8] && BYTE3(v30) == 1)
        {
          int v24 = DWORD1(v30);
          if (DWORD1(v30) == HIDWORD(v33))
          {
            uint64_t v23 = 0;
            int v25 = DWORD1(v31);
            *a3 = v31;
            *a4 = v25;
            int v26 = HIDWORD(v31);
            *a5 = DWORD2(v31);
            *a6 = v26;
            int v27 = DWORD1(v32);
            *a7 = v32;
            *a8 = v27;
            *a9 = BYTE8(v32);
            *a10 = BYTE12(v32);
            *a11 = v33;
            *a12 = *(void *)((char *)&v33 + 4);
            *a13 = *(void *)&msg[28];
            *a14 = v24;
            return v23;
          }
        }
      }
      else
      {
        uint64_t v23 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v23;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v23 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_27;
  }
  return v23;
}

uint64_t _SBSSetWallpaperVariant(int a1, char a2, unsigned char *a3)
{
  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)int rcv_name = 0u;
  *(void *)&rcv_name[20] = *MEMORY[0x1E4F14068];
  rcv_name[28] = a2;
  *(_WORD *)&rcv_name[29] = 0;
  rcv_name[31] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_mach_port_name_t name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v10 = 5395;
  *(void *)&rcv_name[12] = 0x186CB00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 100143)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              uint64_t v7 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a3 = rcv_name[32];
                return v7;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4]) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name[28] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name[28];
            }
            goto LABEL_25;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v7 - 268435459) <= 1)
  {
    if ((v10 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&rcv_name[8]);
    }
    goto LABEL_25;
  }
  return v7;
}

uint64_t _SBSGetWallpaperLegibilitySettings(int a1, char a2, void *a3, _DWORD *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)int msg_4 = 0u;
  *(void *)&msg_4[20] = *MEMORY[0x1E4F14068];
  msg_4[28] = a2;
  *(_WORD *)&msg_4[29] = 0;
  msg_4[31] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = special_reply_port;
  int msg = 5395;
  *(void *)&msg_4[12] = 0x186CC00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg_4[8];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x24u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg_4[16] == 100144)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)msg_4 == 36)
          {
            uint64_t v9 = 4294966996;
            if (*(_DWORD *)&msg_4[28])
            {
              if (*(_DWORD *)&msg_4[4]) {
                uint64_t v9 = 4294966996;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg_4[28];
              }
            }
          }
          else
          {
            uint64_t v9 = 4294966996;
          }
          goto LABEL_27;
        }
        uint64_t v9 = 4294966996;
        if (*(_DWORD *)&msg_4[20] == 1 && *(_DWORD *)msg_4 == 56 && !*(_DWORD *)&msg_4[4] && msg_4[35] == 1)
        {
          int v10 = *(_DWORD *)&msg_4[36];
          if (*(_DWORD *)&msg_4[36] == *(_DWORD *)&msg_4[48])
          {
            uint64_t v9 = 0;
            *a3 = *(void *)&msg_4[24];
            *a4 = v10;
            return v9;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg_4[8]);
    }
    goto LABEL_27;
  }
  return v9;
}

uint64_t _SBSAddAlertItemsSuppressionAssertion(mach_port_t a1, const char *a2, int a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  memset(v14, 0, 464);
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v11 = 1;
  int v12 = a3;
  DWORD1(v13) = 1310720;
  *((void *)&v13 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v4 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  }
  else {
    int v4 = mig_strncpy((char *)v14 + 8, a2, 1024);
  }
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v4;
  mach_msg_size_t v5 = ((v4 + 3) & 0xFFFFFFFC) + 56;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  rcv_name.uint64_t msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(void *)&rcv_name.msgh_voucher_port = 0x186CD00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t special_reply_port = rcv_name.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&rcv_name, 3162115, v5, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0) {
    goto LABEL_17;
  }
  if (v7)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v8 - 268435459) > 1) {
      return v8;
    }
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
LABEL_22:
    mach_msg_destroy(&rcv_name);
    return v8;
  }
  if (rcv_name.msgh_id == 71)
  {
    uint64_t v8 = 4294966988;
    goto LABEL_22;
  }
  if (rcv_name.msgh_id != 100145)
  {
    uint64_t v8 = 4294966995;
    goto LABEL_22;
  }
  uint64_t v8 = 4294966996;
  if ((rcv_name.msgh_bits & 0x80000000) != 0) {
    goto LABEL_22;
  }
  if (rcv_name.msgh_size != 36) {
    goto LABEL_22;
  }
  if (rcv_name.msgh_remote_port) {
    goto LABEL_22;
  }
  uint64_t v8 = v13;
  if (v13) {
    goto LABEL_22;
  }
  return v8;
}

uint64_t _SBSIsReachabilityEnabled(int a1, unsigned char *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x186CF00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 100147)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

uint64_t _SBSSetReachabilityEnabled(mach_port_t a1, char a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  char v6 = a2;
  __int16 v7 = 0;
  char v8 = 0;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100048;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSOverrideDisplayedDate(mach_port_name_t a1, const char *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memset(v11, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v10 = 0u;
  *((void *)&v10 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v3 = mig_strncpy_zerofill((char *)v11 + 8, a2, 1024);
  }
  else {
    int v3 = mig_strncpy((char *)v11 + 8, a2, 1024);
  }
  LODWORD(v11[0]) = 0;
  DWORD1(v11[0]) = v3;
  mach_msg_size_t v4 = ((v3 + 3) & 0xFFFFFFFC) + 40;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v10 = 0x186D100000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v4, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0) {
    goto LABEL_17;
  }
  if (v6)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v7 - 268435459) > 1) {
      return v7;
    }
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
LABEL_22:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v7;
  }
  if (DWORD1(v10) == 71)
  {
    uint64_t v7 = 4294966988;
    goto LABEL_22;
  }
  if (DWORD1(v10) != 100149)
  {
    uint64_t v7 = 4294966995;
    goto LABEL_22;
  }
  uint64_t v7 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0) {
    goto LABEL_22;
  }
  if (rcv_name[1] != 36) {
    goto LABEL_22;
  }
  if (rcv_name[2]) {
    goto LABEL_22;
  }
  uint64_t v7 = LODWORD(v11[0]);
  if (LODWORD(v11[0])) {
    goto LABEL_22;
  }
  return v7;
}

uint64_t _SBSSetIdleText(mach_port_name_t a1, const char *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memset(v11, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v10 = 0u;
  *((void *)&v10 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v3 = mig_strncpy_zerofill((char *)v11 + 8, a2, 1024);
  }
  else {
    int v3 = mig_strncpy((char *)v11 + 8, a2, 1024);
  }
  LODWORD(v11[0]) = 0;
  DWORD1(v11[0]) = v3;
  mach_msg_size_t v4 = ((v3 + 3) & 0xFFFFFFFC) + 40;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v10 = 0x186D200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v4, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0) {
    goto LABEL_17;
  }
  if (v6)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v7 - 268435459) > 1) {
      return v7;
    }
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
LABEL_22:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v7;
  }
  if (DWORD1(v10) == 71)
  {
    uint64_t v7 = 4294966988;
    goto LABEL_22;
  }
  if (DWORD1(v10) != 100150)
  {
    uint64_t v7 = 4294966995;
    goto LABEL_22;
  }
  uint64_t v7 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0) {
    goto LABEL_22;
  }
  if (rcv_name[1] != 36) {
    goto LABEL_22;
  }
  if (rcv_name[2]) {
    goto LABEL_22;
  }
  uint64_t v7 = LODWORD(v11[0]);
  if (LODWORD(v11[0])) {
    goto LABEL_22;
  }
  return v7;
}

uint64_t _SBSSetTypingActive(mach_port_t a1, char a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  char v6 = a2;
  __int16 v7 = 0;
  char v8 = 0;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100051;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSTagTouchForTypingMenu(mach_port_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  int v6 = a2;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100052;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSAcquireFocusPreventingFullScreenPresentationAssertion(mach_port_t a1, const char *a2, int a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  memset(v14, 0, 464);
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v11 = 1;
  int v12 = a3;
  DWORD1(v13) = 1310720;
  *((void *)&v13 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v4 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  }
  else {
    int v4 = mig_strncpy((char *)v14 + 8, a2, 1024);
  }
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v4;
  mach_msg_size_t v5 = ((v4 + 3) & 0xFFFFFFFC) + 56;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  rcv_name.uint64_t msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(void *)&rcv_name.msgh_voucher_port = 0x186D500000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t special_reply_port = rcv_name.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&rcv_name, 3162115, v5, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0) {
    goto LABEL_17;
  }
  if (v7)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v8 - 268435459) > 1) {
      return v8;
    }
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
LABEL_22:
    mach_msg_destroy(&rcv_name);
    return v8;
  }
  if (rcv_name.msgh_id == 71)
  {
    uint64_t v8 = 4294966988;
    goto LABEL_22;
  }
  if (rcv_name.msgh_id != 100153)
  {
    uint64_t v8 = 4294966995;
    goto LABEL_22;
  }
  uint64_t v8 = 4294966996;
  if ((rcv_name.msgh_bits & 0x80000000) != 0) {
    goto LABEL_22;
  }
  if (rcv_name.msgh_size != 36) {
    goto LABEL_22;
  }
  if (rcv_name.msgh_remote_port) {
    goto LABEL_22;
  }
  uint64_t v8 = v13;
  if (v13) {
    goto LABEL_22;
  }
  return v8;
}

uint64_t _SBSSetShowsProgress(mach_port_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  int v6 = a2;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100056;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSSetAllApplicationsShowProgress(mach_port_t a1, int a2, mach_msg_timeout_t timeout)
{
  uint64_t v7 = *MEMORY[0x1E4F14068];
  int v8 = a2;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100058;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v4 = mach_msg(&msg, 2097169, 0x24u, 0, 0, timeout, 0);
  if ((v4 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v4;
}

uint64_t _SBSSetAllApplicationsShowSyncIndicator(mach_port_t a1, int a2, mach_msg_timeout_t timeout)
{
  uint64_t v7 = *MEMORY[0x1E4F14068];
  int v8 = a2;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100059;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v4 = mach_msg(&msg, 2097169, 0x24u, 0, 0, timeout, 0);
  if ((v4 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v4;
}

uint64_t _SBSSetShowsOverridesForRecording(mach_port_t a1, char a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  char v6 = a2;
  __int16 v7 = 0;
  char v8 = 0;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100060;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSGetWallpaperPreviewSurface(int a1, char a2, int a3, int a4, _DWORD *a5, double a6)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&msg[20] = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_DWORD *)&msg[24] = 1;
  *(_DWORD *)&unsigned char msg[28] = a4;
  int v13 = 1245184;
  uint64_t v14 = *MEMORY[0x1E4F14068];
  char v15 = a2;
  __int16 v16 = 0;
  char v17 = 0;
  double v18 = a6;
  int v19 = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = -2147478253;
  *(void *)&msg[16] = 0x186DD00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x40u, 0x30u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 100161)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v10 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v10 = 4294966996;
              }
              else {
                uint64_t v10 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v10 = 4294966996;
          }
          goto LABEL_26;
        }
        uint64_t v10 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 40 && !*(_DWORD *)&msg[8] && HIWORD(v13) << 16 == 1114112)
        {
          uint64_t v10 = 0;
          *a5 = *(_DWORD *)&msg[28];
          return v10;
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v10 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_26;
  }
  return v10;
}

uint64_t _SBSGetWallpaperPreview(mach_port_t a1, char a2, int a3, uint64_t a4, int a5, void *a6, _DWORD *a7, double a8)
{
  int v17 = 1;
  uint64_t v18 = a4;
  int v19 = 16777472;
  int v20 = a5;
  uint64_t v21 = *MEMORY[0x1E4F14068];
  LOBYTE(v22) = a2;
  *(_WORD *)((char *)&v22 + 1) = 0;
  HIBYTE(v22) = 0;
  double v23 = a8;
  int v24 = a3;
  int v25 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 2147489043;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x186DE00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v12 = mach_msg(&msg, 3162115, 0x48u, 0x40u, special_reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!v12)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v13 = 4294966988;
      }
      else if (msg.msgh_id == 100162)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v13 = 4294966996;
            if (HIDWORD(v18))
            {
              if (msg.msgh_remote_port) {
                uint64_t v13 = 4294966996;
              }
              else {
                uint64_t v13 = HIDWORD(v18);
              }
            }
          }
          else
          {
            uint64_t v13 = 4294966996;
          }
          goto LABEL_27;
        }
        uint64_t v13 = 4294966996;
        if (v17 == 1 && msg.msgh_size == 56 && !msg.msgh_remote_port && HIBYTE(v19) == 1)
        {
          int v14 = v20;
          if (v20 == v22)
          {
            uint64_t v13 = 0;
            *a6 = v18;
            *a7 = v14;
            return v13;
          }
        }
      }
      else
      {
        uint64_t v13 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy(&msg);
      return v13;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v13 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    goto LABEL_27;
  }
  return v13;
}

uint64_t _SBSSetWallpaperOptionsForLocations(mach_port_name_t a1, char a2, char a3, char a4, char *src, char a6, unsigned char *a7, float a8, float a9, float a10, float a11, float a12, float a13, double a14)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  memset(v31, 0, 432);
  long long v28 = 0u;
  long long v29 = 0u;
  *(_OWORD *)mach_msg_header_t rcv_name = 0u;
  long long v27 = 0u;
  *((void *)&v27 + 1) = *MEMORY[0x1E4F14068];
  *(void *)&long long v28 = __PAIR64__(LODWORD(a9), LODWORD(a8));
  *((void *)&v28 + 1) = __PAIR64__(LODWORD(a11), LODWORD(a10));
  *(void *)&long long v29 = __PAIR64__(LODWORD(a13), LODWORD(a12));
  BYTE8(v29) = a2;
  *(_WORD *)((char *)&v29 + 9) = 0;
  BYTE11(v29) = 0;
  BYTE12(v29) = a3;
  *(_WORD *)((char *)&v29 + 13) = 0;
  HIBYTE(v29) = 0;
  LOBYTE(v30) = a4;
  *(_WORD *)((char *)&v30 + 1) = 0;
  BYTE3(v30) = 0;
  *(double *)((char *)&v30 + 4) = a14;
  if (MEMORY[0x1E4F149B0]) {
    int v17 = mig_strncpy_zerofill((char *)v31 + 4, src, 1024);
  }
  else {
    int v17 = mig_strncpy((char *)v31 + 4, src, 1024);
  }
  HIDWORD(v30) = 0;
  LODWORD(v31[0]) = v17;
  uint64_t v18 = (v17 + 3) & 0xFFFFFFFC;
  int v19 = (char *)rcv_name + v18;
  v19[84] = a6;
  *(_WORD *)(v19 + 85) = 0;
  v19[87] = 0;
  mach_msg_size_t v20 = v18 + 88;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v27 = 0x186DF00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v22 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v20, 0x30u, special_reply_port, 0, 0);
  uint64_t v23 = v22;
  if ((v22 - 268435458) > 0xE || ((1 << (v22 - 2)) & 0x4003) == 0)
  {
    if (!v22)
    {
      if (DWORD1(v27) == 71)
      {
        uint64_t v23 = 4294966988;
      }
      else if (DWORD1(v27) == 100163)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              uint64_t v23 = v28;
              if (!v28)
              {
                *a7 = BYTE4(v28);
                return v23;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2]) {
              BOOL v24 = 1;
            }
            else {
              BOOL v24 = v28 == 0;
            }
            if (v24) {
              uint64_t v23 = 4294966996;
            }
            else {
              uint64_t v23 = v28;
            }
            goto LABEL_28;
          }
        }
        uint64_t v23 = 4294966996;
      }
      else
      {
        uint64_t v23 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v23;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v23 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
    goto LABEL_28;
  }
  return v23;
}

uint64_t _SBSGetBatteryAwakeTime(mach_port_t a1, char *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  memset(&msg[20].msgh_size, 0, 28);
  memset(&msg[1].msgh_local_port, 0, 448);
  *(_OWORD *)&msg[0].msgh_id = 0u;
  msg[0].msgh_size = 0;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg[0].uint64_t msgh_remote_port = a1;
  msg[0].msgh_local_port = special_reply_port;
  msg[0].msgh_bits = 5395;
  *(void *)&msg[0].msgh_voucher_port = 0x186E000000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(msg);
    mach_port_t special_reply_port = msg[0].msgh_local_port;
  }
  uint64_t v5 = mach_msg(msg, 3162115, 0x18u, 0x434u, special_reply_port, 0, 0);
  uint64_t msgh_remote_port = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (msg[0].msgh_id == 71)
      {
        uint64_t msgh_remote_port = 4294966988;
      }
      else if (msg[0].msgh_id == 100164)
      {
        if ((msg[0].msgh_bits & 0x80000000) == 0)
        {
          if (msg[0].msgh_size - 1069 <= 0xFFFFFBFE)
          {
            if (msg[0].msgh_remote_port) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = msg[1].msgh_remote_port == 0;
            }
            if (!v7 && msg[0].msgh_size == 36) {
              uint64_t msgh_remote_port = msg[1].msgh_remote_port;
            }
            else {
              uint64_t msgh_remote_port = 4294966996;
            }
            goto LABEL_27;
          }
          if (!msg[0].msgh_remote_port)
          {
            uint64_t msgh_remote_port = msg[1].msgh_remote_port;
            if (!msg[1].msgh_remote_port)
            {
              uint64_t msgh_remote_port = 4294966996;
              if (msg[1].msgh_voucher_port <= 0x400
                && msg[0].msgh_size - 44 >= msg[1].msgh_voucher_port
                && msg[0].msgh_size == ((msg[1].msgh_voucher_port + 3) & 0xFFFFFFFC) + 44)
              {
                mig_strncpy(a2, (const char *)&msg[1].msgh_id, 1024);
                return 0;
              }
            }
            goto LABEL_27;
          }
        }
        uint64_t msgh_remote_port = 4294966996;
      }
      else
      {
        uint64_t msgh_remote_port = 4294966995;
      }
LABEL_27:
      mach_msg_destroy(msg);
      return msgh_remote_port;
    }
    mig_dealloc_special_reply_port();
  }
  if ((msgh_remote_port - 268435459) <= 1)
  {
    if ((msg[0].msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg[0].msgh_local_port);
    }
    goto LABEL_27;
  }
  return msgh_remote_port;
}

uint64_t _SBSGetRecentSleepsWakes(int a1, void *a2, _DWORD *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(&msg_16[4], 0, 44);
  int msg_4 = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int msg_8 = a1;
  mach_port_name_t msg_12 = special_reply_port;
  int msg = 5395;
  *(void *)msg_16 = 0x186E100000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_name_t special_reply_port = msg_12;
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (*(_DWORD *)&msg_16[4] == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg_16[4] == 100165)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (msg_4 == 36)
          {
            uint64_t v8 = 4294966996;
            if (*(_DWORD *)&msg_16[16])
            {
              if (msg_8) {
                uint64_t v8 = 4294966996;
              }
              else {
                uint64_t v8 = *(unsigned int *)&msg_16[16];
              }
            }
          }
          else
          {
            uint64_t v8 = 4294966996;
          }
          goto LABEL_27;
        }
        uint64_t v8 = 4294966996;
        if (*(_DWORD *)&msg_16[8] == 1 && msg_4 == 56 && !msg_8 && msg_16[23] == 1)
        {
          int v9 = *(_DWORD *)&msg_16[24];
          if (*(_DWORD *)&msg_16[24] == *(_DWORD *)&msg_16[36])
          {
            uint64_t v8 = 0;
            *a2 = *(void *)&msg_16[12];
            *a3 = v9;
            return v8;
          }
        }
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg_12);
    }
    goto LABEL_27;
  }
  return v8;
}

uint64_t _SBSGetScheduledPowerEvents(int a1, void *a2, _DWORD *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(&msg_16[4], 0, 44);
  int msg_4 = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int msg_8 = a1;
  mach_port_name_t msg_12 = special_reply_port;
  int msg = 5395;
  *(void *)msg_16 = 0x186E200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_name_t special_reply_port = msg_12;
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (*(_DWORD *)&msg_16[4] == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg_16[4] == 100166)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (msg_4 == 36)
          {
            uint64_t v8 = 4294966996;
            if (*(_DWORD *)&msg_16[16])
            {
              if (msg_8) {
                uint64_t v8 = 4294966996;
              }
              else {
                uint64_t v8 = *(unsigned int *)&msg_16[16];
              }
            }
          }
          else
          {
            uint64_t v8 = 4294966996;
          }
          goto LABEL_27;
        }
        uint64_t v8 = 4294966996;
        if (*(_DWORD *)&msg_16[8] == 1 && msg_4 == 56 && !msg_8 && msg_16[23] == 1)
        {
          int v9 = *(_DWORD *)&msg_16[24];
          if (*(_DWORD *)&msg_16[24] == *(_DWORD *)&msg_16[36])
          {
            uint64_t v8 = 0;
            *a2 = *(void *)&msg_16[12];
            *a3 = v9;
            return v8;
          }
        }
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg_12);
    }
    goto LABEL_27;
  }
  return v8;
}

uint64_t _SBSGetBatteryUsageTimesInSeconds(int a1, _DWORD *a2, _DWORD *a3, unsigned char *a4, unsigned char *a5)
{
  uint64_t v18 = 0;
  long long v17 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)int msg = 5395;
  *(void *)&msg[16] = 0x186E300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v11 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x3Cu, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 100167)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 52)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v12 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                int v15 = DWORD1(v17);
                *a2 = v17;
                *a3 = v15;
                *a4 = BYTE8(v17);
                *a5 = BYTE12(v17);
                return v12;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v13 = 1;
            }
            else {
              BOOL v13 = *(_DWORD *)&msg[32] == 0;
            }
            if (v13) {
              uint64_t v12 = 4294966996;
            }
            else {
              uint64_t v12 = *(unsigned int *)&msg[32];
            }
            goto LABEL_25;
          }
        }
        uint64_t v12 = 4294966996;
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v12 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_25;
  }
  return v12;
}

uint64_t (*SpringBoardUser_server_routine(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 100068) >= 0xFFFFFFBC) {
    return _SBMigSpringBoardUser_subsystem[5 * (v1 - 100000) + 5];
  }
  else {
    return 0;
  }
}

_DWORD *_XSuspendFrontmostApp(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
  }
  else
  {
    int v3 = result + 6;
    if (!result[6] && result[7] > 0x1Fu)
    {
      int v5 = result[3];
      long long v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      uint64_t result = (_DWORD *)_SBMigSuspendFrontmostApp(v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XInterruptKeybagRefetch(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
  }
  else
  {
    int v3 = result + 6;
    if (!result[6] && result[7] > 0x1Fu)
    {
      uint64_t v5 = result[3];
      long long v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      uint64_t result = (_DWORD *)_SBMigInterruptKeybagRefetch(v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XGetActiveInterfaceOrientation(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x1E4F14068];
    goto LABEL_8;
  }
  uint64_t result = (_DWORD *)_SBMigGetActiveInterfaceOrientation(result[3], a2 + 36);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(void *)(a2 + 24) = v4;
  return result;
}

_DWORD *_XPresentPowerDownUI(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
  }
  else
  {
    int v3 = result + 6;
    if (!result[6] && result[7] > 0x1Fu)
    {
      uint64_t v5 = result[3];
      long long v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      uint64_t result = (_DWORD *)_SBMigPresentPowerDownUI(v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XReboot(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
  }
  else
  {
    int v3 = result + 6;
    if (!result[6] && result[7] > 0x1Fu)
    {
      int v5 = result[3];
      long long v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      uint64_t result = (_DWORD *)_SBMigReboot(v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_8;
    }
    int v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
LABEL_8:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XShutDown(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
  }
  else
  {
    int v3 = result + 6;
    if (!result[6] && result[7] > 0x1Fu)
    {
      int v5 = result[3];
      long long v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      uint64_t result = (_DWORD *)_SBMigShutDown(v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_8;
    }
    int v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
LABEL_8:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

void _XEnableLockScreenBundle(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v5 = *(unsigned int *)(a1 + 4);
  if (v5 < 0x44 || v5 > 0x444) {
    goto LABEL_3;
  }
  if (*(unsigned char *)(a1 + 39) != 1) {
    goto LABEL_19;
  }
  unsigned int v6 = *(_DWORD *)(a1 + 60);
  if (v6 > 0x400)
  {
LABEL_2:
    int v3 = -304;
    goto LABEL_3;
  }
  int v3 = -304;
  if ((int)v5 - 68 < v6) {
    goto LABEL_3;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v5 != v7 + 68) {
    goto LABEL_3;
  }
  uint64_t v8 = *(unsigned int *)(a1 + 40);
  if (v8 != *(_DWORD *)(a1 + v7 + 64))
  {
LABEL_19:
    int v3 = -300;
    goto LABEL_3;
  }
  uint64_t v9 = 1088;
  if (*(unsigned int *)(a1 + 4) < 0x440uLL) {
    uint64_t v9 = *(unsigned int *)(a1 + 4);
  }
  if (!memchr((void *)(a1 + 64), 0, v9 - 64)) {
    goto LABEL_2;
  }
  uint64_t v10 = ((v5 + 3) & 0x1FFFFFFFCLL) + a1;
  if (!*(_DWORD *)v10 && *(_DWORD *)(v10 + 4) > 0x1Fu)
  {
    uint64_t v11 = *(unsigned int *)(a1 + 12);
    uint64_t v12 = *(unsigned __int8 *)(a1 + 52);
    uint64_t v13 = *(void *)(a1 + 28);
    long long v14 = *(_OWORD *)(v10 + 36);
    v15[0] = *(_OWORD *)(v10 + 20);
    v15[1] = v14;
    *(_DWORD *)(a2 + 32) = _SBMigEnableLockScreenBundle(v11, v12, a1 + 64, v13, v8, v15);
    mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
    *(void *)(a1 + 28) = 0;
    *(_DWORD *)(a1 + 40) = 0;
    return;
  }
  int v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

uint64_t _XLockDevice(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      uint64_t v5 = *(unsigned __int8 *)(result + 32);
      long long v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      uint64_t result = _SBMigLockDevice(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XShowNetworkPromptsIfNecessary(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      uint64_t v5 = *(unsigned __int8 *)(result + 32);
      long long v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      uint64_t result = _SBMigShowNetworkPromptsIfNecessary(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XGetCurrentBacklightFactor(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x1E4F14068];
    goto LABEL_8;
  }
  uint64_t result = (_DWORD *)_SBMigGetCurrentBacklightFactor(result[3], (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(void *)(a2 + 24) = v4;
  return result;
}

uint64_t _XDimScreen(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      int v4 = *(_DWORD *)(result + 12);
      char v5 = *(unsigned char *)(result + 32);
      long long v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      uint64_t result = _SBMigDimScreen(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XAddWebClipToHomeScreen(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (int v3 = result, v4 = result[1], v4 >= 0x28)
    && v4 <= 0x428
    && ((unsigned int v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = v4 == v7) : (v8 = 0),
        v8 && (uint64_t result = memchr(result + 10, 0, v4 - 40)) != 0))
  {
    uint64_t v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v10 && *((_DWORD *)v10 + 1) > 0x1Fu)
    {
      uint64_t v11 = v3[3];
      long long v12 = *(_OWORD *)(v10 + 36);
      v13[0] = *(_OWORD *)(v10 + 20);
      v13[1] = v12;
      uint64_t result = (_DWORD *)_SBMigAddWebClipToHomeScreen(v11, (uint64_t)(v3 + 10), v13);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_13;
    }
    int v9 = -309;
  }
  else
  {
    int v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
LABEL_13:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XRemoveWebClipFromHomeScreen(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (int v3 = result, v4 = result[1], v4 >= 0x28)
    && v4 <= 0x428
    && ((unsigned int v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = v4 == v7) : (v8 = 0),
        v8 && (uint64_t result = memchr(result + 10, 0, v4 - 40)) != 0))
  {
    uint64_t v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v10 && *((_DWORD *)v10 + 1) > 0x1Fu)
    {
      uint64_t v11 = v3[3];
      long long v12 = *(_OWORD *)(v10 + 36);
      v13[0] = *(_OWORD *)(v10 + 20);
      v13[1] = v12;
      uint64_t result = (_DWORD *)_SBMigRemoveWebClipFromHomeScreen(v11, (uint64_t)(v3 + 10), v13);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_13;
    }
    int v9 = -309;
  }
  else
  {
    int v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
LABEL_13:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XReloadIconForIdentifier(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (int v3 = result, v4 = result[1], v4 >= 0x28)
    && v4 <= 0x428
    && ((unsigned int v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = v4 == v7) : (v8 = 0),
        v8 && (uint64_t result = memchr(result + 10, 0, v4 - 40)) != 0))
  {
    uint64_t v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v10 && *((_DWORD *)v10 + 1) > 0x1Fu)
    {
      uint64_t v11 = v3[3];
      long long v12 = *(_OWORD *)(v10 + 36);
      v13[0] = *(_OWORD *)(v10 + 20);
      v13[1] = v12;
      uint64_t result = (_DWORD *)_SBMigReloadIconForIdentifier(v11, (uint64_t)(v3 + 10), v13);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v9 = -309;
  }
  else
  {
    int v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XAddDownloadingIconForDisplayIdentifier(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_17;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  if (v4 < 0x30) {
    goto LABEL_17;
  }
  if (v4 > 0x830) {
    goto LABEL_17;
  }
  unsigned int v5 = result[9];
  if (v5 > 0x400) {
    goto LABEL_17;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 48 < v5 || v4 < v6 + 48) {
    goto LABEL_17;
  }
  int v8 = v4 - v6;
  int v9 = (char *)result + v6;
  unsigned int v10 = *((_DWORD *)v9 + 11);
  BOOL v11 = v10 <= 0x400 && v8 - 48 >= v10;
  unsigned int v12 = ((v10 + 3) & 0xFFFFFFFC) + 48;
  if (!v11 || v8 != v12) {
    goto LABEL_17;
  }
  uint64_t v14 = 1064;
  if (result[1] < 0x428uLL) {
    uint64_t v14 = result[1];
  }
  uint64_t result = memchr(result + 10, 0, v14 - 40);
  if (result
    && ((char *)v3 + v4 - (v9 + 48) >= 1024 ? (size_t v15 = 1024) : (size_t v15 = (char *)v3 + v4 - (v9 + 48)),
        (uint64_t result = memchr(v9 + 48, 0, v15)) != 0))
  {
    uint64_t result = (_DWORD *)_SBMigAddDownloadingIconForDisplayIdentifier();
    *(_DWORD *)(a2 + 32) = result;
  }
  else
  {
LABEL_17:
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XScrollToIconWithDisplayIdentifier(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  if (v4 < 0x2C) {
    goto LABEL_16;
  }
  if (v4 > 0x42C) {
    goto LABEL_16;
  }
  unsigned int v5 = result[9];
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  if ((int)v4 - 44 < v5 || v4 != ((v5 + 3) & 0xFFFFFFFC) + 44) {
    goto LABEL_16;
  }
  uint64_t v7 = 1064;
  if (result[1] < 0x428uLL) {
    uint64_t v7 = result[1];
  }
  uint64_t result = memchr(result + 10, 0, v7 - 40);
  if (result)
  {
    int v8 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v8 && v8[1] > 0x1Fu)
    {
      uint64_t result = (_DWORD *)_SBMigScrollToIconWithDisplayIdentifier();
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v9 = -309;
  }
  else
  {
LABEL_16:
    int v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XGetNowPlayingAppBundleIdentifier(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }
  int v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  uint64_t v5 = result[3];
  long long v6 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v6;
  uint64_t result = (_DWORD *)_SBMigGetNowPlayingAppBundleIdentifier(v5, (unsigned char *)(a2 + 44), v8);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v7 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v7;
    uint64_t result = (_DWORD *)strlen((const char *)(a2 + 44));
    if (!(((unint64_t)result + 1) >> 32))
    {
      *(_DWORD *)(a2 + 36) = 0;
      *(_DWORD *)(a2 + 40) = result + 1;
      *(_DWORD *)(a2 + 4) = ((result + 4) & 0xFFFFFFFC) + 44;
      return result;
    }
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(void *)(a2 + 24) = v7;
  return result;
}

_DWORD *_XGetTopButtonFrames(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }
  int v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    uint64_t v5 = *MEMORY[0x1E4F14068];
    goto LABEL_8;
  }
  uint64_t v6 = result[3];
  long long v7 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v7;
  uint64_t result = (_DWORD *)_SBMigGetTopButtonFrames(v6, a2 + 36, a2 + 44, a2 + 52, a2 + 60, a2 + 68, a2 + 76, a2 + 84, a2 + 92, v8);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v5 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 100;
    return result;
  }
LABEL_8:
  *(void *)(a2 + 24) = v5;
  return result;
}

_DWORD *_XGetApplicationNetworkFlags(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }
  int v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    uint64_t v5 = *MEMORY[0x1E4F14068];
    goto LABEL_8;
  }
  uint64_t v6 = result[3];
  long long v7 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v7;
  uint64_t result = (_DWORD *)_SBMigGetApplicationNetworkFlags(v6, (unsigned char *)(a2 + 36), (unsigned char *)(a2 + 40), v8);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v5 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }
LABEL_8:
  *(void *)(a2 + 24) = v5;
  return result;
}

uint64_t _XAppSwitcherServiceRegister(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v4 = result;
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x40 || v5 > 0x840) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_3;
  }
  unsigned int v6 = *(_DWORD *)(result + 52);
  if (v6 > 0x400) {
    goto LABEL_2;
  }
  int v3 = -304;
  if ((int)v5 - 64 < v6) {
    goto LABEL_3;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v5 < v7 + 64) {
    goto LABEL_3;
  }
  int v8 = v5 - v7;
  uint64_t v9 = result + v7;
  unsigned int v10 = *(_DWORD *)(v9 + 60);
  BOOL v11 = v10 <= 0x400 && v8 - 64 >= v10;
  if (!v11 || v8 != ((v10 + 3) & 0xFFFFFFFC) + 64) {
    goto LABEL_2;
  }
  uint64_t v12 = 1080;
  if (*(unsigned int *)(result + 4) < 0x438uLL) {
    uint64_t v12 = *(unsigned int *)(result + 4);
  }
  uint64_t result = (uint64_t)memchr((void *)(result + 56), 0, v12 - 56);
  if (result
    && ((uint64_t v13 = (void *)(v9 + 64), v4 + v5 - (uint64_t)v13 >= 1024) ? (v14 = 1024) : (v14 = v4 + v5 - (void)v13),
        (uint64_t result = (uint64_t)memchr(v13, 0, v14)) != 0))
  {
    uint64_t v15 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
    if (!*(_DWORD *)v15 && *(_DWORD *)(v15 + 4) > 0x1Fu)
    {
      uint64_t v16 = *(unsigned int *)(v4 + 12);
      uint64_t v17 = *(unsigned int *)(v4 + 28);
      long long v18 = *(_OWORD *)(v15 + 36);
      v19[0] = *(_OWORD *)(v15 + 20);
      v19[1] = v18;
      uint64_t result = _SBMigAppSwitcherServiceRegister(v16, v17, v4 + 56, (uint64_t)v13, v19);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
    int v3 = -309;
  }
  else
  {
LABEL_2:
    int v3 = -304;
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XSetVoiceControlEnabled(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      uint64_t v5 = *(unsigned __int8 *)(result + 32);
      long long v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      uint64_t result = _SBMigSetVoiceControlEnabled(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XSetInterceptsMenuButton(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 40) && *(_DWORD *)(result + 44) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      uint64_t v5 = *(unsigned __int8 *)(result + 32);
      uint64_t v6 = *(unsigned __int8 *)(result + 36);
      long long v7 = *(_OWORD *)(result + 76);
      v8[0] = *(_OWORD *)(result + 60);
      v8[1] = v7;
      uint64_t result = _SBMigSetInterceptsMenuButton(v4, v5, v6, v8);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XSetWantsLockButtonEvents(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      uint64_t v5 = *(unsigned int *)(result + 32);
      long long v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      uint64_t result = _SBMigSetWantsLockButtonEvents(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XGetMediaVolume(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }
  int v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    uint64_t v5 = *MEMORY[0x1E4F14068];
    goto LABEL_8;
  }
  uint64_t v6 = result[3];
  long long v7 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v7;
  uint64_t result = _SBMigGetMediaVolume(v6, (_DWORD *)(a2 + 36), v8);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v5 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(void *)(a2 + 24) = v5;
  return result;
}

uint64_t _XSetMediaVolume(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      float v5 = *(float *)(result + 32);
      long long v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      uint64_t result = _SBMigSetMediaVolume(v4, v7, v5);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XGetHomeScreenIconMetrics(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x1E4F14068];
    goto LABEL_8;
  }
  uint64_t result = (_DWORD *)_SBMigGetHomeScreenIconMetrics(result[3], a2 + 36, a2 + 44, a2 + 52, a2 + 60, a2 + 68, a2 + 72, a2 + 76, a2 + 80, a2 + 84, a2 + 88, a2 + 92);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 96;
    return result;
  }
LABEL_8:
  *(void *)(a2 + 24) = v4;
  return result;
}

uint64_t _XFlashColor(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 44)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 44) && *(_DWORD *)(result + 48) > 0x1Fu)
    {
      uint64_t result = _SBMigFlashColor(*(unsigned int *)(result + 12), *(float *)(result + 32), *(float *)(result + 36), *(float *)(result + 40));
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_8;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
LABEL_8:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XProgrammaticSwitchAppGestureMoveToLeft(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
  }
  else
  {
    int v3 = result + 6;
    if (!result[6] && result[7] > 0x1Fu)
    {
      uint64_t v5 = result[3];
      long long v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      uint64_t result = (_DWORD *)_SBMigProgrammaticSwitchAppGestureMoveToLeft(v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XProgrammaticSwitchAppGestureMoveToRight(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
  }
  else
  {
    int v3 = result + 6;
    if (!result[6] && result[7] > 0x1Fu)
    {
      uint64_t v5 = result[3];
      long long v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      uint64_t result = (_DWORD *)_SBMigProgrammaticSwitchAppGestureMoveToRight(v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

void _XSetVoiceRecognitionAudioInputPaths(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(unsigned char *)(a1 + 39) == 1 && (int v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        int v6 = *(_DWORD *)(a1 + 12);
        uint64_t v7 = *(void *)(a1 + 28);
        long long v8 = *(_OWORD *)(a1 + 92);
        v9[0] = *(_OWORD *)(a1 + 76);
        v9[1] = v8;
        *(_DWORD *)(a2 + 32) = _SBMigSetVoiceRecognitionAudioInputPaths(v6, v7, v4, v9);
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 28) = 0;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }
      int v5 = -309;
    }
    else
    {
      int v5 = -300;
    }
  }
  else
  {
    int v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

void _XSetAssistantRecognitionStrings(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(unsigned char *)(a1 + 39) == 1 && (int v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        int v6 = *(_DWORD *)(a1 + 12);
        uint64_t v7 = *(void *)(a1 + 28);
        long long v8 = *(_OWORD *)(a1 + 92);
        v9[0] = *(_OWORD *)(a1 + 76);
        v9[1] = v8;
        *(_DWORD *)(a2 + 32) = _SBMigSetAssistantRecognitionStrings(v6, v7, v4, v9);
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 28) = 0;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }
      int v5 = -309;
    }
    else
    {
      int v5 = -300;
    }
  }
  else
  {
    int v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

void _XSetAlertSuppressionContextsBySectionIdentifier(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(unsigned char *)(a1 + 39) == 1 && (int v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        int v6 = *(_DWORD *)(a1 + 12);
        uint64_t v7 = *(void *)(a1 + 28);
        long long v8 = *(_OWORD *)(a1 + 92);
        v9[0] = *(_OWORD *)(a1 + 76);
        v9[1] = v8;
        *(_DWORD *)(a2 + 32) = _SBMigSetAlertSuppressionContextsBySectionIdentifier(v6, v7, v4, v9);
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 28) = 0;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }
      int v5 = -309;
    }
    else
    {
      int v5 = -300;
    }
  }
  else
  {
    int v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

uint64_t _XSetAppIsConnectedToEA(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 40) && *(_DWORD *)(result + 44) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      uint64_t v5 = *(unsigned int *)(result + 32);
      uint64_t v6 = *(unsigned __int8 *)(result + 36);
      long long v7 = *(_OWORD *)(result + 76);
      v8[0] = *(_OWORD *)(result + 60);
      v8[1] = v7;
      uint64_t result = _SBMigSetAppIsConnectedToEA(v4, v5, v6, v8);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XLockDeviceAndFeatures(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 40) && *(_DWORD *)(result + 44) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      uint64_t v5 = *(unsigned __int8 *)(result + 32);
      uint64_t v6 = *(unsigned __int8 *)(result + 36);
      long long v7 = *(_OWORD *)(result + 76);
      v8[0] = *(_OWORD *)(result + 60);
      v8[1] = v7;
      uint64_t result = _SBMigLockDeviceAndFeatures(v4, v5, v6, v8);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

void _XActivateAssistantWithContext(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 60)
  {
    if (*(unsigned char *)(a1 + 39) == 1 && (uint64_t v4 = *(unsigned int *)(a1 + 40), v4 == *(_DWORD *)(a1 + 56)))
    {
      if (!*(_DWORD *)(a1 + 60) && *(_DWORD *)(a1 + 64) > 0x1Fu)
      {
        uint64_t v6 = *(unsigned int *)(a1 + 12);
        uint64_t v7 = *(unsigned int *)(a1 + 52);
        uint64_t v8 = *(void *)(a1 + 28);
        long long v9 = *(_OWORD *)(a1 + 96);
        v10[0] = *(_OWORD *)(a1 + 80);
        v10[1] = v9;
        *(_DWORD *)(a2 + 32) = _SBMigActivateAssistantWithContext(v6, v7, v8, v4, v10);
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 28) = 0;
        *(_DWORD *)(a1 + 40) = 0;
        goto LABEL_11;
      }
      int v5 = -309;
    }
    else
    {
      int v5 = -300;
    }
  }
  else
  {
    int v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
LABEL_11:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

void _XSetProceduralWallpaper(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v5 = *(unsigned int *)(a1 + 4);
  if (v5 < 0x44 || v5 > 0x444) {
    goto LABEL_3;
  }
  if (*(unsigned char *)(a1 + 39) != 1) {
    goto LABEL_19;
  }
  unsigned int v6 = *(_DWORD *)(a1 + 56);
  if (v6 > 0x400)
  {
LABEL_2:
    int v3 = -304;
    goto LABEL_3;
  }
  int v3 = -304;
  if ((int)v5 - 68 < v6) {
    goto LABEL_3;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v5 != v7 + 68) {
    goto LABEL_3;
  }
  uint64_t v8 = a1 + v7;
  uint64_t v9 = *(unsigned int *)(a1 + 40);
  if (v9 != *(_DWORD *)(v8 + 64))
  {
LABEL_19:
    int v3 = -300;
    goto LABEL_3;
  }
  uint64_t v10 = 1084;
  if (*(unsigned int *)(a1 + 4) < 0x43CuLL) {
    uint64_t v10 = *(unsigned int *)(a1 + 4);
  }
  if (!memchr((void *)(a1 + 60), 0, v10 - 60)) {
    goto LABEL_2;
  }
  uint64_t v11 = ((v5 + 3) & 0x1FFFFFFFCLL) + a1;
  if (!*(_DWORD *)v11 && *(_DWORD *)(v11 + 4) > 0x1Fu)
  {
    uint64_t v12 = *(unsigned int *)(a1 + 12);
    uint64_t v13 = *(unsigned __int8 *)(v8 + 60);
    uint64_t v14 = *(void *)(a1 + 28);
    long long v15 = *(_OWORD *)(v11 + 36);
    v16[0] = *(_OWORD *)(v11 + 20);
    v16[1] = v15;
    *(_DWORD *)(a2 + 32) = _SBMigSetProceduralWallpaper(v12, a1 + 60, v13, v14, v9, v16);
    mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
    *(void *)(a1 + 28) = 0;
    *(_DWORD *)(a1 + 40) = 0;
    goto LABEL_4;
  }
  int v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

void _XSetWallpaperImageForLocations(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 2) {
    goto LABEL_3;
  }
  uint64_t v6 = *(unsigned int *)(a1 + 4);
  if (v6 < 0x90 || v6 > 0x490) {
    goto LABEL_3;
  }
  if (*(unsigned char *)(a1 + 39) != 1 || *(unsigned char *)(a1 + 55) != 1) {
    goto LABEL_22;
  }
  unsigned int v7 = *(_DWORD *)(a1 + 124);
  if (v7 > 0x400)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x1E4F14068];
    goto LABEL_4;
  }
  int v3 = -304;
  if ((int)v6 - 144 < v7) {
    goto LABEL_3;
  }
  unsigned int v8 = (v7 + 3) & 0xFFFFFFFC;
  if (v6 != v8 + 144) {
    goto LABEL_3;
  }
  uint64_t v9 = *(unsigned int *)(a1 + 40);
  if (v9 != *(_DWORD *)(a1 + 68)
    || (uint64_t v10 = (unsigned char *)(a1 + v8 - 1024), v11 = *(_DWORD *)(a1 + 56), v11 != *(_DWORD *)(a1 + v8 + 140)))
  {
LABEL_22:
    int v3 = -300;
    goto LABEL_3;
  }
  uint64_t v12 = 1152;
  if (*(unsigned int *)(a1 + 4) < 0x480uLL) {
    uint64_t v12 = *(unsigned int *)(a1 + 4);
  }
  if (!memchr((void *)(a1 + 128), 0, v12 - 128)) {
    goto LABEL_2;
  }
  uint64_t v13 = ((v6 + 3) & 0x1FFFFFFFCLL) + a1;
  if (*(_DWORD *)v13 || *(_DWORD *)(v13 + 4) <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_3;
  }
  uint64_t v14 = *(unsigned int *)(a1 + 12);
  uint64_t v15 = *(void *)(a1 + 28);
  uint64_t v16 = *(unsigned __int8 *)(a1 + 72);
  float v17 = *(float *)(a1 + 76);
  float v18 = *(float *)(a1 + 80);
  float v19 = *(float *)(a1 + 84);
  float v20 = *(float *)(a1 + 88);
  float v21 = *(float *)(a1 + 92);
  float v22 = *(float *)(a1 + 96);
  uint64_t v23 = *(unsigned __int8 *)(a1 + 100);
  uint64_t v24 = *(unsigned __int8 *)(a1 + 104);
  uint64_t v25 = *(unsigned __int8 *)(a1 + 108);
  double v26 = *(double *)(a1 + 112);
  char v27 = v10[1152];
  unsigned __int8 v28 = v10[1156];
  unsigned __int8 v29 = v10[1160];
  uint64_t v30 = *(void *)(a1 + 44);
  long long v31 = *(_OWORD *)(v13 + 36);
  v32[0] = *(_OWORD *)(v13 + 20);
  v32[1] = v31;
  *(_DWORD *)(a2 + 32) = _SBMigSetWallpaperImageForLocations(v14, v15, v9, v16, v23, v24, v25, a1 + 128, v17, v18, v19, v20, v21, v22, v26, v27, v28, v29, v30,
                           v11,
                           (unsigned char *)(a2 + 36),
                           v32);
  mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
  *(void *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 40) = 0;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (!*(_DWORD *)(a2 + 32))
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return;
  }
LABEL_4:
  *(void *)(a2 + 24) = v4;
}

void _XSetWallpaperImageSurfaceForLocations(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 5) {
    goto LABEL_24;
  }
  unsigned int v5 = *(_DWORD *)(a1 + 4);
  if (v5 < 0xBC || v5 > 0x4BC) {
    goto LABEL_24;
  }
  if (*(unsigned __int16 *)(a1 + 38) << 16 != 1114112
    || *(unsigned __int16 *)(a1 + 50) << 16 != 1114112
    || *(unsigned char *)(a1 + 63) != 1
    || *(unsigned char *)(a1 + 79) != 1
    || *(unsigned char *)(a1 + 95) != 1)
  {
    goto LABEL_23;
  }
  unsigned int v6 = *(_DWORD *)(a1 + 168);
  if (v6 > 0x400)
  {
LABEL_2:
    int v3 = -304;
LABEL_24:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v12 = *MEMORY[0x1E4F14068];
    goto LABEL_25;
  }
  int v3 = -304;
  if (v5 - 188 < v6) {
    goto LABEL_24;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v5 != v7 + 188) {
    goto LABEL_24;
  }
  if (*(_DWORD *)(a1 + 64) != *(_DWORD *)(a1 + 108)
    || *(_DWORD *)(a1 + 80) != *(_DWORD *)(a1 + 112)
    || (uint64_t v8 = a1 + v7 - 1024, *(_DWORD *)(a1 + 96) != *(_DWORD *)(v8 + 1208)))
  {
LABEL_23:
    int v3 = -300;
    goto LABEL_24;
  }
  uint64_t v34 = (unsigned char *)v8;
  int v35 = *(_DWORD *)(a1 + 96);
  unsigned int v37 = *(_DWORD *)(a1 + 80);
  unsigned int v36 = *(_DWORD *)(a1 + 64);
  uint64_t v9 = 1196;
  unint64_t v10 = *(unsigned int *)(a1 + 4);
  if (v10 < 0x4AC) {
    uint64_t v9 = *(unsigned int *)(a1 + 4);
  }
  if (!memchr((void *)(a1 + 172), 0, v9 - 172)) {
    goto LABEL_2;
  }
  uint64_t v11 = ((v10 + 3) & 0x1FFFFFFFCLL) + a1;
  if (*(_DWORD *)v11 || *(_DWORD *)(v11 + 4) <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_24;
  }
  uint64_t v13 = *(unsigned int *)(a1 + 12);
  uint64_t v14 = *(unsigned int *)(a1 + 28);
  uint64_t v15 = *(unsigned int *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 52);
  uint64_t v17 = *(void *)(a1 + 68);
  uint64_t v18 = *(unsigned __int8 *)(a1 + 116);
  float v19 = *(float *)(a1 + 120);
  float v20 = *(float *)(a1 + 124);
  float v21 = *(float *)(a1 + 128);
  float v22 = *(float *)(a1 + 132);
  float v23 = *(float *)(a1 + 136);
  float v24 = *(float *)(a1 + 140);
  char v25 = *(unsigned char *)(a1 + 144);
  unsigned __int8 v26 = *(unsigned char *)(a1 + 148);
  unsigned __int8 v27 = *(unsigned char *)(a1 + 152);
  double v28 = *(double *)(a1 + 156);
  char v29 = v34[1196];
  unsigned __int8 v30 = v34[1200];
  unsigned __int8 v31 = v34[1204];
  uint64_t v32 = *(void *)(a1 + 84);
  long long v33 = *(_OWORD *)(v11 + 36);
  v38[0] = *(_OWORD *)(v11 + 20);
  v38[1] = v33;
  *(_DWORD *)(a2 + 32) = _SBMigSetWallpaperImageSurfaceForLocations(v13, v14, v15, v16, v36, v17, v37, v18, v19, v20, v21, v22, v23, v24, v28, v25, v26, v27, a1 + 172,
                           v29,
                           v30,
                           v31,
                           v32,
                           v35,
                           (unsigned char *)(a2 + 36),
                           v38);
  mig_deallocate(*(void *)(a1 + 84), *(unsigned int *)(a1 + 96));
  *(void *)(a1 + 84) = 0;
  *(_DWORD *)(a1 + 96) = 0;
  mig_deallocate(*(void *)(a1 + 68), *(unsigned int *)(a1 + 80));
  *(void *)(a1 + 68) = 0;
  *(_DWORD *)(a1 + 80) = 0;
  mig_deallocate(*(void *)(a1 + 52), *(unsigned int *)(a1 + 64));
  *(void *)(a1 + 52) = 0;
  *(_DWORD *)(a1 + 64) = 0;
  uint64_t v12 = *MEMORY[0x1E4F14068];
  if (!*(_DWORD *)(a2 + 32))
  {
    *(void *)(a2 + 24) = v12;
    *(_DWORD *)(a2 + 4) = 40;
    return;
  }
LABEL_25:
  *(void *)(a2 + 24) = v12;
}

_DWORD *_XClearWallpaperAsset(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }
  int v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    uint64_t v5 = *MEMORY[0x1E4F14068];
    goto LABEL_8;
  }
  uint64_t v6 = result[3];
  long long v7 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v7;
  uint64_t result = (_DWORD *)_SBMigClearWallpaperAsset(v6, (unsigned char *)(a2 + 36), v8);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v5 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(void *)(a2 + 24) = v5;
  return result;
}

uint64_t _XGetWallpaperOptions(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 96) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  uint64_t v4 = *(unsigned int *)(result + 12);
  uint64_t v5 = *(unsigned __int8 *)(result + 32);
  long long v6 = *(_OWORD *)(result + 72);
  v7[0] = *(_OWORD *)(result + 56);
  v7[1] = v6;
  uint64_t result = _SBMigGetWallpaperOptions(v4, v5, a2 + 52, a2 + 56, a2 + 60, a2 + 64, a2 + 68, a2 + 72, a2 + 76, a2 + 80, a2 + 84, a2 + 88, a2 + 28, a2 + 96, v7);
  if (!result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 96);
    *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 100;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XSetWallpaperVariant(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x1E4F14068];
    goto LABEL_8;
  }
  uint64_t v5 = *(unsigned int *)(result + 12);
  uint64_t v6 = *(unsigned __int8 *)(result + 32);
  long long v7 = *(_OWORD *)(result + 72);
  v8[0] = *(_OWORD *)(result + 56);
  v8[1] = v7;
  uint64_t result = _SBMigSetWallpaperVariant(v5, v6, (unsigned char *)(a2 + 36), v8);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(void *)(a2 + 24) = v4;
  return result;
}

uint64_t _XGetWallpaperLegibilitySettings(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 0;
  uint64_t v4 = (_DWORD *)(a2 + 52);
  uint64_t v5 = (void *)(a2 + 28);
  *(_DWORD *)(a2 + 36) = 16777472;
  uint64_t v6 = *(unsigned int *)(result + 12);
  uint64_t v7 = *(unsigned __int8 *)(result + 32);
  long long v8 = *(_OWORD *)(result + 72);
  v9[0] = *(_OWORD *)(result + 56);
  v9[1] = v8;
  uint64_t result = _SBMigGetWallpaperLegibilitySettings(v6, v7, v5, v4, v9);
  if (!result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XAddAlertItemsSuppressionAssertion(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v4 = result;
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x38 || v5 > 0x438) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_3;
  }
  unsigned int v6 = *(_DWORD *)(result + 52);
  int v3 = -304;
  if (v6 > 0x400 || (int)v5 - 56 < v6) {
    goto LABEL_3;
  }
  if (v5 == ((v6 + 3) & 0xFFFFFFFC) + 56 && (uint64_t result = (uint64_t)memchr((void *)(result + 56), 0, v5 - 56)) != 0)
  {
    uint64_t v7 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
    if (!*(_DWORD *)v7 && *(_DWORD *)(v7 + 4) > 0x1Fu)
    {
      uint64_t v8 = *(unsigned int *)(v4 + 12);
      uint64_t v9 = *(unsigned int *)(v4 + 28);
      long long v10 = *(_OWORD *)(v7 + 36);
      v11[0] = *(_OWORD *)(v7 + 20);
      v11[1] = v10;
      uint64_t result = _SBMigAddAlertItemsSuppressionAssertion(v8, v4 + 56, v9, v11);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
    int v3 = -309;
  }
  else
  {
LABEL_2:
    int v3 = -304;
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XIsReachabilityEnabled(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }
  int v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    uint64_t v5 = *MEMORY[0x1E4F14068];
    goto LABEL_8;
  }
  uint64_t v6 = result[3];
  long long v7 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v7;
  uint64_t result = _SBMigIsReachabilityEnabled(v6, (unsigned char *)(a2 + 36), v8);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v5 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(void *)(a2 + 24) = v5;
  return result;
}

uint64_t _XSetReachabilityEnabled(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      uint64_t v5 = *(unsigned __int8 *)(result + 32);
      long long v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      uint64_t result = _SBMigSetReachabilityEnabled(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XOverrideDisplayedDate(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (int v3 = result, v4 = result[1], v4 >= 0x28)
    && v4 <= 0x428
    && ((unsigned int v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = v4 == v7) : (v8 = 0),
        v8 && (uint64_t result = memchr(result + 10, 0, v4 - 40)) != 0))
  {
    long long v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v10 && *((_DWORD *)v10 + 1) > 0x1Fu)
    {
      uint64_t v11 = v3[3];
      long long v12 = *(_OWORD *)(v10 + 36);
      v13[0] = *(_OWORD *)(v10 + 20);
      v13[1] = v12;
      uint64_t result = (_DWORD *)_SBMigOverrideDisplayedDate(v11, (uint64_t)(v3 + 10), v13);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_13;
    }
    int v9 = -309;
  }
  else
  {
    int v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
LABEL_13:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XSetIdleText(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (int v3 = result, v4 = result[1], v4 >= 0x28)
    && v4 <= 0x428
    && ((unsigned int v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = v4 == v7) : (v8 = 0),
        v8 && (uint64_t result = memchr(result + 10, 0, v4 - 40)) != 0))
  {
    long long v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v10 && *((_DWORD *)v10 + 1) > 0x1Fu)
    {
      uint64_t v11 = v3[3];
      long long v12 = *(_OWORD *)(v10 + 36);
      v13[0] = *(_OWORD *)(v10 + 20);
      v13[1] = v12;
      uint64_t result = (_DWORD *)_SBMigSetIdleText(v11, (uint64_t)(v3 + 10), v13);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_13;
    }
    int v9 = -309;
  }
  else
  {
    int v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
LABEL_13:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XSetTypingActive(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      uint64_t v5 = *(unsigned __int8 *)(result + 32);
      long long v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      uint64_t result = _SBMigSetTypingActive(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XTagTouchForTypingMenu(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      uint64_t v5 = *(unsigned int *)(result + 32);
      long long v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      uint64_t result = _SBMigTagTouchForTypingMenu(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XAcquireFocusPreventingFullScreenPresentationAssertion(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v4 = result;
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x38 || v5 > 0x438) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_3;
  }
  unsigned int v6 = *(_DWORD *)(result + 52);
  int v3 = -304;
  if (v6 > 0x400 || (int)v5 - 56 < v6) {
    goto LABEL_3;
  }
  if (v5 == ((v6 + 3) & 0xFFFFFFFC) + 56 && (uint64_t result = (uint64_t)memchr((void *)(result + 56), 0, v5 - 56)) != 0)
  {
    uint64_t v7 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
    if (!*(_DWORD *)v7 && *(_DWORD *)(v7 + 4) > 0x1Fu)
    {
      uint64_t v8 = *(unsigned int *)(v4 + 12);
      uint64_t v9 = *(unsigned int *)(v4 + 28);
      long long v10 = *(_OWORD *)(v7 + 36);
      v11[0] = *(_OWORD *)(v7 + 20);
      v11[1] = v10;
      uint64_t result = _SBMigAcquireFocusPreventingFullScreenPresentationAssertion(v8, v4 + 56, v9, v11);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
    int v3 = -309;
  }
  else
  {
LABEL_2:
    int v3 = -304;
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XSetShowsProgress(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      uint64_t v5 = *(unsigned int *)(result + 32);
      long long v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      uint64_t result = _SBMigSetShowsProgress(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XSetAllApplicationsShowProgress(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      uint64_t v5 = *(unsigned int *)(result + 32);
      long long v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      uint64_t result = _SBMigSetAllApplicationsShowProgress(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XSetAllApplicationsShowSyncIndicator(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      uint64_t v5 = *(unsigned int *)(result + 32);
      long long v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      uint64_t result = _SBMigSetAllApplicationsShowSyncIndicator(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XSetShowsOverridesForRecording(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      uint64_t v5 = *(unsigned __int8 *)(result + 32);
      long long v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      uint64_t result = _SBMigSetShowsOverridesForRecording(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XGetWallpaperPreviewSurface(uint64_t result, _DWORD *a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 64)
  {
    int v3 = -304;
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_9;
  }
  if (*(_DWORD *)(result + 64) || *(_DWORD *)(result + 68) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_9:
    a2[8] = v3;
    goto LABEL_10;
  }
  uint64_t v4 = a2 + 7;
  *((void *)a2 + 4) = 0x11000000000000;
  uint64_t v5 = *(unsigned int *)(result + 12);
  uint64_t v6 = *(unsigned __int8 *)(result + 48);
  double v7 = *(double *)(result + 52);
  uint64_t v8 = *(unsigned int *)(result + 60);
  uint64_t v9 = *(unsigned int *)(result + 28);
  long long v10 = *(_OWORD *)(result + 100);
  v11[0] = *(_OWORD *)(result + 84);
  v11[1] = v10;
  uint64_t result = _SBMigGetWallpaperPreviewSurface(v5, v6, v8, v9, v4, v11, v7);
  if (!result)
  {
    *a2 |= 0x80000000;
    a2[1] = 40;
    a2[6] = 1;
    return result;
  }
  a2[8] = result;
LABEL_10:
  *((void *)a2 + 3) = *MEMORY[0x1E4F14068];
  return result;
}

void _XGetWallpaperPreview(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 1 || *(_DWORD *)(a1 + 4) != 72)
  {
    int v4 = -304;
    goto LABEL_10;
  }
  if (*(unsigned char *)(a1 + 39) != 1 || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a1 + 68))
  {
    int v4 = -300;
    goto LABEL_10;
  }
  if (*(_DWORD *)(a1 + 72) || *(_DWORD *)(a1 + 76) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_11;
  }
  *(_DWORD *)(a2 + 52) = 0;
  uint64_t v5 = (_DWORD *)(a2 + 52);
  *(_DWORD *)(a2 + 36) = 16777472;
  uint64_t v6 = a2 + 28;
  uint64_t v7 = *(unsigned int *)(a1 + 12);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 52);
  double v9 = *(double *)(a1 + 56);
  uint64_t v10 = *(unsigned int *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 28);
  uint64_t v12 = *(unsigned int *)(a1 + 40);
  long long v13 = *(_OWORD *)(a1 + 108);
  v15[0] = *(_OWORD *)(a1 + 92);
  v15[1] = v13;
  int WallpaperPreview = _SBMigGetWallpaperPreview(v7, v8, v10, v11, v12, v6, v5, v15, v9);
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 40) = 0;
  if (!WallpaperPreview)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return;
  }
  *(_DWORD *)(a2 + 32) = WallpaperPreview;
LABEL_11:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

_DWORD *_XSetWallpaperOptionsForLocations(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  if (v4 < 0x58) {
    goto LABEL_16;
  }
  if (v4 > 0x458) {
    goto LABEL_16;
  }
  unsigned int v5 = result[20];
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 88 < v5 || v4 != v6 + 88) {
    goto LABEL_16;
  }
  uint64_t v8 = 1108;
  if (result[1] < 0x454uLL) {
    uint64_t v8 = result[1];
  }
  uint64_t result = memchr(result + 21, 0, v8 - 84);
  if (!result)
  {
LABEL_16:
    int v10 = -304;
    goto LABEL_17;
  }
  double v9 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v9 || *((_DWORD *)v9 + 1) <= 0x1Fu)
  {
    int v10 = -309;
LABEL_17:
    *(_DWORD *)(a2 + 32) = v10;
    uint64_t v11 = *MEMORY[0x1E4F14068];
    goto LABEL_18;
  }
  uint64_t v12 = v3[3];
  float v13 = *((float *)v3 + 8);
  float v14 = *((float *)v3 + 9);
  float v15 = *((float *)v3 + 10);
  float v16 = *((float *)v3 + 11);
  float v17 = *((float *)v3 + 12);
  float v18 = *((float *)v3 + 13);
  uint64_t v19 = *((unsigned __int8 *)v3 + 56);
  uint64_t v20 = *((unsigned __int8 *)v3 + 60);
  uint64_t v21 = *((unsigned __int8 *)v3 + 64);
  double v22 = *(double *)(v3 + 17);
  uint64_t v23 = *((unsigned __int8 *)v3 + v6 + 84);
  long long v24 = *(_OWORD *)(v9 + 36);
  v25[0] = *(_OWORD *)(v9 + 20);
  v25[1] = v24;
  uint64_t result = (_DWORD *)_SBMigSetWallpaperOptionsForLocations(v12, v19, v20, v21, (uint64_t)(v3 + 21), v23, (unsigned char *)(a2 + 36), v25, v13, v14, v15, v16, v17, v18, v22);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v11 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v11;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_18:
  *(void *)(a2 + 24) = v11;
  return result;
}

_DWORD *_XGetBatteryAwakeTime(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }
  int v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  uint64_t v5 = result[3];
  long long v6 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v6;
  uint64_t result = (_DWORD *)_SBMigGetBatteryAwakeTime(v5, a2 + 44, v8);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v7 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v7;
    uint64_t result = (_DWORD *)strlen((const char *)(a2 + 44));
    if (!(((unint64_t)result + 1) >> 32))
    {
      *(_DWORD *)(a2 + 36) = 0;
      *(_DWORD *)(a2 + 40) = result + 1;
      *(_DWORD *)(a2 + 4) = ((result + 4) & 0xFFFFFFFC) + 44;
      return result;
    }
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(void *)(a2 + 24) = v7;
  return result;
}

_DWORD *_XGetRecentSleepsWakes(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }
  int v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  uint64_t v5 = result[3];
  long long v6 = *(_OWORD *)(v3 + 9);
  v7[0] = *(_OWORD *)(v3 + 5);
  v7[1] = v6;
  uint64_t result = (_DWORD *)_SBMigGetRecentSleepsWakes(v5, (void *)(a2 + 28), (_DWORD *)(a2 + 52), v7);
  if (!result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XGetScheduledPowerEvents(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }
  int v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  uint64_t v5 = result[3];
  long long v6 = *(_OWORD *)(v3 + 9);
  v7[0] = *(_OWORD *)(v3 + 5);
  v7[1] = v6;
  uint64_t result = (_DWORD *)_SBMigGetScheduledPowerEvents(v5, (void *)(a2 + 28), (_DWORD *)(a2 + 52), v7);
  if (!result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XGetBatteryUsageTimesInSeconds(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }
  int v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    uint64_t v5 = *MEMORY[0x1E4F14068];
    goto LABEL_8;
  }
  int v6 = result[3];
  long long v7 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v7;
  uint64_t result = (_DWORD *)_SBMigGetBatteryUsageTimesInSeconds(v6, (_DWORD *)(a2 + 36), (_DWORD *)(a2 + 40), (unsigned char *)(a2 + 44), (unsigned char *)(a2 + 48), v8);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v5 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 52;
    return result;
  }
LABEL_8:
  *(void *)(a2 + 24) = v5;
  return result;
}

uint64_t SpringBoardUser_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 100068) >= 0xFFFFFFBC
    && (uint64_t v5 = (void (*)(void))_SBMigSpringBoardUser_subsystem[5 * (v4 - 100000) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void _splitOptionsIntoApplicationOptionsAndRealOptions_cold_1()
{
  __assert_rtn("_splitOptionsIntoApplicationOptionsAndRealOptions", "SBSApplicationLaunching.m", 142, "local_realOptions != nil");
}

void _splitOptionsIntoApplicationOptionsAndRealOptions_cold_2()
{
  __assert_rtn("_splitOptionsIntoApplicationOptionsAndRealOptions", "SBSApplicationLaunching.m", 138, "local_applicationOptions != nil");
}

void SBSOpenDataActivationURL_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(*(void *)a1 + 24);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_18FBC5000, a2, OS_LOG_TYPE_ERROR, "Error opening data activation URL: %d", (uint8_t *)v3, 8u);
}

void __getATXHomeScreenPageClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *AppPredictionClientLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"SBSFocusModesHomeScreenSettingsRequest.m" lineNumber:17 description:@"%s", *a1];

  __break(1u);
}

void __getATXHomeScreenPageClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getATXHomeScreenPageClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"SBSFocusModesHomeScreenSettingsRequest.m" lineNumber:18 description:@"Unable to find class %s", "ATXHomeScreenPage"];

  __break(1u);
}

void __getDDRResetOptionsClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getDDRResetOptionsClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"SpringBoardLegacyServerUser.m" lineNumber:23 description:@"Unable to find class %s" arguments:v1];

  __break(1u);
}

void EmbeddedDataResetLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *EmbeddedDataResetLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"SpringBoardLegacyServerUser.m" lineNumber:20 description:@"%s", *a1];

  __break(1u);
}

void __getDDRResetRequestClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getDDRResetRequestClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"SpringBoardLegacyServerUser.m" lineNumber:22 description:@"Unable to find class %s", @"DDRResetRequest"];

  __break(1u);
}

void __getDDRResetServiceClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getDDRResetServiceClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"SpringBoardLegacyServerUser.m" lineNumber:21 description:@"Unable to find class %s", "DDRResetService"];

  __break(1u);
}

void soft_ADClientAddValueForScalarKey_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"void soft_ADClientAddValueForScalarKey(CFStringRef, int64_t)"];
  [v0 handleFailureInFunction:v1 file:@"SBScreenTimeTrackingController.m" lineNumber:22 description:@"%s" dlerror()];

  __break(1u);
}

void AggregateDictionaryLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *AggregateDictionaryLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"SBScreenTimeTrackingController.m" lineNumber:19 description:@"%s" argument:a1];

  __break(1u);
}

void __getFBDisplayManagerClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *FrontBoardLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"_SBSPrefixHelper.m" lineNumber:18 description:@"%s", *a1];

  __break(1u);
}

void __getFBDisplayManagerClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getFBDisplayManagerClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"_SBSPrefixHelper.m" lineNumber:19 description:@"Unable to find class %s", "FBDisplayManager"];

  __break(1u);
}

void _SBMigAddAlertItemsSuppressionAssertion_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "_SBXXAddAlertItemsSuppressionAssertion";
  _os_log_error_impl(&dword_18FBC5000, log, OS_LOG_TYPE_ERROR, "[SBMig] invalid assertion port sent to %s", (uint8_t *)&v1, 0xCu);
}

void SBSSetStatusBarShowsActivityForApplication_cold_1()
{
}

void SystemStatusLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SystemStatusLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"_SBSSystemStatusSoftLinking.m" lineNumber:12 description:@"%s", *a1];

  __break(1u);
}

void getSTBackgroundActivityIdentifierBackgroundLocation_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (STBackgroundActivityIdentifierBackgroundLocation) (*)(void))0)()) getSTBackgroundActivityIdentifierBackgroundLocation(void)"];
  [v0 handleFailureInFunction:v1 file:@"_SBSSystemStatusSoftLinking.m" lineNumber:13 description:@"%s", dlerror()];

  __break(1u);
}

void soft_STBackgroundActivityIdentifiersDescription_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"CFStringRef soft_STBackgroundActivityIdentifiersDescription(CFSetRef)"];
  [v0 handleFailureInFunction:v1 file:@"_SBSSystemStatusSoftLinking.m" lineNumber:14 description:@"%s", dlerror()];

  __break(1u);
}

void SystemStatusUILibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SystemStatusUILibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"_SBSSystemStatusSoftLinking.m" lineNumber:18 description:@"%s", *a1];

  __break(1u);
}

void soft_STUIBackgroundActivityIdentifiersForStyleOverrides_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"CFSetRef soft_STUIBackgroundActivityIdentifiersForStyleOverrides(uint64_t)"];
  [v0 handleFailureInFunction:v1 file:@"_SBSSystemStatusSoftLinking.m" lineNumber:19 description:@"%s", dlerror()];

  __break(1u);
}

void soft_STUIStyleOverridesForBackgroundActivityIdentifiers_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"uint64_t soft_STUIStyleOverridesForBackgroundActivityIdentifiers(CFSetRef)"];
  [v0 handleFailureInFunction:v1 file:@"_SBSSystemStatusSoftLinking.m" lineNumber:20 description:@"%s", dlerror()];

  __break(1u);
}

void SBSAppSwitcherServiceRegister_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "SBSAppSwitcherServiceRegistrationRef SBSAppSwitcherServiceRegister(CFAllocatorRef, CFStringRef, CFStringRef)";
  _os_log_error_impl(&dword_18FBC5000, log, OS_LOG_TYPE_ERROR, "%s Required serviceBundleID", (uint8_t *)&v1, 0xCu);
}

void SBSAppSwitcherServiceRegister_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "SBSAppSwitcherServiceRegistrationRef SBSAppSwitcherServiceRegister(CFAllocatorRef, CFStringRef, CFStringRef)";
  _os_log_error_impl(&dword_18FBC5000, log, OS_LOG_TYPE_ERROR, "%s Required serviceViewControllerClassName", (uint8_t *)&v1, 0xCu);
}

void SBMigGetFunctionForSymbol_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SBMachServiceInitialize_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18FBC5000, a2, OS_LOG_TYPE_ERROR, "[SBMig] Invalid specification for service \"%{public}s\" -- server will not run!", (uint8_t *)&v2, 0xCu);
}

void SBMachServiceInitialize_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18FBC5000, a2, OS_LOG_TYPE_ERROR, "[SBMig] Service already initialized: %{public}s", (uint8_t *)&v2, 0xCu);
}

void SBMachChannelHandleEvent_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a1 + 20);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_18FBC5000, a2, OS_LOG_TYPE_ERROR, "[SBMig] Unable to load or validate audit token for messageID %d. Ignoring.", (uint8_t *)v3, 8u);
}

void SBMachChannelHandleEvent_cold_2(int *a1, int a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v5 = *a1;
  int v6 = BSProcessNameForPID();
  v7[0] = 67109634;
  v7[1] = v5;
  __int16 v8 = 2114;
  double v9 = v6;
  __int16 v10 = 1024;
  int v11 = a2;
  _os_log_error_impl(&dword_18FBC5000, a3, OS_LOG_TYPE_ERROR, "[SBMig] ERROR: No service found for message id %d from caller %{public}@:%d", (uint8_t *)v7, 0x18u);
}

void SBMachChannelHandleEvent_cold_3(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_18FBC5000, a2, OS_LOG_TYPE_ERROR, "[SBMig] Error demultiplexing messageID %d.", (uint8_t *)v3, 8u);
}

void SBMachChannelHandleEvent_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SBMachChannelHandleEvent_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t BKSHIDServicesGetBacklightFactor()
{
  return MEMORY[0x1F410BF78]();
}

uint64_t BKSWatchdogAssertionCreateForPID()
{
  return MEMORY[0x1F410C058]();
}

uint64_t BSCreateDeserializedArrayFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C1B8]();
}

uint64_t BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C1C8]();
}

uint64_t BSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C1D0]();
}

uint64_t BSCreateDeserializedStringFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C1D8]();
}

uint64_t BSCreateSerializedBSXPCEncodableObject()
{
  return MEMORY[0x1F410C1E0]();
}

uint64_t BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C200]();
}

uint64_t BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C208]();
}

uint64_t BSDeserializeCFValueFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C210]();
}

uint64_t BSDeserializeCGRectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C228]();
}

uint64_t BSDeserializeDataFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C238]();
}

uint64_t BSDeserializeDoubleFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C240]();
}

uint64_t BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C248]();
}

uint64_t BSDeserializeSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C250]();
}

uint64_t BSDeserializeStringFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C258]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1F410C270]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x1F410C278]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1F410C288]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1F410C2A0]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1F410C2A8]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x1F410C2B8]();
}

uint64_t BSEqualBools()
{
  return MEMORY[0x1F410C2D0]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSEqualSets()
{
  return MEMORY[0x1F410C2F0]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1F410C2F8]();
}

uint64_t BSFloatGreaterThanFloat()
{
  return MEMORY[0x1F410C338]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1F410C350]();
}

uint64_t BSInterfaceOrientationIsLandscape()
{
  return MEMORY[0x1F410C3A0]();
}

uint64_t BSInterfaceOrientationIsPortrait()
{
  return MEMORY[0x1F410C3A8]();
}

uint64_t BSInterfaceOrientationMaskDescription()
{
  return MEMORY[0x1F410C3C0]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1F410C420]();
}

uint64_t BSMachPortIsType()
{
  return MEMORY[0x1F410C440]();
}

uint64_t BSMachPortIsUsable()
{
  return MEMORY[0x1F410C448]();
}

uint64_t BSMachReceiveRightRelease()
{
  return MEMORY[0x1F410C450]();
}

uint64_t BSProcessNameForPID()
{
  return MEMORY[0x1F410C500]();
}

uint64_t BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C568]();
}

uint64_t BSSerializeArrayToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C570]();
}

uint64_t BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C578]();
}

uint64_t BSSerializeCFValueToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C580]();
}

uint64_t BSSerializeCGRectToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C598]();
}

uint64_t BSSerializeCGSizeToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C5A0]();
}

uint64_t BSSerializeDoubleToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C5B0]();
}

uint64_t BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C5B8]();
}

uint64_t BSSerializeSetToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C5C0]();
}

uint64_t BSSerializeStringToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C5C8]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1F410C5E0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1F40D70F8](allocator, context);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7470](bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x1F40D83E0](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1F40D8740](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1F40D8758](anURL, pathStyle);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

BOOL NSMapMember(NSMapTable *table, const void *key, void **originalKey, void **value)
{
  return MEMORY[0x1F40E7198](table, key, originalKey, value);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1F410C6F0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t bootstrap_check_in2()
{
  return MEMORY[0x1F40CA540]();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA548](*(void *)&bp, service_name, sp);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x1F40CBB40]();
}

uint64_t dispatch_mach_create_f()
{
  return MEMORY[0x1F40CBB50]();
}

uint64_t dispatch_mach_mig_demux()
{
  return MEMORY[0x1F40CBB58]();
}

uint64_t dispatch_mach_mig_demux_get_context()
{
  return MEMORY[0x1F40CBB60]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1F40CBB68]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1F40CBC70]();
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD58](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1F40CC9A0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1F40CCA10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1F40CCA30](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info, *(void *)&port_infoCnt);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1F40CCA40](*(void *)&task, *(void *)&name, ptype);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x1F40CCD60]();
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x1F40CCD78]();
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x1F40CCD90](dest, src, *(void *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x1F40CCD98](dest, src, *(void *)&len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

[super a2];
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40CE758](msg);
}

uint64_t xpc_copy_event()
{
  return MEMORY[0x1F40CED58]();
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1F40CF250]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}