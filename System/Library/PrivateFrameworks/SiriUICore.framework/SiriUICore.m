void sub_1A64CE638(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A64CEE10(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id _SUICLayerNullActions()
{
  if (_SUICLayerNullActions_onceToken != -1) {
    dispatch_once(&_SUICLayerNullActions_onceToken, &__block_literal_global);
  }
  v0 = (void *)_SUICLayerNullActions_actions;

  return v0;
}

double _SUICSpringAnimationSolveForInput(double a1)
{
  if (_SUICInitializeStaticVariables_onceToken != -1) {
    dispatch_once(&_SUICInitializeStaticVariables_onceToken, &__block_literal_global_182);
  }
  double v2 = fmin(fmax(a1, 0.0), 1.0);
  *(float *)&double v2 = v2;
  [(id)_SUICSpringAnimationTimingFunction _solveForInput:v2];
  objc_msgSend((id)_SUICSpringAnimationTimingAnimation, "_solveForInput:");
  return v3;
}

id _SUICMagicCurve()
{
  if (_SUICMagicCurve_onceToken != -1) {
    dispatch_once(&_SUICMagicCurve_onceToken, &__block_literal_global_37);
  }
  v0 = (void *)_SUICMagicCurve_curve;

  return v0;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void SUICSetSiriUILanguageCode(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (([v1 isEqualToString:__currentLanguageCode] & 1) == 0)
  {
    double v2 = (void *)__stringTables;
    __stringTables = 0;

    uint64_t v3 = [v1 copy];
    v4 = (void *)__currentLanguageCode;
    __currentLanguageCode = v3;

    v5 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      v7 = "SUICSetSiriUILanguageCode";
      __int16 v8 = 2080;
      v9 = "SUICSetSiriUILanguageCode";
      __int16 v10 = 2112;
      uint64_t v11 = __currentLanguageCode;
      _os_log_impl(&dword_1A64CC000, v5, OS_LOG_TYPE_DEFAULT, "%s %s updated language code to: %@", (uint8_t *)&v6, 0x20u);
    }
  }
}

void SUICPurgeCachedLocalizedStrings()
{
  v0 = (void *)__stringTables;
  __stringTables = 0;
}

id SUICGetSiriUILanguageCode()
{
  return (id)__currentLanguageCode;
}

BOOL SUICSiriLanguageIsRTL()
{
  return [MEMORY[0x1E4F1CA20] characterDirectionForLanguage:__currentLanguageCode] == 2;
}

void sub_1A64D2FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A64D3138(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t IsCharacterAtIndexMemberOfCharacterSet(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  uint64_t v7 = [v5 characterAtIndex:*a2];
  if (v7 >> 11 == 27 && (unint64_t v8 = *a2 + 1, v8 < [v5 length]))
  {
    ++*a2;
    uint64_t v9 = objc_msgSend(v6, "longCharacterIsMember:", objc_msgSend(v5, "characterAtIndex:") + (v7 << 10) - 56613888);
  }
  else
  {
    uint64_t v9 = [v6 characterIsMember:v7];
  }
  uint64_t v10 = v9;

  return v10;
}

void sub_1A64D8008(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1A64D8218(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1A64DAA58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1A64DBCE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A64DBF14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SetupAssistantLibraryCore()
{
  if (!SetupAssistantLibraryCore_frameworkLibrary) {
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return SetupAssistantLibraryCore_frameworkLibrary;
}

uint64_t __SetupAssistantLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke(uint64_t a1)
{
  double v2 = (void *)SetupAssistantLibraryCore();
  if (!v2)
  {
    v4 = (void *)abort_report_np();
    free(v4);
  }
  uint64_t result = dlsym(v2, "BYSetupAssistantHasCompletedInitialRun");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *SUICProgressStateNameForState(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 4) {
    return @"None";
  }
  else {
    return off_1E5C59828[a1 + 1];
  }
}

__CFString *SUICProgressEventNameForEvent(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 5) {
    return @"Start";
  }
  else {
    return off_1E5C597F8[a1 + 1];
  }
}

void sub_1A64DCD1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33)
{
  objc_destroyWeak(v33);
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(a12);
  objc_destroyWeak(&a33);
  _Unwind_Resume(a1);
}

void sub_1A64DDF1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A64DE170(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A64DE35C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A64DEC94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *SUICStringForAutoDismissalReason(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return 0;
  }
  else {
    return off_1E5C59940[a1 - 1];
  }
}

void sub_1A64E0448(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1A64E0828(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

double _calculateChipNormal(uint64_t a1, int a2, int a3, float32x4_t a4)
{
  v4 = (float32x4_t *)(a1 + 48 * a2);
  a4.i64[0] = v4[2].i64[0];
  a4.i32[2] = 0;
  float32x4_t v5 = vaddq_f32(a4, *v4);
  float32x4_t v6 = vmulq_f32(v5, v5);
  v6.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)v6, 2), vadd_f32(*(float32x2_t *)v6.f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v6.f32, 1))).u32[0];
  float32x2_t v7 = vrsqrte_f32((float32x2_t)v6.u32[0]);
  float32x2_t v8 = vmul_f32(v7, vrsqrts_f32((float32x2_t)v6.u32[0], vmul_f32(v7, v7)));
  int8x16_t v9 = (int8x16_t)vmulq_n_f32(v5, vmul_f32(v8, vrsqrts_f32((float32x2_t)v6.u32[0], vmul_f32(v8, v8))).f32[0]);
  uint64_t v10 = (float32x4_t *)(a1 + 48 * a3);
  v6.i64[0] = v10[2].i64[0];
  v6.i32[2] = 0;
  float32x4_t v11 = vaddq_f32(v6, *v10);
  int32x4_t v12 = (int32x4_t)vmulq_f32(v11, v11);
  v12.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v12, 2), vadd_f32(*(float32x2_t *)v12.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v12.i8, 1))).u32[0];
  float32x2_t v13 = vrsqrte_f32((float32x2_t)v12.u32[0]);
  float32x2_t v14 = vmul_f32(v13, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v13, v13)));
  int8x16_t v15 = (int8x16_t)vmulq_n_f32(v11, vmul_f32(v14, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v14, v14))).f32[0]);
  float32x4_t v16 = (float32x4_t)vextq_s8(v9, v9, 8uLL);
  v16.i32[1] = v9.i32[0];
  v17.i32[0] = vextq_s8(v15, v15, 8uLL).u32[0];
  v17.i32[1] = v15.i32[0];
  *(float32x2_t *)v16.f32 = vmla_f32(vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v15, v15, 4uLL), vneg_f32(*(float32x2_t *)v16.f32)), v17, (float32x2_t)*(_OWORD *)&vextq_s8(v9, v9, 4uLL));
  v16.i32[2] = vmlas_n_f32((float)-*(float *)&v9.i32[1] * *(float *)v15.i32, *(float *)&v15.i32[1], *(float *)v9.i32);
  int32x4_t v18 = (int32x4_t)vmulq_f32(v16, v16);
  v18.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v18, 2), vadd_f32(*(float32x2_t *)v18.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v18.i8, 1))).u32[0];
  *(float32x2_t *)v15.i8 = vrsqrte_f32((float32x2_t)v18.u32[0]);
  *(float32x2_t *)v15.i8 = vmul_f32(*(float32x2_t *)v15.i8, vrsqrts_f32((float32x2_t)v18.u32[0], vmul_f32(*(float32x2_t *)v15.i8, *(float32x2_t *)v15.i8)));
  *(void *)&double result = vmulq_n_f32(v16, vmul_f32(*(float32x2_t *)v15.i8, vrsqrts_f32((float32x2_t)v18.u32[0], vmul_f32(*(float32x2_t *)v15.i8, *(float32x2_t *)v15.i8))).f32[0]).u64[0];
  return result;
}

