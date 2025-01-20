@interface TabOverviewInterpolatedLocation
- ($4129EC284BFC52D68F2E23A88D6E8763)location;
- ($4129EC284BFC52D68F2E23A88D6E8763)targetLocation;
- (BOOL)interpolateByTimeInterval:(double)a3 roundingAtSize:(CGSize)a4 zScaleFactor:(double)a5 withHorizontalBounceFactor:(double)a6 verticalBounceFactor:(double)a7 constraints:(id)a8;
- (BOOL)isInSteadyStateWithConstraints:(id)a3;
- (BOOL)isInSteadyStateWithConstraints:(id)a3 epsilon:(double)a4;
- (TabOverviewInterpolatedLocation)initWithLocation:(id *)a3 decelerationFactor:(double)a4;
- (double)_minimumInterpolationFactorForTimeInterval:(double *)a1;
- (double)decelerationFactor;
- (double)decelerationFactorForTargetLocation:(id *)a3;
- (double)minimumTranslationSpeed;
- (id)description;
- (void)_moveBy:(double)a3 shiftLocation:(double)a4;
- (void)beginInteractionAtTime:(double)a3;
- (void)endInteraction;
- (void)endInteractionWithVelocity:(CGPoint)a3;
- (void)moveBy:(CGPoint)a3 atTime:(double)a4;
- (void)moveInstantaneouslyBy:(CGPoint)a3;
- (void)moveLogScaleBy:(double)a3 centeringOffset:(CGPoint)a4 withLastCenteringOffset:(CGPoint)a5 atTime:(double)a6;
- (void)moveLogScaleBy:(double)a3 centeringOffset:(CGPoint)a4 withLastCenteringOffset:(CGPoint)a5 atTime:(double)a6 shiftLocation:(BOOL)a7;
- (void)resetRenderedLocation;
- (void)resetToLocation:(id *)a3;
- (void)setDecelerationFactor:(double)a3;
- (void)setMinimumTranslationSpeed:(double)a3;
- (void)setTargetLocation:(id *)a3;
- (void)shiftTargetLocation:(id *)a3;
@end

@implementation TabOverviewInterpolatedLocation

- (TabOverviewInterpolatedLocation)initWithLocation:(id *)a3 decelerationFactor:(double)a4
{
  double v8 = v7;
  double v9 = v6;
  double v10 = v5;
  CGFloat v11 = v4;
  v17.receiver = self;
  v17.super_class = (Class)TabOverviewInterpolatedLocation;
  v13 = [(TabOverviewInterpolatedLocation *)&v17 init];
  v14 = v13;
  if (v13)
  {
    v13->_location.offset.y = v11;
    v13->_location.zOffset = v10;
    v13->_location.logScale = v9;
    v13->_instantaneousTargetLocation.offset.x = a4;
    v13->_instantaneousTargetLocation.offset.y = v11;
    v13->_instantaneousTargetLocation.zOffset = v10;
    v13->_instantaneousTargetLocation.logScale = v9;
    v13->_targetLocation.offset.y = v11;
    v13->_targetLocation.zOffset = v10;
    v13->_targetLocation.logScale = v9;
    v13->_location.offset.x = a4;
    v13->_decelerationFactor = v8;
    v13->_targetLocation.offset.x = a4;
    v15 = v13;
  }

  return v14;
}

- (void)resetToLocation:(id *)a3
{
  self->_location.offset.x = v3;
  self->_location.offset.y = v4;
  self->_location.zOffset = v5;
  self->_location.logScale = v6;
  self->_instantaneousTargetLocation.offset.x = v3;
  self->_instantaneousTargetLocation.offset.y = v4;
  self->_instantaneousTargetLocation.zOffset = v5;
  self->_instantaneousTargetLocation.logScale = v6;
  self->_targetLocation.offset.x = v3;
  self->_targetLocation.offset.y = v4;
  self->_targetLocation.zOffset = v5;
  self->_targetLocation.logScale = v6;
}

