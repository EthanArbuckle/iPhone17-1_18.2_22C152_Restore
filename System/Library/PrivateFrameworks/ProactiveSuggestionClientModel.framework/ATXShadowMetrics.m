@interface ATXShadowMetrics
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXShadowMetrics:(id)a3;
- (double)meanReciprocalRank;
- (double)precisionAllCachedPredictions;
- (double)precisionAtTop1CachedPrediction;
- (double)precisionAtTop2CachedPredictions;
- (double)precisionAtTop4CachedPredictions;
- (double)precisionAtTop8CachedPredictions;
- (double)precisionOfHighConfidenceCachedPredictions;
- (double)precisionOfLowConfidenceCachedPredictions;
- (double)precisionOfMediumConfidenceCachedPredictions;
- (double)recallAllCachedPredictions;
- (double)recallAtTop1CachedPrediction;
- (double)recallAtTop2CachedPredictions;
- (double)recallAtTop4CachedPredictions;
- (double)recallAtTop8CachedPredictions;
- (double)recallOfHighConfidenceCachedPredictions;
- (double)recallOfLowConfidenceCachedPredictions;
- (double)recallOfMediumConfidenceCachedPredictions;
- (double)sumOfShadowEventCacheHitReciprocalRanks;
- (id)asCoreAnalyticsMessageWithModelId:(id)a3 executableType:(int64_t)a4;
- (unint64_t)hash;
- (unint64_t)numberOfCachedHighConfidencePredictions;
- (unint64_t)numberOfCachedLowConfidencePredictions;
- (unint64_t)numberOfCachedMediumConfidencePredictions;
- (unint64_t)numberOfCachedPredictions;
- (unint64_t)numberOfCorrectCachedPredictions;
- (unint64_t)numberOfCorrectHighConfidenceCachedPredictions;
- (unint64_t)numberOfCorrectLowConfidenceCachedPredictions;
- (unint64_t)numberOfCorrectMediumConfidenceCachedPredictions;
- (unint64_t)numberOfCorrectTop1CachedPrediction;
- (unint64_t)numberOfCorrectTop2CachedPredictions;
- (unint64_t)numberOfCorrectTop4CachedPredictions;
- (unint64_t)numberOfCorrectTop8CachedPredictions;
- (unint64_t)numberOfPredictionCacheRefreshes;
- (unint64_t)numberOfShadowEventCacheHits;
- (unint64_t)numberOfShadowEventHighConfidenceCacheHits;
- (unint64_t)numberOfShadowEventLowConfidenceCacheHits;
- (unint64_t)numberOfShadowEventMediumConfidenceCacheHits;
- (unint64_t)numberOfShadowEventTop1CacheHits;
- (unint64_t)numberOfShadowEventTop2CacheHits;
- (unint64_t)numberOfShadowEventTop4CacheHits;
- (unint64_t)numberOfShadowEventTop8CacheHits;
- (unint64_t)numberOfShadowEvents;
- (void)meanReciprocalRank;
- (void)precisionAllCachedPredictions;
- (void)precisionAtTop1CachedPrediction;
- (void)precisionAtTop2CachedPredictions;
- (void)precisionAtTop4CachedPredictions;
- (void)precisionAtTop8CachedPredictions;
- (void)precisionOfHighConfidenceCachedPredictions;
- (void)precisionOfLowConfidenceCachedPredictions;
- (void)precisionOfMediumConfidenceCachedPredictions;
- (void)recallAllCachedPredictions;
- (void)recallAtTop1CachedPrediction;
- (void)recallAtTop2CachedPredictions;
- (void)recallAtTop4CachedPredictions;
- (void)recallAtTop8CachedPredictions;
- (void)recallOfHighConfidenceCachedPredictions;
- (void)recallOfLowConfidenceCachedPredictions;
- (void)recallOfMediumConfidenceCachedPredictions;
- (void)setNumberOfCachedHighConfidencePredictions:(unint64_t)a3;
- (void)setNumberOfCachedLowConfidencePredictions:(unint64_t)a3;
- (void)setNumberOfCachedMediumConfidencePredictions:(unint64_t)a3;
- (void)setNumberOfCachedPredictions:(unint64_t)a3;
- (void)setNumberOfCorrectCachedPredictions:(unint64_t)a3;
- (void)setNumberOfCorrectHighConfidenceCachedPredictions:(unint64_t)a3;
- (void)setNumberOfCorrectLowConfidenceCachedPredictions:(unint64_t)a3;
- (void)setNumberOfCorrectMediumConfidenceCachedPredictions:(unint64_t)a3;
- (void)setNumberOfCorrectTop1CachedPrediction:(unint64_t)a3;
- (void)setNumberOfCorrectTop2CachedPredictions:(unint64_t)a3;
- (void)setNumberOfCorrectTop4CachedPredictions:(unint64_t)a3;
- (void)setNumberOfCorrectTop8CachedPredictions:(unint64_t)a3;
- (void)setNumberOfPredictionCacheRefreshes:(unint64_t)a3;
- (void)setNumberOfShadowEventCacheHits:(unint64_t)a3;
- (void)setNumberOfShadowEventHighConfidenceCacheHits:(unint64_t)a3;
- (void)setNumberOfShadowEventLowConfidenceCacheHits:(unint64_t)a3;
- (void)setNumberOfShadowEventMediumConfidenceCacheHits:(unint64_t)a3;
- (void)setNumberOfShadowEventTop1CacheHits:(unint64_t)a3;
- (void)setNumberOfShadowEventTop2CacheHits:(unint64_t)a3;
- (void)setNumberOfShadowEventTop4CacheHits:(unint64_t)a3;
- (void)setNumberOfShadowEventTop8CacheHits:(unint64_t)a3;
- (void)setNumberOfShadowEvents:(unint64_t)a3;
- (void)setSumOfShadowEventCacheHitReciprocalRanks:(double)a3;
@end

