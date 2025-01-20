@interface PKDiffView
- (void)dealloc;
- (void)performStrokeWithCompletion:(id)a3;
- (void)updateShapeLayer;
@end

@implementation PKDiffView

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKDiffView;
  [(PKDiffView *)&v2 dealloc];
}

- (void)updateShapeLayer
{
  p_shapeLayer = &self->_shapeLayer;
  if (!self->_shapeLayer)
  {
    [(PKDiffView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v9 = [v8 URLForResource:@"DiffCircle" withExtension:@"caar"];

    v10 = [MEMORY[0x1E4F39C38] packageWithContentsOfURL:v9 type:*MEMORY[0x1E4F3A4B8] options:0 error:0];
    v11 = [v10 rootLayer];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    objc_storeStrong((id *)p_shapeLayer, v12);
    [(CAShapeLayer *)*p_shapeLayer frame];
    double v14 = v13;
    double v16 = v15;
    v17 = CGPathRetain([(CAShapeLayer *)*p_shapeLayer path]);
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&transform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&transform.c = v18;
    *(_OWORD *)&transform.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&v29.a = *(_OWORD *)&transform.a;
    *(_OWORD *)&v29.c = v18;
    *(_OWORD *)&v29.tx = *(_OWORD *)&transform.tx;
    CGAffineTransformScale(&transform, &v29, v5 / v14, v7 / v16);
    CGAffineTransform v28 = transform;
    CGAffineTransformTranslate(&v29, &v28, v14 * 0.5, v16 * 0.5);
    CGAffineTransform transform = v29;
    float64x2_t v19 = vminnmq_f64(vmaxnmq_f64(vaddq_f64((float64x2_t)vdupq_lane_s64(RandomPathRotation_sPreviousRotation, 0), (float64x2_t)xmmword_1A04441E0), (float64x2_t)vdupq_n_s64(0xBFE921FB54442D18)), (float64x2_t)vdupq_n_s64(0x3FE921FB54442D18uLL));
    double v20 = v19.f64[1];
    double v21 = v19.f64[0] - v19.f64[1];
    double v22 = drand48() * (1.57079633 - (v19.f64[0] - v19.f64[1])) + -0.785398163;
    double v23 = -0.0;
    if (v22 > v20) {
      double v23 = v21;
    }
    *(double *)&RandomPathRotation_sPreviousRotation = v22 + v23;
    CGAffineTransform v28 = transform;
    CGAffineTransformRotate(&v29, &v28, v22 + v23);
    CGAffineTransform transform = v29;
    CGAffineTransform v28 = v29;
    CGAffineTransformTranslate(&v29, &v28, -(v14 * 0.5), -(v16 * 0.5));
    CGAffineTransform transform = v29;
    CGMutablePathRef v24 = CGPathCreateMutableCopyByTransformingPath(v17, &transform);
    [(CAShapeLayer *)*p_shapeLayer setPath:v24];
    CFRelease(v24);
    v25 = [(CAShapeLayer *)*p_shapeLayer mask];
    CGAffineTransform v29 = transform;
    [v25 setAffineTransform:&v29];

    CGPathRelease(v17);
    v26 = *p_shapeLayer;
    [(PKDiffView *)self bounds];
    -[CAShapeLayer setFrame:](v26, "setFrame:");
    [(CAShapeLayer *)*p_shapeLayer setGeometryFlipped:1];
    [(CAShapeLayer *)*p_shapeLayer setStrokeEnd:0.0];
    v27 = [(PKDiffView *)self layer];
    [v27 addSublayer:*p_shapeLayer];
  }
}

- (void)performStrokeWithCompletion:(id)a3
{
  id v4 = a3;
  [(PKDiffView *)self updateShapeLayer];
  id v9 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeEnd"];
  double v5 = [NSNumber numberWithInteger:0];
  [v9 setFromValue:v5];

  double v6 = [NSNumber numberWithInteger:1];
  [v9 setToValue:v6];

  [(CAShapeLayer *)self->_shapeLayer setStrokeEnd:1.0];
  [(CAShapeLayer *)self->_shapeLayer addAnimation:v9 forKey:@"strokeEnd"];
  [MEMORY[0x1E4F39CF8] animationDuration];
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)((v7 + 0.100000001) * 1000000000.0));
  dispatch_after(v8, MEMORY[0x1E4F14428], v4);
}

- (void).cxx_destruct
{
}

@end