double matrix4x4_translation()
{
  __asm { FMOV            V3.4S, #1.0 }
  return *(double *)&_PromotedConst;
}

void sub_1A64E4FC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

float matrix_perspective_right_hand(float a1, float a2)
{
  return (float)(1.0 / tanf(a1 * 0.5)) / a2;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return v0;
}

void sub_1A64E7F08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A64E8134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1A64E8E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

id SUICGetIndexCacheEntryKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8, double a9)
{
  float32x2_t v14 = NSString;
  int8x16_t v15 = NSStringFromCGRect(*(CGRect *)&a5);
  float32x4_t v16 = [v14 stringWithFormat:@"%@.%ld.%.2f.%ld.%d.%d", v15, a1, *(void *)&a9, a2, a3, a4];

  return v16;
}

void sub_1A64EDC78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1A64F2E80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t SUICCommonPhysicsInternal_Init(uint64_t a1, uint64_t a2, int a3)
{
  *(unsigned char *)(a1 + 161) = UIAccessibilityIsReduceMotionEnabled();
  *(void *)a1 = a2;
  for (uint64_t i = 24; i != 156; i += 4)
  {
    uint64_t result = rand();
    *(float *)(a1 + i) = (float)((float)((float)(int)result * 4.6566e-10) * 600.0) + -300.0;
  }
  if (a2 <= 89)
  {
    if (a2 == 30)
    {
      float v8 = 0.2;
      goto LABEL_14;
    }
    if (a2 == 60)
    {
      float v8 = 0.3;
      goto LABEL_14;
    }
LABEL_15:
    SUICCommonPhysicsInternal_Init_cold_1();
  }
  if (a2 == 90)
  {
    float v8 = 0.7;
    goto LABEL_14;
  }
  if (a2 == 120)
  {
    float v8 = 1.0;
    goto LABEL_14;
  }
  if (a2 != 240) {
    goto LABEL_15;
  }
  float v8 = 1.5;
LABEL_14:
  *(float *)(a1 + 12) = 1.0 / (float)(unint64_t)a2;
  *(float *)(a1 + 16) = v8;
  *(_DWORD *)(a1 + 8) = a3;
  *(_DWORD *)(a1 + 20) = 0;
  *(unsigned char *)(a1 + 160) = 0;
  return result;
}

void SUICLightPhysics_Init(uint64_t a1, uint64_t a2, int a3)
{
  SUICCommonPhysicsInternal_Init(a1, a2, a3);
  if (*(void *)a1)
  {
    _setupSpring(a1, a1 + 244, 2uLL, 0.0);
    _setupSpring(a1, a1 + 260, 3uLL, 0.0);
    _setupSpring(a1, a1 + 216, 0, 0.0);
    _setupSpring(a1, a1 + 200, 4 * *(unsigned __int8 *)(a1 + 161), 0.0);
    _setupSpring(a1, a1 + 184, 1uLL, 0.0);
    _setupSpring(a1, a1 + 168, 1uLL, 0.0);
  }
}

void SUICOrbPhysics_Init(uint64_t a1, uint64_t a2, int a3)
{
  SUICCommonPhysicsInternal_Init(a1, a2, a3);
  *(void *)(a1 + 168) = 0;
  *(_DWORD *)(a1 + 924) = 0;
  *(_DWORD *)(a1 + 932) = 0;
  *(unsigned char *)(a1 + 936) = 0;
  *(_OWORD *)(a1 + 800) = 0u;
  if (*(void *)a1)
  {
    _setupSpring(a1, a1 + 176, 1uLL, 1.25);
    _setupSpring(a1, a1 + 192, 2uLL, 0.0);
    _setupSpring(a1, a1 + 208, 1uLL, 0.0);
    _setupSpring(a1, a1 + 224, 2uLL, 1.0);
    _setupSpring(a1, a1 + 240, 1uLL, 1.0);
    _setupSpring(a1, a1 + 256, 3uLL, 0.0);
    _setupSpring(a1, a1 + 272, 2uLL, 0.0);
    _setupSpring(a1, a1 + 288, 0, 0.0);
    _setupSpring(a1, a1 + 304, *(unsigned char *)(a1 + 161) == 0, 0.0);
    for (uint64_t i = 320; i != 416; i += 16)
      _setupSpring(a1, a1 + i, 0, 0.0);
  }
}

void SUICLightPhysics_UpdatePhysics(uint64_t a1, float a2)
{
  int v3 = (int)((float)(a2 / *(float *)(a1 + 12)) + 0.5);
  if (*(_DWORD *)(a1 + 8) < v3) {
    int v3 = *(_DWORD *)(a1 + 8);
  }
  if (v3 <= 1) {
    int v3 = 1;
  }
  int v4 = v3 - 1;
  do
  {
    SUICLightPhysicsInternal_UpdatePhysicsTick(a1);
    if (*(unsigned char *)(a1 + 160)) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v4 == 0;
    }
    --v4;
  }
  while (!v5);

  SUICLightPhysicsInternal_FinalizeStateForFrame(a1);
}