@implementation ATXShadowMetrics

- (double)precisionAtTop1CachedPrediction
{
  unint64_t numberOfCachedPredictions = self->_numberOfCachedPredictions;
  unint64_t numberOfCorrectTop1CachedPrediction = self->_numberOfCorrectTop1CachedPrediction;
  if (numberOfCachedPredictions) {
    return (double)numberOfCorrectTop1CachedPrediction / (double)numberOfCachedPredictions;
  }
  double v4 = 0.0;
  if (numberOfCorrectTop1CachedPrediction)
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(ATXShadowMetrics *)v5 precisionAtTop1CachedPrediction];
    }
  }
  return v4;
}

- (double)precisionAtTop2CachedPredictions
{
  unint64_t numberOfCachedPredictions = self->_numberOfCachedPredictions;
  unint64_t numberOfCorrectTop2CachedPredictions = self->_numberOfCorrectTop2CachedPredictions;
  if (numberOfCachedPredictions) {
    return (double)numberOfCorrectTop2CachedPredictions / (double)numberOfCachedPredictions;
  }
  double v4 = 0.0;
  if (numberOfCorrectTop2CachedPredictions)
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(ATXShadowMetrics *)v5 precisionAtTop2CachedPredictions];
    }
  }
  return v4;
}

- (double)precisionAtTop4CachedPredictions
{
  unint64_t numberOfCachedPredictions = self->_numberOfCachedPredictions;
  unint64_t numberOfCorrectTop4CachedPredictions = self->_numberOfCorrectTop4CachedPredictions;
  if (numberOfCachedPredictions) {
    return (double)numberOfCorrectTop4CachedPredictions / (double)numberOfCachedPredictions;
  }
  double v4 = 0.0;
  if (numberOfCorrectTop4CachedPredictions)
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(ATXShadowMetrics *)v5 precisionAtTop4CachedPredictions];
    }
  }
  return v4;
}

- (double)precisionAtTop8CachedPredictions
{
  unint64_t numberOfCachedPredictions = self->_numberOfCachedPredictions;
  unint64_t numberOfCorrectTop8CachedPredictions = self->_numberOfCorrectTop8CachedPredictions;
  if (numberOfCachedPredictions) {
    return (double)numberOfCorrectTop8CachedPredictions / (double)numberOfCachedPredictions;
  }
  double v4 = 0.0;
  if (numberOfCorrectTop8CachedPredictions)
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(ATXShadowMetrics *)v5 precisionAtTop8CachedPredictions];
    }
  }
  return v4;
}

- (double)precisionOfHighConfidenceCachedPredictions
{
  unint64_t numberOfCachedHighConfidencePredictions = self->_numberOfCachedHighConfidencePredictions;
  unint64_t numberOfCorrectHighConfidenceCachedPredictions = self->_numberOfCorrectHighConfidenceCachedPredictions;
  if (numberOfCachedHighConfidencePredictions) {
    return (double)numberOfCorrectHighConfidenceCachedPredictions / (double)numberOfCachedHighConfidencePredictions;
  }
  double v4 = 0.0;
  if (numberOfCorrectHighConfidenceCachedPredictions)
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(ATXShadowMetrics *)v5 precisionOfHighConfidenceCachedPredictions];
    }
  }
  return v4;
}

- (double)precisionOfMediumConfidenceCachedPredictions
{
  unint64_t numberOfCachedMediumConfidencePredictions = self->_numberOfCachedMediumConfidencePredictions;
  unint64_t numberOfCorrectMediumConfidenceCachedPredictions = self->_numberOfCorrectMediumConfidenceCachedPredictions;
  if (numberOfCachedMediumConfidencePredictions) {
    return (double)numberOfCorrectMediumConfidenceCachedPredictions / (double)numberOfCachedMediumConfidencePredictions;
  }
  double v4 = 0.0;
  if (numberOfCorrectMediumConfidenceCachedPredictions)
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(ATXShadowMetrics *)v5 precisionOfMediumConfidenceCachedPredictions];
    }
  }
  return v4;
}

