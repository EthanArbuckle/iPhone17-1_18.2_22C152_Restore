@interface _UIScrollDynamicsiOSMac
- (BOOL)isRubberBandingAfterDuration:(double)a3;
- (CGPoint)positionAfterDuration:(double)a3;
- (CGVector)velocityAfterDuration:(double)a3;
- (_UIScrollDynamicsiOSMac)init;
- (double)durationUntilStop;
- (double)speedAfterDuration:(double)a3;
- (void)calculateDecelerationTarget;
- (void)calculateToReachDecelerationTarget;
@end

@implementation _UIScrollDynamicsiOSMac

- (_UIScrollDynamicsiOSMac)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIScrollDynamicsiOSMac;
  result = [(_UIScrollDynamics *)&v3 init];
  if (result) {
    result->_decelerationRate = 1000.0;
  }
  return result;
}

- (void)calculateDecelerationTarget
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ScrollDynamics", &calculateDecelerationTarget___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v60 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      v61 = v60;
      v62 = (objc_class *)objc_opt_class();
      v63 = NSStringFromClass(v62);
      v64 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v76 = v63;
      __int16 v77 = 2048;
      v78 = self;
      __int16 v79 = 2112;
      v80 = v64;
      _os_log_impl(&dword_1853B0000, v61, OS_LOG_TYPE_ERROR, "[%@(0x%lx) %@]", buf, 0x20u);
    }
  }
  self->_durationUntilRubberband = -1.0;
  [(_UIScrollDynamics *)self contentOrigin];
  double v71 = v6;
  double v72 = v5;
  [(_UIScrollDynamics *)self viewSize];
  double v8 = v7;
  double v10 = v9;
  [(_UIScrollDynamics *)self initialVelocity];
  int8x16_t v73 = v12;
  int8x16_t v74 = v11;
  [(_UIScrollDynamics *)self initialContentOffset];
  double v14 = v13;
  double v16 = v15;
  [(_UIScrollDynamics *)self tolerance];
  double v67 = v17;
  double v68 = v18;
  [(_UIScrollDynamics *)self decelerationTarget];
  v19.i64[0] = 1.0;
  v20.f64[0] = NAN;
  v20.f64[1] = NAN;
  int8x16_t v21 = (int8x16_t)vnegq_f64(v20);
  double v70 = *(double *)vbslq_s8(v21, v19, v74).i64;
  *(void *)&double v69 = vbslq_s8(v21, v19, v73).u64[0];
  BOOL v22 = [(_UIScrollDynamics *)self shouldRoundCalculations];
  double decelerationRate = self->_decelerationRate;
  CGFloat v66 = v14;
  double v24 = v14 + v70 * (decelerationRate * pow(fabs(*(double *)v74.i64) / (decelerationRate * 4.0), 1.33333333));
  double v25 = ceil(v24 + -0.5);
  double v26 = floor(v24 + 0.5);
  if (v24 <= 0.0) {
    double v25 = v26;
  }
  if (v22) {
    double v24 = v25;
  }
  p_destinationIgnoringRubberbanding = &self->_destinationIgnoringRubberbanding;
  self->_destinationIgnoringRubberbanding.CGFloat x = v24;
  BOOL v28 = [(_UIScrollDynamics *)self shouldRoundCalculations];
  double v29 = self->_decelerationRate;
  CGFloat v65 = v16;
  double v30 = v16 + v69 * (v29 * pow(fabs(*(double *)v73.i64) / (v29 * 4.0), 1.33333333));
  if (v28)
  {
    double v31 = ceil(v30 + -0.5);
    double v32 = floor(v30 + 0.5);
    if (v30 <= 0.0) {
      double v30 = v32;
    }
    else {
      double v30 = v31;
    }
  }
  self->_destinationIgnoringRubberbanding.CGFloat y = v30;
  _catesCalculateCachedProperties(self);
  CGFloat x = p_destinationIgnoringRubberbanding->x;
  CGFloat y = self->_destinationIgnoringRubberbanding.y;
  [(_UIScrollDynamics *)self contentFrame];
  if (v37 <= v8 + 0.0001) {
    CGFloat v39 = v72;
  }
  else {
    CGFloat v39 = v35;
  }
  if (v37 <= v8 + 0.0001) {
    double v40 = v8;
  }
  else {
    double v40 = v37;
  }
  if (v38 <= v10 + 0.0001) {
    CGFloat v41 = v71;
  }
  else {
    CGFloat v41 = v36;
  }
  if (v38 <= v10 + 0.0001) {
    double v42 = v10;
  }
  else {
    double v42 = v38;
  }
  double v43 = _NSStretchOfClipBoundsForDocumentFrame(x, y, v8, v10, v39, v41, v40, v42, v72, v71);
  self->_rubberBandingAxis = 0;
  double v45 = fabs(v44);
  if (fabs(v43) < v67 && v45 < v68) {
    goto LABEL_34;
  }
  int v47 = 0;
  if (self->_absDisplacementVectorIgnoringRubberbanding.height < self->_absDisplacementVectorIgnoringRubberbanding.width)
  {
    self->_destinationIgnoringRubberbanding.CGFloat y = self->_destinationIgnoringRubberbanding.y - v44;
    double v44 = 0.0;
    unint64_t v48 = 1;
    if (v43 == 0.0) {
      goto LABEL_30;
    }
    goto LABEL_28;
  }
  p_destinationIgnoringRubberbanding->CGFloat x = p_destinationIgnoringRubberbanding->x - v43;
  double v43 = 0.0;
  unint64_t v48 = 2;
  if (v44 != 0.0)
  {
LABEL_28:
    self->_rubberBandingAxis = v48;
    int v47 = 1;
  }
