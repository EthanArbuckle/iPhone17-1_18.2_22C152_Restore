@interface CMIColourConstancyCommon
+ (int)calculateEIT:(id)a3 result:(float *)a4;
+ (int)getLensShadingCorrectionMaxGain:(id)a3 outputMaxGain:(float *)a4;
+ (int)getStrobeColourCorrectionMatrix:(id)a3 outputMatrix:(id *)a4;
+ (int)getStrobeWhiteBalanceGains:(id)a3 metadata:(id)a4 outputVector:;
+ (int)getWhiteBalanceGains:(id)a3 outputVector:;
@end

@implementation CMIColourConstancyCommon

+ (int)getWhiteBalanceGains:(id)a3 outputVector:
{
  v4 = v3;
  id v5 = a3;
  v6 = v5;
  char v19 = 0;
  if (v5 && v4)
  {
    objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", kFigCaptureStreamMetadata_AWBComboRGain, &v19, 0.0);
    if (v19
      && (float v8 = v7,
          objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", kFigCaptureStreamMetadata_AWBComboGGain, &v19, 0.0), v19)&& (float v10 = v9, objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", kFigCaptureStreamMetadata_AWBComboBGain, &v19, 0.0), v19))
    {
      int v12 = 0;
      __asm { FMOV            V2.4S, #1.0 }
      *(float *)&_Q2 = v8 / v10;
      *((float *)&_Q2 + 2) = v11 / v10;
      _OWORD *v4 = _Q2;
    }
    else
    {
      FigDebugAssert3();
      int v12 = 2;
    }
  }
  else
  {
    FigDebugAssert3();
    int v12 = 10;
  }

  return v12;
}

+ (int)getStrobeWhiteBalanceGains:(id)a3 metadata:(id)a4 outputVector:
{
  id v5 = v4;
  id v7 = a3;
  id v8 = a4;
  float v9 = v8;
  if (!v7 || !v8 || !v5)
  {
    FigDebugAssert3();
    int v24 = 10;
    goto LABEL_12;
  }
  uint64_t v10 = [v8 objectForKeyedSubscript:kFigCaptureStreamMetadata_PortType];
  if (!v10)
  {
    FigDebugAssert3();
    int v24 = 2;
    goto LABEL_12;
  }
  float v11 = (void *)v10;
  int v12 = [v7 objectForKeyedSubscript:v10];
  if (!v12)
  {
    FigDebugAssert3();
LABEL_19:

    int v24 = 3;
    goto LABEL_12;
  }
  v13 = v12;
  v14 = [v12 objectForKeyedSubscript:kFigCaptureStreamProperty_FlashCalibrationData];
  if (!v14)
  {
    FigDebugAssert3();
LABEL_18:

    goto LABEL_19;
  }
  id v15 = v14;
  v16 = (char *)[v15 bytes];
  if (!v16)
  {
    FigDebugAssert3();

    goto LABEL_18;
  }
  if ((*(_DWORD *)v16 - 1) > 1)
  {
    int32x4_t v23 = (int32x4_t)xmmword_21A90;
  }
  else
  {
    __asm { FMOV            V1.2S, #1.0 }
    *(float32x2_t *)v17.i8 = vdiv_f32(_D1, *(float32x2_t *)(v16 + 4));
    int32x4_t v23 = vzip1q_s32(v17, v17);
    v23.i32[1] = 1.0;
  }
  *id v5 = v23;

  int v24 = 0;
LABEL_12:

  return v24;
}

+ (int)calculateEIT:(id)a3 result:(float *)a4
{
  id v5 = a3;
  v6 = v5;
  char v13 = 0;
  if (v5 && a4)
  {
    unsigned int v7 = objc_msgSend(v5, "cmi_intValueForKey:defaultValue:found:", kFigCaptureStreamMetadata_AGC, 0, &v13);
    if (v13
      && (int v8 = v7,
          objc_msgSend(v6, "cmi_doubleValueForKey:defaultValue:found:", kFigCaptureStreamMetadata_ExposureTime, &v13, 0.0), v13))
    {
      int v10 = 0;
      float v11 = v9
          * (float)((float)v8 * 0.0039062)
          / (float)((float)(int)objc_msgSend(v6, "cmi_intValueForKey:defaultValue:found:", kFigCaptureStreamMetadata_HRGainDownRatio, 4096, 0)* 0.00024414);
      *a4 = v11;
    }
    else
    {
      FigDebugAssert3();
      int v10 = 2;
    }
  }
  else
  {
    FigDebugAssert3();
    int v10 = 10;
  }

  return v10;
}

+ (int)getLensShadingCorrectionMaxGain:(id)a3 outputMaxGain:(float *)a4
{
  id v5 = a3;
  unsigned int v7 = v5;
  char v11 = 0;
  if (v5 && a4)
  {
    LODWORD(v6) = 1.0;
    objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", kLensShadingCorrectionGainMapParametersKey_GridMaxGain, &v11, v6);
    if (v11)
    {
      int v9 = 0;
      *(_DWORD *)a4 = v8;
    }
    else
    {
      FigDebugAssert3();
      int v9 = 2;
    }
  }
  else
  {
    FigDebugAssert3();
    int v9 = 10;
  }

  return v9;
}

+ (int)getStrobeColourCorrectionMatrix:(id)a3 outputMatrix:(id *)a4
{
  id v5 = a3;
  double v6 = v5;
  if (!a4)
  {
    FigDebugAssert3();
    int v14 = 10;
    goto LABEL_6;
  }
  unsigned int v7 = [v5 objectForKeyedSubscript:@"AwbOutputMetadata"];
  int v8 = [v7 objectForKeyedSubscript:@"StrobeWhitePointCCM"];

  if (!v8)
  {
    int v8 = [v6 objectForKeyedSubscript:kFigCaptureStreamMetadata_ColorCorrectionMatrix];
    if (!v8)
    {
      FigDebugAssert3();
LABEL_10:
      int v14 = 2;
      goto LABEL_6;
    }
  }
  id v9 = v8;
  int v10 = [v9 bytes];
  if (!v10)
  {
    FigDebugAssert3();

    goto LABEL_10;
  }
  LODWORD(v11) = *v10;
  LODWORD(v12) = v10[1];
  DWORD1(v11) = v10[3];
  DWORD2(v11) = v10[6];
  DWORD1(v12) = v10[4];
  DWORD2(v12) = v10[7];
  LODWORD(v13) = v10[2];
  DWORD1(v13) = v10[5];
  DWORD2(v13) = v10[8];
  *(_OWORD *)a4 = v11;
  *((_OWORD *)a4 + 1) = v12;
  *((_OWORD *)a4 + 2) = v13;

  int v14 = 0;
LABEL_6:

  return v14;
}

@end