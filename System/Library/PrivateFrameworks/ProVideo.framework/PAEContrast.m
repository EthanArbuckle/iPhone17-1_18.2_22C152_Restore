@interface PAEContrast
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (CGPoint)calculateBezier:(double)a3 startPt:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6 endPt:(CGPoint)a7;
- (PAEContrast)initWithAPIManager:(id)a3;
- (id)properties;
- (void)generateLut:(RGBAfPixel *)a3 forContrast:(double)a4 andPivot:(double)a5;
@end

@implementation PAEContrast

- (PAEContrast)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEContrast;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  if (-[PAEContrast properties]::once != -1) {
    dispatch_once(&-[PAEContrast properties]::once, &__block_literal_global_42);
  }
  return (id)-[PAEContrast properties]::sPropertiesDict;
}

uint64_t __25__PAEContrast_properties__block_invoke()
{
  id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v0 = [NSNumber numberWithInt:6];
  uint64_t v1 = [NSNumber numberWithBool:1];
  uint64_t v2 = [NSNumber numberWithBool:1];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:65792];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:590080];
  uint64_t v8 = [NSNumber numberWithBool:1];
  uint64_t result = objc_msgSend(v10, "initWithObjectsAndKeys:", v0, @"PixelTransformSupport", v1, @"PixelIndependent", v2, @"PositionIndependent", v3, @"MayRemapTime", v4, @"SupportsLargeRenderScale", v5, @"SupportsHeliumRendering", v6, @"SDRWorkingSpace", v7, @"HDRWorkingSpace", v8,
             @"SupportsInternalMixing",
             [NSNumber numberWithUnsignedInteger:1],
             @"AutoColorProcessingSupport",
             0);
  -[PAEContrast properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  v7.receiver = self;
  v7.super_class = (Class)PAEContrast;
  [(PAESharedDefaultBase *)&v7 addParameters];
  uint64_t v3 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v5 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
    objc_msgSend(v5, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Contrast::Contrast", 0, 0), 1, 0, 1.0, 0.0, 10.0, 0.0, 2.0, 0.1);
    objc_msgSend(v5, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Contrast::Pivot", 0, 0), 2, 0, 0.5, 0.0, 1.0, 0.0, 1.0, 0.1);
    objc_msgSend(v5, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Contrast::Bezier", 0, 0), 4, 0, 1);
    objc_msgSend(v5, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Contrast::Luma", 0, 0), 5, 0, 1);
    objc_msgSend(v5, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Contrast::Clip", 0, 0), 3, 0, objc_msgSend((id)objc_msgSend(v4, "localizedStringForKey:value:table:", @"Contrast::Clip Values", 0, 0), "componentsSeparatedByString:", @"|"), 1);
  }
  return v3 != 0;
}

- (CGPoint)calculateBezier:(double)a3 startPt:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6 endPt:(CGPoint)a7
{
  double v7 = 1.0 - a3;
  double v8 = v7 * (v7 * v7);
  double v9 = v7 * v7 * 3.0 * a3;
  CGFloat v10 = a4.x * v8 + a5.x * v9;
  double v11 = a3 * a3 * ((1.0 - a3) * 3.0);
  double v12 = v11 * a6.x + v10;
  double v13 = a3 * a3 * a3;
  double v14 = v13 * a7.x + v12;
  double v15 = v13 * a7.y + v11 * a6.y + a4.y * v8 + a5.y * v9;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)generateLut:(RGBAfPixel *)a3 forContrast:(double)a4 andPivot:(double)a5
{
  uint64_t v5 = MEMORY[0x1F4188790](self);
  double v7 = v6;
  uint64_t v9 = v8;
  CGFloat v10 = (void *)v5;
  v28[2047] = *MEMORY[0x1E4F143B8];
  double v12 = v6 + -1.0 + 1.0;
  __double2 v13 = __sincos_stret((1.0 - (v11 + -1.0)) * 1.57079633 * 0.5);
  unint64_t v14 = 0;
  double v15 = v28;
  do
  {
    if (v14 > 0x1FF) {
      objc_msgSend(v10, "calculateBezier:startPt:controlPoint1:controlPoint2:endPt:", (double)((int)v14 - 512) / 511.0, v7, v7, v7, v7, (v12 + -1.0) * v13.__cosval - v13.__sinval * 0.0 + 1.0, (v12 + -1.0) * v13.__sinval + v13.__cosval * 0.0 + 1.0, 0x3FF0000000000000, 0x3FF0000000000000);
    }
    else {
      objc_msgSend(v10, "calculateBezier:startPt:controlPoint1:controlPoint2:endPt:", (double)(int)v14 * 0.001953125, 0.0, 0.0, v13.__cosval * v7 - v13.__sinval * 0.0, v13.__sinval * v7 + v13.__cosval * 0.0, v7, v7, *(void *)&v7, *(void *)&v7);
    }
    *(v15 - 1) = v16;
    *double v15 = v17;
    ++v14;
    v15 += 2;
  }
  while (v14 != 1024);
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  do
  {
    double v20 = (double)(int)v18 * 0.0009765625;
    uint64_t v21 = (v19 << 32) - 0x100000000;
    v22 = (double *)&v28[2 * (int)v19 + 1];
    uint64_t v19 = (int)v19 - 1;
    do
    {
      double v23 = *v22;
      v22 += 2;
      double v24 = v23;
      v21 += 0x100000000;
      ++v19;
    }
    while (v23 <= v20);
    double v25 = *(double *)&v27[(v21 >> 28) + 8]
        + (v20 - *(double *)&v27[v21 >> 28])
        / (v24 - *(double *)&v27[v21 >> 28])
        * (*(v22 - 1) - *(double *)&v27[(v21 >> 28) + 8]);
    *(float *)&double v25 = v25;
    v26 = (int32x2_t *)(v9 + 16 * v18);
    int32x2_t *v26 = vdup_lane_s32(*(int32x2_t *)&v25, 0);
    v26[1].i32[0] = LODWORD(v25);
    v26[1].i32[1] = 1065353216;
    ++v18;
  }
  while (v18 != 1024);
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  CGFloat v10 = v9;
  if (v9)
  {
    double v29 = 0.0;
    double v30 = 0.0;
    __int16 v28 = 0;
    int v27 = 0;
    [v9 getFloatValue:&v30 fromParm:1 atFxTime:a5->var0.var1];
    [v10 getFloatValue:&v29 fromParm:2 atFxTime:a5->var0.var1];
    [v10 getIntValue:&v27 fromParm:3 atFxTime:a5->var0.var1];
    [v10 getBoolValue:(char *)&v28 + 1 fromParm:4 atFxTime:a5->var0.var1];
    [v10 getBoolValue:&v28 fromParm:5 atFxTime:a5->var0.var1];
    int v11 = v27;
    [v10 mixAmountAtTime:a5->var0.var1];
    double v13 = v12;
    if (a4) {
      [a4 heliumRef];
    }
    else {
      uint64_t v26 = 0;
    }
    unsigned int v14 = v11 & 0xFFFFFFFD;
    unsigned int v15 = v11 & 0xFFFFFFFE;
    if (HIBYTE(v28))
    {
      uint64_t v16 = HGRectMake4i(0, 0, 0x400u, 1u);
      uint64_t v18 = v17;
      uint64_t v19 = (HGBitmap *)HGObject::operator new(0x80uLL);
      HGBitmap::HGBitmap(v19, v16, v18, 28);
      [(PAEContrast *)self generateLut:*((void *)v19 + 10) forContrast:v30 andPivot:v29];
      [v10 getFloatValue:&v30 fromParm:1 atFxTime:a5->var0.var1];
      [v10 getFloatValue:&v29 fromParm:2 atFxTime:a5->var0.var1];
      [v10 getIntValue:&v27 fromParm:3 atFxTime:a5->var0.var1];
      [v10 mixAmountAtTime:a5->var0.var1];
      double v20 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
      HGBitmapLoader::HGBitmapLoader(v20, v19);
      if ((_BYTE)v28)
      {
        v24[2] = v26;
        if (v26) {
          (*(void (**)(uint64_t))(*(void *)v26 + 16))(v26);
        }
        v24[1] = v20;
        if (v20) {
          (*(void (**)(HGBitmapLoader *))(*(void *)v20 + 16))(v20);
        }
        createContrastBezierLumaNode();
      }
      v23[2] = v26;
      if (v26) {
        (*(void (**)(uint64_t))(*(void *)v26 + 16))(v26);
      }
      v23[1] = v20;
      if (v20) {
        (*(void (**)(HGBitmapLoader *))(*(void *)v20 + 16))(v20);
      }
      createContrastBezierRGBNode();
    }
    if ((_BYTE)v28)
    {
      v23[0] = v26;
      if (v26) {
        (*(void (**)(uint64_t))(*(void *)v26 + 16))(v26);
      }
      createContrastLumaNode(v23, v15 == 2, v14 == 1, &v25, v30, v29, v13);
      if (v23[0]) {
        (*(void (**)(void))(*(void *)v23[0] + 24))(v23[0]);
      }
      v24[0] = v25;
      if (v25) {
        (*(void (**)(HgcContrastLuma *))(*(void *)v25 + 16))(v25);
      }
      [a3 setHeliumRef:v24];
      if (v24[0]) {
        (*(void (**)(void))(*(void *)v24[0] + 24))(v24[0]);
      }
      if (v25) {
        (*(void (**)(HgcContrastLuma *))(*(void *)v25 + 24))(v25);
      }
    }
    else
    {
      uint64_t v22 = v26;
      if (v26) {
        (*(void (**)(uint64_t))(*(void *)v26 + 16))(v26);
      }
      createContrastRGBNode(&v22, v15 == 2, v14 == 1, &v25, v30, v29, v13);
      if (v22) {
        (*(void (**)(uint64_t))(*(void *)v22 + 24))(v22);
      }
      v24[0] = v25;
      if (v25) {
        (*(void (**)(HgcContrastLuma *))(*(void *)v25 + 16))(v25);
      }
      objc_msgSend(a3, "setHeliumRef:", v24, v22);
      if (v24[0]) {
        (*(void (**)(void))(*(void *)v24[0] + 24))(v24[0]);
      }
      if (v25) {
        (*(void (**)(HgcContrastLuma *))(*(void *)v25 + 24))(v25);
      }
    }
    if (v26) {
      (*(void (**)(uint64_t))(*(void *)v26 + 24))(v26);
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