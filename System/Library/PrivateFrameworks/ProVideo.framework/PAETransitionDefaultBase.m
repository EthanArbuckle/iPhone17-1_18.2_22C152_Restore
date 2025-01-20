@interface PAETransitionDefaultBase
- (BOOL)addEaseParametersWithDefault:(float)a3 andFlags:(unsigned int)a4;
- (BOOL)addHDRWhiteLevelParameter;
- (BOOL)addMotionBlurParameters;
- (BOOL)addParameters;
- (BOOL)applyHDRWhiteLevelForRGBComponents:(double *)a3 inColorSpace:(CGColorSpace *)a4;
- (BOOL)applyHDRWhiteLevelForRed:(double *)a3 green:(double *)a4 blue:(double *)a5 inColorSpace:(CGColorSpace *)a6;
- (BOOL)canThrowRenderOutput:(id)a3 withInputA:(id)a4 withInputB:(id)a5 withTimeFraction:(float)a6 withInfo:(id *)a7;
- (BOOL)canThrowRenderOutput:(id)a3 withInputA:(id)a4 withInputB:(id)a5 withTimeFraction:(float)a6 withSpeed:(float)a7 withInfo:(id *)a8;
- (BOOL)convertTimeFraction:(double)a3 toLocal:(double *)a4 andDerivative:(double *)a5 atTime:(id)a6;
- (BOOL)disableHDRWhiteLevelParameter:(BOOL)a3;
- (BOOL)finishInitialSetup:(id *)a3;
- (BOOL)frameSetup:(id *)a3 inputInfoA:(id *)a4 inputInfoB:(id *)a5 timeFraction:(float)a6 hardware:(BOOL *)a7 software:(BOOL *)a8;
- (BOOL)getEaseIn:(double *)a3 easeOut:(double *)a4 atTime:(id)a5;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInputA:(id *)a5 withInputB:(id *)a6 withTimeFraction:(float)a7 withInfo:(id *)a8;
- (BOOL)isEndGap;
- (BOOL)isFrontGap;
- (BOOL)parameterChanged:(unsigned int)a3;
- (BOOL)renderOutput:(id)a3 withInputA:(id)a4 withInputB:(id)a5 withTimeFraction:(float)a6 withInfo:(id *)a7;
- (BOOL)showHideHDRWhiteLevelParameterForColorModel:(id)a3;
- (BOOL)versionSupportsHDRWhiteLevel;
- (double)relativeShutterAtTime:(id)a3;
@end

@implementation PAETransitionDefaultBase

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInputA:(id *)a5 withInputB:(id *)a6 withTimeFraction:(float)a7 withInfo:(id *)a8
{
  unint64_t var0 = a5->var0;
  if (a5->var0 <= a6->var0) {
    unint64_t var0 = a6->var0;
  }
  *a3 = var0;
  unint64_t var1 = a5->var1;
  if (var1 <= a6->var1) {
    unint64_t var1 = a6->var1;
  }
  *a4 = var1;
  return 1;
}

- (BOOL)frameSetup:(id *)a3 inputInfoA:(id *)a4 inputInfoB:(id *)a5 timeFraction:(float)a6 hardware:(BOOL *)a7 software:(BOOL *)a8
{
  *a7 = 1;
  *a8 = 1;
  return 1;
}

- (BOOL)finishInitialSetup:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return a3 != 0;
}

- (BOOL)addParameters
{
  LODWORD(v2) = 1112014848;
  return [(PAETransitionDefaultBase *)self addEaseParametersWithDefault:2 andFlags:v2];
}

- (BOOL)addEaseParametersWithDefault:(float)a3 andFlags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v7 = (void *)[(PROAPIAccessing *)self->super._apiManager apiForProtocol:&unk_1F121A238];
  if (v7)
  {
    v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Transition::Ease In", 0, 0), objc_msgSend(v8, "localizedStringForKey:value:table:", @"Transition::Ease Out", 0, 0), objc_msgSend(v8, "localizedStringForKey:value:table:", @"Transition::Ease In Out", 0, 0), 0);
    objc_msgSend(v7, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Transition::Ease Type", 0, 0), 50, 2, v9, v4 | 1);

    objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Transition::Ease Amount", 0, 0), 51, v4, a3, 0.0, 100.0, 0.0, 100.0, 1.0);
    *(&self->super._hostIsVertigo + 1) = 1;
  }
  return v7 != 0;
}

- (BOOL)addMotionBlurParameters
{
  v3 = (void *)[(PROAPIAccessing *)self->super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Transition::Motion Blur", 0, 0), 52, 1, 3);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Transition::Shutter Angle", 0, 0), 53, 2, 180.0, 0.0, 360.0, 0.0, 360.0, 1.0);
    *(&self->super._hostIsVertigo + 2) = 1;
  }
  return v3 != 0;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  return 1;
}

