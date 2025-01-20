@interface PAEAddNoise
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)parameterChanged:(unsigned int)a3;
- (BOOL)variesOverTime;
- (HGRef<HGNode>)noiseNodeWithWidth:(int)a3 height:(int)a4 noiseType:(int)a5 isMono:(BOOL)a6 frameNum:(double)a7 autoAnimate:(BOOL)a8 randomSeed:(int)a9 inputPixelTransform:(PCMatrix44Tmpl<double> *)a10 outputPixelTransform:(PCMatrix44Tmpl<double> *)a11 outputInvPixelTransform:(PCMatrix44Tmpl<double> *)a12 is360:(BOOL)a13;
- (HGRef<HGNode>)translateNode:(HGRef<HGNode>)a3 byAmount:(PCVector2<double>)a4 andCropTo:(HGRect)a5;
- (PAEAddNoise)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
@end

@implementation PAEAddNoise

- (PAEAddNoise)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEAddNoise;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (BOOL)variesOverTime
{
  return 1;
}

- (BOOL)addParameters
{
  v7.receiver = self;
  v7.super_class = (Class)PAEAddNoise;
  [(PAESharedDefaultBase *)&v7 addParameters];
  v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    objc_super v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::Amount", 0, 0), 1, 0, 0.33, 0.0, 4.0, 0.0, 1.0, 0.1);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::Type", 0, 0), 2, 1, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::TVNoise", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::WhiteNoise", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::GaussianNoise", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::BlueNoise", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::PinkNoise", 0, 0), 0), 1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::Monochrome", 0, 0), 3, 0, 1);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::BlendMode", 0, 0), 4, 0, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::NormalMode", 0, 0), @"-", objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::SubtractMode", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::MultiplyMode", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::DarkenMode", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::ColorBurnMode", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::LinearBurnMode", 0, 0), @"-", objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::AddMode", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::LightenMode", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::ScreenMode", 0, 0),
        [v4 localizedStringForKey:@"AddNoise::ColorDodgeMode" value:0 table:0],
        [v4 localizedStringForKey:@"AddNoise::LinearDodgeMode" value:0 table:0],
        @"-",
        [v4 localizedStringForKey:@"AddNoise::OverlayMode" value:0 table:0],
        [v4 localizedStringForKey:@"AddNoise::SoftLightMode" value:0 table:0],
        [v4 localizedStringForKey:@"AddNoise::HardLightMode" value:0 table:0],
        [v4 localizedStringForKey:@"AddNoise::VividLightMode" value:0 table:0],
        [v4 localizedStringForKey:@"AddNoise::LinearLightMode" value:0 table:0],
        [v4 localizedStringForKey:@"AddNoise::PinLightMode" value:0 table:0],
        [v4 localizedStringForKey:@"AddNoise::HardMixMode" value:0 table:0],
        @"-",
        [v4 localizedStringForKey:@"AddNoise::DifferenceMode" value:0 table:0],
        [v4 localizedStringForKey:@"AddNoise::ExclusionMode" value:0 table:0],
        0),
      1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::Autoanimate", 0, 0), 5, 1, 1);
    LODWORD(v6) = 4;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::RandomSeed", 0, 0), 6, 25, 2294967296, 2000000000, 1, 0x1000003E8, v6);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"AddNoise::RandomSeed", 0, 0), 7, 0, 2);
  }
  return v3 != 0;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  if (a3 != 5) {
    return 1;
  }
  uint64_t v15 = v3;
  uint64_t v16 = v4;
  uint64_t v6 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v7 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D2E0];
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    return 0;
  }
  v10 = (void *)v7;
  long long v13 = *MEMORY[0x1E4F1F9F8];
  uint64_t v14 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  unsigned __int8 v12 = 0;
  if ([v6 getBoolValue:&v12 fromParm:5 atFxTime:&v13])
  {
    int v11 = 0;
    [v6 getParameterFlags:&v11 fromParm:6];
    [v10 setParameterFlags:v11 & 0xFFFFFFFB | (4 * v12) toParm:6];
  }
  return 1;
}

