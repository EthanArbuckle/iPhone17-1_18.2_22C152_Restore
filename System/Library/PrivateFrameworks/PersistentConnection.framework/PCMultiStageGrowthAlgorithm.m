@interface PCMultiStageGrowthAlgorithm
+ (void)_loadDefaultValue:(double *)a3 forKey:(__CFString *)a4;
+ (void)_loadDefaults;
- (BOOL)isServerOriginatedKeepAlive;
- (BOOL)minimumIntervalFallbackEnabled;
- (BOOL)useIntervalIfImprovement:(double)a3;
- (BOOL)usingServerStatsAggressively;
- (NSDictionary)cacheInfo;
- (NSString)description;
- (PCMultiStageGrowthAlgorithm)initWithCacheInfo:(id)a3 loggingIdentifier:(id)a4 algorithmName:(id)a5;
- (_PCTimeRange)signalAvoidanceRange;
- (double)_steadyStateTimeout;
- (double)currentKeepAliveInterval;
- (double)lastSuccessfulKeepAliveInterval;
- (double)maximumKeepAliveInterval;
- (double)minimumIntervalFallbackStateTimeout;
- (double)minimumKeepAliveInterval;
- (double)serverStatsExpectedKeepAliveInterval;
- (double)serverStatsMaxKeepAliveInterval;
- (double)serverStatsMinKeepAliveInterval;
- (id)_stringForAction:(int)a3;
- (id)_stringForMode:(int)a3;
- (id)_stringForStage:(int)a3;
- (int)growthStage;
- (int)previousAction;
- (unint64_t)countOfGrowthActions;
- (void)_adjustGrowthAlgorithmMode;
- (void)_fallbackToLastSuccessfulKeepAliveInterval;
- (void)_processBackoffAction:(int)a3;
- (void)_processInitialGrowthAction:(int)a3;
- (void)_processInitialShrinkAction:(int)a3;
- (void)_processMinimumIntervalFallbackStateAction:(int)a3;
- (void)_processRefinedGrowthAction:(int)a3;
- (void)_processRefinedShrinkAction:(int)a3;
- (void)_processSteadyStateAction:(int)a3;
- (void)_resetAlgorithmToInterval:(double)a3;
- (void)_resetAlgorithmToInterval:(double)a3 stage:(int)a4;
- (void)_setCurrentKeepAliveInterval:(double)a3 varianceMode:(unsigned int)a4;
- (void)_setCurrentKeepAliveInterval:(double)a3 varianceMode:(unsigned int)a4 allowRoundUp:(BOOL)a5;
- (void)processNextAction:(int)a3;
- (void)setIsServerOriginatedKeepAlive:(BOOL)a3;
- (void)setLastSuccessfulKeepAliveInterval:(double)a3;
- (void)setMaximumKeepAliveInterval:(double)a3;
- (void)setMinimumIntervalFallbackEnabled:(BOOL)a3;
- (void)setMinimumIntervalFallbackStateTimeout:(double)a3;
- (void)setMinimumKeepAliveInterval:(double)a3;
- (void)setPreviousAction:(int)a3;
- (void)setServerStatsExpectedKeepAliveInterval:(double)a3;
- (void)setServerStatsMaxKeepAliveInterval:(double)a3;
- (void)setServerStatsMinKeepAliveInterval:(double)a3;
- (void)setSignalAvoidanceRange:(_PCTimeRange)a3;
- (void)setUsingServerStatsAggressively:(BOOL)a3;
@end

@implementation PCMultiStageGrowthAlgorithm

- (PCMultiStageGrowthAlgorithm)initWithCacheInfo:(id)a3 loggingIdentifier:(id)a4 algorithmName:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  +[PCMultiStageGrowthAlgorithm _loadDefaults];
  v26.receiver = self;
  v26.super_class = (Class)PCMultiStageGrowthAlgorithm;
  id v11 = [(PCMultiStageGrowthAlgorithm *)&v26 init];
  if (v11)
  {
    id v12 = [NSString stringWithFormat:@"multiStateGrowth.%@", v9];
    uint64_t v13 = +[PCLog logWithCategory:](PCLog, "logWithCategory:", [v12 UTF8String]);
    v14 = (void *)*((void *)v11 + 15);
    *((void *)v11 + 15) = v13;

    uint64_t v15 = [v10 copy];
    v16 = (void *)*((void *)v11 + 13);
    *((void *)v11 + 13) = v15;

    uint64_t v17 = PCDefaultMaximumKeepAliveInterval;
    *((void *)v11 + 2) = PCDefaultMinimumKeepAliveInterval;
    *((void *)v11 + 3) = v17;
    *((_DWORD *)v11 + 45) = 0;
    *((void *)v11 + 18) = 0;
    *((void *)v11 + 19) = 0;
    *((void *)v11 + 20) = 0;
    *((void *)v11 + 21) = 0x40F5180000000000;
    if (v8)
    {
      v18 = [v8 objectForKey:@"keepAliveInterval"];
      [v18 doubleValue];
      double v20 = v19;

      v21 = [v8 objectForKey:@"inInitialGrowth"];
      int v22 = [v21 BOOLValue];

      v23 = *((void *)v11 + 15);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = @"NO";
        *(_DWORD *)buf = 134218498;
        double v28 = v20;
        __int16 v29 = 2114;
        if (v22) {
          v24 = @"YES";
        }
        v30 = v24;
        __int16 v31 = 2114;
        id v32 = v8;
        _os_log_impl(&dword_1D340D000, v23, OS_LOG_TYPE_DEFAULT, "Using cached keep alive interval of %g seconds inInitialGrowth? %{public}@ from [%{public}@]", buf, 0x20u);
      }
      if (v22)
      {
        [v11 _resetAlgorithmToInterval:0 stage:v20];
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      double v20 = 0.0;
    }
    [v11 _resetAlgorithmToInterval:v20];
    goto LABEL_11;
  }
