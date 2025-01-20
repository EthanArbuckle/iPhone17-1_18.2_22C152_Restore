@interface H13FastRawMBNRConfig
- (H13FastRawMBNRConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4;
- (int)getBayerMBNRSettingsForInputFrame:(id)a3 rawMBNRConfig:(id *)a4 totalGain:(float)a5 band:(int)a6;
- (int)getChromaMBNRSettingsForInputFrame:(id)a3 rawMBNRConfig:(id *)a4 totalGain:(float)a5 band:(int)a6;
- (int)getEnabledForInputFrame:(id)a3 isEnabled:(BOOL *)a4;
- (int)getLSCGainsForInputFrame:(id)a3 lscGridSize:(LSCGridSize *)a4 lscGainsTex:(id)a5;
- (int)getLSCGridDimensions:(LSCGridSize *)a3 portType:(id)a4;
- (int)getMBNRSettingsForInputFrame:(id)a3 rawMBNRConfig:(id *)a4 totalGain:(float)a5;
- (int)getNoiseModelForInputFrame:(id)a3 outputFrame:(id)a4 noiseConfig:(id *)a5;
- (int)getRawMBNRConfigForInputFrame:(id)a3 bounds:(id)a4 lscGainMapParameters:(id)a5 rawMBNRConfig:(id *)a6;
- (int)updateNoiseModelForInputFrame:(id)a3 noiseConfig:(id *)a4 totalGain:(float)a5 band:(int)a6;
- (int)updateRawMBNRConfigForInputFrame:(id)a3 bounds:(id)a4 band:(unsigned __int16)a5 rawMBNRConfig:(id *)a6;
@end

@implementation H13FastRawMBNRConfig

- (int)getRawMBNRConfigForInputFrame:(id)a3 bounds:(id)a4 lscGainMapParameters:(id)a5 rawMBNRConfig:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v41 = 0;
  v13 = [(SoftISPConfig *)self staticParameters];
  BOOL v14 = -[SoftISPStaticParameters lscFromCameraInfoByPortType]((BOOL)v13);

  v15 = -[SoftISPInputFrame metadata]((uint64_t)v10);
  if (v15)
  {
    float v16 = (float)(int)-[SoftISPInputFrame pipelineBlackLevel]((uint64_t)v10);
    unsigned int v17 = -[SoftISPInputFrame firstPixel]((uint64_t)v10);
    a6->var2 = v17;
    a6->var0 = 65535.0 - v16;
    if (v17)
    {
      if (v17 == 2)
      {
        unint64_t v21 = 0;
        unint64_t v18 = 1;
        unint64_t v19 = 0x100000000;
        unint64_t v20 = 0x100000001;
      }
      else if (v17 == 1)
      {
        unint64_t v18 = 0x100000000;
        unint64_t v19 = 1;
        unint64_t v20 = 0;
        unint64_t v21 = 0x100000001;
      }
      else
      {
        unint64_t v21 = 1;
        unint64_t v18 = 0;
        unint64_t v20 = 0x100000000;
        unint64_t v19 = 0x100000001;
      }
    }
    else
    {
      unint64_t v21 = 0x100000000;
      unint64_t v19 = 0;
      unint64_t v20 = 1;
      unint64_t v18 = 0x100000001;
    }
    a6->var4 = v20;
    a6->var5 = v19;
    a6->var6 = v18;
    a6->var7 = v21;
    v40 = [v15 objectForKeyedSubscript:*MEMORY[0x263F2F6E8]];
    if (v40)
    {
      uint64_t v22 = [v15 objectForKeyedSubscript:*MEMORY[0x263F2F2C0]];
      if (v22)
      {
        v23 = (void *)v22;
        v39 = v15;
        float v24 = (float)(int)[v40 intValue] * 0.0039062;
        a6->var1 = v24 * (float)((float)(int)[v23 intValue] * 0.0039062);
        a6->var3 = -[SoftISPInputFrame cfaLayout]((uint64_t)v10) == 3;
        -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v11);
        *(void *)&a6->var13 = v25 >> 1;
        -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v11);
        *(void *)&a6->var15 = v26 >> 33;
        v27 = [(SoftISPConfig *)self staticParameters];
        v28 = -[SoftISPInputFrame metadata]((uint64_t)v10);
        unint64_t v29 = [v27 dimensionsForSensorInMetadata:v28];
        uint64_t v30 = (uint64_t)v11;
        id v31 = v12;
        unsigned int v32 = v29;
        unint64_t v33 = HIDWORD(v29);

        unsigned int v34 = v32 / -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v10);
        id v12 = v31;
        id v11 = (id)v30;
        *(void *)&a6->var8 = v34 >> 1;
        *(void *)&a6->var10 = (v33 / -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v10)) >> 1;
        *(uint32x2_t *)&a6->var17 = vshr_n_u32((uint32x2_t)-[SoftISPBounds processingRegionWithinSensorInReadoutPixels](v30), 1uLL);
        int v35 = objc_msgSend(v12, "cmi_BOOLValueForKey:defaultValue:found:", *MEMORY[0x263F2F808], 0, &v41);
        if (!v41)
        {
          FigDebugAssert3();
          int v37 = FigSignalErrorAt();

          v15 = v39;
          goto LABEL_17;
        }
        LODWORD(v36) = 1.0;
        v15 = v39;
        if (v35)
        {
          objc_msgSend(v12, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F7E8], &v41, v36);
          if (!v41)
          {
            FigDebugAssert3();
            int v37 = FigSignalErrorAt();

            goto LABEL_17;
          }
        }
        a6->var19 = *(float *)&v36;
        BYTE1(a6->var21) = v14;
      }
      else
      {
        FigDebugAssert3();
      }
    }
    else
    {
      FigDebugAssert3();
    }
    int v37 = 0;
  }
  else
  {
    int v37 = FigSignalErrorAt();
  }
