@interface RawMetaDataReader
+ (BOOL)_getExposureInfo:(id)a3 info:(float *)a4;
+ (BOOL)_getKeypointsMappingInfoFrom:(id)a3 validWidth:(unint64_t)a4 validHeight:(unint64_t)a5 KeyPointDictionary:(__CFDictionary *)a6 IspInfo:(id *)a7;
+ (BOOL)_getLightSourceMappingInfoFrom:(id)a3 imageValidWidth:(unint64_t)a4 imageValidHeight:(unint64_t)a5 lightSourceDictionary:(__CFDictionary *)a6 lightSourceValidWidth:(unint64_t)a7 lightSourceValidHeight:(unint64_t)a8 ispInfo:(id *)a9;
+ (BOOL)_getRegistrationInfo:(id)a3 validWidth:(unint64_t)a4 validHeight:(unint64_t)a5 keypointDictionary:(__CFDictionary *)a6 ispInfo:(id *)a7;
+ (BOOL)computeMappingMatrices:(id *)a3;
+ (BOOL)isOpticalCenterKeyV2Present:(id)a3;
+ (id)readMetaDataFromDictionary:(id)a3 andValidWidth:(unint64_t)a4 andValidHeight:(unint64_t)a5 andLightSource:(opaqueCMSampleBuffer *)a6 andKeyPoints:(opaqueCMSampleBuffer *)a7;
- (BOOL)readIspConfigInfoFromSei:(id *)a3;
- (BOOL)readIspDistInfoFromSei:(id *)a3;
- (BOOL)readIspExposureInfoFromSei:(id *)a3;
- (BOOL)readIspMappingInfoFromSei:(id *)a3;
- (BOOL)readIspOisInfoFromSei:(id *)a3;
- (BOOL)readIspRegInfoFromSei:(id *)a3 simMatrix:(id)a4;
- (BOOL)readIspScalerInfoFromSei:(id *)a3;
- (BOOL)readLtmInfoFromSei:(const __CFData *)a3;
- (RawMetaDataReader)initWithMetaBuffer:(id)a3;
- (__CFData)ExtractClippingInfoFromRawMetaData:(sCIspMetaDataSharedLocalClipping *)a3;
- (id)readMetaDataInfoFromSimulation:(id)a3;
- (void)setInstanceVariablesFrom:(id)a3;
@end

@implementation RawMetaDataReader

- (RawMetaDataReader)initWithMetaBuffer:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RawMetaDataReader;
  v6 = [(RawMetaDataReader *)&v10 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->inputDictionary, a3);
  v8 = [v5 objectForKeyedSubscript:@"RawMetaData"];
  if (v8)
  {
    [(RawMetaDataReader *)v7 setInstanceVariablesFrom:v8];

LABEL_4:
    v8 = v7;
  }

  return v8;
}

- (void)setInstanceVariablesFrom:(id)a3
{
  v4 = (sCIspMetaDataShared *)[a3 bytes];
  self->pMetadata = v4;
  unsigned int var3 = v4->var3;
  if (var3)
  {
    uint64_t var4 = v4->var4;
    if (var4) {
      self->pMetaDataInput = (sCIspMetaDataSharedInput *)((char *)v4 + var4);
    }
    if (var3 >= 2)
    {
      uint64_t v7 = v4->var5[0];
      if (v7) {
        self->pMetaDataOutput = (sCIspMetaDataSharedOutput *)((char *)v4 + v7);
      }
      if (var3 >= 3)
      {
        uint64_t v8 = v4->var5[1];
        if (v8) {
          self->pMetaDataAE = (sCIspMetaDataSharedAE *)((char *)v4 + v8);
        }
        if (var3 >= 0xE)
        {
          uint64_t v9 = v4->var5[12];
          if (v9) {
            self->pMetadataOIS = (sCIspMetaDataSharedOIS *)((char *)v4 + v9);
          }
          if (var3 >= 0x1F)
          {
            uint64_t v10 = v4->var5[29];
            if (v10) {
              self->pMetaDataSharedDistortion = (sCIspMetaDataSharedDistortion *)((char *)v4 + v10);
            }
            if (var3 >= 0x40)
            {
              uint64_t v11 = v4->var5[62];
              if (v11) {
                self->pMetaDataSharedLocalClipping = (sCIspMetaDataSharedLocalClipping *)((char *)v4 + v11);
              }
            }
          }
        }
      }
    }
  }
}

