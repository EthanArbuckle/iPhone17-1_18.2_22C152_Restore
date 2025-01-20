@interface SignpostAggregationGroup
+ (id)_sumOfGroup0:(id)a3 group1:(id)a4 errorOut:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)telemetryEnabled;
- (NSDictionary)durationTypeToDurationDict;
- (NSDictionary)measuredValueTypeToMeasuredValueDict;
- (NSString)countUnit;
- (NSString)name;
- (SignpostAggregation)parentAggregation;
- (double)countPerMs;
- (double)countPerNs;
- (double)countPerSecond;
- (id)_addGroup:(id)a3;
- (id)_coreAnalyticsFieldName;
- (id)_dictionaryRepresentation;
- (id)_initWithMetadataSegment:(id)a3 errorOut:(id *)a4;
- (id)_initWithName:(id)a3 count:(unint64_t)a4 countUnit:(id)a5 telemetryEnabled:(BOOL)a6;
- (id)_telemetryEnabledGroupDurations;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (void)addToPayloadDictionary:(id)a3;
- (void)setDurationTypeToDurationDict:(id)a3;
- (void)setMeasuredValueTypeToMeasuredValueDict:(id)a3;
- (void)setParentAggregation:(id)a3;
@end

@implementation SignpostAggregationGroup

- (id)_initWithName:(id)a3 count:(unint64_t)a4 countUnit:(id)a5 telemetryEnabled:(BOOL)a6
{
  id v11 = a3;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SignpostAggregationGroup;
  v13 = [(SignpostAggregationGroup *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_count = a4;
    objc_storeStrong((id *)&v13->_countUnit, a5);
    objc_storeStrong((id *)&v14->_name, a3);
    v14->_telemetryEnabled = a6;
  }

  return v14;
}

- (id)_dictionaryRepresentation
{
  v43[2] = *MEMORY[0x1E4F143B8];
  v42[0] = @"Count";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SignpostAggregationGroup count](self, "count"));
  v42[1] = kAggTelemetryEnabledKey;
  v43[0] = v3;
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SignpostAggregationGroup telemetryEnabled](self, "telemetryEnabled"));
  v43[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
  v6 = (void *)[v5 mutableCopy];

  v7 = [(SignpostAggregationGroup *)self durationTypeToDurationDict];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v10 = [(SignpostAggregationGroup *)self durationTypeToDurationDict];
    id v11 = [v10 allValues];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_super v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v17 = [v16 _dictionaryRepresentation];
          v18 = [v16 type];
          [v9 setObject:v17 forKeyedSubscript:v18];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v13);
    }

    [v6 setObject:v9 forKeyedSubscript:kAggDurationDictKey];
  }
  v19 = [(SignpostAggregationGroup *)self measuredValueTypeToMeasuredValueDict];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    v21 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v22 = [(SignpostAggregationGroup *)self measuredValueTypeToMeasuredValueDict];
    v23 = [v22 allValues];

    uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v32 + 1) + 8 * j);
          v29 = [v28 _dictionaryRepresentation];
          v30 = [v28 type];
          [v21 setObject:v29 forKeyedSubscript:v30];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v25);
    }

    [v6 setObject:v21 forKeyedSubscript:kAggMeasuredValueDictKey];
  }

  return v6;
}

