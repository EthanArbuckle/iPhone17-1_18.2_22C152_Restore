@interface PAEFlop
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEFlop)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEFlop

- (PAEFlop)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEFlop;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithInt:3];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", v7, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEFlop;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Flop::Flop", 0, 0), 1, 0, objc_msgSend((id)objc_msgSend(v4, "localizedStringForKey:value:table:", @"Flop::FlopEntries", 0, 0), "componentsSeparatedByString:", @"|"), 1);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  [(PAESharedDefaultBase *)self getPixelTransformForImage:a3];
  [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
  if (!v9) {
    goto LABEL_18;
  }
  unsigned int v28 = 0;
  [v9 getIntValue:&v28 fromParm:1 atFxTime:a5->var0.var1];
  BOOL v10 = v28 > 2 || (v28 & 1) == 0;
  if (v28 <= 2) {
    unsigned int v11 = (6u >> (v28 & 7)) & 1;
  }
  else {
    unsigned int v11 = 1;
  }
  int v12 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  if (!v12) {
    return v12;
  }
  unint64_t var1 = a5->var1;
  if ([a4 imageType] != 3)
  {
LABEL_18:
    LOBYTE(v12) = 0;
    return v12;
  }
  uint64_t v27 = 0x3FF0000000000000;
  uint64_t v24 = 0x3FF0000000000000;
  *(void *)&v21[40] = 0x3FF0000000000000;
  *(void *)v21 = 0x3FF0000000000000;
  memset(&v21[8], 0, 32);
  int64x2_t v22 = 0u;
  long long v23 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  if (v10)
  {
    *(_OWORD *)v21 = xmmword_1B7E74A40;
    *(int64x2_t *)&v21[16] = vdupq_n_s64(0x8000000000000000);
  }
  if (v11)
  {
    *(_OWORD *)&v21[32] = xmmword_1B7E739F0;
    int64x2_t v22 = vdupq_n_s64(0x8000000000000000);
  }
  PCMatrix44Tmpl<double>::operator*((uint64_t)v30, (long long *)v21, (uint64_t)v19);
  PCMatrix44Tmpl<double>::operator*((uint64_t)v19, v29, (uint64_t)v20);
  for (uint64_t i = 0; i != 16; i += 4)
  {
    v15 = &v21[i * 8];
    long long v16 = *(_OWORD *)&v20[i + 2];
    _OWORD *v15 = *(_OWORD *)&v20[i];
    v15[1] = v16;
  }
  if (a4) {
    [a4 heliumRef];
  }
  else {
    v20[0] = 0;
  }
  FxSupport::makeHeliumXForm((double *)v21, v20, var1 == 2, var1 == 2, v19);
  uint64_t v17 = v19[0];
  if (v20[0] == v19[0])
  {
    if (v20[0]) {
      (*(void (**)(void))(*(void *)v20[0] + 24))();
    }
  }
  else
  {
    if (v20[0])
    {
      (*(void (**)(void))(*(void *)v20[0] + 24))();
      uint64_t v17 = v19[0];
    }
    v20[0] = v17;
  }
  [a3 setHeliumRef:v20];
  if (v20[0]) {
    (*(void (**)(uint64_t))(*(void *)v20[0] + 24))(v20[0]);
  }
  LOBYTE(v12) = 1;
  return v12;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  *a6 = 1;
  *a5 = 1;
  long long v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  [(PAESharedDefaultBase *)self overrideFrameSetupForRenderMode:v8 hardware:a5 software:a6];
  return 1;
}

@end