- (BOOL)convertTimeFraction:(double)a3 toLocal:(double *)a4 andDerivative:(double *)a5 atTime:(id)a6
{
  if (*(&self->super._hostIsVertigo + 1))
  {
    double v12 = 0.0;
    double v13 = 0.0;
    BOOL v10 = [(PAETransitionDefaultBase *)self getEaseIn:&v13 easeOut:&v12 atTime:a6.var1];
    if (v10) {
      PCMath::easeInOut(a4, a3, v13, v12, 0.0, 1.0, a5, v9);
    }
  }
  else
  {
    if (a4) {
      *a4 = a3;
    }
    if (a5) {
      *a5 = 1.0;
    }
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (BOOL)getEaseIn:(double *)a3 easeOut:(double *)a4 atTime:(id)a5
{
  *a4 = 0.0;
  *a3 = 0.0;
  if (*(&self->super._hostIsVertigo + 1))
  {
    v8 = (void *)[(PROAPIAccessing *)self->super._apiManager apiForProtocol:&unk_1F121D130];
    if (v8)
    {
      v9 = v8;
      int v15 = 0;
      double v14 = 0.0;
      int v10 = [v8 getIntValue:&v15 fromParm:50 atFxTime:a5.var1];
      LODWORD(v8) = v10 & [v9 getFloatValue:&v14 fromParm:51 atFxTime:a5.var1];
      if (v8 == 1)
      {
        double v11 = v14 / 100.0;
        switch(v15)
        {
          case 0:
            double v12 = v14 / 100.0;
            double v11 = 0.0;
            goto LABEL_11;
          case 2:
            double v12 = v11 * 0.5;
            double v11 = v11 * 0.5;
            goto LABEL_11;
          case 1:
            double v12 = 0.0;
LABEL_11:
            *a3 = v12;
            *a4 = v11;
            break;
        }
      }
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return (char)v8;
}

- (double)relativeShutterAtTime:(id)a3
{
  double v3 = 0.0;
  if (*(&self->super._hostIsVertigo + 2))
  {
    v6 = (void *)[(PROAPIAccessing *)self->super._apiManager apiForProtocol:&unk_1F121D130];
    if (v6)
    {
      v7 = v6;
      char v11 = 0;
      [v6 getBoolValue:&v11 fromParm:52 atFxTime:a3.var1];
      if (v11)
      {
        double v10 = 0.0;
        [v7 getFloatValue:&v10 fromParm:53 atFxTime:a3.var1];
        [(PAESharedDefaultBase *)self relativeShutterForAngle:v10];
        return v8;
      }
    }
  }
  return v3;
}

- (BOOL)renderOutput:(id)a3 withInputA:(id)a4 withInputB:(id)a5 withTimeFraction:(float)a6 withInfo:(id *)a7
{
  long long v7 = *(_OWORD *)&a7->var2;
  v9[0] = *(_OWORD *)&a7->var0.var0;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a7->var4;
  return -[PAETransitionDefaultBase canThrowRenderOutput:withInputA:withInputB:withTimeFraction:withInfo:](self, "canThrowRenderOutput:withInputA:withInputB:withTimeFraction:withInfo:", a3, a4, a5, v9);
}

- (BOOL)canThrowRenderOutput:(id)a3 withInputA:(id)a4 withInputB:(id)a5 withTimeFraction:(float)a6 withInfo:(id *)a7
{
  double v18 = 0.0;
  double v19 = 0.0;
  BOOL v12 = [(PAETransitionDefaultBase *)self convertTimeFraction:&v19 toLocal:&v18 andDerivative:a7->var0.var1 atTime:a6];
  if (v12)
  {
    HIDWORD(v14) = HIDWORD(v18);
    HIDWORD(v13) = HIDWORD(v19);
    *(float *)&double v13 = v19;
    *(float *)&double v14 = v18;
    long long v15 = *(_OWORD *)&a7->var2;
    v17[0] = *(_OWORD *)&a7->var0.var0;
    v17[1] = v15;
    v17[2] = *(_OWORD *)&a7->var4;
    LOBYTE(v12) = [(PAETransitionDefaultBase *)self canThrowRenderOutput:a3 withInputA:a4 withInputB:a5 withTimeFraction:v17 withSpeed:v13 withInfo:v14];
  }
  return v12;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInputA:(id)a4 withInputB:(id)a5 withTimeFraction:(float)a6 withSpeed:(float)a7 withInfo:(id *)a8
{
  return 0;
}

- (BOOL)isFrontGap
{
  double v3 = (void *)[(PROAPIAccessing *)self->super._apiManager apiForProtocol:&unk_1F122C298];
  char v4 = [v3 isGapBefore:self];
  return [v3 isAtStartofStoryline:self] | v4;
}

- (BOOL)isEndGap
{
  double v3 = (void *)[(PROAPIAccessing *)self->super._apiManager apiForProtocol:&unk_1F122C298];
  char v4 = [v3 isGapAfter:self];
  return [v3 isAtEndofStoryline:self] | v4;
}

- (BOOL)versionSupportsHDRWhiteLevel
{
  return 0;
}

- (BOOL)addHDRWhiteLevelParameter
{
  double v3 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v4 = (void *)[(PROAPIAccessing *)self->super._apiManager apiForProtocol:&unk_1F121A238];
  uint64_t v5 = [v3 localizedStringForKey:@"PAETransitionDefaultBase::HDRWhiteLevel" value:0 table:0];

  return [v4 addPercentSliderWithName:v5 parmId:18 defaultValue:1 parameterMin:0.949999988 parameterMax:0.5 sliderMin:1.0 sliderMax:0.5 delta:1.0 parmFlags:0.01];
}

- (BOOL)showHideHDRWhiteLevelParameterForColorModel:(id)a3
{
  uint64_t v5 = (void *)[(PROAPIAccessing *)self->super._apiManager apiForProtocol:&unk_1F121D130];
  v6 = (void *)[(PROAPIAccessing *)self->super._apiManager apiForProtocol:&unk_1F121D2E0];
  int v7 = objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super._apiManager, "apiForProtocol:", &unk_1F122C2F8), "shouldDisableDRTandHideWhiteLevel");
  unsigned int v11 = 0;
  int v8 = [v5 getParameterFlags:&v11 fromParm:18];
  if (v8)
  {
    if ([a3 isEqualToString:kFxColorSpaceChange_HDR] ^ 1 | v7) {
      int v9 = 131074;
    }
    else {
      int v9 = 0;
    }
    unsigned int v11 = v11 & 0xFFFDFFFD | v9;
    objc_msgSend(v6, "setParameterFlags:toParm:");
  }
  return v8;
}

- (BOOL)disableHDRWhiteLevelParameter:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)[(PROAPIAccessing *)self->super._apiManager apiForProtocol:&unk_1F121D130];
  v6 = (void *)[(PROAPIAccessing *)self->super._apiManager apiForProtocol:&unk_1F121D2E0];
  int v7 = objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super._apiManager, "apiForProtocol:", &unk_1F122C2F8), "shouldDisableDRTandHideWhiteLevel");
  unsigned int v11 = 0;
  int v8 = [v5 getParameterFlags:&v11 fromParm:18];
  if (v8)
  {
    if (v3 | v7) {
      int v9 = 4;
    }
    else {
      int v9 = 0;
    }
    unsigned int v11 = v11 & 0xFFFFFFFB | v9;
    objc_msgSend(v6, "setParameterFlags:toParm:");
  }
  return v8;
}

