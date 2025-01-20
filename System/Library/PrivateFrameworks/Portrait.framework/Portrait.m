double std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>(uint64_t a1, std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this, double *a3)
{
  double v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (*(unsigned char *)(a1 + 24))
  {
    *(unsigned char *)(a1 + 24) = 0;
    v5 = *(double *)(a1 + 16);
  }
  else
  {
    do
    {
      do
      {
        v7 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
        v8 = (v7
            + (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this)
            * 4294967300.0)
           * 5.42101086e-20
           * 2.0
           + -1.0;
        v9 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
        v10 = (v9
             + (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this)
             * 4294967300.0)
            * 5.42101086e-20
            * 2.0
            + -1.0;
        v11 = v10 * v10 + v8 * v8;
      }
      while (v11 > 1.0);
    }
    while (v11 == 0.0);
    v12 = sqrt(log(v10 * v10 + v8 * v8) * -2.0 / v11);
    *(double *)(a1 + 16) = v10 * v12;
    *(unsigned char *)(a1 + 24) = 1;
    v5 = v8 * v12;
  }
  return *a3 + v5 * a3[1];
}

std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this)
{
  size_t i = this->__i_;
  size_t v2 = (i + 1) % 0x270;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v3 = this->__x_[(i + 397) % 0x270] ^ ((this->__x_[v2] & 0x7FFFFFFE | this->__x_[i] & 0x80000000) >> 1) ^ ((int)(this->__x_[v2] << 31) >> 31) & 0x9908B0DF;
  this->__x_[i] = v3;
  this->__i_ = v2;
  LODWORD(i) = ((v3 ^ (v3 >> 11)) << 7) & 0x9D2C5680 ^ v3 ^ (v3 >> 11);
  return (i << 15) & 0xEFC60000 ^ i ^ (((i << 15) & 0xEFC60000 ^ i) >> 18);
}

uint64_t std::uniform_int_distribution<unsigned int>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>(int a1, std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this, _DWORD *a3)
{
  uint64_t result = a3[1];
  int v4 = result - *a3;
  if (result != *a3)
  {
    unsigned int v6 = v4 + 1;
    if (v4 == -1)
    {
      return std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
    }
    else
    {
      uint64_t v8 = __clz(v6);
      uint64_t v9 = 31;
      if (((v6 << v8) & 0x7FFFFFFF) != 0) {
        uint64_t v9 = 32;
      }
      unint64_t v10 = v9 - v8;
      unint64_t v11 = v10 >> 5;
      if ((v10 & 0x1F) != 0) {
        ++v11;
      }
      if (v11 <= v10) {
        unsigned int v12 = 0xFFFFFFFF >> -(v10 / v11);
      }
      else {
        unsigned int v12 = 0;
      }
      do
        std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v13 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this) & v12;
      while (v13 >= v6);
      return *a3 + v13;
    }
  }
  return result;
}

void computeGaussianKernel2D(uint64_t a1)
{
  float v2 = 0.0;
  uint64_t v3 = -1;
  uint64_t v4 = a1;
  do
  {
    uint64_t v5 = 0;
    int v6 = -1;
    do
    {
      float v7 = pow(2.71828183, (float)((float)((float)((float)v6 * (float)v6) + (float)((float)(int)v3 * (float)(int)v3)) * -0.5))* 0.159154943;
      float v2 = v2 + v7;
      *(float *)(v4 + v5) = v7;
      ++v6;
      v5 += 12;
    }
    while (v5 != 36);
    ++v3;
    v4 += 4;
  }
  while (v3 != 2);
  for (uint64_t i = 0; i != 36; i += 4)
    *(float *)(a1 + i) = *(float *)(a1 + i) / v2;
}

uint64_t PTDefaultsPublicGetBool(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = PTDefaultsPublicGetDictionary();
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];

  if (objc_opt_respondsToSelector()) {
    a2 = [v5 BOOLValue];
  }

  return a2;
}

id PTDefaultsPublicGetDictionary()
{
  os_unfair_lock_lock((os_unfair_lock_t)&sPortraitDefaultsLock);
  if ((sCachedPortraitDefaultsLoaded & 1) == 0)
  {
    v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.coremedia"];
    uint64_t v1 = [v0 dictionaryRepresentation];
    float v2 = (void *)PTDefaultsPublicGetDictionary_sCachedPortraitDefaults;
    PTDefaultsPublicGetDictionary_sCachedPortraitDefaults = v1;

    sCachedPortraitDefaultsLoaded = 1;
  }
  id v3 = (id)PTDefaultsPublicGetDictionary_sCachedPortraitDefaults;
  os_unfair_lock_unlock((os_unfair_lock_t)&sPortraitDefaultsLock);

  return v3;
}

void sub_1D07840C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D0789EF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 208));
  _Unwind_Resume(a1);
}

uint64_t orientationForTransform(double *a1)
{
  uint64_t v1 = 0;
  for (uint64_t i = (double *)&qword_1D0840878;
        vabdd_f64(*a1, *(i - 2)) >= 0.00999999978
     || vabdd_f64(a1[1], *(i - 1)) >= 0.00999999978
     || vabdd_f64(a1[2], *i) >= 0.00999999978
     || vabdd_f64(a1[3], i[1]) >= 0.00999999978;
        i += 6)
  {
    if (++v1 == 8) {
      return 0xFFFFFFFFLL;
    }
  }
  return orientationForTransform_kDegreeMapping[v1];
}

char **__vfx_get_script_table_lighting()
{
  return &__vfx_get_script_table_lighting::scriptTable;
}

