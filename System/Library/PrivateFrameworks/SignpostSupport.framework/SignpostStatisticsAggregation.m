@interface SignpostStatisticsAggregation
+ (id)statisticsAggregationForObjects:(id)a3;
- ($BFD0544783004B6329B091033EEA470A)averageDuration;
- ($BFD0544783004B6329B091033EEA470A)stddevDuration;
- ($BFD0544783004B6329B091033EEA470A)totalDuration;
- (NSArray)aggregatedSignpostObjects;
- (NSDictionary)aggregationIdentifierToChildAggregationDict;
- (NSString)aggregationIdentifier;
- (NSString)category;
- (NSString)name;
- (NSString)subsystem;
- (NSString)tierString;
- (float)timeBaseRatio;
- (id)_dictRepresentation;
- (id)_initWithSignpostObjects:(id)a3 tier:(unsigned __int8)a4;
- (id)aggregationForTimeInterval:(id)a3 containedOnly:(BOOL)a4;
- (id)debugDescription;
- (id)jsonDescription:(unint64_t)a3;
- (unint64_t)count;
- (unsigned)tier;
- (void)_calculateStats;
@end

@implementation SignpostStatisticsAggregation

+ (id)statisticsAggregationForObjects:(id)a3
{
  v4 = [a3 sortedArrayUsingComparator:&__block_literal_global_6];
  v5 = (void *)[objc_alloc((Class)a1) _initWithSignpostObjects:v4 tier:0];

  return v5;
}

uint64_t __65__SignpostStatisticsAggregation_statisticsAggregationForObjects___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 beginDate];
  v6 = [v4 beginDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)aggregationForTimeInterval:(id)a3 containedOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v8 = [(SignpostStatisticsAggregation *)self aggregatedSignpostObjects];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v23 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
      unint64_t v14 = [v13 startMachContinuousTime];
      if (v14 >= [v6 endMachContinuousTime]) {
        goto LABEL_16;
      }
      unint64_t v15 = [v13 startMachContinuousTime];
      unint64_t v16 = [v6 startMachContinuousTime];
      BOOL v17 = v15 >= v16;
      if (v4) {
        goto LABEL_10;
      }
      if (v15 < v16) {
        break;
      }
LABEL_13:
      [v7 addObject:v13];
LABEL_14:
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_16;
      }
    }
    unint64_t v18 = [v13 endMachContinuousTime];
    BOOL v17 = v18 >= [v6 startMachContinuousTime];
LABEL_10:
    if (!v17) {
      goto LABEL_14;
    }
    unint64_t v19 = [v13 endMachContinuousTime];
    if (v19 > [v6 endMachContinuousTime]) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_16:

  id v20 = [[SignpostStatisticsAggregation alloc] _initWithSignpostObjects:v7 tier:[(SignpostStatisticsAggregation *)self tier]];

  return v20;
}

- (void)_calculateStats
{
  v3 = [(SignpostStatisticsAggregation *)self aggregatedSignpostObjects];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(SignpostStatisticsAggregation *)self aggregatedSignpostObjects];
    self->_count = [v5 count];

    id v6 = [(SignpostStatisticsAggregation *)self aggregatedSignpostObjects];
    unint64_t v7 = SignpostSupportTotalDurationMachContinuousTimeForIntervals(v6);
    [(SignpostStatisticsAggregation *)self timeBaseRatio];
    double v9 = (double)v7 * v8;
    *(float *)&double v9 = (float)(unint64_t)v9;
    self->_totalDuration.mct = v7;
    self->_totalDuration.ns = *(float *)&v9;
    *(float64x2_t *)&self->_totalDuration.ms = vcvtq_f64_f32(vdiv_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&v9, 0), *(float32x2_t *)""));

    [(SignpostStatisticsAggregation *)self totalDuration];
    unint64_t v10 = v17 / [(SignpostStatisticsAggregation *)self count];
    [(SignpostStatisticsAggregation *)self timeBaseRatio];
    double v12 = (double)v10 * v11;
    *(float *)&double v12 = (float)(unint64_t)v12;
    self->_averageDuration.mct = v10;
    self->_averageDuration.ns = *(float *)&v12;
    *(float64x2_t *)&self->_averageDuration.ms = vcvtq_f64_f32(vdiv_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&v12, 0), *(float32x2_t *)""));
    v13 = [(SignpostStatisticsAggregation *)self aggregatedSignpostObjects];
    unint64_t v14 = SignpostSupportStdDevMachContinuousTimeForIntervals(v13);
    [(SignpostStatisticsAggregation *)self timeBaseRatio];
    double v16 = (double)v14 * v15;
    *(float *)&double v16 = (float)(unint64_t)v16;
    self->_stddevDuration.mct = v14;
    self->_stddevDuration.ns = *(float *)&v16;
    *(float64x2_t *)&self->_stddevDuration.ms = vcvtq_f64_f32(vdiv_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&v16, 0), *(float32x2_t *)""));
  }
}

