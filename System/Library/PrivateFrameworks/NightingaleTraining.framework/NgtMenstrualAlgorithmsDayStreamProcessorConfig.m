@interface NgtMenstrualAlgorithmsDayStreamProcessorConfig
+ (BOOL)supportsSecureCoding;
- (NSDateComponents)birthDateComponents;
- (NSNumber)awakeSHRCountThreshold;
- (NSNumber)julianDayOfUserReportedCycleLength;
- (NSNumber)julianDayOfUserReportedMenstruationLength;
- (NSNumber)sleepSHRCountThreshold;
- (NSNumber)userReportedCycleLength;
- (NSNumber)userReportedMenstruationLength;
- (NgtMenstrualAlgorithmsDayStreamProcessorConfig)initWithCoder:(id)a3;
- (NgtMenstrualAlgorithmsDeviationInput)deviationInput;
- (unsigned)todayAsJulianDay;
- (void)encodeWithCoder:(id)a3;
- (void)setAwakeSHRCountThreshold:(id)a3;
- (void)setBirthDateComponents:(id)a3;
- (void)setDeviationInput:(id)a3;
- (void)setJulianDayOfUserReportedCycleLength:(id)a3;
- (void)setJulianDayOfUserReportedMenstruationLength:(id)a3;
- (void)setSleepSHRCountThreshold:(id)a3;
- (void)setTodayAsJulianDay:(unsigned int)a3;
- (void)setUserReportedCycleLength:(id)a3;
- (void)setUserReportedMenstruationLength:(id)a3;
@end

@implementation NgtMenstrualAlgorithmsDayStreamProcessorConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NgtMenstrualAlgorithmsDayStreamProcessorConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)NgtMenstrualAlgorithmsDayStreamProcessorConfig;
  v5 = [(NgtMenstrualAlgorithmsDayStreamProcessorConfig *)&v41 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_userReportedCycleLength);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    userReportedCycleLength = v5->_userReportedCycleLength;
    v5->_userReportedCycleLength = (NSNumber *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_julianDayOfUserReportedCycleLength);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    julianDayOfUserReportedCycleLength = v5->_julianDayOfUserReportedCycleLength;
    v5->_julianDayOfUserReportedCycleLength = (NSNumber *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_userReportedMenstruationLength);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    userReportedMenstruationLength = v5->_userReportedMenstruationLength;
    v5->_userReportedMenstruationLength = (NSNumber *)v16;

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_julianDayOfUserReportedMenstruationLength);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    julianDayOfUserReportedMenstruationLength = v5->_julianDayOfUserReportedMenstruationLength;
    v5->_julianDayOfUserReportedMenstruationLength = (NSNumber *)v20;

    uint64_t v22 = objc_opt_class();
    v23 = NSStringFromSelector(sel_awakeSHRCountThreshold);
    uint64_t v24 = [v4 decodeObjectOfClass:v22 forKey:v23];
    awakeSHRCountThreshold = v5->_awakeSHRCountThreshold;
    v5->_awakeSHRCountThreshold = (NSNumber *)v24;

    uint64_t v26 = objc_opt_class();
    v27 = NSStringFromSelector(sel_sleepSHRCountThreshold);
    uint64_t v28 = [v4 decodeObjectOfClass:v26 forKey:v27];
    sleepSHRCountThreshold = v5->_sleepSHRCountThreshold;
    v5->_sleepSHRCountThreshold = (NSNumber *)v28;

    uint64_t v30 = objc_opt_class();
    v31 = NSStringFromSelector(sel_birthDateComponents);
    uint64_t v32 = [v4 decodeObjectOfClass:v30 forKey:v31];
    birthDateComponents = v5->_birthDateComponents;
    v5->_birthDateComponents = (NSDateComponents *)v32;

    uint64_t v34 = objc_opt_class();
    v35 = NSStringFromSelector(sel_deviationInput);
    uint64_t v36 = [v4 decodeObjectOfClass:v34 forKey:v35];
    deviationInput = v5->_deviationInput;
    v5->_deviationInput = (NgtMenstrualAlgorithmsDeviationInput *)v36;

    v38 = NSStringFromSelector(sel_todayAsJulianDay);
    v5->_todayAsJulianDay = [v4 decodeInt32ForKey:v38];

    v39 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v22 = a3;
  userReportedCycleLength = self->_userReportedCycleLength;
  v5 = NSStringFromSelector(sel_userReportedCycleLength);
  [v22 encodeObject:userReportedCycleLength forKey:v5];

  julianDayOfUserReportedCycleLength = self->_julianDayOfUserReportedCycleLength;
  v7 = NSStringFromSelector(sel_julianDayOfUserReportedCycleLength);
  [v22 encodeObject:julianDayOfUserReportedCycleLength forKey:v7];

  userReportedMenstruationLength = self->_userReportedMenstruationLength;
  v9 = NSStringFromSelector(sel_userReportedMenstruationLength);
  [v22 encodeObject:userReportedMenstruationLength forKey:v9];

  julianDayOfUserReportedMenstruationLength = self->_julianDayOfUserReportedMenstruationLength;
  v11 = NSStringFromSelector(sel_julianDayOfUserReportedMenstruationLength);
  [v22 encodeObject:julianDayOfUserReportedMenstruationLength forKey:v11];

  awakeSHRCountThreshold = self->_awakeSHRCountThreshold;
  v13 = NSStringFromSelector(sel_awakeSHRCountThreshold);
  [v22 encodeObject:awakeSHRCountThreshold forKey:v13];

  sleepSHRCountThreshold = self->_sleepSHRCountThreshold;
  v15 = NSStringFromSelector(sel_sleepSHRCountThreshold);
  [v22 encodeObject:sleepSHRCountThreshold forKey:v15];

  birthDateComponents = self->_birthDateComponents;
  v17 = NSStringFromSelector(sel_birthDateComponents);
  [v22 encodeObject:birthDateComponents forKey:v17];

  deviationInput = self->_deviationInput;
  v19 = NSStringFromSelector(sel_deviationInput);
  [v22 encodeObject:deviationInput forKey:v19];

  uint64_t todayAsJulianDay = self->_todayAsJulianDay;
  v21 = NSStringFromSelector(sel_todayAsJulianDay);
  [v22 encodeInt32:todayAsJulianDay forKey:v21];
}

