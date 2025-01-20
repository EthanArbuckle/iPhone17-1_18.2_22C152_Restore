@interface NTKSpectrumConicQuad
- (BOOL)isMasking;
- (BOOL)prepareForTime:(double)a3;
- (NSCalendar)calendar;
- (NSDate)overrideDate;
- (NTKSpectrumConicQuad)initWithRole:(unint64_t)a3 screenScale:(double)a4;
- (float)maskRadius;
- (float)opacity;
- (float)overlayOpacity;
- (float)vignetteOpacity;
- (void)_significantTimeChanged;
- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5;
- (void)dealloc;
- (void)renderForDisplayWithEncoder:(id)a3;
- (void)setFromColor:(id)a3 toColor:(id)a4;
- (void)setFromColor:(id)a3 toColor:(id)a4 midColor:(id)a5 interpolation:(unint64_t)a6;
- (void)setMaskRadius:(float)a3;
- (void)setMasking:(BOOL)a3;
- (void)setOpacity:(float)a3;
- (void)setOverlayOpacity:(float)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setOverrideDate:(id)a3 duration:(double)a4 completion:(id)a5;
- (void)setOverrideDate:(id)a3 hourRadians:(double)a4 minuteRadians:(double)a5 secondRadians:(double)a6;
- (void)setStyle:(unint64_t)a3;
- (void)setVignetteOpacity:(float)a3;
- (void)setupForQuadView:(id)a3;
@end

@implementation NTKSpectrumConicQuad

- (NTKSpectrumConicQuad)initWithRole:(unint64_t)a3 screenScale:(double)a4
{
  v19.receiver = self;
  v19.super_class = (Class)NTKSpectrumConicQuad;
  v6 = [(CLKUIQuad *)&v19 init];
  v7 = v6;
  if (v6)
  {
    v6->_screenScale = a4;
    uint64_t v8 = [off_1E62BDB78 sharedDevice];
    device = v7->_device;
    v7->_device = (MTLDevice *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    calendar = v7->_calendar;
    v7->_calendar = (NSCalendar *)v10;

    v7->_style = 2;
    v7->_role = a3;
    v7->_opacity = 1.0;
    uint64_t v12 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    mediaTimingFunction = v7->_mediaTimingFunction;
    v7->_mediaTimingFunction = (CAMediaTimingFunction *)v12;

    uint64_t v14 = 0;
    v7->_vignetteOpacity = 0.0;
    v7->_overlayOpacity = 0.0;
    do
    {
      uint64_t v15 = [(MTLDevice *)v7->_device newBufferWithLength:104 options:1];
      v16 = v7->_conicUniformsBuffers[v14];
      v7->_conicUniformsBuffers[v14] = (MTLBuffer *)v15;

      ++v14;
    }
    while (v14 != 3);
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v7 selector:sel__significantTimeChanged name:*MEMORY[0x1E4FB2708] object:0];
  }
  return v7;
}

- (void)dealloc
{
  resourceManager = self->_resourceManager;
  if (resourceManager)
  {
    [(NTKSpectrumResourceManager *)resourceManager removeClient];
    v4 = self->_resourceManager;
    self->_resourceManager = 0;
  }
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4FB2708] object:0];

  v6.receiver = self;
  v6.super_class = (Class)NTKSpectrumConicQuad;
  [(NTKSpectrumConicQuad *)&v6 dealloc];
}

- (void)setupForQuadView:(id)a3
{
  id v10 = a3;
  [v10 bounds];
  v5.f64[1] = v4;
  *(float32x2_t *)self->_size = vcvt_f32_f64(vmulq_n_f64(v5, self->_screenScale));
  resourceManager = self->_resourceManager;
  if (resourceManager)
  {
    [(NTKSpectrumResourceManager *)resourceManager removeClient];
    v7 = self->_resourceManager;
    self->_resourceManager = 0;
  }
  +[NTKSpectrumResourceManager sharedInstanceWithPixelFormat:](NTKSpectrumResourceManager, "sharedInstanceWithPixelFormat:", [v10 colorPixelFormat]);
  uint64_t v8 = (NTKSpectrumResourceManager *)objc_claimAutoreleasedReturnValue();
  v9 = self->_resourceManager;
  self->_resourceManager = v8;

  [(NTKSpectrumResourceManager *)self->_resourceManager addClient];
}

