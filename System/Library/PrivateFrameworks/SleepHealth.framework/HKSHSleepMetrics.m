@interface HKSHSleepMetrics
+ (BOOL)supportsSecureCoding;
+ (id)sleepMetricsWithMorningIndexRange:(id)a3 sleepAnalysisAsleepCount:(int64_t)a4 sleepAnalysisInBedCount:(int64_t)a5 sleepAnalysisCount:(int64_t)a6 averageSleepDuration:(id)a7 averageInBedDuration:(id)a8 averageREMSleepDuration:(id)a9 averageCoreSleepDuration:(id)a10 averageDeepSleepDuration:(id)a11 averageUnspecifiedSleepDuration:(id)a12 averageAwakeDuration:(id)a13 bedtimeAchievedCount:(int64_t)a14 sleepDurationGoalAchievedCount:(int64_t)a15 sleepDurationGoalStreakCount:(int64_t)a16 averageBedtimeMiss:(id)a17 averageSleepDurationGoalMiss:(id)a18 averageBedtime:(id)a19 averageWakeTime:(id)a20 averageInBedStartTime:(id)a21 averageInBedEndTime:(id)a22 averageSleepStartTime:(id)a23 averageSleepEndTime:(id)a24 standardDeviationActualTimeAsleep:(id)a25 standardDeviationScheduledTimeAsleep:(id)a26 standardDeviationActualVsScheduledTimeAsleep:(id)a27;
- ($0AC6E346AE4835514AAA8AC86D8F4844)morningIndexRange;
- (BOOL)isEqual:(id)a3;
- (HKQuantity)averageAwakeDuration;
- (HKQuantity)averageBedtimeMiss;
- (HKQuantity)averageCoreSleepDuration;
- (HKQuantity)averageDeepSleepDuration;
- (HKQuantity)averageInBedDuration;
- (HKQuantity)averageREMSleepDuration;
- (HKQuantity)averageSleepDuration;
- (HKQuantity)averageSleepDurationGoalMiss;
- (HKQuantity)averageUnspecifiedSleepDuration;
- (HKSHSleepMetrics)initWithCoder:(id)a3;
- (NSDateComponents)averageBedtime;
- (NSDateComponents)averageInBedEndTime;
- (NSDateComponents)averageInBedStartTime;
- (NSDateComponents)averageSleepEndTime;
- (NSDateComponents)averageSleepStartTime;
- (NSDateComponents)averageWakeTime;
- (NSNumber)standardDeviationActualTimeAsleep;
- (NSNumber)standardDeviationActualVsScheduledTimeAsleep;
- (NSNumber)standardDeviationScheduledTimeAsleep;
- (int64_t)bedtimeAchievedCount;
- (int64_t)sleepAnalysisAsleepCount;
- (int64_t)sleepAnalysisCount;
- (int64_t)sleepAnalysisInBedCount;
- (int64_t)sleepDurationGoalAchievedCount;
- (int64_t)sleepDurationGoalStreakCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSHSleepMetrics

