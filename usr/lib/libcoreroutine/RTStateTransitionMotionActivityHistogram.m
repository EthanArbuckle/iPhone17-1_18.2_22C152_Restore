@interface RTStateTransitionMotionActivityHistogram
- (NSMutableArray)histogramBins;
- (RTStateTransitionMotionActivityHistogram)initWithMotionActivities:(id)a3 fromStartDate:(id)a4 toEndDate:(id)a5;
- (double)cumulativeInterval;
- (int64_t)activityChangeCount;
- (unint64_t)getDominantMotionActivityType;
- (void)addActivity:(id)a3 withInterval:(double)a4;
- (void)setActivityChangeCount:(int64_t)a3;
- (void)setCumulativeInterval:(double)a3;
- (void)setHistogramBins:(id)a3;
- (void)show;
@end

@implementation RTStateTransitionMotionActivityHistogram

- (RTStateTransitionMotionActivityHistogram)initWithMotionActivities:(id)a3 fromStartDate:(id)a4 toEndDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)RTStateTransitionMotionActivityHistogram;
  v11 = [(RTStateTransitionMotionActivityHistogram *)&v27 init];
  if (v11)
  {
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    histogramBins = v11->_histogramBins;
    v11->_histogramBins = v12;

    v11->_activityChangeCount = 0;
    v11->_cumulativeInterval = 0.0;
    [v9 timeIntervalSinceReferenceDate];
    uint64_t v15 = v14;
    [v10 timeIntervalSinceReferenceDate];
    uint64_t v17 = v16;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__112;
    v25[4] = __Block_byref_object_dispose__112;
    id v26 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __93__RTStateTransitionMotionActivityHistogram_initWithMotionActivities_fromStartDate_toEndDate___block_invoke;
    v19[3] = &unk_1E6B9A080;
    v22 = v25;
    uint64_t v23 = v15;
    id v20 = v8;
    uint64_t v24 = v17;
    v21 = v11;
    [v20 enumerateObjectsUsingBlock:v19];

    _Block_object_dispose(v25, 8);
  }

  return v11;
}

void __93__RTStateTransitionMotionActivityHistogram_initWithMotionActivities_fromStartDate_toEndDate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  id v26 = v5;
  if (v5 && v7)
  {
    id v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-4233600.0];
    id v9 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) startDate];
    id v10 = [v9 laterDate:v8];
    v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) startDate];
    if ([v10 isEqual:v11])
    {
      v12 = [v26 startDate];
      v13 = [v12 laterDate:v8];
      uint64_t v14 = [v26 startDate];
      int v15 = [v13 isEqual:v14];

      if (v15)
      {
        double v16 = *(double *)(a1 + 56);
        uint64_t v17 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) startDate];
        [v17 timeIntervalSinceReferenceDate];
        double v19 = v18;

        if (v16 <= v19)
        {
          v21 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) startDate];
          [v21 timeIntervalSinceReferenceDate];
          double v20 = v22;
        }
        else
        {
          double v20 = *(double *)(a1 + 56);
        }
        if ([*(id *)(a1 + 32) count] - 1 == a3)
        {
          double v23 = *(double *)(a1 + 64);
        }
        else
        {
          uint64_t v24 = [v26 startDate];
          [v24 timeIntervalSinceReferenceDate];
          double v23 = v25;
        }
        [*(id *)(a1 + 40) addActivity:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) withInterval:v23 - v20];
      }
    }
    else
    {
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
  }
  *(void *)(v6 + 40) = v26;
}

- (void)addActivity:(id)a3 withInterval:(double)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = __Block_byref_object_copy__112;
    objc_super v27 = __Block_byref_object_dispose__112;
    id v28 = 0;
    uint64_t v19 = 0;
    double v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    v7 = [(RTStateTransitionMotionActivityHistogram *)self histogramBins];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__RTStateTransitionMotionActivityHistogram_addActivity_withInterval___block_invoke;
    v15[3] = &unk_1E6B95900;
    id v8 = v6;
    id v16 = v8;
    uint64_t v17 = &v23;
    double v18 = &v19;
    [v7 enumerateObjectsUsingBlock:v15];

    id v9 = (void *)v24[5];
    if (!v9)
    {
      id v10 = [[RTStateTransitionActivityHistogramElement alloc] initWithActivity:v8];
      v11 = (void *)v24[5];
      v24[5] = (uint64_t)v10;

      id v9 = (void *)v24[5];
    }
    [v9 interval];
    [v9 setInterval:v12 + a4];
    [(RTStateTransitionMotionActivityHistogram *)self cumulativeInterval];
    [(RTStateTransitionMotionActivityHistogram *)self setCumulativeInterval:v13 + a4];
    [(RTStateTransitionMotionActivityHistogram *)self setActivityChangeCount:[(RTStateTransitionMotionActivityHistogram *)self activityChangeCount] + 1];
    if (!*((unsigned char *)v20 + 24))
    {
      uint64_t v14 = [(RTStateTransitionMotionActivityHistogram *)self histogramBins];
      [v14 addObject:v24[5]];
    }
    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);
  }
}

