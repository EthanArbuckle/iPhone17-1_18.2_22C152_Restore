@interface PAEInverseToneMap
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEInverseToneMap)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEInverseToneMap

- (PAEInverseToneMap)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEInverseToneMap;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  if (-[PAEInverseToneMap properties]::once != -1) {
    dispatch_once(&-[PAEInverseToneMap properties]::once, &__block_literal_global_36);
  }
  return (id)-[PAEInverseToneMap properties]::sPropertiesDict;
}

uint64_t __31__PAEInverseToneMap_properties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v1 = [NSNumber numberWithBool:1];
  uint64_t v2 = [NSNumber numberWithBool:1];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:67584];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:591872];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:3];
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", MEMORY[0x1E4F1CC38], @"PixelIndependent", v1, @"PixelIndependent", v2, @"PositionIndependent", v3, @"MayRemapTime", v4, @"SupportsLargeRenderScale", v5, @"SupportsHeliumRendering", v6, @"SDRWorkingSpace", v7, @"HDRWorkingSpace", v8,
             @"AutoColorProcessingSupport",
             0);
  -[PAEInverseToneMap properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEInverseToneMap;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"PAE_ITM::Gamma", 0, 0), 1, 0, 0.699999988, 0.0, 2.0, 0.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"PAE_ITM::Max", 0, 0), 2, 0, 12.0, 0.0, 100.0, 0.0, 12.0, 0.1);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v8 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  v9 = v8;
  if (v8)
  {
    double v16 = 0.0;
    double v17 = 0.0;
    [v8 getFloatValue:&v17 fromParm:1 atFxTime:a5->var0.var1];
    [v9 getFloatValue:&v16 fromParm:2 atFxTime:a5->var0.var1];
    if (a4) {
      [a4 heliumRef];
    }
    else {
      uint64_t v15 = 0;
    }
    float v10 = v17;
    float v11 = v16;
    FxApplyInverseSimpleToneCurve(&v15, &v14, v10, v11);
    uint64_t v12 = v14;
    if (v15 == v14)
    {
      if (v15) {
        (*(void (**)(void))(*(void *)v15 + 24))();
      }
    }
    else
    {
      if (v15)
      {
        (*(void (**)(void))(*(void *)v15 + 24))();
        uint64_t v12 = v14;
      }
      uint64_t v15 = v12;
    }
    [a3 setHeliumRef:&v15];
    if (v15) {
      (*(void (**)(uint64_t))(*(void *)v15 + 24))(v15);
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