LABEL_30:
  double v49 = p_destinationIgnoringRubberbanding->x - v43;
  double v50 = self->_destinationIgnoringRubberbanding.y - v44;
  -[_UIScrollDynamics setDecelerationTarget:](self, "setDecelerationTarget:", v49, v50);
  _catesCalculateCachedProperties(self);
  if (!v47)
  {
LABEL_34:
    -[_UIScrollDynamics setDecelerationTarget:](self, "setDecelerationTarget:", p_destinationIgnoringRubberbanding->x, self->_destinationIgnoringRubberbanding.y);
    self->_durationUntilRubberband = -1.0;
    goto LABEL_37;
  }
  double v51 = _NSStretchOfClipBoundsForDocumentFrame(v66, v65, v8, v10, v39, v41, v40, v42, v72, v71);
  if (*MEMORY[0x1E4F1DB30] == v51 && *(double *)(MEMORY[0x1E4F1DB30] + 8) == v52)
  {
    double durationUntilStopIgnoringRubberbanding = self->_durationUntilStopIgnoringRubberbanding;
    double v54 = durationUntilStopIgnoringRubberbanding
        - pow((self->_linearDisplacementIgnoringRubberbanding - sqrt((v49 - v66) * (v49 - v66) + (v50 - v65) * (v50 - v65)))/ self->_decelerationRate, 0.25);
    self->_durationUntilRubberband = v54;
    double v55 = self->_decelerationRate * 4.0;
    long double v56 = v55 * pow(self->_durationUntilStopIgnoringRubberbanding - v54, 3.0);
    double linearDisplacementIgnoringRubberbanding = self->_linearDisplacementIgnoringRubberbanding;
    long double v58 = v56 * (self->_absDisplacementVectorIgnoringRubberbanding.width / linearDisplacementIgnoringRubberbanding);
    long double v59 = v56 * (self->_absDisplacementVectorIgnoringRubberbanding.height / linearDisplacementIgnoringRubberbanding);
    self->_initialRubberbandingVelocity.dCGFloat x = v70 * v58;
    self->_initialRubberbandingVelocity.dCGFloat y = v69 * v59;
  }
  else
  {
    self->_initialRubberbandingOrigin.CGFloat x = v51;
    self->_initialRubberbandingOrigin.CGFloat y = v52;
    self->_durationUntilRubberband = 0.0;
    *(void *)&self->_initialRubberbandingVelocity.dCGFloat x = v74.i64[0];
    *(void *)&self->_initialRubberbandingVelocity.dCGFloat y = v73.i64[0];
    p_destinationIgnoringRubberbanding->CGFloat x = v49;
    self->_destinationIgnoringRubberbanding.CGFloat y = v50;
  }
  _catesCalculateCachedProperties(self);
