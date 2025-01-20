@interface TIMetricDescriptorParser
- (TIMetricDescriptorParser)init;
- (id)descriptionFromDependencyChain:(id)a3 andDependencyName:(id)a4;
- (id)parseBucketThresholdsFromConfig:(id)a3 isFeatureUsageDescriptor:(BOOL)a4 errors:(id)a5;
- (id)parseBucketValuesFromConfig:(id)a3 forBucketThresholds:(id)a4 isFeatureUsageDescriptor:(BOOL)a5 errors:(id)a6;
- (id)parseCalculationDefaultValueFromConfig:(id)a3 forExpression:(id)a4 andPrecondition:(id)a5 errors:(id)a6;
- (id)parseCalculationDependenciesFromConfig:(id)a3 forExpression:(id)a4 errors:(id)a5;
- (id)parseCalculationPreconditionFromConfig:(id)a3 forExpression:(id)a4 errors:(id)a5;
- (id)parseContextValueDescriptorWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5;
- (id)parseFeatureUsageDescriptorWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5;
- (id)parseMetricDescriptorWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5;
- (id)parseNumericValueDescriptorWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5;
- (id)parseSettingValueDescriptorWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5;
- (void)findInvalidDependencyChain:(id)a3 forMetricDescriptor:(id)a4 fromMetricDescriptors:(id)a5 andInvalidMetricNames:(id)a6 invalidMetricDescriptors:(id)a7 errors:(id)a8;
- (void)parseMetricDescriptors:(id)a3 andInvalidMetricNames:(id)a4 fromConfig:(id)a5 errors:(id)a6;
@end

@implementation TIMetricDescriptorParser

- (id)descriptionFromDependencyChain:(id)a3 andDependencyName:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "metricName", (void)v16);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  if (v6) {
    [v7 addObject:v6];
  }
  objc_msgSend(v7, "removeObjectAtIndex:", 0, (void)v16);
  v14 = [v7 componentsJoinedByString:@" -> "];

  return v14;
}

- (void)findInvalidDependencyChain:(id)a3 forMetricDescriptor:(id)a4 fromMetricDescriptors:(id)a5 andInvalidMetricNames:(id)a6 invalidMetricDescriptors:(id)a7 errors:(id)a8
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v40 = a6;
  id v17 = a7;
  id v18 = a8;
  long long v19 = (void *)[v14 mutableCopy];
  [v19 addObject:v15];
  v39 = v17;
  if ([v14 containsObject:v15])
  {
    v20 = [(TIMetricDescriptorParser *)self descriptionFromDependencyChain:v19 andDependencyName:0];
    uint64_t v21 = [NSString stringWithFormat:@"Circular dependency: %@", v20];
    v22 = [(TIDescriptorParser *)self errorWithMessage:v21];
    [v18 addObject:v22];

    v23 = [v19 objectAtIndexedSubscript:0];
    [v17 addObject:v23];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42 = v18;
      v43 = v19;
      v41 = self;
      id v37 = v15;
      id v38 = v14;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v24 = [v15 calculationDependencies];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v48 count:16];
      id v27 = v17;
      v26 = v40;
      if (v25)
      {
        uint64_t v28 = v25;
        uint64_t v29 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v45 != v29) {
              objc_enumerationMutation(v24);
            }
            uint64_t v31 = *(void *)(*((void *)&v44 + 1) + 8 * i);
            v32 = [v16 objectForKey:v31];
            if (v32)
            {
              [(TIMetricDescriptorParser *)v41 findInvalidDependencyChain:v43 forMetricDescriptor:v32 fromMetricDescriptors:v16 andInvalidMetricNames:v26 invalidMetricDescriptors:v27 errors:v42];
            }
            else if ([v26 containsObject:v31])
            {
              v33 = [(TIMetricDescriptorParser *)v41 descriptionFromDependencyChain:v43 andDependencyName:v31];
              v34 = [NSString stringWithFormat:@"Invalid dependency: %@", v33];
              v35 = [(TIDescriptorParser *)v41 errorWithMessage:v34];
              [v42 addObject:v35];

              id v27 = v39;
              v36 = [v43 objectAtIndexedSubscript:0];
              [v39 addObject:v36];

              v26 = v40;
            }
          }
          uint64_t v28 = [v24 countByEnumeratingWithState:&v44 objects:v48 count:16];
        }
        while (v28);
      }

      id v15 = v37;
      id v14 = v38;
      id v18 = v42;
      long long v19 = v43;
    }
  }
}

