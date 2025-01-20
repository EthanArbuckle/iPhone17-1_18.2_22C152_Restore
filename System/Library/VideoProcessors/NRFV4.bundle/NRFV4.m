uint64_t determineCompressedOutputPixelFormat(uint64_t result, int a2)
{
  unsigned int v2;
  int v3;
  BOOL v4;
  int v5;
  unsigned int v6;

  switch(a2)
  {
    case 1:
      v2 = 642934849;
      v3 = 642527336;
      v4 = result == 1751527984;
      v5 = 644376112;
      goto LABEL_6;
    case 2:
      v2 = 760375361;
      v3 = 759967848;
      v4 = result == 1751527984;
      v5 = 761816624;
      goto LABEL_6;
    case 3:
      v2 = 793929793;
      v3 = 793522280;
      v4 = result == 1751527984;
      v5 = 795371056;
      goto LABEL_6;
    case 4:
      v2 = 2085775425;
      v3 = 2085367912;
      v4 = result == 1751527984;
      v5 = 2087216688;
LABEL_6:
      if (!v4) {
        v5 = result;
      }
      if (result == 1651926376) {
        v6 = v3;
      }
      else {
        v6 = v5;
      }
      if (result == 1647719528) {
        result = v2;
      }
      else {
        result = v6;
      }
      break;
    default:
      return result;
  }
  return result;
}

void sub_26317E66C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_26317FCF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL readLUT(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v9 = a1;
  id v10 = a4;
  unint64_t v11 = 0;
  char v16 = 1;
  do
  {
    unsigned int v12 = (unsigned __int16)objc_msgSend(v9, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", a2, v11, 0, &v16);
    if (v12 >= 0x3FF) {
      LOWORD(v12) = 1023;
    }
    *(_WORD *)(a3 + 2 * v11) = v12;
    if (v11 > 0xE) {
      break;
    }
    ++v11;
  }
  while (v16);
  if (v16)
  {
    unint64_t v13 = 0;
    do
    {
      *(_WORD *)(a5 + 2 * v13) = objc_msgSend(v9, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", v10, v13, 0, &v16);
      BOOL v14 = v16 != 0;
      if (v13 > 0xE) {
        break;
      }
      ++v13;
    }
    while (v16);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

void loadKernel(void *a1, uint64_t a2, void **a3)
{
  v5 = NSString;
  id v6 = a1;
  objc_msgSend(v5, "stringWithFormat:", @"H13FastPowerBlur::PowerBlur_%s", a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 computePipelineStateFor:v9 constants:0];

  v8 = *a3;
  *a3 = (void *)v7;
}

void sub_263189F4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_26318AE0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_26318B548(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_26318B674(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_26318B978(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t decompand8To12To10ToU16(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = 0;
    int32x4_t v2 = (int32x4_t)xmmword_263482000;
    int32x4_t v3 = (int32x4_t)xmmword_263380160;
    int64x2_t v4 = (int64x2_t)xmmword_263482010;
    int64x2_t v5 = (int64x2_t)xmmword_263482020;
    int64x2_t v6 = (int64x2_t)xmmword_263480560;
    uint64x2_t v7 = (uint64x2_t)vdupq_n_s64(0x7FuLL);
    int8x16_t v8 = (int8x16_t)vdupq_n_s32(0xFFE0u);
    uint64x2_t v9 = (uint64x2_t)vdupq_n_s64(0x20uLL);
    uint64x2_t v10 = (uint64x2_t)vdupq_n_s64(0x3FuLL);
    int8x16_t v11 = (int8x16_t)vdupq_n_s32(0xFFC0u);
    int64x2_t v12 = vdupq_n_s64(8uLL);
    int64x2_t v13 = (int64x2_t)xmmword_263380330;
    v14.i64[0] = 0x100000001;
    v14.i64[1] = 0x100000001;
    v15.i64[0] = 0x1F0000001FLL;
    v15.i64[1] = 0x1F0000001FLL;
    v16.i64[0] = 0x2000000020;
    v16.i64[1] = 0x2000000020;
    v17.i64[0] = 0x100000001;
    v17.i64[1] = 0x100000001;
    v18.i64[0] = 0x800000008;
    v18.i64[1] = 0x800000008;
    do
    {
      uint32x4_t v19 = vshrq_n_u32((uint32x4_t)v2, 5uLL);
      uint32x4_t v20 = vshrq_n_u32((uint32x4_t)v3, 5uLL);
      int32x4_t v21 = (int32x4_t)vorrq_s8(vandq_s8((int8x16_t)vshlq_u32(v14, (uint32x4_t)vaddq_s32((int32x4_t)vmaxq_u32(v20, v14), v17)), (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)v13, v10), (int32x4_t)vcgtq_u64((uint64x2_t)v6, v10))), (int8x16_t)vshlq_u32((uint32x4_t)vorrq_s8(vbicq_s8(v16, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v9, (uint64x2_t)v13), (int32x4_t)vcgtq_u64(v9, (uint64x2_t)v6))), vandq_s8((int8x16_t)v3, v15)), vqsubq_u32(v20, v14)));
      int32x4_t v22 = (int32x4_t)vorrq_s8(vandq_s8((int8x16_t)vshlq_u32(v14, (uint32x4_t)vaddq_s32((int32x4_t)vmaxq_u32(v19, v14), v17)), (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)v5, v10), (int32x4_t)vcgtq_u64((uint64x2_t)v4, v10))), (int8x16_t)vshlq_u32((uint32x4_t)vorrq_s8(vbicq_s8(v16, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v9, (uint64x2_t)v5), (int32x4_t)vcgtq_u64(v9, (uint64x2_t)v4))), vandq_s8((int8x16_t)v2, v15)), vqsubq_u32(v19, v14)));
      *(int16x8_t *)(a1 + v1) = vuzp1q_s16((int16x8_t)vaddq_s32((int32x4_t)vorrq_s8(vandq_s8((int8x16_t)vshlq_n_s32(v21, 4uLL), v11), (int8x16_t)vshrq_n_u32((uint32x4_t)v21, 6uLL)), (int32x4_t)vandq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)v13, v7), (int32x4_t)vcgtq_u64((uint64x2_t)v6, v7)), v8)), (int16x8_t)vaddq_s32((int32x4_t)vorrq_s8(vandq_s8((int8x16_t)vshlq_n_s32(v22, 4uLL), v11), (int8x16_t)vshrq_n_u32((uint32x4_t)v22, 6uLL)), (int32x4_t)vandq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)v5, v7), (int32x4_t)vcgtq_u64((uint64x2_t)v4, v7)), v8)));
      int64x2_t v5 = vaddq_s64(v5, v12);
      int64x2_t v6 = vaddq_s64(v6, v12);
      int64x2_t v13 = vaddq_s64(v13, v12);
      int64x2_t v4 = vaddq_s64(v4, v12);
      int32x4_t v3 = vaddq_s32(v3, v18);
      int32x4_t v2 = vaddq_s32(v2, v18);
      v1 += 16;
    }
    while (v1 != 512);
    return 0;
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

uint64_t decompand8To10ToU16(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = 0;
    int32x4_t v2 = (int32x4_t)xmmword_263482000;
    int32x4_t v3 = (int32x4_t)xmmword_263380160;
    int64x2_t v4 = (int64x2_t)xmmword_263482010;
    int64x2_t v5 = (int64x2_t)xmmword_263482020;
    int64x2_t v6 = (int64x2_t)xmmword_263480560;
    int64x2_t v7 = (int64x2_t)xmmword_263380330;
    uint64x2_t v8 = (uint64x2_t)vdupq_n_s64(0x7FuLL);
    uint64x2_t v9 = (uint64x2_t)vdupq_n_s64(0xDFuLL);
    int8x16_t v10 = (int8x16_t)vdupq_n_s32(0x1F0u);
    int8x16_t v11 = (int8x16_t)vdupq_n_s32(0x208u);
    int8x16_t v12 = (int8x16_t)vdupq_n_s32(0x104u);
    int8x16_t v13 = (int8x16_t)vdupq_n_s64(0xFFFFFFFFFFFFFFE0);
    int64x2_t v14 = vdupq_n_s64(0xC0uLL);
    int8x16_t v15 = (int8x16_t)vdupq_n_s32(0xFFE0u);
    int64x2_t v16 = vdupq_n_s64(8uLL);
    v17.i64[0] = 0xF8000000F8;
    v17.i64[1] = 0xF8000000F8;
    v18.i64[0] = 0x7E0000007ELL;
    v18.i64[1] = 0x7E0000007ELL;
    v19.i64[0] = 0x200000002000;
    v19.i64[1] = 0x200000002000;
    v20.i64[0] = 0x800000008;
    v20.i64[1] = 0x800000008;
    do
    {
      int32x4_t v21 = (int32x4_t)vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)v5, v8), (int32x4_t)vcgtq_u64((uint64x2_t)v4, v8)), vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)v5, v9), (int32x4_t)vcgtq_u64((uint64x2_t)v4, v9)), vorrq_s8(vandq_s8((int8x16_t)vshlq_n_s32(v2, 4uLL), v10), v11), vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64((int64x2_t)vandq_s8((int8x16_t)v5, v13), v14), (int32x4_t)vceqq_s64((int64x2_t)vandq_s8((int8x16_t)v4, v13), v14)), vorrq_s8(vandq_s8((int8x16_t)vshlq_n_s32(v2, 3uLL), v17), v12), (int8x16_t)(*(_OWORD *)&vandq_s8((int8x16_t)vaddq_s32(v2, v2), v18) | __PAIR128__(0x8100000081, 0x8100000081)))), (int8x16_t)v2);
      int32x4_t v22 = (int32x4_t)vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)v7, v8), (int32x4_t)vcgtq_u64((uint64x2_t)v6, v8)), vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)v7, v9), (int32x4_t)vcgtq_u64((uint64x2_t)v6, v9)), vorrq_s8(vandq_s8((int8x16_t)vshlq_n_s32(v3, 4uLL), v10), v11), vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64((int64x2_t)vandq_s8((int8x16_t)v7, v13), v14), (int32x4_t)vceqq_s64((int64x2_t)vandq_s8((int8x16_t)v6, v13), v14)), vorrq_s8(vandq_s8((int8x16_t)vshlq_n_s32(v3, 3uLL), v17), v12), (int8x16_t)(*(_OWORD *)&vandq_s8((int8x16_t)vaddq_s32(v3, v3), v18) | __PAIR128__(0x8100000081, 0x8100000081)))), (int8x16_t)v3);
      int32x4_t v23 = (int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v21, 6uLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v21, 4uLL));
      int32x4_t v24 = (int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v22, 6uLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v22, 4uLL));
      *(int16x8_t *)(a1 + v1) = vuzp1q_s16((int16x8_t)vaddq_s32((int32x4_t)vandq_s8((int8x16_t)vcgtq_u32((uint32x4_t)v24, v19), v15), v24), (int16x8_t)vaddq_s32((int32x4_t)vandq_s8((int8x16_t)vcgtq_u32((uint32x4_t)v23, v19), v15), v23));
      int64x2_t v5 = vaddq_s64(v5, v16);
      int64x2_t v6 = vaddq_s64(v6, v16);
      int64x2_t v7 = vaddq_s64(v7, v16);
      int64x2_t v4 = vaddq_s64(v4, v16);
      int32x4_t v3 = vaddq_s32(v3, v20);
      int32x4_t v2 = vaddq_s32(v2, v20);
      v1 += 16;
    }
    while (v1 != 512);
    return 0;
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

uint64_t getFloatParameter(void *a1, uint64_t a2, _DWORD *a3)
{
  char v5 = 0;
  uint64_t result = objc_msgSend(a1, "cmi_floatValueForKey:defaultValue:found:", a2, &v5, 0.0);
  if (!v5) {
    *a3 = -73340;
  }
  return result;
}

uint64_t convertSoftISPPixelFormatToShaderInt(uint64_t result)
{
  if (!(!v2 & v1))
  {
    switch((int)result)
    {
      case 20:
        return 21;
      case 21:
        return 22;
      case 22:
        return 23;
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
        return 0;
      case 30:
      case 31:
        return result;
      default:
        JUMPOUT(0);
    }
  }
  if ((result - 1) >= 3 && (result - 10) >= 2) {
    return 0;
  }
  return result;
}

id createPipelines(void *a1, void *a2, void *a3)
{
  uint64_t v222 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v214 = a2;
  id v213 = a3;
  int64x2_t v6 = objc_opt_new();
  if (!v6)
  {
    FigDebugAssert3();
    id v153 = 0;
    goto LABEL_741;
  }
  long long v218 = 0u;
  long long v219 = 0u;
  long long v216 = 0u;
  long long v217 = 0u;
  id obj = v5;
  uint64_t v215 = [obj countByEnumeratingWithState:&v216 objects:v221 count:16];
  if (!v215) {
    goto LABEL_738;
  }
  uint64_t v212 = *(void *)v217;
  v203 = v6;
LABEL_4:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v217 != v212) {
      objc_enumerationMutation(obj);
    }
    uint64x2_t v8 = *(void **)(*((void *)&v216 + 1) + 8 * v7);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    int v9 = [v8 intValue];
    if (v9 > 49)
    {
      if (v9 <= 51)
      {
        if (v9 == 50)
        {
          id v142 = v214;
          id v143 = v213;
          unsigned int v220 = 0;
          v144 = [[H13FastRawScaleStage alloc] initWithMetalContext:v142 staticParameters:v143];
          if (v144)
          {
            v201 = [[H13FastBayerProcStage alloc] initWithMetalContext:v142 staticParameters:v143];
            if (v201)
            {
              v189 = [[H13FastRawMBNRStage alloc] initWithMetalContext:v142 staticParameters:v143];
              if (v189)
              {
                v178 = [[H13FastDemosaicStage alloc] initWithMetalContext:v142 staticParameters:v143 outputGammaEncoded:1];
                if (v178)
                {
                  v171 = [[H13FastPostDemosaicProcStage alloc] initWithMetalContext:v142 staticParameters:v143];
                  if (v171)
                  {
                    v166 = [[H13FastLumaSharpeningStage alloc] initWithMetalContext:v142 staticParameters:v143];
                    if (v166)
                    {
                      v145 = [[H13FastLTMStage alloc] initWithMetalContext:v142 staticParameters:v143 error:&v220];
                      v146 = v145;
                      unsigned int v147 = v220;
                      if (v220 != -73684)
                      {
                        if (!v145) {
                          goto LABEL_434;
                        }
LABEL_435:
                        uint64_t v148 = objc_opt_new();
                        v149 = (id *)v148;
                        if (v148)
                        {
                          unsigned int v220 = -[SoftISPGraph addStage:withName:](v148, v144, @"RawScale");
                          if (!v220)
                          {
                            unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v149, v201, @"BayerProc");
                            if (!v220)
                            {
                              unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v149, v189, @"RawMBNR");
                              if (!v220)
                              {
                                unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v149, v178, @"DemYUV");
                                if (!v220)
                                {
                                  unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v149, v171, @"PostDemProc");
                                  if (!v220)
                                  {
                                    unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v149, v166, @"LumaSharpening");
                                    if (!v220
                                      && (!v146
                                       || (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v149, v146, @"ComputeLTM")) == 0))
                                    {
                                      unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v149, @"<input>", @"inputTex", @"RawScale", @"inputTex");
                                      if (!v220)
                                      {
                                        unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v149, @"RawScale", @"outputTex", @"BayerProc", @"inputTex");
                                        if (v220) {
                                          goto LABEL_469;
                                        }
                                        unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:isNullable:](v149, @"RawScale", @"outputSyntheticThumbnailTex", @"BayerProc", @"inputSyntheticThumbnailTex", 1);
                                        if (v220) {
                                          goto LABEL_469;
                                        }
                                        unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v149, @"BayerProc", @"outputTex", @"RawMBNR", @"inputTex");
                                        if (v220) {
                                          goto LABEL_469;
                                        }
                                        unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v149, @"RawMBNR", @"outputTex", @"DemYUV", @"inputTex");
                                        if (v220
                                          || (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v149, @"DemYUV", @"outputLumaTex", @"PostDemProc", @"inputLumaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v149, @"DemYUV", @"outputChromaTex", @"PostDemProc", @"inputChromaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v149, @"PostDemProc", @"outputLumaTex", @"LumaSharpening", @"inputLumaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v149,
                                                                     @"LumaSharpening",
                                                                     @"outputLumaTex",
                                                                     @"<output>",
                                                                     @"outputLumaTex")) != 0
                                          || (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v149, @"PostDemProc", @"outputChromaTex", @"<output>", @"outputChromaTex")) != 0|| v146&& ((unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v149, @"LumaSharpening", @"outputLumaTex", @"ComputeLTM", @"inputLumaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v149, @"PostDemProc", @"outputChromaTex", @"ComputeLTM", @"inputChromaTex")) != 0))
                                        {
LABEL_469:
                                          FigSignalErrorAt();
                                          v151 = 0;
                                          v150 = 0;
                                        }
                                        else
                                        {
                                          v150 = [[SoftISPPipeline alloc] initWithGraph:v149 metal:v142 staticParameters:v143];
                                          if (v150)
                                          {
                                            v151 = [[QuadraBinStage alloc] initWithDownstreamStage:v150 metalContext:v142 staticParameters:v143];
                                            if (!v151)
                                            {
                                              uint64_t v156 = v157;
                                              LODWORD(v155) = 0;
                                              FigDebugAssert3();
                                              FigSignalErrorAt();
                                              v151 = 0;
                                            }
                                          }
                                          else
                                          {
                                            FigSignalErrorAt();
                                            v151 = 0;
                                          }
                                        }
LABEL_460:
                                        int64x2_t v16 = v151;

                                        int64x2_t v6 = v203;
                                        if (!v16) {
                                          break;
                                        }
                                        goto LABEL_461;
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                        FigSignalErrorAt();
                        v151 = 0;
LABEL_692:
                        v150 = 0;
                        goto LABEL_460;
                      }
                      uint64_t v156 = v157;
                      LODWORD(v155) = 0;
                      FigDebugAssert3();
                      unsigned int v147 = v220;
                      if (v146) {
                        goto LABEL_435;
                      }
LABEL_434:
                      if (v147 == -73684) {
                        goto LABEL_435;
                      }
                      v151 = 0;
LABEL_627:
                      v146 = 0;
                      v149 = 0;
                      goto LABEL_692;
                    }
                    uint64_t v156 = v157;
                    LODWORD(v155) = 0;
                    FigDebugAssert3();
                    v151 = 0;
LABEL_626:
                    v166 = 0;
                    goto LABEL_627;
                  }
                  uint64_t v156 = v157;
                  LODWORD(v155) = 0;
                  FigDebugAssert3();
                  v151 = 0;
LABEL_625:
                  v171 = 0;
                  goto LABEL_626;
                }
                uint64_t v156 = v157;
                LODWORD(v155) = 0;
                FigDebugAssert3();
                v151 = 0;
LABEL_624:
                v178 = 0;
                goto LABEL_625;
              }
              uint64_t v156 = v157;
              LODWORD(v155) = 0;
              FigDebugAssert3();
              v151 = 0;
LABEL_578:
              v189 = 0;
              goto LABEL_624;
            }
            uint64_t v156 = v157;
            LODWORD(v155) = 0;
          }
          else
          {
            uint64_t v156 = v157;
            LODWORD(v155) = 0;
          }
          FigDebugAssert3();
          v151 = 0;
          v201 = 0;
          goto LABEL_578;
        }
        id v22 = v214;
        id v23 = v213;
        unsigned int v220 = 0;
        int32x4_t v24 = [[H13FastRawScaleStage alloc] initWithMetalContext:v22 staticParameters:v23];
        v206 = v8;
        if (v24)
        {
          v25 = [[H13FastBayerProcStage alloc] initWithMetalContext:v22 staticParameters:v23];
          if (!v25)
          {
            uint64_t v156 = v157;
            LODWORD(v155) = 0;
            FigDebugAssert3();
            v31 = 0;
            v180 = 0;
            v191 = 0;
            v26 = 0;
            v28 = 0;
            v30 = 0;
            goto LABEL_94;
          }
          v26 = [[H13FastLTMStage alloc] initWithMetalContext:v22 staticParameters:v23 error:&v220];
          unsigned int v27 = v220;
          if (v220 == -73684)
          {
            uint64_t v156 = v157;
            LODWORD(v155) = 0;
            FigDebugAssert3();
            unsigned int v27 = v220;
          }
          v180 = v25;
          if (v26 || v27 == -73684)
          {
            v28 = [[H13FastRawMBNRStage alloc] initWithMetalContext:v22 staticParameters:v23];
            if (v28)
            {
              v191 = [[H13UtilityConvertStage alloc] initWithMetalContext:v22 staticParameters:v23 inputPixelFormat:11 outputPixelFormat:10];
              if (v191)
              {
                uint64_t v29 = objc_opt_new();
                v30 = (id *)v29;
                if (v29)
                {
                  unsigned int v220 = -[SoftISPGraph addStage:withName:](v29, v24, @"RawScale");
                  if (!v220)
                  {
                    unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v30, v25, @"BayerProc");
                    if (!v220
                      && (!v26
                       || (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v30, v26, @"ComputeLTM")) == 0))
                    {
                      unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v30, v28, @"RawMBNR");
                      if (!v220)
                      {
                        unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v30, v191, @"ConvertToFp16");
                        if (!v220)
                        {
                          unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v30, @"<input>", @"inputTex", @"RawScale", @"inputTex");
                          if (!v220)
                          {
                            unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v30, @"RawScale", @"outputTex", @"BayerProc", @"inputTex");
                            if (v220
                              || (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:isNullable:](v30, @"RawScale", @"outputSyntheticThumbnailTex", @"BayerProc", @"inputSyntheticThumbnailTex", 1)) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v30, @"BayerProc", @"outputTex", @"RawMBNR", @"inputTex")) != 0|| v26&& (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v30, @"RawMBNR", @"outputTex", @"ComputeLTM", @"inputTex")) != 0
                              || (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v30, @"RawMBNR", @"outputTex", @"ConvertToFp16", @"inputTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v30, @"ConvertToFp16", @"outputTex", @"<output>", @"outputTex")) != 0)
                            {
                              FigSignalErrorAt();
                              v31 = 0;
                              v25 = 0;
                            }
                            else
                            {
                              v25 = [[SoftISPPipeline alloc] initWithGraph:v30 metal:v22 staticParameters:v23];
                              if (v25)
                              {
                                v31 = [[QuadraBinStage alloc] initWithDownstreamStage:v25 metalContext:v22 staticParameters:v23];
                                if (!v31)
                                {
                                  uint64_t v156 = v157;
                                  LODWORD(v155) = 0;
                                  FigDebugAssert3();
                                  FigSignalErrorAt();
                                  v31 = 0;
                                }
                              }
                              else
                              {
                                FigSignalErrorAt();
                                v31 = 0;
                              }
                            }
LABEL_94:
                            int64x2_t v16 = v31;

                            int64x2_t v6 = v203;
                            uint64x2_t v8 = v206;
                            if (!v16) {
                              break;
                            }
                            goto LABEL_461;
                          }
                        }
                      }
                    }
                  }
                }
                FigSignalErrorAt();
                v31 = 0;
LABEL_663:
                v25 = 0;
                goto LABEL_94;
              }
              uint64_t v156 = v157;
              LODWORD(v155) = 0;
            }
            else
            {
              uint64_t v156 = v157;
              LODWORD(v155) = 0;
            }
            FigDebugAssert3();
            v31 = 0;
LABEL_645:
            v191 = 0;
            v30 = 0;
            goto LABEL_663;
          }
          v31 = 0;
        }
        else
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          v31 = 0;
          v180 = 0;
        }
        v26 = 0;
        v28 = 0;
        goto LABEL_645;
      }
      if (v9 == 52)
      {
        id v132 = v214;
        id v133 = v213;
        unsigned int v220 = 0;
        v134 = [[H13FastRawScaleStage alloc] initWithMetalContext:v132 staticParameters:v133];
        if (v134)
        {
          v200 = [[H13FastBayerProcStage alloc] initWithMetalContext:v132 staticParameters:v133];
          if (v200)
          {
            v188 = [[H13FastRawMBNRStage alloc] initWithMetalContext:v132 staticParameters:v133];
            if (v188)
            {
              v177 = [[H13FastDemosaicStage alloc] initWithMetalContext:v132 staticParameters:v133 outputGammaEncoded:1];
              if (v177)
              {
                v170 = [[H13FastPostDemosaicProcStage alloc] initWithMetalContext:v132 staticParameters:v133];
                if (v170)
                {
                  v165 = [[H13FastLumaSharpeningStage alloc] initWithMetalContext:v132 staticParameters:v133];
                  if (v165)
                  {
                    v135 = [[H13FastLTMStage alloc] initWithMetalContext:v132 staticParameters:v133 error:&v220];
                    v136 = v135;
                    unsigned int v137 = v220;
                    if (v220 != -73684)
                    {
                      if (!v135) {
                        goto LABEL_396;
                      }
LABEL_397:
                      uint64_t v138 = objc_opt_new();
                      v139 = (id *)v138;
                      if (v138)
                      {
                        unsigned int v220 = -[SoftISPGraph addStage:withName:](v138, v134, @"RawScale");
                        if (!v220)
                        {
                          unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v139, v200, @"BayerProc");
                          if (!v220)
                          {
                            unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v139, v188, @"RawMBNR");
                            if (!v220)
                            {
                              unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v139, v177, @"DemYUV");
                              if (!v220)
                              {
                                unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v139, v170, @"PostDemProc");
                                if (!v220)
                                {
                                  unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v139, v165, @"LumaSharpening");
                                  if (!v220
                                    && (!v136
                                     || (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v139, v136, @"ComputeLTM")) == 0))
                                  {
                                    unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v139, @"<input>", @"inputTex", @"RawScale", @"inputTex");
                                    if (!v220)
                                    {
                                      unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v139, @"RawScale", @"outputTex", @"BayerProc", @"inputTex");
                                      if (v220) {
                                        goto LABEL_468;
                                      }
                                      unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:isNullable:](v139, @"RawScale", @"outputSyntheticThumbnailTex", @"BayerProc", @"inputSyntheticThumbnailTex", 1);
                                      if (v220) {
                                        goto LABEL_468;
                                      }
                                      unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v139, @"BayerProc", @"outputTex", @"RawMBNR", @"inputTex");
                                      if (v220) {
                                        goto LABEL_468;
                                      }
                                      unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v139, @"RawMBNR", @"outputTex", @"DemYUV", @"inputTex");
                                      if (v220
                                        || (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v139, @"DemYUV", @"outputLumaTex", @"PostDemProc", @"inputLumaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v139, @"DemYUV", @"outputChromaTex", @"PostDemProc", @"inputChromaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v139, @"PostDemProc", @"outputLumaTex", @"LumaSharpening", @"inputLumaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v139,
                                                                   @"LumaSharpening",
                                                                   @"outputLumaTex",
                                                                   @"<output>",
                                                                   @"outputLumaTex")) != 0
                                        || (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v139, @"PostDemProc", @"outputChromaTex", @"<output>", @"outputChromaTex")) != 0|| v136&& ((unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v139, @"LumaSharpening", @"outputLumaTex", @"ComputeLTM", @"inputLumaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v139, @"PostDemProc", @"outputChromaTex", @"ComputeLTM", @"inputChromaTex")) != 0))
                                      {
LABEL_468:
                                        FigSignalErrorAt();
                                        v141 = 0;
                                        v140 = 0;
                                      }
                                      else
                                      {
                                        v140 = [[SoftISPPipeline alloc] initWithGraph:v139 metal:v132 staticParameters:v133];
                                        if (v140)
                                        {
                                          v141 = [[QuadraBinStage alloc] initWithDownstreamStage:v140 metalContext:v132 staticParameters:v133];
                                          if (!v141)
                                          {
                                            uint64_t v156 = v157;
                                            LODWORD(v155) = 0;
                                            FigDebugAssert3();
                                            FigSignalErrorAt();
                                            v141 = 0;
                                          }
                                        }
                                        else
                                        {
                                          FigSignalErrorAt();
                                          v141 = 0;
                                        }
                                      }
LABEL_422:
                                      int64x2_t v16 = v141;

                                      int64x2_t v6 = v203;
                                      if (!v16) {
                                        break;
                                      }
                                      goto LABEL_461;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                      FigSignalErrorAt();
                      v141 = 0;
LABEL_690:
                      v140 = 0;
                      goto LABEL_422;
                    }
                    uint64_t v156 = v157;
                    LODWORD(v155) = 0;
                    FigDebugAssert3();
                    unsigned int v137 = v220;
                    if (v136) {
                      goto LABEL_397;
                    }
LABEL_396:
                    if (v137 == -73684) {
                      goto LABEL_397;
                    }
                    v141 = 0;
LABEL_622:
                    v136 = 0;
                    v139 = 0;
                    goto LABEL_690;
                  }
                  uint64_t v156 = v157;
                  LODWORD(v155) = 0;
                  FigDebugAssert3();
                  v141 = 0;
LABEL_621:
                  v165 = 0;
                  goto LABEL_622;
                }
                uint64_t v156 = v157;
                LODWORD(v155) = 0;
                FigDebugAssert3();
                v141 = 0;
LABEL_620:
                v170 = 0;
                goto LABEL_621;
              }
              uint64_t v156 = v157;
              LODWORD(v155) = 0;
              FigDebugAssert3();
              v141 = 0;
LABEL_619:
              v177 = 0;
              goto LABEL_620;
            }
            uint64_t v156 = v157;
            LODWORD(v155) = 0;
            FigDebugAssert3();
            v141 = 0;
LABEL_576:
            v188 = 0;
            goto LABEL_619;
          }
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
        }
        else
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
        }
        FigDebugAssert3();
        v141 = 0;
        v200 = 0;
        goto LABEL_576;
      }
      if (v9 == 80)
      {
        createH13FastSushiRawMBNRYUVPipeline(v214, v213, 1);
        int64x2_t v16 = (SoftISPPipeline *)objc_claimAutoreleasedReturnValue();
        if (!v16) {
          break;
        }
        goto LABEL_461;
      }
      if (v9 != 81) {
        goto LABEL_740;
      }
      v205 = v8;
      id v17 = v214;
      id v18 = v213;
      unsigned int v220 = 0;
      v179 = [[H13FastRawScaleStage alloc] initWithMetalContext:v17 staticParameters:v18];
      if (v179)
      {
        v190 = [[H13FastBayerProcStage alloc] initWithMetalContext:v17 staticParameters:v18];
        if (v190)
        {
          v172 = [[H13FastRawMBNRStage alloc] initWithMetalContext:v17 staticParameters:v18];
          if (v172)
          {
            v167 = [[H13FastDemosaicStage alloc] initWithMetalContext:v17 staticParameters:v18 outputGammaEncoded:1];
            if (v167)
            {
              v163 = [[H13FastPostDemosaicProcStage alloc] initWithMetalContext:v17 staticParameters:v18];
              if (v163)
              {
                v161 = [[H13FastLumaSharpeningStage alloc] initWithMetalContext:v17 staticParameters:v18];
                if (v161)
                {
                  v159 = [[H13FastCanvasStage alloc] initWithMetalContext:v17 staticParameters:v18];
                  if (v159)
                  {
                    v158 = [[H13FastLTMStage alloc] initWithMetalContext:v17 staticParameters:v18 error:&v220];
                    if (v158)
                    {
                      if (!v220)
                      {
                        uint32x4_t v19 = [[LocalToneMappingStage alloc] initWithMetalContext:v17 staticParameters:v18];
                        if (v19)
                        {
                          uint64_t v20 = objc_opt_new();
                          int32x4_t v21 = (id *)v20;
                          if (v20)
                          {
                            unsigned int v220 = -[SoftISPGraph addStage:withName:](v20, v179, @"RawScale");
                            if (!v220)
                            {
                              unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v21, v190, @"BayerProc");
                              if (!v220)
                              {
                                unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v21, v172, @"RawMBNR");
                                if (!v220)
                                {
                                  unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v21, v167, @"DemYUV");
                                  if (!v220)
                                  {
                                    unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v21, v163, @"PostDemProc");
                                    if (!v220)
                                    {
                                      unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v21, v161, @"LumaSharpening");
                                      if (!v220)
                                      {
                                        unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v21, v159, @"Canvas");
                                        if (!v220)
                                        {
                                          unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v21, v158, @"ComputeLTM");
                                          if (!v220)
                                          {
                                            unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v21, v19, @"ApplyLTM");
                                            if (!v220)
                                            {
                                              unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v21, @"<input>", @"inputTex", @"RawScale", @"inputTex");
                                              if (!v220)
                                              {
                                                unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v21, @"RawScale", @"outputTex", @"BayerProc", @"inputTex");
                                                if (v220) {
                                                  goto LABEL_474;
                                                }
                                                unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:isNullable:](v21, @"RawScale", @"outputSyntheticThumbnailTex", @"BayerProc", @"inputSyntheticThumbnailTex", 1);
                                                if (v220) {
                                                  goto LABEL_474;
                                                }
                                                unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v21, @"BayerProc", @"outputTex", @"RawMBNR", @"inputTex");
                                                if (v220) {
                                                  goto LABEL_474;
                                                }
                                                unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v21, @"RawMBNR", @"outputTex", @"DemYUV", @"inputTex");
                                                if (v220) {
                                                  goto LABEL_474;
                                                }
                                                unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v21, @"DemYUV", @"outputLumaTex", @"PostDemProc", @"inputLumaTex");
                                                if (v220) {
                                                  goto LABEL_474;
                                                }
                                                unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v21, @"DemYUV", @"outputChromaTex", @"PostDemProc", @"inputChromaTex");
                                                if (v220) {
                                                  goto LABEL_474;
                                                }
                                                unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v21, @"PostDemProc", @"outputLumaTex", @"LumaSharpening", @"inputLumaTex");
                                                if (v220
                                                  || (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v21, @"LumaSharpening", @"outputLumaTex", @"ComputeLTM", @"inputLumaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v21, @"PostDemProc", @"outputChromaTex", @"ComputeLTM", @"inputChromaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v21, @"LumaSharpening", @"outputLumaTex", @"ApplyLTM", @"inputLumaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v21,
                                                                             @"PostDemProc",
                                                                             @"outputChromaTex",
                                                                             @"ApplyLTM",
                                                                             @"inputChromaTex")) != 0
                                                  || (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v21, @"ApplyLTM", @"outputLumaTex", @"Canvas", @"inputLumaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v21, @"ApplyLTM", @"outputChromaTex", @"Canvas", @"inputChromaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v21, @"Canvas", @"outputLumaTex", @"<output>", @"outputLumaTex")) != 0)
                                                {
LABEL_474:
                                                  FigSignalErrorAt();
                                                  int64x2_t v16 = 0;
                                                  goto LABEL_65;
                                                }
                                                unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v21, @"Canvas", @"outputChromaTex", @"<output>", @"outputChromaTex");
                                                if (!v220)
                                                {
                                                  int64x2_t v16 = [[SoftISPPipeline alloc] initWithGraph:v21 metal:v17 staticParameters:v18];
                                                  if (!v16) {
                                                    FigSignalErrorAt();
                                                  }
LABEL_65:

                                                  int64x2_t v6 = v203;
                                                  uint64x2_t v8 = v205;
                                                  if (!v16) {
                                                    break;
                                                  }
                                                  goto LABEL_461;
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
                          FigSignalErrorAt();
LABEL_706:
                          int64x2_t v16 = 0;
                          goto LABEL_65;
                        }
                        uint64_t v156 = v157;
                        LODWORD(v155) = 0;
                        FigDebugAssert3();
LABEL_616:
                        int32x4_t v21 = 0;
                        goto LABEL_706;
                      }
                      FigSignalErrorAt();
LABEL_615:
                      uint32x4_t v19 = 0;
                      goto LABEL_616;
                    }
                    uint64_t v156 = v157;
                    LODWORD(v155) = 0;
                    FigDebugAssert3();
LABEL_614:
                    v158 = 0;
                    goto LABEL_615;
                  }
                  uint64_t v156 = v157;
                  LODWORD(v155) = 0;
                  FigDebugAssert3();
LABEL_613:
                  v159 = 0;
                  goto LABEL_614;
                }
                uint64_t v156 = v157;
                LODWORD(v155) = 0;
                FigDebugAssert3();
LABEL_612:
                v161 = 0;
                goto LABEL_613;
              }
              uint64_t v156 = v157;
              LODWORD(v155) = 0;
              FigDebugAssert3();
LABEL_611:
              v163 = 0;
              goto LABEL_612;
            }
            uint64_t v156 = v157;
            LODWORD(v155) = 0;
            FigDebugAssert3();
LABEL_610:
            v167 = 0;
            goto LABEL_611;
          }
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
LABEL_572:
          v172 = 0;
          goto LABEL_610;
        }
        uint64_t v156 = v157;
        LODWORD(v155) = 0;
      }
      else
      {
        uint64_t v156 = v157;
        LODWORD(v155) = 0;
      }
      FigDebugAssert3();
      v190 = 0;
      goto LABEL_572;
    }
    switch(v9)
    {
      case 5:
        v204 = v8;
        id v10 = v214;
        id v11 = v213;
        int8x16_t v12 = [[H13FastRawScaleStage alloc] initWithMetalContext:v10 staticParameters:v11];
        if (!v12)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          int8x16_t v13 = 0;
LABEL_509:
          int8x16_t v15 = 0;
LABEL_541:
          int64x2_t v16 = 0;
          goto LABEL_21;
        }
        int8x16_t v13 = [[H13FastBayerProcStage alloc] initWithMetalContext:v10 staticParameters:v11];
        if (!v13)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          goto LABEL_509;
        }
        uint64_t v14 = objc_opt_new();
        int8x16_t v15 = (id *)v14;
        if (!v14
          || -[SoftISPGraph addStage:withName:](v14, v12, @"RawScale")
          || -[SoftISPGraph addStage:withName:]((uint64_t)v15, v13, @"BayerProc"))
        {
          FigSignalErrorAt();
          goto LABEL_541;
        }
        if (-[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v15, @"<input>", @"inputTex", @"RawScale", @"inputTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v15, @"RawScale", @"outputTex", @"BayerProc", @"inputTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:isNullable:](v15, @"RawScale", @"outputSyntheticThumbnailTex", @"BayerProc", @"inputSyntheticThumbnailTex", 1)|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](
                             v15,
                             @"BayerProc",
                             @"outputTex",
                             @"<output>",
                             @"outputTex"))
        {
          FigSignalErrorAt();
          int64x2_t v16 = 0;
        }
        else
        {
          int64x2_t v16 = [[SoftISPPipeline alloc] initWithGraph:v15 metal:v10 staticParameters:v11];
          if (!v16) {
            FigSignalErrorAt();
          }
        }
LABEL_21:

        uint64x2_t v8 = v204;
        if (!v16) {
          goto LABEL_739;
        }
        break;
      case 6:
        id v32 = v214;
        id v33 = v213;
        v34 = [[H13FastRawScaleStage alloc] initWithMetalContext:v32 staticParameters:v33];
        if (!v34)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          v35 = 0;
          goto LABEL_544;
        }
        v35 = [[H13FastBayerProcStage alloc] initWithMetalContext:v32 staticParameters:v33];
        if (!v35)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          goto LABEL_543;
        }
        v181 = [[H13UtilityConvertStage alloc] initWithMetalContext:v32 staticParameters:v33 inputPixelFormat:11 outputPixelFormat:10];
        if (!v181)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
LABEL_543:
          FigDebugAssert3();
LABEL_544:
          v181 = 0;
          v37 = 0;
LABEL_580:
          int64x2_t v16 = 0;
          goto LABEL_110;
        }
        uint64_t v36 = objc_opt_new();
        v37 = (id *)v36;
        if (!v36
          || -[SoftISPGraph addStage:withName:](v36, v34, @"RawScale")
          || -[SoftISPGraph addStage:withName:]((uint64_t)v37, v35, @"BayerProc")
          || -[SoftISPGraph addStage:withName:]((uint64_t)v37, v181, @"ConvertToFp16"))
        {
          FigSignalErrorAt();
          goto LABEL_580;
        }
        if (-[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v37, @"<input>", @"inputTex", @"RawScale", @"inputTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v37, @"RawScale", @"outputTex", @"BayerProc", @"inputTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:isNullable:](v37, @"RawScale", @"outputSyntheticThumbnailTex", @"BayerProc", @"inputSyntheticThumbnailTex", 1)|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](
                             v37,
                             @"BayerProc",
                             @"outputTex",
                             @"ConvertToFp16",
                             @"inputTex")
          || -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v37, @"ConvertToFp16", @"outputTex", @"<output>", @"outputTex"))
        {
          FigSignalErrorAt();
          int64x2_t v16 = 0;
        }
        else
        {
          int64x2_t v16 = [[SoftISPPipeline alloc] initWithGraph:v37 metal:v32 staticParameters:v33];
          if (!v16) {
            FigSignalErrorAt();
          }
        }
LABEL_110:

        if (!v16) {
          goto LABEL_739;
        }
        break;
      case 7:
        id v38 = v214;
        id v39 = v213;
        v40 = [[H13FastRawScaleStage alloc] initWithMetalContext:v38 staticParameters:v39];
        if (!v40)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          v41 = 0;
LABEL_512:
          v42 = 0;
          goto LABEL_583;
        }
        v41 = [[H13FastBayerProcStage alloc] initWithMetalContext:v38 staticParameters:v39];
        if (!v41)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          goto LABEL_512;
        }
        v42 = [[H13FastRawMBNRStage alloc] initWithMetalContext:v38 staticParameters:v39];
        if (!v42)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          goto LABEL_582;
        }
        v192 = [[H13UtilityConvertStage alloc] initWithMetalContext:v38 staticParameters:v39 inputPixelFormat:11 outputPixelFormat:10];
        if (!v192)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
LABEL_582:
          FigDebugAssert3();
LABEL_583:
          v192 = 0;
          v44 = 0;
LABEL_629:
          int64x2_t v16 = 0;
          goto LABEL_129;
        }
        uint64_t v43 = objc_opt_new();
        v44 = (id *)v43;
        if (!v43
          || -[SoftISPGraph addStage:withName:](v43, v40, @"RawScale")
          || -[SoftISPGraph addStage:withName:]((uint64_t)v44, v41, @"BayerProc")
          || -[SoftISPGraph addStage:withName:]((uint64_t)v44, v42, @"RawMBNR")
          || -[SoftISPGraph addStage:withName:]((uint64_t)v44, v192, @"ConvertToFp16"))
        {
          FigSignalErrorAt();
          goto LABEL_629;
        }
        if (-[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v44, @"<input>", @"inputTex", @"RawScale", @"inputTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v44, @"RawScale", @"outputTex", @"BayerProc", @"inputTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:isNullable:](v44, @"RawScale", @"outputSyntheticThumbnailTex", @"BayerProc", @"inputSyntheticThumbnailTex", 1)|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](
                             v44,
                             @"BayerProc",
                             @"outputTex",
                             @"RawMBNR",
                             @"inputTex")
          || -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v44, @"RawMBNR", @"outputTex", @"ConvertToFp16", @"inputTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v44, @"ConvertToFp16", @"outputTex", @"<output>", @"outputTex"))
        {
          FigSignalErrorAt();
          int64x2_t v16 = 0;
        }
        else
        {
          int64x2_t v16 = [[SoftISPPipeline alloc] initWithGraph:v44 metal:v38 staticParameters:v39];
          if (!v16) {
            FigSignalErrorAt();
          }
        }
LABEL_129:

        int64x2_t v6 = v203;
        if (!v16) {
          goto LABEL_739;
        }
        break;
      case 8:
        id v45 = v214;
        id v46 = v213;
        unsigned int v220 = 0;
        v47 = [[H13FastRawScaleStage alloc] initWithMetalContext:v45 staticParameters:v46];
        if (!v47)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          v48 = 0;
          goto LABEL_548;
        }
        v48 = [[H13FastBayerProcStage alloc] initWithMetalContext:v45 staticParameters:v46];
        if (!v48)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          goto LABEL_547;
        }
        v182 = [[H13FastDemosaicStage alloc] initWithMetalContext:v45 staticParameters:v46 outputGammaEncoded:1];
        if (!v182)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
LABEL_547:
          FigDebugAssert3();
LABEL_548:
          v182 = 0;
LABEL_585:
          v173 = 0;
LABEL_586:
          v168 = 0;
          v193 = 0;
          v53 = 0;
          goto LABEL_587;
        }
        v173 = [[H13FastPostDemosaicProcStage alloc] initWithMetalContext:v45 staticParameters:v46];
        if (!v173)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          goto LABEL_585;
        }
        v168 = [[H13FastLumaSharpeningStage alloc] initWithMetalContext:v45 staticParameters:v46];
        if (!v168)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          goto LABEL_586;
        }
        v49 = [[H13FastLTMStage alloc] initWithMetalContext:v45 staticParameters:v46 error:&v220];
        v50 = v49;
        unsigned int v51 = v220;
        if (v220 == -73684)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          unsigned int v51 = v220;
          if (v50) {
            goto LABEL_139;
          }
        }
        else if (v49)
        {
          goto LABEL_139;
        }
        if (v51 != -73684)
        {
          v193 = 0;
          v53 = 0;
LABEL_667:
          int64x2_t v16 = 0;
          goto LABEL_161;
        }
LABEL_139:
        v193 = v50;
        uint64_t v52 = objc_opt_new();
        v53 = (id *)v52;
        if (!v52)
        {
          FigSignalErrorAt();
          goto LABEL_667;
        }
        unsigned int v220 = -[SoftISPGraph addStage:withName:](v52, v47, @"RawScale");
        if (v220
          || (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v53, v48, @"BayerProc")) != 0
          || (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v53, v182, @"DemYUV")) != 0
          || (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v53, v173, @"PostDemProc")) != 0
          || (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v53, v168, @"LumaSharpening")) != 0
          || v193 && (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v53, v193, @"ComputeLTM")) != 0
          || (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v53, @"<input>", @"inputTex", @"RawScale", @"inputTex")) != 0)
        {
          FigSignalErrorAt();
LABEL_587:
          int64x2_t v16 = 0;
          goto LABEL_161;
        }
        unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v53, @"RawScale", @"outputTex", @"BayerProc", @"inputTex");
        if (v220) {
          goto LABEL_484;
        }
        unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:isNullable:](v53, @"RawScale", @"outputSyntheticThumbnailTex", @"BayerProc", @"inputSyntheticThumbnailTex", 1);
        if (v220) {
          goto LABEL_484;
        }
        unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v53, @"BayerProc", @"outputTex", @"DemYUV", @"inputTex");
        if (v220
          || (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v53, @"DemYUV", @"outputLumaTex", @"PostDemProc", @"inputLumaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v53, @"DemYUV", @"outputChromaTex", @"PostDemProc", @"inputChromaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v53, @"PostDemProc", @"outputLumaTex", @"LumaSharpening", @"inputLumaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v53,
                                     @"LumaSharpening",
                                     @"outputLumaTex",
                                     @"<output>",
                                     @"outputLumaTex")) != 0
          || (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v53, @"PostDemProc", @"outputChromaTex", @"<output>", @"outputChromaTex")) != 0|| v193&& ((unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v53, @"LumaSharpening", @"outputLumaTex", @"ComputeLTM", @"inputLumaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v53, @"PostDemProc", @"outputChromaTex", @"ComputeLTM", @"inputChromaTex")) != 0))
        {
LABEL_484:
          FigSignalErrorAt();
          int64x2_t v16 = 0;
        }
        else
        {
          int64x2_t v16 = [[SoftISPPipeline alloc] initWithGraph:v53 metal:v45 staticParameters:v46];
          if (!v16) {
            FigSignalErrorAt();
          }
        }
LABEL_161:

        int64x2_t v6 = v203;
        if (!v16) {
          goto LABEL_739;
        }
        break;
      case 9:
        id v54 = v214;
        id v55 = v213;
        v56 = [[H13FastRawScaleStage alloc] initWithMetalContext:v54 staticParameters:v55];
        if (!v56)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          v57 = 0;
LABEL_515:
          v58 = 0;
          goto LABEL_590;
        }
        v57 = [[H13FastBayerProcStage alloc] initWithMetalContext:v54 staticParameters:v55];
        if (!v57)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          goto LABEL_515;
        }
        v58 = [[H13UtilityConvertStage alloc] initWithMetalContext:v54 staticParameters:v55 inputPixelFormat:11 outputPixelFormat:10];
        if (!v58)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          goto LABEL_589;
        }
        v183 = [[RegWarpStage alloc] initWithMetalContext:v54 staticParameters:v55];
        if (!v183)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
LABEL_589:
          FigDebugAssert3();
LABEL_590:
          v183 = 0;
          v60 = 0;
LABEL_632:
          int64x2_t v16 = 0;
          goto LABEL_180;
        }
        uint64_t v59 = objc_opt_new();
        v60 = (id *)v59;
        if (!v59
          || -[SoftISPGraph addStage:withName:](v59, v56, @"RawScale")
          || -[SoftISPGraph addStage:withName:]((uint64_t)v60, v57, @"BayerProc")
          || -[SoftISPGraph addStage:withName:]((uint64_t)v60, v58, @"ConvertToFp16")
          || -[SoftISPGraph addStage:withName:]((uint64_t)v60, v183, @"RegWarp"))
        {
          FigSignalErrorAt();
          goto LABEL_632;
        }
        if (-[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v60, @"<input>", @"inputTex", @"RawScale", @"inputTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v60, @"RawScale", @"outputTex", @"BayerProc", @"inputTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:isNullable:](v60, @"RawScale", @"outputSyntheticThumbnailTex", @"BayerProc", @"inputSyntheticThumbnailTex", 1)|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](
                             v60,
                             @"BayerProc",
                             @"outputTex",
                             @"ConvertToFp16",
                             @"inputTex")
          || -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v60, @"ConvertToFp16", @"outputTex", @"RegWarp", @"inputTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v60, @"BayerProc", @"outputTex", @"<output>", @"outputTex"))
        {
          FigSignalErrorAt();
          int64x2_t v16 = 0;
        }
        else
        {
          int64x2_t v16 = [[SoftISPPipeline alloc] initWithGraph:v60 metal:v54 staticParameters:v55];
          if (!v16) {
            FigSignalErrorAt();
          }
        }
LABEL_180:

        int64x2_t v6 = v203;
        if (!v16) {
          goto LABEL_739;
        }
        break;
      case 10:
        v207 = v8;
        id v61 = v214;
        id v62 = v213;
        v63 = [[H13FastRawScaleStage alloc] initWithMetalContext:v61 staticParameters:v62];
        if (!v63)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          v64 = 0;
LABEL_517:
          v66 = 0;
LABEL_551:
          int64x2_t v16 = 0;
          goto LABEL_192;
        }
        v64 = [[H13UtilityConvertStage alloc] initWithMetalContext:v61 staticParameters:v62 inputPixelFormat:10 outputPixelFormat:2];
        if (!v64)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          goto LABEL_517;
        }
        uint64_t v65 = objc_opt_new();
        v66 = (id *)v65;
        if (!v65
          || -[SoftISPGraph addStage:withName:](v65, v63, @"RawScale")
          || -[SoftISPGraph addStage:withName:]((uint64_t)v66, v64, @"ConvertToU16"))
        {
          FigSignalErrorAt();
          goto LABEL_551;
        }
        if (-[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v66, @"<input>", @"inputTex", @"RawScale", @"inputTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v66, @"RawScale", @"outputTex", @"ConvertToU16", @"inputTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v66, @"ConvertToU16", @"outputTex", @"<output>", @"outputTex"))
        {
          FigSignalErrorAt();
          int64x2_t v16 = 0;
        }
        else
        {
          int64x2_t v16 = [[SoftISPPipeline alloc] initWithGraph:v66 metal:v61 staticParameters:v62];
          if (!v16) {
            FigSignalErrorAt();
          }
        }
LABEL_192:

        uint64x2_t v8 = v207;
        if (!v16) {
          goto LABEL_739;
        }
        break;
      case 14:
        id v67 = v214;
        id v68 = v213;
        v69 = [[H13FastRawScaleStage alloc] initWithMetalContext:v67 staticParameters:v68];
        if (!v69)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          v70 = 0;
LABEL_519:
          v71 = 0;
          goto LABEL_593;
        }
        v70 = [[H13FastBayerProcStage alloc] initWithMetalContext:v67 staticParameters:v68];
        if (!v70)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          goto LABEL_519;
        }
        v71 = [[H13FastRawMBNRStage alloc] initWithMetalContext:v67 staticParameters:v68];
        if (!v71)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          goto LABEL_592;
        }
        v184 = [[H13UtilityConvertStage alloc] initWithMetalContext:v67 staticParameters:v68 inputPixelFormat:11 outputPixelFormat:11];
        if (!v184)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
LABEL_592:
          FigDebugAssert3();
LABEL_593:
          v184 = 0;
          v73 = 0;
LABEL_634:
          int64x2_t v16 = 0;
          goto LABEL_211;
        }
        uint64_t v72 = objc_opt_new();
        v73 = (id *)v72;
        if (!v72
          || -[SoftISPGraph addStage:withName:](v72, v69, @"RawScale")
          || -[SoftISPGraph addStage:withName:]((uint64_t)v73, v70, @"BayerProc")
          || -[SoftISPGraph addStage:withName:]((uint64_t)v73, v71, @"RawMBNR")
          || -[SoftISPGraph addStage:withName:]((uint64_t)v73, v184, @"ConvertToFp16"))
        {
          FigSignalErrorAt();
          goto LABEL_634;
        }
        if (-[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v73, @"<input>", @"inputTex", @"RawScale", @"inputTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v73, @"RawScale", @"outputTex", @"BayerProc", @"inputTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:isNullable:](v73, @"RawScale", @"outputSyntheticThumbnailTex", @"BayerProc", @"inputSyntheticThumbnailTex", 1)|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](
                             v73,
                             @"BayerProc",
                             @"outputTex",
                             @"RawMBNR",
                             @"inputTex")
          || -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v73, @"RawMBNR", @"outputTex", @"ConvertToFp16", @"inputTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v73, @"ConvertToFp16", @"outputTex", @"<output>", @"outputTex"))
        {
          FigSignalErrorAt();
          int64x2_t v16 = 0;
        }
        else
        {
          int64x2_t v16 = [[SoftISPPipeline alloc] initWithGraph:v73 metal:v67 staticParameters:v68];
          if (!v16) {
            FigSignalErrorAt();
          }
        }
LABEL_211:

        int64x2_t v6 = v203;
        if (!v16) {
          goto LABEL_739;
        }
        break;
      case 16:
        createH13FastSushiRawMBNRYUVPipeline(v214, v213, 0);
        int64x2_t v16 = (SoftISPPipeline *)objc_claimAutoreleasedReturnValue();
        if (!v16) {
          goto LABEL_739;
        }
        break;
      case 19:
        id v74 = v214;
        id v75 = v213;
        unsigned int v220 = 0;
        v76 = [[H13FastRawScaleStage alloc] initWithMetalContext:v74 staticParameters:v75];
        v208 = v8;
        if (!v76)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
LABEL_521:
          FigDebugAssert3();
          v185 = 0;
LABEL_554:
          v174 = 0;
LABEL_595:
          v169 = 0;
LABEL_596:
          v164 = 0;
LABEL_597:
          v160 = 0;
          v162 = 0;
LABEL_598:
          v194 = 0;
          v80 = 0;
LABEL_695:
          int64x2_t v16 = 0;
          goto LABEL_252;
        }
        v185 = [[H13FastBayerProcStage alloc] initWithMetalContext:v74 staticParameters:v75];
        if (!v185)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          goto LABEL_521;
        }
        v174 = [[H13FastRawMBNRStage alloc] initWithMetalContext:v74 staticParameters:v75];
        if (!v174)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          goto LABEL_554;
        }
        v169 = [[H13FastDemosaicStage alloc] initWithMetalContext:v74 staticParameters:v75 outputGammaEncoded:1];
        if (!v169)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          goto LABEL_595;
        }
        v164 = [[H13FastPostDemosaicProcStage alloc] initWithMetalContext:v74 staticParameters:v75];
        if (!v164)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          goto LABEL_596;
        }
        v160 = [[H13FastLumaSharpeningStage alloc] initWithMetalContext:v74 staticParameters:v75];
        if (!v160)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          goto LABEL_597;
        }
        v162 = [[GDCStage alloc] initWithMetalContext:v74 staticParameters:v75];
        if (!v162)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          v162 = 0;
          goto LABEL_598;
        }
        v77 = [[H13FastLTMStage alloc] initWithMetalContext:v74 staticParameters:v75 error:&v220];
        unsigned int v78 = v220;
        v194 = v77;
        if (v220 == -73684)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          unsigned int v78 = v220;
          if (v194) {
            goto LABEL_225;
          }
        }
        else if (v77)
        {
          goto LABEL_225;
        }
        if (v78 != -73684) {
          goto LABEL_598;
        }
LABEL_225:
        uint64_t v79 = objc_opt_new();
        v80 = (id *)v79;
        if (!v79) {
          goto LABEL_694;
        }
        unsigned int v220 = -[SoftISPGraph addStage:withName:](v79, v76, @"RawScale");
        if (v220) {
          goto LABEL_694;
        }
        unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v80, v185, @"BayerProc");
        if (v220) {
          goto LABEL_694;
        }
        unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v80, v174, @"RawMBNR");
        if (v220) {
          goto LABEL_694;
        }
        unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v80, v169, @"DemYUV");
        if (v220) {
          goto LABEL_694;
        }
        unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v80, v164, @"PostDemProc");
        if (v220) {
          goto LABEL_694;
        }
        unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v80, v162, @"GDCYUV");
        if (v220) {
          goto LABEL_694;
        }
        unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v80, v160, @"LumaSharpening");
        if (v220) {
          goto LABEL_694;
        }
        if (v194)
        {
          unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v80, v194, @"ComputeLTM");
          if (v220) {
            goto LABEL_694;
          }
        }
        unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v80, @"<input>", @"inputTex", @"RawScale", @"inputTex");
        if (v220)
        {
LABEL_694:
          FigSignalErrorAt();
          goto LABEL_695;
        }
        unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v80, @"RawScale", @"outputTex", @"BayerProc", @"inputTex");
        if (v220) {
          goto LABEL_728;
        }
        unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:isNullable:](v80, @"RawScale", @"outputSyntheticThumbnailTex", @"BayerProc", @"inputSyntheticThumbnailTex", 1);
        if (v220) {
          goto LABEL_728;
        }
        unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v80, @"BayerProc", @"outputTex", @"RawMBNR", @"inputTex");
        if (v220) {
          goto LABEL_728;
        }
        unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v80, @"RawMBNR", @"outputTex", @"DemYUV", @"inputTex");
        if (v220) {
          goto LABEL_728;
        }
        unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v80, @"DemYUV", @"outputLumaTex", @"PostDemProc", @"inputLumaTex");
        if (v220) {
          goto LABEL_728;
        }
        unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v80, @"DemYUV", @"outputChromaTex", @"PostDemProc", @"inputChromaTex");
        if (v220
          || (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v80, @"PostDemProc", @"outputLumaTex", @"LumaSharpening", @"inputLumaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v80, @"LumaSharpening", @"outputLumaTex", @"GDCYUV", @"inputLumaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v80, @"PostDemProc", @"outputChromaTex", @"GDCYUV", @"inputChromaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v80,
                                     @"GDCYUV",
                                     @"outputLumaTex",
                                     @"<output>",
                                     @"outputLumaTex")) != 0
          || (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v80, @"GDCYUV", @"outputChromaTex", @"<output>", @"outputChromaTex")) != 0|| v194&& ((unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v80, @"GDCYUV", @"outputLumaTex", @"ComputeLTM", @"inputLumaTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v80, @"GDCYUV", @"outputChromaTex", @"ComputeLTM", @"inputChromaTex")) != 0))
        {
LABEL_728:
          FigSignalErrorAt();
          int64x2_t v16 = 0;
        }
        else
        {
          int64x2_t v16 = [[SoftISPPipeline alloc] initWithGraph:v80 metal:v74 staticParameters:v75];
          if (!v16) {
            FigSignalErrorAt();
          }
        }
LABEL_252:

        int64x2_t v6 = v203;
        uint64x2_t v8 = v208;
        if (!v16) {
          goto LABEL_739;
        }
        break;
      case 20:
        id v81 = v214;
        id v82 = v213;
        unsigned int v220 = 0;
        v83 = [[H13FastRawScaleStage alloc] initWithMetalContext:v81 staticParameters:v82];
        v209 = v8;
        if (!v83)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          v84 = 0;
          goto LABEL_557;
        }
        v84 = [[H13FastBayerProcStage alloc] initWithMetalContext:v81 staticParameters:v82];
        if (!v84)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          goto LABEL_556;
        }
        v186 = [[H13FastOutlierPixelCorrectionStage alloc] initWithMetalContext:v81 staticParameters:v82];
        if (!v186)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
LABEL_556:
          FigDebugAssert3();
LABEL_557:
          v186 = 0;
LABEL_558:
          v195 = 0;
          v88 = 0;
          goto LABEL_656;
        }
        v85 = [[H13FastLTMStage alloc] initWithMetalContext:v81 staticParameters:v82 error:&v220];
        v86 = v85;
        unsigned int v87 = v220;
        if (v220 == -73684)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          unsigned int v87 = v220;
          if (v86) {
            goto LABEL_260;
          }
        }
        else if (v85)
        {
          goto LABEL_260;
        }
        if (v87 != -73684) {
          goto LABEL_558;
        }
LABEL_260:
        v88 = [[H13FastRawMBNRStage alloc] initWithMetalContext:v81 staticParameters:v82];
        v195 = v86;
        if (!v88)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          goto LABEL_655;
        }
        v175 = [[H13UtilityConvertStage alloc] initWithMetalContext:v81 staticParameters:v82 inputPixelFormat:11 outputPixelFormat:10];
        if (!v175)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
LABEL_655:
          FigDebugAssert3();
LABEL_656:
          v175 = 0;
          v90 = 0;
LABEL_671:
          int64x2_t v16 = 0;
          goto LABEL_281;
        }
        uint64_t v89 = objc_opt_new();
        v90 = (id *)v89;
        if (!v89
          || (unsigned int v220 = -[SoftISPGraph addStage:withName:](v89, v83, @"RawScale")) != 0
          || (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v90, v84, @"BayerProc")) != 0
          || (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v90, v186, @"OutlierPixelCorrection")) != 0
          || v195 && (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v90, v195, @"ComputeLTM")) != 0
          || (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v90, v88, @"RawMBNR")) != 0
          || (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v90, v175, @"ConvertToFp16")) != 0)
        {
          FigSignalErrorAt();
          goto LABEL_671;
        }
        unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v90, @"<input>", @"inputTex", @"RawScale", @"inputTex");
        if (v220
          || (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v90, @"RawScale", @"outputTex", @"BayerProc", @"inputTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:isNullable:](v90, @"RawScale", @"outputSyntheticThumbnailTex", @"BayerProc", @"inputSyntheticThumbnailTex", 1)) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v90, @"BayerProc", @"outputTex", @"OutlierPixelCorrection", @"inputTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](
                                     v90,
                                     @"OutlierPixelCorrection",
                                     @"outputTex",
                                     @"RawMBNR",
                                     @"inputTex")) != 0
          || v195
          && (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v90, @"RawMBNR", @"outputTex", @"ComputeLTM", @"inputTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v90, @"RawMBNR", @"outputTex", @"ConvertToFp16", @"inputTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v90, @"ConvertToFp16", @"outputTex", @"<output>", @"outputTex")) != 0)
        {
          FigSignalErrorAt();
          int64x2_t v16 = 0;
        }
        else
        {
          int64x2_t v16 = [[SoftISPPipeline alloc] initWithGraph:v90 metal:v81 staticParameters:v82];
          if (!v16) {
            FigSignalErrorAt();
          }
        }
LABEL_281:

        int64x2_t v6 = v203;
        uint64x2_t v8 = v209;
        if (!v16) {
          goto LABEL_739;
        }
        break;
      case 21:
        v210 = v8;
        id v91 = v214;
        id v92 = v213;
        v93 = [[H13FastRawScaleStage alloc] initWithMetalContext:v91 staticParameters:v92];
        if (!v93)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          v94 = 0;
LABEL_524:
          v96 = 0;
LABEL_560:
          int64x2_t v16 = 0;
          goto LABEL_293;
        }
        v94 = [[DisparityStage alloc] initWithMetalContext:v91 staticParameters:v92];
        if (!v94)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          goto LABEL_524;
        }
        uint64_t v95 = objc_opt_new();
        v96 = (id *)v95;
        if (!v95
          || -[SoftISPGraph addStage:withName:](v95, v93, @"RawScale")
          || -[SoftISPGraph addStage:withName:]((uint64_t)v96, v94, @"Disparity"))
        {
          FigSignalErrorAt();
          goto LABEL_560;
        }
        if (-[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v96, @"<input>", @"inputTex", @"RawScale", @"inputTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v96, @"RawScale", @"outputTex", @"Disparity", @"inputTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v96, @"Disparity", @"outputTex", @"<output>", @"outputTex"))
        {
          FigSignalErrorAt();
          int64x2_t v16 = 0;
        }
        else
        {
          int64x2_t v16 = [[SoftISPPipeline alloc] initWithGraph:v96 metal:v91 staticParameters:v92];
          if (!v16) {
            FigSignalErrorAt();
          }
        }
LABEL_293:

        uint64x2_t v8 = v210;
        if (!v16) {
          goto LABEL_739;
        }
        break;
      case 23:
        id v97 = v214;
        id v98 = v213;
        v99 = [[H13FastRawScaleStage alloc] initWithMetalContext:v97 staticParameters:v98];
        if (!v99)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
LABEL_526:
          FigDebugAssert3();
          v196 = 0;
          v100 = 0;
LABEL_562:
          v101 = 0;
LABEL_602:
          v103 = 0;
LABEL_638:
          int64x2_t v16 = 0;
          goto LABEL_314;
        }
        v196 = [[H13FastBayerProcStage alloc] initWithMetalContext:v97 staticParameters:v98];
        if (!v196)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          goto LABEL_526;
        }
        v100 = [[H13FastDemosaicStage alloc] initWithMetalContext:v97 staticParameters:v98 outputGammaEncoded:1];
        if (!v100)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          goto LABEL_562;
        }
        v101 = [[H13FastPostDemosaicProcStage alloc] initWithMetalContext:v97 staticParameters:v98];
        if (!v101)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          goto LABEL_602;
        }
        uint64_t v102 = objc_opt_new();
        v103 = (id *)v102;
        if (!v102
          || -[SoftISPGraph addStage:withName:](v102, v99, @"RawScale")
          || -[SoftISPGraph addStage:withName:]((uint64_t)v103, v196, @"BayerProc")
          || -[SoftISPGraph addStage:withName:]((uint64_t)v103, v100, @"DemYUV")
          || -[SoftISPGraph addStage:withName:]((uint64_t)v103, v101, @"PostDemProc"))
        {
          FigSignalErrorAt();
          goto LABEL_638;
        }
        if (-[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v103, @"<input>", @"inputTex", @"RawScale", @"inputTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v103, @"RawScale", @"outputTex", @"BayerProc", @"inputTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:isNullable:](v103, @"RawScale", @"outputSyntheticThumbnailTex", @"BayerProc", @"inputSyntheticThumbnailTex", 1)|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](
                             v103,
                             @"BayerProc",
                             @"outputTex",
                             @"DemYUV",
                             @"inputTex")
          || -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v103, @"DemYUV", @"outputLumaTex", @"PostDemProc", @"inputLumaTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v103, @"DemYUV", @"outputChromaTex", @"PostDemProc", @"inputChromaTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v103, @"PostDemProc", @"outputLumaTex", @"<output>", @"outputLumaTex")|| -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v103,
                             @"PostDemProc",
                             @"outputChromaTex",
                             @"<output>",
                             @"outputChromaTex"))
        {
          FigSignalErrorAt();
          int64x2_t v16 = 0;
        }
        else
        {
          int64x2_t v16 = [[SoftISPPipeline alloc] initWithGraph:v103 metal:v97 staticParameters:v98];
          if (!v16) {
            FigSignalErrorAt();
          }
        }
LABEL_314:

        int64x2_t v6 = v203;
        if (!v16) {
          goto LABEL_739;
        }
        break;
      case 24:
        id v104 = v214;
        id v105 = v213;
        unsigned int v220 = 0;
        v106 = [[H13FastRawScaleStage alloc] initWithMetalContext:v104 staticParameters:v105];
        v211 = v8;
        if (!v106)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          v107 = 0;
          goto LABEL_565;
        }
        v107 = [[H13FastBayerProcStage alloc] initWithMetalContext:v104 staticParameters:v105];
        if (!v107)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          goto LABEL_564;
        }
        v187 = [[H13FastOutlierPixelCorrectionStage alloc] initWithMetalContext:v104 staticParameters:v105];
        if (!v187)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
LABEL_564:
          FigDebugAssert3();
LABEL_565:
          v187 = 0;
LABEL_566:
          v197 = 0;
          v111 = 0;
          goto LABEL_660;
        }
        v108 = [[H13FastLTMStage alloc] initWithMetalContext:v104 staticParameters:v105 error:&v220];
        v109 = v108;
        unsigned int v110 = v220;
        if (v220 == -73684)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          unsigned int v110 = v220;
          if (v109) {
            goto LABEL_322;
          }
        }
        else if (v108)
        {
          goto LABEL_322;
        }
        if (v110 != -73684) {
          goto LABEL_566;
        }
LABEL_322:
        v111 = [[H13FastRawMBNRStage alloc] initWithMetalContext:v104 staticParameters:v105];
        v197 = v109;
        if (!v111)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          goto LABEL_659;
        }
        v176 = [[H13UtilityConvertStage alloc] initWithMetalContext:v104 staticParameters:v105 inputPixelFormat:31 outputPixelFormat:30];
        if (!v176)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
LABEL_659:
          FigDebugAssert3();
LABEL_660:
          v176 = 0;
          v113 = 0;
LABEL_674:
          int64x2_t v16 = 0;
          goto LABEL_343;
        }
        uint64_t v112 = objc_opt_new();
        v113 = (id *)v112;
        if (!v112
          || (unsigned int v220 = -[SoftISPGraph addStage:withName:](v112, v106, @"RawScale")) != 0
          || (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v113, v107, @"BayerProc")) != 0
          || (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v113, v187, @"OutlierPixelCorrection")) != 0
          || (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v113, v111, @"RawMBNR")) != 0
          || (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v113, v176, @"ConvertToFp16")) != 0
          || v197 && (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v113, v197, @"ComputeLTM")) != 0)
        {
          FigSignalErrorAt();
          goto LABEL_674;
        }
        unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v113, @"<input>", @"inputTex", @"RawScale", @"inputTex");
        if (v220
          || (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v113, @"RawScale", @"outputTex", @"BayerProc", @"inputTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:isNullable:](v113, @"RawScale", @"outputSyntheticThumbnailTex", @"BayerProc", @"inputSyntheticThumbnailTex", 1)) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v113, @"BayerProc", @"outputTex", @"OutlierPixelCorrection", @"inputTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](
                                     v113,
                                     @"OutlierPixelCorrection",
                                     @"outputTex",
                                     @"RawMBNR",
                                     @"inputTex")) != 0
          || v197
          && (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v113, @"RawMBNR", @"outputTex", @"ComputeLTM", @"inputTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v113, @"RawMBNR", @"outputTex", @"ConvertToFp16", @"inputTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v113, @"ConvertToFp16", @"outputTex", @"<output>", @"outputTex")) != 0)
        {
          FigSignalErrorAt();
          int64x2_t v16 = 0;
        }
        else
        {
          int64x2_t v16 = [[SoftISPPipeline alloc] initWithGraph:v113 metal:v104 staticParameters:v105];
          if (!v16) {
            FigSignalErrorAt();
          }
        }
LABEL_343:

        int64x2_t v6 = v203;
        uint64x2_t v8 = v211;
        if (!v16) {
          goto LABEL_739;
        }
        break;
      case 25:
        id v114 = v214;
        id v115 = v213;
        unsigned int v220 = 0;
        v116 = [[H13FastRawScaleStage alloc] initWithMetalContext:v114 staticParameters:v115];
        if (!v116)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          goto LABEL_529;
        }
        v198 = [[H13FastBayerProcStage alloc] initWithMetalContext:v114 staticParameters:v115];
        if (!v198)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
LABEL_529:
          FigDebugAssert3();
          v198 = 0;
LABEL_530:
          v118 = 0;
          v121 = 0;
LABEL_606:
          int64x2_t v16 = 0;
          goto LABEL_363;
        }
        v117 = [[H13FastLTMStage alloc] initWithMetalContext:v114 staticParameters:v115 error:&v220];
        v118 = v117;
        unsigned int v119 = v220;
        if (v220 == -73684)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          unsigned int v119 = v220;
          if (v118) {
            goto LABEL_350;
          }
        }
        else if (v117)
        {
          goto LABEL_350;
        }
        if (v119 != -73684) {
          goto LABEL_530;
        }
LABEL_350:
        uint64_t v120 = objc_opt_new();
        v121 = (id *)v120;
        if (!v120
          || (unsigned int v220 = -[SoftISPGraph addStage:withName:](v120, v116, @"RawScale")) != 0
          || (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v121, v198, @"BayerProc")) != 0
          || v118 && (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v121, v118, @"ComputeLTM")) != 0)
        {
          FigSignalErrorAt();
          goto LABEL_606;
        }
        unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v121, @"<input>", @"inputTex", @"RawScale", @"inputTex");
        if (v220
          || (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v121, @"RawScale", @"outputTex", @"BayerProc", @"inputTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:isNullable:](v121, @"RawScale", @"outputSyntheticThumbnailTex", @"BayerProc", @"inputSyntheticThumbnailTex", 1)) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v121, @"BayerProc", @"outputTex", @"<output>", @"outputTex")) != 0|| v118
          && (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v121, @"BayerProc", @"outputTex", @"ComputeLTM", @"inputTex")) != 0)
        {
          FigSignalErrorAt();
          int64x2_t v16 = 0;
        }
        else
        {
          int64x2_t v16 = [[SoftISPPipeline alloc] initWithGraph:v121 metal:v114 staticParameters:v115];
          if (!v16) {
            FigSignalErrorAt();
          }
        }
LABEL_363:

        if (!v16) {
          goto LABEL_739;
        }
        break;
      case 26:
        id v122 = v214;
        id v123 = v213;
        unsigned int v220 = 0;
        v124 = [[H13FastRawScaleStage alloc] initWithMetalContext:v122 staticParameters:v123];
        if (!v124)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          v126 = 0;
LABEL_532:
          v127 = 0;
LABEL_570:
          v199 = 0;
          v131 = 0;
LABEL_641:
          int64x2_t v16 = 0;
          goto LABEL_386;
        }
        v125 = [[H13FastBayerProcStage alloc] initWithMetalContext:v122 staticParameters:v123];
        v126 = v125;
        if (!v125)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          goto LABEL_532;
        }
        [(H13FastBayerProcStage *)v125 setProcessingOptions:&unk_270E99048];
        v127 = [[H13FastRawMBNRStage alloc] initWithMetalContext:v122 staticParameters:v123];
        if (!v127)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          goto LABEL_570;
        }
        v128 = [[H13FastLTMStage alloc] initWithMetalContext:v122 staticParameters:v123 error:&v220];
        unsigned int v129 = v220;
        v199 = v128;
        if (v220 == -73684)
        {
          uint64_t v156 = v157;
          LODWORD(v155) = 0;
          FigDebugAssert3();
          unsigned int v129 = v220;
          if (v199) {
            goto LABEL_371;
          }
        }
        else if (v128)
        {
          goto LABEL_371;
        }
        if (v129 != -73684) {
          goto LABEL_570;
        }
LABEL_371:
        uint64_t v130 = objc_opt_new();
        v131 = (id *)v130;
        if (!v130
          || (unsigned int v220 = -[SoftISPGraph addStage:withName:](v130, v124, @"RawScale")) != 0
          || (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v131, v126, @"BayerProc")) != 0
          || (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v131, v127, @"RawMBNR")) != 0
          || v199 && (unsigned int v220 = -[SoftISPGraph addStage:withName:]((uint64_t)v131, v199, @"ComputeLTM")) != 0)
        {
          FigSignalErrorAt();
          goto LABEL_641;
        }
        unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v131, @"<input>", @"inputTex", @"RawScale", @"inputTex");
        if (v220
          || (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v131, @"RawScale", @"outputTex", @"BayerProc", @"inputTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:isNullable:](v131, @"RawScale", @"outputSyntheticThumbnailTex", @"BayerProc", @"inputSyntheticThumbnailTex", 1)) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v131, @"BayerProc", @"outputTex", @"RawMBNR", @"inputTex")) != 0|| (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](
                                     v131,
                                     @"RawMBNR",
                                     @"outputTex",
                                     @"<output>",
                                     @"outputTex")) != 0
          || v199
          && (unsigned int v220 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v131, @"BayerProc", @"outputTex", @"ComputeLTM", @"inputTex")) != 0)
        {
          FigSignalErrorAt();
          int64x2_t v16 = 0;
        }
        else
        {
          int64x2_t v16 = [[SoftISPPipeline alloc] initWithGraph:v131 metal:v122 staticParameters:v123];
          if (!v16) {
            FigSignalErrorAt();
          }
        }
LABEL_386:

        int64x2_t v6 = v203;
        if (!v16) {
          goto LABEL_739;
        }
        break;
      default:
        goto LABEL_740;
    }
LABEL_461:
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v8, v155, v156);

    if (v215 == ++v7)
    {
      uint64_t v152 = [obj countByEnumeratingWithState:&v216 objects:v221 count:16];
      uint64_t v215 = v152;
      if (!v152)
      {
LABEL_738:

        id v153 = v6;
        goto LABEL_741;
      }
      goto LABEL_4;
    }
  }
LABEL_739:
  FigDebugAssert3();
LABEL_740:

  id v153 = 0;
LABEL_741:

  return v153;
}

id getNumberForKey(void *a1, uint64_t a2)
{
  char v2 = [a1 objectForKey:a2];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

void sub_2631B3DB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2631B4024(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2631B40E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2631B419C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2631B4258(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2631B4314(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2631B43D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2631B448C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __destructor_16_AB0s128n2_S_s0_s8_s96_s104_s112_AE_s256_s264_s272_s280_s288(uint64_t a1)
{
  for (uint64_t i = 0; i != 256; i += 128)
    __destructor_16_s0_s8_s96_s104_s112(a1 + i);

  id v3 = *(void **)(a1 + 288);
}

void __destructor_16_s0_s8_s96_s104_s112(uint64_t a1)
{
  char v2 = *(void **)(a1 + 112);
}

double Mul3x3by3x3by3x3(uint64_t a1, float32x4_t *a2, float32x4_t *a3)
{
  uint64_t v3 = 0;
  float32x4_t v4 = *a2;
  float32x4_t v5 = a2[1];
  float32x4_t v6 = a2[2];
  long long v16 = *(_OWORD *)(a1 + 32);
  float32x4_t v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v17 + v3 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(v15[v3])), v5, *(float32x2_t *)&v15[v3], 1), v6, (float32x4_t)v15[v3], 2);
    ++v3;
  }
  while (v3 != 3);
  uint64_t v7 = 0;
  float32x4_t v10 = v17;
  long long v8 = v18;
  long long v9 = v19;
  v10.i32[3] = 0;
  HIDWORD(v8) = 0;
  HIDWORD(v9) = 0;
  float32x4_t v11 = *a3;
  float32x4_t v12 = a3[1];
  float32x4_t v13 = a3[2];
  v15[0] = v10;
  v15[1] = v8;
  long long v16 = v9;
  float32x4_t v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v17 + v7 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, COERCE_FLOAT(v15[v7])), v12, *(float32x2_t *)&v15[v7], 1), v13, (float32x4_t)v15[v7], 2);
    ++v7;
  }
  while (v7 != 3);
  if (fabsf(*((float *)&v19 + 2)) > 0.00000001) {
    v10.i64[0] = vmulq_n_f32(v17, 1.0 / *((float *)&v19 + 2)).u64[0];
  }
  return *(double *)v10.i64;
}

uint64_t computeNoiseModel(float32x2_t *a1, void *a2, uint64_t a3, int a4)
{
  uint64_t v7 = a2;
  int v8 = [v7[5] isEqualToString:@"2019_LowLight"];
  uint64_t v9 = 32;
  if (!v8) {
    uint64_t v9 = 0;
  }
  float v10 = *(float *)(a3 + v9);
  float32x4_t v11 = v7;
  id v12 = v11[5];
  if (v12 && ![v12 isEqualToString:@"2019_DF"])
  {
    if (![v11[5] isEqualToString:@"2019_LowLight"]) {
      goto LABEL_17;
    }
    float v25 = powf(*((float *)v11 + 3), (float)a4);
    float v16 = (float)(v25 * powf(v10, *((float *)v11 + 6))) * *((float *)v11 + 8);
  }
  else
  {
    float v13 = ldexpf(1.0, -a4);
    float v14 = powf(v10, v13 / *((float *)v11 + 3));
    float v15 = exp2f((float)-a4 / v14);
    float v16 = powf(v10, *((float *)v11 + 6)) * v15;
  }
  float v17 = (float)(1.0 / sqrtf((float)(1 << a4))) * 0.0039216;
  a1->f32[0] = (float)(v17 * v16) / *((float *)v11 + 4);
  float v18 = *((float *)v11 + 7);
  if (v10 > 8.0) {
    float v18 = v18 + v18;
  }
  a1->f32[1] = v16 / v18;
  a1[1].f32[0] = v17 * v16;
  id v19 = v11[5];
  if (!v19 || [v19 isEqualToString:@"2019_DF"])
  {
    float v20 = (float)((float)((float)a4 + 1.0) * (float)((float)a4 + 1.0))
        * powf(*((float *)v11 + 2), (float)((float)a4 + 1.0) / -1.9);
    *(float *)&long long v21 = v20 * (float)(v17 * powf(v10 * *(float *)(a3 + 8), *((float *)v11 + 5)));
    long long v29 = v21;
    a1[2].i32[0] = v21;
    float v22 = v20 * (float)(v17 * powf(v10 * *(float *)(a3 + 4), *((float *)v11 + 5)));
    goto LABEL_11;
  }
  if (![v11[5] isEqualToString:@"2019_LowLight"])
  {
LABEL_17:
    uint64_t v23 = FigSignalErrorAt();
    goto LABEL_18;
  }
  float v26 = powf(*((float *)v11 + 2), (float)a4);
  *(float *)&long long v27 = *((float *)v11 + 9)
                 * (float)(v26 * (float)(v17 * powf(v10 * *(float *)(a3 + 8), *((float *)v11 + 5))));
  long long v29 = v27;
  a1[2].i32[0] = v27;
  float v22 = *((float *)v11 + 9) * (float)(v26 * (float)(v17 * powf(v10 * *(float *)(a3 + 4), *((float *)v11 + 5))));
LABEL_11:
  a1[2] = (float32x2_t)__PAIR64__(LODWORD(v22), v29);
  uint64_t v23 = 0;
  if (objc_msgSend(v11[5], "isEqualToString:", @"2019_DF", v29))
  {
    float32x2_t v24 = (float32x2_t)vdup_n_s32(0x437F0000u);
    a1[1].f32[0] = a1[1].f32[0] * 255.0;
    *a1 = vmul_f32(*a1, v24);
    a1[2] = vmul_f32(a1[2], v24);
  }
LABEL_18:

  return v23;
}

float32x2_t scaleNoiseModel(float32x2_t *a1, float a2)
{
  a1->f32[0] = a1->f32[0] * a2;
  a1[1].f32[0] = a1[1].f32[0] * a2;
  float32x2_t result = vmul_n_f32(a1[2], a2);
  a1[2] = result;
  return result;
}

float interpolate_with_gain(void *a1, float a2)
{
  id v3 = a1;
  float32x4_t v4 = v3;
  if (!v3) {
    goto LABEL_13;
  }
  int v5 = *((_DWORD *)v3 + 2);
  uint64_t v6 = (v5 - 1);
  if (v5 < 1) {
    goto LABEL_13;
  }
  uint64_t v7 = (float *)*((void *)v3 + 2);
  if (*v7 >= a2)
  {
    float v11 = v7[1];
    goto LABEL_14;
  }
  if (v7[2 * (v5 - 1)] <= a2)
  {
    float v11 = v7[2 * v6 + 1];
    goto LABEL_14;
  }
  if (v5 < 2)
  {
LABEL_10:
    float v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_13:
    id v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    float v11 = NAN;
    goto LABEL_14;
  }
  int v8 = v7 + 2;
  while (1)
  {
    float v9 = *(v8 - 2);
    if (v9 <= a2 && *v8 > a2) {
      break;
    }
    v8 += 2;
    if (!--v6) {
      goto LABEL_10;
    }
  }
  float v11 = *(v8 - 1) + (float)((float)((float)(a2 - v9) * (float)(v8[1] - *(v8 - 1))) / (float)(*v8 - v9));
LABEL_14:

  return v11;
}

id nameOfSceneType(unsigned int a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a1 <= 3)
  {
    v4[0] = xmmword_2655C7B68;
    v4[1] = off_2655C7B78;
    id v1 = *((id *)v4 + a1);
    for (uint64_t i = 24; i != -8; i -= 8)
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

uint64_t isSingleFrameProcessing(unsigned int a1)
{
  return (a1 < 9) & (0x1E1u >> a1);
}

id getSubDict(void *a1, uint64_t a2, _DWORD *a3)
{
  float32x4_t v4 = [a1 objectForKeyedSubscript:a2];
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    *a3 = -73271;
  }

  return v4;
}

uint64_t getNRFTuningForSensor(void *a1, void *a2, void *a3, void *a4, int a5)
{
  uint64_t v189 = *MEMORY[0x263EF8340];
  id v8 = a1;
  id v137 = a2;
  id v143 = a3;
  id v142 = a4;
  v188[0] = 0;
  v136 = v8;
  float v9 = [MEMORY[0x263F08B08] scannerWithString:v8];
  LOBYTE(a3) = [v9 scanHexInt:v188];

  if ((a3 & 1) == 0
    || ([NSNumber numberWithUnsignedInt:v188[0]],
        (v141 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    uint64_t v132 = FigSignalErrorAt();
    goto LABEL_160;
  }
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v172 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  id obj = v137;
  uint64_t v144 = [obj countByEnumeratingWithState:&v172 objects:v185 count:16];
  if (!v144) {
    goto LABEL_158;
  }
  uint64_t v140 = *(void *)v173;
  id v145 = v10;
  id v146 = v11;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v173 != v140)
      {
        uint64_t v13 = v12;
        objc_enumerationMutation(obj);
        uint64_t v12 = v13;
      }
      uint64_t v153 = v12;
      v159 = *(void **)(*((void *)&v172 + 1) + 8 * v12);
      float v14 = [obj objectForKeyedSubscript:v134];
      long long v168 = 0u;
      long long v169 = 0u;
      long long v170 = 0u;
      long long v171 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v168 objects:v184 count:16];
      uint64_t v158 = v16;
      if (v16)
      {
        uint64_t v157 = *(void *)v169;
        id v156 = v15;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v169 != v157) {
              objc_enumerationMutation(v15);
            }
            uint64_t v162 = v18;
            id v19 = *(void **)(*((void *)&v168 + 1) + 8 * v18);
            context = (void *)MEMORY[0x263E64AA0](v16, v17);
            float v20 = [v15 objectForKeyedSubscript:v19];
            if (!v20)
            {
              goto LABEL_153;
            }
            id v21 = v20;
            id v166 = v19;
            id v22 = v159;
            id v23 = v10;
            id v164 = v11;
            v165 = v22;
            v167 = v21;
            if ([v22 isEqualToString:@"DenoiseAndSharpening"])
            {
              float32x2_t v24 = (GainMapPlist *)objc_opt_new();
              int v25 = [(GainMapPlist *)v24 readPlist:v21];
              if (v25)
              {
                uint64_t v135 = v138;
                LODWORD(v134) = v25;
LABEL_134:
                FigDebugAssert3();
                int v33 = FigSignalErrorAt();

                goto LABEL_130;
              }
              goto LABEL_19;
            }
            if ([v22 isEqualToString:@"NoiseModel"])
            {
              float32x2_t v24 = (GainMapPlist *)objc_opt_new();
              int v26 = [(GainMapPlist *)v24 readPlist:v21];
              if (v26)
              {
                uint64_t v135 = v138;
                LODWORD(v134) = v26;
                goto LABEL_134;
              }
LABEL_19:
              if (!v24) {
                goto LABEL_129;
              }
              goto LABEL_20;
            }
            int v34 = [v22 isEqualToString:@"Fusion"];
            v35 = v22;
            uint64_t v36 = v167;
            if (!v34)
            {
              if ([v35 isEqualToString:@"ToneMapping"])
              {
                float32x2_t v24 = (GainMapPlist *)objc_opt_new();
                int v78 = [(GainMapPlist *)v24 readPlist:v167];
                if (v78)
                {
                  uint64_t v135 = v138;
                  LODWORD(v134) = v78;
                  goto LABEL_134;
                }
                goto LABEL_19;
              }
              if ([v35 isEqualToString:@"FrameSelection"])
              {
                float32x2_t v24 = (GainMapPlist *)objc_opt_new();
                int v79 = [(GainMapPlist *)v24 readPlist:v167];
                if (v79)
                {
                  uint64_t v135 = v138;
                  LODWORD(v134) = v79;
                  goto LABEL_134;
                }
                goto LABEL_19;
              }
              if (![v35 isEqualToString:@"GainMap"])
              {
                if ([v35 isEqualToString:@"SemanticStyles"])
                {
                  float32x2_t v24 = (GainMapPlist *)objc_opt_new();
                  int v83 = [(GainMapPlist *)v24 readPlist:v167];
                  if (v83)
                  {
                    uint64_t v135 = v138;
                    LODWORD(v134) = v83;
                    goto LABEL_134;
                  }
                }
                else if ([v35 isEqualToString:@"BrightLightGreenGhost"])
                {
                  float32x2_t v24 = (GainMapPlist *)objc_opt_new();
                  int v84 = [(GainMapPlist *)v24 readPlist:v167];
                  if (v84)
                  {
                    uint64_t v135 = v138;
                    LODWORD(v134) = v84;
                    goto LABEL_134;
                  }
                }
                else if ([v35 isEqualToString:@"LowLightGreenGhost"])
                {
                  float32x2_t v24 = (GainMapPlist *)objc_opt_new();
                  int v85 = [(GainMapPlist *)v24 readPlist:v167];
                  if (v85)
                  {
                    uint64_t v135 = v138;
                    LODWORD(v134) = v85;
                    goto LABEL_134;
                  }
                }
                else if ([v35 isEqualToString:@"LearnedNRParameters"])
                {
                  float32x2_t v24 = (GainMapPlist *)objc_opt_new();
                  int v86 = [(GainMapPlist *)v24 readPlist:v167];
                  if (v86)
                  {
                    uint64_t v135 = v138;
                    LODWORD(v134) = v86;
                    goto LABEL_134;
                  }
                }
                else if ([v35 isEqualToString:@"QuadraLearnedNRParameters"])
                {
                  float32x2_t v24 = (GainMapPlist *)objc_opt_new();
                  int v87 = [(GainMapPlist *)v24 readPlist:v167];
                  if (v87)
                  {
                    uint64_t v135 = v138;
                    LODWORD(v134) = v87;
                    goto LABEL_134;
                  }
                }
                else if ([v35 isEqualToString:@"MIWBParameters"])
                {
                  float32x2_t v24 = (GainMapPlist *)objc_opt_new();
                  int v127 = [(GainMapPlist *)v24 readPlist:v167];
                  if (v127)
                  {
                    uint64_t v135 = v138;
                    LODWORD(v134) = v127;
                    goto LABEL_134;
                  }
                }
                else
                {
                  if (![v35 isEqualToString:@"OutputNoiseModel"])
                  {
LABEL_129:
                    int v33 = 0;
                    goto LABEL_130;
                  }
                  float32x2_t v24 = (GainMapPlist *)objc_opt_new();
                  int v128 = [(GainMapPlist *)v24 readPlist:v167];
                  if (v128)
                  {
                    uint64_t v135 = v138;
                    LODWORD(v134) = v128;
                    goto LABEL_134;
                  }
                }
                goto LABEL_19;
              }
              float32x2_t v24 = [[GainMapPlist alloc] initWithParams:v167];
              if (!v24)
              {
                LODWORD(v180) = 0;
                type[0] = OS_LOG_TYPE_DEFAULT;
                v80 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v81 = v180;
                if (os_log_type_enabled(v80, type[0])) {
                  unsigned int v82 = v81;
                }
                else {
                  unsigned int v82 = v81 & 0xFFFFFFFE;
                }
                if (v82)
                {
                  int v186 = 136315138;
                  v187 = "get_options_for_nrf_params";
                  LODWORD(v135) = 12;
                  v134 = &v186;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();

                int v33 = -73349;
                goto LABEL_136;
              }
              goto LABEL_20;
            }
            float32x2_t v24 = (GainMapPlist *)(id)objc_opt_new();
            v37 = [v167 valueForKey:@"Bands"];
            id v38 = v37;
            id v155 = v23;
            if (!v37)
            {
              int v62 = FigSignalErrorAt();
              goto LABEL_107;
            }
            long long v182 = 0u;
            long long v183 = 0u;
            long long v180 = 0u;
            long long v181 = 0u;
            id v154 = v37;
            uint64_t v148 = [v154 countByEnumeratingWithState:&v180 objects:v188 count:16];
            if (!v148)
            {
              int v62 = 0;
              goto LABEL_106;
            }
            v150 = v24;
            uint64_t v151 = *(void *)v181;
            v139 = v38;
LABEL_28:
            uint64_t v39 = 0;
            while (1)
            {
              if (*(void *)v181 != v151) {
                objc_enumerationMutation(v154);
              }
              uint64_t v152 = v39;
              v40 = *(void **)(*((void *)&v180 + 1) + 8 * v39);
              v41 = (void **)objc_opt_new();
              *(_OWORD *)type = 0u;
              long long v177 = 0u;
              long long v178 = 0u;
              long long v179 = 0u;
              id v42 = v40;
              uint64_t v43 = [v42 countByEnumeratingWithState:type objects:&v186 count:16];
              if (v43)
              {
                uint64_t v44 = v43;
                uint64_t v45 = *(void *)v177;
                do
                {
                  uint64_t v46 = 0;
                  do
                  {
                    if (*(void *)v177 != v45) {
                      objc_enumerationMutation(v42);
                    }
                    v47 = *(void **)(*(void *)&type[8] + 8 * v46);
                    v48 = objc_msgSend(v42, "objectForKeyedSubscript:", v47, v134, v135);
                    if ([v47 isEqualToString:@"AdaptiveBlur"])
                    {
                      v49 = [[GainValueArray alloc] initWithArray:v48];
                      v50 = v41[1];
                      v41[1] = v49;

                      if (!v49)
                      {
                        uint64_t v135 = v138;
                        LODWORD(v134) = 0;
LABEL_104:
                        FigDebugAssert3();
                        id v10 = v145;
                        id v23 = v155;
                        float32x2_t v24 = v150;

                        int v62 = -73349;
                        uint64_t v36 = v167;
                        goto LABEL_105;
                      }
                      goto LABEL_47;
                    }
                    if ([v47 isEqualToString:@"LumaBlackThreshold"])
                    {
                      unsigned int v51 = [[GainValueArray alloc] initWithArray:v48];
                      uint64_t v52 = v41[2];
                      v41[2] = v51;

                      if (!v51)
                      {
                        uint64_t v135 = v138;
                        LODWORD(v134) = 0;
                        goto LABEL_104;
                      }
                      goto LABEL_47;
                    }
                    if ([v47 isEqualToString:@"ChromaBlackThreshold"])
                    {
                      v53 = [[GainValueArray alloc] initWithArray:v48];
                      id v54 = v41[3];
                      v41[3] = v53;

                      if (!v53)
                      {
                        uint64_t v135 = v138;
                        LODWORD(v134) = 0;
                        goto LABEL_104;
                      }
                      goto LABEL_47;
                    }
                    if ([v47 isEqualToString:@"DecayEdgeBoost"])
                    {
                      id v55 = [[GainValueArray alloc] initWithArray:v48];
                      v56 = v41[4];
                      v41[4] = v55;

                      if (!v55)
                      {
                        uint64_t v135 = v138;
                        LODWORD(v134) = 0;
                        goto LABEL_104;
                      }
LABEL_47:

                      goto LABEL_48;
                    }
                    v57 = v41 + 5;
                    if (([v47 isEqualToString:@"DiffWeight"] & 1) == 0)
                    {
                      v57 = v41 + 6;
                      if (([v47 isEqualToString:@"LumaFusionStrength"] & 1) == 0)
                      {
                        v57 = v41 + 7;
                        if (([v47 isEqualToString:@"ChromaFusionStrength"] & 1) == 0) {
                          goto LABEL_47;
                        }
                      }
                    }
                    v58 = [v42 objectForKeyedSubscript:v47];
                    uint64_t v59 = *v57;
                    id v60 = v58;
                    id v61 = v59;
                    objc_opt_class();
                    int v62 = -73349;
                    if (objc_opt_isKindOfClass())
                    {
                      id v63 = v60;
                      v64 = [v63 objectForKeyedSubscript:@"EV0Reference"];
                      v160 = v63;
                      uint64_t v65 = [v63 objectForKeyedSubscript:@"EVMReference"];
                      v161 = v64;
                      int v66 = handle_sparse_dense_band_data(v64, v61[1]);
                      if (v66)
                      {
                        int v62 = v66;
                        uint64_t v135 = v138;
                        LODWORD(v134) = v66;
                      }
                      else
                      {
                        int v67 = handle_sparse_dense_band_data(v65, v61[2]);
                        int v62 = v67;
                        if (!v67)
                        {
LABEL_56:

                          goto LABEL_57;
                        }
                        uint64_t v135 = v138;
                        LODWORD(v134) = v67;
                      }
                      FigDebugAssert3();
                      goto LABEL_56;
                    }
LABEL_57:

                    if (v62)
                    {

                      id v10 = v145;
                      uint64_t v36 = v167;
                      id v23 = v155;
                      goto LABEL_79;
                    }
LABEL_48:
                    ++v46;
                  }
                  while (v44 != v46);
                  uint64_t v68 = [v42 countByEnumeratingWithState:type objects:&v186 count:16];
                  uint64_t v44 = v68;
                }
                while (v68);
              }

              uint64_t v69 = [v42 objectForKey:@"LumaBlackThreshold"];
              id v10 = v145;
              id v23 = v155;
              if (!v69) {
                goto LABEL_67;
              }
              v70 = (void *)v69;
              v71 = [v42 objectForKey:@"ChromaBlackThreshold"];

              if (v71) {
                goto LABEL_67;
              }
              uint64_t v72 = [v42 objectForKeyedSubscript:@"LumaBlackThreshold"];
              v73 = [[GainValueArray alloc] initWithArray:v72];
              id v74 = v41[3];
              v41[3] = v73;

              if (!v73) {
                break;
              }

LABEL_67:
              id v75 = objc_msgSend(v42, "objectForKey:", @"DecayEdgeBoost", v134);

              if (!v75)
              {
                v76 = [[GainValueArray alloc] initWithArray:&unk_270E97B58];
                v77 = v41[4];
                v41[4] = v76;

                if (!v76)
                {
                  uint64_t v135 = v138;
                  LODWORD(v134) = 0;
                  FigDebugAssert3();
                  goto LABEL_148;
                }
              }
              float32x2_t v24 = v150;
              [(NSMutableArray *)v150->super._keyPaths addObject:v41];

              uint64_t v39 = v152 + 1;
              if (v152 + 1 == v148)
              {
                int v62 = 0;
                uint64_t v36 = v167;
                id v38 = v139;
                uint64_t v148 = [v154 countByEnumeratingWithState:&v180 objects:v188 count:16];
                if (!v148) {
                  goto LABEL_106;
                }
                goto LABEL_28;
              }
            }
            uint64_t v135 = v138;
            LODWORD(v134) = 0;
            FigDebugAssert3();

LABEL_148:
            int v62 = -73349;
            uint64_t v36 = v167;
LABEL_79:
            float32x2_t v24 = v150;
LABEL_105:

            id v38 = v139;
LABEL_106:

LABEL_107:
            if (v62)
            {
              uint64_t v135 = v138;
              LODWORD(v134) = v62;
              FigDebugAssert3();

              int v33 = 0;
              id v11 = v146;
LABEL_136:
              id v15 = v156;
              goto LABEL_130;
            }
            LOBYTE(v24->withoutFaces.dlux_x2) = objc_msgSend(v36, "cmi_BOOLValueForKey:defaultValue:found:", @"PreWarpInputs", 0, 0);
            objc_msgSend(v36, "cmi_floatValueForKey:defaultValue:found:", @"GrayGhostingCutoff", 0, 0.0);
            v24->withoutFaces.dlux_y2 = v88;
            objc_msgSend(v36, "cmi_floatValueForKey:defaultValue:found:", @"GrayGhostingEV0EVMDifferenceThreshold", 0, 0.0);
            v24->withoutFaces.dsoft_x1 = v89;
            objc_msgSend(v36, "cmi_floatValueForKey:defaultValue:found:", @"GrayGhostingEV0WeightThreshold", 0, 0.0);
            v24->withoutFaces.dsoft_y1 = v90;
            objc_msgSend(v36, "cmi_floatValueForKey:defaultValue:found:", @"GrayGhostingClippingThreshold", 0, 0.0);
            v24->withoutFaces.dsoft_x2 = v91;
            objc_msgSend(v36, "cmi_floatValueForKey:defaultValue:found:", @"MotionDetectionClippingCutoffHigh", 0, 0.0);
            v24->withoutFaces.dlow_x1 = v92;
            objc_msgSend(v36, "cmi_floatValueForKey:defaultValue:found:", @"MotionDetectionClippingCutoffLow", 0, 0.0);
            v24->withoutFaces.dlow_y1 = v93;
            objc_msgSend(v36, "cmi_floatValueForKey:defaultValue:found:", @"MotionDetectionSifrEitCutoffHigh", 0, 0.0);
            v24->withoutFaces.dlow_x2 = v94;
            objc_msgSend(v36, "cmi_floatValueForKey:defaultValue:found:", @"MotionDetectionSifrEitCutoffLow", 0, 0.0);
            v24->withoutFaces.dlow_y2 = v95;
            objc_msgSend(v36, "cmi_floatValueForKey:defaultValue:found:", @"MotionDetectionGradientCutoffHigh", 0, 0.0);
            v24->withoutFaces.diso_x1 = v96;
            objc_msgSend(v36, "cmi_floatValueForKey:defaultValue:found:", @"MotionDetectionGamma", 0, 0.0);
            v24->withoutFaces.diso_y1 = v97;
            objc_msgSend(v36, "cmi_floatValueForKey:defaultValue:found:", @"MotionDetectionMotionThreshold", 0, 0.0);
            v24->withoutFaces.diso_x2 = v98;
            objc_msgSend(v36, "cmi_floatValueForKey:defaultValue:found:", @"MotionDetectionMotionThresholdStaticScene", 0, 0.0);
            v24->withoutFaces.diso_y2 = v99;
            LOBYTE(v24->withoutFaces.dsoft_y2) = objc_msgSend(v36, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableMotionDetection", 0, 0);
            objc_msgSend(v36, "cmi_floatValueForKey:defaultValue:found:", @"BlackAdaptiveBlurBoost", 0, 0.0);
            v24->withoutFaces.dclip_y2 = v100;
            v101 = [v36 objectForKeyedSubscript:@"GrayGhostingDepthOverrides"];
            v103 = v101;
            if (a5 && v101)
            {
              *(float *)&double v102 = v24->withoutFaces.dsoft_x1;
              objc_msgSend(v101, "cmi_floatValueForKey:defaultValue:found:", @"GrayGhostingEV0EVMDifferenceThreshold", 0, v102);
              v24->withoutFaces.dsoft_x1 = v104;
              *(float *)&double v105 = v24->withoutFaces.dsoft_x2;
              objc_msgSend(v103, "cmi_floatValueForKey:defaultValue:found:", @"GrayGhostingClippingThreshold", 0, v105);
              v24->withoutFaces.dsoft_x2 = v106;
            }
            v107 = v36;
            v108 = objc_msgSend(v36, "objectForKeyedSubscript:", @"LensShadingFactor", v134);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v109 = [[GainValueArray alloc] initWithArray:v108];
              unsigned int v110 = *(void **)&v24->withoutFaces.dhist_hi;
              *(void *)&v24->withoutFaces.dhist_huint64_t i = v109;

              if (!*(void *)&v24->withoutFaces.dhist_hi)
              {
                uint64_t v135 = v138;
                LODWORD(v134) = 0;
                goto LABEL_139;
              }
            }
            else
            {
              v111 = *(void **)&v24->withoutFaces.dhist_hi;
              *(void *)&v24->withoutFaces.dhist_huint64_t i = 0;

              objc_msgSend(v36, "cmi_floatValueForKey:defaultValue:found:", @"LensShadingFactor", 0, 0.0);
              v24->withoutFaces.dhist_mid = v112;
            }
            LOBYTE(v24->withoutFaces.dhist_low) = objc_msgSend(v36, "cmi_BOOLValueForKey:defaultValue:found:", @"ScaleLensShadingByCropFactor", 0, 0);
            LODWORD(v24->withoutFaces.hdr_ref) = objc_msgSend(v36, "cmi_intValueForKey:defaultValue:found:", @"HybridRegistrationMode", 0, 0);
            v113 = [GainValueArray alloc];
            id v114 = [v107 valueForKey:@"ShadowDenseBlendStrength"];
            uint64_t v115 = [(GainValueArray *)v113 initWithArray:v114];
            v116 = *(void **)&v24->withoutFaces.hdr_mix[1];
            *(void *)&v24->withoutFaces.hdr_mix[1] = v115;

            if (!*(void *)&v24->withoutFaces.hdr_mix[1])
            {
              uint64_t v135 = v138;
              LODWORD(v134) = 0;
LABEL_139:
              FigDebugAssert3();
              int v33 = FigSignalErrorAt();
              id v15 = v156;
              id v23 = v155;
              goto LABEL_145;
            }
            v117 = [GainValueArray alloc];
            v118 = [v107 valueForKey:@"NonShadowDenseBlendStrength"];
            uint64_t v119 = [(GainValueArray *)v117 initWithArray:v118];
            uint64_t v120 = *(void **)&v24->withoutFaces.clipped_pixels_thresh;
            *(void *)&v24->withoutFaces.clipped_pixels_thresh = v119;

            if (!*(void *)&v24->withoutFaces.clipped_pixels_thresh)
            {
              uint64_t v135 = v138;
              LODWORD(v134) = 0;
              goto LABEL_139;
            }
            int v121 = objc_msgSend(v107, "cmi_BOOLValueForKey:defaultValue:found:", @"EnablePatchBasedFusion", 0, 0);
            LOBYTE(v24->withoutFaces.clipping_compression_end) = v121;
            id v15 = v156;
            if (!v121) {
              goto LABEL_122;
            }
            id v122 = v10;
            id v123 = [v107 objectForKeyedSubscript:@"PatchBasedFusionParameters"];
            if (!v123)
            {
              uint64_t v135 = v138;
              LODWORD(v134) = 0;
              FigDebugAssert3();
              int v33 = FigSignalErrorAt();
              id v23 = v155;
              goto LABEL_142;
            }
            objc_opt_class();
            id v23 = v155;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v135 = v138;
              LODWORD(v134) = 0;
              FigDebugAssert3();
              int v33 = -73349;
LABEL_142:

LABEL_144:
              id v10 = v122;
LABEL_145:

              id v11 = v146;
              goto LABEL_130;
            }
            v124 = objc_opt_new();
            int v125 = [v124 readPlist:v123];
            if (v125)
            {
              uint64_t v135 = v138;
              LODWORD(v134) = v125;
              FigDebugAssert3();
              int v33 = FigSignalErrorAt();

              id v15 = v156;
              goto LABEL_144;
            }
            v126 = *(void **)&v24->withoutFaces.dclip_y1;
            *(void *)&v24->withoutFaces.dclip_y1 = v124;

            v107 = v167;
            id v10 = v122;
LABEL_122:
            LOBYTE(v24->withoutFaces.clip_power) = objc_msgSend(v107, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableStationaryFusion", 0, 0);

            id v11 = v146;
            id v23 = v155;
LABEL_20:
            id v27 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            id v28 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            [v27 setObject:v24 forKeyedSubscript:v166];
            [v28 setObject:v167 forKeyedSubscript:v166];
            long long v29 = [v23 allKeys];
            int v30 = [v29 containsObject:v165];

            if (v30)
            {
              v31 = [v23 objectForKeyedSubscript:v165];
              [v31 addEntriesFromDictionary:v27];

              id v32 = [v164 objectForKeyedSubscript:v165];
              [v32 addEntriesFromDictionary:v28];
            }
            else
            {
              [v23 setObject:v27 forKeyedSubscript:v165];
              [v164 setObject:v28 forKeyedSubscript:v165];
            }

            int v33 = 0;
            id v15 = v156;
LABEL_130:

            if (v33) {
              goto LABEL_153;
            }
            uint64_t v18 = v162 + 1;
          }
          while (v162 + 1 != v158);
          uint64_t v16 = [v15 countByEnumeratingWithState:&v168 objects:v184 count:16];
          uint64_t v158 = v16;
        }
        while (v16);
      }
LABEL_153:

      unsigned int v129 = [v10 objectForKeyedSubscript:v141];

      if (v129)
      {
        uint64_t v130 = [v143 objectForKeyedSubscript:v141];
        [v130 addEntriesFromDictionary:v10];

        v131 = [v142 objectForKeyedSubscript:v141];
        [v131 addEntriesFromDictionary:v11];
      }
      else
      {
        [v143 setObject:v10 forKeyedSubscript:v141];
        [v142 setObject:v11 forKeyedSubscript:v141];
      }

      uint64_t v12 = v153 + 1;
    }
    while (v153 + 1 != v144);
    uint64_t v144 = [obj countByEnumeratingWithState:&v172 objects:v185 count:16];
  }
  while (v144);
LABEL_158:

  uint64_t v132 = 0;
LABEL_160:

  return v132;
}

uint64_t handle_sparse_dense_band_data(void *a1, void *a2)
{
  id v3 = a1;
  float32x4_t v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v16 = [[GainValueArray alloc] initWithArray:v3];
    uint64_t v17 = (void *)v4[1];
    v4[1] = v16;

    if (v16)
    {
      uint64_t v18 = [[GainValueArray alloc] initWithArray:v3];
      id v19 = (void *)v4[2];
      _OWORD v4[2] = v18;

      if (v18)
      {
        float v20 = [[GainValueArray alloc] initWithArray:v3];
        id v21 = (void *)v4[3];
        v4[3] = v20;

        if (v20)
        {
          uint64_t v15 = 0;
          goto LABEL_11;
        }
        uint64_t v15 = 4294893947;
      }
      else
      {
        uint64_t v15 = 4294893947;
      }
    }
    else
    {
      uint64_t v15 = 4294893947;
    }
    FigDebugAssert3();
    goto LABEL_11;
  }
  id v5 = v3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"SparseFrameParameters"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"SparseFrameParametersStaticScene"];
  id v8 = [v5 objectForKeyedSubscript:@"DenseFrameParameters"];
  float v9 = [[GainValueArray alloc] initWithArray:v6];
  id v10 = (void *)v4[1];
  v4[1] = v9;

  if (!v9)
  {
    uint64_t v15 = 4294893947;
LABEL_15:
    FigDebugAssert3();
    goto LABEL_6;
  }
  id v11 = [[GainValueArray alloc] initWithArray:v7];
  uint64_t v12 = (void *)v4[2];
  _OWORD v4[2] = v11;

  if (!v11)
  {
    uint64_t v15 = 4294893947;
    goto LABEL_15;
  }
  uint64_t v13 = [[GainValueArray alloc] initWithArray:v8];
  float v14 = (void *)v4[3];
  v4[3] = v13;

  if (!v13)
  {
    uint64_t v15 = 4294893947;
    goto LABEL_15;
  }
  uint64_t v15 = 0;
LABEL_6:

LABEL_11:
  return v15;
}

uint64_t isRawDFPowerBlurEnabled()
{
  return 1;
}

float getCompressionRatio(unsigned int a1)
{
  float result = 1.0;
  if (a1 <= 3) {
    return flt_263380220[a1];
  }
  return result;
}

BOOL isRawDFQuadraFrameType(int a1)
{
  return a1 == 3;
}

void sub_263202BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

Class __getVNObservationClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __VisionLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2655C7BE0;
    uint64_t v5 = 0;
    VisionLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!VisionLibraryCore_frameworkLibrary) {
    __getVNObservationClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("VNObservation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getVNObservationClass_block_invoke_cold_2();
  }
  getVNObservationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t computeTextureStrideForBufferAllocation(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [v5 device];
  unint64_t v7 = [v6 minimumLinearTextureAlignmentForPixelFormat:a2];

  uint64_t v8 = [v5 getPixelSizeInBytes:a2];
  unint64_t v9 = v8 * a1 % v7;
  if (v9) {
    return v8 * a1 + v7 - v9;
  }
  else {
    return v8 * a1;
  }
}

void sub_263209334(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2632233B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

float32x2_t computeBoundaryCoordinates(double a1, double a2, double a3, double a4, double a5, double a6, float a7)
{
  float v7 = a1 + a3;
  float v8 = a1;
  float v9 = a3 * a7 * 0.5;
  *(float *)&a1 = v8 - v9;
  if (*(float *)&a1 < 0.0) {
    *(float *)&a1 = 0.0;
  }
  float v10 = v7 + v9;
  if (v10 > 1.0) {
    float v10 = 1.0;
  }
  float v11 = a5;
  *((float *)&a1 + 1) = v10;
  return vmul_n_f32(*(float32x2_t *)&a1, v11);
}

Class __getVNFaceObservationClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __VisionLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2655C7CB0;
    uint64_t v5 = 0;
    VisionLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!VisionLibraryCore_frameworkLibrary_0) {
    __getVNObservationClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("VNFaceObservation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getVNFaceObservationClass_block_invoke_cold_2();
  }
  getVNFaceObservationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void encodeDownsample(void *a1, void *a2, void *a3, float64_t a4, float64_t a5, float64_t a6, float64_t a7)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a1;
  uint64_t v12 = [v10 width];
  uint64_t v13 = [v10 height];
  v14.i64[0] = v12;
  v14.i64[1] = v13;
  float64x2_t v15 = vcvtq_f64_u64(v14);
  float32x4_t v32 = vdivq_f32((float32x4_t)xmmword_2633802F0, vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v15), v15));
  float32x4_t v40 = v32;
  v15.f64[0] = a4;
  float64_t v16 = a5;
  float64_t v17 = a6;
  float64_t v18 = a7;
  if (!CGRectIsNull(*(CGRect *)v15.f64))
  {
    v19.f64[0] = a4;
    v19.f64[1] = a5;
    float32x2_t v20 = vcvt_f32_f64(v19);
    v19.f64[0] = a6;
    v19.f64[1] = a7;
    float32x2_t v21 = vcvt_f32_f64(v19);
    uint64_t v22 = [v9 width];
    uint64_t v23 = [v9 height];
    v24.i64[0] = v22;
    v24.i64[1] = v23;
    __asm { FMOV            V1.2S, #1.0 }
    *(float32x2_t *)v24.i8 = vdiv_f32(_D1, vcvt_f32_f64(vcvtq_f64_u64(v24)));
    *(float32x2_t *)v30.f32 = vmul_f32(*(float32x2_t *)v24.i8, v21);
    v30.i64[1] = v30.i64[0];
    int8x16_t v31 = (int8x16_t)vmulq_f32(v32, v30);
    v31.u64[1] = (unint64_t)vadd_f32(vmul_f32(*(float32x2_t *)v24.i8, v20), (float32x2_t)*(_OWORD *)&vextq_s8(v31, v31, 8uLL));
    float32x4_t v40 = (float32x4_t)v31;
  }
  objc_msgSend(v11, "setBytes:length:atIndex:", &v40, 16, 0, *(_OWORD *)&v32);
  [v11 setTexture:v9 atIndex:0];
  [v11 setTexture:v10 atIndex:1];
  v39[0] = [v10 width];
  v39[1] = [v10 height];
  v39[2] = 1;
  int64x2_t v37 = vdupq_n_s64(0x20uLL);
  uint64_t v38 = 1;
  [v11 dispatchThreads:v39 threadsPerThreadgroup:&v37];
}

void sub_263230D48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 256));
  _Unwind_Resume(a1);
}

void sub_26323355C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

BOOL sanityCheckHomography(float32x4_t *a1)
{
  unint64_t v1 = 0;
  BOOL v2 = 0;
  v12[4] = *MEMORY[0x263EF8340];
  v12[0] = 0;
  v12[1] = 0x3F80000000000000;
  v12[2] = 1065353216;
  __asm { FMOV            V0.2S, #1.0 }
  v12[3] = _D0;
  do
  {
    float32x2_t v8 = (float32x2_t)v12[v1];
    int32x4_t v9 = (int32x4_t)vaddq_f32(a1[2], vmlaq_lane_f32(vmulq_n_f32(*a1, v8.f32[0]), a1[1], v8, 1));
    float32x2_t v10 = vsub_f32(v8, vdiv_f32(*(float32x2_t *)v9.i8, (float32x2_t)vdup_laneq_s32(v9, 2)));
    if (sqrtf(vaddv_f32(vmul_f32(v10, v10))) > 1.0) {
      break;
    }
    BOOL v2 = v1++ > 2;
  }
  while (v1 != 4);
  return v2;
}

void sub_26323C4B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ReportMemoryException()
{
  mach_msg_type_number_t host_info_outCnt = 0;
  vm_size_t v34 = 0;
  memset(host_info_out, 0, 60);
  uint64_t v32 = 0;
  memset(task_info_out, 0, sizeof(task_info_out));
  mach_msg_type_number_t task_info_outCnt = 10;
  v29[0] = 0;
  v29[1] = 0;
  mach_msg_type_number_t v28 = 4;
  int v27 = 0;
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
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  *(_OWORD *)long long v4 = 0u;
  long long v5 = 0u;
  mach_msg_type_number_t v3 = 93;
  v0 = (task_name_t *)MEMORY[0x263EF8960];
  if (task_info(*MEMORY[0x263EF8960], 0x12u, (task_info_t)task_info_out, &task_info_outCnt)
    || task_info(*v0, 3u, (task_info_t)v29, &v28)
    || task_info(*v0, 0x16u, v4, &v3)
    || (host_t v1 = MEMORY[0x263E64A00](),
        mach_msg_type_number_t host_info_outCnt = 15,
        host_page_size(v1, &v34),
        uint64_t result = host_statistics(v1, 2, (host_info_t)host_info_out, &host_info_outCnt),
        result))
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

uint64_t __VisionLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_1 = result;
  return result;
}

float colorspace_setDefaultCscMatrix(simd_float4 *a1, unsigned int a2)
{
  uint64_t v3 = 0;
  float v4 = (float)a2 / 65535.0;
  float32_t v5 = -(float)(v4 * (float)(1.0 / (float)(1.0 - v4)));
  v6.i32[1] = 0;
  v6.i32[2] = 0;
  v6.f32[0] = 1.0 / (float)(1.0 - v4);
  v6.f32[3] = v5;
  v8[0] = *(_OWORD *)byte_263380000;
  v8[1] = *(_OWORD *)&byte_263380000[16];
  v8[2] = *(_OWORD *)&byte_263380000[32];
  simd_float4 v9 = 0u;
  simd_float4 v10 = 0u;
  simd_float4 v11 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v9 + v3 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v6, COERCE_FLOAT(v8[v3])), (float32x4_t)xmmword_263380040, *(float32x2_t *)&v8[v3], 1), (float32x4_t)xmmword_263380050, (float32x4_t)v8[v3], 2);
    ++v3;
  }
  while (v3 != 3);
  v12.columns[0] = v9;
  v12.columns[1] = v10;
  v12.columns[2] = v11;
  a1[3] = v9;
  a1[4] = v12.columns[1];
  a1[5] = v12.columns[2];
  v12.columns[3] = (simd_float4)xmmword_263380060;
  simd_float4x4 v13 = __invert_f4(v12);
  *a1 = v13.columns[0];
  a1[1] = v13.columns[1];
  a1[2] = v13.columns[2];
  float result = 1.0 / a1[11].f32[3];
  a1[11].f32[2] = result;
  return result;
}

float colorspace_setCustomCscMatrix(uint64_t a1)
{
  *(_OWORD *)(a1 + 48) = xmmword_263380090;
  *(_OWORD *)(a1 + 64) = xmmword_2633800A0;
  *(_OWORD *)(a1 + 80) = xmmword_2633800B0;
  *(_DWORD *)(a1 + 188) = 1065204301;
  simd_float4x4 v3 = __invert_f4(*(simd_float4x4 *)_PromotedConst_0);
  *(simd_float4 *)a1 = v3.columns[0];
  *(simd_float4 *)(a1 + 16) = v3.columns[1];
  *(simd_float4 *)(a1 + 32) = v3.columns[2];
  float result = 1.0 / *(float *)(a1 + 188);
  *(float *)(a1 + 184) = result;
  return result;
}

void sub_26324EEB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id location)
{
  objc_destroyWeak(v35);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_263256A20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id location)
{
  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_26325BC04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t allocateBufsIfNeeded(void *a1, unint64_t a2, unint64_t a3, void *a4, int a5, int a6)
{
  simd_float4 v11 = a1;
  id v12 = a4;
  simd_float4x4 v13 = [v12 allocator];
  long long v14 = (void *)[v13 newTextureDescriptor];

  if (!v14) {
    goto LABEL_14;
  }
  long long v15 = [v14 desc];
  [v15 setUsage:7];

  long long v16 = [v14 desc];
  [v16 setWidth:a2];

  long long v17 = [v14 desc];
  [v17 setHeight:a3];

  long long v18 = [v14 desc];
  [v18 setPixelFormat:25];

  if (a5)
  {
    if ((FigMetalIsValid() & 1) == 0)
    {
      [v14 setLabel:0];
      long long v19 = [v12 allocator];
      uint64_t v20 = [v19 newTextureWithDescriptor:v14];
      long long v21 = (void *)v11[4];
      v11[4] = v20;

      if (!v11[4]) {
        goto LABEL_14;
      }
    }
    if ((FigMetalIsValid() & 1) == 0)
    {
      [v14 setLabel:0];
      long long v22 = [v12 allocator];
      uint64_t v23 = [v22 newTextureWithDescriptor:v14];
      long long v24 = (void *)v11[2];
      v11[2] = v23;

      if (!v11[2]) {
        goto LABEL_14;
      }
    }
  }
  long long v25 = [v14 desc];
  [v25 setWidth:a2 >> 1];

  long long v26 = [v14 desc];
  [v26 setHeight:a3 >> 1];

  int v27 = [v14 desc];
  [v27 setPixelFormat:65];

  if (!a6) {
    goto LABEL_12;
  }
  if ((FigMetalIsValid() & 1) == 0)
  {
    [v14 setLabel:0];
    mach_msg_type_number_t v28 = [v12 allocator];
    uint64_t v29 = [v28 newTextureWithDescriptor:v14];
    float32x4_t v30 = (void *)v11[5];
    v11[5] = v29;

    if (!v11[5]) {
      goto LABEL_14;
    }
  }
  if (FigMetalIsValid()) {
    goto LABEL_12;
  }
  [v14 setLabel:0];
  int8x16_t v31 = [v12 allocator];
  uint64_t v32 = [v31 newTextureWithDescriptor:v14];
  int v33 = (void *)v11[3];
  v11[3] = v32;

  if (v11[3])
  {
LABEL_12:
    uint64_t v34 = 0;
  }
  else
  {
LABEL_14:
    FigDebugAssert3();
    uint64_t v34 = FigSignalErrorAt();
  }

  return v34;
}

void sub_263262EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  for (uint64_t i = 416; i != -16; i -= 48)
    objc_destroyWeak((id *)(&a30 + i));
  for (uint64_t j = 80; j != -16; j -= 24)

  _Unwind_Resume(a1);
}

unint64_t getLTM_validWidth(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return (unsigned __int16)a1[1] - ((unsigned __int16)a1[7] + (unint64_t)(unsigned __int16)a1[8]);
    default:
      if (*a1 == 1001) {
        return (unsigned __int16)a1[1] - ((unsigned __int16)a1[7] + (unint64_t)(unsigned __int16)a1[8]);
      }
      else {
        return 0;
      }
  }
}

unint64_t getLTM_validHeight(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return (unsigned __int16)a1[2] - ((unsigned __int16)a1[5] + (unint64_t)(unsigned __int16)a1[6]);
    default:
      if (*a1 == 1001) {
        return (unsigned __int16)a1[2] - ((unsigned __int16)a1[5] + (unint64_t)(unsigned __int16)a1[6]);
      }
      else {
        return 0;
      }
  }
}

uint64_t getLTM_leftPadding(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return (unsigned __int16)a1[7];
    default:
      if (*a1 == 1001) {
        return (unsigned __int16)a1[7];
      }
      else {
        return 0;
      }
  }
}

uint64_t getLTM_topPadding(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return (unsigned __int16)a1[5];
    default:
      if (*a1 == 1001) {
        return (unsigned __int16)a1[5];
      }
      else {
        return 0;
      }
  }
}

uint64_t getLTM_tileWidth(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return (unsigned __int16)a1[9];
    default:
      if (*a1 == 1001) {
        return (unsigned __int16)a1[9];
      }
      else {
        return 0;
      }
  }
}

uint64_t getLTM_tileHeight(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return (unsigned __int16)a1[10];
    default:
      if (*a1 == 1001) {
        return (unsigned __int16)a1[10];
      }
      else {
        return 0;
      }
  }
}

uint64_t getLTM_lutsBytesPerRow(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return (unsigned __int16)a1[3];
    default:
      if (*a1 == 1001) {
        return (unsigned __int16)a1[3];
      }
      else {
        return 0;
      }
  }
}

uint64_t getLTM_lutsBytesPerColumn(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
      uint64_t result = 2 * (unsigned __int16)a1[4];
      break;
    case 3:
    case 4:
      goto LABEL_4;
    default:
      if (*a1 == 1001) {
LABEL_4:
      }
        uint64_t result = (unsigned __int16)a1[4];
      else {
        uint64_t result = 0;
      }
      break;
  }
  return result;
}

uint64_t getLTM_ltmCurveEntryCount(_WORD *a1)
{
  uint64_t v2 = 0;
  _getLTM_ltmCurveAndCCMEntryCounts(a1, &v2, 0);
  return v2;
}

_WORD *_getLTM_ltmCurveAndCCMEntryCounts(_WORD *result, void *a2, uint64_t *a3)
{
  switch(*result)
  {
    case 1:
      int v3 = (unsigned __int16)result[4];
      if (v3 == 33) {
        int v4 = 33;
      }
      else {
        int v4 = 0;
      }
      if (v3 == 60) {
        unsigned int v5 = 33;
      }
      else {
        unsigned int v5 = v4;
      }
      if (v3 == 60) {
        uint64_t v6 = 27;
      }
      else {
        uint64_t v6 = 0;
      }
      if (a2) {
        goto LABEL_39;
      }
      break;
    case 2:
      int v7 = (unsigned __int16)result[4];
      uint64_t v8 = 27;
      if (v7 == 92) {
        unsigned int v5 = 65;
      }
      else {
        unsigned int v5 = 0;
      }
      if (v7 != 92) {
        uint64_t v8 = 0;
      }
      if (v7 == 65)
      {
        unsigned int v5 = 65;
        uint64_t v8 = 0;
      }
      uint64_t v9 = 27;
      if (v7 == 60) {
        int v10 = 33;
      }
      else {
        int v10 = 0;
      }
      if (v7 != 60) {
        uint64_t v9 = 0;
      }
      if (v7 == 33)
      {
        int v10 = 33;
        uint64_t v9 = 0;
      }
      if ((unsigned __int16)result[4] > 0x40u)
      {
        uint64_t v6 = v8;
      }
      else
      {
        unsigned int v5 = v10;
        uint64_t v6 = v9;
      }
      if (a2) {
        goto LABEL_39;
      }
      break;
    case 3:
      unsigned int v5 = (unsigned __int16)result[11];
      uint64_t v6 = (unsigned __int16)result[12];
      if (a2) {
        goto LABEL_39;
      }
      break;
    case 4:
      uint64_t v6 = 0;
      unsigned int v5 = (unsigned __int16)result[11];
      if (a2) {
        goto LABEL_39;
      }
      break;
    default:
      uint64_t v6 = 27;
      unsigned int v5 = 0;
      if (*result != 1001) {
        uint64_t v6 = 0;
      }
      if (a2) {
LABEL_39:
      }
        *a2 = v5;
      break;
  }
  if (a3) {
    *a3 = v6;
  }
  return result;
}

_WORD *getLTM_spatialCCMEntryCount(_WORD *result)
{
  uint64_t v1 = 0;
  if (result)
  {
    _getLTM_ltmCurveAndCCMEntryCounts(result, 0, &v1);
    return (_WORD *)v1;
  }
  return result;
}

uint64_t getLTM_data(_WORD *a1, uint64_t a2)
{
  switch(*a1)
  {
    case 1:
    case 2:
      uint64_t result = (uint64_t)&a1[a2 + 11];
      break;
    case 3:
      uint64_t result = (uint64_t)&a1[a2 + 13];
      break;
    case 4:
      uint64_t result = (uint64_t)&a1[a2 + 12];
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

double getLTM_spatialCCMEntry(unsigned __int16 *a1, uint64_t a2, uint64_t a3, int a4)
{
  long long v19 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  long long v20 = *MEMORY[0x263EF89A0];
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  _getLTM_ltmCurveAndCCMEntryCounts(a1, &v22, &v21);
  if (!v21) {
    return *(double *)&v20;
  }
  int v8 = *a1;
  switch(*a1)
  {
    case 1u:
    case 2u:
    case 3u:
    case 4u:
      goto LABEL_3;
    default:
      if (v8 == 1001) {
LABEL_3:
      }
        uint64_t v9 = a1[7];
      else {
        uint64_t v9 = 0;
      }
      uint64_t v10 = v9 + a2;
      switch(*a1)
      {
        case 1u:
        case 2u:
        case 3u:
        case 4u:
          goto LABEL_5;
        default:
          if (v8 == 1001) {
LABEL_5:
          }
            uint64_t v11 = a1[5];
          else {
            uint64_t v11 = 0;
          }
          break;
      }
      break;
  }
  uint64_t v12 = v11 + a3;
  uint64_t LTM_lutsBytesPerColumn = getLTM_lutsBytesPerColumn(a1);
  v15.i32[3] = HIDWORD(v19);
  double result = *(double *)&v20;
  switch(v8)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      goto LABEL_7;
    default:
      v15.i32[3] = HIDWORD(v19);
      double result = *(double *)&v20;
      if (v8 == 1001) {
LABEL_7:
      }
        uint64_t v16 = a1[3];
      else {
        uint64_t v16 = 0;
      }
      if (v8 <= 2)
      {
        if (v8 != 1 && v8 != 2) {
          return result;
        }
        long long v17 = (__int16 *)&a1[v22 + 11 + ((unint64_t)(LTM_lutsBytesPerColumn * v10 + v16 * v12) >> 1)];
        goto LABEL_23;
      }
      if (v8 == 3)
      {
        long long v17 = (__int16 *)&a1[v22 + 13 + ((unint64_t)(LTM_lutsBytesPerColumn * v10 + v16 * v12) >> 1)];
LABEL_23:
        float v18 = 0.00024414;
        goto LABEL_24;
      }
      if (v8 != 1001) {
        return result;
      }
      long long v17 = (__int16 *)&a1[v22 + 12 + ((unint64_t)(LTM_lutsBytesPerColumn * v10 + v16 * v12) >> 1)];
      float v18 = 1.0 / (float)(__int16)a1[11];
LABEL_24:
      if (a4 == 2)
      {
        v15.f32[0] = (float)v17[2];
        v15.f32[1] = (float)v17[5];
        v15.f32[2] = (float)v17[8];
      }
      else if (a4 == 1)
      {
        v15.f32[0] = (float)v17[1];
        v15.f32[1] = (float)v17[4];
        v15.f32[2] = (float)v17[7];
      }
      else
      {
        if (a4) {
          return result;
        }
        v15.f32[0] = (float)*v17;
        v15.f32[1] = (float)v17[3];
        v15.f32[2] = (float)v17[6];
      }
      *(void *)&double result = vmulq_n_f32(v15, v18).u64[0];
      break;
  }
  return result;
}

uint64_t getLTM_asNSData(unsigned __int16 *a1)
{
  unsigned int v1 = *a1;
  if (v1 > 3)
  {
    if (v1 == 4 || v1 == 1001)
    {
      uint64_t v2 = 24;
LABEL_15:
      unsigned int v6 = a1[2];
      goto LABEL_16;
    }
  }
  else
  {
    if (v1 - 1 < 2)
    {
      uint64_t v2 = 22;
      goto LABEL_10;
    }
    if (v1 == 3)
    {
      uint64_t v2 = 26;
      goto LABEL_15;
    }
  }
  uint64_t v2 = 0;
LABEL_10:
  if (v1 == 2 || v1 == 1) {
    goto LABEL_15;
  }
  unsigned int v6 = 0;
LABEL_16:
  switch(*a1)
  {
    case 1u:
    case 2u:
    case 3u:
    case 4u:
      goto LABEL_17;
    default:
      if (v1 == 1001) {
LABEL_17:
      }
        unsigned int v4 = a1[3];
      else {
        unsigned int v4 = 0;
      }
      return [MEMORY[0x263EFF8F8] dataWithBytes:a1 length:v2 + v4 * (unint64_t)v6];
  }
}

uint64_t getLUT_asNSData(unsigned __int16 *a1)
{
  return [MEMORY[0x263EFF8F8] dataWithBytes:a1 length:2 * *a1 + 2];
}

uint64_t getLTMCurvesFromMetadata(void *a1, uint64_t a2, uint64_t a3)
{
  return getLTMCurvesFromMetadataWithKeys(a1, *MEMORY[0x263F2F530], (void *)*MEMORY[0x263F2F4D8], (void *)*MEMORY[0x263F2F4E8], a2, a3);
}

uint64_t getLTMCurvesFromMetadataWithKeys(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v10 = a1;
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = [v10 objectForKeyedSubscript:a2];
  uint64_t v14 = [v10 objectForKeyedSubscript:*MEMORY[0x263F2F540]];
  float32x4_t v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = (void *)v14;
  }
  else {
    uint64_t v16 = (void *)v13;
  }
  id v17 = v16;

  uint64_t v18 = [v10 objectForKeyedSubscript:v11];
  v56 = v12;
  long long v19 = [v10 objectForKeyedSubscript:v12];
  long long v20 = [v10 objectForKeyedSubscript:*MEMORY[0x263F2F380]];
  uint64_t v21 = [v10 objectForKeyedSubscript:*MEMORY[0x263F2F080]];
  id v55 = v10;
  uint64_t v22 = [v10 objectForKeyedSubscript:*MEMORY[0x263F2F0C0]];
  uint64_t v23 = 4294954512;
  long long v24 = (void *)v13;
  v57 = (void *)v18;
  if (!v13 || !v18)
  {
    long long v25 = (void *)v13;
    long long v26 = v19;
    goto LABEL_40;
  }
  long long v25 = (void *)v13;
  long long v26 = v19;
  if (v19)
  {
    if ((unint64_t)[v24 length] > 0x1B018)
    {
      FigDebugAssert3();
      uint64_t v23 = 4294954516;
      goto LABEL_40;
    }
    id v52 = v11;
    id v27 = v25;
    memcpy((void *)a6, (const void *)[v27 bytes], objc_msgSend(v27, "length"));
    if ((unint64_t)[v17 length] > 0x1B018)
    {
LABEL_45:
      FigDebugAssert3();
      uint64_t v23 = 4294954516;
      goto LABEL_46;
    }
    id v53 = v17;
    id v28 = v17;
    memcpy((void *)(a6 + 110616), (const void *)[v28 bytes], objc_msgSend(v28, "length"));
    if ((unint64_t)[v57 length] >= 0x205
      || (uint64_t v29 = (unsigned __int16 *)(a6 + 221232),
          id v30 = v57,
          memcpy((void *)(a6 + 221232), (const void *)[v30 bytes], objc_msgSend(v30, "length")),
          (unint64_t)[v19 length] >= 0x205))
    {
      FigDebugAssert3();
      uint64_t v23 = 4294954516;
    }
    else
    {
      id v31 = v19;
      memcpy((void *)(a6 + 221748), (const void *)[v31 bytes], objc_msgSend(v31, "length"));
      *(float *)(a6 + 222264) = (float)(*(float *)a5 / *(float *)(a5 + 32)) / *(float *)(a5 + 36);
      unint64_t LTM_validWidth = getLTM_validWidth((_WORD *)a6);
      unint64_t LTM_validHeight = getLTM_validHeight((_WORD *)a6);
      if (LTM_validWidth == 8 && LTM_validHeight == 6 || LTM_validWidth == 16 && LTM_validHeight == 12)
      {
        id v17 = v53;
        if ((getLTM_lutsBytesPerRow((_WORD *)a6) & 1) == 0)
        {
          if (!v20)
          {
            char v37 = 0;
LABEL_23:
            *(unsigned char *)(a6 + 222528) = v37;
            if (!v21)
            {
              char v40 = 0;
              goto LABEL_29;
            }
            if ([v21 count] == 257)
            {
              for (uint64_t i = 0; i != 257; ++i)
              {
                uint64_t v39 = [v21 objectAtIndexedSubscript:i];
                *(_WORD *)(a6 + 222530 + 2 * i) = [v39 unsignedShortValue];
              }
              char v40 = 1;
LABEL_29:
              uint64_t v41 = a6 + 223056;
              *(unsigned char *)(a6 + 223044) = v40;
              id v11 = v52;
              if (v22)
              {
                for (uint64_t j = 0; j != 3; ++j)
                {
                  uint64_t v43 = [v22 objectAtIndexedSubscript:j];
                  [v43 floatValue];
                  *(_DWORD *)(v41 + 4 * j) = v44;
                }
                char v45 = 1;
              }
              else
              {
                char v45 = 0;
              }
              *(unsigned char *)(v41 + 16) = v45;
              unsigned int v46 = *(_DWORD *)(a5 + 112);
              *((_DWORD *)v29 + 454) = v46;
              uint64_t v47 = *v29;
              if (*v29)
              {
                v48 = v29 + 1;
                LOWORD(v46) = v29[v47];
                HIWORD(v49) = 18303;
                float v50 = (float)v46 / 65535.0;
                id v17 = v53;
                do
                {
                  LOWORD(v49) = *v48;
                  float v49 = (float)LODWORD(v49) / v50;
                  *v48++ = (int)v49;
                  --v47;
                }
                while (v47);
                uint64_t v23 = 0;
                goto LABEL_40;
              }
              uint64_t v23 = 0;
LABEL_39:
              id v17 = v53;
              goto LABEL_40;
            }
            goto LABEL_45;
          }
          if ([v20 count] == 65)
          {
            for (uint64_t k = 0; k != 65; ++k)
            {
              v35 = [v20 objectAtIndexedSubscript:k];
              [v35 floatValue];
              *(_DWORD *)(a6 + 222268 + 4 * k) = v36;
            }
            char v37 = 1;
            id v17 = v53;
            goto LABEL_23;
          }
        }
        FigDebugAssert3();
        uint64_t v23 = 0;
LABEL_46:
        id v11 = v52;
        goto LABEL_40;
      }
      FigDebugAssert3();
      uint64_t v23 = 0;
    }
    id v11 = v52;
    goto LABEL_39;
  }
LABEL_40:

  return v23;
}

uint64_t getLTMCurvesForBackgroundFromMetadata(void *a1, uint64_t a2, uint64_t a3)
{
  return getLTMCurvesFromMetadataWithKeys(a1, *MEMORY[0x263F2F0E0], (void *)*MEMORY[0x263F2F090], (void *)*MEMORY[0x263F2F0A0], a2, a3);
}

uint64_t getHDRLTMCurvesFromMetadata(void *a1, uint64_t a2, uint64_t a3)
{
  return getLTMCurvesFromMetadataWithKeys(a1, *MEMORY[0x263F2F0E8], (void *)*MEMORY[0x263F2F098], (void *)*MEMORY[0x263F2F0A8], a2, a3);
}

float RansacLinearRegression(float *a1, float *a2, unsigned int a3, int a4)
{
  if (a3)
  {
    int v8 = 0;
    unsigned int v9 = 0;
    float v57 = (float)a3;
    float v10 = 0.0;
    uint64_t v11 = a3;
    float v12 = 0.0;
    uint64_t v56 = a3;
    while (1)
    {
      unsigned int v13 = 0;
      do
      {
        unsigned int v14 = 747796405 * v9 - 1403630843;
        unsigned int v15 = 277803737 * ((v9 >> ((v9 >> 28) + 4)) ^ v9);
        unsigned int v16 = (v15 ^ (v15 >> 22)) % a3;
        float v17 = a1[v16];
        float v18 = a2[v16];
        unsigned int v19 = 277803737 * ((v14 >> ((v14 >> 28) + 4)) ^ v14);
        unsigned int v20 = (v19 ^ (v19 >> 22)) % a3;
        float v21 = a1[v20];
        float v22 = a2[v20];
        float v23 = v17 + v21;
        if (a4)
        {
          float v24 = fminf((float)((float)(v18 + v22) - v23) * 0.5, 0.00048828);
          if (v24 < -0.00048828) {
            float v24 = -0.00048828;
          }
          float v25 = 1.0;
        }
        else
        {
          float v26 = (float)(v21 * v21) + (float)(v17 * v17);
          float v27 = (float)(v26 * 2.0) - (float)(v23 * v23);
          if (v27 <= 0.00000095367)
          {
            float v25 = 1.0;
            float v24 = 0.0;
          }
          else
          {
            float v28 = (float)(v21 * v22) + (float)(v17 * v18);
            float v29 = v18 + v22;
            float v24 = (float)((float)(v28 * (float)-v23) + (float)(v29 * v26)) / v27;
            float v25 = (float)((float)(v28 * 2.0) - (float)(v29 * v23)) / v27;
          }
        }
        unsigned int v9 = 747796405 * v14 - 1403630843;
      }
      while (v24 == 0.0 && v13++ < 9);
      if (v24 != 0.0)
      {
        float v31 = sqrtf((float)(v25 * v25) + 1.0);
        float v32 = 0.0;
        uint64_t v33 = v11;
        uint64_t v34 = a2;
        v35 = a1;
        float v36 = 0.0;
        float v37 = 0.0;
        float v38 = 0.0;
        float v39 = 0.0;
        do
        {
          float v40 = *v35;
          float v41 = *v34;
          if ((float)(vabds_f32(v24 + (float)(v25 * *v35), *v34) / v31) < 0.00097656)
          {
            float v39 = v39 + 1.0;
            float v38 = v38 + v40;
            float v37 = v37 + (float)(v40 * v40);
            float v36 = v36 + v41;
            float v32 = v32 + (float)(v40 * v41);
          }
          ++v35;
          ++v34;
          --v33;
        }
        while (v33);
        if (v39 == 0.0) {
          return v10;
        }
        if (a4)
        {
          float v42 = fminf((float)(v36 - v38) / v39, 0.00048828);
          if (v42 >= -0.00048828) {
            float v43 = v42;
          }
          else {
            float v43 = -0.00048828;
          }
          float v44 = 1.0;
        }
        else
        {
          float v45 = (float)(v39 * v37) - (float)(v38 * v38);
          if (v45 <= 0.00000095367)
          {
            float v44 = 1.0;
            float v43 = 0.0;
          }
          else
          {
            float v43 = (float)((float)(v32 * (float)-v38) + (float)(v36 * v37)) / v45;
            float v44 = (float)((float)(v39 * v32) - (float)(v36 * v38)) / v45;
          }
        }
        unsigned int v46 = 0;
        float v47 = sqrtf((float)(v44 * v44) + 1.0);
        float v48 = 0.0;
        uint64_t v49 = v11;
        float v50 = a2;
        unsigned int v51 = a1;
        do
        {
          float v52 = vabds_f32(v43 + (float)(v44 * *v51), *v50) / v47;
          if (v52 < 0.00073242)
          {
            ++v46;
            float v48 = v48 + (float)((float)(1.0 - *v51) * (float)((float)(v52 * -1024.0) + 1.0));
          }
          ++v51;
          ++v50;
          --v49;
        }
        while (v49);
        if (v48 > v12)
        {
          float v53 = logf(1.0 - (float)((float)((float)v46 / v57) * (float)((float)v46 / v57)));
          uint64_t v11 = v56;
          BOOL v54 = (float)(-6.9078 / v53) > (float)v8;
          float v10 = v43;
          float v12 = v48;
          if (!v54) {
            return v43;
          }
        }
      }
      ++v8;
      float v43 = v10;
      if (v8 == 500) {
        return v43;
      }
    }
  }
  return 0.0;
}

double getRelativeHomography(simd_float3x3 a1, float32x4_t a2, float32x4_t a3, float32x4_t a4)
{
  simd_float3x3 v11 = __invert_f3(a1);
  uint64_t v4 = 0;
  v11.columns[0].i32[3] = 0;
  v11.columns[1].i32[3] = 0;
  v11.columns[2].i32[3] = 0;
  simd_float3x3 v9 = v11;
  memset(v10, 0, sizeof(v10));
  do
  {
    v10[v4] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)&v9.columns[v4])), a3, *(float32x2_t *)v9.columns[v4].f32, 1), a4, (float32x4_t)v9.columns[v4], 2);
    ++v4;
  }
  while (v4 != 3);
  return *(double *)v10;
}

void __destructor_8_s0_s8_s16_s24(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
}

void print_grid_stats(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 width];
  uint64_t v5 = [v3 height] * v4;
  uint64_t v6 = v5 * [v3 depth];
  int v7 = (float *)malloc_type_malloc(4 * v6, 0x100004052888210uLL);
  uint64_t v8 = 4 * [v3 width];
  uint64_t v9 = [v3 width];
  uint64_t v10 = 4 * v9 * [v3 height];
  memset(v19, 0, 24);
  v19[3] = [v3 width];
  v19[4] = [v3 height];
  v19[5] = [v3 depth];
  [v3 getBytes:v7 bytesPerRow:v8 bytesPerImage:v10 fromRegion:v19 mipmapLevel:0 slice:0];
  double v11 = 0.0;
  if (v6)
  {
    float v12 = 3.4028e38;
    float v13 = 1.1755e-38;
    unsigned int v14 = v7;
    do
    {
      float v15 = *v14++;
      float v16 = v15;
      if (v15 < v12) {
        float v12 = v16;
      }
      if (v16 > v13) {
        float v13 = v16;
      }
      double v11 = v11 + v16;
      --v6;
    }
    while (v6);
    double v17 = v12;
    double v18 = v13;
  }
  else
  {
    double v18 = 1.17549435e-38;
    double v17 = 3.40282347e38;
  }
  NSLog(&cfstr_SFFG.isa, a2, *(void *)&v17, *(void *)&v18, *(void *)&v11);
  free(v7);
}

void sub_2632B0EC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

float interpolateWithGainAndZoom(void *a1, void *a2, float a3, float a4)
{
  id v7 = a2;
  float v8 = interpolate_with_gain(a1, a3);
  float v9 = a4 + -1.0;
  if (fabsf(v9) >= 0.00000011921) {
    float v8 = v8 + (float)(v9 * (float)(interpolate_with_gain(v7, a3) - v8));
  }

  return v8;
}

void __destructor_8_S_s16_s24_s32_s40_s48_s56_s64_s72_AB80s56n4_S_s80_s88_s96_s104_s112_s120_s128_AE_AB304s32n4_S_s304_s312_s320_s328_AE(uint64_t a1)
{
  __destructor_8_s0_s8_s16_s24_s32_s40_s48_s56(a1 + 16);
  for (uint64_t i = 0; i != 224; i += 56)
    __destructor_8_s0_s8_s16_s24_s32_s40_s48(a1 + 80 + i);
  uint64_t v3 = 0;
  uint64_t v4 = a1 + 304;
  do
  {
    __destructor_8_s0_s8_s16_s24(v4 + v3);
    v3 += 32;
  }
  while (v3 != 128);
}

void __destructor_8_s0_s8_s16_s24_s32_s40_s48_s56(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 56);
}

void __destructor_8_s0_s8_s16_s24_s32_s40_s48(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
}

void sub_2632BBC64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2632BF74C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void transformAndAddPortion(void *a1, int a2, int *a3, uint64_t a4, unint64_t a5, unint64_t *a6, float a7, float a8, float a9, float a10, float a11)
{
  uint64_t v20 = a2;
  id v21 = a1;
  float v22 = [v21 objectAtIndexedSubscript:v20];
  unsigned int v23 = (unsigned __int16)(int)(round((double)[v22 roll] / 90.0) * 90.0) % 0x168u;
  switch(v23)
  {
    case 0x10Eu:
      a7 = (float)(1.0 - a7) - a9;
      float v24 = a8;
      goto LABEL_6;
    case 0xB4u:
      float v24 = (float)(1.0 - a7) - a9;
      a7 = (float)(1.0 - a8) - a10;
      break;
    case 0x5Au:
      float v24 = (float)(1.0 - a8) - a10;
LABEL_6:
      float v25 = a10;
      goto LABEL_10;
    default:
      float v24 = a7;
      a7 = a8;
      break;
  }
  float v25 = a9;
  a9 = a10;
LABEL_10:

  float v26 = [v21 objectAtIndexedSubscript:v20];
  [v26 rect];
  double v28 = v27;
  float v29 = [v21 objectAtIndexedSubscript:v20];
  [v29 rect];
  *(float *)&double v30 = v30 + v24 * v28;
  unsigned int v51 = LODWORD(v30);

  double v31 = a7;
  float v32 = [v21 objectAtIndexedSubscript:v20];
  [v32 rect];
  double v34 = v33;
  v35 = [v21 objectAtIndexedSubscript:v20];
  [v35 rect];
  float v37 = v36 + v31 * v34;
  float v50 = v37;

  float v38 = [v21 objectAtIndexedSubscript:v20];
  [v38 rect];
  float v40 = v39 * v25;
  float v49 = v40;

  float v41 = [v21 objectAtIndexedSubscript:v20];

  [v41 rect];
  float v43 = v42 * a9;
  float v48 = v43;

  *(void *)&long long v44 = __PAIR64__(LODWORD(v50), v51);
  *((void *)&v44 + 1) = __PAIR64__(LODWORD(v48), LODWORD(v49));
  *(_OWORD *)(a4 + 16 * *a3 + 16) = v44;
  uint64_t v45 = *a3;
  *(float *)(a4 + 4 * v45 + 336) = a11;
  unint64_t v46 = vcvtps_u32_f32((float)a5 * v48);
  unint64_t v47 = v46 >> (v46 > 0xC8) >> (v46 >> (v46 > 0xC8) > 0xC8);
  if (v47 >= 0xC9)
  {
    FigDebugAssert3();
  }
  else
  {
    if (*a6 > v47) {
      unint64_t v47 = *a6;
    }
    *a6 = v47;
    *a3 = v45 + 1;
  }
}

void sub_2632C293C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,void *a55,void *a56)
{
  _Unwind_Resume(a1);
}

void getExposureParameters(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = (uint64_t *)MEMORY[0x263F2F2E0];
  id v148 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F2F468]];
    uint64_t v6 = v5;
    if (v5) {
      [v5 floatValue];
    }
    else {
      *(float *)&int v7 = 0.02;
    }
    int v133 = v7;
    float v22 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F2C0]];

    if (v22) {
      int v147 = [v22 intValue];
    }
    else {
      int v147 = 256;
    }
    unsigned int v23 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F700]];

    if (v23) {
      int v14 = [v23 intValue];
    }
    else {
      int v14 = 256;
    }
    float v24 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F6E8]];

    if (v24) {
      int v145 = [v24 intValue];
    }
    else {
      int v145 = 256;
    }
    float v25 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F300]];

    if (v25) {
      int v146 = [v25 intValue];
    }
    else {
      int v146 = 4096;
    }
    float v26 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F308]];

    if (v26) {
      int v144 = [v26 intValue];
    }
    else {
      int v144 = 4096;
    }
    double v27 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F2C8]];

    if (v27) {
      int v143 = [v27 intValue];
    }
    else {
      int v143 = 4096;
    }
    uint64_t v12 = *v4;
    double v28 = [v148 objectForKeyedSubscript:*v4];

    if (v28) {
      int v142 = [v28 intValue];
    }
    else {
      int v142 = 4096;
    }
    float v29 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F2D8]];

    if (v29) {
      int v141 = [v29 intValue];
    }
    else {
      int v141 = 4096;
    }
    double v30 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F2D0]];

    if (v30) {
      int v140 = [v30 intValue];
    }
    else {
      int v140 = 4096;
    }
    double v31 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F6F8]];

    if (v31) {
      int v139 = [v31 intValue];
    }
    else {
      int v139 = 256;
    }
    float v32 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F4F8]];

    if (v32) {
      int v17 = [v32 intValue];
    }
    else {
      int v17 = 4096;
    }
    double v33 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F378]];

    if (v33) {
      float v34 = (float)(unint64_t)[v33 unsignedLongLongValue];
    }
    else {
      float v34 = 1.0;
    }
    float v137 = v34;
    v35 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F460]];

    if (v35) {
      [v35 floatValue];
    }
    else {
      float v36 = 0.0;
    }
    float v138 = v36;
    float v37 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F638]];

    if (v37) {
      int v10 = [v37 BOOLValue];
    }
    else {
      int v10 = 0;
    }
    float v38 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F630]];

    if (v38) {
      [v38 floatValue];
    }
    else {
      float v39 = -2.0;
    }
    float v136 = v39;
    float v40 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F3D0]];

    float v15 = 0.0;
    float v41 = 0.0;
    if (v40) {
      objc_msgSend(v40, "floatValue", 0.0);
    }
    float v135 = v41;
    double v42 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F608]];

    if (v42)
    {
      [v42 floatValue];
      float v15 = v43 * 0.000015259;
    }
    long long v44 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F610]];

    float v16 = 0.0;
    float v45 = 0.0;
    if (v44)
    {
      objc_msgSend(v44, "floatValue", 0.0);
      float v45 = v46 * 0.000015259;
    }
    float v134 = v45;
    unint64_t v47 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F408]];

    if (v47)
    {
      [v47 floatValue];
      float v16 = v48 * 0.000015259;
    }
    float v49 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F648]];

    if (v49) {
      [v49 floatValue];
    }
    else {
      int v50 = 0;
    }
    int v132 = v50;
    unsigned int v51 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F538]];

    float v19 = 1.0;
    LODWORD(v52) = 1.0;
    if (v51) {
      objc_msgSend(v51, "floatValue", v52);
    }
    float v131 = *(float *)&v52;
    float v53 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F2B8]];

    if (v53)
    {
      [v53 floatValue];
      float v19 = v54;
    }
    id v55 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F2A8]];

    float v13 = 1.0;
    LODWORD(v56) = 1.0;
    if (v55) {
      objc_msgSend(v55, "floatValue", v56);
    }
    float v130 = *(float *)&v56;
    float v57 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F6F0]];

    if (v57)
    {
      [v57 floatValue];
      float v13 = v58;
    }
    uint64_t v59 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F5A8]];

    if (v59)
    {
      [v59 floatValue];
      int v129 = v60;
    }
    else
    {
      int v129 = 2139095040;
    }
    id v61 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F1E0]];

    if (v61) {
      BOOL v8 = [v61 intValue] == 1;
    }
    else {
      BOOL v8 = 0;
    }
    int v62 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F558]];

    if (v62)
    {
      [v62 floatValue];
      int v21 = v63;
    }
    else
    {
      int v21 = 0;
    }
    v64 = [v148 objectForKeyedSubscript:@"ADRCExposureRealizedGain"];

    LODWORD(v65) = 1.0;
    if (v64) {
      objc_msgSend(v64, "floatValue", v65);
    }
    if (*(float *)&v65 == 0.0) {
      *(float *)&double v65 = 1.0;
    }
    float v128 = *(float *)&v65;

    int v66 = (__CFString *)*MEMORY[0x263F2F748];
    int v67 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F748]];

    if (v67)
    {
      uint64_t v68 = v148;
      uint64_t v69 = v66;
    }
    else
    {
      float v9 = [v148 objectForKeyedSubscript:@"HREnabled"];

      if (!v9) {
        goto LABEL_90;
      }
      uint64_t v69 = @"HREnabled";
      uint64_t v68 = v148;
    }
    v70 = [v68 objectForKeyedSubscript:v69];
    v71 = v70;
    if (v70)
    {
      LOBYTE(v9) = [v70 BOOLValue];
    }
    else
    {
      LOBYTE(v9) = 0;
    }
LABEL_90:
    uint64_t v72 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F3D8]];
    v73 = v72;
    if (v72)
    {
      [v72 floatValue];
      int v18 = v74;
    }
    else
    {
      int v18 = 0;
    }
    id v75 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F5E0]];

    if (v75) {
      int v11 = [v75 intValue];
    }
    else {
      int v11 = 0;
    }
    v76 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F5E8]];

    if (v76)
    {
      [v76 floatValue];
      if (v77 == 1.0 && v11 == 1) {
        float v20 = 1.2;
      }
      else {
        float v20 = v77;
      }
    }
    else
    {
      float v20 = 1.0;
    }

    id v3 = v148;
    goto LABEL_105;
  }
  BOOL v8 = 0;
  LOBYTE(v9) = 0;
  int v10 = 0;
  int v11 = 0;
  uint64_t v12 = *MEMORY[0x263F2F2E0];
  float v138 = 0.0;
  float v13 = 1.0;
  int v146 = 4096;
  int v14 = 256;
  float v136 = -2.0;
  float v137 = 1.0;
  int v129 = 2139095040;
  float v135 = 0.0;
  float v15 = 0.0;
  *(float *)&int v133 = 0.02;
  float v134 = 0.0;
  int v144 = 4096;
  int v145 = 256;
  int v142 = 4096;
  int v143 = 4096;
  float v16 = 0.0;
  float v128 = 1.0;
  int v132 = 0;
  int v140 = 4096;
  int v141 = 4096;
  int v139 = 256;
  int v17 = 4096;
  float v130 = 1.0;
  float v131 = 1.0;
  int v18 = 0;
  float v19 = 1.0;
  float v20 = 1.0;
  int v21 = 0;
  int v147 = 256;
LABEL_105:
  [v3 objectForKeyedSubscript:v12];

  int v79 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F498]];
  v80 = v79;
  if (v79)
  {
    float v81 = v16;
    float v82 = v15;
    [v79 floatValue];
    int v84 = v83;
    int v85 = v148;
    int v87 = v146;
    int v86 = v147;
    int v89 = v144;
    int v88 = v145;
    int v91 = v142;
    int v90 = v143;
    int v93 = v140;
    int v92 = v141;
    int v94 = v139;
    float v96 = v137;
    float v95 = v138;
    float v98 = v135;
    float v97 = v136;
    float v100 = *(float *)&v133;
    float v99 = v134;
    float v102 = v131;
    int v101 = v132;
    int v104 = v129;
    float v103 = v130;
    float v105 = v128;
  }
  else
  {
    int v127 = v11;
    char v106 = (char)v9;
    BOOL v107 = v8;
    int v108 = v10;
    int v109 = v17;
    int v110 = v14;
    v111 = [v148 objectForKeyedSubscript:@"ExperimentalMetadata"];
    float v112 = [v111 objectForKeyedSubscript:@"SRL"];
    v113 = [v112 objectForKeyedSubscript:@"faceExpRatio"];

    float v81 = v16;
    float v82 = v15;
    if (v113)
    {
      id v114 = [v148 objectForKeyedSubscript:@"ExperimentalMetadata"];
      uint64_t v115 = [v114 objectForKeyedSubscript:@"SRL"];
      v116 = [v115 objectForKeyedSubscript:@"faceExpRatio"];

      [v116 floatValue];
      int v84 = v117;
    }
    else
    {
      int v84 = 0;
    }
    int v85 = v148;
    int v14 = v110;
    int v87 = v146;
    int v86 = v147;
    int v89 = v144;
    int v88 = v145;
    int v91 = v142;
    int v90 = v143;
    int v93 = v140;
    int v92 = v141;
    int v94 = v139;
    int v17 = v109;
    float v96 = v137;
    float v95 = v138;
    int v10 = v108;
    float v98 = v135;
    float v97 = v136;
    float v100 = *(float *)&v133;
    float v99 = v134;
    float v102 = v131;
    int v101 = v132;
    BOOL v8 = v107;
    int v104 = v129;
    float v103 = v130;
    LOBYTE(v9) = v106;
    float v105 = v128;
    int v11 = v127;
  }
  float v118 = (float)v86 * 0.0039062;
  float v119 = (float)v88 / (float)(v13 * 256.0);
  float v120 = v119 * (float)((float)((float)v14 * 0.0039062) * v118);
  float v121 = 0.066667;
  if (v100 <= 0.066667) {
    float v121 = v100;
  }
  float v122 = v103 * v121;
  *(_DWORD *)(a2 + 112) = v84;
  *(float *)a2 = v120;
  *(float *)(a2 + 4) = (float)v89 / (float)v87;
  *(float *)(a2 + 8) = (float)v90 / (float)v87;
  *(float *)(a2 + 12) = (float)v91 / (float)v92;
  *(float *)(a2 + 16) = (float)v93 / (float)v92;
  *(float *)(a2 + 20) = v118;
  *(float *)(a2 + 24) = v119;
  *(float *)(a2 + 28) = (float)v88 * 0.0039062;
  *(float *)(a2 + 32) = v120 / v119;
  *(float *)(a2 + 36) = (float)v94 * 0.0039062;
  *(float *)(a2 + 40) = v105;
  *(float *)(a2 + 48) = (float)v17 * 0.00024414;
  *(float *)(a2 + 52) = v100;
  *(float *)(a2 + 56) = v96;
  *(_DWORD *)(a2 + 60) = v104;
  float v123 = 0.0;
  if (v10) {
    float v123 = v97;
  }
  *(float *)(a2 + 64) = v123;
  *(float *)(a2 + 68) = v95;
  *(float *)(a2 + 72) = (float)(v95 - v123) - v98;
  *(float *)(a2 + 76) = v82;
  *(float *)(a2 + 80) = v99;
  *(float *)(a2 + 84) = v81;
  *(_DWORD *)(a2 + 88) = v101;
  *(float *)(a2 + 92) = v102;
  *(unsigned char *)(a2 + 96) = v8;
  float v124 = (float)(v19 * (float)(v100 * v120)) / v122;
  int v125 = [v85 objectForKeyedSubscript:*MEMORY[0x263F2F2B0]];
  *(unsigned char *)(a2 + 97) = [v125 BOOLValue];

  v126 = [v148 objectForKeyedSubscript:*MEMORY[0x263F2F528]];
  *(unsigned char *)(a2 + 104) = [v126 BOOLValue];

  *(float *)(a2 + 108) = v124;
  *(_DWORD *)(a2 + 100) = v21;
  *(unsigned char *)(a2 + 98) = (_BYTE)v9;
  *(_DWORD *)(a2 + 116) = v18;
  *(_DWORD *)(a2 + 120) = v11;
  *(float *)(a2 + 124) = v20;
}

uint64_t getROIMetadata(uint64_t a1, double *a2, unint64_t a3, unint64_t a4)
{
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  if (!FigCFDictionaryGetCGRectIfPresent()
    || (double v7 = *a2, *a2 == 0.0) && a2[1] == 0.0 && a2[2] == 0.0 && a2[3] == 0.0)
  {
    *a2 = 0.0;
    a2[1] = 0.0;
    a2[2] = (double)a3;
    a2[3] = (double)a4;
    double v7 = 0.0;
  }
  double v8 = (double)a3;
  if (v7 < 0.0 || v7 > v8) {
    return 4294954516;
  }
  double v10 = a2[1];
  double v11 = (double)a4;
  if (v10 < 0.0 || v10 > v11) {
    return 4294954516;
  }
  double v13 = a2[2];
  if (v13 < 0.0 || v13 > v8) {
    return 4294954516;
  }
  double v16 = a2[3];
  uint64_t result = 4294954516;
  if (v16 >= 0.0)
  {
    if (v16 > v11) {
      return 4294954516;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t scaleROI(double *a1, unsigned int a2, unsigned int a3)
{
  if (a1 && (_WORD)a2 && (unsigned int v3 = HIWORD(a2)) != 0 && (_WORD)a3 && (v4 = HIWORD(a3)) != 0)
  {
    uint64_t v5 = 0;
    double v6 = (double)(unsigned __int16)a2;
    double v7 = (double)(int)((int)(*a1 / v6 * (double)(unsigned __int16)a3 + 1.0) & 0xFFFFFFFE);
    double v8 = (double)(int)((int)(a1[1] / (double)v3 * (double)v4 + 1.0) & 0xFFFFFFFE);
    double v9 = (double)(int)((int)(a1[2] / v6 * (double)(unsigned __int16)a3) & 0xFFFFFFFE);
    double v10 = (double)(int)((int)(a1[3] / (double)v3 * (double)v4) & 0xFFFFFFFE);
    *a1 = v7;
    a1[1] = v8;
    a1[2] = v9;
    a1[3] = v10;
  }
  else
  {
    uint64_t v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    uint64_t v5 = 4294893946;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v5;
}

float getRelativeBrightness(uint64_t a1, uint64_t a2, int a3)
{
  if ((a3 - 1) >= 2)
  {
    float result = 1.0;
    if (!a3) {
      return (float)(*(float *)a1 * *(float *)(a1 + 52)) / (float)(*(float *)a2 * *(float *)(a2 + 52));
    }
  }
  else
  {
    float v3 = 1.0;
    float v4 = 1.0;
    if (*(unsigned char *)(a1 + 98)) {
      float v4 = *(float *)(a1 + 48);
    }
    if (*(unsigned char *)(a2 + 98)) {
      float v3 = *(float *)(a2 + 48);
    }
    float result = (float)((float)(*(float *)(a1 + 32) * *(float *)(a1 + 52)) / v4)
           / (float)((float)(*(float *)(a2 + 32) * *(float *)(a2 + 52)) / v3);
    int v6 = *(_DWORD *)(a1 + 120);
    if (v6 == 2)
    {
      if (*(_DWORD *)(a2 + 120) == 1) {
        float result = result * *(float *)(a2 + 124);
      }
    }
    else if (v6 == 1 && *(_DWORD *)(a2 + 120) == 2)
    {
      float result = result / *(float *)(a2 + 124);
    }
    float v7 = sqrtf(result);
    if (a3 == 1) {
      return v7;
    }
  }
  return result;
}

float getRelativeBrightnessForProperties(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  int v6 = [v5 inputColorSpace];
  if (v6 == 2)
  {
    if (*(unsigned char *)([v5 colorSpaceConversionParameters] + 196)) {
      int v7 = 2;
    }
    else {
      int v7 = 1;
    }
  }
  else
  {
    int v7 = v6 == 1;
  }
  float RelativeBrightness = getRelativeBrightness(a1, a2, v7);

  return RelativeBrightness;
}

uint64_t loadFrameMetadata(void *a1, void *a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, int a7, uint64_t a8)
{
  id v15 = a1;
  id v16 = a2;
  long long v17 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  long long v133 = *MEMORY[0x263EF89A0];
  long long v134 = v17;
  long long v135 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
  id v131 = [v15 objectForKeyedSubscript:*MEMORY[0x263F2F3F0]];
  int v18 = [v15 objectForKeyedSubscript:@"SensorID"];
  objc_msgSend(v16, "setSensorID:", objc_msgSend(v18, "intValue"));

  float v19 = [v15 objectForKeyedSubscript:*MEMORY[0x263F2F1D0]];
  objc_msgSend(v16, "setIsStationary:", objc_msgSend(v19, "BOOLValue"));

  [v16 setIsHWISPFrame:a8];
  getExposureParameters(v15, [v16 exposureParams]);
  uint64_t v126 = a3;
  unsigned int ROIMetadata = getROIMetadata((uint64_t)v15, (double *)[v16 ROI], a3, a4);
  if (ROIMetadata)
  {
    FigDebugAssert3();
  }
  else
  {
    float v20 = [v15 objectForKeyedSubscript:*MEMORY[0x263F2F5E0]];
    int v21 = v20;
    if (v20) {
      unint64_t v22 = [v20 unsignedIntValue];
    }
    else {
      unint64_t v22 = 1;
    }
    if (v22 <= 1) {
      unint64_t v22 = 1;
    }
    unint64_t v23 = v22 * a3;
    unint64_t v24 = v22 * a4;
    if (a5) {
      unint64_t v25 = a5;
    }
    else {
      unint64_t v25 = v23;
    }
    if (a6) {
      unint64_t v26 = a6;
    }
    else {
      unint64_t v26 = v24;
    }
    float v27 = fmaxf((float)v23 / (float)v25, (float)v24 / (float)v26);

    *(float *)&double v28 = v27;
    [v16 setSensorCropRatio:v28];
    objc_msgSend(v16, "setMetadataHasLtmCurves:", getLTMCurvesFromMetadata(v15, objc_msgSend(v16, "exposureParams"), objc_msgSend(v16, "ltmCurves")) == 0);
    objc_msgSend(v16, "setMetadataHasHDRLtmCurves:", getHDRLTMCurvesFromMetadata(v15, objc_msgSend(v16, "exposureParams"), objc_msgSend(v16, "HDRltmCurves")) == 0);
    objc_msgSend(v16, "setMetadataHasLtmCurvesForBackground:", getLTMCurvesForBackgroundFromMetadata(v15, objc_msgSend(v16, "exposureParams"), objc_msgSend(v16, "ltmCurvesForBackground")) == 0);
    if (([v16 metadataHasLtmCurvesForBackground] & 1) == 0
      && [v16 metadataHasLtmCurves])
    {
      memcpy((void *)[v16 ltmCurvesForBackground], (const void *)objc_msgSend(v16, "ltmCurves"), 0x36770uLL);
    }
    float v29 = [v15 objectForKeyedSubscript:*MEMORY[0x263F2EFA8]];
    objc_msgSend(v16, "setExifOrientation:", objc_msgSend(v29, "intValue"));

    if (a7)
    {
      double v30 = [v15 objectForKeyedSubscript:*MEMORY[0x263F2F5D8]];
      objc_msgSend(v16, "setIsPreBracketedFrame:", objc_msgSend(v30, "BOOLValue"));

      double v31 = [v15 objectForKeyedSubscript:*MEMORY[0x263F2F378]];
      objc_msgSend(v16, "setAverageFocusScore:", objc_msgSend(v31, "longLongValue"));

      float v32 = [v15 objectForKeyedSubscript:*MEMORY[0x263F2F638]];
      if ([v32 BOOLValue])
      {
        [v16 setIsEVMFrame:1];
      }
      else
      {
        double v33 = [v15 objectForKeyedSubscript:*MEMORY[0x263F2F170]];
        [v33 floatValue];
        [v16 setIsEVMFrame:v34 < 0.0];
      }
      objc_msgSend(v16, "setIsLongFrame:", *(unsigned __int8 *)(objc_msgSend(v16, "exposureParams") + 96));
    }
    if (v131)
    {
      id v35 = v131;
      float v36 = (int *)[v35 bytes];
      uint64_t v37 = [v35 length];
      if (v36)
      {
        if (v37 == 36)
        {
          for (uint64_t i = 0; i != 3; ++i)
          {
            uint64_t v39 = 0;
            float v40 = &v133 + i;
            long long v41 = *v40;
            do
            {
              int v42 = *v36++;
              long long v132 = v41;
              *(_DWORD *)((unint64_t)&v132 & 0xFFFFFFFFFFFFFFF3 | (4 * (v39 & 3))) = v42;
              long long v41 = v132;
              *((_DWORD *)v40 + 2) = DWORD2(v132);
              *(void *)float v40 = v41;
              ++v39;
            }
            while (v39 != 3);
          }
        }
      }
    }
    objc_msgSend(v16, "setColorCorrectionMatrix:", *(double *)&v133, *(double *)&v134, *(double *)&v135);
    [v16 setAllowSpatialCCM:v131 != 0];
    id v122 = v15;
    id v43 = v15;
    id v44 = v16;
    float v124 = objc_opt_new();
    float v128 = objc_opt_new();
    float v45 = [v43 objectForKeyedSubscript:@"DetectedObjectsInfo"];
    float v46 = v45;
    if (v45)
    {
      unint64_t v47 = [v45 objectForKeyedSubscript:@"HumanFaces"];
      float v48 = v47;
      id v119 = v44;
      unint64_t v120 = a4;
      v116 = v47;
      int v117 = v46;
      if (v47)
      {
        float v49 = [v47 objectForKeyedSubscript:@"ObjectsArray"];
        int v50 = v49;
        if (v49)
        {
          [v49 count];
          for (unint64_t j = 0; ; ++j)
          {
            if ((unint64_t)[v50 count] > 9) {
              unint64_t v52 = 10;
            }
            else {
              unint64_t v52 = [v50 count];
            }
            if (v52 <= j) {
              break;
            }
            float v53 = [v50 objectAtIndexedSubscript:j];
            CFDictionaryRef v54 = [v53 objectForKeyedSubscript:@"Rect"];
            CFDictionaryRef v55 = v54;
            if (v54)
            {
              memset(&rect, 0, sizeof(rect));
              if (CGRectMakeWithDictionaryRepresentation(v54, &rect))
              {
                uint64_t v56 = [v53 objectForKeyedSubscript:@"ConfidenceLevel"];
                if (v56)
                {
                  float v57 = (void *)v56;
                  uint64_t v58 = [v53 objectForKeyedSubscript:@"AngleInfoRoll"];
                  if (v58)
                  {
                    uint64_t v59 = (void *)v58;
                    int v60 = [v53 objectForKeyedSubscript:@"AngleInfoYaw"];

                    if (!v60) {
                      goto LABEL_43;
                    }
                    float v57 = objc_opt_new();
                    objc_msgSend(v57, "setRect:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
                    id v61 = [v53 objectForKeyedSubscript:@"ConfidenceLevel"];
                    objc_msgSend(v57, "setConfidence:", (unsigned __int16)objc_msgSend(v61, "shortValue"));

                    int v62 = [v53 objectForKeyedSubscript:@"AngleInfoRoll"];
                    objc_msgSend(v57, "setRoll:", (unsigned __int16)objc_msgSend(v62, "shortValue"));

                    int v63 = [v53 objectForKeyedSubscript:@"AngleInfoYaw"];
                    objc_msgSend(v57, "setYaw:", (unsigned __int16)objc_msgSend(v63, "shortValue"));

                    [v124 addObject:v57];
                  }
                }
              }
            }
LABEL_43:
          }
        }

        id v44 = v119;
        a4 = v120;
        float v48 = v116;
        float v46 = v117;
      }
      v64 = [v46 objectForKeyedSubscript:@"HumanBodies"];
      if (v64)
      {
        id v115 = v64;
        double v65 = [v64 objectForKeyedSubscript:@"ObjectsArray"];
        int v66 = v65;
        if (v65)
        {
          [v65 count];
          for (unint64_t k = 0; ; ++k)
          {
            unint64_t v68 = (unint64_t)[v66 count] > 9 ? 10 : objc_msgSend(v66, "count");
            if (v68 <= k) {
              break;
            }
            uint64_t v69 = [v66 objectAtIndexedSubscript:k];
            CFDictionaryRef v70 = [v69 objectForKeyedSubscript:@"Rect"];
            uint64_t v71 = [v69 objectForKeyedSubscript:@"ConfidenceLevel"];
            uint64_t v72 = (void *)v71;
            if (v70)
            {
              if (v71)
              {
                memset(&rect, 0, sizeof(rect));
                if (CGRectMakeWithDictionaryRepresentation(v70, &rect))
                {
                  v73 = objc_opt_new();
                  objc_msgSend(v73, "setRect:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
                  objc_msgSend(v73, "setConfidence:", (unsigned __int16)objc_msgSend(v72, "shortValue"));
                  [v128 addObject:v73];
                }
              }
            }
          }
        }

        id v44 = v119;
        a4 = v120;
        float v48 = v116;
        float v46 = v117;
        v64 = v115;
      }
    }
    objc_msgSend(v44, "setHasValidClippingData:", getClippingDataFromMetadata(v43, objc_msgSend(v44, "clippingData")) == 0);
    getZoomRectsFromMetadata(v43, v44);
    v74.i64[0] = v126;
    v74.i64[1] = a4;
    objc_msgSend(v44, "setOpticalCenter:", COERCE_DOUBLE(vcvt_f32_f64(vcvtq_f64_u64(vshrq_n_u64(v74, 1uLL)))));
    id v75 = [v43 objectForKeyedSubscript:*MEMORY[0x263F2F450]];
    v76 = v75;
    if (v75)
    {
      float v77 = [v75 objectForKeyedSubscript:@"X"];
      uint64_t v78 = [v76 objectForKeyedSubscript:@"Y"];
      int v79 = (void *)v78;
      if (v77 && v78)
      {
        [v77 floatValue];
        unsigned int v129 = v80;
        [v79 floatValue];
        objc_msgSend(v44, "setOpticalCenter:", COERCE_DOUBLE(__PAIR64__(v81, v129)));
      }
    }
    uint64_t v82 = *MEMORY[0x263F2F5C8];
    int v83 = [v43 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];

    if (v83)
    {
      int v84 = [v43 objectForKeyedSubscript:v82];
      [v44 setPortType:v84];
    }
    id v85 = v43;
    id v86 = v44;
    int v87 = [v85 objectForKeyedSubscript:@"MIWBOutputMetadata"];
    if (v87)
    {
      int v88 = [v85 objectForKeyedSubscript:*MEMORY[0x263F2F300]];
      int v89 = v88;
      if (v88) {
        unsigned int v125 = [v88 intValue];
      }
      else {
        unsigned int v125 = 0;
      }
      float v97 = [v85 objectForKeyedSubscript:*MEMORY[0x263F2F308]];

      if (v97) {
        unsigned int v121 = [v97 intValue];
      }
      else {
        unsigned int v121 = 0;
      }
      float v98 = [v85 objectForKeyedSubscript:*MEMORY[0x263F2F2C8]];

      if (v98) {
        [v98 intValue];
      }
      float v99 = [v85 objectForKeyedSubscript:*MEMORY[0x263F2F328]];

      if (v99) {
        float v96 = (float)[v99 unsignedIntValue] * 0.0039062;
      }
      else {
        float v96 = 0.0;
      }
      float v100 = [v85 objectForKeyedSubscript:*MEMORY[0x263F2F318]];

      if (v100) {
        int v118 = [v100 intValue];
      }
      else {
        int v118 = 4096;
      }
      int v101 = [v87 objectForKeyedSubscript:@"MIWBSkinNonComboRGain"];

      if (v101
        || ([v85 objectForKeyedSubscript:*MEMORY[0x263F2F320]],
            (int v101 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        unsigned int v91 = [v101 intValue];
      }
      else
      {
        unsigned int v91 = 0;
      }
      float v102 = [v87 objectForKeyedSubscript:@"MIWBSkinNonComboBGain"];
      int v127 = v76;
      if (v102
        || ([v85 objectForKeyedSubscript:*MEMORY[0x263F2F310]],
            (float v102 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        [v102 intValue];
      }
      float v103 = [v87 objectForKeyedSubscript:@"MIWBSkyRGain"];
      int v104 = v103;
      if (v103) {
        unsigned int v105 = [v103 intValue];
      }
      else {
        unsigned int v105 = 0;
      }
      char v106 = [v87 objectForKeyedSubscript:@"MIWBSkyBGain"];

      if (v106) {
        [v106 intValue];
      }
      BOOL v107 = [v87 objectForKeyedSubscript:@"MIWBSkinWeight"];

      int v95 = 0;
      int v94 = 0;
      if (v107)
      {
        [v107 floatValue];
        int v94 = v108;
      }
      int v109 = [v87 objectForKeyedSubscript:@"DaylightScore"];

      if (v109)
      {
        [v109 floatValue];
        int v95 = v110;
      }

      uint64_t v130 = v105 | 0x100000000000;
      v76 = v127;
      unsigned int v93 = v125;
      unsigned int v92 = v121;
      int v90 = v118;
    }
    else
    {
      int v90 = 0;
      unsigned int v91 = 0;
      unsigned int v92 = 0;
      unsigned int v93 = 0;
      uint64_t v130 = 0;
      int v94 = 0;
      int v95 = 0;
      float v96 = 0.0;
    }
    objc_msgSend(v86, "setAwbGains:", COERCE_DOUBLE(__PAIR64__(v93, v92)));
    objc_msgSend(v86, "setAwbSkinGains:", COERCE_DOUBLE(__PAIR64__(v90, v91)));
    [v86 setAwbSkyGains:*(double *)&v130];
    LODWORD(v111) = v94;
    [v86 setSkinWBWeightForMIWB:v111];
    LODWORD(v112) = v95;
    [v86 setDaylightScore:v112];
    *(float *)&double v113 = v96;
    [v86 setFdAWBChistMixFactor:v113];

    id v15 = v122;
  }

  return ROIMetadata;
}

void getZoomRectsFromMetadata(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  CGSize v5 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
  v28.CGPoint origin = (CGPoint)*MEMORY[0x263F001A0];
  v28.size = v5;
  v27.CGPoint origin = v28.origin;
  v27.size = v5;
  CGPoint origin = v28.origin;
  CGSize v26 = v5;
  CGPoint v23 = v28.origin;
  CGSize v24 = v5;
  char CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();
  char v7 = CGRectIfPresent & FigCFDictionaryGetCGRectIfPresent();
  char v8 = FigCFDictionaryGetCGRectIfPresent();
  char v9 = FigCFDictionaryGetCGRectIfPresent();
  double v10 = [v3 objectForKeyedSubscript:*MEMORY[0x263F2F1D8]];
  double v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F2F200]];
  [v11 doubleValue];
  double v13 = v12;

  int v14 = [v10 objectForKeyedSubscript:*MEMORY[0x263F2F208]];
  uint64_t v15 = [v14 BOOLValue];

  BOOL v16 = (v7 & 1) != 0 && !CGRectIsNull(v28) && !CGRectIsNull(v27) && CGRectContainsRect(v27, v28);
  uint64_t v17 = v16 & CGRectContainsRect(*(CGRect *)[v4 ROI], v28);
  int v18 = [MEMORY[0x263EFF9A0] dictionary];
  FigCaptureMetadataUtilitiesCopyZoomRelatedMetadata();
  [v4 setHasZoomRects:v17];
  objc_msgSend(v4, "setZoomSrcRect:", *(_OWORD *)&v28.origin, *(_OWORD *)&v28.size);
  objc_msgSend(v4, "setZoomDstRect:", *(_OWORD *)&v27.origin, *(_OWORD *)&v27.size);
  [v4 setHasFinalCropRect:v8 & 1];
  objc_msgSend(v4, "setFinalCropRect:", origin, v26);
  LODWORD(v19) = 1.0;
  if ((v8 & 1) != 0 && v26.height > 0.0)
  {
    float height = v26.height;
    *(float *)&double v19 = 1.0 / height;
  }
  [v4 setFinalCropRectZoomRatio:v19];
  [v4 setHasMinimumValidBufferRectForGDC:v9 & 1];
  objc_msgSend(v4, "setMinimumValidBufferRectForGDC:", v23, v24);
  [v4 setFinalAspectRatio:v13];
  [v4 setIdcProcessingCandidate:v15];
  [v4 setZoomRelatedMetadata:v18];
  [v4 setZoomApplied:0];
  long long v21 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v22[0] = *MEMORY[0x263F000D0];
  v22[1] = v21;
  v22[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v4 setZoomTransform:v22];
}

float estimateLTMSoftGainFromFrameProperties(void *a1, int a2)
{
  id v3 = a1;
  float v4 = *(float *)([v3 exposureParams] + 36);
  if (!v3) {
    goto LABEL_42;
  }
  if (!*(unsigned char *)([v3 ltmCurves] + 222528)) {
    goto LABEL_42;
  }
  uint64_t v5 = [v3 ltmCurves];
  int v6 = (_WORD *)[v3 ltmCurves];
  if (v6[110616] != 257) {
    goto LABEL_42;
  }
  unsigned int v9 = (unsigned __int16)v6[110873];
  if (!v6[110873]) {
    goto LABEL_42;
  }
  float v10 = (float)v9;
  LOWORD(v7) = v6[110618];
  float v11 = (float)v7 / (float)v9;
  if (v11 >= 0.18)
  {
    LOWORD(v8) = v6[110617];
    float v14 = 1.0;
    float v13 = (float)v8 / v10;
LABEL_11:
    float v15 = 0.5;
    if (v11 > v13) {
      float v15 = (float)(0.18 - v13) / (float)(v11 - v13);
    }
    float v16 = (float)((float)(v15 + v14) + -1.0) * 0.0039062;
  }
  else
  {
    uint64_t v12 = 0;
    while (v12 != 255)
    {
      float v13 = v11;
      LOWORD(v11) = v6[v12 + 110619];
      float v11 = (float)LODWORD(v11) / v10;
      ++v12;
      if (v11 >= 0.18)
      {
        float v14 = (float)(v12 + 1);
        goto LABEL_11;
      }
    }
    float v16 = 1.0;
  }
  float v17 = *(float *)(v5 + 222272) / 65535.0;
  if (v16 <= v17)
  {
    float v20 = 1.0;
    float v19 = *(float *)(v5 + 222268) / 65535.0;
LABEL_21:
    float v21 = 0.5;
    if (v17 > v19) {
      float v21 = (float)(v16 - v19) / (float)(v17 - v19);
    }
    float v22 = (float)((float)(v21 + v20) + -1.0) * 0.015625;
    if (!a2) {
      goto LABEL_36;
    }
  }
  else
  {
    uint64_t v18 = 0;
    while (v18 != 63)
    {
      float v19 = v17;
      float v17 = *(float *)(v5 + 222276 + 4 * v18++) / 65535.0;
      if (v16 <= v17)
      {
        float v20 = (float)(v18 + 1);
        goto LABEL_21;
      }
    }
    float v22 = 1.0;
    if (!a2) {
      goto LABEL_36;
    }
  }
  if (*(unsigned char *)([v3 ltmCurves] + 223044))
  {
    uint64_t v23 = [v3 ltmCurves];
    LOWORD(v25) = *(_WORD *)(v23 + 222532);
    float v26 = (float)v25 / 65535.0;
    if (v22 > v26)
    {
      uint64_t v27 = 0;
      while (v27 != 255)
      {
        float v28 = v26;
        LOWORD(v26) = *(_WORD *)(v23 + 222534 + 2 * v27);
        float v26 = (float)LODWORD(v26) / 65535.0;
        ++v27;
        if (v22 <= v26)
        {
          float v29 = (float)(v27 + 1);
          goto LABEL_33;
        }
      }
      float v22 = 1.0;
      goto LABEL_37;
    }
    LOWORD(v24) = *(_WORD *)(v23 + 222530);
    float v29 = 1.0;
    float v28 = (float)v24 / 65535.0;
LABEL_33:
    float v30 = 0.5;
    if (v26 > v28) {
      float v30 = (float)(v22 - v28) / (float)(v26 - v28);
    }
    float v22 = (float)((float)(v30 + v29) + -1.0) * 0.0039062;
  }
LABEL_36:
  if (v22 <= 0.0)
  {
LABEL_42:
    FigDebugAssert3();
    goto LABEL_40;
  }
LABEL_37:
  float v4 = 1.0;
  if ((float)(0.18 / v22) >= 1.0)
  {
    float v4 = 0.18 / v22;
    if ((float)(0.18 / v22) > 500.0) {
      float v4 = 500.0;
    }
  }
LABEL_40:

  return v4;
}

double minimumDenormalizedRectToProcess(void *a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  id v5 = a1;
  int v6 = objc_alloc_init(NRFFrameMetadata);
  unsigned int v7 = [v5 zoomRelatedMetadata];
  getZoomRectsFromMetadata(v7, v6);

  if ([v5 hasZoomRects] && (objc_msgSend(v5, "zoomApplied") & 1) == 0)
  {
    [v5 zoomSrcRect];
LABEL_9:
    double v10 = v8;
    BOOL v9 = 0;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (![(NRFFrameMetadata *)v6 hasFinalCropRect])
  {
    BOOL v9 = 0;
    double v10 = 0.0;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if ([(NRFFrameMetadata *)v6 hasMinimumValidBufferRectForGDC])
  {
    [(NRFFrameMetadata *)v6 minimumValidBufferRectForGDC];
    goto LABEL_9;
  }
  [(NRFFrameMetadata *)v6 finalCropRect];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  if ([(NRFFrameMetadata *)v6 idcProcessingCandidate])
  {
    v24.origin.CGFloat x = v12;
    v24.origin.CGFloat y = v14;
    v24.size.CGFloat width = v16;
    v24.size.CGFloat height = v18;
    CGRect v25 = CGRectInset(v24, -0.05, -0.05);
    v29.origin.CGFloat x = 0.0;
    v29.origin.CGFloat y = 0.0;
    v29.size.CGFloat width = 1.0;
    v29.size.CGFloat height = 1.0;
    CGRect v26 = CGRectIntersection(v25, v29);
    CGFloat x = v26.origin.x;
    CGFloat y = v26.origin.y;
    CGFloat width = v26.size.width;
    CGFloat height = v26.size.height;
    [(NRFFrameMetadata *)v6 finalCropRect];
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    BOOL v9 = CGRectEqualToRect(v27, v30);
  }
  else
  {
    BOOL v9 = 1;
  }
  [(NRFFrameMetadata *)v6 finalAspectRatio];
  FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect();
  double v10 = v28.origin.x;
  if (CGRectIsNull(v28))
  {
    FigDebugAssert3();
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (a4) {
LABEL_16:
  }
    *a4 = v9;
LABEL_17:

  return v10;
}

void sub_2632CB2D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
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

float64_t vector2FromCGPoint(float64x2_t a1, float64_t a2)
{
  a1.f64[1] = a2;
  *(float32x2_t *)&a1.f64[0] = vcvt_f32_f64(a1);
  return a1.f64[0];
}

uint64_t isCompatibleSensorPortAndRawDFTuningType(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ((([v4 isEqualToString:@"QSUB"] & 1) != 0
     || [v4 isEqualToString:@"EnhancedRes"])
    && ([v3 isEqualToString:@"PortTypeBack"] & 1) == 0)
  {
    uint64_t v5 = [v3 isEqualToString:@"PortTypeBackSuperWide"];
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

id loadCombinedTuningWithDict(void *a1, void *a2, void *a3)
{
  v17[21] = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  double v8 = getTuningForRawDFTypeAndMode(v5, v6, @"Default", v7);
  if (v8)
  {
    BOOL v9 = getTuningForRawDFTypeAndMode(v5, v6, @"Zoom", v7);
    double v10 = v9;
    if (v9)
    {
      double v11 = objc_msgSend(v9, "cmi_dictionaryMergedWithDefaultDict:", v8);
      if (!v11)
      {
        CGFloat v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        uint64_t v15 = 0;
        double v11 = 0;
        goto LABEL_7;
      }
    }
    else
    {
      double v11 = (void *)[v8 copy];
    }
    v16[0] = @"Default";
    v16[1] = @"Zoom";
    v17[0] = v8;
    v17[1] = v11;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  }
  else
  {
    CGFloat v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v15 = 0;
    double v11 = 0;
    double v10 = 0;
  }
LABEL_7:

  return v15;
}

id getTuningForRawDFTypeAndMode(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  double v11 = [v7 objectForKey:v9];

  if (v11)
  {
    id v12 = [v7 objectForKey:v9];
  }
  else
  {
    id v12 = v7;
  }
  double v13 = v12;
  CGFloat v14 = [v12 objectForKeyedSubscript:@"Common"];
  id v15 = [v14 objectForKeyedSubscript:@"Common"];

  CGFloat v16 = [v13 objectForKeyedSubscript:@"Common"];
  double v17 = [v16 objectForKeyedSubscript:v10];

  if (v17)
  {
    if (v15)
    {
      uint64_t v18 = objc_msgSend(v17, "cmi_dictionaryMergedWithDefaultDict:", v15);

      id v15 = (id)v18;
    }
    else
    {
      id v15 = v17;
    }
  }
  float v19 = [v13 objectForKeyedSubscript:v8];
  float v20 = [v19 objectForKeyedSubscript:@"Common"];

  if (v20)
  {
    uint64_t v21 = objc_msgSend(v20, "cmi_dictionaryMergedWithDefaultDict:", v15);

    id v15 = (id)v21;
  }
  float v22 = [v13 objectForKeyedSubscript:v8];
  uint64_t v23 = [v22 objectForKeyedSubscript:v10];

  if (v23)
  {
    uint64_t v24 = objc_msgSend(v23, "cmi_dictionaryMergedWithDefaultDict:", v15);

    id v15 = (id)v24;
  }
  id v25 = v15;

  return v25;
}

uint64_t NRFSingletonsReleaseAll()
{
  +[RegWarpHelperShared releaseSharedInstance];
  [MEMORY[0x263F2EE58] releaseSharedInstance];
  +[SubjectRelightingShared releaseSharedInstance];
  +[CMIImagePyramidShared releaseSharedInstance];
  +[DeepFusionLaplacianPyramidShared releaseSharedInstance];
  +[BlinkDetectionStageShared releaseSharedInstance];
  +[SingleColorCubeCorrectionStageShared releaseSharedInstance];
  +[OutliersRemovalShared releaseSharedInstance];
  +[GainMapShared releaseSharedInstance];
  +[ToneMappingShared releaseSharedInstance];
  +[BilateralGridShared releaseSharedInstance];
  +[GuidedFilterShared releaseSharedInstance];
  +[SemanticStylesShared releaseSharedInstance];
  +[FusionRemixStageShared releaseSharedInstance];
  +[WarpStageShared releaseSharedInstance];
  +[RegDenseShared releaseSharedInstance];
  +[RegPyrFusionShared releaseSharedInstance];
  +[DenoiseFusePipelineShared releaseSharedInstance];
  +[GrayGhostDetectionShared releaseSharedInstance];
  +[MotionDetectionShared releaseSharedInstance];
  +[PyramidStageShared releaseSharedInstance];
  +[TextureUtilsShared releaseSharedInstance];

  return +[ColorConvertStageShared releaseSharedInstance];
}

void flushIOUnifiedAddressTranslatorWithDummyBuffer()
{
  v0 = [MEMORY[0x263F2EE30] metalDevice];
  id v1 = (id)[v0 newBufferWithLength:0x10000 options:0];

  [v1 setPurgeableState:256];
}

CGFloat getAffineTransformFromExifOrientation@<D0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v3 = MEMORY[0x263F000D0];
  long long v15 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v16 = *MEMORY[0x263F000D0];
  *(_OWORD *)a2 = *MEMORY[0x263F000D0];
  *(_OWORD *)(a2 + 16) = v15;
  long long v14 = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(a2 + 32) = v14;
  CGFloat v4 = 0.0;
  switch(a1)
  {
    case 2:
      int v5 = 0;
      goto LABEL_9;
    case 3:
      int v6 = 0;
      int v5 = 1;
      CGFloat v4 = 3.14159265;
      break;
    case 4:
      int v5 = 1;
      CGFloat v4 = 3.14159265;
      goto LABEL_9;
    case 5:
      int v5 = 1;
      CGFloat v4 = 1.57079633;
      goto LABEL_9;
    case 6:
      int v6 = 0;
      int v5 = 1;
      CGFloat v4 = 1.57079633;
      break;
    case 7:
      int v5 = 1;
      CGFloat v4 = 4.71238898;
LABEL_9:
      int v6 = 1;
      break;
    case 8:
      int v6 = 0;
      int v5 = 1;
      CGFloat v4 = 4.71238898;
      break;
    default:
      int v5 = 0;
      int v6 = 0;
      break;
  }
  CGAffineTransformMakeTranslation(&t2, -0.5, -0.5);
  *(_OWORD *)&t1.a = v16;
  *(_OWORD *)&t1.c = v15;
  *(_OWORD *)&t1.tCGFloat x = v14;
  CGAffineTransformConcat((CGAffineTransform *)a2, &t1, &t2);
  if (v6)
  {
    CGAffineTransformMakeScale(&v20, -1.0, 1.0);
    long long v7 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&v19.a = *(_OWORD *)a2;
    *(_OWORD *)&v19.c = v7;
    *(_OWORD *)&v19.tCGFloat x = *(_OWORD *)(a2 + 32);
    CGAffineTransformConcat(&t1, &v19, &v20);
    long long v8 = *(_OWORD *)&t1.c;
    *(_OWORD *)a2 = *(_OWORD *)&t1.a;
    *(_OWORD *)(a2 + 16) = v8;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&t1.tx;
  }
  if (v5)
  {
    CGAffineTransformMakeRotation(&v18, v4);
    long long v9 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&v19.a = *(_OWORD *)a2;
    *(_OWORD *)&v19.c = v9;
    *(_OWORD *)&v19.tCGFloat x = *(_OWORD *)(a2 + 32);
    CGAffineTransformConcat(&t1, &v19, &v18);
    long long v10 = *(_OWORD *)&t1.c;
    *(_OWORD *)a2 = *(_OWORD *)&t1.a;
    *(_OWORD *)(a2 + 16) = v10;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&t1.tx;
  }
  CGAffineTransformMakeTranslation(&v17, 0.5, 0.5);
  long long v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v19.a = *(_OWORD *)a2;
  *(_OWORD *)&v19.c = v11;
  *(_OWORD *)&v19.tCGFloat x = *(_OWORD *)(a2 + 32);
  CGAffineTransformConcat(&t1, &v19, &v17);
  long long v12 = *(_OWORD *)&t1.c;
  *(_OWORD *)a2 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a2 + 16) = v12;
  CGFloat result = t1.tx;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&t1.tx;
  return result;
}

id filterFacesWithLandmarks(void *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v1, "count"));
  if (v1)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v3 = v1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v14 != v5) {
            objc_enumerationMutation(v3);
          }
          long long v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v18 = 0;
          CGAffineTransform v19 = &v18;
          uint64_t v20 = 0x2050000000;
          long long v8 = (void *)getVNFaceObservationClass_softClass_0;
          uint64_t v21 = getVNFaceObservationClass_softClass_0;
          if (!getVNFaceObservationClass_softClass_0)
          {
            v17[0] = MEMORY[0x263EF8330];
            v17[1] = 3221225472;
            v17[2] = __getVNFaceObservationClass_block_invoke_0;
            v17[3] = &unk_2655C7BC0;
            v17[4] = &v18;
            __getVNFaceObservationClass_block_invoke_0((uint64_t)v17);
            long long v8 = (void *)v19[3];
          }
          id v9 = v8;
          _Block_object_dispose(&v18, 8);
          if (objc_opt_isKindOfClass())
          {
            long long v10 = [v7 landmarks];
            BOOL v11 = v10 == 0;

            if (!v11) {
              [v2 addObject:v7];
            }
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v22 count:16];
      }
      while (v4);
    }
  }

  return v2;
}

void sub_2632D6EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNFaceObservationClass_block_invoke_0(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_2)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __VisionLibraryCore_block_invoke_2;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2655C8228;
    uint64_t v5 = 0;
    VisionLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  if (!VisionLibraryCore_frameworkLibrary_2) {
    __getVNObservationClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("VNFaceObservation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getVNFaceObservationClass_block_invoke_cold_2();
  }
  getVNFaceObservationClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_2 = result;
  return result;
}

uint64_t relu_int(int a1, int a2, int a3, int a4, int a5)
{
  __int16 v5 = a5;
  __int16 v7 = a3;
  int v10 = a5 - a3;
  int v11 = a4 - a2;
  int v12 = (__int16)(a4 - a2);
  int v13 = (__int16)(a5 - a3);
  if (v13 >= 0) {
    int v14 = (__int16)(a5 - a3);
  }
  else {
    int v14 = -v13;
  }
  if (v12 >= 0) {
    LOWORD(v15) = a4 - a2;
  }
  else {
    int v15 = -v12;
  }
  unsigned int v16 = fminf(floorf(log2f((float)(unsigned __int16)v15)) + 1.0, 15.0);
  if (1 << v16 >= (unsigned __int16)v15)
  {
    unint64_t v18 = (v14 << 15);
    unsigned int v19 = vcvtms_u32_f32(log2f((float)v18));
    unsigned int v20 = v19 + 1;
    unsigned int v21 = v19 + 1 - v16;
    if (v19 + 1 < v16) {
      unsigned int v21 = 0;
    }
    if ((v21 & 0x80000000) == 0)
    {
      unint64_t v22 = (unint64_t)(unsigned __int16)v15 << v21;
      if (v16 < v20) {
        unsigned int v20 = v16;
      }
      int v23 = v20 - v19 - 2;
      do
      {
        if (v18 < v22) {
          unint64_t v24 = 0;
        }
        else {
          unint64_t v24 = (unint64_t)(unsigned __int16)v15 << v21;
        }
        unint64_t v18 = (v18 >= v22) | (2 * (v18 - v24));
      }
      while (!__CFADD__(v23++, 1));
    }
    int v17 = v18 & ~(-1 << (v21 + 1));
  }
  else
  {
    int v17 = 0;
  }
  __int16 v26 = v7;
  if (a1 > a2)
  {
    __int16 v26 = v5;
    if (a1 < a4)
    {
      unint64_t v27 = (unint64_t)(v17 * (uint64_t)(a1 - a2)) >> 15;
      if (((v10 ^ v11) & 0x8000) != 0) {
        return (__int16)(v7 - v27);
      }
      else {
        return (__int16)(v27 + v7);
      }
    }
  }
  return v26;
}

unint64_t qsortComparatorValueIndex(float *a1, float *a2)
{
  return (__PAIR64__(*a1 < *a2, *a2) - COERCE_UNSIGNED_INT(*a1)) >> 32;
}

unint64_t qsortComparatorFloat(float *a1, float *a2)
{
  return (__PAIR64__(*a1 < *a2, *a2) - COERCE_UNSIGNED_INT(*a1)) >> 32;
}

void updateGreenGhostMitigationMakerNoteFromSidecarDict(int a1, int *a2, void *a3)
{
  id v5 = a3;
  if (a1 == 1)
  {
    uint64_t v6 = @"GreenGhostBrightLight";
  }
  else
  {
    if (a1 != 2) {
      goto LABEL_31;
    }
    uint64_t v6 = @"GreenGhostLowLight";
  }
  id v30 = v5;
  __int16 v7 = [v5 objectForKeyedSubscript:v6];
  long long v8 = v7;
  if (v7)
  {
    id v9 = [v7 objectForKeyedSubscript:@"isEnabled"];
    int v10 = [v9 BOOLValue];

    int v11 = [v8 objectForKeyedSubscript:@"isRunning"];
    int v12 = [v11 BOOLValue];

    if (v12) {
      int v13 = v10 | 2;
    }
    else {
      int v13 = v10;
    }
    int v14 = [v8 objectForKeyedSubscript:@"foundFacesOrBodies"];
    int v15 = [v14 BOOLValue];

    if (v15) {
      int v16 = v13 | 4;
    }
    else {
      int v16 = v13;
    }
    BOOL v17 = a1 == 1;
    if (a1 == 1) {
      unint64_t v18 = @"isBrightScene";
    }
    else {
      unint64_t v18 = @"exceedsMaxMaskAverage";
    }
    if (a1 == 1) {
      unsigned int v19 = @"roiIsComputed";
    }
    else {
      unsigned int v19 = @"skipRepair";
    }
    if (v17) {
      unsigned int v20 = @"hasValidClippingData";
    }
    else {
      unsigned int v20 = @"tripodMode";
    }
    unsigned int v21 = [v8 objectForKeyedSubscript:v18];
    int v22 = [v21 BOOLValue];

    if (v22) {
      int v23 = v16 | 8;
    }
    else {
      int v23 = v16;
    }
    unint64_t v24 = [v8 objectForKeyedSubscript:v19];
    int v25 = [v24 BOOLValue];

    if (v25) {
      int v26 = v23 | 0x10;
    }
    else {
      int v26 = v23;
    }
    unint64_t v27 = [v8 objectForKeyedSubscript:v20];
    int v28 = [v27 BOOLValue];

    int v29 = v26 | 0x20;
    if (!v28) {
      int v29 = v26;
    }
  }
  else
  {
    int v29 = 0;
  }
  *a2 = v29;

  id v5 = v30;
LABEL_31:
}

uint64_t getClippingDataFromMetadata(void *a1, uint64_t a2)
{
  uint64_t v3 = 4294893935;
  id v4 = a1;
  long long v13 = *MEMORY[0x263F001A8];
  if (!FigCFDictionaryGetCGRectIfPresent())
  {
    FigDebugAssert3();
    id v6 = 0;
    goto LABEL_18;
  }
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F548]];
  id v6 = v5;
  if (v5)
  {
    if ((unint64_t)[v5 length] <= 7) {
      goto LABEL_24;
    }
    id v6 = v6;
    __int16 v7 = (_DWORD *)[v6 bytes];
    unint64_t v8 = [v6 length];
    unint64_t v9 = v7[1];
    if (v8 < v9) {
      goto LABEL_24;
    }
    if (*v7 != 1)
    {
      uint64_t v3 = 0;
      goto LABEL_18;
    }
    if (v9 <= 0x2B) {
      goto LABEL_24;
    }
    id v6 = v6;
    int v10 = (_WORD *)[v6 bytes];
    if ((__int16)v10[19] == -1)
    {
      FigDebugAssert3();
      uint64_t v3 = FigSignalErrorAt();
      goto LABEL_18;
    }
    if ((__int16)v10[17] == -1) {
      int v11 = 1;
    }
    else {
      int v11 = 2;
    }
    if ((__int16)v10[20] != -1) {
      ++v11;
    }
    if ((__int16)v10[21] != -1) {
      ++v11;
    }
    if (2 * (unsigned __int16)v10[11] * (unsigned __int16)v10[10] * v11 + 44 != v7[1])
    {
LABEL_24:
      FigDebugAssert3();
      goto LABEL_18;
    }
    uint64_t v3 = 0;
    v10[4] = (int)((double)(__int16)v10[4] - *(double *)&v13);
    v10[5] = (int)((double)(__int16)v10[5] - *((double *)&v13 + 1));
    *(_WORD *)a2 = 1;
    *(_DWORD *)(a2 + 4) = v11;
    *(void *)(a2 + 8) = v10;
  }
LABEL_18:

  return v3;
}

uint64_t findGreenGhostROI(uint64_t a1, uint32x4_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(_WORD *)a1 != 1) {
    return 0;
  }
  uint64_t v5 = a5;
  uint64_t v6 = a1;
  v53.i64[0] = a3;
  v53.i64[1] = a4;
  uint64_t v7 = *(void *)(a1 + 8);
  __int16 v51 = *(_WORD *)(v7 + 8);
  __int16 v52 = *(_WORD *)(v7 + 10);
  v48.i32[0] = *(unsigned __int16 *)(v7 + 12);
  v48.i32[1] = *(unsigned __int16 *)(v7 + 14);
  int v49 = *(unsigned __int16 *)(v7 + 16);
  int v50 = *(unsigned __int16 *)(v7 + 18);
  unsigned int v8 = *(_DWORD *)(v7 + 28);
  int v54 = *(unsigned __int16 *)(v7 + 22);
  if (*(_WORD *)(v7 + 22))
  {
    int v9 = 0;
    int v10 = 0;
    unsigned int v11 = 0;
    unsigned int v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = *(unsigned __int16 *)(v7 + 20);
    unsigned int v15 = *(unsigned __int16 *)(v7 + 38);
    float v16 = (float)v8;
    do
    {
      BOOL v17 = [MEMORY[0x263F089D8] string];
      if (v14)
      {
        int v18 = 0;
        do
        {
          int v56 = v10;
          int v57 = v9;
          int v19 = *(unsigned __int16 *)(v7 + 2 * v15 + 44);
          __int16 v20 = *(_WORD *)(v7 + 24);
          uint64_t v21 = v14;
          uint64_t v22 = v7;
          uint64_t v23 = v13;
          uint64_t v24 = v6;
          unsigned int v25 = v19 << v20;
          int v26 = v17;
          objc_msgSend(v17, "appendFormat:", @"[ %5u ] ", (v19 << v20));
          BOOL v17 = v26;
          if ((float)((float)v25 / v16) > *(float *)(a5 + 8)) {
            ++v12;
          }
          BOOL v27 = v25 > v11;
          if (v25 > v11) {
            unsigned int v11 = v25;
          }
          uint64_t v6 = v24;
          uint64_t v13 = v23;
          uint64_t v7 = v22;
          uint64_t v14 = v21;
          int v10 = v56;
          int v9 = v57;
          if (v27)
          {
            int v10 = v13;
            int v9 = v18;
          }
          v15 += *(_DWORD *)(v6 + 4);
          ++v18;
        }
        while (v14 != v18);
      }

      uint64_t v13 = (v13 + 1);
    }
    while (v13 != v54);
    uint64_t v5 = a5;
  }
  else
  {
    unsigned int v12 = 0;
    unsigned int v11 = 0;
    int v10 = 0;
    int v9 = 0;
    float v16 = (float)v8;
  }
  if ((float)((float)v11 / v16) >= *(float *)(v5 + 4))
  {
    if (v12 <= *(_DWORD *)(v5 + 12))
    {
      float32x2_t v28 = vcvt_f32_u32(v48);
      if (dword_26B430EE8)
      {
        float32x2_t v58 = v28;
        int v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        float32x2_t v28 = v58;
      }
      v30.f32[0] = (float)((float)v51 + (float)(v9 * v49)) + v28.f32[0];
      v30.f32[1] = (float)((float)v52 + (float)(v10 * v50)) + v28.f32[1];
      __asm { FMOV            V1.2S, #-1.0 }
      float32x2_t v36 = vadd_f32(v30, _D1);
      __asm { FMOV            V1.2D, #-1.0 }
      float64x2_t v38 = vaddq_f64(vcvtq_f64_u64(v53), _Q1);
      float32x2_t v39 = vcvt_f32_f64(vsubq_f64(v38, vcvtq_f64_f32(v36)));
      float32x2_t v40 = vmul_n_f32(v28, *(float *)v5);
      *(float32x2_t *)v41.f32 = vmaxnm_f32(vsub_f32(v39, v40), 0);
      float32x2_t v42 = vadd_f32(vadd_f32(v28, v39), v40);
      *(float32x2_t *)&v38.f64[0] = vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vmovn_s64(vcgtq_f64(vcvtq_f64_f32(v42), v38)), (int8x8_t)vcvt_f32_f64(v38), (int8x8_t)v42), *(float32x2_t *)v41.f32);
      __asm { FMOV            V2.2S, #1.0 }
      float32x2_t v44 = vadd_f32(*(float32x2_t *)&v38.f64[0], _D2);
      if (v44.f32[0] > 0.0 && v44.f32[1] > 0.0)
      {
        *(float32x2_t *)&v41.u32[2] = v44;
        *a2 = vcvtq_u32_f32(v41);
        return 1;
      }
      if (dword_26B430EE8) {
        goto LABEL_28;
      }
    }
    else if (dword_26B430EE8)
    {
      goto LABEL_28;
    }
  }
  else if (dword_26B430EE8)
  {
LABEL_28:
    float v46 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return 0;
}

void sub_2632E0E20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t determineNonCompandedPixelFormat(int a1, int a2, int a3, int a4, int a5)
{
  uint64_t result = 0;
  if (a1 <= 1734501175)
  {
    if (a1 > 1651847471)
    {
      if (a1 == 1651847472 || a1 == 1651925816) {
        return 1651519798;
      }
      int v7 = 1652056888;
LABEL_14:
      if (a1 != v7) {
        return result;
      }
      return 1651519798;
    }
    if (a1 != 1650942776 && a1 != 1650943796)
    {
      int v7 = 1651587122;
      goto LABEL_14;
    }
    BOOL v8 = a5 == 0;
    unsigned int v9 = 1650943796;
    goto LABEL_25;
  }
  if (a1 <= 1735549751)
  {
    if (a1 == 1734501176 || a1 == 1734505012)
    {
      BOOL v8 = a4 == 0;
      unsigned int v9 = 1734505012;
      goto LABEL_25;
    }
    if (a1 != 1735549492) {
      return result;
    }
LABEL_24:
    unsigned int v9 = 1735549492;
    BOOL v8 = a3 == 0;
LABEL_25:
    if (v8) {
      return 0;
    }
    else {
      return v9;
    }
  }
  if (a1 == 1735549752) {
    goto LABEL_24;
  }
  if (a1 == 1919379252 || a1 == 1919378232)
  {
    if (a2) {
      return 1919379252;
    }
    else {
      return 0;
    }
  }
  return result;
}

void *determineMTLPixelFormatsForCVPixelFormat(int a1)
{
  uint64_t result = 0;
  if (a1 <= 1651519797)
  {
    if (a1 <= 793522279)
    {
      if (a1 > 644376111)
      {
        if (a1 <= 760375360)
        {
          if (a1 == 644376112) {
            return &unk_270E97F18;
          }
          int v7 = 759967848;
          goto LABEL_29;
        }
        if (a1 != 760375361)
        {
          int v9 = 761816624;
          goto LABEL_58;
        }
        return &unk_270E97F48;
      }
      if (!a1) {
        return &unk_270E97EA0;
      }
      if (a1 == 642527336) {
        return &unk_270E97EB8;
      }
      int v4 = 642934849;
    }
    else if (a1 > 1278226535)
    {
      if (a1 > 1650942775)
      {
        if (a1 != 1650942776)
        {
          int v8 = 1650943796;
LABEL_54:
          if (a1 != v8) {
            return result;
          }
          return &unk_270E97ED0;
        }
        return &unk_270E97EA0;
      }
      if (a1 == 1278226536) {
        return &unk_270E97EB8;
      }
      int v4 = 1647719528;
    }
    else
    {
      if (a1 > 795371055)
      {
        if (a1 != 795371056)
        {
          BOOL v5 = a1 == 875704422;
          uint64_t v6 = &unk_270E97EE8;
LABEL_41:
          if (v5) {
            return v6;
          }
          else {
            return 0;
          }
        }
        return &unk_270E97F18;
      }
      if (a1 == 793522280) {
        return &unk_270E97EB8;
      }
      int v4 = 793929793;
    }
    if (a1 != v4) {
      return result;
    }
    return &unk_270E97F48;
  }
  if (a1 <= 1751527983)
  {
    if (a1 <= 1734501175)
    {
      if (a1 <= 1651926375)
      {
        if (a1 != 1651519798)
        {
          int v3 = 1651925816;
          goto LABEL_50;
        }
        return &unk_270E97ED0;
      }
      if (a1 != 1651926376)
      {
        int v3 = 1652056888;
        goto LABEL_50;
      }
      return &unk_270E97EB8;
    }
    if (a1 <= 1735549491)
    {
      if (a1 != 1734501176)
      {
        int v8 = 1734505012;
        goto LABEL_54;
      }
      return &unk_270E97EA0;
    }
    if (a1 != 1735549492)
    {
      int v3 = 1735549752;
LABEL_50:
      if (a1 != v3) {
        return result;
      }
      return &unk_270E97EA0;
    }
    return &unk_270E97ED0;
  }
  if (a1 > 1919379251)
  {
    if (a1 <= 2085775424)
    {
      if (a1 == 1919379252) {
        return &unk_270E97ED0;
      }
      int v7 = 2085367912;
LABEL_29:
      if (a1 == v7) {
        return &unk_270E97EB8;
      }
      return result;
    }
    if (a1 != 2085775425)
    {
      int v9 = 2087216688;
LABEL_58:
      if (a1 != v9) {
        return result;
      }
      return &unk_270E97F18;
    }
    return &unk_270E97F48;
  }
  if (a1 <= 1885745711)
  {
    if (a1 != 1751527984)
    {
      BOOL v5 = a1 == 1815162994;
      uint64_t v6 = &unk_270E97F30;
      goto LABEL_41;
    }
    return &unk_270E97F18;
  }
  if (a1 != 1885745712)
  {
    int v3 = 1919378232;
    goto LABEL_50;
  }
  return &unk_270E97F00;
}

uint64_t determineFirstPixelForCVPixelFormat(int a1)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 > 1735549491)
  {
    if (a1 > 1919378231)
    {
      if (a1 == 1919378232 || a1 == 1919379252) {
        return 1;
      }
    }
    else if (a1 == 1735549492 || a1 == 1735549752)
    {
      return 0;
    }
  }
  else if (a1 > 1734501175)
  {
    if (a1 == 1734501176 || a1 == 1734505012) {
      return 3;
    }
  }
  else if (a1 == 1650942776 || a1 == 1650943796)
  {
    return 2;
  }
  return result;
}

uint64_t isVersatilePixelFormat(int a1)
{
  uint64_t result = 1;
  if (a1 > 1651519797)
  {
    if (a1 > 1651926375)
    {
      if (a1 > 2085367911)
      {
        if (a1 == 2085367912) {
          return result;
        }
        int v3 = 2085775425;
      }
      else
      {
        if (a1 == 1651926376) {
          return result;
        }
        int v3 = 1652056888;
      }
    }
    else if (a1 > 1651847471)
    {
      if (a1 == 1651847472) {
        return result;
      }
      int v3 = 1651925816;
    }
    else
    {
      if (a1 == 1651519798) {
        return result;
      }
      int v3 = 1651587122;
    }
    goto LABEL_22;
  }
  if (a1 > 760375360)
  {
    if (a1 > 793929792)
    {
      if (a1 == 793929793) {
        return result;
      }
      int v3 = 1647719528;
    }
    else
    {
      if (a1 == 760375361) {
        return result;
      }
      int v3 = 793522280;
    }
    goto LABEL_22;
  }
  if (a1 != 642527336 && a1 != 642934849)
  {
    int v3 = 759967848;
LABEL_22:
    if (a1 != v3) {
      return 0;
    }
  }
  return result;
}

uint64_t firstPixelFromBayerPhase(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    if ([v1 isEqualToString:@"Gr"])
    {
      uint64_t v3 = 0;
    }
    else if ([v2 isEqualToString:@"R"])
    {
      uint64_t v3 = 1;
    }
    else if ([v2 isEqualToString:@"B"])
    {
      uint64_t v3 = 2;
    }
    else if ([v2 isEqualToString:@"Gb"])
    {
      uint64_t v3 = 3;
    }
    else
    {
      FigSignalErrorAt();
      uint64_t v3 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    FigDebugAssert3();
    uint64_t v3 = FigSignalErrorAt();
  }

  return v3;
}

uint64_t determineFirstPixelWithBayerPattern(int a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (isVersatilePixelFormat(a1))
    {
      uint64_t PixelForVersatileCVPixelBufferWithBayerPattern = determineFirstPixelForVersatileCVPixelBufferWithBayerPattern(v3);
      if (!PixelForVersatileCVPixelBufferWithBayerPattern) {
        FigDebugAssert3();
      }
    }
    else
    {
      uint64_t PixelForVersatileCVPixelBufferWithBayerPattern = determineFirstPixelForCVPixelFormat(a1);
    }
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    uint64_t PixelForVersatileCVPixelBufferWithBayerPattern = 0xFFFFFFFFLL;
  }

  return PixelForVersatileCVPixelBufferWithBayerPattern;
}

uint64_t determineFirstPixelForVersatileCVPixelBufferWithBayerPattern(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_5;
  }
  unsigned int v3 = [v1 intValue];
  if (v3 > 8)
  {
LABEL_5:
    uint64_t v4 = 0xFFFFFFFFLL;
    goto LABEL_6;
  }
  uint64_t v4 = dword_263480D38[v3];
LABEL_6:

  return v4;
}

uint64_t determineFirstPixel(__CVBuffer *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!a1 || !v3) {
    goto LABEL_9;
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (!isVersatilePixelFormat(PixelFormatType))
  {
    uint64_t PixelForCVPixelFormat = determineFirstPixelForCVPixelFormat(PixelFormatType);
    goto LABEL_8;
  }
  uint64_t v6 = (void *)CVBufferCopyAttachment(a1, (CFStringRef)*MEMORY[0x263F04238], 0);
  if (!v6)
  {
LABEL_9:
    FigDebugAssert3();
    FigSignalErrorAt();
    uint64_t PixelForCVPixelFormat = 0xFFFFFFFFLL;
    goto LABEL_8;
  }
  int v7 = v6;
  uint64_t PixelForCVPixelFormat = determineFirstPixelForVersatileCVPixelBufferWithBayerPattern(v6);

  if (!PixelForCVPixelFormat) {
    FigDebugAssert3();
  }
LABEL_8:

  return PixelForCVPixelFormat;
}

__n64 offsetForPixelComponentWithFirstPixel(unsigned int a1, unsigned int a2)
{
  if (a1 >= 5 || a2 >= 5)
  {
    FigDebugAssert3();
    return 0;
  }
  else
  {
    uint64_t v2 = (unsigned __int16 *)((char *)&offsetForPixelComponentWithFirstPixel_bayerPatternOffsets
                            + 16 * (int)a2
                            + 4 * (int)a1);
    result.n64_u16[0] = *v2;
    result.n64_u16[2] = v2[1];
  }
  return result;
}

uint64_t determineCompandingMode(__CVBuffer *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!a1 || !v3)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    uint64_t v6 = 0;
    goto LABEL_23;
  }
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType <= 1734501175)
  {
    if (PixelFormatType > 1651847471)
    {
      if (PixelFormatType == 1651847472) {
        goto LABEL_21;
      }
      if (PixelFormatType != 1651925816)
      {
        if (PixelFormatType == 1652056888) {
          uint64_t v6 = 2;
        }
        else {
          uint64_t v6 = 0;
        }
        goto LABEL_23;
      }
    }
    else if (PixelFormatType != 1650942776)
    {
      if (PixelFormatType != 1650943796)
      {
        uint64_t v6 = 0;
        int v7 = 1651587122;
        goto LABEL_20;
      }
LABEL_21:
      uint64_t v6 = 1;
      goto LABEL_23;
    }
LABEL_22:
    uint64_t v6 = 3;
    goto LABEL_23;
  }
  if (PixelFormatType > 1735549751)
  {
    if (PixelFormatType == 1735549752 || PixelFormatType == 1919378232) {
      goto LABEL_22;
    }
    uint64_t v6 = 0;
    int v7 = 1919379252;
  }
  else
  {
    if (PixelFormatType == 1734501176) {
      goto LABEL_22;
    }
    if (PixelFormatType == 1734505012) {
      goto LABEL_21;
    }
    uint64_t v6 = 0;
    int v7 = 1735549492;
  }
LABEL_20:
  if (PixelFormatType == v7) {
    goto LABEL_21;
  }
LABEL_23:

  return v6;
}

uint64_t determineInputBitDepth(__CVBuffer *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!a1 || !v3)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    uint64_t v6 = 0xFFFFFFFFLL;
    goto LABEL_24;
  }
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  uint64_t v6 = 0xFFFFFFFFLL;
  if (PixelFormatType > 1734501175)
  {
    if (PixelFormatType > 1735549751)
    {
      if (PixelFormatType == 1735549752 || PixelFormatType == 1919378232) {
        goto LABEL_22;
      }
      int v7 = 1919379252;
    }
    else
    {
      if (PixelFormatType == 1734501176) {
        goto LABEL_22;
      }
      if (PixelFormatType == 1734505012) {
        goto LABEL_21;
      }
      int v7 = 1735549492;
    }
    if (PixelFormatType != v7) {
      goto LABEL_24;
    }
LABEL_21:
    uint64_t v6 = 14;
    goto LABEL_24;
  }
  if (PixelFormatType <= 1651847471)
  {
    if (PixelFormatType != 1650942776)
    {
      if (PixelFormatType != 1650943796)
      {
        if (PixelFormatType != 1651587122) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
      goto LABEL_21;
    }
LABEL_22:
    uint64_t v6 = 8;
    goto LABEL_24;
  }
  if (PixelFormatType == 1651847472)
  {
LABEL_23:
    uint64_t v6 = 10;
    goto LABEL_24;
  }
  if (PixelFormatType == 1651925816 || PixelFormatType == 1652056888) {
    goto LABEL_22;
  }
LABEL_24:

  return v6;
}

__CVBuffer *determineCFALayout(__CVBuffer *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (v3)
    {
      OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
      uint64_t v6 = (void *)CVBufferCopyAttachment(a1, (CFStringRef)*MEMORY[0x263F04238], 0);
      a1 = (__CVBuffer *)determineCFALayoutWithBayerPattern(PixelFormatType, v6, v4);
    }
    else
    {
      FigDebugAssert3();
      FigSignalErrorAt();
      a1 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
  }

  return a1;
}

uint64_t determineCFALayoutWithBayerPattern(int a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = isVersatilePixelFormat(a1);
  if (!v5 && v7 || !v6)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    uint64_t v8 = 0;
    goto LABEL_40;
  }
  uint64_t v8 = 0;
  if (a1 > 1652056887)
  {
    if (a1 <= 1735549491)
    {
      if (a1 == 1652056888) {
        goto LABEL_22;
      }
      if (a1 == 1734501176) {
        goto LABEL_33;
      }
      int v10 = 1734505012;
    }
    else
    {
      if (a1 <= 1919378231)
      {
        if (a1 != 1735549492)
        {
          int v10 = 1735549752;
          goto LABEL_32;
        }
        goto LABEL_33;
      }
      if (a1 == 1919379252) {
        goto LABEL_33;
      }
      int v10 = 1919378232;
    }
LABEL_32:
    if (a1 != v10) {
      goto LABEL_40;
    }
    goto LABEL_33;
  }
  if (a1 <= 1651587121)
  {
    if (a1 == 1647719528) {
      goto LABEL_22;
    }
    if (a1 != 1650942776)
    {
      int v10 = 1650943796;
      goto LABEL_32;
    }
LABEL_33:
    if (objc_msgSend(v6, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F5E0], 1, 0) == 2) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    goto LABEL_40;
  }
  if (a1 > 1651925815)
  {
    if (a1 == 1651925816) {
      goto LABEL_22;
    }
    int v9 = 1651926376;
  }
  else
  {
    if (a1 == 1651587122) {
      goto LABEL_22;
    }
    int v9 = 1651847472;
  }
  if (a1 == v9)
  {
LABEL_22:
    id v11 = v5;
    id v12 = v6;
    if (v5)
    {
      unsigned int v13 = [v11 intValue];
      if (v13 < 4)
      {
        if (objc_msgSend(v12, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F5E0], 1, 0) == 2) {
          uint64_t v8 = 2;
        }
        else {
          uint64_t v8 = 1;
        }
        goto LABEL_39;
      }
      if (v13 == 5 || v13 == 8)
      {
        uint64_t v8 = 3;
LABEL_39:

        goto LABEL_40;
      }
    }
    else
    {
      FigDebugAssert3();
      FigSignalErrorAt();
    }
    uint64_t v8 = 0;
    goto LABEL_39;
  }
LABEL_40:

  return v8;
}

uint64_t GetPixelSizeInBytes(OSType pixelFormat, CFIndex a2)
{
  CFDictionaryRef v3 = CVPixelFormatDescriptionCreateWithPixelFormatType(0, pixelFormat);
  if (v3)
  {
    CFDictionaryRef v4 = v3;
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v3, (const void *)*MEMORY[0x263F042C8]);
    if (!a2 || Value)
    {
      ValueAtIndeCGFloat x = v4;
      if (Value) {
        ValueAtIndeCGFloat x = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, a2);
      }
      CFNumberRef v7 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x263F04250]);
      if (v7)
      {
        int valuePtr = 0;
        CFNumberGetValue(v7, kCFNumberIntType, &valuePtr);
        int v8 = valuePtr;
        if ((valuePtr & 7) == 0)
        {
          if (valuePtr < 0) {
            int v8 = valuePtr + 7;
          }
          uint64_t v9 = (uint64_t)v8 >> 3;
          goto LABEL_14;
        }
        FigDebugAssert3();
        FigSignalErrorAt();
      }
    }
    uint64_t v9 = 0;
LABEL_14:
    CFRelease(v4);
    return v9;
  }
  return 0;
}

uint64_t copyMTLTextureToPixelBuffer(void *a1, __CVBuffer *a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 width];
  uint64_t v5 = [v3 height];
  uint64_t v6 = [v3 arrayLength];
  int v7 = v6;
  uint64_t v8 = v4 << 32;
  uint64_t v9 = (v4 << 32) * v5 * v6;
  size_t Width = CVPixelBufferGetWidth(a2);
  if (CVPixelBufferGetHeight(a2) * Width != v9 >> 32 || CVPixelBufferLockBaseAddress(a2, 0)) {
    goto LABEL_8;
  }
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a2);
  unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(a2);
  if (v7 >= 1)
  {
    uint64_t v13 = 0;
    uint64_t v14 = v8 >> 32;
    uint64_t v15 = (int)v5;
    uint64_t v16 = BytesPerRow * v5;
    uint64_t v17 = BytesPerRow;
    do
    {
      memset(v19, 0, 24);
      v19[3] = v14;
      v19[4] = v15;
      v19[5] = 1;
      [v3 getBytes:BaseAddress bytesPerRow:v17 bytesPerImage:v16 fromRegion:v19 mipmapLevel:0 slice:v13];
      BaseAddress += v16;
      ++v13;
    }
    while (v7 != v13);
  }
  if (CVPixelBufferUnlockBaseAddress(a2, 0)) {
LABEL_8:
  }
    FigDebugAssert3();

  return 0;
}

float *PDCGetNoiseStdDev(float *result, int a2, unsigned int a3, uint64_t a4, uint64_t a5, float a6, float a7)
{
  uint64_t v7 = 0;
  float v8 = a6 / (float)a3;
  float v9 = (float)(v8 * *result) * (float)(v8 * *result);
  float v10 = (float)((float)(v8 * (float)(result[1] * 8.0)) * (float)(v8 * (float)(result[1] * 8.0))) * 0.015873;
  float v11 = (float)((float)(a7 * a7) * (float)(v10 + (float)(v9 * -0.015873))) - (float)(v10 - (float)(v9 * 1.0159));
  if (v11 < 0.0) {
    float v11 = 0.0;
  }
  do
  {
    float v12 = v11 + (float)(v8 * (float)((float)((float)((*(_DWORD *)(a4 + v7) * a2) >> 12) * 0.015625) * a7));
    float v13 = fabsf(sqrtf(v12)) * 64.0;
    BOOL v14 = v12 == -INFINITY;
    float v15 = INFINITY;
    if (!v14) {
      float v15 = v13;
    }
    *(float *)(a5 + v7) = fminf(v15, 65535.0);
    v7 += 4;
  }
  while (v7 != 132);
  return result;
}

uint64_t populateQuadraFPGrid(uint64_t a1, uint64_t a2, int32x2_t a3)
{
  unint64_t v5 = 0;
  uint64_t v6 = (unsigned __int16 *)(a2 + 84);
  uint64_t v7 = 3;
  while (2)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 4 * v5;
    BOOL v10 = 1;
    do
    {
      while (!v10)
      {
        BOOL v10 = 0;
        if (++v8 == 4) {
          goto LABEL_21;
        }
      }
      uint64_t v11 = 20 * (v8 + v9);
      int v12 = *(unsigned __int8 *)(a2 + v11);
      BOOL v10 = *(unsigned char *)(a2 + v11) != 0;
      ++v8;
    }
    while (v8 != 4);
    if (!v12) {
      goto LABEL_21;
    }
    uint64_t v13 = a2 + 80 * v5;
    __int32 v15 = *(unsigned __int16 *)(v13 + 4);
    BOOL v14 = (unsigned __int16 *)(v13 + 4);
    a3.i32[0] = v15;
    a3.i16[2] = v14[1];
    uint64_t v16 = v9 | 1;
    uint64_t v17 = a2 + 20 * (v9 | 1);
    v18.i32[0] = *(unsigned __int16 *)(v17 + 4);
    v18.i32[1] = *(unsigned __int16 *)(v17 + 6);
    int16x4_t v19 = (int16x4_t)vceq_s32((int32x2_t)vand_s8((int8x8_t)vadd_s32(a3, (int32x2_t)1), (int8x8_t)0xFFFF0000FFFFLL), v18);
    uint16x4_t v20 = (uint16x4_t)vuzp1_s16(v19, v19);
    v20.i16[0] = vminv_u16(v20);
    __int32 v21 = v20.i32[0];
    uint64_t v22 = v9 | 2;
    uint64_t v23 = a2 + 20 * (v9 | 2);
    v18.i32[0] = *(unsigned __int16 *)(v23 + 4);
    v18.i32[1] = *(unsigned __int16 *)(v23 + 6);
    int16x4_t v24 = (int16x4_t)vceq_s32((int32x2_t)vand_s8((int8x8_t)vadd_s32(a3, (int32x2_t)0x100000000), (int8x8_t)0xFFFF0000FFFFLL), v18);
    uint16x4_t v25 = (uint16x4_t)vuzp1_s16(v24, v24);
    v25.i16[0] = vminv_u16(v25);
    __int32 v26 = v25.i32[0];
    uint64_t v27 = v9 | 3;
    uint64_t v28 = a2 + 20 * (v9 | 3);
    v29.i32[0] = *(unsigned __int16 *)(v28 + 4);
    v29.i32[1] = *(unsigned __int16 *)(v28 + 6);
    int16x4_t v30 = (int16x4_t)vceq_s32((int32x2_t)vand_s8((int8x8_t)vadd_s32(a3, (int32x2_t)0x100000001), (int8x8_t)0xFFFF0000FFFFLL), v29);
    uint16x4_t v31 = (uint16x4_t)vuzp1_s16(v30, v30);
    v31.i16[0] = vminv_u16(v31);
    if ((v21 & v26 & v31.i32[0] & 0x8000) == 0) {
      goto LABEL_28;
    }
    uint64_t v32 = a2 + 80 * v5;
    unsigned int v35 = *(_DWORD *)(v32 + 8);
    float v34 = (_WORD *)(v32 + 8);
    unsigned int v33 = v35;
    uint64_t v36 = a2 + 20 * v16;
    v37.i32[0] = *(unsigned __int16 *)(v36 + 8);
    v37.i32[1] = *(unsigned __int16 *)(v36 + 10);
    v29.i32[0] = v35;
    int32x2_t v38 = (int32x2_t)vmovl_u16((uint16x4_t)v29).u64[0];
    int16x4_t v39 = (int16x4_t)vceq_s32(v37, v38);
    int32x2_t v40 = (int32x2_t)vuzp1_s16(v39, v39);
    v40.i16[0] = vminv_u16((uint16x4_t)v40);
    LODWORD(v36) = v40.i32[0];
    uint64_t v41 = a2 + 20 * v22;
    v40.i32[0] = *(unsigned __int16 *)(v41 + 8);
    v40.i32[1] = *(unsigned __int16 *)(v41 + 10);
    int16x4_t v42 = (int16x4_t)vceq_s32(v40, v38);
    int32x2_t v43 = (int32x2_t)vuzp1_s16(v42, v42);
    v43.i16[0] = vminv_u16((uint16x4_t)v43);
    LODWORD(v41) = v43.i32[0];
    uint64_t v44 = a2 + 20 * v27;
    v43.i32[0] = *(unsigned __int16 *)(v44 + 8);
    v43.i32[1] = *(unsigned __int16 *)(v44 + 10);
    int16x4_t v45 = (int16x4_t)vceq_s32(v43, v38);
    uint16x4_t v46 = (uint16x4_t)vuzp1_s16(v45, v45);
    v46.i16[0] = vminv_u16(v46);
    if ((v36 & v41 & v46.i32[0] & 0x8000) == 0) {
      goto LABEL_28;
    }
    if (HIWORD(v33) >= (unsigned __int16)v33) {
      unsigned int v33 = (unsigned __int16)v33;
    }
    else {
      v33 >>= 16;
    }
    if (v33 < 8) {
      goto LABEL_28;
    }
    unint64_t v47 = v6;
    uint64_t v48 = v7;
    if (v5 > 2)
    {
LABEL_19:
      v51.n64_u64[0] = offsetForPixelComponentWithFirstPixel(2u, *(unsigned __int8 *)(a2 + 321)).n64_u64[0];
      if ((*v34 & 3) != 0) {
        goto LABEL_28;
      }
      v52.n64_u16[0] = *v14;
      v52.n64_u16[2] = v14[1];
      int16x4_t v53 = (int16x4_t)vceq_s32((int32x2_t)vand_s8((int8x8_t)vshr_n_u32((uint32x2_t)v52.n64_u64[0], 1uLL), (int8x8_t)0x100000001), (int32x2_t)vand_s8((int8x8_t)v51.n64_u64[0], (int8x8_t)0xFFFF0000FFFFLL));
      a3 = (int32x2_t)vuzp1_s16(v53, v53);
      if ((vminv_u16((uint16x4_t)a3) & 0x8000) == 0) {
        goto LABEL_28;
      }
LABEL_21:
      ++v5;
      --v7;
      v6 += 40;
      if (v5 != 4) {
        continue;
      }
      goto LABEL_22;
    }
    break;
  }
  while (1)
  {
    if (*((unsigned char *)v47 - 4))
    {
      v49.i32[0] = *v47;
      v49.i32[1] = v47[1];
      float32x2_t v50 = vcvt_f32_s32(vsub_s32((int32x2_t)vand_s8((int8x8_t)a3, (int8x8_t)0xFFFF0000FFFFLL), v49));
      if (sqrtf(vaddv_f32(vmul_f32(v50, v50))) < 8.0) {
        break;
      }
    }
    v47 += 40;
    if (!--v48) {
      goto LABEL_19;
    }
  }
LABEL_28:
  FigDebugAssert3();
  uint64_t v72 = FigSignalErrorAt();
  if (v72)
  {
    uint64_t v70 = v72;
    FigDebugAssert3();
    return v70;
  }
LABEL_22:
  uint64_t v54 = 0;
  long long v55 = xmmword_263480DF0;
  long long v56 = xmmword_263480E00;
  int16x8_t v57 = 0uLL;
  float32x2_t v58 = (unsigned __int16 *)(a2 + 10);
  long long v59 = 0uLL;
  long long v60 = 0uLL;
  long long v61 = xmmword_263480E00;
  long long v62 = xmmword_263480DF0;
  do
  {
    if (*((unsigned char *)v58 - 10))
    {
      int v63 = *(v58 - 3);
      long long v79 = v62;
      *(_DWORD *)((unint64_t)&v79 & 0xFFFFFFFFFFFFFFF3 | (4 * (v54 & 3))) = v63;
      long long v62 = v79;
      int v64 = *(v58 - 2);
      long long v78 = v55;
      *(_DWORD *)((unint64_t)&v78 & 0xFFFFFFFFFFFFFFF3 | (4 * (v54 & 3))) = v64;
      long long v55 = v78;
      int v65 = *(v58 - 1);
      long long v77 = v61;
      *(_DWORD *)((unint64_t)&v77 & 0xFFFFFFFFFFFFFFF3 | (4 * (v54 & 3))) = v65;
      long long v61 = v77;
      int v66 = *v58;
      long long v73 = v56;
      *(_DWORD *)((unint64_t)&v73 & 0xFFFFFFFFFFFFFFF3 | (4 * (v54 & 3))) = v66;
      long long v56 = v73;
      int v67 = v58[3];
      long long v76 = v60;
      *(_DWORD *)((unint64_t)&v76 & 0xFFFFFFFFFFFFFFF3 | (4 * (v54 & 3))) = v67;
      long long v60 = v76;
      int v68 = v58[4];
      long long v75 = v59;
      *(_DWORD *)((unint64_t)&v75 & 0xFFFFFFFFFFFFFFF3 | (4 * (v54 & 3))) = v68;
      long long v59 = v75;
      __int16 v69 = *((unsigned __int8 *)v58 - 9);
      uint64_t v74 = v57.i64[0];
      *(_WORD *)((unint64_t)&v74 & 0xFFFFFFFFFFFFFFF9 | (2 * (v54 & 3))) = v69;
      v57.i64[0] = v74;
    }
    ++v54;
    v58 += 40;
  }
  while (v54 != 4);
  uint64_t v70 = 0;
  *(_OWORD *)a1 = v62;
  *(_OWORD *)(a1 + 16) = v55;
  *(_OWORD *)(a1 + 32) = v61;
  *(_OWORD *)(a1 + 48) = v56;
  *(_OWORD *)(a1 + 64) = v60;
  *(_OWORD *)(a1 + 80) = v59;
  *(_DWORD *)(a1 + 96) = vmovn_s16(v57).u32[0];
  return v70;
}

void sub_2632FDF30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double PDCSetKernel(uint64_t a1, _OWORD *a2)
{
  if (a1)
  {
    for (uint64_t i = 0; i != 25; ++i)
    {
      int v5 = *(_DWORD *)(a1 + 4 * i);
      if ((v5 - 2048) <= 0xFFFFEFFF) {
        FigDebugAssert3();
      }
      *((_WORD *)a2 + i) = v5;
    }
  }
  else
  {
    double result = 0.0;
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }
  return result;
}

double PDCMakeKernel(unsigned int a1, int a2, char a3, int a4, int a5, int a6, uint64_t a7, int a8, _OWORD *a9)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (a7)
  {
    uint64_t v9 = 0;
    for (unsigned int i = 26; i > 1; --i)
    {
      int v11 = *(_DWORD *)(a7 + v9 * 4) * (4096 - a8) + kPDCKernelSameChannel[v9] * a8;
      if (v11 >= 0) {
        signed int v12 = (v11 + 2048) >> 12;
      }
      else {
        signed int v12 = -((2048 - v11) >> 12);
      }
      if (v12 >= 2047) {
        signed int v12 = 2047;
      }
      if (v12 <= -2048) {
        signed int v12 = -2048;
      }
      v33[v9++] = v12;
    }
    int v13 = a6;
    if (a2 != 2)
    {
      int v13 = a4;
      if (a2 != 1)
      {
        int v13 = a5;
        if (a2) {
          int v13 = a5;
        }
      }
    }
    unint64_t v14 = kPDCKernelRGB[a1];
    __int32 v15 = v33;
    unsigned int v16 = 26;
    LODWORD(v40) = (a4 << 12) / v13;
    HIDWORD(v40) = (a5 << 12) / v13;
    int v41 = (a6 << 12) / v13;
    unint64_t v17 = v14;
    do
    {
      int v18 = *((_DWORD *)&v40 + (v17 & 3)) * *v15;
      if (v18 >= 0) {
        signed int v19 = (v18 + 2048) >> 12;
      }
      else {
        signed int v19 = -((2048 - v18) >> 12);
      }
      if (v19 >= 2047) {
        signed int v19 = 2047;
      }
      if (v19 <= -2048) {
        signed int v19 = -2048;
      }
      *v15++ = v19;
      v17 >>= 2;
      --v16;
    }
    while (v16 > 1);
    uint16x4_t v20 = (int *)&v40;
    uint64_t v40 = 0;
    int v41 = 0;
    switch(a2)
    {
      case 1:
        break;
      case 2:
        uint16x4_t v20 = &v41;
        break;
      default:
        uint16x4_t v20 = (int *)&v40 + 1;
        break;
    }
    *uint16x4_t v20 = -256;
    uint64_t v22 = v33;
    for (unsigned int j = 26; j > 1; --j)
    {
      int v24 = *v22++;
      *((_DWORD *)&v40 + (v14 & 3)) += v24;
      v14 >>= 2;
    }
    int v25 = (int)v40 >> 1;
    int v26 = SHIDWORD(v40) >> 1;
    int v27 = v41 >> 1;
    int v28 = v40 - ((int)v40 >> 1);
    int v29 = HIDWORD(v40) - (SHIDWORD(v40) >> 1);
    int v30 = v41 - (v41 >> 1);
    if (a1 == 2)
    {
      v34 -= v25;
      v35 -= v26;
      v38 -= v29;
      v39 -= v28;
      if (a3)
      {
        uint64_t v31 = 12;
        int v29 = v41;
        goto LABEL_45;
      }
      uint64_t v31 = 22;
      uint64_t v32 = 2;
      int v26 = v41 >> 1;
      int v29 = v41 - (v41 >> 1);
    }
    else if (a1 == 1)
    {
      v34 -= v27;
      v35 -= v26;
      v38 -= v29;
      v39 -= v30;
      if (a3)
      {
        uint64_t v31 = 12;
        int v29 = v40;
        goto LABEL_45;
      }
      uint64_t v31 = 22;
      uint64_t v32 = 2;
      int v26 = (int)v40 >> 1;
      int v29 = v40 - ((int)v40 >> 1);
    }
    else
    {
      if (a1) {
        return PDCSetKernel((uint64_t)v33, a9);
      }
      v36 -= v25;
      v35 -= v27;
      v37 -= v28;
      v38 -= v30;
      if (a3)
      {
        uint64_t v31 = 12;
        int v29 = HIDWORD(v40);
LABEL_45:
        v33[v31] -= v29;
        return PDCSetKernel((uint64_t)v33, a9);
      }
      uint64_t v31 = 18;
      uint64_t v32 = 6;
    }
    v33[v32] -= v26;
    goto LABEL_45;
  }

  return PDCSetKernel((uint64_t)&kPDCKernelIdentity, a9);
}

uint64_t compareScanOrder(unsigned __int16 *a1, unsigned __int16 *a2)
{
  unsigned __int16 v2 = *a1;
  unsigned int v3 = a1[1];
  unsigned __int16 v4 = *a2;
  unsigned __int16 v5 = a2[1];
  if (v3 < v5) {
    return 0xFFFFFFFFLL;
  }
  if (v3 > v5) {
    return 1;
  }
  if (v2 >= v4) {
    return v2 > v4;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

float fillSensorRawDecodeConfig(uint64_t a1, unsigned char *a2, uint64_t a3, int32x4_t *a4, char a5, double a6, uint32x2_t a7, double a8)
{
  if (*(unsigned char *)a3) {
    float v8 = 0.000017517;
  }
  else {
    float v8 = (float)(1.0 / (float)(~(-1 << *(unsigned char *)(a3 + 3)) << (16 - *(unsigned char *)(a3 + 3)))) * 1.148;
  }
  v9.i64[0] = 0xC0000000CLL;
  v9.i64[1] = 0xC0000000CLL;
  uint32x4_t v10 = (uint32x4_t)vsubq_s32(v9, a4[4]);
  v9.i64[0] = 0x100000001;
  v9.i64[1] = 0x100000001;
  float32x4_t v11 = vdivq_f32(vcvtq_f32_s32(a4[3]), vcvtq_f32_s32((int32x4_t)vshlq_u32((uint32x4_t)v9, v10)));
  float32x4_t v12 = vmulq_n_f32(v11, v8);
  int32x4_t v13 = (int32x4_t)vmulq_f32(vdivq_f32(vcvtq_f32_s32(a4[1]), (float32x4_t)vdupq_n_s32(0x475EFF00u)), v11);
  float v15 = *(float *)(a3 + 76);
  float v14 = *(float *)(a3 + 80);
  float v17 = *(float *)(a3 + 88);
  float v16 = *(float *)(a3 + 92);
  float v18 = *(float *)(a3 + 476);
  float v19 = *(float *)(a3 + 472);
  int v20 = a4->u8[1];
  if (a5)
  {
    *(int32x4_t *)a1 = vdupq_laneq_s32((int32x4_t)v12, 3);
    *(int32x4_t *)(a1 + 16) = vdupq_laneq_s32((int32x4_t)v12, 2);
    *(int32x4_t *)(a1 + 32) = vdupq_lane_s32(*(int32x2_t *)v12.f32, 0);
    *(int32x4_t *)(a1 + 48) = vdupq_lane_s32(*(int32x2_t *)v12.f32, 1);
    *(int32x4_t *)(a1 + 64) = vdupq_laneq_s32(v13, 3);
    *(int32x4_t *)(a1 + 80) = vdupq_laneq_s32(v13, 2);
    *(int32x4_t *)(a1 + 96) = vdupq_lane_s32(*(int32x2_t *)v13.i8, 0);
    *(int32x4_t *)(a1 + 112) = vdupq_lane_s32(*(int32x2_t *)v13.i8, 1);
  }
  else
  {
    for (uint64_t i = 0; i != 64; i += 16)
    {
      uint64_t v22 = (float32x4_t *)(a1 + i);
      *uint64_t v22 = v12;
      v22[4] = (float32x4_t)v13;
    }
  }
  float32x4_t v23 = vnegq_f32(v12);
  if (*(unsigned char *)(a3 + 32))
  {
    int32x4_t v24 = *(int32x4_t *)(a3 + 48);
    switch(v20)
    {
      case 0:
        break;
      case 1:
        int32x4_t v24 = vrev64q_s32(v24);
        break;
      case 2:
        goto LABEL_15;
      case 3:
        int32x4_t v24 = vrev64q_s32(v24);
LABEL_15:
        int32x4_t v24 = (int32x4_t)vextq_s8((int8x16_t)v24, (int8x16_t)v24, 8uLL);
        break;
      default:
        int32x4_t v24 = 0uLL;
        break;
    }
    uint64_t v32 = 0;
    float32x4_t v33 = (float32x4_t)vextq_s8((int8x16_t)v24, (int8x16_t)vrev64q_s32(v24), 8uLL);
    do
    {
      *(float32x4_t *)(a1 + 64 + v32) = vmlaq_f32(*(float32x4_t *)(a1 + 64 + v32), v33, v23);
      v32 += 16;
    }
    while (v32 != 64);
  }
  else if (*(unsigned char *)(a3 + 464))
  {
    int32x4_t v25 = *(int32x4_t *)(a3 + 480);
    int32x4_t v26 = vzip1q_s32(v25, v25);
    float32x4_t v27 = (float32x4_t)vextq_s8((int8x16_t)v26, (int8x16_t)vrev64q_s32(v26), 8uLL);
    float32x4_t v28 = vmlsq_f32(*(float32x4_t *)(a1 + 80), v27, v12);
    *(float32x4_t *)(a1 + 64) = vmlsq_f32(*(float32x4_t *)(a1 + 64), v27, v12);
    *(float32x4_t *)(a1 + 80) = v28;
    int32x4_t v29 = vzip2q_s32(v25, v25);
    float32x4_t v30 = (float32x4_t)vextq_s8((int8x16_t)v29, (int8x16_t)vrev64q_s32(v29), 8uLL);
    float32x4_t v31 = vmlsq_f32(*(float32x4_t *)(a1 + 112), v30, v12);
    *(float32x4_t *)(a1 + 96) = vmlsq_f32(*(float32x4_t *)(a1 + 96), v30, v12);
    *(float32x4_t *)(a1 + 112) = v31;
  }
  if (*(unsigned char *)(a3 + 496))
  {
    for (uint64_t j = 0; j != 64; j += 16)
      *(float32x4_t *)(a1 + 64 + j) = vmlaq_f32(*(float32x4_t *)(a1 + 64 + j), (float32x4_t)vextq_s8(*(int8x16_t *)(a3 + 512 + j), (int8x16_t)vrev64q_s32(*(int32x4_t *)(a3 + 512 + j)), 8uLL), v23);
  }
  __asm { FMOV            V18.4S, #0.25 }
  int8x16_t v40 = (int8x16_t)vmulq_f32(v12, _Q18);
  *(float *)v40.i32 = vaddv_f32(vadd_f32(*(float32x2_t *)v40.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v40, v40, 8uLL)));
  *(_WORD *)(a1 + 154) = WORD2(a6);
  *(_WORD *)(a1 + 152) = LOWORD(a6);
  float v41 = (float)(v14 - v15) * *(float *)v40.i32;
  *(_WORD *)(a1 + 158) = WORD2(a8);
  *(_WORD *)(a1 + 156) = LOWORD(a8);
  __asm { FMOV            V3.2S, #1.0 }
  *(void *)(a1 + 160) = *(void *)(a3 + 64);
  *(float32x2_t *)(a1 + 168) = vdiv_f32(_D3, vcvt_f32_u32(a7));
  float v43 = *(float *)v40.i32 * *(float *)(a3 + 76);
  *(float *)(a1 + 128) = v41;
  *(float *)(a1 + 132) = v43;
  float v44 = *(float *)v40.i32 * *(float *)(a3 + 88);
  *(float *)(a1 + 136) = (float)(v16 - v17) * *(float *)v40.i32;
  *(float *)(a1 + 140) = v44;
  float result = *(float *)v40.i32 * *(float *)(a3 + 472);
  *(float *)(a1 + 144) = (float)(v18 - v19) * *(float *)v40.i32;
  *(float *)(a1 + 148) = result;
  *a2 = *(unsigned char *)a3;
  return result;
}

void sub_26330C7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  for (uint64_t i = 56; i != -16; i -= 24)

  for (uint64_t j = 80; j != -16; j -= 48)
    objc_destroyWeak((id *)(v43 - 248 + j));
  _Unwind_Resume(a1);
}

id createScaledPointDict(void *a1)
{
  _OWORD v15[2] = *MEMORY[0x263EF8340];
  id v1 = a1;
  unsigned __int16 v2 = [v1 objectForKeyedSubscript:@"X"];
  unsigned int v3 = [v1 objectForKeyedSubscript:@"Y"];

  if (v2 && v3)
  {
    [v2 floatValue];
    float v5 = v4 * 0.5;
    [v3 floatValue];
    float v7 = v6 * 0.5;
    v14[0] = @"X";
    *(float *)&double v8 = v5;
    int32x4_t v9 = [NSNumber numberWithFloat:v8];
    v14[1] = @"Y";
    v15[0] = v9;
    *(float *)&double v10 = v7;
    float32x4_t v11 = [NSNumber numberWithFloat:v10];
    v15[1] = v11;
    float32x4_t v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  }
  else
  {
    FigDebugAssert3();
    float32x4_t v12 = 0;
  }

  return v12;
}

uint64_t verifyConfig(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 == *(_DWORD *)a2
    && *(float *)(a1 + 180) == *(float *)(a2 + 180)
    && *(float *)(a1 + 184) == *(float *)(a2 + 184)
    && *(float *)(a1 + 208) == *(float *)(a2 + 208)
    && *(float *)(a1 + 212) == *(float *)(a2 + 212)
    && *(float *)(a1 + 244) == *(float *)(a2 + 244)
    && *(float *)(a1 + 248) == *(float *)(a2 + 248)
    && *(float *)(a1 + 272) == *(float *)(a2 + 272)
    && *(float *)(a1 + 276) == *(float *)(a2 + 276)
    && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8)
    && *(unsigned __int8 *)(a1 + 12) == *(unsigned __int8 *)(a2 + 12)
    && *(unsigned __int8 *)(a1 + 13) == *(unsigned __int8 *)(a2 + 13)
    && *(unsigned __int8 *)(a1 + 14) == *(unsigned __int8 *)(a2 + 14)
    && *(unsigned __int8 *)(a1 + 15) == *(unsigned __int8 *)(a2 + 15)
    && *(unsigned __int8 *)(a1 + 16) == *(unsigned __int8 *)(a2 + 16)
    && *(unsigned __int8 *)(a1 + 17) == *(unsigned __int8 *)(a2 + 17)
    && *(unsigned __int8 *)(a1 + 18) == *(unsigned __int8 *)(a2 + 18)
    && *(unsigned __int8 *)(a1 + 19) == *(unsigned __int8 *)(a2 + 19)
    && *(unsigned __int8 *)(a1 + 20) == *(unsigned __int8 *)(a2 + 20)
    && *(unsigned __int8 *)(a1 + 21) == *(unsigned __int8 *)(a2 + 21)
    && *(unsigned __int8 *)(a1 + 22) == *(unsigned __int8 *)(a2 + 22)
    && *(unsigned __int8 *)(a1 + 23) == *(unsigned __int8 *)(a2 + 23)
    && *(unsigned __int8 *)(a1 + 24) == *(unsigned __int8 *)(a2 + 24)
    && *(unsigned __int8 *)(a1 + 25) == *(unsigned __int8 *)(a2 + 25)
    && *(unsigned __int8 *)(a1 + 26) == *(unsigned __int8 *)(a2 + 26)
    && *(unsigned __int8 *)(a1 + 27) == *(unsigned __int8 *)(a2 + 27)
    && *(unsigned __int8 *)(a1 + 28) == *(unsigned __int8 *)(a2 + 28)
    && *(unsigned __int8 *)(a1 + 29) == *(unsigned __int8 *)(a2 + 29)
    && *(unsigned __int8 *)(a1 + 30) == *(unsigned __int8 *)(a2 + 30)
    && *(float *)(a1 + 40) == *(float *)(a2 + 40)
    && *(float *)(a1 + 44) == *(float *)(a2 + 44)
    && *(float *)(a1 + 48) == *(float *)(a2 + 48)
    && *(float *)(a1 + 52) == *(float *)(a2 + 52)
    && (vminvq_u32((uint32x4_t)vceqq_f32(*(float32x4_t *)(a1 + 64), *(float32x4_t *)(a2 + 64))) & 0x80000000) != 0
    && (vminvq_u32((uint32x4_t)vceqq_f32(*(float32x4_t *)(a1 + 80), *(float32x4_t *)(a2 + 80))) & 0x80000000) != 0
    && (vminvq_u32((uint32x4_t)vceqq_f32(*(float32x4_t *)(a1 + 96), *(float32x4_t *)(a2 + 96))) & 0x80000000) != 0
    && (vminvq_u32((uint32x4_t)vceqq_f32(*(float32x4_t *)(a1 + 112), *(float32x4_t *)(a2 + 112))) & 0x80000000) != 0
    && (vminvq_u32((uint32x4_t)vceqq_f32(*(float32x4_t *)(a1 + 128), *(float32x4_t *)(a2 + 128))) & 0x80000000) != 0
    && (vminvq_u32((uint32x4_t)vceqq_f32(*(float32x4_t *)(a1 + 144), *(float32x4_t *)(a2 + 144))) & 0x80000000) != 0
    && *(float *)(a1 + 308) == *(float *)(a2 + 308)
    && *(float *)(a1 + 312) == *(float *)(a2 + 312)
    && *(float *)(a1 + 316) == *(float *)(a2 + 316)
    && *(float *)(a1 + 320) == *(float *)(a2 + 320)
    && (float)(vabds_f32(*(float *)(a1 + 164), *(float *)(a2 + 164)) / *(float *)(a1 + 164)) < 0.05
    && (float)(vabds_f32(*(float *)(a1 + 160), *(float *)(a2 + 160)) / *(float *)(a1 + 160)) < 0.05)
  {
    BOOL v2 = *(void *)(a1 + 188) == *(void *)(a2 + 188) && *(void *)(a1 + 196) == *(void *)(a2 + 196);
    if (v2 && *(_DWORD *)(a1 + 204) == (unint64_t)*(unsigned int *)(a2 + 204))
    {
      BOOL v4 = *(void *)(a1 + 216) == *(void *)(a2 + 216) && *(void *)(a1 + 224) == *(void *)(a2 + 224);
      BOOL v5 = v4 && *(void *)(a1 + 232) == *(void *)(a2 + 232);
      if (v5 && *(_DWORD *)(a1 + 240) == (unint64_t)*(unsigned int *)(a2 + 240))
      {
        BOOL v7 = *(void *)(a1 + 252) == *(void *)(a2 + 252) && *(void *)(a1 + 260) == *(void *)(a2 + 260);
        if (v7 && *(_DWORD *)(a1 + 268) == (unint64_t)*(unsigned int *)(a2 + 268))
        {
          BOOL v9 = *(void *)(a1 + 280) == *(void *)(a2 + 280) && *(void *)(a1 + 288) == *(void *)(a2 + 288);
          BOOL v10 = v9 && *(void *)(a1 + 296) == *(void *)(a2 + 296);
          if (v10 && *(_DWORD *)(a1 + 304) == (unint64_t)*(unsigned int *)(a2 + 304)) {
            return 0;
          }
        }
      }
    }
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

void genGNUMaxLUT(int a1, uint64_t a2, float a3, float a4, float a5, float a6, float a7, float a8, float a9, float a10, float a11)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v39[0] = xmmword_263481640;
  v39[1] = xmmword_263481650;
  v39[2] = xmmword_263481660;
  void v39[3] = xmmword_263481670;
  v39[4] = xmmword_263481680;
  v39[5] = xmmword_263481690;
  v39[6] = xmmword_2634816A0;
  v39[7] = xmmword_2634816B0;
  int v40 = 1199570944;
  if (a6 <= 0.0)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    float v25 = 0.0;
  }
  else
  {
    float v25 = (float)((float)((float)((float)((float)((float)(a4 * a4) + (float)((float)(a5 * 0.125) * (float)(a5 * 0.125)))
                                        * -1.0481)
                                + (float)((float)((float)(a4 * a4) + (float)(a5 * a5)) * 1.0322))
                        + (float)((float)((float)((float)((float)(a4 * a4)
                                                        + (float)((float)(a5 * 0.125) * (float)(a5 * 0.125)))
                                                * 2.064)
                                        + (float)((float)((float)(a4 * a4) + (float)(a5 * a5)) * -1.0481))
                                / (float)(a6 * a6)))
                * a6)
        * a6;
  }
  uint64_t v26 = 0;
  float v27 = roundf((float)(sqrtf((float)((float)((float)(a6 * 0.0) * a6) / (float)(a3 * a6)) + v25) * a3) * 64.0);
  float v28 = (float)(v27 * 0.015625) * (float)(v27 * 0.015625);
  do
  {
    float v29 = roundf((float)(sqrtf(v25+ (float)((float)((float)((float)(*(float *)((char *)v39 + v26 * 4) * 0.015625) * a6) * a6)/ (float)(a3 * a6)))* a3)* 64.0)* 0.015625;
    if (a7 > 1.0) {
      float v29 = sqrtf(v28 + (float)((float)((float)(v29 * v29) - v28) / a7)) * a7;
    }
    v38[v26++] = v29 * 64.0;
  }
  while (v26 != 33);
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  float v32 = v38[0] * v38[0];
  do
  {
    if (a1 == 14)
    {
      float32x4_t v33 = &v38[v31];
      float v34 = sqrtf(v32 + (float)(a8 * (float)((float)(v38[v30] * v38[v30]) - v32)));
    }
    else
    {
      *(float *)((char *)v39 + v30 * 4) = *(float *)((char *)v39 + v30 * 4) / a8;
      float32x4_t v33 = &v38[v30];
      float v34 = v38[v30];
    }
    *float32x4_t v33 = v34 / a8;
    ++v31;
    ++v30;
  }
  while (v30 != 33);
  unint64_t v35 = 0;
  uint64_t v36 = 0;
  float v37 = v38[0] * a10;
  do
  {
    *(float *)(a2 + v36) = roundf((float)(v37+ (float)(truncf(COERCE_FLOAT(COERCE_UNSIGNED_INT64(interpExtrap(0x21uLL, (uint64_t)v39, (uint64_t)v38, (float)v35))))* a11))* a9);
    v36 += 4;
    v35 += 2048;
  }
  while (v36 != 132);
}

uint64_t genVertFir(uint64_t a1, float *a2, float a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a1 && a2)
  {
    uint64_t v6 = gaussian1D(3, (uint64_t)v20, 0.5);
    if (v6)
    {
      uint64_t v17 = v6;
    }
    else
    {
      uint64_t v7 = gaussian1D(5, (uint64_t)v19, 3.0);
      if (!v7)
      {
        uint64_t v8 = 0;
        float v9 = 0.0;
        do
        {
          float v10 = 0.0;
          if ((v8 & 0x7FFFFFFFFFFFFFFBLL) != 0) {
            float v10 = v19[v8 + 4];
          }
          float v11 = (float)(v10 - v19[v8]) * a3;
          *(float *)(a1 + 4 * v8) = v11;
          float v9 = fmaxf(v9, v11);
          ++v8;
        }
        while (v8 != 5);
        uint64_t v12 = 0;
        int v13 = (int)fminf(floorf(log2f(fmaxf(60.0 / v9, 1.0))), 16.0);
        float v14 = 0.0;
        do
        {
          float v15 = roundf(*(float *)(a1 + v12) * ldexpf(1.0, v13));
          *(float *)(a1 + v12) = v15;
          float v14 = v14 + v15;
          v12 += 4;
        }
        while (v12 != 20);
        *(float *)(a1 + 8) = *(float *)(a1 + 8) - v14;
        float v16 = exp2f(-(float)v13);
        uint64_t v17 = 0;
        *a2 = v16;
        return v17;
      }
      uint64_t v17 = v7;
    }
    FigDebugAssert3();
    return v17;
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

uint64_t genHorizFirH14(uint64_t a1, float *a2, float a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a1 && a2)
  {
    uint64_t v6 = gaussian1D(3, (uint64_t)v20, 0.6);
    if (v6)
    {
      uint64_t v17 = v6;
    }
    else
    {
      uint64_t v7 = gaussian1D(7, (uint64_t)v19, 3.0);
      if (!v7)
      {
        uint64_t v8 = 0;
        float v9 = 0.0;
        do
        {
          float v10 = 0.0;
          if ((unint64_t)(v8 - 2) <= 2) {
            float v10 = v19[v8 + 5];
          }
          float v11 = (float)(v10 - v19[v8]) * a3;
          *(float *)(a1 + 4 * v8) = v11;
          float v9 = fmaxf(v9, v11);
          ++v8;
        }
        while (v8 != 7);
        uint64_t v12 = 0;
        int v13 = (int)fminf(floorf(log2f(fmaxf(60.0 / v9, 1.0))), 16.0);
        float v14 = 0.0;
        do
        {
          float v15 = roundf(*(float *)(a1 + v12) * ldexpf(1.0, v13));
          *(float *)(a1 + v12) = v15;
          float v14 = v14 + v15;
          v12 += 4;
        }
        while (v12 != 28);
        *(float *)(a1 + 12) = *(float *)(a1 + 12) - v14;
        float v16 = exp2f(-(float)v13);
        uint64_t v17 = 0;
        *a2 = v16;
        return v17;
      }
      uint64_t v17 = v7;
    }
    FigDebugAssert3();
    return v17;
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

double interpExtrap(unint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  unint64_t v4 = a1 - 1;
  if (a1 < 2 || *(float *)(a2 + 4) >= a4)
  {
    unint64_t v5 = 1;
  }
  else
  {
    unint64_t v5 = 0;
    while (a1 - 2 != v5)
    {
      float v6 = *(float *)(a2 + 8 + 4 * v5++);
      if (v6 >= a4) {
        goto LABEL_8;
      }
    }
    unint64_t v5 = a1 - 1;
  }
LABEL_8:
  if (v5 < a1) {
    unint64_t v4 = v5;
  }
  float v7 = *(float *)(a2 + 4 * (v4 - 1));
  float v8 = *(float *)(a2 + 4 * v4);
  if (v7 >= v8)
  {
    FigDebugAssert3();
    return 0.0;
  }
  else
  {
    *(float *)&double result = *(float *)(a3 + 4 * (v4 - 1))
                      + (float)((float)((float)(a4 - v7)
                                      * (float)(*(float *)(a3 + 4 * v4) - *(float *)(a3 + 4 * (v4 - 1))))
                              / (float)(v8 - v7));
  }
  return result;
}

SoftISPModuleCalibration_BlackLevelShadingThumbnail *createBlackLevelShadingThumbnail(SoftISPModuleCalibration_BlackLevelShadingThumbnail *a1, void *a2)
{
  BOOL v2 = a1;
  if (a1)
  {
    id v3 = a2;
    unint64_t v4 = v2;
    BOOL v2 = [[SoftISPModuleCalibration_BlackLevelShadingThumbnail alloc] initWithThumbnailDict:v4 metalContext:v3];
  }

  return v2;
}

uint64_t generateRNFConfigFromRegisters(void *a1, void *a2, float32x2_t *a3)
{
  id v5 = a1;
  id v6 = a2;
  char v60 = 0;
  bzero(a3, 0x370uLL);
  if (!v5 || (-[SoftISPInputFrame registers]((uint64_t)v5), (float v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    uint64_t v54 = FigSignalErrorAt();
    float v10 = 0;
    uint64_t v12 = 0;
    float v44 = 0;
    int v40 = 0;
    float32x4_t v23 = 0;
    float v15 = 0;
    int16x8_t v57 = 0;
    float32x2_t v58 = 0;
LABEL_51:
    long long v59 = 0;
    goto LABEL_45;
  }
  float v8 = v7;
  float v9 = [v7 objectForKeyedSubscript:@"BayerProcRNF"];
  float v10 = v9;
  float32x2_t v58 = v8;
  if (!v9)
  {
    FigDebugAssert3();
    uint64_t v54 = FigSignalErrorAt();
    uint64_t v12 = 0;
    float v44 = 0;
    int v40 = 0;
    float32x4_t v23 = 0;
    float v15 = 0;
    int16x8_t v57 = 0;
    goto LABEL_51;
  }
  float v11 = [v9 objectForKeyedSubscript:@"Config"];
  uint64_t v12 = v11;
  long long v59 = v10;
  if (!v11)
  {
    FigDebugAssert3();
    uint64_t v54 = FigSignalErrorAt();
    float v10 = 0;
    float v44 = 0;
    int v40 = 0;
    float32x4_t v23 = 0;
    float v15 = 0;
    int16x8_t v57 = 0;
    goto LABEL_45;
  }
  char v13 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"Bypass", 0, &v60);
  a3->i8[0] = v13 ^ 1;
  int16x8_t v57 = v12;
  if (!v60) {
    goto LABEL_55;
  }
  if (v13)
  {
    float v10 = 0;
    uint64_t v12 = 0;
    float v44 = 0;
    int v40 = 0;
    float32x4_t v23 = 0;
    float v15 = 0;
LABEL_44:
    uint64_t v54 = 0;
    goto LABEL_45;
  }
  a3->i8[2] = objc_msgSend(v12, "cmi_unsignedIntValueForKey:defaultValue:found:", @"NmLutType", 1, &v60);
  if (!v60
    || (a3->i16[2] = objc_msgSend(v12, "cmi_unsignedIntValueForKey:defaultValue:found:", @"RadScale", 4, &v60),
        !v60)
    || (a3->i8[6] = objc_msgSend(v10, "cmi_unsignedIntValueForKey:defaultValue:found:", @"FirstPix", 1, &v60),
        !v60)
    || (a3[1].i16[0] = objc_msgSend(v10, "cmi_unsignedIntValueForKey:defaultValue:found:", @"ZeroBias", 1, &v60),
        !v60))
  {
LABEL_55:
    FigDebugAssert3();
    uint64_t v54 = FigSignalErrorAt();
    float v10 = 0;
    uint64_t v12 = 0;
    float v44 = 0;
    int v40 = 0;
    float32x4_t v23 = 0;
    float v15 = 0;
    goto LABEL_45;
  }
  float v14 = [v10 objectForKeyedSubscript:@"CoeffBLF"];
  float v15 = v14;
  if (v14 && [v14 count] == 4)
  {
    uint64_t v16 = 0;
    uint64_t v17 = (char *)&a3[1] + 2;
    do
    {
      float v18 = [v15 objectAtIndexedSubscript:v16];
      float v19 = v18;
      if (!v18 || [v18 count] != 3)
      {
        FigDebugAssert3();
        uint64_t v54 = FigSignalErrorAt();

        goto LABEL_47;
      }
      for (uint64_t i = 0; i != 3; ++i)
      {
        uint64_t v21 = [v19 objectAtIndexedSubscript:i];
        *(_WORD *)&v17[2 * i] = [v21 intValue];
      }
      ++v16;
      v17 += 6;
    }
    while (v16 != 4);
    uint64_t v22 = [v59 objectForKeyedSubscript:@"StdDevLUT"];
    float32x4_t v23 = v22;
    if (!v22 || [v22 count] != 33)
    {
      FigDebugAssert3();
      uint64_t v54 = FigSignalErrorAt();
      float v10 = 0;
      uint64_t v12 = 0;
      float v44 = 0;
      int v40 = 0;
      goto LABEL_45;
    }
    uint64_t v56 = (uint64_t)v6;
    id v24 = v5;
    uint64_t v25 = 0;
    uint64_t v26 = (_WORD *)&a3[4] + 1;
    do
    {
      float v27 = [v23 objectAtIndexedSubscript:v25];
      float v28 = v27;
      if (!v27 || [v27 count] != 4)
      {
        FigDebugAssert3();
        uint64_t v54 = FigSignalErrorAt();

        float v10 = 0;
        uint64_t v12 = 0;
        float v44 = 0;
        int v40 = 0;
        id v5 = v24;
        id v6 = (id)v56;
        goto LABEL_45;
      }
      uint64_t v29 = 0;
      uint64_t v30 = v26;
      do
      {
        uint64_t v31 = [v28 objectAtIndexedSubscript:v29];
        _WORD *v30 = [v31 intValue];
        v30 += 33;

        ++v29;
      }
      while (v29 != 4);

      ++v25;
      ++v26;
    }
    while (v25 != 33);
    uint64_t v34 = 0;
    unint64_t v35 = (char *)&a3[4] + 2;
    LODWORD(v32) = 1197408000;
    id v5 = v24;
    id v6 = (id)v56;
    do
    {
      uint64_t v36 = 0;
      float v37 = 0.0;
      float v38 = 0.0;
      do
      {
        LOWORD(v33) = *(_WORD *)&v35[2 * v36];
        float v33 = (float)((float)LODWORD(v33) / 57087.0) * (float)((float)LODWORD(v33) / 57087.0);
        float v37 = v37 + v33;
        float v38 = v38 + (float)((float)((float)lutX[v36++] / 57087.0) * v33);
      }
      while (v36 != 33);
      a3[v34++ + 105] = vmla_n_f32(vmul_n_f32((float32x2_t)0x3EA4D5B0BD945FB9, v38), (float32x2_t)0xBD945FB93D3EE65ALL, v37);
      v35 += 66;
    }
    while (v34 != 4);
    int v39 = objc_msgSend(v59, "objectForKeyedSubscript:", @"RadGainLUT", v32, 0.000000620923284, -4.63249314e-12);
    int v40 = v39;
    if (!v39 || [v39 count] != 257)
    {
      FigDebugAssert3();
      uint64_t v54 = FigSignalErrorAt();
      float v10 = 0;
      uint64_t v12 = 0;
      float v44 = 0;
      goto LABEL_45;
    }
    for (uint64_t j = 0; j != 257; ++j)
    {
      uint64_t v42 = [v40 objectAtIndexedSubscript:j];
      a3[39].i16[j + 2] = [v42 intValue];
    }
    uint64_t v43 = [v59 objectForKeyedSubscript:@"OptCenter"];
    float v44 = v43;
    if (v43
      && (unsigned int v45 = objc_msgSend(v43, "cmi_intValueForKey:defaultValue:found:", @"X0", 0, &v60), v60)
      && (unsigned int v46 = v45, v47 = objc_msgSend(v44, "cmi_intValueForKey:defaultValue:found:", @"Y0", 0, &v60), v60))
    {
      a3[38] = vsub_f32(vcvt_f32_s32((int32x2_t)__PAIR64__(v47, v46)), vcvt_f32_s32((int32x2_t)-[SoftISPBounds processingRegionWithinSensorInReadoutPixels](v56)));
      uint64_t v48 = [v59 objectForKeyedSubscript:@"Prescale"];
      float v10 = v48;
      if (v48)
      {
        __int16 v49 = objc_msgSend(v48, "cmi_intValueForKey:defaultValue:found:", @"PrescaleX", 0, &v60);
        if (v60)
        {
          __int16 v50 = v49;
          __int16 v51 = objc_msgSend(v10, "cmi_intValueForKey:defaultValue:found:", @"PrescaleY", 0, &v60);
          if (v60)
          {
            a3[39].i16[1] = v51;
            a3[39].i16[0] = v50;
            __n64 v52 = [v59 objectForKeyedSubscript:@"ParamBLF"];
            uint64_t v12 = v52;
            if (!v52
              || (a3[104].f32[0] = (float)(unsigned __int16)objc_msgSend(v52, "cmi_unsignedIntValueForKey:defaultValue:found:", @"Knee", 0, &v60)* 0.00097656, !v60)|| (unsigned __int16 v53 = objc_msgSend(v12, "cmi_unsignedIntValueForKey:defaultValue:found:", @"Slope", 0, &v60), a3[104].f32[1] = (float)((1 << ((v53 + 1) >> 1)) + (1 << (v53 >> 1))) * 0.5, !v60))
            {
              FigDebugAssert3();
              uint64_t v54 = FigSignalErrorAt();
              goto LABEL_45;
            }
            goto LABEL_44;
          }
        }
      }
      FigDebugAssert3();
      uint64_t v54 = FigSignalErrorAt();
    }
    else
    {
      FigDebugAssert3();
      uint64_t v54 = FigSignalErrorAt();
      float v10 = 0;
    }
    uint64_t v12 = 0;
    goto LABEL_45;
  }
  FigDebugAssert3();
  uint64_t v54 = FigSignalErrorAt();
LABEL_47:
  float v10 = 0;
  uint64_t v12 = 0;
  float v44 = 0;
  int v40 = 0;
  float32x4_t v23 = 0;
LABEL_45:

  return v54;
}

uint64_t generateRNFConfigFromInputFrameMetadata(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  char v95 = 0;
  char v13 = -[SoftISPInputFrame metadata]((uint64_t)v9);
  if (!v13 || !a4) {
    goto LABEL_62;
  }
  int v14 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"RNF", 1, 0);
  *(unsigned char *)a4 = v14;
  if (!v14)
  {
    uint64_t v48 = 0;
    goto LABEL_58;
  }
  *(unsigned char *)(a4 + 2) = 1;
  *(_DWORD *)(a4 + 312) = 4128831;
  *(void *)(a4 + 832) = 0x4200000000000000;
  *(void *)(a4 + 26) = 0x280032003F0028;
  *(_OWORD *)(a4 + 10) = xmmword_263481D80;
  *(_WORD *)(a4 + 8) = -[SoftISPInputFrame pipelineBlackLevel]((uint64_t)v9);
  *(unsigned char *)(a4 + 6) = -[SoftISPInputFrame firstPixel]((uint64_t)v9);
  objc_msgSend(v13, "cmi_simdUInt2ValueForKey:defaultValue:found:", *MEMORY[0x263F2F5B0], &v95, 0.0);
  if (!v95)
  {
    -[SoftISPInputFrame sensorReadoutRect]((uint64_t)v9);
    __int32 v17 = v16 >> 1;
    -[SoftISPInputFrame sensorReadoutRect]((uint64_t)v9);
    v15.i32[0] = v17;
    v15.i32[1] = v18 >> 33;
  }
  float32x2_t v19 = vsub_f32(vcvt_f32_u32(v15), vcvt_f32_s32((int32x2_t)-[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v10)));
  *(float32x2_t *)(a4 + 304) = v19;
  *(_WORD *)(a4 + 4) = (int)(float)(ceilf(log2f(sqrtf(vaddv_f32(vmul_f32(v19, v19))))) + -8.0);
  LODWORD(v20) = 1.0;
  objc_msgSend(v13, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F538], &v95, v20);
  if (!v95) {
    goto LABEL_62;
  }
  *(_DWORD *)(a4 + 872) = v21;
  unsigned int v22 = objc_msgSend(v13, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F408], 0, &v95);
  if (!v95) {
    goto LABEL_62;
  }
  unsigned int v23 = v22;
  unsigned int v24 = objc_msgSend(v13, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F608], 0, &v95);
  if (!v95) {
    goto LABEL_62;
  }
  unsigned int v25 = v24;
  unsigned int v26 = objc_msgSend(v13, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F610], 0, &v95);
  if (!v95) {
    goto LABEL_62;
  }
  unsigned int v27 = v26;
  unsigned int v28 = objc_msgSend(v13, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F2C0], 0, &v95);
  if (!v95) {
    goto LABEL_62;
  }
  unsigned int v29 = v28;
  float v30 = 1.0;
  if ((objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"Aux", 0, 0) & 1) == 0) {
    float v30 = (float)objc_msgSend(v13, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F6E8], 0, &v95)* 0.0039062;
  }
  if (!v95
    || (__int16 v31 = objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F2E0], 0, &v95), !v95)
    || (__int16 v90 = v31,
        __int16 v32 = objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F2D8], 0, &v95),
        !v95)
    || (__int16 v87 = v32,
        __int16 v33 = objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F2D0], 0, &v95),
        !v95))
  {
LABEL_62:
    FigDebugAssert3();
    uint64_t v48 = FigSignalErrorAt();
    goto LABEL_58;
  }
  __int16 v85 = v33;
  unsigned int v88 = v27;
  unsigned int v89 = v25;
  float v34 = (float)v29 * 0.0039062;
  float v35 = v34 * v30;
  id v36 = v9;
  id v91 = v12;
  id v37 = v12;
  char v96 = 0;
  id v93 = v10;
  id v94 = v9;
  id v92 = v11;
  unsigned int v86 = v23;
  if (!v36)
  {
    uint64_t v48 = FigSignalErrorAt();
    float v38 = 0;
LABEL_65:
    int v39 = 0;
    id v42 = 0;
    uint64_t v43 = 0;
    float v46 = 128.0;
    goto LABEL_30;
  }
  float v38 = -[SoftISPInputFrame metadata]((uint64_t)v36);
  if (!v38)
  {
    uint64_t v48 = FigSignalErrorAt();
    goto LABEL_65;
  }
  int v39 = [v37 tuningParametersForInputFrameMetadata:v38 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v36)];
  if (!v39) {
    FigSignalErrorAt();
  }
  int v40 = [v39 objectForKeyedSubscript:@"RNF"];
  uint64_t v41 = v40;
  if (!v40)
  {
    FigSignalErrorAt();
    uint64_t v41 = (void *)MEMORY[0x263EFFA78];
  }
  id v42 = v41;

  uint64_t v43 = [v42 objectForKey:@"RawNoiseFilterStrength"];
  if (!v43) {
    FigSignalErrorAt();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(float *)&double v44 = v34 * v30;
    objc_msgSend(v43, "cmi_interpolateValueForGain:", v44);
    float v46 = v45;
  }
  else
  {
    objc_msgSend(v42, "cmi_floatValueForKey:defaultValue:found:", @"RawNoiseFilterStrength", &v96, 5.62950094e14);
    float v46 = v47;
    if (!v96) {
      FigSignalErrorAt();
    }
  }
  uint64_t v48 = 0;
LABEL_30:

  if (v48)
  {
LABEL_73:
    FigDebugAssert3();
    goto LABEL_57;
  }
  id v49 = v36;
  id v50 = v37;
  char v97 = 0;
  if (!v36)
  {
    uint64_t v48 = FigSignalErrorAt();
    __int16 v51 = 0;
LABEL_69:
    __n64 v52 = 0;
    id v55 = 0;
    uint64_t v56 = 0;
    float v59 = 128.0;
    goto LABEL_44;
  }
  __int16 v51 = -[SoftISPInputFrame metadata]((uint64_t)v49);
  if (!v51)
  {
    uint64_t v48 = FigSignalErrorAt();
    goto LABEL_69;
  }
  __n64 v52 = [v50 tuningParametersForInputFrameMetadata:v51 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v49)];
  if (!v52) {
    FigSignalErrorAt();
  }
  unsigned __int16 v53 = objc_msgSend(v52, "objectForKeyedSubscript:", @"RNF", v83, v84);
  uint64_t v54 = v53;
  if (!v53)
  {
    FigSignalErrorAt();
    uint64_t v54 = (void *)MEMORY[0x263EFFA78];
  }
  id v55 = v54;

  uint64_t v56 = [v55 objectForKey:@"RawNoiseFilterShadowBoost"];
  if (!v56) {
    FigSignalErrorAt();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(float *)&double v57 = v35;
    objc_msgSend(v56, "cmi_interpolateValueForGain:", v57);
    float v59 = v58;
  }
  else
  {
    objc_msgSend(v55, "cmi_floatValueForKey:defaultValue:found:", @"RawNoiseFilterShadowBoost", &v97, 5.62950094e14);
    float v59 = v60;
    if (!v97) {
      FigSignalErrorAt();
    }
  }
  uint64_t v48 = 0;
LABEL_44:

  if (v48) {
    goto LABEL_73;
  }
  id v61 = v49;
  id v62 = v50;
  char v98 = 0;
  if (v36)
  {
    int v63 = -[SoftISPInputFrame metadata]((uint64_t)v61);
    unsigned int v64 = v88;
    if (v63)
    {
      int v65 = [v62 tuningParametersForInputFrameMetadata:v63 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v61)];
      if (!v65) {
        FigSignalErrorAt();
      }
      int v66 = objc_msgSend(v65, "objectForKeyedSubscript:", @"RNF", v83, v84);
      int v67 = v66;
      if (!v66)
      {
        FigSignalErrorAt();
        int v67 = (void *)MEMORY[0x263EFFA78];
      }
      id v68 = v67;

      *(unsigned char *)(a4 + 1) = objc_msgSend(v68, "cmi_BOOLValueForKey:defaultValue:found:", @"UseLocalMaxForNoiseModel", 0, &v98);
      if (!v98) {
        FigSignalErrorAt();
      }
      uint64_t v48 = 0;
    }
    else
    {
      uint64_t v48 = FigSignalErrorAt();
      int v65 = 0;
      id v68 = 0;
    }
    unsigned int v69 = v89;
  }
  else
  {
    uint64_t v48 = FigSignalErrorAt();
    int v63 = 0;
    int v65 = 0;
    id v68 = 0;
    unsigned int v64 = v88;
    unsigned int v69 = v89;
  }

  if (v48) {
    goto LABEL_73;
  }
  *(unsigned char *)a4 = v46 > 0.0;
  v99.columns[0] = (simd_float2)0x3F82000040000000;
  v99.columns[1] = (simd_float2)0x3F8008003F820000;
  simd_float2x2 v70 = __invert_f2(v99);
  __asm { FMOV            V4.4S, #1.0 }
  _Q4.f32[1] = (float)v90 / (float)v87;
  _Q4.f32[2] = (float)v85 / (float)v87;
  float v76 = (float)(v46 * 0.0078125) * (float)(v46 * 0.0078125);
  float v77 = (float)((float)((float)((float)v86 * 0.000015259) * (float)(v34 * 0.892)) * 0.00097656) * 1.148;
  *(float *)v78.i32 = (float)((float)v69 * 0.000015259) * (float)((float)v69 * 0.000015259);
  float32x2_t v79 = vmla_n_f32((float32x2_t)vdup_lane_s32(v78, 0), (float32x2_t)0x3C8000003F800000, (float)((float)v64 * 0.000015259) * (float)((float)v64 * 0.000015259));
  float32x2_t v80 = vsqrt_f32(vmla_lane_f32(vmul_n_f32((float32x2_t)v70.columns[0], v79.f32[0]), (float32x2_t)v70.columns[1], v79, 1));
  v80.f32[1] = v80.f32[1] / v34;
  v100.val[0] = vmulq_n_f32(vmulq_n_f32(vmulq_n_f32(_Q4, v77 * (float)(v77 * vaddv_f32(vmul_f32(v80, v80)))), v76), (float)(v59 * 0.0078125) * (float)(v59 * 0.0078125));
  v100.val[1] = vmulq_n_f32(vmulq_n_f32(_Q4, v77), v76);
  unsigned int v81 = (float *)(a4 + 840);
  vst2q_f32(v81, v100);
LABEL_57:
  id v10 = v93;
  id v9 = v94;
  id v12 = v91;
  id v11 = v92;
LABEL_58:

  return v48;
}

uint64_t verifyConfig_0(float32x2_t *a1, float32x2_t *a2)
{
  if (a1->u8[2] == a2->u8[2])
  {
    v2.i32[0] = a1[39].u16[0];
    v2.i32[1] = a1[39].u16[1];
    v3.i32[0] = a2[39].u16[0];
    v3.i32[1] = a2[39].u16[1];
    int32x2_t v4 = vceq_s32(v2, v3);
    if ((v4.i8[0] & 1) != 0
      && (v4.i8[4] & 1) != 0
      && a1[104].f32[0] == a2[104].f32[0]
      && a1[104].f32[1] == a2[104].f32[1])
    {
      uint64_t v5 = 0;
      id v6 = (char *)&a1[1] + 2;
      float v7 = (char *)&a2[1] + 2;
LABEL_7:
      uint64_t v8 = 0;
      while (*(unsigned __int16 *)&v6[v8] == *(unsigned __int16 *)&v7[v8])
      {
        v8 += 2;
        if (v8 == 6)
        {
          ++v5;
          v6 += 6;
          v7 += 6;
          if (v5 != 4) {
            goto LABEL_7;
          }
          if (a1[1].u16[0] == a2[1].u16[0] && a1->u8[6] == a2->u8[6])
          {
            int8x8_t v9 = vmvn_s8((int8x8_t)vceq_f32(a1[38], a2[38]));
            if ((v9.i8[0] & 1) == 0 && (v9.i8[4] & 1) == 0 && a1->u16[2] == a2->u16[2]) {
              return 0;
            }
          }
          break;
        }
      }
    }
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

void __copy_assignment_8_8_t0w136_s136_s144(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v4 = *(_OWORD *)(a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  long long v6 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v6;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = v5;
  long long v7 = *(_OWORD *)(a2 + 80);
  long long v8 = *(_OWORD *)(a2 + 96);
  long long v9 = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v8;
  *(_OWORD *)(a1 + 112) = v9;
  *(_OWORD *)(a1 + 80) = v7;
  objc_storeStrong((id *)(a1 + 136), *(id *)(a2 + 136));
  id v10 = *(void **)(a2 + 144);

  objc_storeStrong((id *)(a1 + 144), v10);
}

void sub_26332357C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  for (uint64_t i = 80; i != -16; i -= 48)
    objc_destroyWeak((id *)(&a18 + i));
  for (uint64_t j = 56; j != -16; j -= 24)

  _Unwind_Resume(a1);
}

void sub_263323F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  for (uint64_t i = 176; i != -16; i -= 48)
    objc_destroyWeak((id *)(&a27 + i));
  for (uint64_t j = 128; j != -16; j -= 24)

  _Unwind_Resume(a1);
}

void sub_26332470C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  for (uint64_t i = 176; i != -16; i -= 48)
    objc_destroyWeak((id *)(&a24 + i));
  for (uint64_t j = 104; j != -16; j -= 24)

  _Unwind_Resume(a1);
}

void sub_2633340D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  for (uint64_t i = 80; i != -16; i -= 48)
    objc_destroyWeak((id *)(v59 - 216 + i));
  for (uint64_t j = 104; j != -16; j -= 24)

  _Unwind_Resume(a1);
}

id mapFPAuxTypeObjToString(void *a1)
{
  uint64_t v1 = mapFPAuxTypeObjToString_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&mapFPAuxTypeObjToString_onceToken, &__block_literal_global_6);
  }
  int32x2_t v3 = [(id)mapFPAuxTypeObjToString_auxTypeNameMap objectForKeyedSubscript:v2];

  return v3;
}

void __mapFPAuxTypeObjToString_block_invoke()
{
  v3[2] = *MEMORY[0x263EF8340];
  v2[0] = &unk_270E98BC0;
  v2[1] = &unk_270E98BD8;
  v3[0] = @"H0";
  v3[1] = @"H1";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:2];
  uint64_t v1 = (void *)mapFPAuxTypeObjToString_auxTypeNameMap;
  mapFPAuxTypeObjToString_auxTypeNameMap = v0;
}

id mapFPAuxTypeToString(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedInt:a1];
  id v2 = mapFPAuxTypeObjToString(v1);

  return v2;
}

BOOL isRecognizedFPAuxType(uint64_t a1)
{
  uint64_t v1 = mapFPAuxTypeToString(a1);
  BOOL v2 = v1 != 0;

  return v2;
}

uint64_t containsRecognizedFPAuxType(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v8 != v3) {
          objc_enumerationMutation(v1);
        }
        long long v5 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && isRecognizedFPAuxType(objc_msgSend(v5, "unsignedIntValue", (void)v7)))
        {
          uint64_t v2 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v2;
}

H13FastLumaSharpeningStage *createH13FastSushiRawMBNRYUVPipeline(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  unsigned int v20 = 0;
  long long v7 = [[H13FastRawScaleStage alloc] initWithMetalContext:v5 staticParameters:v6];
  if (!v7)
  {
    FigDebugAssert3();
    long long v8 = 0;
LABEL_50:
    long long v9 = 0;
LABEL_52:
    long long v10 = 0;
LABEL_54:
    id v11 = 0;
LABEL_56:
    __int32 v17 = 0;
LABEL_57:
    float32x2_t v19 = 0;
    goto LABEL_58;
  }
  long long v8 = [[H13FastBayerProcStage alloc] initWithMetalContext:v5 staticParameters:v6];
  if (!v8)
  {
    FigDebugAssert3();
    goto LABEL_50;
  }
  long long v9 = [[H13FastRawMBNRStage alloc] initWithMetalContext:v5 staticParameters:v6];
  if (!v9)
  {
    FigDebugAssert3();
    goto LABEL_52;
  }
  long long v10 = [[H13FastDemosaicStage alloc] initWithMetalContext:v5 staticParameters:v6 outputGammaEncoded:1];
  if (!v10)
  {
    FigDebugAssert3();
    goto LABEL_54;
  }
  id v11 = [[H13FastPostDemosaicProcStage alloc] initWithMetalContext:v5 staticParameters:v6];
  if (!v11)
  {
    FigDebugAssert3();
    goto LABEL_56;
  }
  uint64_t v12 = [[H13FastLumaSharpeningStage alloc] initWithMetalContext:v5 staticParameters:v6];
  if (!v12)
  {
    FigDebugAssert3();
    __int32 v17 = 0;
    unint64_t v18 = 0;
    float32x2_t v19 = 0;
    int v14 = 0;
    goto LABEL_43;
  }
  float32x2_t v19 = [[H13FastLTMStage alloc] initWithMetalContext:v5 staticParameters:v6 error:&v20];
  __int32 v17 = v12;
  if (!v19)
  {
    FigDebugAssert3();
    goto LABEL_57;
  }
  if (v20)
  {
    FigSignalErrorAt();
    goto LABEL_58;
  }
  if (a3)
  {
    unint64_t v18 = [[LocalToneMappingStage alloc] initWithMetalContext:v5 staticParameters:v6];
    if (!v18)
    {
      FigDebugAssert3();
LABEL_58:
      unint64_t v18 = 0;
      int v14 = 0;
LABEL_63:
      uint64_t v12 = 0;
      goto LABEL_43;
    }
  }
  else
  {
    unint64_t v18 = 0;
  }
  uint64_t v13 = objc_opt_new();
  int v14 = (id *)v13;
  if (!v13) {
    goto LABEL_62;
  }
  unsigned int v20 = -[SoftISPGraph addStage:withName:](v13, v7, @"RawScale");
  if (v20) {
    goto LABEL_62;
  }
  unsigned int v20 = -[SoftISPGraph addStage:withName:]((uint64_t)v14, v8, @"BayerProc");
  if (v20) {
    goto LABEL_62;
  }
  unsigned int v20 = -[SoftISPGraph addStage:withName:]((uint64_t)v14, v9, @"RawMBNR");
  if (v20) {
    goto LABEL_62;
  }
  unsigned int v20 = -[SoftISPGraph addStage:withName:]((uint64_t)v14, v10, @"DemYUV");
  if (v20) {
    goto LABEL_62;
  }
  unsigned int v20 = -[SoftISPGraph addStage:withName:]((uint64_t)v14, v11, @"PostDemProc");
  if (v20) {
    goto LABEL_62;
  }
  unsigned int v20 = -[SoftISPGraph addStage:withName:]((uint64_t)v14, v12, @"LumaSharpening");
  if (v20) {
    goto LABEL_62;
  }
  unsigned int v20 = -[SoftISPGraph addStage:withName:]((uint64_t)v14, v19, @"ComputeLTM");
  if (v20) {
    goto LABEL_62;
  }
  if (a3)
  {
    unsigned int v20 = -[SoftISPGraph addStage:withName:]((uint64_t)v14, v18, @"ApplyLTM");
    if (v20) {
      goto LABEL_62;
    }
  }
  unsigned int v20 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v14, @"<input>", @"inputTex", @"RawScale", @"inputTex");
  if (v20)
  {
LABEL_62:
    FigSignalErrorAt();
    goto LABEL_63;
  }
  unsigned int v20 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v14, @"RawScale", @"outputTex", @"BayerProc", @"inputTex");
  if (v20) {
    goto LABEL_64;
  }
  unsigned int v20 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:isNullable:](v14, @"RawScale", @"outputSyntheticThumbnailTex", @"BayerProc", @"inputSyntheticThumbnailTex", 1);
  if (v20) {
    goto LABEL_64;
  }
  unsigned int v20 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v14, @"BayerProc", @"outputTex", @"RawMBNR", @"inputTex");
  if (v20) {
    goto LABEL_64;
  }
  unsigned int v20 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v14, @"RawMBNR", @"outputTex", @"DemYUV", @"inputTex");
  if (v20) {
    goto LABEL_64;
  }
  unsigned int v20 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v14, @"DemYUV", @"outputLumaTex", @"PostDemProc", @"inputLumaTex");
  if (v20) {
    goto LABEL_64;
  }
  unsigned int v20 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v14, @"DemYUV", @"outputChromaTex", @"PostDemProc", @"inputChromaTex");
  if (v20) {
    goto LABEL_64;
  }
  unsigned int v20 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v14, @"PostDemProc", @"outputLumaTex", @"LumaSharpening", @"inputLumaTex");
  if (v20) {
    goto LABEL_64;
  }
  unsigned int v20 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v14, @"LumaSharpening", @"outputLumaTex", @"ComputeLTM", @"inputLumaTex");
  if (v20) {
    goto LABEL_64;
  }
  unsigned int v20 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v14, @"PostDemProc", @"outputChromaTex", @"ComputeLTM", @"inputChromaTex");
  if (v20) {
    goto LABEL_64;
  }
  if (a3)
  {
    unsigned int v20 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v14, @"LumaSharpening", @"outputLumaTex", @"ApplyLTM", @"inputLumaTex");
    if (v20) {
      goto LABEL_64;
    }
    unsigned int v20 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v14, @"PostDemProc", @"outputChromaTex", @"ApplyLTM", @"inputChromaTex");
    if (v20) {
      goto LABEL_64;
    }
    unsigned int v20 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v14, @"ApplyLTM", @"outputLumaTex", @"<output>", @"outputLumaTex");
    if (v20) {
      goto LABEL_64;
    }
    uint32x2_t v15 = @"ApplyLTM";
  }
  else
  {
    unsigned int v20 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v14, @"LumaSharpening", @"outputLumaTex", @"<output>", @"outputLumaTex");
    if (v20)
    {
LABEL_64:
      FigSignalErrorAt();
      uint64_t v12 = 0;
      goto LABEL_43;
    }
    uint32x2_t v15 = @"PostDemProc";
  }
  unsigned int v20 = -[SoftISPGraph addConnectionFromStage:fromProperty:toStage:toProperty:](v14, v15, @"outputChromaTex", @"<output>", @"outputChromaTex");
  if (v20) {
    goto LABEL_64;
  }
  uint64_t v12 = [[SoftISPPipeline alloc] initWithGraph:v14 metal:v5 staticParameters:v6];
  if (!v12) {
    FigSignalErrorAt();
  }
LABEL_43:

  return v12;
}

uint64_t compareGOCConfig(uint64_t result, float32x4_t *a2)
{
  uint64_t v3 = (float32x4_t *)result;
  if (*(_DWORD *)(result + 4) != a2->i32[1])
  {
    FigDebugAssert3();
    double result = FigSignalErrorAt();
  }
  if ((vminvq_u32((uint32x4_t)vceqq_f32(v3[1], a2[1])) & 0x80000000) == 0)
  {
    FigDebugAssert3();
    double result = FigSignalErrorAt();
  }
  if ((vminvq_u32((uint32x4_t)vceqq_f32(v3[2], a2[2])) & 0x80000000) == 0)
  {
    FigDebugAssert3();
    double result = FigSignalErrorAt();
  }
  if ((vminvq_u32((uint32x4_t)vceqq_f32(v3[4], a2[4])) & 0x80000000) == 0)
  {
    FigDebugAssert3();
    double result = FigSignalErrorAt();
  }
  v4.i64[0] = 0x3A0000003A000000;
  v4.i64[1] = 0x3A0000003A000000;
  if ((vminvq_u32((uint32x4_t)vcgeq_f32(v4, vabdq_f32(v3[5], a2[5]))) & 0x80000000) == 0)
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

uint64_t compareHRConfig(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 == *(_DWORD *)a2
    && *(_DWORD *)(a1 + 4) == *(_DWORD *)(a2 + 4)
    && *(unsigned __int16 *)(a1 + 8) == *(unsigned __int16 *)(a2 + 8)
    && *(unsigned __int16 *)(a1 + 10) == *(unsigned __int16 *)(a2 + 10)
    && *(unsigned __int8 *)(a1 + 12) == *(unsigned __int8 *)(a2 + 12)
    && *(unsigned __int8 *)(a1 + 13) == *(unsigned __int8 *)(a2 + 13)
    && *(unsigned __int8 *)(a1 + 14) == *(unsigned __int8 *)(a2 + 14)
    && *(unsigned __int8 *)(a1 + 15) == *(unsigned __int8 *)(a2 + 15)
    && *(unsigned __int8 *)(a1 + 16) == *(unsigned __int8 *)(a2 + 16)
    && *(unsigned __int8 *)(a1 + 17) == *(unsigned __int8 *)(a2 + 17)
    && *(unsigned __int16 *)(a1 + 20) == *(unsigned __int16 *)(a2 + 20))
  {
    return 0;
  }
  else
  {
    return FigSignalErrorAt();
  }
}

uint64_t VisionLibraryCore()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = VisionLibraryCore_frameworkLibrary_3;
  uint64_t v5 = VisionLibraryCore_frameworkLibrary_3;
  if (!VisionLibraryCore_frameworkLibrary_3)
  {
    long long v6 = xmmword_2655C83F8;
    long long v7 = *(_OWORD *)&off_2655C8408;
    void v3[3] = _sl_dlopen();
    VisionLibraryCore_frameworkLibrary_3 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_26333F5CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __VisionLibraryCore_block_invoke_3(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  VisionLibraryCore_frameworkLibrary_3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t VisionLibrary()
{
  uint64_t v0 = VisionLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getVNImageRequestHandlerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNImageRequestHandlerClass_softClass;
  uint64_t v7 = getVNImageRequestHandlerClass_softClass;
  if (!getVNImageRequestHandlerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getVNImageRequestHandlerClass_block_invoke;
    void v3[3] = &unk_2655C7BC0;
    v3[4] = &v4;
    __getVNImageRequestHandlerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_26333F79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNImageRequestHandlerClass_block_invoke(uint64_t a1)
{
  VisionLibrary();
  Class result = objc_getClass("VNImageRequestHandler");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNImageRequestHandlerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getVNImageRequestHandlerClass_block_invoke_cold_1();
    return (Class)getVNDetectFaceRectanglesRequestClass(v3);
  }
  return result;
}

id getVNDetectFaceRectanglesRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNDetectFaceRectanglesRequestClass_softClass;
  uint64_t v7 = getVNDetectFaceRectanglesRequestClass_softClass;
  if (!getVNDetectFaceRectanglesRequestClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getVNDetectFaceRectanglesRequestClass_block_invoke;
    void v3[3] = &unk_2655C7BC0;
    v3[4] = &v4;
    __getVNDetectFaceRectanglesRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_26333F8D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNDetectFaceRectanglesRequestClass_block_invoke(uint64_t a1)
{
  VisionLibrary();
  Class result = objc_getClass("VNDetectFaceRectanglesRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNDetectFaceRectanglesRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getVNDetectFaceRectanglesRequestClass_block_invoke_cold_1();
    return (Class)getVNSessionClass(v3);
  }
  return result;
}

id getVNSessionClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNSessionClass_softClass;
  uint64_t v7 = getVNSessionClass_softClass;
  if (!getVNSessionClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getVNSessionClass_block_invoke;
    void v3[3] = &unk_2655C7BC0;
    v3[4] = &v4;
    __getVNSessionClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_26333FA14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNSessionClass_block_invoke(uint64_t a1)
{
  VisionLibrary();
  Class result = objc_getClass("VNSession");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNSessionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVNSessionClass_block_invoke_cold_1();
    return (Class)__getVNImageRequestHandlerClass_block_invoke_cold_1();
  }
  return result;
}

uint64_t __getVNImageRequestHandlerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNDetectFaceRectanglesRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getVNDetectFaceRectanglesRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNSessionClass_block_invoke_cold_1(v0);
}

MTLComputePipelineState *__getVNSessionClass_block_invoke_cold_1()
{
  uint64_t v0 = (H13FastDemosaicShaders *)abort_report_np();
  return [(H13FastDemosaicShaders *)v0 zimmerDemosaicStage_Bayer_RB_RGB];
}

uint64_t frameIdFromPath(void *a1)
{
  int v16 = 0;
  SEL v1 = (void *)MEMORY[0x263F08AE8];
  id v2 = a1;
  uint64_t v3 = [v1 regularExpressionWithPattern:@"_TM_\\d\\d.|_B\\d\\d.|_F\\d\\d.|_PB.|_FL.|_AmbientFL." options:0 error:0];
  uint64_t v4 = [v2 absoluteString];

  uint64_t v5 = objc_msgSend(v3, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  uint64_t v7 = objc_msgSend(v4, "substringWithRange:", v5, v6);
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:v7];
  long long v9 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"_"];
  [v8 setCharactersToBeSkipped:v9];

  long long v10 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"BMPTFL"];
  id v15 = 0;
  int v11 = [v8 scanCharactersFromSet:v10 intoString:&v15];
  id v12 = v15;

  if (v11)
  {
    [v8 scanInt:&v16];
    if ([v12 isEqualToString:@"PB"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"AmbientFL"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"FL"])
    {
      uint64_t v13 = 2;
    }
    else if ([v12 isEqualToString:@"TM"])
    {
      uint64_t v13 = (v16 + 100);
    }
    else if ([v12 isEqualToString:@"B"])
    {
      uint64_t v13 = (v16 + 200);
    }
    else if ([v12 isEqualToString:@"F"])
    {
      uint64_t v13 = (v16 + 300);
    }
    else
    {
      uint64_t v13 = 4294967294;
    }
  }
  else
  {
    uint64_t v13 = 0xFFFFFFFFLL;
  }

  return v13;
}

uint64_t gaussian1D(uint64_t a1, uint64_t a2, float a3)
{
  if (a1 && (a1 & 1) != 0 && (float v3 = a3 * a3, v3 > 0.0))
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    unint64_t v7 = (unint64_t)(a1 - 1) >> 1;
    uint64_t v8 = a2 + 4 * v7;
    float v9 = 0.0;
    float v10 = -0.5 / v3;
    do
    {
      float v11 = expf(v10 * (float)((float)v6 * (float)v6));
      *(float *)(v8 + 4 * v6) = v11;
      float v9 = v9 + v11;
      if (v6)
      {
        *(float *)(v8 + v5) = v11;
        float v9 = v11 + v9;
      }
      ++v6;
      v5 -= 4;
    }
    while (v7 + 1 != v6);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = a2 + 4 * v7;
    float v15 = 1.0 / v9;
    do
    {
      *(float *)(v14 + 4 * v13) = v15 * *(float *)(v14 + 4 * v13);
      if (v13) {
        *(float *)(v14 + v12) = v15 * *(float *)(v14 + v12);
      }
      ++v13;
      v12 -= 4;
    }
    while (v7 + 1 != v13);
    return 0;
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

uint64_t SoftISPRectIntersection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (uint64_t)vmax_s32((int32x2_t)a1, (int32x2_t)a3);
}

uint64_t mapStringToPixelType(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"H0"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"H1"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"V0"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"V1"])
  {
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

float PatternCompareYX(uint64_t a1, uint64_t a2)
{
  v2.i32[0] = *(unsigned __int16 *)(a1 + 4);
  v2.i32[1] = *(unsigned __int16 *)(a1 + 6);
  v3.i32[0] = *(unsigned __int16 *)(a2 + 4);
  v3.i32[1] = *(unsigned __int16 *)(a2 + 6);
  __int32 v4 = vceq_s32(v2, v3).i32[1];
  int8x8_t v5 = (int8x8_t)vzip2_s32(v3, v2);
  int8x8_t v6 = (int8x8_t)vzip1_s32(v3, v2);
  if (v4) {
    unsigned int v7 = -1;
  }
  else {
    unsigned int v7 = 0;
  }
  int32x2_t v8 = (int32x2_t)vbsl_s8((int8x8_t)vdup_n_s32(v7), v6, v5);
  LODWORD(result) = vsub_s32(vdup_lane_s32(v8, 1), v8).u32[0];
  return result;
}

uint64_t generatePDPGainsFromInputFrameMetadata(void *a1, void *a2, void *a3, void *a4)
{
  BOOL v107 = a4;
  v125[4] = *MEMORY[0x263EF8340];
  id v6 = a1;
  id v7 = a2;
  id v8 = a3;
  id v117 = [MEMORY[0x263EFF9A0] dictionary];
  v124[0] = @"H0";
  float v9 = [MEMORY[0x263EFF9A0] dictionary];
  v125[0] = v9;
  v124[1] = @"H1";
  float v10 = [MEMORY[0x263EFF9A0] dictionary];
  v125[1] = v10;
  v124[2] = @"V0";
  float v11 = [MEMORY[0x263EFF9A0] dictionary];
  v125[2] = v11;
  v124[3] = @"V1";
  uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
  v125[3] = v12;
  id v116 = [NSDictionary dictionaryWithObjects:v125 forKeys:v124 count:4];

  uint64_t v13 = [v8 objectAtIndexedSubscript:0];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"Map"];
  uint64_t v15 = [v14 count];

  id v113 = [MEMORY[0x263EFF990] dataWithLength:4 * v15];
  uint64_t v16 = [v113 mutableBytes];
  __int32 v17 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F740]];
  id v112 = v17;
  if (!v17)
  {
    FigDebugAssert3();
    uint64_t v104 = FigSignalErrorAt();
LABEL_66:
    id v102 = 0;
    goto LABEL_59;
  }
  unint64_t v18 = [MEMORY[0x263EFF990] dataWithLength:4624];
  if (!v18)
  {
    FigDebugAssert3();
    uint64_t v104 = FigSignalErrorAt();
    __int32 v17 = 0;
    goto LABEL_66;
  }
  id v111 = v18;
  uint64_t v120 = [v111 mutableBytes];
  uint64_t v121 = v120 + 1156;
  uint64_t v122 = v120 + 2312;
  uint64_t v123 = v120 + 3468;
  unsigned int v19 = -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v6);
  -[SoftISPInputFrame sensorCropRect]((uint64_t)v6);
  uint64_t v21 = v20;
  unsigned int v22 = (int *)[v17 bytes];
  int v36 = *v22;
  if ((*v22 - 1) >= 2)
  {
    FigDebugAssert3();
    uint64_t v104 = FigSignalErrorAt();
    __int32 v17 = 0;
    goto LABEL_63;
  }
  double v37 = (double)(v21 / v19);
  double v38 = (double)(HIDWORD(v21) / v19);
  id v114 = v8;
  id v110 = v6;
  id v109 = v7;
  if (v36 != 2)
  {
    if (v36 == 1)
    {
      __int32 v17 = 0;
      uint64_t v39 = 0;
      int v40 = v22 + 1;
      uint64_t v41 = v22 + 18;
      while (1)
      {
        id v42 = (unsigned __int8 *)&v40[65 * v39];
        unint64_t v43 = v42[1] * (unint64_t)*v42;
        if (v43)
        {
          if (v43 >= 0x61) {
            goto LABEL_60;
          }
          double v44 = (unsigned __int8 *)MEMORY[0x270FA5388](v42, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35);
          float v47 = (char *)&v106 - v46;
          uint64_t v48 = 0;
          do
          {
            *(_DWORD *)&v47[4 * v48] = *((unsigned __int16 *)v41 + v48);
            ++v48;
          }
          while (v45 != v48);
          id v119 = v17;
          resizeFocusPixelMap(v44, (uint64_t)v47, &v119, 17.0, 17.0, v37, v38);
          id v49 = v119;

          if ([v49 length] != 1156) {
            goto LABEL_61;
          }
          id v50 = [&unk_270E981B8 objectAtIndexedSubscript:v39];
          [v117 setObject:v49 forKeyedSubscript:v50];

          __int32 v17 = v49;
        }
        else
        {
          id v49 = v17;
        }
        ++v39;
        v41 += 65;
        if (v39 == 4) {
          goto LABEL_27;
        }
      }
    }
    id v49 = 0;
LABEL_27:
    id v62 = v114;
    uint64_t v63 = [v114 count];
    id v115 = v49;
    if (!v63)
    {
      unsigned int v108 = 0;
LABEL_41:
      for (unint64_t i = 0; i != 4; ++i)
      {
        int32x2_t v78 = [&unk_270E981B8 objectAtIndexedSubscript:i];
        id v79 = [v117 objectForKeyedSubscript:v78];
        float32x2_t v80 = (int *)[v79 bytes];

        if (v80)
        {
          id v81 = v116;
          uint64_t v82 = [v116 objectForKeyedSubscript:v78];
          uint64_t v83 = [v82 objectForKeyedSubscript:@"ZNVM"];
          unsigned int v84 = [v83 intValue];

          __int16 v85 = [v81 objectForKeyedSubscript:v78];
          id v86 = [v85 objectForKeyedSubscript:@"X"];
          [v86 bytes];

          __int16 v87 = [v81 objectForKeyedSubscript:v78];
          id v88 = [v87 objectForKeyedSubscript:@"Y"];
          [v88 bytes];

          unsigned int v89 = [v81 objectForKeyedSubscript:v78];
          id v90 = [v89 objectForKeyedSubscript:@"InvZ"];
          id v91 = (int *)[v90 bytes];

          id v49 = v115;
          int v92 = i >= 2 ? i : 1 - (int)i;
          if (v15)
          {
            id v93 = (unsigned int *)*(&v120 + i);
            id v94 = (unsigned int *)*(&v120 + v92);
            int v95 = (int)(float)(INFINITY - (float)(0x80000 / v84));
            if (v95 >= 0x7FFF) {
              int v95 = 0x7FFF;
            }
            if (v95 <= -32768) {
              int v95 = -32768;
            }
            int v96 = 2 * v95;
            uint64_t v97 = v15;
            do
            {
              int v99 = *v80++;
              int v98 = v99;
              int v100 = *v91++;
              int v101 = (v98 - (__int16)((v98 * ((v96 * v100) >> 16)) >> 15) + 2) >> 2;
              if (v101 >= 1023) {
                LOWORD(v101) = 1023;
              }
              unsigned int *v93 = *v93 & 0xFFFFFC00 | v101 & 0x3FF;
              ++v93;
              unsigned int *v94 = *v94 & 0xFFF003FF | ((v101 & 0x3FF) << 10);
              ++v94;
              --v97;
            }
            while (v97);
          }
        }
      }
      swapSlice01RB(v120, v121);
      id v102 = v111;
      id v103 = [MEMORY[0x263EFF8F8] dataWithData:v111];
      void *v107 = v103;
      __int32 v17 = v49;
      id v6 = v110;
      id v7 = v109;
      id v8 = v114;
LABEL_58:
      uint64_t v104 = v108;
      goto LABEL_59;
    }
    unint64_t v64 = 0;
    unsigned int v108 = 0;
    while (1)
    {
      int v65 = [v62 objectAtIndexedSubscript:v64];
      int v66 = [v65 objectForKeyedSubscript:@"PixelType"];
      int v67 = [v65 objectForKeyedSubscript:@"Model"];
      id v68 = [v65 objectForKeyedSubscript:@"Map"];
      if (v15)
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          simd_float2x2 v70 = [v68 objectAtIndexedSubscript:j];
          *(_DWORD *)(v16 + 4 * j) = [v70 intValue];
        }
      }
      uint64_t v71 = [MEMORY[0x263EFF8F8] dataWithData:v113];
      uint64_t v72 = [v116 objectForKeyedSubscript:v66];
      [v72 setObject:v71 forKeyedSubscript:v67];

      if (([v67 isEqualToString:@"InvZ"] & 1) == 0) {
        goto LABEL_35;
      }
      uint64_t v73 = [v65 objectForKey:@"ZNVM"];

      if (v73) {
        break;
      }
      FigDebugAssert3();
      unsigned int v108 = FigSignalErrorAt();
LABEL_36:

      if ((v73 & 1) == 0)
      {
        __int32 v17 = v49;
        id v6 = v110;
        id v7 = v109;
        id v8 = v114;
        id v102 = v111;
        goto LABEL_58;
      }
      ++v64;
      id v62 = v114;
      if ([v114 count] <= v64) {
        goto LABEL_41;
      }
    }
    uint64_t v74 = [v65 objectForKeyedSubscript:@"ZNVM"];
    long long v75 = [v65 objectForKeyedSubscript:@"PixelType"];
    float v76 = [v116 objectForKeyedSubscript:v75];
    [v76 setObject:v74 forKeyedSubscript:@"ZNVM"];

    id v49 = v115;
LABEL_35:
    LOBYTE(v73) = 1;
    goto LABEL_36;
  }
  __int32 v17 = 0;
  uint64_t v51 = 0;
  __n64 v52 = v22 + 1;
  unsigned __int16 v53 = v22 + 18;
  while (1)
  {
    uint64_t v54 = (unsigned __int8 *)&v52[145 * v51];
    unint64_t v55 = v54[1] * (unint64_t)*v54;
    if (!v55)
    {
      id v49 = v17;
      goto LABEL_24;
    }
    if (v55 >= 0x101)
    {
LABEL_60:
      FigDebugAssert3();
      uint64_t v104 = FigSignalErrorAt();
      goto LABEL_62;
    }
    uint64_t v56 = (unsigned __int8 *)MEMORY[0x270FA5388](v54, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35);
    uint64_t v59 = (char *)&v106 - v58;
    uint64_t v60 = 0;
    do
    {
      *(_DWORD *)&v59[4 * v60] = *((unsigned __int16 *)v53 + v60);
      ++v60;
    }
    while (v57 != v60);
    id v118 = v17;
    resizeFocusPixelMap(v56, (uint64_t)v59, &v118, 17.0, 17.0, v37, v38);
    id v49 = v118;

    if ([v49 length] != 1156) {
      break;
    }
    id v61 = [&unk_270E981B8 objectAtIndexedSubscript:v51];
    [v117 setObject:v49 forKeyedSubscript:v61];

    __int32 v17 = v49;
LABEL_24:
    ++v51;
    v53 += 145;
    if (v51 == 4) {
      goto LABEL_27;
    }
  }
LABEL_61:
  FigDebugAssert3();
  uint64_t v104 = FigSignalErrorAt();
  __int32 v17 = v49;
LABEL_62:
  id v6 = v110;
  id v7 = v109;
  id v8 = v114;
LABEL_63:
  id v102 = v111;
LABEL_59:

  return v104;
}

uint64_t swapSlice01RB(uint64_t result, uint64_t a2)
{
  for (uint64_t i = 0; i != 1156; i += 4)
  {
    int v3 = *(_DWORD *)(result + i);
    int v4 = *(_DWORD *)(a2 + i);
    *(_DWORD *)(result + i) = v3 & 0xFFF003FF;
    *(_DWORD *)(a2 + i) &= 0xFFF003FF;
    *(_DWORD *)(result + i) |= v4 & 0xFFC00;
    *(_DWORD *)(a2 + i) |= v3 & 0xFFC00;
  }
  return result;
}

uint64_t resizeFocusPixelMap(unsigned __int8 *a1, uint64_t a2, void *a3, double a4, double a5, double a6, double a7)
{
  uint64_t v12 = a1[1];
  unint64_t v48 = (unint64_t)a5;
  unint64_t v13 = (unint64_t)a4;
  uint64_t v47 = *a1;
  if (!a1[1])
  {
    uint64_t v44 = v7;
    LODWORD(v43) = 0;
    goto LABEL_35;
  }
  if (!*a1)
  {
    uint64_t v44 = v7;
    LODWORD(v43) = 0;
    goto LABEL_35;
  }
  if (v48 <= 1)
  {
    uint64_t v44 = v7;
    LODWORD(v43) = 0;
    goto LABEL_35;
  }
  if (v13 <= 1)
  {
    uint64_t v44 = v7;
    LODWORD(v43) = 0;
LABEL_35:
    FigDebugAssert3();
    uint64_t result = FigSignalErrorAt();
    if (result) {
      return result;
    }
  }
  objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", 4 * v48 * v13, v43, v44);
  id v45 = objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v45 mutableBytes];
  if (v48)
  {
    uint64_t v15 = 0;
    unint64_t v16 = 0;
    int v17 = 0;
    unint64_t v18 = a1 + 4;
    unsigned int v19 = a1 + 36;
    uint64_t v20 = a1 + 38;
    uint64_t v21 = a1 + 6;
    do
    {
      unint64_t v22 = v16;
      if (v16 <= v12 - 2) {
        unint64_t v16 = v12 - 2;
      }
      while (v16 != v22)
      {
        unint64_t v23 = v22 + 1;
        int v24 = *(__int16 *)&v20[2 * v22++];
        if (v17 < v24)
        {
          unint64_t v16 = v23 - 1;
          goto LABEL_13;
        }
      }
      unint64_t v23 = v16 + 1;
      int v24 = *(__int16 *)&v19[2 * v16 + 2];
LABEL_13:
      int v25 = *(__int16 *)&v19[2 * v16];
      int v26 = v24 - v25;
      if (v17 - v25 >= v26) {
        int v27 = v26;
      }
      else {
        int v27 = v17 - v25;
      }
      if (v13)
      {
        uint64_t v28 = 0;
        int v29 = 0;
        unint64_t v30 = 0;
        int v31 = v27 & ~(v27 >> 31);
        unint64_t v32 = v23 * v47;
        do
        {
          unint64_t v33 = v30;
          if (v30 <= v47 - 2) {
            unint64_t v30 = v47 - 2;
          }
          while (v30 != v33)
          {
            unint64_t v34 = v33 + 1;
            int v35 = *(__int16 *)&v21[2 * v33++];
            if (v29 < v35)
            {
              unint64_t v30 = v34 - 1;
              goto LABEL_24;
            }
          }
          int v35 = *(__int16 *)&v18[2 * v30 + 2];
LABEL_24:
          int v36 = *(__int16 *)&v18[2 * v30];
          int v37 = v29 - v36;
          int v38 = v35 - v36;
          if (v37 >= v38) {
            int v39 = v38;
          }
          else {
            int v39 = v37;
          }
          int v40 = v39 & ~(v39 >> 31);
          *(_DWORD *)(v14 + 4 * (v28 + v15 * v13)) = ((v40 * *(_DWORD *)(a2 + 4 * (v30 + v16 * v47) + 4)
                                                     + (v38 - v40) * *(_DWORD *)(a2 + 4 * (v30 + v16 * v47)))
                                                    / v38
                                                    * (v26 - v31)
                                                    + (*(_DWORD *)(a2 + 4 * (v30 + v32) + 4) * v40
                                                     + (v38 - v40) * *(_DWORD *)(a2 + 4 * (v30 + v32)))
                                                    / v38
                                                    * v31)
                                                   / v26;
          v29 += (int)(a6 / (double)(v13 - 1));
          ++v28;
        }
        while (v28 != v13);
      }
      v17 += (int)(a7 / (double)(v48 - 1));
      ++v15;
    }
    while (v15 != v48);
  }
  id v41 = v45;
  *a3 = v41;

  return 0;
}

uint64_t interp1f(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  if (a5)
  {
    uint64_t v7 = 0;
    for (uint64_t i = 0; i != a5; ++i)
    {
      unsigned int v9 = *(_DWORD *)(a4 + 4 * i);
      uint64_t v10 = v7;
      do
      {
        uint64_t v7 = v10;
        uint64_t v10 = (v10 + 1);
      }
      while (a2 - 2 > (unint64_t)v7 && *(_DWORD *)(a1 + 4 * v10) <= v9);
      int v11 = *(_DWORD *)(a1 + 4 * v7);
      float v12 = (float)(v9 - v11);
      float v13 = (float)(*(_DWORD *)(a1 + 4 * v10) - v11);
      if (v12 < v13) {
        int v14 = 1;
      }
      else {
        int v14 = a6;
      }
      if (!v14) {
        float v12 = (float)(*(_DWORD *)(a1 + 4 * v10) - v11);
      }
      *(float *)(a7 + 4 * i) = (float)((float)(*(float *)(a3 + 4 * v10) * v12)
                                     + (float)(*(float *)(a3 + 4 * v7) * (float)(v13 - v12)))
                             / v13;
    }
  }
  return 0;
}

uint64_t interp1h(uint64_t a1, float *a2, uint64_t a3, _WORD *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  for (; a6; --a6)
  {
    float v7 = truncf(*a2);
    if (v7 > (float)(unint64_t)(a7 - 2)) {
      break;
    }
    float v8 = *a2 - v7;
    unsigned int v9 = (__int16 *)(a1 + 2 * (int)v7);
    _H2 = *v9;
    __asm { FCVT            S2, H2 }
    _H3 = v9[1];
    __asm { FCVT            S3, H3 }
    _S1 = _S2 + (float)(v8 * (float)(_S3 - _S2));
    __asm { FCVT            H1, S1 }
    *a4 = LOWORD(_S1);
    a4 += a5;
    a2 += a3;
  }
  return 0;
}

uint64_t quadra_curve(uint64_t a1, uint64_t a2, float a3, float a4, float a5, float a6, float a7, float a8, float a9, float a10, float a11)
{
  if (!a1) {
    return 0;
  }
  unint64_t v17 = 0;
  float v18 = a8 - a7;
  float v19 = a6 - a5;
  float v20 = v18 / v19;
  float v21 = (float)(a9 + a10) + (float)((float)(v18 / v19) * -2.0);
  while (1)
  {
    float v22 = (float)((float)(a3 + (float)((float)v17 * a4)) - a5) / v19;
    float v23 = v20 + (float)((float)(v21 * v22) * (float)(1.0 - v22));
    if (v23 == 0.0) {
      break;
    }
    float v24 = a7
        + (float)(v18
                * (float)((float)((float)((float)(v22 * a9) * (float)(1.0 - v22)) + (float)((float)(v20 * v22) * v22))
                        / v23));
    float v25 = roundf(v24 * a11);
    if (a11 != 0.0) {
      float v24 = v25;
    }
    *(float *)(a2 + 4 * v17++) = v24;
    if (a1 == v17) {
      return 0;
    }
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

uint64_t weightlum_curve(uint64_t a1, uint64_t a2, int32x2_t a3, int32x2_t a4, double a5, double a6, int32x2_t a7, int32x2_t a8, double a9, double a10)
{
  *(float *)v10.i32 = (float)(*(float *)&a5 - *(float *)&a6) * 0.5;
  if (*(float *)v10.i32 <= 0.0)
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  else
  {
    if (a1)
    {
      *(float *)&a10 = (float)(*(float *)&a5 + *(float *)&a6) * 0.5;
      uint64x2_t v11 = (uint64x2_t)vdupq_n_s64(a1 - 1);
      float32x4_t v12 = (float32x4_t)vdupq_lane_s32(a4, 0);
      float32x4_t v13 = (float32x4_t)vdupq_lane_s32(a3, 0);
      float32x4_t v14 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a6, 0);
      float32x4_t v15 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a10, 0);
      float32x4_t v16 = (float32x4_t)vdupq_lane_s32(v10, 0);
      float32x4_t v17 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a5, 0);
      float32x4_t v18 = (float32x4_t)vdupq_lane_s32(a7, 0);
      float32x4_t v19 = (float32x4_t)vdupq_lane_s32(a8, 0);
      unint64_t v20 = (a1 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      int64x2_t v21 = (int64x2_t)xmmword_263480560;
      int64x2_t v22 = (int64x2_t)xmmword_263380330;
      float v23 = (_DWORD *)(a2 + 8);
      v24.i64[0] = 0x3F0000003F000000;
      v24.i64[1] = 0x3F0000003F000000;
      v25.i64[0] = 0xBF000000BF000000;
      v25.i64[1] = 0xBF000000BF000000;
      __asm { FMOV            V21.4S, #1.0 }
      int64x2_t v31 = vdupq_n_s64(4uLL);
      do
      {
        int32x4_t v32 = (int32x4_t)vcgeq_u64(v11, (uint64x2_t)v22);
        int32x4_t v33 = (int32x4_t)vcgeq_u64(v11, (uint64x2_t)v21);
        int32x4_t v34 = vuzp1q_s32(v32, v33);
        unsigned __int8 v35 = vmovn_s32(v34).u8[0];
        float32x4_t v36 = vmlaq_f32(v13, v12, vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)v22)), vcvtq_f64_u64((uint64x2_t)v21)));
        int8x16_t v37 = vornq_s8(vmvnq_s8((int8x16_t)vcgtq_f32(v36, v14)), (int8x16_t)vcgeq_f32(v15, v36));
        float32x4_t v38 = vdivq_f32(vsubq_f32(v36, v14), v16);
        int8x16_t v39 = (int8x16_t)vcgtq_f32(v36, v15);
        float32x4_t v40 = vdivq_f32(vsubq_f32(v17, vminnmq_f32(v17, v36)), v16);
        int8x16_t v41 = vandq_s8((int8x16_t)v34, v37);
        float32x4_t v42 = vrndaq_f32(vmlaq_f32(v19, (float32x4_t)vbicq_s8(vbslq_s8(vandq_s8(v41, v39), (int8x16_t)vmlaq_f32(_Q21, v25, vmulq_f32(v40, v40)), (int8x16_t)vmulq_f32(vmulq_f32(v38, v38), v24)), vbicq_s8(v41, v39)), v18));
        if (v35) {
          *(v23 - 2) = v42.i32[0];
        }
        *(int32x2_t *)v32.i8 = vmovn_s64((int64x2_t)v32);
        *(int16x4_t *)v32.i8 = vmovn_s32(v32);
        if (v32.i8[2]) {
          *(v23 - 1) = v42.i32[1];
        }
        if (vmovn_s32(vmovn_hight_s64(*(int32x2_t *)&v32, *(int64x2_t *)&v33)).i32[1]) {
          *float v23 = v42.i32[2];
        }
        if (vmovn_s32(vmovn_hight_s64(*(int32x2_t *)&v33, *(int64x2_t *)&v33)).i8[6]) {
          v23[1] = v42.i32[3];
        }
        int64x2_t v21 = vaddq_s64(v21, v31);
        int64x2_t v22 = vaddq_s64(v22, v31);
        v23 += 4;
        v20 -= 4;
      }
      while (v20);
    }
    return 0;
  }
}

float compareFloatArray(float *a1, float *a2, uint64_t a3)
{
  for (float result = 0.0; a3; --a3)
  {
    float v4 = *a1++;
    float v5 = v4;
    float v6 = *a2++;
    float result = fmaxf(result, vabds_f32(v5, v6));
  }
  return result;
}

uint64_t compareUInt8Array(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  for (uint64_t i = 0; a3; --a3)
  {
    int v5 = *a1++;
    int v4 = v5;
    int v6 = *a2++;
    int v7 = v4 - v6;
    if (v7 < 0) {
      int v7 = -v7;
    }
    if ((int)i <= v7) {
      uint64_t i = v7;
    }
    else {
      uint64_t i = i;
    }
  }
  return i;
}

uint64_t compand10To8(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = 0;
    int32x4_t v2 = (int32x4_t)xmmword_263482030;
    int32x4_t v3 = (int32x4_t)xmmword_263482040;
    int32x4_t v4 = (int32x4_t)xmmword_263482000;
    int32x4_t v5 = (int32x4_t)xmmword_263380160;
    int64x2_t v6 = (int64x2_t)xmmword_263482050;
    int64x2_t v7 = (int64x2_t)xmmword_263482060;
    int64x2_t v8 = (int64x2_t)xmmword_263482070;
    int64x2_t v9 = (int64x2_t)xmmword_263482080;
    int64x2_t v10 = (int64x2_t)xmmword_263482010;
    int64x2_t v11 = (int64x2_t)xmmword_263482020;
    int64x2_t v12 = (int64x2_t)xmmword_263480560;
    int64x2_t v13 = (int64x2_t)xmmword_263380330;
    uint64x2_t v14 = (uint64x2_t)vdupq_n_s64(0x7FuLL);
    uint64x2_t v15 = (uint64x2_t)vdupq_n_s64(0x1FFuLL);
    int64x2_t v16 = vdupq_n_s64(0x100uLL);
    int64x2_t v17 = vdupq_n_s64(0x10uLL);
    v18.i64[0] = 0x1F0000001FLL;
    v18.i64[1] = 0x1F0000001FLL;
    v19.i64[0] = 0x3F0000003FLL;
    v19.i64[1] = 0x3F0000003FLL;
    v20.i64[0] = -256;
    v20.i64[1] = -256;
    v21.i64[0] = 0x1000000010;
    v21.i64[1] = 0x1000000010;
    do
    {
      *(int8x16_t *)(a1 + v1) = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)v13, v14), (int32x4_t)vcgtq_u64((uint64x2_t)v12, v14)), vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)v13, v15), (int32x4_t)vcgtq_u64((uint64x2_t)v12, v15)), (int8x16_t)(*(_OWORD *)&vshrq_n_u32((uint32x4_t)v5, 4uLL) | __PAIR128__(0xE0000000E0, 0xE0000000E0)), vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64((int64x2_t)vandq_s8((int8x16_t)v13, v20), v16), (int32x4_t)vceqq_s64((int64x2_t)vandq_s8((int8x16_t)v12, v20), v16)), (int8x16_t)(*(_OWORD *)&vandq_s8(
                                                                                          (int8x16_t)vshrq_n_u32((uint32x4_t)v5, 3uLL),
                                                                                          v18) | __PAIR128__(0xC0000000C0, 0xC0000000C0)), (int8x16_t)(*(_OWORD *)&vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v5, 1uLL), v19) | __PAIR128__(0x8000000080, 0x8000000080)))), (int8x16_t)v5), (int16x8_t)vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)v11, v14), (int32x4_t)vcgtq_u64((uint64x2_t)v10, v14)), vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)v11, v15), (int32x4_t)vcgtq_u64((uint64x2_t)v10, v15)), (int8x16_t)(*(_OWORD *)&vshrq_n_u32((uint32x4_t)v4, 4uLL) | __PAIR128__(0xE0000000E0, 0xE0000000E0)), vbslq_s8((int8x16_t)vuzp1q_s32(
                                                                             (int32x4_t)vceqq_s64((int64x2_t)vandq_s8((int8x16_t)v11, v20), v16), (int32x4_t)vceqq_s64((int64x2_t)vandq_s8((int8x16_t)v10, v20), v16)), (int8x16_t)(*(_OWORD *)&vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v4, 3uLL), v18) | __PAIR128__(0xC0000000C0, 0xC0000000C0)), (int8x16_t)(*(_OWORD *)&vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v4, 1uLL), v19) | __PAIR128__(0x8000000080, 0x8000000080)))), (int8x16_t)v4)), (int8x16_t)vuzp1q_s16((int16x8_t)vbslq_s8((int8x16_t)vuzp1q_s32(
                                                                         (int32x4_t)vcgtq_u64((uint64x2_t)v9, v14),
                                                                         (int32x4_t)vcgtq_u64((uint64x2_t)v8, v14)),
                                                            vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)v9, v15), (int32x4_t)vcgtq_u64((uint64x2_t)v8, v15)), (int8x16_t)(*(_OWORD *)&vshrq_n_u32((uint32x4_t)v3, 4uLL) | __PAIR128__(0xE0000000E0, 0xE0000000E0)), vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64((int64x2_t)vandq_s8((int8x16_t)v9, v20), v16), (int32x4_t)vceqq_s64((int64x2_t)vandq_s8((int8x16_t)v8, v20), v16)), (int8x16_t)(*(_OWORD *)&vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v3, 3uLL), v18) | __PAIR128__(0xC0000000C0, 0xC0000000C0)), (int8x16_t)(*(_OWORD *)&vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v3, 1uLL),
                                                                                          v19) | __PAIR128__(0x8000000080, 0x8000000080)))), (int8x16_t)v3), (int16x8_t)vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)v7, v14), (int32x4_t)vcgtq_u64((uint64x2_t)v6, v14)), vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)v7, v15), (int32x4_t)vcgtq_u64((uint64x2_t)v6, v15)), (int8x16_t)(*(_OWORD *)&vshrq_n_u32((uint32x4_t)v2, 4uLL) | __PAIR128__(0xE0000000E0, 0xE0000000E0)), vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64((int64x2_t)vandq_s8((int8x16_t)v7, v20), v16), (int32x4_t)vceqq_s64((int64x2_t)vandq_s8((int8x16_t)v6, v20),
                                                                                          v16)),
                                                                (int8x16_t)(*(_OWORD *)&vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v2, 3uLL), v18) | __PAIR128__(0xC0000000C0, 0xC0000000C0)), (int8x16_t)(*(_OWORD *)&vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v2, 1uLL), v19) | __PAIR128__(0x8000000080, 0x8000000080)))), (int8x16_t)v2)));
      v1 += 16;
      int64x2_t v11 = vaddq_s64(v11, v17);
      int64x2_t v12 = vaddq_s64(v12, v17);
      int64x2_t v13 = vaddq_s64(v13, v17);
      int64x2_t v10 = vaddq_s64(v10, v17);
      int64x2_t v9 = vaddq_s64(v9, v17);
      int64x2_t v8 = vaddq_s64(v8, v17);
      int64x2_t v7 = vaddq_s64(v7, v17);
      int64x2_t v6 = vaddq_s64(v6, v17);
      int32x4_t v5 = vaddq_s32(v5, v21);
      int32x4_t v4 = vaddq_s32(v4, v21);
      int32x4_t v3 = vaddq_s32(v3, v21);
      int32x4_t v2 = vaddq_s32(v2, v21);
    }
    while (v1 != 1024);
    return 0;
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

float sample(uint64_t a1, uint64_t a2, uint64_t a3, float a4, float a5)
{
  float v5 = (float)(unint64_t)(a2 - 2);
  if (v5 >= a4) {
    float v5 = a4;
  }
  float v6 = 0.0;
  if (v5 < 0.0) {
    float v5 = 0.0;
  }
  float v7 = truncf(v5);
  float v8 = (float)(unint64_t)(a3 - 2);
  if (v8 >= a5) {
    float v8 = a5;
  }
  if (v8 >= 0.0) {
    float v6 = v8;
  }
  float v9 = a4 - (float)(int)v7;
  float v10 = a5 - (float)(int)truncf(v6);
  return (float)(v10
               * (float)((float)(v9 * *(float *)(a1 + 4 * (((int)v6 + 1) * a2 + (int)v5 + 1)))
                       + (float)(*(float *)(a1 + 4 * (((int)v6 + 1) * a2 + (int)v5)) * (float)(1.0 - v9))))
       + (float)((float)((float)(v9 * *(float *)(a1 + 4 * ((int)v6 * a2 + (int)v5 + 1)))
                       + (float)(*(float *)(a1 + 4 * ((int)v6 * a2 + (int)v5)) * (float)(1.0 - v9)))
               * (float)(1.0 - v10));
}

void sub_26334ED68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  for (uint64_t i = 224; i != -16; i -= 48)
    objc_destroyWeak((id *)(&a30 + i));
  for (uint64_t j = 104; j != -16; j -= 24)

  _Unwind_Resume(a1);
}

void sub_26334F2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  for (uint64_t i = 80; i != -16; i -= 48)
    objc_destroyWeak((id *)(&a19 + i));
  for (uint64_t j = 104; j != -16; j -= 24)

  _Unwind_Resume(a1);
}

void sub_26334FD60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  for (uint64_t i = 128; i != -16; i -= 48)
    objc_destroyWeak((id *)(&a21 + i));
  for (uint64_t j = 272; j != -16; j -= 24)

  _Unwind_Resume(a1);
}

void sub_263351354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  __destructor_8_s0_s8_s16_s24_s32_s40_s48_s56_s64_s72((uint64_t)&a57);
  __destructor_8_s0_s8_s16_s24((uint64_t)&a67);

  _Unwind_Resume(a1);
}

void __destructor_8_s0_s8_s16_s24_s32_s40_s48_s56_s64_s72(uint64_t a1)
{
  int32x4_t v2 = *(void **)(a1 + 72);
}

void sub_2633567A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  for (uint64_t i = 80; i != -16; i -= 48)
    objc_destroyWeak((id *)(&a18 + i));
  for (uint64_t j = 32; j != -16; j -= 24)

  _Unwind_Resume(a1);
}

void sub_26335AE44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __destructor_8_s0_s8_s16(uint64_t a1)
{
  int32x4_t v2 = *(void **)(a1 + 16);
}

void sub_26335F044(_Unwind_Exception *a1)
{
  for (uint64_t i = 32; i != -16; i -= 24)

  _Unwind_Resume(a1);
}

BOOL expandLUT(unsigned __int16 *a1, uint64_t a2, uint64_t a3, float a4, double a5, double a6, float a7, float a8)
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  unsigned __int16 v10 = *a1;
  do
  {
    uint64_t v11 = v9++;
    uint64_t v12 = a1[v9];
    if (v12 > v10)
    {
      unint64_t v13 = 0;
      float v14 = (float)v10;
      LOWORD(a7) = *(_WORD *)(a2 + 2 * v11);
      a7 = (float)LODWORD(a7);
      LOWORD(a8) = *(_WORD *)(a2 + 2 * v9);
      a8 = (float)LODWORD(a8) - a7;
      float v15 = (float)v12 - v14;
      uint64_t v16 = v8 + v12 - v10;
      uint64_t v17 = v12 - v10;
      unint64_t v18 = (v17 + 1) & 0xFFFFFFFFFFFFFFFELL;
      uint64x2_t v19 = (uint64x2_t)vdupq_n_s64(v17 - 1);
      uint64_t v20 = a3 + 2 * v8;
      do
      {
        int32x2_t v21 = vmovn_s64((int64x2_t)vcgeq_u64(v19, (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v13), (int8x16_t)xmmword_263380330)));
        if (v21.i8[0])
        {
          _S16 = (float)((float)((float)((float)((float)(v8 + v13) - v14) * a8) / v15) + a7) * a4;
          __asm { FCVT            H16, S16 }
          *(_WORD *)(v20 + 2 * v13) = LOWORD(_S16);
        }
        if (v21.i8[4])
        {
          _S7 = (float)((float)((float)((float)((float)(v8 + v13 + 1) - v14) * a8) / v15) + a7) * a4;
          __asm { FCVT            H7, S7 }
          *(_WORD *)(v20 + 2 * v13 + 2) = LOWORD(_S7);
        }
        v13 += 2;
      }
      while (v18 != v13);
      uint64_t v8 = v16;
    }
    unsigned __int16 v10 = v12;
  }
  while (v9 != 15);
  return v8 == 1023;
}

float getGainBasedTuning(void *a1, void *a2, float a3, float a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(float *)&double v10 = a3;
    objc_msgSend(v9, "cmi_interpolateValueForGain:", v10);
  }
  else
  {
    *(float *)&double v10 = a4;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", v8, 0, v10);
  }
  float v12 = v11;

  return v12;
}

float _getLensShadingModulationWeightFromFrame(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  char v19 = 0;
  float v5 = -[SoftISPInputFrame metadata]((uint64_t)v3);
  if (!v5)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    unint64_t v13 = 0;
    id v7 = 0;
    id v6 = 0;
LABEL_10:
    float v8 = 0.0;
    goto LABEL_7;
  }
  id v6 = v4;
  id v7 = [v6 tuningParametersForInputFrameMetadata:v5 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v3)];
  if (!v7)
  {
    unint64_t v13 = 0;
    goto LABEL_10;
  }
  float v8 = 0.0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F558], &v19, 0.0);
  if (v19)
  {
    int v10 = LODWORD(v9);
    LODWORD(v9) = 1.0;
    objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F538], &v19, v9);
    float v8 = v11;
    float v12 = [v7 objectForKeyedSubscript:@"LSC"];
    unint64_t v13 = v12;
    if (v19)
    {
      float v14 = [v12 objectForKeyedSubscript:@"LensShadingModulation"];
      if (v14)
      {
        uint64_t v16 = v14;
        LODWORD(v15) = v10;
        objc_msgSend(v14, "cmi_interpolateValueForGain:", v15);
        float v8 = v8 * v17;
      }
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
LABEL_7:

  return v8;
}

uint64_t _generateLSCGainMapWithLSCMetadata(uint64_t a1, void *a2, float *a3, void *a4, void *a5, void *a6, char a7)
{
  uint64_t v318 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  id v18 = v14;
  char v19 = -[SoftISPInputFrame metadata]((uint64_t)v15);
  uint64_t v20 = [v19 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
  int32x2_t v21 = -[RawNightModeInputFrame sampleBuffer]((uint64_t)v18);
  uint64_t v22 = [v21 objectForKeyedSubscript:v20];

  v293 = v18;
  float v23 = [v18 moduleConfigForInputFrameMetadata:v19];
  char v302 = 0;
  id v290 = v16;
  id v291 = v15;
  v292 = v17;
  v294 = (void *)v22;
  if (!v22)
  {
    uint64_t v274 = v288;
    LODWORD(v273) = 0;
LABEL_112:
    FigDebugAssert3();
    uint64_t v70 = FigSignalErrorAt();
    id v17 = 0;
    float32x4_t v24 = 0;
    float32x4_t v25 = a3;
    goto LABEL_142;
  }
  if (!v16)
  {
    uint64_t v274 = v288;
    LODWORD(v273) = 0;
    goto LABEL_112;
  }
  float32x4_t v24 = (char *)[v16 bytes];
  float32x4_t v25 = a3;
  if (!v24)
  {
    uint64_t v274 = v288;
    LODWORD(v273) = 0;
    FigDebugAssert3();
    uint64_t v70 = FigSignalErrorAt();
    id v17 = 0;
    goto LABEL_142;
  }
  v297 = v23;
  uint64_t v26 = 4 * *(unsigned __int16 *)(a1 + 14) * *(unsigned __int16 *)(a1 + 12);
  if (!v26)
  {
    uint64_t v274 = v288;
    LODWORD(v273) = 0;
    FigDebugAssert3();
LABEL_123:
    uint64_t v70 = FigSignalErrorAt();
    id v17 = 0;
    goto LABEL_124;
  }
  int v27 = malloc_type_malloc(8 * *(unsigned __int16 *)(a1 + 14) * *(unsigned __int16 *)(a1 + 12), 0x1000040BDFB0063uLL);
  *((void *)a3 + 4) = v27;
  if (!v27)
  {
    uint64_t v274 = v288;
    LODWORD(v273) = 0;
LABEL_122:
    FigDebugAssert3();
    goto LABEL_123;
  }
  if (!*(unsigned char *)(a1 + 36)) {
    goto LABEL_16;
  }
  uint64_t v28 = malloc_type_malloc(32 * *(unsigned __int16 *)(a1 + 12) * (unint64_t)*(unsigned __int16 *)(a1 + 14), 0xC01E239EuLL);
  *((void *)a3 + 6) = v28;
  if (!v28)
  {
    uint64_t v274 = v288;
    LODWORD(v273) = 0;
    goto LABEL_122;
  }
  if (!v17)
  {
    uint64_t v274 = v288;
    LODWORD(v273) = 0;
    FigDebugAssert3();
    uint64_t v70 = FigSignalErrorAt();
LABEL_124:
    float32x4_t v24 = 0;
    float v23 = v297;
    goto LABEL_142;
  }
  id v29 = v17;
  if (![v29 bytes])
  {
    uint64_t v274 = v288;
    LODWORD(v273) = 0;
    goto LABEL_122;
  }
  if ((unint64_t)[v29 length] <= 0x5F)
  {
    uint64_t v274 = v288;
    LODWORD(v273) = 0;
    goto LABEL_122;
  }
  id v30 = v29;
  if (*(_DWORD *)[v30 bytes] != 1)
  {
    uint64_t v274 = v288;
    LODWORD(v273) = 0;
    goto LABEL_122;
  }
  uint64_t v31 = 16 * *(unsigned __int16 *)(a1 + 12) * *(unsigned __int16 *)(a1 + 14);
  int32x4_t v32 = (_DWORD *)[v30 bytes];
  if (v31)
  {
    int32x4_t v33 = (float32x4_t *)(v32 + 23);
    int32x4_t v34 = (int8x16_t *)*((void *)a3 + 6);
    v35.i64[0] = 0x3C003C003C003C00;
    v35.i64[1] = 0x3C003C003C003C00;
    do
    {
      float32x4_t v36 = *v33;
      float32x4_t v37 = v33[1];
      v33 += 2;
      *v34++ = vbslq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtzq_f32(v36), (int16x8_t)vcgtzq_f32(v37)), (int8x16_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v36), v37), v35);
      v31 -= 8;
    }
    while (v31);
  }
  unsigned int v38 = *(unsigned __int16 *)(a1 + 12);
  uint64_t v39 = *(void *)(a1 + 56);
  uint64_t v40 = *(void *)(a1 + 64);
  LOWORD(v39) = v32[7] / v38;
  *(_WORD *)(a1 + 56) = v39;
  WORD1(v39) = v32[8] / v38;
  *(void *)(a1 + 56) = v39;
  WORD2(v39) = v32[9] / v38;
  *(void *)(a1 + 56) = v39;
  HIWORD(v39) = v32[10] / v38;
  *(void *)(a1 + 56) = v39;
  LOWORD(v40) = v32[11] / v38;
  *(_WORD *)(a1 + 64) = v40;
  WORD1(v40) = v32[12] / v38;
  *(void *)(a1 + 64) = v40;
  WORD2(v40) = v32[13] / v38;
  *(void *)(a1 + 64) = v40;
  HIWORD(v40) = v32[14] / v38;
  *(void *)(a1 + 64) = v40;
  uint64_t v41 = *(void *)(a1 + 72);
  uint64_t v42 = *(void *)(a1 + 80);
  LOWORD(v41) = v32[15] / v38;
  *(_WORD *)(a1 + 72) = v41;
  WORD1(v41) = v32[16] / v38;
  *(void *)(a1 + 72) = v41;
  WORD2(v41) = v32[17] / v38;
  *(void *)(a1 + 72) = v41;
  HIWORD(v41) = v32[18] / v38;
  *(void *)(a1 + 72) = v41;
  LOWORD(v42) = v32[19] / v38;
  *(_WORD *)(a1 + 80) = v42;
  WORD1(v42) = v32[20] / v38;
  *(void *)(a1 + 80) = v42;
  WORD2(v42) = v32[21] / v38;
  *(void *)(a1 + 80) = v42;
  HIWORD(v42) = v32[22] / v38;
  *(void *)(a1 + 80) = v42;
  float32x4_t v25 = a3;
LABEL_16:
  uint64_t v43 = v24 + 44;
  if (*((unsigned char *)v25 + 598))
  {
    int v44 = *(unsigned __int16 *)(a1 + 14);
    float v23 = v297;
    if (*(_WORD *)(a1 + 14))
    {
      __int16 v45 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = *(unsigned __int16 *)(a1 + 12);
      do
      {
        if (v47)
        {
          uint64_t v48 = 0;
          uint64_t v49 = *((void *)v25 + 4);
          do
          {
            __int16 v50 = v45 + v48;
            _S0 = *(_DWORD *)&v43[4 * v48 + 4 * v47 * (v46 + *(unsigned __int16 *)(a1 + 48))];
            __asm { FCVT            H0, S0 }
            *(_WORD *)(v49 + 8 * (v50 & 0x3FFF)) = _S0;
            _S0 = *(_DWORD *)&v43[4 * v48 + 4 * v47 * (v46 + *(unsigned __int16 *)(a1 + 50))];
            __asm { FCVT            H0, S0 }
            *(_WORD *)(v49 + 2 * ((4 * (v50 & 0x3FFF)) | 1u)) = _S0;
            _S0 = *(_DWORD *)&v43[4 * v48 + 4 * v47 * (v46 + *(unsigned __int16 *)(a1 + 52))];
            __asm { FCVT            H0, S0 }
            *(_WORD *)(v49 + 2 * ((4 * (v50 & 0x3FFF)) | 2u)) = _S0;
            _S0 = *(_DWORD *)&v43[4 * v48 + 4 * v47 * (v46 + *(unsigned __int16 *)(a1 + 54))];
            __asm { FCVT            H0, S0 }
            *(_WORD *)(v49 + 2 * ((4 * (v50 & 0x3FFF)) | 3u)) = _S0;
            ++v48;
          }
          while (v47 != v48);
        }
        ++v46;
        v45 += v47;
      }
      while (v46 != v44);
    }
    goto LABEL_34;
  }
  uint64_t v59 = malloc_type_malloc(4 * v26, 0x100004052888210uLL);
  *(void *)float32x4_t v25 = v59;
  if (!v59)
  {
    uint64_t v274 = v288;
    LODWORD(v273) = 0;
    goto LABEL_122;
  }
  int v60 = *(unsigned __int16 *)(a1 + 14);
  float v23 = v297;
  if (*(_WORD *)(a1 + 14))
  {
    __int16 v61 = 0;
    uint64_t v62 = 0;
    uint64_t v63 = *(unsigned __int16 *)(a1 + 12);
    do
    {
      if (v63)
      {
        uint64_t v64 = 0;
        float v65 = v25[143];
        do
        {
          __int16 v66 = v61 + v64;
          v59[4 * (v66 & 0x3FFF)] = (float)(v65
                                                        * *(float *)&v43[4 * v64
                                                                       + 4
                                                                       * v63
                                                                       * (v62 + *(unsigned __int16 *)(a1 + 48))]);
          v59[(4 * (v66 & 0x3FFF)) | 1] = (float)(v65
                                                              * *(float *)&v43[4 * v64
                                                                             + 4
                                                                             * v63
                                                                             * (v62 + *(unsigned __int16 *)(a1 + 50))]);
          v59[(4 * (v66 & 0x3FFF)) | 2] = (float)(v65
                                                              * *(float *)&v43[4 * v64
                                                                             + 4
                                                                             * v63
                                                                             * (v62 + *(unsigned __int16 *)(a1 + 52))]);
          v59[(4 * (v66 & 0x3FFF)) | 3] = (float)(v65
                                                              * *(float *)&v43[4 * v64++
                                                                             + 4
                                                                             * v63
                                                                             * (v62 + *(unsigned __int16 *)(a1 + 54))]);
        }
        while (v63 != v64);
      }
      ++v62;
      v61 += v63;
    }
    while (v62 != v60);
  }
  v25[144] = _getLensShadingModulationWeightFromFrame(v15, v293);
  if (*((unsigned char *)v25 + 597))
  {
    objc_msgSend(v19, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F4B0], &v302, 0.0);
    if (v302) {
      v25[144] = (float)(fmaxf(fminf(v67, v25[146]), v25[145]) - v25[145]) / (float)(v25[146] - v25[145]);
    }
  }
LABEL_34:
  if (!v23
    || ([v23 objectForKeyedSubscript:@"LensShading"],
        id v68 = objc_claimAutoreleasedReturnValue(),
        v68,
        !v68))
  {
    uint64_t v274 = v288;
    LODWORD(v273) = 0;
    FigDebugAssert3();
    id v17 = 0;
    float32x4_t v24 = 0;
    uint64_t v70 = 0;
    goto LABEL_142;
  }
  if (*((unsigned char *)v25 + 597))
  {
    unsigned int v69 = [v23 objectForKeyedSubscript:@"LensShading"];
    id v17 = [v69 objectForKeyedSubscript:@"MapsFlash"];
  }
  else
  {
    id v17 = 0;
  }
  if (*((unsigned char *)v25 + 596))
  {
    uint64_t v71 = [v23 objectForKeyedSubscript:@"LensShading"];
    v289 = [v71 objectForKeyedSubscript:@"AdaptiveModel"];
  }
  else
  {
    v289 = 0;
  }
  id v287 = v17;
  if (*((unsigned char *)v25 + 597) && [v17 count])
  {
    uint64_t v72 = [v17 objectForKeyedSubscript:@"Maps"];
    if (!v72) {
      goto LABEL_106;
    }
    uint64_t v73 = (void *)v72;
    uint64_t v74 = [v17 objectForKeyedSubscript:@"Maps"];
    long long v75 = [v74 objectAtIndexedSubscript:0];

    if (v75)
    {
      float v76 = [v17 objectForKeyedSubscript:@"Maps"];
      float v77 = [v76 objectAtIndexedSubscript:0];
      int v78 = objc_msgSend(v77, "cmi_intValueForKey:defaultValue:found:", @"Width", 0, &v302);

      if (v78 > 0)
      {
        v284 = v20;
        id v79 = [v17 objectForKeyedSubscript:@"Maps"];
        float32x2_t v80 = [v79 objectAtIndexedSubscript:0];
        int v81 = objc_msgSend(v80, "cmi_intValueForKey:defaultValue:found:", @"Height", 0, &v302);

        if (v81 <= 0)
        {
          uint64_t v274 = v288;
          LODWORD(v273) = 0;
          FigDebugAssert3();
          uint64_t v70 = FigSignalErrorAt();
          float32x4_t v25 = a3;
          uint64_t v20 = v284;
          goto LABEL_108;
        }
        v282 = v19;
        uint64_t v82 = [v17 objectForKeyedSubscript:@"Maps"];
        uint64_t v83 = [v82 objectAtIndexedSubscript:0];
        unsigned int v84 = [v83 objectForKeyedSubscript:@"Values"];

        if ([v84 count] == v81 * v78)
        {
          __int16 v85 = malloc_type_malloc(4 * *(unsigned __int16 *)(a1 + 12) * (unint64_t)*(unsigned __int16 *)(a1 + 14), 0x6C6A7328uLL);
          *((void *)a3 + 1) = v85;
          if (v85)
          {
            *((void *)a3 + 5) = malloc_type_malloc(2* *(unsigned __int16 *)(a1 + 12)* (unint64_t)*(unsigned __int16 *)(a1 + 14), 0x2F6E79A8uLL);
            if (v78 == *(unsigned __int16 *)(a1 + 12) && v81 == *(unsigned __int16 *)(a1 + 14))
            {
              char v280 = 0;
              id v86 = (_DWORD *)*((void *)a3 + 1);
              goto LABEL_83;
            }
            long long v134 = malloc_type_malloc(4 * v78 * (unint64_t)v81, 0x18BAF5D7uLL);
            if (v134)
            {
              id v86 = v134;
              char v280 = 1;
LABEL_83:
              __int16 v135 = 0;
              for (int i = 0; i != v81; ++i)
              {
                for (int j = 0; j != v78; ++j)
                {
                  float v138 = [v84 objectAtIndexedSubscript:(unsigned __int16)(v135 + j)];
                  v86[(unsigned __int16)(v135 + j)] = [v138 intValue];
                }
                v135 += v78;
              }
              id v16 = v290;
              id v15 = v291;
              char v19 = v282;
              float v23 = v297;
              if (v280)
              {
                if (*(_WORD *)(a1 + 14))
                {
                  uint64_t v139 = 0;
                  uint64_t v140 = *(unsigned __int16 *)(a1 + 12);
                  float v141 = (float)v140;
                  float v142 = (float)*(unsigned __int16 *)(a1 + 14);
                  uint64_t v143 = *((void *)a3 + 1);
                  int v144 = (int)(float)v78;
                  float v145 = 0.0;
                  do
                  {
                    if (v140)
                    {
                      uint64_t v146 = 0;
                      float v147 = (float)((float)v81 + -1.0) * (float)(v145 / v142);
                      int v148 = (int)v147 * v144;
                      int v149 = v144 + v148;
                      float v150 = v147 - (float)(int)v147;
                      float v151 = 0.0;
                      do
                      {
                        float v152 = (float)((float)v78 + -1.0) * (float)(v151 / v141);
                        unsigned int v153 = v86[v148 + (int)v152];
                        int v154 = (int)v152 + 1;
                        unsigned int v155 = v86[v149 + (int)v152];
                        float v156 = v152 - (float)(int)v152;
                        float v157 = (float)v153 + (float)((float)(v86[v154 + v148] - v153) * v156);
                        *(_DWORD *)(v143 + 4 * v146++) = (float)((float)v157
                                                                             + (float)((float)((float)((float)v155 + (float)((float)(v86[v154 + v149] - v155) * v156))
                                                                                             - v157)
                                                                                     * v150));
                        float v151 = (float)(int)v146;
                      }
                      while (v141 > (float)(int)v146);
                    }
                    float v145 = (float)(int)++v139;
                    v143 += 4 * v140;
                  }
                  while (v142 > (float)(int)v139);
                }
                free(v86);
              }
              uint64_t v158 = [v282 objectForKeyedSubscript:*MEMORY[0x263F2F4B8]];
              v159 = v158;
              float32x4_t v25 = a3;
              uint64_t v20 = v284;
              if (v158)
              {
                uint64_t v160 = [v158 bytes];
                uint64_t v161 = 0;
                uint64_t v162 = (uint64_t *)(a3 + 14);
                do
                {
                  for (uint64_t k = 0; k != 32; k += 2)
                    *(_WORD *)((char *)v162 + k) = *(_WORD *)(v160 + k);
                  ++v161;
                  v162 += 4;
                  v160 += 32;
                }
                while (v161 != 16);
                unint64_t v164 = 0;
                int32x4_t v165 = 0uLL;
                int32x4_t v166 = 0uLL;
                do
                {
                  uint16x8_t v167 = *(uint16x8_t *)&a3[v164 / 4 + 14];
                  uint16x8_t v168 = (uint16x8_t)xmmword_2634822A0[v164 / 0x10];
                  int32x4_t v166 = (int32x4_t)vmlal_high_u16((uint32x4_t)v166, v168, v167);
                  int32x4_t v165 = (int32x4_t)vmlal_u16((uint32x4_t)v165, *(uint16x4_t *)v168.i8, *(uint16x4_t *)v167.i8);
                  v164 += 16;
                }
                while (v164 != 512);
                a3[142] = (float)(fmaxf(fminf(floorf((float)vaddvq_s32(vaddq_s32(v165, v166)) * 0.000015259), a3[147]), a3[148])- a3[148])/ (float)(a3[147] - a3[148]);
              }

              uint64_t v70 = 0;
              goto LABEL_104;
            }
          }
          uint64_t v274 = v288;
          LODWORD(v273) = 0;
          FigDebugAssert3();
          uint64_t v70 = FigSignalErrorAt();
          float32x4_t v25 = a3;
          char v19 = v282;
          uint64_t v20 = v284;
          float v23 = v297;
        }
        else
        {
          uint64_t v274 = v288;
          LODWORD(v273) = 0;
          FigDebugAssert3();
          uint64_t v70 = FigSignalErrorAt();
          float32x4_t v25 = a3;
          char v19 = v282;
          uint64_t v20 = v284;
        }
LABEL_104:

        goto LABEL_105;
      }
      uint64_t v274 = v288;
      LODWORD(v273) = 0;
      FigDebugAssert3();
      uint64_t v70 = FigSignalErrorAt();
    }
    else
    {
LABEL_106:
      uint64_t v274 = v288;
      LODWORD(v273) = 0;
      FigDebugAssert3();
      uint64_t v70 = 0;
    }
    float32x4_t v25 = a3;
    goto LABEL_108;
  }
  uint64_t v70 = 0;
  if (!*((unsigned char *)v25 + 596))
  {
LABEL_105:
    id v17 = v287;
LABEL_108:
    float32x4_t v24 = v289;
    goto LABEL_142;
  }
  float32x4_t v24 = v289;
  if (!v289) {
    goto LABEL_141;
  }
  __int16 v87 = malloc_type_malloc(4 * *(unsigned __int16 *)(a1 + 12) * (unint64_t)*(unsigned __int16 *)(a1 + 14), 0xF0941AD9uLL);
  *((void *)v25 + 2) = v87;
  if (v87)
  {
    id v88 = malloc_type_malloc(4 * *(unsigned __int16 *)(a1 + 12) * (unint64_t)*(unsigned __int16 *)(a1 + 14), 0x41D85C4AuLL);
    *((void *)v25 + 3) = v88;
    if (v88)
    {
      v285 = v20;
      LODWORD(v89) = 1.0;
      objc_msgSend(v19, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F350], &v302, v89);
      float v91 = v90;
      v283 = v19;
      id v92 = v19;
      long long v316 = 0u;
      memset(v317, 0, sizeof(v317));
      long long v314 = 0u;
      long long v315 = 0u;
      long long v312 = 0u;
      long long v313 = 0u;
      long long v310 = 0u;
      long long v311 = 0u;
      long long v309 = 0u;
      long long v307 = 0u;
      long long v308 = 0u;
      long long v305 = 0u;
      long long v306 = 0u;
      long long v303 = 0u;
      long long v304 = 0u;
      id v93 = [v92 objectForKeyedSubscript:*MEMORY[0x263F2F348]];
      uint64_t v94 = [v92 objectForKeyedSubscript:*MEMORY[0x263F2F340]];
      int v95 = (void *)v94;
      if (v93 && v94)
      {
        unint64_t v96 = 0;
        int v97 = 0;
        unsigned int v98 = 0;
        do
        {
          int v99 = [v93 objectAtIndexedSubscript:v96];
          unsigned int v100 = [v99 intValue];

          int v101 = [v95 objectAtIndexedSubscript:v96];
          int v102 = [v101 intValue];

          if (v100 <= 0x3E)
          {
            int v103 = *((_DWORD *)&v303 + v100) + v102;
            *((_DWORD *)&v303 + v100) = v103;
            if (v103 > *((_DWORD *)&v303 + v98)) {
              unsigned int v98 = v100;
            }
            v97 += v102;
          }
          if (v96 > 0xE) {
            break;
          }
          ++v96;
        }
        while (v97 < 100);
      }
      else
      {
        uint64_t v274 = v288;
        LODWORD(v273) = 0;
        FigDebugAssert3();
        FigSignalErrorAt();
        unsigned int v98 = 0;
      }

      float32x4_t v24 = v289;
      uint64_t v104 = [v289 objectForKeyedSubscript:@"GridX"];
      uint64_t v105 = [v289 objectForKeyedSubscript:@"GridY"];
      uint64_t v20 = v285;
      v281 = (void *)v105;
      if (v104 && (uint64_t v106 = (void *)v105) != 0)
      {
        int v107 = [v104 count];
        int v108 = [v106 count];
        unsigned __int16 v279 = v107;
        BOOL v109 = v107 < 1;
        float32x4_t v25 = a3;
        id v16 = v290;
        id v15 = v291;
        if (!v109 && v108 > 9)
        {
          unsigned __int16 v278 = v108;
          uint64_t v110 = [v289 objectForKeyedSubscript:@"ModelR"];
          id v111 = v289;
          if (v110)
          {
            id v112 = (void *)v110;
            id v113 = [v289 objectForKeyedSubscript:@"ModelB"];

            if (v113)
            {
              v277 = v104;
              uint64_t v114 = [v289 objectForKeyedSubscript:@"Illuminants"];
              if (!v114) {
                goto LABEL_138;
              }
              id v115 = (void *)v114;
              id v116 = [v289 objectForKeyedSubscript:@"Illuminants"];
              uint64_t v117 = [v116 objectAtIndexedSubscript:v98];
              if (v117)
              {
                id v118 = (void *)v117;
                v275 = v116;
                v276 = v115;
                id v119 = [v289 objectForKeyedSubscript:@"Illuminants"];
                uint64_t v120 = [v119 objectAtIndexedSubscript:v98];
                uint64_t v121 = [v120 objectForKeyedSubscript:@"ModelR"];
                if (v121)
                {
                  uint64_t v122 = (void *)v121;
                  uint64_t v123 = [v289 objectForKeyedSubscript:@"Illuminants"];
                  float v124 = [v123 objectAtIndexedSubscript:v98];
                  unsigned int v125 = [v124 objectForKeyedSubscript:@"ModelB"];

                  id v111 = v289;
                  float32x4_t v25 = a3;
                  uint64_t v20 = v285;
                  if (v125)
                  {
                    uint64_t v126 = [v289 objectForKeyedSubscript:@"ModelR"];
                    int v127 = [v289 objectForKeyedSubscript:@"Illuminants"];
                    float v128 = [v127 objectAtIndexedSubscript:v98];
                    unsigned int v129 = [v128 objectForKeyedSubscript:@"ModelR"];
                    uint64_t v70 = _computeALSProfileTableWithALSModel(v126, v129, v279, v278, *((void *)a3 + 2), *(unsigned __int16 *)(a1 + 12), *(unsigned __int16 *)(a1 + 14), v91);

                    if (!v70)
                    {
                      uint64_t v130 = [v289 objectForKeyedSubscript:@"ModelB"];
                      id v131 = [v289 objectForKeyedSubscript:@"Illuminants"];
                      long long v132 = [v131 objectAtIndexedSubscript:v98];
                      long long v133 = [v132 objectForKeyedSubscript:@"ModelB"];
                      uint64_t v70 = _computeALSProfileTableWithALSModel(v130, v133, v279, v278, *((void *)a3 + 3), *(unsigned __int16 *)(a1 + 12), *(unsigned __int16 *)(a1 + 14), v91);

                      id v16 = v290;
                      id v15 = v291;
                      uint64_t v104 = v277;
                      if (v70)
                      {
                        uint64_t v274 = v288;
                        LODWORD(v273) = v70;
                        FigDebugAssert3();
                      }
                      float32x4_t v25 = a3;
                      float v23 = v297;
                      char v19 = v283;
                      uint64_t v20 = v285;
                      float32x4_t v24 = v289;
                      goto LABEL_140;
                    }
                    uint64_t v274 = v288;
                    LODWORD(v273) = v70;
                    FigDebugAssert3();
                    float32x4_t v25 = a3;
                    id v16 = v290;
                    id v15 = v291;
                    char v19 = v283;
                    uint64_t v20 = v285;
                    float v23 = v297;
                    float32x4_t v24 = v289;
                    goto LABEL_139;
                  }
LABEL_138:
                  uint64_t v274 = v288;
                  LODWORD(v273) = 0;
                  FigDebugAssert3();
                  uint64_t v70 = FigSignalErrorAt();
                  float32x4_t v24 = v111;
                  id v16 = v290;
                  id v15 = v291;
                  char v19 = v283;
                  float v23 = v297;
LABEL_139:
                  uint64_t v104 = v277;
                  goto LABEL_140;
                }

                uint64_t v20 = v285;
                id v115 = v276;
              }

              float32x4_t v25 = a3;
              goto LABEL_138;
            }
          }
          uint64_t v274 = v288;
          LODWORD(v273) = 0;
          FigDebugAssert3();
          uint64_t v70 = FigSignalErrorAt();
          char v19 = v283;
          float v23 = v297;
          float32x4_t v24 = v289;
          id v15 = v291;
LABEL_140:

          goto LABEL_141;
        }
        uint64_t v274 = v288;
        LODWORD(v273) = 0;
        FigDebugAssert3();
        uint64_t v70 = FigSignalErrorAt();
      }
      else
      {
        uint64_t v274 = v288;
        LODWORD(v273) = 0;
        FigDebugAssert3();
        uint64_t v70 = FigSignalErrorAt();
        float32x4_t v25 = a3;
        id v16 = v290;
        id v15 = v291;
      }
      char v19 = v283;
      float v23 = v297;
      goto LABEL_140;
    }
    uint64_t v274 = v288;
    LODWORD(v273) = 0;
  }
  else
  {
    uint64_t v274 = v288;
    LODWORD(v273) = 0;
  }
  FigDebugAssert3();
  uint64_t v70 = FigSignalErrorAt();
LABEL_141:
  id v17 = v287;
LABEL_142:

  long long v169 = v292;
  if (v70)
  {
    FigDebugAssert3();
    goto LABEL_193;
  }
  if (*((unsigned char *)v25 + 598))
  {
    unsigned int v174 = *(unsigned __int16 *)(a1 + 14);
    goto LABEL_145;
  }
  if (*((unsigned char *)v25 + 597))
  {
    uint64_t v206 = *((void *)v25 + 1);
    if (v206)
    {
      unsigned int v207 = *(unsigned __int16 *)(a1 + 14);
      if (*(_WORD *)(a1 + 14))
      {
        unsigned __int16 v208 = 0;
        uint64_t v209 = *(unsigned __int16 *)(a1 + 12);
        float32x4_t v171 = (float32x4_t)vdupq_n_s32(0x477FFF00u);
        do
        {
          if (v209)
          {
            uint64_t v210 = 0;
            __int16 v211 = v208 * v209;
            uint64_t v212 = *(char **)v25;
            v172.i32[0] = (__int32)v25[143];
            uint64_t v213 = *((void *)v25 + 5);
            id v214 = v25 + 142;
            float32x4_t v215 = (float32x4_t)vdupq_lane_s32(v172, 0);
            float32x4_t v216 = vld1q_dup_f32(v214);
            do
            {
              uint64_t v217 = (unsigned __int16)(v211 + v210);
              float v218 = (float)*(unsigned int *)(v206 + 4 * v217);
              _S6 = v218 / *(float *)v172.i32;
              __asm { FCVT            H6, S6 }
              *(_WORD *)(v213 + 2 * v217) = LOWORD(_S6);
              uint64_t v220 = 16 * ((v211 + (_WORD)v210) & 0x3FFF);
              float32x4_t v221 = vcvtq_f32_u32(*(uint32x4_t *)&v212[v220]);
              float32x4_t v222 = vdivq_f32(vmulq_n_f32(v221, v218), v215);
              v173.f32[0] = fmaxf(fmaxf(v222.f32[0], fmaxf(v222.f32[1], fmaxf(v222.f32[2], v222.f32[3]))), 65535.0);
              float32x4_t v173 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v173.f32, 0);
              *(uint32x4_t *)&v212[v220] = vcvtq_u32_f32(vmlaq_f32(v221, v216, vsubq_f32(vdivq_f32(vmulq_f32(v222, v171), v173), v221)));
              ++v210;
            }
            while (v209 != v210);
          }
          ++v208;
        }
        while (v207 > v208);
      }
      *(float *)(a1 + 40) = v25[142];
    }
  }
  unsigned int v174 = *(unsigned __int16 *)(a1 + 14);
  if (*(_WORD *)(a1 + 14))
  {
    unsigned __int16 v223 = 0;
    uint64_t v224 = *(unsigned __int16 *)(a1 + 12);
    float v225 = 1.0;
    do
    {
      if (v224)
      {
        uint64_t v226 = 0;
        __int16 v227 = v223 * v224;
        v228 = *(unsigned int **)v25;
        float v229 = v25[144];
        do
        {
          float v230 = (float)v228[4 * ((v227 + (_WORD)v226) & 0x3FFF)];
          uint64_t v231 = (4 * ((v227 + (_WORD)v226) & 0x3FFF)) | 1u;
          float v232 = (float)v228[v231];
          uint64_t v233 = (4 * ((v227 + (_WORD)v226) & 0x3FFF)) | 2u;
          float v234 = (float)v228[v233];
          uint64_t v235 = (4 * ((v227 + (_WORD)v226) & 0x3FFF)) | 3u;
          float v236 = (float)v228[v235];
          if (v229 < 1.0)
          {
            float v237 = v229 + (float)((float)(1.0 / (float)(v236 / v25[143])) * (float)(1.0 - v229));
            float v230 = v237 * v230;
            float v232 = v237 * v232;
            float v234 = v237 * v234;
            float v236 = v237 * v236;
            v228[4 * ((v227 + (_WORD)v226) & 0x3FFF)] = v230;
            v228[v231] = v232;
            v228[v233] = v234;
            v228[v235] = v236;
          }
          float v225 = fmaxf(v225, fmaxf(v230, fmaxf(v232, fmaxf(v234, v236))));
          ++v226;
        }
        while (v224 != v226);
      }
      ++v223;
    }
    while (v174 > v223);
    v170.i32[0] = (__int32)v25[143];
    v171.f32[0] = v225 / *(float *)v170.i32;
    *(float *)(a1 + 16) = 1.0 / v171.f32[0];
    if ((a7 & 1) == 0)
    {
      unsigned __int16 v238 = 0;
      float32x4_t v239 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v171.f32, 0);
      do
      {
        if (v224)
        {
          uint64_t v240 = 0;
          v241 = *(uint32x4_t **)v25;
          do
          {
            v241[(v238 * (_WORD)v224 + (_WORD)v240) & 0x3FFF] = vcvtq_u32_f32(vdivq_f32(vcvtq_f32_u32(v241[(v238 * (_WORD)v224 + (_WORD)v240) & 0x3FFF]), v239));
            ++v240;
          }
          while (v224 != v240);
        }
        ++v238;
      }
      while (v174 > v238);
    }
  }
  else
  {
    v170.i32[0] = (__int32)v25[143];
    *(float *)(a1 + 16) = 1.0 / (float)(1.0 / *(float *)v170.i32);
  }
  if (*((unsigned char *)v25 + 596))
  {
    uint64_t v248 = *((void *)v25 + 2);
    if (v248)
    {
      uint64_t v249 = *((void *)v25 + 3);
      if (v249)
      {
        if (!v174) {
          goto LABEL_145;
        }
        unsigned __int16 v250 = 0;
        uint64_t v251 = *(unsigned __int16 *)(a1 + 12);
        do
        {
          if (v251)
          {
            uint64_t v252 = 0;
            __int16 v253 = v250 * v251;
            v254 = *(char **)v25;
            do
            {
              uint64_t v255 = 4 * ((unsigned __int16)(4 * (v253 + v252)) | 1u);
              v256.i32[0] = *(_DWORD *)(v248 + 4 * (unsigned __int16)(v253 + v252));
              v256.i32[1] = *(_DWORD *)(v249 + 4 * (unsigned __int16)(v253 + v252));
              *(uint32x2_t *)&v254[v255] = vcvt_u32_f32(vmul_f32(v256, vcvt_f32_u32(*(uint32x2_t *)&v254[v255])));
              ++v252;
            }
            while (v251 != v252);
          }
          ++v250;
        }
        while (v174 > v250);
      }
    }
  }
  if (*(unsigned char *)(a1 + 36))
  {
    if (v174)
    {
      __int16 v257 = 0;
      uint64_t v258 = 0;
      uint64_t v259 = *(unsigned __int16 *)(a1 + 12);
      do
      {
        if (v259)
        {
          uint64_t v260 = 0;
          v261 = *(unsigned int **)v25;
          uint64_t v262 = *((void *)v25 + 4);
          do
          {
            _S1 = (float)v261[4 * ((v257 + (_WORD)v260) & 0x3FFF)] / *(float *)v170.i32;
            __asm { FCVT            H1, S1 }
            *(_WORD *)(v262 + 2 * (v260 + v259 * (v258 + *(unsigned __int16 *)(a1 + 48)))) = LOWORD(_S1);
            _S1 = (float)v261[(4 * ((v257 + (_WORD)v260) & 0x3FFF)) | 1] / *(float *)v170.i32;
            __asm { FCVT            H1, S1 }
            *(_WORD *)(v262 + 2 * (v260 + v259 * (v258 + *(unsigned __int16 *)(a1 + 50)))) = LOWORD(_S1);
            _S1 = (float)v261[(4 * ((v257 + (_WORD)v260) & 0x3FFF)) | 2] / *(float *)v170.i32;
            __asm { FCVT            H1, S1 }
            *(_WORD *)(v262 + 2 * (v260 + v259 * (v258 + *(unsigned __int16 *)(a1 + 52)))) = LOWORD(_S1);
            _S1 = (float)v261[(4 * ((v257 + (_WORD)v260) & 0x3FFF)) | 3] / *(float *)v170.i32;
            __asm { FCVT            H1, S1 }
            *(_WORD *)(v262 + 2 * (v260 + v259 * (v258 + *(unsigned __int16 *)(a1 + 54)))) = LOWORD(_S1);
            ++v260;
          }
          while (v259 != v260);
        }
        ++v258;
        v257 += v259;
      }
      while (v258 != v174);
    }
  }
  else if (v174)
  {
    unsigned __int16 v267 = 0;
    uint64_t v268 = *(unsigned __int16 *)(a1 + 12);
    float32x4_t v269 = (float32x4_t)vdupq_lane_s32(v170, 0);
    do
    {
      if (v268)
      {
        uint64_t v270 = 0;
        v271 = *(uint32x4_t **)v25;
        uint64_t v272 = *((void *)v25 + 4);
        do
        {
          *(float16x4_t *)(v272 + 8 * ((v267 * (_WORD)v268 + (_WORD)v270) & 0x3FFF)) = vcvt_f16_f32(vdivq_f32(vcvtq_f32_u32(v271[(v267 * (_WORD)v268 + (_WORD)v270) & 0x3FFF]), v269));
          ++v270;
        }
        while (v268 != v270);
      }
      ++v267;
    }
    while (v174 > v267);
  }
LABEL_145:
  uint64_t v175 = *(unsigned __int16 *)(a1 + 12);
  uint64_t v176 = v174;
  if (!*(unsigned char *)(a1 + 36))
  {
    v242 = *(void **)(a1 + 136);
    uint64_t v243 = *((void *)v25 + 4);
    long long v303 = 0uLL;
    *(void *)&long long v304 = 0;
    *((void *)&v304 + 1) = v175;
    *(void *)&long long v305 = v174;
    *((void *)&v305 + 1) = 1;
    [v242 replaceRegion:&v303 mipmapLevel:0 withBytes:v243 bytesPerRow:(8 * v175)];
LABEL_188:
    if (*((unsigned char *)v25 + 597))
    {
      uint64_t v244 = *((void *)v25 + 5);
      if (v244)
      {
        uint64_t v245 = 2 * *(unsigned __int16 *)(a1 + 12);
        v246 = *(void **)(a1 + 144);
        long long v303 = 0uLL;
        *(void *)&long long v304 = 0;
        *((void *)&v304 + 1) = v175;
        *(void *)&long long v305 = v176;
        *((void *)&v305 + 1) = 1;
        [v246 replaceRegion:&v303 mipmapLevel:0 withBytes:v244 bytesPerRow:v245];
      }
    }
    uint64_t v70 = 0;
    goto LABEL_192;
  }
  int v177 = v174 * v175;
  long long v178 = (short float *)malloc_type_calloc(8 * v174 * v175, 2uLL, 0x1000040BDFB0063uLL);
  if (v178)
  {
    long long v179 = v178;
    uint64_t v180 = 0;
    long long v181 = (char *)&v178[4 * v177];
    v295 = v178 + 2;
    do
    {
      if (v177)
      {
        int v182 = 0;
        long long v183 = v295;
        int v184 = *((unsigned __int8 *)a3 + 598);
        uint64_t v185 = *((void *)a3 + 6);
        uint64_t v186 = *((void *)a3 + 4);
        do
        {
          if (v184)
          {
            unsigned int v187 = 4 * v182;
            unsigned int v188 = (4 * v182) | 1;
            unsigned int v189 = (4 * v182) | 2;
            unsigned int v190 = (4 * v182) | 3;
          }
          else
          {
            unsigned int v187 = v182 + *(unsigned __int16 *)(a1 + 48) * v175;
            unsigned int v188 = v182 + *(unsigned __int16 *)(a1 + 50) * v175;
            unsigned int v189 = v182 + *(unsigned __int16 *)(a1 + 52) * v175;
            unsigned int v190 = v182 + *(unsigned __int16 *)(a1 + 54) * v175;
          }
          uint64_t v301 = *(void *)(a1 + 56);
          unsigned int v191 = v182
               + *(unsigned __int16 *)((unint64_t)&v301 & 0xFFFFFFFFFFFFFFF9 | (2 * (v180 & 3))) * v175;
          uint64_t v300 = *(void *)(a1 + 64);
          unsigned int v192 = v182
               + *(unsigned __int16 *)((unint64_t)&v300 & 0xFFFFFFFFFFFFFFF9 | (2 * (v180 & 3))) * v175;
          uint64_t v299 = *(void *)(a1 + 72);
          unsigned int v193 = v182
               + *(unsigned __int16 *)((unint64_t)&v299 & 0xFFFFFFFFFFFFFFF9 | (2 * (v180 & 3))) * v175;
          uint64_t v298 = *(void *)(a1 + 80);
          unsigned int v194 = v182
               + *(unsigned __int16 *)((unint64_t)&v298 & 0xFFFFFFFFFFFFFFF9 | (2 * (v180 & 3))) * v175;
          *(v183 - 2) = *(short float *)(v185 + 2 * v191) * *(short float *)(v186 + 2 * v187);
          *(v183 - 1) = *(short float *)(v185 + 2 * v192) * *(short float *)(v186 + 2 * v188);
          short float *v183 = *(short float *)(v185 + 2 * v193) * *(short float *)(v186 + 2 * v189);
          v183[1] = *(short float *)(v185 + 2 * v194) * *(short float *)(v186 + 2 * v190);
          ++v182;
          v183 += 4;
        }
        while (v177 != v182);
      }
      unsigned __int16 v195 = *(_WORD *)(a1 + 14);
      if (v195)
      {
        unsigned int v196 = 0;
        unsigned int v197 = *(unsigned __int16 *)(a1 + 12);
        do
        {
          if (v197)
          {
            for (unsigned int m = 0; m < v197; ++m)
            {
              int v199 = 4 * (m + v196 * v197);
              _S0 = _getShiftedValueFromRawData((uint64_t)v179, m, v196, 0, a1);
              __asm { FCVT            H0, S0 }
              v201 = &v181[2 * v199];
              *(_WORD *)v201 = LOWORD(_S0);
              _S0 = _getShiftedValueFromRawData((uint64_t)v179, m, v196, 1u, a1);
              __asm { FCVT            H0, S0 }
              *((_WORD *)v201 + 1) = LOWORD(_S0);
              _S0 = _getShiftedValueFromRawData((uint64_t)v179, m, v196, 2u, a1);
              __asm { FCVT            H0, S0 }
              *((_WORD *)v201 + 2) = LOWORD(_S0);
              _S0 = _getShiftedValueFromRawData((uint64_t)v179, m, v196, 3u, a1);
              __asm { FCVT            H0, S0 }
              *((_WORD *)v201 + 3) = LOWORD(_S0);
              unsigned int v197 = *(unsigned __int16 *)(a1 + 12);
            }
            unsigned __int16 v195 = *(_WORD *)(a1 + 14);
          }
          ++v196;
        }
        while (v196 < v195);
      }
      v205 = *(void **)(a1 + 136);
      long long v303 = 0uLL;
      *(void *)&long long v304 = 0;
      *((void *)&v304 + 1) = v175;
      *(void *)&long long v305 = v176;
      *((void *)&v305 + 1) = 1;
      objc_msgSend(v205, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", &v303, 0, v180++, v181, 8 * v175, 0, v273, v274);
    }
    while (v180 != 4);
    free(v179);
    float32x4_t v25 = a3;
    goto LABEL_188;
  }
  FigDebugAssert3();
  uint64_t v70 = FigSignalErrorAt();
LABEL_192:
  id v16 = v290;
  id v15 = v291;
  long long v169 = v292;
LABEL_193:
  free(*(void **)v25);
  free(*((void **)v25 + 4));
  free(*((void **)v25 + 5));
  free(*((void **)v25 + 2));
  free(*((void **)v25 + 3));
  free(*((void **)v25 + 1));
  free(*((void **)v25 + 6));

  return v70;
}

float _getShiftedValueFromRawData(uint64_t a1, int a2, int a3, unsigned int a4, uint64_t a5)
{
  v10.n64_u64[0] = offsetForPixelComponentWithFirstPixel(a4, *(_DWORD *)(a5 + 32)).n64_u64[0];
  int v12 = *(unsigned __int16 *)(a5 + 12);
  if (a2 + 1 < v12 - 1) {
    int v13 = a2 + 1;
  }
  else {
    int v13 = v12 - 1;
  }
  if (a3 + 1 < *(unsigned __int16 *)(a5 + 14) - 1) {
    int v14 = a3 + 1;
  }
  else {
    int v14 = *(unsigned __int16 *)(a5 + 14) - 1;
  }
  int v15 = 4 * v12;
  v16.f32[0] = (float)*(unsigned __int16 *)(a5 + 8);
  LOWORD(v11) = *(_WORD *)(a5 + 10);
  v16.f32[1] = (float)v11;
  unsigned int v17 = a4 + 4 * a2;
  _H2 = *(_WORD *)(a1 + 2 * (v17 + v15 * a3));
  _D1 = vdiv_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vadd_s32((int32x2_t)v10.n64_u64[0], (int32x2_t)v10.n64_u64[0]), (int8x8_t)0xFFFF0000FFFFLL)), v16);
  __asm { FCVT            S0, H2 }
  _H2 = *(_WORD *)(a1 + 2 * (v15 * a3 + a4 + 4 * v13));
  __asm { FCVT            S2, H2 }
  int v27 = v14 * v15;
  _H3 = *(_WORD *)(a1 + 2 * (v17 + v27));
  __asm { FCVT            S3, H3 }
  _H4 = *(_WORD *)(a1 + 2 * (a4 + 4 * v13 + v27));
  __asm { FCVT            S4, H4 }
  _S2 = vmlas_n_f32(_S3, _S4 - _S3, _D1.f32[0]) - vmlas_n_f32(_S0, _S2 - _S0, _D1.f32[0]);
  __asm { FMLA            S0, S2, V1.S[1] }
  return result;
}

uint64_t _computeALSProfileTableWithALSModel(void *a1, void *a2, unsigned int a3, unsigned int a4, uint64_t a5, unsigned int a6, unsigned int a7, float a8)
{
  id v14 = a1;
  id v15 = a2;
  v75[0] = 0;
  unsigned int v67 = a4;
  unsigned int v68 = a3;
  float32x2_t v16 = (float *)malloc_type_malloc(4 * a3 * (unint64_t)a4, 0x6D50AA6AuLL);
  unsigned __int16 v17 = objc_msgSend(v15, "cmi_intValueForKey:defaultValue:found:", @"Mean", 0, v75);
  __int16 v69 = objc_msgSend(v14, "cmi_intValueForKey:defaultValue:found:", @"UMin", 0, v75);
  unsigned __int16 v18 = objc_msgSend(v14, "cmi_intValueForKey:defaultValue:found:", @"D", 0, v75);
  unsigned __int16 v19 = objc_msgSend(v14, "cmi_intValueForKey:defaultValue:found:", @"RScale", 0, v75);
  uint64_t v20 = [v14 objectForKeyedSubscript:@"U"];
  int32x2_t v21 = [v15 objectForKeyedSubscript:@"R"];
  if (!v16
    || !v17
    || !v69
    || (v63 = a6, (int v22 = v18) == 0)
    || !v19
    || !v20
    || [v20 count] != 2
    || !v21
    || [v21 count] != 2)
  {
    FigDebugAssert3();
    float v23 = 0;
    float32x4_t v24 = 0;
LABEL_25:
    uint64_t v60 = FigSignalErrorAt();
    goto LABEL_23;
  }
  int v62 = v17;
  uint64_t v70 = v21;
  float v23 = [v20 objectAtIndexedSubscript:0];
  float32x4_t v24 = [v20 objectAtIndexedSubscript:1];
  uint64_t v25 = [v23 count];
  uint64_t v26 = v67 * v68;
  if (v25 != v26)
  {
    FigDebugAssert3();
    int32x2_t v21 = v70;
    goto LABEL_25;
  }
  uint64_t v74 = v23;
  id v27 = v14;
  id v28 = v15;
  uint64_t v29 = v25;
  if ([v24 count] != v25)
  {
    FigDebugAssert3();
    int32x2_t v21 = v70;
    id v15 = v28;
    id v14 = v27;
    float v23 = v74;
    goto LABEL_25;
  }
  uint64_t v64 = v28;
  float v65 = v27;
  uint64_t v72 = v29;
  id v30 = [v70 objectAtIndexedSubscript:0];
  uint64_t v71 = v19;
  __int16 v31 = [v30 intValue];

  [v70 objectAtIndexedSubscript:1];
  int32x4_t v32 = v73 = v24;
  __int16 v33 = [v32 intValue];

  if (v26)
  {
    uint64_t v34 = 0;
    uint64_t v35 = v31;
    double v36 = a8;
    uint64_t v37 = v33;
    do
    {
      unsigned int v38 = [v74 objectAtIndexedSubscript:v34];
      int v39 = [v38 intValue];

      uint64_t v40 = (v69 + ((v22 * (uint64_t)v39) >> 16)) * v35;
      uint64_t v41 = [v73 objectAtIndexedSubscript:v34];
      int v42 = [v41 intValue];

      float v43 = v36
          * (((double)(((v40 + (v69 + ((v22 * (uint64_t)v42) >> 16)) * v37) * v71) >> 16) * 0.0000305175781 + (double)v62)
           * 0.0000305175781
           + -1.0)
          + 1.0;
      v16[v34++] = v43;
    }
    while (v72 != v34);
  }
  float32x4_t v24 = v73;
  float v23 = v74;
  if (a7)
  {
    uint64_t v44 = 0;
    float v45 = (float)v63;
    float v46 = (float)a7;
    float v47 = 0.0;
    id v15 = v64;
    id v14 = v65;
    int32x2_t v21 = v70;
    do
    {
      if (v63)
      {
        uint64_t v48 = 0;
        float v49 = (float)((float)v67 + -1.0) * (float)(v47 / v46);
        int v50 = (int)v49 * v68;
        unsigned int v51 = v68 + v50;
        float v52 = v49 - (float)(int)v49;
        float v53 = 0.0;
        do
        {
          float v54 = (float)((float)v68 + -1.0) * (float)(v53 / v45);
          float v55 = v16[v50 + (int)v54];
          int v56 = (int)v54 + 1;
          float v57 = v16[v51 + (int)v54];
          float v58 = v54 - (float)(int)v54;
          float v59 = v55 + (float)((float)(v16[v56 + v50] - v55) * v58);
          *(float *)(a5 + 4 * v48++) = v59
                                     + (float)((float)((float)(v57 + (float)((float)(v16[v56 + v51] - v57) * v58)) - v59)
                                             * v52);
          float v53 = (float)(int)v48;
        }
        while (v45 > (float)(int)v48);
      }
      float v47 = (float)(int)++v44;
      a5 += 4 * v63;
    }
    while (v46 > (float)(int)v44);
    uint64_t v60 = 0;
  }
  else
  {
    uint64_t v60 = 0;
    id v15 = v64;
    id v14 = v65;
    int32x2_t v21 = v70;
  }
LABEL_23:
  free(v16);

  return v60;
}

id getBlackLevelShadingThumbnail(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  float v5 = v4;
  if (v4 && v3 && -[SoftISPInputFrame cfaLayout]((uint64_t)v4))
  {
    id v6 = -[SoftISPInputFrame metadata]((uint64_t)v5);
    id v7 = v6;
    if (v6)
    {
      char v8 = objc_msgSend(v6, "cmi_BOOLValueForKey:defaultValue:found:", *MEMORY[0x263F2F6A8], 1, 0);
      if (-[SoftISPInputFrame cfaLayout]((uint64_t)v5) == 1
        || -[SoftISPInputFrame cfaLayout]((uint64_t)v5) == 2)
      {
        uint64_t v9 = [v3 blackLevelShadingThumbnailQsum];
LABEL_8:
        __n64 v10 = (void *)v9;
        goto LABEL_9;
      }
      if (-[SoftISPInputFrame cfaLayout]((uint64_t)v5) == 3)
      {
        id v12 = v5;
        -[SoftISPInputFrame sensorReadoutRect]((uint64_t)v12);
        int v14 = v13;
        -[SoftISPInputFrame sensorReadoutRect]((uint64_t)v12);
        int v16 = v15;

        if ((v16 * v14) < 0xC2E801)
        {
          if (v8) {
            [v3 blackLevelShadingThumbnailQsub2xSplitPD];
          }
          else {
          uint64_t v9 = [v3 blackLevelShadingThumbnailQsub2xSumPD];
          }
        }
        else
        {
          uint64_t v9 = [v3 blackLevelShadingThumbnailHires];
        }
        goto LABEL_8;
      }
    }
    else
    {
      FigDebugAssert3();
      FigSignalErrorAt();
    }
    __n64 v10 = 0;
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    __n64 v10 = 0;
    id v7 = 0;
  }
LABEL_9:

  return v10;
}

void __getVNObservationClass_block_invoke_cold_1(void *a1)
{
  int32x4_t v2 = [MEMORY[0x263F08690] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *VisionLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"utl_visionSoftLinking.h", 38, @"%s", *a1);

  __break(1u);
}

void __getVNObservationClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getVNObservationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"utl_visionSoftLinking.h", 46, @"Unable to find class %s", "VNObservation");

  __break(1u);
}

void __getVNFaceObservationClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getVNFaceObservationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"utl_visionSoftLinking.h", 42, @"Unable to find class %s", "VNFaceObservation");

  __break(1u);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D20](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x270EE7188]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x270EE7278](dict, rect);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x270EE7B30](target, key, attachmentModeOut);
}

uint64_t CMILSCOISAdaptation_convertV2CICTableToV1CICTableWithOISOffset()
{
  return MEMORY[0x270F12D98]();
}

uint64_t CMILSCOISAdaptation_convertV2LSCTableToV1LSCTableWithOISOffset()
{
  return MEMORY[0x270F12DA0]();
}

uint64_t CMILSCOISAdaptation_extrapAndCropCICWithOISOffset()
{
  return MEMORY[0x270F12DA8]();
}

uint64_t CMILSCOISAdaptation_extrapAndCropLSCLumaOnlyWithOISOffset()
{
  return MEMORY[0x270F12DB0]();
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x270EE7C48](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C78](retstr, sbuf);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x270EE7DD8](retstr, time, *(void *)&newTimescale, *(void *)&method);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x270EE9FC0](buffer, key, attachmentMode);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA170](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA220](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA250](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA258](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x270EEA340](allocator, *(void *)&pixelFormat);
}

uint64_t CVPixelFormatDescriptionGetDescriptionWithPixelFormatType()
{
  return MEMORY[0x270EEA348]();
}

uint64_t CreatePixelBuffer()
{
  return MEMORY[0x270F12DB8]();
}

uint64_t CreatePixelBufferWithWiringAssertion()
{
  return MEMORY[0x270F12DC8]();
}

uint64_t FigCFDictionaryGetCGRectIfPresent()
{
  return MEMORY[0x270EE8038]();
}

uint64_t FigCaptureCFCreatePropertyList()
{
  return MEMORY[0x270F12C40]();
}

uint64_t FigCaptureComputeImageGainFromMetadata()
{
  return MEMORY[0x270F12DD8]();
}

uint64_t FigCaptureGetModelSpecificName()
{
  return MEMORY[0x270F12C68]();
}

uint64_t FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect()
{
  return MEMORY[0x270F12C78]();
}

uint64_t FigCaptureMetadataUtilitiesCopyZoomRelatedMetadata()
{
  return MEMORY[0x270F12C80]();
}

uint64_t FigCaptureMetadataUtilitiesNormalizeCropRect()
{
  return MEMORY[0x270F12C88]();
}

uint64_t FigCaptureMetadataUtilitiesPreventFurtherCropping()
{
  return MEMORY[0x270F12C90]();
}

uint64_t FigCaptureMetadataUtilitiesUpdateDetectedObjectsInfoAndFacesArrayWithCropRect()
{
  return MEMORY[0x270F12C98]();
}

uint64_t FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop()
{
  return MEMORY[0x270F12CA0]();
}

uint64_t FigCapturePlatformChipRevisionIdentifier()
{
  return MEMORY[0x270F12CA8]();
}

uint64_t FigCapturePlatformGetVariant()
{
  return MEMORY[0x270F12CB0]();
}

uint64_t FigCapturePlatformIdentifier()
{
  return MEMORY[0x270F12CC0]();
}

uint64_t FigCapturePlatformIdentifierString()
{
  return MEMORY[0x270F12CC8]();
}

uint64_t FigCaptureUncompressedPixelFormatForPixelFormat()
{
  return MEMORY[0x270F12D18]();
}

uint64_t FigDebugAssert3()
{
  return MEMORY[0x270EE8178]();
}

uint64_t FigDispatchQueueCreateTargetingPThreadRootQueueWithPriority()
{
  return MEMORY[0x270EE8198]();
}

uint64_t FigGetCFPreferenceBooleanWithDefault()
{
  return MEMORY[0x270EE8238]();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return MEMORY[0x270EE8248]();
}

uint64_t FigHostTimeToNanoseconds()
{
  return MEMORY[0x270EE82D0]();
}

uint64_t FigMetalDecRef()
{
  return MEMORY[0x270F12DE0]();
}

uint64_t FigMetalDetachFromAllocator()
{
  return MEMORY[0x270F12DE8]();
}

uint64_t FigMetalIncRef()
{
  return MEMORY[0x270F12DF0]();
}

uint64_t FigMetalIsValid()
{
  return MEMORY[0x270F12DF8]();
}

uint64_t FigMotionComputeBlurScores()
{
  return MEMORY[0x270F12D40]();
}

uint64_t FigNanosecondsToHostTime()
{
  return MEMORY[0x270EE82F0]();
}

uint64_t FigNote_AllowInternalDefaultLogs()
{
  return MEMORY[0x270EE82F8]();
}

uint64_t FigOSTransactionCreate()
{
  return MEMORY[0x270EE8310]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x270EE8378]();
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EF4C80](buffer, planeIndex);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x270EF4C90]();
}

uint64_t IOSurfaceGetCompressionFootprintOfPlane()
{
  return MEMORY[0x270EF4CF0]();
}

uint64_t IOSurfaceGetCompressionTypeOfPlane()
{
  return MEMORY[0x270EF4CF8]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D48](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D68](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4DE0](buffer);
}

uint64_t IOSurfaceSetBulkAttachments2()
{
  return MEMORY[0x270EF4E40]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x270EF5EE0]();
}

uint64_t MTLPixelFormatGetName()
{
  return MEMORY[0x270EF5EF0]();
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
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
  MEMORY[0x270ED7DD0](a1);
  return result;
}

simd_float2x2 __invert_f2(simd_float2x2 a1)
{
  MEMORY[0x270ED7E10]((__n128)a1, *(__n128 *)((char *)&a1 + 8));
  result.columns[1] = v2;
  result.columns[0] = v1;
  return result;
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x270ED7E18]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x270ED7E20]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
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

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

simd_float4 _simd_log2_f4(simd_float4 x)
{
  MEMORY[0x270ED82C8]((__n128)x);
  return result;
}

simd_float4 _simd_pow_f4(simd_float4 x, simd_float4 y)
{
  MEMORY[0x270ED8320]((__n128)x, (__n128)y);
  return result;
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x270F27EE0]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x270F27F08]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x270F27F20]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x270F27F78]();
}

uint64_t espresso_network_bind_direct_cvpixelbuffer()
{
  return MEMORY[0x270F27FA0]();
}

uint64_t espresso_network_query_blob_dimensions()
{
  return MEMORY[0x270F28030]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x270F28068]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x270F28070]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x270F28090]();
}

uint64_t espresso_plan_get_error_info()
{
  return MEMORY[0x270F280A8]();
}

uint64_t espresso_plan_submit()
{
  return MEMORY[0x270F280C8]();
}

long double exp2(long double __x)
{
  MEMORY[0x270ED9860](__x);
  return result;
}

float exp2f(float a1)
{
  MEMORY[0x270ED9868](a1);
  return result;
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

uint64_t fig_log_call_emit_and_clean_up_after_send_and_compose()
{
  return MEMORY[0x270EE84B8]();
}

uint64_t fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type()
{
  return MEMORY[0x270EE84C0]();
}

uint64_t fig_log_get_emitter()
{
  return MEMORY[0x270EE84C8]();
}

uint64_t fig_note_initialize_category_with_default_work_cf()
{
  return MEMORY[0x270EE84D8]();
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

kern_return_t host_page_size(host_t a1, vm_size_t *a2)
{
  return MEMORY[0x270ED9E20](*(void *)&a1, a2);
}

kern_return_t host_statistics(host_t host_priv, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x270ED9E40](*(void *)&host_priv, *(void *)&flavor, host_info_out, host_info_outCnt);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

float ldexpf(float a1, int a2)
{
  MEMORY[0x270EDA030](*(void *)&a2, a1);
  return result;
}

uint64_t loadDefaultsWritesWithPrefix()
{
  return MEMORY[0x270F12D60]();
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x270EDA0E0](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x270EDA178]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t packHomographyToNSArray()
{
  return MEMORY[0x270F12E18]();
}

uint64_t portIndexFromPortType()
{
  return MEMORY[0x270F12D90]();
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB718](__str, __endptr, *(void *)&__base);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t unpackHomographyFromNSArray()
{
  return MEMORY[0x270F12E20]();
}