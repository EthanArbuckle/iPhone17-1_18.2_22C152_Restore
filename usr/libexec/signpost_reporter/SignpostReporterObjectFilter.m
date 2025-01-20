@interface SignpostReporterObjectFilter
- (BOOL)_objectPassesStringFilter:(id)a3;
- (BOOL)shouldReportSignpostObject:(id)a3 classificationOut:(unint64_t *)a4;
- (SRSubsystemCategoryNameFilter)scnFilter;
- (SignpostReporterAggregation)allInspectedSignpostObjectsAggregation;
- (SignpostReporterAggregation)telemetryDisabledAggregation;
- (SignpostReporterAggregation)telemetryNotReportedClassNotSupportedAggregation;
- (SignpostReporterAggregation)telemetryNotReportedDurationThresholdAggregation;
- (SignpostReporterAggregation)telemetryNotReportedFailedSCFilterAggregation;
- (SignpostReporterAggregation)telemetryNotReportedFailedStringAllowlistAggregation;
- (SignpostReporterAggregation)telemetryReportedAggregation;
- (SignpostReporterAggregation)telemetryReportedEventsAggregation;
- (SignpostReporterObjectFilter)init;
- (SignpostReporterObjectFilter)initWithPlatform:(unint64_t)a3;
- (id)_init;
- (unint64_t)platform;
- (unint64_t)totalReportedAnimationCount;
- (unint64_t)totalReportedEventCount;
- (unint64_t)totalReportedIntervalCount;
- (unint64_t)totalUnreportedAnimationCount;
- (unint64_t)totalUnreportedEventCount;
- (unint64_t)totalUnreportedIntervalCount;
- (void)incrementTotalForObject:(id)a3 classification:(unint64_t)a4;
- (void)setScnFilter:(id)a3;
@end

@implementation SignpostReporterObjectFilter

- (BOOL)_objectPassesStringFilter:(id)a3
{
  id v4 = a3;
  if ((id)[(SignpostReporterObjectFilter *)self platform] != (id)1) {
    goto LABEL_5;
  }
  v5 = [v4 subsystem];
  v6 = [v4 category];
  v7 = [v4 name];
  int v8 = IsPerfLoggingInterval();

  if (v8)
  {
    v9 = [v4 string1Value];
    v10 = [v4 string2Value];
    int v11 = PassesPerfLoggingAllowlist();

    if (!v11) {
      goto LABEL_21;
    }
    char v12 = 1;
  }
  else
  {
LABEL_5:
    char v12 = 0;
  }
  if (!SignpostReporterShouldUseAllowlist())
  {
LABEL_19:
    LOBYTE(v20) = 1;
    goto LABEL_20;
  }
  v13 = [v4 string1Name];

  if (v13) {
    char v14 = v12;
  }
  else {
    char v14 = 1;
  }
  if ((v14 & 1) == 0 && (sub_1000039C8(v4, [(SignpostReporterObjectFilter *)self platform]) & 1) == 0)
  {
    v15 = [v4 string1Value];
    [(SignpostReporterObjectFilter *)self platform];
    int v16 = StringPassesSignpostReporterStringAllowlist();

    if (!v16)
    {
LABEL_21:
      LOBYTE(v20) = 0;
      goto LABEL_20;
    }
  }
  v17 = [v4 string2Name];

  if (v17) {
    char v18 = v12;
  }
  else {
    char v18 = 1;
  }
  if (v18) {
    goto LABEL_19;
  }
  if (sub_100003DAC(v4)) {
    goto LABEL_19;
  }
  v19 = [v4 string2Value];
  [(SignpostReporterObjectFilter *)self platform];
  int v20 = StringPassesSignpostReporterStringAllowlist();

  if (v20) {
    goto LABEL_19;
  }
LABEL_20:

  return v20;
}