- (__CFData)ExtractClippingInfoFromRawMetaData:(sCIspMetaDataSharedLocalClipping *)a3
{
  uint64_t v4 = 0;
  int v5 = 0;
  __int16 v6 = -1;
  __int16 v7 = -1;
  __int16 v8 = -1;
  __int16 v9 = -1;
  while (2)
  {
    switch(a3->var0[v4])
    {
      case 0:
        goto LABEL_8;
      case 1:
        __int16 v8 = v4;
        goto LABEL_7;
      case 2:
        __int16 v9 = v4;
        goto LABEL_7;
      case 3:
        __int16 v6 = v4;
        goto LABEL_7;
      case 4:
        __int16 v7 = v4;
        goto LABEL_7;
      default:
LABEL_7:
        ++v5;
LABEL_8:
        if (++v4 != 4) {
          continue;
        }
        size_t v10 = 2 * v5 * a3->var1.var2 * a3->var1.var3;
        if (!v10 || v10 >= 0x181)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          v12 = 0;
LABEL_16:
          free(v12);
          return 0;
        }
        uint64_t v11 = (char *)malloc_type_malloc((v10 + 44), 0xD820DA0CuLL);
        v12 = v11;
        if (!v11) {
          goto LABEL_15;
        }
        sCIspTileGrid var1 = a3->var1;
        *(_DWORD *)uint64_t v11 = 1;
        *((_DWORD *)v11 + 1) = v10 + 44;
        *(int8x16_t *)(v11 + 8) = vextq_s8((int8x16_t)var1, (int8x16_t)vuzp1q_s32((int32x4_t)var1, vdupq_lane_s32(*(int32x2_t *)&var1.var0, 1)), 0xCuLL);
        *((_WORD *)v11 + 12) = a3->var6;
        *((_DWORD *)v11 + 7) = a3->var4;
        *((_WORD *)v11 + 16) = a3->var2;
        *((_WORD *)v11 + 17) = v9;
        *((_WORD *)v11 + 20) = v8;
        *((_WORD *)v11 + 18) = a3->var3;
        *((_WORD *)v11 + 19) = v7;
        *((_WORD *)v11 + 21) = v6;
        memcpy(v11 + 44, a3->var5, v10);
        result = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, (const UInt8 *)v12, (v10 + 44), kCFAllocatorMalloc);
        if (!result)
        {
LABEL_15:
          fig_log_get_emitter();
          FigDebugAssert3();
          goto LABEL_16;
        }
        return result;
    }
  }
}

+ (BOOL)computeMappingMatrices:(id *)a3
{
  double x = a3->var2.var7.origin.x;
  double y = a3->var2.var7.origin.y;
  double width = a3->var2.var7.size.width;
  double height = a3->var2.var7.size.height;
  float v7 = a3->var1.var0 + a3->var1.var0;
  float v9 = a3->var2.var1.size.height / (double)(int)a3->var2.var2.height;
  if (v7 == 0.0) {
    float v10 = 1.0;
  }
  else {
    float v10 = a3->var1.var0 + a3->var1.var0;
  }
  float v8 = a3->var2.var1.size.width / (double)(int)a3->var2.var2.width;
  float v11 = v10 * v8;
  if ((float)(a3->var1.var1 + a3->var1.var1) == 0.0) {
    float v7 = 1.0;
  }
  float v12 = a3->var2.var1.origin.x - x;
  float v13 = a3->var2.var1.origin.y - y;
  *(void *)&a3->var3.var0[1] = 0;
  *(void *)&a3->var3.var0[3] = 0;
  *(void *)&a3->var3.var0[5] = 0;
  *(void *)&a3->var3.var0[7] = 0x3F80000000000000;
  a3->var3.var0[0] = v11;
  a3->var3.var0[2] = v12;
  a3->var3.var0[4] = v7 * v9;
  a3->var3.var0[5] = v13;
  float v14 = a3->var2.var5.size.width / (double)(int)a3->var2.var6.width;
  float v15 = a3->var2.var5.size.height / (double)(int)a3->var2.var6.height;
  float v16 = a3->var2.var5.origin.x - x;
  float v17 = a3->var2.var5.origin.y - y;
  *(void *)&a3->var3.var1[1] = 0;
  *(void *)&a3->var3.var1[3] = 0;
  *(void *)&a3->var3.var1[5] = 0;
  *(void *)&a3->var3.var1[7] = 0x3F80000000000000;
  a3->var3.var1[0] = v14;
  a3->var3.var1[2] = v16;
  a3->var3.var1[4] = v15;
  a3->var3.var1[5] = v17;
  float v18 = a3->var2.var3.size.width / (double)(int)a3->var2.var4.width;
  float v19 = a3->var2.var3.size.height / (double)(int)a3->var2.var4.height;
  float v20 = a3->var2.var3.origin.x - x;
  float v21 = a3->var2.var3.origin.y - y;
  *(void *)&a3->var3.var2[3] = 0;
  *(void *)&a3->var3.var2[1] = 0;
  a3->var3.var2[7] = 0.0;
  *(void *)&a3->var3.var2[5] = 0;
  a3->var3.var2[0] = v18;
  a3->var3.var2[2] = v20;
  a3->var3.var2[4] = v19;
  a3->var3.var2[5] = v21;
  a3->var3.var2[8] = 1.0;
  float v22 = a3->var2.var8.size.width / (double)(int)width;
  float v23 = a3->var2.var8.size.height / (double)(int)height;
  float v24 = a3->var2.var8.origin.x - CGRectZero.origin.x;
  CGFloat v25 = a3->var2.var8.origin.y - CGRectZero.origin.y;
  *(void *)&a3->var3.var3[3] = 0;
  *(void *)&a3->var3.var3[1] = 0;
  a3->var3.var3[7] = 0.0;
  *(void *)&a3->var3.var3[5] = 0;
  a3->var3.var3[0] = v22;
  float v26 = v25;
  a3->var3.var3[2] = v24;
  a3->var3.var3[4] = v23;
  a3->var3.var3[5] = v26;
  a3->var3.var3[8] = 1.0;
  return 1;
}

