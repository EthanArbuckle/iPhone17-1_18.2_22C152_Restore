@interface SignpostAggregationGroupDuration
+ (id)_sumOfDuration0:(id)a3 duration1:(id)a4 errorOut:(id *)a5;
- (BOOL)_isTotalDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)telemetryEnabled;
- (NSNumber)_durationValue;
- (NSNumber)maxDurationMs;
- (NSNumber)maxDurationNs;
- (NSNumber)maxDurationSeconds;
- (NSNumber)minDurationMs;
- (NSNumber)minDurationNs;
- (NSNumber)minDurationSeconds;
- (NSNumber)stdDevMs;
- (NSNumber)stdDevNs;
- (NSNumber)stdDevSeconds;
- (NSString)groupName;
- (NSString)type;
- (NSString)unit;
- (SignpostAggregationValueStats)stats;
- (double)averageDurationMs;
- (double)averageDurationNs;
- (double)averageDurationSeconds;
- (double)totalDurationMs;
- (double)totalDurationNs;
- (double)totalDurationSeconds;
- (id)_coreAnalyticsMaxFieldName;
- (id)_coreAnalyticsMinFieldName;
- (id)_coreAnalyticsStdDevFieldName;
- (id)_coreAnalyticsTotalFieldName;
- (id)_dictionaryRepresentation;
- (id)_initWithGroup:(id)a3 type:(id)a4;
- (id)_initWithParser:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)total;
- (void)setTelemetryEnabled:(BOOL)a3;
@end

@implementation SignpostAggregationGroupDuration

- (id)_initWithGroup:(id)a3 type:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SignpostAggregationGroupDuration;
  v9 = [(SignpostAggregationGroupDuration *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_groupName, a3);
    objc_storeStrong((id *)&v10->_type, a4);
    v11 = objc_alloc_init(SignpostAggregationValueStats);
    stats = v10->_stats;
    v10->_stats = v11;
  }
  return v10;
}

- (id)_initWithParser:(id)a3
{
  id v4 = a3;
  v5 = [v4 group];
  v6 = [v4 type];

  id v7 = [(SignpostAggregationGroupDuration *)self _initWithGroup:v5 type:v6];
  return v7;
}

- (id)_dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(SignpostAggregationGroupDuration *)self type];
  [v3 setObject:v4 forKeyedSubscript:kAggTypeKey];

  v5 = NSNumber;
  [(SignpostAggregationGroupDuration *)self totalDurationNs];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  [v3 setObject:v6 forKeyedSubscript:kAggTotalDurationNsKey];

  id v7 = NSNumber;
  [(SignpostAggregationGroupDuration *)self averageDurationNs];
  id v8 = objc_msgSend(v7, "numberWithDouble:");
  [v3 setObject:v8 forKeyedSubscript:kAggAverageDurationNsKey];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[SignpostAggregationGroupDuration telemetryEnabled](self, "telemetryEnabled"));
  [v3 setObject:v9 forKeyedSubscript:kAggTelemetryEnabledKey];

  v10 = [(SignpostAggregationGroupDuration *)self minDurationNs];

  if (v10)
  {
    v11 = [(SignpostAggregationGroupDuration *)self minDurationNs];
    [v3 setObject:v11 forKeyedSubscript:kAggMinDurationNsKey];
  }
  v12 = [(SignpostAggregationGroupDuration *)self maxDurationNs];

  if (v12)
  {
    v13 = [(SignpostAggregationGroupDuration *)self maxDurationNs];
    [v3 setObject:v13 forKeyedSubscript:kAggMaxDurationNsKey];
  }
  objc_super v14 = [(SignpostAggregationGroupDuration *)self stdDevNs];

  if (v14)
  {
    v15 = [(SignpostAggregationGroupDuration *)self stdDevNs];
    [v3 setObject:v15 forKeyedSubscript:kAggDurationStdDevNsKey];
  }

  return v3;
}

- (id)_coreAnalyticsTotalFieldName
{
  id v3 = NSString;
  id v4 = [(SignpostAggregationGroupDuration *)self groupName];
  v5 = [(SignpostAggregationGroupDuration *)self type];
  v6 = [v3 stringWithFormat:@"%@__%@__TotalDuration", v4, v5];

  return v6;
}