- (NSString)tierString
{
  unsigned int v2 = [(SignpostStatisticsAggregation *)self tier];
  if (v2 > 3) {
    return (NSString *)@"Unknown";
  }
  else {
    return &off_1E5B401E0[(char)v2]->isa;
  }
}

- (id)_initWithSignpostObjects:(id)a3 tier:(unsigned __int8)a4
{
  int v4 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v46.receiver = self;
  v46.super_class = (Class)SignpostStatisticsAggregation;
  float v8 = [(SignpostStatisticsAggregation *)&v46 init];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_aggregatedSignpostObjects, a3);
    v9->_tier = v4;
    unint64_t v10 = [v7 firstObject];
    [v10 timebaseRatio];
    *(float *)&double v11 = v11;
    v9->_timeBaseRatio = *(float *)&v11;

    if ([(SignpostStatisticsAggregation *)v9 tier])
    {
      double v12 = [v7 firstObject];
      uint64_t v13 = [v12 subsystem];
      subsystem = v9->_subsystem;
      v9->_subsystem = (NSString *)v13;
    }
    if ([(SignpostStatisticsAggregation *)v9 tier] >= 2)
    {
      float v15 = [v7 firstObject];
      uint64_t v16 = [v15 category];
      category = v9->_category;
      v9->_category = (NSString *)v16;
    }
    if ([(SignpostStatisticsAggregation *)v9 tier] >= 3)
    {
      unint64_t v18 = [v7 firstObject];
      uint64_t v19 = [v18 name];
      name = v9->_name;
      v9->_name = (NSString *)v19;
    }
    [(SignpostStatisticsAggregation *)v9 _calculateStats];
    if ([(SignpostStatisticsAggregation *)v9 tier] != 3)
    {
      v37 = v9;
      v21 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v38 = v7;
      id v22 = v7;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (!v23) {
        goto LABEL_26;
      }
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v43;
      while (1)
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v43 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = *(id *)(*((void *)&v42 + 1) + 8 * i);
          v28 = v27;
          switch(v4)
          {
            case 2:
              uint64_t v29 = [v27 name];
              goto LABEL_20;
            case 1:
              uint64_t v29 = [v27 category];
              goto LABEL_20;
            case 0:
              uint64_t v29 = [v27 subsystem];
LABEL_20:
              v30 = (void *)v29;
              goto LABEL_22;
          }
          v30 = 0;
LABEL_22:

          v31 = [v21 objectForKeyedSubscript:v30];
          if (!v31)
          {
            v31 = [MEMORY[0x1E4F1CA48] array];
            [v21 setObject:v31 forKeyedSubscript:v30];
          }
          [v31 addObject:v28];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v42 objects:v47 count:16];
        if (!v24)
        {
LABEL_26:

          v32 = [MEMORY[0x1E4F1CA60] dictionary];
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __63__SignpostStatisticsAggregation__initWithSignpostObjects_tier___block_invoke;
          v39[3] = &unk_1E5B40198;
          char v41 = v4 + 1;
          v33 = v32;
          v40 = v33;
          [v21 enumerateKeysAndObjectsUsingBlock:v39];
          double v9 = v37;
          aggregationIdentifierToChildAggregationDict = v37->_aggregationIdentifierToChildAggregationDict;
          v37->_aggregationIdentifierToChildAggregationDict = v33;
          v35 = v33;

          id v7 = v38;
          break;
        }
      }
    }
  }

  return v9;
}

void __63__SignpostStatisticsAggregation__initWithSignpostObjects_tier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [[SignpostStatisticsAggregation alloc] _initWithSignpostObjects:v5 tier:*(unsigned __int8 *)(a1 + 40)];

  if (v6) {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }
}

