@interface UIQuadCurvePointFIFO
+ (double)interpolateFromPoint:(float32x4_t)a1 toPoint:(float32x4_t)a2 controlPoint:(float32x4_t)a3 time:(float)a4;
- (BOOL)emitInterpolatedPoints;
- (CGPath)path;
- (UIQuadCurvePointFIFO)initWithFIFO:(id)a3;
- (UIQuadCurvePointFIFO)initWithFIFO:(id)a3 strokeView:(id)a4;
- (UIView)view;
- (_UIPointVector)controlPoints;
- (_UIPointVector)points;
- (_UIPointVector)prevPoints;
- (__n128)lastPoint;
- (double)lineWidth;
- (float)unitScale;
- (id)emissionHandler;
- (void)addPoint:(UIQuadCurvePointFIFO *)self;
- (void)clear;
- (void)dealloc;
- (void)enumerateInterpolationFromPoint:(id)a3 toPoint:controlPoint:usingBlock:;
- (void)flush;
- (void)setControlPoints:(id)a3;
- (void)setEmissionHandler:(id)a3;
- (void)setEmitInterpolatedPoints:(BOOL)a3;
- (void)setLastPoint:(UIQuadCurvePointFIFO *)self;
- (void)setLineWidth:(double)a3;
- (void)setPath:(CGPath *)a3;
- (void)setPoints:(id)a3;
- (void)setPrevPoints:(id)a3;
- (void)setUnitScale:(float)a3;
- (void)setUnitScaleForViewSize:(CGSize)a3 normalizedSize:(CGSize)a4 contentScaleFactor:(double)a5;
- (void)setView:(id)a3;
@end

@implementation UIQuadCurvePointFIFO

- (UIQuadCurvePointFIFO)initWithFIFO:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIQuadCurvePointFIFO;
  v3 = [(UIPointFIFO *)&v6 initWithFIFO:a3];
  v4 = v3;
  if (v3)
  {
    v3->_unitScale = 1.0;
    v3->_emitInterpolatedPoints = 1;
    v3->_view = 0;
    v3->_prevPoints = objc_alloc_init(_UIPointVector);
    v4->_points = objc_alloc_init(_UIPointVector);
    v4->_controlPoints = objc_alloc_init(_UIPointVector);
  }
  return v4;
}

- (UIQuadCurvePointFIFO)initWithFIFO:(id)a3 strokeView:(id)a4
{
  v5 = [(UIQuadCurvePointFIFO *)self initWithFIFO:a3];
  if (v5) {
    v5->_view = (UIView *)a4;
  }
  return v5;
}

- (void)dealloc
{
  self->_view = 0;
  self->_emissionHandler = 0;

  self->_prevPoints = 0;
  self->_points = 0;

  self->_controlPoints = 0;
  path = self->_path;
  if (path)
  {
    CGPathRelease(path);
    self->_path = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIQuadCurvePointFIFO;
  [(UIPointFIFO *)&v4 dealloc];
}

+ (double)interpolateFromPoint:(float32x4_t)a1 toPoint:(float32x4_t)a2 controlPoint:(float32x4_t)a3 time:(float)a4
{
  *(void *)&double result = vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(a3, (float)((float)(1.0 - a4) + (float)(1.0 - a4)) * a4), a1, (float)(1.0 - a4) * (float)(1.0 - a4)), a2, a4 * a4).u64[0];
  return result;
}