+ (id)sleepMetricsWithMorningIndexRange:(id)a3 sleepAnalysisAsleepCount:(int64_t)a4 sleepAnalysisInBedCount:(int64_t)a5 sleepAnalysisCount:(int64_t)a6 averageSleepDuration:(id)a7 averageInBedDuration:(id)a8 averageREMSleepDuration:(id)a9 averageCoreSleepDuration:(id)a10 averageDeepSleepDuration:(id)a11 averageUnspecifiedSleepDuration:(id)a12 averageAwakeDuration:(id)a13 bedtimeAchievedCount:(int64_t)a14 sleepDurationGoalAchievedCount:(int64_t)a15 sleepDurationGoalStreakCount:(int64_t)a16 averageBedtimeMiss:(id)a17 averageSleepDurationGoalMiss:(id)a18 averageBedtime:(id)a19 averageWakeTime:(id)a20 averageInBedStartTime:(id)a21 averageInBedEndTime:(id)a22 averageSleepStartTime:(id)a23 averageSleepEndTime:(id)a24 standardDeviationActualTimeAsleep:(id)a25 standardDeviationScheduledTimeAsleep:(id)a26 standardDeviationActualVsScheduledTimeAsleep:(id)a27
{
  id v87 = a27;
  id v86 = a26;
  id v85 = a25;
  id v84 = a24;
  id v83 = a23;
  id v82 = a22;
  id v81 = a21;
  id v80 = a20;
  id v79 = a19;
  id v78 = a18;
  id v27 = a17;
  id v28 = a13;
  id v29 = a12;
  id v30 = a11;
  id v31 = a10;
  id v32 = a9;
  id v33 = a8;
  id v34 = a7;
  v35 = objc_alloc_init(HKSHSleepMetrics);
  v35->_morningIndexRange = ($BB81632A5F90EABF970498852D8C14B8)a3;
  v35->_sleepAnalysisAsleepCount = a4;
  v35->_sleepAnalysisInBedCount = a5;
  v35->_sleepAnalysisCount = a6;
  uint64_t v36 = [v34 copy];

  averageSleepDuration = v35->_averageSleepDuration;
  v35->_averageSleepDuration = (HKQuantity *)v36;

  uint64_t v38 = [v33 copy];
  averageInBedDuration = v35->_averageInBedDuration;
  v35->_averageInBedDuration = (HKQuantity *)v38;

  uint64_t v40 = [v32 copy];
  averageREMSleepDuration = v35->_averageREMSleepDuration;
  v35->_averageREMSleepDuration = (HKQuantity *)v40;

  uint64_t v42 = [v31 copy];
  averageCoreSleepDuration = v35->_averageCoreSleepDuration;
  v35->_averageCoreSleepDuration = (HKQuantity *)v42;

  uint64_t v44 = [v30 copy];
  averageDeepSleepDuration = v35->_averageDeepSleepDuration;
  v35->_averageDeepSleepDuration = (HKQuantity *)v44;

  uint64_t v46 = [v29 copy];
  averageUnspecifiedSleepDuration = v35->_averageUnspecifiedSleepDuration;
  v35->_averageUnspecifiedSleepDuration = (HKQuantity *)v46;

  uint64_t v48 = [v28 copy];
  averageAwakeDuration = v35->_averageAwakeDuration;
  v35->_averageAwakeDuration = (HKQuantity *)v48;

  *(_OWORD *)&v35->_bedtimeAchievedCount = *(_OWORD *)&a14;
  v35->_sleepDurationGoalStreakCount = a16;
  uint64_t v50 = [v27 copy];

  averageBedtimeMiss = v35->_averageBedtimeMiss;
  v35->_averageBedtimeMiss = (HKQuantity *)v50;

  uint64_t v52 = [v78 copy];
  averageSleepDurationGoalMiss = v35->_averageSleepDurationGoalMiss;
  v35->_averageSleepDurationGoalMiss = (HKQuantity *)v52;

  uint64_t v54 = [v79 copy];
  averageBedtime = v35->_averageBedtime;
  v35->_averageBedtime = (NSDateComponents *)v54;

  uint64_t v56 = [v80 copy];
  averageWakeTime = v35->_averageWakeTime;
  v35->_averageWakeTime = (NSDateComponents *)v56;

  uint64_t v58 = [v81 copy];
  averageInBedStartTime = v35->_averageInBedStartTime;
  v35->_averageInBedStartTime = (NSDateComponents *)v58;

  uint64_t v60 = [v82 copy];
  averageInBedEndTime = v35->_averageInBedEndTime;
  v35->_averageInBedEndTime = (NSDateComponents *)v60;

  uint64_t v62 = [v83 copy];
  averageSleepStartTime = v35->_averageSleepStartTime;
  v35->_averageSleepStartTime = (NSDateComponents *)v62;

  uint64_t v64 = [v84 copy];
  averageSleepEndTime = v35->_averageSleepEndTime;
  v35->_averageSleepEndTime = (NSDateComponents *)v64;

  uint64_t v66 = [v85 copy];
  standardDeviationActualTimeAsleep = v35->_standardDeviationActualTimeAsleep;
  v35->_standardDeviationActualTimeAsleep = (NSNumber *)v66;

  uint64_t v68 = [v86 copy];
  standardDeviationScheduledTimeAsleep = v35->_standardDeviationScheduledTimeAsleep;
  v35->_standardDeviationScheduledTimeAsleep = (NSNumber *)v68;

  uint64_t v70 = [v87 copy];
  standardDeviationActualVsScheduledTimeAsleep = v35->_standardDeviationActualVsScheduledTimeAsleep;
  v35->_standardDeviationActualVsScheduledTimeAsleep = (NSNumber *)v70;

  return v35;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t start = self->_morningIndexRange.start;
  id v5 = a3;
  [v5 encodeInteger:start forKey:@"morningIndexRangeStart"];
  [v5 encodeInteger:self->_morningIndexRange.duration forKey:@"morningIndexRangeDuration"];
  [v5 encodeInteger:self->_sleepAnalysisAsleepCount forKey:@"sleepAnalysisAsleepCount"];
  [v5 encodeInteger:self->_sleepAnalysisInBedCount forKey:@"sleepAnalysisInBedCount"];
  [v5 encodeInteger:self->_sleepAnalysisCount forKey:@"sleepAnalysisCount"];
  [v5 encodeObject:self->_averageSleepDuration forKey:@"averageSleepDuration"];
  [v5 encodeObject:self->_averageInBedDuration forKey:@"averageInBedDuration"];
  [v5 encodeObject:self->_averageREMSleepDuration forKey:@"averageREMSleepDuration"];
  [v5 encodeObject:self->_averageCoreSleepDuration forKey:@"averageCoreSleepDuration"];
  [v5 encodeObject:self->_averageDeepSleepDuration forKey:@"averageDeepSleepDuration"];
  [v5 encodeObject:self->_averageUnspecifiedSleepDuration forKey:@"averageUnspecifiedSleepDuration"];
  [v5 encodeObject:self->_averageAwakeDuration forKey:@"averageAwakeDuration"];
  [v5 encodeInteger:self->_bedtimeAchievedCount forKey:@"bedtimeAchievedCount"];
  [v5 encodeInteger:self->_sleepDurationGoalAchievedCount forKey:@"sleepDurationGoalAchievedCount"];
  [v5 encodeInteger:self->_sleepDurationGoalStreakCount forKey:@"sleepDurationGoalStreakCount"];
  [v5 encodeObject:self->_averageBedtimeMiss forKey:@"averageBedtimeMiss"];
  [v5 encodeObject:self->_averageSleepDurationGoalMiss forKey:@"averageSleepDurationGoalMiss"];
  [v5 encodeObject:self->_averageBedtime forKey:@"averageBedtime"];
  [v5 encodeObject:self->_averageWakeTime forKey:@"averageWakeTime"];
  [v5 encodeObject:self->_averageInBedStartTime forKey:@"averageInBedStartTime"];
  [v5 encodeObject:self->_averageInBedEndTime forKey:@"averageInBedEndTime"];
  [v5 encodeObject:self->_averageSleepStartTime forKey:@"averageSleepStartTime"];
  [v5 encodeObject:self->_averageSleepEndTime forKey:@"averageSleepEndTime"];
  [v5 encodeObject:self->_standardDeviationActualTimeAsleep forKey:@"standardDeviationActualTimeAsleep"];
  [v5 encodeObject:self->_standardDeviationScheduledTimeAsleep forKey:@"standardDeviationScheduledTimeAsleep"];
  [v5 encodeObject:self->_standardDeviationActualVsScheduledTimeAsleep forKey:@"standardDeviationActualVsScheduledTimeAsleep"];
}

