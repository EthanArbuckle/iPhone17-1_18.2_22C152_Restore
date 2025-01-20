@interface PAESharedDefaultBase
- (BOOL)addParameters;
- (BOOL)frameCleanup;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getCropRectFromImage:(id)a3 toImage:(id)a4 output:(void *)a5;
- (BOOL)getHeliumImage:(id *)a3 layerOffsetX:(double *)a4 layerOffsetY:(double *)a5 requestInfo:(id *)a6 fromParm:(int)a7 atTime:(id)a8;
- (BOOL)getHeliumImage:(id *)a3 source:(BOOL)a4 withInfo:(id *)a5 atTime:(id)a6;
- (BOOL)getPoint:(void *)a3 fromParm:(unsigned int)a4 atTime:(id)a5 withImage:(id)a6;
- (BOOL)smear:(HGRef<HGNode>)a3 fromImage:(id)a4 toImage:(id)a5 resultNode:(void *)a6;
- (BOOL)variesOverTime;
- (HGRef<HGNode>)changeDOD:(HGRef<HGNode>)a3 withRect:(const void *)a4;
- (HGRef<HGNode>)cropFromImage:(id)a3 toImage:(id)a4;
- (HGRef<HGNode>)smear:(HGRef<HGNode>)a3 fromImage:(id)a4 toImage:(id)a5;
- (HGRef<HGNode>)transformFromImage:(id)a3 toImage:(id)a4 fit:(BOOL)a5;
- (PAESharedDefaultBase)initWithAPIManager:(id)a3;
- (PCMatrix44Tmpl<double>)getInversePixelTransformForImage:(SEL)a3;
- (PCMatrix44Tmpl<double>)getPixelTransformForImage:(SEL)a3;
- (PCRect<float>)getCropRectFromImage:(id)a3 toImage:(id)a4;
- (PCRect<float>)getImageBoundary:(id)a3;
- (PCVector2<double>)convertRelativeToImageCoordinates:(const void *)a3 withImage:(id)a4;
- (PCVector2<double>)convertRelativeToPixelCoordinates:(const void *)a3 withImage:(id)a4;
- (PCVector2<double>)getScaleForImage:(id)a3;
- (double)frameFromFxTime:(id)a3 forPlugIn:(id)a4;
- (double)frameRate;
- (double)relativeShutterForAngle:(double)a3;
- (double)secondsFromFxTime:(id)a3;
- (float)getBlendingGamma;
- (id)properties;
- (int)getRenderMode:(id)a3;
- (void)crop:(void *)a3 fromImage:(id)a4 toImage:(id)a5;
- (void)crop:(void *)a3 withRect:(PCRect<float>)a4;
- (void)dealloc;
- (void)fxTime:(id *)a3 fromFrame:(double)a4 forPlugIn:(id)a5;
- (void)overrideFrameSetupForRenderMode:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5;
- (void)transform:(void *)a3 fromImage:(id)a4 toImage:(id)a5 fit:(BOOL)a6;
@end

@implementation PAESharedDefaultBase

- (PAESharedDefaultBase)initWithAPIManager:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PAESharedDefaultBase;
  v4 = [(PAESharedDefaultBase *)&v8 init];
  v4->_apiManager = (PROAPIAccessing *)a3;
  v5 = [[FxHostCapabilities alloc] initWithAPIManager:v4->_apiManager];
  v4->_upscalesFields = [(FxHostCapabilities *)v5 upscalesFields];
  if ([(FxHostCapabilities *)v5 hostIsFCP]) {
    char v6 = 1;
  }
  else {
    char v6 = [(FxHostCapabilities *)v5 hostIsFCE];
  }
  v4->_hostIsFinalCutPro = v6;
  v4->_hostIsVertigo = objc_msgSend(-[FxHostCapabilities hostID](v5, "hostID"), "isEqualToString:", @"com.apple.FinalCut");
  return v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAESharedDefaultBase;
  [(PAESharedDefaultBase *)&v2 dealloc];
}

- (BOOL)variesOverTime
{
  return 0;
}

- (id)properties
{
  return (id)[MEMORY[0x1E4F1C9E8] dictionary];
}