- (void)enumerateInterpolationFromPoint:(id)a3 toPoint:controlPoint:usingBlock:
{
  double v17 = *(double *)v3.i64;
  double v18 = *(double *)v4.i64;
  float32x4_t v7 = vsubq_f32(v3, v5);
  double v19 = *(double *)v5.i64;
  float32x4_t v8 = vsubq_f32(v5, v4);
  float v9 = sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v7, v7)))
     + sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v8, v8)));
  [(UIQuadCurvePointFIFO *)self unitScale];
  uint64_t v10 = 0;
  int v12 = vcvtps_s32_f32(v9 / v11);
  if (v12 <= 2) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = v12;
  }
  char v20 = 0;
  do
  {
    v14 = objc_opt_class();
    *(float *)&double v15 = (float)(int)v10 / (float)(v13 - 1);
    [v14 interpolateFromPoint:v17 toPoint:v18 controlPoint:v19 time:v15];
    (*((void (**)(id, uint64_t, uint64_t, char *))a3 + 2))(a3, v10, v13, &v20);
    if (v20) {
      break;
    }
  }
  while (v13 - 1 != v10++);
}

- (void)setUnitScaleForViewSize:(CGSize)a3 normalizedSize:(CGSize)a4 contentScaleFactor:(double)a5
{
  CGFloat v5 = a4.width / (a3.width * a5);
  *(float *)&CGFloat v5 = v5;
  float v6 = a4.height / (a3.height * a5);
  if (*(float *)&v5 >= v6) {
    *(float *)&CGFloat v5 = v6;
  }
  [(UIQuadCurvePointFIFO *)self setUnitScale:v5];
}