- (id)_coreAnalyticsMinFieldName
{
  id v3 = NSString;
  id v4 = [(SignpostAggregationGroupDuration *)self groupName];
  v5 = [(SignpostAggregationGroupDuration *)self type];
  v6 = [v3 stringWithFormat:@"%@__%@__MinDuration", v4, v5];

  return v6;
}

- (id)_coreAnalyticsMaxFieldName
{
  id v3 = NSString;
  id v4 = [(SignpostAggregationGroupDuration *)self groupName];
  v5 = [(SignpostAggregationGroupDuration *)self type];
  v6 = [v3 stringWithFormat:@"%@__%@__MaxDuration", v4, v5];

  return v6;
}

- (id)_coreAnalyticsStdDevFieldName
{
  id v3 = NSString;
  id v4 = [(SignpostAggregationGroupDuration *)self groupName];
  v5 = [(SignpostAggregationGroupDuration *)self type];
  v6 = [v3 stringWithFormat:@"%@__%@__DurationStdDev", v4, v5];

  return v6;
}

- (NSString)unit
{
  return (NSString *)@"seconds";
}

- (id)total
{
  v2 = NSNumber;
  [(SignpostAggregationGroupDuration *)self totalDurationSeconds];

  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SignpostAggregationGroupDuration alloc];
  v5 = [(SignpostAggregationGroupDuration *)self groupName];
  v6 = [(SignpostAggregationGroupDuration *)self type];
  id v7 = [(SignpostAggregationGroupDuration *)v4 _initWithGroup:v5 type:v6];

  objc_msgSend(v7, "setTelemetryEnabled:", -[SignpostAggregationGroupDuration telemetryEnabled](self, "telemetryEnabled"));
  id v8 = [(SignpostAggregationGroupDuration *)self stats];
  uint64_t v9 = [v8 copy];
  v10 = (void *)v7[4];
  v7[4] = v9;

  return v7;
}

- (double)totalDurationNs
{
  v2 = [(SignpostAggregationGroupDuration *)self stats];
  id v3 = [v2 total];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)totalDurationMs
{
  [(SignpostAggregationGroupDuration *)self totalDurationNs];
  return v2 / 1000000.0;
}

- (double)totalDurationSeconds
{
  [(SignpostAggregationGroupDuration *)self totalDurationNs];
  return v2 / 1000000000.0;
}

- (double)averageDurationNs
{
  double v2 = [(SignpostAggregationGroupDuration *)self stats];
  id v3 = [v2 average];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)averageDurationMs
{
  [(SignpostAggregationGroupDuration *)self averageDurationNs];
  return v2 / 1000000.0;
}

- (double)averageDurationSeconds
{
  [(SignpostAggregationGroupDuration *)self averageDurationNs];
  return v2 / 1000000000.0;
}

- (NSNumber)minDurationNs
{
  double v2 = [(SignpostAggregationGroupDuration *)self stats];
  id v3 = [v2 min];

  return (NSNumber *)v3;
}

- (NSNumber)minDurationMs
{
  id v3 = [(SignpostAggregationGroupDuration *)self minDurationNs];

  if (v3)
  {
    double v4 = NSNumber;
    double v5 = [(SignpostAggregationGroupDuration *)self minDurationNs];
    [v5 doubleValue];
    id v7 = [v4 numberWithDouble:v6 / 1000000.0];
  }
  else
  {
    id v7 = 0;
  }

  return (NSNumber *)v7;
}

- (NSNumber)minDurationSeconds
{
  id v3 = [(SignpostAggregationGroupDuration *)self minDurationNs];

  if (v3)
  {
    double v4 = NSNumber;
    double v5 = [(SignpostAggregationGroupDuration *)self minDurationNs];
    [v5 doubleValue];
    id v7 = [v4 numberWithDouble:v6 / 1000000000.0];
  }
  else
  {
    id v7 = 0;
  }

  return (NSNumber *)v7;
}

- (NSNumber)maxDurationNs
{
  double v2 = [(SignpostAggregationGroupDuration *)self stats];
  id v3 = [v2 max];

  return (NSNumber *)v3;
}

- (NSNumber)maxDurationMs
{
  id v3 = [(SignpostAggregationGroupDuration *)self maxDurationNs];

  if (v3)
  {
    double v4 = NSNumber;
    double v5 = [(SignpostAggregationGroupDuration *)self maxDurationNs];
    [v5 doubleValue];
    id v7 = [v4 numberWithDouble:v6 / 1000000.0];
  }
  else
  {
    id v7 = 0;
  }

  return (NSNumber *)v7;
}

