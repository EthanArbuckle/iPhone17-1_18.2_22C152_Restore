@interface _OSInactivityPredictor
+ (BOOL)hasEnoughInactivityHistory;
+ (BOOL)isDeviceRarelyUsedRecently;
+ (id)dailyAverageActiveDurationsInHours:(int)a3;
+ (id)deviceUsageDiagnosis;
+ (id)log;
+ (id)logWithCategory:(id)a3;
+ (id)predictor;
+ (id)projectedDateOfHistorySufficiencyWithError:(id *)a3;
+ (id)ultraLongInactiveDurationsInHours:(int)a3 withThreshold:(double)a4;
+ (id)userHistoryDiagnosis;
+ (unint64_t)readEvaluatedPredictorTypeFromDefaults;
- (BOOL)requireEnoughHistory;
- (NSString)description;
- (NSString)modelVersion;
- (NSString)predictorType;
- (NSString)queryingMechanism;
- (_OSInactivityPredictor)init;
- (double)confidenceThresholdRelaxed;
- (double)confidenceThresholdStrict;
- (double)longThreshold;
- (double)recommendedWaitTime;
- (double)waitedDuration;
- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6;
- (id)longInactivityPredictionResultWithOptions:(int64_t)a3 withError:(id *)a4;
- (id)metadata;
- (unint64_t)modelTypeFromPredictorName:(id)a3;
- (void)setConfidenceThresholdRelaxed:(double)a3;
- (void)setConfidenceThresholdStrict:(double)a3;
- (void)setLongThreshold:(double)a3;
- (void)setModelVersion:(id)a3;
- (void)setPredictorType:(id)a3;
- (void)setQueryingMechanism:(id)a3;
- (void)setRecommendedWaitTime:(double)a3;
- (void)setRequireEnoughHistory:(BOOL)a3;
@end

@implementation _OSInactivityPredictor

- (_OSInactivityPredictor)init
{
  v8.receiver = self;
  v8.super_class = (Class)_OSInactivityPredictor;
  v2 = [(_OSInactivityPredictor *)&v8 init];
  v3 = v2;
  if (v2)
  {
    predictorType = v2->predictorType;
    v2->predictorType = (NSString *)@"basic";

    modelVersion = v3->modelVersion;
    v3->modelVersion = (NSString *)@"None";

    queryingMechanism = v3->queryingMechanism;
    v3->queryingMechanism = (NSString *)@"single";

    *(_OWORD *)&v3->recommendedWaitTime = xmmword_10004F5B0;
    *(_OWORD *)&v3->confidenceThresholdStrict = xmmword_10004F5A0;
    v3->requireEnoughHistory = 0;
  }
  return v3;
}

+ (id)predictor
{
  v3 = (void *)os_transaction_create();
  v4 = +[OSIntelligenceDefines inactivityUserDefaults];
  v5 = [v4 objectForKey:@"modelType"];

  if (v5)
  {
    id v6 = [v4 integerForKey:@"modelType"];
    switch((unint64_t)v6)
    {
      case 1uLL:
        v7 = [a1 log];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "User has overridden device to only use ML-based model", v26, 2u);
        }

        if ([a1 hasEnoughInactivityHistory]) {
          goto LABEL_37;
        }
        objc_super v8 = [a1 log];
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_36;
        }
        *(_WORD *)v26 = 0;
        v9 = "User does not have enough inactivity history so performance may be worse than expected by a customer";
        goto LABEL_35;
      case 2uLL:
        v18 = [a1 log];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "User has overridden device to only use alternate model", v26, 2u);
        }

        if ([a1 hasEnoughInactivityHistory]) {
          goto LABEL_26;
        }
        objc_super v8 = [a1 log];
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        *(_WORD *)v26 = 0;
        v14 = "User does not have enough inactivity history so performance may be worse than expected by a customer";
        goto LABEL_24;
      case 3uLL:
        v16 = [a1 log];
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_43;
        }
        *(_WORD *)v26 = 0;
        v20 = "User has overridden device to only use rule-based model";
        goto LABEL_42;
      case 4uLL:
        v21 = [a1 log];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "User has overridden device to only use backup-based model", v26, 2u);
        }

        if (+[_OSInactivityPredictionBackupManager hasBackup])
        {
          goto LABEL_32;
        }
        v16 = [a1 log];
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_43;
        }
        *(_WORD *)v26 = 0;
        v20 = "User does not have a backup so falling back to rule-based.";
        goto LABEL_42;
      default:
        uint64_t v10 = (uint64_t)v6;
        v11 = [a1 log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100041EA8(v10, v11);
        }

        break;
    }
  }
  if (![a1 hasEnoughInactivityHistory])
  {
    unsigned int v15 = +[_OSInactivityPredictionBackupManager hasBackup];
    v16 = [a1 log];
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        *(_WORD *)v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "User does not have enough inactivity history but has backup; using the backup model.",
          v26,
          2u);
      }

