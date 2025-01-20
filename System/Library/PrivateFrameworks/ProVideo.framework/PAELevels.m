@interface PAELevels
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAELevels)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAELevels

- (PAELevels)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAELevels;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  unsigned int v2 = objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1F121E208), "versionAtCreation");
  if (v2 <= 2) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 3;
  }
  uint64_t v4 = [NSNumber numberWithInteger:v3];
  if (v2 <= 1) {
    uint64_t v5 = 590080;
  }
  else {
    uint64_t v5 = 593920;
  }
  v15 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v6 = [NSNumber numberWithInt:6];
  uint64_t v7 = [NSNumber numberWithBool:1];
  uint64_t v8 = [NSNumber numberWithBool:1];
  uint64_t v9 = [NSNumber numberWithBool:0];
  uint64_t v10 = [NSNumber numberWithBool:1];
  uint64_t v11 = [NSNumber numberWithBool:1];
  uint64_t v12 = [NSNumber numberWithUnsignedInteger:65792];
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:v5];
  return (id)objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v6, @"PixelTransformSupport", v7, @"PixelIndependent", v8, @"PositionIndependent", v9, @"MayRemapTime", v10, @"SupportsLargeRenderScale", v11, @"SupportsHeliumRendering", v12, @"SDRWorkingSpace", v13, @"HDRWorkingSpace", objc_msgSend(NSNumber, "numberWithBool:", 1),
               @"SupportsInternalMixing",
               v4,
               @"AutoColorProcessingSupport",
               0);
}

- (BOOL)addParameters
{
  v8.receiver = self;
  v8.super_class = (Class)PAELevels;
  [(PAESharedDefaultBase *)&v8 addParameters];
  uint64_t v3 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121AAA8];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (void *)v3;
  uint64_t v5 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v6 = objc_msgSend(v4, "addHistogramWithName:parmId:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Levels::Histogram", 0, 0), 1, 0);
  objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Levels::HDR In Rec. 709", 0, 0), 2, 0, 2);
  return v6;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v30[21] = *MEMORY[0x1E4F143B8];
  objc_super v8 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D3D0];
  uint64_t v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F12189D0];
  uint64_t v10 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11 || v10 == 0)
  {
LABEL_20:
    LOBYTE(v19) = 0;
    return v19;
  }
  v24 = self;
  uint64_t v29 = 0;
  v30[0] = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  double v26 = 0.0;
  [v8 mixAmountAtTime:a5->var0.var1];
  LODWORD(v22) = 1;
  [v8 getHistogramBlackIn:v30 BlackOut:&v29 WhiteIn:&v28 WhiteOut:&v27 Gamma:&v26 forChannel:0 fromParm:v22 atFxTime:a5->var0.var1];
  uint64_t v13 = 0;
  if (v26 >= 0.001) {
    double v14 = 1.0 / v26;
  }
  else {
    double v14 = 1000.0;
  }
  double v26 = v14;
  uint64_t v15 = 1;
  do
  {
    v16 = (double *)&v30[v13 + 1];
    LODWORD(v23) = 1;
    [v8 getHistogramBlackIn:&v30[v13 + 17] BlackOut:&v30[v13 + 13] WhiteIn:&v30[v13 + 9] WhiteOut:&v30[v13 + 5] Gamma:&v30[v13 + 1] forChannel:v15 fromParm:v23 atFxTime:a5->var0.var1];
    if (*(double *)&v30[v13 + 1] >= 0.001) {
      double v17 = 1.0 / *v16;
    }
    else {
      double v17 = 1000.0;
    }
    double *v16 = v17;
    ++v13;
    ++v15;
  }
  while (v13 != 4);
  [v9 colorPrimaries];
  v18 = (void *)[(PROAPIAccessing *)v24->super.super._apiManager apiForProtocol:&unk_1F121D130];
  char v25 = 0;
  [v18 getBoolValue:&v25 fromParm:2 atFxTime:a5->var0.var1];
  int v19 = [(PAESharedDefaultBase *)v24 getRenderMode:a5->var0.var1];
  if (v19)
  {
    if ([a4 imageType] == 3)
    {
      if (a4) {
        [a4 heliumRef];
      }
      v20 = (HLevels *)HGObject::operator new(0x1A0uLL);
      HLevels::HLevels(v20);
    }
    goto LABEL_20;
  }
  return v19;
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