float SUICLightPhysicsInternal_UpdatePhysicsTick(uint64_t a1)
{
  float v1 = *(float *)(a1 + 20);
  int v2 = *(unsigned __int8 *)(a1 + 161);
  float v3 = (float)(v1 * v1) * 0.7 + 0.699999988;
  if (*(unsigned char *)(a1 + 161)) {
    float v3 = 0.7;
  }
  float v4 = *(float *)(a1 + 168);
  float v5 = (float)(*(float *)(a1 + 180) * v3) + v4 * (1.0 - *(float *)(a1 + 180));
  float v6 = v5 - v4;
  if (v6 != 0.0)
  {
    float v7 = *(float *)(a1 + 172);
    float v8 = *(float *)(a1 + 176);
    float v9 = v6 - v7;
    if ((float)(v6 - v7) <= v8)
    {
      if (v9 >= (float)-v8) {
        float v10 = v7 + v9;
      }
      else {
        float v10 = v7 - v8;
      }
    }
    else
    {
      float v10 = v7 + v8;
    }
    *(float *)(a1 + 172) = v10;
    if (v6 >= 0.0)
    {
      if (v10 <= v6)
      {
LABEL_14:
        float v4 = v4 + v10;
        *(float *)(a1 + 168) = v4;
        goto LABEL_15;
      }
    }
    else if (v10 >= v6)
    {
      goto LABEL_14;
    }
    *(float *)(a1 + 172) = v6;
    float v10 = v6;
    goto LABEL_14;
  }
LABEL_15:
  float v12 = *(float *)(a1 + 184);
  float v11 = *(float *)(a1 + 188);
  float v13 = *(float *)(a1 + 196) + v12 * (1.0 - *(float *)(a1 + 196));
  float v14 = v13 - v12;
  if (v14 != 0.0)
  {
    float v15 = v14 - v11;
    float v16 = *(float *)(a1 + 192);
    if ((float)(v14 - v11) <= v16)
    {
      if (v15 >= (float)-v16) {
        float v11 = v11 + v15;
      }
      else {
        float v11 = v11 - v16;
      }
    }
    else
    {
      float v11 = v11 + v16;
    }
    *(float *)(a1 + 188) = v11;
    if (v14 >= 0.0)
    {
      if (v11 <= v14)
      {
LABEL_26:
        *(float *)(a1 + 184) = v12 + v11;
        goto LABEL_27;
      }
    }
    else if (v11 >= v14)
    {
      goto LABEL_26;
    }
    *(float *)(a1 + 188) = v14;
    float v11 = v14;
    goto LABEL_26;
  }
LABEL_27:
  float v17 = *(float *)(a1 + 12);
  float v18 = v4 * 0.07;
  *(float *)(a1 + 276) = v18;
  if (!*(unsigned char *)(a1 + 160))
  {
    float v19 = *(float *)(a1 + 212);
    double v20 = (float)(v1 * v19);
    float v21 = *(float *)(a1 + 200);
    float v22 = v20 + v21 * (1.0 - v19);
    float v23 = v22 - v21;
    if (v23 != 0.0)
    {
      float v24 = *(float *)(a1 + 204);
      float v25 = *(float *)(a1 + 208);
      float v26 = v23 - v24;
      if ((float)(v23 - v24) <= v25)
      {
        if (v26 >= (float)-v25) {
          float v27 = v24 + v26;
        }
        else {
          float v27 = v24 - v25;
        }
      }
      else
      {
        float v27 = v24 + v25;
      }
      *(float *)(a1 + 204) = v27;
      if (v23 >= 0.0)
      {
        if (v27 <= v23)
        {
LABEL_39:
          *(float *)(a1 + 200) = v21 + v27;
          goto LABEL_40;
        }
      }
      else if (v27 >= v23)
      {
        goto LABEL_39;
      }
      *(float *)(a1 + 204) = v23;
      float v27 = v23;
      goto LABEL_39;
    }
  }
LABEL_40:
  if (!*(unsigned char *)(a1 + 240)) {
    goto LABEL_65;
  }
  float v28 = *(float *)(a1 + 244);
  float v29 = (float)(*(float *)(a1 + 256) * 0.0) + v28 * (1.0 - *(float *)(a1 + 256));
  float v30 = v29 - v28;
  if (v30 != 0.0)
  {
    float v31 = *(float *)(a1 + 248);
    float v32 = *(float *)(a1 + 252);
    float v33 = v30 - v31;
    if ((float)(v30 - v31) <= v32)
    {
      if (v33 >= (float)-v32) {
        float v34 = v31 + v33;
      }
      else {
        float v34 = v31 - v32;
      }
    }
    else
    {
      float v34 = v31 + v32;
    }
    *(float *)(a1 + 248) = v34;
    if (v30 >= 0.0)
    {
      if (v34 <= v30)
      {
LABEL_52:
        float v28 = v28 + v34;
        *(float *)(a1 + 244) = v28;
        goto LABEL_53;
      }
    }
    else if (v34 >= v30)
    {
      goto LABEL_52;
    }
    *(float *)(a1 + 248) = v30;
    float v34 = v30;
    goto LABEL_52;
  }
LABEL_53:
  float v35 = *(float *)(a1 + 272);
  double v36 = (float)(v28 * v35);
  float v37 = *(float *)(a1 + 260);
  float v38 = v36 + v37 * (1.0 - v35);
  float v39 = v38 - v37;
  if (v39 == 0.0) {
    goto LABEL_65;
  }
  float v40 = *(float *)(a1 + 264);
  float v41 = v39 - v40;
  float v42 = *(float *)(a1 + 268);
  if ((float)(v39 - v40) <= v42)
  {
    if (v41 >= (float)-v42) {
      float v43 = v40 + v41;
    }
    else {
      float v43 = v40 - v42;
    }
  }
  else
  {
    float v43 = v40 + v42;
  }
  *(float *)(a1 + 264) = v43;
  if (v39 < 0.0)
  {
    if (v43 >= v39) {
      goto LABEL_64;
    }
    goto LABEL_63;
  }
  if (v43 > v39)
  {
LABEL_63:
    *(float *)(a1 + 264) = v39;
    float v43 = v39;
  }
LABEL_64:
  *(float *)(a1 + 260) = v37 + v43;
LABEL_65:
  float v44 = 0.3;
  if (!v2) {
    float v44 = 2.5;
  }
  float v45 = *(float *)(a1 + 200);
  float v46 = v17 * (float)(v44 * v45);
  float v47 = v11 * 20.0;
  if (v11 <= 0.0) {
    float v47 = 0.0;
  }
  double v48 = v17;
  double v49 = v17 * 25.0;
  if (v49 >= v46)
  {
    float v51 = v46;
  }
  else
  {
    float v50 = v49;
    float v51 = v50;
  }
  float v52 = v45 + (float)(v47 * *(float *)(a1 + 16));
  if (v52 > 1.3) {
    float v52 = 1.3;
  }
  float v53 = *(float *)(a1 + 228);
  double v54 = (float)(v53 * v52);
  float v55 = *(float *)(a1 + 216);
  float v56 = v54 + v55 * (1.0 - v53);
  float v57 = v56 - v55;
  if (v57 != 0.0)
  {
    float v58 = *(float *)(a1 + 220);
    float v59 = *(float *)(a1 + 224);
    float v60 = v57 - v58;
    if ((float)(v57 - v58) <= v59)
    {
      if (v60 >= (float)-v59) {
        float v61 = v58 + v60;
      }
      else {
        float v61 = v58 - v59;
      }
    }
    else
    {
      float v61 = v58 + v59;
    }
    *(float *)(a1 + 220) = v61;
    if (v57 >= 0.0)
    {
      if (v61 <= v57)
      {
LABEL_85:
        *(float *)(a1 + 216) = v55 + v61;
        goto LABEL_86;
      }
    }
    else if (v61 >= v57)
    {
      goto LABEL_85;
    }
    *(float *)(a1 + 220) = v57;
    float v61 = v57;
    goto LABEL_85;
  }
LABEL_86:
  float v62 = v48 * 0.7;
  float v63 = v62 + v51 * 0.5;
  if (v2)
  {
    float v63 = v63 * 0.4;
    float v64 = v48 * 0.6;
    if (v63 > v64) {
      float v63 = v64;
    }
  }
  float result = v63 + *(float *)(a1 + 156);
  *(float *)(a1 + 156) = result;
  return result;
}

void SUICLightPhysicsInternal_FinalizeStateForFrame(uint64_t a1)
{
  uint64_t v2 = 0;
  unint64_t v3 = 0;
  uint64_t v4 = a1 + 32;
  float32x4_t v17 = (float32x4_t)vdupq_n_s32(0x41490FDBu);
  float32x2_t v5 = (float32x2_t)vdup_n_s32(0x3F8CCCCDu);
  do
  {
    noise2();
    v19.i64[0] = v6;
    noise2();
    __int32 v18 = v7;
    noise2();
    float32x4_t v8 = v19;
    v8.i32[1] = v18;
    v8.i32[2] = v9;
    float32x4_t v19 = vmulq_f32(v8, v17);
    __float2 v10 = __sincosf_stret(v19.f32[2]);
    __float2 v11 = __sincosf_stret(v19.f32[1]);
    __float2 v12 = __sincosf_stret(v19.f32[0]);
    float v13 = (float)(v10.__sinval * (float)-(float)(v12.__sinval * v11.__sinval)) + (float)(v10.__cosval * v11.__cosval);
    v14.f32[0] = v13;
    v14.f32[1] = -(float)(v12.__cosval * v10.__sinval);
    if (*(void *)(a1 + 232) != 1) {
      goto LABEL_10;
    }
    v14.f32[1] = (float)-(float)(v12.__cosval * v10.__sinval) * 0.5;
    if (v3 <= 2)
    {
      double v15 = v13 * 0.5 + -0.375;
LABEL_8:
      float v16 = v15;
      goto LABEL_9;
    }
    if (v3 < 7)
    {
      double v15 = v13 * 0.5 + 0.375;
      goto LABEL_8;
    }
    float v16 = 150.0;
LABEL_9:
    v14.f32[0] = v16;
LABEL_10:
    *(float32x2_t *)(a1 + 8 * v3++ + 280) = vmul_f32(v14, v5);
    v2 += 3;
    v4 += 12;
  }
  while (v2 != 33);
}