- (id)_coreAnalyticsFieldName
{
  if ([(SignpostAggregationGroup *)self telemetryEnabled])
  {
    v3 = NSString;
    v4 = [(SignpostAggregationGroup *)self name];
    v5 = [v3 stringWithFormat:@"%@__TotalCount", v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)addToPayloadDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SignpostAggregationGroup *)self telemetryEnabled])
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SignpostAggregationGroup count](self, "count"));
    v6 = [(SignpostAggregationGroup *)self _coreAnalyticsFieldName];
    [v4 setObject:v5 forKeyedSubscript:v6];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v7 = [(SignpostAggregationGroup *)self durationTypeToDurationDict];
    uint64_t v8 = [v7 allValues];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          _addToPayloadDictionary(v4, *(void **)(*((void *)&v23 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v10);
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v13 = [(SignpostAggregationGroup *)self measuredValueTypeToMeasuredValueDict];
    uint64_t v14 = [v13 allValues];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          _addToPayloadDictionary(v4, *(void **)(*((void *)&v19 + 1) + 8 * v18++));
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v16);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SignpostAggregationGroup alloc];
  v5 = [(SignpostAggregationGroup *)self name];
  unint64_t v6 = [(SignpostAggregationGroup *)self count];
  v7 = [(SignpostAggregationGroup *)self countUnit];
  id v8 = [(SignpostAggregationGroup *)v4 _initWithName:v5 count:v6 countUnit:v7 telemetryEnabled:[(SignpostAggregationGroup *)self telemetryEnabled]];

  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [(SignpostAggregationGroup *)self durationTypeToDurationDict];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __41__SignpostAggregationGroup_copyWithZone___block_invoke;
  v21[3] = &unk_1E5B40478;
  id v11 = v9;
  id v22 = v11;
  [v10 enumerateKeysAndObjectsUsingBlock:v21];

  if ([v11 count]) {
    [v8 setDurationTypeToDurationDict:v11];
  }

  uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v13 = [(SignpostAggregationGroup *)self measuredValueTypeToMeasuredValueDict];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __41__SignpostAggregationGroup_copyWithZone___block_invoke_2;
  long long v19 = &unk_1E5B404A0;
  id v14 = v12;
  id v20 = v14;
  [v13 enumerateKeysAndObjectsUsingBlock:&v16];

  if (objc_msgSend(v14, "count", v16, v17, v18, v19)) {
    [v8 setMeasuredValueTypeToMeasuredValueDict:v14];
  }

  return v8;
}

void __41__SignpostAggregationGroup_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

void __41__SignpostAggregationGroup_copyWithZone___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (id)_initWithMetadataSegment:(id)a3 errorOut:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 typeNamespace];
  char v8 = [v7 isEqualToString:@"signpost.aggregation"];

  if ((v8 & 1) == 0)
  {
    if (a4)
    {
      v31 = (void *)MEMORY[0x1E4F28C58];
      long long v32 = @"Invalid type namespace for aggregation group";
LABEL_28:
      [v31 errorWithCode:9 description:v32];
      v30 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    }
LABEL_29:
    v30 = 0;
    goto LABEL_41;
  }
  uint64_t v9 = [v6 type];
  char v10 = [v9 isEqualToString:@"count"];

  if ((v10 & 1) == 0)
  {
    if (a4)
    {
      v31 = (void *)MEMORY[0x1E4F28C58];
      long long v32 = @"Invalid type for aggregation group";
      goto LABEL_28;
    }
    goto LABEL_29;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v11 = [v6 placeholderTokens];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v12)
  {

    long long v33 = 0;
    if (!a4)
    {
LABEL_48:
      uint64_t v15 = 0;
      id v29 = 0;
      v30 = 0;
      goto LABEL_40;
    }
LABEL_31:
    long long v34 = v33;
    id v35 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:@"No 'group' specified for aggregation group"];
    long long v33 = v34;
    uint64_t v15 = 0;
    id v29 = 0;
    v30 = 0;
    *a4 = v35;
    goto LABEL_40;
  }
  uint64_t v13 = v12;
  long long v39 = self;
  v40 = a4;
  v41 = 0;
  int v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = *(void *)v43;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v43 != v16) {
        objc_enumerationMutation(v11);
      }
      uint64_t v18 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      long long v19 = _stringAfterPrefix(v18, @"group=");
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = _checkTokenString(v19);
        if (v21)
        {
          long long v36 = (void *)v21;
          self = v39;
          if (v40)
          {
            id *v40 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:v21];
          }
        }
        else
        {
          if (!v15)
          {
            uint64_t v15 = v20;
            continue;
          }
          self = v39;
          if (v40)
          {
            id *v40 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:@"'group' specified multiple times for aggregation group"];
          }
        }

LABEL_38:
        id v29 = 0;
        v30 = 0;
