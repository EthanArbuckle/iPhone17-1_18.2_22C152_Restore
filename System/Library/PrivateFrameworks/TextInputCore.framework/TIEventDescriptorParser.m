@interface TIEventDescriptorParser
- (TIEventDescriptorParser)init;
- (id)parseBooleanFieldSpecWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5;
- (id)parseFloatFieldSpecWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5;
- (id)parseIntegerFieldSpecWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5;
- (id)parseStringFieldSpecWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5;
- (void)parseEventDescriptor:(id *)a3 andEventSpec:(id *)a4 withName:(id)a5 fromConfig:(id)a6 errors:(id)a7;
- (void)parseEventDescriptors:(id)a3 andEventSpecs:(id)a4 fromConfig:(id)a5 errors:(id)a6;
- (void)parseFieldDescriptor:(id *)a3 andFieldSpec:(id *)a4 withName:(id)a5 fromConfig:(id)a6 errors:(id)a7;
@end

@implementation TIEventDescriptorParser

- (id)parseBooleanFieldSpecWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E4FAE250], "BOOLeanFieldSpecWithName:", a3, a4, a5);
}

- (id)parseFloatFieldSpecWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_opt_new();
  if (v9)
  {
    v12 = [(TIDescriptorParser *)self parseFloatForKey:@"minValue" fromConfig:v9 required:0 errors:v11];
    v13 = [(TIDescriptorParser *)self parseFloatForKey:@"maxValue" fromConfig:v9 required:0 errors:v11];
    v14 = [(TIDescriptorParser *)self parseIntegerForKey:@"significantDigits" fromConfig:v9 required:0 errors:v11];
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
  }
  if ([v11 count])
  {
    [v10 addObjectsFromArray:v11];
    v15 = 0;
  }
  else
  {
    v15 = [MEMORY[0x1E4FAE250] floatFieldSpecWithName:v8 minValue:v12 maxValue:v13 significantDigits:v14];
  }

  return v15;
}

- (id)parseIntegerFieldSpecWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_opt_new();
  if (v9)
  {
    v12 = [(TIDescriptorParser *)self parseIntegerForKey:@"minValue" fromConfig:v9 required:0 errors:v11];
    v13 = [(TIDescriptorParser *)self parseIntegerForKey:@"maxValue" fromConfig:v9 required:0 errors:v11];
    v14 = [(TIDescriptorParser *)self parseIntegerForKey:@"significantDigits" fromConfig:v9 required:0 errors:v11];
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
  }
  if ([v11 count])
  {
    [v10 addObjectsFromArray:v11];
    v15 = 0;
  }
  else
  {
    v15 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:v8 minValue:v12 maxValue:v13 significantDigits:v14];
  }

  return v15;
}

- (id)parseStringFieldSpecWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_opt_new();
  if (v9)
  {
    v12 = [(TIDescriptorParser *)self parseArrayForKey:@"allowedValues" fromConfig:v9 required:0 errors:v11];
    id v13 = v12;
    if (v12)
    {
      if ([v12 count])
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v13 = v13;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v27;
          id v25 = v8;
          while (2)
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v27 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              if (![MEMORY[0x1E4FAE268] isString:v18] || !objc_msgSend(v18, "length"))
              {
                v19 = [NSString stringWithFormat:@"Key '%@' values must all be strings.", @"allowedValues"];
                v20 = [(TIDescriptorParser *)self errorWithMessage:v19 andValue:v13];
                [v11 addObject:v20];

                id v8 = v25;
                goto LABEL_17;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
            id v8 = v25;
            if (v15) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
        v21 = [NSString stringWithFormat:@"Key '%@' must contain at least one value.", @"allowedValues"];
        v22 = [(TIDescriptorParser *)self errorWithMessage:v21 andValue:v13];
        [v11 addObject:v22];
      }
    }
  }
  else
  {
    id v13 = 0;
  }
LABEL_17:
  if ([v11 count])
  {
    [v10 addObjectsFromArray:v11];
    v23 = 0;
  }
  else
  {
    v23 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:v8 allowedValues:v13];
  }

  return v23;
}

