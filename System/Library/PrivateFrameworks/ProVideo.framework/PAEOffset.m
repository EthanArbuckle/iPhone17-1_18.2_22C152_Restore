@interface PAEOffset
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEOffset)initWithAPIManager:(id)a3;
- (id)properties;
- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4;
@end

@implementation PAEOffset

- (PAEOffset)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEOffset;
  return [(PAETile *)&v4 initWithAPIManager:a3];
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
  v2 = (void *)[(PROAPIAccessing *)self->super.super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v2)
  {
    uint64_t v3 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Offset::Horizontal Offset", 0, 0), 1, 0, 0.0, -10000.0, 10000.0, -1000.0, 1000.0, 0.1);
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Offset::Vertical Offset", 0, 0), 2, 0, 0.0, -10000.0, 10000.0, -1000.0, 1000.0, 0.1);
  }
  return v2 != 0;
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v9 = (void *)[(PROAPIAccessing *)self->super.super.super._apiManager apiForProtocol:&unk_1F121D130];
  v10 = v9;
  if (v9)
  {
    double v29 = 0.0;
    double v30 = 0.0;
    [v9 getFloatValue:&v30 fromParm:1 atFxTime:a5->var0.var1];
    [v10 getFloatValue:&v29 fromParm:2 atFxTime:a5->var0.var1];
    uint64_t v28 = 0;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    if (a3) {
      [a3 imageInfo];
    }
    [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a4];
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
    double v11 = v29;
    if (*((void *)&v26 + 1)) {
      double v11 = -v29;
    }
    double v29 = v11 / 100.0 - floor(v11 / 100.0);
    double v30 = v30 / 100.0 - floor(v30 / 100.0);
    if ([(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1]
      && [a4 imageType] == 3)
    {
      if (a4) {
        [a4 heliumRef];
      }
      else {
        uint64_t v23 = 0;
      }
      [(PAESharedDefaultBase *)self getScaleForImage:a4];
      uint64_t v19 = v23;
      if (v23) {
        (*(void (**)(uint64_t))(*(void *)v23 + 16))(v23);
      }
      double v12 = v30;
      unint64_t v13 = [a4 width];
      double v14 = v21;
      double v15 = v29;
      unint64_t v16 = [a4 height];
      *(double *)v18 = v21;
      *(double *)&v18[1] = v22;
      [(PAETile *)self transformAndTile:&v19 withXValue:v18 YValue:a4 skew:v12 * (double)v13 * v14 scale:v15 * (double)v16 * v22 stretch:0.0 rotation:1.0 resolution:1.0 inputImage:0.0];
      if (v19) {
        (*(void (**)(uint64_t))(*(void *)v19 + 24))(v19);
      }
      [a3 setHeliumRef:&v20];
      if (v20) {
        (*(void (**)(uint64_t))(*(void *)v20 + 24))(v20);
      }
      if (v23) {
        (*(void (**)(uint64_t))(*(void *)v23 + 24))(v23);
      }
    }
  }
  return v10 != 0;
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