- (double)precisionOfLowConfidenceCachedPredictions
{
  unint64_t numberOfCachedLowConfidencePredictions = self->_numberOfCachedLowConfidencePredictions;
  unint64_t numberOfCorrectLowConfidenceCachedPredictions = self->_numberOfCorrectLowConfidenceCachedPredictions;
  if (numberOfCachedLowConfidencePredictions) {
    return (double)numberOfCorrectLowConfidenceCachedPredictions / (double)numberOfCachedLowConfidencePredictions;
  }
  double v4 = 0.0;
  if (numberOfCorrectLowConfidenceCachedPredictions)
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(ATXShadowMetrics *)v5 precisionOfLowConfidenceCachedPredictions];
    }
  }
  return v4;
}

- (double)precisionAllCachedPredictions
{
  unint64_t numberOfCorrectCachedPredictions = self->_numberOfCorrectCachedPredictions;
  unint64_t numberOfCachedPredictions = self->_numberOfCachedPredictions;
  if (numberOfCachedPredictions) {
    return (double)numberOfCorrectCachedPredictions / (double)numberOfCachedPredictions;
  }
  double v4 = 0.0;
  if (numberOfCorrectCachedPredictions)
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(ATXShadowMetrics *)v5 precisionAllCachedPredictions];
    }
  }
  return v4;
}

- (double)recallAtTop1CachedPrediction
{
  unint64_t numberOfShadowEvents = self->_numberOfShadowEvents;
  unint64_t numberOfShadowEventTop1CacheHits = self->_numberOfShadowEventTop1CacheHits;
  if (numberOfShadowEvents) {
    return (double)numberOfShadowEventTop1CacheHits / (double)numberOfShadowEvents;
  }
  double v4 = 0.0;
  if (numberOfShadowEventTop1CacheHits)
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(ATXShadowMetrics *)v5 recallAtTop1CachedPrediction];
    }
  }
  return v4;
}

- (double)recallAtTop2CachedPredictions
{
  unint64_t numberOfShadowEvents = self->_numberOfShadowEvents;
  unint64_t numberOfShadowEventTop2CacheHits = self->_numberOfShadowEventTop2CacheHits;
  if (numberOfShadowEvents) {
    return (double)numberOfShadowEventTop2CacheHits / (double)numberOfShadowEvents;
  }
  double v4 = 0.0;
  if (numberOfShadowEventTop2CacheHits)
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(ATXShadowMetrics *)v5 recallAtTop2CachedPredictions];
    }
  }
  return v4;
}

- (double)recallAtTop4CachedPredictions
{
  unint64_t numberOfShadowEvents = self->_numberOfShadowEvents;
  unint64_t numberOfShadowEventTop4CacheHits = self->_numberOfShadowEventTop4CacheHits;
  if (numberOfShadowEvents) {
    return (double)numberOfShadowEventTop4CacheHits / (double)numberOfShadowEvents;
  }
  double v4 = 0.0;
  if (numberOfShadowEventTop4CacheHits)
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(ATXShadowMetrics *)v5 recallAtTop4CachedPredictions];
    }
  }
  return v4;
}

- (double)recallAtTop8CachedPredictions
{
  unint64_t numberOfShadowEvents = self->_numberOfShadowEvents;
  unint64_t numberOfShadowEventTop8CacheHits = self->_numberOfShadowEventTop8CacheHits;
  if (numberOfShadowEvents) {
    return (double)numberOfShadowEventTop8CacheHits / (double)numberOfShadowEvents;
  }
  double v4 = 0.0;
  if (numberOfShadowEventTop8CacheHits)
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(ATXShadowMetrics *)v5 recallAtTop8CachedPredictions];
    }
  }
  return v4;
}

- (double)recallOfHighConfidenceCachedPredictions
{
  unint64_t numberOfShadowEvents = self->_numberOfShadowEvents;
  unint64_t numberOfShadowEventHighConfidenceCacheHits = self->_numberOfShadowEventHighConfidenceCacheHits;
  if (numberOfShadowEvents) {
    return (double)numberOfShadowEventHighConfidenceCacheHits / (double)numberOfShadowEvents;
  }
  double v4 = 0.0;
  if (numberOfShadowEventHighConfidenceCacheHits)
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(ATXShadowMetrics *)v5 recallOfHighConfidenceCachedPredictions];
    }
  }
  return v4;
}

- (double)recallOfMediumConfidenceCachedPredictions
{
  unint64_t numberOfShadowEvents = self->_numberOfShadowEvents;
  unint64_t numberOfShadowEventMediumConfidenceCacheHits = self->_numberOfShadowEventMediumConfidenceCacheHits;
  if (numberOfShadowEvents) {
    return (double)numberOfShadowEventMediumConfidenceCacheHits / (double)numberOfShadowEvents;
  }
  double v4 = 0.0;
  if (numberOfShadowEventMediumConfidenceCacheHits)
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(ATXShadowMetrics *)v5 recallOfMediumConfidenceCachedPredictions];
    }
  }
  return v4;
}