- (BOOL)prepareForTime:(double)a3
{
  return [(CLKUIQuad *)self isOpaque] || self->_opacity > 0.0;
}

- (void)setFromColor:(id)a3 toColor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  CLKUIConvertToRGBfFromUIColor();
}

- (void)setFromColor:(id)a3 toColor:(id)a4 midColor:(id)a5 interpolation:(unint64_t)a6
{
  id v7 = a5;
  id v8 = a4;
  CLKUIConvertToRGBfFromUIColor();
}

- (void)renderForDisplayWithEncoder:(id)a3
{
  id v4 = a3;
  unint64_t frame = self->_frame;
  self->_unint64_t frame = frame + 1;
  id v6 = self->_conicUniformsBuffers[frame % 3];
  uint64_t v7 = [(MTLBuffer *)v6 contents];
  *(float32x2_t *)(v7 + 80) = vmul_f32(*(float32x2_t *)self->_size, (float32x2_t)0xBF000000BF000000);
  *(void *)(v7 + 24) = *(void *)self->_fromColor;
  *(void *)(v7 + 32) = *(void *)self->_toColor;
  *(void *)(v7 + 40) = *(void *)self->_midColor;
  *(void *)(v7 + 48) = *(void *)self->_aliasColor;
  *(float *)(v7 + 92) = self->_vignetteOpacity;
  *(float *)(v7 + 96) = self->_overlayOpacity;
  _S10 = 1.0;
  if (![(CLKUIQuad *)self isOpaque]) {
    _S10 = self->_opacity;
  }
  BOOL v9 = self->_masking && self->_maskRadius > 0.0;
  __asm { FCVT            H0, S10 }
  *(_WORD *)(v7 + 8) = _H0;
  *(float *)(v7 + 88) = self->_maskRadius;
  double v15 = CACurrentMediaTime();
  uint64_t v16 = _S10 < 1.0;
  if (v9) {
    v16 |= 2uLL;
  }
  if (self->_vignetteOpacity > 0.0) {
    v16 |= 8uLL;
  }
  if (self->_overlayOpacity > 0.0) {
    v16 |= 4uLL;
  }
  if (self->_colorInterpolation == 16) {
    uint64_t v17 = v16 | 0x10;
  }
  else {
    uint64_t v17 = v16;
  }
  v18 = [(NTKSpectrumResourceManager *)self->_resourceManager renderPipelineForConfig:v17];
  double endOverrideTime = self->_endOverrideTime;
  if (v15 < endOverrideTime || self->_overrideDate)
  {
    double v20 = (v15 - self->_startOverrideTime) / (endOverrideTime - self->_startOverrideTime);
    *(float *)&double v20 = v20;
    if (*(float *)&v20 > 1.0) {
      *(float *)&double v20 = 1.0;
    }
    [(CAMediaTimingFunction *)self->_mediaTimingFunction _solveForInput:v20];
    float v22 = self->_startSecondAngle + (float)((float)(self->_endSecondAngle - self->_startSecondAngle) * v21);
    float v23 = self->_startMinuteAngle + (float)((float)(self->_endMinuteAngle - self->_startMinuteAngle) * v21);
    float v24 = self->_startHourAngle + (float)((float)(self->_endHourAngle - self->_startHourAngle) * v21);
  }
  else
  {
    v68[0] = 0.0;
    double v71 = 0.0;
    double v72 = 0.0;
    v33 = +[NTKDate faceDate];
    NTKHourMinuteSecondAnglesForTime(v68, &v72, &v71, v33, self->_calendar);

    float v34 = v71;
    float v22 = v34 / 6.2832;
    float v35 = v72;
    float v23 = v35 / 6.2832;
    float v36 = v68[0];
    float v24 = v36 / 6.2832;
  }
  if (*((unsigned char *)self + 192))
  {
    unint64_t style = self->_style;
    if (style == 1)
    {
      float v30 = (float)(v23 + 0.5) - floorf(v23 + 0.5);
      float v28 = v23;
      float v29 = v23;
    }
    else
    {
      float v28 = v24;
      float v29 = v23;
      float v30 = v22;
      if (!style)
      {
        float v28 = v22;
        float v29 = v22;
        float v30 = v22;
      }
    }
    unint64_t toStyle = self->_toStyle;
    float v38 = (float)(v23 + 0.5) - floorf(v23 + 0.5);
    if (toStyle)
    {
      float v39 = v23;
    }
    else
    {
      float v24 = v22;
      float v39 = v22;
    }
    if (toStyle == 1) {
      float v24 = v23;
    }
    else {
      float v23 = v39;
    }
    if (toStyle == 1) {
      float v22 = v38;
    }
    float v40 = vabds_f32(v30, v22);
    float v41 = -1.0;
    if (v30 <= 0.5) {
      float v42 = -1.0;
    }
    else {
      float v42 = 1.0;
    }
    if (v40 <= 0.5) {
      float v42 = -0.0;
    }
    float v43 = v22 + v42;
    float v44 = vabds_f32(v29, v23);
    if (v29 <= 0.5) {
      float v45 = -1.0;
    }
    else {
      float v45 = 1.0;
    }
    if (v44 <= 0.5) {
      float v46 = -0.0;
    }
    else {
      float v46 = v45;
    }
    float v47 = v23 + v46;
    float v48 = vabds_f32(v28, v24);
    if (v28 > 0.5) {
      float v41 = 1.0;
    }
    if (v48 <= 0.5) {
      float v49 = -0.0;
    }
    else {
      float v49 = v41;
    }
    float v50 = v24 + v49;
    float styleTransitionFraction = self->_styleTransitionFraction;
    float v26 = v30 + (float)((float)(v43 - v30) * styleTransitionFraction);
    float v23 = v29 + (float)((float)(v47 - v29) * styleTransitionFraction);
    float v24 = v28 + (float)((float)(v50 - v28) * styleTransitionFraction);
  }
  else
  {
    unint64_t v25 = self->_style;
    if (self->_role == 1)
    {
      if (v25 == 1)
      {
        float v26 = (float)(v23 + 0.5) - floorf(v23 + 0.5);
        float v24 = v23;
      }
      else
      {
        float v26 = v24;
        if (!v25)
        {
          *(void *)(v7 + 24) = *(void *)self->_midColor;
          *(void *)(v7 + 32) = *(void *)self->_midColor;
          float v24 = v22;
          float v23 = v22;
          float v26 = v22;
        }
      }
    }
    else
    {
      float v31 = (float)(v23 + 0.5) - floorf(v23 + 0.5);
      if (v25)
      {
        float v32 = v23;
      }
      else
      {
        float v24 = v22;
        float v32 = v22;
      }
      if (v25 == 1) {
        float v24 = v23;
      }
      else {
        float v23 = v32;
      }
      if (v25 == 1) {
        float v26 = v31;
      }
      else {
        float v26 = v22;
      }
    }
  }
  float v52 = v26 - floorf(v26);
  float v53 = v23 - floorf(v23);
  float v54 = v24 - floorf(v24);
  if (v52 >= v53)
  {
    if (v53 >= v54)
    {
      float v55 = v53;
    }
    else
    {
      if (v52 >= v54) {
        float v55 = v54;
      }
      else {
        float v55 = v52;
      }
      if (v52 < v54) {
        float v52 = v54;
      }
      float v54 = v53;
    }
  }
  else
  {
    if (v52 >= v54)
    {
      float v55 = v52;
    }
    else
    {
      if (v53 >= v54) {
        float v55 = v54;
      }
      else {
        float v55 = v53;
      }
      if (v53 < v54) {
        float v53 = v54;
      }
      float v54 = v52;
    }
    float v52 = v53;
  }
  v56.i64[0] = __PAIR64__(LODWORD(v55), LODWORD(v54));
  v56.f32[2] = v52;
  v56.f32[3] = v52 + -1.0;
  *(float16x4_t *)uint64_t v7 = vcvt_f16_f32(v56);
  v57.i64[0] = __PAIR64__(LODWORD(v52), LODWORD(v55));
  *(float *)&v57.i32[2] = v54 + 1.0;
  *(float *)&v57.i32[3] = v54;
  float32x4_t v58 = (float32x4_t)vextq_s8(v57, v57, 0xCuLL);
  v58.f32[3] = v52 + -1.0;
  float32x4_t v59 = vsubq_f32((float32x4_t)v57, v58);
  __asm { FMOV            V4.4S, #1.0 }
  *(float16x4_t *)v59.f32 = vcvt_f16_f32(vdivq_f32(_Q4, v59));
  _Q4.i64[0] = __PAIR64__(LODWORD(v55), LODWORD(v54));
  *(void *)(v7 + 16) = v59.i64[0];
  _Q4.i64[1] = LODWORD(v52);
  simd_float4 x = (simd_float4)vmlaq_f32((float32x4_t)vdupq_n_s32(0x40490FDBu), (float32x4_t)vdupq_n_s32(0x40C90FDBu), _Q4);
  simd_float4 v67 = _simd_sin_f4(x);
  int8x16_t v61 = (int8x16_t)_simd_cos_f4(x);
  *(int32x2_t *)(v7 + 56) = vzip1_s32(*(int32x2_t *)v67.f32, *(int32x2_t *)v61.i8);
  *(int32x2_t *)(v7 + 64) = vzip2_s32(*(int32x2_t *)v67.f32, *(int32x2_t *)v61.i8);
  *(int32x2_t *)(v7 + 72) = vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v67, (int8x16_t)v67, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(v61, v61, 8uLL));
  [v4 setLabel:@"Spectrum Encoder"];
  float32x2_t v62 = *(float32x2_t *)self->_size;
  v68[0] = 0.0;
  v68[1] = 0.0;
  float64x2_t v69 = vcvtq_f64_f32(v62);
  long long v70 = xmmword_1BC8A01F0;
  [v4 setViewport:v68];
  [v4 setCullMode:0];
  [v4 setRenderPipelineState:v18];
  if ((v17 & 8) != 0)
  {
    v63 = [(NTKSpectrumResourceManager *)self->_resourceManager vignetteTexture];
    [v4 setFragmentTexture:v63 atIndex:1];
  }
  if ((v17 & 4) != 0)
  {
    v64 = [(NTKSpectrumResourceManager *)self->_resourceManager overlayTexture];
    [v4 setFragmentTexture:v64 atIndex:2];
  }
  v65 = [(NTKSpectrumResourceManager *)self->_resourceManager verticesBuffer];
  [v4 setVertexBuffer:v65 offset:0 atIndex:0];

  [v4 setVertexBuffer:v6 offset:0 atIndex:1];
  [v4 setFragmentBuffer:v6 offset:0 atIndex:0];
  [v4 drawPrimitives:4 vertexStart:0 vertexCount:4];
}