- (HKSHSleepMetrics)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v28 = [v3 decodeIntegerForKey:@"morningIndexRangeStart"];
  uint64_t v27 = [v3 decodeIntegerForKey:@"morningIndexRangeDuration"];
  v26 = objc_opt_class();
  uint64_t v25 = [v3 decodeIntegerForKey:@"sleepAnalysisAsleepCount"];
  uint64_t v24 = [v3 decodeIntegerForKey:@"sleepAnalysisInBedCount"];
  uint64_t v23 = [v3 decodeIntegerForKey:@"sleepAnalysisCount"];
  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"averageSleepDuration"];
  id v33 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"averageInBedDuration"];
  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"averageREMSleepDuration"];
  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"averageCoreSleepDuration"];
  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"averageDeepSleepDuration"];
  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"averageUnspecifiedSleepDuration"];
  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"averageAwakeDuration"];
  uint64_t v20 = [v3 decodeIntegerForKey:@"bedtimeAchievedCount"];
  uint64_t v18 = [v3 decodeIntegerForKey:@"sleepDurationGoalAchievedCount"];
  uint64_t v17 = [v3 decodeIntegerForKey:@"sleepDurationGoalStreakCount"];
  id v32 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"averageBedtimeMiss"];
  id v31 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"averageSleepDurationGoalMiss"];
  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"averageBedtime"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"averageWakeTime"];
  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"averageInBedStartTime"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"averageInBedEndTime"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"averageSleepStartTime"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"averageSleepEndTime"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"standardDeviationActualTimeAsleep"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"standardDeviationScheduledTimeAsleep"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"standardDeviationActualVsScheduledTimeAsleep"];

  objc_msgSend(v26, "sleepMetricsWithMorningIndexRange:sleepAnalysisAsleepCount:sleepAnalysisInBedCount:sleepAnalysisCount:averageSleepDuration:averageInBedDuration:averageREMSleepDuration:averageCoreSleepDuration:averageDeepSleepDuration:averageUnspecifiedSleepDuration:averageAwakeDuration:bedtimeAchievedCount:sleepDurationGoalAchievedCount:sleepDurationGoalStreakCount:averageBedtimeMiss:averageSleepDurationGoalMiss:averageBedtime:averageWakeTime:averageInBedStartTime:averageInBedEndTime:averageSleepStartTime:averageSleepEndTime:standardDeviationActualTimeAsleep:standardDeviationScheduledTimeAsleep:standardDeviationActualVsScheduledTimeAsleep:", v28, v27, v25, v24, v23, v22, v33, v21, v19, v16, v15, v14,
    v20,
    v18,
    v17,
    v32,
    v31,
    v13,
    v12,
    v11,
    v10,
    v9,
    v4,
    v5,
    v6,
    v7);
  id v29 = (HKSHSleepMetrics *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKSHSleepMetrics *)a3;
  if (self == v4)
  {
    char v43 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = v5;
      if (self->_morningIndexRange.start != v5->_morningIndexRange.start) {
        goto LABEL_67;
      }
      if (self->_morningIndexRange.duration != v5->_morningIndexRange.duration) {
        goto LABEL_67;
      }
      if (self->_sleepAnalysisAsleepCount != v5->_sleepAnalysisAsleepCount) {
        goto LABEL_67;
      }
      if (self->_sleepAnalysisInBedCount != v5->_sleepAnalysisInBedCount) {
        goto LABEL_67;
      }
      if (self->_sleepAnalysisCount != v5->_sleepAnalysisCount) {
        goto LABEL_67;
      }
      averageSleepDuration = self->_averageSleepDuration;
      v8 = v6->_averageSleepDuration;
      if (averageSleepDuration != v8
        && (!v8 || !-[HKQuantity isEqual:](averageSleepDuration, "isEqual:")))
      {
        goto LABEL_67;
      }
      averageInBedDuration = self->_averageInBedDuration;
      v10 = v6->_averageInBedDuration;
      if (averageInBedDuration != v10
        && (!v10 || !-[HKQuantity isEqual:](averageInBedDuration, "isEqual:")))
      {
        goto LABEL_67;
      }
      averageREMSleepDuration = self->_averageREMSleepDuration;
      v12 = v6->_averageREMSleepDuration;
      if (averageREMSleepDuration != v12
        && (!v12 || !-[HKQuantity isEqual:](averageREMSleepDuration, "isEqual:")))
      {
        goto LABEL_67;
      }
      averageCoreSleepDuration = self->_averageCoreSleepDuration;
      v14 = v6->_averageCoreSleepDuration;
      if (averageCoreSleepDuration != v14
        && (!v14 || !-[HKQuantity isEqual:](averageCoreSleepDuration, "isEqual:")))
      {
        goto LABEL_67;
      }
      averageDeepSleepDuration = self->_averageDeepSleepDuration;
      v16 = v6->_averageDeepSleepDuration;
      if (averageDeepSleepDuration != v16
        && (!v16 || !-[HKQuantity isEqual:](averageDeepSleepDuration, "isEqual:")))
      {
        goto LABEL_67;
      }
      averageUnspecifiedSleepDuration = self->_averageUnspecifiedSleepDuration;
      uint64_t v18 = v6->_averageUnspecifiedSleepDuration;
      if (averageUnspecifiedSleepDuration != v18
        && (!v18 || !-[HKQuantity isEqual:](averageUnspecifiedSleepDuration, "isEqual:")))
      {
        goto LABEL_67;
      }
      averageAwakeDuration = self->_averageAwakeDuration;
      uint64_t v20 = v6->_averageAwakeDuration;
      if (averageAwakeDuration != v20
        && (!v20 || !-[HKQuantity isEqual:](averageAwakeDuration, "isEqual:")))
      {
        goto LABEL_67;
      }
      if (self->_bedtimeAchievedCount != v6->_bedtimeAchievedCount) {
        goto LABEL_67;
      }
      if (self->_sleepDurationGoalAchievedCount != v6->_sleepDurationGoalAchievedCount) {
        goto LABEL_67;
      }
      if (self->_sleepDurationGoalStreakCount != v6->_sleepDurationGoalStreakCount) {
        goto LABEL_67;
      }
      averageBedtimeMiss = self->_averageBedtimeMiss;
      v22 = v6->_averageBedtimeMiss;
      if (averageBedtimeMiss != v22 && (!v22 || !-[HKQuantity isEqual:](averageBedtimeMiss, "isEqual:"))) {
        goto LABEL_67;
      }
      averageSleepDurationGoalMiss = self->_averageSleepDurationGoalMiss;
      uint64_t v24 = v6->_averageSleepDurationGoalMiss;
      if (averageSleepDurationGoalMiss != v24
        && (!v24 || !-[HKQuantity isEqual:](averageSleepDurationGoalMiss, "isEqual:")))
      {
        goto LABEL_67;
      }
      averageBedtime = self->_averageBedtime;
      v26 = v6->_averageBedtime;
      if (averageBedtime != v26 && (!v26 || !-[NSDateComponents isEqual:](averageBedtime, "isEqual:"))) {
        goto LABEL_67;
      }
      averageWakeTime = self->_averageWakeTime;
      uint64_t v28 = v6->_averageWakeTime;
      if (averageWakeTime != v28 && (!v28 || !-[NSDateComponents isEqual:](averageWakeTime, "isEqual:"))) {
        goto LABEL_67;
      }
      averageInBedStartTime = self->_averageInBedStartTime;
      id v30 = v6->_averageInBedStartTime;
      if (averageInBedStartTime != v30
        && (!v30 || !-[NSDateComponents isEqual:](averageInBedStartTime, "isEqual:")))
      {
        goto LABEL_67;
      }
      averageInBedEndTime = self->_averageInBedEndTime;
      id v32 = v6->_averageInBedEndTime;
      if (averageInBedEndTime != v32
        && (!v32 || !-[NSDateComponents isEqual:](averageInBedEndTime, "isEqual:")))
      {
        goto LABEL_67;
      }
      averageSleepStartTime = self->_averageSleepStartTime;
      id v34 = v6->_averageSleepStartTime;
      if (averageSleepStartTime != v34
        && (!v34 || !-[NSDateComponents isEqual:](averageSleepStartTime, "isEqual:")))
      {
        goto LABEL_67;
      }
      averageSleepEndTime = self->_averageSleepEndTime;
      uint64_t v36 = v6->_averageSleepEndTime;
      if (averageSleepEndTime != v36
        && (!v36 || !-[NSDateComponents isEqual:](averageSleepEndTime, "isEqual:")))
      {
        goto LABEL_67;
      }
      standardDeviationActualTimeAsleep = self->_standardDeviationActualTimeAsleep;
      uint64_t v38 = v6->_standardDeviationActualTimeAsleep;
      if (standardDeviationActualTimeAsleep != v38
        && (!v38 || !-[NSNumber isEqual:](standardDeviationActualTimeAsleep, "isEqual:")))
      {
        goto LABEL_67;
      }
      standardDeviationScheduledTimeAsleep = self->_standardDeviationScheduledTimeAsleep;
      uint64_t v40 = v6->_standardDeviationScheduledTimeAsleep;
      if (standardDeviationScheduledTimeAsleep != v40
        && (!v40 || !-[NSNumber isEqual:](standardDeviationScheduledTimeAsleep, "isEqual:")))
      {
        goto LABEL_67;
      }
      standardDeviationActualVsScheduledTimeAsleep = self->_standardDeviationActualVsScheduledTimeAsleep;
      uint64_t v42 = v6->_standardDeviationActualVsScheduledTimeAsleep;
      if (standardDeviationActualVsScheduledTimeAsleep == v42)
      {
        char v43 = 1;
        goto LABEL_68;
      }
      if (v42) {
        char v43 = -[NSNumber isEqual:](standardDeviationActualVsScheduledTimeAsleep, "isEqual:");
      }
      else {
LABEL_67:
      }
        char v43 = 0;
LABEL_68:

      goto LABEL_69;
    }
    char v43 = 0;
  }
