@interface PAEHalftone
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEHalftone)initWithAPIManager:(id)a3;
- (id)properties;
- (void)compute_2x2_matrix:(double *)a3 fromAngle:(double)a4 andScale:(double)a5;
- (void)dealloc;
@end

@implementation PAEHalftone

- (PAEHalftone)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEHalftone;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAEHalftone;
  [(PAESharedDefaultBase *)&v2 dealloc];
}

- (id)properties
{
  objc_super v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:65792];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:590080];
  uint64_t v9 = [NSNumber numberWithBool:1];
  uint64_t v10 = [NSNumber numberWithInt:6];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", v7, @"SDRWorkingSpace", v8, @"HDRWorkingSpace", v9, @"SupportsInternalMixing", v10, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1),
               @"AutoColorProcessingSupport",
               0);
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEHalftone;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Halftone::Center", 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Halftone::Angle", 0, 0), 2, 0, 45.0, 0.0, 360.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Halftone::Scale", 0, 0), 3, 0, 6.0, 2.0, 100.0, 2.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Halftone::Contrast", 0, 0), 4, 0, 0.5, 0.0, 0.99, 0.0, 0.99, 0.1);
  }
  return v3 != 0;
}

- (void)compute_2x2_matrix:(double *)a3 fromAngle:(double)a4 andScale:(double)a5
{
  float v6 = 1.0 / a5;
  float v7 = a4;
  __float2 v8 = __sincosf_stret(v7);
  *a3 = (float)((float)(v8.__cosval + (float)(v8.__sinval * 0.0)) * v6);
  a3[1] = (float)((float)((float)(v8.__cosval * 0.0) - v8.__sinval) * v6);
  a3[2] = (float)(v8.__sinval * v6);
  a3[3] = (float)(v8.__cosval * v6);
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v26[4] = *MEMORY[0x1E4F143B8];
  __float2 v8 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  uint64_t v10 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F12189D0];
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v12 = v11 || v10 == 0;
  char v13 = v12;
  if (!v12)
  {
    v14 = (void *)v10;
    int v15 = [v9 versionAtCreation];
    uint64_t v24 = 0x3FE0000000000000;
    uint64_t v25 = 0x3FE0000000000000;
    double v23 = 45.0;
    uint64_t v21 = 0x3FE0000000000000;
    double v22 = 6.0;
    [a4 width];
    [a4 height];
    [v8 getXValue:&v25 YValue:&v24 fromParm:1 atFxTime:a5->var0.var1];
    [v8 getFloatValue:&v23 fromParm:2 atFxTime:a5->var0.var1];
    [v8 getFloatValue:&v22 fromParm:3 atFxTime:a5->var0.var1];
    [v8 getFloatValue:&v21 fromParm:4 atFxTime:a5->var0.var1];
    [v8 mixAmountAtTime:a5->var0.var1];
    [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a4];
    [(PAEHalftone *)self compute_2x2_matrix:v26 fromAngle:v23 andScale:v22];
    objc_msgSend((id)objc_msgSend(v14, "colorMatrixFromDesiredRGBToYCbCrAtTime:", a5->var0.var1), "matrix");
    if ([(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1])
    {
      if ([a4 imageType] == 3)
      {
        if (a4) {
          [a4 heliumRef];
        }
        else {
          v20 = 0;
        }
        if (!a5->var5)
        {
          v16 = (HGColorClamp *)HGObject::operator new(0x1C0uLL);
          HGColorClamp::HGColorClamp(v16);
        }
        if (!v15)
        {
          v17 = (HGGamma *)HGObject::operator new(0x1B0uLL);
          HGGamma::HGGamma(v17);
          (*(void (**)(HGGamma *, void, float, double, double, double))(*(void *)v17 + 96))(v17, 0, 1.1111, 0.0, 0.0, 0.0);
          (*(void (**)(HGGamma *, void, HGNode *))(*(void *)v17 + 120))(v17, 0, v20);
          if (v20 != (HGNode *)v17)
          {
            if (v20) {
              (*(void (**)(void))(*(void *)v20 + 24))();
            }
            (*(void (**)(HGGamma *))(*(void *)v17 + 16))(v17);
          }
          (*(void (**)(HGGamma *))(*(void *)v17 + 24))(v17);
        }
        v18 = (HgcHalftone *)HGObject::operator new(0x1A0uLL);
        HgcHalftone::HgcHalftone(v18);
      }
    }
  }
  return v13 ^ 1;
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