float SiriOrbPhysicsInternal_UpdateChipsSizes(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 168);
  float v2 = 1.0;
  if (!v1) {
    float v2 = 0.0;
  }
  float v3 = *(float *)(a1 + 316);
  double v4 = (float)(v3 * v2);
  float result = *(float *)(a1 + 304);
  float v6 = v4 + result * (1.0 - v3);
  float v7 = v6 - result;
  if (v7 != 0.0)
  {
    float v8 = *(float *)(a1 + 308);
    float v9 = v7 - v8;
    float v10 = *(float *)(a1 + 312);
    if ((float)(v7 - v8) <= v10)
    {
      if (v9 >= (float)-v10) {
        float v11 = v8 + v9;
      }
      else {
        float v11 = v8 - v10;
      }
    }
    else
    {
      float v11 = v8 + v10;
    }
    *(float *)(a1 + 308) = v11;
    if (v7 >= 0.0)
    {
      if (v11 <= v7)
      {
LABEL_14:
        float result = result + v11;
        *(float *)(a1 + 304) = result;
        goto LABEL_15;
      }
    }
    else if (v11 >= v7)
    {
      goto LABEL_14;
    }
    *(float *)(a1 + 308) = v7;
    float v11 = v7;
    goto LABEL_14;
  }
LABEL_15:
  __float2 v12 = (float *)(a1 + 320);
  if (!v1)
  {
    double v13 = 0.166666672;
LABEL_21:
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    double v15 = result;
    if (v13 <= v15)
    {
      LODWORD(v25) = 1065353216;
      if (v13 + 0.166666667 <= v15)
      {
        HIDWORD(v25) = 1065353216;
        if (v13 + 0.333333333 <= v15)
        {
          LODWORD(v26) = 1065353216;
          if (v13 + 0.5 <= v15)
          {
            HIDWORD(v26) = 1065353216;
            if (v13 + 0.666666667 <= v15)
            {
              LODWORD(v27) = 1065353216;
              if (v13 + 0.833333333 <= v15) {
                HIDWORD(v27) = 1065353216;
              }
            }
          }
        }
      }
    }
    uint64_t v16 = 0;
    float v17 = 0.0;
    while (1)
    {
      float v18 = *v12;
      float v19 = (float)(*(float *)((char *)&v25 + v16) * v12[3]) + *v12 * (1.0 - v12[3]);
      float v20 = v19 - *v12;
      if (v20 != 0.0) {
        break;
      }
LABEL_41:
      float v17 = v17 + v18;
      v16 += 4;
      v12 += 4;
      if (v16 == 24)
      {
        *(_DWORD *)(a1 + 920) = *(_DWORD *)(a1 + 320);
        float result = v17 * 0.166666667;
        *(float *)(a1 + 916) = result;
        return result;
      }
    }
    float v21 = v12[1];
    float v22 = v12[2];
    float v23 = v20 - v21;
    if ((float)(v20 - v21) <= v22)
    {
      if (v23 >= (float)-v22) {
        float v24 = v21 + v23;
      }
      else {
        float v24 = v21 - v22;
      }
    }
    else
    {
      float v24 = v21 + v22;
    }
    v12[1] = v24;
    if (v20 >= 0.0)
    {
      if (v24 <= v20)
      {
LABEL_40:
        float v18 = v18 + v24;
        *__float2 v12 = v18;
        goto LABEL_41;
      }
    }
    else if (v24 >= v20)
    {
      goto LABEL_40;
    }
    v12[1] = v20;
    float v24 = v20;
    goto LABEL_40;
  }
  double v13 = 0.0;
  if (*(float *)(a1 + 400) <= 0.999) {
    goto LABEL_21;
  }
  for (uint64_t i = 0; i != 24; i += 4)
    v12[i] = 1.0;
  *(void *)(a1 + 916) = 0x3F8000003F800000;
  return result;
}

void SUICOrbPhysics_UpdatePhysics(float32x4_t *a1, float a2)
{
  int v3 = (int)((float)(a2 / a1->f32[3]) + 0.5);
  if (a1->i32[2] < v3) {
    int v3 = a1->i32[2];
  }
  if (v3 <= 1) {
    int v3 = 1;
  }
  int v4 = v3 - 1;
  do
  {
    SUICOrbPhysicsInternal_UpdatePhysicsTick(a1);
    if (a1[10].i8[0]) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v4 == 0;
    }
    --v4;
  }
  while (!v5);

  SUICOrbPhysicsInternal_FinalizeStateForFrame((uint64_t)a1);
}