- (double)recallOfLowConfidenceCachedPredictions
{
  unint64_t numberOfShadowEvents = self->_numberOfShadowEvents;
  unint64_t numberOfShadowEventLowConfidenceCacheHits = self->_numberOfShadowEventLowConfidenceCacheHits;
  if (numberOfShadowEvents) {
    return (double)numberOfShadowEventLowConfidenceCacheHits / (double)numberOfShadowEvents;
  }
  double v4 = 0.0;
  if (numberOfShadowEventLowConfidenceCacheHits)
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(ATXShadowMetrics *)v5 recallOfLowConfidenceCachedPredictions];
    }
  }
  return v4;
}

- (double)recallAllCachedPredictions
{
  unint64_t numberOfShadowEventCacheHits = self->_numberOfShadowEventCacheHits;
  unint64_t numberOfShadowEvents = self->_numberOfShadowEvents;
  if (numberOfShadowEvents) {
    return (double)numberOfShadowEventCacheHits / (double)numberOfShadowEvents;
  }
  double v4 = 0.0;
  if (numberOfShadowEventCacheHits)
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(ATXShadowMetrics *)v5 recallAllCachedPredictions];
    }
  }
  return v4;
}

- (double)meanReciprocalRank
{
  unint64_t numberOfShadowEventCacheHits = self->_numberOfShadowEventCacheHits;
  double sumOfShadowEventCacheHitReciprocalRanks = self->_sumOfShadowEventCacheHitReciprocalRanks;
  if (numberOfShadowEventCacheHits) {
    return sumOfShadowEventCacheHitReciprocalRanks / (double)numberOfShadowEventCacheHits;
  }
  double v4 = 0.0;
  if (sumOfShadowEventCacheHitReciprocalRanks != 0.0)
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(ATXShadowMetrics *)v5 meanReciprocalRank];
    }
  }
  return v4;
}

- (id)asCoreAnalyticsMessageWithModelId:(id)a3 executableType:(int64_t)a4
{
  v52[25] = *MEMORY[0x1E4F143B8];
  v52[0] = a3;
  v51[0] = @"modelID";
  v51[1] = @"executableType";
  uint64_t v6 = NSNumber;
  id v45 = a3;
  v50 = [v6 numberWithInteger:a4];
  v52[1] = v50;
  v51[2] = @"cacheHitMRR";
  uint64_t v7 = NSNumber;
  [(ATXShadowMetrics *)self meanReciprocalRank];
  v49 = objc_msgSend(v7, "numberWithDouble:");
  v52[2] = v49;
  v51[3] = @"numEvent";
  v48 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXShadowMetrics numberOfShadowEvents](self, "numberOfShadowEvents"));
  v52[3] = v48;
  v51[4] = @"numPrediction";
  v47 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXShadowMetrics numberOfCachedPredictions](self, "numberOfCachedPredictions"));
  v52[4] = v47;
  v51[5] = @"numPredictionHConf";
  v46 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXShadowMetrics numberOfCachedHighConfidencePredictions](self, "numberOfCachedHighConfidencePredictions"));
  v52[5] = v46;
  v51[6] = @"numPredictionLConf";
  v44 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXShadowMetrics numberOfCachedLowConfidencePredictions](self, "numberOfCachedLowConfidencePredictions"));
  v52[6] = v44;
  v51[7] = @"numPredictionMConf";
  v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXShadowMetrics numberOfCachedMediumConfidencePredictions](self, "numberOfCachedMediumConfidencePredictions"));
  v52[7] = v43;
  v51[8] = @"numRefresh";
  v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXShadowMetrics numberOfPredictionCacheRefreshes](self, "numberOfPredictionCacheRefreshes"));
  v52[8] = v42;
  v51[9] = @"precisionAll";
  uint64_t v8 = NSNumber;
  [(ATXShadowMetrics *)self precisionAllCachedPredictions];
  v41 = objc_msgSend(v8, "numberWithDouble:");
  v52[9] = v41;
  v51[10] = @"precisionAt1";
  uint64_t v9 = NSNumber;
  [(ATXShadowMetrics *)self precisionAtTop1CachedPrediction];
  v40 = objc_msgSend(v9, "numberWithDouble:");
  v52[10] = v40;
  v51[11] = @"precisionAt2";
  uint64_t v10 = NSNumber;
  [(ATXShadowMetrics *)self precisionAtTop2CachedPredictions];
  v39 = objc_msgSend(v10, "numberWithDouble:");
  v52[11] = v39;
  v51[12] = @"precisionAt4";
  uint64_t v11 = NSNumber;
  [(ATXShadowMetrics *)self precisionAtTop4CachedPredictions];
  v38 = objc_msgSend(v11, "numberWithDouble:");
  v52[12] = v38;
  v51[13] = @"precisionAt8";
  uint64_t v12 = NSNumber;
  [(ATXShadowMetrics *)self precisionAtTop8CachedPredictions];
  v37 = objc_msgSend(v12, "numberWithDouble:");
  v52[13] = v37;
  v51[14] = @"precisionHConf";
  v13 = NSNumber;
  [(ATXShadowMetrics *)self precisionOfHighConfidenceCachedPredictions];
  v36 = objc_msgSend(v13, "numberWithDouble:");
  v52[14] = v36;
  v51[15] = @"precisionLConf";
  v14 = NSNumber;
  [(ATXShadowMetrics *)self precisionOfLowConfidenceCachedPredictions];
  v35 = objc_msgSend(v14, "numberWithDouble:");
  v52[15] = v35;
  v51[16] = @"precisionMConf";
  v15 = NSNumber;
  [(ATXShadowMetrics *)self precisionOfMediumConfidenceCachedPredictions];
  v16 = objc_msgSend(v15, "numberWithDouble:");
  v52[16] = v16;
  v51[17] = @"recallAll";
  v17 = NSNumber;
  [(ATXShadowMetrics *)self recallAllCachedPredictions];
  v18 = objc_msgSend(v17, "numberWithDouble:");
  v52[17] = v18;
  v51[18] = @"recallAt1";
  v19 = NSNumber;
  [(ATXShadowMetrics *)self recallAtTop1CachedPrediction];
  v20 = objc_msgSend(v19, "numberWithDouble:");
  v52[18] = v20;
  v51[19] = @"recallAt2";
  v21 = NSNumber;
  [(ATXShadowMetrics *)self recallAtTop2CachedPredictions];
  v22 = objc_msgSend(v21, "numberWithDouble:");
  v52[19] = v22;
  v51[20] = @"recallAt4";
  v23 = NSNumber;
  [(ATXShadowMetrics *)self recallAtTop4CachedPredictions];
  v24 = objc_msgSend(v23, "numberWithDouble:");
  v52[20] = v24;
  v51[21] = @"recallAt8";
  v25 = NSNumber;
  [(ATXShadowMetrics *)self recallAtTop8CachedPredictions];
  v26 = objc_msgSend(v25, "numberWithDouble:");
  v52[21] = v26;
  v51[22] = @"recallHConf";
  v27 = NSNumber;
  [(ATXShadowMetrics *)self recallOfHighConfidenceCachedPredictions];
  v28 = objc_msgSend(v27, "numberWithDouble:");
  v52[22] = v28;
  v51[23] = @"recallLConf";
  v29 = NSNumber;
  [(ATXShadowMetrics *)self recallOfLowConfidenceCachedPredictions];
  v30 = objc_msgSend(v29, "numberWithDouble:");
  v52[23] = v30;
  v51[24] = @"recallMConf";
  v31 = NSNumber;
  [(ATXShadowMetrics *)self recallOfMediumConfidenceCachedPredictions];
  v32 = objc_msgSend(v31, "numberWithDouble:");
  v52[24] = v32;
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:25];

  return v33;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (ATXShadowMetrics *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXShadowMetrics *)self isEqualToATXShadowMetrics:v5];

  return v6;
}

