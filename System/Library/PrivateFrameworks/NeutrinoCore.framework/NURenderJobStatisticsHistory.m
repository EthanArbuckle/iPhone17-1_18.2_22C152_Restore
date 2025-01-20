@interface NURenderJobStatisticsHistory
+ (double)totalSchedulerTimeExecuting;
+ (double)totalSchedulerTimeExecutingComplete;
+ (double)totalSchedulerTimeExecutingPrepare;
+ (double)totalSchedulerTimeExecutingRender;
+ (unint64_t)totalSchedulerCanceledJobCount;
+ (unint64_t)totalSchedulerDeliveredJobCount;
+ (unint64_t)totalSchedulerJobCount;
+ (void)setTotalSchedulerCanceledJobCount:(unint64_t)a3;
+ (void)setTotalSchedulerDeliveredJobCount:(unint64_t)a3;
+ (void)setTotalSchedulerJobCount:(unint64_t)a3;
+ (void)setTotalSchedulerTimeExecuting:(double)a3;
+ (void)setTotalSchedulerTimeExecutingComplete:(double)a3;
+ (void)setTotalSchedulerTimeExecutingPrepare:(double)a3;
+ (void)setTotalSchedulerTimeExecutingRender:(double)a3;
- (NSString)jobRequestName;
- (NURenderJobStatisticsHistogram)histogram;
- (double)timeBetweenJobCreations;
- (double)timeBetweenJobDeliveries;
- (double)totalTimeExecuting;
- (double)totalTimeExecutingComplete;
- (double)totalTimeExecutingPrepare;
- (double)totalTimeExecutingRender;
- (id)description;
- (id)initHistoryForJobsWithName:(id)a3 rollingHistoryMaxSize:(unint64_t)a4;
- (unint64_t)canceledJobsCount;
- (unint64_t)deliveredJobsCount;
- (unint64_t)jobCount;
- (unint64_t)rollingHistoryMaxSize;
- (void)addStatisticsToHistory:(id)a3 wasCanceled:(BOOL)a4;
- (void)dealloc;
- (void)recordJobCreated;
@end

@implementation NURenderJobStatisticsHistory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogram, 0);

  objc_storeStrong((id *)&self->_jobRequestName, 0);
}

- (unint64_t)jobCount
{
  return self->_jobCount;
}

- (unint64_t)deliveredJobsCount
{
  return self->_deliveredJobsCount;
}

- (unint64_t)canceledJobsCount
{
  return self->_canceledJobsCount;
}

- (double)timeBetweenJobDeliveries
{
  return self->_timeBetweenJobDeliveries;
}

- (double)timeBetweenJobCreations
{
  return self->_timeBetweenJobCreations;
}

- (unint64_t)rollingHistoryMaxSize
{
  return self->_rollingHistoryMaxSize;
}

- (double)totalTimeExecuting
{
  return self->_totalTimeExecuting;
}

- (double)totalTimeExecutingComplete
{
  return self->_totalTimeExecutingComplete;
}

- (double)totalTimeExecutingRender
{
  return self->_totalTimeExecutingRender;
}

- (double)totalTimeExecutingPrepare
{
  return self->_totalTimeExecutingPrepare;
}

- (NURenderJobStatisticsHistogram)histogram
{
  return (NURenderJobStatisticsHistogram *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)jobRequestName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)dealloc
{
  free(self->_timeBetweenJobCreations);
  free(self->_timeBetweenJobDeliveries);
  v3.receiver = self;
  v3.super_class = (Class)NURenderJobStatisticsHistory;
  [(NURenderJobStatisticsHistory *)&v3 dealloc];
}

