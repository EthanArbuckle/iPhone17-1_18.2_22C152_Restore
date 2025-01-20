@interface PAEInsectEye
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEInsectEye)initWithAPIManager:(id)a3;
- (id)properties;
- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4;
@end

@implementation PAEInsectEye

- (PAEInsectEye)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEInsectEye;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", v7, @"InputSizeLimit", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)addParameters
{
  v15.receiver = self;
  v15.super_class = (Class)PAEInsectEye;
  [(PAESharedDefaultBase *)&v15 addParameters];
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
    int v7 = [v4 versionAtCreation];
    v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"InsectEye::Size" value:0 table:0];
    double v10 = 64.0;
    if (v7)
    {
      double v10 = 128.0;
      double v11 = 2048.0;
    }
    else
    {
      double v11 = 512.0;
    }
    if (v7) {
      double v12 = 512.0;
    }
    else {
      double v12 = 128.0;
    }
    if (v7) {
      double v13 = 32.0;
    }
    else {
      double v13 = 8.0;
    }
    [v3 addFloatSliderWithName:v9 parmId:1 defaultValue:0 parameterMin:v10 parameterMax:4.0 sliderMin:v11 sliderMax:8.0 delta:v12 parmFlags:1.0];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"InsectEye::Refraction", 0, 0), 2, 0, 2.0, 0.0, 10.0, 0.0, 4.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"InsectEye::Border", 0, 0), 3, 0, 1.0, 0.0, v11, 0.0, v13, 1.0);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"InsectEye::Border Color", 0, 0), 4, 0, 0.0, 0.0, 0.0);
  }
  return v6;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v9)
  {
    double v10 = (void *)v9;
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a3];
    double v11 = fabs(v36[0]);
    [a4 width];
    [a4 height];
    double v35 = 0.0;
    [v10 getFloatValue:&v35 fromParm:1 atFxTime:a5->var0.var1];
    double v35 = v11 * v35;
    double v34 = 0.0;
    [v10 getFloatValue:&v34 fromParm:2 atFxTime:a5->var0.var1];
    uint64_t v33 = 0;
    [v10 getFloatValue:&v33 fromParm:3 atFxTime:a5->var0.var1];
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v30 = 0;
    [v10 getRedValue:&v32 greenValue:&v31 blueValue:&v30 fromParm:4 atFxTime:a5->var0.var1];
    LODWORD(v9) = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
    if (v9)
    {
      if ([a4 imageType] == 3)
      {
        if (a4) {
          [a4 heliumRef];
        }
        else {
          uint64_t v29 = 0;
        }
        [a4 bounds];
        v27.f64[0] = v12;
        v27.f64[1] = v13;
        v28.f64[0] = v14;
        v28.f64[1] = v15;
        PCMatrix44Tmpl<double>::transformRect<double>(v36, v27.f64, (uint64_t)&v27);
        if (v34 < 1.0)
        {
          uint64_t v25 = v29;
          if (v29) {
            (*(void (**)(uint64_t))(*(void *)v29 + 16))(v29);
          }
          [(PAESharedDefaultBase *)self smear:&v25 fromImage:a4 toImage:a4];
          uint64_t v16 = v26;
          if (v29 == v26)
          {
            if (v29) {
              (*(void (**)(void))(*(void *)v29 + 24))();
            }
          }
          else
          {
            if (v29)
            {
              (*(void (**)(void))(*(void *)v29 + 24))();
              uint64_t v16 = v26;
            }
            uint64_t v29 = v16;
            uint64_t v26 = 0;
          }
          if (v25) {
            (*(void (**)(uint64_t))(*(void *)v25 + 24))(v25);
          }
          __asm
          {
            FMOV            V0.2D, #0.5
            FMOV            V1.2D, #-1.0
          }
          float64x2_t v27 = vaddq_f64(v27, _Q0);
          float64x2_t v28 = vaddq_f64(v28, _Q1);
          v23 = (HInsectEye_Base *)HGObject::operator new(0x1A0uLL);
          HInsectEye_Base::HInsectEye_Base(v23);
        }
        Fx_smearToRect();
      }
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

@end