TXRImageIndependent *newScaledImageWithLancosFilter(void *a1, void *a2, uint64_t a3, void *a4, __n128 a5)
{
  id v8;
  id v9;
  unsigned int v10;
  __CFString *v11;
  uint64_t v12;
  TXRImageIndependent *v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  int32x2_t v23;
  long long v24;
  int8x8_t v25;
  int8x8_t v26;
  int8x8_t v27;
  uint64_t v28;
  vImage_Error v29;
  uint64_t v31;
  TXRDefaultBufferAllocator *v32;
  id v33;
  void *v34;
  vImage_Flags flags;
  void *v36;
  int8x8_t v37;
  vImage_Buffer src;
  vImage_Buffer dest;
  uint64_t vars8;

  v8 = a1;
  v9 = a2;
  [v8 dimensions];
  if (v10 >= 2)
  {
    if (a4)
    {
      v11 = @"Mipmap Generation of 3D textures not suppoted";
      v12 = 0;
LABEL_7:
      _newTXRErrorWithCodeAndErrorString(v12, (uint64_t)v11);
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_8:
    v13 = 0;
    goto LABEL_19;
  }
  if (+[TXRPixelFormatInfo isCompressed:](TXRPixelFormatInfo, "isCompressed:", [v8 pixelFormat]))
  {
    if (a4)
    {
      v11 = @"Cannot scale image with pixel format";
      v12 = 8;
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  if (a3)
  {
    if (a3 != 1) {
      newScaledImageWithLancosFilter_cold_1();
    }
    flags = 32;
  }
  else
  {
    flags = 0;
  }
  v14 = +[TXRPixelFormatInfo packedMemoryLayoutForFormat:dimensions:](TXRPixelFormatInfo, "packedMemoryLayoutForFormat:dimensions:", [v8 pixelFormat], a5.n128_f64[0]);
  v16 = v15;
  v17 = (void *)[v9 newBufferWithLength:v15];
  v36 = [v17 map];
  v18 = (void *)[v36 bytes];
  v19 = [v8 buffer];
  v20 = [v19 map];

  v21 = [v20 bytes];
  v22 = [v8 offset];
  dest.data = v18;
  v23 = vrev64_s32((int32x2_t)a5.n128_u64[0]);
  *(void *)&v24 = v23.u32[0];
  *((void *)&v24 + 1) = v23.u32[1];
  *(_OWORD *)&dest.height = v24;
  dest.rowBytes = v14;
  src.data = (void *)(v21 + v22);
  [v8 dimensions];
  v37 = v25;
  [v8 dimensions];
  v27 = vext_s8(v37, v26, 4uLL);
  *(void *)&v24 = v27.u32[0];
  *((void *)&v24 + 1) = v27.u32[1];
  *(_OWORD *)&src.height = v24;
  src.rowBytes = [v8 bytesPerRow];
  v28 = [v8 pixelFormat];
  if (v28 == 80 || v28 == 70)
  {
    v29 = vImageScale_ARGB8888(&src, &dest, 0, flags);
LABEL_16:
    if (v29) {
      newScaledImageWithLancosFilter_cold_2();
    }
    v13 = -[TXRImageIndependent initWithDimensions:pixelFormat:alphaInfo:bytesPerRow:bytesPerImage:buffer:offset:]([TXRImageIndependent alloc], "initWithDimensions:pixelFormat:alphaInfo:bytesPerRow:bytesPerImage:buffer:offset:", [v8 pixelFormat], objc_msgSend(v8, "alphaInfo"), v14, v16, v17, 0, a5.n128_f64[0]);
    goto LABEL_18;
  }
  if ([v8 pixelFormat] == 110)
  {
    v29 = vImageScale_ARGB16U(&src, &dest, 0, flags);
    goto LABEL_16;
  }
  if ([v8 pixelFormat] == 112)
  {
    v29 = vImageScale_ARGB16S(&src, &dest, 0, flags);
    goto LABEL_16;
  }
  if ([v8 pixelFormat] == 125)
  {
    v29 = vImageScale_ARGBFFFF(&src, &dest, 0, flags);
    goto LABEL_16;
  }
  if ([v8 pixelFormat] == 55)
  {
    v29 = vImageScale_PlanarF(&src, &dest, 0, flags);
    goto LABEL_16;
  }
  v31 = [v8 pixelFormat];
  if (v31 == 10 || v31 == 1)
  {
    v29 = vImageScale_Planar8(&src, &dest, 0, flags);
    goto LABEL_16;
  }
  v32 = objc_alloc_init(TXRDefaultBufferAllocator);
  v33 = +[TXRDataConverter newImageFromSourceImage:v8 newPixelFormat:125 bufferAllocator:v32 multiplyAlpha:0 gammaDegamma:1 error:a4];
  v34 = newScaledImageWithLancosFilter(v33, v9, a3, a4, a5);

  v13 = +[TXRDataConverter newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:](TXRDataConverter, "newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:", v34, [v8 pixelFormat], v9, 0, 1, a4);
LABEL_18:

LABEL_19:
  return v13;
}

id _newTXRErrorWithCodeAndErrorString(uint64_t a1, uint64_t a2)
{
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a2 forKey:@"TXRErrorKey"];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TXRErrorDomain" code:a1 userInfo:v3];

  return v4;
}

id _newTXRErrorWithCodeAndUserInfo(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F28C58];
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithDomain:@"TXRErrorDomain" code:a1 userInfo:v4];

  return v5;
}

id _newTXRErrorWithCode(uint64_t a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TXRErrorDomain" code:a1 userInfo:0];
  return v1;
}

uint64_t fastConvert(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, void *__dst, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  if (a1)
  {
    if (a2) {
      return fastConvertWithOptions<true,true>(a3, a4, a5, __dst, a7, a8, a9, a10);
    }
    else {
      return fastConvertWithOptions<true,false>(a3, a4, a5, __dst, a7, a8, a9, a10);
    }
  }
  else if (a2)
  {
    return fastConvertWithOptions<false,true>(a3, a4, a5, (int)__dst, a7, a8, a9, a10);
  }
  else
  {
    return fastConvertWithOptions<false,false>(a3, a4, a5, __dst, a7, a8, a9, a10);
  }
}

#error "1DC76F420: too big function (funcsize=0)"

#error "1DC79A068: too big function (funcsize=0)"

#error "1DC7BA79C: too big function (funcsize=0)"

#error "1DC7E1DE8: too big function (funcsize=0)"

float convertFromFloat4Fast<(TXRPixelFormat)71,true>(uint64_t a1, float32x4_t a2)
{
  __asm { FMOV            V1.4S, #1.0 }
  float32x4_t v8 = vminnmq_f32(vmaxnmq_f32(a2, (float32x4_t)0), _Q1);
  float v9 = -v8.f32[0];
  if (v8.f32[0] >= 0.0) {
    float v9 = v8.f32[0];
  }
  long double v10 = v9;
  float32x4_t v29 = v8;
  if (v10 <= 0.003131)
  {
    double v11 = v10 * 12.92;
  }
  else
  {
    double v11 = pow(v10, 0.416666667) * 1.055 + -0.055;
    float32x4_t v8 = v29;
  }
  float v12 = v11;
  if (v8.f32[0] < 0.0) {
    float v12 = -v12;
  }
  **(unsigned char **)a1 = (int)(float)(v12 * 255.0);
  float v13 = v8.f32[1];
  float v14 = -v8.f32[1];
  if (v8.f32[1] >= 0.0) {
    float v14 = v8.f32[1];
  }
  long double v15 = v14;
  if (v15 <= 0.003131)
  {
    double v16 = v15 * 12.92;
  }
  else
  {
    double v16 = pow(v15, 0.416666667) * 1.055 + -0.055;
    v8.i64[1] = v29.i64[1];
  }
  float v17 = v16;
  if (v13 < 0.0) {
    float v17 = -v17;
  }
  *(unsigned char *)(*(void *)a1 + 1) = (int)(float)(v17 * 255.0);
  float v18 = v8.f32[2];
  float v19 = -v8.f32[2];
  if (v8.f32[2] >= 0.0) {
    float v19 = v8.f32[2];
  }
  long double v20 = v19;
  if (v20 <= 0.003131)
  {
    double v21 = v20 * 12.92;
  }
  else
  {
    double v21 = pow(v20, 0.416666667) * 1.055 + -0.055;
    v8.i32[3] = v29.i32[3];
  }
  float v22 = v21;
  if (v18 < 0.0) {
    float v22 = -v22;
  }
  *(unsigned char *)(*(void *)a1 + 2) = (int)(float)(v22 * 255.0);
  float v23 = v8.f32[3];
  float v24 = -v8.f32[3];
  if (v8.f32[3] >= 0.0) {
    float v24 = v8.f32[3];
  }
  long double v25 = v24;
  if (v25 <= 0.003131) {
    double v26 = v25 * 12.92;
  }
  else {
    double v26 = pow(v25, 0.416666667) * 1.055 + -0.055;
  }
  float v27 = v26;
  if (v23 < 0.0) {
    float v27 = -v27;
  }
  float result = v27 * 255.0;
  *(unsigned char *)(*(void *)a1 + 3) = (int)result;
  *(void *)a1 += 4;
  return result;
}

float convertFromFloat4Fast<(TXRPixelFormat)81,true>(uint64_t a1, float32x4_t a2)
{
  __asm { FMOV            V1.4S, #1.0 }
  float32x4_t v8 = vminnmq_f32(vmaxnmq_f32(a2, (float32x4_t)0), _Q1);
  float v9 = v8.f32[2];
  float v10 = -v8.f32[2];
  if (v8.f32[2] >= 0.0) {
    float v10 = v8.f32[2];
  }
  long double v11 = v10;
  float32x4_t v29 = v8;
  if (v11 <= 0.003131)
  {
    double v12 = v11 * 12.92;
  }
  else
  {
    double v12 = pow(v11, 0.416666667) * 1.055 + -0.055;
    float32x4_t v8 = v29;
  }
  float v13 = v12;
  if (v9 < 0.0) {
    float v13 = -v13;
  }
  **(unsigned char **)a1 = (int)(float)(v13 * 255.0);
  float v14 = v8.f32[1];
  float v15 = -v8.f32[1];
  if (v8.f32[1] >= 0.0) {
    float v15 = v8.f32[1];
  }
  long double v16 = v15;
  if (v16 <= 0.003131)
  {
    double v17 = v16 * 12.92;
  }
  else
  {
    double v17 = pow(v16, 0.416666667) * 1.055 + -0.055;
    float32x4_t v8 = v29;
  }
  float v18 = v17;
  if (v14 < 0.0) {
    float v18 = -v18;
  }
  *(unsigned char *)(*(void *)a1 + 1) = (int)(float)(v18 * 255.0);
  float v19 = -v8.f32[0];
  if (v8.f32[0] >= 0.0) {
    float v19 = v8.f32[0];
  }
  long double v20 = v19;
  if (v20 <= 0.003131)
  {
    double v21 = v20 * 12.92;
  }
  else
  {
    double v21 = pow(v20, 0.416666667) * 1.055 + -0.055;
    float32x4_t v8 = v29;
  }
  float v22 = v21;
  if (v8.f32[0] < 0.0) {
    float v22 = -v22;
  }
  *(unsigned char *)(*(void *)a1 + 2) = (int)(float)(v22 * 255.0);
  float v23 = v8.f32[3];
  float v24 = -v8.f32[3];
  if (v8.f32[3] >= 0.0) {
    float v24 = v8.f32[3];
  }
  long double v25 = v24;
  if (v25 <= 0.003131) {
    double v26 = v25 * 12.92;
  }
  else {
    double v26 = pow(v25, 0.416666667) * 1.055 + -0.055;
  }
  float v27 = v26;
  if (v23 < 0.0) {
    float v27 = -v27;
  }
  float result = v27 * 255.0;
  *(unsigned char *)(*(void *)a1 + 3) = (int)result;
  *(void *)a1 += 4;
  return result;
}

uint64_t RGBFloat32ToShareExponent32(int8x16_t a1)
{
  float v1 = 65408.0;
  if (*(float *)a1.i32 < 65408.0) {
    float v1 = *(float *)a1.i32;
  }
  if (*(float *)a1.i32 <= 0.0) {
    float v2 = 0.0;
  }
  else {
    float v2 = v1;
  }
  float32x2_t v3 = (float32x2_t)vext_s8(*(int8x8_t *)a1.i8, (int8x8_t)*(_OWORD *)&vextq_s8(a1, a1, 8uLL), 4uLL);
  float32x2_t v4 = (float32x2_t)vdup_n_s32(0x477F8000u);
  int8x8_t v5 = vand_s8(vbsl_s8((int8x8_t)vcge_f32(v3, v4), (int8x8_t)v4, (int8x8_t)v3), (int8x8_t)vcgtz_f32(v3));
  float v6 = *(float *)&v5.i32[1];
  float32x2_t v21 = (float32x2_t)v5;
  if (*(float *)v5.i32 >= *(float *)&v5.i32[1]) {
    float v6 = *(float *)v5.i32;
  }
  if (v6 <= v2) {
    float v7 = v2;
  }
  else {
    float v7 = v6;
  }
  if ((LODWORD(v7) >> 23) - 127 <= 0xFFFFFFF0) {
    int v8 = -16;
  }
  else {
    int v8 = (LODWORD(v7) >> 23) - 127;
  }
  double v9 = exp2((double)(v8 - 8));
  unsigned int v10 = vcvtmd_s64_f64(v7 / v9 + 0.5);
  if (v10 == 512)
  {
    double v9 = v9 + v9;
    int v11 = v8 + 17;
  }
  else
  {
    if (v10 >= 0x200) {
      RGBFloat32ToShareExponent32();
    }
    int v11 = v8 + 16;
  }
  unsigned int v12 = vcvtmd_s64_f64(v2 / v9 + 0.5);
  if (v12 >= 0x200) {
    RGBFloat32ToShareExponent32();
  }
  __asm { FMOV            V1.2D, #0.5 }
  uint32x2_t v18 = (uint32x2_t)vmovn_s64(vcvtq_s64_f64(vrndmq_f64(vaddq_f64(vdivq_f64(vcvtq_f64_f32(v21), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v9, 0)), _Q1))));
  if (v18.i32[0] >= 0x200u) {
    RGBFloat32ToShareExponent32();
  }
  if (v18.i32[1] >= 0x200u) {
    RGBFloat32ToShareExponent32();
  }
  int32x2_t v19 = (int32x2_t)vand_s8((int8x8_t)vshl_u32(v18, (uint32x2_t)0x1200000009), (int8x8_t)0x7FC00000003FE00);
  return vorr_s8((int8x8_t)v19, (int8x8_t)vdup_lane_s32(v19, 1)).u32[0] | (v11 << 27) | v12;
}

BOOL writeContentsJsonAtPath(void *a1, void *a2, uint64_t a3)
{
  int8x8_t v5 = (objc_class *)NSString;
  id v6 = a2;
  id v7 = a1;
  int v8 = (void *)[[v5 alloc] initWithFormat:@"%@/Contents.json", v6];

  double v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA8]) initToFileAtPath:v8 append:0];
  [v9 open];
  uint64_t v10 = [MEMORY[0x1E4F28D90] writeJSONObject:v7 toStream:v9 options:1 error:a3];

  [v9 close];
  return v10 != 0;
}