- (BOOL)isEqualToATXShadowMetrics:(id)a3
{
  double v4 = (char *)a3;
  BOOL v5 = *(_OWORD *)&self->_numberOfCorrectTop1CachedPrediction == *(_OWORD *)(v4 + 8)
    && self->_numberOfCorrectTop4CachedPredictions == *((void *)v4 + 3)
    && self->_numberOfCorrectTop8CachedPredictions == *((void *)v4 + 4)
    && self->_numberOfCorrectHighConfidenceCachedPredictions == *((void *)v4 + 5)
    && self->_numberOfCorrectMediumConfidenceCachedPredictions == *((void *)v4 + 6)
    && self->_numberOfCorrectLowConfidenceCachedPredictions == *((void *)v4 + 7)
    && self->_numberOfCorrectCachedPredictions == *((void *)v4 + 8)
    && self->_numberOfCachedPredictions == *((void *)v4 + 9)
    && self->_numberOfCachedHighConfidencePredictions == *((void *)v4 + 10)
    && self->_numberOfCachedMediumConfidencePredictions == *((void *)v4 + 11)
    && self->_numberOfCachedLowConfidencePredictions == *((void *)v4 + 12)
    && self->_numberOfShadowEventTop1CacheHits == *((void *)v4 + 13)
    && self->_numberOfShadowEventTop2CacheHits == *((void *)v4 + 14)
    && self->_numberOfShadowEventTop4CacheHits == *((void *)v4 + 15)
    && self->_numberOfShadowEventTop8CacheHits == *((void *)v4 + 16)
    && self->_numberOfShadowEventHighConfidenceCacheHits == *((void *)v4 + 17)
    && self->_numberOfShadowEventMediumConfidenceCacheHits == *((void *)v4 + 18)
    && self->_numberOfShadowEventLowConfidenceCacheHits == *((void *)v4 + 19)
    && self->_numberOfShadowEventCacheHits == *((void *)v4 + 20)
    && self->_numberOfShadowEvents == *((void *)v4 + 21)
    && self->_numberOfPredictionCacheRefreshes == *((void *)v4 + 22)
    && self->_sumOfShadowEventCacheHitReciprocalRanks == *((double *)v4 + 23);

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_numberOfCorrectTop2CachedPredictions
     - self->_numberOfCorrectTop1CachedPrediction
     + 32 * self->_numberOfCorrectTop1CachedPrediction;
  unint64_t v3 = self->_numberOfCorrectTop4CachedPredictions - v2 + 32 * v2;
  unint64_t v4 = self->_numberOfCorrectTop8CachedPredictions - v3 + 32 * v3;
  unint64_t v5 = self->_numberOfCorrectHighConfidenceCachedPredictions - v4 + 32 * v4;
  unint64_t v6 = self->_numberOfCorrectMediumConfidenceCachedPredictions - v5 + 32 * v5;
  unint64_t v7 = self->_numberOfCorrectLowConfidenceCachedPredictions - v6 + 32 * v6;
  unint64_t v8 = self->_numberOfCorrectCachedPredictions - v7 + 32 * v7;
  unint64_t v9 = self->_numberOfCachedPredictions - v8 + 32 * v8;
  unint64_t v10 = self->_numberOfCachedHighConfidencePredictions - v9 + 32 * v9;
  unint64_t v11 = self->_numberOfCachedMediumConfidencePredictions - v10 + 32 * v10;
  unint64_t v12 = self->_numberOfCachedLowConfidencePredictions - v11 + 32 * v11;
  unint64_t v13 = self->_numberOfShadowEventTop1CacheHits - v12 + 32 * v12;
  unint64_t v14 = self->_numberOfShadowEventTop2CacheHits - v13 + 32 * v13;
  unint64_t v15 = self->_numberOfShadowEventTop4CacheHits - v14 + 32 * v14;
  unint64_t v16 = self->_numberOfShadowEventTop8CacheHits - v15 + 32 * v15;
  unint64_t v17 = self->_numberOfShadowEventHighConfidenceCacheHits - v16 + 32 * v16;
  unint64_t v18 = self->_numberOfShadowEventMediumConfidenceCacheHits - v17 + 32 * v17;
  unint64_t v19 = self->_numberOfShadowEventLowConfidenceCacheHits - v18 + 32 * v18;
  unint64_t v20 = self->_numberOfShadowEventCacheHits - v19 + 32 * v19;
  unint64_t v21 = self->_numberOfShadowEvents - v20 + 32 * v20;
  unint64_t v22 = self->_numberOfPredictionCacheRefreshes - v21 + 32 * v21;
  return (unint64_t)self->_sumOfShadowEventCacheHitReciprocalRanks - v22 + 32 * v22;
}