- (HGRef<HGNode>)translateNode:(HGRef<HGNode>)a3 byAmount:(PCVector2<double>)a4 andCropTo:(HGRect)a5
{
  uint64_t v7 = v5;
  uint64_t v8 = *(void *)&a5.var2;
  v9 = *(double **)&a5.var0;
  int v11 = v6;
  HGTransform::HGTransform((HGTransform *)v15);
  HGTransform::LoadIdentity((HGTransform *)v15);
  HGTransform::Translate((HGTransform *)v15, *v9, v9[1], 0.0);
  unsigned __int8 v12 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v12);
  (*(void (**)(HGXForm *, void, void))(*(void *)v12 + 120))(v12, 0, *(void *)a3.var0);
  (*(void (**)(HGXForm *, unsigned char *))(*(void *)v12 + 576))(v12, v15);
  long long v13 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v13);
  (*(void (**)(HGCrop *, void, HGXForm *))(*(void *)v13 + 120))(v13, 0, v12);
  (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v13 + 96))(v13, 0, (float)(int)v8, (float)SHIDWORD(v8), (float)(int)v7, (float)SHIDWORD(v7));
  *int v11 = v13;
  (*(void (**)(HGXForm *))(*(void *)v12 + 24))(v12);
  HGTransform::~HGTransform((HGTransform *)v15);
  return v14;
}