- (id)parseBucketValuesFromConfig:(id)a3 forBucketThresholds:(id)a4 isFeatureUsageDescriptor:(BOOL)a5 errors:(id)a6
{
  BOOL v7 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = objc_opt_new();
  id v14 = [(TIDescriptorParser *)self parseArrayForKey:@"bucketValues" fromConfig:v10 required:0 errors:v13];
  id v15 = v14;
  if (!v14) {
    goto LABEL_25;
  }
  if (v7)
  {
    [NSString stringWithFormat:@"Key '%@' cannot be specified for feature usage descriptors.", @"bucketValues", v32];
    v23 = LABEL_23:;
    v24 = self;
    uint64_t v25 = v23;
    id v26 = v11;
    goto LABEL_24;
  }
  if (!v11)
  {
    v23 = [NSString stringWithFormat:@"Key '%@' cannot be specified without key '%@'.", @"bucketValues", @"bucketThresholds"];
    v24 = self;
    uint64_t v25 = v23;
    id v26 = 0;
LABEL_24:
    id v27 = [(TIDescriptorParser *)v24 errorWithMessage:v25 andValue:v26];
    [v13 addObject:v27];

    goto LABEL_25;
  }
  uint64_t v16 = [v14 count];
  if (v16 != [v11 count] + 1)
  {
    [NSString stringWithFormat:@"Key '%@' must contain one more value than key '%@'.", @"bucketValues", @"bucketThresholds"];
    goto LABEL_23;
  }
  id v33 = v10;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v15;
  uint64_t v17 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ((![MEMORY[0x1E4FAE268] isString:v22]
           || ![v22 length]
           || v19 && v19 != objc_opt_class())
          && (![MEMORY[0x1E4FAE268] isNumber:v22] || v19 && v19 != objc_opt_class()))
        {
          v30 = [NSString stringWithFormat:@"Key '%@' must contain values of the same data type.", @"bucketValues"];
          uint64_t v31 = [(TIDescriptorParser *)self errorWithMessage:v30 andValue:v11];
          [v13 addObject:v31];

          goto LABEL_32;
        }
        uint64_t v19 = objc_opt_class();
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
LABEL_32:

  id v10 = v33;
LABEL_25:
  if ([v13 count])
  {
    [v12 addObjectsFromArray:v13];
    id v28 = 0;
  }
  else
  {
    id v28 = v15;
  }

  return v28;
}

