@interface PAEEquirectProject
- (BOOL)addParameters;
- (BOOL)frameCleanup;
- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5;
- (BOOL)renderOutput:(id)a3 withInfo:(id *)a4;
- (BOOL)variesOverTime;
- (HGEquirectProjectParams)getParams:(SEL)a3 :(id *)a4 :(id)a5 :(id)a6;
- (PAEEquirectProject)initWithAPIManager:(id)a3;
- (PCMatrix44Tmpl<float>)getViewMatrix:(SEL)a3;
- (double)getProjectionFOVYDegrees:(id)a3;
- (id)properties;
- (void)dealloc;
@end

@implementation PAEEquirectProject

- (PAEEquirectProject)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEEquirectProject;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAEEquirectProject;
  [(PAESharedDefaultBase *)&v2 dealloc];
}

- (BOOL)addParameters
{
  objc_super v2 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121CE48];
  v3 = v2;
  if (v2) {
    [v2 addImageReferenceWithName:@"Equirect Image" parmId:1 parmFlags:0];
  }
  return v3 != 0;
}

- (BOOL)variesOverTime
{
  return 0;
}

- (id)properties
{
  objc_super v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithInt:6];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:67584];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:591872];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PixelTransformSupport", v4, @"TransformsFromLocalToScreenSpace", v5, @"UsesRationalTime", v6, @"SupportsHeliumRendering", v7, @"SDRWorkingSpace", v8, @"HDRWorkingSpace", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5
{
  *a4 = 0;
  *a5 = 0;
  return 1;
}

- (PCMatrix44Tmpl<float>)getViewMatrix:(SEL)a3
{
  v26[16] = *(double *)MEMORY[0x1E4F143B8];
  uint64_t v7 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  result = (PCMatrix44Tmpl<float> *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E3F8];
  if (v7) {
    BOOL v9 = result == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    retstr->var0[0][0] = 1.0;
    *(void *)&retstr->var0[0][3] = 0;
    *(void *)&retstr->var0[0][1] = 0;
    retstr->var0[1][1] = 1.0;
    *(void *)&retstr->var0[1][2] = 0;
    *(void *)&retstr->var0[2][0] = 0;
    *(_OWORD *)&retstr->var0[2][2] = xmmword_1B7E736B0;
    float v25 = 1.0;
    float v21 = 0.0;
  }
  else
  {
    result = (PCMatrix44Tmpl<float> *)objc_msgSend((id)unk_1F1233580(result, "cameraMatrixAtTime:", a4.var0), "getBytes:length:", v26, 128);
    float v10 = v26[0];
    float v11 = v26[1];
    float v12 = v26[2];
    float v13 = v26[3];
    float v14 = v26[4];
    float v15 = v26[5];
    float v16 = v26[6];
    float v17 = v26[7];
    float v18 = v26[8];
    float v19 = v26[9];
    float v20 = v26[10];
    float v21 = v26[11];
    float v22 = v26[12];
    float v23 = v26[13];
    float v24 = v26[14];
    float v25 = v26[15];
    retstr->var0[0][0] = v10;
    retstr->var0[0][1] = v14;
    retstr->var0[0][2] = v18;
    retstr->var0[0][3] = v22;
    retstr->var0[1][0] = v11;
    retstr->var0[1][1] = v15;
    retstr->var0[1][2] = v19;
    retstr->var0[1][3] = v23;
    retstr->var0[2][0] = v12;
    retstr->var0[2][1] = v16;
    retstr->var0[2][2] = v20;
    retstr->var0[2][3] = v24;
    retstr->var0[3][0] = v13;
    retstr->var0[3][1] = v17;
  }
  retstr->var0[3][2] = v21;
  retstr->var0[3][3] = v25;
  return result;
}

- (double)getProjectionFOVYDegrees:(id)a3
{
  objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1F121E3F8), "focalLengthAtFxTime:", a3.var1);
  double v4 = 0.0;
  if (fabs(v3) != INFINITY)
  {
    long double v5 = atan(1.0 / v3 * 36.0 * 0.5);
    return (v5 + v5) * 57.2957795;
  }
  return v4;
}