float __vfx_script_lighting_graph_2A1A65D6_42D2_422D_B043_7BA6751C7A80(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 6.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float __vfx_script_lighting_graph_9DD82DB1_83CC_4C95_8122_529530C0E9A5(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 1000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float __vfx_script_lighting_graph_B9299884_EF40_4793_BAD0_BB82A60C4C1E(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 300.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t PTDefaultsGetDictionary()
{
  return 0;
}

void PTKTraceInit()
{
  if (initializeOnceToken != -1) {
    dispatch_once_f(&initializeOnceToken, 0, (dispatch_function_t)ptKTraceInitialize);
  }
}

id _PTLogSystem()
{
  if (_PTLogSystem_onceToken != -1) {
    dispatch_once(&_PTLogSystem_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)_PTLogSystem_log;

  return v0;
}

uint64_t FigCFDictionaryGetInt32IfPresent(const __CFDictionary *a1, const void *a2, void *a3)
{
  value = 0;
  if (!a2) {
    FigCFDictionaryGetInt32IfPresent_cold_1();
  }
  if (!a3) {
    FigCFDictionaryGetInt32IfPresent_cold_2();
  }
  uint64_t result = CFDictionaryGetValueIfPresent(a1, a2, (const void **)&value);
  if (result)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(value))
    {
      CFNumberGetValue((CFNumberRef)value, kCFNumberSInt32Type, a3);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t __vfx_script_thumbsup_graph_E58E02C9_8189_4980_ABED_6DF4C8EF7375(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  uint64_t v2 = *(long long **)(result + 32);
  long long v3 = *v2;
  float v4 = 1.0;
  if (!**(unsigned char **)(result + 16)) {
    float v4 = -1.0;
  }
  **(int32x2_t **)(result + 24) = vdup_n_s32(0x3BB0F27Cu);
  long long v5 = v3;
  *((float *)&v5 + 1) = v4;
  DWORD2(v5) = DWORD2(v3);
  *uint64_t v2 = v5;
  return result;
}

uint64_t __vfx_script_thumbsup_graph_B59F1B79_7E62_4E5A_99DF_F365094C2D38(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(_DWORD **)(result + 24) = **(_DWORD **)(result + 16) & ~(**(int **)(result + 16) >> 31);
  return result;
}

uint64_t __vfx_script_thumbsup_graph_A591C9B7_84C4_4BEA_8829_4366B5881232(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  uint64_t v2 = *(float **)(result + 40);
  float v3 = 1.0;
  if (**(unsigned char **)(result + 16)) {
    float v4 = 1.0;
  }
  else {
    float v4 = -1.0;
  }
  if (!**(unsigned char **)(result + 24)) {
    float v3 = -1.0;
  }
  **(float **)(result + 32) = v4;
  *uint64_t v2 = v3;
  return result;
}

double __vfx_script_thumbsup_graph_891A5752_872E_4295_B8CA_3104EA0A6053(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  double result = 1.37667655e-16;
  *(_OWORD *)*(void *)(arguments_buffer_delayInitStub + 16) = xmmword_1D0840700;
  return result;
}

__n128 __vfx_script_thumbsup_graph_5BEF5B4C_59E5_4DBA_86B0_DB00779F419D(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  uint64_t v2 = *(__n128 **)(arguments_buffer_delayInitStub + 24);
  __n128 result = *v2;
  *(int32x4_t *)*(void *)(arguments_buffer_delayInitStub + 16) = vdupq_n_s32(0x3CA3D70Au);
  __asm { FMOV            V1.4S, #-1.0 }
  _Q1.n128_u32[0] = result.n128_u32[0];
  _Q1.n128_u32[2] = result.n128_u32[2];
  *uint64_t v2 = _Q1;
  return result;
}

float __vfx_script_thumbsup_graph_451D2F34_D7DE_4C4D_9A5C_B1A778F1CA1C(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  uint64_t v2 = *(_OWORD **)(arguments_buffer_delayInitStub + 32);
  BOOL v3 = **(unsigned char **)(arguments_buffer_delayInitStub + 16) == 0;
  **(_DWORD **)(arguments_buffer_delayInitStub + 40) = **(_DWORD **)(arguments_buffer_delayInitStub + 24) & ~(**(int **)(arguments_buffer_delayInitStub + 24) >> 31);
  LODWORD(v4) = dword_1D08406C0[v3];
  DWORD1(v4) = 1025758986;
  *((void *)&v4 + 1) = __PAIR64__(1.0, -0.5);
  float result = 1.0;
  *uint64_t v2 = v4;
  return result;
}

uint64_t __vfx_script_thumbsup_graph_38F35C26_FEA0_47AB_B998_9FF24156FD6D(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(_DWORD **)(result + 24) = **(_DWORD **)(result + 16) & ~(**(int **)(result + 16) >> 31);
  return result;
}

__n128 __vfx_script_thumbsup_graph_31C4109F_11CA_46CC_B9D5_22B60B283208(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  uint64_t v2 = *(__n128 **)(arguments_buffer_delayInitStub + 24);
  __n128 result = *v2;
  *(int32x4_t *)*(void *)(arguments_buffer_delayInitStub + 16) = vdupq_n_s32(0x3CA3D70Au);
  __asm { FMOV            V1.4S, #-1.0 }
  _Q1.n128_u32[0] = result.n128_u32[0];
  _Q1.n128_u32[2] = result.n128_u32[2];
  *uint64_t v2 = _Q1;
  return result;
}

double __vfx_script_thumbsup_graph_0E7F5D5F_BCDE_46CD_975C_9DB38EBC84DE(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  double result = 1.37667655e-16;
  *(_OWORD *)*(void *)(arguments_buffer_delayInitStub + 16) = xmmword_1D0840700;
  return result;
}

int8x16_t __vfx_script_rain_graph_EDF6BEEC_34C4_489E_ABEC_1C4A62E25E40(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  int8x16_t result = *(int8x16_t *)*(void *)(arguments_buffer_delayInitStub + 16);
  float32x2_t v2 = vadd_f32((float32x2_t)vext_s8(*(int8x8_t *)result.i8, (int8x8_t)*(_OWORD *)&vextq_s8(result, result, 8uLL), 4uLL), (float32x2_t)0xBF0000003D4CCCCDLL);
  result.i32[1] = v2.i32[0];
  result.i64[1] = __PAIR64__(1.0, v2.u32[1]);
  *(int8x16_t *)*(void *)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

__n128 __vfx_script_rain_graph_D83B875F_FB36_42AC_BCF5_9AD248F8E2AB(double a1)
{
  uint64_t arguments_buffer_delayInitStub = (void *)vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x2_t v2 = (__n128 *)arguments_buffer_delayInitStub[3];
  BOOL v3 = (_OWORD *)arguments_buffer_delayInitStub[5];
  __n128 result = *(__n128 *)arguments_buffer_delayInitStub[2];
  *(float *)&unsigned int v4 = COERCE_FLOAT(*(void *)(arguments_buffer_delayInitStub[2] + 8)) + -0.65;
  __asm { FMOV            V2.4S, #-1.0 }
  *(_OWORD *)arguments_buffer_delayInitStub[4] = _Q2;
  __asm { FMOV            V2.4S, #1.0 }
  *BOOL v3 = _Q2;
  result.n128_u64[1] = __PAIR64__(1.0, v4);
  *float32x2_t v2 = result;
  return result;
}

__n128 __vfx_script_rain_graph_C718F1B2_4BA3_4E66_8269_7C49E171E2EC(double a1)
{
  uint64_t arguments_buffer_delayInitStub = (void *)vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x2_t v2 = (__n128 *)arguments_buffer_delayInitStub[3];
  __n128 result = *(__n128 *)arguments_buffer_delayInitStub[2];
  *(float *)&unsigned int v3 = COERCE_FLOAT(*(void *)(arguments_buffer_delayInitStub[2] + 8)) + -0.85;
  unsigned int v4 = (int32x4_t *)arguments_buffer_delayInitStub[5];
  *(int32x4_t *)arguments_buffer_delayInitStub[4] = vdupq_n_s32(0xC2C80000);
  *unsigned int v4 = vdupq_n_s32(0x42C80000u);
  result.n128_u64[1] = __PAIR64__(1.0, v3);
  *float32x2_t v2 = result;
  return result;
}

float __vfx_script_rain_graph_999F57E4_3BBD_4410_9780_400191D6A26B(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x2_t v2 = *(float **)(arguments_buffer_delayInitStub + 40);
  float v3 = **(float **)(arguments_buffer_delayInitStub + 16);
  *(float *)&double v4 = **(float **)(arguments_buffer_delayInitStub + 32) / 3.0;
  vfx_script_texture_sample1d_delayInitStub(v4);
  float result = (float)(v3 * v5) * 66.0;
  *float32x2_t v2 = result;
  return result;
}

uint64_t __vfx_script_rain_graph_72169E6B_0B70_473E_B19D_953F01AC5993(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x2_t v2 = *(_DWORD **)(arguments_buffer_delayInitStub + 24);
  float v3 = **(float **)(arguments_buffer_delayInitStub + 16);
  vfx_script_curve_create_delayInitStub(5.23869004e-11);
  *(float *)&double v4 = v3 / 3.0;
  vfx_script_curve_evaluate_delayInitStub(v4);
  *float32x2_t v2 = LODWORD(v5);
  return vfx_script_curve_destroy_delayInitStub(v5);
}

__n128 __vfx_script_rain_graph_47225A01_2C47_433D_93D9_BF1D85A3839F(double a1)
{
  uint64_t arguments_buffer_delayInitStub = (void *)vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x2_t v2 = (long long *)arguments_buffer_delayInitStub[2];
  long long v3 = *v2;
  *(float *)&long long v3 = 1.5 * COERCE_FLOAT(*v2);
  *((float *)&v3 + 1) = (float)(*(float *)(arguments_buffer_delayInitStub[3] + 4) * -6.0) + 0.0;
  *((float *)&v3 + 2) = COERCE_FLOAT(*((void *)v2 + 1)) + 0.5;
  *(_OWORD *)arguments_buffer_delayInitStub[4] = v3;
  result.n128_u64[0] = v3;
  result.n128_u32[2] = DWORD2(v3);
  return result;
}

float __vfx_script_rain_graph_43A66462_6D38_40C4_9563_E3E4B018C43A(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x2_t v2 = *(float **)(arguments_buffer_delayInitStub + 40);
  float v3 = **(float **)(arguments_buffer_delayInitStub + 16);
  *(float *)&double v4 = **(float **)(arguments_buffer_delayInitStub + 32) / 3.5;
  vfx_script_texture_sample1d_delayInitStub(v4);
  float result = (float)(v3 * v5) * 2500.0;
  *float32x2_t v2 = result;
  return result;
}

double __vfx_script_fireworks_graph_FB239A73_A49B_49A1_B28F_F8EB686AE087(double a1)
{
  uint64_t arguments_buffer_delayInitStub = (void *)vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x2_t v2 = (void *)arguments_buffer_delayInitStub[2];
  float v3 = (void *)arguments_buffer_delayInitStub[3];
  *(int32x4_t *)arguments_buffer_delayInitStub[4] = vdupq_n_s32(0x3E19999Au);
  *float32x2_t v2 = 0x40ABAE1540023D71;
  double result = 0.0000119018532;
  *float v3 = 0x3EE8F5C23E6C8B44;
  return result;
}

float __vfx_script_fireworks_graph_EF83050E_3420_4C5E_B29A_63DE74130B60(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 12000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t __vfx_script_fireworks_graph_EA69B710_0EB0_430A_84ED_99FDFB897003(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x2_t v2 = *(void **)(result + 24);
  uint64_t v3 = **(unsigned __int8 **)(result + 16);
  *float32x2_t v2 = v3;
  v2[1] = v3;
  return result;
}

float __vfx_script_fireworks_graph_E9D5C3AC_14D8_4C9E_A340_8873556A15AC(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 5000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float __vfx_script_fireworks_graph_CECA8E5C_A7BB_4D57_BBA3_E684CB761DA9(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 8000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t __vfx_script_fireworks_graph_CC976411_EC12_4A2C_A577_DD5F08309A69(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x2_t v2 = *(_DWORD **)(arguments_buffer_delayInitStub + 40);
  *(float *)&double v3 = fminf(fmaxf((float)(**(float **)(arguments_buffer_delayInitStub + 32)- **(float **)(arguments_buffer_delayInitStub + 24))/ (float)((float)(**(float **)(arguments_buffer_delayInitStub + 24) + 1.0)- **(float **)(arguments_buffer_delayInitStub + 24)), 0.0), 1.0);
  uint64_t result = vfx_script_texture_sample1d_delayInitStub(v3);
  *float32x2_t v2 = v5;
  return result;
}

float __vfx_script_fireworks_graph_C9C0CC36_AD87_4391_B404_40CBC37682DC(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x2_t v2 = *(void **)(arguments_buffer_delayInitStub + 24);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 250.0;
  *float32x2_t v2 = (unint64_t)result;
  v2[1] = (unint64_t)result;
  return result;
}

float __vfx_script_fireworks_graph_C96088C0_AF79_4824_9185_0DFF8E90BFB3(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x2_t v2 = *(void **)(arguments_buffer_delayInitStub + 24);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 30.0;
  *float32x2_t v2 = (unint64_t)result;
  v2[1] = (unint64_t)result;
  return result;
}

double __vfx_script_fireworks_graph_BE082C18_F014_49F4_AE91_49F0A20CA327(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x2_t v2 = *(void **)(arguments_buffer_delayInitStub + 16);
  *(int32x4_t *)*(void *)(arguments_buffer_delayInitStub + 24) = vdupq_n_s32(0x3CF5C28Fu);
  double result = 1.29236965e-19;
  *float32x2_t v2 = 0x3C03126F3AD844D0;
  return result;
}

double __vfx_script_fireworks_graph_A5860394_860A_466B_9036_4241BA694F84(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x2_t v2 = *(void **)(arguments_buffer_delayInitStub + 16);
  *(int32x4_t *)*(void *)(arguments_buffer_delayInitStub + 24) = vdupq_n_s32(0x3D4CCCCDu);
  double result = 7.15400071e-19;
  *float32x2_t v2 = 0x3C2A64C33BB78035;
  return result;
}

double __vfx_script_fireworks_graph_9F0A8F07_3A67_4589_A511_28A794F02526(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x2_t v2 = *(void **)(arguments_buffer_delayInitStub + 16);
  *(int32x4_t *)*(void *)(arguments_buffer_delayInitStub + 24) = vdupq_n_s32(0x3B03126Fu);
  double result = 2.05564881e-20;
  *float32x2_t v2 = 0x3BD844D13BC49BA6;
  return result;
}

double __vfx_script_fireworks_graph_9C215676_B35D_4738_8604_1B0696C120C9(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  double result = -128.000092;
  **(void **)(arguments_buffer_delayInitStub + 16) = 0xC0600000C0933333;
  return result;
}

double __vfx_script_fireworks_graph_913AA320_A3AD_4B97_B3CE_288034B4B02B(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  double result = 2.23432441e-18;
  **(void **)(arguments_buffer_delayInitStub + 16) = 0x3C449BA63C09A027;
  return result;
}

float __vfx_script_fireworks_graph_70391988_6235_4105_AB03_8B09A79D6EF6(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x2_t v2 = *(void **)(arguments_buffer_delayInitStub + 24);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 30.0;
  *float32x2_t v2 = (unint64_t)result;
  v2[1] = (unint64_t)result;
  return result;
}

float __vfx_script_fireworks_graph_68ABBDD2_799D_4316_B610_A615A6E5C6C0(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 7000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

double __vfx_script_fireworks_graph_647D8C58_3A96_4185_83BF_F834C05973E6(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x2_t v2 = *(void **)(arguments_buffer_delayInitStub + 24);
  float32x4_t v3 = vmulq_f32(*(float32x4_t *)*(void *)(arguments_buffer_delayInitStub + 16), (float32x4_t)vdupq_n_s32(0x3F19999Au));
  double v4 = *(float32x4_t **)(arguments_buffer_delayInitStub + 40);
  *(int32x4_t *)*(void *)(arguments_buffer_delayInitStub + 32) = vdupq_n_s32(0x3DCCCCCDu);
  *double v4 = v3;
  double result = 0.00000157165527;
  *float32x2_t v2 = 0x3EBA5E353E3D3C37;
  return result;
}

float __vfx_script_fireworks_graph_5DD07B06_8DCA_42DA_80D9_81BBED0FBF33(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x2_t v2 = *(float **)(arguments_buffer_delayInitStub + 16);
  float result = *v2;
  **(float **)(arguments_buffer_delayInitStub + 24) = *v2;
  return result;
}

double __vfx_script_fireworks_graph_5C6FE0C4_5B31_468F_9708_94003733DEC5(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x2_t v2 = *(void **)(arguments_buffer_delayInitStub + 16);
  *(int32x4_t *)*(void *)(arguments_buffer_delayInitStub + 24) = vdupq_n_s32(0x3D4CCCCDu);
  double result = 1.50053695e-20;
  *float32x2_t v2 = 0x3BD1B7183AAD03DBLL;
  return result;
}

float __vfx_script_fireworks_graph_5AFE93DC_23D2_46C1_93C9_29F6F7292984(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 0.8;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

double __vfx_script_fireworks_graph_5AC753AC_F888_4AEE_B41F_BA9FA15941CC(double a1)
{
  uint64_t arguments_buffer_delayInitStub = (void *)vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x2_t v2 = (void *)arguments_buffer_delayInitStub[2];
  float32x4_t v3 = (void *)arguments_buffer_delayInitStub[3];
  *(int32x4_t *)arguments_buffer_delayInitStub[4] = vdupq_n_s32(0x3DF5C28Fu);
  *float32x2_t v2 = 0x40E8000040300000;
  double result = 0.00000157165527;
  *float32x4_t v3 = 0x3EBA5E353E3D3C37;
  return result;
}

double __vfx_script_fireworks_graph_514A5D4A_9A37_436A_B056_B2F8227D2BE1(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  double result = -128.000092;
  **(void **)(arguments_buffer_delayInitStub + 16) = 0xC0600000C0933333;
  return result;
}

float __vfx_script_fireworks_graph_4F9764F9_0AFB_41B2_A2E5_90D5BEA2660F(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 10000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

double __vfx_script_fireworks_graph_4F52B7E1_CA7E_4C70_B2C9_199EA88DF652(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x2_t v2 = *(void **)(arguments_buffer_delayInitStub + 16);
  *(int32x4_t *)*(void *)(arguments_buffer_delayInitStub + 24) = vdupq_n_s32(0x3DCCCCCDu);
  double result = 1.71806921e-18;
  *float32x2_t v2 = 0x3C3FB15A3BC2A455;
  return result;
}

float __vfx_script_fireworks_graph_4E8B4DDD_D3C2_4DDF_ACF2_2ECC08723FDB(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  unsigned int v2 = 747796405 * **(_DWORD **)(arguments_buffer_delayInitStub + 8) - 903319789;
  unsigned int v3 = 277803737 * ((v2 >> ((v2 >> 28) + 4)) ^ v2);
  float result = (float)(COERCE_FLOAT((v3 >> 31) ^ (v3 >> 9) | 0x3F800000) + -1.0) * 6.0;
  **(void **)(arguments_buffer_delayInitStub + 16) = (int)result;
  return result;
}

double __vfx_script_fireworks_graph_402F3097_0BA4_4A83_9FEB_E7261701F766(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  unsigned int v2 = *(void **)(arguments_buffer_delayInitStub + 16);
  *(int32x4_t *)*(void *)(arguments_buffer_delayInitStub + 24) = vdupq_n_s32(0x3CF5C28Fu);
  double result = 1.29236965e-19;
  *unsigned int v2 = 0x3C03126F3AD844D0;
  return result;
}

double __vfx_script_fireworks_graph_3C6ED067_7943_49AD_A0AE_15130042E793(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  unsigned int v2 = *(void **)(arguments_buffer_delayInitStub + 16);
  *(int32x4_t *)*(void *)(arguments_buffer_delayInitStub + 24) = vdupq_n_s32(0x3D4CCCCDu);
  double result = 3.9690488e-19;
  *unsigned int v2 = 0x3C1D49523B01C2E4;
  return result;
}

float __vfx_script_fireworks_graph_32BE36EE_4AAF_45ED_8B70_F204A610CBF9(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 140.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t __vfx_script_fireworks_graph_224CDDEA_614F_4333_A343_6F25B6068E45(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  unsigned int v2 = *(_DWORD **)(arguments_buffer_delayInitStub + 40);
  *(float *)&double v3 = fminf(fmaxf((float)(**(float **)(arguments_buffer_delayInitStub + 32)- **(float **)(arguments_buffer_delayInitStub + 24))/ (float)((float)(**(float **)(arguments_buffer_delayInitStub + 24) + 1.0)- **(float **)(arguments_buffer_delayInitStub + 24)), 0.0), 1.0);
  uint64_t result = vfx_script_texture_sample1d_delayInitStub(v3);
  *unsigned int v2 = v5;
  return result;
}

float __vfx_script_fireworks_graph_1F546ADD_0390_45D8_A31D_6FD1CEDB0057(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 10000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float __vfx_script_fireworks_graph_1E09F83D_74E8_4C33_AF7B_D1F4C7561C24(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  unsigned int v2 = *(void **)(arguments_buffer_delayInitStub + 24);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 50.0;
  *unsigned int v2 = (unint64_t)result;
  v2[1] = (unint64_t)result;
  return result;
}

float __vfx_script_fireworks_graph_155128CD_E118_4113_8D6F_8B7F5BA2555D(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 1.12;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

int8x16_t __vfx_script_fireworks_graph_10EDDCB9_24C0_4755_971D_D6EC1FAF1000(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  unsigned int v2 = *(int8x16_t **)(arguments_buffer_delayInitStub + 24);
  float32x4_t v12 = *(float32x4_t *)*(void *)(arguments_buffer_delayInitStub + 16);
  vfx_script_clock_delta_time_delayInitStub(*(double *)v12.i64);
  float32x4_t v4 = vmulq_n_f32(v12, 1.0 - (float)(v3 + v3));
  v4.i32[3] = 1.0;
  int8x16_t v13 = (int8x16_t)v4;
  if (vfx_script_clock_is_first_frame_delayInitStub(*(double *)v4.i64)) {
    unsigned int v5 = -1;
  }
  else {
    unsigned int v5 = 0;
  }
  __asm { FMOV            V1.4S, #1.0 }
  int8x16_t result = vbslq_s8((int8x16_t)vdupq_n_s32(v5), _Q1, v13);
  *unsigned int v2 = result;
  return result;
}

float __vfx_script_fireworks_graph_07D62C9C_6FAA_4BD9_910F_CDEA5CFCCC06(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  unsigned int v2 = *(float **)(arguments_buffer_delayInitStub + 16);
  float result = *v2;
  **(float **)(arguments_buffer_delayInitStub + 24) = *v2;
  return result;
}

__n128 __vfx_script_confetti_graph_C7F30F02_BA8A_4DBA_8AB9_BEAFDE59A291(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2.i64[0] = 0;
  v2.i32[3] = 0;
  v3.i64[0] = 0;
  v3.i32[3] = 0;
  v3.f32[2] = **(float **)(arguments_buffer_delayInitStub + 24) * 0.5;
  v2.f32[2] = (float)(v3.f32[2] - **(float **)(arguments_buffer_delayInitStub + 32)) * 0.5;
  __n128 result = (__n128)vsubq_f32(vaddq_f32(*(float32x4_t *)*(void *)(arguments_buffer_delayInitStub + 16), v3), v2);
  result.n128_u32[3] = 1.0;
  *(__n128 *)*(void *)(arguments_buffer_delayInitStub + 40) = result;
  return result;
}

uint64_t __vfx_script_confetti_graph_B0667801_C60E_4D93_B9A1_27F790726520(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x4_t v2 = *(unint64_t **)(result + 56);
  float32x4_t v3 = *(unint64_t **)(result + 64);
  float v4 = **(float **)(result + 32);
  BOOL v5 = fabsf(v4) <= 0.00000011921;
  float v6 = **(float **)(result + 24) / v4;
  float v7 = 0.0;
  if (v5) {
    float v6 = 0.0;
  }
  if (**(unsigned char **)(result + 40)) {
    float v7 = 1.0;
  }
  float v8 = (float)(**(float **)(result + 16) * 150.0) * v6;
  unint64_t v9 = (unint64_t)(float)(v8 + (float)((float)((float)(v8 * 0.5) - v8) * v7));
  if (!**(unsigned char **)(result + 48)) {
    unint64_t v9 = 0;
  }
  *float32x4_t v2 = v9;
  v2[1] = v9;
  *float32x4_t v3 = v9;
  v3[1] = v9;
  return result;
}

uint64_t __vfx_script_confetti_graph_A9645361_1E28_4A66_8CE1_0FBB358E68C4(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x4_t v2 = *(unint64_t **)(result + 56);
  float32x4_t v3 = *(unint64_t **)(result + 64);
  float v4 = **(float **)(result + 24) * 0.5;
  BOOL v5 = fabsf(v4) <= 0.00000011921;
  float v6 = (float)(v4 - **(float **)(result + 32)) / v4;
  if (v5) {
    float v6 = 0.0;
  }
  float v7 = (float)(**(float **)(result + 16) * 10.0) * v6;
  float v8 = 1.0;
  if (!**(unsigned char **)(result + 40)) {
    float v8 = 0.0;
  }
  unint64_t v9 = (unint64_t)(float)((float)(v7 * v8) + 0.0);
  if (!**(unsigned char **)(result + 48)) {
    unint64_t v9 = 0;
  }
  *float32x4_t v2 = v9;
  v2[1] = v9;
  *float32x4_t v3 = v9;
  v3[1] = v9;
  return result;
}

float __vfx_script_confetti_graph_77839324_3A35_4199_A55E_F65CEF5F32BF(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x4_t v2 = *(float **)(arguments_buffer_delayInitStub + 24);
  int v3 = **(_DWORD **)(arguments_buffer_delayInitStub + 16);
  if (v3 == 270 || v3 == 90) {
    unsigned int v5 = -1;
  }
  else {
    unsigned int v5 = 0;
  }
  int8x8_t v6 = vbsl_s8((int8x8_t)vdup_n_s32(v5), (int8x8_t)0x4080000040600000, (int8x8_t)0x4060000040400000);
  float v7 = fminf(*(float *)v6.i32, *(float *)&v6.i32[1]);
  float result = fmaxf(*(float *)v6.i32, *(float *)&v6.i32[1]);
  *float32x4_t v2 = v7;
  v2[1] = result;
  return result;
}

__n128 __vfx_script_confetti_graph_5ECD10AA_AB39_44AA_809D_DE6EF1C771A6(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x4_t v2 = *(__n128 **)(arguments_buffer_delayInitStub + 16);
  __n128 result = *v2;
  *(__n128 *)*(void *)(arguments_buffer_delayInitStub + 24) = *v2;
  return result;
}

float __vfx_script_confetti_graph_586EC683_ECAC_48E9_B645_74C36BE0B254(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x4_t v2 = *(float **)(arguments_buffer_delayInitStub + 24);
  int v3 = **(_DWORD **)(arguments_buffer_delayInitStub + 16);
  if (v3 == 270 || v3 == 90) {
    unsigned int v5 = -1;
  }
  else {
    unsigned int v5 = 0;
  }
  int8x8_t v6 = vbsl_s8((int8x8_t)vdup_n_s32(v5), (int8x8_t)0x40A0000040900000, (int8x8_t)0x4080000040600000);
  float v7 = fminf(*(float *)v6.i32, *(float *)&v6.i32[1]);
  float result = fmaxf(*(float *)v6.i32, *(float *)&v6.i32[1]);
  *float32x4_t v2 = v7;
  v2[1] = result;
  return result;
}

__n128 __vfx_script_confetti_graph_47C93548_02F8_4EF6_928F_74CE4F39BBDE(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x4_t v2 = *(__n128 **)(arguments_buffer_delayInitStub + 16);
  __n128 result = *v2;
  *(__n128 *)*(void *)(arguments_buffer_delayInitStub + 24) = *v2;
  return result;
}

__n128 __vfx_script_confetti_graph_47AC3C7A_C039_41DA_AD43_881D7E0F565A(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x4_t v2 = *(float **)(arguments_buffer_delayInitStub + 24);
  v3.i64[0] = 0;
  v3.i32[3] = 0;
  v3.f32[2] = -*v2;
  v4.i64[0] = 0;
  v4.i32[3] = 0;
  v4.f32[2] = (float)(*v2 - **(float **)(arguments_buffer_delayInitStub + 32)) * 0.5;
  __n128 result = (__n128)vaddq_f32(vaddq_f32(vaddq_f32(*(float32x4_t *)*(void *)(arguments_buffer_delayInitStub + 16), v3), v4), (float32x4_t)xmmword_1D08405A0);
  result.n128_u32[3] = 1.0;
  *(__n128 *)*(void *)(arguments_buffer_delayInitStub + 40) = result;
  return result;
}

uint64_t __vfx_script_confetti_graph_16E7F806_2D73_4A39_B82C_90F26336105A(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x4_t v2 = *(unint64_t **)(result + 56);
  float32x4_t v3 = *(unint64_t **)(result + 64);
  float v4 = **(float **)(result + 24);
  BOOL v5 = fabsf(v4) <= 0.00000011921;
  float v6 = (float)(v4 - **(float **)(result + 32)) / v4;
  if (v5) {
    float v6 = 0.0;
  }
  float v7 = (float)(**(float **)(result + 16) * 30.0) * v6;
  float v8 = 1.0;
  if (!**(unsigned char **)(result + 40)) {
    float v8 = 0.0;
  }
  unint64_t v9 = (unint64_t)(float)((float)(v7 * v8) + 0.0);
  if (!**(unsigned char **)(result + 48)) {
    unint64_t v9 = 0;
  }
  *float32x4_t v2 = v9;
  v2[1] = v9;
  *float32x4_t v3 = v9;
  v3[1] = v9;
  return result;
}

float __vfx_script_balloons_graph_F1142E3A_E67C_40DC_BC13_10D44D3F90F7(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x4_t v2 = *(void **)(arguments_buffer_delayInitStub + 40);
  float v3 = **(float **)(arguments_buffer_delayInitStub + 16);
  if (!**(unsigned char **)(arguments_buffer_delayInitStub + 24)) {
    float v3 = 0.0;
  }
  float result = v3 * (float)**(unint64_t **)(arguments_buffer_delayInitStub + 32);
  *float32x4_t v2 = (unint64_t)result;
  v2[1] = (unint64_t)result;
  return result;
}

uint64_t __vfx_script_balloons_graph_C007B07C_DCA2_428B_9117_ECF37793469A(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x4_t v2 = *(int **)(result + 16);
  float v3 = *(long long **)(result + 32);
  float v4 = *(void **)(result + 40);
  int v5 = *v2;
  *(void *)&long long v6 = **(void **)(result + 24);
  long long v7 = *v3;
  float v8 = 0.0;
  if (fabsf(*((float *)&v6 + 1)) > 0.00000011921) {
    float v8 = (float)(*(float *)&v6 / *((float *)&v6 + 1)) * 0.25;
  }
  BOOL v9 = *(float *)&v6 <= *((float *)&v6 + 1);
  LODWORD(v6) = 0.25;
  if (!v9) {
    *(float *)&long long v6 = v8;
  }
  DWORD2(v7) = *v2;
  DWORD1(v6) = HIDWORD(*v4);
  *float v3 = v7;
  DWORD2(v6) = v5;
  *(_OWORD *)float v4 = v6;
  *((_DWORD *)v3 + 3) = 1065353216;
  return result;
}

float __vfx_script_balloons_graph_8F8209A1_99A0_4036_A138_3AB3E67064C6(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float32x4_t v2 = *(void **)(arguments_buffer_delayInitStub + 40);
  float v3 = **(float **)(arguments_buffer_delayInitStub + 16);
  if (!**(unsigned char **)(arguments_buffer_delayInitStub + 24)) {
    float v3 = 0.0;
  }
  float result = v3 * (float)**(unint64_t **)(arguments_buffer_delayInitStub + 32);
  *float32x4_t v2 = (unint64_t)result;
  v2[1] = (unint64_t)result;
  return result;
}

float __vfx_script_balloons_graph_5CC22647_AE13_4002_961E_197A930CB43A(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  unsigned int v2 = 747796405 * **(_DWORD **)(arguments_buffer_delayInitStub + 8) - 903319789;
  unsigned int v3 = 277803737 * ((v2 >> ((v2 >> 28) + 4)) ^ v2);
  float result = (float)(COERCE_FLOAT((v3 >> 31) ^ (v3 >> 9) | 0x3F800000) + -1.0) * 6.0;
  **(void **)(arguments_buffer_delayInitStub + 16) = (int)result;
  return result;
}

uint64_t __vfx_script_balloons_graph_0C92C45F_EBE3_4B04_B05E_4634866C142E(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  unsigned int v2 = *(float **)(result + 16);
  unsigned int v3 = *(void **)(result + 32);
  float v4 = *v2;
  uint64_t v5 = **(void **)(result + 24);
  float v6 = 0.0;
  if (fabsf(*((float *)&v5 + 1)) > 0.00000011921) {
    float v6 = (float)(*(float *)&v5 / *((float *)&v5 + 1)) * 0.5;
  }
  BOOL v7 = *(float *)&v5 <= *((float *)&v5 + 1);
  float v8 = 0.5;
  if (!v7) {
    float v8 = v6;
  }
  __asm { FMOV            V3.4S, #1.0 }
  long long v14 = _Q3;
  *(float *)&long long v14 = v8;
  *((float *)&v14 + 2) = *v2;
  *(void *)&_Q3 = *v3;
  *(_OWORD *)*(void *)(result + 40) = v14;
  *((float *)&_Q3 + 2) = -v4;
  *(_OWORD *)unsigned int v3 = _Q3;
  return result;
}

char **__vfx_get_script_table_thumbsup()
{
  return &__vfx_get_script_table_thumbsup::scriptTable;
}

char **__vfx_get_script_table_rain()
{
  return &__vfx_get_script_table_rain::scriptTable;
}

char **__vfx_get_script_table_hearts()
{
  return &__vfx_get_script_table_hearts::scriptTable;
}

char **__vfx_get_script_table_fireworks()
{
  return &__vfx_get_script_table_fireworks::scriptTable;
}

char **__vfx_get_script_table_confetti()
{
  return &__vfx_get_script_table_confetti::scriptTable;
}

char **__vfx_get_script_table_balloons()
{
  return &__vfx_get_script_table_balloons::scriptTable;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void SetEspressoArray(uint64_t *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *a1;
  uint64_t v5 = a1[11] * a1[10];
  if (v5 == [v3 count])
  {
    if (v5)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        BOOL v7 = [v3 objectAtIndexedSubscript:i];
        [v7 floatValue];
        *(_DWORD *)(v4 + 4 * i) = v8;
      }
    }
  }
  else
  {
    uint64_t v9 = _PTLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      SetEspressoArray_cold_1(v3, v5, v9);
    }
  }
}

id CopyEspressoArray(int **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void)a1[11] * (void)a1[10];
  for (uint64_t i = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v2];
  {
    int v5 = *v1++;
    LODWORD(v4) = v5;
    float v6 = [NSNumber numberWithFloat:v4];
    [i addObject:v6];
  }
  BOOL v7 = (void *)[i copy];

  return v7;
}

void _DebugLogEspressoBufferRow(void *a1, unint64_t a2)
{
  if (a1[11] <= a2) {
    _DebugLogEspressoBufferRow_cold_2();
  }
  id v3 = _CSVStringForFloats(*a1 + 4 * a1[10] * a2, 1, a1[10]);
  double v4 = _PTLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    _DebugLogEspressoBufferRow_cold_1((uint64_t)v3, a2);
  }
}

id _CSVStringForFloats(uint64_t a1, uint64_t a2, unint64_t a3)
{
  float v6 = objc_opt_new();
  if (a3)
  {
    unint64_t v7 = 0;
    do
    {
      if (v7) {
        [v6 appendString:@","];
      }
      objc_msgSend(v6, "appendFormat:", @"%g", *(float *)(a1 + 4 * v7));
      v7 += a2;
    }
    while (v7 < a3);
  }

  return v6;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t a1, void *a2)
{
  return [a2 length];
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

uint64_t PTThreadTimeGet()
{
  uint64_t v5 = 0;
  *(_OWORD *)thread_info_out = 0u;
  long long v4 = 0u;
  mach_msg_type_number_t thread_info_outCnt = 10;
  thread_inspect_t v0 = MEMORY[0x1D25E41F0]();
  if (thread_info(v0, 3u, thread_info_out, &thread_info_outCnt)) {
    return -1;
  }
  else {
    return thread_info_out[1] + 1000000 * thread_info_out[0];
  }
}

uint64_t PTThreadTimeSubtract(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 - a3;
}

uint64_t PTThreadTimeAdd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3 + a1;
}

id AssetReaderError(void *a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = a1;
  uint64_t v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = a1;
  long long v4 = [v2 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v1 errorWithDomain:@"com.apple.Portrait.AssetReader" code:-1 userInfo:v4];

  return v5;
}

void sub_1D07A23A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D07A2444(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id loadTracksWithMediaType(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v12 = 0;
  int8x16_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __loadTracksWithMediaType_block_invoke;
  v9[3] = &unk_1E6884250;
  unint64_t v11 = &v12;
  uint64_t v6 = v5;
  uint64_t v10 = v6;
  [v3 loadTracksWithMediaType:v4 completionHandler:v9];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void sub_1D07A274C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D07A393C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
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

void __loadTracksWithMediaType_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    int v8 = _PTLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __loadTracksWithMediaType_block_invoke_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __loadMetadataForFormat_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    int v8 = _PTLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __loadMetadataForFormat_block_invoke_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t PTParameterPairSerialization_GetParameter(uint64_t a1, unsigned int a2, int a3, int a4, float *a5)
{
  if (a2)
  {
    unsigned __int16 v6 = a4;
    uint64_t v7 = a2;
    int v8 = (unsigned int *)(a1 + 4);
    while (a3 != bswap32(*((unsigned __int16 *)v8 - 2)) >> 16)
    {
      v8 += 2;
      if (!--v7) {
        goto LABEL_5;
      }
    }
    if (a4 == 2)
    {
      *(_DWORD *)a5 = bswap32(*v8);
    }
    else if (a4 == 1)
    {
      *a5 = _PTSwapBigGetFloat(v8);
    }
    else
    {
      unint64_t v11 = _PTLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        PTParameterPairSerialization_GetParameter_cold_2(a3, v6, v11);
      }
    }
    return 1;
  }
  else
  {
LABEL_5:
    uint64_t v9 = _PTLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      PTParameterPairSerialization_GetParameter_cold_1(a3, v9);
    }

    return 0;
  }
}

uint64_t PTGroupIDFromFTTrack(void *a1)
{
  uint64_t v1 = [a1 metadata];
  uint64_t v2 = [v1 objectForKeyedSubscript:@"GroupID"];

  if (v2) {
    uint64_t v3 = [v2 integerValue];
  }
  else {
    uint64_t v3 = -1;
  }

  return v3;
}

void OUTLINED_FUNCTION_3_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t CanTriggerTwoHandReaction(void *a1, void *a2, float a3)
{
  id v5 = a1;
  id v6 = a2;
  int v7 = [v6 type];
  if (v7 != [v5 type]) {
    goto LABEL_4;
  }
  int v8 = [v5 confidence];
  [v8 floatValue];
  if (v9 >= a3)
  {
  }
  else
  {
    uint64_t v10 = [v6 confidence];
    [v10 floatValue];
    float v12 = v11;

    if (v12 < a3)
    {
LABEL_4:
      uint64_t v13 = 0;
      goto LABEL_15;
    }
  }
  uint64_t v14 = [v5 confidence];
  [v14 floatValue];
  if (v15 < a3 && (unsigned int v16 = [v5 fpMitigation], v16 < 8) && ((0xD9u >> v16) & 1) != 0)
  {
    uint64_t v13 = 0;
  }
  else
  {
    id v17 = [v6 confidence];
    [v17 floatValue];
    if (v18 >= a3 || (unsigned int v19 = [v6 fpMitigation], v19 > 7)) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = (0x26u >> v19) & 1;
    }
  }
LABEL_15:

  return v13;
}

float GetDurationMilliseconds(CMTime *a1, CMTime *a2)
{
  CMTime lhs = *a2;
  CMTime v3 = *a1;
  CMTimeSubtract(&time, &lhs, &v3);
  return CMTimeGetSeconds(&time) * 1000.0;
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

CFDictionaryRef PTCinematographyDictionaryFromCMTime(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 12))
  {
    CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CMTime v4 = *(CMTime *)a1;
    CFDictionaryRef v1 = CMTimeCopyAsDictionary(&v4, v2);
  }
  else
  {
    CFDictionaryRef v1 = 0;
  }

  return v1;
}

id PTCinematographyDictionaryFromCGRect(double a1, double a2, double a3, double a4)
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v13[0] = @"x";
  int v7 = objc_msgSend(NSNumber, "numberWithDouble:");
  v14[0] = v7;
  v13[1] = @"y";
  int v8 = [NSNumber numberWithDouble:a2];
  v14[1] = v8;
  v13[2] = @"w";
  float v9 = [NSNumber numberWithDouble:a3];
  v14[2] = v9;
  v13[3] = @"h";
  uint64_t v10 = [NSNumber numberWithDouble:a4];
  v14[3] = v10;
  float v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

double CGRectFromPTCinematographyDictionary(void *a1)
{
  id v1 = a1;
  CFAllocatorRef v2 = [v1 objectForKeyedSubscript:@"x"];
  [v2 doubleValue];
  double v4 = v3;

  id v5 = [v1 objectForKeyedSubscript:@"y"];
  [v5 doubleValue];

  id v6 = [v1 objectForKeyedSubscript:@"w"];
  [v6 doubleValue];

  int v7 = [v1 objectForKeyedSubscript:@"h"];

  [v7 doubleValue];
  return v4;
}

__CFString *NSStringFromCMTime(CMTime *a1)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTime v4 = *a1;
  CFAllocatorRef v2 = (__CFString *)CMTimeCopyDescription(v1, &v4);

  return v2;
}

void Main_balloons_graph_30F6F52E_9FD9_4037_93CA_CCE724034EB4(const void *a1, unsigned int a2, BOOL *a3)
{
  *a3 = 1;
}

uint64_t __vfx_script_balloons_graph_30F6F52E_9FD9_4037_93CA_CCE724034EB4(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(unsigned char **)(result + 16) = 1;
  return result;
}

float Spawn_balloons_graph_F1142E3A_E67C_40DC_BC13_10D44D3F90F7(float a1, uint64_t a2, uint64_t a3, int a4, unint64_t a5, void *a6)
{
  if (!a4) {
    a1 = 0.0;
  }
  float result = a1 * (float)a5;
  *a6 = (unint64_t)result;
  a6[1] = (unint64_t)result;
  return result;
}

float Init_balloons_graph_C007B07C_DCA2_428B_9117_ECF37793469A(float result, __n128 a2, uint64_t a3, uint64_t a4, long long *a5, __n128 *a6)
{
  long long v6 = *a5;
  __n128 v7 = *a6;
  float v8 = 0.0;
  if (fabsf(a2.n128_f32[1]) > 0.00000011921) {
    float v8 = (float)(a2.n128_f32[0] / a2.n128_f32[1]) * 0.25;
  }
  BOOL v9 = a2.n128_f32[0] == a2.n128_f32[1];
  BOOL v10 = a2.n128_f32[0] < a2.n128_f32[1];
  a2.n128_u32[0] = 0.25;
  if (!v10 && !v9) {
    a2.n128_f32[0] = v8;
  }
  *((float *)&v6 + 2) = result;
  *a5 = v6;
  a2.n128_u32[1] = v7.n128_u32[1];
  a2.n128_f32[2] = result;
  *a6 = a2;
  return result;
}

float Main_balloons_graph_5CC22647_AE13_4002_961E_197A930CB43A(const void *a1, int a2, unint64_t *a3)
{
  unsigned int v3 = 277803737
     * (((747796405 * a2 - 903319789) >> (((747796405 * a2 - 903319789) >> 28) + 4)) ^ (747796405 * a2 - 903319789));
  float result = (float)(COERCE_FLOAT((v3 >> 31) ^ (v3 >> 9) | 0x3F800000) + -1.0) * 6.0;
  *a3 = (int)result;
  return result;
}

void Init_balloons_graph_0C92C45F_EBE3_4B04_B05E_4634866C142E(float a1, double a2, uint64_t a3, uint64_t a4, long long *a5, _OWORD *a6)
{
  long long v6 = *a5;
  float v7 = 0.0;
  if (fabsf(*((float *)&a2 + 1)) > 0.00000011921) {
    float v7 = (float)(*(float *)&a2 / *((float *)&a2 + 1)) * 0.5;
  }
  _ZF = *(float *)&a2 == *((float *)&a2 + 1);
  _NF = *(float *)&a2 < *((float *)&a2 + 1);
  float v10 = 0.5;
  if (!_NF && !_ZF) {
    float v10 = v7;
  }
  __asm { FMOV            V3.4S, #1.0 }
  *(float *)&_Q3 = v10;
  *((float *)&_Q3 + 2) = a1;
  *a6 = _Q3;
  *((float *)&v6 + 2) = -a1;
  *a5 = v6;
}

float Main_balloons_graph_598E1865_A878_4D27_8744_3FC0B2A676F9(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result = a3 * 300.0;
  *a4 = result;
  return result;
}

float __vfx_script_balloons_graph_598E1865_A878_4D27_8744_3FC0B2A676F9(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 300.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float Main_balloons_graph_CD99FC2C_17B7_466E_930E_F05728CE31E3(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result = a3 * 2000.0;
  *a4 = result;
  return result;
}

float __vfx_script_balloons_graph_CD99FC2C_17B7_466E_930E_F05728CE31E3(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 2000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t Main_balloons_graph_002BE311_BD95_45E8_95C2_2D34D7AFF9B4(double a1, uint64_t a2, int a3, float *a4, float *a5)
{
  float v8 = *((float *)&a1 + 1);
  float v9 = *(float *)&a1;
  *(float *)&a1 = (float)(*(float *)&a1 / *((float *)&a1 + 1)) * 0.25;
  if (fabsf(*((float *)&a1 + 1)) > 0.00000011921) {
    float v10 = *(float *)&a1;
  }
  else {
    float v10 = 0.0;
  }
  float v17 = v9;
  if (fabsf(v9) > 0.00000011921) {
    float v11 = (float)(*((float *)&a1 + 1) / v9) * 0.25;
  }
  else {
    float v11 = 0.0;
  }
  *(float *)&a1 = (float)(*((float *)&a1 + 1) / v9) * 0.25;
  uint64_t result = vfx_script_clock_simulation_index_delayInitStub(a1);
  if (v17 <= v8) {
    float v13 = 0.25;
  }
  else {
    float v13 = v10;
  }
  unsigned int v14 = 277803737
      * (((747796405 * (result + a3) - 1881823590) >> (((747796405 * (result + a3)
                                                                                   - 1881823590) >> 28)
                                                                   + 4)) ^ (747796405 * (result + a3) - 1881823590));
  float v15 = -(float)(v13 - (float)((float)(COERCE_FLOAT((v14 >> 31) ^ (v14 >> 9) | 0x3F800000) + -1.0) * (float)(v13 + v13)));
  if (v17 <= v8) {
    float v16 = v11;
  }
  else {
    float v16 = 0.25;
  }
  *a4 = v15;
  *a5 = v16;
  return result;
}

uint64_t __vfx_script_balloons_graph_002BE311_BD95_45E8_95C2_2D34D7AFF9B4(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  CFAllocatorRef v2 = *(float **)(arguments_buffer_delayInitStub + 24);
  unsigned int v3 = *(float **)(arguments_buffer_delayInitStub + 32);
  int v4 = **(_DWORD **)(arguments_buffer_delayInitStub + 8);
  uint64_t v5 = **(void **)(arguments_buffer_delayInitStub + 16);
  float v6 = *((float *)&v5 + 1);
  float v7 = 0.0;
  if (fabsf(*((float *)&v5 + 1)) > 0.00000011921) {
    float v7 = (float)(*(float *)&v5 / *((float *)&v5 + 1)) * 0.25;
  }
  if (fabsf(*(float *)&v5) > 0.00000011921) {
    float v8 = (float)(*((float *)&v5 + 1) / *(float *)&v5) * 0.25;
  }
  else {
    float v8 = 0.0;
  }
  float v14 = *(float *)&v5;
  uint64_t result = vfx_script_clock_simulation_index_delayInitStub(0.0);
  if (v14 <= v6) {
    float v10 = 0.25;
  }
  else {
    float v10 = v7;
  }
  unsigned int v11 = 277803737
      * (((747796405 * (result + v4) - 1881823590) >> (((747796405 * (result + v4)
                                                                                   - 1881823590) >> 28)
                                                                   + 4)) ^ (747796405 * (result + v4) - 1881823590));
  float v12 = -(float)(v10 - (float)((float)(COERCE_FLOAT((v11 >> 31) ^ (v11 >> 9) | 0x3F800000) + -1.0) * (float)(v10 + v10)));
  if (v14 <= v6) {
    float v13 = v8;
  }
  else {
    float v13 = 0.25;
  }
  *CFAllocatorRef v2 = v12;
  *unsigned int v3 = v13;
  return result;
}

double Main_balloons_graph_B84097E5_E449_4B6D_91CB_A59BE625458A(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  double result = 0.00000133972957;
  *a3 = xmmword_1D081FD50;
  return result;
}

double __vfx_script_balloons_graph_B84097E5_E449_4B6D_91CB_A59BE625458A(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  double result = 0.00000133972957;
  *(_OWORD *)*(void *)(arguments_buffer_delayInitStub + 16) = xmmword_1D081FD50;
  return result;
}

float ParticleInit_balloons_particleInit_58(double a1, uint64_t a2, uint64_t a3, void *a4)
{
  float v4 = fabsf(*((float *)&a1 + 1));
  float v5 = 0.0;
  BOOL v8 = v4 == 0.00000011921;
  BOOL v6 = v4 >= 0.00000011921;
  float v7 = 0.0;
  if (!v8 && v6) {
    float v7 = (float)(*(float *)&a1 / *((float *)&a1 + 1)) * 0.25;
  }
  if (fabsf(*(float *)&a1) > 0.00000011921) {
    float v5 = (float)(*((float *)&a1 + 1) / *(float *)&a1) * 0.25;
  }
  BOOL v8 = *(float *)&a1 == *((float *)&a1 + 1);
  BOOL v9 = *(float *)&a1 < *((float *)&a1 + 1);
  float result = 0.25;
  if (v9 || v8) {
    *(float *)&uint64_t v11 = 0.25;
  }
  else {
    *(float *)&uint64_t v11 = v7;
  }
  if (v9 || v8) {
    float result = v5;
  }
  *((float *)&v11 + 1) = result;
  *a4 = v11;
  return result;
}

uint64_t __vfx_script_balloons_particleInit_58(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t ParticleInit_balloons_particleInit_40(float32x4_t a1, double a2, uint64_t a3, int a4, int a5, float32x4_t *a6, _OWORD *a7, double *a8)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v28 = *(_OWORD *)a8;
  int inited = vfx_script_clock_simulation_index_delayInitStub(*a8);
  *(float *)&double v14 = fabsf(*(float *)&a2);
  if (*(float *)&v14 > 0.00000011921)
  {
    *(float *)&double v14 = (float)(*((float *)&a2 + 1) / *(float *)&a2) * -0.25;
    float v15 = *(float *)&v14 + -0.2;
  }
  else
  {
    float v15 = -0.2;
  }
  uint64_t result = vfx_script_clock_simulation_index_delayInitStub(v14);
  v30[0] = xmmword_1D081FD60;
  v30[1] = xmmword_1D081FD70;
  v30[2] = xmmword_1D081FD80;
  v30[3] = xmmword_1D081FD90;
  v30[4] = xmmword_1D081FDA0;
  v30[5] = xmmword_1D081FDB0;
  unsigned int v17 = 277803737
      * (((747796405 * (a5 + a4 + result) + 1843050656) >> (((747796405 * (a5 + a4 + result)
                                                                                        + 1843050656) >> 28)
                                                                        + 4)) ^ (747796405 * (a5 + a4 + result)
                                                                               + 1843050656));
  int v18 = (int)(float)((float)(COERCE_FLOAT((v17 >> 31) ^ (v17 >> 9) | 0x3F800000) + -1.0) * 6.0);
  unsigned int v19 = 277803737
      * (((747796405 * (inited + a4) + 2034861790) >> (((747796405 * (inited + a4)
                                                                                   + 2034861790) >> 28)
                                                                   + 4)) ^ (747796405 * (inited + a4) + 2034861790));
  float v20 = (float)((float)((float)(COERCE_FLOAT((v19 >> 31) ^ (v19 >> 9) | 0x3F800000) + -1.0)
                      + (float)(COERCE_FLOAT((v19 >> 31) ^ (v19 >> 9) | 0x3F800000) + -1.0))
              + -1.0)
      * 0.1;
  int v21 = -1092196762;
  if (*(float *)&a2 <= *((float *)&a2 + 1)) {
    *(float *)&int v21 = v15;
  }
  v22 = (const float *)&unk_1D081FE08;
  float32x4_t v23 = vld1q_dup_f32(v22);
  v23.i64[0] = __PAIR64__(v21, LODWORD(v20));
  long long v24 = v30[v18];
  *a6 = vaddq_f32(a1, v23);
  *a7 = v24;
  v25 = (const float *)&dword_1D081FE0C;
  float32x4_t v26 = vld1q_dup_f32(v25);
  v26.i32[0] = v28;
  v26.i32[2] = DWORD2(v28);
  *(float32x4_t *)a8 = v26;
  return result;
}

uint64_t __vfx_script_balloons_particleInit_40(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t ParticleInit_balloons_particleInit_140(double a1, double a2, uint64_t a3, int a4, unsigned int a5, long long *a6, _OWORD *a7, long long *a8, long long *a9)
{
  float v41 = *(float *)&a1;
  float v43 = *((float *)&a2 + 1);
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  long long v44 = *a6;
  long long v45 = *a9;
  long long v16 = *a8;
  long long v46 = *a8;
  float v17 = *((float *)&a1 + 1);
  if (fabsf(*(float *)&a1) > 0.00000011921) {
    float v18 = (float)(*((float *)&a1 + 1) / *(float *)&a1) * -0.25;
  }
  else {
    float v18 = -0.0;
  }
  *(float *)&long long v16 = (float)(*((float *)&a1 + 1) / *(float *)&a1) * -0.25;
  int inited = vfx_script_clock_simulation_index_delayInitStub(*(double *)&v16);
  v47[0] = xmmword_1D081FD60;
  v47[1] = xmmword_1D081FD70;
  v47[2] = xmmword_1D081FD80;
  v47[3] = xmmword_1D081FD90;
  v47[4] = xmmword_1D081FDA0;
  v47[5] = xmmword_1D081FDB0;
  float v20 = fmodf((float)a5, 6.0);
  if (v41 <= v17) {
    float v21 = v18;
  }
  else {
    float v21 = -0.25;
  }
  unsigned int v22 = a5 + a4;
  unsigned int v23 = 277803737
      * (((747796405 * (v22 + inited) + 1075806120) >> (((747796405 * (v22 + inited) + 1075806120) >> 28) + 4)) ^ (747796405 * (v22 + inited) + 1075806120));
  long long v40 = v47[(unint64_t)v20];
  float v42 = v21 - (float)((float)((float)(COERCE_FLOAT((v23 >> 31) ^ (v23 >> 9) | 0x3F800000) + -1.0) * 0.7) + 0.54);
  *((float *)&v24 + 1) = v43;
  *(float *)&double v24 = v43 + 0.1;
  unsigned int v25 = vfx_script_clock_simulation_index_delayInitStub(v24);
  uint64_t result = vfx_script_clock_simulation_index_delayInitStub(v26);
  int8x8_t v28 = (int8x8_t)vmla_s32((int32x2_t)0x325F2EE4D93A3F7ALL, vadd_s32(vdup_n_s32(v22), (int32x2_t)__PAIR64__(result, v25)), vdup_n_s32(0x2C9277B5u));
  uint32x2_t v29 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32((uint32x2_t)v28, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32((uint32x2_t)v28, 0x1CuLL))), v28), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v35 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v29, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v29, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  float32x2_t v37 = vadd_f32(v35, _D1);
  *a7 = v40;
  long long v38 = v44;
  *((float *)&v38 + 1) = v42;
  DWORD2(v38) = DWORD2(v44);
  *a6 = v38;
  *(void *)&long long v38 = v45;
  *((float32x2_t *)&v38 + 1) = v37;
  *a9 = v38;
  long long v39 = v46;
  *((float *)&v39 + 1) = v43 + 0.1;
  DWORD2(v39) = DWORD2(v46);
  *a8 = v39;
  return result;
}

uint64_t __vfx_script_balloons_particleInit_140(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t ParticleInit_balloons_particleInit_9(double a1, uint64_t a2, int a3, int a4, int a5, long long *a6, _OWORD *a7, long long *a8)
{
  float v38 = *(float *)&a1;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v15 = *a8;
  long long v40 = *a6;
  long long v41 = *a8;
  float v16 = *((float *)&a1 + 1);
  if (fabsf(*(float *)&a1) > 0.00000011921) {
    float v17 = (float)(*((float *)&a1 + 1) / *(float *)&a1) * -0.25;
  }
  else {
    float v17 = -0.0;
  }
  *(float *)&long long v15 = (float)(*((float *)&a1 + 1) / *(float *)&a1) * -0.25;
  int inited = vfx_script_clock_simulation_index_delayInitStub(*(double *)&v15);
  v42[0] = xmmword_1D081FD60;
  v42[1] = xmmword_1D081FD70;
  v42[2] = xmmword_1D081FD80;
  v42[3] = xmmword_1D081FD90;
  v42[4] = xmmword_1D081FDA0;
  v42[5] = xmmword_1D081FDB0;
  float v19 = fmodf((float)(a5 + a4), 6.0);
  if (v38 <= v16) {
    float v20 = v17;
  }
  else {
    float v20 = -0.25;
  }
  unsigned int v21 = a4 + a3;
  unsigned int v22 = ((747796405 * (v21 + inited) + 1075806120) >> (((747796405 * (v21 + inited) + 1075806120) >> 28) + 4)) ^ (747796405 * (v21 + inited) + 1075806120);
  long long v37 = v42[(unint64_t)v19];
  float v39 = v20
      - (float)((float)((float)(COERCE_FLOAT(((277803737 * v22) >> 31) ^ ((277803737 * v22) >> 9) | 0x3F800000) + -1.0)
                      * 0.3)
              + 0.54);
  unsigned int v23 = vfx_script_clock_simulation_index_delayInitStub(*(double *)&v37);
  uint64_t result = vfx_script_clock_simulation_index_delayInitStub(v24);
  int8x8_t v26 = (int8x8_t)vmla_s32((int32x2_t)0x325F2EE4D93A3F7ALL, vadd_s32(vdup_n_s32(v21), (int32x2_t)__PAIR64__(result, v23)), vdup_n_s32(0x2C9277B5u));
  uint32x2_t v27 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32((uint32x2_t)v26, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32((uint32x2_t)v26, 0x1CuLL))), v26), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v33 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v27, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v27, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  float32x2_t v35 = vadd_f32(v33, _D1);
  *a7 = v37;
  long long v36 = v40;
  *((float *)&v36 + 1) = v39;
  DWORD2(v36) = DWORD2(v40);
  *a6 = v36;
  *(void *)&long long v36 = v41;
  *((float32x2_t *)&v36 + 1) = v35;
  *a8 = v36;
  return result;
}

uint64_t __vfx_script_balloons_particleInit_9(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

double ParticleInit_balloons_particleInit_51(uint64_t a1, uint64_t a2, void *a3)
{
  double result = 0.0000000134110482;
  *a3 = 0x3E4CCCCD3EB60B2DLL;
  return result;
}

void __vfx_script_balloons_particleInit_51(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n128 ParticleUpdate_balloons_particleUpdate_89(double a1, uint64_t a2, uint64_t a3, uint64_t a4, int32x4_t *a5, long long *a6, int32x4_t *a7)
{
  int32x4_t v18 = *a5;
  long long v19 = *a6;
  vfx_script_texture_sample1d_delayInitStub(a1);
  __asm { FMOV            V1.4S, #-1.0 }
  *a7 = _Q1;
  _Q1.i32[0] = 1061997773;
  v15.i64[0] = vzip1q_s32(_Q1, v15).u64[0];
  v15.i64[1] = v18.i64[1];
  *a5 = v15;
  long long v16 = v19;
  DWORD2(v16) = 0;
  *a6 = v16;
  result.n128_u64[0] = v16;
  result.n128_u32[2] = DWORD2(v16);
  return result;
}

double __vfx_script_balloons_particleUpdate_89(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
  return result;
}

__n128 ParticleUpdate_balloons_particleUpdate_81(__n128 a1, float a2, float a3, float32x4_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 *a9, long long *a10, float32x4_t *a11)
{
  __n128 v65 = *a9;
  long long v66 = *a10;
  a1.n128_f32[0] = (float)((float)(a1.n128_f32[2] + 1.0) * 0.75) + -0.25;
  vfx_script_texture_sample1d_delayInitStub(a1.n128_f64[0]);
  float v64 = v16;
  *(float *)&double v17 = a3;
  vfx_script_texture_sample1d_delayInitStub(v17);
  float32x4_t v19 = vrsqrteq_f32((float32x4_t)xmmword_1D081FDC0);
  float32x4_t v20 = vmulq_f32(v19, vrsqrtsq_f32((float32x4_t)xmmword_1D081FDC0, vmulq_f32(v19, v19)));
  float32x4_t v21 = vmulq_f32(vmulq_f32(v20, vrsqrtsq_f32((float32x4_t)xmmword_1D081FDC0, vmulq_f32(v20, v20))), (float32x4_t)xmmword_1D081FA10);
  float32x4_t v22 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v21, (int32x4_t)v21), (int8x16_t)v21, 0xCuLL);
  float32x4_t v23 = vmlaq_f32(vmulq_f32(v22, vnegq_f32(a4)), v21, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a4, (int32x4_t)a4), (int8x16_t)a4, 0xCuLL));
  float32x4_t v24 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v23, (int32x4_t)v23), (int8x16_t)v23, 0xCuLL);
  float32x4_t v25 = vmulq_f32(v23, v23);
  v25.i64[0] = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v25.f32, 1), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v25, 2), v25)).u64[0];
  float32x4_t v26 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v25.f32, 0);
  v26.i32[3] = 0;
  float32x4_t v27 = vrsqrteq_f32(v26);
  float32x4_t v28 = vmulq_f32(v27, vrsqrtsq_f32(v26, vmulq_f32(v27, v27)));
  int32x4_t v29 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v25.f32[0] != 0.0)), 0x1FuLL));
  v29.i32[3] = 0;
  float32x4_t v30 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v29), (int8x16_t)vmulq_f32(vmulq_f32(v28, vrsqrtsq_f32(v26, vmulq_f32(v28, v28))), v24), vextq_s8(vextq_s8((int8x16_t)v21, (int8x16_t)v21, 0xCuLL), (int8x16_t)v21, 8uLL));
  float32x4_t v31 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v30, (int32x4_t)v30), (int8x16_t)v30, 0xCuLL), vnegq_f32(v21)), v30, v22);
  float32x4_t v32 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v31, (int32x4_t)v31), (int8x16_t)v31, 0xCuLL);
  int32x4_t v33 = (int32x4_t)vmulq_f32(v31, v31);
  v33.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v33.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v33, 2), *(float32x2_t *)v33.i8)).u32[0];
  float32x2_t v34 = vrsqrte_f32((float32x2_t)v33.u32[0]);
  float32x2_t v35 = vmul_f32(v34, vrsqrts_f32((float32x2_t)v33.u32[0], vmul_f32(v34, v34)));
  int32x4_t v36 = (int32x4_t)vmulq_n_f32(v32, vmul_f32(v35, vrsqrts_f32((float32x2_t)v33.u32[0], vmul_f32(v35, v35))).f32[0]);
  float v37 = v21.f32[2] + (float)(v30.f32[0] + *(float *)&v36.i32[1]);
  if (v37 > 0.0)
  {
    float32x4_t v38 = (float32x4_t)vzip2q_s32(v36, vuzp1q_s32(v36, (int32x4_t)v21));
    v38.i32[2] = v30.i32[1];
    float32x4_t v39 = (float32x4_t)vuzp2q_s32((int32x4_t)v21, vzip1q_s32((int32x4_t)v21, v36));
    v39.i32[1] = v30.i32[2];
    float32x4_t v41 = vsubq_f32(v38, v39);
    v38.i32[3] = sqrtf(v37 + 1.0);
    v39.i32[3] = v38.i32[3];
    float32x4_t v40 = vmulq_f32(v38, v39);
    v41.i32[3] = v40.i32[3];
    v40.f32[0] = 0.5 / v38.f32[3];
    float32x4_t v42 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.f32, 0);
