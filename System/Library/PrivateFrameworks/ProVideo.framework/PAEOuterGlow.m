@interface PAEOuterGlow
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (PAEOuterGlow)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
@end

@implementation PAEOuterGlow

- (PAEOuterGlow)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEOuterGlow;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
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
  id result = [(PAEFilterDefaultBase *)self getParamAPIWithError:a4];
  if (result)
  {
    id v8 = result;
    double v14 = 0.0;
    if (([result getFloatValue:&v14 fromParm:1 atFxTime:a3.var1] & 1) != 0
      && (char v13 = 0, ([v8 getBoolValue:&v13 fromParm:8 atFxTime:a3.var1] & 1) != 0))
    {
      if (v14 == 0.0 && v13 == 0) {
        uint64_t v10 = 6;
      }
      else {
        uint64_t v10 = 1;
      }
      return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInt:", v10, v14), @"PixelTransformSupport", 0);
    }
    else if (a4)
    {
      v11 = (objc_class *)objc_opt_class();
      id v12 = [(PAEFilterDefaultBase *)self getParamErrorFor:NSStringFromClass(v11)];
      id result = 0;
      *a4 = v12;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)addParameters
{
  v13.receiver = self;
  v13.super_class = (Class)PAEOuterGlow;
  [(PAESharedDefaultBase *)&v13 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  uint64_t v4 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  if (!v5)
  {
    unsigned int v7 = [v4 versionAtCreation];
    id v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"OuterGlow::Radius" value:0 table:0];
    if (v7 >= 2) {
      double v10 = 1000.0;
    }
    else {
      double v10 = 15.0;
    }
    if (v7 >= 2) {
      double v11 = 30.0;
    }
    else {
      double v11 = 15.0;
    }
    [v3 addFloatSliderWithName:v9 parmId:1 defaultValue:0 parameterMin:2.0 parameterMax:0.0 sliderMin:v10 sliderMax:0.0 delta:v11 parmFlags:1.0];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"OuterGlow::Brightness", 0, 0), 2, 0, 15.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"OuterGlow::Inner Color", 0, 0), 3, 0, 1.0, 1.0, 0.0);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"OuterGlow::Outer Color", 0, 0), 4, 0, 1.0, 0.0, 0.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"OuterGlow::Range", 0, 0), 5, 0, 0.25, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"OuterGlow::Horizontal", 0, 0), 6, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"OuterGlow::Vertical", 0, 0), 7, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"OuterGlow::Crop", 0, 0), 8, 0, 33);
  }
  return v6;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  double v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  double v11 = v10;
  if (v10)
  {
    double v21 = 0.0;
    [v10 getFloatValue:&v21 fromParm:1 atFxTime:a6->var0.var1];
    char v20 = 0;
    [v11 getBoolValue:&v20 fromParm:8 atFxTime:a6->var0.var1];
    double v19 = 0.0;
    [v11 getFloatValue:&v19 fromParm:6 atFxTime:a6->var0.var1];
    double v19 = v19 * 0.01;
    double v18 = 0.0;
    [v11 getFloatValue:&v18 fromParm:7 atFxTime:a6->var0.var1];
    unint64_t var0 = a5->var0;
    unint64_t var1 = a5->var1;
    if (v20)
    {
      if (a3) {
        *a3 = var0;
      }
      if (a4) {
LABEL_6:
      }
        *a4 = var1;
    }
    else
    {
      float v15 = v21 * 3.0;
      double v16 = v15;
      unsigned int v17 = vcvtpd_s64_f64(v18 * 0.01 * v16);
      if (a3) {
        *a3 = var0 + (int)(2 * vcvtpd_s64_f64(v19 * v16));
      }
      var1 += (int)(2 * v17);
      if (a4) {
        goto LABEL_6;
      }
    }
  }
  return v11 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v10 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    return 0;
  }
  id v12 = (void *)v10;
  if ([a4 imageType] != 3) {
    return 0;
  }
  double v48 = 0.0;
  [v9 getFloatValue:&v48 fromParm:1 atFxTime:a5->var0.var1];
  if (v48 == 0.0)
  {
    if (a4) {
      objc_msgSend(a4, "heliumRef", v48);
    }
    else {
      double v46 = 0.0;
    }
    [a3 setHeliumRef:&v46];
    if (v46 != 0.0) {
      (*(void (**)(double))(**(void **)&v46 + 24))(COERCE_DOUBLE(*(void *)&v46));
    }
  }
  else
  {
    -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4, v48);
    double v14 = v46;
    double v15 = v47;
    if (v46 <= v47) {
      double v16 = v47;
    }
    else {
      double v16 = v46;
    }
    double v48 = v48 * v16;
    double v45 = 0.0;
    [v9 getFloatValue:&v45 fromParm:6 atFxTime:a5->var0.var1];
    double v45 = v14 / v16 * (v45 * 0.01);
    double v44 = 0.0;
    [v9 getFloatValue:&v44 fromParm:7 atFxTime:a5->var0.var1];
    double v44 = v15 / v16 * (v44 * 0.01);
    double v43 = 0.0;
    [v9 getFloatValue:&v43 fromParm:2 atFxTime:a5->var0.var1];
    double v41 = 0.0;
    double v42 = 0.0;
    double v40 = 0.0;
    [v9 getRedValue:&v42 greenValue:&v41 blueValue:&v40 fromParm:3 atFxTime:a5->var0.var1];
    double v38 = 0.0;
    double v39 = 0.0;
    double v37 = 0.0;
    [v9 getRedValue:&v39 greenValue:&v38 blueValue:&v37 fromParm:4 atFxTime:a5->var0.var1];
    double v36 = 0.0;
    [v9 getFloatValue:&v36 fromParm:5 atFxTime:a5->var0.var1];
    char v35 = 0;
    [v9 getBoolValue:&v35 fromParm:8 atFxTime:a5->var0.var1];
    double v17 = v36;
    if (v36 < 0.00100000005) {
      double v17 = 0.00100000005;
    }
    double v36 = v17;
    double v43 = v43 * 4.0;
    int v18 = [v12 versionAtCreation];
    double v43 = v43 / 12.5;
    if (a4) {
      [a4 heliumRef];
    }
    else {
      uint64_t v34 = 0;
    }
    double v19 = (HGaussianBlur *)HGObject::operator new(0x1B0uLL);
    HGaussianBlur::HGaussianBlur(v19);
    float v20 = v48;
    float v21 = v45;
    float v22 = v44;
    HGaussianBlur::init(v19, v20, v21, v22, v18 == 0, 0, 0);
    (*(void (**)(HGaussianBlur *, void, uint64_t))(*(void *)v19 + 120))(v19, 0, v34);
    (*(void (**)(HGaussianBlur *))(*(void *)v19 + 16))(v19);
    v23 = (HgcOuterGlowColorize *)HGObject::operator new(0x1A0uLL);
    HgcOuterGlowColorize::HgcOuterGlowColorize(v23);
    float v24 = v39;
    float v25 = v38;
    float v26 = v37;
    (*(void (**)(HgcOuterGlowColorize *, void, float, float, float, float))(*(void *)v23 + 96))(v23, 0, v24, v25, v26, 1.0);
    float v27 = v42;
    float v28 = v41;
    float v29 = v40;
    (*(void (**)(HgcOuterGlowColorize *, uint64_t, float, float, float, float))(*(void *)v23 + 96))(v23, 1, v27, v28, v29, 1.0);
    float v30 = v43;
    (*(void (**)(HgcOuterGlowColorize *, uint64_t, float, float, float, float))(*(void *)v23 + 96))(v23, 2, v30, v30, v30, 1.0);
    v31.n128_u64[0] = 0;
    if (v36 > 0.0)
    {
      v31.n128_f64[0] = 1.0 / v36;
      v31.n128_f32[0] = 1.0 / v36;
    }
    (*(void (**)(HgcOuterGlowColorize *, uint64_t, __n128, double, double, double))(*(void *)v23 + 96))(v23, 3, v31, 0.0, 0.0, 0.0);
    (*(void (**)(HgcOuterGlowColorize *, void, HGaussianBlur *))(*(void *)v23 + 120))(v23, 0, v19);
    v32 = (HgcOuterGlowLumaWeight *)HGObject::operator new(0x1A0uLL);
    HgcOuterGlowLumaWeight::HgcOuterGlowLumaWeight(v32);
    v33 = v32;
    (*(void (**)(HgcOuterGlowLumaWeight *, void, double, double, double, float))(*(void *)v32 + 96))(v32, 0, 0.0, 0.0, 0.0, 1.0);
    (*(void (**)(HgcOuterGlowLumaWeight *, void, HgcOuterGlowColorize *))(*(void *)v33 + 120))(v33, 0, v23);
    (*(void (**)(HgcOuterGlowLumaWeight *, uint64_t, uint64_t))(*(void *)v33 + 120))(v33, 1, v34);
    if (v35) {
      [(PAESharedDefaultBase *)self crop:&v33 fromImage:a4 toImage:a3];
    }
    [a3 setHeliumRef:&v33];
    if (v33) {
      (*(void (**)(HgcOuterGlowLumaWeight *))(*(void *)v33 + 24))(v33);
    }
    (*(void (**)(HgcOuterGlowColorize *))(*(void *)v23 + 24))(v23);
    (*(void (**)(HGaussianBlur *))(*(void *)v19 + 24))(v19);
    (*(void (**)(HGaussianBlur *))(*(void *)v19 + 24))(v19);
    if (v34) {
      (*(void (**)(uint64_t))(*(void *)v34 + 24))(v34);
    }
  }
  return 1;
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