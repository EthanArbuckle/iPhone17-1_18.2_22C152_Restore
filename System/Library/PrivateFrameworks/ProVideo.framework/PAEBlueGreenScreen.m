@interface PAEBlueGreenScreen
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEBlueGreenScreen)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEBlueGreenScreen

- (PAEBlueGreenScreen)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEBlueGreenScreen;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:1];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:0];
  uint64_t v6 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", &unk_1F11EC310, @"PixelTransformSupport", v3, @"PositionIndependent", v4, @"SupportsHeliumRendering", v5, @"MayRemapTime", v6, @"SupportsLargeRenderScale", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEBlueGreenScreen;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"BlueGreenScreen::Key Mode", 0, 0), 1, 0, objc_msgSend((id)objc_msgSend(v4, "localizedStringForKey:value:table:", @"BlueGreenScreen::Mode Entries", 0, 0), "componentsSeparatedByString:", @"|"), 1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"BlueGreenScreen::Color Level", 0, 0), 2, 0, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"BlueGreenScreen::Color Tolerance", 0, 0), 3, 0, 10.0, 1.0, 100.0, 1.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"BlueGreenScreen::Edge Thin", 0, 0), 4, 0, 0.0, -100.0, 100.0, -100.0, 100.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"BlueGreenScreen::Invert Alpha", 0, 0), 6, 0, 1);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (!v9)
  {
LABEL_22:
    LOBYTE(v14) = 1;
    return v14;
  }
  v10 = v9;
  int v28 = 0;
  double v26 = 0.0;
  double v27 = 0.0;
  double v25 = 0.0;
  char v24 = 0;
  [v9 getIntValue:&v28 fromParm:1 atFxTime:a5->var0.var1];
  [v10 getFloatValue:&v27 fromParm:2 atFxTime:a5->var0.var1];
  [v10 getFloatValue:&v26 fromParm:3 atFxTime:a5->var0.var1];
  [v10 getFloatValue:&v25 fromParm:4 atFxTime:a5->var0.var1];
  [v10 getBoolValue:&v24 fromParm:6 atFxTime:a5->var0.var1];
  double v12 = v26;
  double v11 = v27;
  double v13 = v25;
  int v14 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  if (v14)
  {
    if ([a4 imageType] == 3)
    {
      if (a4) {
        [a4 heliumRef];
      }
      else {
        uint64_t v23 = 0;
      }
      v22 = 0;
      if (v28 == 2)
      {
        v15 = (HgcDiffScreen *)HGObject::operator new(0x1A0uLL);
        HgcDiffScreen::HgcDiffScreen(v15);
      }
      else if (v28 == 1)
      {
        v15 = (HgcDiffScreen *)HGObject::operator new(0x1A0uLL);
        HgcGreenScreen::HgcGreenScreen(v15);
      }
      else
      {
        v15 = 0;
        if (v28)
        {
LABEL_16:
          (*(void (**)(HgcDiffScreen *, void, uint64_t))(*(void *)v15 + 120))(v15, 0, v23);
          float v16 = (v11 - v12) / 100.0;
          (*(void (**)(HgcDiffScreen *, void, float, float, float, float))(*(void *)v15 + 96))(v15, 0, v16, v16, v16, v16);
          float v17 = (v11 + v12) / 100.0;
          (*(void (**)(HgcDiffScreen *, uint64_t, float, float, float, float))(*(void *)v15 + 96))(v15, 1, v17, v17, v17, v17);
          float v18 = v13 * 0.5 / 100.0 + 0.5;
          float v19 = 0.5 - vabdd_f64(0.5, v18);
          (*(void (**)(HgcDiffScreen *, uint64_t, float, float, float, float))(*(void *)v15 + 96))(v15, 2, v18 - v19, v18 - v19, v18 - v19, v18 - v19);
          (*(void (**)(HgcDiffScreen *, uint64_t, float, float, float, float))(*(void *)v15 + 96))(v15, 3, v18 + v19, v18 + v19, v18 + v19, v18 + v19);
          v20.n128_u64[0] = 0;
          if (v24) {
            v20.n128_f32[0] = 1.0;
          }
          (*(void (**)(HgcDiffScreen *, uint64_t, __n128, float, float, float))(*(void *)v15 + 96))(v15, 4, v20, v20.n128_f32[0], v20.n128_f32[0], v20.n128_f32[0]);
          [a3 setHeliumRef:&v22];
          if (v22) {
            (*(void (**)(HgcDiffScreen *))(*(void *)v22 + 24))(v22);
          }
          if (v23) {
            (*(void (**)(uint64_t))(*(void *)v23 + 24))(v23);
          }
          goto LABEL_22;
        }
        v15 = (HgcDiffScreen *)HGObject::operator new(0x1A0uLL);
        HgcBlueScreen::HgcBlueScreen(v15);
      }
      if (v15) {
        v22 = v15;
      }
      goto LABEL_16;
    }
    LOBYTE(v14) = 0;
  }
  return v14;
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