- (id)parseBucketThresholdsFromConfig:(id)a3 isFeatureUsageDescriptor:(BOOL)a4 errors:(id)a5
{
  BOOL v6 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_opt_new();
  id v11 = [(TIDescriptorParser *)self parseArrayForKey:@"bucketThresholds" fromConfig:v8 required:v6 errors:v10];
  id v12 = v11;
  if (!v11) {
    goto LABEL_19;
  }
  if (![v11 count])
  {
    [NSString stringWithFormat:@"Key '%@' must contain at least one value.", @"bucketThresholds", v25];
    uint64_t v21 = LABEL_18:;
    v22 = [(TIDescriptorParser *)self errorWithMessage:v21 andValue:v12];
    [v10 addObject:v22];

    goto LABEL_19;
  }
  if (v6)
  {
    uint64_t v13 = [v12 count];
    if (v13 != *MEMORY[0x1E4FAEFF8])
    {
      [NSString stringWithFormat:@"Key '%@' must contain %lu values for feature usage descriptors.", @"bucketThresholds", *MEMORY[0x1E4FAEFF8]];
      goto LABEL_18;
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        if (([MEMORY[0x1E4FAE268] isNumber:*(void *)(*((void *)&v26 + 1) + 8 * i)] & 1) == 0)
        {
          uint64_t v19 = [NSString stringWithFormat:@"Key '%@' values must all be numbers.", @"bucketThresholds"];
          uint64_t v20 = [(TIDescriptorParser *)self errorWithMessage:v19 andValue:v14];
          [v10 addObject:v20];

          goto LABEL_16;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_16:

LABEL_19:
  if ([v10 count])
  {
    [v9 addObjectsFromArray:v10];
    id v23 = 0;
  }
  else
  {
    id v23 = v12;
  }

  return v23;
}

- (id)parseCalculationDependenciesFromConfig:(id)a3 forExpression:(id)a4 errors:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_opt_new();
  id v11 = [(TIDescriptorParser *)self parseArrayForKey:@"calculationDependencies" fromConfig:v8 required:0 errors:v10];
  id v12 = v11;
  if (!v11) {
    goto LABEL_18;
  }
  if (!a4)
  {
    [NSString stringWithFormat:@"Key '%@' cannot be specified without key '%@'.", @"calculationDependencies", @"calculationExpression"];
    uint64_t v21 = LABEL_17:;
    v22 = [(TIDescriptorParser *)self errorWithMessage:v21 andValue:v12];
    [v10 addObject:v22];

    goto LABEL_18;
  }
  if (![v11 count])
  {
    [NSString stringWithFormat:@"Key '%@' must contain at least one value.", @"calculationDependencies", v25];
    goto LABEL_17;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    id v26 = v9;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (![MEMORY[0x1E4FAE268] isString:v18] || !objc_msgSend(v18, "length"))
        {
          uint64_t v19 = [NSString stringWithFormat:@"Key '%@' values must all be strings.", @"calculationDependencies"];
          uint64_t v20 = [(TIDescriptorParser *)self errorWithMessage:v19 andValue:v13];
          [v10 addObject:v20];

          id v9 = v26;
          goto LABEL_18;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
      id v9 = v26;
      if (v15) {
        continue;
      }
      break;
    }
  }

LABEL_18:
  if ([v10 count])
  {
    [v9 addObjectsFromArray:v10];
    id v23 = 0;
  }
  else
  {
    id v23 = v12;
  }

  return v23;
}

- (id)parseCalculationDefaultValueFromConfig:(id)a3 forExpression:(id)a4 andPrecondition:(id)a5 errors:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  id v13 = objc_opt_new();
  uint64_t v14 = [(TIDescriptorParser *)self parseNumberForKey:@"calculationDefaultValue" fromConfig:v12 required:0 errors:v13];

  if (v14)
  {
    if (a4)
    {
      if (v10) {
        goto LABEL_10;
      }
      uint64_t v15 = [NSString stringWithFormat:@"Key '%@' cannot be specified without key '%@'.", @"calculationDefaultValue", @"calculationPrecondition"];
      uint64_t v16 = self;
      uint64_t v17 = v15;
      id v18 = 0;
      goto LABEL_9;
    }
    [NSString stringWithFormat:@"Key '%@' cannot be specified without key '%@'.", @"calculationDefaultValue", @"calculationExpression"];
  }
  else
  {
    if (!v10) {
      goto LABEL_10;
    }
    [NSString stringWithFormat:@"Key '%@' must be specified with key '%@'.", @"calculationDefaultValue", @"calculationPrecondition"];
  uint64_t v15 = };
  uint64_t v16 = self;
  uint64_t v17 = v15;
  id v18 = v10;
LABEL_9:
  uint64_t v19 = [(TIDescriptorParser *)v16 errorWithMessage:v17 andValue:v18];
  [v13 addObject:v19];

LABEL_10:
  if ([v13 count])
  {
    [v11 addObjectsFromArray:v13];
    id v20 = 0;
  }
  else
  {
    id v20 = v14;
  }

  return v20;
}

- (id)parseCalculationPreconditionFromConfig:(id)a3 forExpression:(id)a4 errors:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_opt_new();
  id v11 = [(TIDescriptorParser *)self parseStringForKey:@"calculationPrecondition" fromConfig:v9 required:0 errors:v10];

  if (!a4 && v11)
  {
    id v12 = [NSString stringWithFormat:@"Key '%@' cannot be specified without key '%@'.", @"calculationPrecondition", @"calculationExpression"];
    id v13 = [(TIDescriptorParser *)self errorWithMessage:v12 andValue:v11];
    [v10 addObject:v13];
  }
  if ([v10 count])
  {
    [v8 addObjectsFromArray:v10];
    id v14 = 0;
  }
  else
  {
    id v14 = v11;
  }

  return v14;
}

- (id)parseSettingValueDescriptorWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_opt_new();
  id v12 = [(TIDescriptorParser *)self parseStringForKey:@"settingName" fromConfig:v10 required:1 errors:v11];

  if ([v11 count])
  {
    [v9 addObjectsFromArray:v11];
    id v13 = 0;
  }
  else
  {
    id v13 = +[TISettingValueDescriptor settingValueDescriptorWithMetricName:v8 settingName:v12];
  }

  return v13;
}

- (id)parseContextValueDescriptorWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_opt_new();
  id v12 = [(TIDescriptorParser *)self parseStringForKey:@"contextFieldName" fromConfig:v10 required:1 errors:v11];

  if ([v11 count])
  {
    [v9 addObjectsFromArray:v11];
    id v13 = 0;
  }
  else
  {
    id v13 = +[TIContextValueDescriptor contextValueDescriptorWithMetricName:v8 contextFieldName:v12];
  }

  return v13;
}

- (id)parseFeatureUsageDescriptorWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5
{
  id v28 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_opt_new();
  id v11 = [(TIDescriptorParser *)self parseStringForKey:@"discoveryCounter" fromConfig:v8 required:0 errors:v10];
  id v12 = [(TIDescriptorParser *)self parseNumberForKey:@"discoveryThreshold" fromConfig:v8 required:0 errors:v10];
  uint64_t v26 = [(TIDescriptorParser *)self parseStringForKey:@"configString" fromConfig:v8 required:0 errors:v10];
  id v13 = [(TIDescriptorParser *)self parseStringForKey:@"calculationExpression" fromConfig:v8 required:0 errors:v10];
  uint64_t v14 = [(TIMetricDescriptorParser *)self parseCalculationPreconditionFromConfig:v8 forExpression:v13 errors:v10];
  uint64_t v15 = [(TIMetricDescriptorParser *)self parseCalculationDefaultValueFromConfig:v8 forExpression:v13 andPrecondition:v14 errors:v10];
  uint64_t v25 = [(TIMetricDescriptorParser *)self parseCalculationDependenciesFromConfig:v8 forExpression:v13 errors:v10];
  uint64_t v16 = [(TIMetricDescriptorParser *)self parseBucketThresholdsFromConfig:v8 isFeatureUsageDescriptor:1 errors:v10];
  id v17 = [(TIMetricDescriptorParser *)self parseBucketValuesFromConfig:v8 forBucketThresholds:v16 isFeatureUsageDescriptor:1 errors:v10];
  long long v27 = v12;
  if ([v10 count])
  {
    [v9 addObjectsFromArray:v10];
    id v24 = 0;
    id v18 = (void *)v14;
    id v20 = (void *)v25;
    uint64_t v19 = (void *)v26;
  }
  else
  {
    id v23 = (void *)v14;
    if (v12) {
      uint64_t v21 = [v12 integerValue];
    }
    else {
      uint64_t v21 = 0;
    }
    id v20 = (void *)v25;
    uint64_t v19 = (void *)v26;
    id v18 = v23;
    id v24 = +[TIFeatureUsageDescriptor featureUsageDescriptorWithMetricName:v28 discoveryCounter:v11 discoveryThreshold:v21 configString:v26 calculationExpression:v13 calculationPrecondition:v23 calculationDefaultValue:v15 calculationDependencies:v25 bucketThresholds:v16];
  }

  return v24;
}

- (id)parseNumericValueDescriptorWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_opt_new();
  id v12 = [(TIDescriptorParser *)self parseStringForKey:@"calculationExpression" fromConfig:v10 required:0 errors:v11];
  id v13 = [(TIMetricDescriptorParser *)self parseCalculationPreconditionFromConfig:v10 forExpression:v12 errors:v11];
  uint64_t v14 = [(TIMetricDescriptorParser *)self parseCalculationDefaultValueFromConfig:v10 forExpression:v12 andPrecondition:v13 errors:v11];
  uint64_t v15 = [(TIMetricDescriptorParser *)self parseCalculationDependenciesFromConfig:v10 forExpression:v12 errors:v11];
  uint64_t v16 = [(TIMetricDescriptorParser *)self parseBucketThresholdsFromConfig:v10 isFeatureUsageDescriptor:0 errors:v11];
  id v17 = [(TIMetricDescriptorParser *)self parseBucketValuesFromConfig:v10 forBucketThresholds:v16 isFeatureUsageDescriptor:0 errors:v11];

  if ([v11 count])
  {
    [v9 addObjectsFromArray:v11];
    id v18 = 0;
  }
  else
  {
    id v18 = +[TINumericValueDescriptor numericValueDescriptorWithMetricName:v8 calculationExpression:v12 calculationPrecondition:v13 calculationDefaultValue:v14 calculationDependencies:v15 bucketThresholds:v16 bucketValues:v17];
  }

  return v18;
}