uint64_t pixelBytes(uint64_t a1)
{
  if (a1 <= 551)
  {
    uint64_t v1 = a1 - 1;
    uint64_t result = 1;
    switch(v1)
    {
      case 0:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
        return result;
      case 19:
      case 21:
      case 22:
      case 23:
      case 24:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 39:
      case 40:
      case 41:
      case 42:
        return 2;
      case 52:
      case 53:
      case 54:
      case 59:
      case 61:
      case 62:
      case 63:
      case 64:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 79:
      case 80:
      case 89:
      case 90:
      case 91:
      case 92:
        return 4;
      case 102:
      case 103:
      case 104:
      case 109:
      case 111:
      case 112:
      case 113:
      case 114:
        return 8;
      case 122:
      case 123:
      case 124:
        return 16;
      default:
        goto LABEL_11;
    }
  }
  if ((unint64_t)(a1 - 552) < 2) {
    return 8;
  }
  if ((unint64_t)(a1 - 554) < 2) {
    return 4;
  }
  if ((unint64_t)(a1 - 2147483649) >= 2) {
LABEL_11:
  }
    pixelBytes_cold_1();
  return 3;
}

uint64_t componentsPerPixel(uint64_t a1)
{
  if (a1 <= 551)
  {
    uint64_t v1 = a1 - 1;
    uint64_t result = 1;
    switch(v1)
    {
      case 0:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 19:
      case 21:
      case 22:
      case 23:
      case 24:
      case 52:
      case 53:
      case 54:
        return result;
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 59:
      case 61:
      case 62:
      case 63:
      case 64:
      case 102:
      case 103:
      case 104:
        return 2;
      case 39:
      case 91:
      case 92:
        return 3;
      case 40:
      case 41:
      case 42:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 79:
      case 80:
      case 89:
      case 90:
      case 109:
      case 111:
      case 112:
      case 113:
      case 114:
      case 122:
      case 123:
      case 124:
        return 4;
      default:
        goto LABEL_9;
    }
  }
  if ((unint64_t)(a1 - 552) < 2) {
    return 4;
  }
  if ((unint64_t)(a1 - 554) >= 2 && (unint64_t)(a1 - 2147483649) >= 2) {
LABEL_9:
  }
    componentsPerPixel_cold_1();
  return 3;
}

uint64_t isSRGB(uint64_t a1)
{
  uint64_t result = 1;
  if (a1 <= 552)
  {
    if (((unint64_t)(a1 - 150) > 0x32 || ((1 << (a1 + 106)) & 0x7FDF2A002A809) == 0)
      && ((unint64_t)(a1 - 81) > 0x36 || ((1 << (a1 - 81)) & 0x54100400001801) == 0))
    {
      unint64_t v3 = a1 - 11;
      if (v3 > 0x3C || ((1 << v3) & 0x1040100000104001) == 0) {
        return 0;
      }
    }
  }
  else
  {
    if (a1 <= 2147483669)
    {
      if (a1 == 553 || a1 == 555) {
        return result;
      }
      return 0;
    }
    if (a1 != 2147483670 && a1 != 2147483686) {
      return 0;
    }
  }
  return result;
}

uint64_t isGammaEncoded(uint64_t a1)
{
  uint64_t result = 1;
  if (a1 <= 152)
  {
    if ((unint64_t)(a1 - 81) > 0x36 || ((1 << (a1 - 81)) & 0x54000000000001) == 0)
    {
      unint64_t v3 = a1 - 11;
      if (v3 > 0x3C || ((1 << v3) & 0x1000000000100001) == 0) {
        return 0;
      }
    }
  }
  else if (((unint64_t)(a1 - 153) > 0x2F || ((1 << (a1 + 103)) & 0xFFBE54005501) == 0) {
         && a1 != 553
  }
         && a1 != 555)
  {
    return 0;
  }
  return result;
}

unint64_t getMemoryLayout(uint64_t a1, float a2)
{
  BOOL v2 = (unint64_t)(a1 - 130) > 0xD || ((1 << (a1 + 126)) & 0x3C3F) == 0;
  if (!v2 || (unint64_t)(a1 - 150) < 4 || (a1 & 0xFFFFFFFFFFFFFFF8) == 0xA0)
  {
LABEL_5:
    unsigned int v3 = 17040392;
    switch(a1)
    {
      case 130:
      case 131:
      case 140:
      case 141:
      case 162:
      case 163:
      case 166:
      case 167:
      case 170:
      case 172:
      case 180:
      case 181:
      case 182:
      case 183:
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 132:
      case 133:
      case 134:
      case 135:
      case 142:
      case 143:
      case 150:
      case 151:
      case 152:
      case 153:
      case 174:
      case 176:
      case 178:
      case 179:
      case 186:
      case 204:
        unsigned int v3 = 17040400;
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 160:
      case 161:
      case 164:
      case 165:
        unsigned int v3 = 17041416;
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 187:
      case 205:
        unsigned int v3 = 17040656;
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 188:
      case 206:
        unsigned int v3 = 17106192;
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 189:
      case 207:
        unsigned int v3 = 17106448;
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 190:
      case 208:
        unsigned int v3 = 17171984;
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 192:
      case 210:
        unsigned int v3 = 17106960;
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 193:
      case 211:
        int v5 = 17171984;
        goto LABEL_16;
      case 194:
      case 212:
        unsigned int v3 = 17303568;
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 195:
      case 213:
        unsigned int v3 = 17104912;
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 196:
      case 214:
        unsigned int v3 = 17173008;
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 197:
      case 215:
        unsigned int v3 = 17304080;
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 198:
      case 216:
        unsigned int v3 = 17435152;
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 199:
      case 217:
        int v5 = 17435152;
LABEL_16:
        unsigned int v3 = v5 + 512;
        break;
      case 200:
      case 218:
        unsigned int v3 = 17566736;
        break;
      default:
        +[TXRPixelFormatInfo packedMemoryLayoutForFormat:dimensions:]();
    }
    return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
  }
  else
  {
    if (a1 <= 551)
    {
      unsigned int v4 = 1;
      switch(a1)
      {
        case 1:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
          return v4 * (unint64_t)LODWORD(a2);
        case 20:
        case 22:
        case 23:
        case 24:
        case 25:
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
        case 40:
        case 41:
        case 42:
        case 43:
          unsigned int v4 = 2;
          return v4 * (unint64_t)LODWORD(a2);
        case 53:
        case 54:
        case 55:
        case 60:
        case 62:
        case 63:
        case 64:
        case 65:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 80:
        case 81:
        case 90:
        case 91:
        case 92:
        case 93:
          goto LABEL_11;
        case 103:
        case 104:
        case 105:
        case 110:
        case 112:
        case 113:
        case 114:
        case 115:
          goto LABEL_34;
        case 123:
        case 124:
        case 125:
          unsigned int v4 = 16;
          return v4 * (unint64_t)LODWORD(a2);
        case 170:
        case 172:
        case 174:
        case 176:
        case 178:
        case 179:
        case 180:
        case 181:
        case 182:
        case 183:
        case 186:
        case 187:
        case 188:
        case 189:
        case 190:
        case 192:
        case 193:
        case 194:
        case 195:
        case 196:
        case 197:
        case 198:
        case 199:
        case 200:
        case 204:
        case 205:
        case 206:
        case 207:
        case 208:
        case 210:
        case 211:
        case 212:
        case 213:
        case 214:
        case 215:
        case 216:
        case 217:
        case 218:
          goto LABEL_5;
        default:
          goto LABEL_38;
      }
    }
    if ((unint64_t)(a1 - 552) < 2)
    {
LABEL_34:
      unsigned int v4 = 8;
    }
    else if ((unint64_t)(a1 - 554) < 2)
    {
LABEL_11:
      unsigned int v4 = 4;
    }
    else
    {
      if ((unint64_t)(a1 - 2147483649) >= 2) {
LABEL_38:
      }
        pixelBytes_cold_1();
      unsigned int v4 = 3;
    }
    return v4 * (unint64_t)LODWORD(a2);
  }
}