LABEL_39:
        long long v33 = v41;
        goto LABEL_40;
      }
      uint64_t v22 = _stringAfterPrefix(v18, @"unit=");
      if (v22)
      {
        long long v23 = (void *)v22;
        if (v41)
        {
          if (v40)
          {
            id *v40 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:@"'unit' specified multiple times for aggregation group"];
          }

          self = v39;
          goto LABEL_38;
        }
        v41 = (void *)v22;
      }
      else
      {
        int v24 = [v18 isEqualToString:@"telemetry=enabled"];
        if ((v24 & v14) == 1)
        {
          self = v39;
          if (v40)
          {
            [MEMORY[0x1E4F28C58] errorWithCode:9 description:@"'telemetry=enabled' specified multiple times for aggregation group"];
            id *v40 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_38;
        }
        v14 |= v24;
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v13) {
      continue;
    }
    break;
  }

  if (!v15)
  {
    self = v39;
    a4 = v40;
    long long v33 = v41;
    if (!v40) {
      goto LABEL_48;
    }
    goto LABEL_31;
  }
  if (v41)
  {
    long long v25 = [v6 argument];
    int v26 = [v25 type];

    if (v26 == 3)
    {
      v27 = [v6 argument];
      v28 = [v27 argumentObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v29 = v28;
        self = (SignpostAggregationGroup *)-[SignpostAggregationGroup _initWithName:count:countUnit:telemetryEnabled:](v39, "_initWithName:count:countUnit:telemetryEnabled:", v15, [v29 unsignedLongLongValue], v41, v14 & 1);
        v30 = self;
      }
      else
      {
        if (v40)
        {
          [MEMORY[0x1E4F28C58] errorWithCode:9 description:@"Unexpected argument type for specified for aggregation group"];
          id v29 = 0;
          v30 = 0;
          id *v40 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v29 = 0;
          v30 = 0;
        }
        self = v39;
      }
    }
    else
    {
      if (v40)
      {
        [MEMORY[0x1E4F28C58] errorWithCode:9 description:@"Unexpected argument type for specified for aggregation group"];
        id v29 = 0;
        v30 = 0;
        id *v40 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v29 = 0;
        v30 = 0;
      }
      self = v39;
    }
    goto LABEL_39;
  }
  if (v40)
  {
    id v38 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:@"No 'unit' specified for aggregation group"];
    long long v33 = 0;
    id v29 = 0;
    v30 = 0;
    id *v40 = v38;
  }
  else
  {
    long long v33 = 0;
    id v29 = 0;
    v30 = 0;
  }
  self = v39;
LABEL_40:

LABEL_41:
  return v30;
}

+ (id)_sumOfGroup0:(id)a3 group1:(id)a4 errorOut:(id *)a5
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  uint64_t v9 = (void *)v8;
  if (!(v7 | v8))
  {
    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithCode:9 description:@"Tried to add two nil groups"];
      id v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = 0;
    }
    goto LABEL_17;
  }
  if (v7 && !v8)
  {
    unint64_t v8 = v7;
LABEL_9:
    id v10 = (id)[(id)v8 copy];
    goto LABEL_17;
  }
  if (!v7 && v8) {
    goto LABEL_9;
  }
  id v11 = (void *)[(id)v7 copy];
  uint64_t v12 = [v11 _addGroup:v9];
  uint64_t v13 = v12;
  if (a5) {
    *a5 = v12;
  }
  if (v13) {
    id v10 = 0;
  }
  else {
    id v10 = v11;
  }

LABEL_17:

  return v10;
}

