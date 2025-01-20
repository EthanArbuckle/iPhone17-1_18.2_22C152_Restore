void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_impl(a1, v9, OS_LOG_TYPE_DEFAULT, a4, &a9, 2u);
}

BOOL OUTLINED_FUNCTION_1(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_DEFAULT);
}

void sub_235D7E330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235D7F018(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_235D7F2D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

__CFString *DBSStringForDisplayZoomOption(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Standard";
  }
  else {
    return off_264C7A630[a1 - 1];
  }
}

id DBSAnimationPackageURLForDisplayZoomOptionAndUserInterfaceStyle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = MGGetSInt32Answer();
  if (a1 == 1)
  {
    v7 = @"Zoomed";
  }
  else if (a1 == 3 || a1 == 2)
  {
    v7 = @"Dense";
  }
  else
  {
    v7 = @"Standard";
  }
  v8 = &stru_26E931C58;
  v9 = @"-Dark";
  if (a2 != 2) {
    v9 = &stru_26E931C58;
  }
  if (a3 == 1) {
    v8 = @"-RTL";
  }
  v10 = @"Classic";
  if (v6 == 2) {
    v10 = @"Modern";
  }
  v11 = [NSString stringWithFormat:@"%@-%@%@%@", v10, v7, v8, v9];
  v12 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
  v13 = [v12 URLForResource:v11 withExtension:@"ca"];

  return v13;
}

id DBSStillPreviewImageForDisplayZoomOption(uint64_t a1)
{
  int v2 = MGGetSInt32Answer();
  if ((unint64_t)(a1 - 1) > 2) {
    v3 = @"Standard";
  }
  else {
    v3 = off_264C7A648[a1 - 1];
  }
  v4 = @"Classic";
  if (v2 == 2) {
    v4 = @"Modern";
  }
  v5 = [NSString stringWithFormat:@"%@-%@", v4, v3];
  int v6 = (void *)MEMORY[0x263F827E8];
  v7 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
  v8 = [v6 imageNamed:v5 inBundle:v7 compatibleWithTraitCollection:0];

  return v8;
}

void DBSPurgeKeyboardCache()
{
  id v0 = objc_alloc(MEMORY[0x263F255A8]);
  uint64_t v1 = objc_msgSend(NSString, "pathWithComponents:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", CPSharedResourcesDirectory(), @"Library", @"Caches", @"com.apple.keyboards", 0));
  if (UIKeyboardCacheVersion_onceToken != -1) {
    dispatch_once(&UIKeyboardCacheVersion_onceToken, &__block_literal_global);
  }
  int v2 = (void *)[v0 initWithPath:v1 version:UIKeyboardCacheVersion_buildVersion];
  [v2 purge];
}

uint64_t __UIKeyboardCacheVersion_block_invoke()
{
  uint64_t result = [(id)MGCopyAnswerWithError() hash];
  UIKeyboardCacheVersion_buildVersion = result;
  return result;
}

void sub_235D845F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235D8712C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_235D8808C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
}

BOOL numberInSpecifierValidationRange(void *a1, void *a2)
{
  id v3 = a2;
  [a1 doubleValue];
  double v5 = v4;
  int v6 = [v3 objectForKeyedSubscript:*MEMORY[0x263F60038]];
  [v6 doubleValue];
  double v8 = v7;

  v9 = [v3 objectForKeyedSubscript:*MEMORY[0x263F60030]];

  [v9 doubleValue];
  double v11 = v10;

  return v11 + 0.000001 > v5 && v8 + -0.000001 < v5;
}

void updateSpecifierValidationRange(void *a1, double a2, double a3)
{
  double v5 = NSNumber;
  id v6 = a1;
  double v7 = [v5 numberWithDouble:a2];
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x263F60038]];

  id v8 = [NSNumber numberWithDouble:a3];
  [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x263F60030]];
}

void sub_235D8DD10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235D8E41C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

