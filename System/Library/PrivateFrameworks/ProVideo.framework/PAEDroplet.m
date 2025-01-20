@interface PAEDroplet
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (PAEDroplet)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEDroplet

- (PAEDroplet)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEDroplet;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:0];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithBool:0];
  uint64_t v8 = [NSNumber numberWithInt:3];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", v7, @"InputSizeLimit", v8, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v13.receiver = self;
  v13.super_class = (Class)PAEDroplet;
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
    uint64_t v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Droplet::Center", 0, 0), 1, 0, 0.5, 0.5);
    uint64_t v9 = [v8 localizedStringForKey:@"Droplet::Radius" value:0 table:0];
    if (v7 >= 2) {
      double v10 = 2000.0;
    }
    else {
      double v10 = 100.0;
    }
    if (v7 >= 2) {
      double v11 = 200.0;
    }
    else {
      double v11 = 100.0;
    }
    [v3 addFloatSliderWithName:v9 parmId:2 defaultValue:0 parameterMin:300.0 parameterMax:-50.0 sliderMin:dbl_1B7E74BE0[v7 < 2] sliderMax:-50.0 delta:dbl_1B7E74BF0[v7 < 2] parmFlags:1.0];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Droplet::Width", 0, 0), 4, 0, 40.0, 0.0, v10, 0.0, v11, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Droplet::Height", 0, 0), 3, 0, 30.0, -50.0, 50.0, -50.0, 50.0, 1.0);
    if (v7) {
      objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Droplet::Crop", 0, 0), 5, 0, 33);
    }
  }
  return v6;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  double v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  char v16 = 0;
  [v10 getBoolValue:&v16 fromParm:5 atFxTime:a6->var0.var1];
  if (v16)
  {
    *a3 = a5->var0;
    unint64_t var1 = a5->var1;
  }
  else
  {
    double v15 = 30.0;
    [v10 getFloatValue:&v15 fromParm:3 atFxTime:a6->var0.var1];
    double v12 = fabs(v15);
    double v13 = v12 + v12;
    *a3 = (unint64_t)(v13 + (double)a5->var0);
    unint64_t var1 = (unint64_t)(v13 + (double)a5->var1);
  }
  *a4 = var1;
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v9)
  {
    double v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
    BOOL v11 = v10 && [v10 versionAtCreation] == 0;
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
    [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
    __asm { FMOV            V0.2D, #0.5 }
    v27[0] = _Q0;
    [v9 getXValue:v27 YValue:(char *)v27 + 8 fromParm:1 atFxTime:a5->var0.var1];
    [(PAESharedDefaultBase *)self convertRelativeToImageCoordinates:v27 withImage:a4];
    v26[4] = v27[13];
    v26[5] = v27[14];
    v26[6] = v27[15];
    v26[7] = v27[16];
    v27[0] = v26[0];
    v26[0] = v27[9];
    v26[1] = v27[10];
    v26[2] = v27[11];
    v26[3] = v27[12];
    v25[4] = (float64x2_t)v27[5];
    v25[5] = (float64x2_t)v27[6];
    v25[6] = (float64x2_t)v27[7];
    v25[7] = (float64x2_t)v27[8];
    v25[0] = (float64x2_t)v27[1];
    v25[1] = (float64x2_t)v27[2];
    v25[2] = (float64x2_t)v27[3];
    v25[3] = (float64x2_t)v27[4];
    PCMatrix44Tmpl<double>::rightTranslate((double *)v26, *(double *)v27, *((double *)v27 + 1), 0.0);
    v17.f64[0] = -*(double *)v27;
    uint64_t v24 = 0x4072C00000000000;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v24, 2, a5->var0.var1, PCMatrix44Tmpl<double>::leftTranslate(v25, v17, -*((double *)v27 + 1), 0.0).f64[0]);
    double v23 = 40.0;
    [v9 getFloatValue:&v23 fromParm:4 atFxTime:a5->var0.var1];
    double v22 = 30.0;
    [v9 getFloatValue:&v22 fromParm:3 atFxTime:a5->var0.var1];
    if ([(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1])
    {
      if ([a4 imageType] == 3)
      {
        if (a4) {
          [a4 heliumRef];
        }
        else {
          uint64_t v21 = 0;
        }
        char v20 = 1;
        if (!v11) {
          [v9 getBoolValue:&v20 fromParm:5 atFxTime:a5->var0.var1];
        }
        if (v23 > 0.0)
        {
          v18 = (HDroplet *)HGObject::operator new(0x2C0uLL);
          HDroplet::HDroplet(v18);
        }
        objc_msgSend(a3, "setHeliumRef:", &v21, v23);
        if (v21) {
          (*(void (**)(uint64_t))(*(void *)v21 + 24))(v21);
        }
      }
    }
  }
  return v9 != 0;
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