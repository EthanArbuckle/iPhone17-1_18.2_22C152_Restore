@interface RTLocationEstimationState
- (RTLocationEstimationState)init;
- (double)errorProWithIndex:(unint64_t)a3;
- (double)estimateWithIndex:(unint64_t)a3;
- (double)estimatedAccuracy;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)i;
- (void)increaseIndex;
- (void)resetIndex;
- (void)setTimestamp:(double)a3;
- (void)updateMotionX:(double)a3 motionY:(double)a4 dt:(double)a5 error:(double)a6;
- (void)updateObservationX:(double)a3 observationY:(double)a4 sigmaX:(double)a5 sigmaY:(double)a6;
- (void)updatePostObservationDeltaX:(double)a3 observationDeltaY:(double)a4 errProX:(double)a5 errProY:(double)a6 sigmaX:(double)a7 sigmaY:(double)a8;
@end

@implementation RTLocationEstimationState

- (RTLocationEstimationState)init
{
  v3.receiver = self;
  v3.super_class = (Class)RTLocationEstimationState;
  result = [(RTLocationEstimationState *)&v3 init];
  if (result)
  {
    *(_OWORD *)result->X = 0u;
    *(_OWORD *)&result->i = 0u;
    *(int64x2_t *)result->errPro = vdupq_n_s64(0x408F400000000000uLL);
  }
  return result;
}

- (void)updateMotionX:(double)a3 motionY:(double)a4 dt:(double)a5 error:(double)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v7 = self->X[1];
  self->X[0] = self->X[0] + a3;
  self->X[1] = v7 + a4;
  float64x2_t v8 = vsqrtq_f64(vaddq_f64((float64x2_t)vdupq_lane_s64(COERCE__INT64(a6 * a6), 0), vmulq_f64(*(float64x2_t *)self->errPro, *(float64x2_t *)self->errPro)));
  *(float64x2_t *)self->errPro = v8;
  *(float64x2_t *)self->errEst = v8;
  int64_t v9 = self->i % 100;
  if (v9 > 90 || v9 == 0)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int64_t i = self->i;
      int v14 = 134218498;
      int64_t v15 = i;
      __int16 v16 = 2112;
      v17 = self;
      __int16 v18 = 2048;
      double v19 = a6;
      _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "RTLocationSmootherKF, %lu, update motion, %@, qk, %f", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (void)updateObservationX:(double)a3 observationY:(double)a4 sigmaX:(double)a5 sigmaY:(double)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  double v8 = self->errPro[0];
  double v9 = self->errPro[1];
  double v10 = v8 / (v8 + a5);
  double v11 = v9 / (v9 + a6);
  double v12 = self->X[0];
  double v13 = self->X[1];
  self->X[0] = v12 + v10 * (a3 - v12);
  self->X[1] = v13 + v11 * (a4 - v13);
  double v14 = v8 * (1.0 - v10);
  double v15 = v9 * (1.0 - v11);
  self->errPro[0] = v14;
  self->errPro[1] = v15;
  self->errEst[0] = v14;
  self->errEst[1] = v15;
  int64_t v16 = self->i % 100;
  if (v16 > 90 || v16 == 0)
  {
    double v19 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      int64_t i = self->i;
      double v21 = self->X[0];
      double v22 = self->X[1];
      *(_DWORD *)buf = 134221570;
      int64_t v25 = i;
      __int16 v26 = 2112;
      v27 = self;
      __int16 v28 = 2048;
      double v29 = v12;
      __int16 v30 = 2048;
      double v31 = v10;
      __int16 v32 = 2048;
      double v33 = a3;
      __int16 v34 = 2048;
      double v35 = v21;
      __int16 v36 = 2048;
      double v37 = a3 - v12;
      __int16 v38 = 2048;
      double v39 = v21 - v12;
      __int16 v40 = 2048;
      double v41 = v13;
      __int16 v42 = 2048;
      double v43 = v11;
      __int16 v44 = 2048;
      double v45 = a4;
      __int16 v46 = 2048;
      double v47 = v22;
      __int16 v48 = 2048;
      double v49 = a4 - v13;
      __int16 v50 = 2048;
      double v51 = v22 - v13;
      __int16 v52 = 2048;
      double v53 = a5;
      _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "RTLocationSmootherKF, %lu, update obs, %@, (%f+%f*%f->%f)(%f,%f), (%f+%f*%f->%f)(%f,%f), sigma, %f", buf, 0x98u);
    }
  }
}

