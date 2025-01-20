@interface SignpostAggregationGroupMeasuredValue
+ (id)_sumOfValue0:(id)a3 value1:(id)a4 errorOut:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAdd;
- (BOOL)telemetryEnabled;
- (NSNumber)average;
- (NSNumber)max;
- (NSNumber)min;
- (NSNumber)stddev;
- (NSNumber)total;
- (NSString)groupName;
- (NSString)type;
- (NSString)unit;
- (SignpostAggregationGroupMeasuredValue)initWithGroupName:(id)a3 type:(id)a4 unit:(id)a5;
- (SignpostAggregationValueStats)stats;
- (id)_coreAnalyticsMaxFieldName;
- (id)_coreAnalyticsMinFieldName;
- (id)_coreAnalyticsStdDevFieldName;
- (id)_coreAnalyticsTotalFieldName;
- (id)_dictionaryRepresentation;
- (id)_initWithParser:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (void)setTelemetryEnabled:(BOOL)a3;
@end

@implementation SignpostAggregationGroupMeasuredValue

- (SignpostAggregationGroupMeasuredValue)initWithGroupName:(id)a3 type:(id)a4 unit:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v9 && v10 && v11)
  {
    v19.receiver = self;
    v19.super_class = (Class)SignpostAggregationGroupMeasuredValue;
    v14 = [(SignpostAggregationGroupMeasuredValue *)&v19 init];
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_groupName, a3);
      objc_storeStrong((id *)&v15->_type, a4);
      objc_storeStrong((id *)&v15->_unit, a5);
      v16 = objc_alloc_init(SignpostAggregationValueStats);
      stats = v15->_stats;
      v15->_stats = v16;
    }
    self = v15;
    v13 = self;
  }

  return v13;
}