LABEL_12:

  return (PCMultiStageGrowthAlgorithm *)v11;
}

- (double)maximumKeepAliveInterval
{
  double result = self->_serverStatsMaxKeepAliveInterval;
  if (result <= 0.0) {
    return self->_maximumKeepAliveInterval;
  }
  return result;
}

- (double)minimumKeepAliveInterval
{
  double result = self->_serverStatsMinKeepAliveInterval;
  if (result <= 0.0) {
    return self->_minimumKeepAliveInterval;
  }
  return result;
}

- (void)setMaximumKeepAliveInterval:(double)a3
{
  self->_maximumKeepAliveInterval = a3;
  [(PCMultiStageGrowthAlgorithm *)self minimumKeepAliveInterval];
  if (v5 > a3) {
    [(PCMultiStageGrowthAlgorithm *)self setMinimumKeepAliveInterval:a3];
  }
  [(PCMultiStageGrowthAlgorithm *)self currentKeepAliveInterval];
  -[PCMultiStageGrowthAlgorithm _setCurrentKeepAliveInterval:varianceMode:](self, "_setCurrentKeepAliveInterval:varianceMode:", 0);
}

- (void)setMinimumKeepAliveInterval:(double)a3
{
  self->_minimumKeepAliveInterval = a3;
  [(PCMultiStageGrowthAlgorithm *)self maximumKeepAliveInterval];
  if (v5 < a3) {
    [(PCMultiStageGrowthAlgorithm *)self setMaximumKeepAliveInterval:a3];
  }
  [(PCMultiStageGrowthAlgorithm *)self currentKeepAliveInterval];
  -[PCMultiStageGrowthAlgorithm _setCurrentKeepAliveInterval:varianceMode:](self, "_setCurrentKeepAliveInterval:varianceMode:", 0);
}

- (void)_setCurrentKeepAliveInterval:(double)a3 varianceMode:(unsigned int)a4 allowRoundUp:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0.0) {
    double v8 = *(double *)&PCDefaultInitialKeepAliveInterval;
  }
  else {
    double v8 = a3;
  }
  [(PCMultiStageGrowthAlgorithm *)self minimumKeepAliveInterval];
  if (v8 < v9)
  {
    [(PCMultiStageGrowthAlgorithm *)self minimumKeepAliveInterval];
LABEL_8:
    double v8 = v10;
    a4 = 0;
    goto LABEL_9;
  }
  [(PCMultiStageGrowthAlgorithm *)self maximumKeepAliveInterval];
  if (v8 > v11)
  {
    [(PCMultiStageGrowthAlgorithm *)self maximumKeepAliveInterval];
    goto LABEL_8;
  }
LABEL_9:
  double duration = self->_signalAvoidanceRange.duration;
  if (duration == 0.0
    || ((double v13 = self->_signalAvoidanceRange.start, v14 = v13 + duration, v13 != 0.0) ? (v15 = v13 < v8) : (v15 = 0),
        v15 ? (BOOL v16 = v14 <= v8) : (BOOL v16 = 1),
        v16))
  {
    double start = v8;
  }
  else
  {
    uint64_t growthStage = self->_growthStage;
    double v23 = 0.5;
    if (growthStage <= 6) {
      double v23 = dbl_1D342E950[growthStage];
    }
    if (v5)
    {
      double currentKeepAliveInterval = self->_currentKeepAliveInterval;
      double v25 = (v8 - v13) / duration;
      if (v8 <= currentKeepAliveInterval)
      {
        if (v25 <= v23)
        {
          double start = self->_signalAvoidanceRange.start;
        }
        else
        {
          if (v14 >= currentKeepAliveInterval) {
            double v27 = self->_currentKeepAliveInterval;
          }
          else {
            double v27 = v14;
          }
          if (v14 == currentKeepAliveInterval) {
            double start = self->_signalAvoidanceRange.start;
          }
          else {
            double start = v27;
          }
        }
      }
      else
      {
        double start = v14;
        if (v25 <= v23)
        {
          BOOL v26 = v13 == currentKeepAliveInterval;
          if (v13 < currentKeepAliveInterval) {
            double v13 = self->_currentKeepAliveInterval;
          }
          if (v26) {
            double start = v14;
          }
          else {
            double start = v13;
          }
        }
      }
      [(PCMultiStageGrowthAlgorithm *)self maximumKeepAliveInterval];
      if (start <= v28)
      {
        [(PCMultiStageGrowthAlgorithm *)self minimumKeepAliveInterval];
        if (start < v29) {
          double start = v14;
        }
      }
      else
      {
        double start = self->_signalAvoidanceRange.start;
      }
    }
    else
    {
      double start = self->_signalAvoidanceRange.start;
    }
    logObject = self->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      double v31 = self->_signalAvoidanceRange.start;
      double v32 = self->_signalAvoidanceRange.duration;
      int v33 = 138413570;
      v34 = self;
      __int16 v35 = 2048;
      double v36 = v8;
      __int16 v37 = 2048;
      double v38 = start;
      __int16 v39 = 2048;
      double v40 = v31;
      __int16 v41 = 2048;
      double v42 = v32;
      __int16 v43 = 2048;
      double v44 = v23;
      _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%@: triggered signaling avoidance {interval: %g, adjustedInterval: %g, _signalAvoidanceRange.start: %g, _signalAvoidanceRange.duration: %g, roundUpRatio: %g}", (uint8_t *)&v33, 0x3Eu);
    }
  }
  if (a4 == 2)
  {
    uint32_t v19 = arc4random();
    double start = start
          - -(*(double *)&PCIncrementRandomVariance
            - ((double)v19 / 4294967300.0 + (double)v19 / 4294967300.0) * *(double *)&PCIncrementRandomVariance);
  }
  else if (a4 == 1)
  {
    uint32_t v18 = arc4random();
    double start = start
          - (*(double *)&PCIncrementRandomVariance
           - ((double)v18 / 4294967300.0 + (double)v18 / 4294967300.0) * *(double *)&PCIncrementRandomVariance);
  }
  if (self->_currentKeepAliveInterval != start)
  {
    double v20 = self->_logObject;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      algorithmName = self->_algorithmName;
      int v33 = 138543618;
      v34 = (PCMultiStageGrowthAlgorithm *)algorithmName;
      __int16 v35 = 2048;
      double v36 = start;
      _os_log_impl(&dword_1D340D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: setting current interval to %g seconds", (uint8_t *)&v33, 0x16u);
    }
    self->_lastKeepAliveInterval = self->_currentKeepAliveInterval;
    self->_double currentKeepAliveInterval = start;
  }
}

