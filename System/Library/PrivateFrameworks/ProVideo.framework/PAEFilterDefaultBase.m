@interface PAEFilterDefaultBase
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getInputBitmap:(id *)a3 withInfo:(id *)a4 atTime:(id)a5 appendHGGraph:(HGRef<HGNode>)a6;
- (BOOL)getInputBitmap:(id *)a3 withInfo:(id *)a4 atTime:(id)a5 withROI:(HGRect *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (BOOL)renderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (HGRef<HGNode>)makePrescaledBlurNode:(HGRef<HGNode>)a3 radius:(float)a4 withScale:(PCVector2<float>)a5 minInputScale:(float)a6 maxInputScale:(float)a7;
- (HGRef<HGNode>)preScaleDown:(float)a3 withOutputRadius:(float *)a4 withOutputScaleFactor:(float *)a5 withInput:(HGRef<HGNode>)a6 minInputScale:(float)a7 maxInputScale:(float)a8;
- (HGRef<HGNode>)preScaleUp:(float)a3 withInput:(HGRef<HGNode>)a4;
- (id)getParamAPIWithError:(id *)a3;
- (id)getParamErrorFor:(id)a3;
@end

@implementation PAEFilterDefaultBase

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  *a3 = a5->var0;
  *a4 = a5->var1;
  return 1;
}

- (BOOL)renderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  long long v5 = *(_OWORD *)&a5->var2;
  v7[0] = *(_OWORD *)&a5->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a5->var4;
  return [(PAEFilterDefaultBase *)self canThrowRenderOutput:a3 withInput:a4 withInfo:v7];
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  return 0;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  *a6 = 1;
  *a5 = 1;
  return 1;
}

- (BOOL)getInputBitmap:(id *)a3 withInfo:(id *)a4 atTime:(id)a5 withROI:(HGRect *)a6
{
  uint64_t v10 = [(PROAPIAccessing *)self->super._apiManager apiForProtocol:&unk_1F1225E40];
  if (v10)
  {
    v11 = (void *)v10;
    if (objc_opt_respondsToSelector())
    {
      long long v12 = *(_OWORD *)&a4->var2;
      v14[0] = *(_OWORD *)&a4->var0.var0;
      v14[1] = v12;
      v14[2] = *(_OWORD *)&a4->var4;
      LOBYTE(v10) = [v11 getInputBitmap:a3 withInfo:v14 atTime:a5.var1 withROI:a6];
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (BOOL)getInputBitmap:(id *)a3 withInfo:(id *)a4 atTime:(id)a5 appendHGGraph:(HGRef<HGNode>)a6
{
  uint64_t v10 = [(PROAPIAccessing *)self->super._apiManager apiForProtocol:&unk_1F1225E40];
  if (!v10) {
    return 0;
  }
  v11 = (void *)v10;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  long long v12 = *(_OWORD *)&a4->var2;
  v17[0] = *(_OWORD *)&a4->var0.var0;
  v17[1] = v12;
  v17[2] = *(_OWORD *)&a4->var4;
  uint64_t v13 = *(void *)a6.var0;
  uint64_t v16 = v13;
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 16))(v13);
  }
  char v14 = [v11 getInputBitmap:a3 withInfo:v17 atTime:a5.var1 appendHGGraph:&v16];
  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 24))(v16);
  }
  return v14;
}

- (id)getParamAPIWithError:(id *)a3
{
  v4 = (void *)[(PROAPIAccessing *)self->super._apiManager apiForProtocol:&unk_1F121D130];
  if (!v4)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Unable to retrieve FxParameterRetrievalAPI object", *MEMORY[0x1E4F28568], 0);
    if (a3) {
      *a3 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:FxPlugErrorDomain code:100001 userInfo:v5];
    }
  }
  return v4;
}

- (id)getParamErrorFor:(id)a3
{
  uint64_t v3 = [NSString stringWithFormat:@"Unable to retrieve a parameter in [-%@             dynamicPropertiesAtTime:withError:]", a3];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v3, *MEMORY[0x1E4F28568], 0);
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  v6 = FxPlugErrorDomain;

  return (id)[v5 errorWithDomain:v6 code:100002 userInfo:v4];
}

