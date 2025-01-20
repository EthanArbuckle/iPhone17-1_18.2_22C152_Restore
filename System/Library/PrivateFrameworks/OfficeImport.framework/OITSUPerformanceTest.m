@interface OITSUPerformanceTest
+ (id)csvHeader;
- (BOOL)passed;
- (BOOL)quiet;
- (NSString)name;
- (OITSUPerformanceTest)initWithName:(id)a3 selector:(SEL)a4 target:(id)a5 goalTime:(double)a6;
- (TSUOpstat_s)timing;
- (double)goalTime;
- (double)precision;
- (id)csvString;
- (void)dealloc;
- (void)report;
- (void)run;
- (void)setGoalTime:(double)a3;
- (void)setPrecision:(double)a3;
- (void)setQuiet:(BOOL)a3;
- (void)setTiming:(TSUOpstat_s *)a3;
@end

@implementation OITSUPerformanceTest

- (OITSUPerformanceTest)initWithName:(id)a3 selector:(SEL)a4 target:(id)a5 goalTime:(double)a6
{
  v13.receiver = self;
  v13.super_class = (Class)OITSUPerformanceTest;
  v10 = [(OITSUPerformanceTest *)&v13 init];
  if (v10)
  {
    *((void *)v10 + 1) = [a3 copy];
    if (a4) {
      SEL v11 = a4;
    }
    else {
      SEL v11 = 0;
    }
    *((void *)v10 + 2) = v11;
    *((void *)v10 + 3) = a5;
    *(_OWORD *)(v10 + 56) = 0u;
    *(_OWORD *)(v10 + 72) = 0u;
    *(_OWORD *)(v10 + 88) = 0u;
    *(_OWORD *)(v10 + 104) = 0u;
    *(_OWORD *)(v10 + 120) = 0u;
    *((double *)v10 + 4) = a6;
    v10[48] = 0;
    v10[136] = 0;
    *((void *)v10 + 5) = 0x3FA999999999999ALL;
  }
  return (OITSUPerformanceTest *)v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OITSUPerformanceTest;
  [(OITSUPerformanceTest *)&v3 dealloc];
}