- (BOOL)addParameters
{
  return 1;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  *a6 = 0;
  *a5 = 0;
  return 1;
}

- (BOOL)frameCleanup
{
  return 1;
}

- (int)getRenderMode:(id)a3
{
  return 1;
}

- (void)overrideFrameSetupForRenderMode:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5
{
  *a5 = 0;
  *a4 = 1;
}

- (HGRef<HGNode>)changeDOD:(HGRef<HGNode>)a3 withRect:(const void *)a4
{
  v7 = v4;
  v15[2] = *MEMORY[0x1E4F143B8];
  objc_super v8 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
  HGTextureWrap::HGTextureWrap(v8);
  HGTextureWrap::SetTextureWrapMode((uint64_t)v8, 0, v9);
  v15[0] = 0;
  v15[1] = 0;
  HGTextureWrap::SetTextureBorderColor(v8, (float *)v15);
  (*(void (**)(HGTextureWrap *, void, void))(*(void *)v8 + 120))(v8, 0, *(void *)a3.var0);
  v10 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v10);
  uint64_t v11 = HGRectMake4i((int)*(double *)a4, (int)*((double *)a4 + 1), (int)(*(double *)a4 + *((double *)a4 + 2)), (int)(*((double *)a4 + 1) + *((double *)a4 + 3)));
  (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v10 + 96))(v10, 0, (float)(int)v11, (float)SHIDWORD(v11), (float)v12, (float)v13);
  (*(void (**)(HGCrop *, void, HGTextureWrap *))(*(void *)v10 + 120))(v10, 0, v8);
  *v7 = v10;
  return (HGRef<HGNode>)(*(uint64_t (**)(HGTextureWrap *))(*(void *)v8 + 24))(v8);
}

- (BOOL)getHeliumImage:(id *)a3 layerOffsetX:(double *)a4 layerOffsetY:(double *)a5 requestInfo:(id *)a6 fromParm:(int)a7 atTime:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v14 = [(PROAPIAccessing *)self->_apiManager apiForProtocol:&unk_1F121D130];
  if (v14)
  {
    v15 = (void *)v14;
    if (objc_opt_respondsToSelector())
    {
      long long v16 = *(_OWORD *)&a6->var2;
      v18[0] = *(_OWORD *)&a6->var0.var0;
      v18[1] = v16;
      v18[2] = *(_OWORD *)&a6->var4;
      LOBYTE(v14) = [v15 getHeliumImage:a3 layerOffsetX:a4 layerOffsetY:a5 requestInfo:v18 fromParm:v9 atTime:a8.var1];
    }
    else
    {
      *a3 = 0;
      LOBYTE(v14) = 1;
    }
  }
  return v14;
}

- (BOOL)getHeliumImage:(id *)a3 source:(BOOL)a4 withInfo:(id *)a5 atTime:(id)a6
{
  PCPrint("File %s, line %d should not have been reached:\n\t", (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6.var1, v6, v7, (char)"/Library/Caches/com.apple.xbs/Sources/ProAppsFxSupportiOS/SharedFilterClasses/PAESharedDefaultBase.mm");
  pcAbortImpl();
}

- (PCMatrix44Tmpl<double>)getPixelTransformForImage:(SEL)a3
{
  v5 = (FxMatrix44 *)[a4 pixelTransform];

  FxMatrixToPCMatrix(v5, (uint64_t)retstr);
  return result;
}

- (PCVector2<double>)getScaleForImage:(id)a3
{
  v4 = v3;
  if (self)
  {
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a3];
    double v5 = v7;
    double v6 = v8;
  }
  else
  {
    double v6 = 0.0;
    double v5 = 0.0;
  }
  double *v4 = v5;
  v4[1] = v6;
  result.var1 = v5;
  result.var0 = v6;
  return result;
}