- (void)_setCurrentKeepAliveInterval:(double)a3 varianceMode:(unsigned int)a4
{
}

- (void)setLastSuccessfulKeepAliveInterval:(double)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_lastSuccessfulKeepAliveInterval != a3)
  {
    logObject = self->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      algorithmName = self->_algorithmName;
      int v7 = 138543618;
      double v8 = algorithmName;
      __int16 v9 = 2048;
      double v10 = a3;
      _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%{public}@: setting lastSuccessfulKeepAliveInterval to %g seconds", (uint8_t *)&v7, 0x16u);
    }
    self->_lastSuccessfulKeepAliveInterval = a3;
  }
}

- (void)_fallbackToLastSuccessfulKeepAliveInterval
{
  double lastSuccessfulKeepAliveInterval = self->_lastSuccessfulKeepAliveInterval;
  if (lastSuccessfulKeepAliveInterval > 2.22044605e-16
    && lastSuccessfulKeepAliveInterval < self->_currentKeepAliveInterval)
  {
    -[PCMultiStageGrowthAlgorithm _setCurrentKeepAliveInterval:varianceMode:](self, "_setCurrentKeepAliveInterval:varianceMode:", 0);
  }
}

- (void)setMinimumIntervalFallbackEnabled:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_minimumIntervalFallbackEnabled != a3)
  {
    BOOL v3 = a3;
    self->_minimumIntervalFallbackEnabled = a3;
    logObject = self->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      v6 = @"NO";
      if (v3) {
        v6 = @"YES";
      }
      int v8 = 138412546;
      __int16 v9 = self;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%@ minimumIntervalFallbackEnabled changed to %@", (uint8_t *)&v8, 0x16u);
    }
    if (!self->_minimumIntervalFallbackEnabled)
    {
      leaveMinimumIntervalFallbackStateDate = self->_leaveMinimumIntervalFallbackStateDate;
      if (leaveMinimumIntervalFallbackStateDate)
      {
        self->_leaveMinimumIntervalFallbackStateDate = 0;
      }
    }
  }
}

- (BOOL)useIntervalIfImprovement:(double)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    double lastKeepAliveInterval = self->_lastKeepAliveInterval;
    double currentKeepAliveInterval = self->_currentKeepAliveInterval;
    int v12 = 138544130;
    double v13 = self;
    __int16 v14 = 2048;
    double v15 = a3;
    __int16 v16 = 2048;
    double v17 = lastKeepAliveInterval;
    __int16 v18 = 2048;
    double v19 = currentKeepAliveInterval;
    _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%{public}@: useIntervalIfImprovement %f   lastKeepAliveInterval: %f  currentKeepAliveInterval: %f", (uint8_t *)&v12, 0x2Au);
  }
  double v8 = self->_lastKeepAliveInterval;
  if (v8 >= self->_currentKeepAliveInterval || v8 <= 2.22044605e-16) {
    double v10 = self->_currentKeepAliveInterval;
  }
  else {
    double v10 = self->_lastKeepAliveInterval;
  }
  if (v10 < a3) {
    [(PCMultiStageGrowthAlgorithm *)self _setCurrentKeepAliveInterval:0 varianceMode:0 allowRoundUp:a3];
  }
  return v10 < a3;
}

- (NSDictionary)cacheInfo
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v4 = [NSNumber numberWithDouble:self->_currentKeepAliveInterval];
  BOOL v5 = [NSNumber numberWithBool:self->_growthStage == 0];
  v6 = [MEMORY[0x1E4F1C9C8] date];
  int v7 = objc_msgSend(v3, "initWithObjectsAndKeys:", v4, @"keepAliveInterval", v5, @"inInitialGrowth", v6, @"cacheDate", 0);

  return (NSDictionary *)v7;
}