LABEL_6:
    unint64_t v52 = v65.n128_u64[1];
    long long v51 = v66;
    float v53 = v64;
    goto LABEL_7;
  }
  if (v30.f32[0] >= v21.f32[2] && v30.f32[0] >= *(float *)&v36.i32[1])
  {
    float32x2_t v43 = (float32x2_t)vextq_s8((int8x16_t)v30, (int8x16_t)v30, 8uLL).u64[0];
    float32x2_t v44 = (float32x2_t)__PAIR64__(v21.u32[1], v43.u32[0]);
    float32x2_t v45 = (float32x2_t)__PAIR64__(v30.u32[1], COERCE_UNSIGNED_INT(sqrtf((float)((float)(v30.f32[0] + 1.0) - *(float *)&v36.i32[1]) - v21.f32[2])));
    float32x2_t v46 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v36.i8, 0);
    float32x2_t v47 = (float32x2_t)__PAIR64__(v46.u32[1], v45.u32[0]);
    float32x2_t v48 = vadd_f32(*(float32x2_t *)v30.f32, v46);
    v42.i32[0] = vmul_f32(v45, v47).u32[0];
    v42.i32[1] = v48.i32[1];
    v21.i32[1] = v36.i32[2];
    LODWORD(v49) = vadd_f32(*(float32x2_t *)v21.f32, v43).u32[0];
    int32x2_t v50 = (int32x2_t)vsub_f32(*(float32x2_t *)v21.f32, v44);
    HIDWORD(v49) = v50.i32[1];
    v42.i64[1] = v49;
    *(float *)v50.i32 = 0.5 / v45.f32[0];
    float32x4_t v41 = (float32x4_t)vdupq_lane_s32(v50, 0);
    goto LABEL_6;
  }
  unint64_t v52 = v65.n128_u64[1];
  long long v51 = v66;
  float v53 = v64;
  if (*(float *)&v36.i32[1] <= v21.f32[2])
  {
    v60.i32[0] = vextq_s8((int8x16_t)v30, (int8x16_t)v30, 8uLL).u32[0];
    v60.i32[1] = v36.i32[2];
    *(float32x2_t *)v21.f32 = vadd_f32(*(float32x2_t *)v21.f32, v60);
    float32x2_t v61 = (float32x2_t)__PAIR64__(v30.u32[1], COERCE_UNSIGNED_INT(sqrtf((float)((float)(v21.f32[2] + 1.0) - v30.f32[0]) - *(float *)&v36.i32[1])));
    float32x2_t v62 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v36.i8, 0);
    int32x2_t v63 = (int32x2_t)vsub_f32(*(float32x2_t *)v30.f32, v62);
    v62.i32[0] = v61.i32[0];
    v62.i32[0] = vmul_f32(v61, v62).u32[0];
    v62.i32[1] = v63.i32[1];
    *(float32x2_t *)&v41.u32[2] = v62;
    *(float *)v63.i32 = 0.5 / v61.f32[0];
    float32x4_t v42 = (float32x4_t)vdupq_lane_s32(v63, 0);
  }
  else
  {
    float v56 = sqrtf((float)((float)(*(float *)&v36.i32[1] + 1.0) - v30.f32[0]) - v21.f32[2]);
    int8x16_t v57 = (int8x16_t)v21;
    *(float *)v57.i32 = v56;
    float32x2_t v58 = (float32x2_t)vdup_laneq_s32(v36, 2);
    *(float *)v36.i32 = v30.f32[1] + *(float *)v36.i32;
    float32x2_t v59 = vadd_f32(*(float32x2_t *)v21.f32, v58);
    v58.f32[0] = v56;
    v57.i32[0] = vmul_f32(*(float32x2_t *)v57.i8, v58).u32[0];
    v57.i32[1] = v59.i32[1];
    v21.f32[0] = v21.f32[0] - v30.f32[2];
    float32x4_t v42 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v36, (int8x16_t)v36, 4uLL), v57, 0xCuLL);
    v42.i32[3] = v21.i32[0];
    v21.f32[0] = 0.5 / v56;
    float32x4_t v41 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v21.f32, 0);
  }
LABEL_7:
  float32x4_t v54 = vmulq_f32(v41, v42);
  v42.i32[1] = 0;
  v42.f32[0] = (float)(fminf(fmaxf(v53, 0.0), 1.0) * a2) + 0.3;
  *a11 = v54;
  result.n128_u64[0] = vzip1q_s32((int32x4_t)v42, v18).u64[0];
  result.n128_u64[1] = v52;
  *a9 = result;
  DWORD2(v51) = 0;
  *a10 = v51;
  return result;
}

uint64_t __vfx_script_balloons_particleUpdate_81(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n128 ParticleUpdate_balloons_particleUpdate_121(__n128 a1, float a2, float a3, float32x4_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 *a9, long long *a10, float32x4_t *a11)
{
  __n128 v101 = *a9;
  long long v102 = *a10;
  a1.n128_f32[0] = (float)(a1.n128_f32[2] + 1.0) + -0.25;
  vfx_script_texture_sample1d_delayInitStub(a1.n128_f64[0]);
  float v99 = v16;
  *(float *)&double v17 = a3;
  vfx_script_texture_sample1d_delayInitStub(v17);
  int32x4_t v19 = v18;
  float32x4_t v20 = vaddq_f32(a4, (float32x4_t)xmmword_1D081FDD0);
  float32x4_t v21 = vrsqrteq_f32((float32x4_t)xmmword_1D081FDC0);
  float32x4_t v22 = vmulq_f32(v21, vrsqrtsq_f32((float32x4_t)xmmword_1D081FDC0, vmulq_f32(v21, v21)));
  float32x4_t v23 = vmulq_f32(vmulq_f32(v22, vrsqrtsq_f32((float32x4_t)xmmword_1D081FDC0, vmulq_f32(v22, v22))), (float32x4_t)xmmword_1D081FA10);
  float32x4_t v24 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v23, (int32x4_t)v23), (int8x16_t)v23, 0xCuLL);
  float32x4_t v25 = vmlaq_f32(vmulq_f32(v24, vnegq_f32(v20)), v23, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v20, (int32x4_t)v20), (int8x16_t)v20, 0xCuLL));
  float32x4_t v26 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v25, (int32x4_t)v25), (int8x16_t)v25, 0xCuLL);
  float32x4_t v27 = vmulq_f32(v25, v25);
  v27.i64[0] = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 1), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2), v27)).u64[0];
  float32x4_t v28 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 0);
  v28.i32[3] = 0;
  float32x4_t v29 = vrsqrteq_f32(v28);
  float32x4_t v30 = vmulq_f32(v29, vrsqrtsq_f32(v28, vmulq_f32(v29, v29)));
  int32x4_t v31 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v27.f32[0] != 0.0)), 0x1FuLL));
  v31.i32[3] = 0;
  float32x4_t v32 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v31), (int8x16_t)vmulq_f32(vmulq_f32(v30, vrsqrtsq_f32(v28, vmulq_f32(v30, v30))), v26), vextq_s8(vextq_s8((int8x16_t)v23, (int8x16_t)v23, 0xCuLL), (int8x16_t)v23, 8uLL));
  float32x4_t v33 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v32, (int32x4_t)v32), (int8x16_t)v32, 0xCuLL), vnegq_f32(v23)), v32, v24);
  float32x4_t v34 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v33, (int32x4_t)v33), (int8x16_t)v33, 0xCuLL);
  int32x4_t v35 = (int32x4_t)vmulq_f32(v33, v33);
  v35.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v35.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v35, 2), *(float32x2_t *)v35.i8)).u32[0];
  float32x2_t v36 = vrsqrte_f32((float32x2_t)v35.u32[0]);
  float32x2_t v37 = vmul_f32(v36, vrsqrts_f32((float32x2_t)v35.u32[0], vmul_f32(v36, v36)));
  int32x4_t v38 = (int32x4_t)vmulq_n_f32(v34, vmul_f32(v37, vrsqrts_f32((float32x2_t)v35.u32[0], vmul_f32(v37, v37))).f32[0]);
  float v39 = v23.f32[2] + (float)(v32.f32[0] + *(float *)&v38.i32[1]);
  if (v39 <= 0.0)
  {
    if (v32.f32[0] < v23.f32[2] || v32.f32[0] < *(float *)&v38.i32[1])
    {
      if (*(float *)&v38.i32[1] <= v23.f32[2])
      {
        float v41 = sqrtf((float)((float)(v23.f32[2] + 1.0) - v32.f32[0]) - *(float *)&v38.i32[1]);
        v57.i32[0] = vextq_s8((int8x16_t)v32, (int8x16_t)v32, 8uLL).u32[0];
        v57.i32[1] = v38.i32[2];
        *(float32x2_t *)v44.f32 = vadd_f32(*(float32x2_t *)v23.f32, v57);
        float32x2_t v58 = (float32x2_t)__PAIR64__(v32.u32[1], LODWORD(v41));
        float32x2_t v59 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v38.i8, 0);
        *(float32x2_t *)v43.f32 = vsub_f32(*(float32x2_t *)v32.f32, v59);
        v59.f32[0] = v41;
        v59.i32[0] = vmul_f32(v58, v59).u32[0];
        v59.i32[1] = v43.i32[1];
        *(float32x2_t *)&v44.u32[2] = v59;
        goto LABEL_10;
      }
      float v45 = sqrtf((float)((float)(*(float *)&v38.i32[1] + 1.0) - v32.f32[0]) - v23.f32[2]);
      int8x16_t v53 = (int8x16_t)v23;
      *(float *)v53.i32 = v45;
      float32x2_t v54 = (float32x2_t)vdup_laneq_s32(v38, 2);
      *(float *)v38.i32 = v32.f32[1] + *(float *)v38.i32;
      float32x2_t v55 = vadd_f32(*(float32x2_t *)v23.f32, v54);
      v54.f32[0] = v45;
      v53.i32[0] = vmul_f32(*(float32x2_t *)v53.i8, v54).u32[0];
      v53.i32[1] = v55.i32[1];
      float32_t v56 = v23.f32[0] - v32.f32[2];
      float32x4_t v52 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v38, (int8x16_t)v38, 4uLL), v53, 0xCuLL);
      v52.f32[3] = v56;
    }
    else
    {
      float v45 = sqrtf((float)((float)(v32.f32[0] + 1.0) - *(float *)&v38.i32[1]) - v23.f32[2]);
      float32x2_t v46 = (float32x2_t)vextq_s8((int8x16_t)v32, (int8x16_t)v32, 8uLL).u64[0];
      float32x2_t v47 = (float32x2_t)__PAIR64__(v23.u32[1], v46.u32[0]);
      float32x2_t v48 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v38.i8, 0);
      float32x2_t v49 = (float32x2_t)__PAIR64__(v48.u32[1], LODWORD(v45));
      float32x2_t v50 = vadd_f32(*(float32x2_t *)v32.f32, v48);
      v52.i32[0] = vmul_f32((float32x2_t)__PAIR64__(v32.u32[1], LODWORD(v45)), v49).u32[0];
      v52.i32[1] = v50.i32[1];
      v23.i32[1] = v38.i32[2];
      LODWORD(v51) = vadd_f32(*(float32x2_t *)v23.f32, v46).u32[0];
      *(float32x2_t *)v23.f32 = vsub_f32(*(float32x2_t *)v23.f32, v47);
      HIDWORD(v51) = v23.i32[1];
      v52.i64[1] = v51;
    }
    v23.f32[0] = 0.5 / v45;
    float32x4_t v44 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 0);
    goto LABEL_11;
  }
  float32x4_t v40 = (float32x4_t)vzip2q_s32(v38, vuzp1q_s32(v38, (int32x4_t)v23));
  v40.i32[2] = v32.i32[1];
  float v41 = sqrtf(v39 + 1.0);
  float32x4_t v42 = (float32x4_t)vuzp2q_s32((int32x4_t)v23, vzip1q_s32((int32x4_t)v23, v38));
  v42.i32[1] = v32.i32[2];
  float32x4_t v44 = vsubq_f32(v40, v42);
  v40.f32[3] = v41;
  v42.f32[3] = v41;
  float32x4_t v43 = vmulq_f32(v40, v42);
  v44.i32[3] = v43.i32[3];
LABEL_10:
  v43.f32[0] = 0.5 / v41;
  float32x4_t v52 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v43.f32, 0);
LABEL_11:
  float32x4_t v60 = vmulq_f32(v44, v52);
  int8x16_t v61 = (int8x16_t)vmulq_f32(v60, (float32x4_t)xmmword_1D081FA20);
  int32x4_t v100 = v19;
  float32x4_t v104 = v60;
  if (vaddv_f32(vadd_f32(*(float32x2_t *)v61.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v61, v61, 8uLL))) >= 0.0)
  {
    float32x4_t v66 = vaddq_f32(v60, (float32x4_t)xmmword_1D081FDE0);
    int8x16_t v67 = (int8x16_t)vmulq_f32(v66, v66);
    float v64 = sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v67.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v67, v67, 8uLL))));
    float32x4_t v98 = (float32x4_t)xmmword_1D081FA20;
    float32x4_t v65 = vaddq_f32(v60, (float32x4_t)xmmword_1D081FA20);
  }
  else
  {
    float32x4_t v62 = vaddq_f32(v60, (float32x4_t)xmmword_1D081FA20);
    int8x16_t v63 = (int8x16_t)vmulq_f32(v62, v62);
    float v64 = sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v63.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v63, v63, 8uLL))));
    float32x4_t v98 = (float32x4_t)xmmword_1D081FDE0;
    float32x4_t v65 = vaddq_f32(v60, (float32x4_t)xmmword_1D081FDE0);
  }
  int8x16_t v68 = (int8x16_t)vmulq_f32(v65, v65);
  float v69 = atan2f(v64, sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v68.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v68, v68, 8uLL)))));
  float v70 = v69 + v69;
  float v71 = 1.0;
  _ZF = (float)(v69 + v69) == 0.0;
  float v73 = 1.0;
  if (!_ZF) {
    float v73 = sinf(v70) / v70;
  }
  float v74 = v73;
  float32x2_t v75 = vrecpe_f32((float32x2_t)LODWORD(v73));
  int32x2_t v76 = (int32x2_t)vmul_f32(v75, vrecps_f32((float32x2_t)LODWORD(v74), v75));
  LODWORD(v77) = vmul_f32((float32x2_t)v76, vrecps_f32((float32x2_t)LODWORD(v74), (float32x2_t)v76)).u32[0];
  if ((float)(v70 * 0.7) != 0.0)
  {
    float v96 = v77;
    *(float *)v76.i32 = sinf(v70 * 0.7);
    float v77 = v96;
    float v71 = *(float *)v76.i32 / (float)(v70 * 0.7);
  }
  *(float *)v76.i32 = (float)(v77 * v71) * 0.7;
  float32x4_t v78 = (float32x4_t)vdupq_lane_s32(v76, 0);
  float v79 = v70 * 0.3;
  float v80 = 1.0;
  if (v79 != 0.0)
  {
    float32x4_t v95 = v78;
    float v97 = v77;
    float v81 = sinf(v79);
    float32x4_t v78 = v95;
    float v77 = v97;
    float v80 = v81 / v79;
  }
  float32x4_t v82 = vmlaq_f32(vmulq_n_f32(v98, (float)(v77 * v80) * 0.3), v104, v78);
  int8x16_t v83 = (int8x16_t)vmulq_f32(v82, v82);
  *(float32x2_t *)v83.i8 = vadd_f32(*(float32x2_t *)v83.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v83, v83, 8uLL));
  float32x4_t v84 = (float32x4_t)vdupq_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v83.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v83.i8, 1)), 0);
  float32x4_t v85 = vrsqrteq_f32(v84);
  float32x4_t v86 = vmulq_f32(v85, vrsqrtsq_f32(v84, vmulq_f32(v85, v85)));
  long long v87 = v102;
  __asm { FMOV            V3.4S, #1.0 }
  float32x4_t v92 = (float32x4_t)vbslq_s8((int8x16_t)vceqzq_f32(v84), _Q3, (int8x16_t)vmulq_f32(v86, vrsqrtsq_f32(v84, vmulq_f32(v86, v86))));
  float32x4_t v93 = vmulq_f32(v82, v92);
  v92.i32[1] = 0;
  v92.f32[0] = (float)(fminf(fmaxf(v99, 0.0), 1.0) * a2) + 0.05;
  *a11 = v93;
  result.n128_u64[0] = vzip1q_s32((int32x4_t)v92, v100).u64[0];
  result.n128_u64[1] = v101.n128_u64[1];
  *a9 = result;
  DWORD2(v87) = 0;
  *a10 = v87;
  return result;
}