- (PCMatrix44Tmpl<double>)getInversePixelTransformForImage:(SEL)a3
{
  if (self) {
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
  }
  else {
    memset(v6, 0, sizeof(v6));
  }
  retstr->var0[3][3] = 1.0;
  retstr->var0[2][2] = 1.0;
  retstr->var0[1][1] = 1.0;
  retstr->var0[0][0] = 1.0;
  *(_OWORD *)&retstr->var0[0][1] = 0u;
  *(_OWORD *)&retstr->var0[0][3] = 0u;
  *(_OWORD *)&retstr->var0[1][2] = 0u;
  *(_OWORD *)&retstr->var0[2][0] = 0u;
  *(_OWORD *)&retstr->var0[2][3] = 0u;
  *(_OWORD *)&retstr->var0[3][1] = 0u;
  return (PCMatrix44Tmpl<double> *)PCMatrix44Tmpl<double>::planarInverseZ((uint64_t)retstr, (double *)v6, 0.0);
}

- (PCVector2<double>)convertRelativeToImageCoordinates:(const void *)a3 withImage:(id)a4
{
  double v6 = v4;
  [a4 bounds];
  double v10 = v9 + *(double *)a3 * v7;
  double v12 = v11 + *((double *)a3 + 1) * v8;
  *double v6 = v10;
  v6[1] = v12;
  result.var1 = v12;
  result.var0 = v10;
  return result;
}

- (PCVector2<double>)convertRelativeToPixelCoordinates:(const void *)a3 withImage:(id)a4
{
  double v5 = v4;
  if (self)
  {
    -[PAESharedDefaultBase convertRelativeToImageCoordinates:withImage:](self, "convertRelativeToImageCoordinates:withImage:", a3);
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
    double v9 = *v5;
    double v8 = v5[1];
    double v11 = v28;
    double v10 = v29;
    double v12 = v30;
    double v14 = v22;
    double v13 = v23;
    double v16 = v24;
    double v15 = v25;
    double v17 = v26;
    double v18 = v27;
  }
  else
  {
    double v18 = 0.0;
    double v17 = 0.0;
    double v15 = 0.0;
    double v16 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
    double v12 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
  }
  double v19 = v12 + v9 * v11 + v8 * v10;
  double v20 = v9 * v15 + v8 * v17;
  double v21 = (v18 + v20) / v19;
  double *v5 = (v16 + v9 * v14 + v8 * v13) / v19;
  v5[1] = v21;
  result.var1 = v20;
  result.var0 = v21;
  return result;
}

- (PCRect<float>)getImageBoundary:(id)a3
{
  uint64_t v4 = v3;
  [a3 bounds];
  *(float *)&double v7 = v7;
  *(float *)&double v8 = v8;
  *(_DWORD *)uint64_t v4 = LODWORD(v7);
  *(_DWORD *)(v4 + 4) = LODWORD(v8);
  float v9 = v5;
  float v10 = v6;
  *(float *)(v4 + 8) = v9;
  *(float *)(v4 + 12) = v10;
  result.var3 = *(float *)&v6;
  result.var2 = *(float *)&v5;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (PCRect<float>)getCropRectFromImage:(id)a3 toImage:(id)a4
{
  double v7 = v4;
  [a3 bounds];
  v17.f64[0] = v8;
  v17.f64[1] = v9;
  v18.f64[0] = v10;
  v18.f64[1] = v11;
  if (self) {
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
  }
  else {
    memset(v16, 0, sizeof(v16));
  }
  PCMatrix44Tmpl<double>::transformRect<double>((double *)v16, v17.f64, (uint64_t)&v17);
  float v14 = *(float *)v18.f64;
  float32x4_t v15 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v17), v18);
  *double v7 = v15;
  result.var1 = v15.f32[0];
  result.var3 = v13;
  result.var2 = v12;
  result.var0 = v14;
  return result;
}

- (BOOL)getCropRectFromImage:(id)a3 toImage:(id)a4 output:(void *)a5
{
  [a3 bounds];
  v15.f64[0] = v8;
  v15.f64[1] = v9;
  v16.f64[0] = v10;
  v16.f64[1] = v11;
  if (self) {
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  BOOL v12 = PCMatrix44Tmpl<double>::transformRect<double>((double *)v14, v15.f64, (uint64_t)&v15);
  if (v12) {
    *(float32x4_t *)a5 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v15), v16);
  }
  return v12;
}

