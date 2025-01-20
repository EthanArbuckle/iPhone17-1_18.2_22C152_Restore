@interface _DPMLRuntimeEnhancedBudgetControl
- (BOOL)checkEnhancedDPParametersWithError:(id *)a3;
- (BOOL)checkMinimumCohortSizeWithError:(id *)a3;
- (BOOL)checkPrivacyBudgetLimitsWithError:(id *)a3;
- (NSDictionary)cohortSizeTable;
- (NSDictionary)metadata;
- (_DPMLRuntimeEnhancedBudgetControl)initWithMetadata:(id)a3 withError:(id *)a4;
- (id)findTheNearestGreaterNumberInArray:(id)a3 forValue:(id)a4;
- (id)findTheNearestLowerNumberInArray:(id)a3 forValue:(id)a4;
@end

@implementation _DPMLRuntimeEnhancedBudgetControl

- (_DPMLRuntimeEnhancedBudgetControl)initWithMetadata:(id)a3 withError:(id *)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_DPMLRuntimeEnhancedBudgetControl;
  v8 = [(_DPMLRuntimeEnhancedBudgetControl *)&v17 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v8->_metadata, a3);
  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v11 = [v10 pathForResource:@"dpmlruntime-enhancedbudget-cohortsize" ofType:@"plist"];
  if (!v11)
  {
    if (a4)
    {
      *a4 = +[_DPMLRuntimeError errorWithCode:300 description:@"No path found to load the cohort size table"];
    }
    goto LABEL_11;
  }
  v12 = (void *)v11;
  uint64_t v13 = +[NSDictionary dictionaryWithContentsOfFile:v11];
  if (!v13)
  {
    if (a4)
    {
      *a4 = +[_DPMLRuntimeError errorWithCode:300 description:@"Error in loading the cohort size table"];
    }

LABEL_11:
    v15 = 0;
    goto LABEL_12;
  }
  cohortSizeTable = v9->_cohortSizeTable;
  v9->_cohortSizeTable = (NSDictionary *)v13;

LABEL_5:
  v15 = v9;
LABEL_12:

  return v15;
}

- (BOOL)checkEnhancedDPParametersWithError:(id *)a3
{
  v19[0] = @"localDifferentialPrivacyBudget";
  v19[1] = @"cohortAggregateDifferentialPrivacyBudget";
  v19[2] = @"minCohortSize";
  v19[3] = @"useEnhancedDifferentialPrivacyAlgorithm";
  +[NSArray arrayWithObjects:v19 count:4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:v10];

        if (!v11)
        {
          if (a3)
          {
            v12 = +[NSString stringWithFormat:@"Malformed enhanced differential privacy parameters, %@ key not found", v10];
            *a3 = +[_DPMLRuntimeError errorWithCode:100 description:v12];

            LOBYTE(a3) = 0;
          }
          goto LABEL_12;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  LOBYTE(a3) = 1;
LABEL_12:

  return (char)a3;
}

- (BOOL)checkPrivacyBudgetLimitsWithError:(id *)a3
{
  id v5 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"cohortAggregateDifferentialPrivacyBudget"];
  [v5 floatValue];
  float v7 = v6;

  if (v7 <= 0.0 || v7 > 5.0)
  {
    if (!a3) {
      return 0;
    }
    +[NSString stringWithFormat:@"The query cohort aggregate privacy budget (%f) is not between its limits of 0 and %f", v7, 0x4014000000000000];
    uint64_t v13 = LABEL_13:;
    *a3 = +[_DPMLRuntimeError errorWithCode:100 description:v13];

    return 0;
  }
  v9 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"localDifferentialPrivacyBudget"];
  [v9 floatValue];
  float v11 = v10;

  BOOL result = v11 <= 10.0 && v11 > 0.0;
  if (a3 && !result)
  {
    +[NSString stringWithFormat:@"The query local privacy budget (%f) is not between its limits of 0 and %f", v11, 0x4024000000000000];
    goto LABEL_13;
  }
  return result;
}