uint64_t DBSGetMobileFrameBuffer()
{
  id v0 = [MEMORY[0x263F82B60] mainScreen];
  uint64_t v1 = [v0 displayConfiguration];

  uint64_t v2 = [v1 deviceName];
  if (!v2)
  {
    double v5 = DBSLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      DBSGetMobileFrameBuffer_cold_1(v5);
    }
    goto LABEL_7;
  }
  int v3 = IOMobileFramebufferOpenByName();
  if (v3)
  {
    int v4 = v3;
    double v5 = DBSLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      DBSGetMobileFrameBuffer_cold_2(v4, v5);
    }
LABEL_7:
  }
  return 0;
}

uint64_t DBSChamoisEnabled()
{
  if (DBSChamoisEnabled_onceToken != -1) {
    dispatch_once(&DBSChamoisEnabled_onceToken, &__block_literal_global_5);
  }
  return DBSChamoisEnabled__isChamoisEnabled;
}

uint64_t __DBSChamoisEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  DBSChamoisEnabled__isChamoisEnabled = result;
  return result;
}

uint64_t DBSReverseZoomEnabled()
{
  if (DBSReverseZoomEnabled_onceToken != -1) {
    dispatch_once(&DBSReverseZoomEnabled_onceToken, &__block_literal_global_4);
  }
  return DBSReverseZoomEnabled__reverseZoomEnabled;
}

uint64_t __DBSReverseZoomEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  DBSReverseZoomEnabled__reverseZoomEnabled = result;
  return result;
}

uint64_t DBSMostDisplaySpaceEnabled()
{
  if (DBSMostDisplaySpaceEnabled_onceToken != -1) {
    dispatch_once(&DBSMostDisplaySpaceEnabled_onceToken, &__block_literal_global_8);
  }
  return DBSMostDisplaySpaceEnabled__isMostDisplaySpaceEnabled;
}

uint64_t __DBSMostDisplaySpaceEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  DBSMostDisplaySpaceEnabled__isMostDisplaySpaceEnabled = result;
  return result;
}

