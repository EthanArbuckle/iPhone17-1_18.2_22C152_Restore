@interface PAE_HLG_OETF
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAE_HLG_OETF)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAE_HLG_OETF

- (PAE_HLG_OETF)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAE_HLG_OETF;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  if (-[PAE_HLG_OETF properties]::once != -1) {
    dispatch_once(&-[PAE_HLG_OETF properties]::once, &__block_literal_global_25);
  }
  return (id)-[PAE_HLG_OETF properties]::sPropertiesDict;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  if (a4) {
    [a4 heliumRef];
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v11 = 0x1200000009;
  int v12 = 0;
  uint64_t v9 = 0x800000009;
  int v10 = 0;
  FxApplyColorConform(&v13, (uint64_t)&v9, 1, (uint64_t)&v11, (char *)1, &v8);
  uint64_t v6 = v8;
  if (v13 == v8)
  {
    if (v13) {
      (*(void (**)(uint64_t))(*(void *)v13 + 24))(v13);
    }
  }
  else
  {
    if (v13)
    {
      (*(void (**)(uint64_t))(*(void *)v13 + 24))(v13);
      uint64_t v6 = v8;
    }
    uint64_t v13 = v6;
  }
  [a3 setHeliumRef:&v13];
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 24))(v13);
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