- (unint64_t)numberOfCorrectTop1CachedPrediction
{
  return self->_numberOfCorrectTop1CachedPrediction;
}

- (void)setNumberOfCorrectTop1CachedPrediction:(unint64_t)a3
{
  self->_unint64_t numberOfCorrectTop1CachedPrediction = a3;
}

- (unint64_t)numberOfCorrectTop2CachedPredictions
{
  return self->_numberOfCorrectTop2CachedPredictions;
}

- (void)setNumberOfCorrectTop2CachedPredictions:(unint64_t)a3
{
  self->_unint64_t numberOfCorrectTop2CachedPredictions = a3;
}

- (unint64_t)numberOfCorrectTop4CachedPredictions
{
  return self->_numberOfCorrectTop4CachedPredictions;
}

- (void)setNumberOfCorrectTop4CachedPredictions:(unint64_t)a3
{
  self->_unint64_t numberOfCorrectTop4CachedPredictions = a3;
}

- (unint64_t)numberOfCorrectTop8CachedPredictions
{
  return self->_numberOfCorrectTop8CachedPredictions;
}

- (void)setNumberOfCorrectTop8CachedPredictions:(unint64_t)a3
{
  self->_unint64_t numberOfCorrectTop8CachedPredictions = a3;
}

- (unint64_t)numberOfCorrectHighConfidenceCachedPredictions
{
  return self->_numberOfCorrectHighConfidenceCachedPredictions;
}

- (void)setNumberOfCorrectHighConfidenceCachedPredictions:(unint64_t)a3
{
  self->_unint64_t numberOfCorrectHighConfidenceCachedPredictions = a3;
}

- (unint64_t)numberOfCorrectMediumConfidenceCachedPredictions
{
  return self->_numberOfCorrectMediumConfidenceCachedPredictions;
}

- (void)setNumberOfCorrectMediumConfidenceCachedPredictions:(unint64_t)a3
{
  self->_unint64_t numberOfCorrectMediumConfidenceCachedPredictions = a3;
}

- (unint64_t)numberOfCorrectLowConfidenceCachedPredictions
{
  return self->_numberOfCorrectLowConfidenceCachedPredictions;
}

- (void)setNumberOfCorrectLowConfidenceCachedPredictions:(unint64_t)a3
{
  self->_unint64_t numberOfCorrectLowConfidenceCachedPredictions = a3;
}

- (unint64_t)numberOfCorrectCachedPredictions
{
  return self->_numberOfCorrectCachedPredictions;
}