double GetWhitepointShiftLuminanceLoss(float64x2_t a1, float64_t a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  __asm { FMOV            V3.2D, #1.0 }
  {
    unint64_t v14 = *(void *)&a1.f64[0];
    long long v16 = _Q3;
    double v12 = a2;
    a2 = v12;
    *(void *)&a1.f64[0] = v14;
    _Q3 = v16;
    if (v10)
    {
      GetWhitepointShiftLuminanceLoss::p3 = xmmword_235DA5AD0;
      *(_OWORD *)algn_268848FD0 = v16;
      xmmword_268848FE0 = xmmword_235DA5AE0;
      unk_268848FF0 = v16;
      xmmword_268849000 = xmmword_235DA5AF0;
      unk_268849010 = v16;
      a2 = v12;
      *(void *)&a1.f64[0] = v14;
      _Q3 = v16;
    }
  }
  double v7 = (float64x2_t *)&off_235DA5000;
  {
    unint64_t v15 = *(void *)&a1.f64[0];
    long long v17 = _Q3;
    double v13 = a2;
    a2 = v13;
    *(void *)&a1.f64[0] = v15;
    _Q3 = v17;
    double v7 = (float64x2_t *)&off_235DA5000;
    if (v11)
    {
      GetWhitepointShiftLuminanceLoss::D65_xyY = xmmword_235DA5B00;
      *(_OWORD *)algn_268849050 = v17;
      a2 = v13;
      *(void *)&a1.f64[0] = v15;
      _Q3 = v17;
      double v7 = (float64x2_t *)&off_235DA5000;
    }
  }
  a1.f64[1] = a2;
  float64x2_t v8 = vsubq_f64(v7[176], a1);
  v20[2] = xmmword_268848FE0;
  v20[3] = unk_268848FF0;
  v20[4] = xmmword_268849000;
  v20[5] = unk_268849010;
  v20[0] = GetWhitepointShiftLuminanceLoss::p3;
  v20[1] = *(_OWORD *)algn_268848FD0;
  v19[0] = v8;
  v19[1] = _Q3;
  v18[0] = GetWhitepointShiftLuminanceLoss::D65_xyY;
  v18[1] = *(_OWORD *)algn_268849050;
  ChromaticAdaptationTransform<double>::ChromaticAdaptationTransform(v21, v20, v19, v18);
  return v22;
}

#error "235D908AC: call analysis failed (funcsize=147)"

_OWORD *RGBXYZConversionMatrices<double>::RGBXYZConversionMatrices(_OWORD *a1, uint64_t a2, float64x2_t *a3, double a4, float64x2_t a5, double a6, double a7, double a8, float64x2_t a9, double a10, float64x2_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,float64x2_t a45,float64x2_t a46,float64x2_t a47,float64x2_t a48,float64x2_t a49,float64x2_t a50)
{
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  a5.f64[0] = *(float64_t *)(a2 + 16);
  double v51 = *(double *)(a2 + 8);
  v52.f64[0] = a5.f64[0] * *(double *)a2 / v51;
  a9.f64[0] = a5.f64[0] * (1.0 - *(double *)a2 - v51) / v51;
  v52.f64[1] = a5.f64[0];
  float64x2_t v67 = v52;
  float64x2_t v68 = a9;
  long long v53 = *(_OWORD *)(a2 + 32);
  a5.f64[0] = *(float64_t *)(a2 + 48);
  v52.f64[0] = *(float64_t *)(a2 + 40);
  v54.f64[0] = a5.f64[0] * *(double *)&v53 / v52.f64[0];
  a11.f64[0] = a5.f64[0] * (1.0 - *(double *)&v53 - v52.f64[0]) / v52.f64[0];
  v54.f64[1] = a5.f64[0];
  float64x2_t v65 = v54;
  float64x2_t v66 = a11;
  long long v55 = *(_OWORD *)(a2 + 64);
  a5.f64[0] = *(float64_t *)(a2 + 80);
  v52.f64[0] = *(float64_t *)(a2 + 72);
  v54.f64[0] = a5.f64[0] * *(double *)&v55 / v52.f64[0];
  v52.f64[0] = a5.f64[0] * (1.0 - *(double *)&v55 - v52.f64[0]) / v52.f64[0];
  float64x2_t v69 = v52;
  v54.f64[1] = a5.f64[0];
  float64x2_t v64 = v54;
  float64x2_t v56 = *a3;
  float64x2_t v57 = a3[1];
  v54.f64[0] = a3->f64[1];
  a5.f64[0] = vmuld_n_f64(a3->f64[0], v57.f64[0]) / v54.f64[0];
  float64x2_t v62 = v57;
  float64x2_t v63 = a5;
  v56.f64[0] = (1.0 - a3->f64[0] - v54.f64[0]) * v57.f64[0] / v54.f64[0];
  float64x2_t vars0 = v56;
  __invert_d3();
  float64x2_t v58 = vmlaq_f64(vmlaq_f64(vmulq_f64(v63, a46), v62, a48), vars0, a50);
  float64x2_t v59 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(a45, v63.f64[0]), a47, v62.f64[0]), a49, vars0.f64[0]);
  *a1 = vmulq_n_f64(v67, v59.f64[0]);
  a1[1] = vmulq_f64(v68, v59);
  a1[2] = vmulq_laneq_f64(v65, v59, 1);
  a1[3] = vmulq_laneq_f64(v66, v59, 1);
  a1[4] = vmulq_n_f64(v64, v58.f64[0]);
  a1[5] = vmulq_f64(v69, v58);
  __invert_d3();
  a1[8] = a47;
  a1[9] = a48;
  a1[10] = a49;
  a1[11] = a50;
  a1[6] = a45;
  a1[7] = a46;
  return a1;
}

