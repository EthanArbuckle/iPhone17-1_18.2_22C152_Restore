@interface PAETwirl
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (PAETwirl)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
@end

@implementation PAETwirl

- (PAETwirl)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAETwirl;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"MayRemapTime", v4, @"PositionIndependent", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  id v7 = [(PAEFilterDefaultBase *)self getParamAPIWithError:a4];
  double v14 = 0.0;
  if (([v7 getFloatValue:&v14 fromParm:1 atFxTime:a3.var1] & 1) != 0
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
  v10.receiver = self;
  v10.super_class = (Class)PAETwirl;
  [(PAESharedDefaultBase *)&v10 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  uint64_t v4 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  if (!v5)
  {
    id v7 = (void *)v4;
    v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Twirl::Amount", 0, 0), 1, 0, 0.5, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Twirl::Twirl", 0, 0), 2, 0, 180.0, -12.5663706, 12.5663706);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Twirl::Center", 0, 0), 3, 0, 0.5, 0.5);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Twirl::Crop", 0, 0), 4, objc_msgSend(v7, "versionAtCreation") < 3, 33);
  }
  return v6;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  uint64_t v10 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A608];
  if (v10)
  {
    v11 = (void *)v10;
    LOBYTE(v10) = 0;
    if (a3)
    {
      if (a4)
      {
        double v18 = 0.0;
        [v11 getFloatValue:&v18 fromParm:1 atFxTime:a6->var0.var1];
        char v17 = 0;
        [v11 getBoolValue:&v17 fromParm:4 atFxTime:a6->var0.var1];
        unint64_t var0 = a5->var0;
        unint64_t var1 = a5->var1;
        if (!v17)
        {
          float v14 = v18 * (double)var0;
          signed int v15 = 2 * vcvtps_s32_f32(v14);
          var0 += v15;
          var1 += v15;
        }
        *a3 = var0;
        *a4 = var1;
        LOBYTE(v10) = 1;
      }
    }
  }
  return v10;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v10 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v9) {
    _ZF = v10 == 0;
  }
  else {
    _ZF = 1;
  }
  if (_ZF) {
    goto LABEL_6;
  }
  char v13 = (void *)v10;
  unint64_t var1 = a5->var0.var1;
  double v33 = 0.0;
  [v9 getFloatValue:&v33 fromParm:1 atFxTime:var1];
  if (v33 == 0.0)
  {
    if (a4) {
      objc_msgSend(a4, "heliumRef", v33);
    }
    else {
      v31[0] = 0;
    }
    [a3 setHeliumRef:v31];
    if (v31[0]) {
      (*(void (**)(void))(*(void *)v31[0] + 24))(v31[0]);
    }
    LOBYTE(v12) = 1;
    return v12;
  }
  unsigned int v15 = objc_msgSend(v13, "versionAtCreation", v33);
  unsigned int v16 = v15;
  BOOL v17 = v15 == 1 || v15 > 2;
  BOOL v18 = v17;
  id v19 = v18 ? a4 : a3;
  [v19 width];
  uint64_t v32 = 0;
  [v9 getFloatValue:&v32 fromParm:2 atFxTime:var1];
  [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
  __asm { FMOV            V0.2D, #0.5 }
  long long v30 = _Q0;
  [v9 getXValue:&v30 YValue:(char *)&v30 + 8 fromParm:3 atFxTime:var1];
  id v24 = v16 == 1 ? a3 : a4;
  [(PAESharedDefaultBase *)self convertRelativeToPixelCoordinates:&v30 withImage:v24];
  long long v30 = v29;
  char v28 = 0;
  [v9 getBoolValue:&v28 fromParm:4 atFxTime:a5->var0.var1];
  id v25 = v18 ? a3 : a4;
  if ([v25 imageType] != 3)
  {
LABEL_6:
    LOBYTE(v12) = 0;
    return v12;
  }
  int v12 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  if (v12)
  {
    if (a4) {
      [a4 heliumRef];
    }
    else {
      *(void *)&long long v29 = 0;
    }
    v26 = (HTwirl *)HGObject::operator new(0x1C0uLL);
    HTwirl::HTwirl(v26);
  }
  return v12;
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