- (void)parseFieldDescriptor:(id *)a3 andFieldSpec:(id *)a4 withName:(id)a5 fromConfig:(id)a6 errors:(id)a7
{
  id v24 = a5;
  id v10 = a6;
  id v11 = a7;
  v12 = objc_opt_new();
  id v13 = [(TIDescriptorParser *)self parseStringForKey:@"fieldDescription" fromConfig:v10 required:0 errors:v12];
  uint64_t v14 = [(TIDescriptorParser *)self parseStringForKey:@"metricName" fromConfig:v10 required:1 errors:v12];
  uint64_t v15 = [(TIDescriptorParser *)self parseStringForKey:@"metricType" fromConfig:v10 required:1 errors:v12];
  uint64_t v16 = [(TIDescriptorParser *)self parseStringForKey:@"dataType" fromConfig:v10 required:1 errors:v12];
  v17 = [(TIDescriptorParser *)self parseDictionaryForKey:@"constraints" fromConfig:v10 required:0 errors:v12];
  if ([v16 isEqualToString:@"string"])
  {
    v18 = [(TIDescriptorParser *)self parseStringForKey:@"inactiveValue" fromConfig:v10 required:0 errors:v12];
    uint64_t v19 = [(TIEventDescriptorParser *)self parseStringFieldSpecWithName:v24 fromConfig:v17 errors:v12];
LABEL_9:
    v20 = (void *)v19;
    goto LABEL_10;
  }
  if ([v16 isEqualToString:@"integer"])
  {
    v18 = [(TIDescriptorParser *)self parseIntegerForKey:@"inactiveValue" fromConfig:v10 required:0 errors:v12];
    uint64_t v19 = [(TIEventDescriptorParser *)self parseIntegerFieldSpecWithName:v24 fromConfig:v17 errors:v12];
    goto LABEL_9;
  }
  if ([v16 isEqualToString:@"float"])
  {
    v18 = [(TIDescriptorParser *)self parseNumberForKey:@"inactiveValue" fromConfig:v10 required:0 errors:v12];
    uint64_t v19 = [(TIEventDescriptorParser *)self parseFloatFieldSpecWithName:v24 fromConfig:v17 errors:v12];
    goto LABEL_9;
  }
  if ([v16 isEqualToString:@"BOOLean"])
  {
    v18 = [(TIDescriptorParser *)self parseBooleanForKey:@"inactiveValue" fromConfig:v10 required:0 errors:v12];
    uint64_t v19 = [(TIEventDescriptorParser *)self parseBooleanFieldSpecWithName:v24 fromConfig:v17 errors:v12];
    goto LABEL_9;
  }
  v21 = [(TIDescriptorParser *)self invalidValueErrorForKey:@"dataType" withValue:v16];
  [v12 addObject:v21];

  v18 = 0;
  v20 = 0;
LABEL_10:
  if ([v12 count])
  {
    [v11 addObjectsFromArray:v12];
  }
  else
  {
    *a3 = +[TIFieldDescriptor fieldDescriptorWithFieldName:v24 fieldDescription:v13 metricName:v14 metricType:v15 inactiveValue:v18];
    *a4 = v20;
  }
}