- (void)shiftTargetLocation:(id *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  double logScale = self->_targetLocation.logScale;
  long double v13 = exp(logScale - v6);
  long double v14 = v10 * v13 - self->_targetLocation.offset.x;
  long double v15 = v9 * v13 - self->_targetLocation.offset.y;
  long double v16 = exp(self->_instantaneousTargetLocation.logScale - logScale);
  double y = self->_instantaneousTargetLocation.offset.y;
  self->_instantaneousTargetLocation.offset.x = self->_instantaneousTargetLocation.offset.x + v14 * v16;
  self->_instantaneousTargetLocation.offset.double y = y + v15 * v16;
  long double v18 = exp(self->_location.logScale - logScale);
  CGFloat v19 = self->_location.offset.x + v14 * v18;
  CGFloat v20 = self->_location.offset.y + v15 * v18;
  self->_location.offset.x = v19;
  self->_location.offset.double y = v20;
  self->_targetLocation.offset.x = v10;
  self->_targetLocation.offset.double y = v9;
  self->_targetLocation.zOffset = v8;
  self->_targetLocation.double logScale = v7;
}

- (void)setTargetLocation:(id *)a3
{
  if (v3 != self->_targetLocation.offset.x
    || v4 != self->_targetLocation.offset.y
    || v5 != self->_targetLocation.zOffset
    || v6 != self->_targetLocation.logScale)
  {
    self->_targetLocation.offset.x = v3;
    self->_targetLocation.offset.double y = v4;
    self->_targetLocation.zOffset = v5;
    self->_targetLocation.double logScale = v6;
  }
}

- (void)setDecelerationFactor:(double)a3
{
  double decelerationFactor = self->_decelerationFactor;
  if (decelerationFactor != a3)
  {
    if (a3 <= 0.99999)
    {
      self->_instantaneousTargetLocation.offset.x = interpolateLocations(self->_location.offset.x, self->_location.offset.y, self->_location.zOffset, self->_location.logScale, self->_instantaneousTargetLocation.offset.x, self->_instantaneousTargetLocation.offset.y, self->_instantaneousTargetLocation.zOffset, self->_instantaneousTargetLocation.logScale, (1.0 - decelerationFactor)* a3/ ((1.0 - a3)* decelerationFactor));
      self->_instantaneousTargetLocation.offset.double y = v7;
      self->_instantaneousTargetLocation.zOffset = v8;
      self->_instantaneousTargetLocation.double logScale = v9;
    }
    else
    {
      double v6 = WBS_LOG_CHANNEL_PREFIXTabView();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[TabOverviewInterpolatedLocation setDecelerationFactor:](v6, a3);
      }
    }
    self->_double decelerationFactor = a3;
  }
}

- (double)decelerationFactorForTargetLocation:(id *)a3
{
  double v7 = v6;
  uint64_t v8 = v5;
  double v9 = v4;
  double v10 = v3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v12 = _SFEqualWithEpsilon();
  double logScale = self->_location.logScale;
  if (v12)
  {
    long double v14 = exp(logScale - v7);
    double x = self->_location.offset.x;
    double y = self->_location.offset.y;
    double v17 = ((self->_instantaneousTargetLocation.offset.y - y) * (v9 * v14 - y)
         + (self->_instantaneousTargetLocation.offset.x - x) * (v10 * v14 - x))
        / ((self->_instantaneousTargetLocation.offset.y - y) * (self->_instantaneousTargetLocation.offset.y - y)
         + (self->_instantaneousTargetLocation.offset.x - x) * (self->_instantaneousTargetLocation.offset.x - x));
  }
  else
  {
    double v17 = (v7 - logScale) / (self->_instantaneousTargetLocation.logScale - logScale);
  }
  double v18 = v17 * self->_decelerationFactor / (1.0 - (1.0 - v17) * self->_decelerationFactor);
  double v19 = fabs(v18);
  if (v19 >= INFINITY && v19 <= INFINITY)
  {
    CGFloat v20 = WBS_LOG_CHANNEL_PREFIXTabView();
    double v18 = 0.0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      CGPoint offset = self->_location.offset;
      double zOffset = self->_location.zOffset;
      double v23 = self->_location.logScale;
      v24 = NSString;
      v25 = v20;
      objc_msgSend(v24, "stringWithFormat:", @"{ x = %f; y = %f; z = %f; double logScale = %f }",
        offset,
        *(void *)&zOffset,
      v26 = *(void *)&v23);
      objc_msgSend(NSString, "stringWithFormat:", @"{ x = %f; y = %f; z = %f; double logScale = %f }",
        *(void *)&v10,
        *(void *)&v9,
        v8,
      v27 = *(void *)&v7);
      *(_DWORD *)buf = 138412546;
      v30 = v26;
      __int16 v31 = 2112;
      v32 = v27;
      _os_log_error_impl(&dword_1E102C000, v25, OS_LOG_TYPE_ERROR, "Unexpected deceleration factor for location: %@, target location: %@", buf, 0x16u);
    }
  }
  return v18;
}

