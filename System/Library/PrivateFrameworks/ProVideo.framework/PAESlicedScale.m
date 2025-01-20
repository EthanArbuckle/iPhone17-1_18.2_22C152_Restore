@interface PAESlicedScale
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputBounds:(CGRect *)a3 withInputBounds:(CGRect)a4 withInputInfo:(id *)a5 withRenderInfo:(id *)a6;
- (PAESlicedScale)initWithAPIManager:(id)a3;
- (id)properties;
- (void)additionalObjectDownScale:(void *)a3 objectScale:(PCVector2<double>)a4 innerScale:(PCVector2<double>)a5 xLeft:(double)a6 xRight:(double)a7 yTop:(double)a8 yBottom:(double)a9;
- (void)calculateBounds:(CGRect *)a3 fromOrigin:(PCVector2<double>)a4 mode:(int)a5 inputSize:(PCVector2<double>)a6 ignoreOffsets:(BOOL)a7 xLeft:(double)a8 xRight:(double)a9 yBottom:(double)a10 yTop:(double)a11 objectScale:(PCVector2<double>)a12 offset:(PCVector2<double>)a13;
- (void)innerScaleFromObjectScale:(PCVector2<double>)a3 innerScale:(void *)a4 xLeft:(double)a5 xRight:(double)a6 yTop:(double)a7 yBottom:(double)a8 inputSize:(PCVector2<double>)a9 newObjectSize:(void *)a10 mode:(int)a11;
- (void)wholeTileExpandLeftScale:(double *)a3 expandRightScale:(double *)a4 expandBottomScale:(double *)a5 expandTopScale:(double *)a6 objectScale:(void *)a7 xLeft:(double)a8 xRight:(double)a9 yBottom:(double)a10 yTop:(double)a11;
@end

@implementation PAESlicedScale

- (PAESlicedScale)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAESlicedScale;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v7[9] = *MEMORY[0x1E4F143B8];
  unsigned int v2 = objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1F121E208), "versionAtCreation");
  v6[0] = @"PixelTransformSupport";
  v6[1] = @"MayRemapTime";
  if (v2 <= 1) {
    uint64_t v3 = 65792;
  }
  else {
    uint64_t v3 = 67584;
  }
  if (v2 <= 1) {
    uint64_t v4 = 590080;
  }
  else {
    uint64_t v4 = 591872;
  }
  v7[0] = &unk_1F11EC250;
  v7[1] = MEMORY[0x1E4F1CC28];
  v6[2] = @"PixelIndependent";
  v6[3] = @"PositionIndependent";
  v7[2] = MEMORY[0x1E4F1CC28];
  v7[3] = MEMORY[0x1E4F1CC28];
  v6[4] = @"SupportsLargeRenderScale";
  v6[5] = @"SupportsHeliumRendering";
  v7[4] = MEMORY[0x1E4F1CC38];
  v7[5] = MEMORY[0x1E4F1CC38];
  v6[6] = @"SDRWorkingSpace";
  v7[6] = [NSNumber numberWithUnsignedInteger:v3];
  v6[7] = @"HDRWorkingSpace";
  v6[8] = @"AutoColorProcessingSupport";
  v7[7] = [NSNumber numberWithUnsignedInteger:v4];
  v7[8] = &unk_1F11EC250;
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:9];
}