- (void)_adjustGrowthAlgorithmMode
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int lastKeepAliveAlgorithmMode = self->_lastKeepAliveAlgorithmMode;
  if (lastKeepAliveAlgorithmMode == 2)
  {
    if (self->_serverStatsExpectedKeepAliveInterval >= 2.22044605e-16)
    {
      if (self->_usingServerStatsAggressively) {
        goto LABEL_15;
      }
      goto LABEL_9;
    }
    goto LABEL_13;
  }
  if (lastKeepAliveAlgorithmMode == 1)
  {
    if (self->_usingServerStatsAggressively)
    {
LABEL_11:
      [(PCMultiStageGrowthAlgorithm *)self _resetAlgorithmToInterval:5 stage:self->_serverStatsMaxKeepAliveInterval];
      int v4 = 2;
      goto LABEL_14;
    }
    if (self->_serverStatsExpectedKeepAliveInterval >= 2.22044605e-16) {
      goto LABEL_15;
    }
LABEL_13:
    int v4 = 0;
    goto LABEL_14;
  }
  if (lastKeepAliveAlgorithmMode) {
    goto LABEL_15;
  }
  if (self->_usingServerStatsAggressively) {
    goto LABEL_11;
  }
  if (self->_serverStatsExpectedKeepAliveInterval <= 2.22044605e-16) {
    goto LABEL_15;
  }
  -[PCMultiStageGrowthAlgorithm _resetAlgorithmToInterval:stage:](self, "_resetAlgorithmToInterval:stage:", 2);
LABEL_9:
  int v4 = 1;
LABEL_14:
  self->_currentKeepAliveAlgorithmMode = v4;
LABEL_15:
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = self->_lastKeepAliveAlgorithmMode;
    int v7 = logObject;
    double v8 = [(PCMultiStageGrowthAlgorithm *)self _stringForMode:v6];
    __int16 v9 = [(PCMultiStageGrowthAlgorithm *)self _stringForMode:self->_currentKeepAliveAlgorithmMode];
    int v10 = 138543874;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    double v13 = v8;
    __int16 v14 = 2112;
    double v15 = v9;
    _os_log_impl(&dword_1D340D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: adjustGrowthAlgorithmMode. {lastMode: %@, currentMode: %@}", (uint8_t *)&v10, 0x20u);
  }
}

- (void)_resetAlgorithmToInterval:(double)a3 stage:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = logObject;
    __int16 v9 = [(PCMultiStageGrowthAlgorithm *)self _stringForStage:v4];
    int v12 = 138543874;
    double v13 = self;
    __int16 v14 = 2048;
    double v15 = a3;
    __int16 v16 = 2114;
    double v17 = v9;
    _os_log_impl(&dword_1D340D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: resetAlgorithmToInterval: %g state: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  self->_uint64_t growthStage = v4;
  self->_highWatermark = 0.0;
  self->_initialGrowthStageHighWatermark = 0.0;
  leaveSteadyStateDate = self->_leaveSteadyStateDate;
  self->_initialGrowthStageLastAttempt = 0.0;
  self->_leaveSteadyStateDate = 0;

  leaveMinimumIntervalFallbackStateDate = self->_leaveMinimumIntervalFallbackStateDate;
  self->_leaveMinimumIntervalFallbackStateDate = 0;

  [(PCMultiStageGrowthAlgorithm *)self _setCurrentKeepAliveInterval:0 varianceMode:a3];
}

- (void)_resetAlgorithmToInterval:(double)a3
{
}

- (void)processNextAction:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    algorithmName = self->_algorithmName;
    int v7 = logObject;
    double v8 = [(PCMultiStageGrowthAlgorithm *)self _stringForAction:v3];
    __int16 v9 = [(PCMultiStageGrowthAlgorithm *)self _stringForStage:self->_growthStage];
    int v13 = 138543874;
    __int16 v14 = algorithmName;
    __int16 v15 = 2114;
    __int16 v16 = v8;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    _os_log_impl(&dword_1D340D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: received action %{public}@ while in stage %{public}@", (uint8_t *)&v13, 0x20u);
  }
  if (v3)
  {
    [(PCMultiStageGrowthAlgorithm *)self _adjustGrowthAlgorithmMode];
    if (v3 == 3)
    {
      [(PCMultiStageGrowthAlgorithm *)self minimumKeepAliveInterval];
      -[PCMultiStageGrowthAlgorithm _resetAlgorithmToInterval:](self, "_resetAlgorithmToInterval:");
      return;
    }
  }
  else
  {
    ++self->_countOfGrowthActions;
    [(PCMultiStageGrowthAlgorithm *)self _adjustGrowthAlgorithmMode];
  }
  if (self->_growthStage == 4)
  {
LABEL_8:
    [(PCMultiStageGrowthAlgorithm *)self _processMinimumIntervalFallbackStateAction:v3];
LABEL_9:
    self->_int lastKeepAliveAlgorithmMode = self->_currentKeepAliveAlgorithmMode;
    [(PCMultiStageGrowthAlgorithm *)self setPreviousAction:v3];
    return;
  }
  [(PCMultiStageGrowthAlgorithm *)self maximumKeepAliveInterval];
  double v11 = v10;
  [(PCMultiStageGrowthAlgorithm *)self minimumKeepAliveInterval];
  if (v11 - v12 > *(double *)&PCRefinedGrowthIncrement)
  {
    switch(self->_growthStage)
    {
      case 0:
        [(PCMultiStageGrowthAlgorithm *)self _processInitialGrowthAction:v3];
        break;
      case 1:
        [(PCMultiStageGrowthAlgorithm *)self _processRefinedGrowthAction:v3];
        break;
      case 2:
        [(PCMultiStageGrowthAlgorithm *)self _processSteadyStateAction:v3];
        break;
      case 3:
        [(PCMultiStageGrowthAlgorithm *)self _processBackoffAction:v3];
        break;
      case 4:
        goto LABEL_8;
      case 5:
        [(PCMultiStageGrowthAlgorithm *)self _processInitialShrinkAction:v3];
        break;
      case 6:
        [(PCMultiStageGrowthAlgorithm *)self _processRefinedShrinkAction:v3];
        break;
      default:
        goto LABEL_9;
    }
    goto LABEL_9;
  }
  self->_uint64_t growthStage = 2;
}

