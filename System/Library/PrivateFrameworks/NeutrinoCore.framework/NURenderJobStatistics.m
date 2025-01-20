@interface NURenderJobStatistics
+ (NSMutableDictionary)history;
+ (id)aggregateStatistics:(id)a3;
+ (void)addStatisticsToHistory:(id)a3 forJob:(id)a4 wasCanceled:(BOOL)a5;
+ (void)recordJobCreatedToHistory:(id)a3;
- (NSArray)dependencies;
- (NSString)description;
- (double)completeDuration;
- (double)completeLatency;
- (double)didCompleteTime;
- (double)didPrepareTime;
- (double)didRenderTime;
- (double)duration;
- (double)lastRecordedTime;
- (double)latency;
- (double)prepareDuration;
- (double)prepareLatency;
- (double)renderDuration;
- (double)renderLatency;
- (double)replyLatency;
- (double)requestTime;
- (double)responseTime;
- (double)totalDuration;
- (double)willCompleteTime;
- (double)willPrepareTime;
- (double)willRenderTime;
- (void)renderJob:(id)a3 didRunStage:(int64_t)a4;
- (void)renderJob:(id)a3 willRunStage:(int64_t)a4;
- (void)setDependencies:(id)a3;
- (void)setDidCompleteTime:(double)a3;
- (void)setDidPrepareTime:(double)a3;
- (void)setDidRenderTime:(double)a3;
- (void)setRequestTime:(double)a3;
- (void)setResponseTime:(double)a3;
- (void)setWillCompleteTime:(double)a3;
- (void)setWillPrepareTime:(double)a3;
- (void)setWillRenderTime:(double)a3;
@end

@implementation NURenderJobStatistics

- (void).cxx_destruct
{
}

- (void)setDependencies:(id)a3
{
}

- (NSArray)dependencies
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setResponseTime:(double)a3
{
  self->_responseTime = a3;
}

- (double)responseTime
{
  return self->_responseTime;
}

- (void)setDidCompleteTime:(double)a3
{
  self->_didCompleteTime = a3;
}

- (double)didCompleteTime
{
  return self->_didCompleteTime;
}

- (void)setWillCompleteTime:(double)a3
{
  self->_willCompleteTime = a3;
}

- (double)willCompleteTime
{
  return self->_willCompleteTime;
}

- (void)setDidRenderTime:(double)a3
{
  self->_didRenderTime = a3;
}

- (double)didRenderTime
{
  return self->_didRenderTime;
}

- (void)setWillRenderTime:(double)a3
{
  self->_willRenderTime = a3;
}

- (double)willRenderTime
{
  return self->_willRenderTime;
}

- (void)setDidPrepareTime:(double)a3
{
  self->_didPrepareTime = a3;
}

- (double)didPrepareTime
{
  return self->_didPrepareTime;
}

- (void)setWillPrepareTime:(double)a3
{
  self->_willPrepareTime = a3;
}

- (double)willPrepareTime
{
  return self->_willPrepareTime;
}

- (void)setRequestTime:(double)a3
{
  self->_requestTime = a3;
}

- (double)requestTime
{
  return self->_requestTime;
}

