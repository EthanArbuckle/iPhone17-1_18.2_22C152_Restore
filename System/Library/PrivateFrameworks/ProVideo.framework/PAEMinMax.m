@interface PAEMinMax
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEMinMax)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
- (void)dealloc;
@end

@implementation PAEMinMax

- (PAEMinMax)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEMinMax;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAEMinMax;
  [(PAESharedDefaultBase *)&v2 dealloc];
}

- (id)properties
{
  objc_super v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithBool:0];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", v7, @"InputSizeLimit", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  double v10 = 0.0;
  if (objc_msgSend(-[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4), "getFloatValue:fromParm:atFxTime:", &v10, 2, a3.var1))
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
    v8 = (objc_class *)objc_opt_class();
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

- (BOOL)addParameters
{
  v11.receiver = self;
  v11.super_class = (Class)PAEMinMax;
  [(PAESharedDefaultBase *)&v11 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  uint64_t v4 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v4) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  if (!v5)
  {
    if ([v4 versionAtCreation] >= 2) {
      uint64_t v7 = 250;
    }
    else {
      uint64_t v7 = 1000;
    }
    v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"MinMax::Mode", 0, 0), 1, 0, objc_msgSend((id)objc_msgSend(v8, "localizedStringForKey:value:table:", @"MinMax::ModeEntries", 0, 0), "componentsSeparatedByString:", @"|"), 1);
    LODWORD(v10) = 0;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"MinMax::Radius", 0, 0), 2, 0, 0, v7, 0, 0x100000064, v10);
  }
  return v6;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  id v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
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
  [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
  double v13 = v30[0];
  double v14 = v30[5];
  uint64_t v29 = 0;
  [v9 getIntValue:(char *)&v29 + 4 fromParm:1 atFxTime:a5->var0.var1];
  [v9 getIntValue:&v29 fromParm:2 atFxTime:a5->var0.var1];
  int v15 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  if (!v15 || [a4 imageType] != 3) {
    return 0;
  }
  if (a4) {
    [a4 heliumRef];
  }
  else {
    float32x2_t v28 = 0;
  }
  BOOL v12 = v29 == 0;
  if (!v29)
  {
    [a3 setHeliumRef:&v28];
    BOOL v16 = 0;
    goto LABEL_24;
  }
  [(PAESharedDefaultBase *)self getImageBoundary:a4];
  v27[0] = vcvtq_f64_f32(v26[0]);
  v27[1] = vcvtq_f64_f32(v26[1]);
  BOOL v16 = PCMatrix44Tmpl<double>::transformRect<double>(v30, (double *)v27, (uint64_t)v27);
  if (!v16)
  {
LABEL_24:
    int v19 = 1;
    goto LABEL_32;
  }
  float32x2_t v25 = v28;
  if (v28) {
    (*(void (**)(float32x2_t))(**(void **)&v28 + 16))(v28);
  }
  [(PAESharedDefaultBase *)self changeDOD:&v25 withRect:v27];
  float32x2_t v18 = v26[0];
  if (*(void *)&v28 == *(void *)v26)
  {
    if (v28) {
      (*(void (**)(void))(**(void **)&v28 + 24))();
    }
  }
  else
  {
    if (v28)
    {
      (*(void (**)(void))(**(void **)&v28 + 24))();
      float32x2_t v18 = v26[0];
    }
    float32x2_t v28 = v18;
    v26[0] = 0;
  }
  if (v25) {
    (*(void (**)(float32x2_t))(**(void **)&v25 + 24))(v25);
  }
  v20 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
  HGTextureWrap::HGTextureWrap(v20);
  (*(void (**)(HGTextureWrap *, void, float32x2_t))(*(void *)v20 + 120))(v20, 0, v28);
  HGTextureWrap::SetTextureWrapMode((uint64_t)v20, (const char *)1, v21);
  v22 = (HGMinMax *)HGObject::operator new(0x1C0uLL);
  HGMinMax::HGMinMax(v22);
  (*(void (**)(HGMinMax *, void, HGTextureWrap *))(*(void *)v22 + 120))(v22, 0, v20);
  (*(void (**)(HGMinMax *, void, float, double, double, double))(*(void *)v22 + 96))(v22, 0, (float)SHIDWORD(v29), 0.0, 0.0, 0.0);
  double v23 = (float)(int)v29;
  float v24 = v13 * v23;
  *(float *)&double v23 = v14 * v23;
  (*(void (**)(HGMinMax *, uint64_t, float, float, double, double))(*(void *)v22 + 96))(v22, 1, v24, *(float *)&v23, 0.0, 0.0);
  v26[0] = (float32x2_t)v22;
  (*(void (**)(HGMinMax *))(*(void *)v22 + 16))(v22);
  [(PAESharedDefaultBase *)self crop:v26 fromImage:a4 toImage:a3];
  [a3 setHeliumRef:v26];
  if (v26[0]) {
    (*(void (**)(void))(**(void **)v26 + 24))(*(void *)v26);
  }
  (*(void (**)(HGMinMax *))(*(void *)v22 + 24))(v22);
  (*(void (**)(HGTextureWrap *))(*(void *)v20 + 24))(v20);
  int v19 = 0;
LABEL_32:
  if (v28) {
    (*(void (**)(float32x2_t))(**(void **)&v28 + 24))(v28);
  }
  if (!v19) {
    return v16;
  }
  return v12;
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