void slowConvert(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9, float32x4_t _Q1, int8x16_t _Q2, __n128 a12, uint64_t a13, uint16x4_t *a14)
{
  unsigned __int32 v248 = a9.n128_u32[2];
  if (a9.n128_u32[2])
  {
    int v16 = a2;
    int v18 = 0;
    unsigned __int32 v262 = a9.n128_u32[1];
    unsigned __int32 v19 = a9.n128_u32[0];
    unint64_t v257 = a3 & 0xFFFFFFFFFFFFFFFDLL;
    unsigned __int32 v258 = a9.n128_u32[0];
    if (a9.n128_u32[0] <= 1) {
      unsigned __int32 v19 = 1;
    }
    unsigned __int32 v256 = v19;
    float32x4_t v20 = 0uLL;
    v21.i64[1] = 0x3F80000000000000;
    float v22 = -1.0;
    unint64_t v265 = a3 - 2147483649;
    float32x2_t v261 = (float32x2_t)vdup_n_s32(0x437F0000u);
    v21.i64[0] = 0x3F80000000000000;
    float32x4_t v266 = v21;
    _Q0 = (float32x4_t)xmmword_1DC80BF70;
    while (1)
    {
      int v250 = v18;
      if (v262) {
        break;
      }
LABEL_544:
      a6 += a5;
      a14 = (uint16x4_t *)((char *)a14 + a13);
      int v18 = v250 + 1;
      if (v250 + 1 == v248) {
        return;
      }
    }
    int v24 = 0;
    v268 = a14;
    uint64_t v267 = a6;
    while (1)
    {
      int v264 = v24;
      if (v258) {
        break;
      }
LABEL_543:
      v267 += a4;
      v268 = (uint16x4_t *)((char *)v268 + a8);
      int v24 = v264 + 1;
      if (v264 + 1 == v262) {
        goto LABEL_544;
      }
    }
    if (a7 <= 64)
    {
      if ((unint64_t)a7 <= 0x3E)
      {
        unsigned __int32 v25 = v256;
        uint64_t v27 = v267;
        double v26 = v268;
        if (((1 << a7) & 0x50800F01C2501C02) != 0) {
          goto LABEL_16;
        }
      }
LABEL_551:
      slowConvert_cold_1();
    }
    if ((unint64_t)(a7 - 65) > 0x3C
      || (unsigned __int32 v25 = v256, v27 = v267, v26 = v268, ((1 << (a7 - 65)) & 0x1004A1001A0180E1) == 0))
    {
      unsigned __int32 v25 = v256;
      uint64_t v27 = v267;
      double v26 = v268;
      if ((unint64_t)(a7 - 552) >= 4)
      {
        unsigned __int32 v25 = v256;
        uint64_t v27 = v267;
        double v26 = v268;
        if ((unint64_t)(a7 - 2147483649) > 1) {
          goto LABEL_551;
        }
      }
    }
LABEL_16:
    while (a7 > 59)
    {
      if (a7 <= 92)
      {
        if (a7 <= 79)
        {
          switch(a7)
          {
            case '<':
              v30.i32[0] = v26->u16[0];
              v30.i32[1] = v26->u16[1];
              *(int32x2_t *)_Q1.f32 = vdup_n_s32(0x477FFF00u);
              *(float32x2_t *)_Q4.f32 = vdiv_f32(vcvt_f32_u32(v30), *(float32x2_t *)_Q1.f32);
              goto LABEL_65;
            case '>':
              v43.i32[0] = v26->i16[0];
              v43.i32[1] = v26->i16[1];
              float32x2_t v44 = vdiv_f32(vcvt_f32_s32(v43), (float32x2_t)vdup_n_s32(0x46FFFE00u));
              __asm { FMOV            V1.2S, #-1.0 }
              *(int32x2_t *)_Q2.i8 = vcgt_f32(*(float32x2_t *)_Q1.f32, v44);
              *(int8x8_t *)_Q4.f32 = vbsl_s8(*(int8x8_t *)_Q2.i8, *(int8x8_t *)_Q1.f32, (int8x8_t)v44);
              goto LABEL_65;
            case 'A':
              _Q0.i32[0] = v26->i32[0];
              _Q4.i64[0] = vcvtq_f32_f16(*(float16x4_t *)_Q0.f32).u64[0];
LABEL_65:
              _Q0 = v266;
              _Q4.i64[1] = v266.i64[0];
              goto LABEL_228;
            case 'F':
              _Q0.i32[0] = v26->i32[0];
              _Q0 = vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)_Q0.f32)));
              _Q1 = (float32x4_t)vdupq_n_s32(0x437F0000u);
              goto LABEL_91;
            case 'G':
              _Q0.i32[0] = v26->i32[0];
              _Q0 = vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)_Q0.f32)));
              _Q1 = (float32x4_t)vdupq_n_s32(0x437F0000u);
              _Q4 = vdivq_f32(_Q0, _Q1);
              if (!v16) {
                goto LABEL_228;
              }
              double v45 = _Q4.f32[0];
              int8x16_t v271 = (int8x16_t)_Q4;
              if (_Q4.f32[0] <= 0.04045)
              {
                double v33 = v45 / 12.92;
              }
              else
              {
                *(double *)_Q0.i64 = pow((v45 + 0.055) / 1.055, 2.4);
                _Q4 = (float32x4_t)v271;
                double v33 = *(double *)_Q0.i64;
              }
              double v75 = _Q4.f32[1];
              if (_Q4.f32[1] <= 0.04045)
              {
                double v76 = v75 / 12.92;
              }
              else
              {
                *(double *)_Q0.i64 = pow((v75 + 0.055) / 1.055, 2.4);
                _Q4.i64[1] = v271.i64[1];
                double v76 = *(double *)_Q0.i64;
              }
              double v77 = _Q4.f32[2];
              if (_Q4.f32[2] <= 0.04045)
              {
                double v78 = v77 / 12.92;
              }
              else
              {
                *(double *)_Q0.i64 = pow((v77 + 0.055) / 1.055, 2.4);
                _Q4.i32[3] = v271.i32[3];
                double v78 = *(double *)_Q0.i64;
              }
              float v79 = _Q4.f32[3];
              goto LABEL_178;
            case 'H':
              _Q0.i32[0] = v26->i32[0];
              _Q0 = vdivq_f32(vcvtq_f32_s32(vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)_Q0.f32))), (float32x4_t)vdupq_n_s32(0x42FE0000u));
              __asm { FMOV            V1.4S, #-1.0 }
              _Q2 = (int8x16_t)vcgtq_f32(_Q1, _Q0);
              _Q4 = (float32x4_t)vbslq_s8(_Q2, (int8x16_t)_Q1, (int8x16_t)_Q0);
              goto LABEL_228;
            default:
              goto LABEL_62;
          }
        }
        if (a7 > 89)
        {
          if (a7 == 90)
          {
            _Q1.i32[0] = v26->i32[0];
            _Q1.i32[1] = (unsigned __int32)v26->i32[0] >> 10;
            _Q1.i32[2] = (unsigned __int32)v26->i32[0] >> 20;
            _Q2.i64[0] = 0x300000003;
            _Q2.i64[1] = 0x300000003;
            uint32x4_t v58 = (uint32x4_t)vandq_s8((int8x16_t)_Q1, _Q2);
            v58.i32[3] = vshrq_n_u32((uint32x4_t)vdupq_n_s32(*(_DWORD *)v26), 0x1EuLL).i32[3];
            _Q0 = vcvtq_f32_u32(v58);
            _Q1 = (float32x4_t)xmmword_1DC80B760;
LABEL_91:
            _Q4 = vdivq_f32(_Q0, _Q1);
            goto LABEL_228;
          }
          if (a7 != 92)
          {
LABEL_62:
            _Q4 = *(float32x4_t *)v26->i8;
            uint64_t v42 = 16;
            goto LABEL_229;
          }
          unsigned int v37 = v26->i32[0];
          unsigned __int32 v38 = (unsigned __int32)v26->i32[0] >> 21;
          unsigned int v39 = v38 & 0x3F;
          int v40 = v38 & 0x7C0;
          if ((v38 & 0x7C0) != 0)
          {
            if (v40 == 1792)
            {
              float v41 = NAN;
              if ((v38 & 0x3F) == 0) {
                float v41 = INFINITY;
              }
LABEL_206:
              unsigned int v112 = (v37 >> 11) & 0x3F;
              int v113 = (v37 >> 11) & 0x7C0;
              if (v113)
              {
                if (v113 == 1792)
                {
                  float v114 = NAN;
                  _Q2.i32[0] = 2139095040;
                  if (!v112) {
                    float v114 = INFINITY;
                  }
                  goto LABEL_219;
                }
                int v119 = (v113 << 17) + 939524096;
              }
              else
              {
                unsigned int v115 = __clz(v112);
                unsigned int v116 = v37 >> 11 << (v115 - 25);
                int v117 = 1157627904 - (v115 << 23);
                int v118 = v116 & 0x3E;
                if (v112) {
                  int v119 = v117;
                }
                else {
                  int v119 = 0;
                }
                if (v112) {
                  unsigned int v112 = v118;
                }
                else {
                  unsigned int v112 = 0;
                }
              }
              LODWORD(v114) = v119 | (v112 << 17);
LABEL_219:
              unsigned int v120 = v26->i32[0] & 0x1F;
              if ((v37 & 0x3E0) != 0)
              {
                int v121 = ((v26->i32[0] & 0x3E0) << 18) + 939524096;
              }
              else
              {
                unsigned int v122 = __clz(v120);
                unsigned int v123 = v37 << (v122 - 26);
                int v124 = 1166016512 - (v122 << 23);
                int v125 = v123 & 0x1E;
                if (v120) {
                  int v121 = v124;
                }
                else {
                  int v121 = 0;
                }
                if (v120) {
                  unsigned int v120 = v125;
                }
                else {
                  unsigned int v120 = 0;
                }
              }
              __asm { FMOV            V4.4S, #1.0 }
              _Q4.i64[0] = __PAIR64__(LODWORD(v114), LODWORD(v41));
              _Q0.i32[0] = v121 | (v120 << 18);
              _Q4.i32[2] = _Q0.i32[0];
              goto LABEL_228;
            }
            int v74 = (v40 << 17) + 939524096;
          }
          else if ((v38 & 0x3F) != 0)
          {
            unsigned int v72 = __clz(v39);
            unsigned __int32 v73 = v38 << (v72 - 25);
            int v74 = 1157627904 - (v72 << 23);
            unsigned int v39 = v73 & 0x3E;
          }
          else
          {
            int v74 = 0;
          }
          LODWORD(v41) = v74 | (v39 << 17);
          goto LABEL_206;
        }
        if (a7 == 80)
        {
          _Q0.i32[0] = v26->i32[0];
          _Q1 = (float32x4_t)vdupq_n_s32(0x437F0000u);
          _Q0 = (float32x4_t)vrev64q_s32((int32x4_t)vdivq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)_Q0.f32))), _Q1));
          goto LABEL_120;
        }
        if (a7 != 81) {
          goto LABEL_62;
        }
        _Q0.i32[0] = v26->i32[0];
        _Q0 = vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)_Q0.f32)));
        _Q1 = vdivq_f32(_Q0, (float32x4_t)vdupq_n_s32(0x437F0000u));
        if (!v16)
        {
          _Q0 = (float32x4_t)vrev64q_s32((int32x4_t)_Q1);
LABEL_120:
          _Q4 = (float32x4_t)vextq_s8((int8x16_t)_Q0, (int8x16_t)_Q0, 0xCuLL);
LABEL_228:
          uint64_t v42 = 4;
          goto LABEL_229;
        }
        double v32 = _Q1.f32[2];
        float32x4_t v270 = _Q1;
        if (_Q1.f32[2] <= 0.04045)
        {
          double v33 = v32 / 12.92;
        }
        else
        {
          *(double *)_Q0.i64 = pow((v32 + 0.055) / 1.055, 2.4);
          _Q1 = v270;
          double v33 = *(double *)_Q0.i64;
        }
        double v80 = _Q1.f32[1];
        if (_Q1.f32[1] <= 0.04045)
        {
          double v76 = v80 / 12.92;
        }
        else
        {
          *(double *)_Q0.i64 = pow((v80 + 0.055) / 1.055, 2.4);
          _Q1 = v270;
          double v76 = *(double *)_Q0.i64;
        }
        double v91 = _Q1.f32[0];
        if (_Q1.f32[0] <= 0.04045)
        {
          double v78 = v91 / 12.92;
        }
        else
        {
          *(double *)_Q0.i64 = pow((v91 + 0.055) / 1.055, 2.4);
          _Q1 = v270;
          double v78 = *(double *)_Q0.i64;
        }
        float v79 = _Q1.f32[3];
