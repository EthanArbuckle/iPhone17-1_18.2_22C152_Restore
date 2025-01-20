@interface PUPinchTracker
- (BOOL)allowTrackingOutside;
- (PUPinchTracker)init;
- (PUPinchTracker)initWithInitialCenter:(CGPoint)a3 initialSize:(CGSize)a4 initialTransform:(CGAffineTransform *)a5;
- (double)rotationHysteresisDegrees;
- (id)updateHandler;
- (void)_transformPinchLocation1:(CGPoint)a3 location2:(CGPoint)a4 intoCenter:(CGPoint *)a5 distance:(double *)a6 angle:(double *)a7;
- (void)setAllowTrackingOutside:(BOOL)a3;
- (void)setPinchLocation1:(CGPoint)a3 location2:(CGPoint)a4;
- (void)setRotationHysteresisDegrees:(double)a3;
- (void)setUpdateHandler:(id)a3;
@end

@implementation PUPinchTracker

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_pinchRotationValueFilter, 0);
}

- (void)setRotationHysteresisDegrees:(double)a3
{
  self->_rotationHysteresisDegrees = a3;
}

- (double)rotationHysteresisDegrees
{
  return self->_rotationHysteresisDegrees;
}

- (void)setAllowTrackingOutside:(BOOL)a3
{
  self->_allowTrackingOutside = a3;
}

- (BOOL)allowTrackingOutside
{
  return self->_allowTrackingOutside;
}

- (void)setUpdateHandler:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)_transformPinchLocation1:(CGPoint)a3 location2:(CGPoint)a4 intoCenter:(CGPoint *)a5 distance:(double *)a6 angle:(double *)a7
{
  double y = a4.y;
  double x = a4.x;
  double v12 = a3.y;
  double v13 = a3.x;
  long double v14 = a4.x - a3.x;
  long double v15 = a4.y - a3.y;
  long double v16 = hypot(a4.x - a3.x, a4.y - a3.y);
  long double v17 = atan2(v15, v14);
  if (a5)
  {
    a5->double x = x * 0.5 + v13 * 0.5;
    a5->double y = y * 0.5 + v12 * 0.5;
  }
  if (a6) {
    *a6 = v16;
  }
  if (a7) {
    *a7 = v17;
  }
}