- (BOOL)addParameters
{
  v11.receiver = self;
  v11.super_class = (Class)PAESlicedScale;
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
    unsigned int v7 = [v4 versionAtCreation];
    v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"SlicedScale::editSlices", 0, 0), 1, 0, 1);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"SlicedScale::sliceRightTop", 0, 0), 2, 34, 0.75, 0.75);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"SlicedScale::sliceLeftBottom", 0, 0), 3, 34, 0.25, 0.25);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"SlicedScale::mode", 0, 0), 4, 0, objc_msgSend((id)objc_msgSend(v8, "localizedStringForKey:value:table:", @"SlicedScale::modeEntries", 0, 0), "componentsSeparatedByString:", @"|"), 1);
    objc_msgSend(v3, "add2DScaleWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"SlicedScale::objectScale", 0, 0), 5, 32, 1.0, 1.0);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"SlicedScale::offset", 0, 0), 6, 32, 0.5, 0.5);
    objc_msgSend(v3, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"SlicedScale::expandGroup", 0, 0), 7, 40);
    uint64_t v9 = [v8 localizedStringForKey:@"SlicedScale::expandLeft" value:0 table:0];
    if (v7 < 2)
    {
      [v3 addFloatSliderWithName:v9 parmId:8 defaultValue:0 parameterMin:0.0 parameterMax:0.0 sliderMin:1.0 sliderMax:0.0 delta:1.0 parmFlags:0.01];
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"SlicedScale::expandRight", 0, 0), 10, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"SlicedScale::expandTop", 0, 0), 11, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
      objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"SlicedScale::expandBottom", 0, 0), 9, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
    }
    else
    {
      [v3 addPercentSliderWithName:v9 parmId:8 defaultValue:0 parameterMin:0.0 parameterMax:0.0 sliderMin:1.0 sliderMax:0.0 delta:1.0 parmFlags:0.01];
      objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"SlicedScale::expandRight", 0, 0), 10, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
      objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"SlicedScale::expandTop", 0, 0), 11, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
      objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"SlicedScale::expandBottom", 0, 0), 9, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
    }
    [v3 endParameterSubGroup];
    [v3 startParameterSubGroup:@"Debug" parmId:12 parmFlags:34];
    [v3 addToggleButtonWithName:@"Ignore Offset values" parmId:15 defaultValue:0 parmFlags:33];
    [v3 addToggleButtonWithName:@"Don't Auto-keyframe offset" parmId:16 defaultValue:0 parmFlags:33];
    [v3 endParameterSubGroup];
  }
  return v6;
}