LABEL_178:
        double v102 = v79;
        if (v102 <= 0.04045) {
          *(double *)_Q0.i64 = v102 / 12.92;
        }
        else {
          *(double *)_Q0.i64 = pow((v102 + 0.055) / 1.055, 2.4);
        }
        _Q4.f32[0] = v33;
        float32_t v103 = v76;
        _Q4.f32[1] = v103;
        float32_t v104 = v78;
        _Q4.f32[2] = v104;
        _Q0.f32[0] = *(double *)_Q0.i64;
        _Q4.i32[3] = _Q0.i32[0];
        uint64_t v42 = 4;
        float32x4_t v20 = 0uLL;
        float v22 = -1.0;
      }
      else
      {
        if (a7 <= 551)
        {
          if (a7 > 109)
          {
            switch(a7)
            {
              case 'n':
                _Q0 = vcvtq_f32_u32(vmovl_u16(*v26));
                _Q1 = (float32x4_t)vdupq_n_s32(0x477FFF00u);
                _Q4 = vdivq_f32(_Q0, _Q1);
                break;
              case 'p':
                _Q0 = vdivq_f32(vcvtq_f32_s32(vmovl_s16((int16x4_t)*v26)), (float32x4_t)vdupq_n_s32(0x46FFFE00u));
                __asm { FMOV            V1.4S, #-1.0 }
                _Q2 = (int8x16_t)vcgtq_f32(_Q1, _Q0);
                _Q4 = (float32x4_t)vbslq_s8(_Q2, (int8x16_t)_Q1, (int8x16_t)_Q0);
                break;
              case 's':
                *(uint16x4_t *)_Q0.f32 = *v26;
                _Q4 = vcvtq_f32_f16((float16x4_t)*v26);
                break;
              default:
                goto LABEL_62;
            }
LABEL_193:
            uint64_t v42 = 8;
            goto LABEL_229;
          }
          if (a7 != 93)
          {
            if (a7 != 105) {
              goto LABEL_62;
            }
            *(uint16x4_t *)_Q4.f32 = *v26;
            _Q0 = v266;
            _Q4.i64[1] = v266.i64[0];
            goto LABEL_193;
          }
          unsigned __int32 v56 = v26->i32[0];
          *(double *)_Q0.i64 = ldexp(1.0, ((unsigned __int32)v26->i32[0] >> 27) - 24);
          float32x4_t v20 = 0uLL;
          _Q0.f32[0] = *(double *)_Q0.i64;
          _Q1.i32[0] = v56;
          _Q1.i32[1] = v56 >> 9;
          _Q2.i64[0] = 0x100000001;
          *(float32x2_t *)_Q1.f32 = vcvt_f32_s32((int32x2_t)vand_s8(*(int8x8_t *)_Q1.f32, (int8x8_t)0x100000001));
          *(float32x2_t *)_Q4.f32 = vmul_n_f32(*(float32x2_t *)_Q1.f32, _Q0.f32[0]);
          int v57 = (v56 >> 18) & 0x1FF;
          int v16 = a2;
          _Q0.f32[0] = _Q0.f32[0] * (float)v57;
LABEL_88:
          _Q4.i32[2] = _Q0.i32[0];
          goto LABEL_89;
        }
        switch(a7)
        {
          case 552:
            v28.i32[0] = v26->i32[1];
            v28.i32[1] = HIWORD(v26->i32[0]);
            *(float32x2_t *)_Q0.f32 = vcvt_f32_s32(vadd_s32((int32x2_t)vand_s8(v28, (int8x8_t)0x300000003), vdup_n_s32(0xFFFFFE80)));
            *(float32x2_t *)_Q4.f32 = vdiv_f32(*(float32x2_t *)_Q0.f32, (float32x2_t)vdup_n_s32(0x43FF0000u));
            _Q4.f32[2] = (float)((v26->i32[0] & 0x3FF) - 384) / 510.0;
            _Q0.f32[0] = (float)((HIWORD(v26->i32[1]) & 0x3FF) - 384);
            goto LABEL_187;
          case 553:
            unsigned __int32 v46 = v26->u32[1];
            int v47 = (v46 & 0x3FF) - 384;
            a12.n128_f32[0] = (float)v47 / 510.0;
            if (v16)
            {
              float v48 = -a12.n128_f32[0];
              if (a12.n128_f32[0] >= 0.0) {
                float v48 = (float)v47 / 510.0;
              }
              double v49 = v48;
              if (v49 <= 0.04045)
              {
                *(double *)_Q0.i64 = v49 / 12.92;
              }
              else
              {
                __n128 v272 = a12;
                *(double *)_Q0.i64 = pow((v49 + 0.055) / 1.055, 2.4);
                a12 = v272;
              }
              float v81 = *(double *)_Q0.i64;
              if (a12.n128_f32[0] >= 0.0) {
                *(float *)_Q2.i32 = v81;
              }
              else {
                *(float *)_Q2.i32 = -v81;
              }
              __int32 v82 = v26->i32[0];
              int v83 = (HIWORD(v26->i32[0]) & 0x3FF) - 384;
              float v84 = (float)v83 / 510.0;
              float v85 = -v84;
              if (v84 >= 0.0) {
                float v85 = (float)v83 / 510.0;
              }
              double v86 = v85;
              int8x16_t v274 = _Q2;
              if (v86 <= 0.04045) {
                *(double *)_Q0.i64 = v86 / 12.92;
              }
              else {
                *(double *)_Q0.i64 = pow((v86 + 0.055) / 1.055, 2.4);
              }
              float v92 = *(double *)_Q0.i64;
              if (v84 >= 0.0) {
                *(float *)_Q2.i32 = v92;
              }
              else {
                *(float *)_Q2.i32 = -v92;
              }
              int v93 = (v82 & 0x3FF) - 384;
              float v94 = (float)v93 / 510.0;
              float v95 = -v94;
              if (v94 >= 0.0) {
                float v95 = (float)v93 / 510.0;
              }
              double v96 = v95;
              if (v96 <= 0.04045)
              {
                *(double *)_Q0.i64 = v96 / 12.92;
              }
              else
              {
                int8x16_t v254 = _Q2;
                *(double *)_Q0.i64 = pow((v96 + 0.055) / 1.055, 2.4);
                _Q2 = v254;
              }
              _Q1.i64[1] = v274.i64[1];
              _Q4.i64[0] = __PAIR64__(_Q2.u32[0], v274.u32[0]);
              float v105 = *(double *)_Q0.i64;
              if (v94 < 0.0) {
                float v105 = -v105;
              }
              _Q4.f32[2] = v105;
              float32x4_t v20 = 0uLL;
            }
            else
            {
              _Q4.f32[0] = (float)v47 / 510.0;
              _Q4.f32[1] = (float)((HIWORD(v26->i32[0]) & 0x3FF) - 384) / 510.0;
              _Q4.f32[2] = (float)((v26->i32[0] & 0x3FF) - 384) / 510.0;
            }
            _Q0.f32[0] = (float)(int)((HIWORD(v46) & 0x3FF) - 384);
LABEL_187:
            float v106 = _Q0.f32[0] / 510.0;
            _Q1.i64[0] = 0;
            if (v106 >= 0.0) {
              _Q1.f32[0] = v106;
            }
            _Q2.i32[0] = 1.0;
            if (v106 <= 1.0) {
              _Q0.f32[0] = _Q1.f32[0];
            }
            else {
              _Q0.f32[0] = 1.0;
            }
            _Q4.i32[3] = _Q0.i32[0];
            goto LABEL_193;
          case 554:
            *(float32x2_t *)_Q0.f32 = vcvt_f32_s32(vadd_s32((int32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v26->i32[0]), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003), vdup_n_s32(0xFFFFFE80)));
            *(int32x2_t *)_Q1.f32 = vdup_n_s32(0x43FF0000u);
            *(float32x2_t *)_Q4.f32 = vdiv_f32(*(float32x2_t *)_Q0.f32, *(float32x2_t *)_Q1.f32);
            _Q0.f32[0] = (float)((v26->i32[0] & 0x3FF) - 384) / 510.0;
            goto LABEL_88;
          case 555:
            __int32 v50 = v26->i32[0];
            int v51 = (((unsigned __int32)v26->i32[0] >> 20) & 0x3FF) - 384;
            a12.n128_f32[0] = (float)v51 / 510.0;
            int v52 = ((unsigned __int32)v26->i32[0] >> 10) & 0x3FF;
            if (v16)
            {
              float v53 = -a12.n128_f32[0];
              if (a12.n128_f32[0] >= 0.0) {
                float v53 = (float)v51 / 510.0;
              }
              double v54 = v53;
              if (v54 <= 0.04045)
              {
                *(double *)_Q0.i64 = v54 / 12.92;
              }
              else
              {
                __n128 v273 = a12;
                *(double *)_Q0.i64 = pow((v54 + 0.055) / 1.055, 2.4);
                a12 = v273;
              }
              float v87 = *(double *)_Q0.i64;
              if (a12.n128_f32[0] >= 0.0) {
                *(float *)_Q2.i32 = v87;
              }
              else {
                *(float *)_Q2.i32 = -v87;
              }
              float v88 = (float)(v52 - 384) / 510.0;
              float v89 = -v88;
              if (v88 >= 0.0) {
                float v89 = (float)(v52 - 384) / 510.0;
              }
              double v90 = v89;
              int8x16_t v275 = _Q2;
              if (v90 <= 0.04045) {
                *(double *)_Q0.i64 = v90 / 12.92;
              }
              else {
                *(double *)_Q0.i64 = pow((v90 + 0.055) / 1.055, 2.4);
              }
              float v97 = *(double *)_Q0.i64;
              if (v88 >= 0.0) {
                *(float *)_Q2.i32 = v97;
              }
              else {
                *(float *)_Q2.i32 = -v97;
              }
              int v98 = (v50 & 0x3FF) - 384;
              float v99 = (float)v98 / 510.0;
              float v100 = -v99;
              if (v99 >= 0.0) {
                float v100 = (float)v98 / 510.0;
              }
              double v101 = v100;
              if (v101 <= 0.04045)
              {
                *(double *)_Q0.i64 = v101 / 12.92;
              }
              else
              {
                int8x16_t v255 = _Q2;
                *(double *)_Q0.i64 = pow((v101 + 0.055) / 1.055, 2.4);
                _Q2 = v255;
              }
              _Q1 = (float32x4_t)v275;
              _Q4.i64[0] = __PAIR64__(_Q2.u32[0], v275.u32[0]);
              float v107 = *(double *)_Q0.i64;
              if (v99 < 0.0) {
                float v107 = -v107;
              }
              _Q4.f32[2] = v107;
              float32x4_t v20 = 0uLL;
            }
            else
            {
              *(float *)_Q2.i32 = (float)((v26->i32[0] & 0x3FF) - 384);
              _Q4.f32[0] = (float)v51 / 510.0;
              _Q4.f32[1] = (float)(v52 - 384) / 510.0;
              _Q4.f32[2] = *(float *)_Q2.i32 / 510.0;
            }
            goto LABEL_89;
          default:
            if (a7 == 2147483649)
            {
              v55.i32[0] = v26->u8[0];
              v55.i32[1] = v26->u8[1];
              *(float32x2_t *)_Q0.f32 = vcvt_f32_u32(v55);
              _Q1.i32[1] = v261.i32[1];
              *(float32x2_t *)_Q4.f32 = vdiv_f32(*(float32x2_t *)_Q0.f32, v261);
              _Q0.i8[0] = v26->i8[2];
              _Q4.f32[2] = (float)_Q0.u32[0] / 255.0;
              _Q0.i32[0] = 1.0;
              _Q4.i32[3] = 1.0;
            }
            else
            {
              if (a7 != 2147483650) {
                goto LABEL_62;
              }
              _Q0.i8[0] = v26->i8[2];
              *(float *)&unsigned int v34 = (float)_Q0.u32[0] / 255.0;
              _Q2.i8[0] = v26->i8[1];
              *(float *)_Q2.i32 = (float)_Q2.u32[0] / 255.0;
              __asm { FMOV            V4.4S, #1.0 }
              _Q4.i64[0] = __PAIR64__(_Q2.u32[0], v34);
              LOBYTE(v34) = v26->i8[0];
              _Q0.f32[0] = (float)v34 / 255.0;
              _Q4.i32[2] = _Q0.i32[0];
            }
            uint64_t v42 = 3;
            break;
        }
      }
LABEL_229:
      if (a1)
      {
        _Q0 = vmulq_laneq_f32(_Q4, _Q4, 3);
        _Q0.i32[3] = _Q4.i32[3];
        _Q4 = _Q0;
      }
      if ((unint64_t)a3 <= 0x3E)
      {
        if (((1 << a3) & 0x10000F00C0100C02) != 0) {
          goto LABEL_239;
        }
        if (((1 << a3) & 0x4000000100401000) != 0) {
          goto LABEL_237;
        }
      }
      char v126 = a3 - 70;
      if ((unint64_t)(a3 - 70) <= 0x2A)
      {
        if (((1 << v126) & 0x10000100C03) != 0) {
          goto LABEL_239;
        }
        if (((1 << v126) & 0x40000000004) != 0)
        {
LABEL_237:
          __asm { FMOV            V0.4S, #-1.0 }
          _Q0 = vmaxnmq_f32(_Q4, _Q0);
          goto LABEL_240;
        }
      }
      if (v265 < 2)
      {
LABEL_239:
        _Q0 = vmaxnmq_f32(_Q4, v20);
LABEL_240:
        __asm { FMOV            V1.4S, #1.0 }
LABEL_241:
        _Q4 = vminnmq_f32(_Q0, _Q1);
        goto LABEL_242;
      }
      if (v257 == 553)
      {
        _Q0 = vmaxnmq_f32(_Q4, (float32x4_t)xmmword_1DC80B740);
        _Q1 = (float32x4_t)xmmword_1DC80B750;
        goto LABEL_241;
      }
      if (v257 == 552)
      {
        _Q0 = vmaxnmq_f32(_Q4, (float32x4_t)xmmword_1DC80BF80);
        _Q1 = (float32x4_t)xmmword_1DC80BF90;
        goto LABEL_241;
      }
LABEL_242:
      if (a3 <= 79)
      {
        if (a3 > 19)
        {
          switch(a3)
          {
            case 20:
              float v133 = 65535.0;
              goto LABEL_363;
            case 21:
            case 23:
            case 24:
            case 26:
            case 27:
            case 28:
            case 29:
            case 33:
            case 34:
            case 35:
            case 36:
            case 37:
            case 38:
            case 39:
              goto LABEL_550;
            case 22:
              float v133 = 32767.0;
LABEL_363:
              _Q0.f32[0] = v133 * _Q4.f32[0];
              int v178 = (int)_Q0.f32[0];
              goto LABEL_378;
            case 25:
              __asm { FCVT            H0, S4; jumptable 00000001DC808688 case 25 }
              *(_WORD *)uint64_t v27 = _Q0.i16[0];
              goto LABEL_521;
            case 30:
              float v179 = 255.0;
              goto LABEL_372;
            case 31:
              if (v16)
              {
                float v180 = -_Q4.f32[0];
                if (_Q4.f32[0] >= 0.0) {
                  float v180 = _Q4.f32[0];
                }
                long double v181 = v180;
                if (v181 <= 0.003131)
                {
                  *(double *)_Q0.i64 = v181 * 12.92;
                }
                else
                {
                  uint64_t v281 = _Q4.i64[0];
                  *(double *)_Q0.i64 = pow(v181, 0.416666667);
                  _Q4.i64[0] = v281;
                  _Q1.i32[1] = -1079236363;
                  *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                }
                float v233 = *(double *)_Q0.i64;
                if (_Q4.f32[0] < 0.0) {
                  float v233 = -v233;
                }
                *(unsigned char *)uint64_t v27 = (int)(float)(v233 * 255.0);
                float v234 = _Q4.f32[1];
                float v235 = -_Q4.f32[1];
                if (_Q4.f32[1] >= 0.0) {
                  float v235 = _Q4.f32[1];
                }
                long double v236 = v235;
                if (v236 <= 0.003131)
                {
                  *(double *)_Q0.i64 = v236 * 12.92;
                }
                else
                {
                  *(double *)_Q0.i64 = pow(v236, 0.416666667);
                  _Q1.i32[1] = -1079236363;
                  *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                }
                float32x4_t v20 = 0uLL;
                float v223 = *(double *)_Q0.i64;
                if (v234 < 0.0) {
                  float v223 = -v223;
                }
              }
              else
              {
                *(unsigned char *)uint64_t v27 = (int)(float)(_Q4.f32[0] * 255.0);
                float v223 = _Q4.f32[1];
              }
              _Q0.f32[0] = v223 * 255.0;
              goto LABEL_520;
            case 32:
              float v179 = 127.0;
LABEL_372:
              *(unsigned char *)uint64_t v27 = (int)(float)(v179 * _Q4.f32[0]);
              _Q0.f32[0] = vmuls_lane_f32(v179, *(float32x2_t *)_Q4.f32, 1);
LABEL_520:
              *(unsigned char *)(v27 + 1) = (int)_Q0.f32[0];
              goto LABEL_521;
            case 40:
              _Q1.i32[1] = 11;
              *(uint32x2_t *)_Q0.f32 = vshl_u32((uint32x2_t)vcvt_s32_f32(vmul_f32((float32x2_t)vrev64_s32(*(int32x2_t *)_Q4.f32), (float32x2_t)0x41F80000427C0000)), (uint32x2_t)0xB00000005);
              int v178 = _Q0.i32[0] | (int)vmuls_lane_f32(31.0, _Q4, 2) | _Q0.i32[1];
              goto LABEL_378;
            case 41:
              _Q0 = (float32x4_t)vextq_s8((int8x16_t)_Q4, (int8x16_t)_Q4, 8uLL);
              __asm { FMOV            V1.2S, #31.0 }
              *(int32x2_t *)_Q0.f32 = vcvt_s32_f32(vmul_f32((float32x2_t)vzip1_s32(*(int32x2_t *)_Q4.f32, *(int32x2_t *)_Q0.f32), *(float32x2_t *)_Q1.f32));
              _Q1.i32[1] = 1;
              *(uint32x2_t *)_Q0.f32 = vshl_u32(*(uint32x2_t *)_Q0.f32, (uint32x2_t)0x10000000BLL);
              __int16 v182 = _Q0.i16[2];
              int v178 = (int)_Q4.f32[3] | ((int)vmuls_lane_f32(31.0, *(float32x2_t *)_Q4.f32, 1) << 6);
              goto LABEL_377;
            case 42:
              int v178 = (int)(float)(15.0 * _Q4.f32[0]) << 12;
              int v183 = (int)vmuls_lane_f32(15.0, _Q4, 3);
              _Q0 = (float32x4_t)vextq_s8((int8x16_t)_Q4, (int8x16_t)_Q4, 8uLL);
              _Q4.i32[0] = _Q0.i32[0];
              __asm { FMOV            V0.2S, #15.0 }
              *(int8x8_t *)_Q0.f32 = vorr_s8((int8x8_t)vshl_u32((uint32x2_t)vcvt_s32_f32(vmul_f32(*(float32x2_t *)_Q4.f32, *(float32x2_t *)_Q0.f32)), (uint32x2_t)0x800000004), (int8x8_t)__PAIR64__(v183, v178));
              *(int32x2_t *)_Q1.f32 = vdup_lane_s32(*(int32x2_t *)_Q0.f32, 1);
              *(int8x8_t *)_Q0.f32 = vorr_s8(*(int8x8_t *)_Q0.f32, *(int8x8_t *)_Q1.f32);
              LOWORD(v178) = _Q0.i16[0];
              goto LABEL_378;
            case 43:
              __asm { FMOV            V0.2S, #31.0 }
              _Q1.i32[1] = 5;
              *(uint32x2_t *)_Q0.f32 = vshl_u32((uint32x2_t)vcvt_s32_f32(vmul_f32(*(float32x2_t *)_Q4.f32, _D0)), (uint32x2_t)0x50000000ALL);
              __int16 v182 = _Q0.i16[2];
              int v178 = (int)vmuls_lane_f32(31.0, _Q4, 2) | ((int)_Q4.f32[3] << 15);
LABEL_377:
              LOWORD(v178) = v178 | _Q0.i16[0] | v182;
LABEL_378:
              *(_WORD *)uint64_t v27 = v178;
LABEL_521:
              uint64_t v137 = 2;
              goto LABEL_542;
            default:
              switch(a3)
              {
                case '<':
                  float v136 = 65535.0;
                  goto LABEL_380;
                case '=':
                case '?':
                case '@':
                case 'B':
                case 'C':
                case 'D':
                case 'E':
                  goto LABEL_550;
                case '>':
                  float v136 = 32767.0;
LABEL_380:
                  *(_WORD *)uint64_t v27 = (int)(float)(v136 * _Q4.f32[0]);
                  _Q0.f32[0] = vmuls_lane_f32(v136, *(float32x2_t *)_Q4.f32, 1);
                  *(_WORD *)(v27 + 2) = (int)_Q0.f32[0];
                  goto LABEL_541;
                case 'A':
                  __asm { FCVT            H0, S4; jumptable 00000001DC808768 case 65 }
                  *(_WORD *)uint64_t v27 = _H0;
                  _Q0.i32[0] = _Q4.i32[1];
                  __asm { FCVT            H0, S0 }
                  *(_WORD *)(v27 + 2) = _Q0.i16[0];
                  goto LABEL_541;
                case 'F':
                  float32x4_t v186 = (float32x4_t)vdupq_n_s32(0x437F0000u);
                  goto LABEL_389;
                case 'G':
                  if (!v16)
                  {
                    *(unsigned char *)uint64_t v27 = (int)(float)(_Q4.f32[0] * 255.0);
                    *(unsigned char *)(v27 + 1) = (int)vmuls_lane_f32(255.0, *(float32x2_t *)_Q4.f32, 1);
                    float v166 = vmuls_lane_f32(255.0, _Q4, 2);
                    goto LABEL_474;
                  }
                  float v187 = -_Q4.f32[0];
                  if (_Q4.f32[0] >= 0.0) {
                    float v187 = _Q4.f32[0];
                  }
                  long double v188 = v187;
                  float32x4_t v282 = _Q4;
                  if (v188 <= 0.003131)
                  {
                    *(double *)_Q0.i64 = v188 * 12.92;
                  }
                  else
                  {
                    *(double *)_Q0.i64 = pow(v188, 0.416666667);
                    _Q4 = v282;
                    _Q1.i32[1] = -1079236363;
                    *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                  }
                  float v237 = *(double *)_Q0.i64;
                  if (_Q4.f32[0] < 0.0) {
                    float v237 = -v237;
                  }
                  *(unsigned char *)uint64_t v27 = (int)(float)(v237 * 255.0);
                  float v238 = _Q4.f32[1];
                  float v239 = -_Q4.f32[1];
                  if (_Q4.f32[1] >= 0.0) {
                    float v239 = _Q4.f32[1];
                  }
                  long double v240 = v239;
                  if (v240 <= 0.003131)
                  {
                    *(double *)_Q0.i64 = v240 * 12.92;
                  }
                  else
                  {
                    *(double *)_Q0.i64 = pow(v240, 0.416666667);
                    _Q4.i64[1] = v282.i64[1];
                    _Q1.i32[1] = -1079236363;
                    *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                  }
                  float v241 = *(double *)_Q0.i64;
                  if (v238 < 0.0) {
                    float v241 = -v241;
                  }
                  *(unsigned char *)(v27 + 1) = (int)(float)(v241 * 255.0);
                  float v242 = _Q4.f32[2];
                  float v243 = -_Q4.f32[2];
                  if (_Q4.f32[2] >= 0.0) {
                    float v243 = _Q4.f32[2];
                  }
                  long double v244 = v243;
                  if (v244 <= 0.003131)
                  {
                    *(double *)_Q0.i64 = v244 * 12.92;
                  }
                  else
                  {
                    *(double *)_Q0.i64 = pow(v244, 0.416666667);
                    _Q4.i32[3] = v282.i32[3];
                    _Q1.i32[1] = -1079236363;
                    *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                  }
                  float v215 = *(double *)_Q0.i64;
                  float v216 = -v215;
                  _NF = v242 < 0.0;
                  break;
                case 'H':
                  float32x4_t v186 = (float32x4_t)vdupq_n_s32(0x42FE0000u);
LABEL_389:
                  _Q0 = (float32x4_t)vcvtq_s32_f32(vmulq_f32(_Q4, v186));
                  *(int16x4_t *)_Q0.f32 = vmovn_s32((int32x4_t)_Q0);
                  goto LABEL_390;
                default:
                  if (a3 != 55) {
                    goto LABEL_550;
                  }
                  *(_DWORD *)uint64_t v27 = _Q4.i32[0];
                  goto LABEL_541;
              }
              goto LABEL_531;
          }
        }
        if (a3 > 10)
        {
          if (a3 == 11)
          {
            if (v16)
            {
              float v134 = -_Q4.f32[0];
              if (_Q4.f32[0] >= 0.0) {
                float v134 = _Q4.f32[0];
              }
              long double v135 = v134;
              _Q1.i32[1] = 1063888430;
              if (v135 <= 0.003131)
              {
                *(double *)_Q0.i64 = v135 * 12.92;
              }
              else
              {
                __int32 v277 = _Q4.i32[0];
                *(double *)_Q0.i64 = pow(v135, 0.416666667);
                _Q4.i32[0] = v277;
                float32x4_t v20 = 0uLL;
                _Q1.i32[1] = -1079236363;
                *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
              }
              float v165 = *(double *)_Q0.i64;
              if (_Q4.f32[0] >= 0.0) {
                _Q4.f32[0] = v165;
              }
              else {
                _Q4.f32[0] = -v165;
              }
            }
            _Q0.f32[0] = _Q4.f32[0] * 255.0;
          }
          else
          {
            if (a3 != 12) {
              goto LABEL_550;
            }
            float v128 = 127.0;
LABEL_266:
            _Q0.f32[0] = v128 * _Q4.f32[0];
          }
        }
        else
        {
          if (a3 != 1)
          {
            if (a3 != 10) {
              goto LABEL_550;
            }
            float v128 = 255.0;
            goto LABEL_266;
          }
          _Q0.f32[0] = vmuls_lane_f32(255.0, _Q4, 3);
        }
        *(unsigned char *)uint64_t v27 = (int)_Q0.f32[0];
        uint64_t v137 = 1;
        goto LABEL_542;
      }
      if (a3 > 114)
      {
        if (a3 > 551)
        {
          switch(a3)
          {
            case 552:
              _Q0 = (float32x4_t)vextq_s8((int8x16_t)_Q4, (int8x16_t)_Q4, 8uLL);
              _Q1 = _Q0;
              _Q1.i32[1] = _Q4.i32[0];
              *(int32x2_t *)_Q2.i8 = vdup_n_s32(0x43FF0000u);
              float32x2_t v132 = (float32x2_t)vdup_n_s32(0x43C00000u);
              *(uint32x2_t *)_Q1.f32 = vmin_u32((uint32x2_t)vcvt_s32_f32(vmla_f32(v132, *(float32x2_t *)_Q2.i8, *(float32x2_t *)_Q1.f32)), (uint32x2_t)0x300000003);
              a12.n128_u64[0] = (unint64_t)vmla_f32(v132, *(float32x2_t *)_Q2.i8, (float32x2_t)vzip2_s32(*(int32x2_t *)_Q4.f32, *(int32x2_t *)_Q0.f32));
              *(int8x8_t *)_Q0.f32 = vorr_s8((int8x8_t)vshl_n_s32((int32x2_t)vmin_u32((uint32x2_t)vcvt_s32_f32((float32x2_t)a12.n128_u64[0]), (uint32x2_t)0x300000003), 0x10uLL), *(int8x8_t *)_Q1.f32);
              goto LABEL_336;
            case 553:
              float v142 = _Q4.f32[2];
              if (v16)
              {
                float v143 = -_Q4.f32[2];
                if (_Q4.f32[2] >= 0.0) {
                  float v143 = _Q4.f32[2];
                }
                long double v144 = v143;
                float32x4_t v278 = _Q4;
                if (v144 <= 0.003131)
                {
                  *(double *)_Q0.i64 = v144 * 12.92;
                }
                else
                {
                  *(double *)_Q0.i64 = pow(v144, 0.416666667);
                  _Q4 = v278;
                  _Q1.i32[1] = -1079236363;
                  *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                }
                float v193 = *(double *)_Q0.i64;
                if (v142 < 0.0) {
                  float v193 = -v193;
                }
                if ((int)(float)((float)(v193 * 510.0) + 384.0) >= 0x3FF) {
                  int v194 = 1023;
                }
                else {
                  int v194 = (int)(float)((float)(v193 * 510.0) + 384.0);
                }
                float v195 = _Q4.f32[1];
                float v196 = -_Q4.f32[1];
                if (_Q4.f32[1] >= 0.0) {
                  float v196 = _Q4.f32[1];
                }
                long double v197 = v196;
                if (v197 <= 0.003131)
                {
                  *(double *)_Q0.i64 = v197 * 12.92;
                }
                else
                {
                  *(double *)_Q0.i64 = pow(v197, 0.416666667);
                  _Q4 = v278;
                  _Q1.i32[1] = -1079236363;
                  *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                }
                float v206 = *(double *)_Q0.i64;
                if (v195 < 0.0) {
                  float v206 = -v206;
                }
                unsigned int v207 = (int)(float)((float)(v206 * 510.0) + 384.0);
                if (v207 >= 0x3FF) {
                  unsigned int v207 = 1023;
                }
                *(_DWORD *)uint64_t v27 = v194 | (v207 << 16);
                float v208 = -_Q4.f32[0];
                if (_Q4.f32[0] >= 0.0) {
                  float v208 = _Q4.f32[0];
                }
                long double v209 = v208;
                if (v209 <= 0.003131)
                {
                  *(double *)_Q0.i64 = v209 * 12.92;
                }
                else
                {
                  *(double *)_Q0.i64 = pow(v209, 0.416666667);
                  _Q4 = v278;
                  _Q1.i32[1] = -1079236363;
                  *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                }
                float v218 = *(double *)_Q0.i64;
                if (_Q4.f32[0] < 0.0) {
                  float v218 = -v218;
                }
                if ((int)(float)((float)(v218 * 510.0) + 384.0) >= 0x3FF) {
                  int v173 = 1023;
                }
                else {
                  int v173 = (int)(float)((float)(v218 * 510.0) + 384.0);
                }
                float v219 = _Q4.f32[3];
                float v220 = -_Q4.f32[3];
                if (_Q4.f32[3] >= 0.0) {
                  float v220 = _Q4.f32[3];
                }
                long double v221 = v220;
                if (v221 <= 0.003131)
                {
                  *(double *)_Q0.i64 = v221 * 12.92;
                }
                else
                {
                  *(double *)_Q0.i64 = pow(v221, 0.416666667);
                  _Q1.i32[1] = -1079236363;
                  *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                }
                float32x4_t v20 = 0uLL;
                float v167 = *(double *)_Q0.i64;
                if (v219 < 0.0) {
                  float v167 = -v167;
                }
              }
              else
              {
                float v167 = _Q4.f32[3];
                _S2 = 1140785152;
                unsigned int v169 = (int)(float)((float)(_Q4.f32[2] * 510.0) + 384.0);
                if (v169 >= 0x3FF) {
                  unsigned int v169 = 1023;
                }
                __asm { FMLA            S3, S2, V4.S[1] }
                int v171 = (int)_S3;
                if ((int)_S3 >= 0x3FF) {
                  int v171 = 1023;
                }
                *(_DWORD *)uint64_t v27 = v169 | (v171 << 16);
                unsigned int v172 = (int)vmlas_n_f32(384.0, 510.0, _Q4.f32[0]);
                if (v172 >= 0x3FF) {
                  int v173 = 1023;
                }
                else {
                  int v173 = v172;
                }
              }
              _Q2.i32[0] = 1140785152;
              _Q0.f32[0] = (float)(v167 * 510.0) + 384.0;
              int v222 = (int)_Q0.f32[0];
              if ((int)_Q0.f32[0] >= 0x3FF) {
                int v222 = 1023;
              }
              *(_DWORD *)(v27 + 4) = v173 | (v222 << 16);
              uint64_t v137 = 8;
              goto LABEL_542;
            case 554:
              _S0 = 1140785152;
              __asm { FMLA            S2, S0, V4.S[2] }
              int32x2_t v146 = (int32x2_t)vshl_u32(vmin_u32((uint32x2_t)vcvt_s32_f32(vmla_f32((float32x2_t)vdup_n_s32(0x43C00000u), (float32x2_t)vdup_n_s32(0x43FF0000u), *(float32x2_t *)_Q4.f32)), (uint32x2_t)0x300000003), (uint32x2_t)0xA00000014);
              *(int32x2_t *)_Q1.f32 = vdup_lane_s32(v146, 1);
              *(int8x8_t *)_Q0.f32 = vorr_s8((int8x8_t)v146, *(int8x8_t *)_Q1.f32);
              int v147 = (int)*(float *)_Q2.i32;
              if ((int)*(float *)_Q2.i32 >= 0x3FF) {
                int v147 = 1023;
              }
              int v148 = _Q0.i32[0] | v147;
              goto LABEL_501;
            case 555:
              if (v16)
              {
                float v149 = -_Q4.f32[0];
                if (_Q4.f32[0] >= 0.0) {
                  float v149 = _Q4.f32[0];
                }
                long double v150 = v149;
                float32x4_t v279 = _Q4;
                if (v150 <= 0.003131)
                {
                  *(double *)_Q0.i64 = v150 * 12.92;
                }
                else
                {
                  *(double *)_Q0.i64 = pow(v150, 0.416666667);
                  _Q4 = v279;
                  _Q1.i32[1] = -1079236363;
                  *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                }
                float v198 = *(double *)_Q0.i64;
                if (_Q4.f32[0] < 0.0) {
                  float v198 = -v198;
                }
                if ((int)(float)((float)(v198 * 510.0) + 384.0) >= 0x3FF) {
                  int v199 = 1023;
                }
                else {
                  int v199 = (int)(float)((float)(v198 * 510.0) + 384.0);
                }
                float v200 = _Q4.f32[1];
                float v201 = -_Q4.f32[1];
                if (_Q4.f32[1] >= 0.0) {
                  float v201 = _Q4.f32[1];
                }
                long double v202 = v201;
                if (v202 <= 0.003131)
                {
                  *(double *)_Q0.i64 = v202 * 12.92;
                }
                else
                {
                  *(double *)_Q0.i64 = pow(v202, 0.416666667);
                  _Q4.i32[2] = v279.i32[2];
                  _Q1.i32[1] = -1079236363;
                  *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                }
                float v210 = *(double *)_Q0.i64;
                if (v200 < 0.0) {
                  float v210 = -v210;
                }
                if ((int)(float)((float)(v210 * 510.0) + 384.0) >= 0x3FF) {
                  int v211 = 1023;
                }
                else {
                  int v211 = (int)(float)((float)(v210 * 510.0) + 384.0);
                }
                float v212 = _Q4.f32[2];
                float v213 = -_Q4.f32[2];
                if (_Q4.f32[2] >= 0.0) {
                  float v213 = _Q4.f32[2];
                }
                long double v214 = v213;
                if (v214 <= 0.003131)
                {
                  *(double *)_Q0.i64 = v214 * 12.92;
                }
                else
                {
                  *(double *)_Q0.i64 = pow(v214, 0.416666667);
                  _Q1.i32[1] = -1079236363;
                  *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                }
                float32x4_t v20 = 0uLL;
                int v164 = (v199 << 20) | (v211 << 10);
                float v174 = *(double *)_Q0.i64;
                if (v212 < 0.0) {
                  float v174 = -v174;
                }
                int v16 = a2;
              }
              else
              {
                float v174 = _Q4.f32[2];
                int32x2_t v175 = (int32x2_t)vshl_u32(vmin_u32((uint32x2_t)vcvt_s32_f32(vmla_f32((float32x2_t)vdup_n_s32(0x43C00000u), (float32x2_t)vdup_n_s32(0x43FF0000u), *(float32x2_t *)_Q4.f32)), (uint32x2_t)0x300000003), (uint32x2_t)0xA00000014);
                *(int32x2_t *)_Q2.i8 = vdup_lane_s32(v175, 1);
                *(int8x8_t *)_Q1.f32 = vorr_s8((int8x8_t)v175, *(int8x8_t *)_Q2.i8);
                int v164 = _Q1.i32[0];
              }
              _Q2.i32[0] = 1140785152;
              _Q0.f32[0] = (float)(v174 * 510.0) + 384.0;
              int v163 = (int)_Q0.f32[0];
              if ((int)_Q0.f32[0] >= 0x3FF) {
                int v163 = 1023;
              }
              goto LABEL_465;
            default:
              if (a3 == 2147483649)
              {
                *(unsigned char *)uint64_t v27 = (int)(float)(255.0 * _Q4.f32[0]);
                *(unsigned char *)(v27 + 1) = (int)vmuls_lane_f32(255.0, *(float32x2_t *)_Q4.f32, 1);
                _Q0.f32[0] = vmuls_lane_f32(255.0, _Q4, 2);
              }
              else
              {
                if (a3 != 2147483650) {
                  goto LABEL_550;
                }
                *(unsigned char *)uint64_t v27 = (int)vmuls_lane_f32(255.0, _Q4, 2);
                *(unsigned char *)(v27 + 1) = (int)vmuls_lane_f32(255.0, *(float32x2_t *)_Q4.f32, 1);
                _Q0.f32[0] = 255.0 * _Q4.f32[0];
              }
              *(unsigned char *)(v27 + 2) = (int)_Q0.f32[0];
              uint64_t v137 = 3;
              break;
          }
          goto LABEL_542;
        }
        if (a3 != 115)
        {
          if (a3 != 125) {
            goto LABEL_550;
          }
          *(float32x4_t *)uint64_t v27 = _Q4;
          uint64_t v137 = 16;
          goto LABEL_542;
        }
        *(float16x4_t *)_Q0.f32 = vcvt_f16_f32(_Q4);
      }
      else
      {
        if (a3 <= 92)
        {
          if (a3 > 89)
          {
            if (a3 == 90)
            {
              int v162 = (int)(float)(1023.0 * _Q4.f32[0]);
              _Q0 = (float32x4_t)vextq_s8((int8x16_t)_Q4, (int8x16_t)_Q4, 8uLL);
              _Q4.i32[0] = _Q0.i32[1];
              _Q1.i32[1] = 10;
              *(uint32x2_t *)_Q0.f32 = vshl_u32((uint32x2_t)vcvt_s32_f32(vmul_f32(*(float32x2_t *)_Q4.f32, (float32x2_t)0x447FC00040400000)), (uint32x2_t)0xA0000001ELL);
              int v163 = _Q0.i32[1];
              int v164 = _Q0.i32[0] | (v162 << 20) | v162;
LABEL_465:
              int v148 = v164 | v163;
            }
            else
            {
              if (a3 != 92) {
                goto LABEL_550;
              }
              if (_Q4.i32[2] < 0)
              {
                unsigned int v141 = 0;
              }
              else
              {
                unsigned int v138 = _Q4.i32[2] & 0x7F800000;
                unsigned int v139 = _Q4.i32[2] & 0x7FFFFF;
                if ((_Q4.i32[2] & 0x7F800000u) <= 0x477FFFFF)
                {
                  if (v138 >= 0x38000001) {
                    unsigned int v141 = ((v138 - 939524096) | v139) >> 18;
                  }
                  else {
                    unsigned int v141 = v139 >> (((939524096 - v138) >> 23) + 19);
                  }
                }
                else if (v138 != 2139095040 || v139 == 0)
                {
                  unsigned int v141 = 992;
                }
                else
                {
                  unsigned int v141 = 1023;
                }
              }
              if (_Q4.i32[1] < 0)
              {
                unsigned int v228 = 0;
              }
              else
              {
                unsigned int v225 = _Q4.i32[1] & 0x7F800000;
                unsigned int v226 = _Q4.i32[1] & 0x7FFFFF;
                if ((_Q4.i32[1] & 0x7F800000u) <= 0x477FFFFF)
                {
                  if (v225 >= 0x38000001) {
                    unsigned int v228 = ((v225 - 939524096) | v226) >> 17;
                  }
                  else {
                    unsigned int v228 = v226 >> (((939524096 - v225) >> 23) + 18);
                  }
                }
                else if (v225 != 2139095040 || v226 == 0)
                {
                  unsigned int v228 = 1984;
                }
                else
                {
                  unsigned int v228 = 2047;
                }
              }
              if (_Q4.i32[0] < 0)
              {
                unsigned int v232 = 0;
              }
              else
              {
                unsigned int v229 = _Q4.i32[0] & 0x7F800000;
                unsigned __int32 v230 = _Q4.i32[0] & 0x7FFFFF;
                if ((_Q4.i32[0] & 0x7F800000u) <= 0x477FFFFF)
                {
                  if (v229 >= 0x38000001) {
                    unsigned int v232 = ((v229 - 939524096) | v230) >> 17;
                  }
                  else {
                    unsigned int v232 = v230 >> (((939524096 - v229) >> 23) + 18);
                  }
                }
                else if (v229 != 2139095040 || v230 == 0)
                {
                  unsigned int v232 = 1984;
                }
                else
                {
                  unsigned int v232 = 2047;
                }
              }
              int v148 = (v141 << 22) | (v228 << 11) | v232;
            }
LABEL_501:
            *(_DWORD *)uint64_t v27 = v148;
          }
          else if (a3 == 80)
          {
            _Q0 = (float32x4_t)vcvtq_s32_f32(vmulq_f32(_Q4, (float32x4_t)vdupq_n_s32(0x437F0000u)));
            *(int16x4_t *)_Q0.f32 = vrev32_s16(vmovn_s32((int32x4_t)_Q0));
            *(int8x8_t *)_Q0.f32 = vext_s8(*(int8x8_t *)_Q0.f32, *(int8x8_t *)_Q0.f32, 6uLL);
LABEL_390:
            *(int8x8_t *)_Q0.f32 = vmovn_s16((int16x8_t)_Q0);
            *(_DWORD *)uint64_t v27 = _Q0.i32[0];
          }
          else
          {
            if (a3 != 81) {
              goto LABEL_550;
            }
            float v129 = _Q4.f32[2];
            if (v16)
            {
              float v130 = -_Q4.f32[2];
              if (_Q4.f32[2] >= 0.0) {
                float v130 = _Q4.f32[2];
              }
              long double v131 = v130;
              float32x4_t v276 = _Q4;
              if (v131 <= 0.003131)
              {
                *(double *)_Q0.i64 = v131 * 12.92;
              }
              else
              {
                *(double *)_Q0.i64 = pow(v131, 0.416666667);
                _Q4 = v276;
                _Q1.i32[1] = -1079236363;
                *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
              }
              float v189 = *(double *)_Q0.i64;
              if (v129 < 0.0) {
                float v189 = -v189;
              }
              *(unsigned char *)uint64_t v27 = (int)(float)(v189 * 255.0);
              float v190 = _Q4.f32[1];
              float v191 = -_Q4.f32[1];
              if (_Q4.f32[1] >= 0.0) {
                float v191 = _Q4.f32[1];
              }
              long double v192 = v191;
              if (v192 <= 0.003131)
              {
                *(double *)_Q0.i64 = v192 * 12.92;
              }
              else
              {
                *(double *)_Q0.i64 = pow(v192, 0.416666667);
                _Q4 = v276;
                _Q1.i32[1] = -1079236363;
                *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
              }
              float v203 = *(double *)_Q0.i64;
              if (v190 < 0.0) {
                float v203 = -v203;
              }
              *(unsigned char *)(v27 + 1) = (int)(float)(v203 * 255.0);
              float v204 = -_Q4.f32[0];
              if (_Q4.f32[0] >= 0.0) {
                float v204 = _Q4.f32[0];
              }
              long double v205 = v204;
              if (v205 <= 0.003131)
              {
                *(double *)_Q0.i64 = v205 * 12.92;
              }
              else
              {
                *(double *)_Q0.i64 = pow(v205, 0.416666667);
                _Q4 = v276;
                _Q1.i32[1] = -1079236363;
                *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
              }
              float v215 = *(double *)_Q0.i64;
              float v216 = -v215;
              _NF = _Q4.f32[0] < 0.0;
LABEL_531:
              if (_NF) {
                float v215 = v216;
              }
              *(unsigned char *)(v27 + 2) = (int)(float)(v215 * 255.0);
              float v245 = _Q4.f32[3];
              float v246 = -_Q4.f32[3];
              if (_Q4.f32[3] >= 0.0) {
                float v246 = _Q4.f32[3];
              }
              long double v247 = v246;
              if (v247 <= 0.003131)
              {
                *(double *)_Q0.i64 = v247 * 12.92;
              }
              else
              {
                *(double *)_Q0.i64 = pow(v247, 0.416666667);
                _Q1.i32[1] = -1079236363;
                *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
              }
              float32x4_t v20 = 0uLL;
              float v224 = *(double *)_Q0.i64;
              if (v245 < 0.0) {
                float v224 = -v224;
              }
            }
            else
            {
              *(unsigned char *)uint64_t v27 = (int)(float)(_Q4.f32[2] * 255.0);
              *(unsigned char *)(v27 + 1) = (int)vmuls_lane_f32(255.0, *(float32x2_t *)_Q4.f32, 1);
              float v166 = 255.0 * _Q4.f32[0];
LABEL_474:
              *(unsigned char *)(v27 + 2) = (int)v166;
              float v224 = _Q4.f32[3];
            }
            _Q0.f32[0] = v224 * 255.0;
            *(unsigned char *)(v27 + 3) = (int)_Q0.f32[0];
          }
LABEL_541:
          uint64_t v137 = 4;
          goto LABEL_542;
        }
        if (a3 <= 109)
        {
          if (a3 == 93)
          {
            float v151 = 65408.0;
            if (_Q4.f32[0] < 65408.0) {
              float v151 = _Q4.f32[0];
            }
            if (_Q4.f32[0] <= 0.0) {
              float v152 = 0.0;
            }
            else {
              float v152 = v151;
            }
            float32x2_t v153 = (float32x2_t)vextq_s8((int8x16_t)_Q4, (int8x16_t)_Q4, 4uLL).u64[0];
            float32x2_t v154 = (float32x2_t)vdup_n_s32(0x477F8000u);
            int8x8_t v155 = vand_s8(vbsl_s8((int8x8_t)vcge_f32(v153, v154), (int8x8_t)v154, (int8x8_t)v153), (int8x8_t)vcgtz_f32(v153));
            float v156 = *(float *)&v155.i32[1];
            float32x2_t v280 = (float32x2_t)v155;
            if (*(float *)v155.i32 >= *(float *)&v155.i32[1]) {
              float v156 = *(float *)v155.i32;
            }
            if (v156 <= v152) {
              float v157 = v152;
            }
            else {
              float v157 = v156;
            }
            if ((LODWORD(v157) >> 23) - 127 <= 0xFFFFFFF0) {
              int v158 = -16;
            }
            else {
              int v158 = (LODWORD(v157) >> 23) - 127;
            }
            double v159 = exp2((double)(v158 - 8));
            _Q2.i64[0] = 0.5;
            unsigned int v160 = vcvtmd_s64_f64(v157 / v159 + 0.5);
            if (v160 == 512)
            {
              double v159 = v159 + v159;
              int v161 = v158 + 17;
            }
            else
            {
              if (v160 >= 0x200) {
                RGBFloat32ToShareExponent32();
              }
              int v161 = v158 + 16;
            }
            unsigned int v176 = vcvtmd_s64_f64(v152 / v159 + 0.5);
            int v16 = a2;
            if (v176 >= 0x200) {
              RGBFloat32ToShareExponent32();
            }
            __asm { FMOV            V1.2D, #0.5 }
            _Q0 = (float32x4_t)vcvtq_s64_f64(vrndmq_f64(vaddq_f64(vdivq_f64(vcvtq_f64_f32(v280), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v159, 0)), (float64x2_t)_Q1)));
            *(int32x2_t *)_Q0.f32 = vmovn_s64((int64x2_t)_Q0);
            if (_Q0.i32[0] >= 0x200u) {
              RGBFloat32ToShareExponent32();
            }
            if (_Q0.i32[1] >= 0x200u) {
              RGBFloat32ToShareExponent32();
            }
            int32x2_t v177 = (int32x2_t)vand_s8((int8x8_t)vshl_u32(*(uint32x2_t *)_Q0.f32, (uint32x2_t)0x1200000009), (int8x8_t)0x7FC00000003FE00);
            *(int32x2_t *)_Q1.f32 = vdup_lane_s32(v177, 1);
            *(int8x8_t *)_Q0.f32 = vorr_s8((int8x8_t)v177, *(int8x8_t *)_Q1.f32);
            *(_DWORD *)uint64_t v27 = _Q0.i32[0] | (v161 << 27) | v176;
            uint64_t v137 = 4;
            float32x4_t v20 = 0uLL;
            goto LABEL_542;
          }
          if (a3 != 105) {
            goto LABEL_550;
          }
          *(void *)uint64_t v27 = _Q4.i64[0];
          goto LABEL_337;
        }
        if (a3 == 110)
        {
          _Q0 = (float32x4_t)vcvtq_u32_f32(vmulq_f32(_Q4, (float32x4_t)vdupq_n_s32(0x477FFF00u)));
        }
        else
        {
          if (a3 != 112) {
LABEL_550:
          }
            slowConvert_cold_2();
          _Q0 = (float32x4_t)vcvtq_s32_f32(vmulq_f32(_Q4, (float32x4_t)vdupq_n_s32(0x46FFFE00u)));
        }
        *(int16x4_t *)_Q0.f32 = vmovn_s32((int32x4_t)_Q0);
      }
LABEL_336:
      *(void *)uint64_t v27 = _Q0.i64[0];
LABEL_337:
      uint64_t v137 = 8;
LABEL_542:
      double v26 = (uint16x4_t *)((char *)v26 + v42);
      v27 += v137;
      if (!--v25) {
        goto LABEL_543;
      }
    }
    if (a7 <= 11)
    {
      switch(a7)
      {
        case 1:
          _Q0.i8[0] = v26->i8[0];
          _Q0.f32[0] = (float)_Q0.u32[0] / 255.0;
          _Q4.i64[0] = 0;
          _Q4.i32[2] = 0;
          break;
        case 10:
          _Q0.i8[0] = v26->i8[0];
          _Q4.f32[0] = (float)_Q0.u32[0] / 255.0;
LABEL_117:
          _Q4.i32[1] = 0;
          _Q4.i32[2] = 0;
          _Q0.i32[0] = 1.0;
          break;
        case 11:
          _Q0.i8[0] = v26->i8[0];
          _Q0.f32[0] = (float)_Q0.u32[0] / 255.0;
          _Q1 = (float32x4_t)_Q0.u32[0];
          if (v16)
          {
            double v31 = _Q0.f32[0];
            if (v31 <= 0.04045)
            {
              *(double *)_Q0.i64 = v31 / 12.92;
            }
            else
            {
              float32x4_t v269 = _Q1;
              *(double *)_Q0.i64 = pow((v31 + 0.055) / 1.055, 2.4);
              _Q1 = v269;
              float32x4_t v20 = 0uLL;
            }
            _Q0.f32[0] = *(double *)_Q0.i64;
            _Q1.i32[0] = _Q0.i32[0];
          }
          _Q4 = (float32x4_t)xmmword_1DC80BF70;
          _Q4.i32[0] = _Q1.i32[0];
          goto LABEL_129;
        default:
          goto LABEL_62;
      }
      _Q4.i32[3] = _Q0.i32[0];
LABEL_129:
      uint64_t v42 = 1;
      goto LABEL_229;
    }
    switch(a7)
    {
      case 20:
        _Q0.i16[0] = v26->i16[0];
        _Q4.f32[0] = (float)_Q0.u32[0] / 65535.0;
        goto LABEL_96;
      case 21:
      case 23:
      case 24:
      case 26:
      case 27:
      case 28:
      case 29:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
        goto LABEL_62;
      case 22:
        int v59 = v26->i16[0];
        if ((float)((float)v59 / 32767.0) >= v22) {
          _Q4.f32[0] = (float)v59 / 32767.0;
        }
        else {
          _Q4.f32[0] = v22;
        }
        goto LABEL_96;
      case 25:
        _H0 = v26->i16[0];
        __asm { FCVT            S4, H0 }
LABEL_96:
        _Q4.i32[1] = 0;
        goto LABEL_105;
      case 30:
        v61.i32[0] = v26->u8[0];
        v61.i32[1] = v26->u8[1];
        _Q1.i32[1] = v261.i32[1];
        *(float32x2_t *)_Q4.f32 = vdiv_f32(vcvt_f32_u32(v61), v261);
        _Q0 = v266;
        _Q4.i64[1] = v266.i64[0];
        goto LABEL_113;
      case 31:
        _Q0.i8[0] = v26->i8[0];
        _Q0.f32[0] = (float)_Q0.u32[0] / 255.0;
        _Q2.i8[0] = v26->i8[1];
        *(float *)_Q2.i32 = (float)_Q2.u32[0];
        _Q1.f32[0] = *(float *)_Q2.i32 / 255.0;
        _Q4.i32[0] = _Q0.i32[0];
        _Q4.f32[1] = *(float *)_Q2.i32 / 255.0;
        if (v16)
        {
          double v62 = _Q0.f32[0];
          if (v62 <= 0.04045)
          {
            double v64 = v62 / 12.92;
          }
          else
          {
            float32x4_t v253 = _Q1;
            long double v63 = pow((v62 + 0.055) / 1.055, 2.4);
            _Q1 = v253;
            double v64 = v63;
          }
          double v108 = _Q1.f32[0];
          if (_Q1.f32[0] <= 0.04045) {
            double v109 = v108 / 12.92;
          }
          else {
            double v109 = pow((v108 + 0.055) / 1.055, 2.4);
          }
          float32_t v110 = v64;
          _Q4.f32[0] = v110;
          float32_t v111 = v109;
          _Q4.f32[1] = v111;
          float32x4_t v20 = 0uLL;
        }
        _Q0 = (float32x4_t)xmmword_1DC80BF70;
        _Q4.i64[1] = 0x3F80000000000000;
        goto LABEL_113;
      case 32:
        if ((float)((float)v26->i8[0] / 127.0) >= v22) {
          _Q4.f32[0] = (float)v26->i8[0] / 127.0;
        }
        else {
          _Q4.f32[0] = v22;
        }
        _Q4.f32[1] = (float)v26->i8[1] / 127.0;
LABEL_105:
        _Q4.i32[2] = 0;
        goto LABEL_107;
      case 40:
        unsigned __int32 v65 = v26->u16[0];
        _Q0.i32[0] = v65;
        _Q1.i32[0] = vshr_n_u32(*(uint32x2_t *)_Q0.f32, 0xBuLL).u32[0];
        _Q0.i32[1] = v65 >> 5;
        _Q2.i64[0] = 0x3F0000003FLL;
        _Q1.i32[1] = vand_s8(*(int8x8_t *)&_Q0, (int8x8_t)0x3F0000003FLL).i32[1];
        *(float32x2_t *)_Q0.f32 = vcvt_f32_s32(*(int32x2_t *)_Q1.f32);
        _Q1.i32[1] = 1115422720;
        *(float32x2_t *)_Q4.f32 = vdiv_f32(*(float32x2_t *)_Q0.f32, (float32x2_t)0x427C000041F80000);
        _Q4.f32[2] = (float)(v65 & 0x1F) / 31.0;
LABEL_107:
        _Q0.i32[0] = 1.0;
        goto LABEL_112;
      case 41:
        unsigned int v71 = v26->u16[0];
        _Q0.f32[0] = (float)(v71 >> 11) / 31.0;
        __asm { FMOV            V2.2S, #31.0 }
        *(float32x2_t *)_Q1.f32 = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v71), (uint32x2_t)-6), (int8x8_t)0x1F0000001FLL)), *(float32x2_t *)_Q2.i8);
        _Q0 = (float32x4_t)vextq_s8((int8x16_t)_Q0, (int8x16_t)_Q0, 4uLL);
        _Q4 = (float32x4_t)vextq_s8((int8x16_t)_Q0, (int8x16_t)_Q1, 0xCuLL);
        int v70 = v71 & 1;
        goto LABEL_111;
      case 42:
        unsigned __int32 v66 = v26->u16[0];
        _Q0.i32[0] = v66;
        unsigned __int32 v67 = vshrq_n_u32((uint32x4_t)_Q0, 0xCuLL).u32[0];
        _Q0.i32[1] = v66 >> 8;
        _Q0.i32[2] = v66 >> 4;
        _Q0.i32[3] = v66;
        _Q2.i64[0] = 0xF0000000FLL;
        _Q2.i64[1] = 0xF0000000FLL;
        int32x4_t v68 = (int32x4_t)vandq_s8((int8x16_t)_Q0, _Q2);
        v68.i32[0] = v67;
        _Q0 = vcvtq_f32_s32(v68);
        __asm { FMOV            V1.4S, #15.0 }
        _Q4 = vdivq_f32(_Q0, _Q1);
        goto LABEL_113;
      case 43:
        unsigned int v69 = v26->u16[0];
        *(float32x2_t *)_Q0.f32 = vcvt_f32_s32((int32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v69), (uint32x2_t)0xFFFFFFFBFFFFFFF6), (int8x8_t)0x1F0000001FLL));
        __asm { FMOV            V1.2S, #31.0 }
        *(float32x2_t *)_Q4.f32 = vdiv_f32(*(float32x2_t *)_Q0.f32, *(float32x2_t *)_Q1.f32);
        _Q4.f32[2] = (float)(v69 & 0x1F) / 31.0;
        int v70 = v69 >> 15;
LABEL_111:
        _Q0.f32[0] = (float)v70;
LABEL_112:
        _Q4.i32[3] = _Q0.i32[0];
LABEL_113:
        uint64_t v42 = 2;
        goto LABEL_229;
      default:
        if (a7 == 12)
        {
          if ((float)((float)v26->i8[0] / 127.0) >= v22) {
            _Q4.f32[0] = (float)v26->i8[0] / 127.0;
          }
          else {
            _Q4.f32[0] = v22;
          }
          goto LABEL_117;
        }
        if (a7 != 55) {
          goto LABEL_62;
        }
        _Q4.i64[0] = v26->u32[0];
        _Q4.i32[2] = 0;
        break;
    }
LABEL_89:
    _Q0.i32[0] = 1.0;
    _Q4.i32[3] = 1.0;
    goto LABEL_228;
  }
}