- (BOOL)isInSteadyStateWithConstraints:(id)a3
{
  return [(TabOverviewInterpolatedLocation *)self isInSteadyStateWithConstraints:a3 epsilon:0.0];
}

- (BOOL)isInSteadyStateWithConstraints:(id)a3 epsilon:(double)a4
{
  uint64_t v5 = (void (**)(void, double, double, double, double))a3;
  if (TabOverviewLocationEqualToLocationWithEpsilon()
    && TabOverviewLocationEqualToLocationWithEpsilon())
  {
    if (v5)
    {
      v5[2](v5, self->_location.offset.x, self->_location.offset.y, self->_location.zOffset, self->_location.logScale);
      char v6 = TabOverviewLocationEqualToLocationWithEpsilon();
    }
    else
    {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)interpolateByTimeInterval:(double)a3 roundingAtSize:(CGSize)a4 zScaleFactor:(double)a5 withHorizontalBounceFactor:(double)a6 verticalBounceFactor:(double)a7 constraints:(id)a8
{
  long double v13 = (double (**)(void))a8;
  BOOL v14 = self->_lastRenderedLocation.offset.x == self->_location.offset.x
     && self->_lastRenderedLocation.offset.y == self->_location.offset.y;
  BOOL v16 = v14
     && self->_lastRenderedLocation.zOffset == self->_location.zOffset
     && self->_lastRenderedLocation.logScale == self->_location.logScale;
  double v17 = a3 * 1000.0;
  double v18 = pow(self->_decelerationFactor, a3 * 1000.0);
  double v19 = fmax(fmin(-[TabOverviewInterpolatedLocation _minimumInterpolationFactorForTimeInterval:]((double *)self, a3), v18), 0.0);
  double v20 = interpolateLocations(self->_targetLocation.offset.x, self->_targetLocation.offset.y, self->_targetLocation.zOffset, self->_targetLocation.logScale, self->_instantaneousTargetLocation.offset.x, self->_instantaneousTargetLocation.offset.y, self->_instantaneousTargetLocation.zOffset, self->_instantaneousTargetLocation.logScale, v19);
  self->_instantaneousTargetLocation.offset.double x = v20;
  self->_instantaneousTargetLocation.offset.double y = v21;
  self->_instantaneousTargetLocation.double zOffset = v22;
  self->_instantaneousTargetLocation.double logScale = v23;
  self->_location.offset.double x = interpolateLocations(v20, v21, v22, v23, self->_location.offset.x, self->_location.offset.y, self->_location.zOffset, self->_location.logScale, v19);
  self->_location.offset.double y = v24;
  self->_location.double zOffset = v25;
  self->_location.double logScale = v26;
  if (v13)
  {
    double v27 = a6;
    __double x = a7;
    double v55 = a5;
    double v28 = v13[2](v13);
    double v30 = v29;
    double v56 = v31;
    double v33 = v32;
    double x = self->_location.offset.x;
    double logScale = self->_location.logScale;
    if (v28 != x)
    {
      double v36 = pow(v27, a3 * 1000.0);
      double x = v36 * x + (1.0 - v36) * (v28 * exp(logScale - v33));
      self->_location.offset.double x = x;
      self->_instantaneousTargetLocation.offset.double x = v36 * self->_instantaneousTargetLocation.offset.x
                                                  + (1.0 - v36)
                                                  * (v28
                                                   * exp(self->_instantaneousTargetLocation.logScale - v33));
      self->_targetLocation.offset.double x = v36 * self->_targetLocation.offset.x
                                     + (1.0 - v36) * (v28 * exp(self->_targetLocation.logScale - v33));
    }
    double y = self->_location.offset.y;
    if (v30 != y)
    {
      double v38 = pow(__x, v17);
      double y = v38 * y + (1.0 - v38) * (v30 * exp(logScale - v33));
      self->_location.offset.double y = y;
      self->_instantaneousTargetLocation.offset.double y = v38 * self->_instantaneousTargetLocation.offset.y
                                                  + (1.0 - v38)
                                                  * (v30
                                                   * exp(self->_instantaneousTargetLocation.logScale - v33));
      self->_targetLocation.offset.double y = v38 * self->_targetLocation.offset.y
                                     + (1.0 - v38) * (v30 * exp(self->_targetLocation.logScale - v33));
    }
    BOOL v14 = x == v28;
    a5 = v55;
    if (!v14 || y != v30 || self->_location.zOffset != v56 || logScale != v33)
    {
      long double v39 = self->_targetLocation.logScale;
      long double v40 = exp(v39 - v33);
      roundLocationToLocation((uint64_t)&self->_targetLocation, v28 * v40, v30 * v40, v56, v39, a4.width, a4.height, v55);
      long double v41 = self->_location.logScale;
      long double v42 = exp(v41 - v33);
      roundLocationToLocation((uint64_t)&self->_location, v28 * v42, v30 * v42, v56, v41, a4.width, a4.height, v55);
      long double v43 = self->_instantaneousTargetLocation.logScale;
      long double v44 = exp(v43 - v33);
      roundLocationToLocation((uint64_t)&self->_instantaneousTargetLocation, v28 * v44, v30 * v44, v56, v43, a4.width, a4.height, v55);
    }
  }
  roundLocationToLocation((uint64_t)&self->_instantaneousTargetLocation, self->_targetLocation.offset.x, self->_targetLocation.offset.y, self->_targetLocation.zOffset, self->_targetLocation.logScale, a4.width, a4.height, a5);
  roundLocationToLocation((uint64_t)&self->_location, self->_instantaneousTargetLocation.offset.x, self->_instantaneousTargetLocation.offset.y, self->_instantaneousTargetLocation.zOffset, self->_instantaneousTargetLocation.logScale, a4.width, a4.height, a5);
  if (v16)
  {
    double v45 = self->_lastRenderedLocation.offset.y;
    double zOffset = self->_lastRenderedLocation.zOffset;
    double v46 = self->_lastRenderedLocation.logScale;
    double v49 = self->_location.offset.x;
    double v48 = self->_location.offset.y;
    double v51 = self->_location.zOffset;
    long double v50 = self->_location.logScale;
    double v58 = self->_lastRenderedLocation.offset.x;
    double v59 = v45;
    double v60 = zOffset;
    double v61 = v46;
    if (v58 == v49 && v45 == v48 && zOffset == v51 && v46 == v50)
    {
      BOOL v52 = 0;
    }
    else
    {
      roundLocationToLocation((uint64_t)&v58, v49, v48, v51, v50, a4.width, a4.height, a5);
      BOOL v52 = 1;
      if (v58 == v49 && v59 == v48 && v60 == v51) {
        BOOL v52 = v61 != v50;
      }
    }
  }
  else
  {
    BOOL v52 = 1;
  }

  return v52;
}

- (double)_minimumInterpolationFactorForTimeInterval:(double *)a1
{
  if (!a1) {
    return 0.0;
  }
  double result = 1.0;
  if (a2 != 0.0)
  {
    double v4 = a1[21];
    if (v4 != 0.0)
    {
      double v5 = a1[4];
      if (a1[26] == v5 && v5 == a1[30])
      {
        double v6 = a1[3];
        if (a1[25] == v6 && v6 == a1[29])
        {
          double v7 = a1[1];
          uint64_t v8 = a1[23] != v7 || v7 != a1[27];
          double v9 = a1[2];
          if (a1[24] != v9 || v9 != a1[28]) {
            v8 |= 2uLL;
          }
          if (v8 && v8 != 3)
          {
            BOOL v10 = v8 == 1;
            uint64_t v11 = 28;
            if (v10) {
              uint64_t v11 = 27;
            }
            double v12 = a1[v11];
            uint64_t v13 = 2;
            if (v10) {
              uint64_t v13 = 1;
            }
            double v14 = a1[v13];
            uint64_t v15 = 24;
            if (v10) {
              uint64_t v15 = 23;
            }
            double v16 = a1[v15];
            if ((v12 >= v16 || v12 <= v14 && v14 <= v16) && (v16 >= v12 || v14 <= v12 && v16 <= v14))
            {
              double v17 = -v4;
              if (v12 < v16) {
                double v17 = a1[21];
              }
              if (v14 == v16)
              {
                double v18 = v12 + v17 * a2 - v16;
                double v19 = v12 - v16;
              }
              else
              {
                double v20 = v12 + v14 - v16 - v16;
                double v21 = v16 - v14;
                double v22 = v20 * v20 + v21 * -4.0 * (v16 - v17 * a2 - v12);
                double v19 = v21 + v21;
                double v23 = sqrt(v22);
                double v24 = -v20;
                if (v12 < v16)
                {
                  double v20 = v23;
                  double v23 = v24;
                }
                double v18 = v23 - v20;
              }
              return v18 / v19;
            }
          }
        }
      }
    }
  }
  return result;
}

- (void)resetRenderedLocation
{
  self->_lastRenderedLocation = self->_location;
}

- (void)beginInteractionAtTime:(double)a3
{
  self->_lastInteractionTimestamp = a3;
  *(_WORD *)&self->_interactionIncludesScale = 256;
  self->_interactionLocation = self->_location;
  self->_interactionVelocitdouble y = (CGPoint)*MEMORY[0x1E4F1DAD8];
}

- (void)endInteraction
{
}

- (void)endInteractionWithVelocity:(CGPoint)a3
{
  _ZF = self->_interactionVelocity.x == *MEMORY[0x1E4F1DAD8]
     && self->_interactionVelocity.y == *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (_ZF
    && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64((float64x2_t)self->_interactionLocation.offset, (float64x2_t)self->_location.offset), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_interactionLocation.zOffset, *(float64x2_t *)&self->_location.zOffset))), 0xFuLL))) & 1) != 0)
  {
    self->_interactionVelocitdouble y = a3;
  }
  double decelerationFactor = self->_decelerationFactor;
  self->_interacting = 0;
  if (decelerationFactor <= 0.99999)
  {
    double v28 = decelerationFactor / ((1.0 - decelerationFactor) * 1000.0);
  }
  else
  {
    double v6 = WBS_LOG_CHANNEL_PREFIXTabView();
    double v28 = 1.0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[TabOverviewInterpolatedLocation endInteractionWithVelocity:]((uint64_t *)&self->_decelerationFactor, v6);
    }
  }
  BOOL interactionIncludesScale = self->_interactionIncludesScale;
  double logScale = self->_targetLocation.logScale;
  long double v9 = self->_interactionLocation.logScale;
  double v10 = exp(logScale - v9);
  if (interactionIncludesScale)
  {
    double v11 = self->_instantaneousTargetLocation.logScale;
    double v27 = v10;
    double v12 = exp(v11 - v9);
    interactionLogScaleVelocitdouble y = self->_interactionLogScaleVelocity;
    double v14 = logScale + v28 * interactionLogScaleVelocity;
    self->_targetLocation.double logScale = v14;
    double v15 = v11 + v28 * interactionLogScaleVelocity;
    self->_instantaneousTargetLocation.double logScale = v15;
    double v16 = exp(v14);
    double v17 = exp(v9);
    CGPoint interactionFixedPoint = self->_interactionFixedPoint;
    self->_targetLocation.CGPoint offset = (CGPoint)vmlaq_n_f64((float64x2_t)self->_targetLocation.offset, vmulq_n_f64((float64x2_t)interactionFixedPoint, v16 - v17), v27);
    double v18 = exp(v15) - v17;
    CGFloat v19 = self->_instantaneousTargetLocation.offset.x + v18 * interactionFixedPoint.x * v12;
    CGFloat v20 = self->_instantaneousTargetLocation.offset.y + vmuld_lane_f64(v18, (float64x2_t)interactionFixedPoint, 1) * v12;
    self->_instantaneousTargetLocation.offset.double x = v19;
    self->_instantaneousTargetLocation.offset.double y = v20;
  }
  else
  {
    float64x2_t v30 = vmulq_n_f64((float64x2_t)self->_interactionVelocity, v28);
    self->_targetLocation.CGPoint offset = (CGPoint)vmlaq_n_f64((float64x2_t)self->_targetLocation.offset, v30, v10);
    _D0 = exp(self->_instantaneousTargetLocation.logScale - self->_location.logScale);
    _V3.D[1] = v30.f64[1];
    __asm { FMLA            D2, D0, V3.D[1] }
    self->_instantaneousTargetLocation.offset.double x = vmlad_n_f64(self->_instantaneousTargetLocation.offset.x, _D0, v30.f64[0]);
    self->_instantaneousTargetLocation.offset.double y = _D2;
  }
}

