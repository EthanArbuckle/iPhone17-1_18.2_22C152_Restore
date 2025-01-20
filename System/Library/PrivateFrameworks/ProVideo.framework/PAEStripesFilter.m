@interface PAEStripesFilter
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (PAEStripesFilter)initWithAPIManager:(id)a3;
- (id)properties;
- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4;
@end

@implementation PAEStripesFilter

- (PAEStripesFilter)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEStripesFilter;
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

- (BOOL)addParameters
{
  v7.receiver = self;
  v7.super_class = (Class)PAEStripesFilter;
  [(PAESharedDefaultBase *)&v7 addParameters];
  uint64_t v3 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v4, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"StripesFilter::Center", 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v4, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"StripesFilter::Angle", 0, 0), 2, 0, 0.0, 0.0, 6.28318531);
    objc_msgSend(v4, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"StripesFilter::Offset", 0, 0), 3, 0, 0.0, 0.0, 6.28318531);
  }
  return 1;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  if (a3) {
    BOOL v6 = a4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL result = !v6;
  if (!v6)
  {
    *a3 = a5->var0;
    *a4 = a5->var1;
  }
  return result;
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v9)
  {
    v10 = (void *)v9;
    signed int v11 = [a4 width];
    int v12 = [a4 height];
    double v36 = 0.0;
    v37[0] = 0.0;
    [v10 getXValue:v37 YValue:&v36 fromParm:1 atFxTime:a5->var0.var1];
    double v36 = (v36 + -0.5) * (double)v12;
    v37[0] = (v37[0] + -0.5) * (double)v11;
    double v35 = 0.0;
    [v10 getFloatValue:&v35 fromParm:2 atFxTime:a5->var0.var1];
    double v34 = 0.0;
    [v10 getFloatValue:&v34 fromParm:3 atFxTime:a5->var0.var1];
    double v33 = 0.0;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    if (a3)
    {
      [a3 imageInfo];
      double v13 = v33;
      if (*((void *)&v31 + 1))
      {
        double v34 = -v34;
        double v35 = -v35;
      }
    }
    else
    {
      double v13 = 0.0;
    }
    LODWORD(v9) = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
    if (v9)
    {
      if ([a4 imageType] == 3)
      {
        if (a4) {
          [a4 heliumRef];
        }
        else {
          uint64_t v28 = 0;
        }
        v14 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
        HGTextureWrap::HGTextureWrap(v14);
        HGTextureWrap::SetTextureWrapMode((uint64_t)v14, (const char *)2, v15);
        (*(void (**)(HGTextureWrap *, void, uint64_t))(*(void *)v14 + 120))(v14, 0, v28);
        HGTransform::HGTransform((HGTransform *)v27);
        HGTransform::Translate((HGTransform *)v27, -v37[0], v36, 0.0);
        HGTransform::Scale((HGTransform *)v27, v13, 1.0, 1.0);
        HGTransform::Rotate((HGTransform *)v27, v35 * 180.0 / 3.14159265, 0.0, 0.0, 1.0);
        HGTransform::Rotate((HGTransform *)v27, v34 * -180.0 / 3.14159265, 0.0, 0.0, 1.0);
        v16 = (HGXForm *)HGObject::operator new(0x210uLL);
        HGXForm::HGXForm(v16);
        (*(void (**)(HGXForm *, unsigned char *))(*(void *)v16 + 576))(v16, v27);
        (*(void (**)(HGXForm *, void, HGTextureWrap *))(*(void *)v16 + 120))(v16, 0, v14);
        v17 = (HGCrop *)HGObject::operator new(0x1A0uLL);
        HGCrop::HGCrop(v17);
        uint64_t v18 = HGRectMake4i(-v11, 0, v11, 1u);
        uint64_t v20 = v19;
        (*(void (**)(HGCrop *, void, HGXForm *))(*(void *)v17 + 120))(v17, 0, v16);
        (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v17 + 96))(v17, 0, (float)(int)v18, (float)SHIDWORD(v18), (float)(int)v20, (float)SHIDWORD(v20));
        v21 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
        HGTextureWrap::HGTextureWrap(v21);
        HGTextureWrap::SetTextureWrapMode((uint64_t)v21, (const char *)1, v22);
        (*(void (**)(HGTextureWrap *, void, HGCrop *))(*(void *)v21 + 120))(v21, 0, v17);
        HGTransform::HGTransform((HGTransform *)v26);
        HGTransform::Rotate((HGTransform *)v26, v35 * -57.2957795, 0.0, 0.0, 1.0);
        HGTransform::Scale((HGTransform *)v26, 1.0 / v13, 1.0, 1.0);
        HGTransform::Translate((HGTransform *)v26, v37[0], -v36, 0.0);
        v23 = (HGXForm *)HGObject::operator new(0x210uLL);
        HGXForm::HGXForm(v23);
        (*(void (**)(HGXForm *, unsigned char *))(*(void *)v23 + 576))(v23, v26);
        (*(void (**)(HGXForm *, void, HGTextureWrap *))(*(void *)v23 + 120))(v23, 0, v21);
        v25 = v23;
        (*(void (**)(HGXForm *))(*(void *)v23 + 16))(v23);
        [(PAESharedDefaultBase *)self crop:&v25 fromImage:a4 toImage:a3];
        [a3 setHeliumRef:&v25];
        if (v25) {
          (*(void (**)(HGXForm *))(*(void *)v25 + 24))(v25);
        }
        (*(void (**)(HGXForm *))(*(void *)v23 + 24))(v23);
        HGTransform::~HGTransform((HGTransform *)v26);
        (*(void (**)(HGTextureWrap *))(*(void *)v21 + 24))(v21);
        (*(void (**)(HGCrop *))(*(void *)v17 + 24))(v17);
        (*(void (**)(HGXForm *))(*(void *)v16 + 24))(v16);
        HGTransform::~HGTransform((HGTransform *)v27);
        (*(void (**)(HGTextureWrap *))(*(void *)v14 + 24))(v14);
        if (v28) {
          (*(void (**)(uint64_t))(*(void *)v28 + 24))(v28);
        }
        LOBYTE(v9) = 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
  }
  return v9;
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