LABEL_69:

  return v43;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)morningIndexRange
{
  int64_t duration = self->_morningIndexRange.duration;
  int64_t start = self->_morningIndexRange.start;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (int64_t)sleepAnalysisAsleepCount
{
  return self->_sleepAnalysisAsleepCount;
}

- (int64_t)sleepAnalysisInBedCount
{
  return self->_sleepAnalysisInBedCount;
}

- (int64_t)sleepAnalysisCount
{
  return self->_sleepAnalysisCount;
}

- (HKQuantity)averageSleepDuration
{
  return self->_averageSleepDuration;
}

- (HKQuantity)averageInBedDuration
{
  return self->_averageInBedDuration;
}

- (HKQuantity)averageREMSleepDuration
{
  return self->_averageREMSleepDuration;
}

- (HKQuantity)averageCoreSleepDuration
{
  return self->_averageCoreSleepDuration;
}

- (HKQuantity)averageDeepSleepDuration
{
  return self->_averageDeepSleepDuration;
}

- (HKQuantity)averageUnspecifiedSleepDuration
{
  return self->_averageUnspecifiedSleepDuration;
}

- (HKQuantity)averageAwakeDuration
{
  return self->_averageAwakeDuration;
}

- (int64_t)bedtimeAchievedCount
{
  return self->_bedtimeAchievedCount;
}

- (int64_t)sleepDurationGoalAchievedCount
{
  return self->_sleepDurationGoalAchievedCount;
}

- (int64_t)sleepDurationGoalStreakCount
{
  return self->_sleepDurationGoalStreakCount;
}

- (HKQuantity)averageBedtimeMiss
{
  return self->_averageBedtimeMiss;
}

- (HKQuantity)averageSleepDurationGoalMiss
{
  return self->_averageSleepDurationGoalMiss;
}

- (NSDateComponents)averageBedtime
{
  return self->_averageBedtime;
}

- (NSDateComponents)averageWakeTime
{
  return self->_averageWakeTime;
}

- (NSDateComponents)averageInBedStartTime
{
  return self->_averageInBedStartTime;
}

- (NSDateComponents)averageInBedEndTime
{
  return self->_averageInBedEndTime;
}

- (NSDateComponents)averageSleepStartTime
{
  return self->_averageSleepStartTime;
}

- (NSDateComponents)averageSleepEndTime
{
  return self->_averageSleepEndTime;
}

- (NSNumber)standardDeviationActualTimeAsleep
{
  return self->_standardDeviationActualTimeAsleep;
}

- (NSNumber)standardDeviationScheduledTimeAsleep
{
  return self->_standardDeviationScheduledTimeAsleep;
}

- (NSNumber)standardDeviationActualVsScheduledTimeAsleep
{
  return self->_standardDeviationActualVsScheduledTimeAsleep;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardDeviationActualVsScheduledTimeAsleep, 0);
  objc_storeStrong((id *)&self->_standardDeviationScheduledTimeAsleep, 0);
  objc_storeStrong((id *)&self->_standardDeviationActualTimeAsleep, 0);
  objc_storeStrong((id *)&self->_averageSleepEndTime, 0);
  objc_storeStrong((id *)&self->_averageSleepStartTime, 0);
  objc_storeStrong((id *)&self->_averageInBedEndTime, 0);
  objc_storeStrong((id *)&self->_averageInBedStartTime, 0);
  objc_storeStrong((id *)&self->_averageWakeTime, 0);
  objc_storeStrong((id *)&self->_averageBedtime, 0);
  objc_storeStrong((id *)&self->_averageSleepDurationGoalMiss, 0);
  objc_storeStrong((id *)&self->_averageBedtimeMiss, 0);
  objc_storeStrong((id *)&self->_averageAwakeDuration, 0);
  objc_storeStrong((id *)&self->_averageUnspecifiedSleepDuration, 0);
  objc_storeStrong((id *)&self->_averageDeepSleepDuration, 0);
  objc_storeStrong((id *)&self->_averageCoreSleepDuration, 0);
  objc_storeStrong((id *)&self->_averageREMSleepDuration, 0);
  objc_storeStrong((id *)&self->_averageInBedDuration, 0);
  objc_storeStrong((id *)&self->_averageSleepDuration, 0);
}

@end