- (void)_processInitialGrowthAction:(int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 2:
      if (self->_isServerOriginatedKeepAlive)
      {
        [(PCMultiStageGrowthAlgorithm *)self _fallbackToLastSuccessfulKeepAliveInterval];
      }
      break;
    case 1:
      uint64_t currentKeepAliveInterval = (uint64_t)self->_currentKeepAliveInterval;
      [(PCMultiStageGrowthAlgorithm *)self _fallbackToLastSuccessfulKeepAliveInterval];
      logObject = self->_logObject;
      if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
      {
        algorithmName = self->_algorithmName;
        int v13 = 138543362;
        __int16 v14 = algorithmName;
        _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%{public}@: leaving the initial growth stage for refined growth", (uint8_t *)&v13, 0xCu);
      }
      self->_uint64_t growthStage = 1;
      [(PCMultiStageGrowthAlgorithm *)self processNextAction:self->_currentKeepAliveInterval >= (double)currentKeepAliveInterval];
      break;
    case 0:
      double v4 = self->_currentKeepAliveInterval;
      [(PCMultiStageGrowthAlgorithm *)self maximumKeepAliveInterval];
      if (v4 >= v5) {
        self->_uint64_t growthStage = 2;
      }
      double v6 = self->_currentKeepAliveInterval;
      uint64_t v7 = (uint64_t)(v6 + *(double *)&PCInitialGrowthIncrement);
      if (v6 > self->_highWatermark) {
        self->_highWatermark = v6;
      }
      double v8 = (double)v7;
      if (self->_initialGrowthStageHighWatermark < (double)v7) {
        self->_initialGrowthStageLastAttempt = v8;
      }
      if (self->_currentKeepAliveAlgorithmMode == 1)
      {
        [(PCMultiStageGrowthAlgorithm *)self serverStatsExpectedKeepAliveInterval];
        if (v9 < v8) {
          self->_uint64_t growthStage = 1;
        }
      }
      [(PCMultiStageGrowthAlgorithm *)self _setCurrentKeepAliveInterval:1 varianceMode:v8];
      break;
  }
}

- (void)_processBackoffAction:(int)a3
{
  switch(a3)
  {
    case 2:
      if (self->_isServerOriginatedKeepAlive) {
        [(PCMultiStageGrowthAlgorithm *)self _fallbackToLastSuccessfulKeepAliveInterval];
      }
      break;
    case 1:
      [(PCMultiStageGrowthAlgorithm *)self _setCurrentKeepAliveInterval:0 varianceMode:self->_currentKeepAliveInterval * *(double *)&PCBackoffMultiple];
      break;
    case 0:
      self->_uint64_t growthStage = 0;
      -[PCMultiStageGrowthAlgorithm processNextAction:](self, "processNextAction:");
      break;
  }
}

- (void)_processSteadyStateAction:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      leaveSteadyStateDate = self->_leaveSteadyStateDate;
      self->_leaveSteadyStateDate = 0;

      if (self->_minimumIntervalFallbackEnabled && !self->_leaveMinimumIntervalFallbackStateDate)
      {
        [(PCMultiStageGrowthAlgorithm *)self maximumKeepAliveInterval];
        self->_previousMaximumKeepAliveInterval = v22;
        [(PCMultiStageGrowthAlgorithm *)self setMaximumKeepAliveInterval:self->_minimumKeepAliveInterval];
        double v23 = (NSDate *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:self->_minimumIntervalFallbackStateTimeout];
        leaveMinimumIntervalFallbackStateDate = self->_leaveMinimumIntervalFallbackStateDate;
        self->_leaveMinimumIntervalFallbackStateDate = v23;

        self->_uint64_t growthStage = 4;
      }
      else
      {
        self->_uint64_t growthStage = 3;
        [(PCMultiStageGrowthAlgorithm *)self processNextAction:1];
      }
      return;
    }
    if (a3) {
      return;
    }
  }
  double v5 = self->_leaveSteadyStateDate;
  if (v5)
  {
    [(NSDate *)v5 timeIntervalSinceNow];
    if (v6 < 0.0)
    {
      logObject = self->_logObject;
      if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
      {
        algorithmName = self->_algorithmName;
        int v25 = 138543362;
        BOOL v26 = algorithmName;
        _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%{public}@: leaving the steady state and trying to grow again", (uint8_t *)&v25, 0xCu);
      }
      self->_uint64_t growthStage = 1;
      double v9 = self->_leaveSteadyStateDate;
      self->_leaveSteadyStateDate = 0;

      [(PCMultiStageGrowthAlgorithm *)self processNextAction:v3];
      return;
    }
    if (self->_leaveSteadyStateDate) {
      return;
    }
  }
  double highWatermark = self->_highWatermark;
  if (highWatermark > 0.0 && self->_currentKeepAliveInterval >= highWatermark - *(double *)&PCHighWatermarkThreshold)
  {
    [(PCMultiStageGrowthAlgorithm *)self _steadyStateTimeout];
    double v15 = v16;
  }
  else
  {
    double v12 = self->_logObject;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = self->_algorithmName;
      double v14 = self->_highWatermark;
      int v25 = 138543618;
      BOOL v26 = v13;
      __int16 v27 = 2048;
      double v28 = v14;
      _os_log_impl(&dword_1D340D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: using double the current interval for the steady state timer interval since we are significantly below the high watermark of %g seconds", (uint8_t *)&v25, 0x16u);
    }
    double v15 = self->_currentKeepAliveInterval + self->_currentKeepAliveInterval;
    self->_double highWatermark = 0.0;
  }
  __int16 v17 = (NSDate *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:v15];
  uint64_t v18 = self->_leaveSteadyStateDate;
  self->_leaveSteadyStateDate = v17;

  uint64_t v19 = self->_logObject;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = self->_algorithmName;
    v21 = self->_leaveSteadyStateDate;
    int v25 = 138543618;
    BOOL v26 = v20;
    __int16 v27 = 2114;
    double v28 = *(double *)&v21;
    _os_log_impl(&dword_1D340D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: set the steady state expiration date to %{public}@", (uint8_t *)&v25, 0x16u);
  }
}