- (void)addPoint:(UIQuadCurvePointFIFO *)self
{
  float32x4_t v53 = v2;
  if (![(_UIPointVector *)[(UIQuadCurvePointFIFO *)self prevPoints] count])
  {
    path = self->_path;
    if (path) {
      CGPathRelease(path);
    }
    self->_path = CGPathCreateMutable();
  }
  [(_UIPointVector *)[(UIQuadCurvePointFIFO *)self prevPoints] addVector:*(double *)v53.i64];
  if ([(_UIPointVector *)[(UIQuadCurvePointFIFO *)self prevPoints] count] == 1)
  {
    CGPathMoveToPoint(self->_path, 0, v53.f32[0], v53.f32[1]);
    [(_UIPointVector *)[(UIQuadCurvePointFIFO *)self points] clear];
    [(_UIPointVector *)[(UIQuadCurvePointFIFO *)self points] addVector:*(double *)v53.i64];
    [(UIQuadCurvePointFIFO *)self setLastPoint:*(double *)v53.i64];
    float32x4_t v56 = v53;
    if ([(UIQuadCurvePointFIFO *)self view])
    {
      [(UIQuadCurvePointFIFO *)self lineWidth];
      double v6 = v53.f32[0] - v5 * 0.5;
      [(UIQuadCurvePointFIFO *)self lineWidth];
      double v8 = v53.f32[1] - v7 * 0.5;
      [(UIQuadCurvePointFIFO *)self lineWidth];
      double v10 = v9;
      [(UIQuadCurvePointFIFO *)self lineWidth];
      double v12 = v11;
      view = [(UIQuadCurvePointFIFO *)self view];
      double v14 = v6;
      double v15 = v8;
      double v16 = v10;
      double v17 = v12;
LABEL_26:
      -[UIView setNeedsDisplayInRect:](view, "setNeedsDisplayInRect:", v14, v15, v16, v17);
    }
  }
  else
  {
    if ([(_UIPointVector *)[(UIQuadCurvePointFIFO *)self prevPoints] count] != 3) {
      return;
    }
    [(_UIPointVector *)[(UIQuadCurvePointFIFO *)self prevPoints] vectorAtIndex:1];
    float32x4_t v54 = v18;
    [(_UIPointVector *)[(UIQuadCurvePointFIFO *)self prevPoints] vectorAtIndex:2];
    float32x4_t aRect_24a = v19;
    [(UIQuadCurvePointFIFO *)self lastPoint];
    float32x4_t aRect_8 = v20;
    v21.i64[0] = 0x3F0000003F000000;
    v21.i64[1] = 0x3F0000003F000000;
    float32x4_t aRect_24 = vmlaq_f32(v54, v21, vsubq_f32(aRect_24a, v54));
    [(_UIPointVector *)[(UIQuadCurvePointFIFO *)self prevPoints] removeVectorAtIndex:0];
    CGPathAddQuadCurveToPoint(self->_path, 0, v54.f32[0], v54.f32[1], aRect_24.f32[0], aRect_24.f32[1]);
    [(_UIPointVector *)[(UIQuadCurvePointFIFO *)self points] clear];
    if (self->_emitInterpolatedPoints)
    {
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __33__UIQuadCurvePointFIFO_addPoint___block_invoke;
      v55[3] = &unk_1E55C7CD8;
      v55[4] = self;
      [(UIQuadCurvePointFIFO *)self enumerateInterpolationFromPoint:v55 toPoint:*(double *)aRect_8.i64 controlPoint:*(double *)aRect_24.i64 usingBlock:*(double *)v54.i64];
    }
    else
    {
      v22 = [(UIQuadCurvePointFIFO *)self points];
      +[UIQuadCurvePointFIFO interpolateFromPoint:*(double *)aRect_8.i64 toPoint:*(double *)aRect_24.i64 controlPoint:*(double *)v54.i64 time:0.0];
      -[_UIPointVector addVector:](v22, "addVector:");
      v23 = [(UIQuadCurvePointFIFO *)self points];
      LODWORD(v24) = 1.0;
      +[UIQuadCurvePointFIFO interpolateFromPoint:*(double *)aRect_8.i64 toPoint:*(double *)aRect_24.i64 controlPoint:*(double *)v54.i64 time:v24];
      -[_UIPointVector addVector:](v23, "addVector:");
    }
    [(_UIPointVector *)[(UIQuadCurvePointFIFO *)self controlPoints] addVector:*(double *)v54.i64];
    float32x4_t v56 = v54;
    *(float32x4_t *)self->_lastPoint = aRect_24;
    if (self->_view)
    {
      if (vmovn_s32(vcgtq_f32(v54, aRect_8)).u8[0]) {
        float v25 = aRect_8.f32[0];
      }
      else {
        float v25 = v54.f32[0];
      }
      double v26 = v25;
      [(UIQuadCurvePointFIFO *)self lineWidth];
      double aRect = v26 - v27 * 0.5;
      if (aRect_8.f32[1] >= v54.f32[1]) {
        float v28 = v54.f32[1];
      }
      else {
        float v28 = aRect_8.f32[1];
      }
      double v29 = v28;
      [(UIQuadCurvePointFIFO *)self lineWidth];
      double v31 = v29 - v30 * 0.5;
      [(UIQuadCurvePointFIFO *)self lineWidth];
      double v33 = v32 + fabsf(vsubq_f32(v54, aRect_8).f32[0]);
      [(UIQuadCurvePointFIFO *)self lineWidth];
      double v35 = v34 + vabds_f32(v54.f32[1], aRect_8.f32[1]);
      if (vmovn_s32(vcgtq_f32(aRect_24, v54)).u8[0]) {
        float v36 = v54.f32[0];
      }
      else {
        float v36 = aRect_24.f32[0];
      }
      double v37 = v36;
      [(UIQuadCurvePointFIFO *)self lineWidth];
      double v39 = v37 - v38 * 0.5;
      if (v54.f32[1] >= aRect_24.f32[1]) {
        float v40 = aRect_24.f32[1];
      }
      else {
        float v40 = v54.f32[1];
      }
      double v41 = v40;
      [(UIQuadCurvePointFIFO *)self lineWidth];
      CGFloat v43 = v41 - v42 * 0.5;
      [(UIQuadCurvePointFIFO *)self lineWidth];
      CGFloat v45 = v44 + fabsf(vsubq_f32(aRect_24, v54).f32[0]);
      [(UIQuadCurvePointFIFO *)self lineWidth];
      v58.size.height = v46 + vabds_f32(aRect_24.f32[1], v54.f32[1]);
      v57.origin.x = aRect;
      v57.origin.y = v31;
      v57.size.width = v33;
      v57.size.height = v35;
      v58.origin.x = v39;
      v58.origin.y = v43;
      v58.size.width = v45;
      *(NSRect *)&double v14 = NSUnionRect(v57, v58);
      view = self->_view;
      goto LABEL_26;
    }
  }
  emissionHandler = (void (**)(id, uint64_t, unint64_t, float32x4_t *, void))self->_emissionHandler;
  if (emissionHandler) {
    emissionHandler[2](emissionHandler, [(_UIPointVector *)[(UIQuadCurvePointFIFO *)self points] vectors], [(_UIPointVector *)[(UIQuadCurvePointFIFO *)self points] count], &v56, 0);
  }
  if ([(_UIPointVector *)[(UIQuadCurvePointFIFO *)self points] count])
  {
    unint64_t v48 = 0;
    do
    {
      [(_UIPointVector *)[(UIQuadCurvePointFIFO *)self points] vectorAtIndex:v48];
      -[UIPointFIFO emitPoint:](self, "emitPoint:");
      ++v48;
    }
    while ([(_UIPointVector *)[(UIQuadCurvePointFIFO *)self points] count] > v48);
  }
}

