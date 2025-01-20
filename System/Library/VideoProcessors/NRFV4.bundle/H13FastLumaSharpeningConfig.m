@interface H13FastLumaSharpeningConfig
- (H13FastLumaSharpeningConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputPixelFormat:(unsigned int)a5;
- (int)getLumaSharpeningConfigForInputFrame:(id)a3 lumaSharpeningConfig:(id *)a4;
@end

@implementation H13FastLumaSharpeningConfig

- (H13FastLumaSharpeningConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputPixelFormat:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8 || !v9 || !v5) {
    goto LABEL_11;
  }
  v14.receiver = self;
  v14.super_class = (Class)H13FastLumaSharpeningConfig;
  self = [(SoftISPConfig *)&v14 initWithStaticParameters:v8];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_6;
  }
  -[SoftISPConfig setMaximumOutputDimensions:](self, "setMaximumOutputDimensions:", [v10 maximumWidth] | ((unint64_t)objc_msgSend(v10, "maximumHeight") << 32));
  [(SoftISPConfig *)self setInputPixelFormat:0];
  [(SoftISPConfig *)self setInputMTLPixelFormatForPlane:MEMORY[0x263EFFA68]];
  [(SoftISPConfig *)self setOutputPixelFormat:v5];
  v11 = determineMTLPixelFormatsForCVPixelFormat([(SoftISPConfig *)self outputPixelFormat]);
  [(SoftISPConfig *)self setOutputMTLPixelFormatForPlane:v11];

  v12 = [(SoftISPConfig *)self outputMTLPixelFormatForPlane];

  if (!v12)
  {
LABEL_11:
    FigDebugAssert3();

    self = 0;
  }
LABEL_6:

  return self;
}