long long *ChromaticAdaptationMatrix<double>::ChromaticAdaptationMatrix(long long *a1, float64x2_t *a2, float64x2_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, long long a13, float64x2_t a14, long long a15, float64x2_t a16, long long a17, float64x2_t a18, long long a19, float64x2_t a20,long long a21,float64x2_t a22,long long a23,float64x2_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40)
{
  a40 = *MEMORY[0x263EF8340];
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  a19 = xmmword_235DA5B10;
  a20 = (float64x2_t)0x3FA3EAB367A0F909uLL;
  a21 = xmmword_235DA5B20;
  a22 = (float64x2_t)0xBFB189374BC6A7F0;
  a23 = xmmword_235DA5B30;
  a24 = (float64x2_t)0x3FF0793DD97F62B7uLL;
  __invert_d3();
  uint64_t v43 = 0;
  float64x2_t v45 = *a2;
  float64x2_t v44 = a2[1];
  float64x2_t v62 = (float64x2_t)a13;
  float64x2_t v46 = a14;
  float64x2_t v63 = (float64x2_t)a15;
  float64x2_t v47 = a16;
  float64x2_t v64 = (float64x2_t)a17;
  float64x2_t v48 = a18;
  double v49 = a2->f64[1];
  v50.f64[0] = vmuld_n_f64(a2->f64[0], v44.f64[0]) / v49;
  v45.f64[0] = (1.0 - a2->f64[0] - v49) * v44.f64[0] / v49;
  float64x2_t v51 = vmulq_f64(v50, (float64x2_t)0x3FA3EAB367A0F909uLL);
  float64x2_t v52 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_235DA5B10, v50.f64[0]), (float64x2_t)xmmword_235DA5B20, v44.f64[0]), (float64x2_t)xmmword_235DA5B30, v45.f64[0]);
  float64x2_t v53 = vmlaq_f64(vmlaq_f64(v51, (float64x2_t)0xBFB189374BC6A7F0, v44), (float64x2_t)0x3FF0793DD97F62B7uLL, v45);
  float64x2_t v55 = *a3;
  float64x2_t v54 = a3[1];
  double v56 = a3->f64[1];
  v57.f64[0] = vmuld_n_f64(a3->f64[0], v54.f64[0]) / v56;
  v55.f64[0] = (1.0 - a3->f64[0] - v56) * v54.f64[0] / v56;
  float64x2_t v58 = vmulq_f64(v57, (float64x2_t)0x3FA3EAB367A0F909uLL);
  float64x2_t v59 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_235DA5B10, v57.f64[0]), (float64x2_t)xmmword_235DA5B20, v54.f64[0]), (float64x2_t)xmmword_235DA5B30, v55.f64[0]);
  float64x2_t v60 = vdivq_f64(vmlaq_f64(vmlaq_f64(v58, (float64x2_t)0xBFB189374BC6A7F0, v54), (float64x2_t)0x3FF0793DD97F62B7uLL, v55), v53);
  float64x2_t v61 = vdivq_f64(v59, v52);
  v53.f64[0] = 0.0;
  v53.f64[1] = v61.f64[1];
  a13 = *(unint64_t *)&v61.f64[0];
  a14 = 0u;
  a15 = (__int128)v53;
  a16 = 0u;
  a17 = 0uLL;
  a18 = v60;
  *(void *)&v62.f64[1] = vextq_s8((int8x16_t)v62, (int8x16_t)v62, 8uLL).u64[0];
  *(void *)&v63.f64[1] = vextq_s8((int8x16_t)v63, (int8x16_t)v63, 8uLL).u64[0];
  *(void *)&v64.f64[1] = vextq_s8((int8x16_t)v64, (int8x16_t)v64, 8uLL).u64[0];
  do
  {
    float64x2_t v66 = *(float64x2_t *)((char *)&a13 + v43);
    float64x2_t v65 = *(float64x2_t *)((char *)&a13 + v43 + 16);
    float64x2_t v67 = (float64x2_t *)((char *)&a19 + v43);
    *float64x2_t v67 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v62, v66.f64[0]), v63, v66, 1), v64, v65.f64[0]);
    v67[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v46, v66), v47, v66, 1), v65, v48);
    v43 += 32;
  }
  while (v43 != 96);
  uint64_t v68 = 0;
  float64x2_t v72 = (float64x2_t)a19;
  float64x2_t v69 = a20;
  float64x2_t v73 = (float64x2_t)a21;
  float64x2_t v70 = a22;
  float64x2_t v74 = (float64x2_t)a23;
  float64x2_t v71 = a24;
  a13 = xmmword_235DA5B10;
  a14 = (float64x2_t)0x3FA3EAB367A0F909uLL;
  a15 = xmmword_235DA5B20;
  a16 = (float64x2_t)0xBFB189374BC6A7F0;
  a17 = xmmword_235DA5B30;
  a18 = (float64x2_t)0x3FF0793DD97F62B7uLL;
  *(void *)&v72.f64[1] = vextq_s8((int8x16_t)v72, (int8x16_t)v72, 8uLL).u64[0];
  *(void *)&v73.f64[1] = vextq_s8((int8x16_t)v73, (int8x16_t)v73, 8uLL).u64[0];
  *(void *)&v74.f64[1] = vextq_s8((int8x16_t)v74, (int8x16_t)v74, 8uLL).u64[0];
  do
  {
    float64x2_t v76 = *(float64x2_t *)((char *)&a13 + v68);
    float64x2_t v75 = *(float64x2_t *)((char *)&a13 + v68 + 16);
    v77 = (float64x2_t *)((char *)&a19 + v68);
    float64x2_t *v77 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v72, v76.f64[0]), v73, v76, 1), v74, v75.f64[0]);
    v77[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v69, v76), v70, v76, 1), v75, v71);
    v68 += 32;
  }
  while (v68 != 96);
  float64x2_t v78 = a22;
  long long v79 = a23;
  float64x2_t v80 = a24;
  long long v81 = a19;
  float64x2_t v82 = a20;
  a1[2] = a21;
  a1[3] = (__int128)v78;
  a1[4] = v79;
  a1[5] = (__int128)v80;
  *a1 = v81;
  a1[1] = (__int128)v82;
  return a1;
}