- (void)_moveBy:(double)a3 shiftLocation:(double)a4
{
  if (a1)
  {
    uint64_t v8 = 160;
    if (!*(unsigned char *)(a1 + 57)) {
      uint64_t v8 = 240;
    }
    double v9 = *(double *)(a1 + v8);
    if (a2)
    {
      long double v10 = exp(*(double *)(a1 + 240) - v9);
      long double v11 = *(double *)(a1 + 216) + a3 * v10;
      long double v12 = *(double *)(a1 + 224) + a4 * v10;
      *(long double *)(a1 + 216) = v11;
      *(long double *)(a1 + 224) = v12;
    }
    double v13 = a4 + *(double *)(a1 + 144);
    *(double *)(a1 + 136) = a3 + *(double *)(a1 + 136);
    *(double *)(a1 + 144) = v13;
    long double v14 = exp(*(double *)(a1 + 208) - v9);
    long double v15 = *(double *)(a1 + 184) + a3 * v14;
    long double v16 = *(double *)(a1 + 192) + a4 * v14;
    *(long double *)(a1 + 184) = v15;
    *(long double *)(a1 + 192) = v16;
    if (a2)
    {
      long double v17 = exp(*(double *)(a1 + 32) - v9);
      long double v18 = *(double *)(a1 + 8) + a3 * v17;
      long double v19 = *(double *)(a1 + 16) + a4 * v17;
      *(long double *)(a1 + 8) = v18;
      *(long double *)(a1 + 16) = v19;
    }
  }
}