- (BOOL)checkMinimumCohortSizeWithError:(id *)a3
{
  id v5 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"minCohortSize"];
  id v6 = [v5 unsignedIntegerValue];

  float v7 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"cohortAggregateDifferentialPrivacyBudget"];
  uint64_t v8 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"localDifferentialPrivacyBudget"];
  v9 = [(NSDictionary *)self->_cohortSizeTable objectForKeyedSubscript:v7];
  float v10 = [v9 objectForKeyedSubscript:v8];
  id v11 = [v10 unsignedIntegerValue];

  if (!v11)
  {
    uint64_t v13 = [(NSDictionary *)self->_cohortSizeTable allKeys];
    id v14 = [v13 mutableCopy];

    long long v15 = [(_DPMLRuntimeEnhancedBudgetControl *)self findTheNearestLowerNumberInArray:v14 forValue:v7];
    if (!v15)
    {
      if (!a3)
      {
        BOOL v12 = 0;
        goto LABEL_21;
      }
      [v7 floatValue];
      long long v16 = +[NSString stringWithFormat:@"No local privacy budget key found for the query cohort aggregate privacy budget of %f in the table", v23];
      +[_DPMLRuntimeError errorWithCode:100 description:v16];
      BOOL v12 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

LABEL_21:
      goto LABEL_22;
    }
    long long v16 = [(NSDictionary *)self->_cohortSizeTable objectForKeyedSubscript:v15];
    long long v17 = [v16 allKeys];
    id v18 = [v17 mutableCopy];

    v19 = [(_DPMLRuntimeEnhancedBudgetControl *)self findTheNearestGreaterNumberInArray:v18 forValue:v8];
    if (v19)
    {
      v30 = v16;
      id v31 = v18;
      v20 = [(NSDictionary *)self->_cohortSizeTable objectForKeyedSubscript:v15];
      v21 = [v20 objectForKeyedSubscript:v19];
      id v22 = [v21 unsignedIntegerValue];

      if (v6 > v22)
      {
        BOOL v12 = 1;
        long long v16 = v30;
        id v18 = v31;
LABEL_19:

        goto LABEL_20;
      }
      id v18 = v31;
      if (!a3)
      {
        BOOL v12 = 0;
        long long v16 = v30;
        goto LABEL_19;
      }
      v27 = +[NSString stringWithFormat:@"Query minimum cohort size of (%lu) is less than that of the approved one (%lu)", v6, v22];
      v28 = +[_DPMLRuntimeError errorWithCode:100 description:v27];
      long long v16 = v30;
    }
    else
    {
      if (!a3)
      {
LABEL_18:
        BOOL v12 = 0;
        goto LABEL_19;
      }
      [v8 floatValue];
      double v25 = v24;
      [v7 floatValue];
      v27 = +[NSString stringWithFormat:@"No minimum cohort size found for query local privacy budget (rounded up) of %f and cohort aggregate privacy budget (rounded down) of %f in the table", *(void *)&v25, v26];
      v28 = +[_DPMLRuntimeError errorWithCode:100 description:v27];
    }
    *a3 = v28;

    goto LABEL_18;
  }
  if (v6 <= v11)
  {
    if (!a3)
    {
      BOOL v12 = 0;
      goto LABEL_23;
    }
    id v14 = +[NSString stringWithFormat:@"Query minimum cohort size of (%lu) is less than that of the approved one (%lu)", v6, v11];
    +[_DPMLRuntimeError errorWithCode:100 description:v14];
    BOOL v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

    goto LABEL_23;
  }
  BOOL v12 = 1;
LABEL_23:

  return v12;
}

- (id)findTheNearestGreaterNumberInArray:(id)a3 forValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  float v7 = +[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:1];
  uint64_t v8 = +[NSArray arrayWithObject:v7];
  [v5 sortUsingDescriptors:v8];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_msgSend(v6, "floatValue", (void)v23);
        float v16 = v15;
        [v14 floatValue];
        if (vabds_f32(v16, v17) >= 0.000011921)
        {
          [v6 floatValue];
          float v19 = v18;
          [v14 floatValue];
          if (v19 > v20) {
            continue;
          }
        }
        id v21 = v14;
        goto LABEL_13;
      }
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      id v21 = 0;
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v21 = 0;
  }
LABEL_13:

  return v21;
}

- (id)findTheNearestLowerNumberInArray:(id)a3 forValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  float v7 = +[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:0];
  uint64_t v8 = +[NSArray arrayWithObject:v7];
  [v5 sortUsingDescriptors:v8];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_msgSend(v6, "floatValue", (void)v23);
        float v16 = v15;
        [v14 floatValue];
        if (vabds_f32(v16, v17) >= 0.000011921)
        {
          [v6 floatValue];
          float v19 = v18;
          [v14 floatValue];
          if (v19 < v20) {
            continue;
          }
        }
        id v21 = v14;
        goto LABEL_13;
      }
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      id v21 = 0;
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v21 = 0;
  }
LABEL_13:

  return v21;
}

- (NSDictionary)cohortSizeTable
{
  return self->_cohortSizeTable;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_cohortSizeTable, 0);
}

@end