LABEL_32:
      v22 = _OSInactivityPredictorBackupBasedModel;
    }
    else
    {
      if (v17)
      {
        *(_WORD *)v26 = 0;
        v20 = "User has neither enough history nor backup; using the rule-based model.";
LABEL_42:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v20, v26, 2u);
      }
LABEL_43:

      v22 = _OSInactivityPredictorRuleBasedModel;
    }
    goto LABEL_44;
  }
  id v12 = [a1 readEvaluatedPredictorTypeFromDefaults];
  objc_super v8 = [a1 log];
  BOOL v13 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v12 != (id)2)
  {
    if (v13)
    {
      *(_WORD *)v26 = 0;
      v9 = "User has enough inactivity history; using two stage ML model.";
LABEL_35:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v26, 2u);
    }
LABEL_36:

LABEL_37:
    v22 = _OSInactivityPredictorTwoStage;
LABEL_44:
    uint64_t v19 = [(__objc2_class *)v22 predictor];
    goto LABEL_45;
  }
  if (v13)
  {
    *(_WORD *)v26 = 0;
    v14 = "User has enough inactivity history and has sporadic behavior; using alternate ML model.";
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v14, v26, 2u);
  }
LABEL_25:

LABEL_26:
  uint64_t v19 = +[_OSInactivityPredictorTwoStage alternatePredictor];
LABEL_45:
  v23 = (void *)v19;
  v24 = +[_OSInactivityPredictorSignalsAndModel predictorWithPredictor:v19];

  return v24;
}

