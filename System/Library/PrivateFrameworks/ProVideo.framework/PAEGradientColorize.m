@interface PAEGradientColorize
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEGradientColorize)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEGradientColorize

- (PAEGradientColorize)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEGradientColorize;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:1];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:0];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithBool:1];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:65792];
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:590080];
  uint64_t v10 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", &unk_1F11EC238, @"PixelTransformSupport", v3, @"PixelIndependent", v4, @"PositionIndependent", v5, @"MayRemapTime", v6, @"SupportsLargeRenderScale", v7, @"SupportsHeliumRendering", v8, @"SDRWorkingSpace", v9, @"HDRWorkingSpace", v10,
               @"SupportsInternalMixing",
               [NSNumber numberWithUnsignedInteger:1],
               @"AutoColorProcessingSupport",
               0);
}

- (BOOL)addParameters
{
  v10.receiver = self;
  v10.super_class = (Class)PAEGradientColorize;
  [(PAESharedDefaultBase *)&v10 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  uint64_t v4 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121AAA8];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  if (!v5)
  {
    uint64_t v7 = (void *)v4;
    uint64_t v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v7, "addGradientWithName:parmId:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"GradientColorize::Gradient", 0, 0), 2989, 0);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"GradientColorize::Offset", 0, 0), 2, 0, 0.0, 0.0, 3141.59265);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"GradientColorize::Repeats", 0, 0), 3, 0, 1.0, 0.001, 512.0, 1.0, 32.0, 1.0);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"GradientColorize::Repeat Method", 0, 0), 4, 1, objc_msgSend((id)objc_msgSend(v8, "localizedStringForKey:value:table:", @"GradientColorize::Repeat Method Entries", 0, 0), "componentsSeparatedByString:", @"|"), 1);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"GradientColorize::Which Channel", 0, 0), 5, 0, objc_msgSend((id)objc_msgSend(v8, "localizedStringForKey:value:table:", @"GradientColorize::Which Channel Entries", 0, 0), "componentsSeparatedByString:", @"|"), 1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"GradientColorize::Saturation", 0, 0), 6, 0, 1.0, 0.0, 32.0, 0.0, 2.0, 0.1);
  }
  return v6;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  objc_super v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D3D0];
  v11 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F12189D0];
  v12 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v9) {
    BOOL v13 = v10 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13 || v11 == 0 || v12 == 0) {
    return 0;
  }
  int v43 = [v12 versionAtCreation];
  uint64_t v17 = HGRectMake4i(0, 0, 0x100u, 1u);
  uint64_t v19 = v18;
  v20 = (HGBitmap *)HGObject::operator new(0x80uLL);
  HGBitmap::HGBitmap(v20, v17, v19, 28);
  [v10 getGradientSamples:*((void *)v20 + 10) numSamples:256 depth:4 fromParm:2989 atFxTime:a5->var0.var1];
  double v50 = 0.0;
  [v9 getFloatValue:&v50 fromParm:2 atFxTime:a5->var0.var1];
  double v50 = v50 / 6.28318531;
  double v49 = 0.0;
  [v9 getFloatValue:&v49 fromParm:3 atFxTime:a5->var0.var1];
  int v48 = 0;
  [v9 getIntValue:&v48 fromParm:4 atFxTime:a5->var0.var1];
  int v47 = 0;
  [v9 getIntValue:&v47 fromParm:5 atFxTime:a5->var0.var1];
  double v46 = 0.0;
  [v9 getFloatValue:&v46 fromParm:6 atFxTime:a5->var0.var1];
  [v9 mixAmountAtTime:a5->var0.var1];
  double v22 = v21;
  v23 = (double *)objc_msgSend((id)objc_msgSend(v11, "colorMatrixFromDesiredRGBToYCbCrAtTime:", a5->var0.var1), "matrix");
  v24 = v23;
  float v25 = 0.0;
  float v26 = 1.0;
  float v27 = 0.0;
  float v28 = 0.0;
  switch(v47)
  {
    case 0:
      float v26 = *v23;
      float v27 = v23[1];
      float v28 = v23[2];
      break;
    case 1:
      break;
    case 2:
      float v27 = 1.0;
      goto LABEL_19;
    case 3:
      float v28 = 1.0;
      goto LABEL_19;
    case 4:
      float v25 = 1.0;
LABEL_19:
      float v26 = 0.0;
      break;
    default:
      float v25 = 1.0;
      float v26 = 0.0;
      float v27 = 0.0;
      float v28 = 0.0;
      break;
  }
  double v30 = v49;
  double v29 = v50;
  if ([(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1]
    && [a4 imageType] == 3)
  {
    if (a4) {
      [a4 heliumRef];
    }
    else {
      uint64_t v45 = 0;
    }
    v31 = (HGradientColorize *)HGObject::operator new(0x1A0uLL);
    HGradientColorize::HGradientColorize(v31);
    (*(void (**)(HGradientColorize *, void, float, float, float, float))(*(void *)v31 + 96))(v31, 0, v26, v27, v28, v25);
    float v32 = v30;
    float v33 = v29 * v32;
    (*(void (**)(HGradientColorize *, uint64_t, float, float, double, double))(*(void *)v31 + 96))(v31, 1, v32, v33, 0.0, 0.0);
    float v34 = v22;
    (*(void (**)(HGradientColorize *, uint64_t, float, double, double, double))(*(void *)v31 + 96))(v31, 7, v34, 0.0, 0.0, 0.0);
    v35.n128_u32[0] = 1.0;
    if (!v48) {
      v35.n128_f32[0] = -1.0;
    }
    (*(void (**)(HGradientColorize *, uint64_t, __n128, float, float, float))(*(void *)v31 + 96))(v31, 2, v35, v35.n128_f32[0], v35.n128_f32[0], v35.n128_f32[0]);
    (*(void (**)(HGradientColorize *, uint64_t, float, float, double, double))(*(void *)v31 + 96))(v31, 3, 256.0, 255.0, 0.0, 0.0);
    float v36 = v46;
    (*(void (**)(HGradientColorize *, uint64_t, float, float, float, float))(*(void *)v31 + 96))(v31, 4, v36, v36, v36, v36);
    float v37 = *v24;
    float v38 = v24[1];
    float v39 = v24[2];
    (*(void (**)(HGradientColorize *, uint64_t, double, float, float, float))(*(void *)v31 + 96))(v31, 5, 0.0, v37, v38, v39);
    v40.n128_u32[0] = 1.0;
    if (v43 >= 2) {
      v40.n128_f32[0] = 0.0;
    }
    (*(void (**)(HGradientColorize *, uint64_t, __n128, double, double, double))(*(void *)v31 + 96))(v31, 6, v40, 0.0, 0.0, 0.0);
    v41 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
    HGBitmapLoader::HGBitmapLoader(v41, v20);
    (*(void (**)(HGradientColorize *, void, uint64_t))(*(void *)v31 + 120))(v31, 0, v45);
    (*(void (**)(HGradientColorize *, uint64_t, HGBitmapLoader *))(*(void *)v31 + 120))(v31, 1, v41);
    v44 = v31;
    (*(void (**)(HGradientColorize *))(*(void *)v31 + 16))(v31);
    [a3 setHeliumRef:&v44];
    if (v44) {
      (*(void (**)(HGradientColorize *))(*(void *)v44 + 24))(v44);
    }
    if (v41) {
      (*(void (**)(HGBitmapLoader *))(*(void *)v41 + 24))(v41);
    }
    (*(void (**)(HGradientColorize *))(*(void *)v31 + 24))(v31);
    if (v45) {
      (*(void (**)(uint64_t))(*(void *)v45 + 24))(v45);
    }
    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = 0;
  }
  (*(void (**)(HGBitmap *))(*(void *)v20 + 24))(v20);
  return v16;
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