- (BOOL)shouldReportSignpostObject:(id)a3 classificationOut:(unint64_t *)a4
{
  id v6 = a3;
  if ([v6 canGenerateCoreAnalyticsPayload])
  {
    if ([v6 telemetryEnabled])
    {
      [v6 durationSeconds];
      if (v7 >= 0.0)
      {
        if ([(SignpostReporterObjectFilter *)self _objectPassesStringFilter:v6])
        {
          uint64_t v11 = [(SignpostReporterObjectFilter *)self scnFilter];
          if (v11)
          {
            char v12 = (void *)v11;
            v13 = [(SignpostReporterObjectFilter *)self scnFilter];
            unsigned int v8 = [v13 shouldReportObject:v6];

            if (v8) {
              unint64_t v9 = 1;
            }
            else {
              unint64_t v9 = 4;
            }
          }
          else
          {
            LOBYTE(v8) = 1;
            unint64_t v9 = 1;
          }
        }
        else
        {
          LOBYTE(v8) = 0;
          unint64_t v9 = 2;
        }
      }
      else
      {
        LOBYTE(v8) = 0;
        unint64_t v9 = 3;
      }
    }
    else
    {
      LOBYTE(v8) = 0;
      unint64_t v9 = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
    unint64_t v9 = 5;
  }
  if (a4) {
    *a4 = v9;
  }
  [(SignpostReporterObjectFilter *)self incrementTotalForObject:v6 classification:v9];

  return v8;
}

- (id)_init
{
  v20.receiver = self;
  v20.super_class = (Class)SignpostReporterObjectFilter;
  v2 = [(SignpostReporterObjectFilter *)&v20 init];
  if (v2)
  {
    v3 = objc_alloc_init(SignpostReporterAggregation);
    allInspectedSignpostObjectsAggregation = v2->_allInspectedSignpostObjectsAggregation;
    v2->_allInspectedSignpostObjectsAggregation = v3;

    v5 = objc_alloc_init(SignpostReporterAggregation);
    telemetryReportedAggregation = v2->_telemetryReportedAggregation;
    v2->_telemetryReportedAggregation = v5;

    float v7 = objc_alloc_init(SignpostReporterAggregation);
    telemetryDisabledAggregation = v2->_telemetryDisabledAggregation;
    v2->_telemetryDisabledAggregation = v7;

    unint64_t v9 = objc_alloc_init(SignpostReporterAggregation);
    telemetryNotReportedFailedStringAllowlistAggregation = v2->_telemetryNotReportedFailedStringAllowlistAggregation;
    v2->_telemetryNotReportedFailedStringAllowlistAggregation = v9;

    uint64_t v11 = objc_alloc_init(SignpostReporterAggregation);
    telemetryNotReportedFailedSCFilterAggregation = v2->_telemetryNotReportedFailedSCFilterAggregation;
    v2->_telemetryNotReportedFailedSCFilterAggregation = v11;

    v13 = objc_alloc_init(SignpostReporterAggregation);
    telemetryNotReportedDurationThresholdAggregation = v2->_telemetryNotReportedDurationThresholdAggregation;
    v2->_telemetryNotReportedDurationThresholdAggregation = v13;

    v15 = objc_alloc_init(SignpostReporterAggregation);
    telemetryNotReportedClassNotSupportedAggregation = v2->_telemetryNotReportedClassNotSupportedAggregation;
    v2->_telemetryNotReportedClassNotSupportedAggregation = v15;

    v17 = objc_alloc_init(SignpostReporterAggregation);
    telemetryReportedEventsAggregation = v2->_telemetryReportedEventsAggregation;
    v2->_telemetryReportedEventsAggregation = v17;
  }
  return v2;
}

- (SignpostReporterObjectFilter)init
{
  v2 = [(SignpostReporterObjectFilter *)self _init];
  if (v2)
  {
    v2->_platform = sub_1000024D8();
    uint64_t v3 = sub_100002B64([(SignpostReporterObjectFilter *)v2 platform]);
    scnFilter = v2->_scnFilter;
    v2->_scnFilter = (SRSubsystemCategoryNameFilter *)v3;
  }
  return v2;
}

- (SignpostReporterObjectFilter)initWithPlatform:(unint64_t)a3
{
  if (a3)
  {
    id v4 = [(SignpostReporterObjectFilter *)self _init];
    v5 = v4;
    if (v4)
    {
      v4[1] = a3;
      uint64_t v6 = sub_100002B64((uint64_t)[v4 platform]);
      float v7 = (void *)v5[16];
      v5[16] = v6;
    }
    self = v5;
    unsigned int v8 = self;
  }
  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

- (void)incrementTotalForObject:(id)a3 classification:(unint64_t)a4
{
  id v13 = a3;
  uint64_t v6 = [v13 subsystem];
  float v7 = [v13 category];
  unsigned int v8 = [(SignpostReporterObjectFilter *)self allInspectedSignpostObjectsAggregation];
  [v8 incrementSubsystem:v6 category:v7];

  switch(a4)
  {
    case 0uLL:
      uint64_t v9 = [(SignpostReporterObjectFilter *)self telemetryDisabledAggregation];
      goto LABEL_9;
    case 1uLL:
      uint64_t v11 = [(SignpostReporterObjectFilter *)self telemetryReportedAggregation];
      int v10 = 1;
      goto LABEL_10;
    case 2uLL:
      uint64_t v9 = [(SignpostReporterObjectFilter *)self telemetryNotReportedFailedStringAllowlistAggregation];
      goto LABEL_9;
    case 3uLL:
      uint64_t v9 = [(SignpostReporterObjectFilter *)self telemetryNotReportedDurationThresholdAggregation];
      goto LABEL_9;
    case 4uLL:
      uint64_t v9 = [(SignpostReporterObjectFilter *)self telemetryNotReportedFailedSCFilterAggregation];
      goto LABEL_9;
    case 5uLL:
      uint64_t v9 = [(SignpostReporterObjectFilter *)self telemetryNotReportedClassNotSupportedAggregation];
LABEL_9:
      uint64_t v11 = (void *)v9;
      int v10 = 0;
LABEL_10:
      [v11 incrementSubsystem:v6 category:v7];

      break;
    default:
      int v10 = 0;
      break;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v10) {
      ++self->_totalReportedAnimationCount;
    }
    else {
      ++self->_totalUnreportedAnimationCount;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v10) {
        ++self->_totalReportedIntervalCount;
      }
      else {
        ++self->_totalUnreportedIntervalCount;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v10)
        {
          ++self->_totalReportedEventCount;
          char v12 = [(SignpostReporterObjectFilter *)self telemetryReportedEventsAggregation];
          [v12 incrementSubsystem:v6 category:v7];
        }
        else
        {
          ++self->_totalUnreportedEventCount;
        }
      }
    }
  }
}

