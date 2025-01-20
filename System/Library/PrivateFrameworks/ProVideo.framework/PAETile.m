@interface PAETile
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (HGRef<HGNode>)transformAndTile:(HGRef<HGNode>)a3 withXValue:(double)a4 YValue:(double)a5 skew:(double)a6 scale:(double)a7 stretch:(double)a8 rotation:(double)a9 resolution:(PCVector2<double>)a10 inputImage:(id)a11;
- (PAETile)initWithAPIManager:(id)a3;
- (id)properties;
- (void)_compute_2x2_matrix:(float *)a3 withScale:(float)a4 angle:(float)a5 skew:(float)a6 stretch:(float)a7;
- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4;
- (void)retrieveXValue:(double *)a3 YValue:(double *)a4 skew:(double *)a5 scale:(double *)a6 stretch:(double *)a7 rotation:(double *)a8 forOutputImage:(id)a9 withRenderInfo:(id *)a10;
@end

@implementation PAETile

- (PAETile)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAETile;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)addParameters
{
  v12.receiver = self;
  v12.super_class = (Class)PAETile;
  [(PAESharedDefaultBase *)&v12 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  uint64_t v4 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  if (!v5)
  {
    unsigned int v7 = [v4 versionAtCreation];
    v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Tile::Center", 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Tile::Skew", 0, 0), 2, 0, 0.0, -3.0, 3.0, -3.0, 3.0, 1.0);
    uint64_t v9 = [v8 localizedStringForKey:@"Tile::Scale" value:0 table:0];
    if (v7 >= 2) {
      double v10 = 200.0;
    }
    else {
      double v10 = 20.0;
    }
    [v3 addFloatSliderWithName:v9 parmId:3 defaultValue:0 parameterMin:3.0 parameterMax:0.0 sliderMin:v10 sliderMax:0.0 delta:20.0 parmFlags:1.0];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Tile::Stretch", 0, 0), 4, 0, 1.0, 0.1, 10.0, 0.1, 10.0, 1.0);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Tile::Angle", 0, 0), 5, 0, 0.0, -360.0, 360.0);
  }
  return v6;
}

- (void)_compute_2x2_matrix:(float *)a3 withScale:(float)a4 angle:(float)a5 skew:(float)a6 stretch:(float)a7
{
  __float2 v11 = __sincosf_stret(a5);
  *a3 = (float)((float)(v11.__cosval - (float)(v11.__sinval * a6)) * a7) * a4;
  a3[1] = (float)((float)(v11.__sinval + (float)(v11.__cosval * a6)) * a7) * a4;
  a3[2] = -(float)(v11.__sinval * a4);
  a3[3] = v11.__cosval * a4;
}

- (void)retrieveXValue:(double *)a3 YValue:(double *)a4 skew:(double *)a5 scale:(double *)a6 stretch:(double *)a7 rotation:(double *)a8 forOutputImage:(id)a9 withRenderInfo:(id *)a10
{
  v16 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A608];
  uint64_t v17 = [a9 origin];
  [v16 getXValue:a3 YValue:a4 fromParm:1 atFxTime:a10->var0.var1];
  [v16 getFloatValue:a5 fromParm:2 atFxTime:a10->var0.var1];
  if (v17 == 2)
  {
    [v16 getFloatValue:a6 fromParm:3 atFxTime:a10->var0.var1];
    [v16 getFloatValue:a7 fromParm:4 atFxTime:a10->var0.var1];
    var1 = a10->var0.var1;
    [v16 getFloatValue:a8 fromParm:5 atFxTime:var1];
  }
  else
  {
    *a5 = -*a5;
    [v16 getFloatValue:a6 fromParm:3 atFxTime:a10->var0.var1];
    [v16 getFloatValue:a7 fromParm:4 atFxTime:a10->var0.var1];
    [v16 getFloatValue:a8 fromParm:5 atFxTime:a10->var0.var1];
    *a8 = -*a8;
  }
}