- (NSString)description
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:2048];
  uint64_t v4 = objc_opt_class();
  v5 = [(NURenderJobStatistics *)self dependencies];
  [v3 appendFormat:@"<%@:%p dependencies:%lu compiled: %s ", v4, self, objc_msgSend(v5, "count"), "Release"];

  [v3 appendFormat:@"{\n"];
  [(NURenderJobStatistics *)self prepareLatency];
  if (v6 == 0.0) {
    v28[0] = 0;
  }
  else {
    __sprintf_chk(v28, 0, 0x28uLL, "%.2f millis", v6 * 1000.0);
  }
  objc_msgSend(v3, "appendFormat:", @"  prepare     (wait) : %s\n", v28);
  [(NURenderJobStatistics *)self prepareDuration];
  if (v7 == 0.0) {
    v28[0] = 0;
  }
  else {
    __sprintf_chk(v28, 0, 0x28uLL, "%.2f millis", v7 * 1000.0);
  }
  objc_msgSend(v3, "appendFormat:", @"  prepare  (execute) : %s\n", v28);
  [(NURenderJobStatistics *)self renderLatency];
  if (v8 == 0.0) {
    v28[0] = 0;
  }
  else {
    __sprintf_chk(v28, 0, 0x28uLL, "%.2f millis", v8 * 1000.0);
  }
  objc_msgSend(v3, "appendFormat:", @"  render      (wait) : %s\n", v28);
  [(NURenderJobStatistics *)self renderDuration];
  if (v9 == 0.0) {
    v28[0] = 0;
  }
  else {
    __sprintf_chk(v28, 0, 0x28uLL, "%.2f millis", v9 * 1000.0);
  }
  objc_msgSend(v3, "appendFormat:", @"  render   (execute) : %s\n", v28);
  [(NURenderJobStatistics *)self completeLatency];
  if (v10 == 0.0) {
    v28[0] = 0;
  }
  else {
    __sprintf_chk(v28, 0, 0x28uLL, "%.2f millis", v10 * 1000.0);
  }
  objc_msgSend(v3, "appendFormat:", @"  complete    (wait) : %s\n", v28);
  [(NURenderJobStatistics *)self completeDuration];
  if (v11 == 0.0) {
    v28[0] = 0;
  }
  else {
    __sprintf_chk(v28, 0, 0x28uLL, "%.2f millis", v11 * 1000.0);
  }
  objc_msgSend(v3, "appendFormat:", @"  complete (execute) : %s\n", v28);
  [(NURenderJobStatistics *)self replyLatency];
  if (v12 == 0.0) {
    v28[0] = 0;
  }
  else {
    __sprintf_chk(v28, 0, 0x28uLL, "%.2f millis", v12 * 1000.0);
  }
  objc_msgSend(v3, "appendFormat:", @"  reply       (wait) : %s\n", v28);
  [v3 appendFormat:@"      -----------------------\n"];
  [(NURenderJobStatistics *)self latency];
  if (v13 == 0.0) {
    v28[0] = 0;
  }
  else {
    __sprintf_chk(v28, 0, 0x28uLL, "%.2f millis", v13 * 1000.0);
  }
  objc_msgSend(v3, "appendFormat:", @"  total       (wait) : %s\n", v28);
  [(NURenderJobStatistics *)self duration];
  if (v14 == 0.0) {
    v28[0] = 0;
  }
  else {
    __sprintf_chk(v28, 0, 0x28uLL, "%.2f millis", v14 * 1000.0);
  }
  objc_msgSend(v3, "appendFormat:", @"  total    (execute) : %s\n", v28);
  [(NURenderJobStatistics *)self duration];
  double v16 = v15;
  [(NURenderJobStatistics *)self latency];
  double v18 = v16 + v17;
  if (v18 == 0.0) {
    v28[0] = 0;
  }
  else {
    __sprintf_chk(v28, 0, 0x28uLL, "%.2f millis", v18 * 1000.0);
  }
  objc_msgSend(v3, "appendFormat:", @"  total              : %s\n", v28);
  [v3 appendFormat:@"      -----------------------\n"];
  [(NURenderJobStatistics *)self requestTime];
  __36__NURenderJobStatistics_description__block_invoke(v28, v19);
  objc_msgSend(v3, "appendFormat:", @"  request    (start) : %s\n", v28);
  [(NURenderJobStatistics *)self willPrepareTime];
  __36__NURenderJobStatistics_description__block_invoke(v28, v20);
  objc_msgSend(v3, "appendFormat:", @"  prepare    (start) : %s\n", v28);
  [(NURenderJobStatistics *)self didPrepareTime];
  __36__NURenderJobStatistics_description__block_invoke(v28, v21);
  objc_msgSend(v3, "appendFormat:", @"  prepare      (end) : %s\n", v28);
  [(NURenderJobStatistics *)self willRenderTime];
  __36__NURenderJobStatistics_description__block_invoke(v28, v22);
  objc_msgSend(v3, "appendFormat:", @"  render     (start) : %s\n", v28);
  [(NURenderJobStatistics *)self didRenderTime];
  __36__NURenderJobStatistics_description__block_invoke(v28, v23);
  objc_msgSend(v3, "appendFormat:", @"  render       (end) : %s\n", v28);
  [(NURenderJobStatistics *)self willCompleteTime];
  __36__NURenderJobStatistics_description__block_invoke(v28, v24);
  objc_msgSend(v3, "appendFormat:", @"  complete   (start) : %s\n", v28);
  [(NURenderJobStatistics *)self didCompleteTime];
  __36__NURenderJobStatistics_description__block_invoke(v28, v25);
  objc_msgSend(v3, "appendFormat:", @"  complete     (end) : %s\n", v28);
  [(NURenderJobStatistics *)self responseTime];
  __36__NURenderJobStatistics_description__block_invoke(v28, v26);
  objc_msgSend(v3, "appendFormat:", @"  response     (end) : %s\n", v28);
  [v3 appendFormat:@"} >\n"];

  return (NSString *)v3;
}