- (id)description
{
  +[NURenderJobStatisticsHistory totalSchedulerTimeExecutingPrepare];
  double v4 = v3;
  +[NURenderJobStatisticsHistory totalSchedulerTimeExecutingRender];
  double v6 = v5;
  +[NURenderJobStatisticsHistory totalSchedulerTimeExecutingComplete];
  double v47 = v7;
  +[NURenderJobStatisticsHistory totalSchedulerTimeExecuting];
  double v48 = v8;
  unint64_t v9 = +[NURenderJobStatisticsHistory totalSchedulerJobCount];
  unint64_t v10 = +[NURenderJobStatisticsHistory totalSchedulerCanceledJobCount];
  unint64_t v11 = +[NURenderJobStatisticsHistory totalSchedulerDeliveredJobCount];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:2048];
  v13 = v12;
  unint64_t deliveriesSize = self->_deliveriesSize;
  double v15 = -1.0;
  double v16 = -1.0;
  double v17 = -1.0;
  double v18 = -1.0;
  if (deliveriesSize)
  {
    double v19 = (double)deliveriesSize;
    timeBetweenJobDeliveries = self->_timeBetweenJobDeliveries;
    double v18 = 0.0;
    double v16 = 1.79769313e308;
    double v17 = 2.22507386e-308;
    do
    {
      double v21 = *timeBetweenJobDeliveries++;
      double v22 = v21;
      if (v21 < v16) {
        double v16 = v22;
      }
      if (v22 > v17) {
        double v17 = v22;
      }
      double v18 = v18 + v22 / v19;
      --deliveriesSize;
    }
    while (deliveriesSize);
  }
  double v46 = v6;
  unint64_t creationsSize = self->_creationsSize;
  double v24 = -1.0;
  double v25 = -1.0;
  if (creationsSize)
  {
    double v26 = (double)creationsSize;
    timeBetweenJobCreations = self->_timeBetweenJobCreations;
    double v25 = 0.0;
    double v15 = 1.79769313e308;
    double v24 = 2.22507386e-308;
    do
    {
      double v28 = *timeBetweenJobCreations++;
      double v29 = v28;
      if (v28 < v15) {
        double v15 = v29;
      }
      if (v29 > v24) {
        double v24 = v29;
      }
      double v25 = v25 + v29 / v26;
      --creationsSize;
    }
    while (creationsSize);
  }
  [v12 appendFormat:@"FPS Stats:              avg   min   max \n"];
  [v13 appendFormat:@"Job rate (submission): %.2f  %.2f  %.2f (sample count: %llu)\n", 1.0 / v25, 1.0 / v24, 1.0 / v15, self->_creationsSize];
  [v13 appendFormat:@"Job rate   (delivery): %.2f  %.2f  %.2f (sample count: %llu)\n", 1.0 / v18, 1.0 / v17, 1.0 / v16, self->_deliveriesSize];
  [v13 appendFormat:@"\nScheduler Time: (jobs of this name / all jobs) = %%  unit: seconds\n"];
  double totalTimeExecutingPrepare = self->_totalTimeExecutingPrepare;
  if (v4 <= 0.0) {
    double v31 = 100.0;
  }
  else {
    double v31 = totalTimeExecutingPrepare / v4 * 100.0;
  }
  [v13 appendFormat:@"Prepare  (execute): (%7.2f / %7.2f) = %.2f%%\n", *(void *)&totalTimeExecutingPrepare, *(void *)&v4, *(void *)&v31];
  double totalTimeExecutingRender = self->_totalTimeExecutingRender;
  if (v46 <= 0.0) {
    double v33 = 100.0;
  }
  else {
    double v33 = totalTimeExecutingRender / v46 * 100.0;
  }
  [v13 appendFormat:@"Render   (execute): (%7.2f / %7.2f) = %.2f%%\n", *(void *)&totalTimeExecutingRender, *(void *)&v46, *(void *)&v33];
  double totalTimeExecutingComplete = self->_totalTimeExecutingComplete;
  if (v47 <= 0.0) {
    double v35 = 100.0;
  }
  else {
    double v35 = totalTimeExecutingComplete / v47 * 100.0;
  }
  [v13 appendFormat:@"Complete (execute): (%7.2f / %7.2f) = %.2f%%\n", *(void *)&totalTimeExecutingComplete, *(void *)&v47, *(void *)&v35];
  double totalTimeExecuting = self->_totalTimeExecuting;
  if (v48 <= 0.0) {
    double v37 = 100.0;
  }
  else {
    double v37 = totalTimeExecuting / v48 * 100.0;
  }
  [v13 appendFormat:@"Total    (execute): (%7.2f / %7.2f) = %.2f%%", *(void *)&totalTimeExecuting, *(void *)&v48, *(void *)&v37];
  [v13 appendString:@"\n\n"];
  [v13 appendFormat:@"Scheduler Job Counts: (jobs of this name / all jobs) = %%\n"];
  unint64_t jobCount = self->_jobCount;
  if (v9) {
    double v39 = (float)((float)((float)jobCount / (float)v9) * 100.0);
  }
  else {
    double v39 = 100.0;
  }
  [v13 appendFormat:@"Jobs     (Total): (%5llu / %5llu) = %.2f%%\n", jobCount, v9, *(void *)&v39];
  unint64_t deliveredJobsCount = self->_deliveredJobsCount;
  if (v11) {
    double v41 = (float)((float)((float)deliveredJobsCount / (float)v11) * 100.0);
  }
  else {
    double v41 = 100.0;
  }
  [v13 appendFormat:@"Jobs (Delivered): (%5llu / %5llu) = %.2f%%\n", deliveredJobsCount, v11, *(void *)&v41];
  unint64_t canceledJobsCount = self->_canceledJobsCount;
  if (v10) {
    double v43 = (float)((float)((float)canceledJobsCount / (float)v10) * 100.0);
  }
  else {
    double v43 = 100.0;
  }
  [v13 appendFormat:@"Jobs (Coalesced): (%5llu / %5llu) = %.2f%%\n", canceledJobsCount, v10, *(void *)&v43];
  v44 = [(NURenderJobStatisticsHistogram *)self->_histogram description];
  [v13 appendFormat:@"\n\nHistogram:\n\n%@", v44];

  return v13;
}