LABEL_17:

  return v37;
}

- (int)updateRawMBNRConfigForInputFrame:(id)a3 bounds:(id)a4 band:(unsigned __int16)a5 rawMBNRConfig:(id *)a6
{
  int v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = v11;
  if (!v10) {
    goto LABEL_5;
  }
  uint32x2_t v13 = (uint32x2_t)vneg_s32(vdup_n_s32(v7 + 1));
  *(uint32x2_t *)&a6->var17 = vshl_u32((uint32x2_t)-[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v11), v13);
  BOOL v14 = [(SoftISPConfig *)self staticParameters];
  v15 = -[SoftISPInputFrame metadata]((uint64_t)v10);
  unint64_t v16 = [v14 dimensionsForSensorInMetadata:v15];
  unsigned int v17 = v16;
  unint64_t v18 = HIDWORD(v16);

  *(void *)&a6->var8 = (v17 / -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v10)) >> 1 >> v7;
  *(void *)&a6->var10 = (v18 / -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v10)) >> 1 >> v7;
  uint64_t v19 = -[SoftISPInputFrame metadata]((uint64_t)v10);
  if (v19)
  {
    unint64_t v20 = (void *)v19;
    *(uint32x2_t *)&a6->var17 = vshl_u32((uint32x2_t)-[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v12), v13);

    int v21 = 0;
  }
  else
  {
LABEL_5:
    int v21 = FigSignalErrorAt();
  }

  return v21;
}