void __vfx_script_balloons_particleUpdate_121(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t __vfx_script_balloons_particleUpdate_36(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t isExpectedSize(void *a1, uint64_t *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  uint64_t v7 = *a2;
  if (v7 == [v5 width] && (uint64_t v8 = a2[1], v8 == objc_msgSend(v5, "height")))
  {
    uint64_t v9 = 1;
  }
  else
  {
    float v10 = _PTLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      isExpectedSize_cold_1((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);
    }

    uint64_t v9 = 0;
  }

  return v9;
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return [v0 height];
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t MediaAnalysisLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  unsigned int v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = MediaAnalysisLibraryCore_frameworkLibrary;
  uint64_t v5 = MediaAnalysisLibraryCore_frameworkLibrary;
  if (!MediaAnalysisLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E6884550;
    long long v7 = *(_OWORD *)&off_1E6884560;
    v3[3] = _sl_dlopen();
    MediaAnalysisLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1D07C1A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __MediaAnalysisLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  MediaAnalysisLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MediaAnalysisLibrary()
{
  uint64_t v0 = MediaAnalysisLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getVCPHandGestureImageRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVCPHandGestureImageRequestClass_softClass;
  uint64_t v7 = getVCPHandGestureImageRequestClass_softClass;
  if (!getVCPHandGestureImageRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVCPHandGestureImageRequestClass_block_invoke;
    v3[3] = &unk_1E68845A0;
    v3[4] = &v4;
    __getVCPHandGestureImageRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1D07C1C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVCPHandGestureImageRequestClass_block_invoke(uint64_t a1)
{
  MediaAnalysisLibrary();
  Class result = objc_getClass("VCPHandGestureImageRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVCPHandGestureImageRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVCPHandGestureImageRequestClass_block_invoke_cold_1();
    return (Class)getVCPHandGestureVideoRequestClass();
  }
  return result;
}

id getVCPHandGestureVideoRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVCPHandGestureVideoRequestClass_softClass;
  uint64_t v7 = getVCPHandGestureVideoRequestClass_softClass;
  if (!getVCPHandGestureVideoRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVCPHandGestureVideoRequestClass_block_invoke;
    v3[3] = &unk_1E68845A0;
    v3[4] = &v4;
    __getVCPHandGestureVideoRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1D07C1D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVCPHandGestureVideoRequestClass_block_invoke(uint64_t a1)
{
  MediaAnalysisLibrary();
  Class result = objc_getClass("VCPHandGestureVideoRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVCPHandGestureVideoRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVCPHandGestureVideoRequestClass_block_invoke_cold_1();
    return (Class)getVCPHandObjectClass();
  }
  return result;
}

id getVCPHandObjectClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVCPHandObjectClass_softClass;
  uint64_t v7 = getVCPHandObjectClass_softClass;
  if (!getVCPHandObjectClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVCPHandObjectClass_block_invoke;
    v3[3] = &unk_1E68845A0;
    v3[4] = &v4;
    __getVCPHandObjectClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1D07C1E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVCPHandObjectClass_block_invoke(uint64_t a1)
{
  MediaAnalysisLibrary();
  Class result = objc_getClass("VCPHandObject");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVCPHandObjectClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getVCPHandObjectClass_block_invoke_cold_1();
    return (Class)getVCPRequestFrameWidthPropertyKeySymbolLoc(v3);
  }
  return result;
}

uint64_t getVCPRequestFrameWidthPropertyKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getVCPRequestFrameWidthPropertyKeySymbolLoc_ptr;
  uint64_t v6 = getVCPRequestFrameWidthPropertyKeySymbolLoc_ptr;
  if (!getVCPRequestFrameWidthPropertyKeySymbolLoc_ptr)
  {
    id v1 = (void *)MediaAnalysisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "VCPRequestFrameWidthPropertyKey");
    getVCPRequestFrameWidthPropertyKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1D07C1FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getVCPRequestFrameWidthPropertyKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaAnalysisLibrary();
  Class result = dlsym(v2, "VCPRequestFrameWidthPropertyKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVCPRequestFrameWidthPropertyKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getVCPRequestFrameWidthPropertyKey()
{
  VCPRequestFrameWidthPropertyKeySymbolLoc = (void **)getVCPRequestFrameWidthPropertyKeySymbolLoc();
  if (VCPRequestFrameWidthPropertyKeySymbolLoc)
  {
    id v1 = *VCPRequestFrameWidthPropertyKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t VCPRequestFrameWidthPropertyKey_cold_1 = getVCPRequestFrameWidthPropertyKey_cold_1();
    return (id)getVCPRequestFrameHeightPropertyKeySymbolLoc(VCPRequestFrameWidthPropertyKey_cold_1);
  }
}

uint64_t getVCPRequestFrameHeightPropertyKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getVCPRequestFrameHeightPropertyKeySymbolLoc_ptr;
  uint64_t v6 = getVCPRequestFrameHeightPropertyKeySymbolLoc_ptr;
  if (!getVCPRequestFrameHeightPropertyKeySymbolLoc_ptr)
  {
    id v1 = (void *)MediaAnalysisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "VCPRequestFrameHeightPropertyKey");
    getVCPRequestFrameHeightPropertyKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1D07C2144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getVCPRequestFrameHeightPropertyKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaAnalysisLibrary();
  Class result = dlsym(v2, "VCPRequestFrameHeightPropertyKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVCPRequestFrameHeightPropertyKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getVCPRequestFrameHeightPropertyKey()
{
  VCPRequestFrameHeightPropertyKeySymbolLoc = (void **)getVCPRequestFrameHeightPropertyKeySymbolLoc();
  if (VCPRequestFrameHeightPropertyKeySymbolLoc)
  {
    id v1 = *VCPRequestFrameHeightPropertyKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t VCPRequestFrameWidthPropertyKey_cold_1 = getVCPRequestFrameWidthPropertyKey_cold_1();
    return (id)getVCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc(VCPRequestFrameWidthPropertyKey_cold_1);
  }
}

uint64_t getVCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getVCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc_ptr;
  uint64_t v6 = getVCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc_ptr;
  if (!getVCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc_ptr)
  {
    id v1 = (void *)MediaAnalysisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "VCPRequestEnableANSTHandDetectionPropertyKey");
    getVCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1D07C22B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getVCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaAnalysisLibrary();
  Class result = dlsym(v2, "VCPRequestEnableANSTHandDetectionPropertyKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

id getVCPRequestEnableANSTHandDetectionPropertyKey()
{
  VCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc = (void **)getVCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc();
  if (VCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc)
  {
    id v1 = *VCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc;
    return v1;
  }
  else
  {
    getVCPRequestFrameWidthPropertyKey_cold_1();
    return (id)getVCPRequestRotationInDegreesPropertyKeySymbolLoc();
  }
}

uint64_t getVCPRequestRotationInDegreesPropertyKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getVCPRequestRotationInDegreesPropertyKeySymbolLoc_ptr;
  uint64_t v6 = getVCPRequestRotationInDegreesPropertyKeySymbolLoc_ptr;
  if (!getVCPRequestRotationInDegreesPropertyKeySymbolLoc_ptr)
  {
    id v1 = (void *)MediaAnalysisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "VCPRequestRotationInDegreesPropertyKey");
    getVCPRequestRotationInDegreesPropertyKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1D07C242C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getVCPRequestRotationInDegreesPropertyKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaAnalysisLibrary();
  Class result = dlsym(v2, "VCPRequestRotationInDegreesPropertyKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVCPRequestRotationInDegreesPropertyKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getVCPRequestRotationInDegreesPropertyKey()
{
  VCPRequestRotationInDegreesPropertyKeySymbolLoc = (void **)getVCPRequestRotationInDegreesPropertyKeySymbolLoc();
  if (VCPRequestRotationInDegreesPropertyKeySymbolLoc)
  {
    id v1 = *VCPRequestRotationInDegreesPropertyKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t VCPRequestFrameWidthPropertyKey_cold_1 = getVCPRequestFrameWidthPropertyKey_cold_1();
    return (id)getVCPRequestDisableHandDetectionPropertyKeySymbolLoc(VCPRequestFrameWidthPropertyKey_cold_1);
  }
}

uint64_t getVCPRequestDisableHandDetectionPropertyKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getVCPRequestDisableHandDetectionPropertyKeySymbolLoc_ptr;
  uint64_t v6 = getVCPRequestDisableHandDetectionPropertyKeySymbolLoc_ptr;
  if (!getVCPRequestDisableHandDetectionPropertyKeySymbolLoc_ptr)
  {
    id v1 = (void *)MediaAnalysisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "VCPRequestDisableHandDetectionPropertyKey");
    getVCPRequestDisableHandDetectionPropertyKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1D07C25A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getVCPRequestDisableHandDetectionPropertyKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaAnalysisLibrary();
  Class result = dlsym(v2, "VCPRequestDisableHandDetectionPropertyKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVCPRequestDisableHandDetectionPropertyKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getVCPRequestDisableHandDetectionPropertyKey()
{
  VCPRequestDisableHandDetectionPropertyKeySymbolLoc = (void **)getVCPRequestDisableHandDetectionPropertyKeySymbolLoc();
  if (VCPRequestDisableHandDetectionPropertyKeySymbolLoc)
  {
    id v1 = *VCPRequestDisableHandDetectionPropertyKeySymbolLoc;
    return v1;
  }
  else
  {
    getVCPRequestFrameWidthPropertyKey_cold_1();
    return (id)getVCPRequestHandObjectsPropertyKeySymbolLoc();
  }
}

uint64_t getVCPRequestHandObjectsPropertyKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getVCPRequestHandObjectsPropertyKeySymbolLoc_ptr;
  uint64_t v6 = getVCPRequestHandObjectsPropertyKeySymbolLoc_ptr;
  if (!getVCPRequestHandObjectsPropertyKeySymbolLoc_ptr)
  {
    id v1 = (void *)MediaAnalysisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "VCPRequestHandObjectsPropertyKey");
    getVCPRequestHandObjectsPropertyKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1D07C2714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getVCPRequestHandObjectsPropertyKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaAnalysisLibrary();
  Class result = dlsym(v2, "VCPRequestHandObjectsPropertyKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVCPRequestHandObjectsPropertyKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getVCPRequestHandObjectsPropertyKey()
{
  VCPRequestHandObjectsPropertyKeySymbolLoc = (void **)getVCPRequestHandObjectsPropertyKeySymbolLoc();
  if (VCPRequestHandObjectsPropertyKeySymbolLoc)
  {
    id v1 = *VCPRequestHandObjectsPropertyKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t VCPRequestFrameWidthPropertyKey_cold_1 = getVCPRequestFrameWidthPropertyKey_cold_1();
    return (id)getVCPRequestFaceRectsPropertyKeySymbolLoc(VCPRequestFrameWidthPropertyKey_cold_1);
  }
}

uint64_t getVCPRequestFaceRectsPropertyKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getVCPRequestFaceRectsPropertyKeySymbolLoc_ptr;
  uint64_t v6 = getVCPRequestFaceRectsPropertyKeySymbolLoc_ptr;
  if (!getVCPRequestFaceRectsPropertyKeySymbolLoc_ptr)
  {
    id v1 = (void *)MediaAnalysisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "VCPRequestFaceRectsPropertyKey");
    getVCPRequestFaceRectsPropertyKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1D07C2888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getVCPRequestFaceRectsPropertyKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaAnalysisLibrary();
  Class result = dlsym(v2, "VCPRequestFaceRectsPropertyKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVCPRequestFaceRectsPropertyKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getVCPRequestFaceRectsPropertyKey()
{
  VCPRequestFaceRectsPropertyKeySymbolLoc = (void **)getVCPRequestFaceRectsPropertyKeySymbolLoc();
  if (VCPRequestFaceRectsPropertyKeySymbolLoc)
  {
    id v1 = *VCPRequestFaceRectsPropertyKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t VCPRequestFrameWidthPropertyKey_cold_1 = getVCPRequestFrameWidthPropertyKey_cold_1();
    return (id)getVCPRequestFaceYawsPropertyKeySymbolLoc(VCPRequestFrameWidthPropertyKey_cold_1);
  }
}

uint64_t getVCPRequestFaceYawsPropertyKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getVCPRequestFaceYawsPropertyKeySymbolLoc_ptr;
  uint64_t v6 = getVCPRequestFaceYawsPropertyKeySymbolLoc_ptr;
  if (!getVCPRequestFaceYawsPropertyKeySymbolLoc_ptr)
  {
    id v1 = (void *)MediaAnalysisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "VCPRequestFaceYawsPropertyKey");
    getVCPRequestFaceYawsPropertyKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1D07C29FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getVCPRequestFaceYawsPropertyKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaAnalysisLibrary();
  Class result = dlsym(v2, "VCPRequestFaceYawsPropertyKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVCPRequestFaceYawsPropertyKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getVCPRequestFaceYawsPropertyKey()
{
  VCPRequestFaceYawsPropertyKeySymbolLoc = (void **)getVCPRequestFaceYawsPropertyKeySymbolLoc();
  if (VCPRequestFaceYawsPropertyKeySymbolLoc)
  {
    id v1 = *VCPRequestFaceYawsPropertyKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t VCPRequestFrameWidthPropertyKey_cold_1 = getVCPRequestFrameWidthPropertyKey_cold_1();
    return (id)getVCPRequestMaxNumOfPersonsPropertyKeySymbolLoc(VCPRequestFrameWidthPropertyKey_cold_1);
  }
}

uint64_t getVCPRequestMaxNumOfPersonsPropertyKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getVCPRequestMaxNumOfPersonsPropertyKeySymbolLoc_ptr;
  uint64_t v6 = getVCPRequestMaxNumOfPersonsPropertyKeySymbolLoc_ptr;
  if (!getVCPRequestMaxNumOfPersonsPropertyKeySymbolLoc_ptr)
  {
    id v1 = (void *)MediaAnalysisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "VCPRequestMaxNumOfPersonsPropertyKey");
    getVCPRequestMaxNumOfPersonsPropertyKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1D07C2B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getVCPRequestMaxNumOfPersonsPropertyKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaAnalysisLibrary();
  Class result = dlsym(v2, "VCPRequestMaxNumOfPersonsPropertyKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVCPRequestMaxNumOfPersonsPropertyKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getVCPRequestMaxNumOfPersonsPropertyKey()
{
  VCPRequestMaxNumOfPersonsPropertyKeySymbolLoc = (void **)getVCPRequestMaxNumOfPersonsPropertyKeySymbolLoc();
  if (VCPRequestMaxNumOfPersonsPropertyKeySymbolLoc)
  {
    id v1 = *VCPRequestMaxNumOfPersonsPropertyKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t VCPRequestFrameWidthPropertyKey_cold_1 = getVCPRequestFrameWidthPropertyKey_cold_1();
    return (id)getVCPRequestUseAsyncPropertyKeySymbolLoc(VCPRequestFrameWidthPropertyKey_cold_1);
  }
}

uint64_t getVCPRequestUseAsyncPropertyKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getVCPRequestUseAsyncPropertyKeySymbolLoc_ptr;
  uint64_t v6 = getVCPRequestUseAsyncPropertyKeySymbolLoc_ptr;
  if (!getVCPRequestUseAsyncPropertyKeySymbolLoc_ptr)
  {
    id v1 = (void *)MediaAnalysisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "VCPRequestUseAsyncPropertyKey");
    getVCPRequestUseAsyncPropertyKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1D07C2CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getVCPRequestUseAsyncPropertyKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaAnalysisLibrary();
  Class result = dlsym(v2, "VCPRequestUseAsyncPropertyKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVCPRequestUseAsyncPropertyKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

float getVCPRequestUseAsyncPropertyKey()
{
  VCPRequestUseAsyncPropertyKeySymbolLoc = (void **)getVCPRequestUseAsyncPropertyKeySymbolLoc();
  if (VCPRequestUseAsyncPropertyKeySymbolLoc)
  {
    id v1 = *VCPRequestUseAsyncPropertyKeySymbolLoc;
    id v2 = v1;
  }
  else
  {
    uint64_t VCPRequestFrameWidthPropertyKey_cold_1 = (unsigned int *)getVCPRequestFrameWidthPropertyKey_cold_1();
    return _PTSwapBigGetFloat(VCPRequestFrameWidthPropertyKey_cold_1);
  }
  return result;
}

float _PTSwapBigGetFloat(unsigned int *a1)
{
  return COERCE_FLOAT(bswap32(*a1));
}

_DWORD *_PTSwapBigAssignFloat(_DWORD *result, float a2)
{
  *float result = bswap32(LODWORD(a2));
  return result;
}

float _PTSwapBigGetDouble(unint64_t *a1)
{
  return COERCE_DOUBLE(bswap64(*a1));
}

void *_PTSwapBigAssignDouble(void *result, double a2)
{
  *float result = bswap64(*(unint64_t *)&a2);
  return result;
}

CMTimeValue PTNanosecondsFromCMTime(CMTime *a1)
{
  memset(&v3, 0, sizeof(v3));
  CMTime v2 = *a1;
  CMTimeConvertScale(&v3, &v2, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  return v3.value;
}

CMTime *PTNanosecondsToCMTime@<X0>(int64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  return CMTimeMake((CMTime *)a2, a1, 1000000000);
}

void Main_rain_graph_2AEE11A5_5806_4949_9017_97A31959A146(const void *a1, unsigned int a2, float *a3)
{
  *a3 = 0.0;
}

uint64_t __vfx_script_rain_graph_2AEE11A5_5806_4949_9017_97A31959A146(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(_DWORD **)(result + 16) = 0;
  return result;
}

uint64_t __vfx_script_rain_graph_B55CB68B_5374_45B9_9B3B_050825454545(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(_DWORD **)(result + 16) = 0;
  return result;
}

__n128 Main_rain_graph_47225A01_2C47_433D_93D9_BF1D85A3839F(__n128 a1, float32x2_t a2, uint64_t a3, uint64_t a4, __n128 *a5)
{
  a1.n128_f32[0] = 1.5 * a1.n128_f32[0];
  a1.n128_f32[1] = vmuls_lane_f32(-6.0, a2, 1) + 0.0;
  a1.n128_f32[2] = a1.n128_f32[2] + 0.5;
  *a5 = a1;
  result.n128_u64[0] = a1.n128_u64[0];
  result.n128_u32[2] = a1.n128_u32[2];
  return result;
}

uint64_t Main_rain_graph_72169E6B_0B70_473E_B19D_953F01AC5993(const void *a1, unsigned int a2, float a3, float *a4)
{
  vfx_script_curve_create_delayInitStub(5.23869004e-11);
  *(float *)&double v6 = a3 / 3.0;
  vfx_script_curve_evaluate_delayInitStub(v6);
  *a4 = *(float *)&v7;
  return vfx_script_curve_destroy_delayInitStub(v7);
}

float Spawn_rain_graph_25FC010E_3796_4569_84C9_8E9B3FC08F4B(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result = a3 * 650.0;
  *a4 = result;
  return result;
}

float __vfx_script_rain_graph_25FC010E_3796_4569_84C9_8E9B3FC08F4B(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 650.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float Spawn_rain_graph_FA88FCF0_73CA_480E_A020_897384F93F5C(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result = a3 * 20.0;
  *a4 = result;
  return result;
}

float __vfx_script_rain_graph_FA88FCF0_73CA_480E_A020_897384F93F5C(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 20.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

int8x16_t Main_rain_graph_EDF6BEEC_34C4_489E_ABEC_1C4A62E25E40(int8x16_t a1, uint64_t a2, uint64_t a3, int8x16_t *a4)
{
  int8x16_t v4 = vextq_s8(a1, a1, 8uLL);
  *(float32x2_t *)v4.i8 = vadd_f32((float32x2_t)vext_s8(*(int8x8_t *)a1.i8, *(int8x8_t *)v4.i8, 4uLL), (float32x2_t)0xBF0000003D4CCCCDLL);
  int8x16_t result = vextq_s8(vextq_s8(a1, a1, 4uLL), v4, 0xCuLL);
  *a4 = result;
  return result;
}

__n128 Main_rain_graph_C718F1B2_4BA3_4E66_8269_7C49E171E2EC(__n128 a1, uint64_t a2, uint64_t a3, __n128 *a4, int32x4_t *a5, int32x4_t *a6)
{
  *a5 = vdupq_n_s32(0xC2C80000);
  *a6 = vdupq_n_s32(0x42C80000u);
  a1.n128_f32[2] = a1.n128_f32[2] + -0.85;
  *a4 = a1;
  result.n128_u64[0] = a1.n128_u64[0];
  result.n128_u32[2] = a1.n128_u32[2];
  return result;
}

float Spawn_rain_graph_43A66462_6D38_40C4_9563_E3E4B018C43A(const void *a1, unsigned int a2, double a3, const void *a4, float a5, float *a6)
{
  float v7 = *(float *)&a3;
  *(float *)&a3 = a5 / 3.5;
  vfx_script_texture_sample1d_delayInitStub(a3);
  float result = (float)(v7 * v8) * 2500.0;
  *a6 = result;
  return result;
}

__n128 Main_rain_graph_D83B875F_FB36_42AC_BCF5_9AD248F8E2AB(__n128 a1, uint64_t a2, uint64_t a3, __n128 *a4, _OWORD *a5, _OWORD *a6)
{
  __asm { FMOV            V2.4S, #-1.0 }
  *a5 = _Q2;
  __asm { FMOV            V2.4S, #1.0 }
  *a6 = _Q2;
  a1.n128_f32[2] = a1.n128_f32[2] + -0.65;
  *a4 = a1;
  result.n128_u64[0] = a1.n128_u64[0];
  result.n128_u32[2] = a1.n128_u32[2];
  return result;
}

float Spawn_rain_graph_999F57E4_3BBD_4410_9780_400191D6A26B(const void *a1, unsigned int a2, double a3, const void *a4, float a5, float *a6)
{
  float v7 = *(float *)&a3;
  *(float *)&a3 = a5 / 3.0;
  vfx_script_texture_sample1d_delayInitStub(a3);
  float result = (float)(v7 * v8) * 66.0;
  *a6 = result;
  return result;
}

float ParticleInit_rain_particleInit_161(double a1, uint64_t a2, uint64_t a3, int a4, float32x4_t *a5)
{
  float v5 = -*(float *)&a1;
  if (!a4) {
    float v5 = *(float *)&a1;
  }
  double v6 = (const float *)&dword_1D081FE00;
  float32x4_t v7 = vld1q_dup_f32(v6);
  float result = vmuls_lane_f32(4.0, *(float32x2_t *)&a1, 1);
  v7.i64[0] = __PAIR64__(LODWORD(result), LODWORD(v5));
  *a5 = v7;
  return result;
}

uint64_t __vfx_script_rain_particleInit_161(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float ParticleInit_rain_particleInit_167(__n128 a1, float32x2_t a2, uint64_t a3, int a4, _OWORD *a5, _OWORD *a6)
{
  int inited = vfx_script_clock_simulation_index_delayInitStub(a1.n128_f64[0]);
  unsigned int v10 = 277803737
      * (((747796405 * (inited + a4) - 1134027185) >> (((747796405 * (inited + a4)
                                                                                   - 1134027185) >> 28)
                                                                   + 4)) ^ (747796405 * (inited + a4) - 1134027185));
  *(float *)&long long v11 = 1.5 * a1.n128_f32[0];
  *((float *)&v11 + 1) = vmuls_lane_f32(-6.0, a2, 1) + 0.0;
  *((float *)&v11 + 2) = a1.n128_f32[2] + 0.5;
  float result = (float)((float)(COERCE_FLOAT((v10 >> 31) ^ (v10 >> 9) | 0x3F800000) + -1.0) * 2.0) + 0.0;
  *a6 = v11;
  *(void *)&long long v13 = 0;
  DWORD2(v13) = 0;
  *((float *)&v13 + 3) = result;
  *a5 = v13;
  return result;
}

uint64_t __vfx_script_rain_particleInit_167(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

double ParticleInit_rain_particleInit_149(double a1, uint64_t a2, int a3, uint64_t a4, int a5, float32x4_t *a6, float *a7, void *a8)
{
  int inited = vfx_script_clock_simulation_index_delayInitStub(a1);
  unsigned int v14 = 277803737
      * (((747796405 * (a5 + a3 + inited) - 1095130923) >> (((747796405 * (a5 + a3 + inited)
                                                                                        - 1095130923) >> 28)
                                                                        + 4)) ^ (747796405 * (a5 + a3 + inited)
                                                                               - 1095130923));
  float v15 = COERCE_FLOAT((v14 >> 31) ^ (v14 >> 9) | 0x3F800000) + -1.0;
  *(float *)&double v16 = v15;
  vfx_script_texture_sample1d_delayInitStub(v16);
  *a6 = vmulq_f32(v17, (float32x4_t)xmmword_1D081FF60);
  *a7 = v15;
  double result = 2.04636355e-13;
  *a8 = 0x3D4CCCCD3C75C28FLL;
  return result;
}

uint64_t __vfx_script_rain_particleInit_149(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n128 ParticleUpdate_rain_particleUpdate_36(__n128 a1, float32x4_t a2, float32x4_t a3, float32_t a4, float a5, uint64_t a6, uint64_t a7, uint64_t a8, float32x4_t *a9, float32x4_t *a10, float32x4_t *a11)
{
  float32x4_t v26 = (float32x4_t)a1;
  a1.n128_u32[0] = a9->u32[3];
  __n128 v30 = a1;
  vfx_script_clock_delta_time_delayInitStub(a1.n128_f64[0]);
  __asm { FMOV            V2.4S, #3.0 }
  float32x4_t v22 = vaddq_f32(vmulq_f32(vsubq_f32(a2, a3), _Q2), vmulq_n_f32(v26, v16));
  float32x4_t v29 = v22;
  v22.f32[0] = a4;
  vfx_script_texture_sample1d_delayInitStub(*(double *)v22.i64);
  float32x4_t v24 = v29;
  *a10 = v29;
  *a11 = vmulq_n_f32(v23, fminf(fmaxf(a5, 0.0), 1.0));
  __n128 result = v30;
  v24.i32[3] = v30.n128_u32[0];
  *a9 = v24;
  return result;
}

uint64_t __vfx_script_rain_particleUpdate_36(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_rain_particleUpdate_95(float32x4_t a1, float32_t a2, float a3, float a4, uint64_t a5, uint64_t a6, uint64_t a7, float32x4_t *a8)
{
  float32x4_t v14 = a1;
  a1.f32[0] = a2;
  vfx_script_texture_sample1d_delayInitStub(*(double *)a1.i64);
  v11.i32[1] = v14.i32[1];
  *(float *)v11.i32 = a3 + a3;
  float32x4_t result = vmulq_n_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(v11, 0), vmulq_n_f32(v14, v12)), fminf(fmaxf(a4, 0.0), 1.0));
  *a8 = result;
  return result;
}

uint64_t __vfx_script_rain_particleUpdate_95(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_rain_particleUpdate_122(double a1, float a2, uint64_t a3, uint64_t a4, uint64_t a5, float32x4_t *a6)
{
  vfx_script_texture_sample1d_delayInitStub(a1);
  float32x4_t result = vmulq_n_f32(v8, fminf(fmaxf(a2, 0.0), 1.0));
  *a6 = result;
  return result;
}

uint64_t __vfx_script_rain_particleUpdate_122(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float ParticleUpdate_rain_particleUpdate_194(double a1, int32x4_t a2, double a3, int32x4_t a4, uint64_t a5, uint64_t a6, unsigned __int32 a7, float32x4_t *a8, int8x16_t *a9)
{
  a2.i32[0] = 0;
  float v9 = -*(float *)&a1;
  a4.i32[0] = a7;
  int8x16_t v10 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(a4, a2), 0), (int8x16_t)xmmword_1D081FF80, (int8x16_t)xmmword_1D081FF70);
  if (!a7) {
    float v9 = *(float *)&a1;
  }
  float result = vmuls_lane_f32(4.0, *(float32x2_t *)&a1, 1);
  float v12 = (const float *)&dword_1D081FE00;
  float32x4_t v13 = vld1q_dup_f32(v12);
  *a9 = v10;
  v13.i64[0] = __PAIR64__(LODWORD(result), LODWORD(v9));
  *a8 = v13;
  return result;
}

uint64_t __vfx_script_rain_particleUpdate_194(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

void PTIOSurfaceSetColorSpace(__IOSurface *a1, CGColorSpaceRef space)
{
  if (space)
  {
    CFPropertyListRef v3 = CGColorSpaceCopyPropertyList(space);
    if (v3)
    {
      int8x16_t v4 = v3;
      IOSurfaceSetValue(a1, (CFStringRef)*MEMORY[0x1E4F2F068], v3);
      CFRelease(v4);
    }
  }
}

void filter_coefficients(int a1, int a2, int a3, int a4, int a5, int a6, unsigned int *a7, float a8)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  int8x16_t v63 = a7;
  if ((a3 - 1) >= 2)
  {
    float v9 = 0.0;
    if (!a3)
    {
      if (a1 >= 1)
      {
        uint64_t v43 = 0;
        uint64_t v44 = a1 >> 1;
        do
        {
          if (v43 == v44) {
            unsigned int v45 = (int)(float)(unint64_t)(1 << a6) & ~(-1 << (a6
          }
                                                                                     + a5));
          else {
            unsigned int v45 = 0;
          }
          if (v43 == v44 && a6 + a5 >= 33) {
            filter_coefficients_cold_1();
          }
          float32x2_t v46 = v63;
          uint64_t v47 = a2;
          if (a2 >= 1)
          {
            do
            {
              *v46++ = v45;
              --v47;
            }
            while (v47);
          }
          ++v43;
          v63 += a2;
        }
        while (v43 != a1);
      }
      return;
    }
  }
  else
  {
    float v9 = a8;
    a8 = 1.0;
  }
  if (a8 > 1.0) {
    a8 = 1.0;
  }
  float v67 = a8;
  signed int v10 = a1 & 0xFFFFFFFE;
  if (a1 < 0) {
    signed int v10 = a1 & 0xFFFFFFFE | 1;
  }
  if (a2 >= 1)
  {
    uint64_t v58 = 0;
    int v11 = v10 >> 1;
    float v12 = (float)v11;
    float v13 = (float)a1;
    float v50 = (float)(0.5 / a8) + -0.5;
    float v51 = (float)a2;
    float v14 = -1.0;
    float v15 = (float)((float)a1 + -1.0) * 0.5;
    float v16 = (float)(int)floorf(v15);
    float v61 = v9 * 0.5;
    float v62 = (float)-vcvtms_s32_f32(v15);
    float v60 = v9 + v9;
    float v59 = sqrtf((float)(v9 + v9) * 3.1416);
    int v49 = a6 + a5;
    int v17 = -1 << (a6 + a5);
    int v18 = 1 << (a6 + a5 - 1);
    float32x2_t v54 = &a7[v11 * a2];
    int v53 = 1 << a6;
    uint64_t v52 = a2;
    float v48 = (float)(unint64_t)(1 << a6);
    int v66 = -v11;
    uint64_t v19 = 4 * a2;
    unint64_t v20 = (unint64_t)a1 << 7;
    float32x4_t v21 = (float *)&v68;
    int v64 = a3;
    float v65 = v16;
    float v57 = (float)v11;
    float v56 = (float)a1;
    do
    {
      if (a1 < 1)
      {
        int v38 = 0;
        float v39 = v63;
      }
      else
      {
        uint64_t v22 = 0;
        float v23 = (float)(int)v58 / v51;
        if ((a1 & (v23 >= 0.5)) != 0) {
          float v24 = v23 + v14;
        }
        else {
          float v24 = (float)(int)v58 / v51;
        }
        float v25 = 0.0;
        float32x4_t v26 = v21;
        do
        {
          if (a4 == 1) {
            float v27 = v24 + 1.0;
          }
          else {
            float v27 = v24;
          }
          if (a4 == 2) {
            float v27 = v50 + v24;
          }
          float v28 = 0.0;
          if (vabds_f32((float)(int)v22, v27 + v12) <= fminf(v27 + v12, (float)(v13 - (float)(v27 + v12)) + v14))
          {
            float v29 = v67 * (float)((float)(v66 + v22) - v27);
            switch(a3)
            {
              case 1:
                float v28 = 0.0;
                if (fabsf(v29) <= v61) {
                  float v28 = 1.0;
                }
                break;
              case 3:
                if (v29 == 0.0)
                {
                  float v35 = 1.0;
                }
                else
                {
                  float v31 = sinf(v29 * 3.1416) / (float)(v29 * 3.1416);
                  float v32 = (float)(v29 / v65) * 3.1416;
                  float v33 = sinf(v32);
                  float v16 = v65;
                  a3 = v64;
                  float v34 = v33 / v32;
                  float v12 = v57;
                  float v35 = v31 * v34;
                  float v13 = v56;
                  float v14 = -1.0;
                }
                BOOL v36 = v35 < v16 && v35 > v62;
                float v28 = 0.0;
                if (v36) {
                  float v28 = v35;
                }
                break;
              case 2:
                float v30 = expf((float)-(float)(v29 * v29) / v60);
                float v16 = v65;
                a3 = v64;
                float v28 = v30 / v59;
                break;
              default:
                return;
            }
          }
          *float32x4_t v26 = v28;
          v26 += 32;
          float v25 = v25 + v28;
          ++v22;
        }
        while (a1 != v22);
        if (v49 > 32) {
          filter_coefficients_cold_1();
        }
        unint64_t v37 = 0;
        int v38 = 0;
        float v39 = v63;
        float32x4_t v40 = v63;
        do
        {
          unsigned int v41 = llroundf((float)(v21[v37 / 4] / v25) * v48) & ~v17;
          *float32x4_t v40 = v41;
          if ((v41 & v18) != 0) {
            int v42 = v17;
          }
          else {
            int v42 = 0;
          }
          v38 += v42 | v41;
          float32x4_t v40 = (unsigned int *)((char *)v40 + v19);
          v37 += 128;
        }
        while (v20 != v37);
      }
      v54[v58] += v53 - v38;
      ++v21;
      int8x16_t v63 = v39 + 1;
      ++v58;
    }
    while (v58 != v52);
  }
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1D07C6CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id location)
{
  objc_destroyWeak(v35);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v36 - 208), 8);
  _Unwind_Resume(a1);
}

float Main_lasers_graph_3AFCB8D6_52EB_4CCA_8CDC_E3DC4941B357(const void *a1, unsigned int a2, float *a3, double a4)
{
  vfx_script_clock_time_delayInitStub(a4);
  *(float *)&double v5 = v5;
  float result = (float)(fminf(fmaxf((float)(sinf(*(float *)&v5 * 75.0) + 1.0) * 0.5, 0.0), 1.0) * 0.75) + 0.5;
  *a3 = result;
  return result;
}

float __vfx_script_lasers_graph_3AFCB8D6_52EB_4CCA_8CDC_E3DC4941B357(double a1)
{
  double v1 = *(float **)(vfx_script_get_arguments_buffer_delayInitStub(a1) + 16);
  vfx_script_clock_time_delayInitStub(v2);
  *(float *)&double v3 = v3;
  float result = (float)(fminf(fmaxf((float)(sinf(*(float *)&v3 * 75.0) + 1.0) * 0.5, 0.0), 1.0) * 0.75) + 0.5;
  *double v1 = result;
  return result;
}

uint64_t Main_lasers_graph_31BFE03A_347F_4F4B_8062_57C3C496211B(uint64_t a1, uint64_t a2, _OWORD *a3, _DWORD *a4)
{
  vfx_script_curve_create_delayInitStub(5.23869004e-11);
  vfx_script_clock_time_delayInitStub(v6);
  *(float *)&double v7 = v7;
  *(float *)&double v7 = *(float *)&v7 / 5.0;
  if (*(float *)&v7 >= 1.0) {
    *(float *)&double v7 = 0.0;
  }
  vfx_script_curve_evaluate_delayInitStub(v7);
  *a3 = xmmword_1D081FD50;
  *a4 = LODWORD(v8);
  return vfx_script_curve_destroy_delayInitStub(v8);
}

uint64_t __vfx_script_lasers_graph_31BFE03A_347F_4F4B_8062_57C3C496211B(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  double v2 = *(_OWORD **)(arguments_buffer_delayInitStub + 16);
  double v3 = *(_DWORD **)(arguments_buffer_delayInitStub + 24);
  vfx_script_curve_create_delayInitStub(5.23869004e-11);
  vfx_script_clock_time_delayInitStub(v4);
  *(float *)&double v5 = v5;
  *(float *)&double v5 = *(float *)&v5 / 5.0;
  if (*(float *)&v5 >= 1.0) {
    *(float *)&double v5 = 0.0;
  }
  vfx_script_curve_evaluate_delayInitStub(v5);
  *double v2 = xmmword_1D081FD50;
  *double v3 = LODWORD(v6);
  return vfx_script_curve_destroy_delayInitStub(v6);
}

__n128 Main_lasers_graph_75AE1D4B_87B4_4422_8E85_FE9D23E01F3B(uint64_t a1, uint64_t a2, _OWORD *a3, _OWORD *a4, __n128 *a5)
{
  *a3 = xmmword_1D0820010;
  __asm { FMOV            V0.4S, #-1.0 }
  *a4 = _Q0;
  __asm { FMOV            V0.4S, #1.0 }
  *a5 = result;
  return result;
}

__n128 __vfx_script_lasers_graph_75AE1D4B_87B4_4422_8E85_FE9D23E01F3B(double a1)
{
  uint64_t arguments_buffer_delayInitStub = (void *)vfx_script_get_arguments_buffer_delayInitStub(a1);
  uint64_t v2 = arguments_buffer_delayInitStub[2];
  double v3 = (_OWORD *)arguments_buffer_delayInitStub[3];
  double v4 = (__n128 *)arguments_buffer_delayInitStub[4];
  *(_OWORD *)uint64_t v2 = xmmword_1D0820010;
  __asm { FMOV            V0.4S, #-1.0 }
  *double v3 = _Q0;
  __asm { FMOV            V0.4S, #1.0 }
  *double v4 = result;
  *(_DWORD *)(v2 + 12) = 1065353216;
  return result;
}

void Spawn_lasers_graph_84E516C9_0301_4F69_B83A_25056C254AE8(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  *a4 = a3;
  a4[1] = a3;
}

uint64_t __vfx_script_lasers_graph_84E516C9_0301_4F69_B83A_25056C254AE8(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  uint64_t v2 = *(void **)(result + 24);
  uint64_t v3 = **(unsigned __int8 **)(result + 16);
  *uint64_t v2 = v3;
  v2[1] = v3;
  return result;
}

float32x4_t Main_lasers_graph_5BEEC0A4_8351_4E81_B071_E7FCF2740A98(float32x4_t a1, uint64_t a2, uint64_t a3, float32x4_t *a4)
{
  float32x4_t result = vaddq_f32(a1, (float32x4_t)xmmword_1D0820020);
  *a4 = result;
  return result;
}

__n128 __vfx_script_lasers_graph_5BEEC0A4_8351_4E81_B071_E7FCF2740A98(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  __n128 result = (__n128)vaddq_f32(*(float32x4_t *)*(void *)(arguments_buffer_delayInitStub + 16), (float32x4_t)xmmword_1D0820020);
  result.n128_u32[3] = 1.0;
  *(__n128 *)*(void *)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t Main_lasers_graph_1415613D_8457_4B24_9F2B_BDCEA47A7E46(const void *a1, unsigned int a2, float *a3)
{
  vfx_script_curve_create_delayInitStub(5.23869004e-11);
  vfx_script_clock_time_delayInitStub(v4);
  *(float *)&double v5 = v5;
  *(float *)&double v5 = *(float *)&v5 / 5.0;
  if (*(float *)&v5 >= 1.0) {
    *(float *)&double v5 = 0.0;
  }
  vfx_script_curve_evaluate_delayInitStub(v5);
  *a3 = *(float *)&v6;
  return vfx_script_curve_destroy_delayInitStub(v6);
}

uint64_t __vfx_script_lasers_graph_1415613D_8457_4B24_9F2B_BDCEA47A7E46(double a1)
{
  double v1 = *(_DWORD **)(vfx_script_get_arguments_buffer_delayInitStub(a1) + 16);
  vfx_script_curve_create_delayInitStub(5.23869004e-11);
  vfx_script_clock_time_delayInitStub(v2);
  *(float *)&double v3 = v3;
  *(float *)&double v3 = *(float *)&v3 / 5.0;
  if (*(float *)&v3 >= 1.0) {
    *(float *)&double v3 = 0.0;
  }
  vfx_script_curve_evaluate_delayInitStub(v3);
  *double v1 = LODWORD(v4);
  return vfx_script_curve_destroy_delayInitStub(v4);
}

float __vfx_script_lasers_graph_598E1865_A878_4D27_8744_3FC0B2A676F9(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 300.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float __vfx_script_lasers_graph_CD99FC2C_17B7_466E_930E_F05728CE31E3(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 2000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t __vfx_script_lasers_graph_C0E70AB3_A28A_4D4F_8BEB_9516B357779C(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(unsigned char **)(result + 16) = 1;
  return result;
}

double ParticleInit_lasers_particleInit_141(uint64_t a1, uint64_t a2, void *a3)
{
  double result = 0.0000305175853;
  *a3 = 0x3F0000003F638DF8;
  return result;
}

void __vfx_script_lasers_particleInit_141(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n128 ParticleInit_lasers_particleInit_26(uint64_t a1, int a2, int a3, double *a4, long long *a5, float *a6)
{
  long long v25 = *a5;
  long long v26 = *(_OWORD *)a4;
  int inited = vfx_script_clock_simulation_index_delayInitStub(*a4);
  int v12 = a3 + a2;
  unsigned int v13 = 277803737
      * (((747796405 * (v12 + inited) - 194419646) >> (((747796405 * (v12 + inited)
                                                                                   - 194419646) >> 28)
                                                                   + 4)) ^ (747796405 * (v12 + inited) - 194419646));
  *(float *)&double v14 = (float)((float)(COERCE_FLOAT((v13 >> 31) ^ (v13 >> 9) | 0x3F800000) + -1.0) * 0.3) + 0.7;
  float v24 = *(float *)&v14;
  int v15 = vfx_script_clock_simulation_index_delayInitStub(v14);
  unsigned int v16 = 277803737
      * (((747796405 * (v12 + v15) + 400461887) >> (((747796405 * (v12 + v15) + 400461887) >> 28)
                                                                + 4)) ^ (747796405 * (v12 + v15) + 400461887));
  *(float *)&double v17 = (float)(COERCE_FLOAT((v16 >> 31) ^ (v16 >> 9) | 0x3F800000) + -1.0) * 3.0;
  unint64_t v18 = (int)*(float *)&v17;
  int v19 = vfx_script_clock_simulation_index_delayInitStub(v17);
  unsigned int v20 = 277803737
      * (((747796405 * (v12 + v19) - 1403630843) >> (((747796405 * (v12 + v19) - 1403630843) >> 28)
                                                                 + 4)) ^ (747796405 * (v12 + v19) - 1403630843));
  *a6 = (float)((float)(unint64_t)((int)vcvts_n_s32_f32(COERCE_FLOAT((v20 >> 31) ^ (v20 >> 9) | 0x3F800000) + -1.0, 2uLL)+ 1)* 0.25)+ -0.125;
  *(float *)&long long v21 = v24;
  *((float *)&v21 + 1) = (float)v18;
  *((void *)&v21 + 1) = *((void *)&v25 + 1);
  *a5 = v21;
  long long v22 = v26;
  DWORD2(v22) = 0;
  *(_OWORD *)a4 = v22;
  result.n128_u64[0] = v22;
  result.n128_u32[2] = DWORD2(v22);
  return result;
}

uint64_t __vfx_script_lasers_particleInit_26(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

int32x4_t ParticleInit_lasers_particleInit_117(float32x4_t a1, double a2, uint64_t a3, uint64_t a4, unsigned int a5, float32x4_t *a6, int32x4_t *a7)
{
  v7.i64[0] = 0;
  v7.i32[3] = 0;
  v7.f32[2] = (float)a5 * 0.007;
  *(float *)&a2 = (float)((float)a5 * 0.05) + 5.0;
  *a6 = vaddq_f32(a1, v7);
  int32x4_t result = vdupq_lane_s32(*(int32x2_t *)&a2, 0);
  *a7 = result;
  return result;
}

uint64_t __vfx_script_lasers_particleInit_117(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n128 ParticleInit_lasers_particleInit_58(uint64_t a1, int a2, int a3, double *a4, long long *a5, float *a6)
{
  long long v21 = *a5;
  long long v22 = *(_OWORD *)a4;
  int inited = vfx_script_clock_simulation_index_delayInitStub(*a4);
  int v12 = a3 + a2;
  unsigned int v13 = 277803737
      * (((747796405 * (v12 + inited) - 194419646) >> (((747796405 * (v12 + inited)
                                                                                   - 194419646) >> 28)
                                                                   + 4)) ^ (747796405 * (v12 + inited) - 194419646));
  *(float *)&double v14 = (float)((float)(COERCE_FLOAT((v13 >> 31) ^ (v13 >> 9) | 0x3F800000) + -1.0) * 0.3) + 0.7;
  float v20 = *(float *)&v14;
  int v15 = vfx_script_clock_simulation_index_delayInitStub(v14);
  unsigned int v16 = 277803737
      * (((747796405 * (v12 + v15) - 1403630843) >> (((747796405 * (v12 + v15) - 1403630843) >> 28)
                                                                 + 4)) ^ (747796405 * (v12 + v15) - 1403630843));
  *a6 = (float)((float)(unint64_t)((int)vcvts_n_s32_f32(COERCE_FLOAT((v16 >> 31) ^ (v16 >> 9) | 0x3F800000) + -1.0, 2uLL)+ 1)* 0.25)+ -0.125;
  long long v17 = v21;
  *(float *)&long long v17 = v20;
  *a5 = v17;
  long long v18 = v22;
  DWORD2(v18) = 0;
  *(_OWORD *)a4 = v18;
  result.n128_u64[0] = v18;
  result.n128_u32[2] = DWORD2(v18);
  return result;
}

uint64_t __vfx_script_lasers_particleInit_58(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

int32x4_t ParticleInit_lasers_particleInit_27(float32x4_t a1, double a2, uint64_t a3, uint64_t a4, unsigned int a5, float32x4_t *a6, int32x4_t *a7)
{
  v7.i64[0] = 0;
  v7.i32[3] = 0;
  v7.f32[2] = (float)a5 * 0.007;
  *(float *)&a2 = (float)((float)a5 * 0.05) + 1.0;
  *a6 = vaddq_f32(a1, v7);
  int32x4_t result = vdupq_lane_s32(*(int32x2_t *)&a2, 0);
  *a7 = result;
  return result;
}

uint64_t __vfx_script_lasers_particleInit_27(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t __vfx_script_lasers_particleInit_28(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n128 ParticleUpdate_lasers_particleUpdate_83(double a1, float a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, float32x4_t *a9, _OWORD *a10)
{
  __int32 v15 = LODWORD(a1);
  vfx_script_texture_sample1d_delayInitStub(a1);
  float32x4_t v38 = v16;
  v16.i32[0] = v15;
  vfx_script_texture_sample1d_delayInitStub(*(double *)v16.i64);
  float32x4_t v39 = vmulq_n_f32(v38, a2 * v17);
  *(float *)&unsigned int v36 = (float)(cosf(a3 * 1.3) + -0.15) * 0.65;
  float v18 = sinf((float)((float)a8 + a3) + (float)((float)a8 + a3));
  v19.i64[0] = 0x3F0000003F000000;
  v19.i64[1] = 0x3F0000003F000000;
  simd_float4 v20 = (simd_float4)vmulq_f32(vaddq_f32((float32x4_t)__PAIR64__(LODWORD(v18), v36), (float32x4_t)0), v19);
  v20.i32[3] = 0;
  simd_float4 x = v20;
  simd_float4 v37 = _simd_cos_f4(v20);
  _Q0 = (float32x4_t)_simd_sin_f4(x);
  _Q7 = v37;
  float v23 = vmuls_lane_f32(v37.f32[1], (float32x4_t)v37, 2);
  float v24 = vmuls_lane_f32(_Q0.f32[1], _Q0, 2);
  *(float *)&long long v25 = vmlas_n_f32(-(float)(v37.f32[0] * v24), v23, _Q0.f32[0]);
  _S4 = vmuls_lane_f32(v37.f32[0], *(float32x2_t *)_Q0.f32, 1);
  __asm { FMLA            S5, S4, V7.S[2] }
  _S4 = vmuls_lane_f32(_Q7.f32[0], *(float32x2_t *)_Q7.f32, 1);
  __asm { FMLA            S6, S4, V0.S[2] }
  DWORD1(v25) = _S5;
  *((void *)&v25 + 1) = __PAIR64__(COERCE_UNSIGNED_INT(vmlas_n_f32(v24 * _Q0.f32[0], v23, v37.f32[0])), _S6);
  __n128 result = (__n128)v39;
  *a9 = v39;
  *a10 = v25;
  return result;
}

void __vfx_script_lasers_particleUpdate_83(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_lasers_particleUpdate_71(float32x4_t a1, float32_t a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, float32x4_t *a7)
{
  __asm { FMOV            V2.4S, #0.25 }
  float32x4_t v13 = vmulq_f32(a1, _Q2);
  float32x4_t v16 = v13;
  v13.f32[0] = a2;
  vfx_script_texture_sample1d_delayInitStub(*(double *)v13.i64);
  float32x4_t result = vmulq_n_f32(vmulq_n_f32(v16, v14), a3);
  *a7 = result;
  return result;
}

__n128 __vfx_script_lasers_particleUpdate_71(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
  return result;
}

float32x4_t ParticleUpdate_lasers_particleUpdate_84(double a1, float a2, uint64_t a3, uint64_t a4, uint64_t a5, float32x4_t *a6)
{
  vfx_script_texture_sample1d_delayInitStub(a1);
  float32x4_t result = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_1D081FA20, v8), fminf(fmaxf(a2, 0.0), 1.0));
  *a6 = result;
  return result;
}

uint64_t __vfx_script_lasers_particleUpdate_84(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_lasers_particleUpdate_18(float32x4_t a1, float32_t a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, float32x4_t *a7)
{
  float32x4_t v8 = vmulq_f32(a1, (float32x4_t)vdupq_n_s32(0x3F2A7EFAu));
  float32x4_t v11 = v8;
  v8.f32[0] = a2;
  vfx_script_texture_sample1d_delayInitStub(*(double *)v8.i64);
  float32x4_t result = vmulq_n_f32(vmulq_n_f32(v11, v9), a3);
  *a7 = result;
  return result;
}

__n128 __vfx_script_lasers_particleUpdate_18(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
  return result;
}

float32x4_t ParticleUpdate_lasers_particleUpdate_114(double a1, float a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, float32x4_t *a7)
{
  vfx_script_texture_sample1d_delayInitStub(a1);
  float32x4_t result = vmulq_n_f32(vmulq_n_f32(v9, a2), fminf(fmaxf(a3, 0.0), 1.0));
  *a7 = result;
  return result;
}

uint64_t __vfx_script_lasers_particleUpdate_114(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_lasers_particleUpdate_119(double a1, float a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, float32x4_t *a8)
{
  __int32 v11 = LODWORD(a1);
  vfx_script_texture_sample1d_delayInitStub(a1);
  float32x4_t v15 = v12;
  v12.i32[0] = v11;
  vfx_script_texture_sample1d_delayInitStub(*(double *)v12.i64);
  float32x4_t result = vmulq_n_f32(vmulq_n_f32(v15, a2 * v13), fminf(fmaxf(a3, 0.0), 1.0));
  *a8 = result;
  return result;
}

uint64_t __vfx_script_lasers_particleUpdate_119(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n128 particle_update_lasers_particleUpdate_21(uint64_t a1, __n128 *a2, __n128 *a3)
{
  __n128 result = *a2;
  *a3 = *a2;
  return result;
}

__n128 __vfx_script_lasers_particleUpdate_21(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
  return result;
}

char **__vfx_get_script_table_lasers()
{
  return &__vfx_get_script_table_lasers::scriptTable;
}

double CGRectGetArea(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double Width = CGRectGetWidth(*(CGRect *)&a1);
  v10.origin.simd_float4 x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  return Width * CGRectGetHeight(v10);
}

double CGRectGetCenter(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.simd_float4 x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

uint64_t PTSerializationDebugIsEnabled()
{
  if (PTSerializationDebugIsEnabled_onceToken != -1) {
    dispatch_once(&PTSerializationDebugIsEnabled_onceToken, &__block_literal_global_4);
  }
  return 0;
}

id NSStringFromBytes(unsigned __int8 *a1, uint64_t a2)
{
  for (uint64_t i = objc_opt_new(); a2; --a2)
  {
    unsigned int v5 = *a1++;
    objc_msgSend(i, "appendFormat:", @"%02X ", v5);
  }
  if ([i length]) {
    objc_msgSend(i, "deleteCharactersInRange:", objc_msgSend(i, "length") - 1, 1);
  }
  double v6 = (void *)[i copy];

  return v6;
}

uint64_t NSStringFromFourCharCode(unsigned int a1)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", HIBYTE(a1), BYTE2(a1), BYTE1(a1), a1);
}

id NSStringFromData(void *a1)
{
  id v1 = a1;
  double v2 = (unsigned __int8 *)[v1 bytes];
  uint64_t v3 = [v1 length];

  return NSStringFromBytes(v2, v3);
}

void sub_1D07CDE70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL PTTrackIDIsValid(uint64_t a1)
{
  return a1 >= 0;
}

unint64_t PTTrackIDIsInvalid(unint64_t a1)
{
  return a1 >> 63;
}

BOOL PTGroupIDIsValid(uint64_t a1)
{
  return a1 >= 0;
}

unint64_t PTGroupIDIsInvalid(unint64_t a1)
{
  return a1 >> 63;
}

uint64_t PTTrackIDFromNumber(void *a1)
{
  if (a1) {
    return [a1 integerValue];
  }
  else {
    return -1;
  }
}

id NSNumberFromPTTrackID(uint64_t a1)
{
  if (a1 == -1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", a1, v1);
  }
  return v3;
}

BOOL PTDetectionTypeIsBetter(uint64_t a1, uint64_t a2)
{
  if (PTDetectionTypeIsBetter_onceToken != -1) {
    dispatch_once(&PTDetectionTypeIsBetter_onceToken, &__block_literal_global_6);
  }
  double v4 = (void *)PTDetectionTypeIsBetter_sOrderMap;
  unsigned int v5 = [NSNumber numberWithUnsignedInteger:a1];
  double v6 = [v4 objectForKeyedSubscript:v5];
  float32x4_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(&unk_1F26C1138, "count"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  float32x4_t v9 = v8;

  CGRect v10 = (void *)PTDetectionTypeIsBetter_sOrderMap;
  __int32 v11 = [NSNumber numberWithUnsignedInteger:a2];
  float32x4_t v12 = [v10 objectForKeyedSubscript:v11];
  float v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(&unk_1F26C1150, "count"));
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  float32x4_t v15 = v14;

  int v16 = [v9 intValue];
  BOOL v17 = v16 < (int)[v15 intValue];

  return v17;
}

unint64_t __PTDetectionTypeIsBetter_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)PTDetectionTypeIsBetter_sOrderMap;
  PTDetectionTypeIsBetter_sOrderMap = v0;

  unint64_t result = [&unk_1F26C1108 count];
  if (result)
  {
    for (unint64_t i = 0; i < result; ++i)
    {
      double v4 = [NSNumber numberWithUnsignedInteger:i];
      unsigned int v5 = (void *)PTDetectionTypeIsBetter_sOrderMap;
      double v6 = [&unk_1F26C1120 objectAtIndexedSubscript:i];
      [v5 setObject:v4 forKeyedSubscript:v6];

      unint64_t result = [&unk_1F26C1108 count];
    }
  }
  return result;
}

uint64_t PTDetectionTypeParent(uint64_t result)
{
  uint64_t v1 = result - 1;
  if (unint64_t)(result - 1) <= 9 && ((0x31Fu >> v1)) {
    return qword_1D0820130[v1];
  }
  return result;
}

id PTDetectionTypeAccessibilityLabel(unint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v3 = v2;
  if (a1 > 0xB) {
    goto LABEL_8;
  }
  if (((1 << a1) & 0x630) != 0)
  {
    double v4 = @"PTCinematographyDetectionTypePet";
    unsigned int v5 = @"pet";
    goto LABEL_9;
  }
  if (((1 << a1) & 0xE) != 0)
  {
    double v4 = @"PTCinematographyDetectionTypeHuman";
    unsigned int v5 = @"person";
    goto LABEL_9;
  }
  if (a1 == 11)
  {
    double v4 = @"PTCinematographyDetectionTypeSportsBall";
    unsigned int v5 = @"sports ball";
  }
  else
  {
LABEL_8:
    double v4 = @"PTCinematographyDetectionTypeDefault";
    unsigned int v5 = @"object";
  }
LABEL_9:
  double v6 = [v2 localizedStringForKey:v4 value:v5 table:0];

  return v6;
}

BOOL PTIsValidTrackID(uint64_t a1)
{
  return a1 >= 0;
}

unint64_t PTIsInvalidTrackID(unint64_t a1)
{
  return a1 >> 63;
}

id _ErrorForDataBufferNotFoundAtURL(void *a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = _PTLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    _ErrorForDataBufferNotFoundAtURL_cold_1((uint64_t)v1, v2);
  }

  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F281F8];
  uint64_t v5 = *MEMORY[0x1E4F289D0];
  v9[0] = *MEMORY[0x1E4F28568];
  v9[1] = v5;
  v10[0] = @"data buffer not found at url";
  v10[1] = v1;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  float32x4_t v7 = [v3 errorWithDomain:v4 code:4 userInfo:v6];

  return v7;
}

BOOL LoadDataVec(char *a1, size_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char *__filename)
{
  float v13 = fopen(__filename, "r");
  id v14 = v13;
  if (v13)
  {
    if (a5)
    {
      size_t v15 = a6 * a4;
      do
      {
        fread(a1, a2, v15, v14);
        a1 += a3;
        --a5;
      }
      while (a5);
    }
    float v13 = v14;
  }
  fclose(v13);
  return v14 != 0;
}

uint64_t __vfx_script_hearts_graph_3E785FDE_1E85_40AA_A8D6_985C11FFF991(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(unsigned char **)(result + 16) = 1;
  return result;
}

float32x4_t Main_hearts_graph_6CDCF767_47EA_4180_9CAC_F5ACFF8AE4CF(float32x4_t a1, uint64_t a2, uint64_t a3, float32x4_t *a4)
{
  float32x4_t result = vaddq_f32(a1, (float32x4_t)xmmword_1D0820190);
  *a4 = result;
  return result;
}

__n128 __vfx_script_hearts_graph_6CDCF767_47EA_4180_9CAC_F5ACFF8AE4CF(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  __n128 result = (__n128)vaddq_f32(*(float32x4_t *)*(void *)(arguments_buffer_delayInitStub + 16), (float32x4_t)xmmword_1D0820190);
  result.n128_u32[3] = 1.0;
  *(__n128 *)*(void *)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t Init_hearts_graph_B8CFD00B_F83D_48B4_B9F3_B556F2C755C4(double a1, uint64_t a2, int a3, float *a4)
{
  uint64_t result = vfx_script_clock_simulation_index_delayInitStub(a1);
  unsigned int v7 = 277803737
     * (((747796405 * (result + a3) + 553376759) >> (((747796405 * (result + a3) + 553376759) >> 28)
                                                                 + 4)) ^ (747796405 * (result + a3) + 553376759));
  float v8 = -4.0;
  if ((float)(COERCE_FLOAT((v7 >> 31) ^ (v7 >> 9) | 0x3F800000) + -1.0) > 0.5) {
    float v8 = 4.0;
  }
  *a4 = v8;
  a4[1] = v8;
  return result;
}

uint64_t __vfx_script_hearts_graph_B8CFD00B_F83D_48B4_B9F3_B556F2C755C4(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  uint64_t v2 = *(float **)(arguments_buffer_delayInitStub + 16);
  int v3 = **(_DWORD **)(arguments_buffer_delayInitStub + 8);
  uint64_t result = vfx_script_clock_simulation_index_delayInitStub(v4);
  unsigned int v6 = 277803737
     * (((747796405 * (result + v3) + 553376759) >> (((747796405 * (result + v3) + 553376759) >> 28)
                                                                 + 4)) ^ (747796405 * (result + v3) + 553376759));
  float v7 = -4.0;
  if ((float)(COERCE_FLOAT((v6 >> 31) ^ (v6 >> 9) | 0x3F800000) + -1.0) > 0.5) {
    float v7 = 4.0;
  }
  *uint64_t v2 = v7;
  v2[1] = v7;
  return result;
}

float __vfx_script_hearts_graph_06A14A47_3880_4300_8226_188BD75B83F1(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 300.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float __vfx_script_hearts_graph_D45D06FA_D64A_4215_983D_70FBC27B23B0(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 2000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

void Spawn_hearts_graph_B0667801_C60E_4D93_B9A1_27F790726520(const void *a1, unsigned int a2, float a3, int a4, float *a5)
{
  float v5 = a3 * 9.0;
  if (!a4) {
    float v5 = 0.0;
  }
  *a5 = v5;
}

uint64_t __vfx_script_hearts_graph_B0667801_C60E_4D93_B9A1_27F790726520(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float v2 = **(float **)(result + 16) * 9.0;
  if (!**(unsigned char **)(result + 24)) {
    float v2 = 0.0;
  }
  **(float **)(result + 32) = v2;
  return result;
}

void Main_hearts_graph_781609DE_FEF0_4B99_B009_050ADBDF1B32(float32x4_t a1, float a2, uint64_t a3, uint64_t a4, int a5, float32x4_t *a6, float *a7)
{
  float32x4_t v7 = vaddq_f32(a1, (float32x4_t)xmmword_1D08201A0);
  float v8 = a2 + 0.5;
  if (a5) {
    float v8 = 0.0;
  }
  *a6 = v7;
  *a7 = v8;
}

uint64_t __vfx_script_hearts_graph_781609DE_FEF0_4B99_B009_050ADBDF1B32(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float v2 = *(float32x4_t **)(result + 40);
  int v3 = *(float **)(result + 48);
  float32x4_t v4 = vaddq_f32(*(float32x4_t *)*(void *)(result + 16), (float32x4_t)xmmword_1D08201A0);
  float v5 = **(float **)(result + 24) + 0.5;
  if (**(unsigned char **)(result + 32)) {
    float v5 = 0.0;
  }
  *float v2 = v4;
  *int v3 = v5;
  v2->i32[3] = 1065353216;
  return result;
}

double Init_hearts_graph_77839324_3A35_4199_A55E_F65CEF5F32BF(uint64_t a1, uint64_t a2, int a3, float *a4, _OWORD *a5)
{
  float v5 = 0.01;
  if (a3) {
    float v5 = 0.03;
  }
  *a4 = v5;
  a4[1] = v5;
  double result = 0.0;
  *a5 = 0u;
  return result;
}

double __vfx_script_hearts_graph_77839324_3A35_4199_A55E_F65CEF5F32BF(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float v2 = *(float **)(arguments_buffer_delayInitStub + 24);
  int v3 = *(_OWORD **)(arguments_buffer_delayInitStub + 32);
  float v4 = flt_1D081FA50[**(unsigned char **)(arguments_buffer_delayInitStub + 16) == 0];
  *float v2 = v4;
  v2[1] = v4;
  double result = 0.0;
  *int v3 = 0u;
  return result;
}

float Main_hearts_graph_4267197A_7D75_425E_8F36_26328B281570(float32x4_t a1, float a2, uint64_t a3, uint64_t a4, _OWORD *a5, _OWORD *a6, float *a7)
{
  simd_matrix3x3(a1);
  *a5 = v11;
  float result = (float)(fminf(fmaxf(a2, 0.0), 1.0) * 0.5) + 0.5;
  *a6 = xmmword_1D08201B0;
  *a7 = result;
  return result;
}

float __vfx_script_hearts_graph_4267197A_7D75_425E_8F36_26328B281570(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float v2 = *(_OWORD **)(arguments_buffer_delayInitStub + 32);
  int v3 = *(_OWORD **)(arguments_buffer_delayInitStub + 40);
  float v4 = *(float **)(arguments_buffer_delayInitStub + 48);
  float v5 = **(float **)(arguments_buffer_delayInitStub + 24);
  simd_matrix3x3(*(float32x4_t *)*(void *)(arguments_buffer_delayInitStub + 16));
  *float v2 = v6;
  float result = (float)(fminf(fmaxf(v5, 0.0), 1.0) * 0.5) + 0.5;
  *int v3 = xmmword_1D08201B0;
  *float v4 = result;
  return result;
}

double __vfx_script_hearts_graph_6501AA18_D88F_4677_984C_34E780A7C1F0(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  double result = 0.00000133972957;
  *(_OWORD *)*(void *)(arguments_buffer_delayInitStub + 16) = xmmword_1D081FD50;
  return result;
}

float Main_hearts_graph_4E082B7E_A3DB_40F5_9D67_FBFC9824FD2D(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result = (float)((float)(fminf(fmaxf(a3, 0.0), 1.0) * 0.5) + 0.5) * 0.4;
  *a4 = result;
  return result;
}

float __vfx_script_hearts_graph_4E082B7E_A3DB_40F5_9D67_FBFC9824FD2D(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = (float)((float)(fminf(fmaxf(**(float **)(arguments_buffer_delayInitStub + 16), 0.0), 1.0) * 0.5) + 0.5) * 0.4;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t __vfx_script_hearts_graph_27B2C751_CFE3_4369_B337_BEA7A4125BA6(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float v2 = *(void **)(result + 24);
  uint64_t v3 = **(unsigned __int8 **)(result + 16);
  *float v2 = v3;
  v2[1] = v3;
  return result;
}

uint64_t ParticleInit_hearts_particleInit_127(__n128 a1, float32x2_t a2, float a3, uint64_t a4, int a5, unsigned int a6, int a7, char a8, uint64_t a9, __n128 *a10, int8x16_t *a11, _OWORD *a12)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  int8x16_t v32 = *a11;
  v35[0] = xmmword_1D08201C0;
  v35[1] = xmmword_1D08201D0;
  v35[2] = xmmword_1D08201E0;
  v35[3] = xmmword_1D08201F0;
  float v19 = fmodf((float)a6, 2.0);
  uint64_t v20 = 0;
  memset(&v34[2], 0, 32);
  BOOL v22 = a7 == 90 || a7 == 270;
  memset(v34, 0, 32);
  do
  {
    v34[v20] = v35[v20];
    ++v20;
  }
  while (v20 != 4);
  if ((a8 & 1) == 0)
  {
    if (v22) {
      float v19 = v19 + 2.0;
    }
    a1 = (__n128)v34[(unint64_t)v19];
  }
  v23.i32[1] = 1056964608;
  v23.f32[0] = (float)(a3 * 0.6) + 1.0;
  double v31 = COERCE_DOUBLE(vmul_f32(a2, v23));
  int inited = vfx_script_clock_simulation_index_delayInitStub(v31);
  unsigned int v25 = 277803737
      * (((747796405 * (a6 + a5 + inited) + 2107313962) >> (((747796405 * (a6 + a5 + inited) + 2107313962) >> 28) + 4)) ^ (747796405 * (a6 + a5 + inited) + 2107313962));
  *(float *)&double v26 = COERCE_FLOAT((v25 >> 31) ^ (v25 >> 9) | 0x3F800000) + -1.0;
  uint64_t result = vfx_script_texture_sample1d_delayInitStub(v26);
  *a10 = a1;
  *a12 = v28;
  *(double *)v29.i64 = v31;
  v29.i64[1] = vextq_s8(v32, v32, 8uLL).u64[0];
  *a11 = v29;
  return result;
}

uint64_t __vfx_script_hearts_particleInit_127(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

void __vfx_script_hearts_particleInit_17(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t __vfx_script_hearts_particleInit_28(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n128 ParticleInit_hearts_particleInit_130(double a1, uint64_t a2, int a3, uint64_t a4, float32x4_t *a5, _OWORD *a6, _OWORD *a7, __n128 *a8)
{
  LODWORD(a1) = a5->i32[1];
  unsigned int v23 = LODWORD(a1);
  __n128 v24 = *a8;
  int inited = vfx_script_clock_simulation_index_delayInitStub(a1);
  unsigned int v14 = 277803737
      * (((747796405 * (inited + a3) + 381013756) >> (((747796405 * (inited + a3) + 381013756) >> 28)
                                                                  + 4)) ^ (747796405 * (inited + a3) + 381013756));
  *(float *)&unsigned int v22 = (float)((float)(COERCE_FLOAT((v14 >> 31) ^ (v14 >> 9) | 0x3F800000) + -1.0) * 0.02) + -0.01;
  LODWORD(v15) = 0.5;
  vfx_script_texture_sample1d_delayInitStub(v15);
  *a6 = v16;
  *a7 = v16;
  BOOL v17 = (const float *)&dword_1D081FFD8;
  float32x4_t v18 = vld1q_dup_f32(v17);
  v18.i64[0] = __PAIR64__(v23, v22);
  float v19 = (const float *)&dword_1D0820238;
  float32x4_t v20 = vld1q_dup_f32(v19);
  *a5 = v18;
  __n128 result = v24;
  v20.i32[0] = v24.n128_u32[0];
  v20.i32[2] = v24.n128_i32[2];
  *a8 = (__n128)v20;
  return result;
}

uint64_t __vfx_script_hearts_particleInit_130(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n128 ParticleUpdate_hearts_particleUpdate_210(double a1, float32x4_t a2, float32_t a3, float32x4_t a4, uint64_t a5, int a6, unsigned int a7, uint64_t a8, char a9, int a10, float32x4_t *a11, float32x4_t *a12, __n128 *a13)
{
  float v17 = *(float *)&a1;
  vfx_script_texture_sample1d_delayInitStub(a1);
  float32x4_t v21 = a4;
  if ((a9 & 1) == 0) {
    float32x4_t v21 = vmlaq_n_f32(a4, vsubq_f32(vmulq_f32(a4, (float32x4_t)xmmword_1D0820200), a4), v20);
  }
  if (a10 != 90 && a10 != 270) {
    a4 = v21;
  }
  __asm { FMOV            V0.4S, #1.25 }
  _Q0.f32[3] = a3;
  float32x4_t v55 = vmulq_f32(_Q0, a2);
  simd_float4 v53 = _simd_cos_f4((simd_float4)xmmword_1D0820210);
  _Q0 = (float32x4_t)_simd_sin_f4((simd_float4)xmmword_1D0820210);
  _Q7 = v53;
  float v29 = vmuls_lane_f32(v53.f32[1], (float32x4_t)v53, 2);
  float v30 = vmuls_lane_f32(_Q0.f32[1], _Q0, 2);
  _Q3.f32[0] = vmlas_n_f32(-(float)(v53.f32[0] * v30), v29, _Q0.f32[0]);
  simd_float4 v32 = _Q3;
  _Q3.f32[0] = vmuls_lane_f32(v53.f32[0], *(float32x2_t *)_Q0.f32, 1);
  __asm { FMLA            S4, S3, V7.S[2] }
  _Q3.f32[0] = vmuls_lane_f32(_Q7.f32[0], *(float32x2_t *)_Q7.f32, 1);
  __asm { FMLA            S5, S3, V0.S[2] }
  v32.i32[1] = _S4;
  v32.i32[2] = _S5;
  simd_float4 x = v32;
  v53.i32[0] = vmlas_n_f32(v30 * _Q0.f32[0], v29, v53.f32[0]);
  unsigned int v35 = 277803737
      * (((747796405 * (a7 + a6) + 1806824570) >> (((747796405 * (a7 + a6) + 1806824570) >> 28) + 4)) ^ (747796405 * (a7 + a6) + 1806824570));
  _Q0.i32[0] = 0;
  _Q0.f32[1] = (float)((float)((float)((float)((float)((float)((float)(COERCE_FLOAT((v35 >> 31) ^ (v35 >> 9) | 0x3F800000)
                                                                     + -1.0)
                                                             * 0.5)
                                                     + 1.5)
                                             * v17)
                                     + (float)((float)((float)((float)(COERCE_FLOAT((v35 >> 31) ^ (v35 >> 9) | 0x3F800000)
                                                                     + -1.0)
                                                             * 0.5)
                                                     + 1.5)
                                             * v17))
                             - (float)((float)((float)((float)(COERCE_FLOAT((v35 >> 31) ^ (v35 >> 9) | 0x3F800000) + -1.0)
                                                     * 0.5)
                                             + 1.5)
                                     * v17))
                     + (float)a7)
             * 0.5;
  simd_float4 v49 = (simd_float4)_Q0.u64[0];
  simd_float4 v50 = _simd_cos_f4((simd_float4)_Q0.u64[0]);
  _Q0 = (float32x4_t)_simd_sin_f4(v49);
  _Q7 = v50;
  float v38 = vmuls_lane_f32(v50.f32[1], (float32x4_t)v50, 2);
  float v39 = vmuls_lane_f32(_Q0.f32[1], _Q0, 2);
  *(float *)v40.i32 = vmlas_n_f32(-(float)(v50.f32[0] * v39), v38, _Q0.f32[0]);
  _S4 = vmuls_lane_f32(v50.f32[0], *(float32x2_t *)_Q0.f32, 1);
  __asm { FMLA            S5, S4, V7.S[2] }
  _S4 = vmuls_lane_f32(_Q7.f32[0], *(float32x2_t *)_Q7.f32, 1);
  __asm { FMLA            S6, S4, V0.S[2] }
  _Q0.f32[0] = vmlas_n_f32(v39 * _Q0.f32[0], v38, v50.f32[0]);
  v40.i32[1] = _S5;
  v40.i32[2] = _S6;
  int32x4_t v45 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v40, v40), (int8x16_t)v40, 0xCuLL), vnegq_f32((float32x4_t)x)), (float32x4_t)v40, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)x, (int32x4_t)x), (int8x16_t)x, 0xCuLL));
  float32x4_t v46 = vaddq_f32(vmlaq_n_f32(vmulq_n_f32((float32x4_t)x, _Q0.f32[0]), (float32x4_t)v40, v53.f32[0]), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v45, v45), (int8x16_t)v45, 0xCuLL));
  float32x4_t v47 = vmulq_f32((float32x4_t)x, (float32x4_t)v40);
  v46.f32[3] = -(float)(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v47, 2), vaddq_f32(v47, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v47.f32, 1))).f32[0]- (float)(v53.f32[0] * _Q0.f32[0]));
  *a11 = v46;
  *a12 = v55;
  __n128 result = (__n128)a4;
  *a13 = (__n128)a4;
  return result;
}

void __vfx_script_hearts_particleUpdate_210(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_hearts_particleUpdate_95(double a1, float a2, uint64_t a3, uint64_t a4, uint64_t a5, float32x4_t *a6)
{
  vfx_script_texture_sample1d_delayInitStub(a1);
  float32x4_t result = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_1D0820220, v8), fminf(fmaxf(a2, 0.0), 1.0));
  *a6 = result;
  return result;
}

uint64_t __vfx_script_hearts_particleUpdate_95(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t particle_update_hearts_particleUpdate_100(double a1, uint64_t a2, double *a3, _DWORD *a4, float *a5, float *a6)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  vfx_script_clock_delta_time_delayInitStub(a1);
  float v28 = v10;
  uint64_t result = vfx_script_particle_find_nearest_neighbors_delayInitStub(*a3);
  if (result)
  {
    uint64_t v12 = result;
    float v13 = &v29;
    __asm { FMOV            V0.4S, #0.25 }
    float32x4_t v27 = _Q0;
    do
    {
      v13 += 8;
      uint64_t result = vfx_script_particle_get_id_delayInitStub(*(double *)_Q0.i64);
      if (*a4 != result)
      {
        vfx_script_particle_get_size1d_delayInitStub(*(double *)_Q0.i64);
        float v20 = *(float *)&v19;
        uint64_t result = vfx_script_particle_get_position_delayInitStub(v19);
        _Q0 = vsubq_f32(v21, *(float32x4_t *)a3);
        float32x4_t v22 = vmulq_f32(_Q0, _Q0);
        float v23 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).f32[0];
        float v24 = v20 + *a6;
        if (v23 < (float)((float)(v24 * 0.6) * (float)(v24 * 0.6)) && v23 > 1.0e-10)
        {
          float32x2_t v25 = vrsqrte_f32((float32x2_t)LODWORD(v23));
          float32x2_t v26 = vmul_f32(v25, vrsqrts_f32((float32x2_t)LODWORD(v23), vmul_f32(v25, v25)));
          _Q0 = vmulq_n_f32(vmulq_f32(vmulq_n_f32(vmulq_n_f32(_Q0, vmul_f32(v26, vrsqrts_f32((float32x2_t)LODWORD(v23), vmul_f32(v26, v26))).f32[0]), sqrtf(v23) - v24), v27), v28);
          *(float32x4_t *)a3 = vmlaq_n_f32(*(float32x4_t *)a3, _Q0, fminf(*a5 * 10.0, 1.0));
        }
      }
      --v12;
    }
    while (v12);
  }
  return result;
}

uint64_t __vfx_script_hearts_particleUpdate_100(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_hearts_particleUpdate_59(float32x4_t a1, float a2, uint64_t a3, uint64_t a4, float32x4_t *a5)
{
  float32x4_t result = vmulq_n_f32(a1, a2 * 1.25);
  *a5 = result;
  return result;
}

uint64_t __vfx_script_hearts_particleUpdate_59(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n64 simd_matrix3x3(float32x4_t a1)
{
  _Q2 = a1;
  _S3 = a1.i32[1];
  _S4 = a1.i32[2];
  __asm { FMLS            S0, S4, V2.S[2] }
  _S6 = _Q2.i32[3];
  __asm { FMLA            S0, S6, V2.S[3] }
  float v9 = vmlas_n_f32(vmuls_lane_f32(a1.f32[2], _Q2, 3), a1.f32[1], _Q2.f32[0]);
  __asm
  {
    FMLA            S5, S3, V2.S[1]
    FMLA            S5, S6, V2.S[3]
    FMLS            S5, S2, V2.S[0]
    FMLA            S18, S4, V2.S[1]
    FMLA            S6, S4, V2.S[2]
    FMLS            S6, S2, V2.S[0]
    FMLS            S6, S3, V2.S[1]
  }
  result.n64_f32[1] = v9 + v9;
  return result;
}

void sub_1D07DA67C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D07DA898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D07DAC48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

int8x16_t Main_fireworks_graph_10EDDCB9_24C0_4755_971D_D6EC1FAF1000(float32x4_t a1, uint64_t a2, uint64_t a3, int8x16_t *a4)
{
  vfx_script_clock_delta_time_delayInitStub(*(double *)a1.i64);
  float32x4_t v6 = vmulq_n_f32(a1, 1.0 - (float)(v5 + v5));
  v6.i32[3] = 1.0;
  int8x16_t v15 = (int8x16_t)v6;
  if (vfx_script_clock_is_first_frame_delayInitStub(*(double *)v6.i64)) {
    unsigned int v7 = -1;
  }
  else {
    unsigned int v7 = 0;
  }
  __asm { FMOV            V1.4S, #1.0 }
  int8x16_t result = vbslq_s8((int8x16_t)vdupq_n_s32(v7), _Q1, v15);
  *a4 = result;
  return result;
}

float Main_fireworks_graph_155128CD_E118_4113_8D6F_8B7F5BA2555D(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result = a3 * 1.12;
  *a4 = result;
  return result;
}

float Spawn_fireworks_graph_C9C0CC36_AD87_4391_B404_40CBC37682DC(float a1, uint64_t a2, uint64_t a3, void *a4)
{
  float result = a1 * 250.0;
  *a4 = (unint64_t)result;
  a4[1] = (unint64_t)result;
  return result;
}

double Init_fireworks_graph_913AA320_A3AD_4B97_B3CE_288034B4B02B(uint64_t a1, uint64_t a2, void *a3)
{
  double result = 2.23432441e-18;
  *a3 = 0x3C449BA63C09A027;
  return result;
}

void Main_fireworks_graph_5DD07B06_8DCA_42DA_80D9_81BBED0FBF33(const void *a1, unsigned int a2, float a3, float *a4)
{
  *a4 = a3;
}

uint64_t __vfx_script_fireworks_graph_72691A8E_EB30_4566_BC51_64DA827A694A(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(unsigned char **)(result + 16) = 1;
  return result;
}

float __vfx_script_fireworks_graph_4AD865B9_2CA1_4C82_AA72_EC49942DA9DE(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 300.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float __vfx_script_fireworks_graph_DB777B14_A366_4CC8_8010_6DFA3030539E(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 2000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t Spawn_fireworks_graph_CC976411_EC12_4A2C_A577_DD5F08309A69(const void *a1, unsigned int a2, const void *a3, double a4, float a5, float *a6)
{
  *(float *)&a4 = fminf(fmaxf((float)(a5 - *(float *)&a4) / (float)((float)(*(float *)&a4 + 1.0) - *(float *)&a4), 0.0), 1.0);
  uint64_t result = vfx_script_texture_sample1d_delayInitStub(a4);
  *(_DWORD *)a6 = v8;
  return result;
}

double Init_fireworks_graph_9C215676_B35D_4738_8604_1B0696C120C9(uint64_t a1, uint64_t a2, void *a3)
{
  double result = -128.000092;
  *a3 = 0xC0600000C0933333;
  return result;
}

float Spawn_fireworks_graph_1E09F83D_74E8_4C33_AF7B_D1F4C7561C24(float a1, uint64_t a2, uint64_t a3, void *a4)
{
  float result = a1 * 50.0;
  *a4 = (unint64_t)result;
  a4[1] = (unint64_t)result;
  return result;
}

double Init_fireworks_graph_FB239A73_A49B_49A1_B28F_F8EB686AE087(uint64_t a1, uint64_t a2, void *a3, void *a4, int32x4_t *a5)
{
  *a5 = vdupq_n_s32(0x3E19999Au);
  *a3 = 0x40ABAE1540023D71;
  double result = 0.0000119018532;
  *a4 = 0x3EE8F5C23E6C8B44;
  return result;
}

float Spawn_fireworks_graph_E9D5C3AC_14D8_4C9E_A340_8873556A15AC(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result = a3 * 5000.0;
  *a4 = result;
  return result;
}

double Init_fireworks_graph_4F52B7E1_CA7E_4C70_B2C9_199EA88DF652(uint64_t a1, uint64_t a2, void *a3, int32x4_t *a4)
{
  *a4 = vdupq_n_s32(0x3DCCCCCDu);
  double result = 1.71806921e-18;
  *a3 = 0x3C3FB15A3BC2A455;
  return result;
}

float Spawn_fireworks_graph_C96088C0_AF79_4824_9185_0DFF8E90BFB3(float a1, uint64_t a2, uint64_t a3, void *a4)
{
  float result = a1 * 30.0;
  *a4 = (unint64_t)result;
  a4[1] = (unint64_t)result;
  return result;
}

double Init_fireworks_graph_5AC753AC_F888_4AEE_B41F_BA9FA15941CC(uint64_t a1, uint64_t a2, void *a3, void *a4, int32x4_t *a5)
{
  *a5 = vdupq_n_s32(0x3DF5C28Fu);
  *a3 = 0x40E8000040300000;
  double result = 0.00000157165527;
  *a4 = 0x3EBA5E353E3D3C37;
  return result;
}

float Spawn_fireworks_graph_68ABBDD2_799D_4316_B610_A615A6E5C6C0(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result = a3 * 7000.0;
  *a4 = result;
  return result;
}

double Init_fireworks_graph_BE082C18_F014_49F4_AE91_49F0A20CA327(uint64_t a1, uint64_t a2, void *a3, int32x4_t *a4)
{
  *a4 = vdupq_n_s32(0x3CF5C28Fu);
  double result = 1.29236965e-19;
  *a3 = 0x3C03126F3AD844D0;
  return result;
}

float Spawn_fireworks_graph_1F546ADD_0390_45D8_A31D_6FD1CEDB0057(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result = a3 * 10000.0;
  *a4 = result;
  return result;
}

double Init_fireworks_graph_5C6FE0C4_5B31_468F_9708_94003733DEC5(uint64_t a1, uint64_t a2, void *a3, int32x4_t *a4)
{
  *a4 = vdupq_n_s32(0x3D4CCCCDu);
  double result = 1.50053695e-20;
  *a3 = 0x3BD1B7183AAD03DBLL;
  return result;
}

float Spawn_fireworks_graph_32BE36EE_4AAF_45ED_8B70_F204A610CBF9(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result = a3 * 140.0;
  *a4 = result;
  return result;
}

double Init_fireworks_graph_9F0A8F07_3A67_4589_A511_28A794F02526(uint64_t a1, uint64_t a2, void *a3, int32x4_t *a4)
{
  *a4 = vdupq_n_s32(0x3B03126Fu);
  double result = 2.05564881e-20;
  *a3 = 0x3BD844D13BC49BA6;
  return result;
}

float Spawn_fireworks_graph_CECA8E5C_A7BB_4D57_BBA3_E684CB761DA9(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result = a3 * 8000.0;
  *a4 = result;
  return result;
}

double Init_fireworks_graph_3C6ED067_7943_49AD_A0AE_15130042E793(uint64_t a1, uint64_t a2, void *a3, int32x4_t *a4)
{
  *a4 = vdupq_n_s32(0x3D4CCCCDu);
  double result = 3.9690488e-19;
  *a3 = 0x3C1D49523B01C2E4;
  return result;
}

float Spawn_fireworks_graph_EF83050E_3420_4C5E_B29A_63DE74130B60(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result = a3 * 12000.0;
  *a4 = result;
  return result;
}

double Init_fireworks_graph_A5860394_860A_466B_9036_4241BA694F84(uint64_t a1, uint64_t a2, void *a3, int32x4_t *a4)
{
  *a4 = vdupq_n_s32(0x3D4CCCCDu);
  double result = 7.15400071e-19;
  *a3 = 0x3C2A64C33BB78035;
  return result;
}

double Init_fireworks_graph_647D8C58_3A96_4185_83BF_F834C05973E6(float32x4_t a1, uint64_t a2, uint64_t a3, void *a4, int32x4_t *a5, float32x4_t *a6)
{
  *a5 = vdupq_n_s32(0x3DCCCCCDu);
  *a6 = vmulq_f32(a1, (float32x4_t)vdupq_n_s32(0x3F19999Au));
  double result = 0.00000157165527;
  *a4 = 0x3EBA5E353E3D3C37;
  return result;
}

int8x16_t Main_fireworks_graph_A51B6B76_047A_469C_B965_C43FB2E4CAC7(float32x4_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, int8x16_t *a5)
{
  vfx_script_clock_delta_time_delayInitStub(*(double *)a1.i64);
  int8x16_t v16 = (int8x16_t)vmulq_n_f32(a1, 1.0 - v7);
  if (vfx_script_clock_is_first_frame_delayInitStub(*(double *)v16.i64)) {
    unsigned int v8 = -1;
  }
  else {
    unsigned int v8 = 0;
  }
  __asm { FMOV            V1.4S, #1.0 }
  int8x16_t result = vbslq_s8((int8x16_t)vdupq_n_s32(v8), _Q1, v16);
  *a4 = xmmword_1D081FD50;
  *a5 = result;
  return result;
}

int8x16_t __vfx_script_fireworks_graph_A51B6B76_047A_469C_B965_C43FB2E4CAC7(double a1)
{
  uint64_t arguments_buffer_delayInitStub = (void *)vfx_script_get_arguments_buffer_delayInitStub(a1);
  float v2 = (_OWORD *)arguments_buffer_delayInitStub[3];
  uint64_t v3 = (int8x16_t *)arguments_buffer_delayInitStub[4];
  float32x4_t v12 = *(float32x4_t *)arguments_buffer_delayInitStub[2];
  vfx_script_clock_delta_time_delayInitStub(*(double *)v12.i64);
  int8x16_t v13 = (int8x16_t)vmulq_n_f32(v12, 1.0 - v4);
  if (vfx_script_clock_is_first_frame_delayInitStub(*(double *)v13.i64)) {
    unsigned int v5 = -1;
  }
  else {
    unsigned int v5 = 0;
  }
  __asm { FMOV            V1.4S, #1.0 }
  int8x16_t result = vbslq_s8((int8x16_t)vdupq_n_s32(v5), _Q1, v13);
  *float v2 = xmmword_1D081FD50;
  *uint64_t v3 = result;
  return result;
}

float Main_fireworks_graph_5AFE93DC_23D2_46C1_93C9_29F6F7292984(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result = a3 * 0.8;
  *a4 = result;
  return result;
}

uint64_t __vfx_script_fireworks_particleInit_182(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleInit_fireworks_particleInit_217(float a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, _OWORD *a6, float32x4_t *a7, float32x4_t *a8)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v22[0] = xmmword_1D0820370;
  v22[1] = xmmword_1D0820380;
  v22[2] = xmmword_1D0820390;
  v22[3] = xmmword_1D08203A0;
  v22[4] = xmmword_1D08203B0;
  v22[5] = xmmword_1D08203C0;
  unint64_t v11 = (unint64_t)fmodf((float)(unint64_t)(a4 + a5), 6.0);
  float32x4_t v12 = (float32x4_t)v22[v11];
  v21[0] = xmmword_1D08203D0;
  v21[1] = xmmword_1D08203E0;
  v21[2] = xmmword_1D08203F0;
  v21[3] = xmmword_1D0820400;
  v21[4] = xmmword_1D0820410;
  v21[5] = xmmword_1D0820420;
  float32x4_t result = vmulq_n_f32(v12, a1);
  float32x4_t v14 = vmulq_n_f32((float32x4_t)v21[v11], a1);
  __asm { FMOV            V2.4S, #1.0 }
  *a6 = _Q2;
  *a7 = result;
  *a8 = v14;
  return result;
}

__n128 __vfx_script_fireworks_particleInit_217(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
  return result;
}

__n128 ParticleInit_fireworks_particleInit_140(uint64_t a1, uint64_t a2, __n128 *a3)
{
  __asm { FMOV            V0.4S, #1.0 }
  *a3 = result;
  return result;
}

void __vfx_script_fireworks_particleInit_140(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float ParticleInit_fireworks_particleInit_219(uint64_t a1, int a2, int a3, double *a4)
{
  long long v11 = *(_OWORD *)a4;
  int inited = vfx_script_clock_simulation_index_delayInitStub(*a4);
  unsigned int v8 = 277803737
     * (((747796405 * (a3 + a2 + inited) + 572824890) >> (((747796405 * (a3 + a2 + inited)
                                                                                      + 572824890) >> 28)
                                                                      + 4)) ^ (747796405 * (a3 + a2 + inited) + 572824890));
  float result = COERCE_FLOAT((v8 >> 31) ^ (v8 >> 9) | 0x3F800000) + -1.0;
  long long v10 = v11;
  *((float *)&v10 + 3) = result;
  *(_OWORD *)a4 = v10;
  return result;
}

uint64_t __vfx_script_fireworks_particleInit_219(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

void __vfx_script_fireworks_particleInit_189(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t ParticleInit_fireworks_particleInit_118(float a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, float32x4_t *a7, long long *a8, float *a9)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v28 = *a8;
  v30[0] = xmmword_1D0820430;
  v30[1] = xmmword_1D0820440;
  v30[2] = xmmword_1D0820450;
  v30[3] = xmmword_1D0820460;
  v30[4] = xmmword_1D0820470;
  v30[5] = xmmword_1D0820480;
  float32x4_t v14 = (float32x4_t)v30[(unint64_t)fmodf((float)(unint64_t)(a4 + a5), 2.0)];
  float32x4_t v15 = vsubq_f32((float32x4_t)vdupq_n_s32(0x3F333333u), v14);
  float32x4_t v26 = vmlaq_f32(v14, (float32x4_t)vdupq_n_s32(0x3E4CCCCDu), v15);
  int inited = vfx_script_clock_simulation_index_delayInitStub(*(double *)v15.i64);
  int v17 = a5 + a3;
  unsigned int v18 = 277803737
      * (((747796405 * (v17 + inited) - 2054186593) >> (((747796405 * (v17 + inited)
                                                                                    - 2054186593) >> 28)
                                                                    + 4)) ^ (747796405 * (v17 + inited) - 2054186593));
  float32x4_t v27 = vmulq_n_f32(v26, (float)((float)(COERCE_FLOAT((v18 >> 31) ^ (v18 >> 9) | 0x3F800000) + -1.0) * 0.3) + 0.7);
  int v19 = vfx_script_clock_simulation_index_delayInitStub(*(double *)v27.i64);
  unsigned int v20 = 277803737
      * (((747796405 * (v17 + v19) - 539145652) >> (((747796405 * (v17 + v19) - 539145652) >> 28)
                                                                + 4)) ^ (747796405 * (v17 + v19) - 539145652));
  *(float *)&double v21 = COERCE_FLOAT((v20 >> 31) ^ (v20 >> 9) | 0x3F800000) + -1.0;
  unsigned int v25 = LODWORD(v21);
  uint64_t result = vfx_script_texture_sample1d_delayInitStub(v21);
  *a7 = v27;
  *a9 = (float)(fminf(fmaxf(v23, 0.0), 1.0) * 4.0) + 1.0;
  *(void *)&long long v24 = __PAIR64__(v25, LODWORD(a1));
  *((void *)&v24 + 1) = *((void *)&v28 + 1);
  *a8 = v24;
  return result;
}

uint64_t __vfx_script_fireworks_particleInit_118(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t __vfx_script_fireworks_particleInit_264(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t ParticleInit_fireworks_particleInit_54(float32x4_t a1, uint64_t a2, int a3, uint64_t a4, int a5, float32x4_t *a6)
{
  float32x4_t v20 = vmulq_f32(vmulq_f32(a1, (float32x4_t)vdupq_n_s32(0x3ECCCCCDu)), (float32x4_t)xmmword_1D0820490);
  vfx_script_color_ramp_create_setting_color_delayInitStub(*(double *)v20.i64);
  vfx_script_color_ramp_create_setting_color_delayInitStub(*(double *)vmulq_f32(v20, (float32x4_t)xmmword_1D08204A0).i64);
  int inited = vfx_script_clock_simulation_index_delayInitStub(v9);
  int v11 = a5 + a3;
  unsigned int v12 = 277803737
      * (((747796405 * (v11 + inited) + 1398413819) >> (((747796405 * (v11 + inited)
                                                                                    + 1398413819) >> 28)
                                                                    + 4)) ^ (747796405 * (v11 + inited) + 1398413819));
  *(float *)&double v13 = COERCE_FLOAT((v12 >> 31) ^ (v12 >> 9) | 0x3F800000) + -1.0;
  vfx_script_color_ramp_evaluate_delayInitStub(v13);
  float32x4_t v21 = v14;
  int v15 = vfx_script_clock_simulation_index_delayInitStub(*(double *)v14.i64);
  unsigned int v16 = 277803737
      * (((747796405 * (v11 + v15) + 94632143) >> (((747796405 * (v11 + v15) + 94632143) >> 28)
                                                               + 4)) ^ (747796405 * (v11 + v15) + 94632143));
  float32x4_t v17 = vmulq_n_f32(v21, (float)((float)(COERCE_FLOAT((v16 >> 31) ^ (v16 >> 9) | 0x3F800000) + -1.0) * 0.015) + 0.055);
  *a6 = v17;
  vfx_script_color_ramp_destroy_delayInitStub(*(double *)v17.i64);

  return vfx_script_color_ramp_destroy_delayInitStub(v18);
}

uint64_t __vfx_script_fireworks_particleInit_54(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t ParticleInit_fireworks_particleInit_235(float32x4_t a1, float32x4_t a2, float32x4_t a3, uint64_t a4, int a5, int a6, uint64_t a7, float32x4_t *a8, float32x4_t *a9)
{
  float32x4_t v13 = vsubq_f32(a1, a2);
  float32x4_t v14 = vmulq_f32(v13, v13);
  v14.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1))).u64[0];
  float32x4_t v15 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 0);
  v15.i32[3] = 0;
  float32x4_t v16 = vrsqrteq_f32(v15);
  float32x4_t v17 = vmulq_f32(v16, vrsqrtsq_f32(v15, vmulq_f32(v16, v16)));
  int8x16_t v18 = (int8x16_t)vmulq_f32(v17, vrsqrtsq_f32(v15, vmulq_f32(v17, v17)));
  int32x4_t v19 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v14.f32[0] != 0.0)), 0x1FuLL));
  v19.i32[3] = 0;
  __asm { FMOV            V3.4S, #1.0 }
  float32x4_t v41 = vmulq_f32(v13, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v19), v18, _Q3));
  int inited = vfx_script_clock_simulation_index_delayInitStub(*(double *)v41.i64);
  int v26 = a6 + a5;
  unsigned int v27 = 277803737
      * (((747796405 * (v26 + inited) - 883871658) >> (((747796405 * (v26 + inited)
                                                                                   - 883871658) >> 28)
                                                                   + 4)) ^ (747796405 * (v26 + inited) - 883871658));
  float32x4_t v42 = vmulq_n_f32(v41, (float)(fminf(fmaxf(COERCE_FLOAT((v27 >> 31) ^ (v27 >> 9) | 0x3F800000) + -1.0, 0.0), 1.0) * 0.4) + 0.8);
  float32x4_t v39 = vmulq_f32(vmulq_f32(a3, (float32x4_t)vdupq_n_s32(0x3ECCCCCDu)), (float32x4_t)xmmword_1D0820490);
  vfx_script_color_ramp_create_setting_color_delayInitStub(*(double *)v39.i64);
  vfx_script_color_ramp_create_setting_color_delayInitStub(*(double *)vmulq_f32(v39, (float32x4_t)xmmword_1D08204A0).i64);
  int v29 = vfx_script_clock_simulation_index_delayInitStub(v28);
  unsigned int v30 = 277803737
      * (((747796405 * (v26 + v29) + 1398413819) >> (((747796405 * (v26 + v29) + 1398413819) >> 28)
                                                                 + 4)) ^ (747796405 * (v26 + v29) + 1398413819));
  *(float *)&double v31 = COERCE_FLOAT((v30 >> 31) ^ (v30 >> 9) | 0x3F800000) + -1.0;
  vfx_script_color_ramp_evaluate_delayInitStub(v31);
  float32x4_t v40 = v32;
  int v33 = vfx_script_clock_simulation_index_delayInitStub(*(double *)v32.i64);
  unsigned int v34 = 277803737
      * (((747796405 * (v26 + v33) + 94632143) >> (((747796405 * (v26 + v33) + 94632143) >> 28)
                                                               + 4)) ^ (747796405 * (v26 + v33) + 94632143));
  float32x4_t v35 = vmulq_n_f32(v40, (float)((float)(COERCE_FLOAT((v34 >> 31) ^ (v34 >> 9) | 0x3F800000) + -1.0) * 0.07) + 0.1);
  *a8 = v42;
  *a9 = v35;
  vfx_script_color_ramp_destroy_delayInitStub(*(double *)v35.i64);

  return vfx_script_color_ramp_destroy_delayInitStub(v36);
}

uint64_t __vfx_script_fireworks_particleInit_235(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleInit_fireworks_particleInit_169(float32x4_t a1, uint64_t a2, uint64_t a3, float32x4_t *a4)
{
  __asm { FMOV            V1.4S, #-1.0 }
  float32x4_t v9 = vaddq_f32(a1, _Q1);
  float32x4_t v10 = (float32x4_t)vdupq_n_s32(0x3ECCCCCDu);
  __asm { FMOV            V2.4S, #1.0 }
  float32x4_t result = vmulq_f32(vmlaq_f32(_Q2, v10, v9), v10);
  *a4 = result;
  return result;
}

uint64_t __vfx_script_fireworks_particleInit_169(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

void ParticleInit_fireworks_particleInit_8(__n128 a1, uint64_t a2, uint64_t a3, __n128 *a4)
{
  *a4 = a1;
}

__n128 __vfx_script_fireworks_particleInit_8(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
  return result;
}

uint64_t __vfx_script_fireworks_particleInit_86(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleInit_fireworks_particleInit_14(float32x4_t a1, float32x4_t a2, uint64_t a3, int a4, int a5, uint64_t a6, float32x4_t *a7, float32x4_t *a8)
{
  float32x4_t v12 = vmulq_f32(a1, a1);
  v12.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), vaddq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 1))).u64[0];
  float32x4_t v13 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 0);
  v13.i32[3] = 0;
  float32x4_t v14 = vrsqrteq_f32(v13);
  float32x4_t v15 = vmulq_f32(v14, vrsqrtsq_f32(v13, vmulq_f32(v14, v14)));
  int8x16_t v16 = (int8x16_t)vmulq_f32(v15, vrsqrtsq_f32(v13, vmulq_f32(v15, v15)));
  int32x4_t v17 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v12.f32[0] != 0.0)), 0x1FuLL));
  v17.i32[3] = 0;
  __asm { FMOV            V3.4S, #1.0 }
  float32x4_t v31 = vmulq_f32((float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v17), v16, _Q3), a1);
  int inited = vfx_script_clock_simulation_index_delayInitStub(*(double *)v31.i64);
  int v24 = a5 + a4;
  unsigned int v25 = 277803737
      * (((747796405 * (v24 + inited) - 883871658) >> (((747796405 * (v24 + inited)
                                                                                   - 883871658) >> 28)
                                                                   + 4)) ^ (747796405 * (v24 + inited) - 883871658));
  float32x4_t v32 = vmulq_n_f32(v31, (float)((float)(COERCE_FLOAT((v25 >> 31) ^ (v25 >> 9) | 0x3F800000) + -1.0) + 0.5) * 0.7);
  float32x4_t v34 = vmulq_f32(a2, (float32x4_t)vdupq_n_s32(0x3F19999Au));
  int v26 = vfx_script_clock_simulation_index_delayInitStub(*(double *)v34.i64);
  unsigned int v27 = 277803737
      * (((747796405 * (v24 + v26) - 1095130923) >> (((747796405 * (v24 + v26) - 1095130923) >> 28)
                                                                 + 4)) ^ (747796405 * (v24 + v26) - 1095130923));
  *(float *)&double v28 = COERCE_FLOAT((v27 >> 31) ^ (v27 >> 9) | 0x3F800000) + -1.0;
  vfx_script_texture_sample1d_delayInitStub(v28);
  float32x4_t result = vmulq_f32(v34, v29);
  *a7 = v32;
  *a8 = result;
  return result;
}

uint64_t __vfx_script_fireworks_particleInit_14(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t __vfx_script_fireworks_particleUpdate_39(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_fireworks_particleUpdate_273(float32x4_t a1, float a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, float32x4_t *a7)
{
  float32x4_t v11 = a1;
  a1.f32[0] = a1.f32[3] + a2;
  vfx_script_texture_sample1d_delayInitStub(*(double *)a1.i64);
  float32x4_t result = vmulq_n_f32(vmulq_n_f32(v11, v9), fminf(fmaxf(a3, 0.0), 1.0));
  *a7 = result;
  return result;
}

uint64_t __vfx_script_fireworks_particleUpdate_273(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n128 ParticleUpdate_fireworks_particleUpdate_73(float32x4_t a1, float a2, double a3, float a4, float a5, uint64_t a6, uint64_t a7, uint64_t a8, float *a9, float *a10, float32x4_t *a11, long long *a12)
{
  long long v30 = *a12;
  float32x4_t v18 = vmulq_f32(a1, (float32x4_t)xmmword_1D08204B0);
  v18.f32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2), vaddq_f32(v18, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 1))).f32[0];
  float v19 = fminf(fmaxf(v18.f32[0] / 1.1, 0.0), 1.0) + 0.0;
  float v20 = (float)(fminf(fmaxf(v18.f32[0] / 1.5, 0.0), 1.0) * -0.5) + 1.5;
  float v21 = fminf(fmaxf((float)(a5 + -0.3) / 0.7, 0.0), 1.0);
  *(float *)&double v22 = fmodf((float)(v21 * 1.2) + 0.0, 1.0);
  float v28 = fminf(fmaxf(a4, 0.0), 1.0);
  vfx_script_texture_sample1d_delayInitStub(v22);
  float v24 = fmaxf(v23, 0.0);
  float v25 = 3.0;
  if (v21 <= 0.0) {
    float v25 = 0.0;
  }
  *a9 = 1.0 - v19;
  *a10 = (float)(v20 * *(float *)&a3) * a2;
  *a11 = vmulq_f32(vmulq_n_f32(vmulq_n_f32(a1, (float)(vmuls_lane_f32(v25, *(float32x2_t *)&a3, 1) + 1.0) * v24), v28), (float32x4_t)vdupq_n_s32(0x3F333333u));
  long long v26 = v30;
  DWORD2(v26) = 0;
  *a12 = v26;
  result.n128_u64[0] = v26;
  result.n128_u32[2] = DWORD2(v26);
  return result;
}

uint64_t __vfx_script_fireworks_particleUpdate_73(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t __vfx_script_fireworks_particleUpdate_143(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_fireworks_particleUpdate_52(float32x4_t a1, float32_t a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, float32x4_t *a7)
{
  float32x4_t v11 = a1;
  a1.f32[0] = a2;
  vfx_script_texture_sample1d_delayInitStub(*(double *)a1.i64);
  float32x4_t result = vmulq_n_f32(vmulq_f32(v9, v11), fminf(fmaxf(a3, 0.0), 1.0));
  *a7 = result;
  return result;
}

uint64_t __vfx_script_fireworks_particleUpdate_52(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_fireworks_particleUpdate_22(float32x4_t a1, float32_t a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, float32x4_t *a7)
{
  float32x4_t v11 = a1;
  a1.f32[0] = a2;
  vfx_script_texture_sample1d_delayInitStub(*(double *)a1.i64);
  float32x4_t result = vmulq_n_f32(vmulq_f32(vmulq_f32(v9, (float32x4_t)vdupq_n_s32(0x3F333333u)), v11), fminf(fmaxf(a3, 0.0), 1.0));
  *a7 = result;
  return result;
}

uint64_t __vfx_script_fireworks_particleUpdate_22(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_fireworks_particleUpdate_142(float32x4_t a1, float a2, float a3, uint64_t a4, int a5, int a6, uint64_t a7, float32x4_t *a8)
{
  int inited = vfx_script_clock_simulation_index_delayInitStub(*(double *)a1.i64);
  unsigned int v15 = 277803737
      * (((747796405 * (a6 + a5 + inited) + 208650753) >> (((747796405 * (a6 + a5 + inited)
                                                                                       + 208650753) >> 28)
                                                                       + 4)) ^ (747796405 * (a6 + a5 + inited)
                                                                              + 208650753));
  if ((float)(COERCE_FLOAT((v15 >> 31) ^ (v15 >> 9) | 0x3F800000) + -1.0) <= 0.5) {
    float v16 = 0.0;
  }
  else {
    float v16 = 1.0;
  }
  *(float *)&double v14 = a2;
  vfx_script_texture_sample1d_delayInitStub(v14);
  float32x4_t result = vmulq_n_f32(vmulq_n_f32(a1, fminf(v17 + v16, 1.0)), fminf(fmaxf(a3, 0.0), 1.0));
  *a8 = result;
  return result;
}

uint64_t __vfx_script_fireworks_particleUpdate_142(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_fireworks_particleUpdate_257(float32x4_t a1, float a2, float a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, float32x4_t *a9)
{
  float32x4_t v26 = a1;
  a1.f32[0] = a2;
  vfx_script_texture_sample1d_delayInitStub(*(double *)a1.i64);
  __asm { FMOV            V1.4S, #1.0 }
  float32x4_t v27 = vmlaq_n_f32(v26, vsubq_f32(_Q1, v26), *(float *)&v19);
  int inited = vfx_script_clock_simulation_index_delayInitStub(v19);
  unsigned int v22 = 277803737
      * (((747796405 * (a7 + a5 + inited) + 208650753) >> (((747796405 * (a7 + a5 + inited)
                                                                                       + 208650753) >> 28)
                                                                       + 4)) ^ (747796405 * (a7 + a5 + inited)
                                                                              + 208650753));
  if ((float)(COERCE_FLOAT((v22 >> 31) ^ (v22 >> 9) | 0x3F800000) + -1.0) <= 0.5) {
    float v23 = 0.0;
  }
  else {
    float v23 = 1.0;
  }
  *(float *)&double v21 = a2;
  vfx_script_texture_sample1d_delayInitStub(v21);
  float32x4_t result = vmulq_n_f32(vmulq_n_f32(v27, fminf(v24 + v23, 1.0)), fminf(fmaxf(a3, 0.0), 1.0));
  *a9 = result;
  return result;
}

uint64_t __vfx_script_fireworks_particleUpdate_257(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t __vfx_script_fireworks_particleUpdate_322(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t __vfx_script_fireworks_particleUpdate_223(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t particle_update_fireworks_particleUpdate_85(uint64_t a1, __int32 *a2, float32x4_t *a3, __int32 *a4, float32x4_t *a5)
{
  result.i32[0] = *a2;
  if (*(float *)a2 > 0.0)
  {
    result.i32[0] = *a4;
    if (*(float *)a4 > 0.0)
    {
      v6.i64[0] = 0x3F0000003F000000;
      v6.i64[1] = 0x3F0000003F000000;
      __asm { FMOV            V1.4S, #1.0 }
      float32x4_t result = vminnmq_f32(vmlaq_f32(*a5, v6, *a3), _Q1);
      *a5 = result;
      *a4 = 0;
    }
  }
  return result;
}

uint64_t __vfx_script_fireworks_particleUpdate_85(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t particle_update_fireworks_particleUpdate_238(uint64_t a1, __int32 *a2, __int32 *a3, float32x4_t *a4)
{
  result.i32[0] = *a2;
  if (*(float *)a2 > 0.0)
  {
    result.i32[0] = *a3;
    if (*(float *)a3 > 0.0)
    {
      __asm { FMOV            V1.4S, #1.0 }
      float32x4_t result = vminnmq_f32(vaddq_f32(*a4, (float32x4_t)vdupq_n_s32(0x3F19999Au)), _Q1);
      *a4 = result;
      *a3 = 0;
    }
  }
  return result;
}

uint64_t __vfx_script_fireworks_particleUpdate_238(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

double __vfx_script_confetti_graph_6501AA18_D88F_4677_984C_34E780A7C1F0(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  double result = 0.00000133972957;
  *(_OWORD *)*(void *)(arguments_buffer_delayInitStub + 16) = xmmword_1D081FD50;
  return result;
}

void Spawn_confetti_graph_B0667801_C60E_4D93_B9A1_27F790726520(float a1, float a2, float a3, uint64_t a4, uint64_t a5, int a6, int a7, unint64_t *a8, unint64_t *a9)
{
  float v9 = a1 * 150.0;
  BOOL v10 = fabsf(a3) <= 0.00000011921;
  float v11 = a2 / a3;
  float v12 = 0.0;
  if (v10) {
    float v11 = 0.0;
  }
  float v13 = v9 * v11;
  if (a6) {
    float v12 = 1.0;
  }
  unint64_t v14 = (unint64_t)(float)(v13 + (float)((float)((float)(v13 * 0.5) - v13) * v12));
  if (!a7) {
    unint64_t v14 = 0;
  }
  *a8 = v14;
  a8[1] = v14;
  *a9 = v14;
  a9[1] = v14;
}

float Init_confetti_graph_77839324_3A35_4199_A55E_F65CEF5F32BF(uint64_t a1, uint64_t a2, int a3, float *a4)
{
  if (a3 == 270 || a3 == 90) {
    unsigned int v5 = -1;
  }
  else {
    unsigned int v5 = 0;
  }
  int8x8_t v6 = vbsl_s8((int8x8_t)vdup_n_s32(v5), (int8x8_t)0x4080000040600000, (int8x8_t)0x4060000040400000);
  float v7 = fminf(*(float *)v6.i32, *(float *)&v6.i32[1]);
  float result = fmaxf(*(float *)v6.i32, *(float *)&v6.i32[1]);
  *a4 = v7;
  a4[1] = result;
  return result;
}

uint64_t __vfx_script_confetti_graph_9855979D_D680_4AC7_999F_4BD84B083C71(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(unsigned char **)(result + 16) = 1;
  return result;
}

void Spawn_confetti_graph_A9645361_1E28_4A66_8CE1_0FBB358E68C4(float a1, float a2, float a3, uint64_t a4, uint64_t a5, int a6, int a7, unint64_t *a8, unint64_t *a9)
{
  float v9 = a2 * 0.5;
  BOOL v10 = fabsf(v9) <= 0.00000011921;
  float v11 = (float)(v9 - a3) / v9;
  if (v10) {
    float v11 = 0.0;
  }
  float v12 = (float)(a1 * 10.0) * v11;
  float v13 = 1.0;
  if (!a6) {
    float v13 = 0.0;
  }
  unint64_t v14 = (unint64_t)(float)((float)(v12 * v13) + 0.0);
  if (!a7) {
    unint64_t v14 = 0;
  }
  *a8 = v14;
  a8[1] = v14;
  *a9 = v14;
  a9[1] = v14;
}

float32x4_t Main_confetti_graph_C7F30F02_BA8A_4DBA_8AB9_BEAFDE59A291(float32x4_t a1, float a2, float a3, uint64_t a4, uint64_t a5, float32x4_t *a6)
{
  *(float *)&unsigned int v6 = a2 * 0.5;
  *(float *)&unsigned int v7 = (float)(*(float *)&v6 - a3) * 0.5;
  v8.i64[0] = 0;
  v8.i64[1] = v6;
  v9.i64[0] = 0;
  v9.i64[1] = v7;
  float32x4_t result = vsubq_f32(vaddq_f32(a1, v8), v9);
  *a6 = result;
  return result;
}

void Spawn_confetti_graph_16E7F806_2D73_4A39_B82C_90F26336105A(float a1, float a2, float a3, uint64_t a4, uint64_t a5, int a6, int a7, unint64_t *a8, unint64_t *a9)
{
  BOOL v9 = fabsf(a2) <= 0.00000011921;
  float v10 = (float)(a2 - a3) / a2;
  if (v9) {
    float v10 = 0.0;
  }
  float v11 = (float)(a1 * 30.0) * v10;
  float v12 = 1.0;
  if (!a6) {
    float v12 = 0.0;
  }
  unint64_t v13 = (unint64_t)(float)((float)(v11 * v12) + 0.0);
  if (!a7) {
    unint64_t v13 = 0;
  }
  *a8 = v13;
  a8[1] = v13;
  *a9 = v13;
  a9[1] = v13;
}

float32x4_t Main_confetti_graph_47AC3C7A_C039_41DA_AD43_881D7E0F565A(float32x4_t a1, float a2, float a3, uint64_t a4, uint64_t a5, float32x4_t *a6)
{
  v6.i64[0] = 0;
  v7.i64[0] = 0;
  v7.i32[3] = 0;
  v7.f32[2] = -a2;
  v6.i64[1] = COERCE_UNSIGNED_INT((float)(a2 - a3) * 0.5);
  float32x4_t result = vaddq_f32(vaddq_f32(vaddq_f32(a1, v7), v6), (float32x4_t)xmmword_1D08405A0);
  *a6 = result;
  return result;
}

float Init_confetti_graph_586EC683_ECAC_48E9_B645_74C36BE0B254(uint64_t a1, uint64_t a2, int a3, float *a4)
{
  if (a3 == 270 || a3 == 90) {
    unsigned int v5 = -1;
  }
  else {
    unsigned int v5 = 0;
  }
  int8x8_t v6 = vbsl_s8((int8x8_t)vdup_n_s32(v5), (int8x8_t)0x40A0000040900000, (int8x8_t)0x4080000040600000);
  float v7 = fminf(*(float *)v6.i32, *(float *)&v6.i32[1]);
  float result = fmaxf(*(float *)v6.i32, *(float *)&v6.i32[1]);
  *a4 = v7;
  a4[1] = result;
  return result;
}

float __vfx_script_confetti_graph_D45D06FA_D64A_4215_983D_70FBC27B23B0(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 2000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float __vfx_script_confetti_graph_06A14A47_3880_4300_8226_188BD75B83F1(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  float result = **(float **)(arguments_buffer_delayInitStub + 16) * 300.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t ParticleInit_confetti_particleInit_113(double a1, float32x4_t a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, int a8, uint64_t a9, float32x4_t *a10, _OWORD *a11, _OWORD *a12)
{
  float v15 = 0.0;
  if (a5) {
    float v15 = 1.0;
  }
  *(float *)&a1 = (float)(*(float *)&a1 + (float)((float)(a2.f32[0] - *(float *)&a1) * v15))
                + (float)(*(float *)&a1 + (float)((float)(a2.f32[0] - *(float *)&a1) * v15));
  a2.i64[0] = COERCE_UNSIGNED_INT(1.0) | 0x3E4CCCCD00000000;
  a2.i32[2] = LODWORD(a1);
  float32x4_t v40 = a2;
  __int32 v16 = 747796405 * (vfx_script_clock_simulation_index_delayInitStub(a1) + a4) - 1901271721;
  v17.i32[0] = v16;
  v17.i32[1] = 747796405 * v16 - 1403630843;
  uint32x2_t v18 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32(v17, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32(v17, 0x1CuLL))), (int8x8_t)v17), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v23 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v18, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v18, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  *(float32x2_t *)v25.f32 = vadd_f32(v23, _D1);
  unsigned int v26 = 277803737
      * (((747796405 * (747796405 * v16 - 1403630843) - 1403630843) >> (((747796405 * (747796405 * v16 - 1403630843) - 1403630843) >> 28)
                                                                                    + 4)) ^ (747796405
                                                                                           * (747796405 * v16
                                                                                            - 1403630843)
                                                                                           - 1403630843));
  v25.f32[2] = COERCE_FLOAT((v26 >> 31) ^ (v26 >> 9) | 0x3F800000) + -1.0;
  v27.i64[0] = 0xBF000000BF000000;
  v27.i64[1] = 0xBF000000BF000000;
  float32x4_t v28 = vmulq_f32(v40, vaddq_f32(v25, v27));
  float v29 = v28.f32[1];
  if (a6 == 270 || a6 == 90) {
    float v29 = v28.f32[1] + 0.05;
  }
  float32x4_t v31 = v28;
  v31.f32[1] = v29;
  v31.i32[2] = v28.i32[2];
  float32x4_t v41 = v31;
  int inited = vfx_script_clock_simulation_index_delayInitStub(*(double *)v28.i64);
  unsigned int v33 = 277803737
      * (((747796405 * (a8 + a4 + inited) + 2107313962) >> (((747796405 * (a8 + a4 + inited)
                                                                                        + 2107313962) >> 28)
                                                                        + 4)) ^ (747796405 * (a8 + a4 + inited)
                                                                               + 2107313962));
  float v34 = COERCE_FLOAT((v33 >> 31) ^ (v33 >> 9) | 0x3F800000) + -1.0;
  *(float *)&double v35 = v34;
  vfx_script_texture_sample1d_delayInitStub(v35);
  long long v39 = v36;
  *(float *)&long long v36 = v34;
  uint64_t result = vfx_script_texture_sample1d_delayInitStub(*(double *)&v36);
  *a10 = v41;
  *a11 = v39;
  *a12 = v38;
  return result;
}

uint64_t __vfx_script_confetti_particleInit_113(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

void __vfx_script_confetti_particleInit_29(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float ParticleInit_confetti_particleInit_172(double a1, float32x4_t a2, uint64_t a3, int a4, int a5, uint64_t a6, int a7, uint64_t a8, float32x4_t *a9, _OWORD *a10, _OWORD *a11, long long *a12)
{
  long long v40 = *a12;
  *(float *)&a1 = (float)((float)((float)(*(float *)&a1 * 0.5) - a2.f32[0]) * 0.5)
                + (float)((float)((float)(*(float *)&a1 * 0.5) - a2.f32[0]) * 0.5);
  a2.i64[0] = COERCE_UNSIGNED_INT(1.0) | 0x3E4CCCCD00000000;
  a2.i32[2] = LODWORD(a1);
  float32x4_t v43 = a2;
  __int32 v15 = 747796405 * (vfx_script_clock_simulation_index_delayInitStub(a1) + a4) - 1901271721;
  v16.i32[0] = v15;
  v16.i32[1] = 747796405 * v15 - 1403630843;
  uint32x2_t v17 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32(v16, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32(v16, 0x1CuLL))), (int8x8_t)v16), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v22 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v17, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v17, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  *(float32x2_t *)v24.f32 = vadd_f32(v22, _D1);
  unsigned int v25 = 277803737
      * (((747796405 * (747796405 * v15 - 1403630843) - 1403630843) >> (((747796405 * (747796405 * v15 - 1403630843) - 1403630843) >> 28)
                                                                                    + 4)) ^ (747796405
                                                                                           * (747796405 * v15
                                                                                            - 1403630843)
                                                                                           - 1403630843));
  v24.f32[2] = COERCE_FLOAT((v25 >> 31) ^ (v25 >> 9) | 0x3F800000) + -1.0;
  v26.i64[0] = 0xBF000000BF000000;
  v26.i64[1] = 0xBF000000BF000000;
  float32x4_t v27 = vmulq_f32(v43, vaddq_f32(v24, v26));
  float v28 = v27.f32[1];
  if (a5 == 270 || a5 == 90) {
    float v28 = v27.f32[1] + 0.01;
  }
  float32x4_t v30 = v27;
  v30.f32[1] = v28;
  v30.i32[2] = v27.i32[2];
  float32x4_t v39 = v30;
  int inited = vfx_script_clock_simulation_index_delayInitStub(*(double *)v27.i64);
  unsigned int v32 = 277803737
      * (((747796405 * (a7 + a4 + inited) + 2107313962) >> (((747796405 * (a7 + a4 + inited)
                                                                                        + 2107313962) >> 28)
                                                                        + 4)) ^ (747796405 * (a7 + a4 + inited)
                                                                               + 2107313962));
  *(float *)&double v33 = COERCE_FLOAT((v32 >> 31) ^ (v32 >> 9) | 0x3F800000) + -1.0;
  double v44 = v33;
  vfx_script_texture_sample1d_delayInitStub(v33);
  long long v38 = v34;
  vfx_script_texture_sample1d_delayInitStub(v44);
  *a9 = v39;
  *a10 = v38;
  *a11 = v35;
  long long v36 = v40;
  LODWORD(v36) = LODWORD(v44);
  *a12 = v36;
  return *(float *)&v36;
}

uint64_t __vfx_script_confetti_particleInit_172(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float ParticleInit_confetti_particleInit_146(double a1, float32x4_t a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, int a8, uint64_t a9, float32x4_t *a10, _OWORD *a11, _OWORD *a12, long long *a13)
{
  long long v44 = *a13;
  *(float *)&a1 = (float)((float)(*(float *)&a1 - a2.f32[0]) * 0.5) + (float)((float)(*(float *)&a1 - a2.f32[0]) * 0.5);
  a2.i64[0] = COERCE_UNSIGNED_INT(1.0) | 0x3E4CCCCD00000000;
  a2.i32[2] = LODWORD(a1);
  float32x4_t v46 = a2;
  __int32 v17 = 747796405 * (vfx_script_clock_simulation_index_delayInitStub(a1) + a4) - 1901271721;
  v18.i32[0] = v17;
  v18.i32[1] = 747796405 * v17 - 1403630843;
  uint32x2_t v19 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32(v18, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32(v18, 0x1CuLL))), (int8x8_t)v18), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v24 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v19, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v19, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  *(float32x2_t *)v26.f32 = vadd_f32(v24, _D1);
  unsigned int v27 = 277803737
      * (((747796405 * (747796405 * v17 - 1403630843) - 1403630843) >> (((747796405 * (747796405 * v17 - 1403630843) - 1403630843) >> 28)
                                                                                    + 4)) ^ (747796405
                                                                                           * (747796405 * v17
                                                                                            - 1403630843)
                                                                                           - 1403630843));
  v26.f32[2] = COERCE_FLOAT((v27 >> 31) ^ (v27 >> 9) | 0x3F800000) + -1.0;
  v28.i64[0] = 0xBF000000BF000000;
  v28.i64[1] = 0xBF000000BF000000;
  float32x4_t v29 = vmulq_f32(v46, vaddq_f32(v26, v28));
  float v30 = v29.f32[1];
  BOOL v32 = a5 == 90 || a5 == 270;
  float v33 = 0.35;
  if (a6 == 4 && v32) {
    float v33 = 0.25;
  }
  if (v32) {
    float v30 = v33;
  }
  float32x4_t v34 = v29;
  v34.f32[1] = v30;
  v34.i32[2] = v29.i32[2];
  float32x4_t v43 = v34;
  int inited = vfx_script_clock_simulation_index_delayInitStub(*(double *)v29.i64);
  unsigned int v36 = 277803737
      * (((747796405 * (a8 + a4 + inited) + 2107313962) >> (((747796405 * (a8 + a4 + inited)
                                                                                        + 2107313962) >> 28)
                                                                        + 4)) ^ (747796405 * (a8 + a4 + inited)
                                                                               + 2107313962));
  *(float *)&double v37 = COERCE_FLOAT((v36 >> 31) ^ (v36 >> 9) | 0x3F800000) + -1.0;
  double v47 = v37;
  vfx_script_texture_sample1d_delayInitStub(v37);
  long long v42 = v38;
  vfx_script_texture_sample1d_delayInitStub(v47);
  *a10 = v43;
  *a11 = v42;
  *a12 = v39;
  long long v40 = v44;
  LODWORD(v40) = LODWORD(v47);
  *a13 = v40;
  return *(float *)&v40;
}

uint64_t __vfx_script_confetti_particleInit_146(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float ParticleUpdate_confetti_particleUpdate_124(const void *a1, int a2, int a3, simd_quatf *a4)
{
  int v6 = 747796405 * (a3 + a2) - 1306390188;
  v7.i32[0] = v6;
  v7.i32[1] = 747796405 * v6 - 1403630843;
  uint32x2_t v8 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32(v7, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32(v7, 0x1CuLL))), (int8x8_t)v7), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v13 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v8, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v8, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  float32x2_t v15 = vadd_f32(v13, _D1);
  unsigned int v16 = 277803737
      * (((747796405 * (747796405 * v6 - 1403630843) - 1403630843) >> (((747796405 * (747796405 * v6 - 1403630843) - 1403630843) >> 28)
                                                                                   + 4)) ^ (747796405
                                                                                          * (747796405 * v6 - 1403630843)
                                                                                          - 1403630843));
  *(float32x2_t *)v17.f32 = v15;
  v17.f32[2] = COERCE_FLOAT((v16 >> 31) ^ (v16 >> 9) | 0x3F800000) + -1.0;
  v17.i32[3] = 0;
  float32x4_t v18 = vmaxnmq_f32(v17, (float32x4_t)0);
  v18.i32[3] = 0;
  v17.i64[0] = 0x4000000040000000;
  v17.i64[1] = 0x4000000040000000;
  __asm { FMOV            V2.4S, #-1.0 }
  float32x4_t v30 = vmlaq_f32(_Q2, v17, vminnmq_f32(v18, (float32x4_t)xmmword_1D081FDC0));
  float32x4_t v20 = vmulq_f32(v30, v30);
  v20.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).u64[0];
  float32x4_t v21 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 0);
  v21.i32[3] = 0;
  float32x4_t v22 = vrsqrteq_f32(v21);
  float32x4_t v23 = vmulq_f32(v22, vrsqrtsq_f32(v21, vmulq_f32(v22, v22)));
  int32x4_t v24 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v20.f32[0] != 0.0)), 0x1FuLL));
  v24.i32[3] = 0;
  float32x4_t v25 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v24), (int8x16_t)vmulq_f32(v30, vmulq_f32(v23, vrsqrtsq_f32(v21, vmulq_f32(v23, v23)))), (int8x16_t)v30);
  v23.i32[0] = v25.i32[2];
  v4.i32[0] = 1.0;
  v28.i64[0] = 0x8000000080000000;
  v28.i64[1] = 0x8000000080000000;
  float v26 = *(float *)vbslq_s8(v28, v4, (int8x16_t)v23).i32;
  *(float *)v28.i32 = v25.f32[1] / (float)(fabsf(v25.f32[2]) + 1.0);
  float v27 = vmuls_lane_f32(*(float *)v28.i32, *(float32x2_t *)v25.f32, 1);
  *(float *)v28.i32 = -(float)(v25.f32[0] * *(float *)v28.i32);
  float v29 = v25.f32[2] + (float)(v26 * v27);
  v30.f32[0] = v26 * *(float *)v28.i32;
  float v31 = 1.0 - v27;
  float v32 = vmuls_lane_f32(-v26, *(float32x2_t *)v25.f32, 1);
  float v33 = v25.f32[2] + (float)(v29 + v31);
  float v63 = v15.f32[0];
  if (v33 > 0.0)
  {
    float32x2_t v34 = (float32x2_t)vrev64_s32(*(int32x2_t *)v25.f32);
    *(int32x2_t *)v38.f32 = vdup_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v25.f32, *(float32x2_t *)v25.f32), 0);
    v38.i32[0] = vsub_f32((float32x2_t)__PAIR64__(v34.u32[1], LODWORD(v32)), v34).u32[0];
    float32x2_t v35 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(sqrtf(v33 + 1.0)), v30.u32[0]);
    float32x2_t v36 = vmul_f32(v35, v35);
    v35.i32[0] = v28.i32[0];
    unsigned __int32 v37 = vsub_f32(*(float32x2_t *)v30.f32, v35).u32[0];
    v28.i32[1] = v36.i32[1];
    v38.i64[1] = v28.i64[0];
    *(float *)v28.i32 = 0.5 / v35.f32[1];
LABEL_12:
    float32x4_t v42 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.i8, 0);
    goto LABEL_13;
  }
  if (v29 < v31 || v29 < v25.f32[2])
  {
    if (v31 <= v25.f32[2])
    {
      float v45 = sqrtf((float)((float)(v25.f32[2] + 1.0) - v29) - v31);
      v25.i32[0] = vsubq_f32(v25, v25).u32[0];
      v38.f32[1] = v25.f32[1] + v32;
      v38.f32[2] = v45 * v45;
      v38.f32[3] = v30.f32[0] - *(float *)v28.i32;
      *(float *)v28.i32 = 0.5 / v45;
      goto LABEL_12;
    }
    float v41 = sqrtf((float)((float)(v31 + 1.0) - v29) - v25.f32[2]);
    v42.f32[0] = *(float *)v28.i32 + v30.f32[0];
    float v43 = v41 * v41;
    float32x2_t v40 = (float32x2_t)vrev64_s32(*(int32x2_t *)v25.f32);
    int32x2_t v44 = (int32x2_t)vadd_f32(v40, (float32x2_t)__PAIR64__(v40.u32[1], LODWORD(v32)));
  }
  else
  {
    float v41 = sqrtf((float)((float)(v29 + 1.0) - v31) - v25.f32[2]);
    v42.f32[0] = v41 * v41;
    float v43 = *(float *)v28.i32 + v30.f32[0];
    int32x2_t v44 = (int32x2_t)vsub_f32((float32x2_t)__PAIR64__(LODWORD(v32), v25.u32[0]), *(float32x2_t *)v25.f32);
  }
  v42.f32[1] = v43;
  *(int32x2_t *)&v42.u32[2] = v44;
  *(float *)v44.i32 = 0.5 / v41;
  float32x4_t v38 = (float32x4_t)vdupq_lane_s32(v44, 0);
LABEL_13:
  float32x4_t v62 = vmulq_f32(v38, v42);
  vfx_script_clock_time_delayInitStub(*(double *)v62.i64);
  *(float *)&double v46 = v46;
  simd_float4 x = (simd_float4)COERCE_UNSIGNED_INT((float)((float)(123.0 * v63) + (float)(*(float *)&v46 * 16.0)) * 0.5);
  simd_float4 v64 = _simd_cos_f4(x);
  _Q0 = (float32x4_t)_simd_sin_f4(x);
  _Q7 = v64;
  float v49 = vmuls_lane_f32(v64.f32[1], (float32x4_t)v64, 2);
  float v50 = vmuls_lane_f32(_Q0.f32[1], _Q0, 2);
  *(float *)v51.i32 = vmlas_n_f32(-(float)(v64.f32[0] * v50), v49, _Q0.f32[0]);
  _S4 = vmuls_lane_f32(v64.f32[0], *(float32x2_t *)_Q0.f32, 1);
  __asm { FMLA            S5, S4, V7.S[2] }
  _S4 = vmuls_lane_f32(_Q7.f32[0], *(float32x2_t *)_Q7.f32, 1);
  __asm { FMLA            S6, S4, V0.S[2] }
  float result = vmlas_n_f32(v50 * _Q0.f32[0], v49, v64.f32[0]);
  v51.i32[1] = _S5;
  v51.i32[2] = _S6;
  _Q6 = (int32x4_t)v62;
  int32x4_t v58 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v51, v51), (int8x16_t)v51, 0xCuLL), vnegq_f32(v62)), (float32x4_t)v51, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(_Q6, _Q6), (int8x16_t)v62, 0xCuLL));
  simd_quatf v59 = (simd_quatf)vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v62, result), (float32x4_t)v51, v62, 3), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v58, v58), (int8x16_t)v58, 0xCuLL));
  __asm { FMLA            S2, S0, V6.S[3] }
  v59.vector.i32[3] = _S2;
  *a4 = v59;
  return result;
}

void __vfx_script_confetti_particleUpdate_124(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float ParticleUpdate_confetti_particleUpdate_25(__n128 a1, float a2, uint64_t a3, int a4, int a5, uint64_t a6, float32x4_t *a7, long long *a8)
{
  int v13 = 747796405 * (a5 + a4) - 1306390188;
  v14.i32[0] = v13;
  v14.i32[1] = 747796405 * v13 - 1403630843;
  uint32x2_t v15 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32(v14, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32(v14, 0x1CuLL))), (int8x8_t)v14), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v20 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v15, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v15, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  float32x2_t v22 = vadd_f32(v20, _D1);
  unsigned int v23 = 277803737
      * (((747796405 * (747796405 * v13 - 1403630843) - 1403630843) >> (((747796405 * (747796405 * v13 - 1403630843) - 1403630843) >> 28)
                                                                                    + 4)) ^ (747796405
                                                                                           * (747796405 * v13
                                                                                            - 1403630843)
                                                                                           - 1403630843));
  *(float32x2_t *)v24.f32 = v22;
  v24.f32[2] = COERCE_FLOAT((v23 >> 31) ^ (v23 >> 9) | 0x3F800000) + -1.0;
  v24.i32[3] = 0;
  float32x4_t v25 = vmaxnmq_f32(v24, (float32x4_t)0);
  v25.i32[3] = 0;
  v24.i64[0] = 0x4000000040000000;
  v24.i64[1] = 0x4000000040000000;
  __asm { FMOV            V2.4S, #-1.0 }
  float32x4_t v37 = vmlaq_f32(_Q2, v24, vminnmq_f32(v25, (float32x4_t)xmmword_1D081FDC0));
  float32x4_t v27 = vmulq_f32(v37, v37);
  v27.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2), vaddq_f32(v27, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 1))).u64[0];
  float32x4_t v28 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 0);
  v28.i32[3] = 0;
  float32x4_t v29 = vrsqrteq_f32(v28);
  float32x4_t v30 = vmulq_f32(v29, vrsqrtsq_f32(v28, vmulq_f32(v29, v29)));
  int32x4_t v31 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v27.f32[0] != 0.0)), 0x1FuLL));
  v31.i32[3] = 0;
  float32x4_t v32 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v31), (int8x16_t)vmulq_f32(v37, vmulq_f32(v30, vrsqrtsq_f32(v28, vmulq_f32(v30, v30)))), (int8x16_t)v37);
  v30.i32[0] = v32.i32[2];
  v8.i32[0] = 1.0;
  v35.i64[0] = 0x8000000080000000;
  v35.i64[1] = 0x8000000080000000;
  float v33 = *(float *)vbslq_s8(v35, v8, (int8x16_t)v30).i32;
  *(float *)v35.i32 = v32.f32[1] / (float)(fabsf(v32.f32[2]) + 1.0);
  float v34 = vmuls_lane_f32(*(float *)v35.i32, *(float32x2_t *)v32.f32, 1);
  *(float *)v35.i32 = -(float)(v32.f32[0] * *(float *)v35.i32);
  float v36 = v32.f32[2] + (float)(v33 * v34);
  v37.f32[0] = v33 * *(float *)v35.i32;
  float v38 = 1.0 - v34;
  float v39 = vmuls_lane_f32(-v33, *(float32x2_t *)v32.f32, 1);
  float v40 = v32.f32[2] + (float)(v36 + v38);
  __n128 v77 = a1;
  long long v78 = *a8;
  float v74 = v22.f32[0];
  if (v40 > 0.0)
  {
    float32x2_t v41 = (float32x2_t)vrev64_s32(*(int32x2_t *)v32.f32);
    *(int32x2_t *)v45.f32 = vdup_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v32.f32, *(float32x2_t *)v32.f32), 0);
    v45.i32[0] = vsub_f32((float32x2_t)__PAIR64__(v41.u32[1], LODWORD(v39)), v41).u32[0];
    float32x2_t v42 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(sqrtf(v40 + 1.0)), v37.u32[0]);
    float32x2_t v43 = vmul_f32(v42, v42);
    v42.i32[0] = v35.i32[0];
    unsigned __int32 v44 = vsub_f32(*(float32x2_t *)v37.f32, v42).u32[0];
    v35.i32[1] = v43.i32[1];
    v45.i64[1] = v35.i64[0];
    *(float *)v35.i32 = 0.5 / v42.f32[1];
LABEL_12:
    float32x4_t v49 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v35.i8, 0);
    goto LABEL_13;
  }
  if (v36 < v38 || v36 < v32.f32[2])
  {
    if (v38 <= v32.f32[2])
    {
      float v52 = sqrtf((float)((float)(v32.f32[2] + 1.0) - v36) - v38);
      v32.i32[0] = vsubq_f32(v32, v32).u32[0];
      v45.f32[1] = v32.f32[1] + v39;
      v45.f32[2] = v52 * v52;
      v45.f32[3] = v37.f32[0] - *(float *)v35.i32;
      *(float *)v35.i32 = 0.5 / v52;
      goto LABEL_12;
    }
    float v48 = sqrtf((float)((float)(v38 + 1.0) - v36) - v32.f32[2]);
    v49.f32[0] = *(float *)v35.i32 + v37.f32[0];
    float v50 = v48 * v48;
    float32x2_t v47 = (float32x2_t)vrev64_s32(*(int32x2_t *)v32.f32);
    int32x2_t v51 = (int32x2_t)vadd_f32(v47, (float32x2_t)__PAIR64__(v47.u32[1], LODWORD(v39)));
  }
  else
  {
    float v48 = sqrtf((float)((float)(v36 + 1.0) - v38) - v32.f32[2]);
    v49.f32[0] = v48 * v48;
    float v50 = *(float *)v35.i32 + v37.f32[0];
    int32x2_t v51 = (int32x2_t)vsub_f32((float32x2_t)__PAIR64__(LODWORD(v39), v32.u32[0]), *(float32x2_t *)v32.f32);
  }
  v49.f32[1] = v50;
  *(int32x2_t *)&v49.u32[2] = v51;
  *(float *)v51.i32 = 0.5 / v48;
  float32x4_t v45 = (float32x4_t)vdupq_lane_s32(v51, 0);
LABEL_13:
  float32x4_t v73 = vmulq_f32(v45, v49);
  vfx_script_clock_time_delayInitStub(*(double *)v73.i64);
  *(float *)&double v53 = v53;
  float v54 = (float)((float)(123.0 * v74) + (float)(*(float *)&v53 * 16.0)) * 0.5;
  LODWORD(v53) = 0;
  *((float *)&v53 + 1) = v54;
  simd_float4 x = (simd_float4)*(unint64_t *)&v53;
  simd_float4 v75 = _simd_cos_f4((simd_float4)*(unint64_t *)&v53);
  _Q0 = (float32x4_t)_simd_sin_f4(x);
  _Q7 = v75;
  float v57 = vmuls_lane_f32(v75.f32[1], (float32x4_t)v75, 2);
  float v58 = vmuls_lane_f32(_Q0.f32[1], _Q0, 2);
  *(float *)v59.i32 = vmlas_n_f32(-(float)(v75.f32[0] * v58), v57, _Q0.f32[0]);
  _S4 = vmuls_lane_f32(v75.f32[0], *(float32x2_t *)_Q0.f32, 1);
  __asm { FMLA            S5, S4, V7.S[2] }
  _S4 = vmuls_lane_f32(_Q7.f32[0], *(float32x2_t *)_Q7.f32, 1);
  __asm { FMLA            S6, S4, V0.S[2] }
  _Q0.f32[0] = vmlas_n_f32(v58 * _Q0.f32[0], v57, v75.f32[0]);
  v59.i32[1] = _S5;
  v59.i32[2] = _S6;
  _Q6 = (int32x4_t)v73;
  int32x4_t v65 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v59, v59), (int8x16_t)v59, 0xCuLL), vnegq_f32(v73)), (float32x4_t)v59, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(_Q6, _Q6), (int8x16_t)v73, 0xCuLL));
  float32x4_t v66 = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v73, _Q0.f32[0]), (float32x4_t)v59, v73, 3), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v65, v65), (int8x16_t)v65, 0xCuLL));
  __asm { FMLA            S1, S0, V6.S[3] }
  v66.i32[3] = _S1;
  float32x4_t v76 = v66;
  _Q0.i32[1] = v77.n128_i32[1];
  _Q0.f32[0] = (float)((float)(v77.n128_f32[2] + 1.0) * 0.75) + -0.25;
  vfx_script_texture_sample1d_delayInitStub(*(double *)_Q0.i64);
  float v69 = fminf(fmaxf(v68, 0.0), 1.0);
  float result = (float)(v69 * v69) * a2;
  *a7 = v76;
  *(void *)&long long v71 = __PAIR64__(LODWORD(result), v78);
  *((void *)&v71 + 1) = *((void *)&v78 + 1);
  *a8 = v71;
  return result;
}