- (void)addStatisticsToHistory:(id)a3 wasCanceled:(BOOL)a4
{
  BOOL v4 = a4;
  id v30 = a3;
  double v6 = NUAbsoluteTime();
  if (v4)
  {
    if (+[NUGlobalSettings renderJobDebugCaptureCanceledJobs])
    {
      [(NURenderJobStatisticsHistogram *)self->_histogram addStatisticsToHistogram:v30];
    }
    ++self->_canceledJobsCount;
    +[NURenderJobStatisticsHistory setTotalSchedulerCanceledJobCount:](NURenderJobStatisticsHistory, "setTotalSchedulerCanceledJobCount:", +[NURenderJobStatisticsHistory totalSchedulerCanceledJobCount]+ 1);
  }
  else
  {
    double v7 = v6;
    [(NURenderJobStatisticsHistogram *)self->_histogram addStatisticsToHistogram:v30];
    double v8 = v7 - self->_prevDeliveredTime;
    if (v8 < 3.0)
    {
      unint64_t deliveriesHead = self->_deliveriesHead;
      unint64_t deliveriesSize = self->_deliveriesSize;
      self->_timeBetweenJobDeliveries[deliveriesHead] = v8;
      unint64_t v11 = deliveriesHead + 1;
      unint64_t rollingHistoryMaxSize = self->_rollingHistoryMaxSize;
      unint64_t v13 = v11 % rollingHistoryMaxSize;
      if (rollingHistoryMaxSize >= deliveriesSize + 1) {
        unint64_t rollingHistoryMaxSize = deliveriesSize + 1;
      }
      self->_unint64_t deliveriesHead = v13;
      self->_unint64_t deliveriesSize = rollingHistoryMaxSize;
    }
    self->_prevDeliveredTime = v7;
    ++self->_deliveredJobsCount;
    +[NURenderJobStatisticsHistory setTotalSchedulerDeliveredJobCount:](NURenderJobStatisticsHistory, "setTotalSchedulerDeliveredJobCount:", +[NURenderJobStatisticsHistory totalSchedulerDeliveredJobCount]+ 1);
  }
  [v30 prepareDuration];
  double v15 = v14;
  +[NURenderJobStatisticsHistory totalSchedulerTimeExecutingPrepare];
  +[NURenderJobStatisticsHistory setTotalSchedulerTimeExecutingPrepare:v15 + v16];
  [v30 renderDuration];
  double v18 = v17;
  +[NURenderJobStatisticsHistory totalSchedulerTimeExecutingRender];
  +[NURenderJobStatisticsHistory setTotalSchedulerTimeExecutingRender:v18 + v19];
  [v30 completeDuration];
  double v21 = v20;
  +[NURenderJobStatisticsHistory totalSchedulerTimeExecutingComplete];
  +[NURenderJobStatisticsHistory setTotalSchedulerTimeExecutingComplete:v21 + v22];
  [v30 duration];
  double v24 = v23;
  +[NURenderJobStatisticsHistory totalSchedulerTimeExecuting];
  +[NURenderJobStatisticsHistory setTotalSchedulerTimeExecuting:v24 + v25];
  [v30 prepareDuration];
  self->_double totalTimeExecutingPrepare = v26 + self->_totalTimeExecutingPrepare;
  [v30 renderDuration];
  self->_double totalTimeExecutingRender = v27 + self->_totalTimeExecutingRender;
  [v30 completeDuration];
  self->_double totalTimeExecutingComplete = v28 + self->_totalTimeExecutingComplete;
  [v30 duration];
  self->_double totalTimeExecuting = v29 + self->_totalTimeExecuting;
}

