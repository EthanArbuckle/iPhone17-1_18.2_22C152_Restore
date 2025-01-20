@interface _UIHIDPathSynchronizationFilter
- (double)initWithPosition:(double)a3 timestamp:(double)a4;
- (double)initWithPosition:(double)a3 timestamp:(double)a4 configuration:(double)a5;
- (double)outputPosition;
- (uint64_t)addInputEvent:(uint64_t)result;
- (void)computeNextOutputPosition:(uint64_t)a1;
@end

@implementation _UIHIDPathSynchronizationFilter

- (double)initWithPosition:(double)a3 timestamp:(double)a4 configuration:(double)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v20.receiver = a1;
  v20.super_class = (Class)_UIHIDPathSynchronizationFilter;
  v13 = (double *)objc_msgSendSuper2(&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    v13[9] = a5;
    v13[10] = a6;
    v13[11] = a7;
    v13[1] = a2;
    v13[2] = a3;
    v13[3] = a4;
    v13[4] = a2;
    v13[5] = a3;
    v13[6] = a4;
    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    v16 = (void *)*((void *)v14 + 8);
    *((void *)v14 + 8) = v15;

    v14[12] = 0.0;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HIDEventSynchronization", &initWithPosition_timestamp_configuration____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v19 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134219264;
        double v22 = a2;
        __int16 v23 = 2048;
        double v24 = a3;
        __int16 v25 = 2048;
        double v26 = a4;
        __int16 v27 = 2048;
        double v28 = a5;
        __int16 v29 = 2048;
        double v30 = a6;
        __int16 v31 = 2048;
        double v32 = a7;
        _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "[FILTER] initialized with position [%f;%f], timestamp: %f. Configuration: (%f, %f, %f)",
          buf,
          0x3Eu);
      }
    }
  }
  return v14;
}

- (double)initWithPosition:(double)a3 timestamp:(double)a4
{
  if (result)
  {
    v7 = result;
    double v10 = _UIHIDPathSynchronizationFilterConfigurationDefault();
    return -[_UIHIDPathSynchronizationFilter initWithPosition:timestamp:configuration:](v7, a2, a3, a4, v10, v8, v9);
  }
  return result;
}

- (uint64_t)addInputEvent:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(void *)(result + 96) == 2) {
      return 0;
    }
    unint64_t TimeStamp = IOHIDEventGetTimeStamp();
    double v5 = _UIMediaTimeForMachTime(TimeStamp);
    if (*(double *)(v2 + 48) >= v5)
    {
      return 0;
    }
    else
    {
      *(double *)(v2 + 48) = v5;
      IOHIDEventGetFloatValue();
      uint64_t v7 = v6;
      IOHIDEventGetFloatValue();
      *(void *)(v2 + 32) = v7;
      *(void *)(v2 + 40) = v8;
      [*(id *)(v2 + 64) addObject:a2];
      return 1;
    }
  }
  return result;
}