- (unint64_t)platform
{
  return self->_platform;
}

- (SignpostReporterAggregation)allInspectedSignpostObjectsAggregation
{
  return self->_allInspectedSignpostObjectsAggregation;
}

- (SignpostReporterAggregation)telemetryReportedEventsAggregation
{
  return self->_telemetryReportedEventsAggregation;
}

- (SignpostReporterAggregation)telemetryReportedAggregation
{
  return self->_telemetryReportedAggregation;
}

- (SignpostReporterAggregation)telemetryDisabledAggregation
{
  return self->_telemetryDisabledAggregation;
}

- (SignpostReporterAggregation)telemetryNotReportedFailedStringAllowlistAggregation
{
  return self->_telemetryNotReportedFailedStringAllowlistAggregation;
}

- (SignpostReporterAggregation)telemetryNotReportedFailedSCFilterAggregation
{
  return self->_telemetryNotReportedFailedSCFilterAggregation;
}

- (SignpostReporterAggregation)telemetryNotReportedDurationThresholdAggregation
{
  return self->_telemetryNotReportedDurationThresholdAggregation;
}

- (SignpostReporterAggregation)telemetryNotReportedClassNotSupportedAggregation
{
  return self->_telemetryNotReportedClassNotSupportedAggregation;
}

- (unint64_t)totalUnreportedIntervalCount
{
  return self->_totalUnreportedIntervalCount;
}

- (unint64_t)totalReportedIntervalCount
{
  return self->_totalReportedIntervalCount;
}

- (unint64_t)totalUnreportedAnimationCount
{
  return self->_totalUnreportedAnimationCount;
}

- (unint64_t)totalReportedAnimationCount
{
  return self->_totalReportedAnimationCount;
}

- (unint64_t)totalUnreportedEventCount
{
  return self->_totalUnreportedEventCount;
}

- (unint64_t)totalReportedEventCount
{
  return self->_totalReportedEventCount;
}

- (SRSubsystemCategoryNameFilter)scnFilter
{
  return self->_scnFilter;
}

- (void)setScnFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scnFilter, 0);
  objc_storeStrong((id *)&self->_telemetryNotReportedClassNotSupportedAggregation, 0);
  objc_storeStrong((id *)&self->_telemetryNotReportedDurationThresholdAggregation, 0);
  objc_storeStrong((id *)&self->_telemetryNotReportedFailedSCFilterAggregation, 0);
  objc_storeStrong((id *)&self->_telemetryNotReportedFailedStringAllowlistAggregation, 0);
  objc_storeStrong((id *)&self->_telemetryDisabledAggregation, 0);
  objc_storeStrong((id *)&self->_telemetryReportedAggregation, 0);
  objc_storeStrong((id *)&self->_telemetryReportedEventsAggregation, 0);

  objc_storeStrong((id *)&self->_allInspectedSignpostObjectsAggregation, 0);
}

@end