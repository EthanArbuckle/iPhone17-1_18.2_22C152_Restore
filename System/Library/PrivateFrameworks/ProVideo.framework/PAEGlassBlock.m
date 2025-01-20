@interface PAEGlassBlock
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEGlassBlock)initWithAPIManager:(id)a3;
- (id)properties;
- (void)dealloc;
@end

@implementation PAEGlassBlock

- (PAEGlassBlock)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEGlassBlock;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAEGlassBlock;
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

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEGlassBlock;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"GlassBlock::Center", 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"GlassBlock::Scale", 0, 0), 2, 0, 2.8, 0.0, 10.0, 0.1, 10.0, 0.1);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"GlassBlock::Angle", 0, 0), 3, 0, 0.0, 0.0, 360.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"GlassBlock::TileSize", 0, 0), 4, 0, 65.0, 0.0, 1000.0, 0.0, 1000.0, 1.0);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v9)
  {
    v10 = v9;
    __asm { FMOV            V0.2D, #0.5 }
    long long v30 = _Q0;
    [v9 getXValue:&v30 YValue:(char *)&v30 + 8 fromParm:1 atFxTime:a5->var0.var1];
    [(PAESharedDefaultBase *)self convertRelativeToPixelCoordinates:&v30 withImage:a4];
    long long v30 = v20;
    double v29 = 0.0;
    [v10 getFloatValue:&v29 fromParm:2 atFxTime:a5->var0.var1];
    double v29 = 1.0 / v29;
    double v28 = 30.0;
    [v10 getFloatValue:&v28 fromParm:3 atFxTime:a5->var0.var1];
    uint64_t v27 = 0;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    if (a3)
    {
      [a3 imageInfo];
      double v16 = v28;
      if (*((void *)&v25 + 1))
      {
        double v16 = -v28;
        double v28 = -v28;
      }
    }
    else
    {
      double v16 = v28;
    }
    __sincos_stret(v16);
    double v22 = 0.0;
    [v10 getFloatValue:&v22 fromParm:4 atFxTime:a5->var0.var1];
    [(PAESharedDefaultBase *)self getScaleForImage:a4];
    double v22 = v21 * v22;
    id v17 = (id)[objc_alloc(NSClassFromString(&cfstr_Fxhostcapabili.isa)) initWithAPIManager:self->super.super._apiManager];
    if (a5->var2) {
      [v17 upscalesFields];
    }
    LODWORD(v9) = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
    if (v9)
    {
      if ([a4 imageType] == 3)
      {
        if (a4) {
          [a4 heliumRef];
        }
        v18 = (HgcGlassBlock *)HGObject::operator new(0x1B0uLL);
        HgcGlassBlock::HgcGlassBlock(v18);
      }
      LOBYTE(v9) = 0;
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