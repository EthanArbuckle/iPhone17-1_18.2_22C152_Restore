@interface PAEBrightness
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)parameterChanged:(unsigned int)a3;
- (PAEBrightness)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEBrightness

- (PAEBrightness)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEBrightness;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  if (-[PAEBrightness properties]::once != -1) {
    dispatch_once(&-[PAEBrightness properties]::once, &__block_literal_global_40);
  }
  return (id)-[PAEBrightness properties]::sPropertiesDict;
}

uint64_t __27__PAEBrightness_properties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v1 = [NSNumber numberWithInt:6];
  uint64_t v2 = [NSNumber numberWithBool:1];
  uint64_t v3 = [NSNumber numberWithBool:1];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:67584];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:591872];
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, @"PixelTransformSupport", v2, @"PixelIndependent", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", v7, @"SDRWorkingSpace", v8, @"HDRWorkingSpace", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1),
             @"AutoColorProcessingSupport",
             0);
  -[PAEBrightness properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  v5.receiver = self;
  v5.super_class = (Class)PAEBrightness;
  [(PAESharedDefaultBase *)&v5 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3) {
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Brightness::Brightness", 0, 0), 1, 0, 1.0, 0.0, 1000.0, 0.0, 5.0, 0.1);
  }
  return v3 != 0;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v8 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (!v8) {
    return 0;
  }
  uint64_t v15 = 0;
  [v8 getFloatValue:&v15 fromParm:1 atFxTime:a5->var0.var1];
  int v9 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  uint64_t v10 = [a4 imageType];
  if (v9) {
    BOOL v11 = v10 == 3;
  }
  else {
    BOOL v11 = 0;
  }
  BOOL v12 = v11;
  if (v11)
  {
    if (a4) {
      [a4 heliumRef];
    }
    v13 = (HGColorMatrix *)HGObject::operator new(0x1F0uLL);
    HGColorMatrix::HGColorMatrix(v13);
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