LABEL_37:
  if (self->_decelerationRate <= 0.0
    && self->_durationUntilStopIgnoringRubberbanding > 2.0
    && self->_durationUntilRubberband < 0.0)
  {
    [(_UIScrollDynamicsiOSMac *)self positionAfterDuration:2.0];
    -[_UIScrollDynamics setDecelerationTarget:](self, "setDecelerationTarget:");
    [(_UIScrollDynamicsiOSMac *)self calculateToReachDecelerationTarget];
  }
}

- (void)calculateToReachDecelerationTarget
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ScrollDynamics", &_MergedGlobals_1_33);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    double v51 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      double v52 = v51;
      v53 = (objc_class *)objc_opt_class();
      double v54 = NSStringFromClass(v53);
      double v55 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      double v69 = *(double *)&v54;
      __int16 v70 = 2048;
      double v71 = self;
      __int16 v72 = 2112;
      double v73 = *(double *)&v55;
      _os_log_impl(&dword_1853B0000, v52, OS_LOG_TYPE_ERROR, "[%@(0x%lx) %@]", buf, 0x20u);
    }
  }
  [(_UIScrollDynamics *)self contentOrigin];
  [(_UIScrollDynamics *)self viewSize];
  [(_UIScrollDynamics *)self initialVelocity];
  int8x16_t v66 = v6;
  int8x16_t v67 = v5;
  [(_UIScrollDynamics *)self initialContentOffset];
  double v8 = v7;
  double v10 = v9;
  [(_UIScrollDynamics *)self decelerationTarget];
  double v12 = v11;
  double v14 = v13;
  [(_UIScrollDynamics *)self tolerance];
  self->_durationUntilRubberband = -1.0;
  self->_destinationIgnoringRubberbanding.CGFloat x = v12;
  self->_destinationIgnoringRubberbanding.CGFloat y = v14;
  unint64_t v15 = __UILogGetCategoryCachedImpl("ScrollDynamics", &qword_1EB25BFF0);
  if (*(unsigned char *)v15)
  {
    long double v56 = *(NSObject **)(v15 + 8);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      v57 = v56;
      v77.CGFloat x = v12;
      v77.CGFloat y = v14;
      long double v58 = NSStringFromCGPoint(v77);
      *(_DWORD *)buf = 138412290;
      double v69 = *(double *)&v58;
      _os_log_impl(&dword_1853B0000, v57, OS_LOG_TYPE_ERROR, "New Destination: %@", buf, 0xCu);
    }
  }
  v16.i64[0] = 1.0;
  v17.f64[0] = NAN;
  v17.f64[1] = NAN;
  int8x16_t v18 = (int8x16_t)vnegq_f64(v17);
  *(void *)&double v65 = vbslq_s8(v18, v16, v66).u64[0];
  BOOL v19 = [(_UIScrollDynamics *)self shouldRoundCalculations];
  double decelerationRate = self->_decelerationRate;
  double v21 = v64 * (decelerationRate * pow(fabs(*(double *)v67.i64) / (decelerationRate * 4.0), 1.33333333));
  if (v19)
  {
    double v22 = ceil(v21 + -0.5);
    double v23 = floor(v21 + 0.5);
    if (v21 <= 0.0) {
      double v21 = v23;
    }
    else {
      double v21 = v22;
    }
  }
  BOOL v24 = [(_UIScrollDynamics *)self shouldRoundCalculations];
  double v25 = self->_decelerationRate;
  double v26 = v65 * (v25 * pow(fabs(*(double *)v66.i64) / (v25 * 4.0), 1.33333333));
  if (v24)
  {
    double v27 = ceil(v26 + -0.5);
    double v28 = floor(v26 + 0.5);
    if (v26 <= 0.0) {
      double v26 = v28;
    }
    else {
      double v26 = v27;
    }
  }
  double v29 = v12 - v8;
  if ([(_UIScrollDynamics *)self shouldRoundCalculations])
  {
    double v30 = ceil(v29 + -0.5);
    double v31 = floor(v29 + 0.5);
    if (v29 <= 0.0) {
      double v29 = v31;
    }
    else {
      double v29 = v30;
    }
  }
  double v32 = v14 - v10;
  if ([(_UIScrollDynamics *)self shouldRoundCalculations])
  {
    double v33 = ceil(v32 + -0.5);
    double v34 = floor(v32 + 0.5);
    if (v32 <= 0.0) {
      double v32 = v34;
    }
    else {
      double v32 = v33;
    }
  }
  double v35 = sqrt(v21 * v21 + v26 * v26);
  double v36 = self->_decelerationRate;
  double v37 = sqrt(v29 * v29 + v32 * v32);
  double v38 = pow(self->_durationUntilStopIgnoringRubberbanding, 3.0);
  if (v37 > 0.5)
  {
    double v39 = v38 * (v36 * 4.0);
    if ((v29 == 0.0 || *(void *)&v29 >> 63 == *(void *)&v21 >> 63)
      && (v32 == 0.0 || *(void *)&v32 >> 63 == *(void *)&v26 >> 63))
    {
      if (v37 <= v35)
      {
        unint64_t v45 = __UILogGetCategoryCachedImpl("ScrollDynamics", &qword_1EB25C010);
        if (*(unsigned char *)v45)
        {
          v63 = *(NSObject **)(v45 + 8);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v63, OS_LOG_TYPE_ERROR, "we'd go too far on the current velocity, so adjust the deceleration rate", buf, 2u);
          }
        }
        [(_UIScrollDynamics *)self initialVelocity];
        double v39 = sqrt(*(double *)v66.i64 * *(double *)v66.i64 + *(double *)v67.i64 * v46);
        long double v47 = pow(v37, 0.75);
        double v48 = pow(v39 / (v47 * 4.0), 4.0);
        self->_double decelerationRate = v48;
        double v49 = pow(v37 / v48, 0.25);
        self->_double durationUntilStopIgnoringRubberbanding = v49;
        self->_double durationUntilStop = v49;
        goto LABEL_36;
      }
      unint64_t v40 = __UILogGetCategoryCachedImpl("ScrollDynamics", &qword_1EB25C008);
      if ((*(unsigned char *)v40 & 1) == 0 || (CGFloat v41 = *(NSObject **)(v40 + 8), !os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)))
      {
LABEL_36:
        -[_UIScrollDynamics setInitialVelocity:](self, "setInitialVelocity:", v29 / v37 * v39, v32 / v37 * v39);
        goto LABEL_37;
      }
      *(_WORD *)buf = 0;
      double v42 = "we need to go farther than we can on the current velocity, so increase the velocity";
    }
    else
    {
      unint64_t v44 = __UILogGetCategoryCachedImpl("ScrollDynamics", &qword_1EB25C000);
      if ((*(unsigned char *)v44 & 1) == 0) {
        goto LABEL_36;
      }
      CGFloat v41 = *(NSObject **)(v44 + 8);
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      double v42 = "changed direction! Just calculate a new velocity";
    }
    _os_log_impl(&dword_1853B0000, v41, OS_LOG_TYPE_ERROR, v42, buf, 2u);
    goto LABEL_36;
  }
  unint64_t v43 = __UILogGetCategoryCachedImpl("ScrollDynamics", &qword_1EB25BFF8);
  if (*(unsigned char *)v43)
  {
    v62 = *(NSObject **)(v43 + 8);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v62, OS_LOG_TYPE_ERROR, "Already at destination, just stop", buf, 2u);
    }
  }
  self->_double durationUntilStopIgnoringRubberbanding = 0.0;
  self->_double durationUntilStop = 0.0;