- (HGRef<HGNode>)noiseNodeWithWidth:(int)a3 height:(int)a4 noiseType:(int)a5 isMono:(BOOL)a6 frameNum:(double)a7 autoAnimate:(BOOL)a8 randomSeed:(int)a9 inputPixelTransform:(PCMatrix44Tmpl<double> *)a10 outputPixelTransform:(PCMatrix44Tmpl<double> *)a11 outputInvPixelTransform:(PCMatrix44Tmpl<double> *)a12 is360:(BOOL)a13
{
  *long long v13 = 0;
  if (a13) {
    PAEGenerateNoise(1.0, a7, (3 * a4 / 2), *(uint64_t *)&a4, a5, a6, a8, a9);
  }
  PAEGenerateNoise(1.0, a7, *(uint64_t *)&a3, *(uint64_t *)&a4, a5, a6, a8, a9);
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v9)
  {
    v10 = (void *)v9;
    if ([a4 imageType] == 3)
    {
      double v58 = 0.33;
      [v10 getFloatValue:&v58 fromParm:1 atFxTime:a5->var0.var1];
      if (v58 == 0.0)
      {
        if (a4) {
          objc_msgSend(a4, "heliumRef", v58);
        }
        else {
          *(void *)&v52[0] = 0;
        }
        [a3 setHeliumRef:v52];
        if (*(void *)&v52[0]) {
          (*(void (**)(void))(**(void **)&v52[0] + 24))(*(void *)&v52[0]);
        }
      }
      else
      {
        int v11 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1F121E208, v58);
        if (v11) {
          BOOL v12 = [v11 versionAtCreation] == 0;
        }
        else {
          BOOL v12 = 0;
        }
        unsigned int v57 = 1;
        [v10 getIntValue:&v57 fromParm:2 atFxTime:a5->var0.var1];
        unsigned __int8 v56 = 0;
        [v10 getBoolValue:&v56 fromParm:3 atFxTime:a5->var0.var1];
        unsigned __int8 v55 = 1;
        [v10 getBoolValue:&v55 fromParm:5 atFxTime:a5->var0.var1];
        unsigned int v54 = 25;
        [v10 getIntValue:&v54 fromParm:6 atFxTime:a5->var0.var1];
        int v53 = 0;
        [v10 getIntValue:&v53 fromParm:4 atFxTime:a5->var0.var1];
        [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a4];
        [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
        [(PAESharedDefaultBase *)self getPixelTransformForImage:a3];
        [(PAESharedDefaultBase *)self frameFromFxTime:a5->var0.var1 forPlugIn:self];
        double v14 = v13;
        uint64_t v15 = [a4 width];
        uint64_t v16 = [a4 height];
        v34[5] = v52[5];
        v34[6] = v52[6];
        v34[7] = v52[7];
        v34[1] = v52[1];
        v34[2] = v52[2];
        v34[3] = v52[3];
        v34[4] = v52[4];
        v33[5] = v41;
        v33[6] = v42;
        v33[7] = v43;
        v34[0] = v52[0];
        v33[1] = v37;
        v33[2] = v38;
        v33[3] = v39;
        v33[4] = v40;
        v32[2] = v46;
        v32[3] = v47;
        v32[0] = v44;
        v32[1] = v45;
        v32[7] = v51;
        v33[0] = v36;
        v32[5] = v49;
        v32[6] = v50;
        v32[4] = v48;
        LOBYTE(v28) = 0;
        [(PAEAddNoise *)self noiseNodeWithWidth:v15 height:v16 noiseType:v57 isMono:v56 frameNum:v55 autoAnimate:v54 randomSeed:v14 inputPixelTransform:v34 outputPixelTransform:v33 outputInvPixelTransform:v32 is360:v28];
        if (a4) {
          [a4 heliumRef];
        }
        else {
          uint64_t v31 = 0;
        }
        [a4 width];
        [a4 height];
        v17 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
        HGHWBlendFlipped::HGHWBlendFlipped(v17);
        v30 = v17;
        [(PAESharedDefaultBase *)self getBlendingGamma];
        (*(void (**)(HGHWBlendFlipped *, uint64_t))(*(void *)v17 + 96))(v17, 5);
        if (a4) {
          [a4 heliumRef];
        }
        else {
          uint64_t v29 = 0;
        }
        if (v53)
        {
          v18 = (HgcAddNoise *)HGObject::operator new(0x1A0uLL);
          HgcAddNoise::HgcAddNoise(v18);
          if (v18) {
            (*(void (**)(HgcAddNoise *))(*(void *)v18 + 16))(v18);
          }
          (*(void (**)(HgcAddNoise *, void, uint64_t))(*(void *)v18 + 120))(v18, 0, v35);
          (*(void (**)(HgcAddNoise *, uint64_t, uint64_t))(*(void *)v18 + 120))(v18, 1, v31);
          if (v12)
          {
            float v21 = v58;
            (*(void (**)(HgcAddNoise *, void, float, float, float, float))(*(void *)v18 + 96))(v18, 0, v21, v21, v21, 1.0);
            v22 = (void (**)(HgcAddNoise *, uint64_t, __n128, float, float, float))(*(void *)v18 + 96);
            v23.n128_u64[0] = 0;
            if (v53) {
              v23.n128_f32[0] = 1.0;
            }
          }
          else
          {
            (*(void (**)(HgcAddNoise *, void, float, float, float, float))(*(void *)v18 + 96))(v18, 0, 1.0, 1.0, 1.0, 1.0);
            v22 = (void (**)(HgcAddNoise *, uint64_t, __n128, float, float, float))(*(void *)v18 + 96);
            v23.n128_u64[0] = 0;
            if ((v53 - 2) < 5) {
              v23.n128_f32[0] = 1.0;
            }
          }
          (*v22)(v18, 1, v23, v23.n128_f32[0], v23.n128_f32[0], v23.n128_f32[0]);
          (*(void (**)(HGHWBlendFlipped *, void, float, double, double, double))(*(void *)v30 + 96))(v30, 0, (float)kBlendConversions[v53], 0.0, 0.0, 0.0);
          v24.n128_u32[1] = HIDWORD(v58);
          v24.n128_f32[0] = v58;
          if (v12) {
            v24.n128_f32[0] = 1.0;
          }
          (*(void (**)(__n128, double, double, double))(*(void *)v30 + 96))(v24, 0.0, 0.0, 0.0);
          float v25 = v58;
          (*(void (**)(HGHWBlendFlipped *, uint64_t, float, double, double, double))(*(void *)v30 + 96))(v30, 1, v25, 0.0, 0.0, 0.0);
          (*(void (**)(HGHWBlendFlipped *, uint64_t, double, double, double, double))(*(void *)v30 + 96))(v30, 2, 0.0, 0.0, 0.0, 0.0);
          if (!a5->var5)
          {
            v26 = (HGColorClamp *)HGObject::operator new(0x1C0uLL);
            HGColorClamp::HGColorClamp(v26);
          }
          (*(void (**)(HGHWBlendFlipped *, void, uint64_t))(*(void *)v30 + 120))(v30, 0, v29);
          (*(void (**)(HGHWBlendFlipped *, uint64_t, HgcAddNoise *))(*(void *)v30 + 120))(v30, 1, v18);
          (*(void (**)(HgcAddNoise *))(*(void *)v18 + 24))(v18);
          (*(void (**)(HgcAddNoise *))(*(void *)v18 + 24))(v18);
        }
        else
        {
          v19 = (HgcAddNoiseNormal *)HGObject::operator new(0x1A0uLL);
          HgcAddNoiseNormal::HgcAddNoiseNormal(v19);
          if (v19) {
            (*(void (**)(HgcAddNoiseNormal *))(*(void *)v19 + 16))(v19);
          }
          (*(void (**)(HgcAddNoiseNormal *, void, uint64_t))(*(void *)v19 + 120))(v19, 0, v35);
          (*(void (**)(HgcAddNoiseNormal *, uint64_t, uint64_t))(*(void *)v19 + 120))(v19, 1, v31);
          float v20 = v58;
          (*(void (**)(HgcAddNoiseNormal *, void, float, float, float, float))(*(void *)v19 + 96))(v19, 0, v20, v20, v20, 1.0);
          (*(void (**)(HGHWBlendFlipped *, void, float, double, double, double))(*(void *)v30 + 96))(v30, 0, (float)kBlendConversions[v53], 0.0, 0.0, 0.0);
          (*(void (**)(HGHWBlendFlipped *, void, float, double, double, double))(*(void *)v30 + 96))(v30, 0, 41.0, 0.0, 0.0, 0.0);
          (*(void (**)(HGHWBlendFlipped *, uint64_t, float, double, double, double))(*(void *)v30 + 96))(v30, 1, 1.0, 0.0, 0.0, 0.0);
          (*(void (**)(HGHWBlendFlipped *, void, HgcAddNoiseNormal *))(*(void *)v30 + 120))(v30, 0, v19);
          (*(void (**)(HgcAddNoiseNormal *))(*(void *)v19 + 24))(v19);
          (*(void (**)(HgcAddNoiseNormal *))(*(void *)v19 + 24))(v19);
        }
        [(PAESharedDefaultBase *)self crop:&v30 fromImage:a4 toImage:a3];
        [a3 setHeliumRef:&v30];
        if (v29) {
          (*(void (**)(uint64_t))(*(void *)v29 + 24))(v29);
        }
        if (v30) {
          (*(void (**)(HGHWBlendFlipped *))(*(void *)v30 + 24))(v30);
        }
        if (v31) {
          (*(void (**)(uint64_t))(*(void *)v31 + 24))(v31);
        }
        if (v35) {
          (*(void (**)(uint64_t))(*(void *)v35 + 24))(v35);
        }
      }
      LOBYTE(v9) = 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
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

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  double v10 = 0.0;
  if (objc_msgSend(-[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4), "getFloatValue:fromParm:atFxTime:", &v10, 1, a3.var1))
  {
    if (v10 == 0.0) {
      uint64_t v6 = 6;
    }
    else {
      uint64_t v6 = 1;
    }
    return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInt:", v6, v10), @"PixelTransformSupport", 0);
  }
  else if (a4)
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = [(PAEFilterDefaultBase *)self getParamErrorFor:NSStringFromClass(v8)];
    id result = 0;
    *a4 = v9;
  }
  else
  {
    return 0;
  }
  return result;
}

@end