@interface PAEColorBalance
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEColorBalance)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEColorBalance

- (PAEColorBalance)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEColorBalance;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  if (-[PAEColorBalance properties]::once != -1) {
    dispatch_once(&-[PAEColorBalance properties]::once, &__block_literal_global_34);
  }
  return (id)-[PAEColorBalance properties]::sPropertiesDict;
}

uint64_t __29__PAEColorBalance_properties__block_invoke()
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
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", &unk_1F11EC2C8, @"PixelTransformSupport", v1, @"PixelIndependent", v2, @"PositionIndependent", v3, @"MayRemapTime", v4, @"SupportsLargeRenderScale", v5, @"SupportsHeliumRendering", v6, @"SDRWorkingSpace", v7, @"HDRWorkingSpace", v8,
             @"SupportsInternalMixing",
             [NSNumber numberWithUnsignedInteger:1],
             @"AutoColorProcessingSupport",
             0);
  -[PAEColorBalance properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  v11.receiver = self;
  v11.super_class = (Class)PAEColorBalance;
  [(PAESharedDefaultBase *)&v11 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  uint64_t v4 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v3) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  BOOL v6 = v5;
  if (v5)
  {
    int v7 = [v4 versionAtCreation];
    uint64_t v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v9 = v8;
    if (v7)
    {
      objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ColorBalance::ShadowWhitePoint", 0, 0), 10, 1024, 0.5, 0.5, 0.5);
      objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", @"ColorBalance::MidWhitePoint", 0, 0), 11, 1024, 0.5, 0.5, 0.5);
      objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", @"ColorBalance::HighlightsWhitePoint", 0, 0), 12, 1024, 0.5, 0.5, 0.5);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", @"ColorBalance::Boost", 0, 0), 14, 0, 0.0, 0.0, 4.0, 0.0, 4.0, 0.1);
      objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", @"Contrast::Clip", 0, 0), 13, 0, objc_msgSend((id)objc_msgSend(v9, "localizedStringForKey:value:table:", @"Contrast::Clip Values", 0, 0), "componentsSeparatedByString:", @"|"), 1);
      [v3 addToggleButtonWithName:@"IOS Compatability Behavior" parmId:15 defaultValue:0 parmFlags:2];
      [v3 addToggleButtonWithName:@"ColorBalance::HDR In Rec. 709" parmId:16 defaultValue:0 parmFlags:2];
    }
    else
    {
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ColorBalance::Shadow Red", 0, 0), 1, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", @"ColorBalance::Shadow Green", 0, 0), 2, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", @"ColorBalance::Shadow Blue", 0, 0), 3, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", @"ColorBalance::Midtone Red", 0, 0), 4, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", @"ColorBalance::Midtone Green", 0, 0), 5, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", @"ColorBalance::Midtone Blue", 0, 0), 6, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", @"ColorBalance::Highlight Red", 0, 0), 7, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", @"ColorBalance::Highlight Green", 0, 0), 8, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", @"ColorBalance::Highlight Blue", 0, 0), 9, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.01);
    }
  }
  return v6;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v74[1] = *MEMORY[0x1E4F143B8];
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v9) {
    _ZF = v10 == 0;
  }
  else {
    _ZF = 1;
  }
  if (_ZF) {
    goto LABEL_16;
  }
  id v53 = a3;
  double v66 = 1.0;
  char v65 = 0;
  int v64 = 0;
  int v54 = [v10 versionAtCreation];
  if (v54)
  {
    [v9 getRedValue:&v72 greenValue:&v73 blueValue:v74 fromParm:10 atFxTime:a5->var0.var1];
    [v9 getRedValue:&v70 greenValue:&v70.f64[1] blueValue:&v71 fromParm:11 atFxTime:a5->var0.var1];
    float32x2_t v12 = vcvt_f32_f64(v70);
    __asm { FMOV            V2.2S, #1.0 }
    float64x2_t v70 = vcvtq_f64_f32((float32x2_t)vbic_s8(vbsl_s8((int8x8_t)vcgt_f32(v12, _D2), (int8x8_t)_D2, (int8x8_t)v12), (int8x8_t)vcltz_f32(v12)));
    float v17 = v71;
    float v18 = 1.0;
    if (v17 <= 1.0) {
      float v18 = v71;
    }
    _NF = v17 < 0.0;
    float v19 = 0.0;
    if (!_NF) {
      float v19 = v18;
    }
    double v71 = v19;
    [v9 getRedValue:&v67 greenValue:&v68 blueValue:&v69 fromParm:12 atFxTime:a5->var0.var1];
    [v9 getIntValue:&v64 fromParm:13 atFxTime:a5->var0.var1];
    [v9 getFloatValue:&v66 fromParm:14 atFxTime:a5->var0.var1];
    [v9 getBoolValue:&v65 fromParm:15 atFxTime:a5->var0.var1];
    double v20 = 0.0;
    double v21 = 0.5;
    double v51 = 1.0;
    double v22 = 1.0;
    double v23 = 1.0;
    double v24 = 0.5;
    double v25 = 0.5;
    double v26 = 0.0;
    double v27 = 0.0;
  }
  else
  {
    [v9 getFloatValue:&v72 fromParm:1 atFxTime:a5->var0.var1];
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:");
    [v9 getFloatValue:v74 fromParm:3 atFxTime:a5->var0.var1];
    [v9 getFloatValue:&v70 fromParm:4 atFxTime:a5->var0.var1];
    [v9 getFloatValue:&v70.f64[1] fromParm:5 atFxTime:a5->var0.var1];
    [v9 getFloatValue:&v71 fromParm:6 atFxTime:a5->var0.var1];
    [v9 getFloatValue:&v67 fromParm:7 atFxTime:a5->var0.var1];
    [v9 getFloatValue:&v68 fromParm:8 atFxTime:a5->var0.var1];
    [v9 getFloatValue:&v69 fromParm:9 atFxTime:a5->var0.var1];
    double v51 = v67 + 1.0;
    double v22 = v68 + 1.0;
    double v23 = v69 + 1.0;
    double v21 = v70.f64[0] + 0.5;
    double v24 = v70.f64[1] + 0.5;
    double v25 = v71 + 0.5;
    double v27 = v72;
    double v26 = v73;
    double v20 = *(double *)v74;
  }
  [v9 mixAmountAtTime:a5->var0.var1];
  double v52 = v28;
  int v29 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  if (v29)
  {
    if ([a4 imageType] == 3)
    {
      if (a4) {
        [a4 heliumRef];
      }
      else {
        v63 = 0;
      }
      if (v54)
      {
        int v30 = v64;
        double v66 = v66 + 1.0;
        char v62 = 0;
        [v9 getBoolValue:&v62 fromParm:16 atFxTime:a5->var0.var1];
        v31 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F12189D0];
        if (v31) {
          BOOL v32 = [v31 colorPrimaries] == 1;
        }
        else {
          BOOL v32 = 0;
        }
        uint64_t v60 = 0x100000001;
        int v61 = 1;
        uint64_t v58 = 0x100000009;
        int v59 = 9;
        if (v32 && v62)
        {
          FxApplyColorConform((uint64_t *)&v63, (uint64_t)&v58, 1, (uint64_t)&v60, (char *)1, (uint64_t *)&v57);
          v44 = v57;
          if (v63 == v57)
          {
            if (v63) {
              (*(void (**)(void))(*(void *)v63 + 24))();
            }
          }
          else
          {
            if (v63)
            {
              (*(void (**)(void))(*(void *)v63 + 24))();
              v44 = v57;
            }
            v63 = v44;
          }
        }
        v56 = v63;
        if (v63) {
          (*(void (**)(HgcColorBalance *))(*(void *)v63 + 16))(v63);
        }
        double v45 = -1.0;
        if ((v30 & 0xFFFFFFFD) == 1) {
          double v46 = -1.0;
        }
        else {
          double v46 = 1.0;
        }
        if ((v30 & 0xFFFFFFFE) != 2) {
          double v45 = 1.0;
        }
        float v47 = createColorBalance(&v56, &v72, &v67, v70.f64, v65, &v57, v52, v46, v45, v66);
        if (v56) {
          (*(void (**)(HgcColorBalance *, float))(*(void *)v56 + 24))(v56, v47);
        }
        if (v62) {
          BOOL v48 = v32;
        }
        else {
          BOOL v48 = 0;
        }
        if (v48)
        {
          FxApplyColorConform((uint64_t *)&v57, (uint64_t)&v60, 1, (uint64_t)&v58, (char *)1, (uint64_t *)&v55);
          v49 = v55;
          if (v57 == v55)
          {
            if (v57) {
              (*(void (**)(void))(*(void *)v57 + 24))();
            }
          }
          else
          {
            if (v57)
            {
              (*(void (**)(void))(*(void *)v57 + 24))();
              v49 = v55;
            }
            v57 = v49;
          }
        }
        [v53 setHeliumRef:&v57];
        if (v57) {
          (*(void (**)(HgcColorBalance *))(*(void *)v57 + 24))(v57);
        }
      }
      else
      {
        v33 = (HgcChannelBalance *)HGObject::operator new(0x1A0uLL);
        HgcChannelBalance::HgcChannelBalance(v33);
        uint64_t v60 = (uint64_t)v33;
        float v34 = v27;
        float v35 = v26;
        float v36 = v20;
        (*(void (**)(HgcChannelBalance *, void, float, float, float, float))(*(void *)v33 + 96))(v33, 0, v34, v35, v36, 1.0);
        float v37 = v21;
        float v38 = v24;
        float v39 = v25;
        (*(void (**)(HgcChannelBalance *, uint64_t, float, float, float, float))(*(void *)v33 + 96))(v33, 1, v37, v38, v39, 1.0);
        float v40 = v51;
        float v41 = v22;
        float v42 = v23;
        (*(void (**)(HgcChannelBalance *, uint64_t, float, float, float, float))(*(void *)v33 + 96))(v33, 2, v40, v41, v42, 1.0);
        float v43 = v52;
        (*(void (**)(HgcChannelBalance *, uint64_t, float, float, float, float))(*(void *)v33 + 96))(v33, 3, v43, v43, v43, v43);
        (*(void (**)(HgcChannelBalance *, void, HgcColorBalance *))(*(void *)v33 + 120))(v33, 0, v63);
        [a3 setHeliumRef:&v60];
        if (v60) {
          (*(void (**)(uint64_t))(*(void *)v60 + 24))(v60);
        }
      }
      if (v63) {
        (*(void (**)(HgcColorBalance *))(*(void *)v63 + 24))(v63);
      }
      LOBYTE(v29) = 1;
      return v29;
    }
LABEL_16:
    LOBYTE(v29) = 0;
  }
  return v29;
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