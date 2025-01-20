@interface PAEBulge
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEBulge)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4;
@end

@implementation PAEBulge

- (PAEBulge)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEBulge;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithBool:0];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", v7, @"InputSizeLimit", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  id v7 = [(PAEFilterDefaultBase *)self getParamAPIWithError:a4];
  double v14 = 0.0;
  if (([v7 getFloatValue:&v14 fromParm:2 atFxTime:a3.var1] & 1) != 0
    && (char v13 = 0, ([v7 getBoolValue:&v13 fromParm:4 atFxTime:a3.var1] & 1) != 0))
  {
    if (v14 == 0.0 && v13 == 0) {
      uint64_t v9 = 6;
    }
    else {
      uint64_t v9 = 1;
    }
    return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInt:", v9, v14), @"PixelTransformSupport", 0);
  }
  else if (a4)
  {
    v11 = (objc_class *)objc_opt_class();
    id v12 = [(PAEFilterDefaultBase *)self getParamErrorFor:NSStringFromClass(v11)];
    id result = 0;
    *a4 = v12;
  }
  else
  {
    return 0;
  }
  return result;
}

- (BOOL)addParameters
{
  v11.receiver = self;
  v11.super_class = (Class)PAEBulge;
  [(PAESharedDefaultBase *)&v11 addParameters];
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
    id v7 = v4;
    unsigned int v8 = [v4 versionAtCreation];
    uint64_t v9 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", @"Bulge::Center", 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", @"Bulge::Amount", 0, 0), 2, 0, 300.0, 0.0, dbl_1B7E74A10[v8 < 2], 0.0, dbl_1B7E74430[v8 < 2], 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", @"Bulge::Scale", 0, 0), 3, 0, 0.5, -5.0, 5.0, -2.0, 2.0, 0.5);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", @"Bulge::Crop", 0, 0), 4, objc_msgSend(v7, "versionAtCreation") == 0, 33);
  }
  return v6;
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  BOOL v6 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v6)
  {
    unsigned __int8 v7 = 0;
    [v6 getBoolValue:&v7 fromParm:4 atFxTime:a4->var0.var1];
    *a3 = v7;
  }
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v9)
  {
    v10 = v9;
    double v24 = 150.0;
    [v9 getFloatValue:&v24 fromParm:2 atFxTime:a5->var0.var1];
    if (v24 == 0.0)
    {
      if (a4) {
        objc_msgSend(a4, "heliumRef", v24);
      }
      else {
        uint64_t v23 = 0;
      }
      [a3 setHeliumRef:&v23];
      if (v23) {
        (*(void (**)(uint64_t))(*(void *)v23 + 24))(v23);
      }
      LOBYTE(v9) = 1;
    }
    else
    {
      -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4, v24);
      double v21 = 0.5;
      double v22 = 0.5;
      [v10 getXValue:&v22 YValue:&v21 fromParm:1 atFxTime:a5->var0.var1];
      unint64_t v11 = [a4 width];
      double v22 = v22 * (double)v11;
      unint64_t v12 = [a4 height];
      double v21 = v21 * (double)v12;
      uint64_t v20 = 0x3FE0000000000000;
      [v10 getFloatValue:&v20 fromParm:3 atFxTime:a5->var0.var1];
      char v19 = 0;
      [v10 getBoolValue:&v19 fromParm:4 atFxTime:a5->var0.var1];
      LODWORD(v9) = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
      if (v9)
      {
        if ([a4 imageType] == 3)
        {
          if (a4) {
            [a4 heliumRef];
          }
          else {
            uint64_t v18 = 0;
          }
          if (v19)
          {
            uint64_t v16 = v18;
            if (v18) {
              (*(void (**)(uint64_t))(*(void *)v18 + 16))(v18);
            }
            [(PAESharedDefaultBase *)self smear:&v16 fromImage:a4 toImage:a4];
            uint64_t v13 = v17;
            if (v18 == v17)
            {
              if (v18) {
                (*(void (**)(void))(*(void *)v18 + 24))();
              }
            }
            else
            {
              if (v18)
              {
                (*(void (**)(void))(*(void *)v18 + 24))();
                uint64_t v13 = v17;
              }
              uint64_t v17 = 0;
              uint64_t v18 = v13;
            }
            if (v16) {
              (*(void (**)(uint64_t))(*(void *)v16 + 24))(v16);
            }
          }
          double v14 = (HgcBulge *)HGObject::operator new(0x1A0uLL);
          HgcBulge::HgcBulge(v14);
        }
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