uint64_t __vfx_script_confetti_particleUpdate_25(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t __vfx_script_confetti_particleUpdate_196(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float Main_lighting_graph_9DD82DB1_83CC_4C95_8122_529530C0E9A5(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result = a3 * 1000.0;
  *a4 = result;
  return result;
}

float Main_lighting_graph_2A1A65D6_42D2_422D_B043_7BA6751C7A80(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result = a3 * 6.0;
  *a4 = result;
  return result;
}

void sub_1D07E45F0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 200), 8);
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

void sub_1D07E5050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D07E5E08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__n128 OUTLINED_FUNCTION_4_2(uint64_t a1)
{
  return *(__n128 *)a1;
}

id _PTFocusIdentifierMake(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = a2 & 0x7FFFFFFF00000000;
  if ((a2 & 0x7FFFFFFF00000000uLL) > 0x10FFFFFFFFLL)
  {
    if ((a2 & 0x7FFFFFFF00000000uLL) > 0x12FFFFFFFFLL)
    {
      if (v4 == 0x1300000000)
      {
        unsigned int v5 = @"R";
        goto LABEL_18;
      }
      if (v4 == 0xFF00000000)
      {
        unsigned int v5 = @"!";
        goto LABEL_18;
      }
    }
    else
    {
      if (v4 == 0x1100000000)
      {
        unsigned int v5 = @"C";
        goto LABEL_18;
      }
      if (v4 == 0x1200000000)
      {
        unsigned int v5 = @"E";
        goto LABEL_18;
      }
    }
    goto LABEL_16;
  }
  if (!v4)
  {
    unsigned int v5 = @"A";
    goto LABEL_18;
  }
  if (v4 != 0x100000000)
  {
    if (v4 == 0x1000000000)
    {
      unsigned int v5 = @"B";
      goto LABEL_18;
    }
LABEL_16:
    unsigned int v5 = @"?";
    goto LABEL_18;
  }
  unsigned int v5 = @"F";
LABEL_18:
  int v6 = @"_";
  if (a2 >= 0) {
    int v6 = &stru_1F269F3B0;
  }
  uint32x2_t v7 = v6;
  int8x16_t v8 = +[PTCinematographyDetection _prefixForDetectionType:a1];
  uint64_t v9 = [NSString stringWithFormat:@"%@%@%@-%lu", v7, v5, v8, v2];

  return v9;
}