- (void)setOverrideDate:(id)a3 hourRadians:(double)a4 minuteRadians:(double)a5 secondRadians:(double)a6
{
  id v12 = a3;
  if (v12)
  {
    objc_storeStrong((id *)&self->_overrideDate, a3);
    double v11 = CACurrentMediaTime();
    self->_startOverrideTime = v11;
    self->_double endOverrideTime = v11;
    *(float *)&double v11 = a6;
    *(float *)&double v11 = (float)(*(float *)&v11 / 6.2832) - floorf(*(float *)&v11 / 6.2832);
    self->_startSecondAngle = *(float *)&v11;
    self->_endSecondAngle = *(float *)&v11;
    *(float *)&double v11 = a5;
    *(float *)&double v11 = (float)(*(float *)&v11 / 6.2832) - floorf(*(float *)&v11 / 6.2832);
    self->_startMinuteAngle = *(float *)&v11;
    self->_endMinuteAngle = *(float *)&v11;
    *(float *)&double v11 = a4;
    *(float *)&double v11 = (float)(*(float *)&v11 / 6.2832) - floorf(*(float *)&v11 / 6.2832);
    self->_startHourAngle = *(float *)&v11;
    self->_endHourAngle = *(float *)&v11;
  }
  else
  {
    [(NTKSpectrumConicQuad *)self setOverrideDate:0 duration:0 completion:0.0];
  }
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
}