- (void)moveBy:(CGPoint)a3 atTime:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  [(TabOverviewInterpolatedLocation *)(uint64_t)self _moveBy:a3.x shiftLocation:a3.y];
  double v8 = a4 - self->_lastInteractionTimestamp;
  if (v8 > 0.008)
  {
    self->_interactionVelocity.double x = x / v8;
    self->_interactionVelocity.double y = y / v8;
  }
  self->_lastInteractionTimestamp = a4;
  self->_BOOL interactionIncludesScale = 0;
}

- (void)moveInstantaneouslyBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  CGFloat v6 = a3.y + self->_location.offset.y;
  self->_location.offset.double x = a3.x + self->_location.offset.x;
  self->_location.offset.double y = v6;
  long double v7 = exp(self->_instantaneousTargetLocation.logScale - self->_location.logScale);
  CGFloat v8 = self->_instantaneousTargetLocation.offset.x + x * v7;
  CGFloat v9 = self->_instantaneousTargetLocation.offset.y + y * v7;
  self->_instantaneousTargetLocation.offset.double x = v8;
  self->_instantaneousTargetLocation.offset.double y = v9;
}

- (void)moveLogScaleBy:(double)a3 centeringOffset:(CGPoint)a4 withLastCenteringOffset:(CGPoint)a5 atTime:(double)a6
{
}