float32_t SUICOrbPhysicsInternal_UpdatePhysicsTick(float32x4_t *a1)
{
  float v118 = a1->f32[3];
  a1[57].f32[3] = v118 + a1[57].f32[3];
  uint64_t v2 = a1[10].i64[1];
  SiriOrbPhysicsInternal_UpdateChipsSizes((uint64_t)a1);
  float v3 = a1[57].f32[3];
  int v4 = a1[10].u8[1];
  float v5 = (float)(v3 - a1[58].f32[1]) * 4.2 + 2.35619449;
  float v6 = cosf(v5) * 0.5 + 0.5;
  if (v4) {
    float v6 = 0.0;
  }
  float v8 = a1[1].f32[1] * a1[1].f32[1];
  if (v4)
  {
    float v10 = 1.25;
  }
  else
  {
    float v9 = v8 * 0.25 + 1.25;
    float v10 = v9;
  }
  float v11 = 1.0;
  float v12 = v10;
  switch(v2)
  {
    case 0:
      if (v4) {
        float v12 = a1[11].f32[0];
      }
      else {
        float v12 = 0.0;
      }
      if (a1[57].f32[2] < 0.25)
      {
        a1[10].i8[0] = 1;
        a1[11].i32[0] = 0;
      }
      break;
    case 2:
      if (a1[58].i8[8])
      {
        if (a1[16].f32[0] < 0.025)
        {
          a1[58].f32[1] = v3;
          float v13 = (float)(v3 - v3) * 4.2 + 2.35619449;
          float v6 = cosf(v13) * 0.5 + 0.5;
          if (v4) {
            float v6 = 0.0;
          }
        }
        a1[58].i8[8] = 0;
      }
      float v12 = v6 * 0.25 + 1.0;
      float v11 = 0.2;
      break;
    case 3:
      float v12 = 1.0;
      float v11 = 0.9;
      break;
    default:
      break;
  }
  if (a1[10].i8[0])
  {
    float v14 = a1[11].f32[0];
    float v15 = v118;
    goto LABEL_114;
  }
  float v14 = a1[11].f32[0];
  float v16 = (float)(v12 * a1[11].f32[3]) + v14 * (1.0 - a1[11].f32[3]);
  float v17 = v16 - v14;
  if (v17 != 0.0)
  {
    float v18 = a1[11].f32[1];
    float v19 = a1[11].f32[2];
    float v20 = v17 - v18;
    if ((float)(v17 - v18) <= v19)
    {
      if (v20 >= (float)-v19) {
        float v21 = v18 + v20;
      }
      else {
        float v21 = v18 - v19;
      }
    }
    else
    {
      float v21 = v18 + v19;
    }
    a1[11].f32[1] = v21;
    if (v17 >= 0.0)
    {
      if (v21 <= v17)
      {
LABEL_32:
        float v14 = v14 + v21;
        a1[11].f32[0] = v14;
        goto LABEL_33;
      }
    }
    else if (v21 >= v17)
    {
      goto LABEL_32;
    }
    a1[11].f32[1] = v17;
    float v21 = v17;
    goto LABEL_32;
  }
LABEL_33:
  if (v2 == 3) {
    float v12 = v10;
  }
  float v22 = a1[12].f32[3];
  double v23 = (float)(v12 * v22);
  float v24 = a1[12].f32[0];
  float v25 = v23 + v24 * (1.0 - v22);
  float v26 = v25 - v24;
  if (v26 != 0.0)
  {
    float v27 = a1[12].f32[1];
    float v28 = a1[12].f32[2];
    float v29 = v26 - v27;
    if ((float)(v26 - v27) <= v28)
    {
      if (v29 >= (float)-v28) {
        float v30 = v27 + v29;
      }
      else {
        float v30 = v27 - v28;
      }
    }
    else
    {
      float v30 = v27 + v28;
    }
    a1[12].f32[1] = v30;
    if (v26 >= 0.0)
    {
      if (v30 <= v26)
      {
LABEL_46:
        a1[12].f32[0] = v24 + v30;
        goto LABEL_47;
      }
    }
    else if (v30 >= v26)
    {
      goto LABEL_46;
    }
    a1[12].f32[1] = v26;
    float v30 = v26;
    goto LABEL_46;
  }
LABEL_47:
  float v31 = a1[13].f32[0];
  float v32 = (float)(v8 * a1[13].f32[3]) + v31 * (1.0 - a1[13].f32[3]);
  float v33 = v32 - v31;
  float v15 = v118;
  if (v33 == 0.0) {
    goto LABEL_59;
  }
  float v34 = a1[13].f32[1];
  float v35 = a1[13].f32[2];
  float v36 = v33 - v34;
  if ((float)(v33 - v34) <= v35)
  {
    if (v36 >= (float)-v35) {
      float v37 = v34 + v36;
    }
    else {
      float v37 = v34 - v35;
    }
  }
  else
  {
    float v37 = v34 + v35;
  }
  a1[13].f32[1] = v37;
  if (v33 < 0.0)
  {
    if (v37 >= v33) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }
  if (v37 > v33)
  {
LABEL_57:
    a1[13].f32[1] = v33;
    float v37 = v33;
  }
LABEL_58:
  a1[13].f32[0] = v31 + v37;
LABEL_59:
  float v38 = a1[14].f32[3];
  double v39 = (float)(v11 * v38);
  float v40 = a1[14].f32[0];
  float v41 = v39 + v40 * (1.0 - v38);
  float v42 = v41 - v40;
  if (v42 == 0.0) {
    goto LABEL_71;
  }
  float v43 = a1[14].f32[1];
  float v44 = a1[14].f32[2];
  float v45 = v42 - v43;
  if ((float)(v42 - v43) <= v44)
  {
    if (v45 >= (float)-v44) {
      float v46 = v43 + v45;
    }
    else {
      float v46 = v43 - v44;
    }
  }
  else
  {
    float v46 = v43 + v44;
  }
  a1[14].f32[1] = v46;
  if (v42 < 0.0)
  {
    if (v46 >= v42) {
      goto LABEL_70;
    }
    goto LABEL_69;
  }
  if (v46 > v42)
  {
LABEL_69:
    a1[14].f32[1] = v42;
    float v46 = v42;
  }
LABEL_70:
  a1[14].f32[0] = v40 + v46;
LABEL_71:
  float v47 = 1.0;
  if (v2 == 2) {
    float v48 = 0.0;
  }
  else {
    float v48 = 1.0;
  }
  float v49 = a1[15].f32[0];
  float v50 = (float)(v48 * a1[15].f32[3]) + v49 * (1.0 - a1[15].f32[3]);
  float v51 = v50 - v49;
  if (v51 != 0.0)
  {
    float v52 = a1[15].f32[1];
    float v53 = a1[15].f32[2];
    float v54 = v51 - v52;
    if ((float)(v51 - v52) <= v53)
    {
      if (v54 >= (float)-v53) {
        float v55 = v52 + v54;
      }
      else {
        float v55 = v52 - v53;
      }
    }
    else
    {
      float v55 = v52 + v53;
    }
    a1[15].f32[1] = v55;
    if (v51 >= 0.0)
    {
      if (v55 <= v51)
      {
LABEL_85:
        a1[15].f32[0] = v49 + v55;
        goto LABEL_86;
      }
    }
    else if (v55 >= v51)
    {
      goto LABEL_85;
    }
    a1[15].f32[1] = v51;
    float v55 = v51;
    goto LABEL_85;
  }
LABEL_86:
  if (v2 != 3) {
    float v47 = 0.0;
  }
  float v56 = a1[17].f32[3];
  double v57 = (float)(v47 * v56);
  float v58 = a1[17].f32[0];
  float v59 = v57 + v58 * (1.0 - v56);
  float v60 = v59 - v58;
  if (v60 != 0.0)
  {
    float v61 = a1[17].f32[1];
    float v62 = v60 - v61;
    float v63 = a1[17].f32[2];
    if ((float)(v60 - v61) <= v63)
    {
      if (v62 >= (float)-v63) {
        float v64 = v61 + v62;
      }
      else {
        float v64 = v61 - v63;
      }
    }
    else
    {
      float v64 = v61 + v63;
    }
    a1[17].f32[1] = v64;
    if (v60 >= 0.0)
    {
      if (v64 <= v60)
      {
LABEL_99:
        a1[17].f32[0] = v58 + v64;
        goto LABEL_100;
      }
    }
    else if (v64 >= v60)
    {
      goto LABEL_99;
    }
    a1[17].f32[1] = v60;
    float v64 = v60;
    goto LABEL_99;
  }
LABEL_100:
  float v65 = 0.0;
  if (v2 == 2) {
    float v65 = 1.0;
  }
  float v66 = a1[16].f32[3];
  double v67 = (float)(v65 * v66);
  float v68 = a1[16].f32[0];
  float v69 = v67 + v68 * (1.0 - v66);
  float v70 = v69 - v68;
  if (v70 != 0.0)
  {
    float v71 = a1[16].f32[1];
    float v72 = v70 - v71;
    float v73 = a1[16].f32[2];
    if ((float)(v70 - v71) <= v73)
    {
      if (v72 >= (float)-v73) {
        float v74 = v71 + v72;
      }
      else {
        float v74 = v71 - v73;
      }
    }
    else
    {
      float v74 = v71 + v73;
    }
    a1[16].f32[1] = v74;
    if (v70 >= 0.0)
    {
      if (v74 <= v70)
      {
LABEL_113:
        a1[16].f32[0] = v68 + v74;
        goto LABEL_114;
      }
    }
    else if (v74 >= v70)
    {
      goto LABEL_113;
    }
    a1[16].f32[1] = v70;
    float v74 = v70;
    goto LABEL_113;
  }
LABEL_114:
  float v75 = v14 * 1.15;
  a1[57].f32[0] = v75;
  if (!v4) {
    a1[57].f32[0] = a1[57].f32[1] * v75;
  }
  float v76 = fabsf(a1[12].f32[1]);
  float v77 = fabsf(a1[11].f32[1]);
  float v78 = fabsf(a1[17].f32[1]);
  float v79 = fabsf(a1[16].f32[1]);
  float v80 = v76 * 3.0;
  double v81 = a1[12].f32[0];
  if (v81 <= 1.33)
  {
    double v83 = v15;
  }
  else
  {
    double v82 = (v81 + -1.33) * 10.0;
    double v83 = v15;
    float v80 = v80 + v82 * v15;
  }
  float v84 = 1.0;
  if (!v4) {
    float v84 = 10.0;
  }
  float v85 = a1[13].f32[0];
  float v86 = v80 + (float)((float)(v84 * v85) * v15);
  float v87 = fmaxf(a1[19].f32[1], 0.0);
  double v88 = a1[57].f32[1];
  float v89 = v86 + v87 * 20.0 * v88;
  float v90 = v89 + v77 * 4.0 * v88;
  float v91 = v90 + v78 * 4.0;
  float v92 = v91 + v79 * 4.0;
  if (v83 * 25.0 < v92)
  {
    float v93 = v83 * 25.0;
    float v92 = v93;
  }
  float v94 = v85
      + (float)((float)((float)((float)((float)(v78 * 5.0) + (float)(v76 * 10.0)) + (float)(v77 * 5.0))
                      + (float)(v87 * 20.0))
              * a1[1].f32[0]);
  if (v94 > 1.3) {
    float v94 = 1.3;
  }
  float v95 = a1[57].f32[2] * v94;
  float v96 = a1[18].f32[0];
  float v97 = (float)(a1[18].f32[3] * v95) + v96 * (1.0 - a1[18].f32[3]);
  float v98 = v97 - v96;
  if (v98 != 0.0)
  {
    float v99 = a1[18].f32[1];
    float v100 = v98 - v99;
    float v101 = a1[18].f32[2];
    if ((float)(v98 - v99) <= v101)
    {
      if (v100 >= (float)-v101) {
        float v102 = v99 + v100;
      }
      else {
        float v102 = v99 - v101;
      }
    }
    else
    {
      float v102 = v99 + v101;
    }
    a1[18].f32[1] = v102;
    if (v98 >= 0.0)
    {
      if (v102 <= v98)
      {
LABEL_136:
        a1[18].f32[0] = v96 + v102;
        goto LABEL_137;
      }
    }
    else if (v102 >= v98)
    {
      goto LABEL_136;
    }
    a1[18].f32[1] = v98;
    float v102 = v98;
    goto LABEL_136;
  }
LABEL_137:
  float v103 = a1[16].f32[0];
  double v104 = v95 * 0.0025;
  *(float *)&double v104 = v104;
  if (v4) {
    *(float *)&double v104 = 0.0002;
  }
  v105 = a1 + 50;
  float32x4_t v106 = vaddq_f32(vmlaq_n_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v104, 0), (float32x4_t)xmmword_1A64FC0C0, v15), a1[50]);
  a1[50] = v106;
  if (v106.f32[0] > 2.0)
  {
    v7.f32[0] = v106.f32[0] + -2.0;
    HIDWORD(v107) = v106.i32[1];
    *(float *)&uint64_t v107 = v106.f32[0] + -2.0;
    v7.i32[1] = v106.i32[1];
    v7.i32[2] = v106.i32[2];
    a1[50].i32[2] = v106.i32[2];
    v105->i64[0] = v107;
    float32x4_t v106 = v7;
  }
  if (v106.f32[1] > 2.0)
  {
    float32x4_t v108 = v106;
    v108.f32[1] = v106.f32[1] + -2.0;
    v105->i64[0] = v108.i64[0];
    v108.i32[2] = v106.i32[2];
    a1[50].i32[2] = v106.i32[2];
    float32x4_t v106 = v108;
  }
  if (v106.f32[2] > 2.0)
  {
    a1[50].f32[2] = v106.f32[2] + -2.0;
    v105->i64[0] = v106.i64[0];
  }
  float v109 = v83 * 1.25663706;
  float v110 = v109 + (float)(v6 * (float)((float)(v109 * 4.0) - v109));
  if (v4) {
    float v110 = v110 * 0.5;
  }
  float v111 = v110 + a1[58].f32[0];
  if (v111 > 6.28318531)
  {
    float v112 = v111 + -6.28318531;
    float v111 = v112;
  }
  a1[58].f32[0] = v111;
  float v113 = v83 * 0.7;
  float v114 = v113 + v92 * 0.5;
  float v115 = (float)((float)(v113 * 8.0) * v103) + (float)((float)(1.0 - v103) * v114);
  if (v4)
  {
    float v115 = v115 * 0.4;
    float v116 = v83 * 0.6;
    if (v115 > v116) {
      float v115 = v116;
    }
  }
  float32_t result = v115 + a1[9].f32[3];
  a1[9].f32[3] = result;
  return result;
}

