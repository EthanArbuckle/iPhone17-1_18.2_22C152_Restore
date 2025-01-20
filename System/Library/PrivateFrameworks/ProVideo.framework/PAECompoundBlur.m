@interface PAECompoundBlur
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (PAECompoundBlur)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAECompoundBlur

- (PAECompoundBlur)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAECompoundBlur;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  if (-[PAECompoundBlur properties]::once != -1) {
    dispatch_once(&-[PAECompoundBlur properties]::once, &__block_literal_global_23);
  }
  return (id)-[PAECompoundBlur properties]::sPropertiesDict;
}

uint64_t __29__PAECompoundBlur_properties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v1 = [NSNumber numberWithBool:0];
  uint64_t v2 = [NSNumber numberWithBool:0];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:0];
  uint64_t v6 = [NSNumber numberWithInt:3];
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, @"PositionIndependent", v2, @"MayRemapTime", v3, @"SupportsLargeRenderScale", v4, @"SupportsHeliumRendering", v5, @"InputSizeLimit", v6, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
  -[PAECompoundBlur properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  v7.receiver = self;
  v7.super_class = (Class)PAECompoundBlur;
  [(PAESharedDefaultBase *)&v7 addParameters];
  uint64_t v3 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"CompoundBlur::Amount", 0, 0), 1, 0, 7.0, 0.0, 300.0, 0.0, 32.0, 1.0);
    objc_msgSend(v4, "addImageReferenceWithName:parmId:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"CompoundBlur::Blur Map", 0, 0), 2, 0);
    objc_msgSend(v4, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"CompoundBlur::Map Channel", 0, 0), 3, 4, objc_msgSend((id)objc_msgSend(v5, "localizedStringForKey:value:table:", @"CompoundBlur::ChannelEntries", 0, 0), "componentsSeparatedByString:", @"|"), 1);
    objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"CompoundBlur::Invert Map", 0, 0), 4, 0, 33);
    objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"CompoundBlur::Stretch Map", 0, 0), 5, 0, 33);
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"CompoundBlur::Horizontal", 0, 0), 6, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"CompoundBlur::Vertical", 0, 0), 7, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
  }
  return 1;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  if ([(PAESharedDefaultBase *)self getRenderMode:a6->var0.var1])
  {
    *a3 = a5->var0;
    *a4 = a5->var1;
    return 1;
  }
  else
  {
    v12 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A608];
    if (a3) {
      BOOL v13 = v12 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    BOOL v14 = v13 || a4 == 0;
    char v15 = v14;
    if (!v14)
    {
      v16 = v12;
      double v24 = 0.0;
      [v12 getFloatValue:&v24 fromParm:1 atFxTime:a6->var0.var1];
      double v23 = 0.0;
      [v16 getFloatValue:&v23 fromParm:6 atFxTime:a6->var0.var1];
      double v23 = v23 * 0.01;
      double v22 = 0.0;
      [v16 getFloatValue:&v22 fromParm:7 atFxTime:a6->var0.var1];
      double v22 = v22 * 0.01;
      char v21 = 0;
      [v16 getBoolValue:&v21 fromParm:5 atFxTime:a6->var0.var1];
      int64x2_t v17 = *(int64x2_t *)&a5->var0;
      if (!v21)
      {
        v18.f64[0] = v23;
        float v19 = v24 + v24;
        v18.f64[1] = v22;
        int32x2_t v20 = vmovn_s64(vcvtq_s64_f64(vrndpq_f64(vmulq_n_f64(v18, v19))));
        int64x2_t v17 = vaddw_s32(v17, vadd_s32(v20, v20));
      }
      *a3 = v17.i64[0];
      *a4 = v17.u64[1];
    }
    return v15 ^ 1;
  }
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  int v9 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  uint64_t v10 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A608];
  if (v10)
  {
    v11 = (void *)v10;
    [(PAESharedDefaultBase *)self getScaleForImage:a4];
    double v13 = v43;
    double v12 = v44;
    if (v43 <= v44) {
      double v14 = v44;
    }
    else {
      double v14 = v43;
    }
    long double __x = 0.0;
    [v11 getFloatValue:&__x fromParm:1 atFxTime:a5->var0.var1];
    long double __x = __x * 0.5;
    double v41 = 0.0;
    [v11 getFloatValue:&v41 fromParm:6 atFxTime:a5->var0.var1];
    double v41 = v13 / v14 * (v41 * 0.01);
    double v40 = 0.0;
    [v11 getFloatValue:&v40 fromParm:7 atFxTime:a5->var0.var1];
    double v40 = v12 / v14 * (v40 * 0.01);
    int v39 = 0;
    [v11 getIntValue:&v39 fromParm:3 atFxTime:a5->var0.var1];
    char v38 = 0;
    [v11 getBoolValue:&v38 fromParm:4 atFxTime:a5->var0.var1];
    char v37 = 0;
    [v11 getBoolValue:&v37 fromParm:5 atFxTime:a5->var0.var1];
    int v15 = [a4 imageType];
    if (__x <= 0.0)
    {
      if (a4) {
        objc_msgSend(a4, "heliumRef", (double)__x);
      }
      else {
        *(void *)&v45[0] = 0;
      }
      [a3 setHeliumRef:v45];
      if (*(void *)&v45[0]) {
        (*(void (**)(void))(**(void **)&v45[0] + 24))(*(void *)&v45[0]);
      }
      LOBYTE(v10) = 1;
    }
    else
    {
      int v18 = v15;
      float v19 = -1.0;
      if (!v38) {
        float v19 = 1.0;
      }
      switch(v39)
      {
        case 1:
          *(void *)&long long v17 = 0;
          long long v32 = v17;
          *((float *)&v17 + 1) = v19;
          objc_msgSend(a4, "pixelAspect", v32, v17);
          break;
        case 2:
          objc_msgSend(a4, "pixelAspect", LODWORD(v19), *((void *)&v17 + 1), 0, *((void *)&v17 + 1));
          break;
        case 3:
          *(void *)&long long v17 = 0;
          long long v33 = v17;
          *((float *)&v17 + 1) = v19;
          objc_msgSend(a4, "pixelAspect", v17, v33);
          break;
        case 4:
          DWORD1(v17) = 0;
          *(float *)&long long v17 = v19 * 0.082;
          objc_msgSend(a4, "pixelAspect", v17, vmul_n_f32((float32x2_t)0x3F1C01A33E9E00D2, v19), *((void *)&v17 + 1));
          break;
        default:
          objc_msgSend(a4, "pixelAspect", 0, v16, LODWORD(v19), *((void *)&v17 + 1));
          break;
      }
      double v21 = v20;
      LOBYTE(v10) = 0;
      if (self->super.super._upscalesFields) {
        double v22 = 1.0;
      }
      else {
        double v22 = 2.0;
      }
      if (v9 && v18 == 3)
      {
        if (a4) {
          [a4 heliumRef];
        }
        else {
          uint64_t v36 = 0;
        }
        id v35 = 0;
        long long v23 = *(_OWORD *)&a5->var2;
        long long v24 = *(_OWORD *)&a5->var4;
        v34[0] = *(_OWORD *)&a5->var0.var0;
        v34[1] = v23;
        v34[2] = v24;
        [(PAESharedDefaultBase *)self getHeliumImage:&v35 layerOffsetX:0 layerOffsetY:0 requestInfo:v34 fromParm:2 atTime:a5->var0.var1];
        if (v35)
        {
          [v35 heliumRef];
        }
        else
        {
          id v35 = a4;
          if (v36) {
            (*(void (**)(uint64_t))(*(void *)v36 + 16))(v36);
          }
        }
        v25 = (HGModulatedBlur *)HGObject::operator new(0x1D0uLL);
        HGModulatedBlur::HGModulatedBlur(v25);
        float v26 = __x;
        (*(void (**)(HGModulatedBlur *, void, float, double, double, double))(*(void *)v25 + 96))(v25, 0, v26, 0.0, 0.0, 0.0);
        float v27 = v13 * v41 / v21;
        float v28 = v12 * v40 / v22;
        (*(void (**)(HGModulatedBlur *, uint64_t, float, float, double, double))(*(void *)v25 + 96))(v25, 1, v27, v28, 0.0, 0.0);
        long long v46 = xmmword_1B7E7446C;
        v47[0] = unk_1B7E7447C;
        *(_OWORD *)((char *)v47 + 12) = unk_1B7E74488;
        float v29 = ceil(log2(__x)) + 1.0;
        if (v29 <= 0.0) {
          float v29 = 1.0;
        }
        HGModulatedBlur::setBlurValues(v25, (const float *)&v46, (unint64_t)v29);
        (*(void (**)(HGModulatedBlur *, void, uint64_t))(*(void *)v25 + 120))(v25, 0, v36);
        v30 = (HGColorMatrix *)HGObject::operator new(0x1F0uLL);
        HGColorMatrix::HGColorMatrix(v30);
      }
    }
  }
  return v10;
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