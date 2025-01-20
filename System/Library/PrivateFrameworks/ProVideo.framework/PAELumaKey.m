@interface PAELumaKey
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAELumaKey)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAELumaKey

- (PAELumaKey)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAELumaKey;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:1];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", &unk_1F11EC2E0, @"PixelTransformSupport", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAELumaKey;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"LumaKey::Key Mode", 0, 0), 1, 0, objc_msgSend((id)objc_msgSend(v4, "localizedStringForKey:value:table:", @"LumaKey::ModeEntries", 0, 0), "componentsSeparatedByString:", @"|"), 1);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"LumaKey::Luminance Type", 0, 0), 2, 0, objc_msgSend((id)objc_msgSend(v4, "localizedStringForKey:value:table:", @"LumaKey::TypeEntries", 0, 0), "componentsSeparatedByString:", @"|"), 1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"LumaKey::Threshold", 0, 0), 3, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"LumaKey::Tolerance", 0, 0), 4, 0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.01);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  v10 = v9;
  if (v9)
  {
    double v44 = 0.0;
    uint64_t v45 = 0;
    double v43 = 0.0;
    [v9 getIntValue:&v45 fromParm:1 atFxTime:a5->var0.var1];
    [v10 getIntValue:(char *)&v45 + 4 fromParm:2 atFxTime:a5->var0.var1];
    [v10 getFloatValue:&v43 fromParm:3 atFxTime:a5->var0.var1];
    [v10 getFloatValue:&v44 fromParm:4 atFxTime:a5->var0.var1];
    if (HIDWORD(v45) >= 6)
    {
      PCPrint("File %s, line %d should not have been reached:\n\t", v11, v12, v13, v14, v15, v16, v17, (char)"/Library/Caches/com.apple.xbs/Sources/FiltersiOS/Filters/PAELumaKey.mm");
      pcAbortImpl();
    }
    float v18 = flt_1B7E74C94[SHIDWORD(v45)];
    float v19 = flt_1B7E74CAC[SHIDWORD(v45)];
    float v20 = flt_1B7E74CC4[SHIDWORD(v45)];
    int v21 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
    if (v21 && [a4 imageType] == 3)
    {
      v22 = (HgcLumaKey *)HGObject::operator new(0x1A0uLL);
      HgcLumaKey::HgcLumaKey(v22);
      v42 = v22;
      double v23 = v43 * 0.25 + 0.25;
      double v24 = v44 * (0.25 - vabdd_f64(0.25, v23));
      double v25 = v23 - v24;
      double v26 = v23 + v24;
      double v27 = v43 * 0.5 + 0.5;
      double v28 = v44 * (0.5 - vabdd_f64(0.5, v27));
      double v29 = v27 - v28;
      double v30 = v27 + v28;
      if ((int)v45 <= 1) {
        double v31 = v29;
      }
      else {
        double v31 = v25;
      }
      if ((int)v45 <= 1) {
        double v32 = v30;
      }
      else {
        double v32 = v26;
      }
      (*(void (**)(HgcLumaKey *, void, float, float, float, double))(*(void *)v22 + 96))(v22, 0, v18, v19, v20, 0.0);
      v36.n128_u32[0] = 1.0;
      if (v45 == 1) {
        v33.n128_f32[0] = 1.0;
      }
      else {
        v33.n128_f32[0] = 0.0;
      }
      if (v45) {
        v34.n128_f32[0] = 0.0;
      }
      else {
        v34.n128_f32[0] = 1.0;
      }
      if (v45 == 2) {
        v35.n128_f32[0] = 1.0;
      }
      else {
        v35.n128_f32[0] = 0.0;
      }
      if (v45 != 3) {
        v36.n128_f32[0] = 0.0;
      }
      (*(void (**)(HgcLumaKey *, uint64_t, __n128, __n128, __n128, __n128))(*(void *)v22 + 96))(v22, 1, v33, v34, v35, v36);
      float v37 = v31;
      float v38 = v32;
      (*(void (**)(HgcLumaKey *, uint64_t, float, float, double, double))(*(void *)v22 + 96))(v22, 2, v37, v38, 0.0, 0.0);
      if (a4)
      {
        [a4 heliumRef];
        uint64_t v39 = v41;
      }
      else
      {
        uint64_t v39 = 0;
        uint64_t v41 = 0;
      }
      (*(void (**)(HgcLumaKey *, void, uint64_t))(*(void *)v22 + 120))(v22, 0, v39);
      if (v41) {
        (*(void (**)(uint64_t))(*(void *)v41 + 24))(v41);
      }
      [a3 setHeliumRef:&v42];
      if (v42) {
        (*(void (**)(HgcLumaKey *))(*(void *)v42 + 24))(v42);
      }
    }
  }
  return v10 != 0;
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