void newScaledImageWithLancosFilter_cold_1()
{
}

void newScaledImageWithLancosFilter_cold_2()
{
}

void RGBFloat32ToShareExponent32()
{
  __assert_rtn("RGBFloat32ToShareExponent32", "TXRFloatConvert.h", 121, "rm <= MAX_RGB9E5_MANTISSA");
}

{
  __assert_rtn("RGBFloat32ToShareExponent32", "TXRFloatConvert.h", 122, "gm <= MAX_RGB9E5_MANTISSA");
}

{
  __assert_rtn("RGBFloat32ToShareExponent32", "TXRFloatConvert.h", 123, "bm <= MAX_RGB9E5_MANTISSA");
}

{
  __assert_rtn("RGBFloat32ToShareExponent32", "TXRFloatConvert.h", 114, "maxm <= MAX_RGB9E5_MANTISSA");
}

void pixelBytes_cold_1()
{
}

void componentsPerPixel_cold_1()
{
}

void slowConvert_cold_1()
{
}

void slowConvert_cold_2()
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9AB8](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
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

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

void CGImageDestinationSetProperties(CGImageDestinationRef idst, CFDictionaryRef properties)
{
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D0](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D8](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1F40DA8E8](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1F40C9CA0](a1, *(void *)&a2, a3, a4);
}