- (id)_dictRepresentation
{
  v34[5] = *MEMORY[0x1E4F143B8];
  v33[0] = @"count";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SignpostStatisticsAggregation count](self, "count"));
  v34[0] = v3;
  v33[1] = @"averageDurationNs";
  int v4 = NSNumber;
  [(SignpostStatisticsAggregation *)self averageDuration];
  id v5 = [v4 numberWithDouble:v32];
  v34[1] = v5;
  v33[2] = @"totalDurationNs";
  id v6 = NSNumber;
  [(SignpostStatisticsAggregation *)self totalDuration];
  id v7 = [v6 numberWithDouble:v31];
  v34[2] = v7;
  v33[3] = @"stddevDurationNs";
  float v8 = NSNumber;
  [(SignpostStatisticsAggregation *)self stddevDuration];
  double v9 = [v8 numberWithDouble:v30];
  v34[3] = v9;
  v33[4] = @"tier";
  unint64_t v10 = [(SignpostStatisticsAggregation *)self tierString];
  v34[4] = v10;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:5];
  double v12 = (void *)[v11 mutableCopy];

  uint64_t v13 = [(SignpostStatisticsAggregation *)self subsystem];

  if (v13)
  {
    unint64_t v14 = [(SignpostStatisticsAggregation *)self subsystem];
    [v12 setObject:v14 forKeyedSubscript:@"subsystem"];
  }
  float v15 = [(SignpostStatisticsAggregation *)self category];

  if (v15)
  {
    uint64_t v16 = [(SignpostStatisticsAggregation *)self category];
    [v12 setObject:v16 forKeyedSubscript:@"category"];
  }
  unint64_t v17 = [(SignpostStatisticsAggregation *)self name];

  if (v17)
  {
    unint64_t v18 = [(SignpostStatisticsAggregation *)self name];
    [v12 setObject:v18 forKeyedSubscript:@"name"];
  }
  uint64_t v19 = [(SignpostStatisticsAggregation *)self aggregationIdentifierToChildAggregationDict];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    v21 = [MEMORY[0x1E4F1CA60] dictionary];
    id v22 = [(SignpostStatisticsAggregation *)self aggregationIdentifierToChildAggregationDict];
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    id v27 = __52__SignpostStatisticsAggregation__dictRepresentation__block_invoke;
    v28 = &unk_1E5B401C0;
    id v29 = v21;
    id v23 = v21;
    [v22 enumerateKeysAndObjectsUsingBlock:&v25];

    objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, @"childAggregations", v25, v26, v27, v28);
  }

  return v12;
}

void __52__SignpostStatisticsAggregation__dictRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 _dictRepresentation];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (id)jsonDescription:(unint64_t)a3
{
  int v4 = [(SignpostStatisticsAggregation *)self _dictRepresentation];
  id v10 = 0;
  id v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:a3 error:&v10];
  id v6 = v10;
  if (!v5)
  {
    id v7 = _signpost_debug_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[SignpostStatisticsAggregation jsonDescription:](v6, v7);
    }
  }
  float v8 = (void *)[[NSString alloc] initWithData:v5 encoding:4];

  return v8;
}

- (id)debugDescription
{
  return [(SignpostStatisticsAggregation *)self jsonDescription:1];
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)aggregatedSignpostObjects
{
  return self->_aggregatedSignpostObjects;
}

- (NSString)aggregationIdentifier
{
  return self->_aggregationIdentifier;
}

- (NSDictionary)aggregationIdentifierToChildAggregationDict
{
  return self->_aggregationIdentifierToChildAggregationDict;
}

- (unsigned)tier
{
  return self->_tier;
}

- (unint64_t)count
{
  return self->_count;
}

- ($BFD0544783004B6329B091033EEA470A)totalDuration
{
  long long v3 = *(_OWORD *)&self[2].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var1;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- ($BFD0544783004B6329B091033EEA470A)averageDuration
{
  long long v3 = *(_OWORD *)&self[3].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var1;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- ($BFD0544783004B6329B091033EEA470A)stddevDuration
{
  long long v3 = *(_OWORD *)&self[4].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[4].var1;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (float)timeBaseRatio
{
  return self->_timeBaseRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregationIdentifierToChildAggregationDict, 0);
  objc_storeStrong((id *)&self->_aggregationIdentifier, 0);
  objc_storeStrong((id *)&self->_aggregatedSignpostObjects, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong((id *)&self->_subsystem, 0);
}

- (void)jsonDescription:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = (void *)v3;
  id v5 = @"Unknown";
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  int v6 = 138412290;
  id v7 = v5;
  _os_log_debug_impl(&dword_1A4576000, a2, OS_LOG_TYPE_DEBUG, "ERROR: Could not encode SignpostStatisticsAggregation as JSON: %@", (uint8_t *)&v6, 0xCu);
}

@end