- (void)run
{
  if (!self->mQuiet) {
    NSLog((NSString *)@"test '%@' starting...", a2, self->mName);
  }
  p_SEL mSelector = &self->mSelector;
  if (self->mSelector) {
    SEL mSelector = self->mSelector;
  }
  else {
    SEL mSelector = 0;
  }
  v5 = (void *)[self->mTarget methodSignatureForSelector:mSelector];
  if (!v5)
  {
    uint64_t v6 = [NSString stringWithUTF8String:"-[OITSUPerformanceTest run]"];
    uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUPerformanceTest.m"];
    if (*p_mSelector) {
      v8 = *p_mSelector;
    }
    else {
      v8 = 0;
    }
    +[OITSUAssertionHandler handleFailureInFunction:v6, v7, 61, 0, "Can't get signature for test selector '%@'!", NSStringFromSelector(v8) file lineNumber isFatal description];
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  if ([v5 numberOfArguments] != 2)
  {
    SEL v11 = (void *)[MEMORY[0x263EFF958] invocationWithMethodSignature:v5];
    [v11 setTarget:self->mTarget];
    if (self->mSelector) {
      SEL v12 = self->mSelector;
    }
    else {
      SEL v12 = 0;
    }
    [v11 setSelector:v12];
    v33.uint64_t tv_sec = (__darwin_time_t)&self->mTiming;
    [v11 setArgument:&v33 atIndex:2];
    [v11 invoke];
    unint64_t count = self->mTiming.count;
    uint64_t tv_sec = self->mTiming.total_time.tv_sec;
    goto LABEL_44;
  }
  v9 = (objc_class *)objc_opt_class();
  if (self->mSelector) {
    v10 = self->mSelector;
  }
  else {
    v10 = 0;
  }
  IMP MethodImplementation = class_getMethodImplementation(v9, v10);
  if (self->mTiming.running)
  {
    uint64_t v14 = [NSString stringWithUTF8String:"void TSUOpstatStart(TSUOpstat *)"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUOpstat.h"], 48, 0, "Opstat is already running!");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  p_last_time = &self->mTiming.last_time;
  gettimeofday(&self->mTiming.last_time, 0);
  self->mTiming.running = 1;
  if (self->mSelector) {
    SEL v16 = self->mSelector;
  }
  else {
    SEL v16 = 0;
  }
  ((void (*)(id, SEL))MethodImplementation)(self->mTarget, v16);
  if (!self->mTiming.running)
  {
    uint64_t v19 = [NSString stringWithUTF8String:"void TSUOpstatStop(TSUOpstat *)"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUOpstat.h"], 69, 0, "Opstat is already stopped!");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v33.uint64_t tv_sec = 0;
  *(void *)&v33.__darwin_suseconds_t tv_usec = 0;
  gettimeofday(&v33, 0);
  self->mTiming.running = 0;
  __darwin_suseconds_t tv_usec = self->mTiming.last_time.tv_usec;
  __darwin_time_t v21 = v33.tv_sec - self->mTiming.last_time.tv_sec;
  self->mTiming.last_time.uint64_t tv_sec = v21;
  int v22 = v33.tv_usec - tv_usec;
  self->mTiming.last_time.__darwin_suseconds_t tv_usec = v22;
  if (v22 < 0)
  {
    self->mTiming.last_time.uint64_t tv_sec = --v21;
    v22 += 1000000;
    self->mTiming.last_time.__darwin_suseconds_t tv_usec = v22;
  }
  uint64_t tv_sec = self->mTiming.total_time.tv_sec + v21;
  self->mTiming.total_time.uint64_t tv_sec = tv_sec;
  __darwin_suseconds_t v23 = self->mTiming.total_time.tv_usec + v22;
  self->mTiming.total_time.__darwin_suseconds_t tv_usec = v23;
  if (v23 > 999999)
  {
    self->mTiming.total_time.uint64_t tv_sec = ++tv_sec;
    self->mTiming.total_time.__darwin_suseconds_t tv_usec = v23 - 1000000;
  }
  unint64_t v24 = self->mTiming.count;
  p_min_time = &self->mTiming.min_time;
  if (v24)
  {
    BOOL v26 = v21 < p_min_time->tv_sec;
    if (v21 == p_min_time->tv_sec) {
      BOOL v26 = v22 < self->mTiming.min_time.tv_usec;
    }
    if (v26) {
      timeval *p_min_time = *p_last_time;
    }
    p_max_time = &self->mTiming.max_time;
    __darwin_time_t v28 = self->mTiming.max_time.tv_sec;
    BOOL v29 = v21 <= v28;
    if (v21 == v28) {
      BOOL v29 = v22 <= self->mTiming.max_time.tv_usec;
    }
    if (v29) {
      goto LABEL_43;
    }
  }
  else
  {
    timeval *p_min_time = *p_last_time;
    p_max_time = &self->mTiming.max_time;
  }
  timeval *p_max_time = *p_last_time;
LABEL_43:
  unint64_t count = v24 + 1;
  self->mTiming.unint64_t count = v24 + 1;
LABEL_44:
  double v30 = (double)count;
  __darwin_suseconds_t v31 = self->mTiming.total_time.tv_usec;
  v33.uint64_t tv_sec = 0;
  long double v32 = modf((double)tv_sec / (double)count, (long double *)&v33.tv_sec);
  self->mPassed = vabdd_f64(1.0, ((double)(int)((int)(v32 * 1000000.0) + vcvtmd_s64_f64((double)v31 / v30)) / 1000000.0+ (double)(int)*(double *)&v33.tv_sec)/ self->mGoalTime) <= self->mPrecision;
  if (!self->mQuiet) {
    [(OITSUPerformanceTest *)self report];
  }

  self->mTarget = 0;
}

- (void)report
{
  unint64_t count = self->mTiming.count;
  __darwin_suseconds_t tv_usec = self->mTiming.total_time.tv_usec;
  __darwin_time_t tv_sec = self->mTiming.total_time.tv_sec;
  double __y = 0.0;
  double v6 = (double)tv_sec;
  double v7 = (double)tv_sec / (double)count;
  double v8 = modf(v7, &__y);
  double v9 = __y;
  double v10 = (double)tv_usec;
  unsigned int v11 = vcvtmd_s64_f64((double)tv_usec / (double)count);
  mName = self->mName;
  BOOL mPassed = self->mPassed;
  double mGoalTime = self->mGoalTime;
  double mPrecision = self->mPrecision;
  if (count < 2)
  {
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"elapsed time %f", (double)self->mTiming.last_time.tv_usec / 1000000.0 + (double)self->mTiming.last_time.tv_sec, v20, v21, v22, v23, v24);
  }
  else
  {
    double __y = 0.0;
    long double v16 = modf(v7, &__y);
    uint64_t v17 = [NSString stringWithFormat:@"%d iterations, avg %f last %f min %f max %f total %f", count, (double)(int)((int)(v16 * 1000000.0) + v11) / 1000000.0 + (double)(int)__y, (double)self->mTiming.last_time.tv_usec / 1000000.0 + (double)self->mTiming.last_time.tv_sec, (double)self->mTiming.min_time.tv_usec / 1000000.0 + (double)self->mTiming.min_time.tv_sec, (double)self->mTiming.max_time.tv_usec / 1000000.0 + (double)self->mTiming.max_time.tv_sec, v10 / 1000000.0 + v6];
  }
  uint64_t v18 = (uint64_t)rint(mPrecision * 100.0);
  uint64_t v19 = "passed";
  if (!mPassed) {
    uint64_t v19 = "FAILED";
  }
  NSLog((NSString *)@"test '%@' %s: %.06fs, %02.02f%% of goal %.06fs (precision %ld%%) [opstat: %@]", mName, v19, (double)(int)((int)(v8 * 1000000.0) + v11) / 1000000.0 + (double)(int)v9, ((double)(int)((int)(v8 * 1000000.0) + v11) / 1000000.0 + (double)(int)v9) / mGoalTime * 100.0, *(void *)&mGoalTime, v18, v17);
}

+ (id)csvHeader
{
  return @"Name,Total Time (s),Iterations,Goal (s),Precision,Successful";
}

- (id)csvString
{
  id v3 = +[OITSULocale currentLocale];
  uint64_t v4 = [v3 listSeparator];
  v5 = NSString;
  id v6 = [(NSString *)self->mName tsu_stringByAddingCSVEscapesForLocale:v3];
  if (self->mPassed) {
    double v7 = @"TRUE";
  }
  else {
    double v7 = @"FALSE";
  }
  return (id)[v5 stringWithFormat:@"%@%@%.06f%@%qi%@%.06f%@%f%@%@", v6, v4, (double)self->mTiming.total_time.tv_usec / 1000000.0 + (double)self->mTiming.total_time.tv_sec, v4, self->mTiming.count, v4, *(void *)&self->mGoalTime, v4, *(void *)&self->mPrecision, v4, v7];
}

- (NSString)name
{
  return self->mName;
}

- (TSUOpstat_s)timing
{
  timeval v3 = *(timeval *)&self->last_time.tv_usec;
  timeval v4 = *(timeval *)&self[1].min_time.tv_usec;
  retstr->max_time = *(timeval *)&self[1].count;
  retstr->total_time = v4;
  retstr->last_time = *(timeval *)&self[1].max_time.tv_usec;
  *(_OWORD *)&retstr->running = *(_OWORD *)&self->total_time.tv_usec;
  retstr->min_time = v3;
  return self;
}

- (void)setTiming:(TSUOpstat_s *)a3
{
  *(_OWORD *)&self->mTiming.running = *(_OWORD *)&a3->running;
  timeval min_time = a3->min_time;
  timeval max_time = a3->max_time;
  timeval total_time = a3->total_time;
  self->mTiming.last_time = a3->last_time;
  self->mTiming.timeval total_time = total_time;
  self->mTiming.timeval max_time = max_time;
  self->mTiming.timeval min_time = min_time;
}

- (double)goalTime
{
  return self->mGoalTime;
}

- (void)setGoalTime:(double)a3
{
  self->double mGoalTime = a3;
}

- (double)precision
{
  return self->mPrecision;
}

- (void)setPrecision:(double)a3
{
  self->double mPrecision = a3;
}

- (BOOL)quiet
{
  return self->mQuiet;
}

- (void)setQuiet:(BOOL)a3
{
  self->mQuiet = a3;
}

- (BOOL)passed
{
  return self->mPassed;
}

@end