float32x2_t PTFilterRect(int8x16_t a1, int8x16_t a2, int32x2_t a3, int32x2_t a4)
{
  float32x2_t v4 = (float32x2_t)vextq_s8(a1, a1, 8uLL).u64[0];
  *(float32x2_t *)v5.f32 = vmla_f32(*(float32x2_t *)a1.i8, (float32x2_t)0x3F0000003F000000, v4);
  *(float32x2_t *)&v5.u32[2] = v4;
  float32x2_t v6 = (float32x2_t)vextq_s8(a2, a2, 8uLL).u64[0];
  *(float32x2_t *)v7.f32 = vmla_f32(*(float32x2_t *)a2.i8, (float32x2_t)0x3F0000003F000000, v6);
  *(float32x2_t *)&v7.u32[2] = v6;
  *(int32x2_t *)v8.f32 = vdup_lane_s32(a3, 0);
  *(int32x2_t *)&v8.u32[2] = vdup_lane_s32(a4, 0);
  int8x16_t v9 = (int8x16_t)vmlaq_f32(v5, vsubq_f32(v7, v5), v8);
  return vmls_f32(*(float32x2_t *)v9.i8, (float32x2_t)0x3F0000003F000000, (float32x2_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL));
}

float32x2_t PTFilterRectDEMA(float32x4_t *a1, float32x4_t *a2, int8x16_t a3, int32x2_t a4, int32x2_t a5)
{
  float32x2_t v5 = (float32x2_t)vextq_s8(a3, a3, 8uLL).u64[0];
  *(float32x2_t *)v6.f32 = vmla_f32(*(float32x2_t *)a3.i8, (float32x2_t)0x3F0000003F000000, v5);
  *(float32x2_t *)&v6.u32[2] = v5;
  *(int32x2_t *)v7.f32 = vdup_lane_s32(a4, 0);
  *(int32x2_t *)&v7.u32[2] = vdup_lane_s32(a5, 0);
  float32x4_t v8 = vmlaq_f32(*a1, vsubq_f32(v6, *a1), v7);
  *a1 = v8;
  float32x4_t v9 = vmlaq_f32(*a2, vsubq_f32(v8, *a2), v7);
  *a2 = v9;
  v10.i64[0] = 0x4000000040000000;
  v10.i64[1] = 0x4000000040000000;
  int8x16_t v11 = (int8x16_t)vmlaq_f32(vnegq_f32(v9), v10, *a1);
  return vmls_f32(*(float32x2_t *)v11.i8, (float32x2_t)0x3F0000003F000000, (float32x2_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL));
}