- (HGRef<HGNode>)preScaleDown:(float)a3 withOutputRadius:(float *)a4 withOutputScaleFactor:(float *)a5 withInput:(HGRef<HGNode>)a6 minInputScale:(float)a7 maxInputScale:(float)a8
{
  v15 = v8;
  float v17 = log2f(a3);
  if (v17 <= a8) {
    float v18 = v17;
  }
  else {
    float v18 = a8;
  }
  if (v17 >= a7) {
    float v19 = v18;
  }
  else {
    float v19 = a7;
  }
  *a5 = v19;
  if (v19 <= 1.0)
  {
    *a4 = a3;
    *v15 = *(HGXForm **)a6.var0;
    *(void *)a6.var0 = 0;
  }
  else
  {
    *a4 = a3 / v19;
    v20 = (HGXForm *)HGObject::operator new(0x210uLL);
    HGXForm::HGXForm(v20);
    HGTransform::HGTransform((HGTransform *)v21);
    HGTransform::Scale((HGTransform *)v21, 1.0 / *a5, 1.0 / *a5, 1.0);
    (*(void (**)(HGXForm *, void, void))(*(void *)v20 + 120))(v20, 0, *(void *)a6.var0);
    (*(void (**)(HGXForm *, unsigned char *))(*(void *)v20 + 576))(v20, v21);
    (*(void (**)(HGXForm *, void, double))(*(void *)v20 + 592))(v20, 0, 0.0);
    *v15 = v20;
    HGTransform::~HGTransform((HGTransform *)v21);
  }
  return v16;
}

- (HGRef<HGNode>)preScaleUp:(float)a3 withInput:(HGRef<HGNode>)a4
{
  v7 = v4;
  if (a3 <= 1.0)
  {
    void *v4 = *(HGXForm **)a4.var0;
    *(void *)a4.var0 = 0;
  }
  else
  {
    v8 = (HGXForm *)HGObject::operator new(0x210uLL);
    HGXForm::HGXForm(v8);
    HGTransform::HGTransform((HGTransform *)v9);
    HGTransform::Scale((HGTransform *)v9, a3, a3, 1.0);
    (*(void (**)(HGXForm *, void, void))(*(void *)v8 + 120))(v8, 0, *(void *)a4.var0);
    (*(void (**)(HGXForm *, unsigned char *))(*(void *)v8 + 576))(v8, v9);
    (*(void (**)(HGXForm *, void, double))(*(void *)v8 + 592))(v8, 0, 0.0);
    *v7 = v8;
    HGTransform::~HGTransform((HGTransform *)v9);
  }
  return (HGRef<HGNode>)self;
}

- (HGRef<HGNode>)makePrescaledBlurNode:(HGRef<HGNode>)a3 radius:(float)a4 withScale:(PCVector2<float>)a5 minInputScale:(float)a6 maxInputScale:(float)a7
{
  float var1 = a5.var1;
  float var0 = a5.var0;
  v11 = v7;
  char v14 = v8;
  uint64_t v15 = *(void *)a3.var0;
  uint64_t v23 = v15;
  if (v15) {
    (*(void (**)(uint64_t, SEL, float, __n128, __n128, float, float))(*(void *)v15 + 16))(v15, a2, a4, *(__n128 *)&a5.var0, *(__n128 *)&a5.var1, a6, a7);
  }
  uint64_t v25 = 0;
  if (!self)
  {
    v24 = 0;
    if (!v15) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  *(float *)&double v16 = a4;
  a5.float var0 = var0;
  a5.float var1 = var1;
  [(PAEFilterDefaultBase *)self preScaleDown:(char *)&v25 + 4 withOutputRadius:&v25 withOutputScaleFactor:&v23 withInput:v16 minInputScale:*(double *)&a5 maxInputScale:*(double *)&a5.var1];
  uint64_t v15 = v23;
  if (v23) {
LABEL_7:
  }
    (*(void (**)(uint64_t))(*(void *)v15 + 24))(v15);
LABEL_8:
  float v17 = (HGaussianBlur *)HGObject::operator new(0x1B0uLL);
  HGaussianBlur::HGaussianBlur(v17);
  HGaussianBlur::init(v17, *((float *)&v25 + 1), *v11, v11[1], 0, 0, 0);
  (*(void (**)(HGaussianBlur *, void, HGNode *))(*(void *)v17 + 120))(v17, 0, v24);
  int v18 = v25;
  v22 = v17;
  (*(void (**)(HGaussianBlur *))(*(void *)v17 + 16))(v17);
  if (!self)
  {
    *char v14 = 0;
    v20 = v17;
    goto LABEL_12;
  }
  LODWORD(v19) = v18;
  [(PAEFilterDefaultBase *)self preScaleUp:&v22 withInput:v19];
  v20 = v22;
  if (v22) {
LABEL_12:
  }
    (*(void (**)(HGaussianBlur *))(*(void *)v20 + 24))(v20);
  (*(void (**)(HGaussianBlur *))(*(void *)v17 + 24))(v17);
  v21.float var0 = v24;
  if (v24) {
    return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(void *)v24 + 24))(v24);
  }
  return v21;
}

@end