float at_encoder_compress_texels(at_encoder_t encoder, const at_texel_region_t *src, const at_block_buffer_t *dest, float errorThreshold, at_flags_t flags)
{
  MEMORY[0x1F417E278](encoder, src, dest, flags, errorThreshold);
  return result;
}

at_encoder_t at_encoder_create(at_texel_format_t texelType, at_alpha_t texelAlphaType, at_block_format_t blockType, at_alpha_t blockAlphaType, const float *backgroundColor)
{
  return (at_encoder_t)MEMORY[0x1F417E280](texelType, *(void *)&texelAlphaType, blockType, *(void *)&blockAlphaType, backgroundColor);
}

at_error_t at_encoder_decompress_texels(at_encoder_t encoder, const at_block_buffer_t *src, const at_texel_region_t *dest, at_flags_t flags)
{
  return MEMORY[0x1F417E288](encoder, src, dest, flags);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
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

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

long double ldexp(long double __x, int __e)
{
  MEMORY[0x1F40CC800](*(void *)&__e, __x);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x1F40D3028](buf, format, backgroundColor, image, *(void *)&flags);
}

vImage_Error vImageConvert_ARGBFFFFtoARGB8888_dithered(const vImage_Buffer *src, const vImage_Buffer *dest, const Pixel_FFFF maxFloat, const Pixel_FFFF minFloat, int dither, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D3030](src, dest, maxFloat, minFloat, *(void *)&dither, permuteMap, *(void *)&flags);
}