- (void)parseEventDescriptor:(id *)a3 andEventSpec:(id *)a4 withName:(id)a5 fromConfig:(id)a6 errors:(id)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = objc_opt_new();
  uint64_t v16 = [(TIDescriptorParser *)self parseStringForKey:@"eventDescription" fromConfig:v13 required:0 errors:v15];
  v17 = [(TIDescriptorParser *)self parseBooleanForKey:@"includeTestingParameters" fromConfig:v13 required:0 errors:v15];
  unsigned int v42 = [v17 isEqualToNumber:MEMORY[0x1E4F1CC38]];

  v18 = [(TIDescriptorParser *)self parseDictionaryForKey:@"fieldDescriptors" fromConfig:v13 required:1 errors:v15];
  v44 = objc_opt_new();
  v43 = objc_opt_new();
  v46 = objc_opt_new();
  v47 = v18;
  if (!v18) {
    goto LABEL_18;
  }
  v37 = a3;
  v38 = v16;
  v39 = a4;
  id v40 = v14;
  id v41 = v13;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = [v18 allKeys];
  uint64_t v19 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (!v19) {
    goto LABEL_15;
  }
  uint64_t v20 = v19;
  uint64_t v21 = *(void *)v51;
  do
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (*(void *)v51 != v21) {
        objc_enumerationMutation(obj);
      }
      uint64_t v23 = *(void *)(*((void *)&v50 + 1) + 8 * i);
      id v24 = [(TIDescriptorParser *)self context];
      id v25 = v12;
      [v24 setObject:v12 forKey:@"event"];

      long long v26 = [(TIDescriptorParser *)self parseDictionaryForKey:v23 fromConfig:v47 required:1 errors:v15];
      if (v26)
      {
        id v48 = 0;
        id v49 = 0;
        [(TIEventDescriptorParser *)self parseFieldDescriptor:&v49 andFieldSpec:&v48 withName:v23 fromConfig:v26 errors:v15];
        id v27 = v49;
        id v28 = v48;
        long long v29 = v28;
        if (v27 && v28)
        {
          [v44 setObject:v27 forKey:v23];
          [v43 setObject:v29 forKey:v23];
          goto LABEL_13;
        }
      }
      else
      {
        long long v29 = 0;
        id v27 = 0;
      }
      [v46 addObject:v23];
LABEL_13:

      id v12 = v25;
    }
    uint64_t v20 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
  }
  while (v20);
LABEL_15:

  id v14 = v40;
  id v13 = v41;
  uint64_t v16 = v38;
  a4 = v39;
  a3 = v37;
  if (![v44 count] && !objc_msgSend(v46, "count"))
  {
    v30 = [NSString stringWithFormat:@"Key '%@' must contain at least one value.", @"fieldDescriptors"];
    uint64_t v31 = [(TIDescriptorParser *)self errorWithMessage:v30 andValue:v43];
    [v15 addObject:v31];
  }
LABEL_18:
  if ([v15 count])
  {
    [v14 addObjectsFromArray:v15];
    v33 = v43;
    v32 = v44;
  }
  else
  {
    v32 = v44;
    v34 = [v44 allValues];
    *a3 = +[TIEventDescriptor eventDescriptorWithEventName:v12 eventDescription:v16 fieldDescriptors:v34 includeTestingParameters:v42];

    v35 = (void *)MEMORY[0x1E4FAE248];
    v33 = v43;
    v36 = [v43 allValues];
    *a4 = [v35 eventSpecWithName:v12 inputModeRequired:0 fieldSpecs:v36];
  }
}

- (void)parseEventDescriptors:(id)a3 andEventSpecs:(id)a4 fromConfig:(id)a5 errors:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v24 = a4;
  id v10 = a5;
  id v23 = a6;
  id v11 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [v10 allKeys];
  uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v17 = [(TIDescriptorParser *)self context];
        v33 = @"event";
        uint64_t v34 = v16;
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        [v17 setDictionary:v18];

        uint64_t v19 = [(TIDescriptorParser *)self parseDictionaryForKey:v16 fromConfig:v10 required:1 errors:v11];
        if (v19)
        {
          id v27 = 0;
          id v28 = 0;
          [(TIEventDescriptorParser *)self parseEventDescriptor:&v28 andEventSpec:&v27 withName:v16 fromConfig:v19 errors:v11];
          id v20 = v28;
          id v21 = v27;
          v22 = v21;
          if (v20 && v21)
          {
            [v25 setObject:v20 forKey:v16];
            [v24 setObject:v22 forKey:v16];
          }
        }
        else
        {
          id v20 = 0;
          v22 = 0;
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v13);
  }

  [v23 addObjectsFromArray:v11];
}

- (TIEventDescriptorParser)init
{
  v3.receiver = self;
  v3.super_class = (Class)TIEventDescriptorParser;
  return [(TIDescriptorParser *)&v3 initWithErrorCode:1];
}

@end