- (void)computeNextOutputPosition:(uint64_t)a1
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 96);
    if (v3 == 2)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HIDEventSynchronization", &qword_1EB25D218);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        uint64_t v8 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          double v9 = *(double *)(a1 + 96);
          *(_DWORD *)buf = 134217984;
          double v49 = v9;
          _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "[FILTER] computeNextOutputPosition: unexpected state '%ld'.", buf, 0xCu);
        }
      }
    }
    else
    {
      if (v3 != 1)
      {
        if (v3) {
          return;
        }
        unint64_t v5 = __UILogGetCategoryCachedImpl("HIDEventSynchronization", &qword_1EB25D208);
        if (*(unsigned char *)v5)
        {
          v42 = *(NSObject **)(v5 + 8);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v42, OS_LOG_TYPE_ERROR, "[FILTER] computeNextOutputPosition: set initial output position values.", buf, 2u);
          }
        }
        *(_OWORD *)(a1 + 112) = *(_OWORD *)(a1 + 8);
        *(double *)(a1 + 104) = a2;
        *(void *)(a1 + 56) = *(void *)(a1 + 24);
        uint64_t v6 = 1;
        goto LABEL_31;
      }
      double v11 = *(double *)(a1 + 112);
      double v10 = *(double *)(a1 + 120);
      if ([*(id *)(a1 + 64) count])
      {
        double v46 = v11;
        *(void *)&long long v12 = 134218752;
        long long v45 = v12;
        while (1)
        {
          objc_msgSend(*(id *)(a1 + 64), "firstObject", v45);
          double v13 = *(double *)(a1 + 56);
          unint64_t TimeStamp = IOHIDEventGetTimeStamp();
          double v15 = _UIMediaTimeForMachTime(TimeStamp) - v13;
          double v16 = (*(double *)(a1 + 56) - *(double *)(a1 + 24)) / (*(double *)(a1 + 48) - *(double *)(a1 + 24));
          double v17 = *(double *)(a1 + 104);
          double v18 = *(double *)(a1 + 88);
          BOOL v19 = v16 < v18;
          double v20 = (v16 - v18)
              / (1.0 - v18)
              * ((v16 - v18)
               / (1.0 - v18)
               * ((v16 - v18)
                / (1.0 - v18)
                * ((v16 - v18)
                 / (1.0 - v18))));
          double v21 = (v16 / v18 + -1.0) * ((v16 / v18 + -1.0) * ((v16 / v18 + -1.0) * (v16 / v18 + -1.0)));
          if (!v19) {
            double v21 = v20;
          }
          double v22 = *(double *)(a1 + 80) * (1.0 - v21) + *(double *)(a1 + 72) * (1.0 - (1.0 - v21));
          unint64_t v23 = __UILogGetCategoryCachedImpl("HIDEventSynchronization", &_MergedGlobals_9_6);
          if (*(unsigned char *)v23)
          {
            __int16 v25 = *(NSObject **)(v23 + 8);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              double v26 = *(void **)(a1 + 64);
              __int16 v27 = v25;
              *(double *)&uint64_t v28 = COERCE_DOUBLE([v26 count]);
              *(_DWORD *)buf = v45;
              double v49 = *(double *)&v28;
              __int16 v50 = 2048;
              double v51 = v16;
              __int16 v52 = 2048;
              double v53 = v22;
              __int16 v54 = 2048;
              double v55 = v15;
              _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "[FILTER] processing next input segment (events remaining: %lu). Current progress: %f. Time scaling factor: %f. Segment duration: %f", buf, 0x2Au);
            }
          }
          double v24 = (a2 - v17) * v22;
          if (v15 >= v24) {
            break;
          }
          [*(id *)(a1 + 64) removeObjectAtIndex:0];
          if (![*(id *)(a1 + 64) count])
          {
            double v11 = v46;
            goto LABEL_22;
          }
        }
        double v30 = *(double *)(a1 + 112);
        double v29 = *(double *)(a1 + 120);
        IOHIDEventGetFloatValue();
        double v32 = v31;
        IOHIDEventGetFloatValue();
        double v34 = v33;
        double v35 = v24 / v15;
        double v36 = 1.0 - v24 / v15;
        double v11 = round(v36 * v30 + v24 / v15 * v32);
        double v47 = v29;
        double v10 = round(v36 * v29 + v35 * v34);
        unint64_t v37 = __UILogGetCategoryCachedImpl("HIDEventSynchronization", &qword_1EB25D200);
        if (*(unsigned char *)v37)
        {
          v44 = *(NSObject **)(v37 + 8);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134219520;
            double v49 = v35;
            __int16 v50 = 2048;
            double v51 = v30;
            __int16 v52 = 2048;
            double v53 = v47;
            __int16 v54 = 2048;
            double v55 = v32;
            __int16 v56 = 2048;
            double v57 = v34;
            __int16 v58 = 2048;
            double v59 = v11;
            __int16 v60 = 2048;
            double v61 = v10;
            _os_log_impl(&dword_1853B0000, v44, OS_LOG_TYPE_ERROR, "[FILTER] calculating new output position: (%f, [%f:%f], [%f:%f]) -> [%f:%f].", buf, 0x48u);
          }
        }
        *(double *)(a1 + 56) = v24 + *(double *)(a1 + 56);
      }
LABEL_22:
      if (![*(id *)(a1 + 64) count])
      {
        double v11 = *(double *)(a1 + 32);
        double v10 = *(double *)(a1 + 40);
      }
      *(double *)(a1 + 112) = v11;
      *(double *)(a1 + 120) = v10;
      *(double *)(a1 + 104) = a2;
      if (![*(id *)(a1 + 64) count]
        || ((float64x2_t v38 = vsubq_f64(*(float64x2_t *)(a1 + 32), *(float64x2_t *)(a1 + 112)),
             v38.f64[0] = vaddvq_f64(vmulq_f64(v38, v38)),
             double v39 = fabs(v38.f64[0]),
             v38.f64[0] > 1.0)
          ? (BOOL v40 = v39 > 2.22044605e-16)
          : (BOOL v40 = 0),
            !v40))
      {
        unint64_t v41 = __UILogGetCategoryCachedImpl("HIDEventSynchronization", &qword_1EB25D210);
        if (*(unsigned char *)v41)
        {
          v43 = *(NSObject **)(v41 + 8);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v43, OS_LOG_TYPE_ERROR, "[FILTER] computeNextOutputPosition: reached the target.", buf, 2u);
          }
        }
        uint64_t v6 = 2;
LABEL_31:
        *(void *)(a1 + 96) = v6;
      }
    }
  }
}

- (double)outputPosition
{
  if (a1) {
    return *(double *)(a1 + 112);
  }
  else {
    return 0.0;
  }
}

- (void).cxx_destruct
{
}

@end