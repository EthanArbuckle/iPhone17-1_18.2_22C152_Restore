@interface PAESimpleBorder
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (PAESimpleBorder)initWithAPIManager:(id)a3;
- (id)properties;
- (void)dealloc;
@end

@implementation PAESimpleBorder

- (PAESimpleBorder)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAESimpleBorder;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAESimpleBorder;
  [(PAESharedDefaultBase *)&v2 dealloc];
}

- (id)properties
{
  objc_super v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  double v19 = 0.0;
  [v10 getFloatValue:&v19 fromParm:1 atFxTime:a6->var0.var1];
  int v18 = 0;
  [v10 getIntValue:&v18 fromParm:3 atFxTime:a6->var0.var1];
  double var3 = a6->var3;
  double var4 = a6->var4;
  double var8 = a5->var8;
  double v14 = (double)a5->var0 / var3 * var8;
  double v15 = (double)a5->var1 / var4;
  if (v18 == 2)
  {
    double v16 = v19 + v19;
    goto LABEL_5;
  }
  if (v18 == 1)
  {
    double v16 = v19;
LABEL_5:
    double v14 = v14 + v16;
    double v15 = v15 + v16;
  }
  *a3 = (int)vcvtpd_s64_f64(var3 * (v14 / var8));
  *a4 = (int)vcvtpd_s64_f64(var4 * v15);
  return 1;
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAESimpleBorder;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"SimpleBorder::Size", 0, 0), 1, 0, 10.0, 0.0, 1000.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"SimpleBorder::Color", 0, 0), 2, 0, 0.0, 0.0, 0.0, 1.0);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"SimpleBorder::Border Placement", 0, 0), 3, 0, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"SimpleBorder::Inside", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"SimpleBorder::Overlap", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"SimpleBorder::Outside", 0, 0), 0), 1);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (!v9) {
    return 0;
  }
  v10 = (void *)v9;
  double v23 = 0.0;
  long long v21 = 0u;
  *(_OWORD *)v22 = 0u;
  int v20 = 0;
  [(PAESharedDefaultBase *)self getPixelTransformForImage:a3];
  [v10 getFloatValue:&v23 fromParm:1 atFxTime:a5->var0.var1];
  [v10 getRedValue:&v21 greenValue:(char *)&v21 + 8 blueValue:v22 alphaValue:&v22[1] fromParm:2 atFxTime:a5->var0.var1];
  *(double *)&long long v21 = v22[1] * *(double *)&v21;
  *((double *)&v21 + 1) = v22[1] * *((double *)&v21 + 1);
  v22[0] = v22[1] * v22[0];
  [v10 getIntValue:&v20 fromParm:3 atFxTime:a5->var0.var1];
  int v11 = [a4 imageType];
  if ([(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1]) {
    BOOL v12 = v11 == 3;
  }
  else {
    BOOL v12 = 0;
  }
  BOOL v13 = v12;
  if (v12)
  {
    if (a4) {
      [a4 heliumRef];
    }
    else {
      uint64_t v18 = 0;
    }
    [(PAESharedDefaultBase *)self getImageBoundary:a4];
    v17[0] = (__int128)vcvtq_f64_f32(v16[0]);
    v17[1] = (__int128)vcvtq_f64_f32(v16[1]);
    float v14 = v23;
    fxSimpleBorder(v17, v19, v20, (HGNode **)v16, v14, v14);
    [a3 setHeliumRef:v16];
    if (v16[0]) {
      (*(void (**)(void))(**(void **)v16 + 24))(*(void *)v16);
    }
    if (v18) {
      (*(void (**)(uint64_t))(*(void *)v18 + 24))(v18);
    }
  }
  return v13;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  *a6 = 1;
  *a5 = 0;
  long long v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  [(PAESharedDefaultBase *)self overrideFrameSetupForRenderMode:v8 hardware:a5 software:a6];
  return 1;
}

@end