- (NSNumber)maxDurationSeconds
{
  id v3 = [(SignpostAggregationGroupDuration *)self maxDurationNs];

  if (v3)
  {
    double v4 = NSNumber;
    double v5 = [(SignpostAggregationGroupDuration *)self maxDurationNs];
    [v5 doubleValue];
    id v7 = [v4 numberWithDouble:v6 / 1000000000.0];
  }
  else
  {
    id v7 = 0;
  }

  return (NSNumber *)v7;
}

- (NSNumber)stdDevNs
{
  double v2 = [(SignpostAggregationGroupDuration *)self stats];
  id v3 = [v2 stddev];

  return (NSNumber *)v3;
}

- (NSNumber)stdDevMs
{
  double v2 = [(SignpostAggregationGroupDuration *)self stdDevNs];
  id v3 = v2;
  if (v2)
  {
    double v4 = NSNumber;
    [v2 doubleValue];
    double v6 = [v4 numberWithDouble:v5 / 1000000.0];
  }
  else
  {
    double v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSNumber)stdDevSeconds
{
  double v2 = [(SignpostAggregationGroupDuration *)self stdDevNs];
  id v3 = v2;
  if (v2)
  {
    double v4 = NSNumber;
    [v2 doubleValue];
    double v6 = [v4 numberWithDouble:v5 / 1000000000.0];
  }
  else
  {
    double v6 = 0;
  }

  return (NSNumber *)v6;
}

+ (id)_sumOfDuration0:(id)a3 duration1:(id)a4 errorOut:(id *)a5
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  uint64_t v9 = (void *)v8;
  if (a5)
  {
    *a5 = 0;
    BOOL v10 = v7 == 0;
    BOOL v11 = v8 == 0;
    if (!(v7 | v8))
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:@"Cannot add nil durations"];
      goto LABEL_12;
    }
  }
  else
  {
    BOOL v10 = v7 == 0;
    BOOL v11 = v8 == 0;
  }
  if (v7 && v11)
  {
    unint64_t v8 = v7;
LABEL_11:
    v13 = (id *)[(id)v8 copy];
    goto LABEL_27;
  }
  char v12 = !v10;
  if (!v8) {
    char v12 = 1;
  }
  if ((v12 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_12:
  objc_super v14 = [(id)v7 groupName];
  v15 = [v9 groupName];
  char v16 = [v14 isEqualToString:v15];

  if (v16)
  {
    v17 = [(id)v7 type];
    v18 = [v9 type];
    char v19 = [v17 isEqualToString:v18];

    if (v19)
    {
      int v20 = [(id)v7 telemetryEnabled];
      int v21 = [v9 telemetryEnabled];
      if (a5 && v20 != v21)
      {
        *a5 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:@"Cannot add durations with different telemetry settings"];
      }
      v22 = [(id)v7 stats];
      v23 = [v9 stats];
      id v32 = 0;
      v24 = +[SignpostAggregationValueStats sumOfStats0:v22 stats1:v23 errorOut:&v32];
      id v25 = v32;

      if (v24)
      {
        v13 = (id *)[(id)v7 copy];
        objc_storeStrong(v13 + 4, v24);
      }
      else
      {
        v13 = 0;
        if (a5) {
          *a5 = v25;
        }
      }

      goto LABEL_27;
    }
    v29 = NSString;
    v27 = [(id)v7 type];
    v28 = [v9 type];
    [v29 stringWithFormat:@"Tried to add durations with different type: %@ vs. %@", v27, v28];
  }
  else
  {
    v26 = NSString;
    v27 = [(id)v7 groupName];
    v28 = [v9 groupName];
    [v26 stringWithFormat:@"Tried to add durations with different group names: %@ vs. %@", v27, v28];
  v30 = };

  if (a5)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:v30];
  }

  v13 = 0;