- (HGEquirectProjectParams)getParams:(SEL)a3 :(id *)a4 :(id)a5 :(id)a6
{
  *(_OWORD *)retstr->var0 = xmmword_1B7E736B0;
  *(_OWORD *)&retstr->var1[1] = xmmword_1B7E736B0;
  *(void *)&retstr->var2[2] = 0x423400003F800000;
  retstr->var4 = 45.0;
  *(void *)&retstr->var12 = 0;
  p_var12 = &retstr->var12;
  retstr->var5 = 0;
  *(void *)&retstr->var14 = 0;
  *(_WORD *)&retstr->var16 = 0;
  *(_OWORD *)retstr->var18 = xmmword_1B7E73E70;
  *(_OWORD *)retstr->var19 = xmmword_1B7E74540;
  *(_OWORD *)retstr->var20 = xmmword_1B7E73E70;
  *(_OWORD *)retstr->var21 = xmmword_1B7E74540;
  result = (HGEquirectProjectParams *)-[PAEEquirectProject getProjectionFOVYDegrees:](self, "getProjectionFOVYDegrees:", a4->var0.var1, a5, a6, a7);
  *(float *)&double v14 = v14;
  retstr->var3 = *(float *)&v14;
  if (self)
  {
    result = [(PAEEquirectProject *)self getViewMatrix:a4->var0.var1];
    float v15 = *(float *)&v22;
    float v16 = *(float *)&v23;
    float v17 = *(float *)&v24;
  }
  else
  {
    long long v24 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    float v17 = 0.0;
    float v16 = 0.0;
    float v15 = 0.0;
  }
  retstr->var0[0] = v15;
  retstr->var0[1] = v16;
  retstr->var0[2] = v17;
  if (a6)
  {
    int *p_var12 = [a6 width];
    result = (HGEquirectProjectParams *)[a6 height];
  }
  retstr->var1[0] = *((float *)&v22 + 1);
  retstr->var1[1] = *((float *)&v23 + 1);
  retstr->var1[2] = *((float *)&v24 + 1);
  retstr->var2[0] = *((float *)&v22 + 2);
  retstr->var2[1] = *((float *)&v23 + 2);
  retstr->var2[2] = *((float *)&v24 + 2);
  *(void *)&retstr->var12 = 0;
  if (a6)
  {
    retstr->var12 = [a6 width];
    result = (HGEquirectProjectParams *)[a6 height];
    retstr->var13 = (int)result;
    if (self)
    {
      result = [(PAESharedDefaultBase *)self getPixelTransformForImage:a6];
    }
    else
    {
      float64x2_t v20 = 0u;
      float64x2_t v21 = 0u;
      float64x2_t v18 = 0u;
      float64x2_t v19 = 0u;
    }
    *(float32x4_t *)retstr->var20 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v18), v19);
    *(float32x4_t *)retstr->var21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v20), v21);
  }
  *(void *)&retstr->var14 = 0;
  if (a5)
  {
    result = (HGEquirectProjectParams *)[a5 imageInfo];
    *(int32x2_t *)&retstr->var14 = vmovn_s64((int64x2_t)0);
    if (self)
    {
      result = [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a5];
    }
    else
    {
      float64x2_t v20 = 0u;
      float64x2_t v21 = 0u;
      float64x2_t v18 = 0u;
      float64x2_t v19 = 0u;
    }
    *(float32x4_t *)retstr->var18 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v18), v19);
    *(float32x4_t *)retstr->var19 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v20), v21);
    retstr->var17 = 1;
  }
  retstr->var5 = 0;
  return result;
}

- (BOOL)renderOutput:(id)a3 withInfo:(id *)a4
{
  if ([a3 imageType] == 3)
  {
    uint64_t v7 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
    int v8 = [(PAESharedDefaultBase *)self getRenderMode:a4->var0.var1];
    if (v8)
    {
      id v22 = 0;
      long long v9 = *(_OWORD *)&a4->var2;
      long long v10 = *(_OWORD *)&a4->var4;
      v21[0] = *(_OWORD *)&a4->var0.var0;
      v21[1] = v9;
      v21[2] = v10;
      [(PAESharedDefaultBase *)self getHeliumImage:&v22 layerOffsetX:0 layerOffsetY:0 requestInfo:v21 fromParm:1 atTime:a4->var0.var1];
      if (v22)
      {
        [v22 heliumRef];
        uint64_t v11 = *(void *)v20.var0;
        if (*(void *)v20.var0) {
          (*(void (**)(void))(**(void **)v20.var0 + 24))(*(void *)v20.var0);
        }
      }
      else
      {
        fwrite("PAEEquirectProject: failed to get equirect input image.\n", 0x38uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
        uint64_t v11 = 0;
      }
      long long v12 = *(_OWORD *)&a4->var2;
      v19[0] = *(_OWORD *)&a4->var0.var0;
      v19[1] = v12;
      v19[2] = *(_OWORD *)&a4->var4;
      [(PAEEquirectProject *)self getParams:v19 :a3 :v22 :v7];
      float v13 = (HGEquirectProject *)HGObject::operator new(0x240uLL);
      HGEquirectProject::HGEquirectProject(v13);
      float v14 = HGEquirectProject::setParams(v13, &v20);
      (*(void (**)(HGEquirectProject *, void, uint64_t, float))(*(void *)v13 + 120))(v13, 0, v11, v14);
      float v15 = (HGXForm *)HGObject::operator new(0x210uLL);
      HGXForm::HGXForm(v15);
      (*(void (**)(HGXForm *, void, HGEquirectProject *))(*(void *)v15 + 120))(v15, 0, v13);
      HGTransform::HGTransform((HGTransform *)v18);
      HGTransform::Translate((HGTransform *)v18, 0.0, (double)-v20.var15, 0.0);
      HGTransform::Scale((HGTransform *)v18, 1.0, -1.0, 1.0);
      (*(void (**)(HGXForm *, unsigned char *))(*(void *)v15 + 576))(v15, v18);
      float v17 = v15;
      (*(void (**)(HGXForm *))(*(void *)v15 + 16))(v15);
      [a3 setHeliumRef:&v17];
      if (v17) {
        (*(void (**)(HGXForm *))(*(void *)v17 + 24))(v17);
      }
      HGTransform::~HGTransform((HGTransform *)v18);
      (*(void (**)(HGXForm *))(*(void *)v15 + 24))(v15);
      (*(void (**)(HGEquirectProject *))(*(void *)v13 + 24))(v13);
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)frameCleanup
{
  return 1;
}

@end