- (void)crop:(void *)a3 fromImage:(id)a4 toImage:(id)a5
{
  if (self)
  {
    [(PAESharedDefaultBase *)self getCropRectFromImage:a4 toImage:a5];
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  double v6 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v6);
  (*(void (**)(HGCrop *, void, float, float, float))(*(void *)v6 + 96))(v6, 0, *(float *)&v8, *((float *)&v8 + 1) + *((float *)&v9 + 1), *(float *)&v8 + *(float *)&v9);
  (*(void (**)(HGCrop *, void, void))(*(void *)v6 + 120))(v6, 0, *(void *)a3);
  uint64_t v7 = *(void *)a3;
  if (*(HGCrop **)a3 != v6)
  {
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 24))(v7);
    }
    *(void *)a3 = v6;
    (*(void (**)(HGCrop *))(*(void *)v6 + 16))(v6);
  }
  (*(void (**)(HGCrop *))(*(void *)v6 + 24))(v6);
}

- (void)crop:(void *)a3 withRect:(PCRect<float>)a4
{
  double v5 = v4;
  uint64_t v7 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v7);
  (*(void (**)(HGCrop *, void, float, float, float))(*(void *)v7 + 96))(v7, 0, *v5, v5[1] + v5[3], *v5 + v5[2]);
  (*(void (**)(HGCrop *, void, void))(*(void *)v7 + 120))(v7, 0, *(void *)a3);
  uint64_t v8 = *(void *)a3;
  if (*(HGCrop **)a3 != v7)
  {
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v8 + 24))(v8);
    }
    *(void *)a3 = v7;
    (*(void (**)(HGCrop *))(*(void *)v7 + 16))(v7);
  }
  (*(void (**)(HGCrop *))(*(void *)v7 + 24))(v7);
}

- (HGRef<HGNode>)cropFromImage:(id)a3 toImage:(id)a4
{
  uint64_t v8 = v4;
  if (a3) {
    [a3 heliumRef];
  }
  else {
    void *v4 = 0;
  }
  return (HGRef<HGNode>)[(PAESharedDefaultBase *)self crop:v8 fromImage:a3 toImage:a4];
}

- (HGRef<HGNode>)smear:(HGRef<HGNode>)a3 fromImage:(id)a4 toImage:(id)a5
{
  if (self) {
    [(PAESharedDefaultBase *)self getCropRectFromImage:a4 toImage:a5];
  }
  Fx_smearToRect();
}

- (BOOL)smear:(HGRef<HGNode>)a3 fromImage:(id)a4 toImage:(id)a5 resultNode:(void *)a6
{
  long long v7 = xmmword_1B837AB70;
  if ([(PAESharedDefaultBase *)self getCropRectFromImage:a4 toImage:a5 output:&v7])
  {
    Fx_smearToRect();
  }
  return 0;
}

- (void)transform:(void *)a3 fromImage:(id)a4 toImage:(id)a5 fit:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v38 = 0x3FF0000000000000;
  *(void *)v36 = 0x3FF0000000000000;
  double v33 = 1.0;
  double v30 = 1.0;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  *(_OWORD *)&v36[8] = 0u;
  long long v37 = 0u;
  [a5 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [a4 bounds];
  if (v6)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    *(void *)&long long v34 = 0;
    long long v35 = 0u;
    uint64_t v38 = 0x3FF0000000000000;
    *(void *)&v36[16] = 0;
    long long v37 = 0uLL;
    double v30 = v16 / v21;
    *(double *)&long long v32 = v12 - v16 * v19 / v21;
    double v33 = v18 / v22;
    *((double *)&v34 + 1) = v14 - v18 * v20 / v22;
    *(_OWORD *)v36 = xmmword_1B7E733D0;
  }
  if (self)
  {
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a5];
    PCMatrix44Tmpl<double>::operator*((uint64_t)v26, (long long *)&v30, (uint64_t)v27);
    [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a4];
  }
  else
  {
    memset(v26, 0, sizeof(v26));
    PCMatrix44Tmpl<double>::operator*((uint64_t)v26, (long long *)&v30, (uint64_t)v27);
    memset(v25, 0, sizeof(v25));
  }
  PCMatrix44Tmpl<double>::operator*((uint64_t)v27, v25, (uint64_t)v28);
  FxSupport::makeHeliumXForm(v28, (uint64_t *)a3, 1, 0, &v29);
  uint64_t v23 = *(void *)a3;
  uint64_t v24 = v29;
  if (*(void *)a3 == v29)
  {
    if (v23) {
      (*(void (**)(uint64_t))(*(void *)v23 + 24))(v23);
    }
  }
  else
  {
    if (v23)
    {
      (*(void (**)(uint64_t))(*(void *)v23 + 24))(v23);
      uint64_t v24 = v29;
    }
    *(void *)a3 = v24;
  }
}

