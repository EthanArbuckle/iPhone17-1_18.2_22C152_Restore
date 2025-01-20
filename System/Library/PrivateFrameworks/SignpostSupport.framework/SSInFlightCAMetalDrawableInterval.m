@interface SSInFlightCAMetalDrawableInterval
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)debugDescription;
- (SSCAMLTimeInterval)cpuWalltimeInterval;
- (SSCAMLTimeInterval)gpuWalltimeInterval;
- (SSCAMLTimeInterval)waitForGlassWalltimeInterval;
- (SSInFlightCAMetalDrawableInterval)initWithOnGlassSignpostInterval:(id)a3;
- (_SSCAMLTimeInterval)backingInterval;
- (double)cpuEndToEndWalltime;
- (double)durationMs;
- (double)endMs;
- (double)endSeconds;
- (double)gpuEndToEndWalltime;
- (double)gpuResidencyRatio;
- (double)onGPUTime;
- (double)startMs;
- (double)startSeconds;
- (double)timebaseRatio;
- (double)totalEndToEndWalltime;
- (double)waitForGlassWalltime;
- (float)durationSeconds;
- (id)dictionaryRepresentation;
- (id)jsonDescription:(unint64_t)a3;
- (unint64_t)durationMachContinuousTime;
- (unint64_t)durationNanoseconds;
- (unint64_t)endMachContinuousTime;
- (unint64_t)endNanoseconds;
- (unint64_t)startMachContinuousTime;
- (unint64_t)startNanoseconds;
- (unsigned)commandBufferCount;
@end

@implementation SSInFlightCAMetalDrawableInterval

- (double)startSeconds
{
  unint64_t v3 = [(SSInFlightCAMetalDrawableInterval *)self startMachContinuousTime];
  [(SSInFlightCAMetalDrawableInterval *)self timebaseRatio];
  return v4 * (double)v3 / 1000000000.0;
}

- (double)endSeconds
{
  unint64_t v3 = [(SSInFlightCAMetalDrawableInterval *)self endMachContinuousTime];
  [(SSInFlightCAMetalDrawableInterval *)self timebaseRatio];
  return v4 * (double)v3 / 1000000000.0;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3 = [(SSInFlightCAMetalDrawableInterval *)self endMachContinuousTime];
  return v3 - [(SSInFlightCAMetalDrawableInterval *)self startMachContinuousTime];
}

- (float)durationSeconds
{
  [(SSInFlightCAMetalDrawableInterval *)self endSeconds];
  double v4 = v3;
  [(SSInFlightCAMetalDrawableInterval *)self startSeconds];
  return v4 - v5;
}

- (unint64_t)startNanoseconds
{
  [(SSInFlightCAMetalDrawableInterval *)self startSeconds];
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)endNanoseconds
{
  [(SSInFlightCAMetalDrawableInterval *)self endSeconds];
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)durationNanoseconds
{
  [(SSInFlightCAMetalDrawableInterval *)self durationSeconds];
  return (unint64_t)(float)(v2 * 1000000000.0);
}

- (double)startMs
{
  [(SSInFlightCAMetalDrawableInterval *)self startSeconds];
  return v2 * 1000.0;
}

- (double)endMs
{
  [(SSInFlightCAMetalDrawableInterval *)self endSeconds];
  return v2 * 1000.0;
}

- (double)durationMs
{
  [(SSInFlightCAMetalDrawableInterval *)self durationSeconds];
  return (float)(v2 * 1000.0);
}

- (NSDate)startDate
{
  float v2 = [(SSInFlightCAMetalDrawableInterval *)self backingInterval];
  double v3 = [v2 startDate];

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  float v2 = [(SSInFlightCAMetalDrawableInterval *)self backingInterval];
  double v3 = [v2 endDate];

  return (NSDate *)v3;
}

- (unint64_t)startMachContinuousTime
{
  float v2 = [(SSInFlightCAMetalDrawableInterval *)self backingInterval];
  unint64_t v3 = [v2 startMachContinuousTime];

  return v3;
}

- (unint64_t)endMachContinuousTime
{
  float v2 = [(SSInFlightCAMetalDrawableInterval *)self backingInterval];
  unint64_t v3 = [v2 endMachContinuousTime];

  return v3;
}

- (double)timebaseRatio
{
  float v2 = [(SSInFlightCAMetalDrawableInterval *)self backingInterval];
  [v2 timebaseRatio];
  double v4 = v3;

  return v4;
}

- (double)totalEndToEndWalltime
{
  [(SSInFlightCAMetalDrawableInterval *)self durationSeconds];
  return v2;
}

- (double)cpuEndToEndWalltime
{
  float v2 = [(SSInFlightCAMetalDrawableInterval *)self cpuWalltimeInterval];
  [v2 durationSeconds];
  double v4 = v3;

  return v4;
}