- (void)updatePostObservationDeltaX:(double)a3 observationDeltaY:(double)a4 errProX:(double)a5 errProY:(double)a6 sigmaX:(double)a7 sigmaY:(double)a8
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  double v11 = a5 + a7;
  double v12 = a5 / (a5 + a7);
  double v13 = a6 + a8;
  double v14 = a6 / (a6 + a8);
  double v15 = self->errPro[0];
  double v16 = self->errPro[1];
  double v17 = v15 / v11;
  double v18 = v16 / v13;
  double v20 = self->X[0];
  double v19 = self->X[1];
  self->X[0] = v20 + v17 * a3;
  self->X[1] = v19 + v18 * a4;
  double v21 = (1.0 - v12) * v15;
  double v22 = (1.0 - v14) * v16;
  self->errPro[0] = v21;
  self->errPro[1] = v22;
  self->errEst[0] = self->errEst[0] - v21 * v17;
  self->errEst[1] = v22 - v22 * v18;
  if (__ROR8__(0x8F5C28F5C28F5C29 * self->i + 0x51EB851EB851EB8, 2) <= 0x28F5C28F5C28F5CuLL)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      int64_t i = self->i;
      double v26 = self->X[0];
      double v27 = self->X[1];
      int v28 = 134221058;
      int64_t v29 = i;
      __int16 v30 = 2112;
      double v31 = self;
      __int16 v32 = 2048;
      double v33 = a7;
      __int16 v34 = 2048;
      double v35 = v20;
      __int16 v36 = 2048;
      double v37 = v12;
      __int16 v38 = 2048;
      double v39 = a3;
      __int16 v40 = 2048;
      double v41 = v26;
      __int16 v42 = 2048;
      double v43 = v26 - v20;
      __int16 v44 = 2048;
      double v45 = v19;
      __int16 v46 = 2048;
      double v47 = v14;
      __int16 v48 = 2048;
      double v49 = a4;
      __int16 v50 = 2048;
      double v51 = v27;
      __int16 v52 = 2048;
      double v53 = v27 - v19;
      _os_log_debug_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_DEBUG, "RTLocationSmootherKF, %lu, update post obs, %@, sigma, %f, (%f+%f*%f->%f,%f , %f+%f*%f->%f, %f)", (uint8_t *)&v28, 0x84u);
    }
  }
}

- (double)estimateWithIndex:(unint64_t)a3
{
  return self->X[a3];
}

- (double)errorProWithIndex:(unint64_t)a3
{
  return self->errPro[a3];
}

- (double)estimatedAccuracy
{
  return sqrt(self->errEst[0] * self->errEst[0] + self->errEst[1] * self->errEst[1]);
}

- (double)timestamp
{
  return self->time;
}

- (void)setTimestamp:(double)a3
{
  self->time = a3;
}

- (int64_t)i
{
  return self->i;
}

- (void)increaseIndex
{
}

- (void)resetIndex
{
  self->int64_t i = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_opt_new();
  *((void *)result + 1) = self->i;
  *(_OWORD *)((char *)result + 24) = *(_OWORD *)self->X;
  *((void *)result + 2) = *(void *)&self->time;
  *(_OWORD *)((char *)result + 40) = *(_OWORD *)self->errPro;
  *(_OWORD *)((char *)result + 56) = *(_OWORD *)self->errEst;
  return result;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"i, %lu, t, %f, X, %f, %f, errPro, %f, %f, errEst, %f, %f", self->i, *(void *)&self->time, *(void *)&self->X[0], *(void *)&self->X[1], *(void *)&self->errPro[0], *(void *)&self->errPro[1], *(void *)&self->errEst[0], *(void *)&self->errEst[1]];

  return v2;
}

@end