- (int)getMBNRSettingsForInputFrame:(id)a3 rawMBNRConfig:(id *)a4 totalGain:(float)a5
{
  id v8 = a3;
  v9 = v8;
  if (!v8)
  {
    int v22 = FigSignalErrorAt();
    id v10 = 0;
LABEL_10:
    id v12 = 0;
    unsigned int v17 = 0;
    goto LABEL_7;
  }
  id v10 = -[SoftISPInputFrame metadata]((uint64_t)v8);
  if (!v10)
  {
    int v22 = FigSignalErrorAt();
    goto LABEL_10;
  }
  id v11 = [(SoftISPConfig *)self staticParameters];
  id v12 = [v11 tuningParametersForInputFrameMetadata:v10 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v9)];

  uint32x2_t v13 = [v12 objectForKeyedSubscript:@"RawMBNR"];
  BOOL v14 = [v13 objectForKeyedSubscript:@"DefaultParameters"];
  v15 = [v14 objectForKeyedSubscript:@"TuningParameters"];

  char v24 = 0;
  id v16 = v15;
  unsigned int v17 = v16;
  if (v16)
  {
    unint64_t v18 = [v16 objectForKeyedSubscript:@"SpecificLensShadingFactor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(float *)&double v19 = a5;
      objc_msgSend(v18, "cmi_interpolateValueForGain:", v19);
      a4->var20 = v20;
      char v21 = objc_msgSend(v17, "cmi_BOOLValueForKey:defaultValue:found:", @"EqualBayerWeights", 0, &v24);
      if (v24)
      {
        LOBYTE(a4->var21) = v21;

        int v22 = 0;
        goto LABEL_7;
      }
    }
    FigDebugAssert3();
    int v22 = FigSignalErrorAt();
  }
  else
  {
    FigDebugAssert3();
    int v22 = FigSignalErrorAt();
  }

  if (v22) {
    FigDebugAssert3();
  }
LABEL_7:

  return v22;
}

- (int)getChromaMBNRSettingsForInputFrame:(id)a3 rawMBNRConfig:(id *)a4 totalGain:(float)a5 band:(int)a6
{
  id v10 = a3;
  id v11 = v10;
  if (!v10)
  {
    int v39 = FigSignalErrorAt();
    id v12 = 0;
LABEL_14:
    BOOL v14 = 0;
    unsigned int v17 = 0;
    goto LABEL_11;
  }
  id v12 = -[SoftISPInputFrame metadata]((uint64_t)v10);
  if (!v12)
  {
    int v39 = FigSignalErrorAt();
    goto LABEL_14;
  }
  uint32x2_t v13 = [(SoftISPConfig *)self staticParameters];
  BOOL v14 = [v13 tuningParametersForInputFrameMetadata:v12 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v11)];

  v15 = [v14 objectForKeyedSubscript:@"RawMBNR"];
  id v16 = [v15 objectForKeyedSubscript:@"DefaultParameters"];
  unsigned int v17 = [v16 objectForKeyedSubscript:@"TuningParameters"];

  unint64_t v18 = [v17 objectForKeyedSubscript:@"Bands"];
  double v19 = [v18 objectAtIndexedSubscript:a6];

  if (!v19)
  {
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
    goto LABEL_22;
  }
  float v20 = [v19 objectForKeyedSubscript:@"ChromaDenoiseLumaThresholdGain"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_20;
  }
  *(float *)&double v21 = a5;
  objc_msgSend(v20, "cmi_interpolateValueForGain:", v21);
  float32x4_t v42 = v22;
  v23 = [v19 objectForKeyedSubscript:@"ChromaDenoiseChromaThresholdGain"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(float *)&double v24 = a5;
    objc_msgSend(v23, "cmi_interpolateValueForGain:", v24);
    __int32 v41 = v25;
    float v20 = [v19 objectForKeyedSubscript:@"ChromaDenoiseMixingCoeff"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_20;
    }
    *(float *)&double v26 = a5;
    objc_msgSend(v20, "cmi_interpolateValueForGain:", v26);
    HIDWORD(a4[1].var4) = v27;
    v23 = [v19 objectForKeyedSubscript:@"ChromaDenoiseRolloffWindow"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(float *)&double v28 = a5;
      objc_msgSend(v23, "cmi_interpolateValueForGain:", v28);
      *(float *)v30.i32 = v29 * 0.5;
      float32x4_t v31 = v42;
      v31.i32[1] = v41;
      float32x4_t v32 = (float32x4_t)vdupq_lane_s32(v30, 0);
      *(float32x4_t *)&a4[1].var1 = vmaxnmq_f32((float32x4_t)vzip1q_s32((int32x4_t)vsubq_f32(v31, v32), (int32x4_t)vaddq_f32(v31, v32)), (float32x4_t)vdupq_n_s32(0x38800000u));
      float v20 = [v19 objectForKeyedSubscript:@"LumaDenoiseThresholdGain"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *(float *)&double v33 = a5;
        objc_msgSend(v20, "cmi_interpolateValueForGain:", v33);
        float v35 = v34;
        v23 = [v19 objectForKeyedSubscript:@"LumaDenoiseRolloffWindow"];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          *(float *)&double v36 = a5;
          objc_msgSend(v23, "cmi_interpolateValueForGain:", v36);
          float v38 = v37 * 0.5;
          *(&a4->var21 + 1) = fmaxf(v35 - v38, 0.000061035);
          a4[1].var0 = fmaxf(v35 + v38, 0.000061035);

          int v39 = 0;
          goto LABEL_11;
        }
        goto LABEL_21;
      }
LABEL_20:
      FigDebugAssert3();
      int v39 = FigSignalErrorAt();

      goto LABEL_22;
    }
  }