- (id)parseMetricDescriptorWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_opt_new();
  id v12 = [(TIDescriptorParser *)self parseStringForKey:@"metricType" fromConfig:v9 required:1 errors:v11];
  if ([v12 isEqualToString:@"numericValue"])
  {
    uint64_t v13 = [(TIMetricDescriptorParser *)self parseNumericValueDescriptorWithName:v8 fromConfig:v9 errors:v11];
LABEL_9:
    uint64_t v14 = (void *)v13;
    goto LABEL_10;
  }
  if ([v12 isEqualToString:@"featureUsage"])
  {
    uint64_t v13 = [(TIMetricDescriptorParser *)self parseFeatureUsageDescriptorWithName:v8 fromConfig:v9 errors:v11];
    goto LABEL_9;
  }
  if ([v12 isEqualToString:@"contextValue"])
  {
    uint64_t v13 = [(TIMetricDescriptorParser *)self parseContextValueDescriptorWithName:v8 fromConfig:v9 errors:v11];
    goto LABEL_9;
  }
  if ([v12 isEqualToString:@"settingValue"])
  {
    uint64_t v13 = [(TIMetricDescriptorParser *)self parseSettingValueDescriptorWithName:v8 fromConfig:v9 errors:v11];
    goto LABEL_9;
  }
  id v17 = [(TIDescriptorParser *)self invalidValueErrorForKey:@"metricType" withValue:v12];
  [v11 addObject:v17];

  uint64_t v14 = 0;
LABEL_10:
  if ([v11 count])
  {
    [v10 addObjectsFromArray:v11];
    id v15 = 0;
  }
  else
  {
    id v15 = v14;
  }

  return v15;
}

- (void)parseMetricDescriptors:(id)a3 andInvalidMetricNames:(id)a4 fromConfig:(id)a5 errors:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v10 = a4;
  id v11 = a5;
  id v38 = a6;
  id v12 = objc_opt_new();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = [v11 allKeys];
  uint64_t v13 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v52 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        id v18 = [(TIDescriptorParser *)self context];
        [v18 setObject:v17 forKey:@"metric"];

        uint64_t v19 = [(TIDescriptorParser *)self parseDictionaryForKey:v17 fromConfig:v11 required:1 errors:v12];
        if (v19
          && ([(TIMetricDescriptorParser *)self parseMetricDescriptorWithName:v17 fromConfig:v19 errors:v12], (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v21 = (void *)v20;
          [v42 setObject:v20 forKey:v17];
        }
        else
        {
          [v10 addObject:v17];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v14);
  }
  v39 = v11;

  v22 = objc_opt_new();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obja = [v42 allValues];
  uint64_t v23 = [obja countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v48 != v25) {
          objc_enumerationMutation(obja);
        }
        long long v27 = *(void **)(*((void *)&v47 + 1) + 8 * j);
        id v28 = [(TIDescriptorParser *)self context];
        long long v29 = [v27 metricName];
        [v28 setObject:v29 forKey:@"metric"];

        [(TIMetricDescriptorParser *)self findInvalidDependencyChain:MEMORY[0x1E4F1CBF0] forMetricDescriptor:v27 fromMetricDescriptors:v42 andInvalidMetricNames:v10 invalidMetricDescriptors:v22 errors:v12];
      }
      uint64_t v24 = [obja countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v24);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v30 = v22;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v44;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v44 != v33) {
          objc_enumerationMutation(v30);
        }
        long long v35 = *(void **)(*((void *)&v43 + 1) + 8 * k);
        long long v36 = objc_msgSend(v35, "metricName", v38);
        [v42 removeObjectForKey:v36];

        long long v37 = [v35 metricName];
        [v10 addObject:v37];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v32);
  }

  [v38 addObjectsFromArray:v12];
}

- (TIMetricDescriptorParser)init
{
  v3.receiver = self;
  v3.super_class = (Class)TIMetricDescriptorParser;
  return [(TIDescriptorParser *)&v3 initWithErrorCode:0];
}

@end