- (void)setOverrideDate:(id)a3 duration:(double)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = (void (**)(void, double, double, float, float, float, float))a5;
  p_overrideDate = &self->_overrideDate;
  char v12 = NTKEqualObjects(v9, self->_overrideDate);
  v13 = &OBJC_IVAR___NTKBundleComplicationIdentifierCache__overrideIdentifier;
  uint64_t v14 = &OBJC_IVAR___NTKSpectrumConicQuad__startMinuteAngle;
  double v15 = &OBJC_IVAR___NTKSpectrumConicQuad__startMinuteAngle;
  uint64_t v16 = &OBJC_IVAR___NTKSpectrumConicQuad__startMinuteAngle;
  uint64_t v17 = &OBJC_IVAR___NTKSpectrumConicQuad__startMinuteAngle;
  if ((v12 & 1) == 0)
  {
    uint64_t v18 = +[NTKDate faceDate];
    objc_super v19 = (void *)v18;
    double v20 = *p_overrideDate;
    if (!*p_overrideDate) {
      double v20 = (void *)v18;
    }
    id v21 = v20;
    if (v9)
    {
      id v22 = v9;
    }
    else
    {
      id v22 = [v19 dateByAddingTimeInterval:a4];
    }
    float v23 = v22;
    double v24 = CACurrentMediaTime();
    self->_startOverrideTime = v24;
    self->_double endOverrideTime = v24 + a4;
    objc_storeStrong((id *)&self->_overrideDate, a3);
    double v42 = 0.0;
    double v43 = 0.0;
    double v41 = 0.0;
    NTKHourMinuteSecondAnglesForTime(&v43, &v42, &v41, v21, self->_calendar);
    float v25 = v41;
    self->_float startSecondAngle = (float)(v25 / 6.2832) - floorf(v25 / 6.2832);
    float v26 = v42;
    self->_float startMinuteAngle = (float)(v26 / 6.2832) - floorf(v26 / 6.2832);
    float v27 = v43;
    self->_float startHourAngle = (float)(v27 / 6.2832) - floorf(v27 / 6.2832);
    NTKHourMinuteSecondAnglesForTime(&v43, &v42, &v41, v23, self->_calendar);
    float v28 = v41;
    self->_float endSecondAngle = (float)(v28 / 6.2832) - floorf(v28 / 6.2832);
    float v29 = v42;
    self->_float endMinuteAngle = (float)(v29 / 6.2832) - floorf(v29 / 6.2832);
    float v30 = v43;
    uint64_t v17 = &OBJC_IVAR___NTKSpectrumConicQuad__startMinuteAngle;
    self->_float endHourAngle = (float)(v30 / 6.2832) - floorf(v30 / 6.2832);
    float startSecondAngle = self->_startSecondAngle;
    float endSecondAngle = self->_endSecondAngle;
    if (vabds_f32(startSecondAngle, endSecondAngle) > 0.5)
    {
      BOOL v33 = startSecondAngle <= 0.5;
      float v34 = -1.0;
      if (!v33) {
        float v34 = 1.0;
      }
      self->_float endSecondAngle = endSecondAngle + v34;
    }
    float startMinuteAngle = self->_startMinuteAngle;
    float endMinuteAngle = self->_endMinuteAngle;
    if (vabds_f32(startMinuteAngle, endMinuteAngle) > 0.5)
    {
      float v37 = -1.0;
      if (startMinuteAngle > 0.5) {
        float v37 = 1.0;
      }
      self->_float endMinuteAngle = endMinuteAngle + v37;
    }
    float startHourAngle = self->_startHourAngle;
    float endHourAngle = self->_endHourAngle;
    if (vabds_f32(startHourAngle, endHourAngle) > 0.5)
    {
      BOOL v33 = startHourAngle <= 0.5;
      float v40 = -1.0;
      if (!v33) {
        float v40 = 1.0;
      }
      self->_float endHourAngle = endHourAngle + v40;
    }

    uint64_t v16 = &OBJC_IVAR___NTKSpectrumConicQuad__startMinuteAngle;
    double v15 = &OBJC_IVAR___NTKSpectrumConicQuad__startMinuteAngle;
    uint64_t v14 = &OBJC_IVAR___NTKSpectrumConicQuad__startMinuteAngle;
    v13 = &OBJC_IVAR___NTKBundleComplicationIdentifierCache__overrideIdentifier;
  }
  if (v10) {
    v10[2](v10, *(double *)((char *)&self->super.super.isa + v13[1021]), self->_endOverrideTime, *(float *)((char *)&self->super.super.isa + *v14), *(float *)((char *)&self->super.super.isa + v15[1]), *(float *)((char *)&self->super.super.isa + v16[2]), *(float *)((char *)&self->super.super.isa + v17[3]));
  }
}