- (NSNumber)userReportedCycleLength
{
  return self->_userReportedCycleLength;
}

- (void)setUserReportedCycleLength:(id)a3
{
}

- (NSNumber)julianDayOfUserReportedCycleLength
{
  return self->_julianDayOfUserReportedCycleLength;
}

- (void)setJulianDayOfUserReportedCycleLength:(id)a3
{
}

- (NSNumber)userReportedMenstruationLength
{
  return self->_userReportedMenstruationLength;
}

- (void)setUserReportedMenstruationLength:(id)a3
{
}

- (NSNumber)julianDayOfUserReportedMenstruationLength
{
  return self->_julianDayOfUserReportedMenstruationLength;
}

- (void)setJulianDayOfUserReportedMenstruationLength:(id)a3
{
}

- (NSNumber)awakeSHRCountThreshold
{
  return self->_awakeSHRCountThreshold;
}

- (void)setAwakeSHRCountThreshold:(id)a3
{
}

- (NSNumber)sleepSHRCountThreshold
{
  return self->_sleepSHRCountThreshold;
}

- (void)setSleepSHRCountThreshold:(id)a3
{
}

- (NSDateComponents)birthDateComponents
{
  return self->_birthDateComponents;
}

- (void)setBirthDateComponents:(id)a3
{
}

- (NgtMenstrualAlgorithmsDeviationInput)deviationInput
{
  return self->_deviationInput;
}

- (void)setDeviationInput:(id)a3
{
}

- (unsigned)todayAsJulianDay
{
  return self->_todayAsJulianDay;
}

- (void)setTodayAsJulianDay:(unsigned int)a3
{
  self->_uint64_t todayAsJulianDay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviationInput, 0);
  objc_storeStrong((id *)&self->_birthDateComponents, 0);
  objc_storeStrong((id *)&self->_sleepSHRCountThreshold, 0);
  objc_storeStrong((id *)&self->_awakeSHRCountThreshold, 0);
  objc_storeStrong((id *)&self->_julianDayOfUserReportedMenstruationLength, 0);
  objc_storeStrong((id *)&self->_userReportedMenstruationLength, 0);
  objc_storeStrong((id *)&self->_julianDayOfUserReportedCycleLength, 0);
  objc_storeStrong((id *)&self->_userReportedCycleLength, 0);
}

@end