char *__36__NURenderJobStatistics_description__block_invoke(char *a1, long double a2)
{
  if (a2 == 0.0)
  {
    *a1 = 0;
  }
  else
  {
    time_t v7 = (uint64_t)a2;
    double v3 = modf(a2, &__y);
    uint64_t v4 = gmtime(&v7);
    strftime(a1, 0x28uLL, "%H:%M:%S", v4);
    sprintf(a1 + 8, " +%i", (int)(v3 * 100000.0) % 100000);
  }
  return a1;
}

- (double)totalDuration
{
  [(NURenderJobStatistics *)self lastRecordedTime];
  double v4 = v3;
  [(NURenderJobStatistics *)self requestTime];
  return v4 - v5;
}

- (double)lastRecordedTime
{
  double result = self->_responseTime;
  if (result <= 0.0)
  {
    double result = self->_didCompleteTime;
    if (result <= 0.0)
    {
      double result = self->_willCompleteTime;
      if (result <= 0.0)
      {
        double result = self->_didRenderTime;
        if (result <= 0.0)
        {
          double result = self->_willRenderTime;
          if (result <= 0.0)
          {
            double result = self->_didPrepareTime;
            if (result <= 0.0)
            {
              double result = self->_willPrepareTime;
              if (result <= 0.0) {
                return fmax(self->_requestTime, 0.0);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (double)duration
{
  [(NURenderJobStatistics *)self prepareDuration];
  double v4 = v3;
  [(NURenderJobStatistics *)self renderDuration];
  double v6 = v4 + v5;
  [(NURenderJobStatistics *)self completeDuration];
  double result = v6 + v7;
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (double)latency
{
  [(NURenderJobStatistics *)self totalDuration];
  double v4 = v3;
  [(NURenderJobStatistics *)self duration];
  double result = v4 - v5;
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (double)replyLatency
{
  double responseTime = self->_responseTime;
  double result = 0.0;
  if (responseTime != 0.0)
  {
    double didCompleteTime = self->_didCompleteTime;
    if (didCompleteTime == 0.0)
    {
      double didCompleteTime = self->_didRenderTime;
      if (didCompleteTime == 0.0)
      {
        double didCompleteTime = self->_didPrepareTime;
        if (didCompleteTime == 0.0) {
          double didCompleteTime = self->_requestTime;
        }
      }
    }
    return responseTime - didCompleteTime;
  }
  return result;
}

- (double)completeDuration
{
  double result = self->_didCompleteTime - self->_willCompleteTime;
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (double)completeLatency
{
  double result = self->_willCompleteTime - self->_didRenderTime;
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (double)renderDuration
{
  double result = self->_didRenderTime - self->_willRenderTime;
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (double)renderLatency
{
  double result = self->_willRenderTime - self->_didPrepareTime;
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (double)prepareDuration
{
  double result = self->_didPrepareTime - self->_willPrepareTime;
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (double)prepareLatency
{
  double result = self->_willPrepareTime - self->_requestTime;
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (void)renderJob:(id)a3 didRunStage:(int64_t)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = NUAbsoluteTime();
  switch(a4)
  {
    case 0:
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
      }
      double v8 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
      {
        double v9 = NSString;
        double v10 = v8;
        double v11 = [v9 stringWithFormat:@"Unexpected stage: %@", @"None"];
        *(_DWORD *)buf = 138543362;
        id v43 = v11;
        _os_log_impl(&dword_1A9892000, v10, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

        uint64_t v12 = _NULogOnceToken;
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (v12 != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
          }
          goto LABEL_22;
        }
        if (v12 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
        }
      }
      else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
LABEL_22:
        v27 = (void *)_NUAssertLogger;
        if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = specific;
        v35 = v27;
        v36 = [v33 callStackSymbols];
        double v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v43 = specific;
        __int16 v44 = 2114;
        double v45 = v37;
        _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        goto LABEL_30;
      }
      v38 = (void *)_NUAssertLogger;
      if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      v39 = (void *)MEMORY[0x1E4F29060];
      v35 = v38;
      v40 = [v39 callStackSymbols];
      v41 = [v40 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v43 = v41;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_30:
LABEL_27:
      _NUAssertContinueHandler((uint64_t)"-[NURenderJobStatistics renderJob:didRunStage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1704, @"Unexpected stage: %@", v28, v29, v30, v31, @"None");
LABEL_28:

      return;
    case 1:
      [(NURenderJobStatistics *)self setDidPrepareTime:v7];
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
      }
      double v13 = (void *)_NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        double v14 = v13;
        [(NURenderJobStatistics *)self didPrepareTime];
        double v16 = v15;
        [(NURenderJobStatistics *)self willPrepareTime];
        *(_DWORD *)buf = 134218240;
        id v43 = v6;
        __int16 v44 = 2048;
        double v45 = v16 - v17;
        double v18 = "job %p didPrepare %0.4f s";
        goto LABEL_20;
      }
      goto LABEL_28;
    case 4:
      [(NURenderJobStatistics *)self setDidRenderTime:v7];
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
      }
      long double v19 = (void *)_NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        double v14 = v19;
        [(NURenderJobStatistics *)self didRenderTime];
        double v21 = v20;
        [(NURenderJobStatistics *)self willRenderTime];
        *(_DWORD *)buf = 134218240;
        id v43 = v6;
        __int16 v44 = 2048;
        double v45 = v21 - v22;
        double v18 = "job %p didRender %0.4f s";
        goto LABEL_20;
      }
      goto LABEL_28;
    case 5:
      [(NURenderJobStatistics *)self setDidCompleteTime:v7];
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_970);
      }
      long double v23 = (void *)_NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        double v14 = v23;
        [(NURenderJobStatistics *)self didCompleteTime];
        double v25 = v24;
        [(NURenderJobStatistics *)self willCompleteTime];
        *(_DWORD *)buf = 134218240;
        id v43 = v6;
        __int16 v44 = 2048;
        double v45 = v25 - v26;
        double v18 = "job %p didComplete %0.4f s";
LABEL_20:
        _os_log_debug_impl(&dword_1A9892000, v14, OS_LOG_TYPE_DEBUG, v18, buf, 0x16u);
      }
      goto LABEL_28;
    default:
      goto LABEL_28;
  }
}

- (void)renderJob:(id)a3 willRunStage:(int64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  double v6 = NUAbsoluteTime();
  switch(a4)
  {
    case 1:
      [(NURenderJobStatistics *)self setWillPrepareTime:v6];
      return;
    case 4:
      [(NURenderJobStatistics *)self setWillRenderTime:v6];
      return;
    case 5:
      [(NURenderJobStatistics *)self setWillCompleteTime:v6];
      return;
    case 6:
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
      }
      double v7 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
      {
        double v8 = NSString;
        double v9 = v7;
        double v10 = [v8 stringWithFormat:@"Unexpected stage: %@", @"Done"];
        *(_DWORD *)buf = 138543362;
        uint64_t v28 = v10;
        _os_log_impl(&dword_1A9892000, v9, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

        uint64_t v11 = _NULogOnceToken;
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (v11 != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
          }
LABEL_18:
          uint64_t v12 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            double v18 = (void *)MEMORY[0x1E4F29060];
            id v19 = specific;
            double v20 = v12;
            double v21 = [v18 callStackSymbols];
            double v22 = [v21 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            uint64_t v28 = specific;
            __int16 v29 = 2114;
            uint64_t v30 = v22;
            _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_25:
            goto LABEL_23;
          }
          goto LABEL_23;
        }
        if (v11 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_968);
        }
      }
      else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        goto LABEL_18;
      }
      long double v23 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      {
        double v24 = (void *)MEMORY[0x1E4F29060];
        double v20 = v23;
        double v25 = [v24 callStackSymbols];
        double v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        uint64_t v28 = v26;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        goto LABEL_25;
      }
LABEL_23:
      _NUAssertContinueHandler((uint64_t)"-[NURenderJobStatistics renderJob:willRunStage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1671, @"Unexpected stage: %@", v13, v14, v15, v16, @"Done");
      return;
    default:
      return;
  }
}

+ (id)aggregateStatistics:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    double v45 = NUAssertLogger_21966();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      uint64_t v46 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "stats != nil");
      *(_DWORD *)buf = 138543362;
      v83 = v46;
      _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v48 = NUAssertLogger_21966();
    BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v49)
      {
        v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v60 = (void *)MEMORY[0x1E4F29060];
        id v61 = v59;
        v62 = [v60 callStackSymbols];
        v63 = [v62 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v83 = v59;
        __int16 v84 = 2114;
        v85 = v63;
        _os_log_error_impl(&dword_1A9892000, v48, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v49)
    {
      v50 = [MEMORY[0x1E4F29060] callStackSymbols];
      v51 = [v50 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v83 = v51;
      _os_log_error_impl(&dword_1A9892000, v48, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NURenderJobStatistics aggregateStatistics:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1855, @"Invalid parameter not satisfying: %s", v64, v65, v66, v67, (uint64_t)"stats != nil");
  }
  double v4 = v3;
  if (![v3 count])
  {
    v52 = NUAssertLogger_21966();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "stats.count != 0");
      *(_DWORD *)buf = 138543362;
      v83 = v53;
      _os_log_error_impl(&dword_1A9892000, v52, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v54 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v55 = NUAssertLogger_21966();
    BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_ERROR);
    if (v54)
    {
      if (v56)
      {
        v68 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v69 = (void *)MEMORY[0x1E4F29060];
        id v70 = v68;
        v71 = [v69 callStackSymbols];
        v72 = [v71 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v83 = v68;
        __int16 v84 = 2114;
        v85 = v72;
        _os_log_error_impl(&dword_1A9892000, v55, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v56)
    {
      v57 = [MEMORY[0x1E4F29060] callStackSymbols];
      v58 = [v57 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v83 = v58;
      _os_log_error_impl(&dword_1A9892000, v55, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NURenderJobStatistics aggregateStatistics:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1856, @"Invalid parameter not satisfying: %s", v73, v74, v75, v76, (uint64_t)"stats.count != 0");
  }
  double v5 = objc_alloc_init(NURenderJobStatistics);
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v77 objects:v81 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v78 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        [(NURenderJobStatistics *)v5 requestTime];
        if (v12 == 0.0
          || ([v11 requestTime],
              double v14 = v13,
              [(NURenderJobStatistics *)v5 requestTime],
              v14 < v15))
        {
          [v11 requestTime];
          -[NURenderJobStatistics setRequestTime:](v5, "setRequestTime:");
        }
        [(NURenderJobStatistics *)v5 willPrepareTime];
        if (v16 == 0.0
          || ([v11 willPrepareTime],
              double v18 = v17,
              [(NURenderJobStatistics *)v5 willPrepareTime],
              v18 < v19))
        {
          [v11 willPrepareTime];
          -[NURenderJobStatistics setWillPrepareTime:](v5, "setWillPrepareTime:");
        }
        [(NURenderJobStatistics *)v5 didPrepareTime];
        if (v20 == 0.0
          || ([v11 didPrepareTime],
              double v22 = v21,
              [(NURenderJobStatistics *)v5 didPrepareTime],
              v22 < v23))
        {
          [v11 didPrepareTime];
          -[NURenderJobStatistics setDidPrepareTime:](v5, "setDidPrepareTime:");
        }
        [(NURenderJobStatistics *)v5 willRenderTime];
        if (v24 == 0.0
          || ([v11 willRenderTime],
              double v26 = v25,
              [(NURenderJobStatistics *)v5 willRenderTime],
              v26 < v27))
        {
          [v11 willRenderTime];
          -[NURenderJobStatistics setWillRenderTime:](v5, "setWillRenderTime:");
        }
        [(NURenderJobStatistics *)v5 didRenderTime];
        if (v28 == 0.0
          || ([v11 didRenderTime],
              double v30 = v29,
              [(NURenderJobStatistics *)v5 didRenderTime],
              v30 > v31))
        {
          [v11 didRenderTime];
          -[NURenderJobStatistics setDidRenderTime:](v5, "setDidRenderTime:");
        }
        [(NURenderJobStatistics *)v5 willCompleteTime];
        if (v32 == 0.0
          || ([v11 willCompleteTime],
              double v34 = v33,
              [(NURenderJobStatistics *)v5 willCompleteTime],
              v34 > v35))
        {
          [v11 willCompleteTime];
          -[NURenderJobStatistics setWillCompleteTime:](v5, "setWillCompleteTime:");
        }
        [(NURenderJobStatistics *)v5 didCompleteTime];
        if (v36 == 0.0
          || ([v11 didCompleteTime],
              double v38 = v37,
              [(NURenderJobStatistics *)v5 didCompleteTime],
              v38 > v39))
        {
          [v11 didCompleteTime];
          -[NURenderJobStatistics setDidCompleteTime:](v5, "setDidCompleteTime:");
        }
        [(NURenderJobStatistics *)v5 responseTime];
        if (v40 != 0.0)
        {
          [v11 responseTime];
          double v42 = v41;
          [(NURenderJobStatistics *)v5 responseTime];
          if (v42 <= v43) {
            continue;
          }
        }
        [v11 responseTime];
        -[NURenderJobStatistics setResponseTime:](v5, "setResponseTime:");
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v77 objects:v81 count:16];
    }
    while (v8);
  }

  [(NURenderJobStatistics *)v5 setDependencies:v6];

  return v5;
}

+ (void)recordJobCreatedToHistory:(id)a3
{
  id v6 = a3;
  id v3 = +[NURenderJobStatistics history];
  id v4 = [v3 objectForKeyedSubscript:v6];

  if (!v4)
  {
    id v4 = [[NURenderJobStatisticsHistory alloc] initHistoryForJobsWithName:v6 rollingHistoryMaxSize:50];
    double v5 = +[NURenderJobStatistics history];
    [v5 setObject:v4 forKeyedSubscript:v6];
  }
  [v4 recordJobCreated];
}

+ (void)addStatisticsToHistory:(id)a3 forJob:(id)a4 wasCanceled:(BOOL)a5
{
  BOOL v5 = a5;
  id v18 = a3;
  id v7 = a4;
  uint64_t v8 = +[NURenderJobStatistics history];
  uint64_t v9 = [v7 request];
  double v10 = [v9 name];
  id v11 = [v8 objectForKeyedSubscript:v10];

  if (!v11)
  {
    double v12 = [NURenderJobStatisticsHistory alloc];
    double v13 = [v7 request];
    double v14 = [v13 name];
    id v11 = [(NURenderJobStatisticsHistory *)v12 initHistoryForJobsWithName:v14 rollingHistoryMaxSize:50];

    double v15 = +[NURenderJobStatistics history];
    double v16 = [v7 request];
    double v17 = [v16 name];
    [v15 setObject:v11 forKeyedSubscript:v17];
  }
  [v11 addStatisticsToHistory:v18 wasCanceled:v5];
}

+ (NSMutableDictionary)history
{
  if (!_history
    && +[NUGlobalSettings renderJobDebugCapturePerfStatHistory])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v3 = (void *)_history;
    _history = (uint64_t)v2;
  }
  id v4 = (void *)_history;

  return (NSMutableDictionary *)v4;
}

@end