LABEL_37:
  _catesCalculateCachedProperties(self);
  unint64_t v50 = __UILogGetCategoryCachedImpl("ScrollDynamics", &qword_1EB25C020);
  if (*(unsigned char *)v50)
  {
    long double v59 = *(NSObject **)(v50 + 8);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      double durationUntilStop = self->_durationUntilStop;
      double v61 = self->_decelerationRate;
      *(_DWORD *)buf = 134218752;
      double v69 = durationUntilStop;
      __int16 v70 = 2048;
      double v71 = *(_UIScrollDynamicsiOSMac **)&v61;
      __int16 v72 = 2048;
      double v73 = v35;
      __int16 v74 = 2048;
      double v75 = v37;
      _os_log_impl(&dword_1853B0000, v59, OS_LOG_TYPE_ERROR, "t:%.3f d:%.3f oDelta:%0.1f nDelta:%0.1f", buf, 0x2Au);
    }
  }
}

- (double)durationUntilStop
{
  return self->_durationUntilStop;
}

- (double)speedAfterDuration:(double)a3
{
  if (-[_UIScrollDynamicsiOSMac isRubberBandingAfterDuration:](self, "isRubberBandingAfterDuration:"))
  {
    double v15 = a3 - self->_durationUntilRubberband;
    double v14 = exp(v15 * -20.0 / 1.6);
    double v5 = exp((v15 + 0.001) * -20.0 / 1.6);
    float64x2_t v6 = vminnmq_f64((float64x2_t)self->_initialRubberbandingVelocity, (float64x2_t)vdupq_n_s64(0x40D3880000000000uLL));
    float64x2_t v7 = (float64x2_t)vdupq_n_s64(0xC0D3880000000000);
    float64x2_t v8 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v7, v6), (int8x16_t)v7, (int8x16_t)v6);
    float64x2_t v9 = (float64x2_t)vdupq_n_s64(0x3FD3D70A3D70A3D7uLL);
    float64x2_t v10 = vsubq_f64(vmulq_n_f64(vsubq_f64((float64x2_t)self->_initialRubberbandingOrigin, vmulq_f64(vmulq_n_f64(v8, v15 + 0.001), v9)), v5), vmulq_n_f64(vsubq_f64((float64x2_t)self->_initialRubberbandingOrigin, vmulq_f64(vmulq_n_f64(v8, v15), v9)), v14));
    return sqrt(vaddvq_f64(vmulq_f64(v10, v10))) / 0.001;
  }
  else
  {
    long double v12 = self->_durationUntilStopIgnoringRubberbanding - a3;
    double v13 = self->_decelerationRate * 4.0;
    return pow(v12, 3.0) * v13;
  }
}