- (void)innerScaleFromObjectScale:(PCVector2<double>)a3 innerScale:(void *)a4 xLeft:(double)a5 xRight:(double)a6 yTop:(double)a7 yBottom:(double)a8 inputSize:(PCVector2<double>)a9 newObjectSize:(void *)a10 mode:(int)a11
{
  float64x2_t v13 = (float64x2_t)vdupq_n_s64(0x3EE4F8B588E368F1uLL);
  float64x2_t v14 = vmaxnmq_f64(*(float64x2_t *)a4, v13);
  *(float64x2_t *)a4 = v14;
  __asm { FMOV            V3.2D, #1.0 }
  float64x2_t v22 = vmulq_f64(vsubq_f64(*(float64x2_t *)&a3.var1, (float64x2_t)a3), **(float64x2_t **)&a11);
  float64x2_t v23 = vmaxnmq_f64(vdivq_f64(vsubq_f64(vaddq_f64(v22, vmaxnmq_f64(vmulq_f64(v14, **(float64x2_t **)&a11), _Q3)), **(float64x2_t **)&a11), v22), v13);
  if (v12 == 2)
  {
    double v24 = floor(v23.f64[0] + 0.0000001);
    if (v23.f64[0] <= 1.0) {
      double v25 = v23.f64[0];
    }
    else {
      double v25 = v24;
    }
    v23.f64[0] = v25;
    if (v23.f64[1] > 1.0) {
      v23.f64[1] = floor(v23.f64[1] + 0.0000001);
    }
  }
  *objc_super v11 = vaddq_f64(**(float64x2_t **)&a11, vsubq_f64(vmulq_f64(v22, v23), v22));
  *(float64x2_t *)a10 = v23;
}

- (void)wholeTileExpandLeftScale:(double *)a3 expandRightScale:(double *)a4 expandBottomScale:(double *)a5 expandTopScale:(double *)a6 objectScale:(void *)a7 xLeft:(double)a8 xRight:(double)a9 yBottom:(double)a10 yTop:(double)a11
{
  v11.f64[0] = a9;
  v11.f64[1] = a11;
  v12.f64[0] = a8;
  v12.f64[1] = a10;
  float64x2_t v13 = vsubq_f64(v11, v12);
  float64x2_t v14 = (float64x2_t)vdupq_n_s64(0x3EE4F8B588E368F1uLL);
  float64x2_t v15 = vaddq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v14, *(float64x2_t *)a7), (int8x16_t)v14, *(int8x16_t *)a7), v11);
  double v16 = *a3 + 1.0;
  if (v16 < 0.00001) {
    double v16 = 0.00001;
  }
  double v17 = (v16 + a9 - a8 + -1.0) / v13.f64[0];
  if (v17 < 0.00001) {
    double v17 = 0.00001;
  }
  double v18 = floor(v17 + 0.0000001);
  if (v17 > 1.0) {
    double v17 = v18;
  }
  double v19 = *a5 + 1.0;
  if (v19 < 0.00001) {
    double v19 = 0.00001;
  }
  double v20 = (v19 + a11 - a10 + -1.0) / v13.f64[1];
  if (v20 < 0.00001) {
    double v20 = 0.00001;
  }
  double v21 = floor(v20 + 0.0000001);
  if (v20 > 1.0) {
    double v20 = v21;
  }
  double v22 = *a4 + 1.0;
  if (v22 < 0.00001) {
    double v22 = 0.00001;
  }
  double v23 = (v22 + a9 - a8 + -1.0) / v13.f64[0];
  if (v23 < 0.00001) {
    double v23 = 0.00001;
  }
  double v24 = floor(v23 + 0.0000001);
  if (v23 > 1.0) {
    double v23 = v24;
  }
  double v25 = *a6 + 1.0;
  if (v25 < 0.00001) {
    double v25 = 0.00001;
  }
  double v26 = (v25 + a11 - a10 + -1.0) / v13.f64[1];
  if (v26 < 0.00001) {
    double v26 = 0.00001;
  }
  double v27 = floor(v26 + 0.0000001);
  if (v26 > 1.0) {
    double v26 = v27;
  }
  double v28 = vmuld_lane_f64(v20 + -1.0, v13, 1) + 1.0;
  double v29 = (v23 + -1.0) * v13.f64[0] + 1.0;
  double v30 = vmuld_lane_f64(v26 + -1.0, v13, 1) + 1.0;
  double v31 = (v17 + -1.0) * v13.f64[0] + 1.0 + -1.0;
  if (v31 < 0.0) {
    double v31 = 0.0;
  }
  *a3 = v31;
  double v32 = v29 + -1.0;
  if (v32 < 0.0) {
    double v32 = 0.0;
  }
  *a4 = v32;
  double v33 = v28 + -1.0;
  if (v28 + -1.0 < 0.0) {
    double v33 = 0.0;
  }
  *a5 = v33;
  double v34 = v30 + -1.0;
  if (v30 + -1.0 < 0.0) {
    double v34 = 0.0;
  }
  *a6 = v34;
  __asm { FMOV            V1.2D, #-1.0 }
  float64x2_t v40 = vdivq_f64(vaddq_f64(vsubq_f64(v15, v12), _Q1), v13);
  float64x2_t v41 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v14, v40), (int8x16_t)v14, (int8x16_t)v40);
  __asm { FMOV            V2.2D, #1.0 }
  *(int8x16_t *)a7 = vbslq_s8((int8x16_t)vcgeq_f64(*(float64x2_t *)a7, _Q2), (int8x16_t)vaddq_f64(vmulq_f64(v13, vaddq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v41, _Q2), (int8x16_t)vrndmq_f64(vaddq_f64(v41, (float64x2_t)vdupq_n_s64(0x3E7AD7F29ABCAF48uLL))), (int8x16_t)v41), _Q1)), _Q2), *(int8x16_t *)a7);
}

