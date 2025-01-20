@interface PAEColorSolid
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4;
- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5;
- (PAEColorSolid)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEColorSolid

- (PAEColorSolid)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEColorSolid;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  if (-[PAEColorSolid properties]::once != -1) {
    dispatch_once(&-[PAEColorSolid properties]::once, &__block_literal_global_33);
  }
  return (id)-[PAEColorSolid properties]::sPropertiesDict;
}

uint64_t __27__PAEColorSolid_properties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v1 = [NSNumber numberWithBool:1];
  uint64_t v2 = [NSNumber numberWithInt:6];
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", &unk_1F11EC2B0, @"PixelTransformSupport", v1, @"SupportsHeliumRendering", v2, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithInteger:", 3), @"AutoColorProcessingSupport", 0);
  -[PAEColorSolid properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  v5.receiver = self;
  v5.super_class = (Class)PAEColorSolid;
  [(PAESharedDefaultBase *)&v5 addParameters];
  v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3) {
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ColorSolid::Color", 0, 0), 1, 0, 0.0, 0.0, 1.0);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4
{
  v7 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v7)
  {
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v26 = 0;
    [v7 getRedValue:&v28 greenValue:&v27 blueValue:&v26 fromParm:1 atFxTime:a4->var0.var1];
    LODWORD(v7) = [(PAESharedDefaultBase *)self getRenderMode:a4->var0.var1];
    if (v7)
    {
      if ([a3 imageType] == 3)
      {
        [a3 bounds];
        double v9 = v8;
        double v11 = v10;
        [(PAESharedDefaultBase *)self getPixelTransformForImage:a3];
        double v21 = v9 * -0.5;
        double v22 = v11 * -0.5;
        double v23 = v9;
        double v24 = v11;
        if (PCMatrix44Tmpl<double>::transformRect<double>(v25, &v21, (uint64_t)&v21)
          && v21 >= -2147483650.0
          && v21 <= 2147483650.0
          && (double v13 = v21 + v23, HIDWORD(v14) = -1042284544, v21 + v23 >= -2147483650.0)
          && v13 <= 2147483650.0
          && v22 >= -2147483650.0
          && v22 <= 2147483650.0
          && (double v15 = v22 + v24, v22 + v24 <= 2147483650.0)
          && v15 >= -2147483650.0)
        {
          int v16 = vcvtmd_s64_f64(v21);
          int v17 = vcvtmd_s64_f64(v22);
          LODWORD(v14) = vcvtpd_s64_f64(v13);
          LODWORD(v12) = vcvtpd_s64_f64(v15);
          uint64_t v18 = v14 | (v12 << 32);
        }
        else
        {
          int v16 = 0x80000000;
          int v17 = 0x80000000;
          uint64_t v18 = 0x7FFFFFFF7FFFFFFFLL;
        }
        v19 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
        v29.var0 = v16;
        v29.var1 = v17;
        *(void *)&v29.var2 = v18;
        HGSolidColor::HGSolidColor(v19, v29);
      }
      LOBYTE(v7) = 0;
    }
  }
  return (char)v7;
}

- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5
{
  *a5 = 0;
  *a4 = 0;
  long long v5 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v7);
  return 1;
}

@end