- (HGRef<HGNode>)transformAndTile:(HGRef<HGNode>)a3 withXValue:(double)a4 YValue:(double)a5 skew:(double)a6 scale:(double)a7 stretch:(double)a8 rotation:(double)a9 resolution:(PCVector2<double>)a10 inputImage:(id)a11
{
  v13 = v11;
  v23 = v12;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  double v24 = log2(a7);
  double v25 = exp2(floor(v24));
  double v26 = a7 / v25;
  *(float *)&double v26 = a7 / v25;
  *(float *)&double v27 = a9;
  *(float *)&double v28 = a6;
  *(float *)&double v29 = a8;
  [(PAETile *)self _compute_2x2_matrix:v81 withScale:v26 angle:v27 skew:v28 stretch:v29];
  v74[0] = v81[0];
  v74[1] = v81[2];
  v74[3] = 0.0;
  v74[2] = 0.0;
  v74[4] = v81[1];
  v74[5] = v81[3];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  uint64_t v77 = 0x3FF0000000000000;
  uint64_t v80 = 0x3FF0000000000000;
  uint64_t v30 = *(void *)a3.var0;
  uint64_t v73 = v30;
  if (v30) {
    (*(void (**)(uint64_t))(*(void *)v30 + 16))(v30);
  }
  if (!self)
  {
    v72[0] = 0;
    uint64_t v32 = *(void *)a3.var0;
    if (!*(void *)a3.var0) {
      goto LABEL_10;
    }
LABEL_8:
    (*(void (**)(uint64_t))(*(void *)v32 + 24))(v32);
    uint64_t v31 = v72[0];
LABEL_9:
    *(void *)a3.var0 = v31;
    v72[0] = 0;
    goto LABEL_10;
  }
  [(PAESharedDefaultBase *)self smear:&v73 fromImage:v13 toImage:v13];
  uint64_t v31 = v72[0];
  uint64_t v32 = *(void *)a3.var0;
  if (*(void *)a3.var0 != v72[0])
  {
    if (!v32) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v72[0]) {
    (*(void (**)(void))(*(void *)v72[0] + 24))();
  }
LABEL_10:
  if (v73) {
    (*(void (**)(uint64_t))(*(void *)v73 + 24))(v73);
  }
  HGTransform::HGTransform((HGTransform *)v72);
  HGTransform::Scale((HGTransform *)v72, 1.0 / v25, 1.0 / v25, 1.0);
  v33 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v33);
  (*(void (**)(HGXForm *, void *))(*(void *)v33 + 576))(v33, v72);
  (*(void (**)(HGXForm *, void, void))(*(void *)v33 + 120))(v33, 0, *(void *)a3.var0);
  (*(void (**)(HGXForm *, void, double))(*(void *)v33 + 592))(v33, 0, 0.0);
  v34 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v34);
  (*(void (**)(HGCrop *, void, HGXForm *))(*(void *)v34 + 120))(v34, 0, v33);
  unint64_t v35 = [v13 width];
  unint64_t v36 = [v13 height];
  uint64_t v37 = HGRectMake4i((int)-floor((double)v35 * 0.5 / v25), (int)-floor((double)v36 * 0.5 / v25), vcvtmd_s64_f64((double)v35 * 0.5 / v25), vcvtmd_s64_f64((double)v36 * 0.5 / v25));
  (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v34 + 96))(v34, 0, (float)(int)v37, (float)SHIDWORD(v37), (float)v38, (float)v39);
  (*(void (**)(HGCrop *, uint64_t, uint64_t))(*(void *)v34 + 136))(v34, 0xFFFFFFFFLL, 2);
  HGTransform::HGTransform((HGTransform *)v71);
  HGTransform::Translate((HGTransform *)v71, a4, a5, 0.0);
  HGTransform::HGTransform((HGTransform *)v70);
  HGTransform::LoadMatrixd((HGTransform *)v70, v74);
  HGTransform::Invert(v70[0].f64);
  HGTransform::Multiply(v70, v71);
  v40 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
  HGTextureWrap::HGTextureWrap(v40);
  (*(void (**)(HGTextureWrap *, void, HGCrop *))(*(void *)v40 + 120))(v40, 0, v34);
  HGTextureWrap::SetTextureWrapMode((uint64_t)v40, (const char *)3, v41);
  HGTransform::HGTransform((HGTransform *)v69);
  HGTransform::Scale((HGTransform *)v69, *(double *)a11, *((double *)a11 + 1), 1.0);
  v42 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v42);
  (*(void (**)(HGXForm *, unsigned char *))(*(void *)v42 + 576))(v42, v69);
  (*(void (**)(HGXForm *, void, HGTextureWrap *))(*(void *)v42 + 120))(v42, 0, v40);
  v43 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v43);
  (*(void (**)(HGXForm *, void, HGXForm *))(*(void *)v43 + 120))(v43, 0, v42);
  (*(void (**)(HGXForm *, float64x2_t *))(*(void *)v43 + 576))(v43, v70);
  HGTransform::HGTransform((HGTransform *)v68);
  HGTransform::Scale((HGTransform *)v68, 1.0 / *(double *)a11, 1.0 / *((double *)a11 + 1), 0.0);
  v44 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v44);
  (*(void (**)(HGXForm *, unsigned char *))(*(void *)v44 + 576))(v44, v68);
  (*(void (**)(HGXForm *, void, HGXForm *))(*(void *)v44 + 120))(v44, 0, v43);
  v45 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v45);
  (*(void (**)(HGCrop *, void, HGXForm *))(*(void *)v45 + 120))(v45, 0, v44);
  if (self)
  {
    [(PAESharedDefaultBase *)self getPixelTransformForImage:v13];
    [(PAESharedDefaultBase *)self getImageBoundary:v13];
    float32x2_t v46 = v65;
    float32x2_t v47 = v66;
  }
  else
  {
    memset(v67, 0, sizeof(v67));
    float32x2_t v46 = 0;
    float32x2_t v47 = 0;
    float32x2_t v65 = 0;
    float32x2_t v66 = 0;
  }
  v64[0] = vcvtq_f64_f32(v46);
  v64[1] = vcvtq_f64_f32(v47);
  double v61 = 0.0;
  double v62 = 0.0;
  __asm { FMOV            V0.2D, #-1.0 }
  long long v63 = _Q0;
  PCMatrix44Tmpl<double>::transformRect<double>((double *)v67, (double *)v64, (uint64_t)&v61);
  float v53 = v61;
  float v54 = v62;
  float v55 = *(double *)&v63;
  float v56 = *((double *)&v63 + 1);
  uint64_t v57 = HGRectMake4i((int)v53, (int)v54, (int)v55 + (int)v53, (int)v56 + (int)v54);
  (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v45 + 96))(v45, 0, (float)(int)v57, (float)SHIDWORD(v57), (float)v58, (float)v59);
  *v23 = v45;
  (*(void (**)(HGXForm *))(*(void *)v44 + 24))(v44);
  HGTransform::~HGTransform((HGTransform *)v68);
  (*(void (**)(HGXForm *))(*(void *)v43 + 24))(v43);
  (*(void (**)(HGXForm *))(*(void *)v42 + 24))(v42);
  HGTransform::~HGTransform((HGTransform *)v69);
  (*(void (**)(HGTextureWrap *))(*(void *)v40 + 24))(v40);
  HGTransform::~HGTransform((HGTransform *)v70);
  HGTransform::~HGTransform((HGTransform *)v71);
  (*(void (**)(HGCrop *))(*(void *)v34 + 24))(v34);
  (*(void (**)(HGXForm *))(*(void *)v33 + 24))(v33);
  HGTransform::~HGTransform((HGTransform *)v72);
  return v60;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v9)
  {
    int v10 = [v9 versionAtCreation];
    [(PAESharedDefaultBase *)self getScaleForImage:a4];
    double v11 = v30;
    if (v10)
    {
      double v12 = v29;
    }
    else
    {
      [a4 pixelAspect];
      double v12 = v29 * (1.0 / v13);
    }
    double v27 = 0.5;
    double v28 = 0.5;
    uint64_t v26 = 0;
    uint64_t v24 = 0x3FF0000000000000;
    uint64_t v25 = 0x4008000000000000;
    uint64_t v23 = 0;
    long long v14 = *(_OWORD *)&a5->var2;
    v22[0] = *(_OWORD *)&a5->var0.var0;
    v22[1] = v14;
    v22[2] = *(_OWORD *)&a5->var4;
    [(PAETile *)self retrieveXValue:&v28 YValue:&v27 skew:&v26 scale:&v25 stretch:&v24 rotation:&v23 forOutputImage:a3 withRenderInfo:v22];
    LODWORD(v9) = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
    if (v9)
    {
      if ([a4 imageType] == 3)
      {
        if (a4) {
          [a4 heliumRef];
        }
        else {
          uint64_t v21 = 0;
        }
        double v27 = v27 + -0.5;
        double v28 = v28 + -0.5;
        double v15 = v28;
        double v28 = v12 * (v15 * (double)(unint64_t)[a3 width]);
        double v16 = v27;
        double v27 = v11 * (v16 * (double)(unint64_t)[a3 height]);
        uint64_t v19 = v21;
        if (v21) {
          (*(void (**)(uint64_t))(*(void *)v21 + 16))(v21);
        }
        *(double *)v18 = v12;
        *(double *)&v18[1] = v11;
        -[PAETile transformAndTile:withXValue:YValue:skew:scale:stretch:rotation:resolution:inputImage:](self, "transformAndTile:withXValue:YValue:skew:scale:stretch:rotation:resolution:inputImage:", &v19, v18, a4, v28);
        if (v19) {
          (*(void (**)(uint64_t))(*(void *)v19 + 24))(v19);
        }
        [a3 setHeliumRef:&v20];
        if (v20) {
          (*(void (**)(uint64_t))(*(void *)v20 + 24))(v20);
        }
        if (v21) {
          (*(void (**)(uint64_t))(*(void *)v21 + 24))(v21);
        }
        LOBYTE(v9) = 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
  }
  return (char)v9;
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