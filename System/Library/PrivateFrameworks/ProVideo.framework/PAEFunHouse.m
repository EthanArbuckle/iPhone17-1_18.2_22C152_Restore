@interface PAEFunHouse
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEFunHouse)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEFunHouse

- (PAEFunHouse)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEFunHouse;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v10.receiver = self;
  v10.super_class = (Class)PAEFunHouse;
  [(PAESharedDefaultBase *)&v10 addParameters];
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
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"FunHouse::Center", 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"FunHouse::Width", 0, 0), 2, 0, 400.0, 1.0, dbl_1B7E74A60[v7 == 0], 1.0, dbl_1B7E73F60[v7 == 0], 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"FunHouse::Amount", 0, 0), 3, 0, 3.0, 1.0, 100.0, 1.0, 100.0, 1.0);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"FunHouse::Angle", 0, 0), 4, 0, 0.0, -360.0, 360.0);
  }
  return v6;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v9)
  {
    objc_super v10 = (void *)v9;
    [(PAESharedDefaultBase *)self getScaleForImage:a4];
    uint64_t v17 = 0x3FE0000000000000;
    uint64_t v18 = 0x3FE0000000000000;
    [v10 getXValue:&v18 YValue:&v17 fromParm:1 atFxTime:a5->var0.var1];
    uint64_t v16 = 0;
    [v10 getFloatValue:&v16 fromParm:2 atFxTime:a5->var0.var1];
    uint64_t v15 = 0;
    [v10 getFloatValue:&v15 fromParm:3 atFxTime:a5->var0.var1];
    double v14 = 30.0;
    [v10 getFloatValue:&v14 fromParm:4 atFxTime:a5->var0.var1];
    int v11 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
    __sincos_stret(v14);
    if (v11 && [a3 imageType] == 3)
    {
      v12 = (HFunHouse *)HGObject::operator new(0x1B0uLL);
      HFunHouse::HFunHouse(v12);
    }
    LOBYTE(v9) = 0;
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