- (void)setPinchLocation1:(CGPoint)a3 location2:(CGPoint)a4
{
  double y = a3.y;
  double x = a3.x;
  v61[2] = *MEMORY[0x1E4F143B8];
  v7 = (double *)MEMORY[0x1E4F1DAD8];
  if (!self->_didSetInitialPinchValues)
  {
    double v8 = self->_initialCenter.x;
    double v9 = self->_initialCenter.y;
    double v10 = x - v8;
    double v11 = y - v9;
    CGPoint v50 = a4;
    CGFloat v12 = a4.x - v8;
    CGFloat v13 = a4.y - v9;
    double a = self->_initialTransformInverse.a;
    double b = self->_initialTransformInverse.b;
    double c = self->_initialTransformInverse.c;
    double d = self->_initialTransformInverse.d;
    tdouble x = self->_initialTransformInverse.tx;
    tdouble y = self->_initialTransformInverse.ty;
    double v20 = tx + v11 * c + a * v10;
    double v21 = ty + v11 * d + b * v10;
    v57.double a = v20;
    v57.double b = v21;
    double v22 = tx + c * v13 + a * v12;
    double v23 = ty + d * v13 + b * v12;
    v56.double a = v22;
    v56.double b = v23;
    double width = self->_initialSize.width;
    double height = self->_initialSize.height;
    if (![(PUPinchTracker *)self allowTrackingOutside])
    {
      PUAdjustPointsToBeWithinRect((CGPoint *)&v57, (CGPoint *)&v56, *v7 - width * 0.5, v7[1] - height * 0.5, width, height);
      double v20 = v57.a;
      double v21 = v57.b;
      double v22 = v56.a;
      double v23 = v56.b;
    }
    -[PUPinchTracker _transformPinchLocation1:location2:intoCenter:distance:angle:](self, "_transformPinchLocation1:location2:intoCenter:distance:angle:", &self->_initialPinchCenter, &self->_initialPinchDistance, &self->_initialPinchAngle, self->_initialTransform.tx+ v21 * self->_initialTransform.c+ self->_initialTransform.a * v20+ self->_initialCenter.x, self->_initialCenter.y+ self->_initialTransform.ty+ v21 * self->_initialTransform.d+ self->_initialTransform.b * v20, self->_initialTransform.tx+ self->_initialTransform.c * v23+ self->_initialTransform.a * v22+ self->_initialCenter.x, self->_initialCenter.y+ self->_initialTransform.ty
    + self->_initialTransform.d * v23
    + self->_initialTransform.b * v22);
    self->_initialPinchOrigin = (CGPoint)vaddq_f64(*(float64x2_t *)&self->_initialTransformInverse.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->_initialTransformInverse.c, self->_initialPinchCenter.y - self->_initialCenter.y), *(float64x2_t *)&self->_initialTransformInverse.a, self->_initialPinchCenter.x - self->_initialCenter.x));
    self->_didSetInitialPinchValues = 1;
    a4 = v50;
  }
  long long v60 = *(_OWORD *)v7;
  double v58 = 0.0;
  double v59 = 0.0;
  -[PUPinchTracker _transformPinchLocation1:location2:intoCenter:distance:angle:](self, "_transformPinchLocation1:location2:intoCenter:distance:angle:", &v60, &v59, &v58, x, y, a4.x, a4.y);
  double v26 = *(double *)&v60 - self->_initialPinchCenter.x;
  double v27 = *((double *)&v60 + 1) - self->_initialPinchCenter.y;
  double v28 = self->_initialTransformInverse.tx
      + v27 * self->_initialTransformInverse.c
      + self->_initialTransformInverse.a * v26;
  double v29 = self->_initialTransformInverse.ty
      + v27 * self->_initialTransformInverse.d
      + self->_initialTransformInverse.b * v26;
  double v30 = v59 / self->_initialPinchDistance;
  double v31 = v58 - self->_initialPinchAngle;
  pinchRotationValueFilter = self->_pinchRotationValueFilter;
  if (!pinchRotationValueFilter)
  {
    v33 = objc_alloc_init(PUAngleValueFilter);
    v34 = objc_alloc_init(PUInitialHysteresisValueFilter);
    [(PUPinchTracker *)self rotationHysteresisDegrees];
    [(PUInitialHysteresisValueFilter *)v34 setThresholdValue:v35 * 3.14159265 / 180.0];
    v36 = objc_alloc_init(PUGroupValueFilter);
    v61[0] = v33;
    v61[1] = v34;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
    [(PUGroupValueFilter *)v36 setFilters:v37];

    v38 = self->_pinchRotationValueFilter;
    self->_pinchRotationValueFilter = &v36->super;

    pinchRotationValueFilter = self->_pinchRotationValueFilter;
  }
  [(PUValueFilter *)pinchRotationValueFilter setInputValue:v31];
  [(PUValueFilter *)self->_pinchRotationValueFilter outputValue];
  CGFloat v40 = v39;
  long long v41 = *MEMORY[0x1E4F1DAB8];
  long long v42 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v57.double c = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v57.tdouble x = v42;
  double v43 = self->_initialPinchOrigin.x;
  double v44 = self->_initialPinchOrigin.y;
  *(_OWORD *)&v56.double a = v41;
  *(_OWORD *)&v56.double c = *(_OWORD *)&v57.c;
  *(_OWORD *)&v56.tdouble x = v42;
  *(_OWORD *)&v57.double a = v41;
  CGAffineTransformTranslate(&v57, &v56, v43, v44);
  CGAffineTransform t1 = v57;
  long long v45 = *(_OWORD *)&self->_initialTransform.c;
  *(_OWORD *)&t2.double a = *(_OWORD *)&self->_initialTransform.a;
  *(_OWORD *)&t2.double c = v45;
  *(_OWORD *)&t2.tdouble x = *(_OWORD *)&self->_initialTransform.tx;
  CGAffineTransformConcat(&v56, &t1, &t2);
  CGAffineTransform v57 = v56;
  CGAffineTransform t1 = v56;
  CGAffineTransformTranslate(&v56, &t1, v28, v29);
  CGAffineTransform v57 = v56;
  CGAffineTransform t1 = v56;
  CGAffineTransformScale(&v56, &t1, v30, v30);
  CGAffineTransform v57 = v56;
  CGAffineTransform t1 = v56;
  CGAffineTransformRotate(&v56, &t1, v40);
  CGAffineTransform v57 = v56;
  CGAffineTransform t1 = v56;
  CGAffineTransformTranslate(&v56, &t1, -v43, -v44);
  CGAffineTransform v57 = v56;
  CGPoint initialCenter = self->_initialCenter;
  CGSize initialSize = self->_initialSize;
  CGPoint v53 = initialCenter;
  CGAffineTransform t2 = v56;
  memset(&t1, 0, sizeof(t1));
  PUComposeTransform(&t2, (uint64_t)&t1, initialCenter.x, initialCenter.y, initialSize.width, initialSize.height, 0.0);
  CGFloat angle = 0.0;
  CGAffineTransform t2 = t1;
  PUDecomposeTransform((uint64_t)&t2, &v53, &initialSize.width, &initialSize.height, (long double *)&angle);
  CGAffineTransformMakeRotation(&v56, angle);
  v47 = [(PUPinchTracker *)self updateHandler];

  if (v47)
  {
    v48 = [(PUPinchTracker *)self updateHandler];
    v49 = (void (*)(void *, CGAffineTransform *, double, double, double, double))v48[2];
    CGAffineTransform t2 = v56;
    v49(v48, &t2, v53.x, v53.y, initialSize.width, initialSize.height);
  }
}