- (unint64_t)modelTypeFromPredictorName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ruleBased"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"backup"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 hasSuffix:@"_alt"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 hasPrefix:@"twoStage"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 containsString:@"lassifier"])
  {
    unint64_t v4 = 5;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (unint64_t)readEvaluatedPredictorTypeFromDefaults
{
  v2 = +[OSIntelligenceDefines inactivityUserDefaults];
  id v3 = [v2 integerForKey:@"predictorType"];

  return (unint64_t)v3;
}

+ (BOOL)hasEnoughInactivityHistory
{
  v2 = +[_OSLockHistory sharedInstance];
  unsigned __int8 v3 = [v2 hasEnoughHistoryForInactivityPrediction];

  return v3;
}

+ (id)projectedDateOfHistorySufficiencyWithError:(id *)a3
{
  unsigned __int8 v3 = +[_OSLockHistory sharedInstance];
  unint64_t v4 = [v3 projectedDateOfHistorySufficiency];

  return v4;
}

+ (id)userHistoryDiagnosis
{
  v2 = +[_OSLockHistory sharedInstance];
  unsigned __int8 v3 = [v2 userHistoryDiagnosis];

  return v3;
}

+ (BOOL)isDeviceRarelyUsedRecently
{
  unsigned __int8 v3 = [a1 dailyAverageActiveDurationsInHours:7];
  +[OSIntelligenceUtilities meanOf:v3];
  BOOL v5 = v4 * 3600.0 < 1800.0;
  id v6 = [a1 ultraLongInactiveDurationsInHours:7 withThreshold:50400.0];
  v7 = [v6 valueForKeyPath:@"@sum.self"];
  [v7 doubleValue];
  if (v8 * 3600.0 > 144000.0) {
    BOOL v5 = 1;
  }

  return v5;
}

+ (id)deviceUsageDiagnosis
{
  unsigned int v3 = [a1 isDeviceRarelyUsedRecently];
  CFStringRef v4 = &stru_100066558;
  if (v3) {
    CFStringRef v4 = @"NOT ";
  }
  BOOL v5 = +[NSString stringWithFormat:@"This device is %@frequently used in the past %d days.", v4, 7];
  id v6 = v5;
  if (v3)
  {
    v7 = [a1 dailyAverageActiveDurationsInHours:7];
    +[OSIntelligenceUtilities meanOf:v7];
    v9 = +[NSString stringWithFormat:@"In the past %d days, the device is on average used for %.2f hours daily (we recommend >%.2f hours)\n  -> daily usages: %@", 7, v8, 0x3FE0000000000000, v7];
    uint64_t v10 = [a1 ultraLongInactiveDurationsInHours:7 withThreshold:50400.0];
    v11 = [v10 valueForKeyPath:@"@sum.self"];
    [v11 doubleValue];
    BOOL v13 = +[NSString stringWithFormat:@"In the past %d days, the device has in total %.2f hours of ultra long inactivity (we recommend <%.2f hours)\n  -> ultra long durations: %@", 7, v12, 0x4044000000000000, v10];
    id v14 = +[NSString stringWithFormat:@"%@\n%@\n%@\nInactivity prediction accuracy is NOT guaranteed on low-usage devices! Please use your device more.", v6, v9, v13];
  }
  else
  {
    id v14 = v5;
  }

  return v14;
}

+ (id)ultraLongInactiveDurationsInHours:(int)a3 withThreshold:(double)a4
{
  id v6 = +[NSMutableArray array];
  v7 = +[NSDate dateWithTimeIntervalSinceNow:(double)-a3 * 86400.0];
  uint64_t v8 = +[_OSLockHistory sharedInstance];
  uint64_t v9 = +[NSPredicate predicateWithFormat:@"startDate >= %@", v7];
  uint64_t v10 = +[NSNumber numberWithDouble:a4];
  uint64_t v11 = +[NSPredicate predicateWithFormat:@"duration >= %@", v10];

  v25 = (void *)v11;
  v26 = (void *)v9;
  v33[0] = v9;
  v33[1] = v11;
  uint64_t v12 = +[NSArray arrayWithObjects:v33 count:2];
  BOOL v13 = +[NSCompoundPredicate andPredicateWithSubpredicates:v12];

  v27 = v8;
  id v14 = [v8 lockedIntervalsQueryWithPredicate:v13];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v20 = [v19 endDate];
        v21 = [v19 startDate];
        [v20 timeIntervalSinceDate:v21];
        v23 = +[NSNumber numberWithDouble:v22 / 3600.0];
        [v6 addObject:v23];
      }
      id v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v16);
  }

  return v6;
}

+ (id)dailyAverageActiveDurationsInHours:(int)a3
{
  id v24 = +[NSMutableArray array];
  if (a3 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v23 = a3;
    do
    {
      uint64_t v5 = +[NSDate dateWithTimeIntervalSinceNow:(double)(int)v4 * -86400.0];
      uint64_t v6 = v4 + 1;
      uint64_t v7 = +[NSDate dateWithTimeIntervalSinceNow:(double)((int)v4 + 1) * -86400.0];
      uint64_t v8 = +[_OSLockHistory sharedInstance];
      v25 = (void *)v7;
      v32[0] = v7;
      v32[1] = v5;
      uint64_t v9 = +[NSArray arrayWithObjects:v32 count:2];
      uint64_t v10 = +[NSPredicate predicateWithFormat:@"startDate BETWEEN %@", v9];

      uint64_t v11 = [v8 unlockedIntervalsQueryWithPredicate:v10];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      v26 = (void *)v5;
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v28;
        double v15 = 0.0;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v28 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            v18 = [v17 endDate];
            uint64_t v19 = [v17 startDate];
            [v18 timeIntervalSinceDate:v19];
            double v15 = v15 + v20;
          }
          id v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v13);
      }
      else
      {
        double v15 = 0.0;
      }
      v21 = +[NSNumber numberWithDouble:v15 / 3600.0];
      [v24 setObject:v21 atIndexedSubscript:v4];

      ++v4;
    }
    while (v6 != v23);
  }

  return v24;
}

