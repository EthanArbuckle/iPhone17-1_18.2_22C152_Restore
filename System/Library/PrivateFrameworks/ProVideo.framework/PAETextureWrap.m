@interface PAETextureWrap
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAETextureWrap)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAETextureWrap

- (PAETextureWrap)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAETextureWrap;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"SupportsLargeRenderScale", v5, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v3.receiver = self;
  v3.super_class = (Class)PAETextureWrap;
  [(PAESharedDefaultBase *)&v3 addParameters];
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  if (a4) {
    [a4 heliumRef];
  }
  else {
    uint64_t v10 = 0;
  }
  v6 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
  HGTextureWrap::HGTextureWrap(v6);
  (*(void (**)(HGTextureWrap *, void, uint64_t))(*(void *)v6 + 120))(v6, 0, v10);
  HGTextureWrap::SetTextureWrapMode((uint64_t)v6, (const char *)3, v7);
  v9 = v6;
  (*(void (**)(HGTextureWrap *))(*(void *)v6 + 16))(v6);
  [a3 setHeliumRef:&v9];
  if (v9) {
    (*(void (**)(HGTextureWrap *))(*(void *)v9 + 24))(v9);
  }
  (*(void (**)(HGTextureWrap *))(*(void *)v6 + 24))(v6);
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 24))(v10);
  }
  return 1;
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