- (void)setNumberOfCorrectCachedPredictions:(unint64_t)a3
{
  self->_unint64_t numberOfCorrectCachedPredictions = a3;
}

- (unint64_t)numberOfCachedPredictions
{
  return self->_numberOfCachedPredictions;
}

- (void)setNumberOfCachedPredictions:(unint64_t)a3
{
  self->_unint64_t numberOfCachedPredictions = a3;
}

- (unint64_t)numberOfCachedHighConfidencePredictions
{
  return self->_numberOfCachedHighConfidencePredictions;
}

- (void)setNumberOfCachedHighConfidencePredictions:(unint64_t)a3
{
  self->_unint64_t numberOfCachedHighConfidencePredictions = a3;
}

- (unint64_t)numberOfCachedMediumConfidencePredictions
{
  return self->_numberOfCachedMediumConfidencePredictions;
}

- (void)setNumberOfCachedMediumConfidencePredictions:(unint64_t)a3
{
  self->_unint64_t numberOfCachedMediumConfidencePredictions = a3;
}

- (unint64_t)numberOfCachedLowConfidencePredictions
{
  return self->_numberOfCachedLowConfidencePredictions;
}

- (void)setNumberOfCachedLowConfidencePredictions:(unint64_t)a3
{
  self->_unint64_t numberOfCachedLowConfidencePredictions = a3;
}

- (unint64_t)numberOfShadowEventTop1CacheHits
{
  return self->_numberOfShadowEventTop1CacheHits;
}

- (void)setNumberOfShadowEventTop1CacheHits:(unint64_t)a3
{
  self->_unint64_t numberOfShadowEventTop1CacheHits = a3;
}

- (unint64_t)numberOfShadowEventTop2CacheHits
{
  return self->_numberOfShadowEventTop2CacheHits;
}

- (void)setNumberOfShadowEventTop2CacheHits:(unint64_t)a3
{
  self->_unint64_t numberOfShadowEventTop2CacheHits = a3;
}

- (unint64_t)numberOfShadowEventTop4CacheHits
{
  return self->_numberOfShadowEventTop4CacheHits;
}

- (void)setNumberOfShadowEventTop4CacheHits:(unint64_t)a3
{
  self->_unint64_t numberOfShadowEventTop4CacheHits = a3;
}

- (unint64_t)numberOfShadowEventTop8CacheHits
{
  return self->_numberOfShadowEventTop8CacheHits;
}

- (void)setNumberOfShadowEventTop8CacheHits:(unint64_t)a3
{
  self->_unint64_t numberOfShadowEventTop8CacheHits = a3;
}

- (unint64_t)numberOfShadowEventHighConfidenceCacheHits
{
  return self->_numberOfShadowEventHighConfidenceCacheHits;
}

- (void)setNumberOfShadowEventHighConfidenceCacheHits:(unint64_t)a3
{
  self->_unint64_t numberOfShadowEventHighConfidenceCacheHits = a3;
}

- (unint64_t)numberOfShadowEventMediumConfidenceCacheHits
{
  return self->_numberOfShadowEventMediumConfidenceCacheHits;
}

- (void)setNumberOfShadowEventMediumConfidenceCacheHits:(unint64_t)a3
{
  self->_unint64_t numberOfShadowEventMediumConfidenceCacheHits = a3;
}

- (unint64_t)numberOfShadowEventLowConfidenceCacheHits
{
  return self->_numberOfShadowEventLowConfidenceCacheHits;
}

- (void)setNumberOfShadowEventLowConfidenceCacheHits:(unint64_t)a3
{
  self->_unint64_t numberOfShadowEventLowConfidenceCacheHits = a3;
}

- (unint64_t)numberOfShadowEventCacheHits
{
  return self->_numberOfShadowEventCacheHits;
}

- (void)setNumberOfShadowEventCacheHits:(unint64_t)a3
{
  self->_unint64_t numberOfShadowEventCacheHits = a3;
}

- (unint64_t)numberOfShadowEvents
{
  return self->_numberOfShadowEvents;
}

- (void)setNumberOfShadowEvents:(unint64_t)a3
{
  self->_unint64_t numberOfShadowEvents = a3;
}

- (unint64_t)numberOfPredictionCacheRefreshes
{
  return self->_numberOfPredictionCacheRefreshes;
}

- (void)setNumberOfPredictionCacheRefreshes:(unint64_t)a3
{
  self->_numberOfPredictionCacheRefreshes = a3;
}

- (double)sumOfShadowEventCacheHitReciprocalRanks
{
  return self->_sumOfShadowEventCacheHitReciprocalRanks;
}

- (void)setSumOfShadowEventCacheHitReciprocalRanks:(double)a3
{
  self->_double sumOfShadowEventCacheHitReciprocalRanks = a3;
}

- (void)precisionAtTop1CachedPrediction
{
  OUTLINED_FUNCTION_0_10(&dword_1AE67F000, a1, a3, "%s: _numberOfCorrectTop1CachedPrediction != 0 while _numberOfCachedPredictions == 0.", a5, a6, a7, a8, 2u);
}