uint64_t __33__UIQuadCurvePointFIFO_addPoint___block_invoke(uint64_t a1, double a2)
{
  float32x4_t v2 = (void *)[*(id *)(a1 + 32) points];

  return [v2 addVector:a2];
}

- (void)flush
{
  float32x4_t v30 = 0uLL;
  if ([(_UIPointVector *)[(UIQuadCurvePointFIFO *)self prevPoints] count])
  {
    float32x4_t v27 = *(float32x4_t *)self->_lastPoint;
    [(_UIPointVector *)[(UIQuadCurvePointFIFO *)self prevPoints] lastVector];
    float32x4_t v4 = v3;
    float32x4_t v5 = vsubq_f32(v3, v27);
    v3.i64[0] = 0x3F0000003F000000;
    v3.i64[1] = 0x3F0000003F000000;
    float32x4_t v23 = v5;
    float32x4_t v25 = v4;
    float32x4_t v26 = vmlaq_f32(v27, v3, v5);
    float v6 = v4.f32[1];
    CGPathAddLineToPoint(self->_path, 0, v4.f32[0], v4.f32[1]);
    [(_UIPointVector *)[(UIQuadCurvePointFIFO *)self points] clear];
    if (self->_emitInterpolatedPoints)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __29__UIQuadCurvePointFIFO_flush__block_invoke;
      v29[3] = &unk_1E55C7CD8;
      v29[4] = self;
      [(UIQuadCurvePointFIFO *)self enumerateInterpolationFromPoint:v29 toPoint:*(double *)v27.i64 controlPoint:*(double *)v25.i64 usingBlock:*(double *)v26.i64];
    }
    else
    {
      double v7 = [(UIQuadCurvePointFIFO *)self points];
      +[UIQuadCurvePointFIFO interpolateFromPoint:*(double *)v27.i64 toPoint:*(double *)v25.i64 controlPoint:*(double *)v26.i64 time:0.0];
      -[_UIPointVector addVector:](v7, "addVector:");
      double v8 = [(UIQuadCurvePointFIFO *)self points];
      LODWORD(v9) = 1.0;
      +[UIQuadCurvePointFIFO interpolateFromPoint:*(double *)v27.i64 toPoint:*(double *)v25.i64 controlPoint:*(double *)v26.i64 time:v9];
      -[_UIPointVector addVector:](v8, "addVector:");
    }
    [(_UIPointVector *)[(UIQuadCurvePointFIFO *)self controlPoints] addVector:*(double *)v26.i64];
    float32x4_t v30 = v26;
    if (self->_view)
    {
      if (vmovn_s32(vcgtq_f32(v25, v27)).u8[0]) {
        float v10 = v27.f32[0];
      }
      else {
        float v10 = v25.f32[0];
      }
      double v11 = v10;
      [(UIQuadCurvePointFIFO *)self lineWidth];
      double v13 = v11 - v12 * 0.5;
      if (v27.f32[1] >= v6) {
        float v14 = v6;
      }
      else {
        float v14 = v27.f32[1];
      }
      double v15 = v14;
      [(UIQuadCurvePointFIFO *)self lineWidth];
      double v17 = v15 - v16 * 0.5;
      [(UIQuadCurvePointFIFO *)self lineWidth];
      double v19 = v18 + fabsf(v24);
      [(UIQuadCurvePointFIFO *)self lineWidth];
      -[UIView setNeedsDisplayInRect:](self->_view, "setNeedsDisplayInRect:", v13, v17, v19, v20 + vabds_f32(v6, v27.f32[1]));
    }
    emissionHandler = (void (**)(id, uint64_t, unint64_t, _OWORD *, uint64_t))self->_emissionHandler;
    if (emissionHandler) {
      ((void (**)(id, uint64_t, unint64_t, float32x4_t *, uint64_t))emissionHandler)[2](emissionHandler, [(_UIPointVector *)[(UIQuadCurvePointFIFO *)self points] vectors], [(_UIPointVector *)[(UIQuadCurvePointFIFO *)self points] count], &v30, 1);
    }
    if ([(_UIPointVector *)[(UIQuadCurvePointFIFO *)self points] count])
    {
      unint64_t v22 = 0;
      do
      {
        [(_UIPointVector *)[(UIQuadCurvePointFIFO *)self points] vectorAtIndex:v22];
        -[UIPointFIFO emitPoint:](self, "emitPoint:");
        ++v22;
      }
      while ([(_UIPointVector *)[(UIQuadCurvePointFIFO *)self points] count] > v22);
    }
  }
  [(_UIPointVector *)[(UIQuadCurvePointFIFO *)self prevPoints] clear];
  v28.receiver = self;
  v28.super_class = (Class)UIQuadCurvePointFIFO;
  [(UIPointFIFO *)&v28 flush];
}