LABEL_21:
  FigDebugAssert3();
  int v39 = FigSignalErrorAt();

LABEL_22:
  if (v39) {
    FigDebugAssert3();
  }
LABEL_11:

  return v39;
}

- (int)getBayerMBNRSettingsForInputFrame:(id)a3 rawMBNRConfig:(id *)a4 totalGain:(float)a5 band:(int)a6
{
  id v10 = a3;
  id v11 = v10;
  if (!v10)
  {
    int v31 = FigSignalErrorAt();
    id v12 = 0;
LABEL_14:
    BOOL v14 = 0;
    unsigned int v17 = 0;
    goto LABEL_11;
  }
  id v12 = -[SoftISPInputFrame metadata]((uint64_t)v10);
  if (!v12)
  {
    int v31 = FigSignalErrorAt();
    goto LABEL_14;
  }
  uint32x2_t v13 = [(SoftISPConfig *)self staticParameters];
  BOOL v14 = [v13 tuningParametersForInputFrameMetadata:v12 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v11)];

  v15 = [v14 objectForKeyedSubscript:@"RawMBNR"];
  id v16 = [v15 objectForKeyedSubscript:@"DefaultParameters"];
  unsigned int v17 = [v16 objectForKeyedSubscript:@"TuningParameters"];

  unint64_t v18 = [v17 objectForKeyedSubscript:@"Bands"];
  double v19 = [v18 objectAtIndexedSubscript:a6];

  if (!v19)
  {
    FigDebugAssert3();
    goto LABEL_19;
  }
  float v20 = [v19 objectForKeyedSubscript:@"LumaDenoiseThresholdGainHighPass"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    FigDebugAssert3();

    goto LABEL_19;
  }
  *(float *)&double v21 = a5;
  objc_msgSend(v20, "cmi_interpolateValueForGain:", v21);
  float v23 = v22;
  double v24 = [v19 objectForKeyedSubscript:@"LumaDenoiseRolloffWindow"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    FigDebugAssert3();

    goto LABEL_19;
  }
  *(float *)&double v25 = a5;
  objc_msgSend(v24, "cmi_interpolateValueForGain:", v25);
  float v27 = v26 * 0.5;
  *(float *)&a4[1].var5 = fmaxf(v23 - v27, 0.000061035);
  *((float *)&a4[1].var5 + 1) = fmaxf(v23 + v27, 0.000061035);
  LODWORD(a4[1].var6) = 1065353216;
  if (!a6)
  {
    double v28 = [v19 objectForKeyedSubscript:@"HighPassMixingCoeff"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(float *)&double v29 = a5;
      objc_msgSend(v28, "cmi_interpolateValueForGain:", v29);
      LODWORD(a4[1].var6) = v30;
      double v24 = v28;
      goto LABEL_9;
    }
    FigDebugAssert3();

LABEL_19:
    int v33 = FigSignalErrorAt();

    if (v33)
    {
      FigDebugAssert3();
      int v31 = v33;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_9:

LABEL_10:
  int v31 = 0;
LABEL_11:

  return v31;
}

- (int)getNoiseModelForInputFrame:(id)a3 outputFrame:(id)a4 noiseConfig:(id *)a5
{
  id v7 = a3;
  id v8 = [a4 metadata];
  char v41 = 0;
  v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F2F408]];
  [v9 floatValue];
  float v11 = v10 * 0.000015259;

  if (v11 == 0.0) {
    goto LABEL_13;
  }
  a5->var2 = v11;
  LODWORD(v12) = 1.0;
  objc_msgSend(v8, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F538], &v41, v12);
  if (!v41) {
    goto LABEL_13;
  }
  a5->var7 = v13;
  BOOL v14 = [v8 objectForKeyedSubscript:*MEMORY[0x263F2F2E0]];
  [v14 floatValue];
  float v16 = v15 * 0.00024414;

  if (v16 == 0.0) {
    goto LABEL_13;
  }
  a5->var4 = v16;
  unsigned int v17 = [v8 objectForKeyedSubscript:*MEMORY[0x263F2F2D8]];
  [v17 floatValue];
  float v19 = v18 * 0.00024414;

  if (v19 == 0.0) {
    goto LABEL_13;
  }
  a5->var5 = v19;
  float v20 = [v8 objectForKeyedSubscript:*MEMORY[0x263F2F2D0]];
  [v20 floatValue];
  float v22 = v21 * 0.00024414;

  if (v22 == 0.0) {
    goto LABEL_13;
  }
  a5->var6 = v22;
  float v23 = [v8 objectForKeyedSubscript:*MEMORY[0x263F2F4F0]];
  int v24 = [v23 BOOLValue];

  a5->var9 = 1.0;
  if (v24)
  {
    double v25 = [v8 objectForKeyedSubscript:*MEMORY[0x263F2F4F8]];
    [v25 floatValue];
    a5->var9 = v26 * 0.00024414;
  }
  a5->var0 = (float)((int)-[SoftISPInputFrame averageSensorBlackLevel]((uint64_t)v7) >> 6);
  float v27 = [v8 objectForKeyedSubscript:*MEMORY[0x263F2F2C0]];
  [v27 floatValue];
  float v29 = v28 * 0.0039062;

  if (v29 == 0.0) {
    goto LABEL_13;
  }
  a5->var1 = v29;
  int v30 = [v8 objectForKeyedSubscript:*MEMORY[0x263F2F608]];
  [v30 floatValue];
  float v32 = v31 * 0.000015259;

  if (v32 == 0.0
    || ([v8 objectForKeyedSubscript:*MEMORY[0x263F2F610]],
        int v33 = objc_claimAutoreleasedReturnValue(),
        [v33 floatValue],
        float v35 = v34 * 0.000015259,
        v33,
        v35 == 0.0))
  {
LABEL_13:
    FigDebugAssert3();
    int v37 = FigSignalErrorAt();
  }
  else
  {
    float v36 = (float)(int)-[SoftISPInputFrame pipelineHeadRoom]((uint64_t)v7);
    int v37 = 0;
    a5->var8 = v36 / (float)(int)-[SoftISPInputFrame sensorHeadRoom]((uint64_t)v7);
    float v38 = sqrtf((float)((float)(v32 * v32) - (float)(v35 * v35)) / 0.98438);
    float v39 = sqrtf((float)(v32 * v32) - (float)(v38 * v38));
    a5->var3 = v29 * sqrtf((float)((float)(v38 / v29) * (float)(v38 / v29)) + (float)(v39 * v39));
  }

  return v37;
}

