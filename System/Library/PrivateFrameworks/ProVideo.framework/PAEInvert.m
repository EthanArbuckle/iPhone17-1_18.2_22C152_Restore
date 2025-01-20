@interface PAEInvert
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEInvert)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEInvert

- (PAEInvert)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEInvert;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  if (-[PAEInvert properties]::once != -1) {
    dispatch_once(&-[PAEInvert properties]::once, &__block_literal_global_39);
  }
  return (id)-[PAEInvert properties]::sPropertiesDict;
}

uint64_t __23__PAEInvert_properties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v1 = [NSNumber numberWithBool:1];
  uint64_t v2 = [NSNumber numberWithBool:1];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", &unk_1F11EC340, @"PixelTransformSupport", v1, @"PixelIndependent", v2, @"PositionIndependent", v3, @"MayRemapTime", v4, @"SupportsLargeRenderScale", v5, @"SupportsHeliumRendering", v6, @"SupportsInternalMixing", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
  -[PAEInvert properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  v3.receiver = self;
  v3.super_class = (Class)PAEInvert;
  [(PAESharedDefaultBase *)&v3 addParameters];
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v9)
  {
    v10 = (void *)v9;
    int v11 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
    [v10 mixAmountAtTime:a5->var0.var1];
    if (v11 && (double v13 = v12, [a4 imageType] == 3))
    {
      if (a4) {
        [a4 heliumRef];
      }
      else {
        uint64_t v18 = 0;
      }
      v14 = (HgcInvert *)HGObject::operator new(0x1A0uLL);
      HgcInvert::HgcInvert(v14);
      v17 = v14;
      (*(void (**)(HgcInvert *, void, uint64_t))(*(void *)v14 + 120))(v14, 0, v18);
      float v15 = v13;
      (*(void (**)(HgcInvert *, void, float, float, float, float))(*(void *)v14 + 96))(v14, 0, v15, v15, v15, v15);
      [a3 setHeliumRef:&v17];
      if (v17) {
        (*(void (**)(HgcInvert *))(*(void *)v17 + 24))(v17);
      }
      if (v18) {
        (*(void (**)(uint64_t))(*(void *)v18 + 24))(v18);
      }
      LOBYTE(v9) = 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  *a5 = 0;
  *a6 = 0;
  long long v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  [(PAESharedDefaultBase *)self overrideFrameSetupForRenderMode:v8 hardware:a5 software:a6];
  return 1;
}

@end