- (CGVector)velocityAfterDuration:(double)a3
{
  [(_UIScrollDynamicsiOSMac *)self speedAfterDuration:a3];
  double v5 = v4;
  [(_UIScrollDynamics *)self initialContentOffset];
  double v7 = v6;
  double v9 = v8;
  [(_UIScrollDynamics *)self decelerationTarget];
  double v11 = v10 - v7;
  double v13 = v12 - v9;
  double v14 = sqrt(v11 * v11 + v13 * v13);
  double v15 = v5 * (v11 / v14);
  double v16 = v5 * (v13 / v14);
  result.dCGFloat y = v16;
  result.dCGFloat x = v15;
  return result;
}

- (CGPoint)positionAfterDuration:(double)a3
{
  [(_UIScrollDynamics *)self initialContentOffset];
  double v6 = v5;
  double v8 = v7;
  [(_UIScrollDynamics *)self decelerationTarget];
  double v10 = v9;
  double v12 = v11;
  double durationUntilRubberband = self->_durationUntilRubberband;
  BOOL v14 = durationUntilRubberband <= a3 && durationUntilRubberband >= 0.0;
  if (v14)
  {
    double v15 = a3 - durationUntilRubberband;
    unint64_t rubberBandingAxis = self->_rubberBandingAxis;
    if (rubberBandingAxis == 2)
    {
      BOOL v25 = [(_UIScrollDynamics *)self shouldRoundCalculations];
      double y = self->_initialRubberbandingOrigin.y;
      ddouble y = self->_initialRubberbandingVelocity.dy;
      double v28 = exp(v15 * -20.0 / 1.6);
      double v29 = fmin(dy, 20000.0);
      if (v29 < -20000.0) {
        double v29 = -20000.0;
      }
      double v30 = v28 * (v15 * v29 * -0.31 - y);
      if (v25)
      {
        double v31 = ceil(v30 + -0.5);
        double v32 = floor(v30 + 0.5);
        if (v30 <= 0.0) {
          double v30 = v32;
        }
        else {
          double v30 = v31;
        }
      }
      double v12 = v12 - v30;
    }
    else if (rubberBandingAxis == 1)
    {
      BOOL v17 = [(_UIScrollDynamics *)self shouldRoundCalculations];
      double x = self->_initialRubberbandingOrigin.x;
      ddouble x = self->_initialRubberbandingVelocity.dx;
      double v20 = exp(v15 * -20.0 / 1.6);
      double v21 = fmin(dx, 20000.0);
      if (v21 < -20000.0) {
        double v21 = -20000.0;
      }
      double v22 = v20 * (v15 * v21 * -0.31 - x);
      if (v17)
      {
        double v23 = ceil(v22 + -0.5);
        double v24 = floor(v22 + 0.5);
        if (v22 <= 0.0) {
          double v22 = v24;
        }
        else {
          double v22 = v23;
        }
      }
      double v10 = v10 - v22;
    }
  }
  double linearDisplacementIgnoringRubberbanding = self->_linearDisplacementIgnoringRubberbanding;
  if (linearDisplacementIgnoringRubberbanding <= 0.0)
  {
    double v12 = v8;
    double v10 = v6;
  }
  else
  {
    long double v34 = fmax(self->_durationUntilStopIgnoringRubberbanding - a3, 0.0);
    double decelerationRate = self->_decelerationRate;
    double v36 = (linearDisplacementIgnoringRubberbanding - decelerationRate * pow(v34, 4.0))
        / linearDisplacementIgnoringRubberbanding;
    if (v14 && self->_rubberBandingAxis == 1) {
      goto LABEL_30;
    }
    BOOL v37 = [(_UIScrollDynamics *)self shouldRoundCalculations];
    double v38 = v36 * (self->_destinationIgnoringRubberbanding.x - v6);
    if (v37)
    {
      double v39 = ceil(v38 + -0.5);
      double v40 = floor(v38 + 0.5);
      if (v38 <= 0.0) {
        double v38 = v40;
      }
      else {
        double v38 = v39;
      }
    }
    double v10 = v6 + v38;
    if (!v14 || self->_rubberBandingAxis != 2)
    {
LABEL_30:
      BOOL v41 = [(_UIScrollDynamics *)self shouldRoundCalculations];
      double v42 = v36 * (self->_destinationIgnoringRubberbanding.y - v8);
      if (v41)
      {
        double v43 = ceil(v42 + -0.5);
        double v44 = floor(v42 + 0.5);
        if (v42 <= 0.0) {
          double v42 = v44;
        }
        else {
          double v42 = v43;
        }
      }
      double v12 = v8 + v42;
    }
  }
  double v45 = v10;
  double v46 = v12;
  result.double y = v46;
  result.double x = v45;
  return result;
}

- (BOOL)isRubberBandingAfterDuration:(double)a3
{
  double durationUntilRubberband = self->_durationUntilRubberband;
  return durationUntilRubberband <= a3 && durationUntilRubberband >= 0.0;
}

@end