- (BOOL)readIspScalerInfoFromSei:(id *)a3
{
  if (a3 && self->pMetaDataInput && self->pMetaDataOutput)
  {
    bzero(a3, 0x240uLL);
    pMetaDataInput = (unsigned __int16 *)self->pMetaDataInput;
    pMetaDataOutput = self->pMetaDataOutput;
    CGFloat v7 = (double)(pMetaDataInput[256] >> 1);
    CGFloat v8 = (double)(pMetaDataInput[257] >> 1);
    a3->var1.var3.double x = v7;
    a3->var1.var3.double y = v8;
    *(void *)&a3->var1.var0 = 0x4000000040000000;
    int v9 = vcvtmd_s64_f64(v7 * 0.5 * 0.5);
    a3->var1.var4.double width = (double)(int)((v9 + (v9 < 0)) & 0xFFFFFFFE);
    a3->var1.var4.double height = floor(v8 * 0.5 * 0.5);
    uint64_t v10 = *(void *)&pMetaDataOutput->var15.var2;
    v11.i64[0] = v10;
    v11.i64[1] = HIDWORD(v10);
    float64x2_t v12 = vcvtq_f64_u64(v11);
    uint64_t v13 = *(void *)&pMetaDataOutput->var21.var2;
    v11.i64[0] = v13;
    v11.i64[1] = HIDWORD(v13);
    int32x2_t v14 = *(int32x2_t *)&pMetaDataOutput->var21.var0;
    v15.i32[0] = pMetaDataInput[254];
    v15.i32[1] = pMetaDataInput[255];
    *(float32x2_t *)a3->var1.var5 = vcvt_f32_f64(vdivq_f64(v12, vcvtq_f64_u64(v11)));
    *(float32x2_t *)&a3->var1.var5[2] = vcvt_f32_s32(vsub_s32(v14, v15));
    a3->var1.var6 = 0x7FFFFFFF;
    return 1;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (BOOL)readIspMappingInfoFromSei:(id *)a3
{
  if (a3 && self->pMetaDataInput && self->pMetaDataOutput)
  {
    a3->var2.var8.origin = 0u;
    a3->var2.var8.size = 0u;
    a3->var2.var7.origin = 0u;
    a3->var2.var7.size = 0u;
    a3->var2.var5.size = 0u;
    a3->var2.var6 = 0u;
    a3->var2.uint64_t var4 = 0u;
    a3->var2.var5.origin = 0u;
    a3->var2.var3.origin = 0u;
    a3->var2.var3.size = 0u;
    a3->var2.var1.size = 0u;
    a3->var2.var2 = 0u;
    a3->var2.var0.size = 0u;
    a3->var2.var1.origin = 0u;
    a3->var2.var0.origin = 0u;
    pMetaDataInput = self->pMetaDataInput;
    pMetaDataOutput = self->pMetaDataOutput;
    CGFloat var173_low = (double)LOWORD(pMetaDataInput->var173);
    LOWORD(v3) = HIWORD(pMetaDataInput->var173);
    CGFloat v9 = (double)v3;
    LOWORD(v4) = pMetaDataInput->var174;
    LOWORD(v5) = pMetaDataInput->var175;
    a3->var2.var0.origin.double x = var173_low;
    a3->var2.var0.origin.double y = v9;
    a3->var2.var0.size.double width = (double)v4;
    a3->var2.var0.size.double height = (double)v5;
    LOWORD(var173_low) = pMetaDataInput->var111;
    CGFloat v10 = (double)*(unint64_t *)&var173_low;
    LOWORD(v9) = HIWORD(pMetaDataInput->var111);
    unsigned int var112 = pMetaDataInput->var112;
    CGFloat v12 = (double)*(unint64_t *)&v9;
    LODWORD(pMetaDataInput) = pMetaDataInput->var113;
    a3->var2.var1.origin.double x = v10;
    a3->var2.var1.origin.double y = v12;
    a3->var2.var1.size.double width = (double)var112;
    a3->var2.var1.size.double height = (double)pMetaDataInput;
    a3->var2.var2.double width = (double)(var112 >> 1);
    a3->var2.var2.double height = (double)(pMetaDataInput >> 1);
    a3->var2.var3.origin.double x = v10;
    a3->var2.var3.origin.double y = v12;
    a3->var2.var3.size.double width = (double)var112;
    a3->var2.var3.size.double height = (double)pMetaDataInput;
    a3->var2.var4.double width = (double)(var112 >> 2);
    a3->var2.var4.double height = (double)(pMetaDataInput >> 2);
    a3->var2.var5.origin.double x = v10;
    a3->var2.var5.origin.double y = v12;
    a3->var2.var5.size.double width = (double)var112;
    a3->var2.var5.size.double height = (double)pMetaDataInput;
    a3->var2.var6.double width = (double)var112;
    a3->var2.var6.double height = (double)pMetaDataInput;
    uint64_t v13 = *(void *)&pMetaDataOutput->var21.var0;
    v14.i64[0] = (int)v13;
    v14.i64[1] = SHIDWORD(v13);
    CGPoint v15 = (CGPoint)vcvtq_f64_s64(v14);
    uint64_t v16 = *(void *)&pMetaDataOutput->var21.var2;
    v14.i64[0] = v16;
    v14.i64[1] = HIDWORD(v16);
    a3->var2.var7.origin = v15;
    a3->var2.var7.size = (CGSize)vcvtq_f64_u64((uint64x2_t)v14);
    v15.double x = *(CGFloat *)&pMetaDataOutput->var15.var0;
    uint64_t v17 = *(void *)&pMetaDataOutput->var15.var2;
    v14.i64[0] = SLODWORD(v15.x);
    v14.i64[1] = SHIDWORD(v15.x);
    CGPoint v18 = (CGPoint)vcvtq_f64_s64(v14);
    v14.i64[0] = v17;
    v14.i64[1] = HIDWORD(v17);
    a3->var2.var8.origin = v18;
    a3->var2.var8.size = (CGSize)vcvtq_f64_u64((uint64x2_t)v14);
    +[RawMetaDataReader computeMappingMatrices:](RawMetaDataReader, "computeMappingMatrices:");
    return 1;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (BOOL)readIspRegInfoFromSei:(id *)a3 simMatrix:(id)a4
{
  id v6 = a4;
  CGFloat v7 = v6;
  if (a3 && self->pMetaDataInput && self->pMetaDataOutput)
  {
    *(_OWORD *)&a3->var0.var4[7] = 0u;
    *(_OWORD *)a3->var0.uint64_t var4 = 0u;
    *(_OWORD *)&a3->var0.var4[4] = 0u;
    *(_OWORD *)&a3->var0.var0[4] = 0u;
    *(_OWORD *)&a3->var0.var0[8] = 0u;
    *(_OWORD *)a3->var0.var0 = 0u;
    pMetaDataOutput = self->pMetaDataOutput;
    long long v9 = *(_OWORD *)pMetaDataOutput->var30;
    long long v10 = *(_OWORD *)&pMetaDataOutput->var30[4];
    a3->var0.var0[8] = pMetaDataOutput->var30[8];
    *(_OWORD *)a3->var0.var0 = v9;
    *(_OWORD *)&a3->var0.var0[4] = v10;
    uint64x2_t v11 = self->pMetaDataOutput;
    a3->var0.sCIspTileGrid var1 = v11->var39;
    a3->var0.var2 = v11->var43;
    if (v6)
    {
      for (uint64_t i = 0; i != 9; ++i)
      {
        uint64_t v13 = [v7 objectAtIndexedSubscript:i];
        [v13 floatValue];
        a3->var0.var4[i] = v14;
      }
      a3->var0.var5 = 1;
    }
    a3->var0.unsigned int var3 = self->pMetaDataInput->var0;
    BOOL v15 = 1;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)readIspOisInfoFromSei:(id *)a3
{
  if (a3 && self->pMetadataOIS)
  {
    bzero(a3, 0x1FE8uLL);
    pMetadataOIS = self->pMetadataOIS;
    uint64_t var1 = pMetadataOIS->var1;
    a3->uint64_t var1 = var1;
    if (var1)
    {
      p_var7 = &pMetadataOIS->var4[0].var7;
      p_uint64_t var1 = &a3->var4[0].var1;
      do
      {
        *((void *)p_var1 - 1) = *((void *)p_var7 - 3);
        uint64_t v9 = *(void *)p_var7;
        p_var7 += 20;
        *(void *)p_uint64_t var1 = v9;
        p_var1 += 4;
        --var1;
      }
      while (var1);
    }
    return 1;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (BOOL)readIspDistInfoFromSei:(id *)a3
{
  if (a3 && self->pMetaDataSharedDistortion)
  {
    *(_OWORD *)&a3->var0 = 0u;
    *(_OWORD *)&a3->uint64_t var4 = 0u;
    pMetaDataSharedDistortion = self->pMetaDataSharedDistortion;
    *(void *)&long long v4 = *(void *)&pMetaDataSharedDistortion->var5;
    *((void *)&v4 + 1) = *(void *)&pMetaDataSharedDistortion->var19;
    *(_OWORD *)&a3->var0 = v4;
    *(void *)&a3->uint64_t var4 = *(void *)&pMetaDataSharedDistortion->var23;
    a3->var6 = pMetaDataSharedDistortion->var12;
    return 1;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (BOOL)readIspExposureInfoFromSei:(id *)a3
{
  if (a3 && self->pMetaDataInput && self->pMetaDataAE)
  {
    *a3 = 0;
    pMetaDataAE = self->pMetaDataAE;
    LOWORD(v3) = self->pMetaDataInput->var69;
    LODWORD(v4) = pMetaDataAE->var0;
    float v7 = (double)v4 / 1000000.0;
    LOWORD(v5) = pMetaDataAE->var3;
    a3->var0 = (float)((float)((float)((float)pMetaDataAE->var1 * 0.0039062) * (float)((float)v5 * 0.0039062))
                     * (float)((float)pMetaDataAE->var226 / (float)((float)((float)v3 * 0.0039062) * 256.0)))
             * v7;
    a3->uint64_t var1 = v7;
    return 1;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (BOOL)readLtmInfoFromSei:(const __CFData *)a3
{
  if (a3)
  {
    if (self->pMetaDataSharedLocalClipping)
    {
      unint64_t v4 = -[RawMetaDataReader ExtractClippingInfoFromRawMetaData:](self, "ExtractClippingInfoFromRawMetaData:");
      *a3 = v4;
      if (v4) {
        return 1;
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return 0;
}

- (BOOL)readIspConfigInfoFromSei:(id *)a3
{
  if (a3)
  {
    *(void *)&a3->var0 = 0;
    *(void *)&a3->var2 = 0;
    a3->var0 = self->pMetadata->var0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return a3 != 0;
}

- (id)readMetaDataInfoFromSimulation:(id)a3
{
  unsigned int v3 = (void *)__chkstk_darwin(self, a2, a3);
  id v5 = v4;
  float v24 = 0;
  [v3 readIspConfigInfoFromSei:&v36];
  if (([v3 readIspScalerInfoFromSei:v34] & 1) == 0
    || (v37 |= 1u, ([v3 readIspMappingInfoFromSei:v34] & 1) == 0)
    || (v37 |= 1u, ([v3 readIspRegInfoFromSei:v34 simMatrix:v5] & 1) == 0))
  {
    fig_log_get_emitter();
LABEL_30:
    FigDebugAssert3();
    CGFloat v8 = 0;
    id v6 = 0;
    float v7 = 0;
    goto LABEL_22;
  }
  v37 |= 0x20u;
  if (([v3 readIspOisInfoFromSei:v32] & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_30;
  }
  v37 |= 2u;
  if (([v3 readIspDistInfoFromSei:v25] & 1) == 0
    || (v37 |= 8u, ([v3 readIspExposureInfoFromSei:&v35] & 1) == 0))
  {
    fig_log_get_emitter();
    goto LABEL_30;
  }
  v37 |= 4u;
  if (([v3 readLtmInfoFromSei:&v24] & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_30;
  }
  v37 |= 0x10u;
  id v6 = +[NSMutableDictionary dictionary];
  uint64_t v38 = 0x100000001;
  float v7 = +[NSData dataWithBytes:&v36 length:16];
  [v6 setObject:v7 forKeyedSubscript:@"MetaConfig"];
  CGFloat v8 = +[NSData dataWithBytes:v34 length:576];
  [v6 setObject:v8 forKeyedSubscript:@"IspScalerInfo"];
  LODWORD(v9) = v35;
  long long v10 = +[NSNumber numberWithFloat:v9];
  [v6 setObject:v10 forKeyedSubscript:@"ExposureInfo"];

  uint64x2_t v11 = (void *)v3[1];
  uint64_t v12 = kFigCaptureStreamMetadata_LuxLevel;
  uint64_t v13 = [v11 objectForKeyedSubscript:kFigCaptureStreamMetadata_LuxLevel];
  [v6 setObject:v13 forKeyedSubscript:v12];

  float v14 = (int *)&v32[16 * v33];
  double v15 = (float)((float)v30 * 256.0);
  float v16 = (double)*v14 * 1000.0 / v15 + (float)((float)(v28 - v25[0]) / 1000000.0);
  float v17 = (double)v14[1] * 1000.0 / v15 + (float)((float)(v29 - v25[1]) / 1000000.0);
  if (v31)
  {
    float v16 = (float)v26 / 1000000.0;
    float v17 = (float)v27 / 1000000.0;
  }
  BOOL v18 = v36 > 0xF09 || v26 != 0x7FFFFFFF;
  BOOL v19 = v36 > 0xF09 || v27 != 0x7FFFFFFF;
  if (v18) {
    float v16 = (float)((float)((float)v26 / 1000000.0) + v16) * 0.5;
  }
  float v20 = (float)((float)((float)v27 / 1000000.0) + v17) * 0.5;
  if (!v19) {
    float v20 = v17;
  }
  v40.double x = v16;
  v40.double y = v20;
  CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v40);
  [v6 setObject:DictionaryRepresentation forKeyedSubscript:@"OpticalCenter"];

  if ((v37 & 0x10) != 0)
  {
    float v22 = v24;
    [v6 setObject:v24 forKeyedSubscript:@"ClippingInfo"];
  }
LABEL_22:

  return v6;
}

+ (BOOL)_getLightSourceMappingInfoFrom:(id)a3 imageValidWidth:(unint64_t)a4 imageValidHeight:(unint64_t)a5 lightSourceDictionary:(__CFDictionary *)a6 lightSourceValidWidth:(unint64_t)a7 lightSourceValidHeight:(unint64_t)a8 ispInfo:(id *)a9
{
  CFDictionaryRef v14 = (const __CFDictionary *)a3;
  unsigned int v42 = 0;
  CGSize size = CGRectNull.size;
  rect.origin = CGRectNull.origin;
  rect.CGSize size = size;
  v40.origin.double x = 0.0;
  v40.origin.double y = 0.0;
  v40.size.double width = (double)a4;
  v40.size.double height = (double)a5;
  v39.origin = rect.origin;
  v39.CGSize size = size;
  double width = (double)a7;
  double height = (double)a8;
  v38.origin.double x = 0.0;
  v38.origin.double y = 0.0;
  v38.size.double width = (double)a7;
  v38.size.double height = (double)a8;
  if (!v14
    || !a6
    || !a9
    || !CFDictionaryGetValue(a6, kFigCaptureStreamMetadata_LightSourceMaskInfo)
    || (FigCFDictionaryGetIntIfPresent(),
        (CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v14, kFigCaptureStreamMetadata_SensorRawValidBufferRect)) == 0))
  {
    fig_log_get_emitter();
    goto LABEL_22;
  }
  if (!CGRectMakeWithDictionaryRepresentation(Value, &rect))
  {
    fig_log_get_emitter();
    goto LABEL_22;
  }
  BOOL v19 = (const void *)kFigCaptureStreamMetadata_ValidBufferRect;
  CFDictionaryRef v20 = (const __CFDictionary *)CFDictionaryGetValue(v14, kFigCaptureStreamMetadata_ValidBufferRect);
  if (v20 && !CGRectMakeWithDictionaryRepresentation(v20, &v40)
    || (CFDictionaryRef v21 = (const __CFDictionary *)CFDictionaryGetValue(a6, kFigCaptureStreamMetadata_TotalSensorCropRect)) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_22;
  }
  if (!CGRectMakeWithDictionaryRepresentation(v21, &v39))
  {
    fig_log_get_emitter();
    goto LABEL_22;
  }
  CFDictionaryRef v22 = (const __CFDictionary *)CFDictionaryGetValue(a6, v19);
  if (v22)
  {
    if (CGRectMakeWithDictionaryRepresentation(v22, &v38))
    {
      double width = v38.size.width;
      double height = v38.size.height;
      goto LABEL_14;
    }
    fig_log_get_emitter();
LABEL_22:
    FigDebugAssert3();
    BOOL v36 = 0;
    goto LABEL_15;
  }
LABEL_14:
  *(void *)&a9->var1.var0 = 0;
  a9->var1.var4.double width = width;
  a9->var1.var4.double height = height;
  float v23 = rect.size.width / width;
  float v24 = rect.size.height / height;
  a9->var1.var5[0] = v23;
  a9->var1.var5[1] = v24;
  *(float32x2_t *)&a9->var1.var5[2] = vcvt_f32_f64(vsubq_f64((float64x2_t)rect.origin, (float64x2_t)v39.origin));
  a9->var1.var6 = v42;
  CGSize v25 = v39.size;
  a9->var2.var1.origin = v39.origin;
  a9->var2.var1.CGSize size = v25;
  a9->var2.var2.double width = width;
  a9->var2.var2.double height = height;
  CGSize v26 = rect.size;
  a9->var2.var7.origin = rect.origin;
  a9->var2.var7.CGSize size = v26;
  CGSize v27 = v40.size;
  a9->var2.var8.origin = v40.origin;
  a9->var2.var8.CGSize size = v27;
  double v28 = a9->var2.var7.size.width;
  double v29 = a9->var2.var7.size.height;
  float v30 = a9->var2.var1.size.width / (double)(int)width;
  float v31 = a9->var2.var1.size.height / (double)(int)height;
  *(float *)&v27.double width = a9->var2.var1.origin.x - a9->var2.var7.origin.x;
  float v32 = a9->var2.var1.origin.y - a9->var2.var7.origin.y;
  *(void *)&a9->var3.var0[3] = 0;
  *(void *)&a9->var3.var0[1] = 0;
  a9->var3.var0[7] = 0.0;
  *(void *)&a9->var3.var0[5] = 0;
  a9->var3.var0[0] = v30;
  a9->var3.var0[2] = *(float *)&v27.width;
  a9->var3.var0[4] = v31;
  a9->var3.var0[5] = v32;
  a9->var3.var0[8] = 1.0;
  float v33 = a9->var2.var8.size.width / (double)(int)v28;
  float v34 = a9->var2.var8.size.height / (double)(int)v29;
  *(float *)&v27.double width = a9->var2.var8.origin.x - CGRectZero.origin.x;
  CGFloat v35 = a9->var2.var8.origin.y - CGRectZero.origin.y;
  *(void *)&a9->var3.var3[3] = 0;
  *(void *)&a9->var3.var3[1] = 0;
  a9->var3.var3[7] = 0.0;
  *(void *)&a9->var3.var3[5] = 0;
  a9->var3.var3[0] = v33;
  a9->var3.var3[2] = *(float *)&v27.width;
  a9->var3.var3[4] = v34;
  *(float *)&v27.double width = v35;
  a9->var3.var3[5] = *(float *)&v27.width;
  a9->var3.var3[8] = 1.0;
  BOOL v36 = 1;
LABEL_15:

  return v36;
}

+ (BOOL)_getKeypointsMappingInfoFrom:(id)a3 validWidth:(unint64_t)a4 validHeight:(unint64_t)a5 KeyPointDictionary:(__CFDictionary *)a6 IspInfo:(id *)a7
{
  CFDictionaryRef v11 = (const __CFDictionary *)a3;
  CFDictionaryRef v12 = v11;
  v40.origin.CGFloat x = 0.0;
  v40.origin.double y = 0.0;
  v40.size.CGFloat width = (double)a4;
  v40.size.double height = (double)a5;
  CGSize v13 = CGRectNull.size;
  rect.origin = CGRectNull.origin;
  rect.CGSize size = v13;
  v38.origin = rect.origin;
  v38.CGSize size = v13;
  CGSize v14 = CGRectNull.size;
  v37.origin = CGRectNull.origin;
  v37.CGSize size = v14;
  if (!v11
    || !a6
    || !a7
    || (CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v11, kFigCaptureStreamMetadata_SensorRawValidBufferRect)) == 0)
  {
    fig_log_get_emitter();
LABEL_26:
    FigDebugAssert3();
    BOOL v34 = 0;
    goto LABEL_15;
  }
  if (!CGRectMakeWithDictionaryRepresentation(Value, &rect)
    || (CFDictionaryRef v16 = (const __CFDictionary *)CFDictionaryGetValue(v12, kFigCaptureStreamMetadata_ValidBufferRect)) != 0
    && !CGRectMakeWithDictionaryRepresentation(v16, &v40)
    || (CFDictionaryRef v17 = (const __CFDictionary *)CFDictionaryGetValue(a6, kFigCaptureStreamImageRegistrationInfoKey_KeypointDescriptorSensorCropRect)) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_26;
  }
  if (!CGRectMakeWithDictionaryRepresentation(v17, &v38)
    || (CFDictionaryRef v18 = (const __CFDictionary *)CFDictionaryGetValue(a6, kFigCaptureStreamImageRegistrationInfoKey_KeypointDescriptorImageSize)) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_26;
  }
  if (!CGSizeMakeWithDictionaryRepresentation(v18, &size)
    || (CFDictionaryRef v19 = (const __CFDictionary *)CFDictionaryGetValue(a6, kFigCaptureStreamImageRegistrationInfoKey_HomographySensorCropRect)) == 0|| !CGRectMakeWithDictionaryRepresentation(v19, &v37))
  {
    fig_log_get_emitter();
    goto LABEL_26;
  }
  CGSize v20 = v38.size;
  a7->var2.var3.origin = v38.origin;
  a7->var2.var3.CGSize size = v20;
  CGFloat width = size.width;
  v20.CGFloat width = size.height;
  a7->var2.var4.CGFloat width = size.width;
  a7->var2.var4.double height = v20.width;
  CGSize v22 = v37.size;
  a7->var2.var5.origin = v37.origin;
  a7->var2.var5.CGSize size = v22;
  double v23 = v37.size.width;
  v22.CGFloat width = v37.size.height;
  a7->var2.var6.CGFloat width = v37.size.width;
  a7->var2.var6.double height = v22.width;
  CGSize v24 = rect.size;
  a7->var2.var7.origin = rect.origin;
  a7->var2.var7.CGSize size = v24;
  CGSize v25 = v40.size;
  a7->var2.var8.origin = v40.origin;
  a7->var2.var8.CGSize size = v25;
  int v26 = (int)v23;
  CGFloat x = a7->var2.var7.origin.x;
  double y = a7->var2.var7.origin.y;
  CGFloat v29 = a7->var2.var5.size.width / (double)v26;
  double v30 = a7->var2.var7.size.width;
  double height = a7->var2.var7.size.height;
  int v32 = (int)v22.width;
  *(float *)&v22.CGFloat width = v29;
  *(float *)&CGFloat v29 = a7->var2.var5.size.height / (double)v32;
  *(float *)&v25.CGFloat width = a7->var2.var5.origin.x - x;
  float v33 = a7->var2.var5.origin.y - y;
  *(void *)&a7->var3.var1[1] = 0;
  *(void *)&a7->var3.var1[3] = 0;
  *(void *)&a7->var3.var1[5] = 0;
  *(void *)&a7->var3.var1[7] = 0x3F80000000000000;
  a7->var3.var1[0] = *(float *)&v22.width;
  a7->var3.var1[2] = *(float *)&v25.width;
  a7->var3.var1[4] = *(float *)&v29;
  a7->var3.var1[5] = v33;
  *(float *)&CGFloat width = a7->var2.var3.size.width / (double)(int)width;
  *(float *)&v20.CGFloat width = a7->var2.var3.size.height / (double)(int)v20.width;
  *(float *)&CGFloat x = a7->var2.var3.origin.x - x;
  *(float *)&v22.CGFloat width = a7->var2.var3.origin.y - y;
  *(void *)&a7->var3.var2[3] = 0;
  *(void *)&a7->var3.var2[1] = 0;
  a7->var3.var2[7] = 0.0;
  *(void *)&a7->var3.var2[5] = 0;
  a7->var3.var2[0] = *(float *)&width;
  a7->var3.var2[2] = *(float *)&x;
  a7->var3.var2[4] = *(float *)&v20.width;
  a7->var3.var2[5] = *(float *)&v22.width;
  a7->var3.var2[8] = 1.0;
  *(float *)&CGFloat x = a7->var2.var8.size.width / (double)(int)v30;
  *(float *)&v22.CGFloat width = a7->var2.var8.size.height / (double)(int)height;
  *(float *)&CGFloat width = a7->var2.var8.origin.x - CGRectZero.origin.x;
  v20.CGFloat width = a7->var2.var8.origin.y - CGRectZero.origin.y;
  *(void *)&a7->var3.var3[3] = 0;
  *(void *)&a7->var3.var3[1] = 0;
  a7->var3.var3[7] = 0.0;
  *(void *)&a7->var3.var3[5] = 0;
  a7->var3.var3[0] = *(float *)&x;
  a7->var3.var3[2] = *(float *)&width;
  a7->var3.var3[4] = *(float *)&v22.width;
  *(float *)&CGFloat width = v20.width;
  a7->var3.var3[5] = *(float *)&width;
  a7->var3.var3[8] = 1.0;
  BOOL v34 = 1;
LABEL_15:

  return v34;
}

+ (BOOL)_getRegistrationInfo:(id)a3 validWidth:(unint64_t)a4 validHeight:(unint64_t)a5 keypointDictionary:(__CFDictionary *)a6 ispInfo:(id *)a7
{
  CFDictionaryRef v11 = (const __CFDictionary *)a3;
  CFDictionaryRef v12 = v11;
  uint64_t v22 = 0;
  int v21 = 0;
  rect.origin.CGFloat x = 0.0;
  rect.origin.double y = 0.0;
  rect.size.CGFloat width = (double)a4;
  rect.size.double height = (double)a5;
  if (!v11) {
    goto LABEL_17;
  }
  if (!a6) {
    goto LABEL_17;
  }
  if (!a7) {
    goto LABEL_17;
  }
  CGSize v13 = [(__CFDictionary *)v11 objectForKeyedSubscript:kFigCaptureStreamMetadata_SensorID];
  unsigned int v14 = [v13 intValue];

  if (!v14 || !CFDictionaryGetValue(a6, kFigCaptureStreamImageRegistrationInfoKey_RegistrationHomography)) {
    goto LABEL_17;
  }
  uint64_t v15 = 0;
  CFDictionaryRef v16 = a7;
  do
  {
    if (!FigCFArrayGetFloatAtIndex())
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      BOOL v18 = 0;
      goto LABEL_15;
    }
    ++v15;
    CFDictionaryRef v16 = ($FB7D034592DF8CC7F6DB9EAD73755FB6 *)((char *)v16 + 4);
  }
  while (v15 != 9);
  if (FigCFDictionaryGetIntIfPresent()
    && (a7->var0.uint64_t var1 = HIDWORD(v22), FigCFDictionaryGetFloatIfPresent())
    && FigCFDictionaryGetIntIfPresent())
  {
    LODWORD(a7->var0.var2) = v22;
    a7->var0.unsigned int var3 = v14;
    a7->var0.var6 = v21;
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v12, kFigCaptureStreamMetadata_ValidBufferRect);
    if (!Value || CGRectMakeWithDictionaryRepresentation(Value, &rect))
    {
      BOOL v18 = 1;
      goto LABEL_15;
    }
    fig_log_get_emitter();
  }
  else
  {
LABEL_17:
    fig_log_get_emitter();
  }
  FigDebugAssert3();
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

+ (BOOL)_getExposureInfo:(id)a3 info:(float *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5
    && a4
    && ([v5 objectForKeyedSubscript:kFigCaptureStreamMetadata_AGC],
        float v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 intValue],
        v7,
        v8))
  {
    double v9 = [v6 objectForKeyedSubscript:kFigCaptureStreamMetadata_ispDGain];
    int v10 = [v9 intValue];

    CFDictionaryRef v11 = [v6 objectForKeyedSubscript:kFigCaptureStreamMetadata_sensorDGain];
    LODWORD(v9) = [v11 intValue];

    CFDictionaryRef v12 = [v6 objectForKeyedSubscript:kFigCaptureStreamMetadata_ispDGainRangeExpansionFactor];
    [v12 doubleValue];
    double v14 = v13;

    uint64_t v15 = [v6 objectForKeyedSubscript:kFigCaptureStreamMetadata_ExposureTime];
    [v15 doubleValue];
    double v17 = v16;

    float v18 = (float)v10 / (v14 * 256.0) * (float)((float)((float)v8 * 0.0039062) * (float)((float)(int)v9 * 0.0039062));
    float v19 = v17 * v18;
    *a4 = v19;
    BOOL v20 = 1;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    BOOL v20 = 0;
  }

  return v20;
}

+ (BOOL)isOpticalCenterKeyV2Present:(id)a3
{
  unsigned int v3 = [a3 objectForKeyedSubscript:kFigCaptureStreamMetadata_DistortionOpticalCenterV2];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (id)readMetaDataFromDictionary:(id)a3 andValidWidth:(unint64_t)a4 andValidHeight:(unint64_t)a5 andLightSource:(opaqueCMSampleBuffer *)a6 andKeyPoints:(opaqueCMSampleBuffer *)a7
{
  id v10 = a3;
  v33[0] = 0;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  bzero(v30, 0x240uLL);
  id v29 = +[NSMutableDictionary dictionary];
  if (v10)
  {
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    if (+[RawMetaDataReader _getExposureInfo:v10 info:v33])
    {
      LODWORD(v11) = v33[0];
      CFDictionaryRef v12 = +[NSNumber numberWithFloat:v11];
      [v29 setObject:v12 forKeyedSubscript:@"ExposureInfo"];
    }
    double v13 = [v10 objectForKeyedSubscript:kFigCaptureStreamMetadata_DistortionOpticalCenterV2];
    if (v13) {
      [v29 setObject:v13 forKeyedSubscript:@"OpticalCenter"];
    }
    uint64_t v14 = kFigCaptureStreamMetadata_LuxLevel;
    uint64_t v15 = [v10 objectForKeyedSubscript:kFigCaptureStreamMetadata_LuxLevel];
    if (v15)
    {
      double v16 = [v10 objectForKeyedSubscript:v14];
      [v29 setObject:v16 forKeyedSubscript:v14];
    }
    bzero(v30, 0x240uLL);
    if (a7)
    {
      CFDictionaryRef v17 = (const __CFDictionary *)CMGetAttachment(a7, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
      if (v17)
      {
        CFDictionaryRef Value = CFDictionaryGetValue(v17, kFigCaptureStreamMetadata_ImageRegistrationInfo);
        if (Value)
        {
          unsigned int v19 = +[RawMetaDataReader _getRegistrationInfo:v10 validWidth:a4 validHeight:a5 keypointDictionary:Value ispInfo:v30];
          if ((v19 & +[RawMetaDataReader _getKeypointsMappingInfoFrom:v10 validWidth:a4 validHeight:a5 KeyPointDictionary:Value IspInfo:v30]) == 1)LODWORD(v32) = 1; {
        }
          }
      }
    }
    if (!a6) {
      goto LABEL_25;
    }
    ImageBuffer = CMSampleBufferGetImageBuffer(a6);
    int v21 = ImageBuffer;
    if (!ImageBuffer) {
      goto LABEL_25;
    }
    size_t Width = CVPixelBufferGetWidth(ImageBuffer);
    size_t Height = CVPixelBufferGetHeight(v21);
    CFTypeRef v24 = CMGetAttachment(a6, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
    if (v24
      && +[RawMetaDataReader _getLightSourceMappingInfoFrom:v10 imageValidWidth:a4 imageValidHeight:a5 lightSourceDictionary:v24 lightSourceValidWidth:Width lightSourceValidHeight:Height ispInfo:v30])
    {
      HIDWORD(v32) = 1;
    }
    HIDWORD(v31) = 1;
    CGSize v25 = +[NSData dataWithBytes:&v31 length:16];
    if (v25)
    {
      [v29 setObject:v25 forKeyedSubscript:@"MetaConfig"];
      int v26 = +[NSData dataWithBytes:v30 length:576];
      if (v26)
      {
        [v29 setObject:v26 forKeyedSubscript:@"IspScalerInfo"];
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        int v26 = 0;
      }
    }
    else
    {
LABEL_25:
      fig_log_get_emitter();
      FigDebugAssert3();
      CGSize v25 = 0;
      int v26 = 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    uint64_t v15 = 0;
    double v13 = 0;
    FigDebugAssert3();
    CGSize v25 = 0;
    int v26 = 0;
  }

  return v29;
}

- (void).cxx_destruct
{
}

@end