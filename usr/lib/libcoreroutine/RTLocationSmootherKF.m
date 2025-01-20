@interface RTLocationSmootherKF
- (RTLocationSmootherKF)init;
- (double)getRefAlt:(id)a3;
- (id)buildLocationWithEstimationState:(id)a3 originalLocation:(id)a4;
- (id)smoothLocations:(id)a3;
@end

@implementation RTLocationSmootherKF

- (RTLocationSmootherKF)init
{
  v6.receiver = self;
  v6.super_class = (Class)RTLocationSmootherKF;
  v2 = [(RTLocationSmootherKF *)&v6 init];
  if (v2)
  {
    v3 = [[RTFixedSizeQueue alloc] initWithCapacity:20];
    states = v2->states;
    v2->states = v3;
  }
  return v2;
}

- (id)smoothLocations:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  if ([v4 count])
  {
    if ([(RTFixedSizeQueue *)self->states count])
    {
      unint64_t v6 = 0;
    }
    else
    {
      v7 = [v4 firstObject];
      [v7 coordinate];
      self->refLat = v8;

      v9 = [v4 firstObject];
      [v9 coordinate];
      self->refLon = v10;

      v11 = [v4 firstObject];
      [(RTLocationSmootherKF *)self getRefAlt:v11];
      self->refAlt = v12;

      states = self->states;
      v14 = objc_opt_new();
      id v15 = [(RTFixedSizeQueue *)states enqueueObject:v14];

      v16 = [v4 firstObject];
      v17 = (void *)[v16 copy];
      [v5 addObject:v17];

      unint64_t v6 = 1;
    }
    if (v6 < [v4 count])
    {
      *(void *)&long long v18 = 138412546;
      long long v62 = v18;
      do
      {
        v19 = [(RTFixedSizeQueue *)self->states lastObject];
        v20 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v62;
          unint64_t v64 = (unint64_t)v19;
          __int16 v65 = 2048;
          unint64_t v66 = v6;
          _os_log_debug_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_DEBUG, "RTLocationSmootherKF, state, %@, i, %lu", buf, 0x16u);
        }

        [v19 estimateWithIndex:0];
        double v22 = v21;
        [v19 estimateWithIndex:1];
        double v24 = v23;
        v25 = [v4 objectAtIndexedSubscript:v6];
        [v25 coordinate];
        [v25 coordinate];
        RTCommonConvertGeodeticToLocalFrame();
        v26 = [v25 timestamp];
        [v26 timeIntervalSinceReferenceDate];
        double v28 = v27;
        [v19 timestamp];
        double v30 = v28 - v29;

        v31 = [v25 timestamp];
        [v31 timeIntervalSinceReferenceDate];
        [v19 setTimestamp:];

        if (v30 * 0.565685425 * (v30 * 0.565685425) >= 10.0) {
          double v32 = v30 * 0.565685425 * (v30 * 0.565685425);
        }
        else {
          double v32 = 10.0;
        }
        if ((unint64_t)((uint64_t)(v6 - 1) % 100 - 91) <= 0xFFFFFFFFFFFFFFAELL)
        {
          v33 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            [v25 coordinate];
            unint64_t v53 = v52;
            [v25 coordinate];
            uint64_t v55 = v54;
            [v25 horizontalAccuracy];
            *(_DWORD *)buf = 134219776;
            unint64_t v64 = v6 - 1;
            __int16 v65 = 2048;
            unint64_t v66 = v53;
            __int16 v67 = 2048;
            uint64_t v68 = v55;
            __int16 v69 = 2048;
            uint64_t v70 = v56;
            __int16 v71 = 2048;
            double v72 = v30;
            __int16 v73 = 2048;
            uint64_t v74 = 0;
            __int16 v75 = 2048;
            uint64_t v76 = 0;
            __int16 v77 = 2048;
            double v78 = v32;
            _os_log_debug_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_DEBUG, "RTLocationSmootherKF, input, %lu, lat, %f, lng, %f, hacc, %f, timeInterval, %f, obsX, %f, obsY, %f, qk, %f", buf, 0x52u);
          }
        }
        [v19 updateMotionX:0.0 motionY:0.0 dt:v30 error:v32];
        [v19 errorProWithIndex:0];
        double v35 = v34;
        [v19 errorProWithIndex:1];
        double v37 = v36;
        [v25 horizontalAccuracy];
        double v39 = v38;
        [v25 horizontalAccuracy];
        [v19 updateObservationX:0.0 observationY:0.0 sigmaX:v39 sigmaY:v40];
        unint64_t v41 = [(RTFixedSizeQueue *)self->states count];
        if ((uint64_t)(v41 - 2) >= 0)
        {
          uint64_t v42 = v41 - 1;
          do
          {
            v43 = [(RTFixedSizeQueue *)self->states objectAtIndex:--v42];
            if (v43)
            {
              [v25 horizontalAccuracy];
              double v45 = v44;
              [v25 horizontalAccuracy];
              [v43 updatePostObservationDeltaX:0.0 - v22 observationDeltaY:0.0 - v24 errProX:v35 errProY:v37 sigmaX:v45 sigmaY:v46];
            }
          }
          while (v42 > 0);
        }
        v47 = (void *)[v19 copy];
        [v47 increaseIndex];
        v48 = [(RTFixedSizeQueue *)self->states enqueueObject:v47];
        v49 = v48;
        if (v48)
        {
          v50 = [v4 objectAtIndex:[v48 i]];
          v51 = [(RTLocationSmootherKF *)self buildLocationWithEstimationState:v49 originalLocation:v50];
          [v5 addObject:v51];
        }
        ++v6;
      }
      while (v6 < [v4 count]);
    }
    if ([(RTFixedSizeQueue *)self->states count] >= 2)
    {
      do
      {
        v57 = [(RTFixedSizeQueue *)self->states dequeueObject];
        v58 = [v4 objectAtIndex:[v57 i]];
        v59 = [(RTLocationSmootherKF *)self buildLocationWithEstimationState:v57 originalLocation:v58];
        [v5 addObject:v59];
      }
      while ([(RTFixedSizeQueue *)self->states count] > 1);
    }
    v60 = [(RTFixedSizeQueue *)self->states lastObject];
    [v60 resetIndex];
  }

  return v5;
}