- (void)precisionAtTop2CachedPredictions
{
  OUTLINED_FUNCTION_0_10(&dword_1AE67F000, a1, a3, "%s: _numberOfCorrectTop2CachedPrediction != 0 while _numberOfCachedPredictions == 0.", a5, a6, a7, a8, 2u);
}

- (void)precisionAtTop4CachedPredictions
{
  OUTLINED_FUNCTION_0_10(&dword_1AE67F000, a1, a3, "%s: _numberOfCorrectTop4CachedPrediction != 0 while _numberOfCachedPredictions == 0.", a5, a6, a7, a8, 2u);
}

- (void)precisionAtTop8CachedPredictions
{
  OUTLINED_FUNCTION_0_10(&dword_1AE67F000, a1, a3, "%s: _numberOfCorrectTop8CachedPrediction != 0 while _numberOfCachedPredictions == 0.", a5, a6, a7, a8, 2u);
}

- (void)precisionOfHighConfidenceCachedPredictions
{
  OUTLINED_FUNCTION_0_10(&dword_1AE67F000, a1, a3, "%s: _numberOfCorrectHighConfidenceCachedPredictions != 0 while _numberOfCachedHighConfidencePredictions == 0.", a5, a6, a7, a8, 2u);
}

- (void)precisionOfMediumConfidenceCachedPredictions
{
  OUTLINED_FUNCTION_0_10(&dword_1AE67F000, a1, a3, "%s: _numberOfCorrectMediumConfidenceCachedPredictions != 0 while _numberOfCachedMediumConfidencePredictions == 0.", a5, a6, a7, a8, 2u);
}

- (void)precisionOfLowConfidenceCachedPredictions
{
  OUTLINED_FUNCTION_0_10(&dword_1AE67F000, a1, a3, "%s: _numberOfCorrectLowConfidenceCachedPredictions != 0 while _numberOfCachedLowConfidencePredictions == 0.", a5, a6, a7, a8, 2u);
}

- (void)precisionAllCachedPredictions
{
  OUTLINED_FUNCTION_0_10(&dword_1AE67F000, a1, a3, "%s: _numberOfCorrectCachedPrediction != 0 while _numberOfCachedPredictions == 0.", a5, a6, a7, a8, 2u);
}

- (void)recallAtTop1CachedPrediction
{
  OUTLINED_FUNCTION_0_10(&dword_1AE67F000, a1, a3, "%s: _numberOfShadowEventTop1CacheHits != 0 while _numberOfShadowEvents == 0.", a5, a6, a7, a8, 2u);
}

- (void)recallAtTop2CachedPredictions
{
  OUTLINED_FUNCTION_0_10(&dword_1AE67F000, a1, a3, "%s: _numberOfShadowEventTop2CacheHits != 0 while _numberOfShadowEvents == 0.", a5, a6, a7, a8, 2u);
}

- (void)recallAtTop4CachedPredictions
{
  OUTLINED_FUNCTION_0_10(&dword_1AE67F000, a1, a3, "%s: _numberOfShadowEventTop4CacheHits != 0 while _numberOfShadowEvents == 0.", a5, a6, a7, a8, 2u);
}

- (void)recallAtTop8CachedPredictions
{
  OUTLINED_FUNCTION_0_10(&dword_1AE67F000, a1, a3, "%s: _numberOfShadowEventTop8CacheHits != 0 while _numberOfShadowEvents == 0.", a5, a6, a7, a8, 2u);
}

- (void)recallOfHighConfidenceCachedPredictions
{
  OUTLINED_FUNCTION_0_10(&dword_1AE67F000, a1, a3, "%s: _numberOfShadowEventHighConfidenceCacheHits != 0 while _numberOfShadowEvents == 0.", a5, a6, a7, a8, 2u);
}

- (void)recallOfMediumConfidenceCachedPredictions
{
  OUTLINED_FUNCTION_0_10(&dword_1AE67F000, a1, a3, "%s: _numberOfShadowEventMediumConfidenceCacheHits != 0 while _numberOfShadowEvents == 0.", a5, a6, a7, a8, 2u);
}

- (void)recallOfLowConfidenceCachedPredictions
{
  OUTLINED_FUNCTION_0_10(&dword_1AE67F000, a1, a3, "%s: _numberOfShadowEventLowConfidenceCacheHits != 0 while _numberOfShadowEvents == 0.", a5, a6, a7, a8, 2u);
}

- (void)recallAllCachedPredictions
{
  OUTLINED_FUNCTION_0_10(&dword_1AE67F000, a1, a3, "%s: _numberOfShadowEventCacheHits != 0 while _numberOfShadowEvents == 0.", a5, a6, a7, a8, 2u);
}

- (void)meanReciprocalRank
{
  OUTLINED_FUNCTION_0_10(&dword_1AE67F000, a1, a3, "%s: _sumOfShadowEventCacheHitReciprocalRanks != 0 while _numberOfShadowEventCacheHits == 0.", a5, a6, a7, a8, 2u);
}

@end