- (void)setStyle:(unint64_t)a3
{
  self->_unint64_t style = a3;
  *((unsigned char *)self + 192) &= ~1u;
}

- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  *((unsigned char *)self + 192) |= 1u;
  float v5 = a3;
  self->_float styleTransitionFraction = v5;
  self->_unint64_t style = a4;
  self->_unint64_t toStyle = a5;
}

- (void)_significantTimeChanged
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  id v4 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    float v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = [(NSCalendar *)self->_calendar timeZone];
    id v8 = [v7 name];
    int v14 = 138412546;
    double v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "%@ received significant time change with current timezone: %@", (uint8_t *)&v14, 0x16u);
  }
  [(NSCalendar *)self->_calendar setTimeZone:v3];
  id v9 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (objc_class *)objc_opt_class();
    double v11 = NSStringFromClass(v10);
    char v12 = [(NSCalendar *)self->_calendar timeZone];
    v13 = [v12 name];
    int v14 = 138412546;
    double v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "%@ did set new timezone after significant time change to: %@", (uint8_t *)&v14, 0x16u);
  }
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (float)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(float)a3
{
  self->_opacity = a3;
}

- (float)maskRadius
{
  return self->_maskRadius;
}

- (void)setMaskRadius:(float)a3
{
  self->_maskRadius = a3;
}

- (BOOL)isMasking
{
  return self->_masking;
}

- (void)setMasking:(BOOL)a3
{
  self->_masking = a3;
}

- (float)vignetteOpacity
{
  return self->_vignetteOpacity;
}

- (void)setVignetteOpacity:(float)a3
{
  self->_vignetteOpacity = a3;
}

- (float)overlayOpacity
{
  return self->_overlayOpacity;
}

- (void)setOverlayOpacity:(float)a3
{
  self->_overlayOpacity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_mediaTimingFunction, 0);
  for (uint64_t i = 2; i != -1; --i)
    objc_storeStrong((id *)&self->_conicUniformsBuffers[i], 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end