- (int)updateNoiseModelForInputFrame:(id)a3 noiseConfig:(id *)a4 totalGain:(float)a5 band:(int)a6
{
  id v10 = a3;
  float v11 = v10;
  if (!v10)
  {
    int v30 = FigSignalErrorAt();
    double v12 = 0;
LABEL_16:
    BOOL v14 = 0;
    unsigned int v17 = 0;
    goto LABEL_13;
  }
  double v12 = -[SoftISPInputFrame metadata]((uint64_t)v10);
  if (!v12)
  {
    int v30 = FigSignalErrorAt();
    goto LABEL_16;
  }
  float v13 = [(SoftISPConfig *)self staticParameters];
  BOOL v14 = [v13 tuningParametersForInputFrameMetadata:v12 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v11)];

  float v15 = [v14 objectForKeyedSubscript:@"RawMBNR"];
  float v16 = [v15 objectForKeyedSubscript:@"DefaultParameters"];
  unsigned int v17 = [v16 objectForKeyedSubscript:@"TuningParameters"];

  float v18 = [v17 objectForKeyedSubscript:@"Bands"];
  float v19 = [v18 objectAtIndexedSubscript:a6];

  if (v19)
  {
    float v20 = [v19 objectForKeyedSubscript:@"BoostFactor"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    float v22 = 1.0;
    LODWORD(v23) = 1.0;
    if (isKindOfClass)
    {
      *(float *)&double v23 = a5;
      objc_msgSend(v20, "cmi_interpolateValueForGain:", v23);
    }
    a4->var12 = *(float *)&v23;
    if (!a6)
    {
      int v24 = [v19 objectForKeyedSubscript:@"HighPassBoostFactor"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *(float *)&double v25 = a5;
        objc_msgSend(v24, "cmi_interpolateValueForGain:", v25);
        float v22 = v26;
      }
      float v20 = v24;
    }
    a4->var13 = v22;
    float v27 = [v19 objectForKeyedSubscript:@"BoostThreshold"];

    objc_opt_class();
    char v28 = objc_opt_isKindOfClass();
    double v29 = 0.0;
    if (v28)
    {
      *(float *)&double v29 = a5;
      objc_msgSend(v27, "cmi_interpolateValueForGain:", v29);
    }
    a4->var10 = *(float *)&v29;
    a4->var11 = 1.0 / *(float *)&v29;

    int v30 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v30 = FigSignalErrorAt();

    if (v30) {
      FigDebugAssert3();
    }
  }
LABEL_13:

  return v30;
}