- (void)_processMinimumIntervalFallbackStateAction:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  leaveMinimumIntervalFallbackStateDate = self->_leaveMinimumIntervalFallbackStateDate;
  if (!leaveMinimumIntervalFallbackStateDate)
  {
    double previousMaximumKeepAliveInterval = self->_previousMaximumKeepAliveInterval;
    [(PCMultiStageGrowthAlgorithm *)self maximumKeepAliveInterval];
    if (previousMaximumKeepAliveInterval <= v14) {
      goto LABEL_17;
    }
    [(PCMultiStageGrowthAlgorithm *)self setMaximumKeepAliveInterval:self->_previousMaximumKeepAliveInterval];
    logObject = self->_logObject;
    if (!os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    double v16 = self->_previousMaximumKeepAliveInterval;
    *(_DWORD *)__int16 v27 = 138412546;
    *(void *)&v27[4] = self;
    *(_WORD *)&v27[12] = 2048;
    *(double *)&v27[14] = v16;
    __int16 v17 = "%@ _leaveMinimumIntervalFallbackStateDate is nil. Leave minimumIntervalFallbackState. Changing maximum keep al"
          "ive interval back to %f";
    goto LABEL_9;
  }
  [(NSDate *)leaveMinimumIntervalFallbackStateDate timeIntervalSinceNow];
  double v6 = self->_leaveMinimumIntervalFallbackStateDate;
  if (v7 > self->_minimumIntervalFallbackStateTimeout)
  {
    double v8 = v6;
    double v9 = (NSDate *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:self->_minimumIntervalFallbackStateTimeout];
    double v10 = self->_leaveMinimumIntervalFallbackStateDate;
    self->_leaveMinimumIntervalFallbackStateDate = v9;

    double v11 = self->_logObject;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      double v12 = self->_leaveMinimumIntervalFallbackStateDate;
      *(_DWORD *)__int16 v27 = 138412802;
      *(void *)&v27[4] = self;
      *(_WORD *)&v27[12] = 2112;
      *(void *)&v27[14] = v8;
      *(_WORD *)&v27[22] = 2112;
      double v28 = v12;
      _os_log_impl(&dword_1D340D000, v11, OS_LOG_TYPE_DEFAULT, "%@ Unexpected _leaveMinimumIntervalFallbackStateDate %@ in MinimumIntervalFallbackState, changing to %@", v27, 0x20u);
    }

    return;
  }
  [(NSDate *)v6 timeIntervalSinceNow];
  if (v18 >= 0.0) {
    return;
  }
  if (v3 == 2)
  {
LABEL_14:
    uint64_t v19 = self->_leaveMinimumIntervalFallbackStateDate;
    self->_leaveMinimumIntervalFallbackStateDate = 0;

    double v20 = self->_previousMaximumKeepAliveInterval;
    [(PCMultiStageGrowthAlgorithm *)self maximumKeepAliveInterval];
    if (v20 <= v21) {
      goto LABEL_17;
    }
    [(PCMultiStageGrowthAlgorithm *)self setMaximumKeepAliveInterval:self->_previousMaximumKeepAliveInterval];
    logObject = self->_logObject;
    if (!os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    double v22 = self->_previousMaximumKeepAliveInterval;
    *(_DWORD *)__int16 v27 = 138412546;
    *(void *)&v27[4] = self;
    *(_WORD *)&v27[12] = 2048;
    *(double *)&v27[14] = v22;
    __int16 v17 = "%@ Leave minimumIntervalFallbackState. Changing maximum keep alive interval back to %f";
LABEL_9:
    _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, v17, v27, 0x16u);
LABEL_17:
    self->_uint64_t growthStage = 1;
    -[PCMultiStageGrowthAlgorithm processNextAction:](self, "processNextAction:", v3, *(_OWORD *)v27, *(void *)&v27[16]);
    return;
  }
  if (v3 != 1)
  {
    if (v3) {
      return;
    }
    goto LABEL_14;
  }
  double v23 = (NSDate *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:self->_minimumIntervalFallbackStateTimeout];
  v24 = self->_leaveMinimumIntervalFallbackStateDate;
  self->_leaveMinimumIntervalFallbackStateDate = v23;

  int v25 = self->_logObject;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v26 = self->_leaveMinimumIntervalFallbackStateDate;
    *(_DWORD *)__int16 v27 = 138412546;
    *(void *)&v27[4] = self;
    *(_WORD *)&v27[12] = 2112;
    *(void *)&v27[14] = v26;
    _os_log_impl(&dword_1D340D000, v25, OS_LOG_TYPE_DEFAULT, "%@ receive shrink right after previous MinimumIntervalFallbackState ends, extend leaveMinimumIntervalFallbackStateDate to %@", v27, 0x16u);
  }
}