void SUICOrbPhysicsInternal_FinalizeStateForFrame(uint64_t a1)
{
  uint64_t v2 = 0;
  float v3 = *(float *)(a1 + 256);
  uint64_t v4 = a1 + 816;
  float32x4_t v52 = (float32x4_t)*(unsigned int *)(a1 + 176);
  float v53 = *(float *)(a1 + 176);
  LODWORD(v5) = 0;
  *((float *)&v5 + 1) = v53;
  float32x4_t v51 = (float32x4_t)v5;
  v6.i64[0] = 0;
  v6.i64[1] = LODWORD(v53);
  float32x4_t v55 = (float32x4_t)vdupq_n_s32(0x41490FDBu);
  float32x4_t v54 = (float32x4_t)vdupq_n_s32(0x3F8CCCCDu);
  float32x4_t v50 = v6;
  do
  {
    noise2();
    v62.i64[0] = v7;
    noise2();
    __int32 v60 = v8;
    noise2();
    float v10 = 1.0;
    if (!*(unsigned char *)(a1 + 161)) {
      float v10 = *(float *)(a1 + 16 * v2 + 320);
    }
    float32x4_t v11 = v62;
    v11.i32[1] = v60;
    v11.i32[2] = v9;
    float32x4_t v62 = vmulq_f32(v11, v55);
    __float2 v12 = __sincosf_stret(v62.f32[2]);
    __float2 v13 = __sincosf_stret(v62.f32[0]);
    v14.i32[0] = 0;
    v14.i32[1] = LODWORD(v13.__cosval);
    v14.i64[1] = LODWORD(v13.__sinval);
    float32x4_t v57 = v14;
    v14.i32[0] = 0;
    v14.f32[1] = -v13.__sinval;
    v14.i64[1] = LODWORD(v13.__cosval);
    float32x4_t v56 = v14;
    __float2 v15 = __sincosf_stret(v62.f32[1]);
    uint64_t v16 = 0;
    v17.i32[3] = 0;
    v17.i64[0] = LODWORD(v15.__cosval);
    *(float *)&v17.i32[2] = -v15.__sinval;
    LODWORD(v18) = 0;
    *((float *)&v18 + 1) = v15.__cosval + (float)(1.0 - v15.__cosval);
    v19.i64[0] = LODWORD(v15.__sinval);
    v19.i64[1] = LODWORD(v15.__cosval);
    int32x4_t v63 = v17;
    int32x4_t v64 = (int32x4_t)v18;
    int32x4_t v65 = v19;
    long long v66 = xmmword_1A64FBA40;
    int32x4_t v67 = 0u;
    int32x4_t v68 = 0u;
    int32x4_t v69 = 0u;
    long long v70 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v67 + v16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)COERCE_UNSIGNED_INT(v13.__cosval + (float)(1.0 - v13.__cosval)), COERCE_FLOAT(*(_OWORD *)((char *)&v63 + v16))), v57, *(float32x2_t *)&v63.i8[v16], 1), v56, *(float32x4_t *)((char *)&v63 + v16), 2), (float32x4_t)xmmword_1A64FBA40, *(float32x4_t *)((char *)&v63 + v16), 3);
      v16 += 16;
    }
    while (v16 != 64);
    uint64_t v20 = 0;
    float32x4_t v22 = (float32x4_t)COERCE_UNSIGNED_INT(-v12.__sinval);
    float32x4_t cosval_low = (float32x4_t)LODWORD(v12.__cosval);
    cosval_low.i32[1] = LODWORD(v12.__sinval);
    v22.i32[1] = LODWORD(v12.__cosval);
    v23.i64[0] = 0;
    int32x4_t v63 = v67;
    int32x4_t v64 = v68;
    int32x4_t v65 = v69;
    long long v66 = v70;
    int32x4_t v67 = 0uLL;
    int32x4_t v68 = 0uLL;
    int32x4_t v69 = 0uLL;
    long long v70 = 0uLL;
    do
    {
      v23.i64[1] = COERCE_UNSIGNED_INT(v12.__cosval + (float)(1.0 - v12.__cosval));
      *(float32x4_t *)((char *)&v67 + v20) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(cosval_low, COERCE_FLOAT(*(_OWORD *)((char *)&v63 + v20))), v22, *(float32x2_t *)&v63.i8[v20], 1), v23, *(float32x4_t *)((char *)&v63 + v20), 2), (float32x4_t)xmmword_1A64FBA40, *(float32x4_t *)((char *)&v63 + v20), 3);
      v20 += 16;
    }
    while (v20 != 64);
    int32x4_t v25 = v67;
    int32x4_t v24 = v68;
    int32x4_t v27 = v69;
    int32x4_t v26 = (int32x4_t)v70;
    int32x4_t v28 = vzip1q_s32(v67, v69);
    int32x4_t v29 = vzip2q_s32(v67, v69);
    int32x4_t v30 = vzip1q_s32(v68, (int32x4_t)v70);
    int32x4_t v31 = vzip2q_s32(v68, (int32x4_t)v70);
    *(float32x4_t *)(v4 + 16 * v2) = vaddq_f32((float32x4_t)vzip2q_s32(v29, v31), vmlaq_f32(vmlaq_f32(vmulq_f32((float32x4_t)vzip1q_s32(v28, v30), v54), (float32x4_t)0, (float32x4_t)vzip2q_s32(v28, v30)), (float32x4_t)0, (float32x4_t)vzip1q_s32(v29, v31)));
    if (v3 <= 0.0001)
    {
      uint64_t v42 = 0;
      float v43 = (float)(v53 * (float)(v10 * *(float *)(a1 + 224))) * 0.04;
      v44.i32[0] = 0;
      v44.i64[1] = 0;
      v44.f32[1] = v43;
      v45.i64[0] = 0;
      v45.i64[1] = LODWORD(v43);
      int32x4_t v63 = v25;
      int32x4_t v64 = v24;
      int32x4_t v65 = v27;
      long long v66 = (__int128)v26;
      int32x4_t v67 = 0uLL;
      int32x4_t v68 = 0uLL;
      int32x4_t v69 = 0uLL;
      long long v70 = 0uLL;
      do
      {
        *(float32x4_t *)((char *)&v67 + v42) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)LODWORD(v43), COERCE_FLOAT(*(_OWORD *)((char *)&v63 + v42))), v44, *(float32x2_t *)&v63.i8[v42], 1), v45, *(float32x4_t *)((char *)&v63 + v42), 2), (float32x4_t)xmmword_1A64FBA40, *(float32x4_t *)((char *)&v63 + v42), 3);
        v42 += 16;
      }
      while (v42 != 64);
    }
    else
    {
      float v32 = ((double)(int)v2 + (double)(int)v2) * 3.14159265 / 6.0 - *(float *)(a1 + 928);
      int32x4_t v61 = v27;
      float32x4_t v62 = (float32x4_t)v26;
      int32x4_t v58 = v25;
      int32x4_t v59 = v24;
      __float2 v33 = __sincosf_stret(v32);
      uint64_t v34 = 0;
      float v35 = (float)(v10 * *(float *)(a1 + 224)) * 0.04;
      v36.i32[0] = 0;
      v36.i64[1] = 0;
      v36.f32[1] = v35;
      v37.i64[0] = 0;
      v37.i64[1] = LODWORD(v35);
      v38.i32[2] = 0;
      v38.i32[3] = 1.0;
      int32x4_t v63 = v58;
      int32x4_t v64 = v59;
      int32x4_t v65 = v61;
      long long v66 = (__int128)v62;
      int32x4_t v67 = 0u;
      int32x4_t v68 = 0u;
      int32x4_t v69 = 0u;
      long long v70 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v67 + v34) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)LODWORD(v35), COERCE_FLOAT(*(_OWORD *)((char *)&v63 + v34))), v36, *(float32x2_t *)&v63.i8[v34], 1), v37, *(float32x4_t *)((char *)&v63 + v34), 2), (float32x4_t)xmmword_1A64FBA40, *(float32x4_t *)((char *)&v63 + v34), 3);
        v34 += 16;
      }
      while (v34 != 64);
      uint64_t v39 = 0;
      float32_t v40 = (float)(v3 * v33.__sinval) * 0.03;
      v38.f32[1] = v40;
      int32x4_t v63 = v67;
      int32x4_t v64 = v68;
      int32x4_t v65 = v69;
      long long v66 = v70;
      int32x4_t v67 = 0uLL;
      int32x4_t v68 = 0uLL;
      int32x4_t v69 = 0uLL;
      long long v70 = 0uLL;
      do
      {
        v38.f32[0] = (float)(v3 * v33.__cosval) * 0.03;
        *(float32x4_t *)((char *)&v67 + v39) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1A64FBA20, COERCE_FLOAT(*(_OWORD *)((char *)&v63 + v39))), (float32x4_t)xmmword_1A64FBA10, *(float32x2_t *)&v63.i8[v39], 1), (float32x4_t)xmmword_1A64FBA00, *(float32x4_t *)((char *)&v63 + v39), 2), v38, *(float32x4_t *)((char *)&v63 + v39), 3);
        v39 += 16;
      }
      while (v39 != 64);
      uint64_t v41 = 0;
      int32x4_t v63 = v67;
      int32x4_t v64 = v68;
      int32x4_t v65 = v69;
      long long v66 = v70;
      int32x4_t v67 = 0uLL;
      int32x4_t v68 = 0uLL;
      int32x4_t v69 = 0uLL;
      long long v70 = 0uLL;
      do
      {
        *(float32x4_t *)((char *)&v67 + v41) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v52, COERCE_FLOAT(*(_OWORD *)((char *)&v63 + v41))), v51, *(float32x2_t *)&v63.i8[v41], 1), v50, *(float32x4_t *)((char *)&v63 + v41), 2), (float32x4_t)xmmword_1A64FBA40, *(float32x4_t *)((char *)&v63 + v41), 3);
        v41 += 16;
      }
      while (v41 != 64);
    }
    int32x4_t v46 = v68;
    int32x4_t v47 = v69;
    int32x4_t v48 = (int32x4_t)v70;
    float v49 = (int32x4_t *)(a1 + (v2 << 6));
    v49[26] = v67;
    v49[27] = v46;
    v49[28] = v47;
    v49[29] = v48;
    ++v2;
  }
  while (v2 != 6);
}