- (PUPinchTracker)initWithInitialCenter:(CGPoint)a3 initialSize:(CGSize)a4 initialTransform:(CGAffineTransform *)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (a4.width == 0.0 || a4.height == 0.0)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PUPinchTracker.m", 36, @"Invalid parameter not satisfying: %@", @"initialSize.width != 0.0f && initialSize.height != 0.0f" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)PUPinchTracker;
  CGFloat v12 = [(PUPinchTracker *)&v22 init];
  CGFloat v13 = v12;
  if (v12)
  {
    *((CGFloat *)v12 + 1) = x;
    *((CGFloat *)v12 + 2) = y;
    *((CGFloat *)v12 + 3) = width;
    *((CGFloat *)v12 + 4) = height;
    long long v14 = *(_OWORD *)&a5->a;
    long long v15 = *(_OWORD *)&a5->c;
    *(_OWORD *)(v12 + 72) = *(_OWORD *)&a5->tx;
    *(_OWORD *)(v12 + 56) = v15;
    *(_OWORD *)(v12 + 40) = v14;
    long long v16 = *(_OWORD *)&a5->c;
    *(_OWORD *)&v20.double a = *(_OWORD *)&a5->a;
    *(_OWORD *)&v20.double c = v16;
    *(_OWORD *)&v20.tCGFloat x = *(_OWORD *)&a5->tx;
    CGAffineTransformInvert(&v21, &v20);
    long long v17 = *(_OWORD *)&v21.c;
    *(_OWORD *)(v13 + 88) = *(_OWORD *)&v21.a;
    *(_OWORD *)(v13 + 104) = v17;
    *(_OWORD *)(v13 + 120) = *(_OWORD *)&v21.tx;
    *((void *)v13 + 27) = 0x4014000000000000;
  }
  return (PUPinchTracker *)v13;
}

- (PUPinchTracker)init
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return -[PUPinchTracker initWithInitialCenter:initialSize:initialTransform:](self, "initWithInitialCenter:initialSize:initialTransform:", v8, v2, v3, v4, v5);
}

@end