@interface UPCalibration
+ (id)calibrateCandidate:(id)a3 withCalibrationScore:(double)a4;
+ (id)calibrateResult:(id)a3 withCalibrationScore:(double)a4;
- (id)calibrateParserResults:(id)a3 withCalibrationScores:(id)a4 error:(id *)a5;
@end

@implementation UPCalibration

- (id)calibrateParserResults:(id)a3 withCalibrationScores:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v24;
    *(void *)&long long v11 = 138412290;
    long long v22 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v16 = objc_msgSend(v9, "objectForKey:", v15, v22, (void)v23);
        v17 = [v7 objectForKey:v15];
        v18 = v17;
        if (v17)
        {
          [v17 doubleValue];
          v19 = +[UPCalibration calibrateResult:withCalibrationScore:](UPCalibration, "calibrateResult:withCalibrationScore:", v16);
          [v8 setObject:v19 forKey:v15];
        }
        else
        {
          v20 = SNLPOSLoggerForCategory(3);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v22;
            uint64_t v28 = v15;
            _os_log_impl(&dword_1C8DA9000, v20, OS_LOG_TYPE_DEBUG, "No calibration score found for parser result with bundle modelIdentifier: %@", buf, 0xCu);
          }

          [v8 setObject:v16 forKey:v15];
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v12);
  }

  return v8;
}

+ (id)calibrateCandidate:(id)a3 withCalibrationScore:(double)a4
{
  id v5 = a3;
  [v5 uncalibratedProbability];
  double v7 = v6 * a4;
  v8 = [UPResultCandidate alloc];
  [v5 uncalibratedProbability];
  double v10 = v9;
  long long v11 = [NSNumber numberWithDouble:v7];
  uint64_t v12 = [v5 utterance];
  uint64_t v13 = [v5 intent];
  v14 = [v5 entities];
  uint64_t v15 = [v5 modelIdentifier];
  v16 = [v5 task];

  v17 = [(UPResultCandidate *)v8 initWithUncalibratedProbability:v11 calibratedProbability:v12 utterance:v13 intent:v14 entities:v15 modelIdentifier:v16 task:v10];
  return v17;
}

+ (id)calibrateResult:(id)a3 withCalibrationScore:(double)a4
{
  id v5 = a3;
  double v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [v5 candidateCount];
  if (v7 >= 1)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
    {
      double v10 = [v5 candidateAtRank:i];
      long long v11 = +[UPCalibration calibrateCandidate:v10 withCalibrationScore:a4];
      [v6 addObject:v11];
    }
  }
  uint64_t v12 = [UPResult alloc];
  uint64_t v13 = [v5 queryUUID];
  v14 = [(UPResult *)v12 initWithCandidates:v6 queryUUID:v13];

  return v14;
}

@end