- (double)gpuEndToEndWalltime
{
  float v2 = [(SSInFlightCAMetalDrawableInterval *)self gpuWalltimeInterval];
  [v2 durationSeconds];
  double v4 = v3;

  return v4;
}

- (double)waitForGlassWalltime
{
  float v2 = [(SSInFlightCAMetalDrawableInterval *)self waitForGlassWalltimeInterval];
  [v2 durationSeconds];
  double v4 = v3;

  return v4;
}

- (double)gpuResidencyRatio
{
  [(SSInFlightCAMetalDrawableInterval *)self gpuEndToEndWalltime];
  double v4 = v3;
  double result = 0.0;
  if (v4 != 0.0)
  {
    [(SSInFlightCAMetalDrawableInterval *)self onGPUTime];
    double v7 = v6;
    [(SSInFlightCAMetalDrawableInterval *)self gpuEndToEndWalltime];
    return v7 / v8;
  }
  return result;
}

- (id)dictionaryRepresentation
{
  double v3 = _timeIntervalDict(self);
  double v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SSInFlightCAMetalDrawableInterval commandBufferCount](self, "commandBufferCount"));
  [v3 setObject:v4 forKeyedSubscript:kSSInFlightCAMetalDrawableIntervalKey_CommandBufferCount];

  double v5 = [(SSInFlightCAMetalDrawableInterval *)self cpuWalltimeInterval];
  double v6 = [v5 dictionaryRepresentation];
  [v3 setObject:v6 forKeyedSubscript:kSSInFlightCAMetalDrawableIntervalKey_CPUEndToEndInterval];

  double v7 = [(SSInFlightCAMetalDrawableInterval *)self gpuWalltimeInterval];
  double v8 = [v7 dictionaryRepresentation];
  [v3 setObject:v8 forKeyedSubscript:kSSInFlightCAMetalDrawableIntervalKey_GPUEndToEndInterval];

  v9 = [(SSInFlightCAMetalDrawableInterval *)self waitForGlassWalltimeInterval];
  v10 = [v9 dictionaryRepresentation];
  [v3 setObject:v10 forKeyedSubscript:kSSInFlightCAMetalDrawableIntervalKey_GPUDoneToGlassWaitInterval];

  v11 = NSNumber;
  [(SSInFlightCAMetalDrawableInterval *)self onGPUTime];
  v12 = objc_msgSend(v11, "numberWithDouble:");
  [v3 setObject:v12 forKeyedSubscript:kSSInFlightCAMetalDrawableIntervalKey_OnGPUTime];

  return v3;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)[(SSInFlightCAMetalDrawableInterval *)self jsonDescription:3];
}

