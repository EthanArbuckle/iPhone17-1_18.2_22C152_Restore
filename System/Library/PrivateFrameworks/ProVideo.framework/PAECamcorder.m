@interface PAECamcorder
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAECamcorder)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAECamcorder

- (PAECamcorder)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAECamcorder;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:65792];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:590080];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", v7, @"SDRWorkingSpace", v8, @"HDRWorkingSpace", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v16.receiver = self;
  v16.super_class = (Class)PAECamcorder;
  [(PAESharedDefaultBase *)&v16 addParameters];
  uint64_t v3 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (!v3) {
    return 1;
  }
  uint64_t v4 = (void *)v3;
  uint64_t v5 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v6 = objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Camcorder::Offset Red X", 0, 0), 1, 0, 0.0, -100.0, 100.0, -100.0, 100.0, 0.1);
  int v7 = v6 & objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Camcorder::Offset Red Y", 0, 0), 2, 0, 0.0, -100.0, 100.0, -100.0, 100.0, 0.1);
  int v8 = objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Camcorder::Offset Green X", 0, 0), 4, 0, 0.0, -100.0, 100.0, -100.0, 100.0, 0.1);
  int v9 = v7 & v8 & objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Camcorder::Offset Green Y", 0, 0), 5, 0, 0.0, -100.0, 100.0, -100.0, 100.0, 0.1);
  int v10 = objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Camcorder::Offset Blue X", 0, 0), 7, 0, 0.0, -100.0, 100.0, -100.0, 100.0, 0.1);
  int v11 = v10 & objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Camcorder::Offset Blue Y", 0, 0), 8, 0, 0.0, -100.0, 100.0, -100.0, 100.0, 0.1);
  int v12 = v9 & v11 & objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Camcorder::Blur Amount", 0, 0), 9, 0, 0.0, 0.0, 50.0, 0.0, 50.0, 0.1);
  int v13 = objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Camcorder::Blur Red", 0, 0), 10, 0, 0);
  int v14 = v13 & objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Camcorder::Blur Green", 0, 0), 11, 0, 0);
  return v12 & v14 & objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Camcorder::Blur Blue", 0, 0), 12, 0, 0);
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  int v8 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v8)
  {
    int v9 = v8;
    double v36 = 0.0;
    double v37 = 0.0;
    double v34 = 0.0;
    double v35 = 0.0;
    double v32 = 0.0;
    double v33 = 0.0;
    double v31 = 0.0;
    __int16 v30 = 0;
    char v29 = 0;
    [v8 getFloatValue:&v37 fromParm:1 atFxTime:a5->var0.var1];
    [v9 getFloatValue:&v36 fromParm:2 atFxTime:a5->var0.var1];
    [v9 getFloatValue:&v35 fromParm:4 atFxTime:a5->var0.var1];
    [v9 getFloatValue:&v34 fromParm:5 atFxTime:a5->var0.var1];
    [v9 getFloatValue:&v33 fromParm:7 atFxTime:a5->var0.var1];
    [v9 getFloatValue:&v32 fromParm:8 atFxTime:a5->var0.var1];
    [v9 getFloatValue:&v31 fromParm:9 atFxTime:a5->var0.var1];
    [v9 getBoolValue:(char *)&v30 + 1 fromParm:10 atFxTime:a5->var0.var1];
    [v9 getBoolValue:&v30 fromParm:11 atFxTime:a5->var0.var1];
    [v9 getBoolValue:&v29 fromParm:12 atFxTime:a5->var0.var1];
    double var3 = a5->var3;
    double var4 = a5->var4;
    double v36 = var4 * v36;
    double v37 = var3 * v37;
    double v34 = var4 * v34;
    double v35 = var3 * v35;
    double v32 = var4 * v32;
    double v33 = var3 * v33;
    v28 = 0;
    if (a4) {
      [a4 heliumRef];
    }
    else {
      uint64_t v27 = 0;
    }
    int v12 = (HgcCamcorder *)HGObject::operator new(0x1B0uLL);
    HgcCamcorder::HgcCamcorder(v12);
    (*(void (**)(HgcCamcorder *, void, uint64_t))(*(void *)v12 + 120))(v12, 0, v27);
    float v13 = v37;
    float v14 = v35;
    float v15 = v33;
    (*(void (**)(HgcCamcorder *, void, float, float, float, double))(*(void *)v12 + 96))(v12, 0, v13, v14, v15, 0.0);
    float v16 = v36;
    float v17 = v34;
    float v18 = v32;
    (*(void (**)(HgcCamcorder *, uint64_t, float, float, float, double))(*(void *)v12 + 96))(v12, 1, v16, v17, v18, 0.0);
    v19 = (HGaussianBlur *)HGObject::operator new(0x1B0uLL);
    HGaussianBlur::HGaussianBlur(v19);
    float v20 = v31;
    HGaussianBlur::init(v19, v20, 1.0, 1.0, 0, 0, 0);
    (*(void (**)(HGaussianBlur *, void, HgcCamcorder *))(*(void *)v19 + 120))(v19, 0, v12);
    if (HIBYTE(v30)) {
      float v21 = 1.0;
    }
    else {
      float v21 = 0.0;
    }
    if ((_BYTE)v30) {
      float v22 = 1.0;
    }
    else {
      float v22 = 0.0;
    }
    if (v29) {
      float v23 = 1.0;
    }
    else {
      float v23 = 0.0;
    }
    v24 = (HgcChannelBlur *)HGObject::operator new(0x1A0uLL);
    HgcChannelBlur::HgcChannelBlur(v24);
    (*(void (**)(HgcChannelBlur *, uint64_t, HGaussianBlur *))(*(void *)v24 + 120))(v24, 1, v19);
    (*(void (**)(HgcChannelBlur *, void, float, float, float, float))(*(void *)v24 + 96))(v24, 0, v21, v22, v23, 1.0);
    (*(void (**)(HgcChannelBlur *, void, HgcCamcorder *))(*(void *)v24 + 120))(v24, 0, v12);
    uint64_t v25 = *(void *)v24;
    v28 = v24;
    (*(void (**)(HgcChannelBlur *))(v25 + 16))(v24);
    [a3 setHeliumRef:&v28];
    (*(void (**)(HgcChannelBlur *))(*(void *)v24 + 24))(v24);
    (*(void (**)(HGaussianBlur *))(*(void *)v19 + 24))(v19);
    (*(void (**)(HgcCamcorder *))(*(void *)v12 + 24))(v12);
    if (v27) {
      (*(void (**)(uint64_t))(*(void *)v27 + 24))(v27);
    }
    if (v28) {
      (*(void (**)(HgcChannelBlur *))(*(void *)v28 + 24))(v28);
    }
  }
  return 1;
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