@interface PAEGeneratorDefaultBase
- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4;
- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5;
- (BOOL)renderOutput:(id)a3 withInfo:(id *)a4;
- (void)filteredEdges:(BOOL *)a3 withInfo:(id *)a4;
@end

@implementation PAEGeneratorDefaultBase

- (BOOL)renderOutput:(id)a3 withInfo:(id *)a4
{
  long long v6 = *(_OWORD *)&a4->var2;
  v13[0] = *(_OWORD *)&a4->var0.var0;
  v13[1] = v6;
  v13[2] = *(_OWORD *)&a4->var4;
  BOOL v7 = [(PAEGeneratorDefaultBase *)self canThrowRenderOutput:a3 withInfo:v13];
  if ([a3 imageType] == 3)
  {
    v8 = (void *)[(PROAPIAccessing *)self->super._apiManager apiForProtocol:&unk_1F12189D0];
    if (v8)
    {
      if ([v8 colorPrimaries] == 1)
      {
        v9 = (CGColorSpace *)[a3 colorSpace];
        if (a3) {
          [a3 heliumRef];
        }
        else {
          uint64_t v11 = 0;
        }
        FxApplySDRToHDR(v9, (uint64_t)&v11, (uint64_t)v9, 1, &v12);
        if (v11) {
          (*(void (**)(uint64_t))(*(void *)v11 + 24))(v11);
        }
        objc_msgSend(a3, "setHeliumRef:", &v12, v11);
        if (v12) {
          (*(void (**)(uint64_t))(*(void *)v12 + 24))(v12);
        }
      }
    }
  }
  return v7;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4
{
  return 0;
}

- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5
{
  *a5 = 0;
  *a4 = 0;
  return 1;
}

- (void)filteredEdges:(BOOL *)a3 withInfo:(id *)a4
{
  *a3 = 0;
}

@end