void _setupSpring(uint64_t a1, uint64_t a2, unint64_t a3, float a4)
{
  float v6 = 0.0;
  float v7 = 0.0;
  if (a3 <= 4)
  {
    float v6 = flt_1A657AA10[a3];
    float v7 = flt_1A657AA24[a3];
  }
  if (a3 != 0 && *(unsigned char *)(a1 + 161) != 0)
  {
    float v6 = v6 * 0.5;
    float v8 = v7 * 0.25;
  }
  else
  {
    float v8 = v7;
  }
  uint64_t v9 = *(void *)a1;
  if (*(uint64_t *)a1 <= 59)
  {
    if (!v9) {
      return;
    }
    if (v9 == 30)
    {
      float v8 = v8 * 9.0;
      float v12 = 1.0;
      float v13 = 1.0 - v6;
      float v14 = 4.0;
LABEL_18:
      float v6 = v12 - powf(v13, v14);
    }
  }
  else
  {
    if (v9 != 60)
    {
      if (v9 != 90)
      {
        if (v9 == 240)
        {
          float v8 = v8 * 0.222222222;
          float v10 = 1.0 - v6;
          float v11 = 1.0 - fabsf(sqrtf(v10));
          if (v10 == -INFINITY) {
            float v6 = -INFINITY;
          }
          else {
            float v6 = v11;
          }
        }
        goto LABEL_19;
      }
      float v8 = v8 * 1.7;
      float v12 = 1.0;
      float v13 = 1.0 - v6;
      float v14 = 1.3;
      goto LABEL_18;
    }
    float v8 = v8 * 3.0;
    float v6 = 1.0 - (float)((float)(1.0 - v6) * (float)(1.0 - v6));
  }
LABEL_19:
  *(float *)a2 = a4;
  *(_DWORD *)(a2 + 4) = 0;
  *(float *)(a2 + 8) = v8;
  *(float *)(a2 + 12) = v6;
}