- (double)getRefAlt:(id)a3
{
  id v3 = a3;
  [v3 verticalAccuracy];
  double v4 = 0.0;
  if (v5 > 0.0)
  {
    [v3 altitude];
    double v4 = v6;
  }

  return v4;
}

- (id)buildLocationWithEstimationState:(id)a3 originalLocation:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v5 estimateWithIndex:0];
  uint64_t v8 = v7;
  [v5 estimateWithIndex:1];
  uint64_t v10 = v9;
  [v5 estimatedAccuracy];
  uint64_t v12 = v11;
  RTCommonConvertLocalFrameToGeodetic();
  long long v28 = 0u;
  memset(v29, 0, 28);
  long long v27 = 0u;
  long long v25 = 0u;
  memset(v26, 0, sizeof(v26));
  *(_OWORD *)&v24[32] = 0u;
  *(_DWORD *)double v24 = 0;
  v13 = objc_opt_new();
  v14 = v13;
  if (v13)
  {
    [v13 clientLocation];
  }
  else
  {
    long long v28 = 0u;
    memset(v29, 0, 28);
    long long v27 = 0u;
    long long v25 = 0u;
    memset(v26, 0, sizeof(v26));
    *(_OWORD *)&v24[32] = 0u;
    *(_DWORD *)double v24 = 0;
  }

  id v15 = [v6 timestamp];
  [v15 timeIntervalSinceReferenceDate];
  *(void *)((char *)v26 + 12) = v16;

  LODWORD(v27) = [v6 type];
  *(void *)&v24[20] = v12;
  *(void *)&v24[4] = 0;
  *(void *)&v24[12] = 0;
  [v6 altitude];
  *(void *)&v24[28] = v17;
  if (__ROR8__(0x8F5C28F5C28F5C29 * [v5 i] + 0x51EB851EB851EB8, 2) <= 0x28F5C28F5C28F5CuLL)
  {
    long long v18 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = [v5 i];
      [v6 altitude];
      *(_DWORD *)buf = 134219778;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v8;
      *(_WORD *)v31 = 2048;
      *(void *)&v31[2] = v10;
      *(_WORD *)&v31[10] = 2048;
      *(void *)&v31[12] = v12;
      *(_WORD *)&v31[20] = 2048;
      *(void *)&v31[22] = 0;
      *(_WORD *)&v31[30] = 2048;
      *(void *)double v32 = 0;
      *(_WORD *)&v32[8] = 2048;
      *(void *)&v32[10] = v23;
      _os_log_debug_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEBUG, "RTLocationSmootherKF, %lu, estimated location, %@, xEst, %f, yEst, %f, errPro, %f, latEst, %f, lngEst, %f, alt, %f", buf, 0x52u);
    }
  }
  id v19 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  long long v33 = v27;
  long long v34 = v28;
  v35[0] = v29[0];
  *(_OWORD *)((char *)v35 + 12) = *(_OWORD *)((char *)v29 + 12);
  *(_OWORD *)v31 = *(_OWORD *)&v24[32];
  *(_OWORD *)&v31[16] = v25;
  *(_OWORD *)double v32 = v26[0];
  *(_OWORD *)&v32[16] = v26[1];
  *(_OWORD *)buf = *(_OWORD *)v24;
  *(_OWORD *)&buf[16] = *(_OWORD *)&v24[16];
  v20 = (void *)[v19 initWithClientLocation:buf];

  return v20;
}

- (void).cxx_destruct
{
}

@end