- (void)additionalObjectDownScale:(void *)a3 objectScale:(PCVector2<double>)a4 innerScale:(PCVector2<double>)a5 xLeft:(double)a6 xRight:(double)a7 yTop:(double)a8 yBottom:(double)a9
{
  __asm { FMOV            V4.2D, #1.0 }
  *(_OWORD *)a3 = _Q4;
  float64x2_t v16 = vmaxnmq_f64(*v9, (float64x2_t)vdupq_n_s64(0x3EE4F8B588E368F1uLL));
  *uint64_t v9 = v16;
  if (*v10 <= 0.00001) {
    *(double *)a3 = v16.f64[0] / (*v10 * a4.var1 - *v10 * a4.var0 + a4.var0 - a4.var1 + 1.0);
  }
  double v17 = v10[1];
  if (v17 <= 0.00001) {
    *((double *)a3 + 1) = v16.f64[1] / (v17 * a5.var0 - v17 * a5.var1 + a5.var1 - a5.var0 + 1.0);
  }
}

- (void)calculateBounds:(CGRect *)a3 fromOrigin:(PCVector2<double>)a4 mode:(int)a5 inputSize:(PCVector2<double>)a6 ignoreOffsets:(BOOL)a7 xLeft:(double)a8 xRight:(double)a9 yBottom:(double)a10 yTop:(double)a11 objectScale:(PCVector2<double>)a12 offset:(PCVector2<double>)a13
{
  float64x2_t v14 = v13;
  char var1_low = LOBYTE(a12.var1);
  double var0 = a12.var0;
  double v17 = *(double **)&a5;
  double var1 = a6.var1;
  double v19 = a6.var0;
  double v20 = a4.var1;
  double v21 = a4.var0;
  double v58 = 0.0;
  double v59 = 0.0;
  long long v57 = 0uLL;
  long long v24 = *v13;
  long long v55 = **(_OWORD **)&a12.var0;
  long long v56 = v24;
  [(PAESlicedScale *)self innerScaleFromObjectScale:&v56 innerScale:&v58 xLeft:&v55 xRight:&v57 yTop:a7 yBottom:a4.var0 inputSize:a4.var1 newObjectSize:a6.var1 mode:a6.var0];
  double v49 = v17[1];
  double v50 = *v17;
  double v26 = **(double **)&var0;
  double v25 = *(double *)(*(void *)&var0 + 8);
  double v28 = v58;
  double v27 = v59;
  double v53 = 0.0;
  double v54 = 0.0;
  long long v52 = *v14;
  *(double *)v51 = v58;
  *(double *)&v51[1] = v59;
  [(PAESlicedScale *)self additionalObjectDownScale:&v53 objectScale:&v52 innerScale:v51 xLeft:v21 xRight:v20 yTop:var1 yBottom:v19];
  if (var1_low)
  {
    int8x16_t v29 = **(int8x16_t **)&var0;
    __asm { FMOV            V0.2D, #-0.5 }
    CGPoint v35 = (CGPoint)vmulq_f64(**(float64x2_t **)&var0, _Q0);
  }
  else
  {
    float v36 = v50 / v26;
    float v37 = v49 / v25;
    double v38 = v21 - v28 * v21;
    float v39 = v36 - v38;
    double v40 = v19 - v27 * v19;
    float v41 = v37 - v40;
    v42.f32[0] = (v38 - (v28 * v20 - v20)) * 0.5 + v39;
    double v43 = (v40 - (v27 * var1 - var1)) * 0.5 + v41;
    if (v58 <= 0.00001)
    {
      v42.f32[0] = v53 * v42.f32[0];
      *(double *)&long long v57 = v53 * *(double *)&v57;
    }
    float v44 = v43;
    if (v59 <= 0.00001)
    {
      float v44 = v54 * v44;
      double v45 = v54 * *((double *)&v57 + 1);
    }
    else
    {
      double v45 = *((double *)&v57 + 1);
    }
    v42.f32[1] = v44;
    __asm { FMOV            V3.2D, #-0.5 }
    float64x2_t v47 = vaddq_f64(**(float64x2_t **)&a13.var0, _Q3);
    **(_OWORD **)&a13.double var0 = v47;
    CGPoint v35 = (CGPoint)vcvtq_f64_f32(vcvt_f32_f64(vmulq_f64(**(float64x2_t **)&var0, vcvtq_f64_f32(vcvt_f32_f64(vaddq_f64(v47, vcvtq_f64_f32(v42)))))));
    *(CGPoint *)double v17 = v35;
    v29.i64[0] = v57;
    *(double *)&v29.i64[1] = v45;
  }
  __asm { FMOV            V1.2D, #1.0 }
  a3->origin = v35;
  a3->size = (CGSize)vbslq_s8((int8x16_t)vcgtq_f64((float64x2_t)_Q1, (float64x2_t)v29), _Q1, v29);
}

- (BOOL)getOutputBounds:(CGRect *)a3 withInputBounds:(CGRect)a4 withInputInfo:(id *)a5 withRenderInfo:(id *)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  float64x2_t v13 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1F121D130, a5);
  if (a3) {
    _ZF = v13 == 0;
  }
  else {
    _ZF = 1;
  }
  BOOL v15 = !_ZF;
  if (!_ZF)
  {
    float64x2_t v16 = v13;
    char v37 = 0;
    [v13 getBoolValue:&v37 fromParm:1 atFxTime:a6->var0.var1];
    if (!v37)
    {
      double v35 = 0.0;
      double v36 = 0.0;
      double v33 = 0.0;
      double v34 = 0.0;
      [v16 getXValue:&v35 YValue:&v33 fromParm:3 atFxTime:a6->var0.var1];
      [v16 getXValue:&v36 YValue:&v34 fromParm:2 atFxTime:a6->var0.var1];
      double v35 = v35 + -0.5;
      double v36 = v36 + -0.5;
      double v33 = v33 + -0.5;
      double v34 = v34 + -0.5;
      __asm { FMOV            V0.2D, #1.0 }
      float64x2_t v32 = _Q0;
      [v16 getXValue:&v32 YValue:&v32.f64[1] fromParm:5 atFxTime:a6->var0.var1];
      float64x2_t v32 = vmaxnmq_f64(v32, (float64x2_t)vdupq_n_s64(0x3EE4F8B588E368F1uLL));
      unsigned int v31 = 0;
      [v16 getIntValue:&v31 fromParm:4 atFxTime:a6->var0.var1];
      unsigned __int8 v30 = 0;
      [v16 getBoolValue:&v30 fromParm:15 atFxTime:a6->var0.var1];
      __asm { FMOV            V0.2D, #0.5 }
      long long v29 = _Q0;
      [v16 getXValue:&v29 YValue:(char *)&v29 + 8 fromParm:6 atFxTime:a6->var0.var1];
      *(CGFloat *)double v27 = x;
      *(CGFloat *)&v27[1] = y;
      *(CGFloat *)double v26 = width;
      *(CGFloat *)&v26[1] = height;
      long long v24 = v29;
      float64x2_t v25 = v32;
      [(PAESlicedScale *)self calculateBounds:v28 fromOrigin:v27 mode:v31 inputSize:v26 ignoreOffsets:v30 xLeft:&v25 xRight:v35 yBottom:v36 yTop:v33 objectScale:v34 offset:&v24];
      CGSize v22 = (CGSize)v28[1];
      a3->origin = (CGPoint)v28[0];
      a3->size = v22;
    }
  }
  return v15;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v9) {
    _ZF = v10 == 0;
  }
  else {
    _ZF = 1;
  }
  BOOL v12 = !_ZF;
  if (!_ZF)
  {
    unsigned int v13 = [v10 versionAtCreation];
    uint64_t v14 = [a4 width];
    uint64_t v15 = [a4 height];
    [(PAESharedDefaultBase *)self getImageBoundary:a4];
    [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
    *(void *)&v16.f64[0] = v92;
    v16.f64[1] = v93;
    float64x2_t v54 = v16;
    double v17 = v88;
    double v18 = v89;
    double v19 = v90;
    double v20 = v91;
    float64x2_t v87 = 0uLL;
    double v86 = 0.0;
    double v85 = 0.0;
    double v84 = 0.0;
    double v83 = 0.0;
    unsigned __int8 v82 = 0;
    float64x2_t v81 = 0uLL;
    char v80 = 0;
    [v9 getBoolValue:&v80 fromParm:1 atFxTime:a5->var0.var1];
    if (a4) {
      [a4 heliumRef];
    }
    else {
      uint64_t v79 = 0;
    }
    if (!v80)
    {
      __asm { FMOV            V0.2D, #1.0 }
      float64x2_t v78 = _Q0;
      [v9 getXValue:&v78 YValue:&v78.f64[1] fromParm:5 atFxTime:a5->var0.var1];
      float64x2_t v78 = vmaxnmq_f64(v78, (float64x2_t)vdupq_n_s64(0x3EE4F8B588E368F1uLL));
      [v9 getXValue:&v85 YValue:&v83 fromParm:3 atFxTime:a5->var0.var1];
      [v9 getXValue:&v86 YValue:&v84 fromParm:2 atFxTime:a5->var0.var1];
      v25.i64[0] = v14;
      v25.i64[1] = v15;
      float64x2_t v28 = vcvtq_f64_u64(v25);
      double v26 = 1.0 / v28.f64[0];
      float64x2_t v56 = v28;
      double v27 = v28.f64[1];
      v28.f64[0] = 1.0 / v28.f64[1];
      double v29 = v85;
      if (v26 >= v85) {
        double v29 = v26;
      }
      double v85 = v29 + -0.5;
      double v30 = v83;
      if (v28.f64[0] >= v83) {
        double v30 = 1.0 / v28.f64[1];
      }
      double v83 = v30 + -0.5;
      double v31 = 1.0 - v26;
      if (v31 > v86) {
        double v31 = v86;
      }
      double v86 = v31 + -0.5;
      double v32 = 1.0 - v28.f64[0];
      if (1.0 - v28.f64[0] > v84) {
        double v32 = v84;
      }
      double v84 = v32 + -0.5;
      [v9 getBoolValue:&v82 fromParm:15 atFxTime:a5->var0.var1];
      [v9 getXValue:&v81 YValue:&v81.f64[1] fromParm:6 atFxTime:a5->var0.var1];
      unsigned int v77 = 0;
      [v9 getIntValue:&v77 fromParm:4 atFxTime:a5->var0.var1];
      double v75 = 0.0;
      float64_t v76 = 0.0;
      double v73 = 0.0;
      double v74 = 0.0;
      [v9 getFloatValue:&v76 fromParm:8 atFxTime:a5->var0.var1];
      [v9 getFloatValue:&v74 fromParm:9 atFxTime:a5->var0.var1];
      [v9 getFloatValue:&v75 fromParm:10 atFxTime:a5->var0.var1];
      [v9 getFloatValue:&v73 fromParm:11 atFxTime:a5->var0.var1];
      uint64_t v33 = v77;
      if (v77 == 2 && v13 >= 2)
      {
        [(PAESlicedScale *)self wholeTileExpandLeftScale:&v76 expandRightScale:&v75 expandBottomScale:&v74 expandTopScale:&v73 objectScale:&v78 xLeft:v85 xRight:v86 yBottom:v83 yTop:v84];
        uint64_t v33 = v77;
      }
      double v52 = v20;
      double v34 = v18;
      double v35 = v78.f64[0] + v76 + v75;
      double v36 = v78.f64[1] + v74 + v73;
      v72[0] = 0;
      v72[1] = 0;
      v71[0] = v35;
      v71[1] = v36;
      float64x2_t v70 = v56;
      [(PAESlicedScale *)self innerScaleFromObjectScale:v71 innerScale:&v87 xLeft:&v70 xRight:v72 yTop:v33 yBottom:v85 inputSize:v86 newObjectSize:v84 mode:v83];
      float64x2_t v69 = 0uLL;
      *(double *)v68 = v35;
      *(double *)&v68[1] = v36;
      float64x2_t v67 = v87;
      [(PAESlicedScale *)self additionalObjectDownScale:&v69 objectScale:v68 innerScale:&v67 xLeft:v85 xRight:v86 yTop:v84 yBottom:v83];
      double v37 = *(float *)v57[0].f64;
      double v38 = *((float *)v57[0].f64 + 1);
      float64x2_t v53 = 0u;
      if (!v82)
      {
        v66[0] = *(float *)v57[0].f64;
        v66[1] = *((float *)v57[0].f64 + 1);
        float64x2_t v55 = vmulq_f64(v54, v56);
        float64x2_t v65 = v55;
        *(double *)v64 = v35;
        *(double *)&v64[1] = v36;
        float64x2_t v63 = v81;
        [(PAESlicedScale *)self calculateBounds:v57 fromOrigin:v66 mode:v77 inputSize:&v65 ignoreOffsets:0 xLeft:v64 xRight:v85 yBottom:v86 yTop:v83 objectScale:v84 offset:&v63];
        *(double *)v61 = v37;
        *(double *)&v61[1] = v38;
        float64x2_t v59 = v78;
        float64x2_t v60 = v55;
        float64x2_t v58 = v81;
        [(PAESlicedScale *)self calculateBounds:v62 fromOrigin:v61 mode:v77 inputSize:&v60 ignoreOffsets:v82 xLeft:&v59 xRight:v85 yBottom:v86 yTop:v83 objectScale:v84 offset:&v58];
        v40.f64[0] = v75;
        v39.f64[0] = v76;
        v41.f64[0] = v85;
        v42.f64[0] = v86;
        __asm { FMOV            V5.2D, #0.5 }
        v39.f64[1] = v74;
        v40.f64[1] = v73;
        v41.f64[1] = v83;
        v42.f64[1] = v84;
        float64x2_t v44 = vaddq_f64(vsubq_f64(vsubq_f64(vdivq_f64(vmulq_f64(vaddq_f64(vaddq_f64(v62[0], v62[0]), v62[1]), _Q5), v55), vdivq_f64(vmulq_f64(vaddq_f64(vaddq_f64(v57[0], v57[0]), v57[1]), _Q5), v55)), vmulq_f64(vsubq_f64(v39, v40), _Q5)), vmulq_f64(vsubq_f64(vmulq_f64(v69, vsubq_f64(v41, vmulq_f64(v41, v87))), vmulq_f64(v69, vsubq_f64(vmulq_f64(v87, v42), v42))), _Q5));
        __asm { FMOV            V2.2D, #-0.5 }
        float64x2_t v53 = vmulq_f64(vaddq_f64(vaddq_f64(v81, _Q2), v44), v56);
      }
      HGTransform::HGTransform((HGTransform *)v57);
      HGTransform::Translate((HGTransform *)v57, v53.f64[0], v53.f64[1], 0.0);
      v46 = (HGXForm *)HGObject::operator new(0x210uLL);
      HGXForm::HGXForm(v46);
      (*(void (**)(HGXForm *, float64x2_t *))(*(void *)v46 + 576))(v46, v57);
      uint64_t v47 = HGRectMake4i((int)(v17 * v37 + v34), (int)(v19 * v38 + v52), (int)(v17 * v37 + v34 + v56.f64[0]), (int)(v19 * v38 + v52 + v27));
      uint64_t v49 = v48;
      double v50 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
      *(void *)&v94.double var0 = v47;
      *(void *)&v94.var2 = v49;
      HGSolidColor::HGSolidColor(v50, v94);
    }
    [a3 setHeliumRef:&v79];
    if (v79) {
      (*(void (**)(uint64_t))(*(void *)v79 + 24))(v79);
    }
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