- (void)recordJobCreated
{
  double v3 = NUAbsoluteTime();
  ++self->_jobCount;
  +[NURenderJobStatisticsHistory setTotalSchedulerJobCount:](NURenderJobStatisticsHistory, "setTotalSchedulerJobCount:", +[NURenderJobStatisticsHistory totalSchedulerJobCount]+ 1);
  double v4 = v3 - self->_prevCreatedTime;
  if (v4 < 3.0)
  {
    unint64_t rollingHistoryMaxSize = self->_rollingHistoryMaxSize;
    unint64_t creationsHead = self->_creationsHead;
    unint64_t creationsSize = self->_creationsSize;
    self->_timeBetweenJobCreations[creationsHead] = v4;
    unint64_t v8 = (creationsHead + 1) % rollingHistoryMaxSize;
    if (rollingHistoryMaxSize >= creationsSize + 1) {
      unint64_t rollingHistoryMaxSize = creationsSize + 1;
    }
    self->_unint64_t creationsHead = v8;
    self->_unint64_t creationsSize = rollingHistoryMaxSize;
  }
  self->_prevCreatedTime = v3;
}

- (id)initHistoryForJobsWithName:(id)a3 rollingHistoryMaxSize:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NURenderJobStatisticsHistory;
  unint64_t v8 = [(NURenderJobStatisticsHistory *)&v13 init];
  unint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_jobRequestName, a3);
    v9->_timeBetweenJobCreations = (double *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
    v9->_timeBetweenJobDeliveries = (double *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
    v9->_unint64_t rollingHistoryMaxSize = a4;
    unint64_t v10 = [[NURenderJobStatisticsHistogram alloc] initWithBins:2048 millisPerBin:0.05];
    histogram = v9->_histogram;
    v9->_histogram = v10;

    *(_OWORD *)&v9->_unint64_t deliveriesHead = 0u;
    *(_OWORD *)&v9->_unint64_t creationsSize = 0u;
    *(_OWORD *)&v9->_prevCreatedTime = 0u;
  }

  return v9;
}

+ (void)setTotalSchedulerJobCount:(unint64_t)a3
{
  _totalSchedulerJobCount = a3;
}

+ (void)setTotalSchedulerDeliveredJobCount:(unint64_t)a3
{
  _totalSchedulerDeliveredJobCount = a3;
}

+ (void)setTotalSchedulerCanceledJobCount:(unint64_t)a3
{
  _totalSchedulerCanceledJobCount = a3;
}

+ (void)setTotalSchedulerTimeExecuting:(double)a3
{
  _totalSchedulerTimeExecuting = *(void *)&a3;
}

+ (void)setTotalSchedulerTimeExecutingComplete:(double)a3
{
  _totalSchedulerTimeExecutingComplete = *(void *)&a3;
}

+ (void)setTotalSchedulerTimeExecutingRender:(double)a3
{
  _totalSchedulerTimeExecutingRender = *(void *)&a3;
}

+ (void)setTotalSchedulerTimeExecutingPrepare:(double)a3
{
  _totalSchedulerTimeExecutingPrepare = *(void *)&a3;
}

+ (unint64_t)totalSchedulerJobCount
{
  return _totalSchedulerJobCount;
}

+ (unint64_t)totalSchedulerDeliveredJobCount
{
  return _totalSchedulerDeliveredJobCount;
}

+ (unint64_t)totalSchedulerCanceledJobCount
{
  return _totalSchedulerCanceledJobCount;
}

+ (double)totalSchedulerTimeExecuting
{
  return *(double *)&_totalSchedulerTimeExecuting;
}

+ (double)totalSchedulerTimeExecutingComplete
{
  return *(double *)&_totalSchedulerTimeExecutingComplete;
}

+ (double)totalSchedulerTimeExecutingRender
{
  return *(double *)&_totalSchedulerTimeExecutingRender;
}

+ (double)totalSchedulerTimeExecutingPrepare
{
  return *(double *)&_totalSchedulerTimeExecutingPrepare;
}

@end