float PTDisparityInNormalizedRectFromLockedPixelBufferInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, double a7, double a8, double a9, double a10)
{
  return PeakInNormalizedRectFromLockedPixelBufferInfo(a1, a2, a3, a4, a5, a6, 0, 0, a7, a8, a9, a10);
}

float PeakInNormalizedRectFromLockedPixelBufferInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, float *a7, void *a8, double a9, double a10, double a11, double a12)
{
  *(void *)&v98[764] = *MEMORY[0x1E4F143B8];
  id v23 = a8;
  float32x4_t v24 = v23;
  if (v23)
  {
    float32x4_t v25 = v23;
    if (a6 == 1717856627)
    {
      double v26 = a9;
      double v27 = a10;
      double v28 = a11;
      uint64_t v30 = a2;
      unint64_t v31 = a3;
      double v29 = a12;
      uint64_t v32 = a4;
      uint64_t v33 = a5;
      float v34 = v25;
      int v35 = 0;
      goto LABEL_9;
    }
    if (a6 == 1751411059)
    {
      double v26 = a9;
      double v27 = a10;
      double v28 = a11;
      double v29 = a12;
      uint64_t v30 = a2;
      unint64_t v31 = a3;
      uint64_t v32 = a4;
      uint64_t v33 = a5;
      float v34 = v25;
      int v35 = 1;
LABEL_9:
      HistogramInNormalizedRectFromLockedPixelBufferInfo_Mask(v97, v30, v31, v26, v27, v28, v29, v32, v33, v34, v35);
LABEL_16:

      goto LABEL_17;
    }
    float32x4_t v45 = _PTLogSystem();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      float v69 = NSStringFromFourCharCode(a6);
      *(_DWORD *)v91 = 138412802;
      float32x4_t v92 = v69;
      __int16 v93 = 2048;
      uint64_t v94 = a3;
      __int16 v95 = 2048;
      uint64_t v96 = a4;
      _os_log_error_impl(&dword_1D0778000, v45, OS_LOG_TYPE_ERROR, "error: histogram - unexpected pixel format type '%@' (%zdx%zd) - must be DisparityFloat16 or DisparityFloat32", v91, 0x20u);
    }
LABEL_12:

    goto LABEL_16;
  }
  if (a6 == 1717856627)
  {
    double v36 = a9;
    double v37 = a10;
    double v38 = a11;
    uint64_t v40 = a2;
    unint64_t v41 = a3;
    double v39 = a12;
    uint64_t v42 = a4;
    uint64_t v43 = a5;
    int v44 = 0;
  }
  else
  {
    if (a6 != 1751411059)
    {
      float32x4_t v25 = _PTLogSystem();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      float32x4_t v45 = NSStringFromFourCharCode(a6);
      *(_DWORD *)v91 = 138412802;
      float32x4_t v92 = v45;
      __int16 v93 = 2048;
      uint64_t v94 = a3;
      __int16 v95 = 2048;
      uint64_t v96 = a4;
      _os_log_error_impl(&dword_1D0778000, v25, OS_LOG_TYPE_ERROR, "error: histogram - unexpected pixel format type '%@' (%zdx%zd) - must be DisparityFloat16 or DisparityFloat32", v91, 0x20u);
      goto LABEL_12;
    }
    double v36 = a9;
    double v37 = a10;
    double v38 = a11;
    double v39 = a12;
    uint64_t v40 = a2;
    unint64_t v41 = a3;
    uint64_t v42 = a4;
    uint64_t v43 = a5;
    int v44 = 1;
  }
  HistogramInNormalizedRectFromLockedPixelBufferInfo_FloatSize(v97, v40, v41, v36, v37, v38, v39, v42, v43, v44);
LABEL_17:
  uint64_t v46 = 0;
  int v47 = 0;
  float v48 = (int *)v98;
  do
  {
    int v49 = *(v48 - 1);
    if (v49 < 1) {
      goto LABEL_24;
    }
    if (v46)
    {
      if (*(_DWORD *)&v97[4 * (v46 - 1)] > v49) {
        goto LABEL_24;
      }
      if (v46 == 191) {
        goto LABEL_23;
      }
    }
    if (v49 > *v48) {
LABEL_23:
    }
      *(_DWORD *)&v91[4 * v47++] = v46;
LABEL_24:
    ++v48;
    ++v46;
  }
  while (v46 != 192);
  do
  {
    int v50 = v47;
    if (v47 < 3) {
      break;
    }
    uint64_t v51 = 0;
    int v47 = 0;
    do
    {
      if (!v51 || *(_DWORD *)&v97[4 * *(int *)&v91[v51]] <= *(_DWORD *)&v97[4 * *(int *)&v91[v51]])
      {
        if (4 * (v50 - 1) == v51)
        {
          LODWORD(v52) = *(_DWORD *)&v91[4 * (v50 - 1)];
        }
        else
        {
          uint64_t v52 = *(int *)&v91[v51];
          if (*(_DWORD *)&v97[4 * v52] <= *(_DWORD *)&v97[4 * *(int *)&v91[v51 + 4]]) {
            goto LABEL_33;
          }
        }
        *(_DWORD *)&v91[4 * v47++] = v52;
      }
LABEL_33:
      v51 += 4;
    }
    while (4 * v50 != v51);
  }
  while (v47 < v50);
  if (v50)
  {
    if (v50 <= 0) {
      PeakInNormalizedRectFromLockedPixelBufferInfo_cold_1();
    }
    uint64_t v53 = (v50 - 1);
    float v54 = (float)((float)((float)((float)*(int *)&v91[4 * v53] + 0.5) * 7.65) / 192.0) + 0.0;
    if (a7 && v50 != 1)
    {
      float v55 = INFINITY;
      do
      {
        float v56 = (float)((float)((float)((float)*(int *)&v91[4 * v53] + 0.5) * 7.65) / 192.0) + 0.0;
        if (v56 > 0.0)
        {
          float v57 = fabsf((float)(*a7 / v56) + -1.0);
          if (v55 > v57)
          {
            float v54 = (float)((float)((float)((float)*(int *)&v91[4 * v53] + 0.5) * 7.65) / 192.0) + 0.0;
            float v55 = v57;
          }
        }
      }
      while (v53-- > 0);
    }
    int32x4_t v59 = _PTLogSystem();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219264;
      uint64_t v72 = a1;
      __int16 v73 = 2048;
      double v74 = a9;
      __int16 v75 = 2048;
      double v76 = a10;
      __int16 v77 = 2048;
      double v78 = a11;
      __int16 v79 = 2048;
      double v80 = a12;
      __int16 v81 = 2048;
      double v82 = v54;
      float v60 = "detection type: %ld rect: { %.3f, %.3f, %.3f, %.3f } disparity: %.3f";
      float v61 = v59;
      uint32_t v62 = 62;
      goto LABEL_57;
    }
    goto LABEL_58;
  }
  float v63 = _PTLogSystem();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0778000, v63, OS_LOG_TYPE_INFO, "Failed to find peaks in disparity buffer, using prior or default disparity value", buf, 2u);
  }

  if (a7) {
    float v54 = *a7;
  }
  else {
    float v54 = 3.8449;
  }
  simd_float4 v64 = _PTLogSystem();
  BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG);

  if (v65)
  {
    uint64_t v66 = 0;
    int32x4_t v67 = 0uLL;
    do
    {
      int32x4_t v67 = vaddq_s32(*(int32x4_t *)&v97[v66], v67);
      v66 += 16;
    }
    while (v66 != 768);
    int32x4_t v70 = v67;
    int32x4_t v59 = _PTLogSystem();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134220288;
      uint64_t v72 = a1;
      __int16 v73 = 2048;
      double v74 = a9;
      __int16 v75 = 2048;
      double v76 = a10;
      __int16 v77 = 2048;
      double v78 = a11;
      __int16 v79 = 2048;
      double v80 = a12;
      __int16 v81 = 2048;
      double v82 = *(double *)&a3;
      __int16 v83 = 2048;
      uint64_t v84 = a4;
      __int16 v85 = 1024;
      int v86 = vaddvq_s32(v70);
      __int16 v87 = 1024;
      BOOL v88 = a7 != 0;
      __int16 v89 = 2048;
      double v90 = v54;
      float v60 = "detection type: %ld rect: { %.3f, %.3f, %.3f, %.3f } buffer size: (%zu,%zu) hist samples:%u prior:%u dispari"
            "ty: unknown (returning %.3f)";
      float v61 = v59;
      uint32_t v62 = 94;
LABEL_57:
      _os_log_debug_impl(&dword_1D0778000, v61, OS_LOG_TYPE_DEBUG, v60, buf, v62);
    }
LABEL_58:
  }
  return v54;
}

float PTDisparityInNormalizedRectFromPixelBuffer(uint64_t a1, __CVBuffer *a2, double a3, double a4, double a5, double a6)
{
  return PTDisparityInNormalizedRectFromPixelBufferWithPrior(a1, a2, 0, a3, a4, a5, a6);
}

float PTDisparityInNormalizedRectFromPixelBufferWithPrior(uint64_t a1, CVPixelBufferRef pixelBuffer, float *a3, double a4, double a5, double a6, double a7)
{
  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(pixelBuffer);
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  LODWORD(a7) = PeakInNormalizedRectFromLockedPixelBufferInfo(a1, (uint64_t)BaseAddress, Width, Height, BytesPerRow, PixelFormatType, a3, 0, a4, a5, a6, a7);
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  return *(float *)&a7;
}