- (void)moveLogScaleBy:(double)a3 centeringOffset:(CGPoint)a4 withLastCenteringOffset:(CGPoint)a5 atTime:(double)a6 shiftLocation:(BOOL)a7
{
  BOOL v7 = a7;
  double y = a5.y;
  double x = a5.x;
  double v10 = a4.y;
  double v11 = a4.x;
  double v14 = self->_interactionLocation.offset.x;
  double v15 = self->_interactionLocation.offset.y;
  long double logScale = self->_interactionLocation.logScale;
  double v22 = exp(logScale);
  self->_targetLocation.long double logScale = self->_targetLocation.logScale + a3;
  self->_interactionLocation.long double logScale = logScale + a3;
  if (v7)
  {
    self->_location.long double logScale = self->_location.logScale + a3;
    self->_instantaneousTargetLocation.long double logScale = self->_instantaneousTargetLocation.logScale + a3;
  }
  long double v17 = exp(a3);
  [(TabOverviewInterpolatedLocation *)(uint64_t)self _moveBy:v11 - v14 - (x - v14) * v17 shiftLocation:v10 - v15 - (y - v15) * v17];
  double v18 = exp(self->_interactionLocation.logScale) - v22;
  if ((_SFEqualWithEpsilon() & 1) == 0)
  {
    CGFloat v19 = (self->_interactionLocation.offset.y - v15) / v18;
    self->_interactionFixedPoint.double x = (self->_interactionLocation.offset.x - v14) / v18;
    self->_interactionFixedPoint.double y = v19;
  }
  double v20 = a6 - self->_lastInteractionTimestamp;
  if (v20 > 0.008)
  {
    double v21 = a3 / v20;
    self->_interactionLogScaleVelocitdouble y = v21 * 0.2 + self->_previousInteractionLogScaleVelocity * 0.8;
    self->_previousInteractionLogScaleVelocitdouble y = v21;
    self->_lastInteractionTimestamp = a6;
  }
  self->_BOOL interactionIncludesScale = 1;
}