- (id)_initWithParser:(id)a3
{
  id v4 = a3;
  v5 = [v4 group];
  v6 = [v4 type];
  v7 = [v4 unit];

  v8 = [(SignpostAggregationGroupMeasuredValue *)self initWithGroupName:v5 type:v6 unit:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SignpostAggregationGroupMeasuredValue *)a3;
  v6 = v5;
  if (v5)
  {
    if (v5 == self)
    {
      BOOL v12 = 1;
      goto LABEL_53;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      v8 = [(SignpostAggregationGroupMeasuredValue *)self groupName];
      uint64_t v9 = [(SignpostAggregationGroupMeasuredValue *)v7 groupName];
      if (v8 == (void *)v9)
      {

        goto LABEL_21;
      }
      id v10 = (void *)v9;
      id v11 = [(SignpostAggregationGroupMeasuredValue *)self groupName];
      if (v11)
      {
        v42 = [(SignpostAggregationGroupMeasuredValue *)v7 groupName];
        if (!v42) {
          goto LABEL_39;
        }
      }
      v13 = [(SignpostAggregationGroupMeasuredValue *)self groupName];
      if (v13
        || ([(SignpostAggregationGroupMeasuredValue *)v7 groupName],
            (v18 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v14 = [(SignpostAggregationGroupMeasuredValue *)self groupName];
        v15 = v7;
        v16 = [(SignpostAggregationGroupMeasuredValue *)v7 groupName];
        char v17 = [v14 isEqual:v16] ^ 1;

        if (v13)
        {

          v7 = v15;
          v3 = v42;
          if (!v11)
          {
LABEL_20:

            if (v17)
            {
LABEL_51:
              BOOL v12 = 0;
LABEL_52:

              goto LABEL_53;
            }
LABEL_21:
            v8 = [(SignpostAggregationGroupMeasuredValue *)self type];
            uint64_t v19 = [(SignpostAggregationGroupMeasuredValue *)v7 type];
            if (v8 == (void *)v19)
            {

              goto LABEL_36;
            }
            id v10 = (void *)v19;
            id v11 = [(SignpostAggregationGroupMeasuredValue *)self type];
            if (v11)
            {
              v42 = [(SignpostAggregationGroupMeasuredValue *)v7 type];
              if (!v42) {
                goto LABEL_39;
              }
            }
            v20 = [(SignpostAggregationGroupMeasuredValue *)self type];
            if (v20
              || ([(SignpostAggregationGroupMeasuredValue *)v7 type],
                  (v24 = objc_claimAutoreleasedReturnValue()) == 0))
            {
              v21 = [(SignpostAggregationGroupMeasuredValue *)self type];
              v3 = v7;
              v22 = [(SignpostAggregationGroupMeasuredValue *)v7 type];
              char v23 = [v21 isEqual:v22] ^ 1;

              if (v20)
              {

                v7 = v3;
                goto LABEL_33;
              }
              v24 = 0;
              v7 = v3;
            }
            else
            {
              char v23 = 1;
            }

LABEL_33:
            if (v11)
            {
            }
            if (v23) {
              goto LABEL_51;
            }
LABEL_36:
            v8 = [(SignpostAggregationGroupMeasuredValue *)self unit];
            uint64_t v25 = [(SignpostAggregationGroupMeasuredValue *)v7 unit];
            if (v8 == (void *)v25)
            {

              goto LABEL_54;
            }
            id v10 = (void *)v25;
            id v11 = [(SignpostAggregationGroupMeasuredValue *)self unit];
            if (v11)
            {
              v42 = [(SignpostAggregationGroupMeasuredValue *)v7 unit];
              if (!v42)
              {
LABEL_39:

                goto LABEL_51;
              }
            }
            v26 = [(SignpostAggregationGroupMeasuredValue *)self unit];
            if (v26
              || ([(SignpostAggregationGroupMeasuredValue *)v7 unit],
                  (v31 = objc_claimAutoreleasedReturnValue()) == 0))
            {
              v27 = [(SignpostAggregationGroupMeasuredValue *)self unit];
              v28 = v7;
              v29 = [(SignpostAggregationGroupMeasuredValue *)v7 unit];
              char v30 = [v27 isEqual:v29] ^ 1;

              if (v26)
              {

                v7 = v28;
                v3 = v42;
                if (!v11)
                {
LABEL_50:

                  if (v30) {
                    goto LABEL_51;
                  }
LABEL_54:
                  v33 = [(SignpostAggregationGroupMeasuredValue *)self stats];
                  uint64_t v34 = [(SignpostAggregationGroupMeasuredValue *)v7 stats];
                  if (v33 == (void *)v34)
                  {

                    BOOL v12 = 1;
                    goto LABEL_52;
                  }
                  v35 = (void *)v34;
                  v36 = [(SignpostAggregationGroupMeasuredValue *)self stats];
                  if (v36)
                  {
                    v3 = [(SignpostAggregationGroupMeasuredValue *)v7 stats];
                    if (!v3)
                    {
                      v37 = v7;
                      LOBYTE(v7) = 1;
                      goto LABEL_68;
                    }
                  }
                  v38 = [(SignpostAggregationGroupMeasuredValue *)self stats];
                  if (v38
                    || ([(SignpostAggregationGroupMeasuredValue *)v7 stats],
                        (v41 = objc_claimAutoreleasedReturnValue()) == 0))
                  {
                    v39 = [(SignpostAggregationGroupMeasuredValue *)self stats];
                    v37 = v7;
                    v40 = [(SignpostAggregationGroupMeasuredValue *)v7 stats];
                    LODWORD(v7) = [v39 isEqual:v40] ^ 1;

                    if (v38)
                    {

                      if (v36) {
                        goto LABEL_68;
                      }
                      goto LABEL_62;
                    }
                    v41 = 0;
                  }
                  else
                  {
                    v37 = v7;
                    LODWORD(v7) = 1;
                  }

                  if (v36)
                  {
LABEL_68:

                    if (v7) {
                      goto LABEL_69;
                    }
                    goto LABEL_63;
                  }
LABEL_62:

                  if (v7)
                  {
LABEL_69:
                    BOOL v12 = 0;
                    goto LABEL_70;
                  }
LABEL_63:
                  BOOL v12 = 1;
LABEL_70:
                  v7 = v37;
                  goto LABEL_52;
                }
LABEL_49:

                goto LABEL_50;
              }
              v31 = 0;
              v7 = v28;
            }
            else
            {
              char v30 = 1;
            }
            v3 = v42;

            if (!v11) {
              goto LABEL_50;
            }
            goto LABEL_49;
          }
LABEL_19:

          goto LABEL_20;
        }
        v18 = 0;
        v7 = v15;
      }
      else
      {
        char v17 = 1;
      }
      v3 = v42;

      if (!v11) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  BOOL v12 = 0;
LABEL_53:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SignpostAggregationGroupMeasuredValue alloc];
  v5 = [(SignpostAggregationGroupMeasuredValue *)self groupName];
  v6 = [(SignpostAggregationGroupMeasuredValue *)self type];
  v7 = [(SignpostAggregationGroupMeasuredValue *)self unit];
  v8 = [(SignpostAggregationGroupMeasuredValue *)v4 initWithGroupName:v5 type:v6 unit:v7];

  uint64_t v9 = [(SignpostAggregationGroupMeasuredValue *)self stats];
  uint64_t v10 = [v9 copy];
  stats = v8->_stats;
  v8->_stats = (SignpostAggregationValueStats *)v10;

  return v8;
}

- (NSNumber)total
{
  v2 = [(SignpostAggregationGroupMeasuredValue *)self stats];
  v3 = [v2 total];
  id v4 = v3;
  if (!v3) {
    v3 = &unk_1EF81E808;
  }
  v5 = v3;

  return v5;
}

- (unint64_t)count
{
  v2 = [(SignpostAggregationGroupMeasuredValue *)self stats];
  v3 = [v2 count];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (NSNumber)average
{
  v2 = [(SignpostAggregationGroupMeasuredValue *)self stats];
  v3 = [v2 average];
  unint64_t v4 = v3;
  if (!v3) {
    v3 = &unk_1EF81E808;
  }
  v5 = v3;

  return v5;
}

- (NSNumber)min
{
  v2 = [(SignpostAggregationGroupMeasuredValue *)self stats];
  v3 = [v2 min];

  return (NSNumber *)v3;
}

- (NSNumber)max
{
  v2 = [(SignpostAggregationGroupMeasuredValue *)self stats];
  v3 = [v2 max];

  return (NSNumber *)v3;
}

- (NSNumber)stddev
{
  v2 = [(SignpostAggregationGroupMeasuredValue *)self stats];
  v3 = [v2 stddev];

  return (NSNumber *)v3;
}

- (id)_coreAnalyticsTotalFieldName
{
  v3 = NSString;
  unint64_t v4 = [(SignpostAggregationGroupMeasuredValue *)self groupName];
  v5 = [(SignpostAggregationGroupMeasuredValue *)self type];
  v6 = [v3 stringWithFormat:@"%@__%@__TotalValue", v4, v5];

  return v6;
}

- (id)_coreAnalyticsMinFieldName
{
  v3 = NSString;
  unint64_t v4 = [(SignpostAggregationGroupMeasuredValue *)self groupName];
  v5 = [(SignpostAggregationGroupMeasuredValue *)self type];
  v6 = [v3 stringWithFormat:@"%@__%@__MinValue", v4, v5];

  return v6;
}

- (id)_coreAnalyticsMaxFieldName
{
  v3 = NSString;
  unint64_t v4 = [(SignpostAggregationGroupMeasuredValue *)self groupName];
  v5 = [(SignpostAggregationGroupMeasuredValue *)self type];
  v6 = [v3 stringWithFormat:@"%@__%@__MaxValue", v4, v5];

  return v6;
}

- (id)_coreAnalyticsStdDevFieldName
{
  v3 = NSString;
  unint64_t v4 = [(SignpostAggregationGroupMeasuredValue *)self groupName];
  v5 = [(SignpostAggregationGroupMeasuredValue *)self type];
  v6 = [v3 stringWithFormat:@"%@__%@__ValueStdDev", v4, v5];

  return v6;
}

- (BOOL)shouldAdd
{
  return 1;
}

+ (id)_sumOfValue0:(id)a3 value1:(id)a4 errorOut:(id *)a5
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
      *a5 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:@"Cannot add nil measured values"];
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
    goto LABEL_24;
  }
  char v12 = !v10;
  if (!v8) {
    char v12 = 1;
  }
  if ((v12 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_12:
  v14 = [(id)v7 groupName];
  v15 = [v9 groupName];
  char v16 = [v14 isEqualToString:v15];

  if (v16)
  {
    char v17 = [(id)v7 type];
    v18 = [v9 type];
    char v19 = [v17 isEqualToString:v18];

    if (v19)
    {
      v20 = [(id)v7 stats];
      v21 = [v9 stats];
      id v30 = 0;
      v22 = +[SignpostAggregationValueStats sumOfStats0:v20 stats1:v21 errorOut:&v30];
      id v23 = v30;

      if (v22)
      {
        v13 = (id *)[(id)v7 copy];
        objc_storeStrong(v13 + 5, v22);
      }
      else
      {
        v13 = 0;
        if (a5) {
          *a5 = v23;
        }
      }

      goto LABEL_24;
    }
    v27 = NSString;
    uint64_t v25 = [(id)v7 type];
    v26 = [v9 type];
    [v27 stringWithFormat:@"Tried to add measured values with different type: %@ vs. %@", v25, v26];
  }
  else
  {
    v24 = NSString;
    uint64_t v25 = [(id)v7 groupName];
    v26 = [v9 groupName];
    [v24 stringWithFormat:@"Tried to add measured values with different group names: %@ vs. %@", v25, v26];
  v28 = };

  if (a5)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:v28];
  }

  v13 = 0;
LABEL_24:

  return v13;
}

- (id)_dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t v4 = [(SignpostAggregationGroupMeasuredValue *)self type];
  [v3 setObject:v4 forKeyedSubscript:kAggTypeKey];

  v5 = [(SignpostAggregationGroupMeasuredValue *)self unit];
  [v3 setObject:v5 forKeyedSubscript:kAggUnitOfMeasureKey];

  v6 = [(SignpostAggregationGroupMeasuredValue *)self total];
  [v3 setObject:v6 forKeyedSubscript:kAggTotalKey];

  unint64_t v7 = [(SignpostAggregationGroupMeasuredValue *)self average];
  [v3 setObject:v7 forKeyedSubscript:kAggAverageKey];

  unint64_t v8 = [(SignpostAggregationGroupMeasuredValue *)self min];

  if (v8)
  {
    uint64_t v9 = [(SignpostAggregationGroupMeasuredValue *)self min];
    [v3 setObject:v9 forKeyedSubscript:kAggMinValueKey];
  }
  BOOL v10 = [(SignpostAggregationGroupMeasuredValue *)self max];

  if (v10)
  {
    BOOL v11 = [(SignpostAggregationGroupMeasuredValue *)self max];
    [v3 setObject:v11 forKeyedSubscript:kAggMaxValueKey];
  }
  char v12 = [(SignpostAggregationGroupMeasuredValue *)self stddev];

  if (v12)
  {
    v13 = [(SignpostAggregationGroupMeasuredValue *)self stddev];
    [v3 setObject:v13 forKeyedSubscript:kAggValueStdDevKey];
  }

  return v3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)unit
{
  return self->_unit;
}

- (SignpostAggregationValueStats)stats
{
  return self->_stats;
}

- (BOOL)telemetryEnabled
{
  return self->_telemetryEnabled;
}

- (void)setTelemetryEnabled:(BOOL)a3
{
  self->_telemetryEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_groupName, 0);
}

@end