vImage_Error vImageHorizontalReflect_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D3040](src, dest, *(void *)&flags);
}

vImage_Error vImageHorizontalReflect_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D3048](src, dest, *(void *)&flags);
}

vImage_Error vImageHorizontalReflect_ARGBFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D3050](src, dest, *(void *)&flags);
}

vImage_Error vImageHorizontalReflect_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D3058](src, dest, *(void *)&flags);
}

vImage_Error vImageHorizontalReflect_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D3060](src, dest, *(void *)&flags);
}

vImage_Error vImageHorizontalReflect_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D3068](src, dest, *(void *)&flags);
}

vImage_Error vImageRotate90_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, const Pixel_ARGB_16U backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D3070](src, dest, rotationConstant, backColor, *(void *)&flags);
}

vImage_Error vImageRotate90_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, const Pixel_8888 backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D3078](src, dest, rotationConstant, backColor, *(void *)&flags);
}

vImage_Error vImageRotate90_ARGBFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, const Pixel_FFFF backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D3080](src, dest, rotationConstant, backColor, *(void *)&flags);
}

vImage_Error vImageRotate90_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_16U backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D3088](src, dest, rotationConstant, backColor, *(void *)&flags);
}

vImage_Error vImageRotate90_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_8 backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D3090](src, dest, rotationConstant, backColor, *(void *)&flags);
}

vImage_Error vImageRotate90_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_F backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D3098](src, dest, rotationConstant, *(void *)&flags, backColor);
}

vImage_Error vImageScale_ARGB16S(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D30A0](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D30A8](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D30B0](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_ARGBFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D30B8](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D30C0](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D30C8](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageVerticalReflect_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D30D0](src, dest, *(void *)&flags);
}

vImage_Error vImageVerticalReflect_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D30D8](src, dest, *(void *)&flags);
}

vImage_Error vImageVerticalReflect_ARGBFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D30E0](src, dest, *(void *)&flags);
}

vImage_Error vImageVerticalReflect_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D30E8](src, dest, *(void *)&flags);
}

vImage_Error vImageVerticalReflect_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D30F0](src, dest, *(void *)&flags);
}

vImage_Error vImageVerticalReflect_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D30F8](src, dest, *(void *)&flags);
}