uint64_t __29__UIQuadCurvePointFIFO_flush__block_invoke(uint64_t a1, double a2)
{
  float32x4_t v2 = (void *)[*(id *)(a1 + 32) points];

  return [v2 addVector:a2];
}

- (void)clear
{
  [(_UIPointVector *)[(UIQuadCurvePointFIFO *)self prevPoints] clear];
  [(_UIPointVector *)[(UIQuadCurvePointFIFO *)self points] clear];
  path = self->_path;
  if (path) {
    CGPathRelease(path);
  }
  self->_path = CGPathCreateMutable();
  v4.receiver = self;
  v4.super_class = (Class)UIQuadCurvePointFIFO;
  [(UIPointFIFO *)&v4 clear];
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (id)emissionHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setEmissionHandler:(id)a3
{
}

- (float)unitScale
{
  return self->_unitScale;
}

- (void)setUnitScale:(float)a3
{
  self->_unitScale = a3;
}

- (CGPath)path
{
  return self->_path;
}

- (void)setPath:(CGPath *)a3
{
  self->_path = a3;
}

- (_UIPointVector)prevPoints
{
  return self->_prevPoints;
}

- (void)setPrevPoints:(id)a3
{
}

- (_UIPointVector)points
{
  return self->_points;
}

- (void)setPoints:(id)a3
{
}

- (_UIPointVector)controlPoints
{
  return self->_controlPoints;
}

- (void)setControlPoints:(id)a3
{
}

- (__n128)lastPoint
{
  return a1[5];
}

- (void)setLastPoint:(UIQuadCurvePointFIFO *)self
{
  *(_OWORD *)self->_lastPoint = v2;
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (BOOL)emitInterpolatedPoints
{
  return self->_emitInterpolatedPoints;
}

- (void)setEmitInterpolatedPoints:(BOOL)a3
{
  self->_emitInterpolatedPoints = a3;
}

@end