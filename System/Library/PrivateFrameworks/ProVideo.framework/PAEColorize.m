@interface PAEColorize
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEColorize)initWithAPIManager:(id)a3;
- (id)properties;
- (void)dealloc;
@end

@implementation PAEColorize

- (PAEColorize)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEColorize;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAEColorize;
  [(PAESharedDefaultBase *)&v2 dealloc];
}

- (id)properties
{
  if (-[PAEColorize properties]::once != -1) {
    dispatch_once(&-[PAEColorize properties]::once, &__block_literal_global_41);
  }
  return (id)-[PAEColorize properties]::sPropertiesDict;
}

uint64_t __25__PAEColorize_properties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v1 = [NSNumber numberWithBool:1];
  uint64_t v2 = [NSNumber numberWithBool:1];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:65792];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:590080];
  uint64_t v8 = [NSNumber numberWithBool:1];
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", &unk_1F11EC358, @"PixelTransformSupport", v1, @"PixelIndependent", v2, @"PositionIndependent", v3, @"MayRemapTime", v4, @"SupportsLargeRenderScale", v5, @"SupportsHeliumRendering", v6, @"SDRWorkingSpace", v7, @"HDRWorkingSpace", v8,
             @"SupportsInternalMixing",
             [NSNumber numberWithUnsignedInteger:1],
             @"AutoColorProcessingSupport",
             0);
  -[PAEColorize properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  v7.receiver = self;
  v7.super_class = (Class)PAEColorize;
  [(PAESharedDefaultBase *)&v7 addParameters];
  uint64_t v3 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v4, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Colorize::RemapBlackTo", 0, 0), 1, 0, 0.0901960784, 0.0, 0.0);
    objc_msgSend(v4, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Colorize::RemapWhiteTo", 0, 0), 2, 0, 1.0, 0.811764706, 0.639215686);
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Colorize::Intensity", 0, 0), 3, 0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.05);
    objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Colorize::HDR In Rec. 709", 0, 0), 4, 0, 2);
  }
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A608];
  if (!v9) {
    return v9;
  }
  v10 = (void *)v9;
  uint64_t v9 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F12189D0];
  if (!v9) {
    return v9;
  }
  v11 = (void *)v9;
  int v12 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  if ([a4 imageType] != 3 && v12)
  {
    LOBYTE(v9) = 0;
    return v9;
  }
  double v47 = 0.0;
  [v10 getFloatValue:&v47 fromParm:3 atFxTime:a5->var0.var1];
  double v45 = 0.0;
  double v46 = 0.0;
  double v44 = 0.0;
  [v10 getRedValue:&v46 greenValue:&v45 blueValue:&v44 fromParm:1 atFxTime:a5->var0.var1];
  double v42 = 0.0;
  double v43 = 0.0;
  double v41 = 0.0;
  [v10 getRedValue:&v43 greenValue:&v42 blueValue:&v41 fromParm:2 atFxTime:a5->var0.var1];
  [v10 mixAmountAtTime:a5->var0.var1];
  double v14 = v13;
  v15 = (double *)objc_msgSend((id)objc_msgSend(v11, "colorMatrixFromDesiredRGBToYCbCrAtTime:", a5->var0.var1), "matrix");
  double v16 = *v15;
  double v17 = v15[1];
  double v18 = v15[2];
  char v40 = 0;
  [v10 getBoolValue:&v40 fromParm:4 atFxTime:a5->var0.var1];
  BOOL v19 = [v11 colorPrimaries] != 1 || v40 == 0;
  int v20 = !v19;
  if (v19)
  {
    float v21 = v16;
    float v22 = v17;
    float v23 = v18;
    if (a4)
    {
LABEL_14:
      [a4 heliumRef];
      if (!v20) {
        goto LABEL_24;
      }
LABEL_18:
      FxApplyColorConform(&v38, (uint64_t)&kPCNCLC_Rec2020, 1, (uint64_t)&kPCNCLC_Rec709, (char *)1, &v37);
      uint64_t v24 = v37;
      if (v38 == v37)
      {
        if (v38) {
          (*(void (**)(void))(*(void *)v38 + 24))();
        }
      }
      else
      {
        if (v38)
        {
          (*(void (**)(void))(*(void *)v38 + 24))();
          uint64_t v24 = v37;
        }
        uint64_t v38 = v24;
      }
      goto LABEL_24;
    }
  }
  else
  {
    PCGetRec709LuminanceCoefficients((uint64_t)&v38);
    float v22 = *((float *)&v38 + 1);
    float v21 = *(float *)&v38;
    float v23 = v39;
    convertRGBColor(&v46, &v45, &v44);
    convertRGBColor(&v43, &v42, &v41);
    if (a4) {
      goto LABEL_14;
    }
  }
  uint64_t v38 = 0;
  if (v20) {
    goto LABEL_18;
  }
LABEL_24:
  v25 = (HgcColorize *)HGObject::operator new(0x1A0uLL);
  HgcColorize::HgcColorize(v25);
  (*(void (**)(HgcColorize *, void, uint64_t))(*(void *)v25 + 120))(v25, 0, v38);
  float v26 = v46;
  float v27 = v45;
  float v28 = v44;
  (*(void (**)(HgcColorize *, void, float, float, float, double))(*(void *)v25 + 96))(v25, 0, v26, v27, v28, 0.0);
  float v29 = v43;
  float v30 = v42;
  float v31 = v41;
  (*(void (**)(HgcColorize *, uint64_t, float, float, float, double))(*(void *)v25 + 96))(v25, 1, v29, v30, v31, 0.0);
  float v32 = v47;
  (*(void (**)(HgcColorize *, uint64_t, float, double, double, double))(*(void *)v25 + 96))(v25, 2, v32, 0.0, 0.0, 0.0);
  float v33 = v14;
  (*(void (**)(HgcColorize *, uint64_t, float, double, double, double))(*(void *)v25 + 96))(v25, 3, v33, 0.0, 0.0, 0.0);
  (*(void (**)(HgcColorize *, uint64_t, float, float, float, double))(*(void *)v25 + 96))(v25, 4, v21, v22, v23, 0.0);
  uint64_t v37 = (uint64_t)v25;
  (*(void (**)(HgcColorize *))(*(void *)v25 + 16))(v25);
  if (v20)
  {
    FxApplyColorConform(&v37, (uint64_t)&kPCNCLC_Rec709, 1, (uint64_t)&kPCNCLC_Rec2020, (char *)1, &v36);
    uint64_t v34 = v36;
    if (v37 == v36)
    {
      if (v37) {
        (*(void (**)(void))(*(void *)v37 + 24))();
      }
    }
    else
    {
      if (v37)
      {
        (*(void (**)(void))(*(void *)v37 + 24))();
        uint64_t v34 = v36;
      }
      uint64_t v37 = v34;
    }
  }
  [a3 setHeliumRef:&v37];
  if (v37) {
    (*(void (**)(uint64_t))(*(void *)v37 + 24))(v37);
  }
  (*(void (**)(HgcColorize *))(*(void *)v25 + 24))(v25);
  if (v38) {
    (*(void (**)(uint64_t))(*(void *)v38 + 24))(v38);
  }
  LOBYTE(v9) = 1;
  return v9;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  *a6 = 0;
  *a5 = 0;
  long long v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  [(PAESharedDefaultBase *)self overrideFrameSetupForRenderMode:v8 hardware:a5 software:a6];
  return 1;
}

@end