- (id)_addGroup:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v12 = 0;
    goto LABEL_10;
  }
  id v5 = [(SignpostAggregationGroup *)self name];
  id v6 = [v4 name];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    uint64_t v13 = NSString;
    int v14 = [(SignpostAggregationGroup *)self name];
    uint64_t v15 = [v4 name];
    [v13 stringWithFormat:@"Tried to add groups with different names: %@ vs. %@", v14, v15];
    uint64_t v17 = LABEL_9:;

    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:v17];

    goto LABEL_10;
  }
  unint64_t v8 = [(SignpostAggregationGroup *)self countUnit];
  uint64_t v9 = [v4 countUnit];
  char v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v16 = NSString;
    int v14 = [(SignpostAggregationGroup *)self countUnit];
    uint64_t v15 = [v4 countUnit];
    [v16 stringWithFormat:@"Tried to add groups with same names but different units: %@ vs. %@", v14, v15];
    goto LABEL_9;
  }
  int v11 = [(SignpostAggregationGroup *)self telemetryEnabled];
  if (v11 != [v4 telemetryEnabled])
  {
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:@"Cannot add aggregation groups with different telemetry settings"];
    goto LABEL_10;
  }
  long long v19 = [(SignpostAggregationGroup *)self durationTypeToDurationDict];
  unint64_t v20 = 0x1E4F1C000uLL;
  unint64_t v21 = 0x1E4F1C000uLL;
  if ([v19 count])
  {
  }
  else
  {
    uint64_t v22 = [v4 durationTypeToDurationDict];
    uint64_t v23 = [v22 count];

    if (!v23) {
      goto LABEL_32;
    }
  }
  int v24 = [MEMORY[0x1E4F1CA80] set];
  long long v25 = [(SignpostAggregationGroup *)self durationTypeToDurationDict];
  uint64_t v26 = [v25 count];

  if (v26)
  {
    v27 = [(SignpostAggregationGroup *)self durationTypeToDurationDict];
    v28 = [v27 allKeys];
    [v24 addObjectsFromArray:v28];
  }
  id v29 = [v4 durationTypeToDurationDict];
  uint64_t v30 = [v29 count];

  if (v30)
  {
    v31 = [v4 durationTypeToDurationDict];
    long long v32 = [v31 allKeys];
    [v24 addObjectsFromArray:v32];
  }
  v71 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  obuint64_t j = v24;
  uint64_t v33 = [obj countByEnumeratingWithState:&v80 objects:v85 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v81;
LABEL_22:
    uint64_t v36 = 0;
    while (1)
    {
      if (*(void *)v81 != v35) {
        objc_enumerationMutation(obj);
      }
      uint64_t v37 = *(void *)(*((void *)&v80 + 1) + 8 * v36);
      id v38 = [(SignpostAggregationGroup *)self durationTypeToDurationDict];
      long long v39 = [v38 objectForKeyedSubscript:v37];

      v40 = [v4 durationTypeToDurationDict];
      v41 = [v40 objectForKeyedSubscript:v37];

      id v79 = 0;
      long long v42 = +[SignpostAggregationGroupDuration _sumOfDuration0:v39 duration1:v41 errorOut:&v79];
      id v43 = v79;
      long long v44 = v43;
      if (v43) {
        id v73 = v43;
      }
      else {
        [(NSDictionary *)v71 setObject:v42 forKeyedSubscript:v37];
      }

      if (v44) {
        goto LABEL_52;
      }
      if (v34 == ++v36)
      {
        uint64_t v34 = [obj countByEnumeratingWithState:&v80 objects:v85 count:16];
        if (v34) {
          goto LABEL_22;
        }
        break;
      }
    }
  }

  durationTypeToDurationDict = self->_durationTypeToDurationDict;
  self->_durationTypeToDurationDict = v71;

  unint64_t v21 = 0x1E4F1C000;
  unint64_t v20 = 0x1E4F1C000;
LABEL_32:
  v46 = [(SignpostAggregationGroup *)self measuredValueTypeToMeasuredValueDict];
  if ([v46 count])
  {
  }
  else
  {
    uint64_t v47 = [v4 measuredValueTypeToMeasuredValueDict];
    uint64_t v48 = [v47 count];

    if (!v48)
    {
LABEL_51:
      uint64_t v12 = 0;
      self->_count += [v4 count];
      goto LABEL_10;
    }
  }
  v49 = [*(id *)(v20 + 2688) set];
  v50 = [(SignpostAggregationGroup *)self measuredValueTypeToMeasuredValueDict];
  uint64_t v51 = [v50 count];

  if (v51)
  {
    v52 = [(SignpostAggregationGroup *)self measuredValueTypeToMeasuredValueDict];
    v53 = [v52 allKeys];
    [v49 addObjectsFromArray:v53];
  }
  v54 = [v4 measuredValueTypeToMeasuredValueDict];
  uint64_t v55 = [v54 count];

  if (v55)
  {
    v56 = [v4 measuredValueTypeToMeasuredValueDict];
    v57 = [v56 allKeys];
    [v49 addObjectsFromArray:v57];
  }
  v71 = [*(id *)(v21 + 2656) dictionary];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  obuint64_t j = v49;
  uint64_t v58 = [obj countByEnumeratingWithState:&v75 objects:v84 count:16];
  if (!v58)
  {
LABEL_50:

    measuredValueTypeToMeasuredValueDict = self->_measuredValueTypeToMeasuredValueDict;
    self->_measuredValueTypeToMeasuredValueDict = v71;

    goto LABEL_51;
  }
  uint64_t v59 = v58;
  uint64_t v60 = *(void *)v76;