- (void)_processRefinedGrowthAction:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 2:
      if (self->_isServerOriginatedKeepAlive)
      {
        [(PCMultiStageGrowthAlgorithm *)self _fallbackToLastSuccessfulKeepAliveInterval];
      }
      break;
    case 1:
      [(PCMultiStageGrowthAlgorithm *)self _fallbackToLastSuccessfulKeepAliveInterval];
      self->_uint64_t growthStage = 2;
      [(PCMultiStageGrowthAlgorithm *)self processNextAction:0];
      break;
    case 0:
      double currentKeepAliveInterval = self->_currentKeepAliveInterval;
      if (self->_currentKeepAliveAlgorithmMode == 1
        || ((double v5 = self->_initialGrowthStageLastAttempt, currentKeepAliveInterval >= v5)
          ? (BOOL v6 = v5 <= 2.22044605e-16)
          : (BOOL v6 = 1),
            v6))
      {
        if (currentKeepAliveInterval > self->_highWatermark) {
          self->_double highWatermark = currentKeepAliveInterval;
        }
        double v7 = *(double *)&PCRefinedGrowthIncrement;
        double v8 = (double)(uint64_t)(currentKeepAliveInterval + *(double *)&PCRefinedGrowthIncrement);
        -[PCMultiStageGrowthAlgorithm _setCurrentKeepAliveInterval:varianceMode:](self, "_setCurrentKeepAliveInterval:varianceMode:", 1, v8, v7);
      }
      else
      {
        logObject = self->_logObject;
        if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
        {
          algorithmName = self->_algorithmName;
          double initialGrowthStageLastAttempt = self->_initialGrowthStageLastAttempt;
          int v13 = 138543618;
          double v14 = algorithmName;
          __int16 v15 = 2048;
          double v16 = initialGrowthStageLastAttempt;
          _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%{public}@: surpassed where the previous initial growth stopped at %g; reverting to initial growth.",
            (uint8_t *)&v13,
            0x16u);
        }
        self->_uint64_t growthStage = 0;
        [(PCMultiStageGrowthAlgorithm *)self processNextAction:0];
      }
      break;
  }
}

- (void)_processInitialShrinkAction:(int)a3
{
  if (a3 == 1)
  {
    if (self->_serverStatsExpectedKeepAliveInterval >= (double)(uint64_t)(self->_currentKeepAliveInterval + -300.0)) {
      self->_uint64_t growthStage = 6;
    }
    -[PCMultiStageGrowthAlgorithm _setCurrentKeepAliveInterval:varianceMode:](self, "_setCurrentKeepAliveInterval:varianceMode:", 2);
  }
  else if (!a3)
  {
    self->_uint64_t growthStage = 2;
    double currentKeepAliveInterval = self->_currentKeepAliveInterval;
    if (currentKeepAliveInterval > self->_highWatermark) {
      self->_double highWatermark = currentKeepAliveInterval;
    }
    [(PCMultiStageGrowthAlgorithm *)self processNextAction:0];
  }
}

- (void)_processRefinedShrinkAction:(int)a3
{
  if (a3 == 1)
  {
    if (self->_serverStatsExpectedKeepAliveInterval >= (double)(uint64_t)(self->_currentKeepAliveInterval + -120.0)) {
      self->_uint64_t growthStage = 6;
    }
    -[PCMultiStageGrowthAlgorithm _setCurrentKeepAliveInterval:varianceMode:](self, "_setCurrentKeepAliveInterval:varianceMode:", 2);
  }
  else if (!a3)
  {
    self->_uint64_t growthStage = 2;
    double currentKeepAliveInterval = self->_currentKeepAliveInterval;
    if (currentKeepAliveInterval > self->_highWatermark) {
      self->_double highWatermark = currentKeepAliveInterval;
    }
    [(PCMultiStageGrowthAlgorithm *)self processNextAction:0];
  }
}

- (double)_steadyStateTimeout
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_currentKeepAliveInterval * 24.0 >= 3600.0) {
    double v3 = self->_currentKeepAliveInterval * 24.0;
  }
  else {
    double v3 = 3600.0;
  }
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    algorithmName = self->_algorithmName;
    double currentKeepAliveInterval = self->_currentKeepAliveInterval;
    int v8 = 138543874;
    double v9 = algorithmName;
    __int16 v10 = 2048;
    double v11 = v3;
    __int16 v12 = 2048;
    double v13 = currentKeepAliveInterval;
    _os_log_impl(&dword_1D340D000, logObject, OS_LOG_TYPE_DEFAULT, "%{public}@: using a steady state timeout of %g for current interval %g", (uint8_t *)&v8, 0x20u);
  }
  return v3;
}

+ (void)_loadDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PCMultiStageGrowthAlgorithm__loadDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_loadDefaults_pred != -1) {
    dispatch_once(&_loadDefaults_pred, block);
  }
}

