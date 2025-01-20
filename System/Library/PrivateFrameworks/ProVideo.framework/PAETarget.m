@interface PAETarget
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAETarget)initWithAPIManager:(id)a3;
- (id)properties;
- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4;
@end

@implementation PAETarget

- (PAETarget)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAETarget;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithBool:0];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", v7, @"InputSizeLimit", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAETarget;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3 | [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208])
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend((id)v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Target::Center", 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend((id)v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Target::Angle", 0, 0), 2, 0, 22.5, 0.0, 6.28318531);
    objc_msgSend((id)v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Target::Crop", 0, 0), 3, 1, 33);
  }
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v8 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
LABEL_17:
    LOBYTE(v16) = 0;
    return v16;
  }
  [v9 versionAtCreation];
  unint64_t v11 = [a4 width];
  unint64_t v12 = [a4 height];
  var1 = a5->var0.var1;
  double v21 = 0.0;
  double v22 = 0.0;
  [v8 getXValue:&v22 YValue:&v21 fromParm:1 atFxTime:var1];
  double v14 = v22;
  double v15 = -1.0;
  if (v22 < -1.0) {
    double v14 = -1.0;
  }
  if (v14 > 2.0) {
    double v14 = 2.0;
  }
  if (v21 >= -1.0) {
    double v15 = v21;
  }
  if (v15 > 2.0) {
    double v15 = 2.0;
  }
  double v21 = v15 * (double)v12;
  double v22 = v14 * (double)v11;
  double v20 = 0.0;
  [v8 getFloatValue:&v20 fromParm:2 atFxTime:var1];
  char v19 = 0;
  [v8 getBoolValue:&v19 fromParm:3 atFxTime:var1];
  [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
  __sincos_stret(v20);
  int v16 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  if (v16)
  {
    if ([a4 imageType] == 3)
    {
      if (a4) {
        [a4 heliumRef];
      }
      v17 = (HgcTarget *)HGObject::operator new(0x1C0uLL);
      HgcTarget::HgcTarget(v17);
    }
    goto LABEL_17;
  }
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