void __69__RTStateTransitionMotionActivityHistogram_addActivity_withInterval___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  v7 = [v9 activity];
  int v8 = [v7 isEqual:a1[4]];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)show
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v3 = [(RTStateTransitionMotionActivityHistogram *)self histogramBins];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      id v5 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int64_t v7 = [(RTStateTransitionMotionActivityHistogram *)self activityChangeCount];
        [(RTStateTransitionMotionActivityHistogram *)self cumulativeInterval];
        int v9 = 134218240;
        int64_t v10 = v7;
        __int16 v11 = 2048;
        uint64_t v12 = v8;
        _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "change count, %ld, cumulative interval, %f", (uint8_t *)&v9, 0x16u);
      }

      id v6 = [(RTStateTransitionMotionActivityHistogram *)self histogramBins];
      [v6 enumerateObjectsUsingBlock:&__block_literal_global_62_0];
    }
  }
}

void __48__RTStateTransitionMotionActivityHistogram_show__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = [v2 activity];
    [v2 interval];
    int v6 = 138412546;
    int64_t v7 = v4;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "%@, interval, %f", (uint8_t *)&v6, 0x16u);
  }
}

- (unint64_t)getDominantMotionActivityType
{
  [(RTStateTransitionMotionActivityHistogram *)self show];
  uint64_t v26 = 0;
  objc_super v27 = (double *)&v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = (double *)&v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = (double *)&v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v3 = [(RTStateTransitionMotionActivityHistogram *)self histogramBins];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__RTStateTransitionMotionActivityHistogram_getDominantMotionActivityType__block_invoke;
  v17[3] = &unk_1E6B9A0A8;
  v17[4] = &v26;
  v17[5] = &v18;
  v17[6] = &v22;
  [v3 enumerateObjectsUsingBlock:v17];

  [(RTStateTransitionMotionActivityHistogram *)self cumulativeInterval];
  double v4 = 0.0;
  double v5 = 0.0;
  if (v6 <= 0.0) {
    goto LABEL_7;
  }
  double v7 = v27[3];
  [(RTStateTransitionMotionActivityHistogram *)self cumulativeInterval];
  double v9 = v8;
  double v10 = v19[3];
  [(RTStateTransitionMotionActivityHistogram *)self cumulativeInterval];
  double v12 = v11;
  double v13 = v23[3];
  [(RTStateTransitionMotionActivityHistogram *)self cumulativeInterval];
  double v5 = v10 / v12;
  double v4 = v13 / v14;
  if (v7 / v9 <= 0.2 || v5 >= 0.4 || v4 >= 0.4)
  {
LABEL_7:
    if (v5 > 0.4 || v4 > 0.4)
    {
      if (v5 <= v4) {
        unint64_t v15 = 3;
      }
      else {
        unint64_t v15 = 2;
      }
    }
    else
    {
      unint64_t v15 = 0;
    }
  }
  else
  {
    unint64_t v15 = 4;
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  return v15;
}

void __73__RTStateTransitionMotionActivityHistogram_getDominantMotionActivityType__block_invoke(void *a1, void *a2)
{
  id v12 = a2;
  v3 = [v12 activity];
  int v4 = [v3 automotive];

  if (v4)
  {
    [v12 interval];
    *(double *)(*(void *)(a1[4] + 8) + 24) = v5 + *(double *)(*(void *)(a1[4] + 8) + 24);
  }
  double v6 = [v12 activity];
  int v7 = [v6 walking];

  if (v7)
  {
    [v12 interval];
    *(double *)(*(void *)(a1[5] + 8) + 24) = v8 + *(double *)(*(void *)(a1[5] + 8) + 24);
  }
  double v9 = [v12 activity];
  int v10 = [v9 running];

  if (v10)
  {
    [v12 interval];
    *(double *)(*(void *)(a1[6] + 8) + 24) = v11 + *(double *)(*(void *)(a1[6] + 8) + 24);
  }
}

- (NSMutableArray)histogramBins
{
  return self->_histogramBins;
}

- (void)setHistogramBins:(id)a3
{
}

- (int64_t)activityChangeCount
{
  return self->_activityChangeCount;
}

- (void)setActivityChangeCount:(int64_t)a3
{
  self->_activityChangeCount = a3;
}

- (double)cumulativeInterval
{
  return self->_cumulativeInterval;
}

- (void)setCumulativeInterval:(double)a3
{
  self->_cumulativeInterval = a3;
}

- (void).cxx_destruct
{
}

@end