- (int)getLumaSharpeningConfigForInputFrame:(id)a3 lumaSharpeningConfig:(id *)a4
{
  id v6 = a3;
  v7 = -[SoftISPInputFrame metadata]((uint64_t)v6);
  id v8 = [(SoftISPConfig *)self staticParameters];
  id v9 = [v8 tuningParametersForInputFrameMetadata:v7 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v6)];

  v10 = [v9 valueForKey:@"YSH"];
  v11 = v10;
  uint64_t v12 = 0;
  char v45 = 0;
  a4[2] = 0;
  *(_OWORD *)&a4[4].var0 = xmmword_263482090;
  v13 = a4 + 12;
  objc_super v14 = &getLumaSharpeningConfigForInputFrame_lumaSharpeningConfig__sharpeningKernel;
  do
  {
    for (uint64_t i = 0; i != 5; ++i)
    {
      _S0 = v14[i];
      __asm { FCVT            H0, S0 }
      v13[i] = ($96EE1C12479E9B303E9C2794B92A11A2)_S0;
    }
    ++v12;
    v14 += 5;
    v13 += 5;
  }
  while (v12 != 5);
  if (!v10)
  {
    int v42 = 0;
    goto LABEL_40;
  }
  a4[2].var0 = objc_msgSend(v10, "cmi_BOOLValueForKey:defaultValue:found:", @"DotFix", 0, &v45);
  if (!v45) {
    FigSignalErrorAt();
  }
  a4[2].var1 = objc_msgSend(v11, "cmi_BOOLValueForKey:defaultValue:found:", @"LocalSharpClip", a4[2].var1, &v45);
  if (!v45) {
    FigSignalErrorAt();
  }
  objc_msgSend(v11, "cmi_floatValueForKey:defaultValue:found:", @"DotDetectThreshold", &v45, 0.0);
  *(float *)&_D0 = *(float *)&_D0 / 65535.0;
  __asm { FCVT            H0, S0 }
  a4[3] = LOWORD(_D0);
  if (!v45) {
    FigSignalErrorAt();
  }
  LOWORD(_D0) = a4[5];
  __asm { FCVT            S0, H0 }
  objc_msgSend(v11, "cmi_floatValueForKey:defaultValue:found:", @"PhiSlope", &v45, _D0);
  __asm { FCVT            H0, S0 }
  a4[5] = LOWORD(_D0);
  if (!v45) {
    FigSignalErrorAt();
  }
  LOWORD(_D0) = a4[6];
  __asm { FCVT            S0, H0 }
  objc_msgSend(v11, "cmi_floatValueForKey:defaultValue:found:", @"PhiKnee", &v45, _D0);
  __asm { FCVT            H0, S0 }
  a4[6] = LOWORD(_D0);
  if (!v45) {
    FigSignalErrorAt();
  }
  LOWORD(_D0) = a4[7];
  __asm { FCVT            S0, H0 }
  objc_msgSend(v11, "cmi_floatValueForKey:defaultValue:found:", @"SharpScaling", &v45, _D0);
  __asm { FCVT            H0, S0 }
  a4[7] = LOWORD(_D0);
  if (!v45) {
    FigSignalErrorAt();
  }
  LOWORD(_D0) = a4[8];
  __asm { FCVT            S0, H0 }
  objc_msgSend(v11, "cmi_floatValueForKey:defaultValue:found:", @"OvershootMitigation", &v45, _D0);
  __asm { FCVT            H0, S0 }
  a4[8] = LOWORD(_D0);
  if (!v45) {
    FigSignalErrorAt();
  }
  LOWORD(_D0) = a4[9];
  __asm { FCVT            S0, H0 }
  objc_msgSend(v11, "cmi_floatValueForKey:defaultValue:found:", @"ModulationLow", &v45, _D0);
  __asm { FCVT            H0, S0 }
  a4[9] = LOWORD(_D0);
  if (!v45) {
    FigSignalErrorAt();
  }
  LOWORD(_D0) = a4[10];
  __asm { FCVT            S0, H0 }
  objc_msgSend(v11, "cmi_floatValueForKey:defaultValue:found:", @"ModulationHigh", &v45, _D0);
  __asm { FCVT            H0, S0 }
  a4[10] = LOWORD(_D0);
  if (!v45) {
    FigSignalErrorAt();
  }
  LOWORD(_D0) = a4[11];
  __asm { FCVT            S0, H0 }
  objc_msgSend(v11, "cmi_floatValueForKey:defaultValue:found:", @"ModulationSlope", &v45, _D0);
  __asm { FCVT            H0, S0 }
  a4[11] = ($96EE1C12479E9B303E9C2794B92A11A2)_S0;
  if (!v45) {
    FigSignalErrorAt();
  }
  v29 = [v11 objectForKey:@"Kernel"];
  v30 = v29;
  if (v29)
  {
    if ([v29 count] != 25)
    {
      FigDebugAssert3();
      int v42 = FigSignalErrorAt();
      goto LABEL_39;
    }
    for (uint64_t j = 0; j != 25; ++j)
    {
      v32 = [v30 objectAtIndex:j];
      [v32 floatValue];
      __asm { FCVT            H0, S0 }
      a4[j + 12] = ($96EE1C12479E9B303E9C2794B92A11A2)_S0;
    }
  }
  int v34 = FigCaptureComputeImageGainFromMetadata();
  if (v34)
  {
    int v42 = v34;
    FigDebugAssert3();
  }
  else
  {
    v35 = [v9 valueForKey:@"YSH"];
    v36 = [v35 valueForKey:@"SharpeningControl"];

    if (!v36) {
      FigSignalErrorAt();
    }
    v37 = -[SoftISPInputFrame processingOptions]((uint64_t)v6);
    int v38 = objc_msgSend(v37, "cmi_BOOLValueForKey:defaultValue:found:", @"YSH", 1, 0);

    LOWORD(_H0) = 0;
    if (v38)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        _H0 = (short float)(int)[v36 intValue];
      }
      else
      {
        if ([v36 count])
        {
          FigDebugAssert3();
          int v44 = FigSignalErrorAt();

          int v42 = v44;
          goto LABEL_39;
        }
        LODWORD(v40) = 0;
        objc_msgSend(v36, "cmi_interpolateValueForGain:", v40);
        __asm { FCVT            H0, S0 }
      }
    }
    a4[4] = COERCE__96EE1C12479E9B303E9C2794B92A11A2(_H0 * COERCE_SHORT_FLOAT(0x2000));

    int v42 = 0;
  }
LABEL_39:

LABEL_40:
  return v42;
}

@end