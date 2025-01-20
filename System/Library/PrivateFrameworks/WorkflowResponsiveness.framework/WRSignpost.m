@interface WRSignpost
- (BOOL)eventIdentifierIsSignpostID;
- (BOOL)hasDiagnosticThresholdCount;
- (BOOL)hasDiagnosticThresholdInterval;
- (BOOL)isEqual:(id)a3;
- (BOOL)networkBound;
- (NSArray)diagnostics;
- (NSArray)environmentFieldNames;
- (NSString)category;
- (NSString)eventIdentifierFieldName;
- (NSString)individuationFieldName;
- (NSString)name;
- (NSString)subsystem;
- (WRSignpost)initWithSubsystem:(id)a3 category:(id)a4 name:(id)a5 eventIdentifierFieldName:(id)a6 individuationFieldName:(id)a7 environmentFieldNames:(id)a8 networkBound:(BOOL)a9 diagnostics:(id)a10;
- (double)diagnosticThresholdIntervalSeconds;
- (id)debugDescription;
- (int)diagnosticThresholdCount;
- (int64_t)compare:(id)a3;
- (uint64_t)hasChangesRelativeTo:(id)a1;
- (uint64_t)hasDiagnosticThresholdIntervalSeconds;
- (uint64_t)matchesSignpost:(void *)a1;
- (unint64_t)hash;
@end

@implementation WRSignpost

- (WRSignpost)initWithSubsystem:(id)a3 category:(id)a4 name:(id)a5 eventIdentifierFieldName:(id)a6 individuationFieldName:(id)a7 environmentFieldNames:(id)a8 networkBound:(BOOL)a9 diagnostics:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a10;
  v39.receiver = self;
  v39.super_class = (Class)WRSignpost;
  v23 = [(WRSignpost *)&v39 init];
  if (v23)
  {
    uint64_t v24 = [v16 copy];
    subsystem = v23->_subsystem;
    v23->_subsystem = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    category = v23->_category;
    v23->_category = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    name = v23->_name;
    v23->_name = (NSString *)v28;

    uint64_t v30 = [v19 copy];
    eventIdentifierFieldName = v23->_eventIdentifierFieldName;
    v23->_eventIdentifierFieldName = (NSString *)v30;

    uint64_t v32 = [v20 copy];
    individuationFieldName = v23->_individuationFieldName;
    v23->_individuationFieldName = (NSString *)v32;

    uint64_t v34 = [v21 copy];
    environmentFieldNames = v23->_environmentFieldNames;
    v23->_environmentFieldNames = (NSArray *)v34;

    v23->_networkBound = a9;
    uint64_t v36 = [v22 copy];
    diagnostics = v23->_diagnostics;
    v23->_diagnostics = (NSArray *)v36;
  }
  return v23;
}

- (uint64_t)matchesSignpost:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (!a1) {
    goto LABEL_8;
  }
  v5 = [v3 subsystem];
  v6 = [a1 subsystem];
  if (![v5 isEqualToString:v6]) {
    goto LABEL_7;
  }
  v7 = [v4 category];
  v8 = [a1 category];
  if (![v7 isEqualToString:v8])
  {

LABEL_7:
    goto LABEL_8;
  }
  v9 = [v4 name];
  v10 = [a1 name];
  char v11 = [v9 isEqualToString:v10];

  if ((v11 & 1) == 0)
  {
LABEL_8:
    uint64_t v12 = 0;
    goto LABEL_9;
  }
  uint64_t v12 = 1;
LABEL_9:

  return v12;
}

- (uint64_t)hasChangesRelativeTo:(id)a1
{
  id v3 = a2;
  v4 = v3;
  uint64_t v5 = 0;
  if (a1 && a1 != v3)
  {
    v6 = [a1 diagnostics];
    uint64_t v7 = [v6 count];
    v8 = [v4 diagnostics];
    uint64_t v9 = [v8 count];

    if (v7 == v9)
    {
      v10 = [a1 diagnostics];
      uint64_t v11 = [v10 count];

      if (v11)
      {
        unint64_t v12 = 0;
        do
        {
          v13 = [a1 diagnostics];
          v14 = [v13 objectAtIndexedSubscript:v12];

          v15 = [v4 diagnostics];
          id v16 = [v15 objectAtIndexedSubscript:v12];

          int v17 = [v14 isEqual:v16];
          if (!v17) {
            break;
          }
          ++v12;
          id v18 = [a1 diagnostics];
          unint64_t v19 = [v18 count];
        }
        while (v12 < v19);
        uint64_t v5 = v17 ^ 1u;
      }
      else
      {
        uint64_t v5 = 0;
      }
    }
    else
    {
      uint64_t v5 = 1;
    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WRSignpost *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(WRSignpost *)self compare:v4] == 0;
  }

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WRSignpost *)self subsystem];
  v6 = [v4 subsystem];
  int64_t v7 = [v5 compare:v6];

  if (!v7)
  {
    v8 = [(WRSignpost *)self category];
    uint64_t v9 = [v4 category];
    int64_t v7 = [v8 compare:v9];

    if (!v7)
    {
      v10 = [(WRSignpost *)self name];
      uint64_t v11 = [v4 name];
      int64_t v7 = [v10 compare:v11];
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(WRSignpost *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  subsystem = self->_subsystem;
  category = self->_category;
  name = self->_name;
  if (self->_eventIdentifierIsSignpostID) {
    eventIdentifierFieldName = @"signpost id";
  }
  else {
    eventIdentifierFieldName = (__CFString *)self->_eventIdentifierFieldName;
  }
  individuationFieldName = self->_individuationFieldName;
  uint64_t v9 = [(NSArray *)self->_environmentFieldNames debugDescription];
  v10 = (void *)[v3 initWithFormat:@"%@:%@:%@ (event:%@ indiv:%@ env:%@ thresholds:%lu)", subsystem, category, name, eventIdentifierFieldName, individuationFieldName, v9, -[NSArray count](self->_diagnostics, "count")];

  return v10;
}

- (int)diagnosticThresholdCount
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(WRSignpost *)self diagnostics];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 hasTriggerThresholdCount])
        {
          LODWORD(v3) = [v6 triggerThresholdCount];
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasDiagnosticThresholdCount
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(WRSignpost *)self diagnostics];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) hasTriggerThresholdCount])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (double)diagnosticThresholdIntervalSeconds
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(WRSignpost *)self diagnostics];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  double v4 = 0.0;
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        long long v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 hasTriggerThresholdDurationSum])
        {
          [v8 triggerThresholdDurationSum];
          double v4 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (uint64_t)hasDiagnosticThresholdIntervalSeconds
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  v1 = objc_msgSend(a1, "diagnostics", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        if ([*(id *)(*((void *)&v6 + 1) + 8 * i) hasTriggerThresholdDurationSum])
        {
          uint64_t v2 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v2;
}

- (NSString)subsystem
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)eventIdentifierFieldName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)eventIdentifierIsSignpostID
{
  return self->_eventIdentifierIsSignpostID;
}

- (NSString)individuationFieldName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)environmentFieldNames
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)networkBound
{
  return self->_networkBound;
}

- (NSArray)diagnostics
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)hasDiagnosticThresholdInterval
{
  return self->_hasDiagnosticThresholdInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_environmentFieldNames, 0);
  objc_storeStrong((id *)&self->_individuationFieldName, 0);
  objc_storeStrong((id *)&self->_eventIdentifierFieldName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong((id *)&self->_subsystem, 0);
}

@end