- (int)getLSCGridDimensions:(LSCGridSize *)a3 portType:(id)a4
{
  id v6 = a4;
  id v7 = [(SoftISPConfig *)self staticParameters];
  id v8 = -[RawNightModeInputFrame sampleBuffer]((uint64_t)v7);
  v9 = [v8 objectForKeyedSubscript:v6];

  if (v9
    && ([v9 objectForKeyedSubscript:*MEMORY[0x263F2EEC8]],
        (id v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v11 = v10;
    uint64_t v12 = [v11 bytes];
    if (v12)
    {
      int v13 = *(_DWORD *)(v12 + 24);
      a3->var0 = *(_DWORD *)(v12 + 20);
      a3->var1 = v13;

      int v14 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v14 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v14 = FigSignalErrorAt();
  }

  return v14;
}

- (int)getLSCGainsForInputFrame:(id)a3 lscGridSize:(LSCGridSize *)a4 lscGainsTex:(id)a5
{
  id v8 = a5;
  v9 = -[SoftISPInputFrame metadata]((uint64_t)a3);
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
    uint64_t v12 = (void *)v11;
    int v13 = @"Invalid PortType";
    if (v11) {
      int v13 = (__CFString *)v11;
    }
    int v14 = v13;

    float v15 = [(SoftISPConfig *)self staticParameters];
    float v16 = -[RawNightModeInputFrame sampleBuffer]((uint64_t)v15);
    id v51 = v8;
    uint64_t var0 = a4->var0;
    uint64_t var1 = a4->var1;
    float v19 = [v16 objectForKeyedSubscript:v14];
    float v20 = v19;
    if (v19
      && ([v19 objectForKeyedSubscript:*MEMORY[0x263F2EEC8]],
          (float v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v44 = var0;
      v45 = v20;
      v46 = v16;
      v47 = v15;
      v48 = v14;
      v49 = v10;
      id v50 = v8;
      id v22 = v21;
      double v23 = (unsigned int *)[v22 bytes];
      uint64_t v24 = v23[5];
      uint64_t v25 = v23[7];
      uint64_t v26 = v23[8];
      uint64_t v27 = v23[9];
      uint64_t v28 = v23[10];
      uint64_t v29 = v23[6] * v24;
      int v30 = malloc_type_malloc(8 * v29, 0xD6941609uLL);
      if (v30)
      {
        float v31 = v30;
        if (v29)
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            _S0 = v23[v25 + 11 + i];
            __asm { FCVT            H0, S0 }
            *((_WORD *)v30 + (i * 4)) = _S0;
            _S0 = v23[v26 + 11 + i];
            __asm { FCVT            H0, S0 }
            *((_WORD *)v30 + (i * 4 + 1)) = _S0;
            _S0 = v23[v27 + 11 + i];
            __asm { FCVT            H0, S0 }
            *((_WORD *)v30 + (i * 4 + 2)) = _S0;
            _S0 = v23[v28 + 11 + i];
            __asm { FCVT            H0, S0 }
            *((_WORD *)v30 + (i * 4 + 3)) = _S0;
          }
        }
        memset(v52, 0, 24);
        v52[3] = v44;
        v52[4] = var1;
        v52[5] = 1;
        char v41 = v51;
        [v51 replaceRegion:v52 mipmapLevel:0 withBytes:v30 bytesPerRow:8 * v24];
        free(v31);

        int v42 = 0;
        id v10 = v49;
        id v8 = v50;
        float v15 = v47;
        int v14 = v48;
        float v16 = v46;
      }
      else
      {
        FigDebugAssert3();

        int v42 = -12786;
        id v10 = v49;
        id v8 = v50;
        float v15 = v47;
        int v14 = v48;
        float v16 = v46;
        char v41 = v51;
      }
      float v20 = v45;
    }
    else
    {
      FigDebugAssert3();
      int v42 = FigSignalErrorAt();
      char v41 = v51;
    }

    if (v42) {
      FigDebugAssert3();
    }
  }
  else
  {
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();
    int v14 = 0;
  }

  return v42;
}

- (int)getEnabledForInputFrame:(id)a3 isEnabled:(BOOL *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5
    && a4
    && (-[SoftISPInputFrame processingOptions]((uint64_t)v5), (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = v7;
    *a4 = objc_msgSend(v7, "cmi_BOOLValueForKey:defaultValue:found:", @"RawMBNR", 1, 0);

    int v9 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v9 = FigSignalErrorAt();
  }

  return v9;
}

- (H13FastRawMBNRConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6 || !v7) {
    goto LABEL_9;
  }
  v11.receiver = self;
  v11.super_class = (Class)H13FastRawMBNRConfig;
  self = [(SoftISPConfig *)&v11 initWithStaticParameters:v6];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_5;
  }
  -[SoftISPConfig setMaximumOutputDimensions:](self, "setMaximumOutputDimensions:", [v8 maximumWidth] | ((unint64_t)objc_msgSend(v8, "maximumHeight") << 32));
  [(SoftISPConfig *)self setInputPixelFormat:0];
  [(SoftISPConfig *)self setInputMTLPixelFormatForPlane:MEMORY[0x263EFFA68]];
  [(SoftISPConfig *)self setOutputPixelFormat:1647719528];
  [(SoftISPConfig *)self setOutputMTLPixelFormatForPlane:&unk_270E981D0];
  int v9 = [(SoftISPConfig *)self outputMTLPixelFormatForPlane];

  if (!v9)
  {
LABEL_9:
    FigDebugAssert3();

    self = 0;
  }
LABEL_5:

  return self;
}

@end