+ (id)log
{
  return [a1 logWithCategory:@"basepredictor"];
}

+ (id)logWithCategory:(id)a3
{
  id v3 = +[NSString stringWithFormat:@"inactivity.%@", a3];
  os_log_t v4 = os_log_create("com.apple.osintelligence", (const char *)[v3 UTF8String]);

  return v4;
}

- (id)longInactivityPredictionResultWithOptions:(int64_t)a3 withError:(id *)a4
{
  uint64_t v7 = +[NSDate now];
  [(_OSInactivityPredictor *)self waitedDuration];
  uint64_t v8 = -[_OSInactivityPredictor longInactivityPredictionResultAtDate:withTimeSinceInactive:withOptions:withError:](self, "longInactivityPredictionResultAtDate:withTimeSinceInactive:withOptions:withError:", v7, a3, a4);

  return v8;
}

- (double)waitedDuration
{
  id v3 = +[OSIntelligenceUtilities lastLockDate];
  uint64_t v4 = +[OSIntelligenceUtilities lastPluggedInDate];
  uint64_t v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    [(_OSInactivityPredictor *)self recommendedWaitTime];
    double v10 = v7;
  }
  else
  {
    uint64_t v8 = [v3 laterDate:v4];
    [v8 timeIntervalSinceNow];
    double v10 = -v9;
  }
  return v10;
}

- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6
{
  id v6 = a3;
  double v7 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "This should not be called...Subclass must override this function!", buf, 2u);
  }

  uint64_t v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s must be overridden in a subclass", "-[_OSInactivityPredictor longInactivityPredictionResultAtDate:withTimeSinceInactive:withOptions:withError:]");
  id v9 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v8 userInfo:0];

  objc_exception_throw(v9);
}

- (NSString)description
{
  v2 = [(_OSInactivityPredictor *)self metadata];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (id)metadata
{
  id v2 = [objc_alloc((Class)_OSInactivityPredictorMetadata) initWithProtocolConformer:self];

  return v2;
}

- (double)recommendedWaitTime
{
  return self->recommendedWaitTime;
}

- (void)setRecommendedWaitTime:(double)a3
{
  self->recommendedWaitTime = a3;
}

- (double)confidenceThresholdRelaxed
{
  return self->confidenceThresholdRelaxed;
}

- (void)setConfidenceThresholdRelaxed:(double)a3
{
  self->confidenceThresholdRelaxed = a3;
}

- (double)confidenceThresholdStrict
{
  return self->confidenceThresholdStrict;
}

- (void)setConfidenceThresholdStrict:(double)a3
{
  self->confidenceThresholdStrict = a3;
}

- (double)longThreshold
{
  return self->longThreshold;
}

- (void)setLongThreshold:(double)a3
{
  self->longThreshold = a3;
}

- (NSString)modelVersion
{
  return self->modelVersion;
}

- (void)setModelVersion:(id)a3
{
}

- (NSString)predictorType
{
  return self->predictorType;
}

- (void)setPredictorType:(id)a3
{
}

- (NSString)queryingMechanism
{
  return self->queryingMechanism;
}

- (void)setQueryingMechanism:(id)a3
{
}

- (BOOL)requireEnoughHistory
{
  return self->requireEnoughHistory;
}

- (void)setRequireEnoughHistory:(BOOL)a3
{
  self->requireEnoughHistory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->queryingMechanism, 0);
  objc_storeStrong((id *)&self->predictorType, 0);

  objc_storeStrong((id *)&self->modelVersion, 0);
}

@end