uint64_t apple_numbers_changed_notification(uint64_t a1, void *a2)
{
  [a2 _localizeAutoLockTitles];
  return [a2 reloadSpecifierID:@"AUTOLOCK"];
}

uint64_t HasSeenACaseLatchCoverChanged(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifiers];
}

void sub_235D94970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235D97988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235D97B40(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_235D97E84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235D9A770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
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

id DBSLockScreenTimeString()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v0 setHour:9];
  [v0 setMinute:41];
  [v0 setSecond:0];
  uint64_t v1 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v2 = [v1 dateFromComponents:v0];
  id v3 = objc_alloc_init(MEMORY[0x263F08790]);
  [v3 setLocalizedDateFormatFromTemplate:@"Jmm"];
  int v4 = [v3 stringFromDate:v2];

  return v4;
}

id DBS_LocalizedStringForMagnify(void *a1)
{
  id v1 = a1;
  uint64_t v2 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"Magnify"];

  return v3;
}

id DBS_BundleForDisplayAndBrightnessSettingsFramework()
{
  if (DBS_BundleForDisplayAndBrightnessSettingsFramework_onceToken != -1) {
    dispatch_once(&DBS_BundleForDisplayAndBrightnessSettingsFramework_onceToken, &__block_literal_global_7);
  }
  id v0 = (void *)DBS_BundleForDisplayAndBrightnessSettingsFramework__displayAndBrightnessSettingsFrameworkBundle;
  return v0;
}

id DBS_LocalizedStringForDisplays(void *a1)
{
  id v1 = a1;
  uint64_t v2 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"Display"];

  return v3;
}

id DBS_LocalizedStringForFineTune(void *a1)
{
  id v1 = a1;
  uint64_t v2 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"FineTune"];

  return v3;
}

id DBS_LocalizedStringForConnectedDisplays(void *a1)
{
  id v1 = a1;
  uint64_t v2 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"ExternalDisplays"];

  return v3;
}

id DBS_LocalizedStringForColorSchedule(void *a1)
{
  id v1 = a1;
  uint64_t v2 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"ColorSchedule"];

  return v3;
}

id DBS_LocalizedStringForColorTemperature(void *a1)
{
  id v1 = a1;
  uint64_t v2 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"ColorTemperature"];

  return v3;
}

id DBS_LocalizedStringForLargeFontSettings(void *a1)
{
  id v1 = a1;
  uint64_t v2 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"LargeFontsSettings"];

  return v3;
}

id DBS_LocalizedStringForDeviceAppearance(void *a1)
{
  id v1 = a1;
  uint64_t v2 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"DeviceAppearanceSchedule"];

  return v3;
}