void SUICCommonPhysicsInternal_Init_cold_1()
{
}

uint64_t AFDeviceSupportsSystemAssistantExperience()
{
  return MEMORY[0x1F410ACF0]();
}

uint64_t AFLogInitIfNeeded()
{
  return MEMORY[0x1F410AD98]();
}

uint64_t AFOutputVoiceLanguageForRecognitionLanguage()
{
  return MEMORY[0x1F410ADE0]();
}

uint64_t AFPreferencesSupportedLanguages()
{
  return MEMORY[0x1F410AE30]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x1F40F4AC8](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1F40F4CD8](retstr, a, b);
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return MEMORY[0x1F40F4CE0](a, b);
}

CATransform3D *__cdecl CATransform3DInvert(CATransform3D *__return_ptr retstr, CATransform3D *t)
{
  return (CATransform3D *)MEMORY[0x1F40F4CF8](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1F40F4D18](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1F40F4D48](retstr, t, angle, x, y, z);
}

uint64_t CEMEmojiTokenGetString()
{
  return MEMORY[0x1F4113C58]();
}

uint64_t CEMEnumerateEmojiTokensInStringWithBlock()
{
  return MEMORY[0x1F4113C70]();
}

uint64_t CEMStringContainsEmoji()
{
  return MEMORY[0x1F4113C88]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7490](locArray, prefArray);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D99B0](red, green, blue, alpha);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1F40D99D0](color1, color2);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CTParagraphStyleGetCompositionLanguageForLanguage()
{
  return MEMORY[0x1F40DF870]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4166AA8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1F4166AF0]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4166B18]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1F4166E18]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4166E80]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

float __exp10f(float a1)
{
  MEMORY[0x1F40C9B98](a1);
  return result;
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

float cosf(float a1)
{
  MEMORY[0x1F40CB8B0](a1);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

float exp2f(float a1)
{
  MEMORY[0x1F40CBFF0](a1);
  return result;
}

void free(void *a1)
{
}

void glAttachShader(GLuint program, GLuint shader)
{
}

void glBindBuffer(GLenum target, GLuint buffer)
{
}

void glBindFramebuffer(GLenum target, GLuint framebuffer)
{
}

void glBindRenderbuffer(GLenum target, GLuint renderbuffer)
{
}

uint64_t glBindVertexArrayOES()
{
  return MEMORY[0x1F40F43A8]();
}

void glBlendFunc(GLenum sfactor, GLenum dfactor)
{
}

void glBufferData(GLenum target, GLsizeiptr size, const GLvoid *data, GLenum usage)
{
}

GLenum glCheckFramebufferStatus(GLenum target)
{
  return MEMORY[0x1F40F43E8](*(void *)&target);
}

void glClear(GLbitfield mask)
{
}

void glClearColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
{
}

void glCompileShader(GLuint shader)
{
}

GLuint glCreateProgram(void)
{
  return MEMORY[0x1F40F4420]();
}

GLuint glCreateShader(GLenum type)
{
  return MEMORY[0x1F40F4428](*(void *)&type);
}

void glDeleteBuffers(GLsizei n, const GLuint *buffers)
{
}

void glDeleteFramebuffers(GLsizei n, const GLuint *framebuffers)
{
}

void glDeleteProgram(GLuint program)
{
}

void glDeleteRenderbuffers(GLsizei n, const GLuint *renderbuffers)
{
}

void glDeleteShader(GLuint shader)
{
}

void glDisable(GLenum cap)
{
}

void glDrawArrays(GLenum mode, GLint first, GLsizei count)
{
}

void glDrawElements(GLenum mode, GLsizei count, GLenum type, const GLvoid *indices)
{
}

void glEnable(GLenum cap)
{
}

void glEnableVertexAttribArray(GLuint index)
{
}

void glFinish(void)
{
}

void glFramebufferRenderbuffer(GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)
{
}

void glGenBuffers(GLsizei n, GLuint *buffers)
{
}

void glGenFramebuffers(GLsizei n, GLuint *framebuffers)
{
}

void glGenRenderbuffers(GLsizei n, GLuint *renderbuffers)
{
}

uint64_t glGenVertexArraysOES()
{
  return MEMORY[0x1F40F4520]();
}

int glGetAttribLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x1F40F4530](*(void *)&program, name);
}

GLenum glGetError(void)
{
  return MEMORY[0x1F40F4540]();
}

void glGetProgramiv(GLuint program, GLenum pname, GLint *params)
{
}

void glGetRenderbufferParameteriv(GLenum target, GLenum pname, GLint *params)
{
}

void glGetShaderiv(GLuint shader, GLenum pname, GLint *params)
{
}

void glLinkProgram(GLuint program)
{
}

void glShaderSource(GLuint shader, GLsizei count, const GLchar *const *string, const GLint *length)
{
}

void glUseProgram(GLuint program)
{
}

void glVertexAttrib3f(GLuint indx, GLfloat x, GLfloat y, GLfloat z)
{
}

void glVertexAttrib4f(GLuint indx, GLfloat x, GLfloat y, GLfloat z, GLfloat w)
{
}

void glVertexAttribPointer(GLuint indx, GLint size, GLenum type, GLBOOLean normalized, GLsizei stride, const GLvoid *ptr)
{
}

void glViewport(GLint x, GLint y, GLsizei width, GLsizei height)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

float logf(float a1)
{
  MEMORY[0x1F40CC8C0](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

uint64_t noise2()
{
  return MEMORY[0x1F4144638]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

uint64_t proc_pidoriginatorinfo()
{
  return MEMORY[0x1F40CD8B0]();
}

int rand(void)
{
  return MEMORY[0x1F40CDC08]();
}

float sinf(float a1)
{
  MEMORY[0x1F40CE060](a1);
  return result;
}

float tanf(float a1)
{
  MEMORY[0x1F40CE428](a1);
  return result;
}