uint64_t __44__PCMultiStageGrowthAlgorithm__loadDefaults__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadDefaultValue:&PCDefaultMinimumKeepAliveInterval forKey:@"PCDefaultMinimumKeepAliveInterval"];
  [*(id *)(a1 + 32) _loadDefaultValue:&PCDefaultMaximumKeepAliveInterval forKey:@"PCDefaultMaximumKeepAliveInterval"];
  [*(id *)(a1 + 32) _loadDefaultValue:&PCDefaultInitialKeepAliveInterval forKey:@"PCDefaultInitialKeepAliveInterval"];
  [*(id *)(a1 + 32) _loadDefaultValue:&PCInitialGrowthIncrement forKey:@"PCInitialGrowthIncrement"];
  [*(id *)(a1 + 32) _loadDefaultValue:&PCRefinedGrowthIncrement forKey:@"PCRefinedGrowthIncrement"];
  [*(id *)(a1 + 32) _loadDefaultValue:&PCIncrementRandomVariance forKey:@"PCIncrementRandomVariance"];
  [*(id *)(a1 + 32) _loadDefaultValue:&PCBackoffMultiple forKey:@"PCBackoffMultiple"];
  v2 = *(void **)(a1 + 32);
  return [v2 _loadDefaultValue:&PCHighWatermarkThreshold forKey:@"PCHighWatermarkThreshold"];
}

+ (void)_loadDefaultValue:(double *)a3 forKey:(__CFString *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void *)CFPreferencesCopyAppValue(a4, @"com.apple.persistentconnection");
  if (v6)
  {
    double v7 = v6;
    [v6 doubleValue];
    double v9 = v8;
    if (v8 > 2.22044605e-16)
    {
      __int16 v10 = +[PCLog timer];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543618;
        __int16 v12 = a4;
        __int16 v13 = 2048;
        double v14 = v9;
        _os_log_impl(&dword_1D340D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: %0.2f", (uint8_t *)&v11, 0x16u);
      }

      *a3 = v9;
    }
    CFRelease(v7);
  }
}

- (NSString)description
{
  double v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PCMultiStageGrowthAlgorithm;
  double v4 = [(PCMultiStageGrowthAlgorithm *)&v9 description];
  double currentKeepAliveInterval = self->_currentKeepAliveInterval;
  BOOL v6 = [(PCMultiStageGrowthAlgorithm *)self _stringForStage:self->_growthStage];
  double v7 = [v3 stringWithFormat:@"%@{keep alive interval = %g, state = %@, next recalibration date = %@}", v4, *(void *)&currentKeepAliveInterval, v6, self->_leaveSteadyStateDate];

  return (NSString *)v7;
}

- (id)_stringForAction:(int)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_1E698DE18[a3];
  }
}

- (id)_stringForStage:(int)a3
{
  if (a3 > 6) {
    return 0;
  }
  else {
    return off_1E698DE38[a3];
  }
}

- (id)_stringForMode:(int)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_1E698DE70[a3];
  }
}

- (unint64_t)countOfGrowthActions
{
  return self->_countOfGrowthActions;
}

- (double)currentKeepAliveInterval
{
  return self->_currentKeepAliveInterval;
}

- (double)lastSuccessfulKeepAliveInterval
{
  return self->_lastSuccessfulKeepAliveInterval;
}

- (BOOL)isServerOriginatedKeepAlive
{
  return self->_isServerOriginatedKeepAlive;
}

- (void)setIsServerOriginatedKeepAlive:(BOOL)a3
{
  self->_isServerOriginatedKeepAlive = a3;
}

- (BOOL)minimumIntervalFallbackEnabled
{
  return self->_minimumIntervalFallbackEnabled;
}

- (int)growthStage
{
  return self->_growthStage;
}

- (double)serverStatsMinKeepAliveInterval
{
  return self->_serverStatsMinKeepAliveInterval;
}

- (void)setServerStatsMinKeepAliveInterval:(double)a3
{
  self->_serverStatsMinKeepAliveInterval = a3;
}

- (double)serverStatsExpectedKeepAliveInterval
{
  return self->_serverStatsExpectedKeepAliveInterval;
}

- (void)setServerStatsExpectedKeepAliveInterval:(double)a3
{
  self->_serverStatsExpectedKeepAliveInterval = a3;
}

- (double)serverStatsMaxKeepAliveInterval
{
  return self->_serverStatsMaxKeepAliveInterval;
}

- (void)setServerStatsMaxKeepAliveInterval:(double)a3
{
  self->_serverStatsMaxKeepAliveInterval = a3;
}

- (BOOL)usingServerStatsAggressively
{
  return self->_usingServerStatsAggressively;
}

- (void)setUsingServerStatsAggressively:(BOOL)a3
{
  self->_usingServerStatsAggressively = a3;
}

- (double)minimumIntervalFallbackStateTimeout
{
  return self->_minimumIntervalFallbackStateTimeout;
}

- (void)setMinimumIntervalFallbackStateTimeout:(double)a3
{
  self->_minimumIntervalFallbackStateTimeout = a3;
}

- (_PCTimeRange)signalAvoidanceRange
{
  double start = self->_signalAvoidanceRange.start;
  double duration = self->_signalAvoidanceRange.duration;
  result.double duration = duration;
  result.double start = start;
  return result;
}

- (void)setSignalAvoidanceRange:(_PCTimeRange)a3
{
  self->_signalAvoidanceRange = a3;
}

- (int)previousAction
{
  return self->_previousAction;
}

- (void)setPreviousAction:(int)a3
{
  self->_previousAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logObject, 0);
  objc_storeStrong((id *)&self->_algorithmName, 0);
  objc_storeStrong((id *)&self->_leaveMinimumIntervalFallbackStateDate, 0);
  objc_storeStrong((id *)&self->_leaveSteadyStateDate, 0);
}

@end