id DBS_LocalizedStringForPictureInPicture(void *a1)
{
  id v1 = a1;
  uint64_t v2 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"PiP"];

  return v3;
}

id DBS_LocalizedStringForContinuousExpose(void *a1)
{
  id v1 = a1;
  uint64_t v2 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"ContinuousExpose"];

  return v3;
}

void sub_235D9D5C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id DBSLogForCategory(unint64_t a1)
{
  if (a1 >= 2) {
    DBSLogForCategory_cold_1();
  }
  if (DBSLogForCategory_loggingToken != -1) {
    dispatch_once(&DBSLogForCategory_loggingToken, &__block_literal_global_8);
  }
  uint64_t v2 = (void *)DBSLogForCategory_logObjects[a1];
  return v2;
}

uint64_t __DBSLogForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.settings.displayandbrightness", "Base");
  id v1 = (void *)DBSLogForCategory_logObjects[0];
  DBSLogForCategory_logObjects[0] = (uint64_t)v0;

  qword_268849070 = (uint64_t)os_log_create("com.apple.settings.displayandbrightness", "Display Zoom");
  return MEMORY[0x270F9A758]();
}

id sub_235DA254C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FindClass()
{
  return self;
}

uint64_t sub_235DA25A8()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void DBSGetMobileFrameBuffer_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_235D7B000, log, OS_LOG_TYPE_ERROR, "PSGetMobileFrameBuffer unable to get device name", v1, 2u);
}

void DBSGetMobileFrameBuffer_cold_2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_235D7B000, a2, OS_LOG_TYPE_ERROR, "IOMobileFramebufferOpenByName:%d", (uint8_t *)v2, 8u);
}

void DBSLogForCategory_cold_1()
{
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x270F0B6B0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t BKSDisplayBrightnessGetCurrent()
{
  return MEMORY[0x270F10438]();
}

uint64_t BKSDisplayBrightnessSet()
{
  return MEMORY[0x270F10448]();
}

uint64_t BKSDisplayBrightnessTransactionCreate()
{
  return MEMORY[0x270F10458]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B98]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x270F0CDD0]();
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x270EE9B00](name, matrix, options, size);
}

uint64_t IOMobileFramebufferGetCanvasSizes()
{
  return MEMORY[0x270F3D3E0]();
}

uint64_t IOMobileFramebufferOpenByName()
{
  return MEMORY[0x270F3D418]();
}

uint64_t IOMobileFramebufferSetCanvasSize()
{
  return MEMORY[0x270F3D420]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x270F95FA8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F82BD0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PSGetCapabilityBoolAnswer()
{
  return MEMORY[0x270F55208]();
}

uint64_t PSIsInEDUMode()
{
  return MEMORY[0x270F55220]();
}

uint64_t PSLocalizablePearlStringForKey()
{
  return MEMORY[0x270F55298]();
}

uint64_t PSRoundToPixel()
{
  return MEMORY[0x270F552D8]();
}

uint64_t PreferencesTableViewFooterFont()
{
  return MEMORY[0x270F55368]();
}

uint64_t SBSUIWallpaperGetPreview()
{
  return MEMORY[0x270F77260]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F82EB8]();
}

uint64_t UISUserInterfaceStyleModeSchedulesEqual()
{
  return MEMORY[0x270F83060]();
}

uint64_t UISUserInterfaceStyleModeValueIsAutomatic()
{
  return MEMORY[0x270F83068]();
}

uint64_t _AXSAttentionAwarenessFeaturesEnabled()
{
  return MEMORY[0x270F905E0]();
}

uint64_t _AXSDisableScreenFilters()
{
  return MEMORY[0x270F90718]();
}

uint64_t _AXSEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x270F90740]();
}

uint64_t _AXSScreenFilterApplied()
{
  return MEMORY[0x270F909B0]();
}

uint64_t _AXSSetEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x270F90A20]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

uint64_t _UIUpdatedVisualStyleEnabled()
{
  return MEMORY[0x270F83030]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

uint64_t __invert_d3()
{
  return MEMORY[0x270ED7E00]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}