- (SSInFlightCAMetalDrawableInterval)initWithOnGlassSignpostInterval:(id)a3
{
  id v4 = a3;
  double v5 = [v4 beginEvent];
  double v6 = [v5 placeholderTokenValueDictForTokenKey:@"name"];

  id v7 = v6;
  objc_opt_class();
  double v8 = _objectValueForKey(@"command_buffer_count", v7, 3);

  if (v8)
  {
    id v9 = v7;
    objc_opt_class();
    v10 = _objectValueForKey(@"inflight_end_to_end_total_ms", v9, 3);

    if (v10 && ([v10 doubleValue], v11 >= 0.0))
    {
      id v13 = v9;
      objc_opt_class();
      v14 = _objectValueForKey(@"inflight_end_to_end_cpu_ms", v13, 3);

      if (v14 && ([v14 doubleValue], v15 >= 0.0))
      {
        id v16 = v13;
        objc_opt_class();
        v17 = _objectValueForKey(@"inflight_end_to_end_gpu_ms", v16, 3);

        if (v17 && ([v17 doubleValue], v18 >= 0.0))
        {
          v19 = _numberValueForKey(@"inflight_on_gpu_ms", v16);
          v20 = v19;
          if (v19 && ([v19 doubleValue], v21 >= 0.0))
          {
            v22 = _numberValueForKey(@"inflight_wait_for_glass_ms", v16);
            v23 = v22;
            if (v22 && ([v22 doubleValue], v24 >= 0.0))
            {
              unsigned int v56 = [v8 unsignedIntValue];
              [v10 doubleValue];
              double v26 = v25 / 1000.0;
              [v14 doubleValue];
              double v28 = v27 / 1000.0;
              [v17 doubleValue];
              double v30 = v29 / 1000.0;
              [v20 doubleValue];
              double v32 = v31;
              [v23 doubleValue];
              double v34 = v33 / 1000.0;
              v35 = [v4 beginDate];

              v63 = v23;
              double v61 = v30;
              if (v35)
              {
                v36 = [v4 beginDate];
                v69 = [v36 dateByAddingTimeInterval:-v26];
                v68 = [v69 dateByAddingTimeInterval:v28];
                v70 = v36;
                v67 = [v36 dateByAddingTimeInterval:-v34];
                v66 = [v67 dateByAddingTimeInterval:-v30];
              }
              else
              {
                v69 = 0;
                v70 = 0;
                v67 = 0;
                v68 = 0;
                v66 = 0;
              }
              unint64_t v37 = [v4 startMachContinuousTime];
              double v38 = (double)v37;
              [v4 timebaseRatio];
              id v64 = (id)((double)v37 - v26 * 1000000000.0 / v39);
              [v4 timebaseRatio];
              double v41 = v40;
              [v4 timebaseRatio];
              double v43 = v42;
              [v4 timebaseRatio];
              double v45 = v44;
              v46 = [_SSCAMLTimeInterval alloc];
              [v4 timebaseRatio];
              unint64_t v59 = v37;
              v47 = -[_SSCAMLTimeInterval initWithStartMCT:endMCT:startDate:endDate:timebaseRatio:](v46, "initWithStartMCT:endMCT:startDate:endDate:timebaseRatio:");
              if (v47)
              {
                obj = v47;
                v57 = [_SSCAMLTimeInterval alloc];
                [v4 timebaseRatio];
                v48 = -[_SSCAMLTimeInterval initWithStartMCT:endMCT:startDate:endDate:timebaseRatio:](v57, "initWithStartMCT:endMCT:startDate:endDate:timebaseRatio:", v64, (unint64_t)(v28 * 1000000000.0 / v41 + (double)(unint64_t)v64), v69, v68);
                if (v48)
                {
                  v65 = v48;
                  v49 = [_SSCAMLTimeInterval alloc];
                  [v4 timebaseRatio];
                  v50 = -[_SSCAMLTimeInterval initWithStartMCT:endMCT:startDate:endDate:timebaseRatio:](v49, "initWithStartMCT:endMCT:startDate:endDate:timebaseRatio:", (unint64_t)((double)(unint64_t)(v38 - v34 * 1000000000.0 / v43)- v61 * 1000000000.0 / v45), (unint64_t)(v38 - v34 * 1000000000.0 / v43), v66, v67);
                  if (v50)
                  {
                    v58 = v50;
                    v51 = [_SSCAMLTimeInterval alloc];
                    [v4 timebaseRatio];
                    v52 = -[_SSCAMLTimeInterval initWithStartMCT:endMCT:startDate:endDate:timebaseRatio:](v51, "initWithStartMCT:endMCT:startDate:endDate:timebaseRatio:", (unint64_t)(v38 - v34 * 1000000000.0 / v43), v59, v67, v70);
                    v23 = v63;
                    if (v52)
                    {
                      v62 = v52;
                      v71.receiver = self;
                      v71.super_class = (Class)SSInFlightCAMetalDrawableInterval;
                      v53 = [(SSInFlightCAMetalDrawableInterval *)&v71 init];
                      v54 = v53;
                      if (v53)
                      {
                        objc_storeStrong((id *)&v53->_backingInterval, obj);
                        objc_storeStrong((id *)&v54->_cpuWalltimeInterval, v65);
                        objc_storeStrong((id *)&v54->_gpuWalltimeInterval, v58);
                        objc_storeStrong((id *)&v54->_waitForGlassWalltimeInterval, v62);
                        v54->_commandBufferCount = v56;
                        v54->_onGPUTime = v32 / 1000.0;
                      }
                      self = v54;
                      v12 = self;
                      v52 = v62;
                    }
                    else
                    {
                      v12 = 0;
                    }

                    v50 = v58;
                  }
                  else
                  {
                    v12 = 0;
                    v23 = v63;
                  }

                  v48 = v65;
                }
                else
                {
                  v12 = 0;
                  v23 = v63;
                }

                v47 = obj;
              }
              else
              {
                v12 = 0;
                v23 = v63;
              }
            }
            else
            {
              v12 = 0;
            }
          }
          else
          {
            v12 = 0;
          }
        }
        else
        {
          v12 = 0;
        }
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unsigned)commandBufferCount
{
  return self->_commandBufferCount;
}

- (double)onGPUTime
{
  return self->_onGPUTime;
}

- (SSCAMLTimeInterval)cpuWalltimeInterval
{
  return self->_cpuWalltimeInterval;
}

- (SSCAMLTimeInterval)gpuWalltimeInterval
{
  return self->_gpuWalltimeInterval;
}

- (SSCAMLTimeInterval)waitForGlassWalltimeInterval
{
  return self->_waitForGlassWalltimeInterval;
}

- (_SSCAMLTimeInterval)backingInterval
{
  return self->_backingInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingInterval, 0);
  objc_storeStrong((id *)&self->_waitForGlassWalltimeInterval, 0);
  objc_storeStrong((id *)&self->_gpuWalltimeInterval, 0);

  objc_storeStrong((id *)&self->_cpuWalltimeInterval, 0);
}

@end