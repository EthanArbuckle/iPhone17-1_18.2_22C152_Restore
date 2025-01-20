id NUAssertLogger()
{
  void *v0;
  uint64_t vars8;

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_709);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

{
  void *v0;
  uint64_t vars8;

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_6835);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

{
  void *v0;
  uint64_t vars8;

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_7238);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

{
  void *v0;
  uint64_t vars8;

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_8696);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

{
  void *v0;
  uint64_t vars8;

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11248);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

{
  void *v0;
  uint64_t vars8;

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

{
  void *v0;
  uint64_t vars8;

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_15574);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

{
  void *v0;
  uint64_t vars8;

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16007);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

{
  void *v0;
  uint64_t vars8;

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_18840);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

{
  void *v0;
  uint64_t vars8;

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_22782);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

{
  void *v0;
  uint64_t vars8;

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_24121);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

{
  void *v0;
  uint64_t vars8;

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

id averageLTMFilter(void *a1)
{
  id v1 = a1;
  v2 = (void *)[v1 copy];
  v3 = [v1 valueForKey:@"inputMapPointsH"];
  int v4 = [v3 intValue];

  v5 = [v1 valueForKey:@"inputMapPointsV"];
  int v6 = [v5 intValue];

  v7 = [v1 valueForKey:@"inputMapPointsN"];
  int v8 = [v7 intValue];

  v9 = [v1 valueForKey:@"inputGainData"];
  uint64_t v10 = v8;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:4 * v8];
  id v12 = v9;
  uint64_t v13 = [v12 bytes];
  id v14 = v11;
  v15 = (float *)[v14 mutableBytes];
  uint64_t v16 = (v6 * v4);
  if ((int)v16 >= 1)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      v18 = (float *)v13;
      v19 = v15;
      uint64_t v20 = v10;
      if ((int)v10 >= 1)
      {
        do
        {
          float v21 = *v18++;
          float *v19 = v21 + *v19;
          ++v19;
          --v20;
        }
        while (v20);
      }
      v13 += 4 * v10;
    }
  }
  if ((int)v10 >= 1)
  {
    float v22 = (float)(int)v16;
    uint64_t v23 = v10;
    do
    {
      float *v15 = *v15 / v22;
      ++v15;
      --v23;
    }
    while (v23);
  }
  [v2 setValue:&unk_1F0049A88 forKey:@"inputMapPointsH"];
  [v2 setValue:&unk_1F0049A88 forKey:@"inputMapPointsV"];
  [v2 setValue:&unk_1F004A510 forKey:@"inputMapSpacingH"];
  [v2 setValue:&unk_1F004A510 forKey:@"inputMapSpacingV"];
  [v2 setValue:&unk_1F004A510 forKey:@"inputMapOriginH"];
  [v2 setValue:&unk_1F004A510 forKey:@"inputMapOriginV"];
  [v2 setValue:v14 forKey:@"inputGainData"];

  return v2;
}

void sub_1A989A4E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A989A5F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A989A6E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id NUAssertLogger_5()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_34()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_48);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_70()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_78);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_165()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_173);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_222()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_235);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A98A0B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

id NUAssertLogger_292()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_182);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_369()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_381);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_461()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_425);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_554()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_409);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A98A6924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__587(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__588(uint64_t a1)
{
}

void sub_1A98A9140(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A98AB008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

void sub_1A98ABC58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NURenderLogger()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_411);
  }
  v0 = (void *)_NURenderLogger;

  return v0;
}

id getStringEnv(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    int v6 = NUAssertLogger_749();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "name != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v9 = NUAssertLogger_749();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        uint64_t v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v23 = v13;
        __int16 v24 = 2114;
        v25 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"NSString *getStringEnv(NSString *__strong)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUGlobalSettings.m", 24, @"Invalid parameter not satisfying: %s", v18, v19, v20, v21, (uint64_t)"name != nil");
  }
  id v2 = v1;
  v3 = getenv((const char *)[v2 UTF8String]);
  if (v3)
  {
    int v4 = [NSString stringWithUTF8String:v3];
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

id NUAssertLogger_749()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_883);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

uint64_t __Block_byref_object_copy__759(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__760(uint64_t a1)
{
}

id NUAssertLogger_987()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_999);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A98B625C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_1099()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_1114);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_1154()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_1182);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_1297()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_374);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A98BCEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1485(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1486(uint64_t a1)
{
}

void sub_1A98BD394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *NUEvaluationModeName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Prepare";
  }
  else {
    return off_1E5D93E68[a1 - 1];
  }
}

double NUDegreeToRadian(double a1)
{
  return a1 * 3.14159265 / 180.0;
}

double NURadianToDegree(double a1)
{
  return a1 * 180.0 / 3.14159265;
}

BOOL NUIsRoughlyEqual(double a1, double a2, double a3)
{
  return vabdd_f64(a1, a2) <= a3;
}

BOOL NUIsRoughlyLessThan(double a1, double a2, double a3)
{
  return a2 + a3 > a1;
}

BOOL NUIsRoughlyGreaterThan(double a1, double a2, double a3)
{
  return a2 - a3 < a1;
}

void sub_1A98BD5BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A98BD9A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1A98BDDD4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v3 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1500(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1501(uint64_t a1)
{
}

void ___ZN12_GLOBAL__N_114getCachedBrushElf_block_invoke_10(uint64_t a1)
{
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v2 == v3)
    {
      {
        return;
      }
      uint64_t v3 = v2;
    }
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  int v4 = +[NUImageLayout contiguousLayoutForImageSize:](NUImageLayout, "contiguousLayoutForImageSize:", v3, v3);
  v5 = +[NUPixelFormat R8];
  int v6 = +[NUColorSpace genericGrayColorSpace];
  v7 = +[NUImageFactory bufferImageWithLayout:v4 format:v5 colorSpace:v6];

  v13[0] = 0;
  v13[1] = 0;
  v13[2] = v3;
  v13[3] = v3;
  int v8 = +[NURegion regionWithRect:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___ZN12_GLOBAL__N_114getCachedBrushElf_block_invoke_2;
  v11[3] = &__block_descriptor_44_e35_v24__0___NUMutableBufferTile__8_B16l;
  v11[4] = *(void *)(a1 + 40);
  int v12 = *(_DWORD *)(a1 + 48);
  [v7 writeBufferRegion:v8 withBlock:v11];

  uint64_t v9 = [v7 immutableImageCopy];
}

void sub_1A98BDFDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A98BE114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN12_GLOBAL__N_114getCachedBrushElf_block_invoke_2(uint64_t a1, void *a2)
{
  id v17 = a2;
  uint64_t v3 = [v17 mutableBuffer];
  uint64_t v4 = *(void *)(a1 + 32);
  float v5 = *(float *)(a1 + 40);
  uint64_t v6 = [v3 mutableBytes];
  uint64_t v7 = [v3 rowBytes];
  if ((float)(2.0 / (float)v4) <= v5) {
    float v8 = v5;
  }
  else {
    float v8 = 2.0 / (float)v4;
  }
  if (v4)
  {
    float v9 = 0.5;
    float v10 = (float)v4 * 0.5;
    float v11 = v10 * (float)(1.0 - v8);
    uint64_t v12 = v4;
    do
    {
      uint64_t v13 = 0;
      float v14 = 0.5;
      do
      {
        float v15 = sqrtf((float)((float)(v9 - v10) * (float)(v9 - v10)) + (float)((float)(v14 - v10) * (float)(v14 - v10)));
        if (v15 <= v10)
        {
          if (v15 <= v11) {
            LOBYTE(v16) = -1;
          }
          else {
            int v16 = (int)(float)((float)(1.0
          }
                                     - (float)((float)((float)(v15 - v11) / (float)(v10 - v11))
                                             * (float)((float)((float)(v15 - v11) / (float)(v10 - v11))
                                                     * (float)((float)((float)((float)(v15 - v11) / (float)(v10 - v11))
                                                                     * -2.0)
                                                             + 3.0))))
                             * 255.0);
        }
        else
        {
          LOBYTE(v16) = 0;
        }
        *(unsigned char *)(v6 + v13) = v16;
        float v14 = v14 + 1.0;
        ++v13;
      }
      while (v4 != v13);
      v6 += v7;
      float v9 = v9 + 1.0;
      --v12;
    }
    while (v12);
  }
}

void sub_1A98BE278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN12_GLOBAL__N_114getCachedBrushElf_block_invoke()
{
  return MEMORY[0x1F41817F8]();
}

id NUAssertLogger_1597()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_136);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A98BEA9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1613(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1614(uint64_t a1)
{
}

void sub_1A98C1624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A98C1B84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A98C1FA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A98C20E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A98C221C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A98C2674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1740(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1741(uint64_t a1)
{
}

id NUAssertLogger_1902()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_1917);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A98C435C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1A98C4C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A98C6044(void *a1)
{
}

void sub_1A98C6098(void *a1)
{
}

__CFString *NUPixelRoundingPolicyToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Out";
  }
  else {
    return *(&off_1E5D94038 + a1 - 1);
  }
}

uint64_t NSStringFromNUPixelSize(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"{%ld, %ld}", a1, a2];
}

unint64_t NUEvenPixelSize(unint64_t a1, uint64_t a2)
{
  unint64_t v2 = a1;
  if ((a1 | a2))
  {
    unint64_t v2 = a1 & 0xFFFFFFFFFFFFFFFELL;
    if (a1 & 0x8000000000000000 | a2 & 0x8000000000000000)
    {
      uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
      float v5 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
      [v4 handleFailureInFunction:v5, @"NUGeometryPrimitives.h", 38, @"Invalid parameter not satisfying: %@", @"(width >= 0) && (height >= 0)" file lineNumber description];
    }
  }
  return v2;
}

__n128 NUEvenSizedPixelRect@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  a1[1].n128_u64[0] = NUEvenPixelSize(a1[1].n128_u64[0], a1[1].n128_i64[1]);
  a1[1].n128_u64[1] = v4;
  __n128 result = *a1;
  __n128 v6 = a1[1];
  *a2 = *a1;
  a2[1] = v6;
  return result;
}

BOOL NUPixelSizeIsEven(int a1, unsigned int a2)
{
  return ((a1 | a2) & 1) == 0;
}

uint64_t NUPixelSizeArea(uint64_t a1, uint64_t a2)
{
  return a1 * a2;
}

uint64_t NSStringFromNUPixelPoint(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"{%ld, %ld}", a1, a2];
}

uint64_t NSStringFromNUPixelRect(void *a1)
{
  return [NSString stringWithFormat:@"{origin={%ld, %ld} size={%ld, %ld}}]", *a1, a1[1], a1[2], a1[3]];
}

void NUPixelRectFromArray(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v11 = a1;
  if ([v11 count] == 4)
  {
    uint64_t v3 = [v11 objectAtIndexedSubscript:0];
    uint64_t v4 = [v3 integerValue];
    float v5 = [v11 objectAtIndexedSubscript:1];
    uint64_t v6 = [v5 integerValue];
    uint64_t v7 = [v11 objectAtIndexedSubscript:2];
    uint64_t v8 = [v7 integerValue];
    uint64_t v9 = [v11 objectAtIndexedSubscript:3];
    uint64_t v10 = [v9 integerValue];
    *a2 = v4;
    a2[1] = v6;
    a2[2] = v8;
    a2[3] = v10;
  }
  else
  {
    *(_OWORD *)a2 = NUPixelRectNull;
    *((_OWORD *)a2 + 1) = unk_1A9A743E8;
  }
}

id NSArrayFromNUPixelRect(void *a1)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  BOOL v3 = *a1 == 0x7FFFFFFFFFFFFFFFLL && a1[1] == 0x7FFFFFFFFFFFFFFFLL && a1[2] == 0;
  if (v3 && !a1[3])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:");
    v10[0] = v4;
    float v5 = [NSNumber numberWithInteger:a1[1]];
    v10[1] = v5;
    uint64_t v6 = [NSNumber numberWithInteger:a1[2]];
    v10[2] = v6;
    uint64_t v7 = [NSNumber numberWithInteger:a1[3]];
    v10[3] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  }

  return v8;
}

__CFString *NUOrientationName(uint64_t a1)
{
  if ((unint64_t)(a1 - 9) >= 0xFFFFFFFFFFFFFFF8) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = 0;
  }
  return *(&NUOrientationName_names + v1);
}

id NUAssertLogger_2215()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_2239);
  }
  v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A98C8274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NURenderLogger_2273()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_499_2206);
  }
  v0 = (void *)_NURenderLogger;

  return v0;
}

uint64_t ImageIOLibraryCore()
{
  if (!ImageIOLibraryCore_frameworkLibrary) {
    ImageIOLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return ImageIOLibraryCore_frameworkLibrary;
}

uint64_t getCGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc_ptr;
  uint64_t v6 = getCGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc_ptr;
  if (!getCGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __getCGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc_block_invoke;
    v2[3] = &unk_1E5D94DB0;
    v2[4] = &v3;
    __getCGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc_block_invoke(v2);
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A98CAB2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc_block_invoke(void *a1)
{
  uint64_t v2 = ImageIOLibraryCore();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
  }
  else
  {
    a1 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *ImageIOLibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v3, @"NURenderSourceNode+CGImage.m", 41, @"%s", 0);

    __break(1u);
    free(v5);
  }
  __n128 result = dlsym(v3, "CGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptions");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  getCGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc_ptr = *(void *)(*(void *)(a1[4] + 8) + 24);
  return result;
}

uint64_t __ImageIOLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ImageIOLibraryCore_frameworkLibrary = result;
  return result;
}

double nu_rgb_to_tempTint(float *a1, double *a2, double *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  double v5 = *a1;
  double v6 = a1[1];
  double v7 = a1[2];
  double v18 = 0.0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v21 = 0;
  long long v23 = 0u;
  long long v20 = 0u;
  uint64_t v19 = 0x3FF03B3AF053F29DLL;
  uint64_t v22 = 0x3FF0000000000000;
  uint64_t v24 = 0;
  uint64_t v25 = 0x3FE83CFAB36818D8;
  MatrixMatrix(GetAdaptationMatrix_identity_mtx, (double *)&v19, (double *)&v14);
  MatrixMatrix((double *)&v14, GetAdaptationMatrix_identity_mtx, (double *)&v14);
  double result = (*((double *)&v14 + 1) * 0.672250773 + *(double *)&v14 * 0.327791699 + *(double *)&v15 * 0.11111583) * v6
         + v5 * (*((double *)&v14 + 1) * 0.231750546 + *(double *)&v14 * 0.429420129 + *(double *)&v15 * 0.0204485776)
         + v7 * (*((double *)&v14 + 1) * 0.0959986815 + *(double *)&v14 * 0.193244099 + *(double *)&v15 * 0.957493343);
  double v9 = (*(double *)&v16 * 0.672250773 + *((double *)&v15 + 1) * 0.327791699 + *((double *)&v16 + 1) * 0.11111583) * v6
     + v5 * (*(double *)&v16 * 0.231750546 + *((double *)&v15 + 1) * 0.429420129 + *((double *)&v16 + 1) * 0.0204485776)
     + v7 * (*(double *)&v16 * 0.0959986815 + *((double *)&v15 + 1) * 0.193244099 + *((double *)&v16 + 1) * 0.957493343);
  double v10 = (*((double *)&v17 + 1) * 0.672250773 + *(double *)&v17 * 0.327791699 + v18 * 0.11111583) * v6
      + v5 * (*((double *)&v17 + 1) * 0.231750546 + *(double *)&v17 * 0.429420129 + v18 * 0.0204485776)
      + v7 * (*((double *)&v17 + 1) * 0.0959986815 + *(double *)&v17 * 0.193244099 + v18 * 0.957493343);
  if (result >= 1.0e-20 || v9 >= 1.0e-20 || v10 >= 1.0e-20)
  {
    double v11 = result + v9 + v10;
    double v12 = result / v11;
    double v13 = v9 / v11;
    return nu_xy_to_tempTint(a2, a3, v12, v13);
  }
  else
  {
    *a3 = NAN;
    *a2 = NAN;
  }
  return result;
}

double MatrixMatrix(double *a1, double *a2, double *a3)
{
  double v3 = *a1;
  double v4 = a1[1];
  double v5 = a1[2];
  double v6 = a1[3];
  double v7 = a1[4];
  double v8 = a1[5];
  double v9 = a1[6];
  double v10 = a1[7];
  double v11 = a1[8];
  double v12 = *a2;
  double v13 = a2[1];
  double v14 = a2[2];
  double v15 = a2[3];
  double v16 = a2[4];
  double v17 = a2[5];
  double v18 = a2[6];
  double v19 = a2[7];
  double v20 = a2[8];
  double v21 = v7 * v13 + v4 * *a2 + v10 * v14;
  *a3 = v6 * v13 + *a1 * *a2 + v9 * v14;
  a3[1] = v21;
  a3[2] = v8 * v13 + v5 * v12 + v11 * v14;
  a3[3] = v6 * v16 + v3 * v15 + v9 * v17;
  a3[4] = v7 * v16 + v4 * v15 + v10 * v17;
  a3[5] = v8 * v16 + v5 * v15 + v11 * v17;
  a3[6] = v6 * v19 + v3 * v18 + v9 * v20;
  a3[7] = v7 * v19 + v4 * v18 + v10 * v20;
  double result = v8 * v19 + v5 * v18 + v11 * v20;
  a3[8] = result;
  return result;
}

double nu_xy_to_tempTint(double *a1, double *a2, double a3, double a4)
{
  uint64_t v4 = 0;
  double v5 = 1.5 - a3 + a4 * 6.0;
  double v6 = (a3 + a3) / v5;
  double v7 = a4 * 3.0 / v5;
  double v8 = 0.0;
  double v9 = (double *)&qword_1A9A72F40;
  double v10 = 0.0;
  double v11 = 0.0;
  do
  {
    double v12 = v11;
    double v13 = v10;
    double v14 = v8;
    uint64_t v15 = v4;
    double v16 = sqrt(*v9 * *v9 + 1.0);
    double v8 = 1.0 / v16;
    double v10 = *v9 / v16;
    double v18 = *(v9 - 2);
    double v17 = *(v9 - 1);
    double v11 = (v7 - v17) * v8 - (v6 - v18) * v10;
    ++v4;
    if (v15 == 29) {
      break;
    }
    v9 += 4;
  }
  while (v11 > 0.0);
  double v19 = 0.0;
  if (v4 != 1)
  {
    if (v11 <= 0.0) {
      double v19 = (v7 - v17) * v8 - (v6 - v18) * v10;
    }
    double v19 = -v19 / (v12 - v19);
  }
  uint64_t v20 = 32 * v4;
  double v21 = (double *)((char *)&kTempTable + (((v4 << 32) - 0x100000000) >> 27));
  *a1 = 1000000.0 / ((1.0 - v19) * *(double *)((char *)&kTempTable + v20) + *v21 * v19);
  double v22 = v14 * v19 + v8 * (1.0 - v19);
  double v23 = v13 * v19 + v10 * (1.0 - v19);
  double v24 = sqrt(v23 * v23 + v22 * v22);
  double result = (v23 / v24 * (v7 - (v17 * (1.0 - v19) + v21[2] * v19))
          + (v6 - (v18 * (1.0 - v19) + v21[1] * v19)) * (v22 / v24))
         * -3000.0;
  *a2 = result;
  return result;
}

double nu_tempTint_to_xy(double *a1, double *a2, double a3, double a4)
{
  uint64_t v4 = -1;
  double v5 = &qword_1A9A72F28;
  double v6 = 1000000.0 / a3;
  do
  {
    uint64_t v7 = v4;
    double v8 = *(double *)v5;
    v5 += 4;
    double v9 = v8;
    ++v4;
  }
  while (v7 != 28 && v6 >= v9);
  double v10 = a4 * -0.000333333333;
  double v11 = (double *)((char *)&kTempTable + 32 * v4);
  double v12 = (v9 - v6) / (v9 - *v11);
  double v13 = (double *)((char *)&kTempTable + 32 * v7 + 64);
  double v14 = v13[1] * (1.0 - v12) + v11[1] * v12;
  double v15 = v11[3];
  double v16 = (1.0 - v12) * v13[2] + v11[2] * v12;
  double v17 = v13[3];
  double v18 = sqrt(v15 * v15 + 1.0);
  double v19 = sqrt(v17 * v17 + 1.0);
  double v20 = (1.0 - v12) * (1.0 / v19) + 1.0 / v18 * v12;
  double v21 = (1.0 - v12) * (v17 / v19) + v15 / v18 * v12;
  double v22 = sqrt(v21 * v21 + v20 * v20);
  double v23 = v14 + v20 / v22 * v10;
  double v24 = v16 + v21 / v22 * v10;
  double v25 = v23 * 1.5;
  double v26 = v23 + v24 * -4.0 + 2.0;
  *a1 = v25 / v26;
  double result = v24 / v26;
  *a2 = result;
  return result;
}

void sub_1A98D0A34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id NUAssertLogger_2664()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_2684);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A98D0B90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id NUAssertLogger_2715()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_2731);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_2795()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_2769);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_2895()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_682);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A98D2E88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A98D2F18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *NUMediaTypeToString(unint64_t a1)
{
  if (a1 > 3) {
    return @"Invalid";
  }
  else {
    return off_1E5D94158[a1];
  }
}

uint64_t mediaTypeFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Image"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Video"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"LivePhoto"])
  {
    uint64_t v2 = 3;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *NUMediaComponentTypeToString(unint64_t a1)
{
  if (a1 > 2) {
    return @"Invalid";
  }
  else {
    return off_1E5D94178[a1];
  }
}

uint64_t NUMediaComponentTypeFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Image"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Video"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *NUAuxiliaryImageTypeToString(unint64_t a1)
{
  if (a1 > 0xB) {
    return @"Invalid";
  }
  else {
    return off_1E5D94190[a1];
  }
}

uint64_t NUAuxiliaryImageTypeFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"None"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Disparity"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"PortraitEffectsMatte"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"SkinSegmentationMatte"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"TeethSegmentationMatte"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"HairSegmentationMatte"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"GlassesSegmentationMatte"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"HDRGainMap"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"LinearThumbnail"])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:@"DeltaImage"])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:@"SkySegmentationMatte"])
  {
    uint64_t v2 = 9;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *NUSampleModeToString(unint64_t a1)
{
  if (a1 > 3) {
    return @"invalid";
  }
  else {
    return off_1E5D941F0[a1];
  }
}

uint64_t NUSampleModeFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"lanczos"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"bilinear"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"nearest"];
  }

  return v2;
}

uint64_t NUSampleModeIsValid(unint64_t a1)
{
  return (a1 < 4) & (0xEu >> (a1 & 0xF));
}

id NUAssertLogger_3410()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3423);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_3451()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3470);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A98DD810(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29)
{
  if (a2 == 2)
  {
    id v29 = objc_begin_catch(exception_object);
    *a29 = +[NUError errorWithCode:1 reason:@"video export AVAssetWriterInput: exception" object:v29];

    objc_end_catch();
    JUMPOUT(0x1A98DD3C4);
  }
  _Unwind_Resume(exception_object);
}

id NUAssertLogger_3539()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3633);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NULogger()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_156);
  }
  uint64_t v0 = (void *)_NULogger;

  return v0;
}

void *SourceFormatHintForTrack(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 formatDescriptions];
  uint64_t v3 = [v2 count];

  if (v3 == 1)
  {
    uint64_t v4 = [v1 formatDescriptions];
    double v5 = [v4 firstObject];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

id NUAssertLogger_3686()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3700);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

__CFString *NUPriorityLevelName(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_1E5D94210[a1];
  }
}

uint64_t NUPriorityLevelToDispatchQOS(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return dword_1A9A72ED0[a1];
  }
}

id NUAssertLogger_3857()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3784);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

__CFString *NUChannelTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"???";
  }
  else {
    return off_1E5D94288[a1 - 1];
  }
}

__CFString *NUChannelTypeSymbol(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"?";
  }
  else {
    return off_1E5D94250[a1 - 1];
  }
}

__CFString *NUChannelMediaTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"???";
  }
  else {
    return off_1E5D94268[a1 - 1];
  }
}

__CFString *NUChannelControlTypeDescription(uint64_t a1)
{
  id v1 = @"???";
  if (a1 == 2) {
    id v1 = @"schema";
  }
  if (a1 == 1) {
    return @"setting";
  }
  else {
    return v1;
  }
}

__CFString *NUChannelMetadataTypeDescription(uint64_t a1)
{
  id v1 = @"???";
  if (a1 == 2) {
    id v1 = @"video";
  }
  if (a1 == 1) {
    return @"image";
  }
  else {
    return v1;
  }
}

void sub_1A98E7AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Block_object_dispose((const void *)(v17 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __NUCGColorSpaceEqual_block_invoke_2(uint64_t a1)
{
  return 1;
}

uint64_t __NUCGColorSpaceEqual_block_invoke_3(uint64_t a1)
{
  return 1;
}

uint64_t __NUCGColorSpaceEqual_block_invoke_4(uint64_t a1)
{
  return 1;
}

uint64_t __NUCGColorSpaceEqual_block_invoke()
{
  return 1;
}

id NUAssertLogger_4177()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_4191);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_4520()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_4534);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A98F28A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_4842()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_4862);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

double NU::TValue95(NU *this)
{
  if (this < 2) {
    return NAN;
  }
  int v2 = this - 1;
  if ((this - 1) >= 0x1F4) {
    int v2 = 500;
  }
  return gT95[v2 - 1];
}

id NUAssertLogger_5020()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_86);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_5149()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_598);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NULogger_5506()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_600);
  }
  uint64_t v0 = (void *)_NULogger;

  return v0;
}

void sub_1A9908778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5679(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5680(uint64_t a1)
{
}

void sub_1A9908954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_5719()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_5685);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_5901()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_5861);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

double NUAbsoluteTime()
{
  uint64_t v0 = mach_absolute_time();
  if (_NUMachTimeToSeconds_onceToken != -1) {
    dispatch_once(&_NUMachTimeToSeconds_onceToken, &__block_literal_global_5991);
  }
  return *(double *)&_NUMachTimeToSeconds_sFactor * (double)v0;
}

id NUAbsoluteTimeToString(long double a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  time_t v7 = (uint64_t)a1;
  double v1 = modf(a1, &__y);
  int v2 = gmtime(&v7);
  strftime(__s, 0x32uLL, "%H:%M:%S", v2);
  size_t v3 = strlen(__s);
  snprintf(&__s[v3], 50 - v3, " +%5i", (int)(v1 * 100000.0) % 100000);
  uint64_t v4 = (void *)[[NSString alloc] initWithCString:__s encoding:1];

  return v4;
}

id NUAssertLogger_6028()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_6041);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

uint64_t NUScaleMultiplyInteger(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1 * a3;
  uint64_t result = a1 * a3 / a2;
  uint64_t v6 = v4 - result * a2;
  if (v6)
  {
    if (v6 < 0) {
      uint64_t v6 = -v6;
    }
    uint64_t v7 = v6 < a2 - v6;
    if (a4 != 2) {
      uint64_t v7 = a4;
    }
    if (v7)
    {
      if (v7 == 4)
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_6073);
        }
        double v8 = (id)_NUAssertLogger;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          uint64_t v9 = [NSString stringWithFormat:@"NUScaleMultiplyInteger. this line should not be hit"];
          *(_DWORD *)buf = 138543362;
          double v24 = v9;
          _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
        }
        specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        double v11 = NUAssertLogger();
        BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
        if (specific)
        {
          if (v12)
          {
            double v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            double v16 = [MEMORY[0x1E4F29060] callStackSymbols];
            uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            double v24 = v15;
            __int16 v25 = 2114;
            double v26 = v17;
            _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else if (v12)
        {
          double v13 = [MEMORY[0x1E4F29060] callStackSymbols];
          double v14 = [v13 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          double v24 = v14;
          _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
        _NUAssertFailHandler((uint64_t)"NSInteger NUScaleMultiplyInteger(NUScale, NSInteger, NUPixelRoundingPolicy)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScale.mm", 54, @"NUScaleMultiplyInteger. this line should not be hit", v18, v19, v20, v21, v22);
      }
    }
    else if (a3 >= 1)
    {
      ++result;
    }
    else
    {
      --result;
    }
  }
  return result;
}

void sub_1A990DA98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

id NUAssertLogger(void)
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_6073);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

unint64_t NUScaleFromDouble(double a1)
{
  uint64_t v1 = (uint64_t)(a1 * 100000.0);
  if (v1 <= 1) {
    uint64_t v1 = 1;
  }
  unint64_t v2 = 100000;
  unint64_t v3 = v1;
  do
  {
    unint64_t v4 = v3;
    unint64_t v3 = v2;
    unint64_t v2 = v4 % v2;
  }
  while (v2);
  return v1 / v3;
}

BOOL NUScaleIsValid(uint64_t a1, uint64_t a2)
{
  return a1 > 0 && a2 > 0;
}

BOOL NUScaleEqual(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NU::Rational<long>::Rational(v8, a1, a2);
  NU::Rational<long>::Rational(v7, a3, a4);
  return v8[1] * v7[0] == v7[1] * v8[0];
}

void *NU::Rational<long>::Rational(void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  *uint64_t result = a2;
  result[1] = a3;
  if (!a3)
  {
    unint64_t v3 = NUAssertLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      unint64_t v4 = [NSString stringWithFormat:@"zero denominator"];
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v4;
      _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v6 = NUAssertLogger();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        double v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        double v11 = [MEMORY[0x1E4F29060] callStackSymbols];
        BOOL v12 = [v11 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = v10;
        __int16 v20 = 2114;
        uint64_t v21 = v12;
        _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v7)
    {
      double v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v9;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"NU::Rational<long>::Rational(T, T) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Math/NURational.h", 39, @"zero denominator", v13, v14, v15, v16, v17);
  }
  return result;
}

void sub_1A990DE10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t NUScaleCompare(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NU::Rational<long>::Rational(&v11, a1, a2);
  NU::Rational<long>::Rational(&v9, a3, a4);
  if (v12 * v9 == v10 * v11) {
    return 0;
  }
  uint64_t v7 = 1;
  if ((uint64_t)(v10 * v11) < (uint64_t)(v12 * v9)) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = -1;
  }
  if ((uint64_t)(v10 * v11) < (uint64_t)(v12 * v9)) {
    uint64_t v7 = -1;
  }
  if ((v12 >> 63) + (v10 >> 63) == 1) {
    return v8;
  }
  else {
    return v7;
  }
}

uint64_t NUScaleInvert(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t NUScaleMultiply(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NU::Rational<long>::Rational(v11, a1, a2);
  NU::Rational<long>::Rational(v10, a3, a4);
  NU::Rational<long>::Rational(&v12, v10[0] * v11[0], v10[1] * v11[1]);
  if (v13)
  {
    uint64_t v6 = v13;
    uint64_t v7 = v12;
    do
    {
      uint64_t v8 = v6;
      uint64_t v6 = v7 % v6;
      uint64_t v7 = v8;
    }
    while (v6);
  }
  else
  {
    uint64_t v8 = v12;
  }
  return v12 / v8;
}

uint64_t NUScaleDivide(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NU::Rational<long>::Rational(v11, a1, a2);
  NU::Rational<long>::Rational(v10, a3, a4);
  NU::Rational<long>::Rational(&v12, v10[1] * v11[0], v10[0] * v11[1]);
  if (v13)
  {
    uint64_t v6 = v13;
    uint64_t v7 = v12;
    do
    {
      uint64_t v8 = v6;
      uint64_t v6 = v7 % v6;
      uint64_t v7 = v8;
    }
    while (v6);
  }
  else
  {
    uint64_t v8 = v12;
  }
  return v12 / v8;
}

double NUScaleToDouble(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1 < 1 || a2 <= 0)
  {
    unint64_t v3 = NUAssertLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      unint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUScaleIsValid(scale)");
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v4;
      _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v6 = NUAssertLogger();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        unint64_t v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v11 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v12 = [v11 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v18 = v10;
        __int16 v19 = 2114;
        __int16 v20 = v12;
        _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v9;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"double NUScaleToDouble(NUScale)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScale.mm", 117, @"Invalid parameter not satisfying: %s", v13, v14, v15, v16, (uint64_t)"NUScaleIsValid(scale)");
  }
  return (double)a1 / (double)a2;
}

void sub_1A990E26C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t NUScaleToString(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%ld:%ld", a1, a2);
}

uint64_t NUScaleFromString(void *a1)
{
  id v1 = a1;
  unint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v1];
  uint64_t v9 = 0;
  if (([v2 scanInteger:&v9] & 1) == 0) {
    goto LABEL_13;
  }
  if ([v2 scanString:@":" intoString:0])
  {
    uint64_t v8 = 0;
    int v3 = [v2 scanInteger:&v8];
    unint64_t v4 = &NUScaleUnknown;
    if (v3) {
      unint64_t v4 = (long long *)&v9;
    }
    uint64_t v5 = *(void *)v4;
    goto LABEL_14;
  }
  if (![v2 scanString:@"." intoString:0])
  {
    if ([v2 isAtEnd])
    {
      uint64_t v5 = v9;
      goto LABEL_14;
    }
LABEL_13:
    uint64_t v5 = NUScaleUnknown;
    goto LABEL_14;
  }
  uint64_t v8 = 0;
  if (![v2 scanInteger:&v8]) {
    goto LABEL_13;
  }
  for (uint64_t i = 1; i <= v8; i *= 10)
    ;
  uint64_t v5 = v8 + v9 * i;
LABEL_14:

  return v5;
}

void sub_1A990E428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id NUScaleToValue(uint64_t a1, uint64_t a2)
{
  v4[0] = a1;
  v4[1] = a2;
  unint64_t v2 = [MEMORY[0x1E4F29238] value:v4 withObjCType:"{?=qq}"];

  return v2;
}

uint64_t NUScaleFromValue(void *a1)
{
  long long v2 = NUScaleUnknown;
  [a1 getValue:&v2];
  return v2;
}

id NUAssertLogger_6305()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_192_6326);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void _deriveTranslatedRectFromConstrainedRect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float64x2_t a9, double a10, double a11, double a12, __n128 a13, __n128 a14, __n128 a15, __n128 a16, float64x2_t a17)
{
}

double _deriveTranslatedQuadFromConstrainedQuad(float64x2_t a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, float64x2_t a17)
{
  *(void *)&double result = *(_OWORD *)&deriveTranslatedQuadFromConstrainedQuad(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17);
  return result;
}

void _deriveScaledRectFromConstrainedRect(double a1, double a2, double a3, double a4, float64_t a5, float64_t a6, float64_t a7, float64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, CGVector a17, long long a18, long long a19, long long a20)
{
  deriveScaledRectFromConstrainedRect(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20);
}

double _deriveScaleQuadFromConstrainedQuad(__n128 a1, __n128 a2, __n128 a3, __n128 a4, float64x2_t a5, float64x2_t a6, float64x2_t a7, float64x2_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, CGVector a17, long long a18, long long a19, long long a20)
{
  *(void *)&double result = deriveScaledQuadFromConstrainedQuad(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
                         a20).n128_u64[0];
  return result;
}

double _aspectRatioConstrainedFromRect(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7, double a8)
{
  return aspectRatioConstrainedFromRect(a1, a2, a3, a4, a5, a6, a7, a8, a5 * a6);
}

uint64_t _vertexIDFromPoint(const CGRect *a1, float64x2_t *a2)
{
  uint64_t v3 = 0;
  float64x2_t v8 = *a2;
  while (1)
  {
    v4.f64[0] = pointFromVertexID(a1, v3);
    v4.f64[1] = v5;
    float64x2_t v6 = vsubq_f64(v8, v4);
    if (sqrt(vaddvq_f64(vmulq_f64(v6, v6))) < 5.0) {
      break;
    }
    uint64_t v3 = (v3 + 1);
    if (v3 == 8) {
      return 0xFFFFFFFFLL;
    }
  }
  return v3;
}

uint64_t _vertexIDFromPointWithTolerance(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, float64x2_t a5, float64_t a6, double a7)
{
  uint64_t v8 = 0;
  v14.origin.x = a1;
  v14.origin.y = a2;
  v14.size.width = a3;
  v14.size.height = a4;
  a5.f64[1] = a6;
  float64x2_t v13 = a5;
  while (1)
  {
    v9.f64[0] = pointFromVertexID(&v14, v8);
    v9.f64[1] = v10;
    float64x2_t v11 = vsubq_f64(v13, v9);
    if (sqrt(vaddvq_f64(vmulq_f64(v11, v11))) < a7) {
      break;
    }
    uint64_t v8 = (v8 + 1);
    if (v8 == 8) {
      return 0xFFFFFFFFLL;
    }
  }
  return v8;
}

double _pointFromVertexID(int a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  v6.origin.x = a2;
  v6.origin.y = a3;
  v6.size.width = a4;
  v6.size.height = a5;
  return pointFromVertexID(&v6, a1);
}

BOOL _canExpandWithAbsoluteAnchor(uint64_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  v12.origin.x = a6;
  v12.origin.y = a7;
  v12.size.width = a8;
  v12.size.height = a9;
  v10[0] = a2;
  v10[1] = a3;
  void v10[2] = a4;
  v10[3] = a5;
  return canExpandWithAbsoluteAnchor(a1, v10, &v12, (float64x2_t *)&v11);
}

void sub_1A9914058(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A99140CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A99141B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A9914560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A9914728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A99148BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9914A48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9914B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9914F50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9915128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A99151D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9915280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A99156D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9915A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A9915C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

NUCVPixelBuffer *GenerateMaskForInstances(void *a1, void *a2, uint64_t a3, void *a4, double a5, double a6)
{
  id v11 = a2;
  id v12 = a1;
  if (![v12 count])
  {
    v31 = +[NUError invalidError:@"Can't create mask for empty index set" object:v12];

    v30 = 0;
    *a4 = v31;
    goto LABEL_22;
  }
  float64x2_t v13 = (__CVBuffer *)[v11 generateMaskForInstances:v12 error:a4];

  CGRect v14 = [[NUCVPixelBuffer alloc] initWithCVPixelBuffer:v13];
  CVPixelBufferRelease(v13);
  if (a6 == 0.0) {
    double v15 = 1.0;
  }
  else {
    double v15 = a5 / a6;
  }
  if (a3 == 1 && v15 == 1.0) {
    goto LABEL_17;
  }
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:", -[NUCVPixelBuffer CVPixelBuffer](v14, "CVPixelBuffer"));
  double v17 = 1.0 / v15;
  if (v15 < 1.0) {
    double v17 = 1.0;
  }
  memset(&v34, 0, sizeof(v34));
  CGAffineTransformMakeScale(&v34, v17, fmin(v15, 1.0));
  CGAffineTransform v33 = v34;
  uint64_t v18 = [v16 imageByApplyingTransform:&v33];

  uint64_t v19 = 6;
  if (a3 != 8) {
    uint64_t v19 = a3;
  }
  if (a3 == 6) {
    uint64_t v20 = 8;
  }
  else {
    uint64_t v20 = v19;
  }
  uint64_t v21 = ApplyOrientation(v18, v20);

  [v21 extent];
  double v24 = +[NUVideoUtilities newPixelBufferOfSize:format:](NUVideoUtilities, "newPixelBufferOfSize:format:", vcvtpd_s64_f64(v22), vcvtpd_s64_f64(v23), 1278226488);

  __int16 v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E070]), "initWithPixelBuffer:", -[NUCVPixelBuffer CVPixelBuffer](v24, "CVPixelBuffer"));
  id v26 = objc_alloc_init(MEMORY[0x1E4F1E018]);
  uint64_t v27 = [v26 startTaskToRender:v21 toDestination:v25 error:a4];
  if (!v27)
  {

    goto LABEL_20;
  }
  v28 = v27;
  id v29 = [v27 waitUntilCompletedAndReturnError:a4];

  if (!v29)
  {
LABEL_20:
    v30 = 0;
    goto LABEL_21;
  }
  CGRect v14 = v24;
LABEL_17:
  double v24 = v14;
  v30 = v24;
LABEL_21:

LABEL_22:

  return v30;
}

id ApplyOrientation(void *a1, uint64_t a2)
{
  id v3 = a1;
  float64x2_t v4 = v3;
  if (a2 != 1)
  {
    [v3 extent];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
    NUOrientationMakeTransformWithSizeAndOrigin(a2, vcvtpd_s64_f64(v5), vcvtpd_s64_f64(v6), 0, 0, (uint64_t)&v10);
    v9[0] = v10;
    v9[1] = v11;
    v9[2] = v12;
    uint64_t v7 = [v4 imageByApplyingTransform:v9];

    float64x2_t v4 = (void *)v7;
  }

  return v4;
}

id NUAssertLogger_6987()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_7005);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A9918924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A99189D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9918AFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9918B5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9918CE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9919014(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9919374(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9919494(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A9919500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A99197B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9919AB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9919DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A991A068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A991A1AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A991A548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A991A760(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A991AA60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A991ADDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A991B104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A991B62C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A991BA78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A991BDBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A991C058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

id NUAssertLogger_7355()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_7745()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_38);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_7993()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_8007);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A992AE10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL CGAffineTransformIsValid(double *a1)
{
  return fabs(*a1 * a1[3] - a1[1] * a1[2]) > 1.0e-12;
}

double CGAffineTransformDeterminant(double *a1)
{
  return *a1 * a1[3] - a1[1] * a1[2];
}

double CGAffineTransformDot(double *a1, double *a2)
{
  return a1[1] * a2[1] + *a1 * *a2 + a1[2] * a2[2] + a1[3] * a2[3] + a1[4] * a2[4] + a1[5] * a2[5];
}

float64x2_t CGAffineTransformSubstract@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t v3 = vsubq_f64(a1[1], a2[1]);
  *a3 = vsubq_f64(*a1, *a2);
  a3[1] = v3;
  float64x2_t result = vsubq_f64(a1[2], a2[2]);
  a3[2] = result;
  return result;
}

double CGAffineTransformRoot(double *a1)
{
  double v1 = *a1;
  double v2 = a1[1];
  double v4 = a1[2];
  double v3 = a1[3];
  double v5 = *a1 * v3 - v2 * v4;
  if (v5 != 0.0) {
    return (v4 * a1[5] - v3 * a1[4]) / v5;
  }
  if (v1 == 0.0 && v4 == 0.0)
  {
    if (v2 == 0.0)
    {
      return 0.0;
    }
    else if (a1[4] == 0.0)
    {
      return -a1[5] / v2;
    }
    else
    {
      return 0.0;
    }
  }
  else if (v2 == 0.0 && v3 == 0.0)
  {
    double result = 0.0;
    if (a1[5] == 0.0)
    {
      double result = -a1[4] / v1;
      if (v1 == 0.0) {
        return 0.0;
      }
    }
  }
  else
  {
    double v7 = a1[4];
    double v8 = a1[5];
    double v9 = v2 * v7;
    double v10 = v7 * v3;
    double result = -v7 / v1;
    if (v8 * v4 != v10) {
      double result = 0.0;
    }
    if (v9 != v1 * v8) {
      return 0.0;
    }
  }
  return result;
}

double CGAffineTransformFixedPoint(float64x2_t *a1)
{
  float64x2_t v1 = vsubq_f64(a1[1], *(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 16));
  v3[0] = vsubq_f64(*a1, *MEMORY[0x1E4F1DAB8]);
  v3[1] = v1;
  v3[2] = vsubq_f64(a1[2], *(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 32));
  return CGAffineTransformRoot((double *)v3);
}

BOOL CGAffineTransformHasRotation(double *a1)
{
  return *a1 < 0.0 || a1[1] != 0.0 || a1[2] != 0.0 || a1[3] < 0.0;
}

CGAffineTransform *CGAffineTransformMove@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeTranslation(&v16, a3, a4);
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeTranslation(&v15, -a5, -a6);
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  CGAffineTransform t1 = v16;
  long long v10 = a1[1];
  *(_OWORD *)&v12.a = *a1;
  *(_OWORD *)&v12.c = v10;
  *(_OWORD *)&v12.tx = a1[2];
  CGAffineTransformConcat(&v14, &t1, &v12);
  CGAffineTransform t1 = v15;
  return CGAffineTransformConcat((CGAffineTransform *)a2, &v14, &t1);
}

id NSStringFromAffineTransform(_OWORD *a1)
{
  long long v1 = a1[1];
  v5[0] = *a1;
  v5[1] = v1;
  v5[2] = a1[2];
  double v2 = objc_msgSend(MEMORY[0x1E4F28AF0], "nu_transformWithCGAffineTransform:", v5);
  double v3 = [v2 description];

  return v3;
}

CGFloat CGAffineTransformForMappingFromRectToRect@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, CGFloat a6@<D4>, CGFloat a7@<D5>, double a8@<D6>, double a9@<D7>)
{
  uint64_t v16 = MEMORY[0x1E4F1DAB8];
  long long v17 = *MEMORY[0x1E4F1DAB8];
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)a1 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)(a1 + 16) = v18;
  long long v19 = *(_OWORD *)(v16 + 32);
  *(_OWORD *)(a1 + 32) = v19;
  *(_OWORD *)&v26.a = v17;
  *(_OWORD *)&v26.c = v18;
  *(_OWORD *)&v26.tx = v19;
  CGAffineTransformTranslate((CGAffineTransform *)a1, &v26, a6, a7);
  long long v20 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v25.a = *(_OWORD *)a1;
  *(_OWORD *)&v25.c = v20;
  *(_OWORD *)&v25.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformScale(&v26, &v25, a8 / a4, a9 / a5);
  long long v21 = *(_OWORD *)&v26.c;
  *(_OWORD *)a1 = *(_OWORD *)&v26.a;
  *(_OWORD *)(a1 + 16) = v21;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v26.tx;
  long long v22 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v25.a = *(_OWORD *)a1;
  *(_OWORD *)&v25.c = v22;
  *(_OWORD *)&v25.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformTranslate(&v26, &v25, -a2, -a3);
  long long v23 = *(_OWORD *)&v26.c;
  *(_OWORD *)a1 = *(_OWORD *)&v26.a;
  *(_OWORD *)(a1 + 16) = v23;
  CGFloat result = v26.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v26.tx;
  return result;
}

__n128 CGAffineTransformRelative@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v3;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  return result;
}

id NUAssertLogger_8557()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_8570);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

uint64_t __Block_byref_object_copy__8674(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8675(uint64_t a1)
{
}

double CGRectTranslate(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + a5;
}

void deriveTranslatedRectFromConstrainedRect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float64x2_t a9, double a10, double a11, double a12, __n128 a13, __n128 a14, __n128 a15, __n128 a16, float64x2_t a17)
{
  v18.n128_f64[0] = a9.f64[0] + a11;
  a9.f64[1] = a10;
  v19.n128_f64[0] = a9.f64[0] + a11;
  v19.n128_f64[1] = a10;
  v20.n128_u64[0] = *(void *)&a9.f64[0];
  v20.n128_f64[1] = a10 + a12;
  v18.n128_f64[1] = a10 + a12;
  v24[0] = deriveTranslatedQuadFromConstrainedQuad(a9, v19, v20, v18, a13, a14, a15, a16, a1, a2, a3, a4, a5, a6, a7, a8, a17);
  v24[1] = v21;
  v24[2] = v22;
  v24[3] = v23;
  NU::Quad2d::boundingRect(v24);
}

float64x2_t deriveTranslatedQuadFromConstrainedQuad(float64x2_t a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, float64x2_t a17)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  float64x2_t v51 = a1;
  v60[0] = a1;
  v60[1] = a2;
  v60[2] = a3;
  v60[3] = a4;
  CGVector v56 = (CGVector)a5;
  __n128 v57 = a6;
  __n128 v58 = a7;
  __n128 v59 = a8;
  intersectionPoint((uint64_t)v64, (const NU::Quad2d *)v60, &v56, a17, 0.000244140625);
  if (v67[20]) {
    goto LABEL_8;
  }
  NU::Quad2d::boundingRect((float64x2_t *)&v56);
  if (v17 >= v18) {
    double v19 = v18;
  }
  else {
    double v19 = v17;
  }
  double v20 = 10.0;
  if (v19 <= 10.0) {
    double v20 = v19;
  }
  intersectionPoint((uint64_t)buf, (const NU::Quad2d *)v60, &v56, a17, v20);
  *(void *)&v67[13] = *(void *)&v75[13];
  long long v65 = v73;
  __n128 v66 = v74;
  *(_OWORD *)v67 = *(_OWORD *)v75;
  v64[0] = *(float64x2_t *)buf;
  v64[1] = *(float64x2_t *)&buf[16];
  if (v75[20])
  {
LABEL_8:
    float64x2_t v46 = v64[0];
    v62[1] = v66;
    long long v63 = *(_OWORD *)v67;
    v62[0] = v65;
    LODWORD(v63) = 1;
    float64x2_t v21 = projectionPoint((uint64_t)v62, vaddq_f64(v64[0], a17));
    unsigned __int8 v22 = 0;
    uint64_t v23 = 0;
    *(__n128 *)buf = a5;
    *(__n128 *)&buf[16] = a6;
    float64x2_t v55 = vsubq_f64(v21, v46);
    LODWORD(v73) = 0;
    __n128 v74 = a6;
    *(__n128 *)v75 = a8;
    *(_DWORD *)&v75[16] = 0;
    __n128 v76 = a8;
    __n128 v77 = a7;
    int v78 = 0;
    __n128 v79 = a7;
    __n128 v80 = a5;
    int v81 = 0;
    v71[0] = v51;
    v71[1] = a2;
    double v24 = 1.79769313e308;
    v71[2] = a3;
    v71[3] = a4;
    do
    {
      uint64_t v25 = 0;
      float64x2_t v26 = vaddq_f64((float64x2_t)v71[v23], v55);
      v69[0] = v71[v23];
      v69[1] = v26;
      int v70 = 0;
      do
      {
        long long v27 = *(_OWORD *)&buf[v25 + 16];
        v68[0] = *(_OWORD *)&buf[v25];
        v68[1] = v27;
        v68[2] = *(_OWORD *)&buf[v25 + 32];
        double v61 = 0.0;
        int IntersectParam = NU::LineSegment2d::findIntersectParam((uint64_t)v69, (uint64_t)v68, &v61);
        BOOL v30 = v61 >= 0.0 && IntersectParam == 2;
        int v31 = v30 && v24 > v61;
        if (v31) {
          double v24 = v61;
        }
        v22 |= v31;
        v25 += 48;
      }
      while (v25 != 192);
      ++v23;
    }
    while (v23 != 4);
    if ((v22 & (v24 > 0.000000953674316)) != 0) {
      return vaddq_f64(vmulq_n_f64(v55, fmin(v24, 1.0)), v51);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_8696);
    }
    v32 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      CGAffineTransform v33 = [NSString stringWithFormat:@"None of the crop rect points are on the boundary!"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v33;
      _os_log_impl(&dword_1A9892000, v32, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);
    }
    if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_8696);
      }
      CGAffineTransform v34 = (id)_NUAssertLogger;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = [MEMORY[0x1E4F29060] callStackSymbols];
        v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v35;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v37;
        _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_8696);
      }
      CGAffineTransform v34 = (id)_NUAssertLogger;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v43 = [MEMORY[0x1E4F29060] callStackSymbols];
        v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v44;
        _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
    }

    _NUAssertContinueHandler((uint64_t)"NU::Quad2d deriveTranslatedQuadFromConstrainedQuad(NU::Quad2d, NU::Quad2d, CGVector)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModelAlgo.mm", 212, @"None of the crop rect points are on the boundary!", v38, v39, v40, v41, v45);
  }
  return v51;
}

void sub_1A99308C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double NU::Quad2d::boundingRect(float64x2_t *this)
{
  float64x2_t v1 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(this[1], *this), *(int8x16_t *)this, (int8x16_t)this[1]);
  float64x2_t v2 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(this[2], v1), (int8x16_t)v1, (int8x16_t)this[2]);
  *(void *)&double result = vbslq_s8((int8x16_t)vcgtq_f64(this[3], v2), (int8x16_t)v2, (int8x16_t)this[3]).u64[0];
  return result;
}

uint64_t intersectionPoint(uint64_t result, const NU::Quad2d *a2, const CGVector *a3, float64x2_t a4, double a5)
{
  uint64_t v6 = result;
  uint64_t v7 = 0;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(result + 84) = 0;
  CGVector v8 = a3[1];
  v41[0] = *a3;
  v41[1] = v8;
  int v42 = 0;
  CGVector v10 = a3[2];
  CGVector v9 = a3[3];
  CGVector v43 = v8;
  CGVector v44 = v9;
  int v45 = 0;
  CGVector v46 = v9;
  CGVector v47 = v10;
  int v48 = 0;
  CGVector v49 = v10;
  long long v50 = v41[0];
  long long v11 = *((_OWORD *)a2 + 1);
  v40[0] = *(_OWORD *)a2;
  v40[1] = v11;
  long long v12 = *((_OWORD *)a2 + 3);
  uint64_t v13 = result + 32;
  v40[2] = *((_OWORD *)a2 + 2);
  v40[3] = v12;
  BOOL v14 = a4.f64[1] != 0.0 || a4.f64[0] != 0.0;
  int v51 = 0;
LABEL_5:
  uint64_t v15 = 0;
  float64x2_t v16 = (float64x2_t)v40[v7];
  v17.f64[0] = v16.f64[0] + -0.1;
  double v18 = *((double *)&v40[v7] + 1);
  v19.f64[0] = v16.f64[0] + -0.1;
  v19.f64[1] = v18 + -0.1;
  float64x2_t v34 = v19;
  v19.f64[0] = v16.f64[0] + 0.1;
  v20.f64[0] = v16.f64[0] + 0.1;
  v20.f64[1] = v18 + -0.1;
  v17.f64[1] = v18 + 0.1;
  float64x2_t v35 = v17;
  v19.f64[1] = v18 + 0.1;
  float64x2_t v32 = v20;
  float64x2_t v33 = v19;
  float64x2_t v21 = (float64x2_t *)v41;
  float64x2_t v37 = v16;
  while (1)
  {
    float64x2_t v23 = *v21;
    float64x2_t v22 = v21[1];
    if (LODWORD(v21[2].f64[0]))
    {
      double v24 = 1.79769313e308;
    }
    else
    {
      float64x2_t v25 = vsubq_f64(v22, v23);
      double v24 = sqrt(vaddvq_f64(vmulq_f64(v25, v25)));
    }
    float64x2_t v26 = vsubq_f64(v16, v23);
    int64x2_t v27 = (int64x2_t)vmulq_f64(v26, v26);
    float64x2_t v28 = vsubq_f64(v22, v16);
    int64x2_t v29 = (int64x2_t)vmulq_f64(v28, v28);
    if (vabdd_f64(vaddvq_f64(vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v29, v27), (float64x2_t)vzip2q_s64(v29, v27)))), v24) < a5)
    {
      *(float64x2_t *)uint64_t v6 = v16;
      *(_DWORD *)(v6 + 16) = v7;
      float64x2_t v30 = v21[1];
      *(float64x2_t *)uint64_t v13 = *v21;
      *(float64x2_t *)(v13 + 16) = v30;
      *(_DWORD *)(v13 + 32) = LODWORD(v21[2].f64[0]);
      *(_DWORD *)(v6 + 80) = v15;
      *(unsigned char *)(v6 + 84) = 1;
      if (!v14) {
        return result;
      }
      float64x2_t v31 = v16;
      switch((int)v7)
      {
        case 0:
          float64x2_t v31 = v33;
          break;
        case 1:
          float64x2_t v31 = v35;
          break;
        case 2:
          float64x2_t v31 = v32;
          break;
        case 3:
          float64x2_t v31 = v34;
          break;
        default:
          break;
      }
      v38[0] = v31;
      v38[1] = vaddq_f64(v31, a4);
      int v39 = 0;
      double result = NU::LineSegment2d::findIntersectParam((uint64_t)v38, v13, 0);
      float64x2_t v16 = v37;
      if (result == 2) {
        return result;
      }
    }
    v21 += 3;
    if (++v15 == 4)
    {
      if (++v7 != 4) {
        goto LABEL_5;
      }
      return result;
    }
  }
}

float64x2_t projectionPoint(uint64_t a1, float64x2_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  float64x2_t v2 = *(float64x2_t *)(a1 + 16);
  float64x2_t v6 = *(float64x2_t *)a1;
  float64x2_t v7 = a2;
  int64x2_t v3 = (int64x2_t)vsubq_f64(v2, *(float64x2_t *)a1);
  v2.f64[0] = -*(double *)&v3.i64[1];
  float64x2_t v5 = (float64x2_t)v3;
  v9[0] = a2;
  v9[1] = vaddq_f64((float64x2_t)vzip1q_s64((int64x2_t)v2, v3), a2);
  int v10 = 1;
  double v8 = 0.0;
  if (NU::LineSegment2d::findIntersectParam(a1, (uint64_t)v9, &v8) == 2) {
    return vmlaq_n_f64(v6, v5, v8);
  }
  return v7;
}

uint64_t NU::LineSegment2d::findIntersectParam(uint64_t a1, uint64_t a2, double *a3)
{
  float64x2_t v3 = *(float64x2_t *)a1;
  float64x2_t v4 = vsubq_f64(*(float64x2_t *)(a1 + 16), *(float64x2_t *)a1);
  float64x2_t v5 = vsubq_f64(*(float64x2_t *)(a2 + 16), *(float64x2_t *)a2);
  _Q2 = vsubq_f64(*(float64x2_t *)a2, *(float64x2_t *)a1);
  double v7 = vmlad_n_f64(-_Q2.f64[1] * v5.f64[0], v5.f64[1], _Q2.f64[0]);
  _D3 = v4.f64[1];
  double v9 = vmlad_n_f64(-v4.f64[1] * v5.f64[0], v5.f64[1], v4.f64[0]);
  if (v9 == 0.0)
  {
    if (v7 == 0.0)
    {
      if (*(_DWORD *)(a1 + 32) | *(_DWORD *)(a2 + 32))
      {
        return 4;
      }
      else
      {
        if (v4.f64[0] == 0.0)
        {
          uint64_t v10 = 1;
          v4.f64[0] = v4.f64[1];
          double v11 = _Q2.f64[1] / v4.f64[1];
        }
        else
        {
          uint64_t v10 = 0;
          *(void *)&double v11 = *(_OWORD *)&vdivq_f64(_Q2, v4);
        }
        long long v27 = *(_OWORD *)(a2 + 16);
        double v22 = *(double *)((unint64_t)&v27 & 0xFFFFFFFFFFFFFFF7 | (8 * (v10 & 1)));
        float64x2_t v26 = v3;
        double v23 = (v22 - *(double *)((unint64_t)&v26 | (8 * v10))) / v4.f64[0];
        uint64_t result = 3;
        if (v11 <= 1.0 || v23 <= 1.0)
        {
          if (v23 < 0.0 && v11 < 0.0) {
            return 3;
          }
          else {
            return 4;
          }
        }
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    int v12 = *(_DWORD *)(a1 + 32);
    double v13 = v7 / v9;
    if (v12 != 1)
    {
      int v12 = v13 >= 0.0;
      if (v13 > 1.0) {
        int v12 = 0;
      }
    }
    int v14 = *(_DWORD *)(a2 + 32);
    if (v14 != 1)
    {
      __asm { FMLS            D4, D3, V2.D[0] }
      double v19 = _D4 / (v5.f64[0] * v4.f64[1] - v5.f64[1] * v4.f64[0]);
      int v14 = v19 >= 0.0;
      if (v19 > 1.0) {
        int v14 = 0;
      }
    }
    char v20 = v12 ^ 1;
    if (!a3) {
      char v20 = 1;
    }
    if ((v20 & 1) == 0) {
      *a3 = v13;
    }
    if ((v12 & v14) != 0) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return result;
}

void deriveScaledRectFromConstrainedRect(double a1, double a2, double a3, double a4, float64_t a5, float64_t a6, float64_t a7, float64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, CGVector a17, long long a18, long long a19, long long a20)
{
  *(double *)&long long v20 = a1;
  *((double *)&v20 + 1) = a2;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  CGVector v56 = a17;
  long long v57 = a18;
  long long v58 = a19;
  long long v59 = a20;
  *(double *)&long long v21 = a1 + a3;
  *(void *)&long long v22 = v21;
  *((double *)&v22 + 1) = a2;
  v55[0] = v20;
  v55[1] = v22;
  *((double *)&v20 + 1) = a2 + a4;
  *((double *)&v21 + 1) = a2 + a4;
  v55[2] = v20;
  v55[3] = v21;
  intersectionPoint((uint64_t)v63, (const NU::Quad2d *)v55, &v56, (float64x2_t)0, 0.000244140625);
  if (!v68)
  {
    int64x2_t v29 = NUAssertLogger();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      float64x2_t v30 = [NSString stringWithFormat:@"none of the crop rect points are on the boundary!"];
      LODWORD(buf[0].f64[0]) = 138543362;
      *(void *)((char *)buf[0].f64 + 4) = v30;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    float64x2_t v32 = NUAssertLogger();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        float64x2_t v37 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v38 = [v37 componentsJoinedByString:@"\n"];
        LODWORD(buf[0].f64[0]) = 138543618;
        *(void *)((char *)buf[0].f64 + 4) = v36;
        WORD2(buf[0].f64[1]) = 2114;
        *(void *)((char *)&buf[0].f64[1] + 6) = v38;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);
      }
    }
    else if (v33)
    {
      float64x2_t v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      float64x2_t v35 = [v34 componentsJoinedByString:@"\n"];
      LODWORD(buf[0].f64[0]) = 138543362;
      *(void *)((char *)buf[0].f64 + 4) = v35;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"CGRect deriveScaledRectFromConstrainedRect(CGRect, CGRect, NU::Quad2d)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModelAlgo.mm", 247, @"none of the crop rect points are on the boundary!", v39, v40, v41, v42, v43);
  }
  v23.f64[0] = a5;
  v23.f64[1] = a6;
  int64x2_t v24 = vdupq_n_s64(0x3EE4F8B588E368F1uLL);
  switch(v64)
  {
    case 0:
      goto LABEL_7;
    case 1:
      v25.f64[1] = a6;
      int64x2_t v24 = (int64x2_t)xmmword_1A9A72CF0;
      goto LABEL_6;
    case 2:
      v23.f64[1] = a6 + a8;
      int64x2_t v24 = (int64x2_t)xmmword_1A9A72CE0;
      goto LABEL_7;
    case 3:
      v25.f64[1] = a6 + a8;
      int64x2_t v24 = vdupq_n_s64(0xBEE4F8B588E368F1);
LABEL_6:
      v25.f64[0] = a5 + a7;
      float64x2_t v23 = v25;
LABEL_7:
      float64x2_t v46 = v23;
      float64x2_t v45 = (float64x2_t)v24;
      v61[1] = v66;
      long long v62 = v67;
      v61[0] = v65;
      LODWORD(v62) = 1;
      float64x2_t v44 = projectionPoint((uint64_t)v61, v23);
      v26.f64[0] = a5;
      v26.f64[1] = a6;
      float64x2_t v52 = vaddq_f64(v26, vsubq_f64(v44, v46));
      v27.f64[0] = a7;
      v27.f64[1] = a8;
      float64_t v53 = a7;
      float64_t v54 = a8;
      float64x2_t v28 = vaddq_f64(v27, v52);
      v26.f64[0] = v52.f64[0];
      v26.f64[1] = v28.f64[1];
      buf[2] = v26;
      buf[3] = v28;
      v28.f64[1] = v52.f64[1];
      buf[0] = v52;
      buf[1] = v28;
      if ((NU::Quad2d::simpleContains((float64x2_t *)&v56, buf) & 1) == 0)
      {
        buf[0] = vaddq_f64(v45, v44);
        double v51 = a7 / a8;
        NU::Quad2d::findInscribedAxisAlignedAspectFitRectWithAnchor((float64x2_t *)&v56, buf[0].f64, (uint64_t)&v52, (uint64_t)&v52, (uint64_t *)&v51, 0.000000953674316);
      }
      break;
    default:
      return;
  }
}

void sub_1A99311EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t NU::Quad2d::simpleContains(float64x2_t *this, float64x2_t *a2)
{
  BOOL v4 = NU::Quad2d::simpleContains(this, *a2);
  BOOL v5 = NU::Quad2d::simpleContains(this, a2[1]);
  BOOL v6 = NU::Quad2d::simpleContains(this, a2[2]);
  return (v4 && v5) & v6 & NU::Quad2d::simpleContains(this, a2[3]);
}

void NU::Quad2d::findInscribedAxisAlignedAspectFitRectWithAnchor(float64x2_t *a1, CGFloat *a2, uint64_t a3, uint64_t a4, uint64_t *a5, double a6)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  rect.origin = *(CGPoint *)a4;
  float64x2_t v12 = vaddq_f64(*(float64x2_t *)(a4 + 16), *(float64x2_t *)a4);
  v13.f64[0] = *(float64_t *)a4;
  v13.f64[1] = v12.f64[1];
  v37[2] = v13;
  v37[3] = v12;
  v12.f64[1] = rect.origin.y;
  v37[0] = (float64x2_t)rect.origin;
  v37[1] = v12;
  if (!NU::Quad2d::equivalentWithTolerance(a1, v37, a6))
  {
    long long v14 = *(_OWORD *)(a3 + 16);
    CGPoint v35 = *(CGPoint *)a3;
    long long v36 = v14;
    int v15 = 100;
    double height = *((double *)&v14 + 1);
    double width = *(double *)&v14;
    while (1)
    {
      *(CGFloat *)&long long v18 = v35.x;
      *(double *)&long long v19 = width + v35.x;
      *((void *)&v20 + 1) = *(void *)&v35.y;
      *(double *)&long long v20 = width + v35.x;
      CGPoint size = v35;
      long long v39 = v20;
      *((double *)&v18 + 1) = v35.y + height;
      *((double *)&v19 + 1) = v35.y + height;
      long long v40 = v18;
      long long v41 = v19;
      if ((NU::Quad2d::contains(a1, (float64x2_t *)&size) & 1) != 0 || !v15) {
        break;
      }
      if (width <= 10.0 || height <= 10.0) {
        break;
      }
      v43.origin = v35;
      v43.size.double width = width;
      v43.size.double height = height;
      CGRect v44 = CGRectOffset(v43, -*a2, -a2[1]);
      v44.size.double width = v44.size.width * 0.5;
      v44.size.double height = v44.size.height * 0.5;
      v44.origin.x = v44.origin.x * 0.5;
      v44.origin.y = v44.origin.y * 0.5;
      CGRect v45 = CGRectOffset(v44, *a2, a2[1]);
      double width = v45.size.width;
      double height = v45.size.height;
      v35.x = v45.origin.x;
      v35.y = v45.origin.y;
      *(CGFloat *)&long long v36 = v45.size.width;
      *((void *)&v36 + 1) = *(void *)&v45.size.height;
      --v15;
    }
    long long v22 = *(_OWORD *)(a4 + 16);
    rect.CGPoint size = *(CGSize *)a4;
    long long v34 = v22;
    int v23 = 100;
    double v25 = *((double *)&v22 + 1);
    double v24 = *(double *)&v22;
    while (1)
    {
      *(CGFloat *)&long long v26 = rect.size.width;
      *(double *)&long long v27 = v24 + rect.size.width;
      *((void *)&v28 + 1) = *(void *)&rect.size.height;
      *(double *)&long long v28 = v24 + rect.size.width;
      CGPoint size = (CGPoint)rect.size;
      long long v39 = v28;
      *((double *)&v26 + 1) = rect.size.height + v25;
      *((double *)&v27 + 1) = rect.size.height + v25;
      long long v40 = v26;
      long long v41 = v27;
      int v29 = NU::Quad2d::contains(a1, (float64x2_t *)&size);
      BOOL v30 = v23-- != 0;
      BOOL v31 = v30;
      if (!v29 || !v31) {
        break;
      }
      v46.origin.x = rect.size.width;
      v46.origin.y = rect.size.height;
      v46.size.double width = v24;
      v46.size.double height = v25;
      CGRect v47 = CGRectOffset(v46, -*a2, -a2[1]);
      v47.size.double width = v47.size.width + v47.size.width;
      v47.size.double height = v47.size.height + v47.size.height;
      v47.origin.x = v47.origin.x + v47.origin.x;
      v47.origin.y = v47.origin.y + v47.origin.y;
      CGRect v48 = CGRectOffset(v47, *a2, a2[1]);
      double v24 = v48.size.width;
      double v25 = v48.size.height;
      rect.size.double width = v48.origin.x;
      rect.size.double height = v48.origin.y;
      *(CGFloat *)&long long v34 = v48.size.width;
      *((void *)&v34 + 1) = *(void *)&v48.size.height;
    }
    uint64_t v32 = *a5;
    *(void *)&size.x = &unk_1F0010000;
    long long v39 = *(_OWORD *)a2;
    *(void *)&long long v40 = v32;
    NU::Quad2d::computeLimitRect(a1, (uint64_t)&v35, (uint64_t)&rect.size, (uint64_t)&size, a6);
  }
}

uint64_t NU::Quad2d::equivalentWithTolerance(float64x2_t *this, float64x2_t *a2, double a3)
{
  float64x2_t v3 = vsubq_f64(*this, *a2);
  double v4 = fabs(v3.f64[0]);
  double v5 = fabs(v3.f64[1]);
  if (v4 >= a3 || v5 >= a3) {
    return 0;
  }
  float64x2_t v7 = vsubq_f64(this[1], a2[1]);
  double v8 = fabs(v7.f64[0]);
  double v9 = fabs(v7.f64[1]);
  if (v8 >= a3 || v9 >= a3) {
    return 0;
  }
  float64x2_t v11 = vsubq_f64(this[2], a2[2]);
  double v12 = fabs(v11.f64[0]);
  double v13 = fabs(v11.f64[1]);
  BOOL v14 = v12 < a3 && v13 < a3;
  if (v14
    && ((v15 = vsubq_f64(this[3], a2[3]), double v16 = fabs(v15.f64[0]), v17 = fabs(v15.f64[1]), v16 < a3)
      ? (BOOL v18 = v17 < a3)
      : (BOOL v18 = 0),
        v18))
  {
    return 1;
  }
  else
  {
    return 0;
  }
}

uint64_t NU::Quad2d::contains(float64x2_t *this, float64x2_t *a2)
{
  int v4 = NU::Quad2d::contains(this, *a2);
  int v5 = NU::Quad2d::contains(this, a2[1]);
  int v6 = NU::Quad2d::contains(this, a2[2]);
  return v4 & v5 & v6 & NU::Quad2d::contains(this, a2[3]);
}

float64_t NU::Quad2d::computeLimitRect(float64x2_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  int v10 = 100;
  do
  {
    v11.f64[0] = (*(double (**)(uint64_t, uint64_t, uint64_t))(*(void *)a4 + 16))(a4, a3, a2);
    v20.f64[0] = v11.f64[0];
    v20.f64[1] = v12;
    *(float64_t *)&long long v21 = v13.f64[0];
    *((float64_t *)&v21 + 1) = v14;
    v13.f64[1] = v14;
    float64x2_t v15 = vaddq_f64(v13, v20);
    v13.f64[0] = v15.f64[0];
    v13.f64[1] = v20.f64[1];
    v19[0] = v20;
    v19[1] = v13;
    v11.f64[1] = v15.f64[1];
    v19[2] = v11;
    v19[3] = v15;
    if ((*(unsigned int (**)(uint64_t, float64x2_t *, uint64_t, double))(*(void *)a4 + 24))(a4, &v20, a3, a5)&& NU::Quad2d::simpleContains(a1, v19))
    {
      break;
    }
    uint64_t v16 = NU::Quad2d::simpleContains(a1, v19) ? a2 : a3;
    long long v17 = v21;
    *(float64x2_t *)uint64_t v16 = v20;
    *(_OWORD *)(v16 + 16) = v17;
    --v10;
  }
  while (v10);
  return v20.f64[0];
}

BOOL NU::AnchorRectFinder::converged(NU::AnchorRectFinder *this, const CGRect *a2, const CGRect *a3, double a4)
{
  return vabdd_f64(a2->size.width, a3->size.width) < a4 && vabdd_f64(a2->size.height, a3->size.height) < a4;
}

double NU::AnchorRectFinder::constructNextRect(NU::AnchorRectFinder *this, const CGRect *a2, const CGRect *a3)
{
  double width = a2->size.width;
  double height = a2->size.height;
  CGFloat v8 = a3->size.height + (height - a3->size.height) * 0.5;
  double v9 = v8 / height;
  double v10 = *((double *)this + 4);
  double v11 = v10 * v8 / width;
  if (v11 > 1.0 || v9 > 1.0)
  {
    CGFloat v13 = a3->size.width + (width - a3->size.width) * 0.5;
    double v11 = v13 / width;
    double v9 = v13 / v10 / height;
  }
  CGFloat x = a2->origin.x;
  CGFloat y = a2->origin.y;
  CGRect v22 = CGRectOffset(*(CGRect *)(&width - 2), -*((double *)this + 2), -*((double *)this + 3));
  double v14 = v11 * v22.size.width;
  double v15 = v9 * v22.size.height;
  double v16 = v11 * v22.origin.x;
  double v17 = v9 * v22.origin.y;
  long long v18 = *((_OWORD *)this + 1);
  CGFloat v19 = *((double *)this + 3);

  *(void *)&double result = (unint64_t)CGRectOffset(*(CGRect *)&v16, *(CGFloat *)&v18, v19);
  return result;
}

void NU::AnchorRectFinder::~AnchorRectFinder(NU::AnchorRectFinder *this)
{
}

uint64_t NU::Quad2d::contains(float64x2_t *a1, float64x2_t a2)
{
  uint64_t v2 = 0;
  char v3 = 0;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  float64x2_t v4 = *a1;
  float64x2_t v5 = a1[1];
  unsigned __int8 v6 = vmovn_s64(vcgtq_f64(v5, *a1)).u8[0];
  BOOL v7 = (v6 & 1) == 0;
  if (v6) {
    double v8 = a1->f64[0];
  }
  else {
    double v8 = a1[1].f64[0];
  }
  if (v7) {
    double v9 = a1->f64[0];
  }
  else {
    double v9 = a1[1].f64[0];
  }
  float64x2_t v10 = a1[2];
  float64x2_t v11 = a1[3];
  if (v8 >= v10.f64[0]) {
    double v8 = a1[2].f64[0];
  }
  if (v8 >= v11.f64[0]) {
    double v8 = a1[3].f64[0];
  }
  if (v9 < v10.f64[0]) {
    double v9 = a1[2].f64[0];
  }
  if (v9 < v11.f64[0]) {
    double v9 = a1[3].f64[0];
  }
  v26[1] = a2;
  a2.f64[0] = v8;
  v26[0] = vsubq_f64(a2, (float64x2_t)vdupq_lane_s64(COERCE__INT64((v9 - v8) / 100.0), 0));
  int v27 = 0;
  v15[0] = v4;
  v15[1] = v5;
  int v16 = 0;
  float64x2_t v17 = v5;
  float64x2_t v18 = v11;
  int v19 = 0;
  float64x2_t v20 = v11;
  float64x2_t v21 = v10;
  int v22 = 0;
  float64x2_t v23 = v10;
  float64x2_t v24 = v4;
  int v25 = 0;
  do
  {
    int IntersectParam = NU::LineSegment2d::findIntersectParam((uint64_t)v26, (uint64_t)&v15[v2], 0);
    if (IntersectParam == 4 || IntersectParam == 2) {
      ++v3;
    }
    v2 += 3;
  }
  while (v2 != 12);
  return v3 & 1;
}

BOOL NU::Quad2d::simpleContains(float64x2_t *a1, float64x2_t a2)
{
  uint64_t v2 = 0;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  float64x2_t v3 = *a1;
  float64x2_t v4 = a1[1];
  v15[0] = v3;
  v15[1] = v4;
  float64x2_t v5 = a1[2];
  _OWORD v15[2] = a1[3];
  v15[3] = v5;
  v15[4] = v3;
  for (uint64_t i = 1; i != 5; ++i)
  {
    float64x2_t v7 = v3;
    __int32 v8 = vmovn_s64((int64x2_t)vmvnq_s8((int8x16_t)vcgeq_f64(a2, v3))).i32[1];
    float64x2_t v3 = (float64x2_t)v15[i];
    double v9 = *((double *)&v15[i] + 1);
    if (v8)
    {
      if (v9 <= a2.f64[1])
      {
        float64x2_t v10 = vsubq_f64(v3, v7);
        float64x2_t v11 = vsubq_f64(a2, v7);
        v2 -= vmlad_n_f64(-v10.f64[1] * v11.f64[0], v11.f64[1], v10.f64[0]) <= 0.0;
      }
    }
    else if (v9 > a2.f64[1])
    {
      float64x2_t v12 = vsubq_f64(v3, v7);
      float64x2_t v13 = vsubq_f64(a2, v7);
      if (vmlad_n_f64(-v12.f64[1] * v13.f64[0], v13.f64[1], v12.f64[0]) >= 0.0) {
        ++v2;
      }
    }
  }
  return v2 != 0;
}

__n128 deriveScaledQuadFromConstrainedQuad(__n128 a1, __n128 a2, __n128 a3, __n128 a4, float64x2_t a5, float64x2_t a6, float64x2_t a7, float64x2_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, CGVector a17, long long a18, long long a19, long long a20)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v48[0] = a1;
  v48[1] = a2;
  uint64_t v37 = a4.n128_u64[0];
  v48[2] = a3;
  v48[3] = a4;
  CGVector v44 = a17;
  long long v45 = a18;
  long long v46 = a19;
  long long v47 = a20;
  intersectionPoint((uint64_t)v54, (const NU::Quad2d *)v48, &v44, (float64x2_t)0, 0.000244140625);
  if (!v59)
  {
    float64x2_t v23 = NUAssertLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      float64x2_t v24 = [NSString stringWithFormat:@"none of the crop rect points are on the boundary!"];
      *(_DWORD *)buf = 138543362;
      *(void *)&float64x2_t buf[4] = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v26 = NUAssertLogger();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        BOOL v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v31 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&float64x2_t buf[4] = v30;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v32;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      uint64_t v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&float64x2_t buf[4] = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"NU::Quad2d deriveScaledQuadFromConstrainedQuad(NU::Quad2d, NU::Quad2d, NU::Quad2d)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModelAlgo.mm", 333, @"none of the crop rect points are on the boundary!", v33, v34, v35, v36, v37);
  }
  float64x2_t v20 = a5;
  switch(v55)
  {
    case 0:
      goto LABEL_6;
    case 1:
      float64x2_t v20 = a6;
      goto LABEL_6;
    case 2:
      float64x2_t v20 = a7;
      goto LABEL_6;
    case 3:
      float64x2_t v20 = a8;
LABEL_6:
      v52[0] = v56;
      v52[1] = v57;
      long long v53 = v58;
      LODWORD(v53) = 1;
      float64x2_t v21 = vsubq_f64(projectionPoint((uint64_t)v52, v20), v20);
      *(float64x2_t *)buf = vaddq_f64(a5, v21);
      *(float64x2_t *)&buf[16] = vaddq_f64(a6, v21);
      float64x2_t v50 = vaddq_f64(a7, v21);
      float64x2_t v51 = vaddq_f64(a8, v21);
      __n128 v43 = *(__n128 *)buf;
      if (NU::Quad2d::simpleContains((float64x2_t *)&v44, (float64x2_t *)buf)) {
        __n128 result = v43;
      }
      else {
        __n128 result = a1;
      }
      break;
    default:
      __n128 result = *(__n128 *)MEMORY[0x1E4F1DB28];
      break;
  }
  return result;
}

void sub_1A9931E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

double aspectRatioConstrainedFromRect(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7, double a8)
{
  return aspectRatioConstrainedFromRect(a1, a2, a3, a4, a5, a6, a7, a8, a5 * a6);
}

double aspectRatioConstrainedFromRect(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7, double a8, double a9)
{
  v17.origin.CGFloat x = a3;
  v17.origin.CGFloat y = a4;
  v17.size.double width = a5;
  v17.size.double height = a6;
  double v11 = sqrt((double)a2 * a9 / (double)a1);
  double v12 = v11 / a6;
  double v13 = v11 * (double)a1 / (double)a2 / a5;
  NU::RectT<double>::RectT(&v15, &v17);
  double v15 = v15 - a7;
  double v16 = v16 - a8;
  NU::RectT<double>::scale(&v15, v13, v12);
  return a7 + v15;
}

double *NU::RectT<double>::RectT(double *a1, CGRect *a2)
{
  double MinX = CGRectGetMinX(*a2);
  double MinY = CGRectGetMinY(*a2);
  double MaxX = CGRectGetMaxX(*a2);
  double MaxY = CGRectGetMaxY(*a2);
  NU::RectT<double>::setXYMinMax(a1, MinX, MinY, MaxX, MaxY);
  return a1;
}

double NU::RectT<double>::scale(double *a1, double a2, double a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a2 < 0.0)
  {
    double v9 = NUAssertLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      float64x2_t v10 = [NSString stringWithFormat:@"Negative x-scale values not supported"];
      *(_DWORD *)buf = 138543362;
      long long v39 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v12 = NUAssertLogger();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        float64x2_t v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        float64x2_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
        int v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v39 = v23;
        __int16 v40 = 2114;
        long long v41 = v25;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      double v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v39 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<double>::scale(CGFloat, CGFloat, NUPixelRoundingPolicy) [T = double]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 289, @"Negative x-scale values not supported", v26, v27, v28, v29, v37);
  }
  if (a3 < 0.0)
  {
    double v16 = NUAssertLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      CGRect v17 = [NSString stringWithFormat:@"Negative y-scale values not supported"];
      *(_DWORD *)buf = 138543362;
      long long v39 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    float64x2_t v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int v19 = NUAssertLogger();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v20)
      {
        BOOL v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v31 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v39 = v30;
        __int16 v40 = 2114;
        long long v41 = v32;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      float64x2_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v39 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<double>::scale(CGFloat, CGFloat, NUPixelRoundingPolicy) [T = double]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 290, @"Negative y-scale values not supported", v33, v34, v35, v36, v37);
  }
  double v3 = a1[1];
  double v4 = v3 * a3;
  double v5 = *a1 * a2 + a1[2] * a2;
  double v6 = v3 * a3 + a1[3] * a3;
  double v7 = *a1 * a2;

  return NU::RectT<double>::setXYMinMax(a1, v7, v4, v5, v6);
}

void sub_1A99323B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

double NU::RectT<double>::setXYMinMax(double *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a2 > a4)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_8696);
    }
    double v6 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      double v7 = [NSString stringWithFormat:@"Cannot set min > max"];
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_8696);
    }
    double v9 = (id)_NUAssertLogger;
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        BOOL v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        float64x2_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
        int v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v36 = v20;
        __int16 v37 = 2114;
        uint64_t v38 = v22;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      double v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<double>::setXMinMax(T, T) [T = double]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 129, @"Cannot set min > max", v23, v24, v25, v26, v34);
  }
  a1[2] = a4 - a2;
  *a1 = a2;
  if (a3 > a5)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_8696);
    }
    BOOL v13 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      double v14 = [NSString stringWithFormat:@"Cannot set min > max"];
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_8696);
    }
    double v16 = (id)_NUAssertLogger;
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v15)
    {
      if (v17)
      {
        uint64_t v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v28 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v36 = v27;
        __int16 v37 = 2114;
        uint64_t v38 = v29;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      float64x2_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<double>::setYMinMax(T, T) [T = double]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 136, @"Cannot set min > max", v30, v31, v32, v33, v34);
  }
  double result = a5 - a3;
  a1[3] = a5 - a3;
  a1[1] = a3;
  return result;
}

void sub_1A99328CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t vertexIDFromPoint(const CGRect *a1, float64x2_t *a2)
{
  uint64_t v3 = 0;
  float64x2_t v8 = *a2;
  while (1)
  {
    v4.f64[0] = pointFromVertexID(a1, v3);
    v4.f64[1] = v5;
    float64x2_t v6 = vsubq_f64(v8, v4);
    if (sqrt(vaddvq_f64(vmulq_f64(v6, v6))) < 5.0) {
      break;
    }
    uint64_t v3 = (v3 + 1);
    if (v3 == 8) {
      return 0xFFFFFFFFLL;
    }
  }
  return v3;
}

double pointFromVertexID(const CGRect *a1, int a2)
{
  switch(a2)
  {
    case 0:
      double MinX = CGRectGetMinX(*a1);
      goto LABEL_8;
    case 1:
      double MinX = CGRectGetMaxX(*a1);
      goto LABEL_8;
    case 2:
      double MaxX = CGRectGetMinX(*a1);
      goto LABEL_13;
    case 3:
      double MaxX = CGRectGetMaxX(*a1);
      goto LABEL_13;
    case 4:
      double MinX = CGRectGetMidX(*a1);
LABEL_8:
      double v4 = MinX;
      CGRectGetMinY(*a1);
      return v4;
    case 5:
      double v6 = CGRectGetMaxX(*a1);
      goto LABEL_11;
    case 6:
      double v6 = CGRectGetMinX(*a1);
LABEL_11:
      double v4 = v6;
      CGRectGetMidY(*a1);
      break;
    case 7:
      double MaxX = CGRectGetMidX(*a1);
LABEL_13:
      double v4 = MaxX;
      CGRectGetMaxY(*a1);
      break;
    default:
      double v4 = -1.79769313e308;
      break;
  }
  return v4;
}

uint64_t vertexIDFromPoint(const CGRect *a1, float64x2_t *a2, double a3)
{
  uint64_t v5 = 0;
  float64x2_t v10 = *a2;
  while (1)
  {
    v6.f64[0] = pointFromVertexID(a1, v5);
    v6.f64[1] = v7;
    float64x2_t v8 = vsubq_f64(v10, v6);
    if (sqrt(vaddvq_f64(vmulq_f64(v8, v8))) < a3) {
      break;
    }
    uint64_t v5 = (v5 + 1);
    if (v5 == 8) {
      return 0xFFFFFFFFLL;
    }
  }
  return v5;
}

CGFloat PAAbsolutePointInRect(CGPoint a1, CGRect a2)
{
  return a2.origin.x + a1.x * a2.size.width;
}

BOOL canExpandWithAbsoluteAnchor(uint64_t a1, float64x2_t *a2, const CGRect *a3, float64x2_t *a4)
{
  CGFloat MidX = CGRectGetMidX(*a3);
  CGFloat MidY = CGRectGetMidY(*a3);
  a4->f64[0] = MidX;
  a4->f64[1] = MidY;
  if ((a1 & 0x10) == 0)
  {
    if ((a1 & 0x40) != 0)
    {
      *a4 = (float64x2_t)xmmword_1A9A72D10;
      *a4 = vmlaq_f64((float64x2_t)a3->origin, (float64x2_t)xmmword_1A9A72D10, (float64x2_t)a3->size);
      BOOL result = (a1 & 0x20) == 0;
      if ((a1 & 0xA0) != 0x80) {
        return result;
      }
    }
    else
    {
      if ((a1 & 0x20) != 0)
      {
        *a4 = (float64x2_t)xmmword_1A9A72D20;
        CGFloat v22 = a3->origin.y + a3->size.height * 0.5;
        a4->f64[0] = a3->origin.x + a3->size.width;
        a4->f64[1] = v22;
        if ((a1 & 0x80) == 0) {
          return 1;
        }
        goto LABEL_20;
      }
      if ((a1 & 0x80) != 0)
      {
        *a4 = (float64x2_t)xmmword_1A9A72D30;
        double x = a3->origin.x;
        double y = a3->origin.y;
        double width = a3->size.width;
        double height = a3->size.height;
        double v25 = 0.5;
LABEL_24:
        double v19 = x + width * v25;
        goto LABEL_25;
      }
      float64x2_t v10 = a2[1];
      __int32 v11 = vmovn_s64(vcgtq_f64(v10, *a2)).i32[1];
      if ((a1 & 1) == 0)
      {
        if ((a1 & 2) == 0)
        {
          if ((a1 & 4) == 0)
          {
            if ((a1 & 8) != 0)
            {
              if (a1 == 8)
              {
                __asm { FMOV            V0.2D, #1.0 }
                *(CGPoint *)a4 = _Q0;
                double y = a3->origin.y;
                double height = a3->size.height;
                double v19 = a3->origin.x + a3->size.width;
LABEL_25:
                double v21 = height + y;
LABEL_26:
                a4->f64[0] = v19;
                goto LABEL_27;
              }
              return 0;
            }
            return 1;
          }
          if (a1 == 4)
          {
            *a4 = (float64x2_t)xmmword_1A9A72CB0;
            double x = a3->origin.x;
            double y = a3->origin.y;
            double width = a3->size.width;
            double height = a3->size.height;
            double v25 = 0.0;
            goto LABEL_24;
          }
          if ((a1 & 8) == 0) {
            return 0;
          }
          if (v11) {
            goto LABEL_20;
          }
          goto LABEL_18;
        }
        if (a1 == 2)
        {
          *a4 = (float64x2_t)xmmword_1A9A72CC0;
          double v19 = a3->origin.x + a3->size.width;
          double v21 = a3->origin.y + a3->size.height * 0.0;
          goto LABEL_26;
        }
        if ((a1 & 0xC) != 8) {
          return 0;
        }
        if (v11) {
          goto LABEL_43;
        }
LABEL_20:
        a4->f64[0] = a2[3].f64[0];
        double v21 = a2[3].f64[1];
        goto LABEL_27;
      }
      if (a1 == 1)
      {
        a4->f64[0] = 0.0;
        a4->f64[1] = 0.0;
        double v19 = a3->origin.x + a3->size.width * 0.0;
        double v21 = a3->origin.y + a3->size.height * 0.0;
        goto LABEL_26;
      }
      if ((a1 & 8) != 0) {
        return 0;
      }
      if ((a1 & 4) == 0)
      {
        if ((a1 & 2) == 0) {
          return 0;
        }
        if ((v11 & 1) == 0)
        {
LABEL_43:
          a4->f64[0] = v10.f64[0];
          goto LABEL_22;
        }
        goto LABEL_45;
      }
      if ((v11 & 1) == 0)
      {
LABEL_45:
        a4->f64[0] = a2->f64[0];
        goto LABEL_16;
      }
    }
LABEL_18:
    a4->f64[0] = a2[2].f64[0];
    double v21 = a2[2].f64[1];
    goto LABEL_27;
  }
  BOOL result = 0;
  *a4 = (float64x2_t)xmmword_1A9A72D00;
  *a4 = vmlaq_f64((float64x2_t)a3->origin, (float64x2_t)xmmword_1A9A72D00, (float64x2_t)a3->size);
  if ((~(_BYTE)a1 & 0x60) != 0 && (a1 & 0x80) == 0)
  {
    if ((a1 & 0x20) != 0)
    {
      a4->f64[0] = a2[1].f64[0];
LABEL_22:
      double v21 = a2[1].f64[1];
      goto LABEL_27;
    }
    if ((a1 & 0x40) == 0) {
      return 1;
    }
    a4->f64[0] = a2->f64[0];
LABEL_16:
    double v21 = a2->f64[1];
LABEL_27:
    a4->f64[1] = v21;
    return 1;
  }
  return result;
}

uint64_t _NULogInit()
{
  os_log_t v0 = os_log_create("com.apple.photos.Neutrino", "general");
  float64x2_t v1 = (void *)_NULogger;
  _NULogger = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.photos.Neutrino", "pipeline");
  uint64_t v3 = (void *)_NUPipelineLogger;
  _NUPipelineLogger = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.photos.Neutrino", "render");
  uint64_t v5 = (void *)_NURenderLogger;
  _NURenderLogger = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.photos.Neutrino", "schedule");
  float64_t v7 = (void *)_NUScheduleLogger;
  _NUScheduleLogger = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.photos.Neutrino", "assert");
  double v9 = (void *)_NUAssertLogger;
  _NUAssertLogger = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.photos.Neutrino", "ui");
  __int32 v11 = (void *)_NUUILogger;
  _NUUILogger = (uint64_t)v10;

  _NUJSLogger = (uint64_t)os_log_create("com.apple.photos.Neutrino", "js");

  return MEMORY[0x1F41817F8]();
}

void NULogAdoptVoucher(void *a1, void *a2)
{
  id v3 = a1;
  os_log_t v4 = a2;
  voucher_adopt();
  v4[2](v4);

  uint64_t v5 = (void *)voucher_adopt();
}

void sub_1A993323C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_8992()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_8932);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

uint64_t __Block_byref_object_copy__9170(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9171(uint64_t a1)
{
}

void sub_1A9936484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id NUAssertLogger_9299()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_9324);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_9464()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_9448);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A9939690(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id NUAssertLogger_9740()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_311);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A99436F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_10096()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_10125);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

uint64_t __Block_byref_object_copy__10108(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10109(uint64_t a1)
{
}

id NUAssertLogger_10287()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_222);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_10507()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_94);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A9947C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10549(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10550(uint64_t a1)
{
}

id NUAssertLogger_10624()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_10639);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A99493A8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_10780()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_10811);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

double NU::Sum(double **this, const DataSet *a2)
{
  uint64_t v10 = 0;
  __int32 v11 = (double *)&v10;
  uint64_t v12 = 0x2000000000;
  uint64_t v13 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 0x40000000;
  float64_t v7 = ___ZN2NU3SumERKNS_7DataSetE_block_invoke;
  os_log_t v8 = &unk_1E5D94770;
  double v9 = &v10;
  os_log_t v2 = *this;
  id v3 = this[1];
  if (*this == v3)
  {
    double v4 = 0.0;
  }
  else
  {
    do
      ((void (*)(void *, const DataSet *, double))v7)(v6, a2, *v2++);
    while (v2 != v3);
    double v4 = v11[3];
  }
  _Block_object_dispose(&v10, 8);
  return v4;
}

void sub_1A994BFBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double ___ZN2NU3SumERKNS_7DataSetE_block_invoke(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = *(double *)(v2 + 24) + a2;
  *(double *)(v2 + 24) = result;
  return result;
}

double NU::Min(double **this, const DataSet *a2)
{
  uint64_t v10 = 0;
  __int32 v11 = (double *)&v10;
  uint64_t v12 = 0x2000000000;
  uint64_t v13 = 0x7FF0000000000000;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 0x40000000;
  float64_t v7 = ___ZN2NU3MinERKNS_7DataSetE_block_invoke;
  os_log_t v8 = &unk_1E5D94798;
  double v9 = &v10;
  uint64_t v2 = *this;
  id v3 = this[1];
  if (*this == v3)
  {
    double v4 = INFINITY;
  }
  else
  {
    do
      ((void (*)(void *, const DataSet *, double))v7)(v6, a2, *v2++);
    while (v2 != v3);
    double v4 = v11[3];
  }
  _Block_object_dispose(&v10, 8);
  return v4;
}

void sub_1A994C0CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN2NU3MinERKNS_7DataSetE_block_invoke(uint64_t result, double a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  if (*(double *)(v2 + 24) <= a2) {
    a2 = *(double *)(v2 + 24);
  }
  *(double *)(v2 + 24) = a2;
  return result;
}

double NU::Max(double **this, const DataSet *a2)
{
  uint64_t v10 = 0;
  __int32 v11 = (double *)&v10;
  uint64_t v12 = 0x2000000000;
  unint64_t v13 = 0xFFF0000000000000;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 0x40000000;
  float64_t v7 = ___ZN2NU3MaxERKNS_7DataSetE_block_invoke;
  os_log_t v8 = &unk_1E5D947C0;
  double v9 = &v10;
  uint64_t v2 = *this;
  id v3 = this[1];
  if (*this == v3)
  {
    double v4 = -INFINITY;
  }
  else
  {
    do
      ((void (*)(void *, const DataSet *, double))v7)(v6, a2, *v2++);
    while (v2 != v3);
    double v4 = v11[3];
  }
  _Block_object_dispose(&v10, 8);
  return v4;
}

void sub_1A994C1E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN2NU3MaxERKNS_7DataSetE_block_invoke(uint64_t result, double a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  if (*(double *)(v2 + 24) >= a2) {
    a2 = *(double *)(v2 + 24);
  }
  *(double *)(v2 + 24) = a2;
  return result;
}

double NU::Mean(double **this, const DataSet *a2)
{
  double v3 = NU::Sum(this, a2);
  uint64_t v4 = (char *)this[1] - (char *)*this;
  if (v4) {
    return v3 / (double)(v4 >> 3);
  }
  else {
    return 0.0;
  }
}

double NU::Mean(NU *this, double a2)
{
  if (this) {
    return a2 / (double)(uint64_t)this;
  }
  else {
    return 0.0;
  }
}

double NU::Variance(double **this, const DataSet *a2)
{
  double v4 = NU::Sum(this, a2);
  uint64_t v5 = (char *)this[1] - (char *)*this;
  if (v5) {
    double v6 = v4 / (double)(v5 >> 3);
  }
  else {
    double v6 = 0.0;
  }

  return NU::Variance((NU *)this, v3, v6);
}

double NU::Variance(NU *this, const NU::DataSet *a2, double a3)
{
  if (*((void *)this + 1) == *(void *)this) {
    return 0.0;
  }
  NU::operator+((uint64_t)this, (double **)v8, -a3);
  NU::Square((uint64_t)v8, (double **)__p);
  double v5 = NU::Sum((double **)__p, v4);
  if ((uint64_t)(*((void *)this + 1) - *(void *)this) >> 3 == 1) {
    double v6 = 0.0;
  }
  else {
    double v6 = v5 / (double)(((uint64_t)(*((void *)this + 1) - *(void *)this) >> 3) - 1);
  }
  if (__p[0]) {
    operator delete(__p[0]);
  }
  if (v8[0]) {
    operator delete(v8[0]);
  }
  return v6;
}

void sub_1A994C36C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  if (a9) {
    operator delete(a9);
  }
  _Unwind_Resume(exception_object);
}

double NU::StandardDeviation(double **this, const DataSet *a2)
{
  return sqrt(NU::Variance(this, a2));
}

double NU::StandardDeviation(NU *this, double a2)
{
  return sqrt(a2);
}

double NU::StandardDeviation(NU *this, const NU::DataSet *a2, double a3)
{
  return sqrt(NU::Variance(this, a2, a3));
}

double NU::StandardError(double **this, const DataSet *a2)
{
  double v3 = NU::Variance(this, a2);
  uint64_t v4 = (char *)this[1] - (char *)*this;
  if (v4) {
    return sqrt(v3) / sqrt((double)(v4 >> 3));
  }
  else {
    return 0.0;
  }
}

double NU::StandardError(NU *this, double a2)
{
  if (this) {
    return a2 / sqrt((double)(uint64_t)this);
  }
  else {
    return 0.0;
  }
}

double NU::StandardError(NU *this, const NU::DataSet *a2, double a3)
{
  double v4 = NU::Variance(this, a2, a3);
  uint64_t v5 = *((void *)this + 1) - *(void *)this;
  if (v5) {
    return sqrt(v4) / sqrt((double)(v5 >> 3));
  }
  else {
    return 0.0;
  }
}

double NU::Variation(NU *this, double a2, double a3)
{
  return a3 / a2;
}

double NU::Median(NU *this, const NU::DataSet *a2)
{
  return NU::Percentile(this, a2, 0.5);
}

double NU::Percentile(NU *this, const NU::DataSet *a2, double a3)
{
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v12, *(const void **)this, *((void *)this + 1), (uint64_t)(*((void *)this + 1) - *(void *)this) >> 3);
  double v4 = v12;
  uint64_t v5 = v13;
  std::__sort<std::__less<double,double> &,double *>();
  uint64_t v6 = (v5 - (uint64_t)v4) >> 3;
  double v7 = a3 * (double)(unint64_t)v6 + -0.5;
  if (v7 >= 0.0)
  {
    unint64_t v9 = vcvtmd_u64_f64(v7);
    unint64_t v10 = v6 - 1;
    if (v9 + 1 <= v10) {
      double v8 = v4[v9] + (v7 - (double)v9) * (v4[v9 + 1] - v4[v9]);
    }
    else {
      double v8 = v4[v10];
    }
  }
  else
  {
    double v8 = *v4;
  }
  operator delete(v4);
  return v8;
}

void sub_1A994C560(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    double result = std::vector<double>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1A994C5D8(_Unwind_Exception *exception_object)
{
  double v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x310], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<double>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  double result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void std::vector<double>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(unint64_t a1)
{
  if (a1 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E5D933D0, MEMORY[0x1E4FBA1C8]);
}

void sub_1A994C700(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

long double NU::GeometricMean(NU *this, const NU::DataSet *a2)
{
  NU::Log(this, &v6);
  double v3 = NU::Sum(&v6, v2);
  if (v7 != v6)
  {
    double v4 = v3 / (double)(v7 - v6);
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  double v4 = 0.0;
  if (v6) {
LABEL_3:
  }
    operator delete(v6);
LABEL_4:

  return exp(v4);
}

void sub_1A994C7C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

id NUAssertLogger_11009()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_30);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void NU::Quad2d::findInscribedAxisAlignedAspectFitRect(float64x2_t *a1, __n128 a2, double a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  v11[0] = *MEMORY[0x1E4F1DB28];
  v11[1] = v5;
  v10[0] = NU::Quad2d::boundingRect(a1);
  v10[1] = v6;
  void v10[2] = v7;
  v10[3] = v8;
  uint64_t v12 = &unk_1F0010030;
  __n128 v13 = a2;
  double v14 = a3;
  NU::Quad2d::computeLimitRect(a1, (uint64_t)v11, (uint64_t)v10, (uint64_t)&v12, 0.000244140625);
}

BOOL NU::centerRectFinder::converged(NU::centerRectFinder *this, const CGRect *a2, const CGRect *a3, double a4)
{
  return vabdd_f64(a2->size.height, a3->size.height) < a4;
}

double NU::centerRectFinder::constructNextRect(NU::centerRectFinder *this, const CGRect *a2, const CGRect *a3)
{
  return *((double *)this + 2)
       - *((double *)this + 4) * (a3->size.height + (a2->size.height - a3->size.height) * 0.5) * 0.5;
}

void NU::centerRectFinder::~centerRectFinder(NU::centerRectFinder *this)
{
}

float64_t NU::Quad2d::findInscribedUnscaledFitRect(NU::Quad2d *this, const CGRect *a2, float64_t a3, double a4, double a5, float64x2_t a6)
{
  a6.f64[0] = a3;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  CGSize rect = a2->size;
  v49.float64x2_t origin = a2->origin;
  float64x2_t v8 = vaddq_f64((float64x2_t)rect, (float64x2_t)a2->origin);
  *(CGFloat *)&long long v9 = a2->origin.x;
  *((void *)&v9 + 1) = *(void *)&v8.f64[1];
  long long v51 = v9;
  float64x2_t v52 = v8;
  v8.f64[1] = v49.origin.y;
  v49.CGPoint size = (CGSize)v49.origin;
  float64x2_t v50 = v8;
  float64x2_t v43 = a6;
  if (NU::Quad2d::equivalentWithTolerance((float64x2_t *)this, (float64x2_t *)&v49.size, a6.f64[0]))
  {
    origin.f64[0] = v49.origin.x;
  }
  else
  {
    int v12 = 0;
    long long v13 = *((_OWORD *)this + 1);
    v54[0] = *(_OWORD *)this;
    v54[1] = v13;
    long long v15 = *((_OWORD *)this + 2);
    long long v14 = *((_OWORD *)this + 3);
    v54[3] = v13;
    v54[4] = v14;
    v54[6] = v14;
    v54[7] = v15;
    v54[9] = v15;
    v54[10] = v54[0];
    float64x2_t origin = (float64x2_t)v49.origin;
    while (v12 != 100)
    {
      ++v12;
      CGFloat v16 = origin.f64[1];
      v56.float64x2_t origin = (CGPoint)origin;
      v56.CGPoint size = rect;
      v49.float64x2_t origin = (CGPoint)origin;
      CGFloat MinX = CGRectGetMinX(v56);
      v57.size.CGFloat width = rect.width;
      v57.origin.CGFloat x = v49.origin.x;
      v57.origin.double y = v16;
      v57.size.CGFloat height = rect.height;
      CGFloat MinY = CGRectGetMinY(v57);
      *(CGFloat *)&long long v18 = MinX;
      CGFloat width = rect.width;
      *((CGFloat *)&v18 + 1) = MinY;
      v53[0] = v18;
      CGFloat x = v49.origin.x;
      *(CGFloat *)&long long v18 = v16;
      CGFloat height = rect.height;
      CGFloat MaxX = CGRectGetMaxX(*(CGRect *)((char *)&v18 - 8));
      v58.size.CGFloat width = rect.width;
      v58.origin.CGFloat x = v49.origin.x;
      v58.origin.double y = v16;
      v58.size.CGFloat height = rect.height;
      CGFloat v22 = CGRectGetMinY(v58);
      *(CGFloat *)&long long v23 = MaxX;
      CGFloat v24 = rect.width;
      *((CGFloat *)&v23 + 1) = v22;
      v53[1] = v23;
      CGFloat v25 = v49.origin.x;
      *(CGFloat *)&long long v23 = v16;
      CGFloat v26 = rect.height;
      CGFloat v46 = CGRectGetMinX(*(CGRect *)((char *)&v23 - 8));
      v59.size.CGFloat width = rect.width;
      v59.origin.CGFloat x = v49.origin.x;
      v59.origin.double y = v16;
      v59.size.CGFloat height = rect.height;
      CGFloat MaxY = CGRectGetMaxY(v59);
      *(CGFloat *)&long long v28 = v46;
      CGFloat v29 = rect.width;
      *((CGFloat *)&v28 + 1) = MaxY;
      v53[2] = v28;
      CGFloat v30 = v49.origin.x;
      *(CGFloat *)&long long v28 = v16;
      CGFloat v31 = rect.height;
      CGFloat v47 = CGRectGetMaxX(*(CGRect *)((char *)&v28 - 8));
      v60.size.CGFloat width = rect.width;
      v60.origin.CGFloat x = v49.origin.x;
      v60.origin.double y = v16;
      v60.size.CGFloat height = rect.height;
      CGFloat v32 = CGRectGetMaxY(v60);
      *(CGFloat *)&long long v34 = v47;
      float64x2_t origin = (float64x2_t)v49.origin;
      uint64_t v35 = 0;
      *((CGFloat *)&v34 + 1) = v32;
      v53[3] = v34;
      char v36 = 1;
      do
      {
        uint64_t v37 = 0;
        uint64_t v38 = (float64x2_t *)&v54[3 * v35];
        int64x2_t v39 = (int64x2_t)vsubq_f64(v38[1], *v38);
        v33.f64[0] = -*(double *)&v39.i64[1];
        float64x2_t v40 = (float64x2_t)vzip1q_s64((int64x2_t)v33, v39);
        float64x2_t v41 = vmulq_n_f64(v40, 1.0 / sqrt(vaddvq_f64(vmulq_f64(v40, v40))));
        do
        {
          float64x2_t v33 = vmulq_f64(v41, vsubq_f64((float64x2_t)v53[v37], *v38));
          float64x2_t v42 = vaddq_f64(v33, (float64x2_t)vdupq_laneq_s64((int64x2_t)v33, 1));
          v33.f64[0] = vaddvq_f64(v33);
          float64x2_t origin = (float64x2_t)vbslq_s8((int8x16_t)vdupq_lane_s64(vcgtq_f64(v43, v42).i64[0], 0), (int8x16_t)vsubq_f64(origin, vmulq_n_f64(v41, v33.f64[0] * 0.4 - v43.f64[0])), (int8x16_t)origin);
          v36 &= v33.f64[0] >= v43.f64[0];
          ++v37;
        }
        while (v37 != 4);
        ++v35;
      }
      while (v35 != 4);
      if (v36)
      {
        if (v12 == 100) {
          float64x2_t origin = (float64x2_t)a2->origin;
        }
        return origin.f64[0];
      }
    }
  }
  return origin.f64[0];
}

BOOL NU::PathRectFinder::converged(NU::PathRectFinder *this, const CGRect *a2, const CGRect *a3, double a4)
{
  return vabdd_f64(a2->origin.x, a3->origin.x) < a4 && vabdd_f64(a2->origin.y, a3->origin.y) < a4;
}

CGFloat NU::PathRectFinder::constructNextRect(NU::PathRectFinder *this, const CGRect *a2, const CGRect *a3)
{
  return (a2->origin.x + a3->origin.x) * 0.5;
}

void NU::PathRectFinder::~PathRectFinder(NU::PathRectFinder *this)
{
}

void sub_1A994F518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void NU::Quad2d::findInscribedAxisAlignedFitRectWithAnchor(float64x2_t *a1, float64x2_t *a2, uint64_t a3, uint64_t a4)
{
  float64x2_t v26 = *(float64x2_t *)a4;
  float64x2_t v27 = *(float64x2_t *)(a4 + 16);
  float64x2_t v8 = vaddq_f64(v27, *(float64x2_t *)a4);
  v9.f64[0] = v8.f64[0];
  v9.f64[1] = *(float64_t *)(a4 + 8);
  float64x2_t v42 = v26;
  float64x2_t v43 = v9;
  float64x2_t v24 = v9;
  float64x2_t v25 = v8;
  v9.f64[0] = v26.f64[0];
  v9.f64[1] = v8.f64[1];
  float64x2_t v23 = v9;
  float64x2_t v44 = v9;
  float64x2_t v45 = v8;
  if ((NU::Quad2d::equivalentWithTolerance(a1, &v42, 0.000000953674316) & 1) == 0)
  {
    float64x2_t v38 = v26;
    float64x2_t v39 = v24;
    float64x2_t v40 = v23;
    float64x2_t v41 = v25;
    if ((NU::Quad2d::simpleContains(a1, &v38) & 1) == 0)
    {
      double v37 = v27.f64[0] / v27.f64[1];
      NU::Quad2d::findInscribedAxisAlignedAspectFitRectWithAnchor(a1, a2->f64, a3, a4, (uint64_t *)&v37, 0.000000953674316);
      double v11 = v10;
      v42.f64[0] = v12;
      v42.f64[1] = v13;
      v43.f64[0] = v10;
      v43.f64[1] = v14;
      NU::RectT<double>::RectT(v38.f64, (CGRect *)a4);
      float64x2_t v28 = *a2;
      float64x2_t v38 = vsubq_f64(v38, *a2);
      NU::RectT<double>::scale(v38.f64, v11 / v39.f64[0], 1.0);
      float64x2_t v38 = vaddq_f64(v28, v38);
      float64x2_t v35 = v38;
      float64x2_t v36 = v39;
      float64x2_t v33 = &unk_1F0010060;
      float64x2_t v34 = *a2;
      float64_t v15 = NU::Quad2d::computeLimitRect(a1, (uint64_t)&v42, (uint64_t)&v35, (uint64_t)&v33, 0.000000953674316);
      float64_t v17 = v16;
      float64_t v19 = v18;
      double v21 = v20;
      NU::RectT<double>::RectT(v32[0].f64, (CGRect *)a4);
      v42.f64[0] = v15;
      v42.f64[1] = v17;
      v43.f64[0] = v19;
      v43.f64[1] = v21;
      double v22 = v21 / *(double *)(a4 + 24);
      float64x2_t v29 = *a2;
      v32[0] = vsubq_f64(v32[0], *a2);
      NU::RectT<double>::scale(v32[0].f64, 1.0, v22);
      v32[0] = vaddq_f64(v29, v32[0]);
      float64x2_t v35 = v32[0];
      float64x2_t v36 = v32[1];
      CGFloat v30 = &unk_1F0010090;
      float64x2_t v31 = *a2;
      NU::Quad2d::computeLimitRect(a1, (uint64_t)&v42, (uint64_t)&v35, (uint64_t)&v30, 0.000000953674316);
    }
  }
}

BOOL NU::AnchorRectFinderHorizontal::converged(NU::AnchorRectFinderHorizontal *this, const CGRect *a2, const CGRect *a3, double a4)
{
  return vabdd_f64(a2->size.width, a3->size.width) < a4;
}

double NU::AnchorRectFinderHorizontal::constructNextRect(NU::AnchorRectFinderHorizontal *this, const CGRect *a2, const CGRect *a3)
{
  CGRect v11 = *a2;
  CGFloat v4 = (a3->size.width + (v11.size.width - a3->size.width) * 0.5) / v11.size.width;
  CGRect v12 = CGRectOffset(*a2, -*((double *)this + 2), -*((double *)this + 3));
  double v5 = v4 * v12.size.width;
  double v6 = v4 * v12.origin.x;
  long long v7 = *((_OWORD *)this + 1);
  CGFloat v8 = *((double *)this + 3);

  *(void *)&double result = (unint64_t)CGRectOffset(*(CGRect *)&v6, *(CGFloat *)&v7, v8);
  return result;
}

void NU::AnchorRectFinderHorizontal::~AnchorRectFinderHorizontal(NU::AnchorRectFinderHorizontal *this)
{
}

BOOL NU::AnchorRectFinderVertical::converged(NU::AnchorRectFinderVertical *this, const CGRect *a2, const CGRect *a3, double a4)
{
  return vabdd_f64(a2->size.height, a3->size.height) < a4;
}

double NU::AnchorRectFinderVertical::constructNextRect(NU::AnchorRectFinderVertical *this, const CGRect *a2, const CGRect *a3)
{
  CGRect v11 = *a2;
  CGFloat v4 = (a3->size.height + (v11.size.height - a3->size.height) * 0.5) / v11.size.height;
  CGRect v12 = CGRectOffset(*a2, -*((double *)this + 2), -*((double *)this + 3));
  double v5 = v4 * v12.size.height;
  double v6 = v4 * v12.origin.y;
  long long v7 = *((_OWORD *)this + 1);
  CGFloat v8 = *((double *)this + 3);

  *(void *)&double result = (unint64_t)CGRectOffset(v12, *(CGFloat *)&v7, v8);
  return result;
}

void NU::AnchorRectFinderVertical::~AnchorRectFinderVertical(NU::AnchorRectFinderVertical *this)
{
}

void sub_1A99501F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A9950AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

double _bestIntegralRectPreservingAspectRatioAndAnchor(CGRect a1, CGPoint a2)
{
  double v2 = nearbyint(a1.size.width * nearbyint(a1.size.height) / a1.size.height);
  double v3 = nearbyint(a1.size.width);
  if (a1.size.width > a1.size.height) {
    double v2 = v3;
  }
  return nearbyint(a1.origin.x + a2.x * (a1.size.width - v2));
}

void sub_1A9951370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995158C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9951600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9951B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9952274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A99523EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995282C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9952D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9953060(_Unwind_Exception *a1)
{
  double v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1A99532FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL CGRectEqualToRectWithTol(CGRect a1, CGRect a2, double a3)
{
  return vabdd_f64(a1.origin.x, a2.origin.x) < a3
      && vabdd_f64(a1.origin.y, a2.origin.y) < a3
      && vabdd_f64(a1.size.width, a2.size.width) < a3
      && vabdd_f64(a1.size.height, a2.size.height) < a3;
}

__n128 makeTranslationMatrix@<Q0>(__n128 result@<Q0>, double a2@<D1>, double a3@<D2>, uint64_t a4@<X8>)
{
  CGFloat v4 = (_OWORD *)MEMORY[0x1E4F14990];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F14990] + 80);
  *(_OWORD *)(a4 + 64) = *(_OWORD *)(MEMORY[0x1E4F14990] + 64);
  *(_OWORD *)(a4 + 80) = v5;
  long long v6 = v4[1];
  *(_OWORD *)a4 = *v4;
  *(_OWORD *)(a4 + 16) = v6;
  long long v7 = v4[3];
  *(_OWORD *)(a4 + 32) = v4[2];
  *(_OWORD *)(a4 + 4_Block_object_dispose(&STACK[0x310], 8) = v7;
  long long v8 = v4[7];
  result.n128_f64[1] = a2;
  *(__n128 *)(a4 + 96) = result;
  *(_OWORD *)(a4 + 112) = v8;
  *(double *)(a4 + 112) = a3;
  return result;
}

double convertTo2D(const simd_double4x4 *a1)
{
  for (uint64_t i = 0; i != 4; ++i)
    *(&v3 + i) = (__int128)vdivq_f64(*(float64x2_t *)a1->columns[i].f64, (float64x2_t)vdupq_laneq_s64(*(int64x2_t *)&a1->columns[i].f64[2], 1));
  return *(double *)&v3;
}

void sub_1A99540F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A99548B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9955258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  _Unwind_Resume(a1);
}

void sub_1A9955470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A99555A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A99558E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  _Unwind_Resume(a1);
}

void sub_1A9955A08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9955B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1A9955D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A99563D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, id a12)
{
  _Unwind_Resume(a1);
}

uint64_t *nu::fill_rect<NUPixelRect>(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t *a4, unsigned __int8 *a5, uint64_t a6)
{
  switch(a6)
  {
    case 1:
      uint64_t v8 = result[2];
      uint64_t v7 = result[3];
      BOOL v9 = v8 < 1 || v7 < 1;
      if (!v9)
      {
        uint64_t v11 = a4[2];
        uint64_t v10 = a4[3];
        if (v11 >= 1 && v10 >= 1)
        {
          uint64_t v13 = *result;
          if (*result <= *a4) {
            uint64_t v14 = *a4;
          }
          else {
            uint64_t v14 = *result;
          }
          uint64_t v15 = v13 + v8;
          uint64_t v16 = *a4 + v11;
          if (v15 >= v16) {
            uint64_t v15 = v16;
          }
          int64_t v17 = v15 - v14;
          if (v15 > v14)
          {
            uint64_t v18 = result[1];
            uint64_t v19 = a4[1];
            if (v18 <= v19) {
              uint64_t v20 = a4[1];
            }
            else {
              uint64_t v20 = result[1];
            }
            uint64_t v21 = v18 + v7;
            uint64_t v22 = v19 + v10;
            if (v21 >= v22) {
              uint64_t v21 = v22;
            }
            if (v21 > v20 && v17 >= 1 && v21 - v20 >= 1)
            {
              int v23 = *a5;
              float64x2_t v24 = (char *)(a2 + (v20 - v18) * a3 + v14 - v13);
              uint64_t v25 = v20 - v21;
              do
              {
                double result = (uint64_t *)memset(v24, v23, v17);
                v24 += a3;
              }
              while (!__CFADD__(v25++, 1));
            }
          }
        }
      }
      break;
    case 2:
      uint64_t v28 = result[2];
      uint64_t v27 = result[3];
      if (v28 >= 1 && v27 >= 1)
      {
        uint64_t v31 = a4[2];
        uint64_t v30 = a4[3];
        if (v31 >= 1 && v30 >= 1)
        {
          uint64_t v33 = *result;
          if (*result <= *a4) {
            uint64_t v34 = *a4;
          }
          else {
            uint64_t v34 = *result;
          }
          uint64_t v35 = v33 + v28;
          uint64_t v36 = *a4 + v31;
          if (v35 >= v36) {
            uint64_t v35 = v36;
          }
          BOOL v9 = v35 <= v34;
          uint64_t v37 = v35 - v34;
          if (!v9)
          {
            uint64_t v38 = result[1];
            uint64_t v39 = a4[1];
            if (v38 <= v39) {
              uint64_t v40 = a4[1];
            }
            else {
              uint64_t v40 = result[1];
            }
            uint64_t v41 = v38 + v27;
            uint64_t v42 = v39 + v30;
            if (v41 >= v42) {
              uint64_t v41 = v42;
            }
            BOOL v9 = v41 <= v40;
            uint64_t v43 = v41 - v40;
            if (!v9 && v37 >= 1 && v43 >= 1)
            {
              __int16 v44 = *(_WORD *)a5;
              uint64_t v45 = a2 + (v40 - v38) * a3 + 2 * (v34 - v33);
              unint64_t v46 = v37 + 1;
              do
              {
                uint64_t v47 = 0;
                unint64_t v48 = v46;
                do
                {
                  *(_WORD *)(v45 + v47) = v44;
                  v47 += 2;
                  --v48;
                }
                while (v48 > 1);
                v45 += a3;
                --v43;
              }
              while (v43);
            }
          }
        }
      }
      break;
    case 3:
      uint64_t v50 = result[2];
      uint64_t v49 = result[3];
      if (v50 >= 1 && v49 >= 1)
      {
        uint64_t v53 = a4[2];
        uint64_t v52 = a4[3];
        if (v53 >= 1 && v52 >= 1)
        {
          uint64_t v55 = *result;
          if (*result <= *a4) {
            uint64_t v56 = *a4;
          }
          else {
            uint64_t v56 = *result;
          }
          uint64_t v57 = v55 + v50;
          uint64_t v58 = *a4 + v53;
          if (v57 >= v58) {
            uint64_t v57 = v58;
          }
          BOOL v9 = v57 <= v56;
          uint64_t v59 = v57 - v56;
          if (!v9)
          {
            uint64_t v60 = result[1];
            uint64_t v61 = a4[1];
            if (v60 <= v61) {
              uint64_t v62 = a4[1];
            }
            else {
              uint64_t v62 = result[1];
            }
            uint64_t v63 = v60 + v49;
            uint64_t v64 = v61 + v52;
            if (v63 >= v64) {
              uint64_t v63 = v64;
            }
            BOOL v9 = v63 <= v62;
            uint64_t v65 = v63 - v62;
            if (!v9 && v59 >= 1 && v65 >= 1)
            {
              int v66 = *(unsigned __int16 *)a5 | (a5[2] << 16);
              uint64_t v67 = a2 + (v62 - v60) * a3 + 3 * (v56 - v55);
              do
              {
                uint64_t v68 = 0;
                unint64_t v69 = 3 * v59 / 3uLL + 1;
                do
                {
                  uint64_t v70 = v67 + v68;
                  *(unsigned char *)(v70 + 2) = BYTE2(v66);
                  *(_WORD *)uint64_t v70 = v66;
                  v68 += 3;
                  --v69;
                }
                while (v69 > 1);
                v67 += a3;
                --v65;
              }
              while (v65);
            }
          }
        }
      }
      break;
    case 4:
      uint64_t v72 = result[2];
      uint64_t v71 = result[3];
      if (v72 >= 1 && v71 >= 1)
      {
        uint64_t v75 = a4[2];
        uint64_t v74 = a4[3];
        if (v75 >= 1 && v74 >= 1)
        {
          uint64_t v77 = *result;
          if (*result <= *a4) {
            uint64_t v78 = *a4;
          }
          else {
            uint64_t v78 = *result;
          }
          uint64_t v79 = v77 + v72;
          uint64_t v80 = *a4 + v75;
          if (v79 >= v80) {
            uint64_t v79 = v80;
          }
          BOOL v9 = v79 <= v78;
          uint64_t v81 = v79 - v78;
          if (!v9)
          {
            uint64_t v82 = result[1];
            uint64_t v83 = a4[1];
            if (v82 <= v83) {
              uint64_t v84 = a4[1];
            }
            else {
              uint64_t v84 = result[1];
            }
            uint64_t v85 = v82 + v71;
            uint64_t v86 = v83 + v74;
            if (v85 >= v86) {
              uint64_t v85 = v86;
            }
            BOOL v9 = v85 <= v84;
            uint64_t v87 = v85 - v84;
            if (!v9 && v81 >= 1 && v87 >= 1)
            {
              int v88 = *(_DWORD *)a5;
              uint64_t v89 = a2 + (v84 - v82) * a3 + 4 * (v78 - v77);
              uint64_t v90 = (v81 & 0x3FFFFFFFFFFFFFFFLL) + 1;
              do
              {
                uint64_t v91 = 0;
                unint64_t v92 = v90;
                do
                {
                  *(_DWORD *)(v89 + v91) = v88;
                  v91 += 4;
                  --v92;
                }
                while (v92 > 1);
                v89 += a3;
                --v87;
              }
              while (v87);
            }
          }
        }
      }
      break;
    case 6:
      uint64_t v94 = result[2];
      uint64_t v93 = result[3];
      if (v94 >= 1 && v93 >= 1)
      {
        uint64_t v97 = a4[2];
        uint64_t v96 = a4[3];
        if (v97 >= 1 && v96 >= 1)
        {
          uint64_t v99 = *result;
          if (*result <= *a4) {
            uint64_t v100 = *a4;
          }
          else {
            uint64_t v100 = *result;
          }
          uint64_t v101 = v99 + v94;
          uint64_t v102 = *a4 + v97;
          if (v101 >= v102) {
            uint64_t v101 = v102;
          }
          BOOL v9 = v101 <= v100;
          uint64_t v103 = v101 - v100;
          if (!v9)
          {
            uint64_t v104 = result[1];
            uint64_t v105 = a4[1];
            if (v104 <= v105) {
              uint64_t v106 = a4[1];
            }
            else {
              uint64_t v106 = result[1];
            }
            uint64_t v107 = v104 + v93;
            uint64_t v108 = v105 + v96;
            if (v107 >= v108) {
              uint64_t v107 = v108;
            }
            BOOL v9 = v107 <= v106;
            uint64_t v109 = v107 - v106;
            if (!v9 && v103 >= 1 && v109 >= 1)
            {
              unint64_t v110 = *(unsigned int *)a5 | ((unint64_t)*((unsigned __int16 *)a5 + 2) << 32);
              uint64_t v111 = a2 + (v106 - v104) * a3 + 6 * (v100 - v99);
              do
              {
                uint64_t v112 = 0;
                unint64_t v113 = 6 * v103 / 6uLL + 1;
                do
                {
                  uint64_t v114 = v111 + v112;
                  *(_DWORD *)uint64_t v114 = v110;
                  *(_WORD *)(v114 + 4) = WORD2(v110);
                  v112 += 6;
                  --v113;
                }
                while (v113 > 1);
                v111 += a3;
                --v109;
              }
              while (v109);
            }
          }
        }
      }
      break;
    case 8:
      uint64_t v116 = result[2];
      uint64_t v115 = result[3];
      if (v116 >= 1 && v115 >= 1)
      {
        uint64_t v119 = a4[2];
        uint64_t v118 = a4[3];
        if (v119 >= 1 && v118 >= 1)
        {
          uint64_t v121 = *result;
          if (*result <= *a4) {
            uint64_t v122 = *a4;
          }
          else {
            uint64_t v122 = *result;
          }
          uint64_t v123 = v121 + v116;
          uint64_t v124 = *a4 + v119;
          if (v123 >= v124) {
            uint64_t v123 = v124;
          }
          BOOL v9 = v123 <= v122;
          uint64_t v125 = v123 - v122;
          if (!v9)
          {
            uint64_t v126 = result[1];
            uint64_t v127 = a4[1];
            if (v126 <= v127) {
              uint64_t v128 = a4[1];
            }
            else {
              uint64_t v128 = result[1];
            }
            uint64_t v129 = v126 + v115;
            uint64_t v130 = v127 + v118;
            if (v129 >= v130) {
              uint64_t v129 = v130;
            }
            BOOL v9 = v129 <= v128;
            uint64_t v131 = v129 - v128;
            if (!v9 && v125 >= 1 && v131 >= 1)
            {
              uint64_t v132 = *(void *)a5;
              uint64_t v133 = a2 + (v128 - v126) * a3 + 8 * (v122 - v121);
              uint64_t v134 = (v125 & 0x1FFFFFFFFFFFFFFFLL) + 1;
              do
              {
                uint64_t v135 = 0;
                unint64_t v136 = v134;
                do
                {
                  *(void *)(v133 + v135) = v132;
                  v135 += 8;
                  --v136;
                }
                while (v136 > 1);
                v133 += a3;
                --v131;
              }
              while (v131);
            }
          }
        }
      }
      break;
    case 12:
      uint64_t v138 = result[2];
      uint64_t v137 = result[3];
      if (v138 >= 1 && v137 >= 1)
      {
        uint64_t v141 = a4[2];
        uint64_t v140 = a4[3];
        if (v141 >= 1 && v140 >= 1)
        {
          uint64_t v143 = *result;
          if (*result <= *a4) {
            uint64_t v144 = *a4;
          }
          else {
            uint64_t v144 = *result;
          }
          uint64_t v145 = v143 + v138;
          uint64_t v146 = *a4 + v141;
          if (v145 >= v146) {
            uint64_t v145 = v146;
          }
          uint64_t v147 = v145 - v144;
          if (v145 > v144)
          {
            uint64_t v148 = result[1];
            uint64_t v149 = a4[1];
            if (v148 <= v149) {
              uint64_t v150 = a4[1];
            }
            else {
              uint64_t v150 = result[1];
            }
            uint64_t v151 = v148 + v137;
            uint64_t v152 = v149 + v140;
            if (v151 >= v152) {
              uint64_t v151 = v152;
            }
            BOOL v9 = v151 <= v150;
            uint64_t v153 = v151 - v150;
            if (!v9 && v147 >= 1 && v153 >= 1)
            {
              uint64_t v154 = *(void *)a5;
              int v155 = *((_DWORD *)a5 + 2);
              uint64_t v156 = a2 + (v150 - v148) * a3 + 12 * (v144 - v143);
              unint64_t v157 = 12 * v147 / 0xCuLL + 1;
              do
              {
                uint64_t v158 = 0;
                unint64_t v159 = v157;
                do
                {
                  uint64_t v160 = v156 + v158;
                  *(void *)uint64_t v160 = v154;
                  *(_DWORD *)(v160 + _Block_object_dispose(&STACK[0x310], 8) = v155;
                  v158 += 12;
                  --v159;
                }
                while (v159 > 1);
                v156 += a3;
                --v153;
              }
              while (v153);
            }
          }
        }
      }
      break;
    case 16:
      uint64_t v162 = result[2];
      uint64_t v161 = result[3];
      if (v162 >= 1 && v161 >= 1)
      {
        uint64_t v165 = a4[2];
        uint64_t v164 = a4[3];
        if (v165 >= 1 && v164 >= 1)
        {
          uint64_t v167 = *result;
          if (*result <= *a4) {
            uint64_t v168 = *a4;
          }
          else {
            uint64_t v168 = *result;
          }
          uint64_t v169 = v167 + v162;
          uint64_t v170 = *a4 + v165;
          if (v169 >= v170) {
            uint64_t v169 = v170;
          }
          BOOL v9 = v169 <= v168;
          uint64_t v171 = v169 - v168;
          if (!v9)
          {
            uint64_t v172 = result[1];
            uint64_t v173 = a4[1];
            if (v172 <= v173) {
              uint64_t v174 = a4[1];
            }
            else {
              uint64_t v174 = result[1];
            }
            uint64_t v175 = v172 + v161;
            uint64_t v176 = v173 + v164;
            if (v175 >= v176) {
              uint64_t v175 = v176;
            }
            BOOL v9 = v175 <= v174;
            uint64_t v177 = v175 - v174;
            if (!v9 && v171 >= 1 && v177 >= 1)
            {
              long long v178 = *(_OWORD *)a5;
              uint64_t v179 = a2 + (v174 - v172) * a3 + 16 * (v168 - v167);
              uint64_t v180 = (v171 & 0xFFFFFFFFFFFFFFFLL) + 1;
              do
              {
                uint64_t v181 = 0;
                unint64_t v182 = v180;
                do
                {
                  *(_OWORD *)(v179 + v181) = v178;
                  v181 += 16;
                  --v182;
                }
                while (v182 > 1);
                v179 += a3;
                --v177;
              }
              while (v177);
            }
          }
        }
      }
      break;
    default:
      return result;
  }
  return result;
}

void sub_1A9957264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9957498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995755C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9957DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A99580AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A9958178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A99589D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9958CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A9958D8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995A630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, uint64_t a12, uint64_t a13)
{
  _Unwind_Resume(a1);
}

void sub_1A995B30C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _Unwind_Exception *exception_object, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  _Unwind_Resume(a1);
}

void sub_1A995B594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A995B6F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995BA18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995BD34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A995C08C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995C19C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995C2B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995C388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995C5E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A995CA6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A995CD08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A995D018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995D130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995D1D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995D2DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995D588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995D888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995DB88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995DCA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A995DD50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995E044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995E720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A995EA94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A995ED5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A995EE70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995F2C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A995F568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A995F884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995F9F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995FB14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A995FC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A995FD48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9960050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1A996016C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9960420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A99605E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9960700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9960760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)NUPurgeableImageAccessGuard;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_1A9960850(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A996090C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id NUAssertLogger_11920()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11937);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_12242()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_12267);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_12311()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_12332);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A9969DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A996A040(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id NUAssertLogger_12593()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_12606);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A996A480(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id NUAssertLogger_12764()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_12777);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A996F57C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_12849()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_12864);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

uint64_t __Block_byref_object_copy__12873(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12874(uint64_t a1)
{
}

id NUAssertLogger_13023()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_13043);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_13139()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_13154);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_13336()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_584);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A9973FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t __Block_byref_object_copy__13453(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13454(uint64_t a1)
{
}

id NUMediaCharacteristicForAuxiliaryImageType(uint64_t a1)
{
  uint64_t v2 = a1 - 2;
  if (unint64_t)(a1 - 2) <= 9 && ((0x387u >> v2))
  {
    id v3 = **((id **)&unk_1E5D94CE0 + v2);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

void sub_1A99752E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1A9975A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v41 - 192), 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 256), 8);
  _Block_object_dispose((const void *)(v41 - 224), 8);
  _Unwind_Resume(a1);
}

BOOL __NUCMSampleBufferIsSyncSample_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F1F1D8]];
  BOOL v3 = v2 != 0;

  return v3;
}

void sub_1A9977170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A997A2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A997AB4C(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    void *v2 = +[NUError errorWithCode:1 reason:@"AVAssetReaderVideoCompositionOutput: exception" object:v3];

    objc_end_catch();
    JUMPOUT(0x1A997A924);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A997C64C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

void sub_1A997CBC8()
{
}

__CFString *NUStringFromTimeRange(_OWORD *a1)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v2 = a1[1];
  *(_OWORD *)&v5.start.value = *a1;
  *(_OWORD *)&v5.start.epoch = v2;
  *(_OWORD *)&v5.duration.timescale = a1[2];
  id v3 = (__CFString *)CMTimeRangeCopyDescription(v1, &v5);

  return v3;
}

void NUCVImageBufferSetCleanRect(__CVBuffer *a1, uint64_t *a2)
{
  v14[4] = *MEMORY[0x1E4F143B8];
  double Width = (double)CVPixelBufferGetWidth(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  double v6 = (double)*a2 - (Width - (double)a2[2]) * 0.5;
  double v7 = ((double)Height - (double)a2[3]) * 0.5 - (double)a2[1];
  v13[0] = *MEMORY[0x1E4F24A88];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:");
  v14[0] = v8;
  v13[1] = *MEMORY[0x1E4F24A68];
  BOOL v9 = [NSNumber numberWithInteger:a2[3]];
  v14[1] = v9;
  v13[2] = *MEMORY[0x1E4F24A70];
  uint64_t v10 = [NSNumber numberWithDouble:v6];
  v14[2] = v10;
  v13[3] = *MEMORY[0x1E4F24A80];
  uint64_t v11 = [NSNumber numberWithDouble:v7];
  v14[3] = v11;
  CGRect v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  CVBufferSetAttachment(a1, (CFStringRef)*MEMORY[0x1E4F24A78], v12, kCVAttachmentMode_ShouldPropagate);
}

__CFString *NUStringFromTime(CMTime *a1)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTime v4 = *a1;
  long long v2 = (__CFString *)CMTimeCopyDescription(v1, &v4);

  return v2;
}

id NUStringFromTimeMapping(_OWORD *a1)
{
  long long v2 = a1[1];
  *(_OWORD *)&range.start.value = *a1;
  *(_OWORD *)&range.start.epoch = v2;
  *(_OWORD *)&range.duration.timescale = a1[2];
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTime v4 = (__CFString *)CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &range);
  long long v5 = a1[4];
  *(_OWORD *)&range.start.value = a1[3];
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = a1[5];
  double v6 = (__CFString *)CMTimeRangeCopyDescription(v3, &range);
  double v7 = [NSString stringWithFormat:@"[%@ -> %@]", v4, v6];

  return v7;
}

id NUValueFromArrayAtTime(void *a1, CMTime *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (![v3 count])
  {
    uint64_t v13 = NUAssertLogger_13336();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [NSString stringWithFormat:@"array is empty"];
      LODWORD(time2.value) = 138543362;
      *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time2, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v16 = NUAssertLogger_13336();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        uint64_t v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        int v23 = [v21 callStackSymbols];
        float64x2_t v24 = [v23 componentsJoinedByString:@"\n"];
        LODWORD(time2.value) = 138543618;
        *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v20;
        LOWORD(time2.flags) = 2114;
        *(void *)((char *)&time2.flags + 2) = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time2, 0x16u);
      }
    }
    else if (v17)
    {
      uint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
      LODWORD(time2.value) = 138543362;
      *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time2, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"id  _Nonnull NUValueFromArrayAtTime(NSArray *__strong _Nonnull, CMTime)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 2667, @"array is empty", v25, v26, v27, v28, v29);
  }
  id v4 = [v3 firstObject];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    while (2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = v4;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
        if (v11) {
          [*(id *)(*((void *)&v31 + 1) + 8 * v9) time];
        }
        else {
          memset(&time1, 0, sizeof(time1));
        }
        CMTime time2 = *a2;
        if (CMTimeCompare(&time1, &time2) > 0)
        {
          id v4 = v10;
          goto LABEL_15;
        }
        id v4 = v11;

        ++v9;
        uint64_t v10 = v4;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v4;
}

id NUAssertLogger_13838()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_13850);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_14000()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_308_14014);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A9984C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14054(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14055(uint64_t a1)
{
}

void sub_1A9986968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A998B0C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __NURenderNodeDictionaryHash_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^= 0x18482028EBA975 * [a2 hash];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^= 0x20E47795B02877 * (void)a3;
}

void sub_1A998B358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __NURenderNodeDictionaryEqual_block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = [v7 objectForKeyedSubscript:a2];

  if (v9 != v8)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

id NUAssertLogger_14509()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_14526);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A998D568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14581(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14582(uint64_t a1)
{
}

void sub_1A9990944(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id NUAssertLogger_14834()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_14851);
  }
  os_log_t v0 = (void *)_NUAssertLogger;

  return v0;
}

__CVBuffer *nu_CVPixelBufferDataProviderReleaseBytePointer(__CVBuffer *result, uint64_t a2)
{
  if (a2) {
    return (__CVBuffer *)CVPixelBufferUnlockBaseAddress(result, 1uLL);
  }
  return result;
}

void *nu_CVPixelBufferDataProviderGetBytePointer(__CVBuffer *a1)
{
  if (CVPixelBufferLockBaseAddress(a1, 1uLL)) {
    return 0;
  }

  return CVPixelBufferGetBaseAddress(a1);
}

uint64_t ImageIOLibraryCore_14948()
{
  if (!ImageIOLibraryCore_frameworkLibrary_14964) {
    ImageIOLibraryCore_frameworkLibrary_14964 = _sl_dlopen();
  }
  return ImageIOLibraryCore_frameworkLibrary_14964;
}

uint64_t getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc_ptr;
  uint64_t v6 = getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc_ptr;
  if (!getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc_block_invoke;
    v2[3] = &unk_1E5D94DB0;
    v2[4] = &v3;
    __getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc_block_invoke(v2);
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A9996560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getkCGImageAuxiliaryDataInfoPixelBuffer()
{
  if (!getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc())
  {
    uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
    CFAllocatorRef v1 = [NSString stringWithUTF8String:"CFStringRef getkCGImageAuxiliaryDataInfoPixelBuffer(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"NUAuxiliaryImage.m", 31, @"%s", dlerror());

    __break(1u);
  }
}

void *__getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc_block_invoke(void *a1)
{
  uint64_t v2 = ImageIOLibraryCore_14948();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
  }
  else
  {
    a1 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *ImageIOLibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v3, @"NUAuxiliaryImage.m", 30, @"%s", 0);

    __break(1u);
    free(v5);
  }
  double result = dlsym(v3, "kCGImageAuxiliaryDataInfoPixelBuffer");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc_ptr = *(void *)(*(void *)(a1[4] + 8) + 24);
  return result;
}

uint64_t __ImageIOLibraryCore_block_invoke_14965()
{
  uint64_t result = _sl_dlopen();
  ImageIOLibraryCore_frameworkLibrary_14964 = result;
  return result;
}

void _NUAuxiliaryImageCVPixelBufferReleaseBytesCallback(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

CFMutableDictionaryRef NUIORegistryEntryCopyProperties(io_registry_entry_t a1)
{
  kern_return_t v1;
  kern_return_t v2;
  NSObject *v3;
  CFMutableDictionaryRef v4;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  kern_return_t v8;
  uint64_t v9;
  uint64_t vars8;

  id v9 = *MEMORY[0x1E4F143B8];
  properties = 0;
  CFAllocatorRef v1 = IORegistryEntryCreateCFProperties(a1, &properties, 0, 0);
  if (v1)
  {
    uint64_t v2 = v1;
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_15015);
    }
    uint64_t v3 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      id v8 = v2;
      _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Failed to read IORegistry, error: %d", buf, 8u);
    }
    id v4 = 0;
  }
  else
  {
    id v4 = properties;
  }

  return v4;
}

id NUIORegistryEntryGetProperty(io_registry_entry_t a1, const __CFString *a2)
{
  CFPropertdouble y = (void *)IORegistryEntryCreateCFProperty(a1, a2, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);

  return CFProperty;
}

id NUIORegistryEntryGetDataProperty(io_registry_entry_t a1, const __CFString *a2)
{
  CFPropertdouble y = (void *)IORegistryEntryCreateCFProperty(a1, a2, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = CFProperty;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id NUIORegistryEntryGetStringProperty(io_registry_entry_t a1, const __CFString *a2)
{
  CFPropertdouble y = (void *)IORegistryEntryCreateCFProperty(a1, a2, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = CFProperty;
LABEL_5:
    id v4 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(NSString, "stringWithCString:encoding:", objc_msgSend(CFProperty, "bytes"), 30);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  id v4 = 0;
LABEL_7:

  return v4;
}

id NUIORegistryEntryGetName(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(v7, 0, sizeof(v7));
  int v1 = MEMORY[0x1AD0FA1F0](a1, v7);
  if (v1)
  {
    int v2 = v1;
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_15015);
    }
    id v3 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = v2;
      _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Failed to read IORegistry, error: %d", (uint8_t *)v6, 8u);
    }
    id v4 = 0;
  }
  else
  {
    id v4 = [NSString stringWithCString:v7 encoding:30];
  }

  return v4;
}

id NUAssertLogger_15096()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_15125);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_15272()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_15285);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A9998394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t NUPixelSizeFromCGSize(uint64_t a1, double a2, double a3)
{
  uint64_t v5 = NUPixelRoundValue(a1, a2);
  NUPixelRoundValue(a1, a3);
  return v5;
}

uint64_t NUPixelRoundValue(uint64_t result, double a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  switch(result)
  {
    case 0:
      uint64_t result = vcvtpd_s64_f64(a2);
      break;
    case 1:
      uint64_t result = vcvtmd_s64_f64(a2);
      break;
    case 2:
      uint64_t result = llround(a2);
      break;
    case 3:
      uint64_t result = (uint64_t)a2;
      break;
    case 4:
      int v2 = NUAssertLogger();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        id v3 = [NSString stringWithFormat:@"Unsupported rounding policy: OutEven"];
        *(_DWORD *)buf = 138543362;
        uint64_t v18 = v3;
        _os_log_error_impl(&dword_1A9892000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      uint64_t v5 = NUAssertLogger();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v6)
        {
          id v9 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          uint64_t v10 = [MEMORY[0x1E4F29060] callStackSymbols];
          uint64_t v11 = [v10 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          uint64_t v18 = v9;
          __int16 v19 = 2114;
          uint64_t v20 = v11;
          _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v6)
      {
        uint64_t v7 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v8 = [v7 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        uint64_t v18 = v8;
        _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"NSInteger NUPixelRoundValue(CGFloat, NUPixelRoundingPolicy)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometry.mm", 35, @"Unsupported rounding policy: OutEven", v12, v13, v14, v15, v16);
    default:
      return result;
  }
  return result;
}

void sub_1A999B53C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

double NUPixelSizeToCGSize(uint64_t a1)
{
  return (double)a1;
}

double NUPixelSizeToCGRect()
{
  return *MEMORY[0x1E4F1DAD8];
}

BOOL NUPixelSizeEqualToSize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

BOOL NUPixelSizeIsEmpty(uint64_t a1, uint64_t a2)
{
  return !a1 || a2 == 0;
}

uint64_t NUPixelSizeLargestDimension(uint64_t result, uint64_t a2)
{
  if (result <= a2) {
    return a2;
  }
  return result;
}

BOOL NUPixelSizeGreaterThanSize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 >= a3 && a2 >= a4;
}

uint64_t NUPixelSizeAlignToGrid(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = NUPixelRoundValue(a5, (double)a1 / (double)a3) * a3;
  NUPixelRoundValue(a5, (double)a2 / (double)a4);
  return v8;
}

uint64_t NUPixelPointFromCGPoint(uint64_t a1, double a2, double a3)
{
  uint64_t v5 = NUPixelRoundValue(a1, a2);
  NUPixelRoundValue(a1, a3);
  return v5;
}

double NUPixelPointToCGPoint(uint64_t a1)
{
  return (double)a1;
}

BOOL NUPixelPointEqualToPoint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

double NUPixelRectContainingPoints@<D0>(float64x2_t *a1@<X0>, int a2@<W1>, _OWORD *a3@<X8>)
{
  float64x2_t v4 = *a1;
  if (a2 < 2)
  {
    CGPoint v7 = (CGPoint)*a1;
  }
  else
  {
    uint64_t v5 = a2 - 1;
    BOOL v6 = a1 + 1;
    CGPoint v7 = (CGPoint)*a1;
    do
    {
      float64x2_t v8 = *v6++;
      float64x2_t v4 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v8, v4), (int8x16_t)v8, (int8x16_t)v4);
      CGPoint v7 = (CGPoint)vbslq_s8((int8x16_t)vcgtq_f64(v8, (float64x2_t)v7), (int8x16_t)v7, (int8x16_t)v8);
      --v5;
    }
    while (v5);
  }
  v12.float64x2_t origin = v7;
  v12.CGPoint size = (CGSize)vsubq_f64(v4, (float64x2_t)v7);
  NU::RectT<long>::RectT(v11, &v12, 0);
  double result = *(double *)v11;
  long long v10 = v11[1];
  *a3 = v11[0];
  a3[1] = v10;
  return result;
}

void *NU::RectT<long>::RectT(void *a1, CGRect *a2, uint64_t a3)
{
  double MinX = CGRectGetMinX(*a2);
  double MinY = CGRectGetMinY(*a2);
  double MaxX = CGRectGetMaxX(*a2);
  double MaxY = CGRectGetMaxY(*a2);
  NU::RectT<long>::setXYMinMax(a1, a3, MinX, MinY, MaxX, MaxY);
  return a1;
}

void *NU::RectT<long>::setXYMinMax(void *result, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (uint64_t)result;
  switch(a2)
  {
    case 0:
      NU::RectT<long>::setXMinMax(result, vcvtmd_s64_f64(a3 + 0.000001), vcvtpd_s64_f64(a5 + -0.000001));
      uint64_t v9 = vcvtmd_s64_f64(a4 + 0.000001);
      uint64_t v10 = vcvtpd_s64_f64(a6 + -0.000001);
      goto LABEL_20;
    case 1:
      uint64_t v15 = vcvtpd_s64_f64(a3 + -0.000001);
      if (a5 - a3 >= 1.000002)
      {
        double result = NU::RectT<long>::setXMinMax(result, v15, vcvtmd_s64_f64(a5 + 0.000001));
      }
      else
      {
        *double result = v15;
        result[2] = 0;
      }
      uint64_t v9 = vcvtpd_s64_f64(a4 + -0.000001);
      if (a6 - a4 >= 1.000002)
      {
        uint64_t v10 = vcvtmd_s64_f64(a6 + 0.000001);
LABEL_20:
        return (void *)NU::RectT<long>::setYMinMax(v8, v9, v10);
      }
      else
      {
        *(void *)(v8 + _Block_object_dispose(&STACK[0x210], 8) = v9;
        *(void *)(v8 + 24) = 0;
      }
      return result;
    case 2:
      NU::RectT<long>::setXMinMax(result, (uint64_t)nearbyint(a3), (uint64_t)nearbyint(a5));
      uint64_t v9 = (uint64_t)nearbyint(a4);
      uint64_t v10 = (uint64_t)nearbyint(a6);
      goto LABEL_20;
    case 3:
      NU::RectT<long>::setXMinMax(result, (uint64_t)a3, (uint64_t)a5);
      uint64_t v9 = (uint64_t)a4;
      uint64_t v10 = (uint64_t)a6;
      goto LABEL_20;
    case 4:
      double v11 = floor(a3 + 0.000001);
      double v12 = floor(a4 + 0.000001);
      double v13 = ceil(a5 + -0.000001);
      double v14 = ceil(a6 + -0.000001);
      if ((unint64_t)(v13 - v11))
      {
        if (a3 - v11 <= v13 - a5) {
          double v13 = v13 + -1.0;
        }
        else {
          double v11 = v11 + 1.0;
        }
      }
      if ((unint64_t)(v14 - v12))
      {
        if (a4 - v12 <= v14 - a6) {
          double v14 = v14 + -1.0;
        }
        else {
          double v12 = v12 + 1.0;
        }
      }
      NU::RectT<long>::setXMinMax(result, (uint64_t)v11, (uint64_t)v13);
      uint64_t v9 = (uint64_t)v12;
      uint64_t v10 = (uint64_t)v14;
      goto LABEL_20;
    default:
      uint64_t v16 = NUAssertLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        BOOL v17 = [NSString stringWithFormat:@"Rounding mode not supported"];
        *(_DWORD *)buf = 138543362;
        long long v32 = v17;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      __int16 v19 = NUAssertLogger();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v20)
        {
          int v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          float64x2_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
          uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          long long v32 = v23;
          __int16 v33 = 2114;
          long long v34 = v25;
          _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v20)
      {
        uint64_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        long long v32 = v22;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"void NU::RectT<long>::setXYMinMax(CGFloat, CGFloat, CGFloat, CGFloat, NUPixelRoundingPolicy) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 122, @"Rounding mode not supported", v26, v27, v28, v29, v30);
  }
}

void sub_1A999BCE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void *NU::RectT<long>::setXMinMax(void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3 < a2)
  {
    id v3 = NUAssertLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      float64x2_t v4 = [NSString stringWithFormat:@"Cannot set min > max"];
      *(_DWORD *)buf = 138543362;
      __int16 v19 = v4;
      _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v6 = NUAssertLogger();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        uint64_t v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        double v11 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v12 = [v11 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v19 = v10;
        __int16 v20 = 2114;
        uint64_t v21 = v12;
        _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v19 = v9;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<long>::setXMinMax(T, T) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 129, @"Cannot set min > max", v13, v14, v15, v16, v17);
  }
  result[2] = a3 - a2;
  *double result = a2;
  return result;
}

void sub_1A999BF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t NU::RectT<long>::setYMinMax(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3 < a2)
  {
    id v3 = NUAssertLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      float64x2_t v4 = [NSString stringWithFormat:@"Cannot set min > max"];
      *(_DWORD *)buf = 138543362;
      __int16 v19 = v4;
      _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v6 = NUAssertLogger();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        uint64_t v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        double v11 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v12 = [v11 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v19 = v10;
        __int16 v20 = 2114;
        uint64_t v21 = v12;
        _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v19 = v9;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<long>::setYMinMax(T, T) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 136, @"Cannot set min > max", v13, v14, v15, v16, v17);
  }
  *(void *)(result + 24) = a3 - a2;
  *(void *)(result + _Block_object_dispose(&STACK[0x210], 8) = a2;
  return result;
}

void sub_1A999C1C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

double NUPixelRectFromCGRect@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  v10.origin.CGFloat x = a3;
  v10.origin.double y = a4;
  v10.size.CGFloat width = a5;
  v10.size.CGFloat height = a6;
  NU::RectT<long>::RectT(v9, &v10, a1);
  double result = *(double *)v9;
  long long v8 = v9[1];
  *a2 = v9[0];
  a2[1] = v8;
  return result;
}

uint64_t NUMaxX(void *a1)
{
  return a1[2] + *a1;
}

uint64_t NUMaxY(uint64_t a1)
{
  return *(void *)(a1 + 24) + *(void *)(a1 + 8);
}

uint64_t NUMinX(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t NUMinY(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t NUWidth(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t NUHeight(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

double NUPixelRectIntersection@<D0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, _OWORD *a3@<X8>)
{
  long long v4 = a1[1];
  v10[0] = *a1;
  v10[1] = v4;
  long long v5 = a2[1];
  v9[0] = *a2;
  v9[1] = v5;
  NU::RectT<long>::Intersection((uint64_t)v8, (uint64_t *)v10, (uint64_t *)v9);
  double result = *(double *)v8;
  long long v7 = v8[1];
  *a3 = v8[0];
  a3[1] = v7;
  return result;
}

double NU::RectT<long>::Intersection(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v4 = a2[2];
  if (v4
    && (uint64_t v6 = a2[3]) != 0
    && ((v9 = a3[2], uint64_t v8 = a3[3], v9) ? (v10 = v8 == 0) : (v10 = 1),
        !v10 && (NU::RectT<long>::intersects(a2, a3) & 1) != 0))
  {
    uint64_t v11 = a2[1];
    uint64_t v12 = a3[1];
    if (*a2 <= *a3) {
      uint64_t v13 = *a3;
    }
    else {
      uint64_t v13 = *a2;
    }
    if (v9 + *a3 >= v4 + *a2) {
      uint64_t v14 = v4 + *a2;
    }
    else {
      uint64_t v14 = v9 + *a3;
    }
    if (v11 <= v12) {
      uint64_t v15 = a3[1];
    }
    else {
      uint64_t v15 = a2[1];
    }
    if (v8 + v12 >= v6 + v11) {
      uint64_t v16 = v6 + v11;
    }
    else {
      uint64_t v16 = v8 + v12;
    }
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    NU::RectT<long>::setXMinMax((void *)a1, v13, v14);
    NU::RectT<long>::setYMinMax(a1, v15, v16);
  }
  else
  {
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t NU::RectT<long>::intersects(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  if (*a1 >= *a2)
  {
    if (*a1 > *a2 && a2[2] + v3 <= v2) {
      return 0;
    }
LABEL_6:
    uint64_t v4 = a1[1];
    uint64_t v5 = a2[1];
    if (v4 >= v5)
    {
      if (v4 > v5 && a2[3] + v5 <= v4) {
        return 0;
      }
    }
    else if (a1[3] + v4 <= v5)
    {
      return 0;
    }
    return 1;
  }
  if (a1[2] + v2 > v3) {
    goto LABEL_6;
  }
  return 0;
}

double NUPixelRectUnion@<D0>(long long *a1@<X0>, _OWORD *a2@<X1>, _OWORD *a3@<X8>)
{
  long long v4 = a2[1];
  v10[0] = *a2;
  v10[1] = v4;
  long long v5 = a1[1];
  long long v8 = *a1;
  long long v9 = v5;
  NU::RectT<long>::add((uint64_t *)&v8, (uint64_t *)v10);
  double result = *(double *)&v8;
  long long v7 = v9;
  *a3 = v8;
  a3[1] = v7;
  return result;
}

__n128 NU::RectT<long>::add(uint64_t *a1, uint64_t *a2)
{
  if (a1[2] && a1[3])
  {
    if (a2[2]) {
      BOOL v4 = a2[3] == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (!v4)
    {
      if (*a2 >= *a1) {
        uint64_t v5 = *a1;
      }
      else {
        uint64_t v5 = *a2;
      }
      NU::RectT<long>::setXMin(a1, v5);
      uint64_t v6 = a2[2];
      if (a1[2] + *a1 <= v6 + *a2) {
        uint64_t v7 = v6 + *a2;
      }
      else {
        uint64_t v7 = a1[2] + *a1;
      }
      NU::RectT<long>::setXMax(a1, v7);
      if (a2[1] >= a1[1]) {
        uint64_t v8 = a1[1];
      }
      else {
        uint64_t v8 = a2[1];
      }
      NU::RectT<long>::setYMin(a1, v8);
      uint64_t v9 = a2[3];
      if (a1[3] + a1[1] <= v9 + a2[1]) {
        uint64_t v10 = v9 + a2[1];
      }
      else {
        uint64_t v10 = a1[3] + a1[1];
      }
      NU::RectT<long>::setYMax(a1, v10);
    }
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    __n128 result = *((__n128 *)a2 + 1);
    *((__n128 *)a1 + 1) = result;
  }
  return result;
}

uint64_t *NU::RectT<long>::setXMin(uint64_t *result, uint64_t a2)
{
  uint64_t v2 = result;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = result[2] + *result;
  BOOL v4 = v3 < a2;
  uint64_t v5 = v3 - a2;
  if (v4)
  {
    uint64_t v6 = NUAssertLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [NSString stringWithFormat:@"Cannot set min > max: { %ld, %ld, %ld, %ld }", *v2, v2[1], v2[2], v2[3]];
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v9 = NUAssertLogger();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        uint64_t v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v21 = v13;
        __int16 v22 = 2114;
        int v23 = v15;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<long>::setXMin(T) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 143, @"Cannot set min > max: { %ld, %ld, %ld, %ld }", v16, v17, v18, v19, *v2);
  }
  result[2] = v5;
  *__n128 result = a2;
  return result;
}

void sub_1A999C7EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *NU::RectT<long>::setXMax(uint64_t *result, uint64_t a2)
{
  uint64_t v2 = result;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a2 < *result)
  {
    uint64_t v3 = NUAssertLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      BOOL v4 = [NSString stringWithFormat:@"Cannot set max < min: { %ld, %ld, %ld, %ld }", *v2, v2[1], v2[2], v2[3]];
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v4;
      _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v6 = NUAssertLogger();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        BOOL v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v11 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v12 = [v11 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v18 = v10;
        __int16 v19 = 2114;
        __int16 v20 = v12;
        _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v9;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<long>::setXMax(T) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 155, @"Cannot set max < min: { %ld, %ld, %ld, %ld }", v13, v14, v15, v16, *v2);
  }
  result[2] = a2 - *result;
  return result;
}

void sub_1A999CA84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *NU::RectT<long>::setYMin(uint64_t *result, uint64_t a2)
{
  uint64_t v2 = result;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = result[3] + result[1];
  BOOL v4 = v3 < a2;
  uint64_t v5 = v3 - a2;
  if (v4)
  {
    uint64_t v6 = NUAssertLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = [NSString stringWithFormat:@"Cannot set min > max: { %ld, %ld, %ld, %ld }", *v2, v2[1], v2[2], v2[3]];
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v9 = NUAssertLogger();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        uint64_t v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v21 = v13;
        __int16 v22 = 2114;
        int v23 = v15;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<long>::setYMin(T) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 149, @"Cannot set min > max: { %ld, %ld, %ld, %ld }", v16, v17, v18, v19, *v2);
  }
  result[3] = v5;
  result[1] = a2;
  return result;
}

void sub_1A999CD28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *NU::RectT<long>::setYMax(uint64_t *result, uint64_t a2)
{
  uint64_t v2 = result;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = result[1];
  BOOL v4 = __OFSUB__(a2, v3);
  uint64_t v5 = a2 - v3;
  if (v5 < 0 != v4)
  {
    uint64_t v6 = NUAssertLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = [NSString stringWithFormat:@"Cannot set max < min: { %ld, %ld, %ld, %ld }", *v2, v2[1], v2[2], v2[3]];
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v9 = NUAssertLogger();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        uint64_t v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v21 = v13;
        __int16 v22 = 2114;
        int v23 = v15;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<long>::setYMax(T) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 160, @"Cannot set max < min: { %ld, %ld, %ld, %ld }", v16, v17, v18, v19, *v2);
  }
  result[3] = v5;
  return result;
}

void sub_1A999CFC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL NUPixelRectContainsRect(_OWORD *a1, long long *a2)
{
  long long v3 = a1[1];
  long long v4 = *a2;
  long long v5 = a2[1];
  v11[0] = *a1;
  v11[1] = v3;
  v10[0] = v4;
  v10[1] = v5;
  NU::RectT<long>::Intersection((uint64_t)&v8, (uint64_t *)v11, (uint64_t *)v10);
  BOOL result = 0;
  if (*(void *)a2 == v8.i64[0])
  {
    int32x2_t v7 = vmovn_s64(vceqq_s64(*(int64x2_t *)((char *)a2 + 8), (int64x2_t)vextq_s8(v8, v9, 8uLL)));
    if (v7.i8[0] & 1) != 0 && (v7.i8[4]) {
      return *((void *)a2 + 3) == v9.i64[1];
    }
  }
  return result;
}

BOOL NUPixelRectEqualToRect(void *a1, void *a2)
{
  return *a2 == *a1 && a2[1] == a1[1] && a2[2] == a1[2] && a2[3] == a1[3];
}

__n128 NUPixelRectConstrainToRect@<Q0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3 = a1[2];
  uint64_t v4 = a2[2];
  if (v3 <= v4)
  {
    uint64_t v5 = a1[3];
    if (v5 <= a2[3])
    {
      uint64_t v6 = *a2;
      if (*a1 >= *a2)
      {
        uint64_t v7 = *a2;
        uint64_t v6 = *a1;
      }
      else
      {
        *a1 = v6;
        uint64_t v7 = *a2;
        uint64_t v4 = a2[2];
      }
      uint64_t v8 = v4 + v7;
      if (v6 + v3 > v8) {
        *a1 = v8 - v3;
      }
      uint64_t v9 = a2[1];
      if (a1[1] >= v9)
      {
        uint64_t v10 = a2[1];
        uint64_t v9 = a1[1];
      }
      else
      {
        a1[1] = v9;
        uint64_t v10 = a2[1];
      }
      uint64_t v11 = v9 + v5;
      uint64_t v12 = a2[3] + v10;
      if (v11 > v12) {
        a1[1] = v12 - v5;
      }
    }
  }
  __n128 result = *(__n128 *)a1;
  long long v14 = *((_OWORD *)a1 + 1);
  *a3 = *(_OWORD *)a1;
  a3[1] = v14;
  return result;
}

int64x2_t *NUPixelRectMaxCenteredInRect@<X0>(int64x2_t *result@<X0>, uint64_t a2@<X8>)
{
  int64x2_t v2 = result[1];
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(*result, vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL)), (int32x4_t)vceqzq_s64(v2))))) & 1) == 0|| (v2.i64[0] ? (BOOL v3 = v2.i64[1] == 0) : (BOOL v3 = 1), v3))
  {
    *(_OWORD *)a2 = NUPixelRectNull;
    *(_OWORD *)(a2 + 16) = unk_1A9A743E8;
  }
  else
  {
    if (v2.i64[0] >= v2.i64[1]) {
      uint64_t v4 = result[1].i64[1];
    }
    else {
      uint64_t v4 = result[1].i64[0];
    }
    int64x2_t v5 = result[1];
    *(int64x2_t *)a2 = *result;
    *(int64x2_t *)(a2 + 16) = v5;
    if (v2.i64[1] <= v2.i64[0])
    {
      uint64_t v7 = v2.i64[0] - v4;
      if (v2.i64[0] < v4) {
        ++v7;
      }
      *(void *)a2 += v7 >> 1;
      *(void *)(a2 + 16) = v4;
    }
    else
    {
      uint64_t v6 = v2.i64[1] - v4;
      if (v2.i64[1] < v4) {
        ++v6;
      }
      *(void *)(a2 + 8) += v6 >> 1;
      *(void *)(a2 + 24) = v4;
    }
  }
  return result;
}

BOOL NUPixelRectIsNull(void *a1)
{
  return *a1 == 0x7FFFFFFFFFFFFFFFLL && a1[1] == 0x7FFFFFFFFFFFFFFFLL && a1[2] == 0 && a1[3] == 0;
}

BOOL NUPixelRectIsEmpty(uint64_t a1)
{
  return !*(void *)(a1 + 16) || *(void *)(a1 + 24) == 0;
}

uint64_t NUPixelRectIntersectsRect(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  v6[0] = *a1;
  v6[1] = v2;
  long long v3 = a2[1];
  v5[0] = *a2;
  v5[1] = v3;
  return NU::RectT<long>::intersects((uint64_t *)v6, (uint64_t *)v5);
}

__n128 NUPixelRectOffset@<Q0>(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __n128 *a4@<X8>)
{
  unint64_t v4 = a1->n128_u64[1] + a3;
  a4->n128_u64[0] = a1->n128_u64[0] + a2;
  a4->n128_u64[1] = v4;
  __n128 result = a1[1];
  a4[1] = result;
  return result;
}

__n128 NUPixelRectSetOrigin@<Q0>(__n128 *a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, __n128 *a4@<X8>)
{
  a4->n128_u64[0] = a2;
  a4->n128_u64[1] = a3;
  __n128 result = a1[1];
  a4[1] = result;
  return result;
}

__n128 NUPixelRectFlipYOrigin@<Q0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = a2[3] + a2[1] - (*(void *)(a1 + 8) + *(void *)(a1 + 24));
  __n128 result = *(__n128 *)a1;
  long long v5 = *(_OWORD *)(a1 + 16);
  *(void *)a3 = *(void *)a1 - *a2;
  *(void *)(a3 + _Block_object_dispose(&STACK[0x210], 8) = v3;
  *(_OWORD *)(a3 + 16) = v5;
  return result;
}

double NUPixelRectScale@<D0>(long long *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  long long v6 = a1[1];
  long long v9 = *a1;
  long long v10 = v6;
  NU::RectT<long>::scale((uint64_t *)&v9, a2, a4, a5);
  double result = *(double *)&v9;
  long long v8 = v10;
  *a3 = v9;
  a3[1] = v8;
  return result;
}

void *NU::RectT<long>::scale(uint64_t *a1, uint64_t a2, double a3, double a4)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a3 < 0.0)
  {
    long long v9 = NUAssertLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      long long v10 = [NSString stringWithFormat:@"Negative x-scale values not supported"];
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v12 = NUAssertLogger();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        int v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v39 = v23;
        __int16 v40 = 2114;
        uint64_t v41 = v25;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      long long v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<long>::scale(CGFloat, CGFloat, NUPixelRoundingPolicy) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 289, @"Negative x-scale values not supported", v26, v27, v28, v29, v37);
  }
  if (a4 < 0.0)
  {
    uint64_t v16 = NUAssertLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [NSString stringWithFormat:@"Negative y-scale values not supported"];
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v19 = NUAssertLogger();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v20)
      {
        uint64_t v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v31 = [MEMORY[0x1E4F29060] callStackSymbols];
        long long v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v39 = v30;
        __int16 v40 = 2114;
        uint64_t v41 = v32;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"void NU::RectT<long>::scale(CGFloat, CGFloat, NUPixelRoundingPolicy) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 290, @"Negative y-scale values not supported", v33, v34, v35, v36, v37);
  }
  double v4 = (double)*a1 * a3 + (double)a1[2] * a3;
  double v5 = (double)a1[1] * a4 + (double)a1[3] * a4;
  double v6 = (double)*a1 * a3;
  double v7 = (double)a1[1] * a4;

  return NU::RectT<long>::setXYMinMax(a1, a2, v6, v7, v4, v5);
}

void sub_1A999D770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

double NUPixelRectScaleRational@<D0>(int64x2_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int64x2_t *a5@<X8>)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  int64x2_t v8 = *a1;
  int64x2_t v9 = a1[1];
  int64x2_t v36 = *a1;
  int64x2_t v37 = v9;
  if (a2 < 1 || a3 <= 0)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_15574);
    }
    uint64_t v17 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = NSString;
      uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%ld:%ld", a2, a3);
      BOOL v20 = [v18 stringWithFormat:@"Invalid scale: %@", v19];
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_15574);
    }
    __int16 v22 = (id)_NUAssertLogger;
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v27 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v39 = v26;
        __int16 v40 = 2114;
        uint64_t v41 = v28;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"%ld:%ld", a2, a3);
    _NUAssertFailHandler((uint64_t)"void NU::RectT<long>::scale(NUScale, NUPixelRoundingPolicy) [T = long]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NURect.h", 302, @"Invalid scale: %@", v30, v31, v32, v33, v29);
  }
  uint64_t v11 = v8.i64[1];
  uint64_t v12 = v8.i64[0];
  int64x2_t v34 = v9;
  int64x2_t v35 = v8;
  double v13 = NUScaleToDouble(a2, a3);
  int64x2_t v14 = vaddq_s64(v34, v35);
  NU::RectT<long>::setXYMinMax(&v36, a4, v13 * (double)v12, v13 * (double)v11, v13 * (double)v14.i64[0], v13 * (double)v14.i64[1]);
  double result = *(double *)v36.i64;
  int64x2_t v16 = v37;
  *a5 = v36;
  a5[1] = v16;
  return result;
}

void sub_1A999DB38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double NUPixelRectInset@<D0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  long long v5 = a1[1];
  long long v8 = *a1;
  long long v9 = v5;
  NU::RectT<long>::shrink((uint64_t *)&v8, a2, a3);
  double result = *(double *)&v8;
  long long v7 = v9;
  *a4 = v8;
  a4[1] = v7;
  return result;
}

uint64_t *NU::RectT<long>::shrink(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  NU::RectT<long>::setXMin(a1, *a1 + a2);
  NU::RectT<long>::setYMin(a1, a1[1] + a3);
  NU::RectT<long>::setXMax(a1, *a1 - a2 + a1[2]);
  uint64_t v6 = a1[1] - a3 + a1[3];

  return NU::RectT<long>::setYMax(a1, v6);
}

double NUPixelRectErode@<D0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  long long v5 = a1[1];
  long long v8 = *a1;
  long long v9 = v5;
  NU::RectT<long>::shrink((uint64_t *)&v8, a2, a3);
  double result = *(double *)&v8;
  long long v7 = v9;
  *a4 = v8;
  a4[1] = v7;
  return result;
}

double NUPixelRectDilate@<D0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  long long v5 = a1[1];
  long long v8 = *a1;
  long long v9 = v5;
  NU::RectT<long>::grow((uint64_t *)&v8, a2, a3);
  double result = *(double *)&v8;
  long long v7 = v9;
  *a4 = v8;
  a4[1] = v7;
  return result;
}

uint64_t *NU::RectT<long>::grow(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  NU::RectT<long>::setXMin(a1, *a1 - a2);
  NU::RectT<long>::setYMin(a1, a1[1] - a3);
  NU::RectT<long>::setXMax(a1, *a1 + a2 + a1[2]);
  uint64_t v6 = a1[1] + a3 + a1[3];

  return NU::RectT<long>::setYMax(a1, v6);
}

BOOL NUPixelPointInRect(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[1];
  uint64_t v4 = a3[2] + *a3;
  if (a1 >= *a3)
  {
    BOOL v6 = __OFSUB__(a1, v4);
    BOOL v5 = a1 - v4 < 0;
  }
  else
  {
    BOOL v6 = 0;
    BOOL v5 = 0;
  }
  if (v5 != v6)
  {
    BOOL v8 = __OFSUB__(a2, v3);
    BOOL v7 = a2 - v3 < 0;
  }
  else
  {
    BOOL v8 = 0;
    BOOL v7 = 1;
  }
  return v7 == v8 && a2 < a3[3] + v3;
}

double NUPixelRectToCGRect(uint64_t *a1)
{
  return (double)*a1;
}

uint64_t NUPixelRectHash(void *a1)
{
  return (0x1BF75A10D65E13 * a1[1]) ^ (0x10E0076873D11FLL * *a1) ^ (0xB4C213BC9A2FBLL * a1[2]) ^ (0x210F2E3C563F53
                                                                                                  * a1[3]);
}

uint64_t NUScaleToFitSizeInSize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1 || !a2) {
    return NUScaleUnknown;
  }
  if (NUScaleCompare(a3, a1, a4, a2) >= 0) {
    return a4;
  }
  return a3;
}

uint64_t NUScaleToFillSizeInSize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1 || !a2) {
    return NUScaleUnknown;
  }
  if (NUScaleCompare(a3, a1, a4, a2) <= 0) {
    return a4;
  }
  return a3;
}

uint64_t NUOrientationFromClockwiseRotation(uint64_t a1)
{
  if (a1 / -90 >= 0) {
    uint64_t v1 = -((a1 / -90) & 3);
  }
  else {
    uint64_t v1 = (a1 / 90) & 3;
  }
  return qword_1A9A745F8[v1 + 3];
}

uint64_t NUOrientationToClockwiseRotationAndFlips(uint64_t a1, char *a2)
{
  switch(a1)
  {
    case 2:
      uint64_t result = 0;
      char v3 = 1;
      if (a2) {
        goto LABEL_17;
      }
      return result;
    case 3:
      char v3 = 0;
      goto LABEL_8;
    case 4:
      char v3 = 1;
LABEL_8:
      uint64_t result = 180;
      if (!a2) {
        return result;
      }
      goto LABEL_17;
    case 5:
      char v3 = 1;
      goto LABEL_16;
    case 6:
      char v3 = 0;
      goto LABEL_13;
    case 7:
      char v3 = 1;
LABEL_13:
      uint64_t result = 90;
      if (!a2) {
        return result;
      }
      goto LABEL_17;
    case 8:
      char v3 = 0;
LABEL_16:
      uint64_t result = 270;
      if (a2) {
        goto LABEL_17;
      }
      return result;
    default:
      uint64_t result = 0;
      char v3 = 0;
      if (!a2) {
        return result;
      }
LABEL_17:
      *a2 = v3;
      return result;
  }
}

uint64_t NUOrientationInverse(uint64_t a1)
{
  uint64_t v1 = 6;
  if (a1 != 8) {
    uint64_t v1 = a1;
  }
  if (a1 == 6) {
    return 8;
  }
  else {
    return v1;
  }
}

uint64_t NUOrientationConcat(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a1 - 9) <= 0xFFFFFFFFFFFFFFF7)
  {
    char v3 = NUAssertLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "orientation1 >= 1 && orientation1 <= 8");
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v4;
      _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v6 = NUAssertLogger();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        uint64_t v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v17;
        __int16 v33 = 2114;
        int64x2_t v34 = v19;
        _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v7)
    {
      BOOL v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v9;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"NUOrientation NUOrientationConcat(NUOrientation, NUOrientation)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometry.mm", 458, @"Invalid parameter not satisfying: %s", v20, v21, v22, v23, (uint64_t)"orientation1 >= 1 && orientation1 <= 8");
  }
  if ((unint64_t)(a2 - 9) <= 0xFFFFFFFFFFFFFFF7)
  {
    long long v10 = NUAssertLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "orientation2 >= 1 && orientation2 <= 8");
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v13 = NUAssertLogger();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      if (v14)
      {
        uint64_t v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v24;
        __int16 v33 = 2114;
        int64x2_t v34 = v26;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      int64x2_t v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"NUOrientation NUOrientationConcat(NUOrientation, NUOrientation)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometry.mm", 459, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"orientation2 >= 1 && orientation2 <= 8");
  }
  return NUOrientationConcat::m[8 * a1 - 9 + a2];
}

void sub_1A999E434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t NUOrientationTransformImageSize(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2;
  if ((unint64_t)(a1 - 5) <= 3)
  {
    if ((a3 | a2) < 0)
    {
      BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v7 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
      [v6 handleFailureInFunction:v7, @"NUGeometryPrimitives.h", 38, @"Invalid parameter not satisfying: %@", @"(width >= 0) && (height >= 0)" file lineNumber description];
    }
    return a3;
  }
  return v4;
}

void sub_1A999E578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double NUOrientationTransformSize(uint64_t a1, double a2, double a3)
{
  if ((unint64_t)(a1 - 5) >= 4) {
    return a2;
  }
  return a3;
}

uint64_t NUOrientationTransformImageOrigin(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((unint64_t)(a1 - 5) >= 4) {
    return a2;
  }
  else {
    return a3;
  }
}

double NUOrientationTransformVector(uint64_t a1, double result, double a3)
{
  switch(a1)
  {
    case 2:
      uint64_t result = -result;
      break;
    case 3:
      uint64_t result = -result;
      break;
    case 5:
      uint64_t result = -a3;
      break;
    case 6:
      uint64_t result = a3;
      break;
    case 7:
      uint64_t result = a3;
      break;
    case 8:
      uint64_t result = -a3;
      break;
    default:
      return result;
  }
  return result;
}

double NUOrientationTransformImagePoint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  float64x2_t v11 = 0u;
  float64x2_t v12 = 0u;
  float64x2_t v10 = 0u;
  NUOrientationMakeTransformWithSizeAndOrigin(a1, a2, a3, a4, a5, (uint64_t)&v10);
  *(void *)&double result = vcvtq_s64_f64(vaddq_f64(v12, vmlaq_n_f64(vmulq_n_f64(v11, (double)a7), v10, (double)a6))).u64[0];
  return result;
}

CGAffineTransform *NUOrientationMakeTransformWithSizeAndOrigin@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  if ((unint64_t)(a1 - 5) >= 4) {
    double v10 = (double)a5;
  }
  else {
    double v10 = (double)a4;
  }
  if ((unint64_t)(a1 - 5) >= 4) {
    double v11 = (double)a4;
  }
  else {
    double v11 = (double)a5;
  }
  memset(&v23, 0, sizeof(v23));
  CGAffineTransformMakeTranslation(&v23, (double)-a4, (double)-a5);
  memset(&v22, 0, sizeof(v22));
  CGAffineTransformMakeTranslation(&v22, v11, v10);
  long long v12 = xmmword_1A9A72CB0;
  long long v13 = xmmword_1A9A72DF0;
  double v14 = 0.0;
  double v15 = (double)a2;
  switch(a1)
  {
    case 2:
      break;
    case 3:
      long long v12 = xmmword_1A9A72E00;
      double v15 = (double)a2;
      goto LABEL_11;
    case 4:
      long long v12 = xmmword_1A9A72E00;
      long long v13 = xmmword_1A9A72CC0;
      double v15 = 0.0;
LABEL_11:
      double v14 = (double)a3;
      break;
    case 5:
      long long v12 = xmmword_1A9A72DF0;
      long long v13 = xmmword_1A9A72E00;
      double v15 = (double)a3;
      goto LABEL_14;
    case 6:
      long long v12 = xmmword_1A9A72CC0;
      long long v13 = xmmword_1A9A72E00;
      double v15 = 0.0;
LABEL_14:
      double v14 = (double)a2;
      break;
    case 7:
      long long v12 = xmmword_1A9A72CC0;
      long long v13 = xmmword_1A9A72CB0;
      double v15 = 0.0;
      break;
    case 8:
      long long v12 = xmmword_1A9A72DF0;
      long long v13 = xmmword_1A9A72CB0;
      double v15 = (double)a3;
      break;
    default:
      long long v13 = xmmword_1A9A72CC0;
      double v15 = 0.0;
      double v14 = 0.0;
      break;
  }
  CGAffineTransform t1 = v23;
  memset(&v21, 0, sizeof(v21));
  *(_OWORD *)&t2.a = v13;
  *(_OWORD *)&t2.c = v12;
  t2.tCGFloat x = v15;
  t2.tdouble y = v14;
  CGAffineTransformConcat(&v21, &t1, &t2);
  *(_OWORD *)(a6 + 16) = 0u;
  *(_OWORD *)(a6 + 32) = 0u;
  *(_OWORD *)a6 = 0u;
  CGAffineTransform v18 = v21;
  CGAffineTransform v17 = v22;
  return CGAffineTransformConcat((CGAffineTransform *)a6, &v18, &v17);
}

double NUOrientationTransformPoint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7)
{
  float64x2_t v11 = 0u;
  float64x2_t v12 = 0u;
  float64x2_t v10 = 0u;
  NUOrientationMakeTransformWithSizeAndOrigin(a1, a2, a3, a4, a5, (uint64_t)&v10);
  *(void *)&double result = *(_OWORD *)&vaddq_f64(v12, vmlaq_n_f64(vmulq_n_f64(v11, a7), v10, a6));
  return result;
}

double NUOrientationTransformImageRect@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, long long *a4@<X3>, _OWORD *a5@<X8>)
{
  long long v6 = a4[1];
  long long v9 = *a4;
  long long v10 = v6;
  NU::RectT<long>::applyOrientation((uint64_t *)&v9, a1, a2, a3);
  double result = *(double *)&v9;
  long long v8 = v10;
  *a5 = v9;
  a5[1] = v8;
  return result;
}

uint64_t *NU::RectT<long>::applyOrientation(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *result;
  uint64_t v4 = result[1];
  uint64_t v7 = result[2];
  uint64_t v6 = result[3];
  switch(a2)
  {
    case 2:
      uint64_t v8 = a3 - (v5 + v7);
      goto LABEL_6;
    case 3:
      uint64_t v8 = a3 - (v5 + v7);
      uint64_t v4 = a4 - (v4 + v6);
      goto LABEL_6;
    case 4:
      uint64_t v4 = a4 - (v4 + v6);
      goto LABEL_5;
    case 5:
      uint64_t v8 = a4 - (v4 + v6);
      uint64_t v4 = a3 - (v5 + v7);
      goto LABEL_12;
    case 6:
      uint64_t v8 = result[1];
      uint64_t v4 = a3 - (v5 + v7);
      goto LABEL_12;
    case 7:
      uint64_t v8 = result[1];
      goto LABEL_11;
    case 8:
      uint64_t v8 = a4 - (v4 + v6);
LABEL_11:
      uint64_t v4 = *result;
LABEL_12:
      uint64_t v9 = result[3];
      uint64_t v6 = result[2];
      break;
    default:
LABEL_5:
      uint64_t v8 = *result;
LABEL_6:
      uint64_t v9 = result[2];
      break;
  }
  *double result = v8;
  result[1] = v4;
  result[2] = v9;
  result[3] = v6;
  return result;
}

double NUOrientationTransformRect(uint64_t a1, uint64_t a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  v15.origin.CGFloat x = a4;
  v15.origin.double y = a5;
  v15.size.CGFloat width = a6;
  v15.size.CGFloat height = a7;
  NU::RectT<double>::RectT(&v11, &v15);
  switch(a1)
  {
    case 2:
      double result = (double)a2 - (v11 + v13);
      break;
    case 3:
      double result = (double)a2 - (v11 + v13);
      break;
    case 5:
      double result = (double)a3 - (v12 + v14);
      break;
    case 6:
      double result = v12;
      break;
    case 7:
      double result = v12;
      break;
    case 8:
      double result = (double)a3 - (v12 + v14);
      break;
    default:
      double result = v11;
      break;
  }
  return result;
}

CGAffineTransform *NUOrientationMakeTransformWithSize@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return NUOrientationMakeTransformWithSizeAndOrigin(a1, a2, a3, 0, 0, a4);
}

uint64_t NUAffineTransformOrientation(double *a1)
{
  double v1 = *a1;
  double v2 = a1[1];
  uint64_t v3 = (uint64_t)llround(a1[2] * 180.0 / 3.14159265) / -90;
  uint64_t v4 = v3 & 3;
  uint64_t v6 = -v3;
  BOOL v5 = v6 < 0;
  uint64_t v7 = v6 & 3;
  if (v5) {
    uint64_t v8 = v4;
  }
  else {
    uint64_t v8 = -v7;
  }
  uint64_t v9 = qword_1A9A745F8[v8 + 3];
  uint64_t v10 = 4;
  if (v2 >= 0.0) {
    uint64_t v10 = 1;
  }
  uint64_t v11 = 3;
  if (v2 >= 0.0) {
    uint64_t v11 = 2;
  }
  if (v1 < 0.0) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = v10;
  }
  return NUOrientationConcat(v9, v12);
}

uint64_t NUOrientationFromCGAffineTransform(__n128 *a1)
{
  __n128 v2 = a1[1];
  *(__n128 *)&v7.a = *a1;
  *(__n128 *)&v7.c = v2;
  *(__n128 *)&v7.tCGFloat x = a1[2];
  if (CGAffineTransformIsIdentity(&v7)) {
    return 1;
  }
  __n128 v4 = a1[1];
  v5[0] = *a1;
  v5[1] = v4;
  _OWORD v5[2] = a1[2];
  NUDecomposeAffineTransform(v5, (uint64_t)v6);
  return NUAffineTransformOrientation(v6);
}

__n128 NUDecomposeAffineTransform@<Q0>(__n128 *a1@<X0>, uint64_t a2@<X8>)
{
  double v4 = a1->n128_f64[0];
  long double v5 = a1[1].n128_f64[0];
  double v6 = hypot(a1->n128_f64[0], v5);
  long double v7 = a1->n128_f64[1];
  long double v8 = a1[1].n128_f64[1];
  double v9 = hypot(v7, v8);
  long double v10 = v4 * v8 - v7 * v5;
  BOOL v11 = v10 < 0.0;
  if (v10 <= 0.0)
  {
    double v12 = 0.0;
    if (!v11) {
      goto LABEL_13;
    }
    if (fabs(v4) >= 0.00001 || fabs(v8) >= 0.00001)
    {
      if (v4 >= 0.0)
      {
LABEL_12:
        double v12 = atan2(-v7 - v5, v4 - v8);
        double v9 = -v9;
        goto LABEL_13;
      }
      double v13 = v5 + v7;
    }
    else
    {
      double v13 = v5 + v7;
      if (v5 + v7 <= 0.0) {
        goto LABEL_12;
      }
    }
    double v12 = atan2(v13, v8 - v4);
    double v6 = -v6;
    goto LABEL_13;
  }
  double v12 = atan2(v7 - v5, v4 + v8);
LABEL_13:
  *(double *)a2 = v6;
  *(double *)(a2 + _Block_object_dispose(&STACK[0x210], 8) = v9;
  *(double *)(a2 + 16) = v12;
  __n128 result = a1[2];
  *(__n128 *)(a2 + 24) = result;
  return result;
}

BOOL NUOrientationIsValid(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 8;
}

uint64_t NUOrientationHasFlip(unint64_t a1)
{
  return (a1 < 8) & (0xB4u >> a1);
}

uint64_t NUOrientationTransformRectVertex(uint64_t a1, uint64_t a2)
{
  switch(a1)
  {
    case 2:
      a2 = a2 ^ 1;
      break;
    case 3:
      a2 = a2 ^ 3;
      break;
    case 4:
      a2 = a2 ^ 2;
      break;
    case 5:
      unsigned int v2 = ~__rbit32(a2);
      goto LABEL_8;
    case 6:
      a2 = (__rbit32(a2) >> 30) ^ 2;
      break;
    case 7:
      unsigned int v2 = __rbit32(a2);
LABEL_8:
      a2 = v2 >> 30;
      break;
    case 8:
      a2 = (__rbit32(a2) >> 30) ^ 1;
      break;
    default:
      return a2;
  }
  return a2;
}

double NUConvertImageRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, CGFloat a9, CGFloat a10, double a11, double a12)
{
  double v20 = a11 / a7;
  double v21 = a12 / a8;
  CGRect v24 = CGRectOffset(*(CGRect *)&a1, -a5, -a6);
  v24.origin.CGFloat x = v20 * v24.origin.x;
  v24.origin.double y = v21 * v24.origin.y;
  v24.size.CGFloat width = v20 * v24.size.width;
  v24.size.CGFloat height = v21 * v24.size.height;
  CGRect v25 = CGRectStandardize(v24);

  *(void *)&double result = (unint64_t)CGRectOffset(v25, a9, a10);
  return result;
}

double NUMultiplyRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  v7.origin.CGFloat x = a1 * a5;
  v7.origin.double y = a2 * a6;
  v7.size.CGFloat width = a3 * a5;
  v7.size.CGFloat height = a4 * a6;
  *(void *)&double result = (unint64_t)CGRectStandardize(v7);
  return result;
}

double NUPixelRectVertex(char a1, double a2, double a3, double a4, double a5)
{
  if (a1) {
    double MaxX = CGRectGetMaxX(*(CGRect *)&a2);
  }
  else {
    double MaxX = CGRectGetMinX(*(CGRect *)&a2);
  }
  double v11 = MaxX;
  double v12 = a2;
  double v13 = a3;
  double v14 = a4;
  double v15 = a5;
  if ((a1 & 2) != 0) {
    CGRectGetMaxY(*(CGRect *)&v12);
  }
  else {
    CGRectGetMinY(*(CGRect *)&v12);
  }
  return v11;
}

uint64_t NUPixelRectVectexOpposite(int a1)
{
  return a1 ^ 3u;
}

CGFloat NUAlignRectToPixelGrid@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, CGPoint *a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>)
{
  double v10 = (double)a1;
  double v11 = (double)a2;
  double v12 = 1.0 / (double)a1;
  double v13 = 1.0 / (double)a2;
  v20.origin.CGFloat x = a5 * v12;
  v20.origin.double y = a6 * v13;
  v20.size.CGFloat width = a7 * v12;
  v20.size.CGFloat height = a8 * v13;
  CGRect v19 = CGRectStandardize(v20);
  NU::RectT<long>::RectT(v18, &v19, a3);
  CGPoint v14 = (CGPoint)v18[0];
  CGSize v15 = (CGSize)v18[1];
  *a4 = 0u;
  a4[1] = 0u;
  v19.float64x2_t origin = v14;
  v19.CGSize size = v15;
  NU::RectT<long>::scale((uint64_t *)&v19, 2, v10, v11);
  CGFloat result = v19.origin.x;
  CGSize size = v19.size;
  *a4 = v19.origin;
  a4[1] = (CGPoint)size;
  return result;
}

CGFloat NUAlignPixelRectToPixelGrid@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, CGPoint *a5@<X8>)
{
  return NUAlignRectToPixelGrid(a2, a3, a4, a5, (double)*a1, (double)a1[1], (double)a1[2], (double)a1[3]);
}

double NURelativePointInRect(double a1, double a2, double a3, double a4, double a5)
{
  double result = 0.0;
  if (a5 != 0.0) {
    return (a1 - a3) / a5;
  }
  return result;
}

double NUAbsolutePointInRect(double a1, double a2, double a3, double a4, double a5)
{
  return a3 + a1 * a5;
}

double NUPixelPointClipToRect(double a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v14.origin.CGFloat x = a3;
  v14.origin.double y = a4;
  v14.size.CGFloat width = a5;
  v14.size.CGFloat height = a6;
  double v11 = fmax(a1, CGRectGetMinX(v14));
  v15.origin.CGFloat x = a3;
  v15.origin.double y = a4;
  v15.size.CGFloat width = a5;
  v15.size.CGFloat height = a6;
  double v12 = fmin(v11, CGRectGetMaxX(v15));
  v16.origin.CGFloat x = a3;
  v16.origin.double y = a4;
  v16.size.CGFloat width = a5;
  v16.size.CGFloat height = a6;
  CGRectGetMinY(v16);
  v17.origin.CGFloat x = a3;
  v17.origin.double y = a4;
  v17.size.CGFloat width = a5;
  v17.size.CGFloat height = a6;
  CGRectGetMaxY(v17);
  return v12;
}

double NUAnchorPointFromRectToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double result = 0.5;
  if (vabdd_f64(a7, a3) > 0.00000011920929) {
    return -(a5 - a1) / (a7 - a3);
  }
  return result;
}

double NUScaleRect(double a1, double a2, double a3, double a4, double a5)
{
  v6.origin.CGFloat x = a1 * a5;
  v6.origin.double y = a2 * a5;
  v6.size.CGFloat width = a3 * a5;
  v6.size.CGFloat height = a4 * a5;
  *(void *)&double result = (unint64_t)CGRectStandardize(v6);
  return result;
}

double NURectFlipYOrigin(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a1);
  v19.origin.CGFloat x = a5;
  v19.origin.double y = a6;
  v19.size.CGFloat width = a7;
  v19.size.CGFloat height = a8;
  double v16 = MinX - CGRectGetMinX(v19);
  v20.origin.CGFloat x = a5;
  v20.origin.double y = a6;
  v20.size.CGFloat width = a7;
  v20.size.CGFloat height = a8;
  CGRectGetMaxY(v20);
  v21.origin.CGFloat x = a1;
  v21.origin.double y = a2;
  v21.size.CGFloat width = a3;
  v21.size.CGFloat height = a4;
  CGRectGetMaxY(v21);
  return v16;
}

double NUResizeRectByMovingRelativePoint(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v16 = a1 + a9 * a3;
  if (a5 != a9) {
    a3 = (a1 + a5 * a3 + a7 - v16) / (a5 - a9);
  }
  return v16 - a9 * a3;
}

double NUPixelRectEnforceMinimumSizeAndAspectRatio(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  if (a1 | a2 && a7 * (double)a2 < a8 * (double)a1)
  {
    double v9 = (double)a1 / (double)a2;
    double v10 = INFINITY;
    if (!a1) {
      double v10 = NAN;
    }
    if (!a2) {
      double v9 = v10;
    }
    a7 = a8 * v9;
  }
  return fmin(a3, a3 + a9 * (a5 - a7));
}

BOOL NUAspectRatioIsUndefined(uint64_t a1, uint64_t a2)
{
  return (a1 | a2) == 0;
}

double NUAspectRatioValue(uint64_t a1, uint64_t a2)
{
  double result = (double)a1 / (double)a2;
  double v3 = INFINITY;
  if (!a1) {
    double v3 = NAN;
  }
  if (!a2) {
    return v3;
  }
  return result;
}

double NUPixelRectEnforceMinimumSize(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return fmin(a1, a1 + a7 * (a3 - a5));
}

double NUResizeRectRelative(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a1 + a7 * a3 - a7 * (a3 + a5);
}

double NURescaleRectRelative(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6 * a3 - a6 * (a3 * a5);
}

double NURescaleRectRelativeXY(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a1 + a7 * a3 - a7 * (a3 * a5);
}

double NUPixelRectAspectConstrain(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!(a1 | a2))
  {
    double v11 = NUAssertLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      double v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "!NUAspectRatioIsUndefined(ratio)");
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    CGRect v14 = NUAssertLogger();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        CGAffineTransform v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        CGRect v19 = [MEMORY[0x1E4F29060] callStackSymbols];
        CGRect v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v18;
        __int16 v27 = 2114;
        uint64_t v28 = v20;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      double v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      CGRect v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"CGRect NUPixelRectAspectConstrain(CGRect, CGPoint, NUAspectRatio, CGPoint)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometry.mm", 1045, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"!NUAspectRatioIsUndefined(ratio)");
  }
  return a3
       + a9 * a5
       - a9
       * (((a4 + a8 * a6 - (a4 + a10 * a6)) * ((a8 - a10) * (double)a2)
         + (a3 + a7 * a5 - (a3 + a9 * a5)) * ((a7 - a9) * (double)a1))
        / ((a8 - a10) * (double)a2 * ((a8 - a10) * (double)a2) + (a7 - a9) * (double)a1 * ((a7 - a9) * (double)a1))
        * (double)a1);
}

void sub_1A999F67C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

CGFloat NUPixelRectResizeToFitInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8, CGFloat a9, CGFloat a10, CGFloat a11, CGFloat a12)
{
  v37.size.CGFloat width = a11;
  CGFloat v22 = a1 + a5 * a3;
  CGFloat v36 = v22;
  CGFloat v34 = a2 + a6 * a4;
  v37.origin.CGFloat x = a9;
  v37.origin.double y = a10;
  v37.size.CGFloat height = a12;
  CGFloat v23 = v22 - CGRectGetMinX(v37);
  v38.origin.CGFloat x = a1;
  v38.origin.double y = a2;
  v38.size.CGFloat width = a3;
  v38.size.CGFloat height = a4;
  double v32 = v23 / (a5 * CGRectGetWidth(v38));
  v39.origin.CGFloat x = a9;
  v39.origin.double y = a10;
  v39.size.CGFloat width = a11;
  v39.size.CGFloat height = a12;
  CGFloat MinY = CGRectGetMinY(v39);
  v40.size.CGFloat width = a3;
  CGFloat v30 = v34 - MinY;
  v40.origin.CGFloat x = a1;
  v40.origin.double y = a2;
  v40.size.CGFloat height = a4;
  double v31 = v30 / (a6 * CGRectGetHeight(v40));
  v41.origin.CGFloat x = a9;
  v41.origin.double y = a10;
  v41.size.CGFloat width = a11;
  v41.size.CGFloat height = a12;
  CGFloat v28 = CGRectGetMaxX(v41) - v36;
  v42.origin.CGFloat x = a1;
  v42.origin.double y = a2;
  v42.size.CGFloat width = a3;
  v42.size.CGFloat height = a4;
  double v29 = v28 / ((1.0 - a5) * CGRectGetWidth(v42));
  v43.origin.CGFloat x = a9;
  v43.origin.double y = a10;
  v43.size.CGFloat width = a11;
  v43.size.CGFloat height = a12;
  CGFloat v25 = CGRectGetMaxY(v43) - v34;
  v44.origin.CGFloat x = a1;
  v44.origin.double y = a2;
  v44.size.CGFloat width = a3;
  v44.size.CGFloat height = a4;
  return v36 - a5 * (a3 * fmin(fmin(v32, v29), fmin(v31, v25 / ((1.0 - a6) * CGRectGetHeight(v44)))));
}

double NUPixelRectNormalize(uint64_t *a1, uint64_t *a2)
{
  return ((double)*a1 - (double)*a2) / (double)a2[2];
}

double NURectNormalize(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return (a1 - a5) / a7;
}

double NUPixelRectDenormalize@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  double v8 = (double)a1[2];
  double v9 = (double)a1[3];
  CGFloat v10 = (double)a1[1] + a5 * v9;
  v14.origin.CGFloat x = (double)*a1 + a4 * v8;
  v14.origin.double y = v10;
  v14.size.CGFloat width = a6 * v8;
  v14.size.CGFloat height = a7 * v9;
  NU::RectT<long>::RectT(v13, &v14, a2);
  double result = *(double *)v13;
  long long v12 = v13[1];
  *a3 = v13[0];
  a3[1] = v12;
  return result;
}

double NURectDenormalize(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a5 + a1 * a7;
}

BOOL NUAspectRatioIsEqual(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 | a4) {
    BOOL v4 = a4 * a1 == a3 * a2;
  }
  else {
    BOOL v4 = (a1 | a2 | a3 | a4) == 0;
  }
  if (a1 | a2) {
    return v4;
  }
  else {
    return (a1 | a2 | a3 | a4) == 0;
  }
}

uint64_t NUAspectRatioWithOrientation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((unint64_t)(a3 - 5) >= 4) {
    return a1;
  }
  return a2;
}

uint64_t NUAspectRatioConstrain(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  double v5 = (double)result;
  double v6 = (double)a2;
  double v7 = (double)a3 / (double)a4;
  if (a5 == 1)
  {
    if (v5 / v6 <= v7)
    {
      if (v6 / v5 > v7) {
        return vcvtpd_s64_f64(v6 / v7);
      }
    }
    else
    {
      return vcvtmd_s64_f64(v7 * v6);
    }
  }
  return result;
}

uint64_t NUAspectRatioCompare(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double v4 = (double)a1 / (double)a2;
  double v5 = INFINITY;
  if (!a1) {
    double v5 = NAN;
  }
  if (!a2) {
    double v4 = v5;
  }
  double v6 = (double)a3 / (double)a4;
  double v7 = INFINITY;
  if (!a3) {
    double v7 = NAN;
  }
  if (!a4) {
    double v6 = v7;
  }
  if (v4 < v6) {
    return -1;
  }
  else {
    return v4 > v6;
  }
}

double NUExtractRotationFromStraightenAffineTransform(__n128 *a1)
{
  uint64_t v6 = 0;
  long long v4 = 0u;
  long long v5 = 0u;
  __n128 v1 = a1[1];
  v3[0] = *a1;
  v3[1] = v1;
  v3[2] = a1[2];
  NUDecomposeAffineTransform(v3, (uint64_t)&v4);
  double result = *(double *)&v5 * 180.0 / 3.14159265;
  if (result < 0.0) {
    return result + 360.0;
  }
  return result;
}

double NUConvertCropRectWithStraightenAffineTransform(_OWORD *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  long long v11 = a1[1];
  *(_OWORD *)&v21.a = *a1;
  *(_OWORD *)&v21.c = v11;
  *(_OWORD *)&v21.tCGFloat x = a1[2];
  *(double *)&long long v11 = a7;
  double v13 = -_NUOffsetFromDGCropToCICropWithTransform(&v21, *(CGSize *)((char *)&v11 - 8));
  double v15 = -v14;
  double v16 = a2;
  double v17 = a3;
  double v18 = a4;
  double v19 = a5;

  *(void *)&double result = (unint64_t)CGRectOffset(*(CGRect *)&v16, v13, v15);
  return result;
}

double _NUOffsetFromDGCropToCICropWithTransform(CGAffineTransform *a1, CGSize a2)
{
  CGFloat height = a2.height;
  CGFloat width = a2.width;
  long long v4 = *(_OWORD *)&a1->c;
  *(_OWORD *)&v7.a = *(_OWORD *)&a1->a;
  *(_OWORD *)&v7.c = v4;
  *(_OWORD *)&v7.tCGFloat x = *(_OWORD *)&a1->tx;
  uint64_t v5 = 0;
  *(void *)&long long v4 = 0;
  CGRect v8 = CGRectApplyAffineTransform(*(CGRect *)(&height - 3), &v7);
  *(void *)&double result = (unint64_t)CGRectIntegral(v8);
  return result;
}

void NUConvertCICropRectToDGCropRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, CGFloat a6, CGFloat a7)
{
  memset(&v17, 0, sizeof(v17));
  NUStraightenAffineTransformWithRadians((uint64_t)&v17, a5 * 3.14159265 / 180.0, a6, a7);
  CGAffineTransform v16 = v17;
  v18.CGFloat width = a6;
  v18.CGFloat height = a7;
  CGFloat v13 = -_NUOffsetFromDGCropToCICropWithTransform(&v16, v18);
  CGFloat v15 = -v14;
  v19.origin.CGFloat x = a1;
  v19.origin.double y = a2;
  v19.size.CGFloat width = a3;
  v19.size.CGFloat height = a4;
  CGRectOffset(v19, v13, v15);
}

CGFloat NUStraightenAffineTransformWithRadians@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>)
{
  uint64_t v8 = MEMORY[0x1E4F1DAB8];
  long long v9 = *MEMORY[0x1E4F1DAB8];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)a1 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)(a1 + 16) = v10;
  long long v11 = *(_OWORD *)(v8 + 32);
  *(_OWORD *)(a1 + 32) = v11;
  *(_OWORD *)&v28.a = v9;
  *(_OWORD *)&v28.c = v10;
  *(_OWORD *)&v28.tCGFloat x = v11;
  *(void *)&long long v9 = 0;
  *(void *)&long long v10 = 0;
  *(CGFloat *)&long long v11 = a3;
  CGFloat v12 = a4;
  CGFloat MidX = CGRectGetMidX(*(CGRect *)&v9);
  v29.origin.CGFloat x = 0.0;
  v29.origin.double y = 0.0;
  v29.size.CGFloat width = a3;
  v29.size.CGFloat height = a4;
  CGFloat MidY = CGRectGetMidY(v29);
  CGAffineTransformTranslate((CGAffineTransform *)a1, &v28, MidX, MidY);
  long long v15 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v26.a = *(_OWORD *)a1;
  *(_OWORD *)&v26.c = v15;
  *(_OWORD *)&v26.tCGFloat x = *(_OWORD *)(a1 + 32);
  CGAffineTransformRotate(&v27, &v26, a2);
  long long v16 = *(_OWORD *)&v27.c;
  *(_OWORD *)a1 = *(_OWORD *)&v27.a;
  *(_OWORD *)(a1 + 16) = v16;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v27.tx;
  long long v17 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v25.a = *(_OWORD *)a1;
  *(_OWORD *)&v25.c = v17;
  *(_OWORD *)&v25.tCGFloat x = *(_OWORD *)(a1 + 32);
  uint64_t v18 = 0;
  *(void *)&long long v17 = 0;
  CGFloat v19 = a3;
  CGFloat v20 = a4;
  CGFloat v21 = -CGRectGetMidX(*(CGRect *)((char *)&v17 - 8));
  v30.origin.CGFloat x = 0.0;
  v30.origin.double y = 0.0;
  v30.size.CGFloat width = a3;
  v30.size.CGFloat height = a4;
  CGFloat v22 = CGRectGetMidY(v30);
  CGAffineTransformTranslate(&v27, &v25, v21, -v22);
  long long v23 = *(_OWORD *)&v27.c;
  *(_OWORD *)a1 = *(_OWORD *)&v27.a;
  *(_OWORD *)(a1 + 16) = v23;
  CGFloat result = v27.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v27.tx;
  return result;
}

CGFloat NUStraightenAffineTransformWithDegrees@<D0>(uint64_t a1@<X8>, double a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>)
{
  return NUStraightenAffineTransformWithRadians(a1, a2 * 3.14159265 / 180.0, a3, a4);
}

void NUConvertDGCropRectToCICropRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, CGFloat a6, CGFloat a7)
{
  memset(&v17, 0, sizeof(v17));
  NUStraightenAffineTransformWithRadians((uint64_t)&v17, a5 * 3.14159265 / 180.0, a6, a7);
  CGAffineTransform v16 = v17;
  v18.CGFloat width = a6;
  v18.CGFloat height = a7;
  double v13 = _NUOffsetFromDGCropToCICropWithTransform(&v16, v18);
  CGFloat v15 = v14;
  v19.origin.CGFloat x = a1;
  v19.origin.double y = a2;
  v19.size.CGFloat width = a3;
  v19.size.CGFloat height = a4;
  CGRectOffset(v19, v13, v15);
}

double NUConvertCropRectWithAspectRatio(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  return _rectWithAspectRatio(a1, a2, a3, a4, a5, a6, 1.0);
}

double _rectWithAspectRatio(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7)
{
  unsigned int v7 = vcvtmd_s64_f64(sqrt(a6 * (a5 * a7) * (double)a2 / (double)a1) + 0.5);
  int v8 = v7 | 1;
  int v9 = (v7 & 1) + v7;
  if (vcvtmd_s64_f64(a6)) {
    int v9 = v8;
  }
  unsigned int v10 = vcvtmd_s64_f64(a5);
  unsigned int v11 = vcvtmd_s64_f64(floor((double)a1 * (double)v9 / (double)a2) + 0.5);
  int v12 = v11 | 1;
  int v13 = (v11 & 1) + v11;
  if (v10) {
    int v13 = v12;
  }
  return a3 - (float)((float)(int)(v13 - v10) * 0.5);
}

double NUConvertCropRectWithAspectRatioAndArea(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7)
{
  return _rectWithAspectRatio(a1, a2, a3, a4, a5, a6, a7 / (a5 * a6));
}

__n128 NURecomposeAffineTransform@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  __double2 v4 = __sincos_stret(*(double *)(a1 + 16));
  double v5 = *(double *)a1;
  double v6 = *(double *)(a1 + 8);
  a2->n128_f64[0] = *(double *)a1 * v4.__cosval;
  a2->n128_f64[1] = v4.__sinval * v6;
  a2[1].n128_f64[0] = -(v5 * v4.__sinval);
  a2[1].n128_f64[1] = v4.__cosval * v6;
  __n128 result = *(__n128 *)(a1 + 24);
  a2[2] = result;
  return result;
}

double NUAffineTransformDelta@<D0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, uint64_t a3@<X8>)
{
  double v3 = a2[2].f64[0] - a1[2].f64[0];
  float64x2_t v4 = vsubq_f64(a2[1], a1[1]);
  v6[0] = vdivq_f64(*a2, *a1);
  v6[1] = v4;
  double v7 = v3;
  *(void *)&double result = NUAffineTransformStandardize((uint64_t)v6, a3).n128_u64[0];
  return result;
}

__n128 NUAffineTransformStandardize@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v5 = *(double *)a1;
  double v4 = *(double *)(a1 + 8);
  if (*(double *)a1 >= 0.0)
  {
    if (v4 >= 0.0)
    {
      double v6 = *(double *)(a1 + 16);
      goto LABEL_14;
    }
  }
  else if (v4 < 0.0)
  {
    *(double *)a1 = -v5;
    *(double *)(a1 + _Block_object_dispose(&STACK[0x210], 8) = -v4;
    double v6 = *(double *)(a1 + 16);
    if (v6 > 0.0)
    {
LABEL_12:
      double v7 = -3.14159265;
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  double v6 = *(double *)(a1 + 16);
  if (v6 >= -1.57079633)
  {
    if (v6 <= 1.57079633) {
      goto LABEL_14;
    }
    *(double *)a1 = -v5;
    *(double *)(a1 + _Block_object_dispose(&STACK[0x210], 8) = -v4;
    goto LABEL_12;
  }
  *(double *)a1 = -v5;
  *(double *)(a1 + _Block_object_dispose(&STACK[0x210], 8) = -v4;
LABEL_8:
  double v7 = 3.14159265;
LABEL_13:
  double v6 = v6 + v7;
  *(double *)(a1 + 16) = v6;
LABEL_14:
  double v8 = -3.14159265;
  if (v6 <= -3.14159265)
  {
    double v9 = 3.14159265;
    goto LABEL_18;
  }
  double v8 = 3.14159265;
  if (v6 > 3.14159265)
  {
    double v9 = -3.14159265;
LABEL_18:
    *(long double *)(a1 + 16) = fmod(v6 + v8, 6.28318531) + v9;
  }
  __n128 result = *(__n128 *)a1;
  long long v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v11;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  return result;
}

CGFloat NUCGAffineTransformByMappingFromRectToRect@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>, CGFloat a6@<D4>, CGFloat a7@<D5>, CGFloat a8@<D6>, CGFloat a9@<D7>)
{
  uint64_t v17 = MEMORY[0x1E4F1DAB8];
  long long v18 = *MEMORY[0x1E4F1DAB8];
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)a1 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)(a1 + 16) = v19;
  long long v20 = *(_OWORD *)(v17 + 32);
  *(_OWORD *)(a1 + 32) = v20;
  *(_OWORD *)&v46.a = v18;
  *(_OWORD *)&v46.c = v19;
  *(_OWORD *)&v46.tCGFloat x = v20;
  *(CGFloat *)&long long v18 = a6;
  *(CGFloat *)&long long v19 = a7;
  *(CGFloat *)&long long v20 = a8;
  CGFloat MinX = CGRectGetMinX(*(CGRect *)&v18);
  v47.origin.CGFloat x = a6;
  v47.origin.double y = a7;
  v47.size.CGFloat width = a8;
  v47.size.CGFloat height = a9;
  CGFloat MinY = CGRectGetMinY(v47);
  CGAffineTransformTranslate((CGAffineTransform *)a1, &v46, MinX, MinY);
  long long v24 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v44.a = *(_OWORD *)a1;
  *(_OWORD *)&v44.c = v24;
  *(_OWORD *)&v44.tCGFloat x = *(_OWORD *)(a1 + 32);
  CGFloat v25 = a6;
  *(CGFloat *)&long long v24 = a7;
  CGFloat v26 = a8;
  CGFloat v27 = a9;
  double Width = CGRectGetWidth(*(CGRect *)((char *)&v24 - 8));
  v48.origin.CGFloat x = a2;
  v48.origin.double y = a3;
  v48.size.CGFloat width = a4;
  v48.size.CGFloat height = a5;
  CGFloat v29 = Width / CGRectGetWidth(v48);
  v49.origin.CGFloat x = a6;
  v49.origin.double y = a7;
  v49.size.CGFloat width = a8;
  v49.size.CGFloat height = a9;
  double Height = CGRectGetHeight(v49);
  v50.origin.CGFloat x = a2;
  v50.origin.double y = a3;
  v50.size.CGFloat width = a4;
  v50.size.CGFloat height = a5;
  CGFloat v31 = CGRectGetHeight(v50);
  CGAffineTransformScale(&v45, &v44, v29, Height / v31);
  long long v32 = *(_OWORD *)&v45.c;
  *(_OWORD *)a1 = *(_OWORD *)&v45.a;
  *(_OWORD *)(a1 + 16) = v32;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v45.tx;
  long long v33 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v43.a = *(_OWORD *)a1;
  *(_OWORD *)&v43.c = v33;
  *(_OWORD *)&v43.tCGFloat x = *(_OWORD *)(a1 + 32);
  CGFloat v34 = a2;
  *(CGFloat *)&long long v33 = a3;
  CGFloat v35 = a4;
  CGFloat v36 = a5;
  CGFloat v37 = -CGRectGetMinX(*(CGRect *)((char *)&v33 - 8));
  v51.origin.CGFloat x = a2;
  v51.origin.double y = a3;
  v51.size.CGFloat width = a4;
  v51.size.CGFloat height = a5;
  CGFloat v38 = CGRectGetMinY(v51);
  CGAffineTransformTranslate(&v45, &v43, v37, -v38);
  long long v39 = *(_OWORD *)&v45.c;
  *(_OWORD *)a1 = *(_OWORD *)&v45.a;
  *(_OWORD *)(a1 + 16) = v39;
  CGFloat result = v45.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v45.tx;
  return result;
}

__n128 NUCGAffineTransformFlipYInRect@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  __n128 v12 = a1[1];
  *(__n128 *)&v23.a = *a1;
  *(__n128 *)&v23.c = v12;
  *(__n128 *)&v23.tCGFloat x = a1[2];
  CGAffineTransformScale(&v24, &v23, 1.0, -1.0);
  __n128 v13 = *(__n128 *)&v24.c;
  *a1 = *(__n128 *)&v24.a;
  a1[1] = v13;
  a1[2] = *(__n128 *)&v24.tx;
  __n128 v14 = a1[1];
  *(__n128 *)&v22.a = *a1;
  *(__n128 *)&v22.c = v14;
  *(__n128 *)&v22.tCGFloat x = a1[2];
  double v15 = a3;
  v14.n128_f64[0] = a4;
  double v16 = a5;
  double v17 = a6;
  CGFloat Height = CGRectGetHeight(*(CGRect *)((char *)&v14 - 8));
  CGAffineTransformTranslate(&v24, &v22, 0.0, -Height);
  __n128 v19 = *(__n128 *)&v24.c;
  *a1 = *(__n128 *)&v24.a;
  a1[1] = v19;
  a1[2] = *(__n128 *)&v24.tx;
  __n128 v20 = a1[1];
  *a2 = *a1;
  a2[1] = v20;
  __n128 result = a1[2];
  a2[2] = result;
  return result;
}

double NUCGPointConvertFromRectToRect(int a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, double a8, double a9, CGFloat a10, CGFloat a11, CGFloat a12, CGFloat a13)
{
  float64x2_t v29 = 0u;
  float64x2_t v30 = 0u;
  float64x2_t v28 = 0u;
  NUCGAffineTransformByMappingFromRectToRect((uint64_t)&v28, a4, a5, a6, a7, a10, a11, a12, a13);
  if (a1)
  {
    v26[0] = (__n128)v28;
    v26[1] = (__n128)v29;
    _OWORD v26[2] = (__n128)v30;
    NUCGAffineTransformFlipYInRect(v26, v27, a4, a5, a6, a7);
    float64x2_t v28 = (float64x2_t)v27[0];
    float64x2_t v29 = (float64x2_t)v27[1];
    float64x2_t v30 = (float64x2_t)v27[2];
  }
  *(void *)&double result = *(_OWORD *)&vaddq_f64(v30, vmlaq_n_f64(vmulq_n_f64(v29, a3), v28, a2));
  return result;
}

void NUCGRectConvertFromRectToRect(int a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10, CGFloat a11, CGFloat a12, CGFloat a13)
{
  memset(&v32, 0, sizeof(v32));
  NUCGAffineTransformByMappingFromRectToRect((uint64_t)&v32, a6, a7, a8, a9, a10, a11, a12, a13);
  if (a1)
  {
    v30[0] = *(__n128 *)&v32.a;
    v30[1] = *(__n128 *)&v32.c;
    v30[2] = *(__n128 *)&v32.tx;
    NUCGAffineTransformFlipYInRect(v30, v31, a6, a7, a8, a9);
    *(__n128 *)&v32.a = v31[0];
    *(__n128 *)&v32.c = v31[1];
    *(__n128 *)&v32.tCGFloat x = v31[2];
  }
  CGAffineTransform v29 = v32;
  v33.origin.CGFloat x = a2;
  v33.origin.double y = a3;
  v33.size.CGFloat width = a4;
  v33.size.CGFloat height = a5;
  CGRectApplyAffineTransform(v33, &v29);
}

id NUAssertLogger_15829()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_150);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A99A162C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A99A16B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A99A17C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A99A18F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A99A1C04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A99A1EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1A99A2240(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A99A22DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A99A25A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A99A2D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Unwind_Resume(a1);
}

void sub_1A99A2EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A99A3010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A99A32D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A99A35A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A99A3680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A99A3924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A99A39EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A99A3A50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id NUAssertLogger_16223()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16236);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A99A44BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

id NUAssertLogger_16313()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_99);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A99A603C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16363(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16364(uint64_t a1)
{
}

id NUAssertLogger_16485()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16517);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_16692()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16706);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_16790()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16761);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_17470()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_147_17493);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void NUCopyCVBufferAttachment(__CVBuffer *a1, __CVBuffer *a2, CFStringRef key)
{
  CVAttachmentMode attachmentMode = kCVAttachmentMode_ShouldNotPropagate;
  CFTypeRef v5 = CVBufferCopyAttachment(a1, key, &attachmentMode);
  if (v5)
  {
    double v6 = v5;
    CVBufferSetAttachment(a2, key, v5, attachmentMode);
    CFRelease(v6);
  }
  else
  {
    CVBufferRemoveAttachment(a2, key);
  }
}

void sub_1A99C87FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&STACK[0x220], 8);
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17515(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17516(uint64_t a1)
{
}

void sub_1A99C8BDC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_17689()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_17703);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

uint64_t NUImagePropertyAlphaFromCGBitmapInfo(char a1)
{
  if ((a1 & 0x1Fu) > 6) {
    return 0;
  }
  else {
    return qword_1A9A74630[a1 & 0x1F];
  }
}

uint64_t NUImagePropertyComponentFromCGBitmapInfo(unsigned int a1)
{
  if ((a1 & 0x100) != 0) {
    return 4;
  }
  unsigned int v1 = (a1 >> 12) & 7;
  if (v1 > 4) {
    return 0;
  }
  else {
    return qword_1A9A74668[v1];
  }
}

id NUAssertLogger_17835()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_17882);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_17959()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_75_17979);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

uint64_t __Block_byref_object_copy__17988(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17989(uint64_t a1)
{
}

id NUAssertLogger_18222()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_18237);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

uint64_t NU::Rational<long>::compare(void *a1, void *a2)
{
  unint64_t v2 = a2[1];
  unint64_t v3 = a1[1];
  uint64_t v4 = v2 * *a1;
  uint64_t v5 = v3 * *a2;
  if (v5 == v4) {
    return 0;
  }
  int v7 = (v3 >> 63) + (v2 >> 63);
  BOOL v8 = v4 < v5;
  uint64_t v9 = 1;
  if (v8) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = -1;
  }
  if (v8) {
    uint64_t v9 = -1;
  }
  if (v7 == 1) {
    return v10;
  }
  else {
    return v9;
  }
}

uint64_t NU::Rational<int>::compare(int *a1, int *a2)
{
  int v2 = a2[1];
  int v3 = a1[1];
  uint64_t v4 = v2 * (uint64_t)*a1;
  uint64_t v5 = v3 * (uint64_t)*a2;
  if (v5 == v4) {
    return 0;
  }
  int v7 = (v3 >> 31) + (v2 >> 31);
  BOOL v8 = v4 < v5;
  uint64_t v9 = 1;
  if (v8) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = -1;
  }
  if (v8) {
    uint64_t v9 = -1;
  }
  if (v7 == 1) {
    return v10;
  }
  else {
    return v9;
  }
}

uint64_t NU::Rational<unsigned int>::compare(unsigned int *a1, unsigned int *a2)
{
  unint64_t v2 = a2[1] * (unint64_t)*a1;
  unint64_t v3 = a1[1] * (unint64_t)*a2;
  uint64_t v4 = 1;
  if (v2 <= v3) {
    uint64_t v4 = -1;
  }
  if (v3 == v2) {
    return 0;
  }
  else {
    return v4;
  }
}

id NUAssertLogger_18326()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_304);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_18654()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_18676);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A99D51F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  _Unwind_Resume(a1);
}

void sub_1A99D554C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A99D598C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A99D5CE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  _Unwind_Resume(a1);
}

void sub_1A99D61E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A99D640C(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A99D68E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A99D69AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A99D6DD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A99D72B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A99D77A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A99D7DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_18966()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_18989);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_19081()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_19274()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_19307);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_19531()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_19548);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A99E0458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_19657()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_19673);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A99E2C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_19855()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_19881);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

uint64_t __Block_byref_object_copy__19868(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19869(uint64_t a1)
{
}

id NUAssertLogger_19954()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_19934);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_19996()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_20009);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

uint64_t __Block_byref_object_copy__20063(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20064(uint64_t a1)
{
}

id NUAssertLogger_20069()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_20082);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_20242()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_20160);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

__CFString *NUSegmentationTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Unknown";
  }
  else {
    return off_1E5D95400[a1 - 1];
  }
}

__CFString *NUVisionSegmentationPolicyDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"First";
  }
  else {
    return off_1E5D95418[a1 - 1];
  }
}

id NUAssertLogger_20401()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_20416);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_20502()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_20523);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A99E9000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20528(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20529(uint64_t a1)
{
}

id NUAssertLogger_20677()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_20692);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_20854()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_132_20868);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_21040()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_21065);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A99F132C(_Unwind_Exception *a1)
{
}

id NUAssertLogger_21148()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_21171);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

uint64_t __Block_byref_object_copy__21255(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21256(uint64_t a1)
{
}

id NUAssertLogger_21543()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_21564);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_21663()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_21680);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

uint64_t __Block_byref_object_copy__21939(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21940(uint64_t a1)
{
}

id NUAssertLogger_21966()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A99FF7E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 56), 8);
  _Unwind_Resume(a1);
}

void sub_1A99FFA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A99FFBE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 56), 8);
  _Unwind_Resume(a1);
}

void sub_1A9A00734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A9A03F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Unwind_Resume(a1);
}

BOOL NU::Region::includes(NU::Region *this, const NU::Region *a2)
{
  if (!*((void *)a2 + 3)) {
    return 0;
  }
  std::unordered_set<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::unordered_set((uint64_t)&v5, (uint64_t)a2);
  NU::Region::breakRects((uint64_t)this, &v5);
  NU::Region::mergeRectsVertically((NU::Region *)&v5);
  BOOL v3 = v6 == 0;
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&v5);
  return v3;
}

void sub_1A9A04E3C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_set<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::unordered_set(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__rehash<true>(a1, *(void *)(a2 + 8));
  for (uint64_t i = *(__n128 **)(a2 + 16); i; uint64_t i = (__n128 *)i->n128_u64[0])
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect const&>(a1, (uint64_t *)&i[1], i[1], i[2]);
  return a1;
}

void sub_1A9A04EB0(_Unwind_Exception *a1)
{
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::breakRects(uint64_t result, __n128 *a2)
{
  unint64_t v2 = *(void **)(result + 16);
  if (v2)
  {
    uint64_t v4 = a2 + 1;
    do
    {
      long long v6 = 0u;
      long long v7 = 0u;
      __n128 v5 = v4;
      int v8 = 1065353216;
      while (1)
      {
        __n128 v5 = (__n128 *)v5->n128_u64[0];
        if (!v5) {
          break;
        }
        NU::Region::breakRects(v5 + 1, v2 + 2, (uint64_t)&v6);
      }
      if (&v6 != (long long *)a2)
      {
        a2[2].n128_u32[0] = v8;
        std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<NU::RegionRect,void *> *>>(a2, (uint64_t *)v7);
      }
      double result = std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&v6);
      unint64_t v2 = (void *)*v2;
    }
    while (v2);
  }
  return result;
}

void sub_1A9A04F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t NU::Region::mergeRectsVertically(NU::Region *this)
{
  long long v19 = 0u;
  long long v20 = 0u;
  int v21 = 1065353216;
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__rehash<true>((uint64_t)&v19, (unint64_t)(float)*((unint64_t *)this + 3));
  for (uint64_t i = (void *)*((void *)this + 2); i; uint64_t i = (void *)*i)
  {
    unint64_t v3 = i[2];
    unint64_t v4 = i[3];
    unint64_t v15 = v3;
    int64_t v16 = v4;
    unint64_t v5 = i[4];
    unint64_t v6 = i[5];
    unint64_t v17 = v5;
    unint64_t v18 = v6;
    long long v7 = (uint64_t *)v20;
    if ((void)v20)
    {
      do
      {
        while (1)
        {
          uint64_t v8 = v7[3];
          if ((v18 + v16 == v8 || v16 == v7[5] + v8) && v15 == v7[2] && v17 == v7[4]) {
            break;
          }
          long long v7 = (uint64_t *)*v7;
          if (!v7) {
            goto LABEL_16;
          }
        }
        if (v8 >= v16) {
          uint64_t v9 = v16;
        }
        else {
          uint64_t v9 = v7[3];
        }
        NU::RectT<long>::setYMin((uint64_t *)&v15, v9);
        uint64_t v10 = v7[5];
        if ((uint64_t)(v18 + v16) <= v10 + v7[3]) {
          uint64_t v11 = v10 + v7[3];
        }
        else {
          uint64_t v11 = v18 + v16;
        }
        NU::RectT<long>::setYMax((uint64_t *)&v15, v11);
        long long v7 = (uint64_t *)std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::erase(&v19, v7);
      }
      while (v7);
LABEL_16:
      unint64_t v3 = v15;
      unint64_t v4 = v16;
      unint64_t v5 = v17;
      unint64_t v6 = v18;
    }
    v13.n128_u64[0] = v3;
    v13.n128_u64[1] = v4;
    v14.n128_u64[0] = v5;
    v14.n128_u64[1] = v6;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>((uint64_t)&v19, (uint64_t *)&v13, v13, v14);
  }
  if (&v19 != (long long *)this)
  {
    *((_DWORD *)this + _Block_object_dispose(&STACK[0x210], 8) = v21;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<NU::RegionRect,void *> *>>(this, (uint64_t *)v20);
  }
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&v19);
}

void sub_1A9A050F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      operator delete(v2);
      unint64_t v2 = v3;
    }
    while (v3);
  }
  unint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }
    else
    {
      uint64_t v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }
    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      int64_t v16 = *(void **)a1;
      *(void *)a1 = 0;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + _Block_object_dispose(&STACK[0x210], 8) = 0;
      return;
    }
  }
  if (prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  unint64_t v5 = operator new(8 * prime);
  unint64_t v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x210], 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  uint64_t v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }
    else
    {
      v9 &= prime - 1;
    }
    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    __n128 v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *uint64_t v8 = *v14;
          *__n128 v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          __n128 v14 = v8;
        }
        size_t v15 = v9;
LABEL_31:
        uint64_t v8 = v14;
        __n128 v14 = (void *)*v14;
        size_t v9 = v15;
      }
      while (v14);
    }
  }
}

void std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<NU::RegionRect,void *> *>>(void *a1, uint64_t *a2)
{
  uint64_t v4 = a1[1];
  if (!v4) {
    goto LABEL_9;
  }
  for (uint64_t i = 0; i != v4; *(void *)(*a1 + 8 * i++) = 0)
    ;
  unint64_t v6 = (unsigned char *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v6)
  {
    while (a2)
    {
      long long v7 = *((_OWORD *)a2 + 1);
      long long v8 = *((_OWORD *)a2 + 2);
      v6[48] = *((unsigned char *)a2 + 48);
      *((_OWORD *)v6 + 1) = v7;
      *((_OWORD *)v6 + 2) = v8;
      size_t v9 = *(unsigned char **)v6;
      std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__node_insert_multi((uint64_t)a1, (uint64_t)v6);
      a2 = (uint64_t *)*a2;
      unint64_t v6 = v9;
      if (!v9) {
        goto LABEL_9;
      }
    }
    do
    {
      size_t v15 = *(unsigned char **)v6;
      operator delete(v6);
      unint64_t v6 = v15;
    }
    while (v15);
  }
  else
  {
LABEL_9:
    while (a2)
    {
      uint8x8_t v10 = operator new(0x38uLL);
      *uint8x8_t v10 = 0;
      uint64_t v11 = a2[2];
      uint64_t v12 = a2[3];
      uint64_t v13 = a2[4];
      uint64_t v14 = a2[5];
      v10[3] = v12;
      void v10[4] = v13;
      void v10[5] = v14;
      v10[1] = (COERCE__INT64((double)v11) + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(COERCE__INT64((double)v12)
                                                                                              + 4095) >> 32 << 24) ^ ((unint64_t)(COERCE__INT64((double)v13) + 4095) >> 32 << 8) ^ ((unint64_t)(COERCE__INT64((double)v14) + 4095) >> 32);
      _OWORD v10[2] = v11;
      std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__node_insert_multi((uint64_t)a1, (uint64_t)v10);
      a2 = (uint64_t *)*a2;
    }
  }
}

void sub_1A9A05484(void *a1)
{
  __cxa_begin_catch(a1);
  do
  {
    unint64_t v2 = (void *)*v1;
    operator delete(v1);
    uint64_t v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_1A9A054A4(_Unwind_Exception *a1)
{
}

uint64_t std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::erase(void *a1, uint64_t *__p)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  uint64_t v4 = *__p;
  unint64_t v3 = __p[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v2);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v3 >= *(void *)&v2) {
      v3 %= *(void *)&v2;
    }
  }
  else
  {
    v3 &= *(void *)&v2 - 1;
  }
  unint64_t v6 = *(uint64_t **)(*a1 + 8 * v3);
  do
  {
    long long v7 = v6;
    unint64_t v6 = (uint64_t *)*v6;
  }
  while (v6 != __p);
  if (v7 != a1 + 2)
  {
    unint64_t v8 = v7[1];
    if (v5.u32[0] > 1uLL)
    {
      if (v8 >= *(void *)&v2) {
        v8 %= *(void *)&v2;
      }
    }
    else
    {
      v8 &= *(void *)&v2 - 1;
    }
    uint64_t v9 = *__p;
    if (v8 == v3)
    {
LABEL_20:
      if (!v9) {
        goto LABEL_27;
      }
      goto LABEL_21;
    }
  }
  if (!v4) {
    goto LABEL_19;
  }
  unint64_t v10 = *(void *)(v4 + 8);
  if (v5.u32[0] > 1uLL)
  {
    if (v10 >= *(void *)&v2) {
      v10 %= *(void *)&v2;
    }
  }
  else
  {
    v10 &= *(void *)&v2 - 1;
  }
  uint64_t v9 = *__p;
  if (v10 != v3)
  {
LABEL_19:
    *(void *)(*a1 + 8 * v3) = 0;
    uint64_t v9 = *__p;
    goto LABEL_20;
  }
LABEL_21:
  unint64_t v11 = *(void *)(v9 + 8);
  if (v5.u32[0] > 1uLL)
  {
    if (v11 >= *(void *)&v2) {
      v11 %= *(void *)&v2;
    }
  }
  else
  {
    v11 &= *(void *)&v2 - 1;
  }
  if (v11 != v3)
  {
    *(void *)(*a1 + 8 * v11) = v7;
    uint64_t v9 = *__p;
  }
LABEL_27:
  uint64_t *v7 = v9;
  *__p = 0;
  --a1[3];
  operator delete(__p);
  return v4;
}

void std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>(uint64_t a1, uint64_t *a2, __n128 a3, __n128 a4)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = a2[2];
  uint64_t v8 = a2[3];
  unint64_t v9 = (COERCE__INT64((double)*a2) + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(COERCE__INT64((double)v6) + 4095) >> 32 << 24) ^ ((unint64_t)(COERCE__INT64((double)v7) + 4095) >> 32 << 8) ^ ((unint64_t)(COERCE__INT64((double)v8) + 4095) >> 32);
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v4 = (COERCE__INT64((double)*a2) + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(COERCE__INT64((double)v6)
                                                                                          + 4095) >> 32 << 24) ^ ((unint64_t)(COERCE__INT64((double)v7) + 4095) >> 32 << 8) ^ ((unint64_t)(COERCE__INT64((double)v8) + 4095) >> 32);
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
    }
    else
    {
      unint64_t v4 = v9 & (v10 - 1);
    }
    uint64_t v12 = *(void **)(*(void *)a1 + 8 * v4);
    if (v12)
    {
      for (uint64_t i = (void *)*v12; i; uint64_t i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v9)
        {
          if (i[2] == *a2 && i[3] == v6 && i[4] == v7 && i[5] == v8) {
            return;
          }
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= v10) {
              v14 %= v10;
            }
          }
          else
          {
            v14 &= v10 - 1;
          }
          if (v14 != v4) {
            break;
          }
        }
      }
    }
  }
  size_t v15 = (__n128 *)operator new(0x38uLL);
  v15->n128_u64[0] = 0;
  v15->n128_u64[1] = v9;
  v15[1] = a3;
  _OWORD v15[2] = a4;
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__rehash<true>(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
      else {
        unint64_t v4 = v9;
      }
    }
    else
    {
      unint64_t v4 = (v10 - 1) & v9;
    }
  }
  uint64_t v22 = *(void *)a1;
  CGAffineTransform v23 = *(__n128 ***)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    v15->n128_u64[0] = (unint64_t)*v23;
LABEL_41:
    *CGAffineTransform v23 = v15;
    goto LABEL_42;
  }
  v15->n128_u64[0] = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v15;
  *(void *)(v22 + 8 * v4) = a1 + 16;
  if (v15->n128_u64[0])
  {
    unint64_t v24 = *(void *)(v15->n128_u64[0] + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v24 >= v10) {
        v24 %= v10;
      }
    }
    else
    {
      v24 &= v10 - 1;
    }
    CGAffineTransform v23 = (__n128 **)(*(void *)a1 + 8 * v24);
    goto LABEL_41;
  }
LABEL_42:
  ++*(void *)(a1 + 24);
}

void sub_1A9A0588C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__node_insert_multi(uint64_t a1, uint64_t a2)
{
  int8x16_t v4 = vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)vaddq_s64((int64x2_t)vcvtq_f64_s64(*(int64x2_t *)(a2 + 24)), vdupq_n_s64(0xFFFuLL)), (uint64x2_t)xmmword_1A9A72EA0), (int8x16_t)xmmword_1A9A72EB0);
  unint64_t v5 = v4.i64[0] ^ (COERCE__INT64((double)*(uint64_t *)(a2 + 16)) + 4095) & 0xFFFFFFFF00000000 ^ v4.i64[1] ^ ((unint64_t)(COERCE__INT64((double)*(uint64_t *)(a2 + 40)) + 4095) >> 32);
  *(void *)(a2 + _Block_object_dispose(&STACK[0x210], 8) = v5;
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    BOOL v9 = 1;
    if (v6 >= 3) {
      BOOL v9 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v10 = v9 | (2 * v6);
    unint64_t v11 = vcvtps_u32_f32(v7 / v8);
    if (v10 <= v11) {
      int8x8_t prime = (int8x8_t)v11;
    }
    else {
      int8x8_t prime = (int8x8_t)v10;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v6 = *(void *)(a1 + 8);
    }
    if (*(void *)&prime > v6) {
      goto LABEL_98;
    }
    if (*(void *)&prime >= v6) {
      goto LABEL_46;
    }
    unint64_t v19 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (v6 < 3 || (uint8x8_t v20 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v20.i16[0] = vaddlv_u8(v20), v20.u32[0] > 1uLL))
    {
      unint64_t v19 = std::__next_prime(v19);
    }
    else
    {
      uint64_t v21 = 1 << -(char)__clz(v19 - 1);
      if (v19 >= 2) {
        unint64_t v19 = v21;
      }
    }
    if (*(void *)&prime <= v19) {
      int8x8_t prime = (int8x8_t)v19;
    }
    if (*(void *)&prime >= v6)
    {
      unint64_t v6 = *(void *)(a1 + 8);
      goto LABEL_46;
    }
    if (prime)
    {
LABEL_98:
      if (*(void *)&prime >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v13 = operator new(8 * *(void *)&prime);
      unint64_t v14 = *(void **)a1;
      *(void *)a1 = v13;
      if (v14) {
        operator delete(v14);
      }
      uint64_t v15 = 0;
      *(int8x8_t *)(a1 + _Block_object_dispose(&STACK[0x210], 8) = prime;
      do
        *(void *)(*(void *)a1 + 8 * v15++) = 0;
      while (*(void *)&prime != v15);
      float v16 = *(void **)(a1 + 16);
      if (v16)
      {
        unint64_t v17 = v16[1];
        uint8x8_t v18 = (uint8x8_t)vcnt_s8(prime);
        v18.i16[0] = vaddlv_u8(v18);
        if (v18.u32[0] > 1uLL)
        {
          if (v17 >= *(void *)&prime) {
            v17 %= *(void *)&prime;
          }
        }
        else
        {
          v17 &= *(void *)&prime - 1;
        }
        *(void *)(*(void *)a1 + 8 * v17) = a1 + 16;
        for (uint64_t i = (void *)*v16; *v16; uint64_t i = (void *)*v16)
        {
          unint64_t v23 = i[1];
          if (v18.u32[0] > 1uLL)
          {
            if (v23 >= *(void *)&prime) {
              v23 %= *(void *)&prime;
            }
          }
          else
          {
            v23 &= *(void *)&prime - 1;
          }
          if (v23 == v17)
          {
            float v16 = i;
          }
          else
          {
            unint64_t v24 = i;
            if (*(void *)(*(void *)a1 + 8 * v23))
            {
              do
              {
                CGFloat v25 = v24;
                unint64_t v24 = (void *)*v24;
              }
              while (v24 && i[2] == v24[2] && i[3] == v24[3] && i[4] == v24[4] && i[5] == v24[5]);
              *float v16 = v24;
              void *v25 = **(void **)(*(void *)a1 + 8 * v23);
              **(void **)(*(void *)a1 + 8 * v23) = i;
            }
            else
            {
              *(void *)(*(void *)a1 + 8 * v23) = v16;
              float v16 = i;
              unint64_t v17 = v23;
            }
          }
        }
      }
      unint64_t v6 = (unint64_t)prime;
    }
    else
    {
      uint64_t v37 = *(void **)a1;
      *(void *)a1 = 0;
      if (v37) {
        operator delete(v37);
      }
      unint64_t v6 = 0;
      *(void *)(a1 + _Block_object_dispose(&STACK[0x210], 8) = 0;
    }
  }
LABEL_46:
  uint8x8_t v26 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v26.i16[0] = vaddlv_u8(v26);
  if (v26.u32[0] > 1uLL)
  {
    unint64_t v27 = v5;
    if (v6 <= v5) {
      unint64_t v27 = v5 % v6;
    }
  }
  else
  {
    unint64_t v27 = (v6 - 1) & v5;
  }
  float64x2_t v28 = *(void **)(*(void *)a1 + 8 * v27);
  if (v28)
  {
    int v29 = 0;
    do
    {
      float64x2_t v30 = v28;
      float64x2_t v28 = (void *)*v28;
      if (!v28) {
        break;
      }
      unint64_t v31 = v28[1];
      if (v26.u32[0] > 1uLL)
      {
        unint64_t v32 = v28[1];
        if (v31 >= v6) {
          unint64_t v32 = v31 % v6;
        }
      }
      else
      {
        unint64_t v32 = v31 & (v6 - 1);
      }
      if (v32 != v27) {
        break;
      }
      BOOL v33 = v31 == v5
         && v28[2] == *(void *)(a2 + 16)
         && v28[3] == *(void *)(a2 + 24)
         && v28[4] == *(void *)(a2 + 32)
         && v28[5] == *(void *)(a2 + 40);
      int v34 = v29 & !v33;
      v29 |= v33;
    }
    while (v34 != 1);
  }
  else
  {
    float64x2_t v30 = 0;
  }
  unint64_t v35 = *(void *)(a2 + 8);
  if (v26.u32[0] > 1uLL)
  {
    if (v35 >= v6) {
      v35 %= v6;
    }
  }
  else
  {
    v35 &= v6 - 1;
  }
  if (!v30)
  {
    *(void *)a2 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = a2;
    *(void *)(*(void *)a1 + 8 * v35) = a1 + 16;
    if (!*(void *)a2) {
      goto LABEL_85;
    }
    unint64_t v36 = *(void *)(*(void *)a2 + 8);
    if (v26.u32[0] > 1uLL)
    {
      if (v36 >= v6) {
        v36 %= v6;
      }
    }
    else
    {
      v36 &= v6 - 1;
    }
LABEL_84:
    *(void *)(*(void *)a1 + 8 * v36) = a2;
    goto LABEL_85;
  }
  *(void *)a2 = *v30;
  void *v30 = a2;
  if (*(void *)a2)
  {
    unint64_t v36 = *(void *)(*(void *)a2 + 8);
    if (v26.u32[0] > 1uLL)
    {
      if (v36 >= v6) {
        v36 %= v6;
      }
    }
    else
    {
      v36 &= v6 - 1;
    }
    if (v36 != v35) {
      goto LABEL_84;
    }
  }
LABEL_85:
  ++*(void *)(a1 + 24);
}

void NU::Region::breakRects(__n128 *a1, uint64_t *a2, uint64_t a3)
{
  if (!NU::RectT<long>::intersects((uint64_t *)a1, a2))
  {
    __n128 v14 = *a1;
    __n128 v15 = a1[1];
    goto LABEL_11;
  }
  int64_t v6 = a1->n128_u64[0];
  int64_t v7 = a1->n128_i64[1];
  v20.n128_u64[0] = a1->n128_u64[0];
  v20.n128_u64[1] = v7;
  unint64_t v9 = a1[1].n128_u64[0];
  unint64_t v8 = a1[1].n128_u64[1];
  v21.n128_u64[0] = v9;
  v21.n128_u64[1] = v8;
  uint64_t v10 = a2[1];
  if (v7 < v10)
  {
    v18.n128_u64[0] = v6;
    v18.n128_u64[1] = v7;
    v19.n128_u64[0] = v9;
    v19.n128_u64[1] = v8;
    NU::RectT<long>::setYMax((uint64_t *)&v18, v10);
    NU::RectT<long>::setYMin((uint64_t *)&v20, a2[1]);
    __n128 v16 = v18;
    __n128 v17 = v19;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>(a3, (uint64_t *)&v16, v18, v19);
    unint64_t v8 = a1[1].n128_u64[1];
    uint64_t v10 = a2[1];
    int64_t v6 = a1->n128_u64[0];
    int64_t v7 = a1->n128_i64[1];
  }
  uint64_t v11 = a2[3] + v10;
  if ((uint64_t)(v8 + v7) > v11)
  {
    v18.n128_u64[0] = v6;
    v18.n128_u64[1] = v7;
    v19.n128_u64[0] = a1[1].n128_u64[0];
    v19.n128_u64[1] = v8;
    NU::RectT<long>::setYMin((uint64_t *)&v18, v11);
    NU::RectT<long>::setYMax((uint64_t *)&v20, a2[3] + a2[1]);
    __n128 v16 = v18;
    __n128 v17 = v19;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>(a3, (uint64_t *)&v16, v18, v19);
    int64_t v6 = a1->n128_u64[0];
  }
  uint64_t v12 = *a2;
  if (v6 < *a2)
  {
    __n128 v18 = v20;
    __n128 v19 = v21;
    NU::RectT<long>::setXMax((uint64_t *)&v18, v12);
    __n128 v16 = v18;
    __n128 v17 = v19;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>(a3, (uint64_t *)&v16, v18, v19);
    int64_t v6 = a1->n128_u64[0];
    uint64_t v12 = *a2;
  }
  uint64_t v13 = a2[2] + v12;
  if ((int64_t)(a1[1].n128_u64[0] + v6) > v13)
  {
    __n128 v18 = v20;
    __n128 v19 = v21;
    NU::RectT<long>::setXMin((uint64_t *)&v18, v13);
    __n128 v14 = v18;
    __n128 v15 = v19;
LABEL_11:
    __n128 v16 = v14;
    __n128 v17 = v15;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>(a3, (uint64_t *)&v16, v14, v15);
  }
}

void std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect const&>(uint64_t a1, uint64_t *a2, __n128 a3, __n128 a4)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = a2[2];
  uint64_t v8 = a2[3];
  unint64_t v9 = (COERCE__INT64((double)*a2) + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(COERCE__INT64((double)v6) + 4095) >> 32 << 24) ^ ((unint64_t)(COERCE__INT64((double)v7) + 4095) >> 32 << 8) ^ ((unint64_t)(COERCE__INT64((double)v8) + 4095) >> 32);
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v4 = (COERCE__INT64((double)*a2) + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(COERCE__INT64((double)v6)
                                                                                          + 4095) >> 32 << 24) ^ ((unint64_t)(COERCE__INT64((double)v7) + 4095) >> 32 << 8) ^ ((unint64_t)(COERCE__INT64((double)v8) + 4095) >> 32);
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
    }
    else
    {
      unint64_t v4 = v9 & (v10 - 1);
    }
    uint64_t v12 = *(void **)(*(void *)a1 + 8 * v4);
    if (v12)
    {
      for (uint64_t i = (void *)*v12; i; uint64_t i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v9)
        {
          if (i[2] == *a2 && i[3] == v6 && i[4] == v7 && i[5] == v8) {
            return;
          }
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= v10) {
              v14 %= v10;
            }
          }
          else
          {
            v14 &= v10 - 1;
          }
          if (v14 != v4) {
            break;
          }
        }
      }
    }
  }
  __n128 v15 = (__n128 *)operator new(0x38uLL);
  v15->n128_u64[0] = 0;
  v15->n128_u64[1] = v9;
  v15[1] = a3;
  _OWORD v15[2] = a4;
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__rehash<true>(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
      else {
        unint64_t v4 = v9;
      }
    }
    else
    {
      unint64_t v4 = (v10 - 1) & v9;
    }
  }
  uint64_t v22 = *(void *)a1;
  unint64_t v23 = *(__n128 ***)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    v15->n128_u64[0] = (unint64_t)*v23;
LABEL_41:
    *unint64_t v23 = v15;
    goto LABEL_42;
  }
  v15->n128_u64[0] = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v15;
  *(void *)(v22 + 8 * v4) = a1 + 16;
  if (v15->n128_u64[0])
  {
    unint64_t v24 = *(void *)(v15->n128_u64[0] + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v24 >= v10) {
        v24 %= v10;
      }
    }
    else
    {
      v24 &= v10 - 1;
    }
    unint64_t v23 = (__n128 **)(*(void *)a1 + 8 * v24);
    goto LABEL_41;
  }
LABEL_42:
  ++*(void *)(a1 + 24);
}

void sub_1A9A06158(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL NU::Region::includes(NU::Region *a1, __n128 *a2)
{
  NU::Region::Region((uint64_t)v5, a2);
  BOOL v3 = NU::Region::includes(a1, (const NU::Region *)v5);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)v5);
  return v3;
}

void sub_1A9A061E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::Region(uint64_t a1, __n128 *a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  unint64_t v3 = a2[1].n128_u64[0];
  unint64_t v4 = a2[1].n128_u64[1];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    __n128 v7 = *a2;
    v8.n128_u64[0] = v3;
    v8.n128_u64[1] = v4;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>(a1, (uint64_t *)&v7, v7, v8);
  }
  return a1;
}

void sub_1A9A06264(_Unwind_Exception *a1)
{
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::intersects(uint64_t a1, uint64_t a2)
{
  int8x8_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    unint64_t v3 = (void *)(a2 + 16);
    do
    {
      unint64_t v4 = v3;
      while (1)
      {
        unint64_t v4 = (void *)*v4;
        if (!v4) {
          break;
        }
        if (NU::RectT<long>::intersects(v4 + 2, v2 + 2)) {
          return 1;
        }
      }
      int8x8_t v2 = (void *)*v2;
    }
    while (v2);
  }
  return 0;
}

uint64_t NU::Region::intersects(uint64_t a1, __n128 *a2)
{
  NU::Region::Region((uint64_t)v5, a2);
  uint64_t v3 = NU::Region::intersects(a1, (uint64_t)v5);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)v5);
  return v3;
}

void NU::Region::getBounds(NU::Region *this@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  for (uint64_t i = (uint64_t *)*((void *)this + 2); i; uint64_t i = (uint64_t *)*i)
  {
    long long v4 = *((_OWORD *)i + 2);
    v5[0] = *((_OWORD *)i + 1);
    v5[1] = v4;
    NU::RectT<long>::add((uint64_t *)a2, (uint64_t *)v5);
  }
}

void sub_1A9A06470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL std::operator==[abi:ne180100]<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>(uint64_t a1, uint64_t *a2)
{
  if (*(void *)(a1 + 24) != a2[3]) {
    return 0;
  }
  int8x8_t v2 = (void *)(a1 + 16);
  uint64_t v4 = *a2;
  int8x8_t v3 = (int8x8_t)a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  uint64_t v6 = *(void *)&v3 - 1;
LABEL_3:
  int8x8_t v2 = (void *)*v2;
  BOOL result = v2 == 0;
  if (v2)
  {
    if (v3)
    {
      uint64_t v8 = v2[2];
      uint64_t v9 = v2[3];
      uint64_t v10 = v2[4];
      uint64_t v11 = v2[5];
      unint64_t v12 = (COERCE__INT64((double)v8) + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(COERCE__INT64((double)v9)
                                                                                          + 4095) >> 32 << 24) ^ ((unint64_t)(COERCE__INT64((double)v10) + 4095) >> 32 << 8) ^ ((unint64_t)(COERCE__INT64((double)v11) + 4095) >> 32);
      if (v5.u32[0] > 1uLL)
      {
        unint64_t v13 = (COERCE__INT64((double)v8) + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(COERCE__INT64((double)v9)
                                                                                            + 4095) >> 32 << 24) ^ ((unint64_t)(COERCE__INT64((double)v10) + 4095) >> 32 << 8) ^ ((unint64_t)(COERCE__INT64((double)v11) + 4095) >> 32);
        if (v12 >= *(void *)&v3) {
          unint64_t v13 = v12 % *(void *)&v3;
        }
      }
      else
      {
        unint64_t v13 = v12 & v6;
      }
      unint64_t v14 = *(void **)(v4 + 8 * v13);
      if (v14)
      {
        while (1)
        {
          unint64_t v14 = (void *)*v14;
          if (!v14) {
            break;
          }
          unint64_t v15 = v14[1];
          if (v12 == v15)
          {
            if (v14[2] == v8 && v14[3] == v9 && v14[4] == v10 && v14[5] == v11) {
              goto LABEL_3;
            }
          }
          else
          {
            if (v5.u32[0] > 1uLL)
            {
              if (v15 >= *(void *)&v3) {
                v15 %= *(void *)&v3;
              }
            }
            else
            {
              v15 &= v6;
            }
            if (v15 != v13) {
              return 0;
            }
          }
        }
      }
    }
    return 0;
  }
  return result;
}

void sub_1A9A06630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t NU::Region::getHash(NU::Region *this)
{
  uint64_t v1 = (uint64_t *)*((void *)this + 2);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  int64x2_t v3 = vdupq_n_s64(0xFFFuLL);
  do
  {
    int8x16_t v4 = vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)vaddq_s64((int64x2_t)vcvtq_f64_s64(*(int64x2_t *)(v1 + 3)), v3), (uint64x2_t)xmmword_1A9A72EA0), (int8x16_t)xmmword_1A9A72EB0);
    result ^= 0x1D92AD94BE7929
            * (v4.i64[0] ^ (COERCE__INT64((double)v1[2]) + 4095) & 0xFFFFFFFF00000000 ^ v4.i64[1] ^ ((unint64_t)(COERCE__INT64((double)v1[5]) + 4095) >> 32));
    uint64_t v1 = (uint64_t *)*v1;
  }
  while (v1);
  return result;
}

uint64_t NU::Region::applyAffineTransform(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  long long v24 = 0u;
  long long v25 = 0u;
  int v26 = 1065353216;
  for (uint64_t i = *(__n128 **)(a1 + 16); i; uint64_t i = (__n128 *)i->n128_u64[0])
  {
    __n128 v7 = i[2];
    double v8 = (double)i[1].n128_i64[0];
    double v9 = (double)i[1].n128_i64[1];
    uint64_t v10 = i[2].n128_i64[1];
    __n128 v22 = i[1];
    __n128 v23 = v7;
    double v11 = (double)v7.n128_i64[0];
    v7.n128_f64[0] = (double)v10;
    long long v12 = a2[1];
    *(_OWORD *)&v27.a = *a2;
    *(_OWORD *)&v27.c = v12;
    *(_OWORD *)&v27.tCGFloat x = a2[2];
    CGRect v28 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v7 - 24), &v27);
    CGFloat x = v28.origin.x;
    CGFloat y = v28.origin.y;
    CGFloat width = v28.size.width;
    CGFloat height = v28.size.height;
    double MinX = CGRectGetMinX(v28);
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v29);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v30);
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v31);
    NU::RectT<long>::setXYMinMax(&v22, a3, MinX, MinY, MaxX, MaxY);
    *(__n128 *)&v27.a = v22;
    *(__n128 *)&v27.c = v23;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>((uint64_t)&v24, (uint64_t *)&v27, v22, v23);
  }
  if (&v24 != (long long *)a1)
  {
    *(_DWORD *)(a1 + 32) = v26;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<NU::RegionRect,void *> *>>((void *)a1, (uint64_t *)v25);
  }
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&v24);
}

void sub_1A9A068C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::applyOrientation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  long long v14 = 0u;
  long long v15 = 0u;
  int v16 = 1065353216;
  for (uint64_t i = *(__n128 **)(a1 + 16); i; uint64_t i = (__n128 *)i->n128_u64[0])
  {
    __n128 v9 = i[2];
    __n128 v12 = i[1];
    __n128 v13 = v9;
    NU::RectT<long>::applyOrientation((uint64_t *)&v12, a2, a3, a4);
    v11[0] = v12;
    v11[1] = v13;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>((uint64_t)&v14, (uint64_t *)v11, v12, v13);
  }
  if (&v14 != (long long *)a1)
  {
    *(_DWORD *)(a1 + 32) = v16;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<NU::RegionRect,void *> *>>((void *)a1, (uint64_t *)v15);
  }
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&v14);
}

void sub_1A9A069AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A9A06C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t NU::Region::shrinkInRect(__n128 *a1, uint64_t a2, uint64_t a3, __n128 *a4)
{
  NU::Region::Region((uint64_t)v20, a4);
  NU::Region::breakRects((uint64_t)a1, v20);
  NU::Region::mergeRectsVertically((NU::Region *)v20);
  NU::Region::grow((NU::Region *)v20, a2, a3);
  NU::Region::Region((uint64_t)&v15, a4);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::clear(a1);
  unint64_t v8 = v15;
  unint64_t v15 = 0;
  __n128 v9 = (void *)a1->n128_u64[0];
  a1->n128_u64[0] = v8;
  if (v9) {
    operator delete(v9);
  }
  unint64_t v10 = v16;
  unint64_t v11 = v17;
  a1[1].n128_u64[0] = v17;
  a1->n128_u64[1] = v10;
  unint64_t v16 = 0;
  unint64_t v12 = v18;
  a1[1].n128_u64[1] = v18;
  a1[2].n128_u32[0] = v19;
  if (v12)
  {
    unint64_t v13 = *(void *)(v11 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v13 >= v10) {
        v13 %= v10;
      }
    }
    else
    {
      v13 &= v10 - 1;
    }
    *(void *)(a1->n128_u64[0] + 8 * v13) = a1 + 1;
    unint64_t v17 = 0;
    unint64_t v18 = 0;
  }
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&v15);
  NU::Region::breakRects((uint64_t)v20, a1);
  NU::Region::mergeRectsVertically((NU::Region *)a1);
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)v20);
}

void sub_1A9A06DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::grow(NU::Region *this, uint64_t a2, uint64_t a3)
{
  std::unordered_set<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::unordered_set((uint64_t)v10, (uint64_t)this);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::clear(this);
  for (uint64_t i = v11; i; uint64_t i = (__n128 *)i->n128_u64[0])
  {
    __n128 v7 = i[2];
    v9[0] = i[1];
    v9[1] = v7;
    NU::RectT<long>::grow((uint64_t *)v9, a2, a3);
    NU::Region::add(this, v9);
  }
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)v10);
}

void sub_1A9A06E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::clear(void *result)
{
  if (result[3])
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[2];
    if (result)
    {
      do
      {
        int8x8_t v2 = (void *)*result;
        operator delete(result);
        uint64_t result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

uint64_t NU::Region::add(NU::Region *a1, __n128 *a2)
{
  NU::Region::Region((uint64_t)v4, a2);
  NU::Region::add(a1, (const NU::Region *)v4);
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)v4);
}

void sub_1A9A06F30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::add(NU::Region *this, const NU::Region *a2)
{
  std::unordered_set<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::unordered_set((uint64_t)v4, (uint64_t)a2);
  NU::Region::breakRects((uint64_t)this, v4);
  NU::Region::mergeRects(this, v4);
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)v4);
}

void sub_1A9A06F94(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::mergeRects(NU::Region *this, void *a2)
{
  while (a2[3])
  {
    int8x16_t v4 = (__n128 *)a2[2];
    __n128 v5 = v4[2];
    v7[0] = v4[1];
    v7[1] = v5;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::erase(a2, (uint64_t *)v4);
    NU::Region::mergeRectsHorizontally((uint64_t)this, v7, (uint64_t)a2);
  }

  return NU::Region::mergeRectsVertically(this);
}

void NU::Region::mergeRectsHorizontally(uint64_t a1, __n128 *a2, uint64_t a3)
{
  __n128 v5 = (void *)a1;
  uint64_t v6 = (uint64_t *)(a1 + 16);
  do
  {
    uint64_t v6 = (uint64_t *)*v6;
    if (!v6)
    {
      __n128 v19 = a2[1];
      __n128 v27 = *a2;
      __n128 v28 = v19;
      std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>((uint64_t)v5, (uint64_t *)&v27, v27, v19);
      return;
    }
    LODWORD(a1) = NU::RectPartialHorizontallyAdjacentTo::operator()(a1, a2, v6 + 2);
  }
  while (!a1);
  __n128 v29 = 0u;
  __n128 v30 = 0u;
  uint64_t v7 = v6[2];
  if (v7 >= (int64_t)a2->n128_u64[0]) {
    uint64_t v8 = a2->n128_u64[0];
  }
  else {
    uint64_t v8 = v6[2];
  }
  uint64_t v9 = v6[4] + v7;
  if ((int64_t)(a2[1].n128_u64[0] + a2->n128_u64[0]) <= v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = a2[1].n128_u64[0] + a2->n128_u64[0];
  }
  NU::RectT<long>::setXMinMax(&v29, v8, v10);
  uint64_t v11 = a2->n128_i64[1];
  uint64_t v12 = v6[3];
  if (v11 <= v12) {
    uint64_t v13 = v6[3];
  }
  else {
    uint64_t v13 = a2->n128_i64[1];
  }
  uint64_t v14 = a2[1].n128_u64[1] + v11;
  uint64_t v15 = v6[5] + v12;
  if (v15 >= v14) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = v15;
  }
  NU::RectT<long>::setYMinMax((uint64_t)&v29, v13, v16);
  __n128 v27 = v29;
  __n128 v28 = v30;
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>(a3, (uint64_t *)&v27, v29, v30);
  uint64_t v17 = a2->n128_i64[1];
  int64_t v18 = v6[3];
  if (v17 >= v18)
  {
    if (v17 <= v18) {
      goto LABEL_22;
    }
    v25.n128_u64[0] = v6[2];
    v25.n128_u64[1] = v18;
    __n128 v26 = *((__n128 *)v6 + 2);
  }
  else
  {
    v25.n128_u64[0] = a2->n128_u64[0];
    v25.n128_u64[1] = v17;
    __n128 v26 = a2[1];
    uint64_t v17 = v18;
  }
  NU::RectT<long>::setYMax((uint64_t *)&v25, v17);
  __n128 v27 = v25;
  __n128 v28 = v26;
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>(a3, (uint64_t *)&v27, v25, v26);
LABEL_22:
  unint64_t v20 = a2->n128_u64[1];
  unint64_t v21 = a2[1].n128_u64[1];
  uint64_t v22 = v21 + v20;
  unint64_t v23 = v6[3];
  unint64_t v24 = v6[5];
  if ((uint64_t)(v21 + v20) < (uint64_t)(v24 + v23))
  {
    v25.n128_u64[0] = v6[2];
    v25.n128_u64[1] = v23;
    v26.n128_u64[0] = v6[4];
    v26.n128_u64[1] = v24;
LABEL_26:
    NU::RectT<long>::setYMin((uint64_t *)&v25, v22);
    __n128 v27 = v25;
    __n128 v28 = v26;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>(a3, (uint64_t *)&v27, v25, v26);
    goto LABEL_27;
  }
  if ((uint64_t)(v21 + v20) > (uint64_t)(v24 + v23))
  {
    v25.n128_u64[0] = a2->n128_u64[0];
    v25.n128_u64[1] = v20;
    v26.n128_u64[0] = a2[1].n128_u64[0];
    v26.n128_u64[1] = v21;
    uint64_t v22 = v24 + v23;
    goto LABEL_26;
  }
LABEL_27:
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::erase(v5, v6);
}

BOOL NU::RectPartialHorizontallyAdjacentTo::operator()(uint64_t a1, void *a2, void *a3)
{
  if ((a2[2] + *a2 == *a3 || *a2 == a3[2] + *a3) && (v3 = a2[1], uint64_t v4 = a3[1], v3 < a3[3] + v4)) {
    return a2[3] + v3 > v4;
  }
  else {
    return 0;
  }
}

void sub_1A9A07484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t NU::Region::shrink(NU::Region *this, uint64_t a2, uint64_t a3)
{
  NU::Region::getBounds(this, (uint64_t)v7);
  v8[0] = (__n128)v7[0];
  v8[1] = (__n128)v7[1];
  NU::RectT<long>::grow((uint64_t *)v8, a2, a3);
  return NU::Region::shrinkInRect((__n128 *)this, a2, a3, v8);
}

void sub_1A9A07790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t NU::Region::clip(NU::Region *a1, __n128 *a2)
{
  NU::Region::Region((uint64_t)v4, a2);
  NU::Region::clip(a1, (const NU::Region *)v4);
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)v4);
}

void sub_1A9A0781C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::clip(NU::Region *this, const NU::Region *a2)
{
  long long v11 = 0u;
  long long v12 = 0u;
  int v13 = 1065353216;
  for (uint64_t i = (void *)*((void *)this + 2); i; uint64_t i = (void *)*i)
  {
    for (j = (void *)*((void *)a2 + 2); j; j = (void *)*j)
    {
      NU::RectT<long>::Intersection((uint64_t)&v9, i + 2, j + 2);
      if (v10.n128_u64[0]) {
        BOOL v6 = v10.n128_u64[1] == 0;
      }
      else {
        BOOL v6 = 1;
      }
      if (!v6)
      {
        v8[0] = v9;
        v8[1] = v10;
        std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect>((uint64_t)&v11, (uint64_t *)v8, v9, v10);
      }
    }
  }
  if (&v11 != (long long *)this)
  {
    *((_DWORD *)this + _Block_object_dispose(&STACK[0x210], 8) = v13;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<NU::RegionRect,void *> *>>(this, (uint64_t *)v12);
  }
  NU::Region::mergeRectsVertically(this);
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&v11);
}

void sub_1A9A0790C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A9A07B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9A07C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *NU::Region::scale(uint64_t a1, uint64_t a2, double a3, double a4)
{
  if (a3 == 0.0 || a4 == 0.0)
  {
    return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::clear((void *)a1);
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    int v15 = 1065353216;
    for (uint64_t i = *(__n128 **)(a1 + 16); i; uint64_t i = (__n128 *)i->n128_u64[0])
    {
      __n128 v9 = i[2];
      __n128 v11 = i[1];
      __n128 v12 = v9;
      NU::RectT<long>::scale((uint64_t *)&v11, a2, a3, a4);
      std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect const&>((uint64_t)&v13, (uint64_t *)&v11, v11, v12);
    }
    if (&v13 != (long long *)a1)
    {
      *(_DWORD *)(a1 + 32) = v15;
      std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<NU::RegionRect,void *> *>>((void *)a1, (uint64_t *)v14);
    }
    return (void *)std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&v13);
  }
}

void sub_1A9A07D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::translate(NU::Region *this, uint64_t a2, uint64_t a3)
{
  long long v12 = 0u;
  long long v13 = 0u;
  int v14 = 1065353216;
  for (uint64_t i = (__n128 *)*((void *)this + 2); i; uint64_t i = (__n128 *)i->n128_u64[0])
  {
    unint64_t v7 = i[1].n128_u64[0];
    unint64_t v8 = i[1].n128_u64[1];
    __n128 v11 = i[2];
    v10.n128_u64[0] = v7 + a2;
    v10.n128_u64[1] = v8 + a3;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect const&>((uint64_t)&v12, (uint64_t *)&v10, v10, v11);
  }
  if (&v12 != (long long *)this)
  {
    *((_DWORD *)this + _Block_object_dispose(&STACK[0x210], 8) = v14;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<NU::RegionRect,void *> *>>(this, (uint64_t *)v13);
  }
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&v12);
}

void sub_1A9A07E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::flipInRect(uint64_t a1, void *a2)
{
  long long v13 = 0u;
  long long v14 = 0u;
  int v15 = 1065353216;
  for (uint64_t i = *(void **)(a1 + 16); i; uint64_t i = (void *)*i)
  {
    uint64_t v5 = i[3];
    uint64_t v6 = a2[1];
    unint64_t v7 = i[2] - *a2;
    unint64_t v8 = i[5];
    v12.n128_u64[0] = i[4];
    v12.n128_u64[1] = v8;
    unint64_t v9 = v6 - (v8 + v5) + a2[3];
    v11.n128_u64[0] = v7;
    v11.n128_u64[1] = v9;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__emplace_unique_key_args<NU::RegionRect,NU::RegionRect const&>((uint64_t)&v13, (uint64_t *)&v11, v11, v12);
  }
  if (&v13 != (long long *)a1)
  {
    *(_DWORD *)(a1 + 32) = v15;
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<NU::RegionRect,void *> *>>((void *)a1, (uint64_t *)v14);
  }
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)&v13);
}

void sub_1A9A07F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::diff(__n128 *this, const NU::Region *a2)
{
  std::unordered_set<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::unordered_set((uint64_t)v5, (uint64_t)a2);
  NU::Region::breakRects((uint64_t)this, v5);
  NU::Region::breakRects((uint64_t)a2, this);
  NU::Region::mergeRects((NU::Region *)this, v5);
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)v5);
}

void sub_1A9A07F94(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::diff(__n128 *a1, __n128 *a2)
{
  NU::Region::Region((uint64_t)v4, a2);
  NU::Region::diff(a1, (const NU::Region *)v4);
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)v4);
}

void sub_1A9A0801C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t NU::Region::remove(__n128 *a1, __n128 *a2)
{
  NU::Region::Region((uint64_t)v4, a2);
  NU::Region::breakRects((uint64_t)v4, a1);
  NU::Region::mergeRectsVertically((NU::Region *)a1);
  return std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)v4);
}

void sub_1A9A0814C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A9A08224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A083CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1A9A08468(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A0877C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9A088A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A08944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A08F0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A09048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A09100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A09164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A091E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A0924C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A092C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A0932C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A093A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A0940C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A09470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A094DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A09548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A095B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A09624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A09694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A09700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A09770(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A097DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A0984C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t NU::hash(NU *this, double a2)
{
  return (*(void *)&a2 + 4095) & 0xFFFFFFFFFFFFF000;
}

unint64_t NU::RectHash::operator()(uint64_t a1, uint64_t a2)
{
  int8x16_t v2 = vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)vaddq_s64((int64x2_t)vcvtq_f64_s64(*(int64x2_t *)(a2 + 8)), vdupq_n_s64(0xFFFuLL)), (uint64x2_t)xmmword_1A9A72EA0), (int8x16_t)xmmword_1A9A72EB0);
  return v2.i64[0] ^ (COERCE__INT64((double)*(uint64_t *)a2) + 4095) & 0xFFFFFFFF00000000 ^ v2.i64[1] ^ ((unint64_t)(COERCE__INT64((double)*(uint64_t *)(a2 + 24)) + 4095) >> 32);
}

BOOL NU::RectEqualTo::operator()(uint64_t a1, void *a2, void *a3)
{
  return *a2 == *a3 && a2[1] == a3[1] && a2[2] == a3[2] && a2[3] == a3[3];
}

BOOL NU::RectStrictHorizontallyAdjacentTo::operator()(uint64_t a1, void *a2, void *a3)
{
  return (a2[2] + *a2 == *a3 || *a2 == a3[2] + *a3) && a2[1] == a3[1] && a2[3] == a3[3];
}

BOOL NU::RectStrictVerticallyAdjacentTo::operator()(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a3[1];
  return (a2[3] + v3 == v4 || v3 == a3[3] + v4) && *a2 == *a3 && a2[2] == a3[2];
}

double NU::Region::getArea(NU::Region *this)
{
  uint64_t v1 = (void *)*((void *)this + 2);
  if (!v1) {
    return 0.0;
  }
  double result = 0.0;
  do
  {
    double result = result + (double)(uint64_t)(v1[5] * v1[4]);
    uint64_t v1 = (void *)*v1;
  }
  while (v1);
  return result;
}

uint64_t NU::Region::remove(__n128 *this, const NU::Region *a2)
{
  NU::Region::breakRects((uint64_t)a2, this);

  return NU::Region::mergeRectsVertically((NU::Region *)this);
}

uint64_t NU::Region::growInRect(NU::Region *a1, uint64_t a2, uint64_t a3, __n128 *a4)
{
  NU::Region::grow(a1, a2, a3);

  return NU::Region::clip(a1, a4);
}

id NUAssertLogger_22888()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_22906);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

__CFString *NUSettingTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"???";
  }
  else {
    return off_1E5D956E8[a1 - 1];
  }
}

void sub_1A9A17AA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id NUAssertLogger_23595()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_23610);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

uint64_t NUIsPixelBufferProbablyAllZeros(__CVBuffer *a1)
{
  if (CVPixelBufferLockBaseAddress(a1, 1uLL))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_86_23665);
    }
    int8x16_t v2 = _NULogger;
    char v3 = 0;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v8 = 0;
      _os_log_impl(&dword_1A9892000, v2, OS_LOG_TYPE_DEFAULT, "NUIsPixelBufferProbablyAllZeros could not lock CVPixelBufferRef.", v8, 2u);
      char v3 = 0;
    }
  }
  else
  {
    int v11 = 0;
    int v9 = 0;
    int v10 = 0;
    *(void *)unint64_t v8 = 0;
    char v3 = 0;
    if (NUCVBufferGeometry(a1, &v11, &v10, &v9, v8))
    {
      if (v10 < 1)
      {
        char v3 = 1;
      }
      else
      {
        unint64_t v4 = 0;
        uint64_t v5 = *(void *)v8;
        char v3 = 1;
        do
        {
          if (v11 >= 1)
          {
            uint64_t v6 = 0;
            while (v6 >= v10 * (uint64_t)v9 || !*(unsigned char *)(v5 + v6))
            {
              if (v11 == ++v6) {
                goto LABEL_16;
              }
            }
            char v3 = 0;
          }
LABEL_16:
          v4 += 100;
          v5 += 100 * v9;
        }
        while (v4 < v10);
      }
    }
    CVPixelBufferUnlockBaseAddress(a1, 1uLL);
  }
  return v3 & 1;
}

BOOL NUCVBufferGeometry(__CVBuffer *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, void *a5)
{
  if (CVPixelBufferIsPlanar(a1))
  {
    *a2 = CVPixelBufferGetWidthOfPlane(a1, 1uLL);
    *a3 = CVPixelBufferGetHeightOfPlane(a1, 1uLL);
    *a4 = CVPixelBufferGetBytesPerRowOfPlane(a1, 1uLL);
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a1, 1uLL);
  }
  else
  {
    *a2 = CVPixelBufferGetWidth(a1);
    *a3 = CVPixelBufferGetHeight(a1);
    *a4 = CVPixelBufferGetBytesPerRow(a1);
    BaseAddressOfPlane = CVPixelBufferGetBaseAddress(a1);
  }
  int v11 = BaseAddressOfPlane;
  *a5 = BaseAddressOfPlane;
  if (!BaseAddressOfPlane)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_86_23665);
    }
    __n128 v12 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v14 = 0;
      _os_log_impl(&dword_1A9892000, v12, OS_LOG_TYPE_DEFAULT, "NUCVBufferGeometry couldn't get address of plane.", v14, 2u);
    }
  }
  return v11 != 0;
}

uint64_t NUDebugWatermarkCVPixelBuffer(__CVBuffer *a1, int a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a2 >= 10)
  {
    unint64_t v21 = NUAssertLogger_23595();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "numRectangles < MAX_RECTS");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    unint64_t v24 = NUAssertLogger_23595();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        __n128 v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __n128 v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        CGRect v31 = [v29 callStackSymbols];
        unint64_t v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v28;
        __int16 v41 = 2114;
        CGRect v42 = v32;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      __n128 v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      __n128 v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"BOOL NUDebugWatermarkCVPixelBuffer(CVPixelBufferRef _Nonnull, int)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUCVPixelBuffer.m", 154, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"numRectangles < MAX_RECTS");
  }
  if (CVPixelBufferLockBaseAddress(a1, 0))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_86_23665);
    }
    unint64_t v4 = _NULogger;
    BOOL v5 = os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (v5)
    {
      *(_WORD *)buf = 0;
      unint64_t v7 = "NUDebugWatermarkCVPixelBuffer could not lock CVPixelBufferRef.";
      unint64_t v8 = buf;
LABEL_7:
      _os_log_impl(&dword_1A9892000, v4, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      return 0;
    }
    return result;
  }
  uint64_t v39 = 0;
  *(void *)buf = 0;
  int v38 = 0;
  if (!NUCVBufferGeometry(a1, (_DWORD *)&v39 + 1, &v39, &v38, buf))
  {
    CVPixelBufferUnlockBaseAddress(a1, 0);
    return 0;
  }
  if (a2 < 1)
  {
LABEL_20:
    CVPixelBufferUnlockBaseAddress(a1, 0);
    return 1;
  }
  if (SHIDWORD(v39) >= 210)
  {
    uint64_t v9 = 0;
    int v10 = 0;
    uint64_t v11 = v38;
    int v12 = v39;
    uint64_t v13 = (int)v39 * (uint64_t)v38;
    int v14 = SHIDWORD(v39) / 10;
    uint64_t v15 = ((int)v39 / 8);
    uint64_t v16 = *(void *)buf;
    do
    {
      if (v12 > 7)
      {
        uint64_t v17 = 0;
        uint64_t v18 = v16;
        do
        {
          uint64_t v19 = v10;
          do
          {
            if (v19 < v13) {
              *(unsigned char *)(v18 + v19) = -1;
            }
            ++v19;
          }
          while (v19 < v14 - 20 + v9 * v14);
          ++v17;
          v18 += v11;
        }
        while (v17 != v15);
      }
      ++v9;
      v10 += v14;
    }
    while (v9 != a2);
    goto LABEL_20;
  }
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_86_23665);
  }
  unint64_t v4 = _NULogger;
  BOOL v20 = os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0;
  if (v20)
  {
    __int16 v37 = 0;
    unint64_t v7 = "NUDebugWatermarkCVPixelBuffer buffer too small.";
    unint64_t v8 = (uint8_t *)&v37;
    goto LABEL_7;
  }
  return result;
}

id NUAssertLogger_23719()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_23737);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_23898()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_23927);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void std::default_delete<NU::Histogram<long,double>>::operator()[abi:ne180100](uint64_t a1)
{
  int8x16_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    *(void *)(a1 + 24) = v2;
    operator delete(v2);
  }

  JUMPOUT(0x1AD0FA500);
}

void sub_1A9A1BE70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A1C754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *__p,uint64_t a32)
{
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__105(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__106(uint64_t a1)
{
  int8x16_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void NU::Histogram<long,double>::Kernel::box(void *a1, unint64_t a2)
{
  if ((a2 & 0x8000000000000001) != 1) {
    __assert_rtn("box", "Histogram.hpp", 292, "size % 2 == 1");
  }
  uint64_t v4 = 1;
  std::vector<long>::vector(&__p, a2, &v4);
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  std::vector<long>::__init_with_size[abi:ne180100]<long *,long *>(a1, __p, (uint64_t)v6, (v6 - (unsigned char *)__p) >> 3);
  a1[3] = a2;
  if (__p)
  {
    uint64_t v6 = __p;
    operator delete(__p);
  }
}

void sub_1A9A1C9BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ___ZNK2NU9HistogramIldE16modalityAnalysisEmRKdS3_RU15__autoreleasingKU13block_pointerFllE_block_invoke(void *a1, unint64_t a2)
{
  uint64_t v2 = a1[7] - a1[6];
  uint64_t v3 = v2 >> 3;
  if (v2 >> 3 >= 0) {
    uint64_t v4 = v2 >> 3;
  }
  else {
    uint64_t v4 = v3 + 1;
  }
  if (v3 != (v4 | 1)) {
    __assert_rtn("sample", "Histogram.hpp", 376, "n == 2*k+1");
  }
  uint64_t v7 = a1[9];
  if (v2 < 1)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = a1[10];
    if (v3 <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v2 >> 3;
    }
    do
      v9 += *(void *)(a1[6] + 8 * v8++) * (*(uint64_t (**)(void))(*(void *)v10 + 16))();
    while (v11 != v8);
  }
  if (v7 >= 0) {
    uint64_t v12 = v7;
  }
  else {
    uint64_t v12 = v7 + 1;
  }
  uint64_t v13 = *(void *)(a2 + 8);
  if (v13 - (v9 + (v12 >> 1)) / v7 >= a1[11])
  {
    int v14 = *(void **)(a1[4] + 8);
    uint64_t v16 = (char *)v14[6];
    uint64_t v15 = (char *)v14[7];
    uint64_t v17 = v15 - v16;
    if (v15 == v16)
    {
      uint64_t v19 = (char *)v14[7];
    }
    else
    {
      unint64_t v18 = v17 >> 4;
      uint64_t v19 = (char *)v14[6];
      do
      {
        unint64_t v20 = v18 >> 1;
        unint64_t v21 = &v19[16 * (v18 >> 1)];
        uint64_t v22 = *((void *)v21 + 1);
        unint64_t v23 = v21 + 16;
        v18 += ~(v18 >> 1);
        if (v13 > v22) {
          unint64_t v18 = v20;
        }
        else {
          uint64_t v19 = v23;
        }
      }
      while (v18);
    }
    unint64_t v24 = v14[8];
    if ((unint64_t)v15 >= v24)
    {
      unint64_t v29 = (v17 >> 4) + 1;
      if (v29 >> 60) {
        std::vector<double>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v30 = v19 - v16;
      uint64_t v31 = (v19 - v16) >> 4;
      unint64_t v32 = v24 - (void)v16;
      unint64_t v33 = (uint64_t)(v24 - (void)v16) >> 3;
      if (v33 > v29) {
        unint64_t v29 = v33;
      }
      if (v32 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v34 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v34 = v29;
      }
      if (v34)
      {
        uint64_t v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NU::Histogram<long,double>::Sample>>(v34);
      }
      else
      {
        uint64_t v36 = 0;
        uint64_t v35 = 0;
      }
      __int16 v37 = &v36[16 * v31];
      int v38 = &v36[16 * v35];
      if (v31 == v35)
      {
        if (v30 < 1)
        {
          if (v19 == v16) {
            unint64_t v40 = 1;
          }
          else {
            unint64_t v40 = v30 >> 3;
          }
          __int16 v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NU::Histogram<long,double>::Sample>>(v40);
          __int16 v37 = &v41[16 * (v40 >> 2)];
          int v38 = &v41[16 * v42];
          if (v36) {
            operator delete(v36);
          }
        }
        else
        {
          unint64_t v39 = v31 + 2;
          if (v31 >= -1) {
            unint64_t v39 = v31 + 1;
          }
          v37 -= 16 * (v39 >> 1);
        }
      }
      *(_OWORD *)__int16 v37 = *(_OWORD *)a2;
      uint64_t v43 = (char *)v14[6];
      CGAffineTransform v44 = v37;
      if (v43 != v19)
      {
        CGAffineTransform v45 = v19;
        CGAffineTransform v46 = v37;
        do
        {
          CGAffineTransform v44 = v46 - 16;
          *((_OWORD *)v46 - 1) = *((_OWORD *)v45 - 1);
          v45 -= 16;
          v46 -= 16;
        }
        while (v45 != v43);
      }
      CGRect v47 = (char *)v14[7];
      int64_t v48 = v47 - v19;
      if (v47 != v19) {
        memmove(v37 + 16, v19, v47 - v19);
      }
      CGRect v49 = (void *)v14[6];
      v14[6] = v44;
      v14[7] = &v37[v48 + 16];
      v14[8] = v38;
      if (v49) {
        operator delete(v49);
      }
    }
    else if (v19 == v15)
    {
      *(_OWORD *)uint64_t v15 = *(_OWORD *)a2;
      v14[7] = v15 + 16;
    }
    else
    {
      BOOL v25 = v19 + 16;
      __n128 v26 = v15 - 16;
      __n128 v27 = (_OWORD *)v14[7];
      while (v26 < v15)
      {
        long long v28 = *(_OWORD *)v26;
        v26 += 16;
        *v27++ = v28;
      }
      v14[7] = v27;
      if (v15 != v25) {
        memmove(&v15[-16 * ((v15 - v25) >> 4)], v19, v15 - v25);
      }
      if ((unint64_t)v19 <= a2) {
        a2 += 16 * (v14[7] > a2);
      }
      *(_OWORD *)uint64_t v19 = *(_OWORD *)a2;
    }
    unint64_t v50 = a1[12];
    while (1)
    {
      uint64_t v51 = *(void *)(a1[4] + 8);
      uint64_t v54 = *(void *)(v51 + 56);
      uint64_t v52 = (void *)(v51 + 56);
      uint64_t v53 = v54;
      if (v50 >= (v54 - *(v52 - 1)) >> 4) {
        break;
      }
      *uint64_t v52 = v53 - 16;
    }
  }
}

void sub_1A9A1CD48(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<long>::__init_with_size[abi:ne180100]<long *,long *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<long>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1A9A1CDC0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x210], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void NU::Histogram<long,double>::findAllModes(uint64_t a1, uint64_t *a2, void *a3)
{
  BOOL v5 = a3;
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v8 = (*(uint64_t (**)(void))(*a2 + 16))();
  uint64_t v9 = (*(uint64_t (**)(void))(*a2 + 16))();
  uint64_t v10 = (v6 - v7) >> 3;
  uint64_t v11 = v8 - v9;
  BOOL v12 = v8 == v9;
  uint64_t v32 = v10;
  if (v6 - v7 < 0)
  {
    uint64_t v33 = -2;
    if (v8 != v9) {
      goto LABEL_39;
    }
    goto LABEL_31;
  }
  uint64_t v13 = 0;
  uint64_t v14 = (v10 & ~(v10 >> 63)) + 1;
  uint64_t v33 = -2;
  uint64_t v15 = v8;
  do
  {
    uint64_t v8 = (*(uint64_t (**)(void))(*a2 + 16))();
    uint64_t v16 = v8 - v15;
    if (v11 >= 1 && v16 < 0)
    {
      if (v13)
      {
        double v17 = *(double *)(a1 + 8);
        double v18 = (v17 - *(double *)a1) / (double)((uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3);
        double v19 = *(double *)a1 + (double)(v13 - 1) * v18 + (double)v11 / (double)(v11 - v16) * v18;
        if (*(double *)a1 >= v19) {
          double v19 = *(double *)a1;
        }
        if (v17 < v19) {
          double v19 = *(double *)(a1 + 8);
        }
        double v34 = v19;
        uint64_t v35 = v15;
        ((void (**)(id, double *))v5)[2](v5, &v34);
      }
    }
    else if (v11 < 1 || v16)
    {
      if (v11 | v16)
      {
        if (v11) {
          BOOL v20 = 0;
        }
        else {
          BOOL v20 = v16 < 0;
        }
        int v21 = v20;
        if (v13 && (v21 & v12) != 0 && v13 - v33 < (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3)
        {
          double v22 = NU::Histogram<long,double>::sample(a1, *a2, (double)(v33 + v13) * 0.5);
          double v34 = v23;
          uint64_t v35 = v24;
          ((void (*)(void (**)(id, void *), double *, double))v5[2])(v5, &v34, v22);
        }
        BOOL v12 = 0;
      }
      else
      {
        uint64_t v16 = 0;
        uint64_t v8 = v15;
      }
    }
    else
    {
      uint64_t v33 = v13 - 1;
      BOOL v12 = 1;
    }
    ++v13;
    uint64_t v11 = v16;
    uint64_t v15 = v8;
  }
  while (v14 != v13);
  if (v12)
  {
LABEL_31:
    uint64_t v25 = (*(uint64_t (**)(void))(*a2 + 16))();
    if (v25 == v8)
    {
      double v26 = *(double *)(a1 + 8);
      double v27 = (v26 - *(double *)a1) / (double)((uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3);
      double v28 = *(double *)a1 + (double)v32 * v27 + v27 * 0.0;
      if (*(double *)a1 >= v28) {
        double v28 = *(double *)a1;
      }
      if (v26 < v28) {
        double v28 = *(double *)(a1 + 8);
      }
      double v34 = v28;
      uint64_t v35 = v8;
      ((void (**)(id, double *))v5)[2](v5, &v34);
    }
    else if (v25 < v8)
    {
      double v29 = NU::Histogram<long,double>::sample(a1, *a2, (double)(v32 + 1 + v33) * 0.5);
      double v34 = v30;
      uint64_t v35 = v31;
      ((void (*)(void (**)(id, void *), double *, double))v5[2])(v5, &v34, v29);
    }
  }
LABEL_39:
}

void sub_1A9A1D0B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<NU::Histogram<long,double>::Sample>>(unint64_t a1)
{
  if (a1 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a1);
}

double NU::Histogram<long,double>::sample(uint64_t a1, uint64_t a2, double a3)
{
  double v4 = (double)(uint64_t)floor(a3);
  double v5 = a3 - v4;
  (*(void (**)(uint64_t, unint64_t))(a2 + 16))(a2, vcvtmd_s64_f64(a3));
  double result = *(double *)a1;
  double v7 = *(double *)(a1 + 8);
  double v8 = (v7 - *(double *)a1) / (double)((uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3);
  double v9 = *(double *)a1 + v4 * v8 + v5 * v8;
  if (*(double *)a1 < v9) {
    double result = v9;
  }
  if (v7 < result) {
    return *(double *)(a1 + 8);
  }
  return result;
}

char *std::vector<long>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  double result = (char *)operator new(8 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * a2];
  return result;
}

void __destroy_helper_block_ea8_48c30_ZTSN2NU9HistogramIldE6KernelE(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void *__copy_helper_block_ea8_48c30_ZTSN2NU9HistogramIldE6KernelE(void *a1, uint64_t a2)
{
  a1[6] = 0;
  a1[7] = 0;
  uint64_t v3 = a1 + 6;
  a1[8] = 0;
  double result = std::vector<long>::__init_with_size[abi:ne180100]<long *,long *>(a1 + 6, *(const void **)(a2 + 48), *(void *)(a2 + 56), (uint64_t)(*(void *)(a2 + 56) - *(void *)(a2 + 48)) >> 3);
  __n128 v3[3] = *(void *)(a2 + 72);
  return result;
}

void *std::vector<long>::vector(void *a1, unint64_t a2, void *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<long>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v6 = (void *)a1[1];
    double v7 = &v6[a2];
    uint64_t v8 = 8 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 8;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1A9A1D2B4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x210], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

id NU::Histogram<long,double>::edgeClamp(uint64_t a1)
{
  uint64_t v1 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  __n128 v4[2] = ___ZNK2NU9HistogramIldE9edgeClampEv_block_invoke;
  v4[3] = &__block_descriptor_48_e8_q16__0q8l;
  v4[4] = a1;
  v4[5] = v1;
  uint64_t v2 = (void *)MEMORY[0x1AD0FAD00](v4);

  return v2;
}

uint64_t ___ZNK2NU9HistogramIldE6repeatEv_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 <= a2) {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v3 = 0;
  }
  if (a2 >= 0) {
    uint64_t v2 = -v3;
  }
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 8 * (v2 + a2));
}

uint64_t ___ZNK2NU9HistogramIldE6mirrorEv_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    uint64_t v3 = -a2;
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2 <= a2) {
      uint64_t v3 = 2 * v2 - a2 - 2;
    }
    else {
      uint64_t v3 = a2;
    }
  }
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 8 * v3);
}

uint64_t ___ZNK2NU9HistogramIldE9edgeClampEv_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2 <= a2) {
      uint64_t v3 = v2 - 1;
    }
    else {
      uint64_t v3 = a2;
    }
  }
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 8 * v3);
}

uint64_t ___ZNK2NU9HistogramIldE9zeroClampEv_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 < 0 || *(void *)(a1 + 40) <= a2) {
    return 0;
  }
  else {
    return *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 8 * a2);
  }
}

void sub_1A9A1D6C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__24127(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

__n128 ___ZNK2NU9HistogramIldE4modeEv_block_invoke(uint64_t a1, __n128 *a2)
{
  uint64_t v2 = *(__n128 **)(*(void *)(a1 + 32) + 8);
  if ((int64_t)a2->n128_u64[1] > (int64_t)v2[3].n128_u64[1])
  {
    __n128 result = *a2;
    v2[3] = *a2;
  }
  return result;
}

double NU::Histogram<long,double>::maximum(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = *(void *)(a1 + 24) - v1;
  if (v2 < 1) {
    return *(double *)(a1 + 8);
  }
  uint64_t v3 = 0;
  uint64_t v4 = v2 >> 3;
  if (v4 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = (void *)(v1 + 8 * v4 - 8);
  while (!*v6--)
  {
    if (v5 == ++v3) {
      return *(double *)(a1 + 8);
    }
  }
  return *(double *)a1 + (double)(v4 - v3) * ((*(double *)(a1 + 8) - *(double *)a1) / (double)v4);
}

double NU::Histogram<long,double>::minimum(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = *(void *)(a1 + 24) - v1;
  if (v2 < 1) {
    return *(double *)a1;
  }
  uint64_t v3 = 0;
  uint64_t v4 = v2 >> 3;
  if (v4 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  while (!*(void *)(v1 + 8 * v3))
  {
    if (v5 == ++v3) {
      return *(double *)a1;
    }
  }
  return *(double *)a1 + (double)v3 * ((*(double *)(a1 + 8) - *(double *)a1) / (double)v4);
}

void sub_1A9A1DBF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9A1E0A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p)
{
  _Unwind_Resume(a1);
}

void NU::Histogram<long,double>::convolve(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v37 = a2[1] - *a2;
  uint64_t v3 = v37 >> 3;
  if (v37 >> 3 >= 0) {
    uint64_t v4 = v37 >> 3;
  }
  else {
    uint64_t v4 = v3 + 1;
  }
  if (v3 != (v4 | 1)) {
    __assert_rtn("convolve", "Histogram.hpp", 314, "n == 2*k+1");
  }
  uint64_t v7 = a1;
  uint64_t v8 = (void **)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24) - *(void *)(a1 + 16);
  uint64_t v10 = v9 >> 3;
  uint64_t v38 = 0;
  std::vector<long>::vector(&__src, v9 >> 3, &v38);
  if (v9 <= 0)
  {
    uint64_t v12 = 0;
    int v21 = (char *)__src;
  }
  else
  {
    double v34 = v8;
    uint64_t v35 = v7;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = v4 >> 1;
    uint64_t v14 = a2[3];
    if (v14 >= 0) {
      uint64_t v15 = a2[3];
    }
    else {
      uint64_t v15 = v14 + 1;
    }
    uint64_t v36 = v15 >> 1;
    if (v3 <= 1) {
      uint64_t v3 = 1;
    }
    if (v10 <= 1) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = v10;
    }
    uint64_t v17 = -v13;
    do
    {
      if (v37 < 1)
      {
        uint64_t v19 = 0;
      }
      else
      {
        uint64_t v18 = 0;
        uint64_t v19 = 0;
        do
          v19 += *(void *)(*a2 + 8 * v18++) * (*(uint64_t (**)(void))(*(void *)a3 + 16))();
        while (v3 != v18);
      }
      uint64_t v20 = (v19 + v36) / v14;
      int v21 = (char *)__src;
      *((void *)__src + v11) = v20;
      v12 += v20;
      ++v11;
      ++v17;
    }
    while (v11 != v16);
    uint64_t v8 = v34;
    uint64_t v7 = v35;
  }
  if (v8 != &__src)
  {
    double v22 = v40;
    size_t v23 = v40 - v21;
    unint64_t v24 = (v40 - v21) >> 3;
    uint64_t v25 = *(void *)(v7 + 32);
    double v26 = *(char **)(v7 + 16);
    if (v24 <= (v25 - (uint64_t)v26) >> 3)
    {
      double v29 = *(unsigned char **)(v7 + 24);
      unint64_t v30 = (v29 - v26) >> 3;
      if (v30 < v24)
      {
        uint64_t v31 = &v21[8 * v30];
        if (v29 != v26)
        {
          memmove(*(void **)(v7 + 16), v21, v29 - v26);
          double v26 = *(char **)(v7 + 24);
        }
        size_t v23 = v22 - v31;
        if (v22 == v31) {
          goto LABEL_42;
        }
        uint64_t v32 = v26;
        uint64_t v33 = v31;
        goto LABEL_41;
      }
    }
    else
    {
      if (v26)
      {
        *(void *)(v7 + 24) = v26;
        operator delete(v26);
        uint64_t v25 = 0;
        *uint64_t v8 = 0;
        v8[1] = 0;
        __n128 v8[2] = 0;
      }
      if ((v23 & 0x8000000000000000) != 0) {
        std::vector<double>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v27 = v25 >> 2;
      if (v25 >> 2 <= v24) {
        uint64_t v27 = v24;
      }
      if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v28 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v28 = v27;
      }
      std::vector<long>::__vallocate[abi:ne180100](v8, v28);
      double v26 = *(char **)(v7 + 24);
    }
    if (v22 == v21)
    {
LABEL_42:
      *(void *)(v7 + 24) = &v26[v23];
      int v21 = (char *)__src;
      goto LABEL_43;
    }
    uint64_t v32 = v26;
    uint64_t v33 = v21;
LABEL_41:
    memmove(v32, v33, v23);
    goto LABEL_42;
  }
LABEL_43:
  *(void *)(v7 + 40) = v12;
  if (v21)
  {
    unint64_t v40 = v21;
    operator delete(v21);
  }
}

void sub_1A9A1E3A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A9A1E688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1A9A1E9F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  _Unwind_Resume(a1);
}

void sub_1A9A1ED04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9A1F21C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9A1F914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9A1FCCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24240(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24241(uint64_t a1)
{
}

id NUAssertLogger_24364()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_24383);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_24625()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_24595);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_24871()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_24885);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_25120()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_25076);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_25255()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_25275);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_25577()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_25595);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

double NU::DataSet::abs(double **this)
{
  uint64_t v1 = *this;
  uint64_t v2 = this[1];
  while (v1 != v2)
  {
    double result = fabs(*v1);
    *v1++ = result;
  }
  return result;
}

void NU::Abs(NU *this@<X0>, void *a2@<X8>)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v7, *(const void **)this, *((void *)this + 1), (uint64_t)(*((void *)this + 1) - *(void *)this) >> 3);
  uint64_t v5 = v7;
  uint64_t v4 = v8;
  if (v7 != (void *)v8)
  {
    uint64_t v6 = (double *)v7;
    do
    {
      *uint64_t v6 = fabs(*v6);
      ++v6;
    }
    while (v6 != (double *)v4);
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, v5, v4, (v4 - (uint64_t)v5) >> 3);
  if (v5)
  {
    operator delete(v5);
  }
}

void sub_1A9A2EA10(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void NU::Abs(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v6, *(const void **)a1, *(void *)(a1 + 8), (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  uint64_t v4 = v6;
  uint64_t v3 = v7;
  if (v6 != (void *)v7)
  {
    uint64_t v5 = (double *)v6;
    do
    {
      double *v5 = fabs(*v5);
      ++v5;
    }
    while (v5 != (double *)v3);
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, v4, v3, (v3 - (uint64_t)v4) >> 3);
  if (v4)
  {
    operator delete(v4);
  }
}

void sub_1A9A2EAD4(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

double NU::DataSet::square(double **this)
{
  uint64_t v1 = *this;
  uint64_t v2 = this[1];
  while (v1 != v2)
  {
    double result = *v1 * *v1;
    *v1++ = result;
  }
  return result;
}

double NU::Square@<D0>(NU *this@<X0>, double **a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, *(const void **)this, *((void *)this + 1), (uint64_t)(*((void *)this + 1) - *(void *)this) >> 3);
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  while (v5 != v6)
  {
    double result = *v5 * *v5;
    *v5++ = result;
  }
  return result;
}

double NU::Square@<D0>(uint64_t a1@<X0>, double **a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, *(const void **)a1, *(void *)(a1 + 8), (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  while (v4 != v5)
  {
    double result = *v4 * *v4;
    *v4++ = result;
  }
  return result;
}

NU::DataSet *NU::DataSet::pow(long double **this, long double a2)
{
  uint64_t v3 = *this;
  uint64_t v4 = this[1];
  if (*this != v4)
  {
    do
    {
      long double *v3 = pow(*v3, a2);
      ++v3;
    }
    while (v3 != v4);
  }
  return (NU::DataSet *)this;
}

NU::DataSet *NU::DataSet::log(long double **this)
{
  uint64_t v2 = *this;
  uint64_t v3 = this[1];
  while (v2 != v3)
  {
    long double *v2 = log(*v2);
    ++v2;
  }
  return (NU::DataSet *)this;
}

void NU::Log(NU *this@<X0>, void *a2@<X8>)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v7, *(const void **)this, *((void *)this + 1), (uint64_t)(*((void *)this + 1) - *(void *)this) >> 3);
  uint64_t v4 = v7;
  uint64_t v5 = v8;
  if (v7 != (void *)v8)
  {
    uint64_t v6 = (long double *)v7;
    do
    {
      *uint64_t v6 = log(*v6);
      ++v6;
    }
    while (v6 != (long double *)v5);
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, v4, v5, (v5 - (uint64_t)v4) >> 3);
  if (v4)
  {
    operator delete(v4);
  }
}

void sub_1A9A2ED1C(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void NU::Log(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v6, *(const void **)a1, *(void *)(a1 + 8), (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  uint64_t v3 = v6;
  uint64_t v4 = v7;
  if (v6 != (void *)v7)
  {
    uint64_t v5 = (long double *)v6;
    do
    {
      long double *v5 = log(*v5);
      ++v5;
    }
    while (v5 != (long double *)v4);
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, v3, v4, (v4 - (uint64_t)v3) >> 3);
  if (v3)
  {
    operator delete(v3);
  }
}

void sub_1A9A2EDF0(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

NU::DataSet *NU::DataSet::exp(long double **this)
{
  uint64_t v2 = *this;
  uint64_t v3 = this[1];
  while (v2 != v3)
  {
    long double *v2 = exp(*v2);
    ++v2;
  }
  return (NU::DataSet *)this;
}

void NU::Exp(NU *this@<X0>, void *a2@<X8>)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v7, *(const void **)this, *((void *)this + 1), (uint64_t)(*((void *)this + 1) - *(void *)this) >> 3);
  uint64_t v4 = v7;
  uint64_t v5 = v8;
  if (v7 != (void *)v8)
  {
    uint64_t v6 = (long double *)v7;
    do
    {
      *uint64_t v6 = exp(*v6);
      ++v6;
    }
    while (v6 != (long double *)v5);
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, v4, v5, (v5 - (uint64_t)v4) >> 3);
  if (v4)
  {
    operator delete(v4);
  }
}

void sub_1A9A2EF0C(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void NU::Exp(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v6, *(const void **)a1, *(void *)(a1 + 8), (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  uint64_t v3 = v6;
  uint64_t v4 = v7;
  if (v6 != (void *)v7)
  {
    uint64_t v5 = (long double *)v6;
    do
    {
      long double *v5 = exp(*v5);
      ++v5;
    }
    while (v5 != (long double *)v4);
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, v3, v4, (v4 - (uint64_t)v3) >> 3);
  if (v3)
  {
    operator delete(v3);
  }
}

void sub_1A9A2EFE0(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

double **NU::DataSet::operator+=(double **result, double a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = result[1];
  while (v2 != v3)
  {
    double *v2 = *v2 + a2;
    ++v2;
  }
  return result;
}

double **NU::DataSet::operator-=(double **result, double a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = result[1];
  while (v2 != v3)
  {
    double *v2 = *v2 - a2;
    ++v2;
  }
  return result;
}

void *NU::operator+@<X0>(uint64_t a1@<X0>, double **a2@<X8>, double a3@<D0>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  double result = std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, *(const void **)a1, *(void *)(a1 + 8), (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  while (v6 != v7)
  {
    *uint64_t v6 = *v6 + a3;
    ++v6;
  }
  return result;
}

void *NU::operator-@<X0>(uint64_t a1@<X0>, double **a2@<X8>, double a3@<D0>)
{
  return NU::operator+(a1, a2, -a3);
}

double NU::DataSet::operator*=(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(double **)a1;
  uint64_t v3 = *(void *)(a1 + 8) - *(void *)a1;
  uint64_t v4 = *(double **)a2;
  if ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3 >= (unint64_t)(v3 >> 3)) {
    uint64_t v5 = v3 >> 3;
  }
  else {
    uint64_t v5 = (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3;
  }
  for (; v5; --v5)
  {
    double v6 = *v4++;
    double result = v6 * *v2;
    *v2++ = result;
  }
  return result;
}

uint64_t __Block_byref_object_copy__25696(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25697(uint64_t a1)
{
}

void sub_1A9A32578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A32670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A327A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A9A32890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A9A32960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A32A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A9A32B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A9A32BDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A33120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9A332F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A339F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t NUGetBytesAtPositionFromImageCallback(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = a1;
  uint64_t v8 = [v7 format];
  uint64_t v9 = [v8 bytesPerPixel];
  uint64_t v10 = [v7 size];
  uint64_t v12 = v11;
  uint64_t v13 = [v8 alignedRowBytesForWidth:v10];
  if (v13 * v12 <= a3)
  {
    a4 = 0;
    goto LABEL_22;
  }
  if (a4 >= 1)
  {
    uint64_t v24 = a4;
    uint64_t v14 = a4 + a3;
    int64x2_t v25 = vdupq_n_s64(1uLL);
    uint64_t v15 = a3;
    while (1)
    {
      uint64_t v16 = v15 / v13;
      uint64_t v17 = v15 / v13 * v13;
      uint64_t v18 = v17 + v13;
      if (v14 < v17 + v13) {
        uint64_t v18 = v14;
      }
      uint64_t v19 = (v18 - v17) / v9;
      BOOL v20 = __OFSUB__(v15, v17);
      uint64_t v21 = v15 % v13;
      if (!v21) {
        break;
      }
      if (!((v21 < 0) ^ v20 | (v21 == 0)))
      {
        if (v21 == v21 / v9 * v9) {
          v21 /= v9;
        }
        else {
          uint64_t v21 = v21 / v9 + 1;
        }
        if (v10 < v19) {
          uint64_t v19 = v10;
        }
        v19 -= v21;
        goto LABEL_17;
      }
LABEL_19:
      uint64_t v15 = v13 + v13 * v16;
      if (v15 >= v14)
      {
        a4 = v24;
        goto LABEL_22;
      }
    }
    if (v10 < v19) {
      uint64_t v19 = v10;
    }
LABEL_17:
    if (v19)
    {
      *((void *)&v22 + 1) = v25.i64[1];
      *(void *)&long long v22 = v19;
      v26[0] = v21;
      v26[1] = v16;
      long long v27 = v22;
      +[NUImageUtilities copyPixelsFromImage:v7 rect:v26 destPtr:&a2[v17 - a3 + v21 * v9] destPtrRowBytes:v13];
    }
    goto LABEL_19;
  }
LABEL_22:

  return a4;
}

void sub_1A9A33C6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t NUGetBytePointerCallback(void *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  uint64_t v2 = [v1 layout];
  uint64_t v3 = [v2 tileCount];

  if (v3 != 1)
  {
    uint64_t v7 = NUAssertLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [NSString stringWithFormat:@"Tile count must be 1 for GetBytePointerCallback"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v10 = NUAssertLogger();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        uint64_t v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v16 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&unsigned char buf[12] = 2114;
        *(void *)&buf[14] = v16;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"const void * _Nullable NUGetBytePointerCallback(void *)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 131, @"Tile count must be 1 for GetBytePointerCallback", v17, v18, v19, v20, v21);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v4 = [v1 validRegion];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = ___ZL24NUGetBytePointerCallbackPv_block_invoke;
  v22[3] = &unk_1E5D95B68;
  v22[4] = buf;
  [v1 readBufferRegion:v4 withBlock:v22];

  uint64_t v5 = *(void *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);

  return v5;
}

void sub_1A9A33F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Unwind_Resume(a1);
}

void ___ZL24NUGetBytePointerCallbackPv_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [v4 buffer];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 bytes];
}

void sub_1A9A34050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A9A343C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9A348F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9A34D30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A35054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A35118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A35244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::vector<unsigned char>::vector(void *a1, size_t __sz, char *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (__sz)
  {
    size_t v4 = __sz;
    if ((__sz & 0x8000000000000000) != 0) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    double v6 = operator new(__sz);
    *a1 = v6;
    a1[1] = v6;
    uint64_t v7 = &v6[v4];
    a1[2] = &v6[v4];
    char v8 = *a3;
    do
    {
      *v6++ = v8;
      --v4;
    }
    while (v4);
    a1[1] = v7;
  }
  return a1;
}

void sub_1A9A352CC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x210], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A9A3542C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A356F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9A357F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1A9A358C4(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A9A35950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A35AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A9A35C20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A35CC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A36044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  _Unwind_Resume(a1);
}

void sub_1A9A361C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A36248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A9A3645C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,void *a24,void *a25)
{
  _Unwind_Resume(a1);
}

void sub_1A9A36CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1A9A36E88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__26275(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26276(uint64_t a1)
{
}

void sub_1A9A36FC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A9A37350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A37528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1A9A3788C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1A9A37A38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A37B24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)_NUImage;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A9A382A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9A38654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A387C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A3896C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1A9A38AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A9A38BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A9A38C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A38D14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A38D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A38DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A9A38E08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A38E74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A39154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A39468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9A395A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A9A396A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A9A39774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A39834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A9A39920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A9A399F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A39D04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A3A018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9A3A114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A9A3A200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A9A3A2D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A9A3A77C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1A9A3B674(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _NUAssertFailHandler(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12 = a4;
  uint64_t v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v14 = +[NUAssertionHandler currentHandler];
  uint64_t v15 = [NSString stringWithUTF8String:a1];
  uint64_t v16 = [NSString stringWithUTF8String:a2];
  [v14 handleFailureInFunction:v15 file:v16 lineNumber:a3 currentlyExecutingJobName:v13 description:v12 arguments:&a9];

  abort();
}

void _NUAssertContinueHandler(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  id v14 = a4;
  uint64_t v15 = +[NUAssertionHandler currentHandler];
  uint64_t v16 = [NSString stringWithUTF8String:a1];
  uint64_t v17 = [NSString stringWithUTF8String:a2];
  [v15 continueAfterAssertInFunction:v16 file:v17 lineNumber:a3 currentlyExecutingJobName:v13 description:v14 arguments:&a9];
}

id NUAssertLogger_26747()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_26761);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_26895()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_26919);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A9A3DA24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__26926(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26927(uint64_t a1)
{
}

void sub_1A9A3DCB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_26987()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_27002);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_27250()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_27192);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_27414()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_74);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_27470()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_29);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

uint64_t NUProtocolEnumerateMethods(Protocol *a1, BOOL a2, BOOL a3, void *a4)
{
  uint64_t v7 = a4;
  unsigned int outCount = 0;
  char v8 = protocol_copyMethodDescriptionList(a1, a2, a3, &outCount);
  if (v8)
  {
    uint64_t v9 = v8;
    if (outCount)
    {
      unint64_t v10 = 0;
      BOOL v11 = v8;
      do
      {
        uint64_t v12 = ((uint64_t (**)(id, objc_method_description *, BOOL, BOOL))v7)[2](v7, v11, a2, a3);
        if ((v12 & 1) == 0) {
          break;
        }
        ++v10;
        ++v11;
      }
      while (v10 < outCount);
    }
    else
    {
      uint64_t v12 = 1;
    }
    free(v9);
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

id NUDebugQuicklookWrapCGImage(uint64_t a1)
{
  uint64_t v1 = (void *)[objc_alloc(NSClassFromString(&cfstr_Uiimage.isa)) initWithCGImage:a1];

  return v1;
}

void NUDispatchAsyncEnforceCurrentQoS(void *a1, void *a2)
{
  id v3 = a2;
  id v5 = a1;
  qos_class_t v4 = qos_class_self();
  NUDispatchAsyncEnforceQoS(v5, v4, v3);
}

void NUDispatchAsyncEnforceQoS(void *a1, dispatch_qos_class_t a2, void *a3)
{
  id v5 = a1;
  id v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, a2, 0, a3);
  dispatch_async(v5, v6);
}

dispatch_time_t NUDispatchSeconds(double a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1 < 0.0)
  {
    uint64_t v2 = NUAssertLogger_27470();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v3 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "seconds >= 0.0");
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v3;
      _os_log_error_impl(&dword_1A9892000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v5 = NUAssertLogger_27470();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v6)
      {
        uint64_t v9 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        unint64_t v10 = (void *)MEMORY[0x1E4F29060];
        id v11 = v9;
        uint64_t v12 = [v10 callStackSymbols];
        uint64_t v13 = [v12 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = v9;
        __int16 v20 = 2114;
        uint64_t v21 = v13;
        _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F29060] callStackSymbols];
      char v8 = [v7 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v8;
      _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"dispatch_time_t NUDispatchSeconds(NSTimeInterval)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUUtilities.m", 154, @"Invalid parameter not satisfying: %s", v14, v15, v16, v17, (uint64_t)"seconds >= 0.0");
  }

  return dispatch_time(0, (uint64_t)(a1 * 1000000000.0));
}

uint64_t NUIsAppleInternal()
{
  if (NUIsAppleInternal_onceToken != -1) {
    dispatch_once(&NUIsAppleInternal_onceToken, &__block_literal_global_18);
  }
  return NUIsAppleInternal_isAppleInternal;
}

uint64_t __NUIsAppleInternal_block_invoke()
{
  uint64_t result = os_variant_has_internal_ui();
  NUIsAppleInternal_isAppleInternal = result;
  return result;
}

uint64_t NUDeepDictionaryHash(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v1);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        char v8 = [v1 objectForKeyedSubscript:v7];
        uint64_t v9 = NUDeepValueHash();
        v4 ^= (0x16FB702EBEEDA9 * v9) ^ (0x13D6D34D692409 * [v7 hash]);
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t NUDeepValueHash(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = NUDeepDictionaryHash(v1);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v2 = NUDeepMapTableHash(v1);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v2 = NUDeepArrayHash(v1);
      }
      else {
        uint64_t v2 = [v1 hash];
      }
    }
  }
  uint64_t v3 = v2;

  return v3;
}

uint64_t NUDeepMapTableHash(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v1);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        char v8 = [v1 objectForKey:v7];
        uint64_t v9 = NUDeepValueHash();
        v4 ^= v9 ^ [v7 hash];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t NUDeepArrayHash(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v1);
        }
        v4 ^= NUDeepValueHash(*(void **)(*((void *)&v8 + 1) + 8 * i));
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t NUMapTablePointerHash(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v1);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v8 = [v1 objectForKey:v7];
        v4 ^= v8 ^ [v7 hash];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id NUFileTypeFromExtension(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    BOOL v6 = NUAssertLogger_27470();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "ext != nil");
      *(_DWORD *)buf = 138543362;
      size_t v23 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v9 = NUAssertLogger_27470();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        long long v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        size_t v23 = v13;
        __int16 v24 = 2114;
        uint64_t v25 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      long long v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      size_t v23 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"NSString * _Nonnull NUFileTypeFromExtension(NSString *__strong _Nonnull)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUUtilities.m", 261, @"Invalid parameter not satisfying: %s", v18, v19, v20, v21, (uint64_t)"ext != nil");
  }
  uint64_t v2 = v1;
  uint64_t v3 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v1];
  uint64_t v4 = [v3 identifier];

  return v4;
}

id NUStringForTypeCode(int a1)
{
  v3[0] = HIBYTE(a1);
  v3[1] = BYTE2(a1);
  v3[2] = BYTE1(a1);
  __n128 v3[3] = a1;
  v3[4] = 0;
  id v1 = (void *)[[NSString alloc] initWithCString:v3 encoding:30];

  return v1;
}

uint64_t NUTypeCodeFromString(void *a1)
{
  uint64_t result = [a1 getCString:v2 maxLength:5 encoding:30];
  if (result) {
    return (v2[1] << 16) | (v2[0] << 24) | (v2[2] << 8) | v2[3];
  }
  return result;
}

id NUDictionary(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  memset(v27, 0, 128);
  memset(v26, 0, sizeof(v26));
  __int16 v24 = (id *)&a9;
  id v9 = a1;
  BOOL v10 = v9;
  unint64_t v11 = 0;
  if (v9)
  {
    long long v12 = v9;
    do
    {
      long long v13 = v24;
      uint64_t v25 = v24 + 1;
      id v14 = *v13;
      id v15 = *v13;
      if (v15)
      {
        objc_storeStrong(&v27[v11], v12);
        objc_storeStrong((id *)v26 + v11++, v14);
      }

      uint64_t v16 = v25;
      __int16 v24 = v25 + 1;
      id v17 = *v16;

      if (v17) {
        BOOL v18 = v11 >= 0x10;
      }
      else {
        BOOL v18 = 1;
      }
      long long v12 = v17;
    }
    while (!v18);

    if (v11 == 16)
    {
      id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Too many keys!" userInfo:0];
      objc_exception_throw(v23);
    }
  }
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v27 count:v11];
  for (uint64_t i = 120; i != -8; i -= 8)

  for (uint64_t j = 15; j != -1; --j)

  return v19;
}

id _NUMakeDictionary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  BOOL v10 = [MEMORY[0x1E4F1CA60] dictionary];
  for (uint64_t i = (void **)&a9; a1; --a1)
  {
    unint64_t v11 = i;
    long long v12 = *i;
    i += 2;
    long long v13 = v11[1];
    id v14 = v12;
    [v10 setObject:v13 forKeyedSubscript:v14];
  }

  return v10;
}

id NUMakeDictionary1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _NUMakeDictionary(1, a2, a3, a4, a5, a6, a7, a8, a1);
}

id NUMakeDictionary2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _NUMakeDictionary(2, a2, a3, a4, a5, a6, a7, a8, a1);
}

id NUMakeDictionary3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _NUMakeDictionary(3, a2, a3, a4, a5, a6, a7, a8, a1);
}

id NUMakeDictionary4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _NUMakeDictionary(4, a2, a3, a4, a5, a6, a7, a8, a1);
}

id NUMakeDictionary5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _NUMakeDictionary(5, a2, a3, a4, a5, a6, a7, a8, a1);
}

id NUMakeDictionary6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _NUMakeDictionary(6, a2, a3, a4, a5, a6, a7, a8, a1);
}

id NUMakeDictionary7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _NUMakeDictionary(7, a2, a3, a4, a5, a6, a7, a8, a1);
}

id NUMakeDictionary8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _NUMakeDictionary(8, a2, a3, a4, a5, a6, a7, a8, a1);
}

id NUMakeDictionary9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _NUMakeDictionary(9, a2, a3, a4, a5, a6, a7, a8, a1);
}

id NUMakeDictionary10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _NUMakeDictionary(10, a2, a3, a4, a5, a6, a7, a8, a1);
}

id NUAssertLogger_27529()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_27547);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_27648()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_27665);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NULogger_28099()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
  }
  uint64_t v0 = (void *)_NULogger;

  return v0;
}

void sub_1A9A54544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__28296(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__28297(uint64_t a1)
{
}

id NUAssertLogger_28445()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_28429);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

uint64_t __Block_byref_object_copy__28452(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__28453(uint64_t a1)
{
}

id NUAssertLogger_28614()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_62_28631);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_28796()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_28816);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_28860()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_28873);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

id NUAssertLogger_28945()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_28972);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A9A5B7EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A9A5BD98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_29103()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_29187);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

void sub_1A9A5DD38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 200), 8);
  _Block_object_dispose((const void *)(v36 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__29192(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29193(uint64_t a1)
{
}

id NUAssertLogger_29297()
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_29314);
  }
  uint64_t v0 = (void *)_NUAssertLogger;

  return v0;
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9720](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E30](number);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1F40D97A0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1F40D9870](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1F40D9878](context);
}

uint64_t CGColorConversionInfoIterateColorSpaceFunctionsWithCallbacks()
{
  return MEMORY[0x1F40D9958]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D99B0](red, green, blue, alpha);
}

void CGColorRelease(CGColorRef color)
{
}

uint64_t CGColorSpaceContainsFlexGTCInfo()
{
  return MEMORY[0x1F40D9A68]();
}

uint64_t CGColorSpaceCopyICCProfileDescription()
{
  return MEMORY[0x1F40D9AB0]();
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1F40D9AC0](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateExtended(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B00](space);
}

uint64_t CGColorSpaceCreateFromCICP()
{
  return MEMORY[0x1F40D9B10]();
}

CGColorSpaceRef CGColorSpaceCreateLinearized(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B30](space);
}

CGColorSpaceRef CGColorSpaceCreateWithICCData(CFTypeRef data)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B48](data);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B70](plist);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x1F40D9B78]();
}

CGColorSpaceRef CGColorSpaceGetBaseColorSpace(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B90](space);
}

uint64_t CGColorSpaceGetCICPInfo()
{
  return MEMORY[0x1F40D9B98]();
}

uint64_t CGColorSpaceGetMD5Digest()
{
  return MEMORY[0x1F40D9BD8]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

uint64_t CGColorSpaceGetType()
{
  return MEMORY[0x1F40D9C08]();
}

CFTypeID CGColorSpaceGetTypeID(void)
{
  return MEMORY[0x1F40D9C10]();
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x1F40D9C40](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9C50](space);
}

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9C60](space);
}

BOOL CGColorSpaceUsesITUR_2100TF(CGColorSpaceRef a1)
{
  return MEMORY[0x1F40D9C68](a1);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextFlush(CGContextRef c)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateDirect(void *info, off_t size, const CGDataProviderDirectCallbacks *callbacks)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA2F0](info, size, callbacks);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x1F40E96E0]();
}

void CGImageDestinationAddAuxiliaryDataInfo(CGImageDestinationRef idst, CFStringRef auxiliaryImageDataType, CFDictionaryRef auxiliaryDataInfoDictionary)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D8](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

uint64_t CGImageGetContentHeadroom()
{
  return MEMORY[0x1F40DA910]();
}

CGImageMetadataTagRef CGImageMetadataCopyTagWithPath(CGImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return (CGImageMetadataTagRef)MEMORY[0x1F40E9798](metadata, parent, path);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1F40E97C8]();
}

CGMutableImageMetadataRef CGImageMetadataCreateMutableCopy(CGImageMetadataRef metadata)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1F40E97D0](metadata);
}

CFDataRef CGImageMetadataCreateXMPData(CGImageMetadataRef metadata, CFDictionaryRef options)
{
  return (CFDataRef)MEMORY[0x1F40E97E0](metadata, options);
}

CFTypeID CGImageMetadataGetTypeID(void)
{
  return MEMORY[0x1F40E97F0]();
}

BOOL CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadataRef metadata, CFStringRef xmlns, CFStringRef prefix, CFErrorRef *err)
{
  return MEMORY[0x1F40E9810](metadata, xmlns, prefix, err);
}

BOOL CGImageMetadataSetTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CGImageMetadataTagRef tag)
{
  return MEMORY[0x1F40E9820](metadata, parent, path, tag);
}

CFTypeRef CGImageMetadataTagCopyValue(CGImageMetadataTagRef tag)
{
  return (CFTypeRef)MEMORY[0x1F40E9850](tag);
}

CGImageMetadataTagRef CGImageMetadataTagCreate(CFStringRef xmlns, CFStringRef prefix, CFStringRef name, CGImageMetadataType type, CFTypeRef value)
{
  return (CGImageMetadataTagRef)MEMORY[0x1F40E9858](xmlns, prefix, name, *(void *)&type, value);
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyAuxiliaryDataInfoAtIndex(CGImageSourceRef isrc, size_t index, CFStringRef auxiliaryImageDataType)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9908](isrc, index, auxiliaryImageDataType);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9930](isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1F40DB2E0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x1F40DB300]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x1F40DB8D8](desc);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB988](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1F40DB998](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x1F40DB9A0](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x1F40DBBB8](desc, extensionKey);
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x1F40DBBC0](desc);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DBBC8](desc);
}

OSStatus CMMetadataFormatDescriptionCreateWithMetadataSpecifications(CFAllocatorRef allocator, CMMetadataFormatType metadataType, CFArrayRef metadataSpecifications, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DBC80](allocator, *(void *)&metadataType, metadataSpecifications, formatDescriptionOut);
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x1F40DBC88](desc);
}

uint64_t CMPhotoDecompressionContainerCopyAuxiliaryImageMetadataForIndexWithOptions()
{
  return MEMORY[0x1F410D738]();
}

uint64_t CMPhotoDecompressionContainerCopyAuxiliaryImageTypeURNForIndexWithOptions()
{
  return MEMORY[0x1F410D750]();
}

uint64_t CMPhotoDecompressionContainerCopyCustomMetadataForIndexWithOptions()
{
  return MEMORY[0x1F410D760]();
}

uint64_t CMPhotoDecompressionContainerCreateAuxiliaryImageForIndex()
{
  return MEMORY[0x1F410D7C0]();
}

uint64_t CMPhotoDecompressionContainerGetAuxiliaryImageCountForIndexWithOptions()
{
  return MEMORY[0x1F410D858]();
}

uint64_t CMPhotoDecompressionContainerGetAuxiliaryImageGeometryForIndexWithOptions()
{
  return MEMORY[0x1F410D870]();
}

uint64_t CMPhotoDecompressionContainerGetAuxiliaryImageTypeForIndexWithOptions()
{
  return MEMORY[0x1F410D880]();
}

uint64_t CMPhotoDecompressionContainerGetImageCountWithOptions()
{
  return MEMORY[0x1F410D8A8]();
}

uint64_t CMPhotoDecompressionContainerGetImageGeometryForIndexWithOptions()
{
  return MEMORY[0x1F410D8B8]();
}

uint64_t CMPhotoDecompressionDetectContainerFormat()
{
  return MEMORY[0x1F410D938]();
}

uint64_t CMPhotoDecompressionSessionCreate()
{
  return MEMORY[0x1F410D960]();
}

uint64_t CMPhotoDecompressionSessionCreateContainer()
{
  return MEMORY[0x1F410D968]();
}

uint64_t CMPhotoGetAPIVersion()
{
  return MEMORY[0x1F410DA18]();
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD30](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

CMTime *__cdecl CMSampleBufferGetDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDB8](retstr, sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1F40DBDC0](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1F40DBDC8](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBDD0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDE8](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDF8](retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x1F40DBE00](sbuf, createIfNecessary);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC088](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1F40DC0D0](retstr, time, *(void *)&newTimescale, *(void *)&method);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC0E0](time, allocator);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x1F40DC0E8](allocator, time);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1F40DC110](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMapTimeFromRangeToRange(CMTime *__return_ptr retstr, CMTime *t, CMTimeRange *fromRange, CMTimeRange *toRange)
{
  return (CMTime *)MEMORY[0x1F40DC130](retstr, t, fromRange, toRange);
}

CMTime *__cdecl CMTimeMaximum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC160](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC168](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMultiply(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier)
{
  return (CMTime *)MEMORY[0x1F40DC170](retstr, time, *(void *)&multiplier);
}

CMTime *__cdecl CMTimeMultiplyByRatio(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier, int32_t divisor)
{
  return (CMTime *)MEMORY[0x1F40DC180](retstr, time, *(void *)&multiplier, *(void *)&divisor);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1F40DC190](range, time);
}

Boolean CMTimeRangeContainsTimeRange(CMTimeRange *range, CMTimeRange *otherRange)
{
  return MEMORY[0x1F40DC198](range, otherRange);
}

CFDictionaryRef CMTimeRangeCopyAsDictionary(CMTimeRange *range, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC1A0](range, allocator);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x1F40DC1A8](allocator, range);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1F40DC1B0](range1, range2);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1B8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1F40DC1C0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeGetIntersection(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1C8](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeGetUnion(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1D0](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1D8](retstr, start, duration);
}

CMTimeRange *__cdecl CMTimeRangeMakeFromDictionary(CMTimeRange *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1E0](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreate(CFAllocatorRef allocator, CMVideoCodecType codecType, int32_t width, int32_t height, CFDictionaryRef extensions, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DC300](allocator, *(void *)&codecType, *(void *)&width, *(void *)&height, extensions, formatDescriptionOut);
}

CGRect CMVideoFormatDescriptionGetCleanAperture(CMVideoFormatDescriptionRef videoDesc, Boolean originIsAtTopLeft)
{
  MEMORY[0x1F40DC330](videoDesc, originIsAtTopLeft);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1F40DC338](videoDesc);
}

uint64_t CMVideoFormatDescriptionGetVideoDynamicRange()
{
  return MEMORY[0x1F40DC368]();
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1F40DFB48](buffer, key, attachmentMode);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFB50](buffer, *(void *)&attachmentMode);
}

void CVBufferRemoveAttachment(CVBufferRef buffer, CFStringRef key)
{
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
}

CGColorSpaceRef CVImageBufferCreateColorSpaceFromAttachments(CFDictionaryRef attachments)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DFC18](attachments);
}

CGColorSpaceRef CVImageBufferGetColorSpace(CVImageBufferRef imageBuffer)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DFC28](imageBuffer);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD00](allocator, width, height, *(void *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD08](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1F40DFD30](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD48](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD50](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD70](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFDA0](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFDB0](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1F40DFE40](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFE50](allocator, *(void *)&pixelFormat);
}

uint64_t FigAudioFormatDescriptionGetCinematicAudioEffectEligibility()
{
  return MEMORY[0x1F40DC628]();
}

uint64_t FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors()
{
  return MEMORY[0x1F40DDC58]();
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x1F40E9158](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x1F40E91A8](*(void *)&entry, name);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E9300](buffer, key);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9308](properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9350](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E93A8](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9440](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9460](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9480](buffer);
}

uint32_t IOSurfaceGetSeed(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E94C0](buffer);
}

int32_t IOSurfaceGetUseCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E94E8](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E94F8](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

void IOSurfaceRemoveValue(IOSurfaceRef buffer, CFStringRef key)
{
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  return MEMORY[0x1F40E95D8](buffer, *(void *)&newState, oldState);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x1F40EDE38]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1F40D8B10](typePtr, sizep, alignp);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1F40E7168]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t PFExists()
{
  return MEMORY[0x1F413F310]();
}

uint64_t PFFilter()
{
  return MEMORY[0x1F413F318]();
}

uint64_t PFFind()
{
  return MEMORY[0x1F413F320]();
}

uint64_t PFMap()
{
  return MEMORY[0x1F413F338]();
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x1F4103190](pixelBuffer, options, imageOut);
}

OSStatus VTPixelRotationSessionCreate(CFAllocatorRef allocator, VTPixelRotationSessionRef *pixelRotationSessionOut)
{
  return MEMORY[0x1F4103490](allocator, pixelRotationSessionOut);
}

OSStatus VTPixelRotationSessionRotateImage(VTPixelRotationSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1F41034A8](session, sourceBuffer, destinationBuffer);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1F41034D0](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1F41034F0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1F4103538](session, propertyKey, propertyValue);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionaryValue()
{
  return MEMORY[0x1F40D8D18]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

uint64_t std::__sort<std::__less<double,double> &,double *>()
{
  return MEMORY[0x1F417EC38]();
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t __invert_d4()
{
  return MEMORY[0x1F40C9BE8]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1F40C9CA0](a1, *(void *)&a2, a3, a4);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181518](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
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

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

float exp2f(float a1)
{
  MEMORY[0x1F40CBFF0](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

gid_t getgid(void)
{
  return MEMORY[0x1F40CC3D0]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

tm *__cdecl gmtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1F40CC5A8](a1);
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x1F40CC630](__x, __y);
  return result;
}

float hypotf(float a1, float a2)
{
  MEMORY[0x1F40CC640](a1, a2);
  return result;
}

float ldexpf(float a1, int a2)
{
  MEMORY[0x1F40CC808](*(void *)&a2, a1);
  return result;
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x1F40CC8B0](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint64_t memorystatus_control()
{
  return MEMORY[0x1F40CCD18]();
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
}

void memset_pattern8(void *__b, const void *__pattern8, size_t __len)
{
}

objc_method_description *__cdecl method_getDescription(Method m)
{
  return (objc_method_description *)MEMORY[0x1F41815F0](m);
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x1F40CCE48](__y, __x);
  return result;
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

void objc_terminate(void)
{
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1F40CD658]();
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

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1F4181AE8](p, isRequiredMethod, isInstanceMethod, outCount);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

int raise(int a1)
{
  return MEMORY[0x1F40CDC00](*(void *)&a1);
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0A0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1F40CE198](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

vImage_Error vImageConvert_Planar16FtoPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D25B0](src, dest, *(void *)&flags);
}

vImage_Error vImageHistogramCalculation_ARGB8888(const vImage_Buffer *src, vImagePixelCount *histogram[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2950](src, histogram, *(void *)&flags);
}

vImage_Error vImageHistogramCalculation_ARGBFFFF(const vImage_Buffer *src, vImagePixelCount *histogram[4], unsigned int histogram_entries, Pixel_F minVal, Pixel_F maxVal, vImage_Flags flags)
{
  return MEMORY[0x1F40D2958](src, histogram, *(void *)&histogram_entries, *(void *)&flags, minVal, maxVal);
}

vImage_Error vImageMatrixMultiply_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const int16_t matrix[16], int32_t divisor, const int16_t *pre_bias, const int32_t *post_bias, vImage_Flags flags)
{
  return MEMORY[0x1F40D2A58](src, dest, matrix, *(void *)&divisor, pre_bias, post_bias, *(void *)&flags);
}

vImage_Error vImageMatrixMultiply_ARGBFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, const float matrix[16], const float *pre_bias, const float *post_bias, vImage_Flags flags)
{
  return MEMORY[0x1F40D2A68](src, dest, matrix, pre_bias, post_bias, *(void *)&flags);
}

vImage_Error vImagePermuteChannels_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2B60](src, dest, permuteMap, *(void *)&flags);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1F40CE6A8](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

kern_return_t vm_purgable_control(vm_map_t target_task, vm_address_t address, vm_purgable_t control, int *state)
{
  return MEMORY[0x1F40CE6E0](*(void *)&target_task, address, *(void *)&control, state);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1F40CE708]();
}

uint64_t voucher_copy_without_importance()
{
  return MEMORY[0x1F40CE720]();
}