- (id)description
{
  double v3 = (void *)MEMORY[0x1E4F28E78];
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  objc_msgSend(NSString, "stringWithFormat:", @"{ x = %f; y = %f; z = %f; double logScale = %f }",
    *(void *)&self->_location.offset.x,
    *(void *)&self->_location.offset.y,
    *(void *)&self->_location.zOffset,
  CGFloat v6 = *(void *)&self->_location.logScale);
  BOOL v7 = [v3 stringWithFormat:@"<%@: %p location = %@", v5, self, v6];;

  CGPoint offset = self->_location.offset;
  float64x2_t v9 = *(float64x2_t *)&self->_location.zOffset;
  float64x2_t v10 = *(float64x2_t *)&self->_targetLocation.zOffset;
  if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64((float64x2_t)offset, (float64x2_t)self->_targetLocation.offset), (int32x4_t)vceqq_f64(v9, v10))), 0xFuLL))) & 1) != 0&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64((float64x2_t)offset, (float64x2_t)self->_instantaneousTargetLocation.offset), (int32x4_t)vceqq_f64(v9, *(float64x2_t *)&self->_instantaneousTargetLocation.zOffset))), 0xFuLL))))
  {
    double y = self->_location.offset.y;
    double logScale = self->_location.logScale;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"{ x = %f; y = %f; z = %f; double logScale = %f }",
      *(void *)&self->_targetLocation.offset.x,
      *(void *)&self->_targetLocation.offset.y,
    double v11 = *(_OWORD *)&v10);
    objc_msgSend(NSString, "stringWithFormat:", @"{ x = %f; y = %f; z = %f; double logScale = %f }",
      *(void *)&self->_instantaneousTargetLocation.offset.x,
      *(void *)&self->_instantaneousTargetLocation.offset.y,
      *(void *)&self->_instantaneousTargetLocation.zOffset,
    long double v12 = *(void *)&self->_instantaneousTargetLocation.logScale);
    [v7 appendFormat:@"; targetLocation = %@; instantaneousTargetLocation = %@", v11, v12];

    offset.double x = self->_location.offset.x;
    double y = self->_location.offset.y;
    v9.f64[0] = self->_location.zOffset;
    double logScale = self->_location.logScale;
  }
  double x = self->_lastRenderedLocation.offset.x;
  double v16 = self->_lastRenderedLocation.offset.y;
  double v17 = self->_lastRenderedLocation.logScale;
  if (offset.x != x || y != v16 || v9.f64[0] != self->_lastRenderedLocation.zOffset || logScale != v17)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"{ x = %f; y = %f; z = %f; double logScale = %f }",
      v9.f64[0],
      *(void *)&x,
      *(void *)&v16,
      *(void *)&self->_lastRenderedLocation.zOffset,
    double v18 = *(void *)&v17);
    [v7 appendFormat:@"; lastRenderedLocation = %@", v18];
  }
  objc_msgSend(v7, "appendFormat:", @"; double decelerationFactor = %f", *(void *)&self->_decelerationFactor);
  if (self->_interacting)
  {
    objc_msgSend(v7, "appendFormat:", @"; lastInteractionTimestamp = %f",
      *(void *)&self->_lastInteractionTimestamp);
    if (self->_interactionIncludesScale)
    {
      interactionLogScaleVelocitdouble y = self->_interactionLogScaleVelocity;
      previousInteractionLogScaleVelocitdouble y = self->_previousInteractionLogScaleVelocity;
      double v21 = NSStringFromCGPoint(self->_interactionFixedPoint);
      objc_msgSend(v7, "appendFormat:", @"; interactionLogScaleVelocitdouble y = %f; previousInteractionLogScaleVelocitdouble y = %f; interactionFixedPoint = %@",
        *(void *)&interactionLogScaleVelocity,
        *(void *)&previousInteractionLogScaleVelocity,
        v21);
    }
    else
    {
      double v21 = NSStringFromCGPoint(self->_interactionVelocity);
      [v7 appendFormat:@"; interactionVelocitdouble y = %@", v21, v23, v24];
    }
  }
  [v7 appendString:@">"];
  return v7;
}

- ($4129EC284BFC52D68F2E23A88D6E8763)targetLocation
{
  return self;
}

- (double)minimumTranslationSpeed
{
  return self->_minimumTranslationSpeed;
}

- (void)setMinimumTranslationSpeed:(double)a3
{
  self->_minimumTranslationSpeed = a3;
}

- (double)decelerationFactor
{
  return self->_decelerationFactor;
}

- ($4129EC284BFC52D68F2E23A88D6E8763)location
{
  return self;
}

- (void)setDecelerationFactor:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Unexpected decelerationFactor: %f", (uint8_t *)&v2, 0xCu);
}

- (void)endInteractionWithVelocity:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1E102C000, a2, OS_LOG_TYPE_ERROR, "Unexpected _decelerationFactor after ending interaction: %f", (uint8_t *)&v3, 0xCu);
}

@end