- (BOOL)applyHDRWhiteLevelForRed:(double *)a3 green:(double *)a4 blue:(double *)a5 inColorSpace:(CGColorSpace *)a6
{
  double v10 = (void *)[(PROAPIAccessing *)self->super._apiManager apiForProtocol:&unk_1F121D130];
  int v28 = 0;
  BOOL v11 = 0;
  if ([v10 getParameterFlags:&v28 fromParm:18])
  {
    if ((v28 & 2) != 0)
    {
      return 1;
    }
    else
    {
      long long v26 = *MEMORY[0x1E4F1FA48];
      uint64_t v27 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      double v25 = 0.0;
      BOOL v12 = (PCColorUtil *)[v10 getFloatValue:&v25 fromParm:18 atFxTime:&v26];
      BOOL v11 = (char)v12;
      if (v12)
      {
        v13.i32[1] = HIDWORD(v25);
        *(float *)v13.i32 = v25;
        double WhiteGainForHLGLevel = PCColorUtil::getWhiteGainForHLGLevel(v12, v13);
        float v15 = *(float *)&WhiteGainForHLGLevel;
        *(float *)&double WhiteGainForHLGLevel = *a3;
        float v16 = *a4;
        float v17 = *a5;
        PCColor::PCColor(&v24, *(float *)&WhiteGainForHLGLevel, v16, v17, a6);
        double v18 = PCGetNCLCColorSpace((unsigned int *)&kPCNCLC_Rec2020Linear);
        uint64_t v23 = 0;
        float v22 = 0.0;
        PCColor::getRGB(&v24, (float *)&v23 + 1, (float *)&v23, &v22, v18);
        *(float *)&uint64_t v23 = v15 * *(float *)&v23;
        *((float *)&v23 + 1) = v15 * *((float *)&v23 + 1);
        float v22 = v15 * v22;
        float v21 = 0.0;
        uint64_t v20 = 0;
        PCColor::setRGB(&v24, *((float *)&v23 + 1), *(float *)&v23, v22, v18);
        PCColor::getRGB(&v24, &v21, (float *)&v20 + 1, (float *)&v20, a6);
        *a3 = v21;
        *a4 = *((float *)&v20 + 1);
        *a5 = *(float *)&v20;
        PCCFRef<CGColorSpace *>::~PCCFRef(&v24.var1._obj);
      }
    }
  }
  return v11;
}

- (BOOL)applyHDRWhiteLevelForRGBComponents:(double *)a3 inColorSpace:(CGColorSpace *)a4
{
  return [(PAETransitionDefaultBase *)self applyHDRWhiteLevelForRed:a3 green:a3 + 1 blue:a3 + 2 inColorSpace:a4];
}

@end