LABEL_27:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  double v5 = (SignpostAggregationGroupDuration *)a3;
  double v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  if (v5 == self)
  {
    BOOL v9 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_9;
  }
  unint64_t v7 = v6;
  BOOL v8 = [(SignpostAggregationGroupDuration *)self telemetryEnabled];
  if (v8 != [(SignpostAggregationGroupDuration *)v7 telemetryEnabled]) {
    goto LABEL_5;
  }
  BOOL v11 = [(SignpostAggregationGroupDuration *)self type];
  uint64_t v12 = [(SignpostAggregationGroupDuration *)v7 type];
  if (v11 == (void *)v12)
  {

    goto LABEL_25;
  }
  v13 = (void *)v12;
  objc_super v14 = [(SignpostAggregationGroupDuration *)self type];
  if (v14)
  {
    v34 = [(SignpostAggregationGroupDuration *)v7 type];
    if (!v34) {
      goto LABEL_28;
    }
  }
  v15 = [(SignpostAggregationGroupDuration *)self type];
  if (v15
    || ([(SignpostAggregationGroupDuration *)v7 type], (v18 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    char v16 = [(SignpostAggregationGroupDuration *)self type];
    v17 = [(SignpostAggregationGroupDuration *)v7 type];
    uint64_t v3 = [v16 isEqual:v17] ^ 1;

    if (v15)
    {

      goto LABEL_22;
    }
    v18 = 0;
  }
  else
  {
    uint64_t v3 = 1;
  }

LABEL_22:
  if (v14)
  {
  }
  if (v3) {
    goto LABEL_5;
  }
LABEL_25:
  BOOL v11 = [(SignpostAggregationGroupDuration *)self groupName];
  uint64_t v19 = [(SignpostAggregationGroupDuration *)v7 groupName];
  if (v11 == (void *)v19)
  {

    goto LABEL_40;
  }
  v13 = (void *)v19;
  objc_super v14 = [(SignpostAggregationGroupDuration *)self groupName];
  if (!v14
    || ([(SignpostAggregationGroupDuration *)v7 groupName],
        (v34 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v20 = [(SignpostAggregationGroupDuration *)self groupName];
    if (v20
      || ([(SignpostAggregationGroupDuration *)v7 groupName],
          (v24 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      int v21 = [(SignpostAggregationGroupDuration *)self groupName];
      v22 = [(SignpostAggregationGroupDuration *)v7 groupName];
      uint64_t v3 = [v21 isEqual:v22] ^ 1;

      if (v20)
      {

        v23 = v34;
        if (!v14)
        {
LABEL_39:

          if (v3) {
            goto LABEL_5;
          }
LABEL_40:
          id v25 = [(SignpostAggregationGroupDuration *)self stats];
          uint64_t v26 = [(SignpostAggregationGroupDuration *)v7 stats];
          if (v25 == (void *)v26)
          {

            goto LABEL_55;
          }
          v27 = (void *)v26;
          v28 = [(SignpostAggregationGroupDuration *)self stats];
          if (v28)
          {
            uint64_t v3 = [(SignpostAggregationGroupDuration *)v7 stats];
            if (!v3)
            {
              LOBYTE(v29) = 1;
              goto LABEL_54;
            }
          }
          v30 = [(SignpostAggregationGroupDuration *)self stats];
          if (v30
            || ([(SignpostAggregationGroupDuration *)v7 stats],
                (v33 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            v31 = [(SignpostAggregationGroupDuration *)self stats];
            id v32 = [(SignpostAggregationGroupDuration *)v7 stats];
            int v29 = [v31 isEqual:v32] ^ 1;

            if (v30)
            {

              if (v28) {
                goto LABEL_54;
              }
              goto LABEL_48;
            }
            v33 = 0;
          }
          else
          {
            int v29 = 1;
          }

          if (v28)
          {
LABEL_54:

            if (v29) {
              goto LABEL_5;
            }
            goto LABEL_55;
          }
LABEL_48:

          if (v29) {
            goto LABEL_5;
          }
LABEL_55:
          BOOL v9 = 1;
          goto LABEL_6;
        }
LABEL_38:

        goto LABEL_39;
      }
      v24 = 0;
    }
    else
    {
      uint64_t v3 = 1;
    }
    v23 = v34;

    if (!v14) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_28:

LABEL_5:
  BOOL v9 = 0;
LABEL_6:

LABEL_9:
  return v9;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (BOOL)telemetryEnabled
{
  return self->_telemetryEnabled;
}

- (void)setTelemetryEnabled:(BOOL)a3
{
  self->_telemetryEnabled = a3;
}

- (SignpostAggregationValueStats)stats
{
  return self->_stats;
}

- (BOOL)_isTotalDuration
{
  return self->__isTotalDuration;
}

- (NSNumber)_durationValue
{
  return self->__durationValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__durationValue, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_groupName, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end