- (HGRef<HGNode>)transformFromImage:(id)a3 toImage:(id)a4 fit:(BOOL)a5
{
  BOOL v6 = a5;
  float64_t v10 = v5;
  if (a3) {
    [a3 heliumRef];
  }
  else {
    void *v5 = 0;
  }
  return (HGRef<HGNode>)[(PAESharedDefaultBase *)self transform:v10 fromImage:a3 toImage:a4 fit:v6];
}

- (BOOL)getPoint:(void *)a3 fromParm:(unsigned int)a4 atTime:(id)a5 withImage:(id)a6
{
  apiManager = self->_apiManager;
  if (!apiManager) {
    return 0;
  }
  uint64_t v8 = *(void *)&a4;
  float64_t v10 = (void *)-[PROAPIAccessing apiForProtocol:](apiManager, "apiForProtocol:", &unk_1F121D130, *(void *)&a4, a5.var1, a6);
  if (!v10) {
    return 0;
  }

  return [v10 getXValue:a3 YValue:(char *)a3 + 8 fromParm:v8 atFxTime:a5.var1];
}

- (double)relativeShutterForAngle:(double)a3
{
  double v5 = (void *)[(PROAPIAccessing *)self->_apiManager apiForProtocol:&unk_1F121DE28];
  if (!v5) {
    return 0.0;
  }
  long long v9 = *MEMORY[0x1E4F1FA48];
  uint64_t v10 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  uint64_t v8 = &v9;
  [v5 durationFxTimeForEffect:&v8];
  [(PAESharedDefaultBase *)self frameFromFxTime:v8 forPlugIn:0];
  return a3 / 360.0 / v6;
}

- (double)secondsFromFxTime:(id)a3
{
  long long v3 = *(_OWORD *)a3.var1;
  v5.epoch = *((void *)a3.var1 + 2);
  *(_OWORD *)&v5.value = v3;
  return CMTimeGetSeconds(&v5);
}

- (double)frameRate
{
  objc_super v2 = (void *)[(PROAPIAccessing *)self->_apiManager apiForProtocol:&unk_1F121DA70];
  if (!v2) {
    return 0.0;
  }
  long long v3 = v2;
  double v4 = (double)(unint64_t)[v2 timelineFpsNumeratorForEffect:0];
  return v4 / (double)(unint64_t)[v3 timelineFpsDenominatorForEffect:0];
}

- (double)frameFromFxTime:(id)a3 forPlugIn:(id)a4
{
  -[PAESharedDefaultBase secondsFromFxTime:](self, "secondsFromFxTime:", a3.var1, a4);
  double v6 = v5;
  [(PAESharedDefaultBase *)self frameRate];
  return v6 * v7;
}

- (void)fxTime:(id *)a3 fromFrame:(double)a4 forPlugIn:(id)a5
{
  uint64_t v8 = (void *)[(PROAPIAccessing *)self->_apiManager apiForProtocol:&unk_1F121DA70];
  if (v8)
  {
    memset(&v11, 0, sizeof(v11));
    CMTimeMakeWithSeconds(&v11, a4/ (double)([v8 timelineFpsNumeratorForEffect:a5]/ (unint64_t)objc_msgSend(v8, "timelineFpsDenominatorForEffect:", a5)), 120000);
    var1 = a3->var1;
    long long v10 = *(_OWORD *)&v11.value;
    *((void *)var1 + 2) = v11.epoch;
    *(_OWORD *)var1 = v10;
  }
}

- (float)getBlendingGamma
{
  objc_super v2 = (void *)[(PROAPIAccessing *)self->_apiManager apiForProtocol:&unk_1F1219DF0];
  if (v2)
  {
    [v2 blendingGamma];
  }
  else
  {
    return PCRenderModel::getDefaultBlendingGamma(0);
  }
  return result;
}

@end