LABEL_41:
  uint64_t v61 = 0;
  while (1)
  {
    if (*(void *)v76 != v60) {
      objc_enumerationMutation(obj);
    }
    uint64_t v62 = *(void *)(*((void *)&v75 + 1) + 8 * v61);
    v63 = [(SignpostAggregationGroup *)self measuredValueTypeToMeasuredValueDict];
    v64 = [v63 objectForKeyedSubscript:v62];

    v65 = [v4 measuredValueTypeToMeasuredValueDict];
    v66 = [v65 objectForKeyedSubscript:v62];

    id v74 = 0;
    v67 = +[SignpostAggregationGroupMeasuredValue _sumOfValue0:v64 value1:v66 errorOut:&v74];
    id v68 = v74;
    v69 = v68;
    if (v68) {
      id v73 = v68;
    }
    else {
      [(NSDictionary *)v71 setObject:v67 forKeyedSubscript:v62];
    }

    if (v69) {
      break;
    }
    if (v59 == ++v61)
    {
      uint64_t v59 = [obj countByEnumeratingWithState:&v75 objects:v84 count:16];
      if (v59) {
        goto LABEL_41;
      }
      goto LABEL_50;
    }
  }
LABEL_52:

  uint64_t v12 = v73;
LABEL_10:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (SignpostAggregationGroup *)a3;
  id v6 = v5;
  if (!v5)
  {
    BOOL v10 = 0;
    goto LABEL_9;
  }
  if (v5 == self)
  {
    BOOL v10 = 1;
    goto LABEL_9;
  }
  char v7 = v5;
  unint64_t v8 = [(SignpostAggregationGroup *)self count];
  if (v8 != [(SignpostAggregationGroup *)v7 count]) {
    goto LABEL_5;
  }
  BOOL v9 = [(SignpostAggregationGroup *)self telemetryEnabled];
  if (v9 != [(SignpostAggregationGroup *)v7 telemetryEnabled]) {
    goto LABEL_5;
  }
  uint64_t v12 = [(SignpostAggregationGroup *)self name];
  uint64_t v13 = [(SignpostAggregationGroup *)v7 name];
  if (v12 == (void *)v13)
  {

    goto LABEL_25;
  }
  int v14 = (void *)v13;
  uint64_t v15 = [(SignpostAggregationGroup *)self name];
  if (v15)
  {
    uint64_t v35 = [(SignpostAggregationGroup *)v7 name];
    if (!v35) {
      goto LABEL_28;
    }
  }
  uint64_t v16 = [(SignpostAggregationGroup *)self name];
  if (v16 || ([(SignpostAggregationGroup *)v7 name], (long long v19 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v17 = [(SignpostAggregationGroup *)self name];
    uint64_t v18 = [(SignpostAggregationGroup *)v7 name];
    uint64_t v3 = [v17 isEqual:v18] ^ 1;

    if (v16)
    {

      goto LABEL_22;
    }
    long long v19 = 0;
  }
  else
  {
    uint64_t v3 = 1;
  }

LABEL_22:
  if (v15)
  {
  }
  if (v3) {
    goto LABEL_5;
  }
LABEL_25:
  uint64_t v12 = [(SignpostAggregationGroup *)self countUnit];
  uint64_t v20 = [(SignpostAggregationGroup *)v7 countUnit];
  if (v12 == (void *)v20)
  {

    goto LABEL_40;
  }
  int v14 = (void *)v20;
  uint64_t v15 = [(SignpostAggregationGroup *)self countUnit];
  if (!v15
    || ([(SignpostAggregationGroup *)v7 countUnit],
        (uint64_t v35 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v21 = [(SignpostAggregationGroup *)self countUnit];
    if (v21
      || ([(SignpostAggregationGroup *)v7 countUnit],
          (long long v25 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v22 = [(SignpostAggregationGroup *)self countUnit];
      uint64_t v23 = [(SignpostAggregationGroup *)v7 countUnit];
      uint64_t v3 = [v22 isEqual:v23] ^ 1;

      if (v21)
      {

        int v24 = v35;
        if (!v15)
        {
LABEL_39:

          if (v3) {
            goto LABEL_5;
          }
LABEL_40:
          uint64_t v26 = [(SignpostAggregationGroup *)self durationTypeToDurationDict];
          uint64_t v27 = [(SignpostAggregationGroup *)v7 durationTypeToDurationDict];
          if (v26 == (void *)v27)
          {

            goto LABEL_55;
          }
          v28 = (void *)v27;
          id v29 = [(SignpostAggregationGroup *)self durationTypeToDurationDict];
          if (v29)
          {
            uint64_t v3 = [(SignpostAggregationGroup *)v7 durationTypeToDurationDict];
            if (!v3)
            {
              LOBYTE(v30) = 1;
              goto LABEL_54;
            }
          }
          v31 = [(SignpostAggregationGroup *)self durationTypeToDurationDict];
          if (v31
            || ([(SignpostAggregationGroup *)v7 durationTypeToDurationDict],
                (uint64_t v34 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            long long v32 = [(SignpostAggregationGroup *)self durationTypeToDurationDict];
            uint64_t v33 = [(SignpostAggregationGroup *)v7 durationTypeToDurationDict];
            int v30 = [v32 isEqual:v33] ^ 1;

            if (v31)
            {

              if (v29) {
                goto LABEL_54;
              }
              goto LABEL_48;
            }
            uint64_t v34 = 0;
          }
          else
          {
            int v30 = 1;
          }

          if (v29)
          {
LABEL_54:

            if (v30) {
              goto LABEL_5;
            }
            goto LABEL_55;
          }
LABEL_48:

          if (v30) {
            goto LABEL_5;
          }
LABEL_55:
          BOOL v10 = 1;
          goto LABEL_6;
        }
LABEL_38:

        goto LABEL_39;
      }
      long long v25 = 0;
    }
    else
    {
      uint64_t v3 = 1;
    }
    int v24 = v35;

    if (!v15) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_28:

LABEL_5:
  BOOL v10 = 0;
LABEL_6:

LABEL_9:
  return v10;
}

- (double)countPerNs
{
  uint64_t v3 = [(SignpostAggregationGroup *)self parentAggregation];
  unint64_t v4 = [v3 durationNs];

  if (v4) {
    return (double)[(SignpostAggregationGroup *)self count] / (double)v4;
  }
  else {
    return 0.0;
  }
}

- (double)countPerMs
{
  [(SignpostAggregationGroup *)self countPerNs];
  return v2 * 1000000.0;
}

- (double)countPerSecond
{
  [(SignpostAggregationGroup *)self countPerNs];
  return v2 * 1000000000.0;
}

- (id)_telemetryEnabledGroupDurations
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v4 = [(SignpostAggregationGroup *)self durationTypeToDurationDict];
  id v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 telemetryEnabled]) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if ([v3 count]) {
    id v11 = v3;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (unint64_t)count
{
  return self->_count;
}

- (NSString)countUnit
{
  return self->_countUnit;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)telemetryEnabled
{
  return self->_telemetryEnabled;
}

- (NSDictionary)durationTypeToDurationDict
{
  return self->_durationTypeToDurationDict;
}

- (void)setDurationTypeToDurationDict:(id)a3
{
}

- (NSDictionary)measuredValueTypeToMeasuredValueDict
{
  return self->_measuredValueTypeToMeasuredValueDict;
}

- (void)setMeasuredValueTypeToMeasuredValueDict:(id)a3
{
}

- (SignpostAggregation)parentAggregation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentAggregation);

  return (SignpostAggregation *)WeakRetained;
}

- (void)setParentAggregation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentAggregation);
  objc_storeStrong((id *)&self->_measuredValueTypeToMeasuredValueDict, 0);
  objc_storeStrong((id *)&self->_durationTypeToDurationDict, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_countUnit, 0);
}

@end