float PTDisparityInNormalizedRectFromLockedPixelBufferInfoWithPrior(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, float *a7, double a8, double a9, double a10, double a11)
{
  return PeakInNormalizedRectFromLockedPixelBufferInfo(a1, a2, a3, a4, a5, a6, a7, 0, a8, a9, a10, a11);
}

float _PTDisparityInNormalizedRectFromPixelBufferWithMask(uint64_t a1, __CVBuffer *a2, float *a3, void *a4, double a5, double a6, double a7, double a8)
{
  id v15 = a4;
  CVPixelBufferLockBaseAddress(a2, 1uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(a2);
  size_t Width = CVPixelBufferGetWidth(a2);
  size_t Height = CVPixelBufferGetHeight(a2);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a2);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a2);
  LODWORD(a8) = PeakInNormalizedRectFromLockedPixelBufferInfo(a1, (uint64_t)BaseAddress, Width, Height, BytesPerRow, PixelFormatType, a3, v15, a5, a6, a7, a8);

  CVPixelBufferUnlockBaseAddress(a2, 1uLL);
  return *(float *)&a8;
}

void HistogramInNormalizedRectFromLockedPixelBufferInfo_Mask(void *a1, uint64_t a2, unint64_t a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, void *a10, int a11)
{
  id v34 = a10;
  objc_msgSend(v34, "setPlacement:", _PTDenormalizeRect(a4, a5, a6, a7, (double)a3));
  bzero(a1, 0x300uLL);
  float32x2_t v20 = [v34 scanlineIter];
  uint64_t v21 = [v20 nextRangeY];
  if (v22)
  {
    unint64_t v23 = v21;
    do
    {
      uint64_t v24 = v23 + v22;
      if (v23 < v23 + v22)
      {
        uint64_t v25 = a2 + a9 * v23;
        do
        {
          [v20 resetX];
          while (1)
          {
            unint64_t v26 = [v20 nextRangeX];
            if (!v27) {
              break;
            }
            if (v26 < v26 + v27)
            {
              do
              {
                if (a11)
                {
                  _H0 = *(_WORD *)(v25 + 2 * v26);
                  __asm { FCVT            S0, H0 }
                }
                else
                {
                  _S0 = *(float *)(v25 + 4 * v26);
                }
                if (_S0 >= 0.0 && _S0 < 7.65) {
                  ++*((_DWORD *)a1 + (int)(float)((float)(_S0 * 192.0) / 7.65));
                }
                ++v26;
                --v27;
              }
              while (v27);
            }
          }
          ++v23;
          v25 += a9;
        }
        while (v23 != v24);
      }
      unint64_t v23 = [v20 nextRangeY];
    }
    while (v22);
  }
}

double _PTDenormalizeRect(double a1, double a2, double a3, double a4, double a5)
{
  double result = floor(a1 * a5 + 0.5);
  if (result >= a5 + -2.0) {
    double result = a5 + -2.0;
  }
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

void HistogramInNormalizedRectFromLockedPixelBufferInfo_FloatSize(void *a1, uint64_t a2, unint64_t a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, int a10)
{
  double v14 = _PTDenormalizeRect(a4, a5, a6, a7, (double)a3);
  double v16 = v15;
  float v18 = v17;
  float v20 = v19;
  if (PTDepthInRectSensitivity_onceToken != -1) {
    dispatch_once(&PTDepthInRectSensitivity_onceToken, &__block_literal_global_9);
  }
  float v21 = *(float *)&PTDepthInRectSensitivity_sDepthInRectSensitivity;
  float v22 = *(float *)&PTDepthInRectSensitivity_sDepthInRectSensitivity * v20;
  if ((float)(*(float *)&PTDepthInRectSensitivity_sDepthInRectSensitivity * v20) < 3.0) {
    float v22 = 3.0;
  }
  unint64_t v23 = (unint64_t)(float)(fmaxf((float)(v20 - v22) * 0.5, 0.0) + v18);
  float v24 = (float)(v22 + v20) * 0.5;
  if (v24 > v20) {
    float v24 = v20;
  }
  unint64_t v25 = (unint64_t)(float)(v24 + v18);
  bzero(a1, 0x300uLL);
  if (v23 < v25)
  {
    float v26 = v14;
    float v27 = v16;
    uint64_t v28 = a2 + v23 * a9;
    do
    {
      float v29 = (float)((float)((float)((float)v23 - v18) + (float)((float)v23 - v18)) / v20) + -1.0;
      float v30 = (float)(v21 * v21) - (float)(v29 * v29);
      float v31 = sqrtf(v30) * v27;
      if (v30 <= 0.0) {
        float v32 = 0.0;
      }
      else {
        float v32 = v31;
      }
      if (v32 < 3.0) {
        float v32 = 3.0;
      }
      unint64_t v33 = (unint64_t)(float)(fmaxf((float)(v27 - v32) * 0.5, 0.0) + v26);
      float v34 = (float)(v32 + v27) * 0.5;
      if (v34 > v27) {
        float v34 = v16;
      }
      unint64_t v35 = (unint64_t)(float)(v34 + v26);
      if (v33 < v35)
      {
        do
        {
          if (a10)
          {
            _H5 = *(_WORD *)(v28 + 2 * v33);
            __asm { FCVT            S5, H5 }
          }
          else
          {
            _S5 = *(float *)(v28 + 4 * v33);
          }
          if (_S5 >= 0.0 && _S5 < 7.65) {
            ++*((_DWORD *)a1 + (int)(float)((float)(_S5 * 192.0) / 7.65));
          }
          ++v33;
        }
        while (v35 != v33);
      }
      ++v23;
      v28 += a9;
    }
    while (v23 != v25);
  }
}

void __PTDepthInRectSensitivity_block_invoke()
{
  PTDepthInRectSensitivity_sDepthInRectSensitivity = 1061997773;
}

double CGRectFromRectDictionary(void *a1)
{
  id v1 = a1;
  unsigned int v2 = [v1 objectForKeyedSubscript:@"X"];
  [v2 floatValue];
  double v4 = v3;
  float32x2_t v5 = [v1 objectForKeyedSubscript:@"Y"];
  [v5 floatValue];
  float32x4_t v6 = [v1 objectForKeyedSubscript:@"Width"];
  [v6 floatValue];
  float32x4_t v7 = [v1 objectForKeyedSubscript:@"Height"];

  [v7 floatValue];
  return v4;
}

__n128 Main_thumbsup_graph_451D2F34_D7DE_4C4D_9A5C_B1A778F1CA1C(__n128 a1, uint64_t a2, uint64_t a3, int a4, int a5, __n128 *a6, int *a7)
{
  a1.n128_u32[0] = 1036831949;
  if (a4) {
    a1.n128_f32[0] = -0.1;
  }
  *a7 = a5 & ~(a5 >> 31);
  a1.n128_u32[1] = 1025758986;
  a1.n128_u32[2] = -0.5;
  *a6 = a1;
  result.n128_u64[0] = a1.n128_u64[0];
  result.n128_u32[2] = a1.n128_u32[2];
  return result;
}

void Init_thumbsup_graph_E58E02C9_8189_4980_ABED_6DF4C8EF7375(uint64_t a1, uint64_t a2, int a3, int32x2_t *a4, long long *a5)
{
  long long v5 = *a5;
  float v6 = -1.0;
  if (a3) {
    float v6 = 1.0;
  }
  *a4 = vdup_n_s32(0x3BB0F27Cu);
  long long v7 = v5;
  *((float *)&v7 + 1) = v6;
  DWORD2(v7) = DWORD2(v5);
  *a5 = v7;
}

void Main_thumbsup_graph_A591C9B7_84C4_4BEA_8829_4366B5881232(const void *a1, unsigned int a2, int a3, int a4, float *a5, float *a6)
{
  float v6 = -1.0;
  if (a3) {
    float v7 = 1.0;
  }
  else {
    float v7 = -1.0;
  }
  if (a4) {
    float v6 = 1.0;
  }
  *a5 = v7;
  *a6 = v6;
}

void Main_thumbsup_graph_38F35C26_FEA0_47AB_B998_9FF24156FD6D(const void *a1, unsigned int a2, int a3, unsigned int *a4)
{
  *a4 = a3 & ~(a3 >> 31);
}

__n128 Init_thumbsup_graph_5BEF5B4C_59E5_4DBA_86B0_DB00779F419D(uint64_t a1, uint64_t a2, int32x4_t *a3, __n128 *a4)
{
  __n128 result = *a4;
  *a3 = vdupq_n_s32(0x3CA3D70Au);
  __asm { FMOV            V1.4S, #-1.0 }
  _Q1.n128_u32[0] = result.n128_u32[0];
  _Q1.n128_u32[2] = result.n128_u32[2];
  *a4 = _Q1;
  return result;
}

double Render_thumbsup_graph_891A5752_872E_4295_B8CA_3104EA0A6053(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  double result = 1.37667655e-16;
  *a3 = xmmword_1D0840700;
  return result;
}

uint64_t __vfx_script_thumbsup_graph_8D318DBD_EF7B_44D4_B5E6_F743F93F2B64(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(_DWORD **)(result + 16) = 0;
  return result;
}

uint64_t __vfx_script_thumbsup_graph_8EC5E521_8C63_47F8_B96D_2B0B5A296B7A(double a1)
{
  uint64_t result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(_DWORD **)(result + 16) = 0;
  return result;
}

__n128 ParticleInit_thumbsup_particleInit_78(__n128 a1, uint64_t a2, int a3, unsigned int a4, int a5, unsigned int a6, uint64_t a7, __n128 *a8, __n128 *a9, __n128 *a10)
{
  unsigned int inited = vfx_script_clock_simulation_index_delayInitStub(a1.n128_f64[0]);
  unsigned int v18 = a5 + a3;
  int8x8_t v20 = (int8x8_t)vmla_s32((int32x2_t)0x690EF5340FEA05CALL, vadd_s32(vdup_n_s32(v18), (int32x2_t)__PAIR64__(vfx_script_clock_simulation_index_delayInitStub(v19), inited)), vdup_n_s32(0x2C9277B5u));
  uint32x2_t v21 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32((uint32x2_t)v20, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32((uint32x2_t)v20, 0x1CuLL))), v20), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v26 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v21, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v21, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  float32x2_t v28 = vmla_f32((float32x2_t)0x3F800000C0400000, (float32x2_t)1080033280, vadd_f32(v26, _D1));
  *(int8x8_t *)v29.f32 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32((int32x2_t)__PAIR64__(a6, a4), 0x1FuLL)), (int8x8_t)v28, (int8x8_t)vneg_f32(v28));
  float32x4_t v46 = v29;
  int v30 = vfx_script_clock_simulation_index_delayInitStub(*(double *)v29.i64);
  unsigned int v31 = 277803737
      * (((747796405 * (v18 + v30) - 1036786530) >> (((747796405 * (v18 + v30) - 1036786530) >> 28) + 4)) ^ (747796405 * (v18 + v30) - 1036786530));
  float32x4_t v32 = v46;
  v32.f32[2] = (float)((float)(COERCE_FLOAT((v31 >> 31) ^ (v31 >> 9) | 0x3F800000) + -1.0) * 6.0) + -3.0;
  float32x4_t v33 = vmulq_f32(v32, v32);
  v33.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v33, 2), vaddq_f32(v33, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v33.f32, 1))).u64[0];
  float32x4_t v34 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v33.f32, 0);
  v34.i32[3] = 0;
  float32x4_t v35 = vrsqrteq_f32(v34);
  float32x4_t v36 = vmulq_f32(v35, vrsqrtsq_f32(v34, vmulq_f32(v35, v35)));
  int8x16_t v37 = (int8x16_t)vmulq_f32(vmulq_f32(v36, vrsqrtsq_f32(v34, vmulq_f32(v36, v36))), v32);
  int32x4_t v38 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v33.f32[0] != 0.0)), 0x1FuLL));
  int8x16_t v39 = (int8x16_t)v46;
  *(float *)&v39.i32[2] = (float)((float)(COERCE_FLOAT((v31 >> 31) ^ (v31 >> 9) | 0x3F800000) + -1.0) * 6.0) + -3.0;
  v38.i32[3] = 0;
  float32x4_t v47 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v38), v37, v39);
  int v40 = vfx_script_clock_simulation_index_delayInitStub(*(double *)v47.i64);
  unsigned int v41 = 277803737
      * (((747796405 * (v18 + v40) - 116627122) >> (((747796405 * (v18 + v40) - 116627122) >> 28) + 4)) ^ (747796405 * (v18 + v40) - 116627122));
  __n128 result = (__n128)vmulq_n_f32(v47, (float)((float)(COERCE_FLOAT((v41 >> 31) ^ (v41 >> 9) | 0x3F800000) + -1.0) * 0.0) + 0.1);
  float v43 = -0.025;
  if (a4) {
    float v43 = 0.025;
  }
  if (a7 != 270 && a7 != 90) {
    float v43 = -0.0;
  }
  __n128 v45 = a1;
  v45.n128_f32[0] = a1.n128_f32[0] + v43;
  result.n128_u32[3] = 1.0;
  *a8 = result;
  *a9 = v45;
  *a10 = v45;
  return result;
}

uint64_t __vfx_script_thumbsup_particleInit_78(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleInit_thumbsup_particleInit_13(__n128 a1, double a2, float32x4_t a3, double a4, float32x4_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, long long *a10, __n128 *a11, _DWORD *a12, __n128 *a13, float32x4_t *a14)
{
  long long v14 = *a10;
  a3.i32[0] = -1127428915;
  if (a8) {
    a3.f32[0] = 0.025;
  }
  a5.i32[0] = 1018658868;
  if (!a8) {
    a5.f32[0] = -0.0224;
  }
  if (a9 != 270 && a9 != 90) {
    a3.f32[0] = -0.0;
  }
  a3.f32[0] = a1.n128_f32[0] + a3.f32[0];
  a3.i32[1] = a1.n128_i32[1];
  a3.i32[2] = a1.n128_i32[2];
  a5.i32[1] = -1128824780;
  a5.i32[2] = 0;
  float32x4_t result = vaddq_f32(a5, a3);
  float32x4_t v16 = vaddq_f32(a5, result);
  v17.i64[0] = 0x3F0000003F000000;
  v17.i64[1] = 0x3F0000003F000000;
  float32x4_t v18 = vmlaq_f32(v16, v17, vsubq_f32(result, v16));
  *a11 = (__n128)result;
  *a12 = 978433815;
  result.i32[3] = 1.0;
  *a13 = (__n128)result;
  v18.i32[3] = 1.0;
  *a14 = v18;
  HIDWORD(v14) = 978433815;
  *a10 = v14;
  return result;
}

float __vfx_script_thumbsup_particleInit_13(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
  return result;
}

float32x4_t ParticleInit_thumbsup_particleInit_142(__n128 a1, double a2, float32x4_t a3, double a4, float32x4_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, long long *a10, __n128 *a11, _DWORD *a12, __n128 *a13, float32x4_t *a14)
{
  long long v14 = *a10;
  a3.i32[0] = -1127428915;
  if (a8) {
    a3.f32[0] = 0.025;
  }
  a5.i32[0] = 1024470496;
  if (!a8) {
    a5.f32[0] = -0.0352;
  }
  if (a9 != 270 && a9 != 90) {
    a3.f32[0] = -0.0;
  }
  a3.f32[0] = a1.n128_f32[0] + a3.f32[0];
  a3.i32[1] = a1.n128_i32[1];
  a3.i32[2] = a1.n128_i32[2];
  a5.i32[1] = -1123013152;
  a5.i32[2] = 0;
  float32x4_t result = vaddq_f32(a5, a3);
  float32x4_t v16 = vaddq_f32(a5, result);
  v17.i64[0] = 0x3F0000003F000000;
  v17.i64[1] = 0x3F0000003F000000;
  float32x4_t v18 = vmlaq_f32(v16, v17, vsubq_f32(result, v16));
  *a11 = (__n128)result;
  *a12 = 983386449;
  result.i32[3] = 1.0;
  *a13 = (__n128)result;
  v18.i32[3] = 1.0;
  *a14 = v18;
  HIDWORD(v14) = 983386449;
  *a10 = v14;
  return result;
}

float __vfx_script_thumbsup_particleInit_142(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
  return result;
}

__n128 ParticleUpdate_thumbsup_particleUpdate_6(float a1, float32x4_t a2, float a3, float a4, float a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, float32x4_t *a16, float *a17, __n128 *a18)
{
  __n128 v22 = *a18;
  __n128 v54 = *a18;
  v22.n128_f32[0] = fminf(fmaxf(a1 * 0.5, 0.0), 1.0);
  vfx_script_texture_sample1d_delayInitStub(v22.n128_f64[0]);
  float v48 = v23;
  float v24 = fminf(fmaxf((float)(a4 - a3) / (float)(1.0 - a3), 0.0), 1.0);
  *(float *)&double v25 = v24;
  vfx_script_texture_sample1d_delayInitStub(v25);
  LODWORD(v26) = 0;
  HIDWORD(v26) = v27;
  int8x16_t v47 = (int8x16_t)v26;
  float v46 = cosf((float)(v48 + v48) * 10.0);
  float v43 = sinf((float)((float)(v48 + v48) * 10.0) + 0.3);
  *(float *)&double v28 = v24;
  vfx_script_texture_sample1d_delayInitStub(v28);
  float32x4_t v49 = v29;
  v29.f32[0] = fminf(fmaxf((float)(a4 + -4.0) + (float)(a4 + -4.0), 0.0), 1.0);
  vfx_script_texture_sample1d_delayInitStub(*(double *)v29.i64);
  float32x4_t v45 = v30;
  float v31 = fminf(fmaxf((float)(a1 + -0.02) / 0.2, 0.0), 1.0);
  v30.f32[0] = v31;
  vfx_script_texture_sample1d_delayInitStub(*(double *)v30.i64);
  float v42 = v32;
  *(float *)&double v33 = v31;
  vfx_script_texture_sample1d_delayInitStub(v33);
  if (a10) {
    unsigned int v35 = -1;
  }
  else {
    unsigned int v35 = 0;
  }
  v36.i32[2] = 0;
  v36.i32[3] = v44;
  *(float32x2_t *)v36.f32 = vmul_f32(vmul_f32((float32x2_t)__PAIR64__(LODWORD(v43), LODWORD(v46)), (float32x2_t)vdup_n_s32(0x3C23D70Au)), (float32x2_t)vdup_n_s32(0x3E4CCCCDu));
  float32x4_t v37 = vaddq_f32(vsubq_f32(a2, (float32x4_t)vbslq_s8((int8x16_t)vdupq_n_s32(v35), (int8x16_t)0, v47)), v36);
  float32x4_t v38 = vaddq_f32(v37, (float32x4_t)xmmword_1D0840710);
  float32x4_t v53 = vmlaq_n_f32(v38, vsubq_f32(v37, v38), a5);
  float v39 = 0.015 * vmulq_f32(v49, v45).f32[0];
  if (a10) {
    *(float *)v34.i32 = v42;
  }
  int32x4_t v51 = v34;
  *(float *)v34.i32 = v31;
  vfx_script_texture_sample1d_delayInitStub(*(double *)v34.i64);
  *a16 = v53;
  *a17 = v39;
  result.n128_u64[0] = vzip1q_s32(v51, v40).u64[0];
  result.n128_u64[1] = v54.n128_u64[1];
  *a18 = result;
  return result;
}

uint64_t __vfx_script_thumbsup_particleUpdate_6(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float ParticleUpdate_thumbsup_particleUpdate_76(float32x4_t a1, float32x4_t a2, float a3, float a4, float a5, float32x4_t a6, float a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, float32x4_t *a13, float *a14)
{
  float v19 = fminf(fmaxf(a3, 0.0), 1.0) * 3.14159265 * 0.5;
  float32x4_t v20 = vmlaq_n_f32(a1, vsubq_f32(a2, a1), sinf(v19));
  float32x4_t v21 = vaddq_f32(v20, (float32x4_t)xmmword_1D0840710);
  float32x4_t v22 = vsubq_f32(v20, v21);
  float32x4_t v30 = vmlaq_n_f32(v21, v22, a4);
  v22.f32[0] = fminf(fmaxf((float)(a3 - a5) / (float)(1.0 - a5), 0.0), 1.0);
  vfx_script_texture_sample1d_delayInitStub(*(double *)v22.i64);
  float v24 = vmuls_lane_f32(6.0, a6, 3) * v23;
  *(float *)&double v25 = fminf(fmaxf((float)(a7 + -3.7) / 0.5, 0.0), 1.0);
  vfx_script_texture_sample1d_delayInitStub(v25);
  float result = v24 * v26;
  *a13 = v30;
  *a14 = result;
  return result;
}

uint64_t __vfx_script_thumbsup_particleUpdate_76(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float ParticleUpdate_thumbsup_particleUpdate_34(float32x4_t a1, float32x4_t a2, float a3, float a4, float32x4_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, float32x4_t *a10, float *a11)
{
  float v14 = fminf(fmaxf(a3, 0.0), 1.0) * 3.14159265 * 0.5;
  float32x4_t v15 = vmlaq_n_f32(a1, vsubq_f32(a2, a1), sinf(v14));
  float32x4_t v16 = vaddq_f32(v15, (float32x4_t)xmmword_1D0840710);
  float32x4_t v17 = vsubq_f32(v15, v16);
  float32x4_t v25 = vmlaq_n_f32(v16, v17, a4);
  v17.f32[0] = fminf(fmaxf(a3 / 0.8, 0.0), 1.0);
  vfx_script_texture_sample1d_delayInitStub(*(double *)v17.i64);
  float v19 = vmuls_lane_f32(3.0, a5, 3) * v18;
  *(float *)&double v20 = fminf(fmaxf((float)(a3 + -3.5) + (float)(a3 + -3.5), 0.0), 1.0);
  vfx_script_texture_sample1d_delayInitStub(v20);
  float result = v19 * v21;
  *a10 = v25;
  *a11 = result;
  return result;
}

uint64_t __vfx_script_thumbsup_particleUpdate_34(double a1)
{
  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

double OUTLINED_FUNCTION_4_3(float a1)
{
  return a1;
}

void ptKTraceInitialize()
{
  if (kdebug_is_enabled())
  {
    uint64_t v0 = _PTLogSystem();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v1 = 0;
      _os_log_impl(&dword_1D0778000, v0, OS_LOG_TYPE_INFO, "Tracing enabled", v1, 2u);
    }
  }
}

unint64_t PTVersionGetMajor(unint64_t a1)
{
  return a1 >> 20;
}

uint64_t PTVersionGetMinor(unsigned int a1)
{
  return (a1 >> 10) & 0x3FF;
}

uint64_t PTVersionGetRevision(__int16 a1)
{
  return a1 & 0x3FF;
}

uint64_t PTVersionMake(int a1, __int16 a2, __int16 a3)
{
  return (a1 << 20) | ((a2 & 0x3FF) << 10) | a3 & 0x3FF;
}

id PTVersionToString(uint64_t a1, uint64_t a2, void *a3)
{
  return PTVersionToStringWithComponents(a1, 2, a3);
}

id PTVersionToStringWithComponents(uint64_t a1, uint64_t a2, id a3)
{
  if (a2 == 2)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld.%d.%d", (int)(a1 >> 20), (a1 >> 10) & 0x3FF, a1 & 0x3FF);
  }
  else if (a2 == 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld.%d", (int)(a1 >> 20), (a1 >> 10) & 0x3FF, v5);
  }
  else
  {
    if (a2) {
      goto LABEL_8;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", (int)(a1 >> 20), v4, v5);
  }
  a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return a3;
}

id PTVersionStringWithComponents(void *a1, uint64_t a2)
{
  uint64_t v3 = PTVersionFromString(a1);

  return PTVersionToStringWithComponents(v3, a2, v4);
}

uint64_t PTVersionFromString(void *a1)
{
  double v1 = [a1 componentsSeparatedByString:@"."];
  uint64_t v2 = [v1 count];
  __int16 v3 = 0;
  if (v2 == 1)
  {
    __int16 v4 = 0;
    goto LABEL_7;
  }
  if (v2 == 2)
  {
LABEL_5:
    __int16 v4 = v3;
    float32x4_t v8 = [v1 objectAtIndexedSubscript:1];
    __int16 v3 = [v8 integerValue];

LABEL_7:
    float32x4_t v9 = [v1 objectAtIndexedSubscript:0];
    int v10 = [v9 integerValue];

    int v5 = v10 << 20;
    goto LABEL_8;
  }
  __int16 v4 = 0;
  int v5 = 0;
  if (v2 == 3)
  {
    float v6 = [v1 objectAtIndexedSubscript:2];
    __int16 v7 = [v6 integerValue];

    __int16 v3 = v7;
    goto LABEL_5;
  }
LABEL_8:
  uint64_t v11 = ((v3 & 0x3FF) << 10) | v5 | v4 & 0x3FF;

  return v11;
}

void OUTLINED_FUNCTION_3_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void SetEspressoArray_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  float v6 = [NSNumber numberWithUnsignedInteger:a2];
  int v7 = 138412546;
  float32x4_t v8 = v5;
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_1D0778000, a3, OS_LOG_TYPE_ERROR, "espresso array count %@ ≠ buffer count %@", (uint8_t *)&v7, 0x16u);
}

void _DebugLogEspressoBufferRow_cold_1(uint64_t a1, uint64_t a2)
{
  LODWORD(v4) = 134218242;
  *(void *)((char *)&v4 + 4) = a2;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_11(&dword_1D0778000, v2, v3, "%zu: %@", (void)v4, DWORD2(v4));
}

void _DebugLogEspressoBufferRow_cold_2()
{
}

void __loadTracksWithMediaType_block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_1(&dword_1D0778000, v0, v1, "Error loadTracksWithMediaType %@", v2);
}

void __loadMetadataForFormat_block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1D0778000, v1, OS_LOG_TYPE_ERROR, "Error loadMetadataForFormat %@ format %@", v2, 0x16u);
}

void PTParameterPairSerialization_GetParameter_cold_1(unsigned __int16 a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "Couldn't find parameter %d in parameter pair list.", (uint8_t *)v2, 8u);
}

void PTParameterPairSerialization_GetParameter_cold_2(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Failed to get parameter %d of type %d. Unknown type.", (uint8_t *)v3, 0xEu);
}

void isExpectedSize_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t __getVCPHandGestureImageRequestClass_block_invoke_cold_1()
{
  return __getVCPHandGestureVideoRequestClass_block_invoke_cold_1();
}

uint64_t __getVCPHandGestureVideoRequestClass_block_invoke_cold_1()
{
  return __getVCPHandObjectClass_block_invoke_cold_1();
}

uint64_t __getVCPHandObjectClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return getVCPRequestFrameWidthPropertyKey_cold_1(v0);
}

uint64_t getVCPRequestFrameWidthPropertyKey_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return +[PTSerialization registerSerializationClass:](v0);
}

void FigCFDictionaryGetInt32IfPresent_cold_1()
{
  __assert_rtn("figCFDictionaryGetNumberIfPresent", "PTMSRResize.m", 63, "key != NULL");
}

void FigCFDictionaryGetInt32IfPresent_cold_2()
{
  __assert_rtn("figCFDictionaryGetNumberIfPresent", "PTMSRResize.m", 64, "valuePtr != NULL");
}

void filter_coefficients_cold_1()
{
  __assert_rtn("to_fixed", "PTMSRResize.m", 100, "intsz + decsz <= (int)(sizeof( ret) * 8)");
}

void _ErrorForDataBufferNotFoundAtURL_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = @"data buffer not found at url";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "%@: %@", (uint8_t *)&v2, 0x16u);
}

void PeakInNormalizedRectFromLockedPixelBufferInfo_cold_1()
{
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1F40D9AC0](space);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B70](plist);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9BE8](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
}

BOOL CGColorSpaceIsHLGBased(CGColorSpaceRef s)
{
  return MEMORY[0x1F40D9C20](s);
}

BOOL CGColorSpaceIsPQBased(CGColorSpaceRef s)
{
  return MEMORY[0x1F40D9C30](s);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x1F40D9C40](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9C60](space);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.simd_float4 x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.simd_float4 x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1F40DB2F0](dict, rect);
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x1F40DBBC0](desc);
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x1F40DBC88](desc);
}

void CMRemoveAttachment(CMAttachmentBearerRef target, CFStringRef key)
{
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1F40DBDC8](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDF8](retstr, sbuf);
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
}

CMTime *__cdecl CMTimeAbsoluteValue(CMTime *__return_ptr retstr, CMTime *time)
{
  return (CMTime *)MEMORY[0x1F40DC080](retstr, time);
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

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1D8](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreate(CFAllocatorRef allocator, CMVideoCodecType codecType, int32_t width, int32_t height, CFDictionaryRef extensions, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DC300](allocator, *(void *)&codecType, *(void *)&width, *(void *)&height, extensions, formatDescriptionOut);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1F40DC338](videoDesc);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1F40DFB48](buffer, key, attachmentMode);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
}

void CVBufferRemoveAllAttachments(CVBufferRef buffer)
{
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x1F40DFC78](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x1F40DFC80](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x1F40DFC98](image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD08](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

uint64_t CVPixelBufferGetAttributes()
{
  return MEMORY[0x1F40DFD20]();
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
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

uint64_t CVPixelFormatDescriptionGetDescriptionWithPixelFormatType()
{
  return MEMORY[0x1F40DFE58]();
}

uint64_t FTGetChipIdentifier()
{
  return MEMORY[0x1F411A278]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9208](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x1F4124C48]();
}

uint64_t IOSurfaceAcceleratorSetCustomFilter()
{
  return MEMORY[0x1F4124C68]();
}

uint64_t IOSurfaceAcceleratorTransformSurface()
{
  return MEMORY[0x1F4124C78]();
}

CFDictionaryRef IOSurfaceCopyAllValues(IOSurfaceRef buffer)
{
  return (CFDictionaryRef)MEMORY[0x1F40E92F8](buffer);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E9300](buffer, key);
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

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9480](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E94F8](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

NSArray *MLAllComputeDevices(void)
{
  return (NSArray *)MEMORY[0x1F40DB7D0]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1F40E7290]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1F40E72A8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1F40F7128](task, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1F41034D0](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1F41034F0](session, sourceBuffer, destinationBuffer);
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

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x1F40C9C00]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
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

simd_float4 _simd_cos_f4(simd_float4 x)
{
  MEMORY[0x1F40CA150]((__n128)x);
  return result;
}

simd_float4 _simd_sin_f4(simd_float4 x)
{
  MEMORY[0x1F40CA190]((__n128)x);
  return result;
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

long double asin(long double __x)
{
  MEMORY[0x1F40CA3D0](__x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x1F40CA468](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

float cosf(float a1)
{
  MEMORY[0x1F40CB8B0](a1);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x1F4118628]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1F4118648]();
}

uint64_t espresso_context_set_low_precision_accumulation()
{
  return MEMORY[0x1F4118658]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1F4118668]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1F4118678]();
}

uint64_t espresso_get_last_error()
{
  return MEMORY[0x1F41186C8]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1F41186E0]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x1F41186F8]();
}

uint64_t espresso_network_bind_direct_cvpixelbuffer()
{
  return MEMORY[0x1F4118700]();
}

uint64_t espresso_network_change_input_blob_shapes_seq()
{
  return MEMORY[0x1F4118740]();
}

uint64_t espresso_network_get_version()
{
  return MEMORY[0x1F4118780]();
}

uint64_t espresso_network_select_configuration()
{
  return MEMORY[0x1F41187A0]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1F41187D8]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1F41187F0]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1F4118818]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1F4118828]();
}

uint64_t espresso_plan_set_priority()
{
  return MEMORY[0x1F4118858]();
}

uint64_t espresso_plan_submit()
{
  return MEMORY[0x1F4118878]();
}

float exp2f(float a1)
{
  MEMORY[0x1F40CBFF0](a1);
  return result;
}

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
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

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x1F40CC6F0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
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

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1F40CCA58]();
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1F40CE530](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_minvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
}

void vDSP_vfill(const float *__A, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

uint64_t vfx_script_get_arguments_buffer_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    dlopenHelper_VFX(a1);
  }
  return MEMORY[0x1F4167690]();
}

uint64_t vfx_script_clock_simulation_index_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    dlopenHelper_VFX(a1);
  }
  return MEMORY[0x1F4167620]();
}

uint64_t vfx_script_get_iteration_range_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    dlopenHelper_VFX(a1);
  }
  return MEMORY[0x1F41676A0]();
}

uint64_t vfx_script_texture_sample1d_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    dlopenHelper_VFX(a1);
  }
  return MEMORY[0x1F41676D0]();
}

uint64_t vfx_script_curve_create_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    dlopenHelper_VFX(a1);
  }
  return MEMORY[0x1F4167670]();
}

uint64_t vfx_script_curve_evaluate_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    dlopenHelper_VFX(a1);
  }
  return MEMORY[0x1F4167680]();
}

uint64_t vfx_script_curve_destroy_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    dlopenHelper_VFX(a1);
  }
  return MEMORY[0x1F4167678]();
}

uint64_t vfx_script_clock_delta_time_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    dlopenHelper_VFX(a1);
  }
  return MEMORY[0x1F4167608]();
}

uint64_t vfx_script_clock_time_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    dlopenHelper_VFX(a1);
  }
  return MEMORY[0x1F4167628]();
}

uint64_t vfx_script_particle_find_nearest_neighbors_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    dlopenHelper_VFX(a1);
  }
  return MEMORY[0x1F41676A8]();
}

uint64_t vfx_script_particle_get_id_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    dlopenHelper_VFX(a1);
  }
  return MEMORY[0x1F41676B0]();
}

uint64_t vfx_script_particle_get_size1d_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    dlopenHelper_VFX(a1);
  }
  return MEMORY[0x1F41676C0]();
}

uint64_t vfx_script_particle_get_position_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    dlopenHelper_VFX(a1);
  }
  return MEMORY[0x1F41676B8]();
}

uint64_t vfx_script_clock_is_first_frame_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    dlopenHelper_VFX(a1);
  }
  return MEMORY[0x1F4167610]();
}

uint64_t vfx_script_color_ramp_create_setting_color_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    dlopenHelper_VFX(a1);
  }
  return MEMORY[0x1F4167650]();
}

uint64_t vfx_script_color_ramp_evaluate_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    dlopenHelper_VFX(a1);
  }
  return MEMORY[0x1F4167668]();
}

uint64_t vfx_script_color_ramp_destroy_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    dlopenHelper_VFX(a1);
  }
  return MEMORY[0x1F4167658]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_VFX(double a1)
{
  return a1;
}

double gotLoadHelper_x8__OBJC_CLASS___VFXRenderer(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    return dlopenHelper_VFX(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___VFXSceneLoadOptions(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    return dlopenHelper_VFX(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS____TtC3VFX8VFXScene(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    return dlopenHelper_VFX(result);
  }
  return result;
}