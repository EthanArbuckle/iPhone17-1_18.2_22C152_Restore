@interface SignpostAggregation
+ (id)_aggregationDescriptionStringForInterval:(id)a3;
+ (id)_signatureForSubsystem:(id)a3 category:(id)a4 name:(id)a5 aggregationDescription:(id)a6;
+ (id)_timeRangeDictForInterval:(id)a3;
+ (id)sumOfAggregation0:(id)a3 aggregation1:(id)a4 errorOut:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)telemetryEnabled;
- (NSArray)rawIntervals;
- (NSDate)earliestDate;
- (NSDate)latestDate;
- (NSDictionary)groupNameToGroupDict;
- (NSMutableDictionary)_groupToTypeToDuration;
- (NSMutableDictionary)_groupToTypeToMeasuredValue;
- (NSString)aggregationDescription;
- (NSString)category;
- (NSString)debugDescription;
- (NSString)name;
- (NSString)signatureString;
- (NSString)subsystem;
- (SignpostAggregation)initWithInterval:(id)a3 errorsOut:(id *)a4;
- (double)durationMs;
- (double)durationSeconds;
- (id)_canAdd:(id)a3;
- (id)_coreAnalyticsEventName;
- (id)_coreAnalyticsEventPayloadDictionary;
- (id)_handleCountSegment:(id)a3;
- (id)_handleValueSegment:(id)a3 placeholderType:(unsigned __int8)a4 parser:(id)a5;
- (id)_initWithSubsystem:(id)a3 category:(id)a4 name:(id)a5 rawIntervals:(id)a6 durationNs:(unint64_t)a7;
- (id)_processDescription:(id)a3;
- (id)_processInterval:(id)a3;
- (id)_processMetadataSegment:(id)a3 parser:(id)a4;
- (id)_telemetryEnabledGroupDurations;
- (id)_telemetryEnabledGroups;
- (id)_updateValueDict:(id)a3 withParser:(id)a4 placeholderType:(unsigned __int8)a5 class:(Class)a6;
- (id)addAggregation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonDescription:(unint64_t)a3;
- (unint64_t)durationNs;
- (unint64_t)earliestMCT;
- (unint64_t)latestMCT;
- (void)_fixupGroupsAndDurationsWithErrors:(id)a3;
- (void)_sortRawIntervals;
- (void)dropRawIntervals;
- (void)setEarliestMCT:(unint64_t)a3;
- (void)setLatestMCT:(unint64_t)a3;
- (void)set_groupToTypeToDuration:(id)a3;
- (void)set_groupToTypeToMeasuredValue:(id)a3;
@end

@implementation SignpostAggregation

- (void)dropRawIntervals
{
  self->_rawIntervals = [MEMORY[0x1E4F1CA48] array];

  MEMORY[0x1F41817F8]();
}

- (id)_handleCountSegment:(id)a3
{
  id v4 = a3;
  id v18 = 0;
  id v5 = [[SignpostAggregationGroup alloc] _initWithMetadataSegment:v4 errorOut:&v18];

  id v6 = v18;
  id v7 = v6;
  if (v5)
  {
    v8 = [(SignpostAggregation *)self groupNameToGroupDict];
    v9 = [v5 name];
    v10 = [v8 objectForKeyedSubscript:v9];

    if (v10)
    {
      v11 = NSString;
      v12 = [v5 name];
      v13 = [v11 stringWithFormat:@"Duplicate group: '%@'", v12];

      v14 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:v13];
    }
    else
    {
      v15 = [(SignpostAggregation *)self groupNameToGroupDict];
      v16 = [v5 name];
      [v15 setObject:v5 forKeyedSubscript:v16];

      v14 = 0;
    }
  }
  else
  {
    if (!v6)
    {
      if (_unknownAggregationError_onceToken != -1) {
        dispatch_once(&_unknownAggregationError_onceToken, &__block_literal_global_788);
      }
      id v7 = (id)_unknownAggregationError_unknownAggregationError;
    }
    id v7 = v7;
    v14 = v7;
  }

  return v14;
}

- (id)_updateValueDict:(id)a3 withParser:(id)a4 placeholderType:(unsigned __int8)a5 class:(Class)a6
{
  int v6 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 group];
  v11 = [v8 objectForKeyedSubscript:v10];

  if (!v11)
  {
    v11 = [MEMORY[0x1E4F1CA60] dictionary];
    v12 = [v9 group];
    [v8 setObject:v11 forKeyedSubscript:v12];
  }
  v13 = [v9 type];
  v14 = [v11 objectForKeyedSubscript:v13];

  if (!v14)
  {
    v14 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithParser:v9];
    if (!v14)
    {
      v21 = (void *)MEMORY[0x1E4F28C58];
      v22 = @"Failed to init duration/value";
LABEL_22:
      v27 = [v21 errorWithCode:9 description:v22];
      goto LABEL_32;
    }
    v15 = [v9 type];
    [v11 setObject:v14 forKeyedSubscript:v15];
  }
  uint64_t v16 = [v9 unit];
  if (!v16) {
    goto LABEL_8;
  }
  v17 = (void *)v16;
  id v18 = [v9 unit];
  v19 = [v14 unit];
  char v20 = [v18 isEqualToString:v19];

  if ((v20 & 1) == 0)
  {
    v23 = NSString;
    v24 = [v9 unit];
    v25 = [v14 unit];
    v26 = [v23 stringWithFormat:@"Mismatched unit values: %@ vs. %@", v24, v25];

    v27 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:v26];
  }
  else
  {
LABEL_8:
    switch(v6)
    {
      case 0:
      case 1:
      case 12:
      case 13:
        v21 = (void *)MEMORY[0x1E4F28C58];
        v22 = @"Unexpected placeholder type";
        goto LABEL_22;
      case 2:
      case 7:
        v28 = [v14 stats];
        v29 = [v28 _rawTotal];

        if (v29)
        {
          v21 = (void *)MEMORY[0x1E4F28C58];
          v22 = @"Collision on stats property: '_rawTotal'";
          goto LABEL_22;
        }
        v38 = [v9 value];
        v39 = [v14 stats];
        objc_msgSend(v39, "set_rawTotal:", v38);
        goto LABEL_28;
      case 3:
      case 8:
        v30 = [v14 stats];
        v31 = [v30 _rawAverage];

        if (v31)
        {
          v21 = (void *)MEMORY[0x1E4F28C58];
          v22 = @"Collision on stats property: '_rawAverage'";
          goto LABEL_22;
        }
        v38 = [v9 value];
        v39 = [v14 stats];
        objc_msgSend(v39, "set_rawAverage:", v38);
        goto LABEL_28;
      case 4:
      case 9:
        v32 = [v14 stats];
        v33 = [v32 min];

        if (v33)
        {
          v21 = (void *)MEMORY[0x1E4F28C58];
          v22 = @"Collision on stats property: 'min'";
          goto LABEL_22;
        }
        v38 = [v9 value];
        v39 = [v14 stats];
        [v39 setMin:v38];
        goto LABEL_28;
      case 5:
      case 10:
        v34 = [v14 stats];
        v35 = [v34 max];

        if (v35)
        {
          v21 = (void *)MEMORY[0x1E4F28C58];
          v22 = @"Collision on stats property: 'max'";
          goto LABEL_22;
        }
        v38 = [v9 value];
        v39 = [v14 stats];
        [v39 setMax:v38];
        goto LABEL_28;
      case 6:
      case 11:
        v36 = [v14 stats];
        v37 = [v36 stddev];

        if (v37)
        {
          v21 = (void *)MEMORY[0x1E4F28C58];
          v22 = @"Collision on stats property: 'stddev'";
          goto LABEL_22;
        }
        v38 = [v9 value];
        v39 = [v14 stats];
        [v39 setStddev:v38];
LABEL_28:

LABEL_29:
        if (([v14 telemetryEnabled] & 1) == 0) {
          objc_msgSend(v14, "setTelemetryEnabled:", objc_msgSend(v9, "telemetryEnabled"));
        }
        v27 = 0;
        break;
      default:
        goto LABEL_29;
    }
  }
LABEL_32:

  return v27;
}

- (id)_handleValueSegment:(id)a3 placeholderType:(unsigned __int8)a4 parser:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ((v6 - 7) < 5)
  {
    v10 = [(SignpostAggregation *)self _groupToTypeToMeasuredValue];
    goto LABEL_5;
  }
  if ((v6 - 2) <= 4)
  {
    v10 = [(SignpostAggregation *)self _groupToTypeToDuration];
LABEL_5:
    uint64_t v11 = objc_opt_class();
    goto LABEL_6;
  }
  uint64_t v11 = 0;
  v10 = 0;
LABEL_6:
  v12 = [v9 processSegment:v8 placeholderType:v6];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [(SignpostAggregation *)self _updateValueDict:v10 withParser:v9 placeholderType:v6 class:v11];
    [v9 _clearFields];
  }

  return v14;
}

- (id)_processDescription:(id)a3
{
  id v4 = a3;
  id v5 = [v4 argument];
  int v6 = [v5 type];

  if (v6 == 1)
  {
    id v7 = [(SignpostAggregation *)self aggregationDescription];

    if (v7)
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:@"Description specified multiple times"];
    }
    else
    {
      v10 = [v4 argument];
      uint64_t v11 = [v10 argumentObject];
      aggregationDescription = self->_aggregationDescription;
      self->_aggregationDescription = v11;

      id v8 = 0;
    }
  }
  else
  {
    id v9 = [NSString stringWithFormat:@"Unexpected argument type for 'signpost.aggregation:description'"];
    id v8 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:v9];
  }

  return v8;
}

- (id)_processMetadataSegment:(id)a3 parser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _placeholderTypeForSegment(v6);
  if ((v8 - 2) < 0xA)
  {
    uint64_t v9 = [(SignpostAggregation *)self _handleValueSegment:v6 placeholderType:v8 parser:v7];
LABEL_3:
    v10 = (void *)v9;
    goto LABEL_4;
  }
  switch(v8)
  {
    case 0xC:
      v12 = NSString;
      v13 = [v6 type];
      id v14 = [v12 stringWithFormat:@"Unknown aggregation namespace type '%@'", v13];

      v10 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:v14];

      break;
    case 1:
      uint64_t v9 = [(SignpostAggregation *)self _handleCountSegment:v6];
      goto LABEL_3;
    case 0:
      uint64_t v9 = [(SignpostAggregation *)self _processDescription:v6];
      goto LABEL_3;
    default:
      v10 = 0;
      break;
  }
LABEL_4:

  return v10;
}

- (void)_fixupGroupsAndDurationsWithErrors:(id)a3
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v77 = a3;
  id v4 = [(SignpostAggregation *)self _groupToTypeToDuration];
  if ([v4 count])
  {
  }
  else
  {
    id v5 = [(SignpostAggregation *)self _groupToTypeToMeasuredValue];
    uint64_t v6 = [v5 count];

    if (!v6) {
      goto LABEL_52;
    }
  }
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = [(SignpostAggregation *)self groupNameToGroupDict];
  uint64_t v9 = [v8 allKeys];
  v10 = [v7 setWithArray:v9];

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  uint64_t v11 = [(SignpostAggregation *)self _groupToTypeToDuration];
  v12 = [v11 allKeys];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v94 objects:v102 count:16];
  v71 = v10;
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v95 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v94 + 1) + 8 * i);
        if (([v10 containsObject:v17] & 1) == 0)
        {
          id v18 = [NSString stringWithFormat:@"Group '%@' was specified by one or more durations but has no count", v17];
          v19 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:v18];
          [v77 addObject:v19];

          v10 = v71;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v94 objects:v102 count:16];
    }
    while (v14);
  }

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  char v20 = [(SignpostAggregation *)self _groupToTypeToMeasuredValue];
  v21 = [v20 allKeys];

  uint64_t v22 = [v21 countByEnumeratingWithState:&v90 objects:v101 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v91;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v91 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v90 + 1) + 8 * j);
        if (([v10 containsObject:v26] & 1) == 0)
        {
          v27 = [NSString stringWithFormat:@"Group '%@' was specified by one or more measured values but has no count", v26];
          v28 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:v27];
          [v77 addObject:v28];

          v10 = v71;
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v90 objects:v101 count:16];
    }
    while (v23);
  }

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  v29 = [(SignpostAggregation *)self groupNameToGroupDict];
  v30 = [v29 allValues];

  obuint64_t j = v30;
  uint64_t v72 = [v30 countByEnumeratingWithState:&v86 objects:v100 count:16];
  if (v72)
  {
    uint64_t v70 = *(void *)v87;
    v75 = self;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v87 != v70) {
          objc_enumerationMutation(obj);
        }
        uint64_t v76 = v31;
        v32 = *(void **)(*((void *)&v86 + 1) + 8 * v31);
        [v32 setParentAggregation:self];
        v33 = [(SignpostAggregation *)self _groupToTypeToDuration];
        v34 = [v32 name];
        v35 = [v33 objectForKeyedSubscript:v34];

        if ([v35 count])
        {
          [v32 setDurationTypeToDurationDict:v35];
          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          v73 = v35;
          v36 = [v35 allValues];
          uint64_t v37 = [v36 countByEnumeratingWithState:&v82 objects:v99 count:16];
          if (v37)
          {
            uint64_t v38 = v37;
            uint64_t v39 = *(void *)v83;
            do
            {
              for (uint64_t k = 0; k != v38; ++k)
              {
                if (*(void *)v83 != v39) {
                  objc_enumerationMutation(v36);
                }
                v41 = *(void **)(*((void *)&v82 + 1) + 8 * k);
                v42 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v32, "count"));
                v43 = [v41 stats];
                [v43 setCount:v42];

                v44 = [v41 stats];
                v45 = [v44 _finalizeState];

                if (v45)
                {
                  v46 = NSString;
                  v47 = [v41 groupName];
                  v48 = [v41 type];
                  v49 = [v46 stringWithFormat:@"Group '%@', duration type '%@': %@", v47, v48, v45];

                  v50 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:v49];
                  [v77 addObject:v50];
                }
              }
              uint64_t v38 = [v36 countByEnumeratingWithState:&v82 objects:v99 count:16];
            }
            while (v38);
          }

          v35 = v73;
          self = v75;
        }

        v51 = [(SignpostAggregation *)self _groupToTypeToMeasuredValue];
        v52 = [v32 name];
        v53 = [v51 objectForKeyedSubscript:v52];

        if ([v53 count])
        {
          [v32 setMeasuredValueTypeToMeasuredValueDict:v53];
          long long v80 = 0u;
          long long v81 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          v74 = v53;
          v54 = [v53 allValues];
          uint64_t v55 = [v54 countByEnumeratingWithState:&v78 objects:v98 count:16];
          if (v55)
          {
            uint64_t v56 = v55;
            uint64_t v57 = *(void *)v79;
            do
            {
              for (uint64_t m = 0; m != v56; ++m)
              {
                if (*(void *)v79 != v57) {
                  objc_enumerationMutation(v54);
                }
                v59 = *(void **)(*((void *)&v78 + 1) + 8 * m);
                v60 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v32, "count"));
                v61 = [v59 stats];
                [v61 setCount:v60];

                v62 = [v59 stats];
                v63 = [v62 _finalizeState];

                if (v63)
                {
                  v64 = NSString;
                  v65 = [v59 groupName];
                  v66 = [v59 type];
                  v67 = [v64 stringWithFormat:@"Group '%@', measured value type '%@': %@", v65, v66, v63];

                  v68 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:v67];
                  [v77 addObject:v68];
                }
              }
              uint64_t v56 = [v54 countByEnumeratingWithState:&v78 objects:v98 count:16];
            }
            while (v56);
          }

          v53 = v74;
          self = v75;
        }

        uint64_t v31 = v76 + 1;
      }
      while (v76 + 1 != v72);
      uint64_t v72 = [obj countByEnumeratingWithState:&v86 objects:v100 count:16];
    }
    while (v72);
  }

  [(SignpostAggregation *)self set_groupToTypeToDuration:0];
  [(SignpostAggregation *)self set_groupToTypeToMeasuredValue:0];

LABEL_52:
}

- (id)_processInterval:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [v4 beginEvent];
  id v7 = [v4 endEvent];

  if (v6 == v7)
  {
    v10 = objc_alloc_init(_SignpostAggregationValueSegmentParser);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v11 = objc_msgSend(v4, "beginEvent", 0);
    v12 = [v11 metadataSegments];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [(SignpostAggregation *)self _processMetadataSegment:*(void *)(*((void *)&v22 + 1) + 8 * i) parser:v10];
          if (v17) {
            [v5 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);
    }

    id v18 = [(SignpostAggregation *)self groupNameToGroupDict];
    uint64_t v19 = [v18 count];

    if (!v19)
    {
      char v20 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:@"No valid aggregation groups provided"];
      [v5 addObject:v20];
    }
    [(SignpostAggregation *)self _fixupGroupsAndDurationsWithErrors:v5];
    if ([v5 count]) {
      id v9 = v5;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:@"Aggregations must be a time interval represented by a single event"];
    [v5 addObject:v8];
    id v9 = v5;
  }

  return v9;
}

- (id)_initWithSubsystem:(id)a3 category:(id)a4 name:(id)a5 rawIntervals:(id)a6 durationNs:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SignpostAggregation;
  uint64_t v17 = [(SignpostAggregation *)&v20 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_subsystem, a3);
    objc_storeStrong((id *)&v18->_category, a4);
    objc_storeStrong((id *)&v18->_name, a5);
    objc_storeStrong((id *)&v18->_rawIntervals, a6);
    v18->_durationNs = a7;
  }

  return v18;
}

+ (id)_timeRangeDictForInterval:(id)a3
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v14[0] = kAggBeginTimeMCTKey;
  v3 = NSNumber;
  id v4 = a3;
  id v5 = objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v4, "startMachContinuousTime"));
  v15[0] = v5;
  v14[1] = kAggBeginTimeNsKey;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "startNanoseconds"));
  v15[1] = v6;
  v14[2] = kAggEndTimeMCTKey;
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "endMachContinuousTime"));
  v15[2] = v7;
  v14[3] = kAggEndTimeNsKey;
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "endNanoseconds"));
  v15[3] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v10 = (void *)[v9 mutableCopy];

  uint64_t v11 = [v4 beginWallTimeStringWithTimeZoneName:0];
  v12 = [v4 endWallTimeStringWithTimeZoneName:0];

  if (v11 && v12)
  {
    [v10 setObject:v11 forKeyedSubscript:kAggBeginTimeDateKey];
    [v10 setObject:v12 forKeyedSubscript:kAggEndTimeDateKey];
  }

  return v10;
}

- (id)dictionaryRepresentation
{
  v40[4] = *MEMORY[0x1E4F143B8];
  v39[0] = kAggSubsystemKey;
  v3 = [(SignpostAggregation *)self subsystem];
  v40[0] = v3;
  v39[1] = kAggCategoryKey;
  id v4 = [(SignpostAggregation *)self category];
  v40[1] = v4;
  v39[2] = kAggNameKey;
  id v5 = [(SignpostAggregation *)self name];
  v40[2] = v5;
  v39[3] = kAggDurationNsKey;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SignpostAggregation durationNs](self, "durationNs"));
  v40[3] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:4];
  uint64_t v8 = (void *)[v7 mutableCopy];

  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v10 = [(SignpostAggregation *)self groupNameToGroupDict];
  uint64_t v11 = [v10 allValues];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v17 = [v16 _dictionaryRepresentation];
        id v18 = [v16 name];
        [v9 setObject:v17 forKeyedSubscript:v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v13);
  }

  [v8 setObject:v9 forKeyedSubscript:kAggGroupNameToGroupKey];
  uint64_t v19 = [(SignpostAggregation *)self aggregationDescription];

  if (v19)
  {
    objc_super v20 = [(SignpostAggregation *)self aggregationDescription];
    [v8 setObject:v20 forKeyedSubscript:kAggDescriptionKey];
  }
  v21 = [MEMORY[0x1E4F1CA48] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v22 = [(SignpostAggregation *)self rawIntervals];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = [(id)objc_opt_class() _timeRangeDictForInterval:*(void *)(*((void *)&v29 + 1) + 8 * j)];
        [v21 addObject:v27];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v24);
  }

  [v8 setObject:v21 forKeyedSubscript:kAggTimeRangeArrayKey];

  return v8;
}

- (SignpostAggregation)initWithInterval:(id)a3 errorsOut:(id *)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 beginDate];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [v6 endDate];

    if (v9)
    {
      v10 = [v6 subsystem];
      uint64_t v11 = [v6 category];
      uint64_t v12 = [v6 name];
      v29[0] = v6;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      uint64_t v14 = (void *)[v13 mutableCopy];
      self = -[SignpostAggregation _initWithSubsystem:category:name:rawIntervals:durationNs:](self, "_initWithSubsystem:category:name:rawIntervals:durationNs:", v10, v11, v12, v14, [v6 durationNanoseconds]);

      if (!self) {
        goto LABEL_9;
      }
      id v15 = [MEMORY[0x1E4F1CA60] dictionary];
      groupToTypeToDuration = self->__groupToTypeToDuration;
      self->__groupToTypeToDuration = v15;

      uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
      groupToTypeToMeasuredValue = self->__groupToTypeToMeasuredValue;
      self->__groupToTypeToMeasuredValue = v17;

      uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
      groupNameToGroupDict = self->_groupNameToGroupDict;
      self->_groupNameToGroupDict = v19;

      v21 = [v6 beginDate];
      earliestDate = self->_earliestDate;
      self->_earliestDate = v21;

      uint64_t v23 = [v6 endDate];
      latestDate = self->_latestDate;
      self->_latestDate = v23;

      self->_earliestMCT = [v6 startMachContinuousTime];
      self->_latestMCT = [v6 endMachContinuousTime];
      uint64_t v25 = [(SignpostAggregation *)self _processInterval:v6];
      if (!v25)
      {
LABEL_9:
        self = self;
        uint64_t v27 = self;
        goto LABEL_10;
      }
      uint64_t v26 = v25;
      if (a4) {
        *a4 = v25;
      }
    }
  }
  uint64_t v27 = 0;
LABEL_10:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SignpostAggregation alloc];
  id v5 = [(SignpostAggregation *)self subsystem];
  id v6 = [(SignpostAggregation *)self category];
  uint64_t v7 = [(SignpostAggregation *)self name];
  uint64_t v8 = [(SignpostAggregation *)self rawIntervals];
  id v9 = (void *)[v8 mutableCopy];
  id v10 = [(SignpostAggregation *)v4 _initWithSubsystem:v5 category:v6 name:v7 rawIntervals:v9 durationNs:[(SignpostAggregation *)self durationNs]];

  uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v12 = [(SignpostAggregation *)self groupNameToGroupDict];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __36__SignpostAggregation_copyWithZone___block_invoke;
  long long v29 = &unk_1E5B404C8;
  id v13 = v11;
  id v30 = v13;
  uint64_t v14 = v10;
  long long v31 = v14;
  [v12 enumerateKeysAndObjectsUsingBlock:&v26];

  id v15 = (void *)v14[9];
  v14[9] = v13;
  id v16 = v13;

  uint64_t v17 = [(SignpostAggregation *)self aggregationDescription];
  id v18 = (void *)v14[4];
  void v14[4] = v17;

  uint64_t v19 = [(SignpostAggregation *)self earliestDate];
  objc_super v20 = (void *)v14[7];
  v14[7] = v19;

  uint64_t v21 = [(SignpostAggregation *)self latestDate];
  long long v22 = (void *)v14[8];
  v14[8] = v21;

  uint64_t v23 = v31;
  uint64_t v24 = v14;

  return v24;
}

void __36__SignpostAggregation_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = (id)[v5 copy];
  uint64_t v7 = (void *)[v5 copy];

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
  [v8 setParentAggregation:*(void *)(a1 + 40)];
}

- (id)_canAdd:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SignpostAggregation *)self subsystem];
  id v6 = [v4 subsystem];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    objc_super v20 = NSString;
    uint64_t v21 = [(SignpostAggregation *)self subsystem];
    long long v22 = [v4 subsystem];
    [v20 stringWithFormat:@"Subsystems do not match: %@ vs. %@", v21, v22];
    uint64_t v25 = LABEL_14:;

    uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:v25];

    goto LABEL_15;
  }
  id v8 = [(SignpostAggregation *)self category];
  id v9 = [v4 category];
  char v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v23 = NSString;
    uint64_t v21 = [(SignpostAggregation *)self category];
    long long v22 = [v4 category];
    [v23 stringWithFormat:@"Categories do not match: %@ vs. %@", v21, v22];
    goto LABEL_14;
  }
  uint64_t v11 = [(SignpostAggregation *)self name];
  uint64_t v12 = [v4 name];
  char v13 = [v11 isEqualToString:v12];

  if ((v13 & 1) == 0
    || ([(SignpostAggregation *)self name],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        [v4 name],
        id v15 = objc_claimAutoreleasedReturnValue(),
        char v16 = [v14 isEqualToString:v15],
        v15,
        v14,
        (v16 & 1) == 0))
  {
    uint64_t v24 = NSString;
    uint64_t v21 = [(SignpostAggregation *)self name];
    long long v22 = [v4 name];
    [v24 stringWithFormat:@"Names do not match: %@ vs. %@", v21, v22];
    goto LABEL_14;
  }
  uint64_t v17 = [(SignpostAggregation *)self aggregationDescription];
  if (!v17)
  {
    v28 = [v4 aggregationDescription];
    if (v28)
    {

LABEL_25:
      long long v36 = NSString;
      uint64_t v21 = [(SignpostAggregation *)self aggregationDescription];
      long long v22 = [v4 aggregationDescription];
      [v36 stringWithFormat:@"Aggregation descriptions do not match: %@ vs. %@", v21, v22];
      goto LABEL_14;
    }
  }
  id v18 = [(SignpostAggregation *)self aggregationDescription];
  if (v18)
  {
    uint64_t v19 = [v4 aggregationDescription];

    if (v17) {
    if (!v19)
    }
      goto LABEL_25;
  }
  else
  {

    if (v17) {
  }
    }
  uint64_t v29 = [(SignpostAggregation *)self aggregationDescription];
  if (v29)
  {
    id v30 = (void *)v29;
    uint64_t v31 = [v4 aggregationDescription];
    if (v31)
    {
      long long v32 = (void *)v31;
      long long v33 = [(SignpostAggregation *)self aggregationDescription];
      long long v34 = [v4 aggregationDescription];
      char v35 = [v33 isEqualToString:v34];

      if ((v35 & 1) == 0) {
        goto LABEL_25;
      }
    }
    else
    {
    }
  }
  uint64_t v37 = [(SignpostAggregation *)self earliestDate];
  [v37 timeIntervalSince1970];
  double v39 = v38;
  v40 = [v4 latestDate];
  [v40 timeIntervalSince1970];
  if (v39 >= v41)
  {

    goto LABEL_48;
  }
  v42 = [(SignpostAggregation *)self latestDate];
  [v42 timeIntervalSince1970];
  double v44 = v43;
  v45 = [v4 earliestDate];
  [v45 timeIntervalSince1970];
  double v47 = v46;

  if (v44 <= v47) {
    goto LABEL_48;
  }
  v48 = [(SignpostAggregation *)self rawIntervals];
  if ([v48 count])
  {
    v49 = [v4 rawIntervals];
    uint64_t v50 = [v49 count];

    if (v50)
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      v51 = [(SignpostAggregation *)self rawIntervals];
      uint64_t v52 = [v51 countByEnumeratingWithState:&v68 objects:v73 count:16];
      if (v52)
      {
        uint64_t v53 = v52;
        uint64_t v54 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v53; ++i)
          {
            if (*(void *)v69 != v54) {
              objc_enumerationMutation(v51);
            }
            uint64_t v56 = *(void **)(*((void *)&v68 + 1) + 8 * i);
            long long v64 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            uint64_t v57 = [v4 rawIntervals];
            uint64_t v58 = [v57 countByEnumeratingWithState:&v64 objects:v72 count:16];
            if (v58)
            {
              uint64_t v59 = v58;
              uint64_t v60 = *(void *)v65;
              while (2)
              {
                for (uint64_t j = 0; j != v59; ++j)
                {
                  if (*(void *)v65 != v60) {
                    objc_enumerationMutation(v57);
                  }
                  if ([v56 intersectsInterval:*(void *)(*((void *)&v64 + 1) + 8 * j)])
                  {
                    uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:@"Cannot add add aggregations that cover intersecting periods of time"];

                    goto LABEL_15;
                  }
                }
                uint64_t v59 = [v57 countByEnumeratingWithState:&v64 objects:v72 count:16];
                if (v59) {
                  continue;
                }
                break;
              }
            }
          }
          uint64_t v53 = [v51 countByEnumeratingWithState:&v68 objects:v73 count:16];
        }
        while (v53);
      }

      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v62 = [(SignpostAggregation *)self earliestMCT];
  if (v62 >= [v4 latestMCT]
    || (unint64_t v63 = -[SignpostAggregation latestMCT](self, "latestMCT"), v63 <= [v4 earliestMCT]))
  {
LABEL_48:
    uint64_t v26 = 0;
    goto LABEL_15;
  }
  uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:@"Cannot add add aggregations that cover intersecting periods of time"];
LABEL_15:

  return v26;
}

- (void)_sortRawIntervals
{
  v3 = [(SignpostAggregation *)self rawIntervals];
  unint64_t v4 = [v3 count];

  if (v4 >= 2)
  {
    id v6 = [(SignpostAggregation *)self rawIntervals];
    id v5 = (id)[v6 sortedArrayUsingComparator:&__block_literal_global_623];
  }
}

uint64_t __40__SignpostAggregation__sortRawIntervals__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 beginDate];
  uint64_t v7 = [v5 beginDate];
  id v8 = (void *)v7;
  if (v6 && v7)
  {
    uint64_t v9 = [v6 compare:v7];
  }
  else
  {
    unint64_t v10 = [v4 startMachContinuousTime];
    if (v10 >= [v5 startMachContinuousTime])
    {
      unint64_t v11 = [v4 startMachContinuousTime];
      uint64_t v9 = v11 > [v5 startMachContinuousTime];
    }
    else
    {
      uint64_t v9 = -1;
    }
  }

  return v9;
}

- (id)addAggregation:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v4 = (SignpostAggregation *)a3;
  if (v4)
  {
    id v5 = [(SignpostAggregation *)self _canAdd:v4];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v8 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v9 = [(SignpostAggregation *)self groupNameToGroupDict];
      unint64_t v10 = [v9 allKeys];
      unint64_t v11 = [v8 setWithArray:v10];

      uint64_t v12 = [(SignpostAggregation *)v4 groupNameToGroupDict];
      char v13 = [v12 allKeys];
      [v11 addObjectsFromArray:v13];

      id v77 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v14 = [(SignpostAggregation *)self rawIntervals];
      id v15 = [v14 lastObject];
      char v16 = [v15 endDate];

      uint64_t v17 = [(SignpostAggregation *)v4 rawIntervals];
      id v18 = [v17 firstObject];
      uint64_t v19 = [v18 beginDate];

      v73 = (void *)v19;
      uint64_t v74 = v16;
      if (v16 && v19 && [v16 compare:v19] != 1)
      {
        v28 = [(SignpostAggregation *)self rawIntervals];
        uint64_t v29 = [(SignpostAggregation *)v4 rawIntervals];
        [v28 addObjectsFromArray:v29];
      }
      else
      {
        objc_super v20 = [(SignpostAggregation *)self rawIntervals];
        uint64_t v21 = [v20 firstObject];
        long long v22 = [v21 beginDate];

        uint64_t v23 = [(SignpostAggregation *)v4 rawIntervals];
        uint64_t v24 = [v23 lastObject];
        uint64_t v25 = [v24 endDate];

        if (v22 && v25 && [v25 compare:v22] != 1)
        {
          id v30 = objc_alloc(MEMORY[0x1E4F1CA48]);
          uint64_t v31 = [(SignpostAggregation *)v4 rawIntervals];
          long long v32 = (NSArray *)[v30 initWithArray:v31];

          long long v33 = [(SignpostAggregation *)self rawIntervals];
          [(NSArray *)v32 addObjectsFromArray:v33];

          rawIntervals = self->_rawIntervals;
          self->_rawIntervals = v32;
        }
        else
        {

          uint64_t v26 = [(SignpostAggregation *)self rawIntervals];
          uint64_t v27 = [(SignpostAggregation *)v4 rawIntervals];
          [v26 addObjectsFromArray:v27];

          [(SignpostAggregation *)self _sortRawIntervals];
        }
      }
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      obuint64_t j = v11;
      uint64_t v35 = [obj countByEnumeratingWithState:&v79 objects:v83 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v80;
        while (2)
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v80 != v37) {
              objc_enumerationMutation(obj);
            }
            uint64_t v39 = *(void *)(*((void *)&v79 + 1) + 8 * i);
            v40 = [(SignpostAggregation *)self groupNameToGroupDict];
            double v41 = [v40 objectForKeyedSubscript:v39];

            v42 = v4;
            double v43 = [(SignpostAggregation *)v4 groupNameToGroupDict];
            double v44 = [v43 objectForKeyedSubscript:v39];

            id v78 = 0;
            v45 = +[SignpostAggregationGroup _sumOfGroup0:v41 group1:v44 errorOut:&v78];
            id v46 = v78;
            double v47 = v46;
            if (v45)
            {
              [v77 setObject:v45 forKeyedSubscript:v39];
              [v45 setParentAggregation:self];
            }
            else
            {
              id v75 = v46;
            }

            if (!v45)
            {
              v48 = obj;
              v49 = v77;
              long long v64 = obj;
              id v4 = v42;
              id v6 = 0;
              id v7 = v75;
              goto LABEL_39;
            }
            id v4 = v42;
          }
          uint64_t v36 = [obj countByEnumeratingWithState:&v79 objects:v83 count:16];
          if (v36) {
            continue;
          }
          break;
        }
      }
      v48 = obj;

      v49 = v77;
      objc_storeStrong((id *)&self->_groupNameToGroupDict, v77);
      self->_durationNs += [(SignpostAggregation *)v4 durationNs];
      unint64_t v50 = [(SignpostAggregation *)self earliestMCT];
      unint64_t v51 = [(SignpostAggregation *)v4 earliestMCT];
      if (v50 >= v51) {
        unint64_t v52 = v51;
      }
      else {
        unint64_t v52 = v50;
      }
      [(SignpostAggregation *)self setEarliestMCT:v52];
      unint64_t v53 = [(SignpostAggregation *)self latestMCT];
      unint64_t v54 = [(SignpostAggregation *)v4 latestMCT];
      if (v53 <= v54) {
        unint64_t v55 = v54;
      }
      else {
        unint64_t v55 = v53;
      }
      [(SignpostAggregation *)self setLatestMCT:v55];
      uint64_t v56 = [(SignpostAggregation *)self earliestDate];
      [v56 timeIntervalSince1970];
      double v58 = v57;
      uint64_t v59 = [(SignpostAggregation *)v4 earliestDate];
      [v59 timeIntervalSince1970];
      if (v58 <= v60) {
        v61 = self;
      }
      else {
        v61 = v4;
      }
      unint64_t v62 = [(SignpostAggregation *)v61 earliestDate];
      earliestDate = self->_earliestDate;
      self->_earliestDate = v62;

      long long v64 = [(SignpostAggregation *)self latestDate];
      [v64 timeIntervalSince1970];
      double v66 = v65;
      long long v67 = [(SignpostAggregation *)v4 latestDate];
      [v67 timeIntervalSince1970];
      if (v66 > v68) {
        long long v69 = self;
      }
      else {
        long long v69 = v4;
      }
      long long v70 = [(SignpostAggregation *)v69 latestDate];
      latestDate = self->_latestDate;
      self->_latestDate = v70;

      id v7 = 0;
      id v6 = 0;
LABEL_39:
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)sumOfAggregation0:(id)a3 aggregation1:(id)a4 errorOut:(id *)a5
{
  id v7 = a4;
  id v8 = (void *)[a3 copy];
  uint64_t v9 = [v8 addAggregation:v7];

  if (a5) {
    *a5 = v9;
  }
  if (v9) {
    id v10 = 0;
  }
  else {
    id v10 = v8;
  }

  return v10;
}

- (double)durationMs
{
  return (double)[(SignpostAggregation *)self durationNs] / 1000000.0;
}

- (double)durationSeconds
{
  return (double)[(SignpostAggregation *)self durationNs] / 1000000000.0;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (SignpostAggregation *)a3;
  id v6 = v5;
  if (v5)
  {
    if (v5 != self)
    {
      id v7 = v5;
      unint64_t v8 = [(SignpostAggregation *)self durationNs];
      if (v8 != [(SignpostAggregation *)v7 durationNs])
      {
LABEL_100:
        BOOL v13 = 0;
LABEL_101:

        goto LABEL_102;
      }
      uint64_t v9 = [(SignpostAggregation *)self subsystem];
      uint64_t v10 = [(SignpostAggregation *)v7 subsystem];
      if (v9 == (void *)v10)
      {

        goto LABEL_21;
      }
      unint64_t v11 = (void *)v10;
      uint64_t v12 = [(SignpostAggregation *)self subsystem];
      if (v12)
      {
        double v65 = [(SignpostAggregation *)v7 subsystem];
        if (!v65) {
          goto LABEL_99;
        }
      }
      uint64_t v14 = [(SignpostAggregation *)self subsystem];
      if (v14
        || ([(SignpostAggregation *)v7 subsystem], (id v18 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        id v15 = [(SignpostAggregation *)self subsystem];
        v3 = v7;
        char v16 = [(SignpostAggregation *)v7 subsystem];
        char v17 = [v15 isEqual:v16] ^ 1;

        if (v14)
        {

          id v7 = v3;
          goto LABEL_18;
        }
        id v18 = 0;
        id v7 = v3;
      }
      else
      {
        char v17 = 1;
      }

LABEL_18:
      if (v12)
      {
      }
      if (v17) {
        goto LABEL_100;
      }
LABEL_21:
      uint64_t v9 = [(SignpostAggregation *)self category];
      uint64_t v19 = [(SignpostAggregation *)v7 category];
      if (v9 == (void *)v19)
      {

        goto LABEL_36;
      }
      unint64_t v11 = (void *)v19;
      uint64_t v12 = [(SignpostAggregation *)self category];
      if (v12)
      {
        double v65 = [(SignpostAggregation *)v7 category];
        if (!v65) {
          goto LABEL_99;
        }
      }
      objc_super v20 = [(SignpostAggregation *)self category];
      if (v20
        || ([(SignpostAggregation *)v7 category], (uint64_t v24 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        uint64_t v21 = [(SignpostAggregation *)self category];
        v3 = v7;
        long long v22 = [(SignpostAggregation *)v7 category];
        char v23 = [v21 isEqual:v22] ^ 1;

        if (v20)
        {

          id v7 = v3;
          goto LABEL_33;
        }
        uint64_t v24 = 0;
        id v7 = v3;
      }
      else
      {
        char v23 = 1;
      }

LABEL_33:
      if (v12)
      {
      }
      if (v23) {
        goto LABEL_100;
      }
LABEL_36:
      uint64_t v9 = [(SignpostAggregation *)self name];
      uint64_t v25 = [(SignpostAggregation *)v7 name];
      if (v9 == (void *)v25)
      {

        goto LABEL_51;
      }
      unint64_t v11 = (void *)v25;
      uint64_t v12 = [(SignpostAggregation *)self name];
      if (v12)
      {
        double v65 = [(SignpostAggregation *)v7 name];
        if (!v65) {
          goto LABEL_99;
        }
      }
      uint64_t v26 = [(SignpostAggregation *)self name];
      if (v26 || ([(SignpostAggregation *)v7 name], (id v30 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        uint64_t v27 = [(SignpostAggregation *)self name];
        v3 = v7;
        v28 = [(SignpostAggregation *)v7 name];
        char v29 = [v27 isEqual:v28] ^ 1;

        if (v26)
        {

          id v7 = v3;
          goto LABEL_48;
        }
        id v30 = 0;
        id v7 = v3;
      }
      else
      {
        char v29 = 1;
      }

LABEL_48:
      if (v12)
      {
      }
      if (v29) {
        goto LABEL_100;
      }
LABEL_51:
      uint64_t v9 = [(SignpostAggregation *)self aggregationDescription];
      uint64_t v31 = [(SignpostAggregation *)v7 aggregationDescription];
      if (v9 == (void *)v31)
      {

        goto LABEL_66;
      }
      unint64_t v11 = (void *)v31;
      uint64_t v12 = [(SignpostAggregation *)self aggregationDescription];
      if (v12)
      {
        double v65 = [(SignpostAggregation *)v7 aggregationDescription];
        if (!v65) {
          goto LABEL_99;
        }
      }
      long long v32 = [(SignpostAggregation *)self aggregationDescription];
      if (v32
        || ([(SignpostAggregation *)v7 aggregationDescription],
            (uint64_t v36 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        long long v33 = [(SignpostAggregation *)self aggregationDescription];
        v3 = v7;
        long long v34 = [(SignpostAggregation *)v7 aggregationDescription];
        char v35 = [v33 isEqual:v34] ^ 1;

        if (v32)
        {

          id v7 = v3;
          goto LABEL_63;
        }
        uint64_t v36 = 0;
        id v7 = v3;
      }
      else
      {
        char v35 = 1;
      }

LABEL_63:
      if (v12)
      {
      }
      if (v35) {
        goto LABEL_100;
      }
LABEL_66:
      uint64_t v9 = [(SignpostAggregation *)self rawIntervals];
      uint64_t v37 = [(SignpostAggregation *)v7 rawIntervals];
      if (v9 == (void *)v37)
      {

        goto LABEL_81;
      }
      unint64_t v11 = (void *)v37;
      uint64_t v12 = [(SignpostAggregation *)self rawIntervals];
      if (v12)
      {
        double v65 = [(SignpostAggregation *)v7 rawIntervals];
        if (!v65) {
          goto LABEL_99;
        }
      }
      double v38 = [(SignpostAggregation *)self rawIntervals];
      if (v38
        || ([(SignpostAggregation *)v7 rawIntervals],
            (v42 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        uint64_t v39 = [(SignpostAggregation *)self rawIntervals];
        v3 = v7;
        v40 = [(SignpostAggregation *)v7 rawIntervals];
        char v41 = [v39 isEqual:v40] ^ 1;

        if (v38)
        {

          id v7 = v3;
          goto LABEL_78;
        }
        v42 = 0;
        id v7 = v3;
      }
      else
      {
        char v41 = 1;
      }

LABEL_78:
      if (v12)
      {
      }
      if (v41) {
        goto LABEL_100;
      }
LABEL_81:
      uint64_t v9 = [(SignpostAggregation *)self groupNameToGroupDict];
      uint64_t v43 = [(SignpostAggregation *)v7 groupNameToGroupDict];
      if (v9 == (void *)v43)
      {

        goto LABEL_96;
      }
      unint64_t v11 = (void *)v43;
      uint64_t v12 = [(SignpostAggregation *)self groupNameToGroupDict];
      if (v12)
      {
        double v65 = [(SignpostAggregation *)v7 groupNameToGroupDict];
        if (!v65) {
          goto LABEL_99;
        }
      }
      double v44 = [(SignpostAggregation *)self groupNameToGroupDict];
      if (v44
        || ([(SignpostAggregation *)v7 groupNameToGroupDict],
            (v48 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v45 = [(SignpostAggregation *)self groupNameToGroupDict];
        v3 = v7;
        id v46 = [(SignpostAggregation *)v7 groupNameToGroupDict];
        char v47 = [v45 isEqual:v46] ^ 1;

        if (v44)
        {

          id v7 = v3;
          goto LABEL_93;
        }
        v48 = 0;
        id v7 = v3;
      }
      else
      {
        char v47 = 1;
      }

LABEL_93:
      if (v12)
      {
      }
      if (v47) {
        goto LABEL_100;
      }
LABEL_96:
      uint64_t v9 = [(SignpostAggregation *)self earliestDate];
      uint64_t v49 = [(SignpostAggregation *)v7 earliestDate];
      if (v9 == (void *)v49)
      {

        goto LABEL_114;
      }
      unint64_t v11 = (void *)v49;
      uint64_t v12 = [(SignpostAggregation *)self earliestDate];
      if (v12)
      {
        double v65 = [(SignpostAggregation *)v7 earliestDate];
        if (!v65)
        {
LABEL_99:

          goto LABEL_100;
        }
      }
      unint64_t v51 = [(SignpostAggregation *)self earliestDate];
      if (v51
        || ([(SignpostAggregation *)v7 earliestDate],
            (unint64_t v55 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        unint64_t v52 = [(SignpostAggregation *)self earliestDate];
        v3 = v7;
        unint64_t v53 = [(SignpostAggregation *)v7 earliestDate];
        char v54 = [v52 isEqual:v53] ^ 1;

        if (v51)
        {

          id v7 = v3;
          goto LABEL_111;
        }
        unint64_t v55 = 0;
        id v7 = v3;
      }
      else
      {
        char v54 = 1;
      }

LABEL_111:
      if (v12)
      {
      }
      if (v54) {
        goto LABEL_100;
      }
LABEL_114:
      uint64_t v56 = [(SignpostAggregation *)self latestDate];
      uint64_t v57 = [(SignpostAggregation *)v7 latestDate];
      if (v56 == (void *)v57)
      {

        BOOL v13 = 1;
        goto LABEL_101;
      }
      double v58 = (void *)v57;
      uint64_t v59 = [(SignpostAggregation *)self latestDate];
      if (v59)
      {
        v3 = [(SignpostAggregation *)v7 latestDate];
        if (!v3)
        {
          double v60 = v7;
          LOBYTE(v7) = 1;
          goto LABEL_128;
        }
      }
      v61 = [(SignpostAggregation *)self latestDate];
      if (v61
        || ([(SignpostAggregation *)v7 latestDate],
            (long long v64 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        unint64_t v62 = [(SignpostAggregation *)self latestDate];
        double v60 = v7;
        unint64_t v63 = [(SignpostAggregation *)v7 latestDate];
        LODWORD(v7) = [v62 isEqual:v63] ^ 1;

        if (v61)
        {

          if (v59) {
            goto LABEL_128;
          }
          goto LABEL_122;
        }
        long long v64 = 0;
      }
      else
      {
        double v60 = v7;
        LODWORD(v7) = 1;
      }

      if (v59)
      {
LABEL_128:

        if (v7) {
          goto LABEL_129;
        }
        goto LABEL_123;
      }
LABEL_122:

      if (v7)
      {
LABEL_129:
        BOOL v13 = 0;
        goto LABEL_130;
      }
LABEL_123:
      BOOL v13 = 1;
LABEL_130:
      id v7 = v60;
      goto LABEL_101;
    }
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_102:

  return v13;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)[(SignpostAggregation *)self jsonDescription:1];
}

- (id)_telemetryEnabledGroupDurations
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(SignpostAggregation *)self groupNameToGroupDict];
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
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) _telemetryEnabledGroupDurations];
        if ([v10 count]) {
          [v3 addObjectsFromArray:v10];
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

- (id)_telemetryEnabledGroups
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(SignpostAggregation *)self groupNameToGroupDict];
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
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
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

- (id)_coreAnalyticsEventName
{
  v3 = NSString;
  id v4 = [(SignpostAggregation *)self subsystem];
  id v5 = [(SignpostAggregation *)self category];
  uint64_t v6 = [(SignpostAggregation *)self name];
  uint64_t v7 = [v3 stringWithFormat:@"%@__%@__%@", v4, v5, v6];

  return v7;
}

- (id)_coreAnalyticsEventPayloadDictionary
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(SignpostAggregation *)self groupNameToGroupDict];
  id v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) addToPayloadDictionary:v3];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  if ([v3 count])
  {
    uint64_t v10 = [(SignpostAggregation *)self aggregationDescription];

    if (v10)
    {
      id v11 = [(SignpostAggregation *)self aggregationDescription];
      [v3 setObject:v11 forKeyedSubscript:kCAFieldValue_DynamicDescription];
    }
    uint64_t v12 = NSNumber;
    [(SignpostAggregation *)self durationSeconds];
    long long v13 = objc_msgSend(v12, "numberWithDouble:");
    [v3 setObject:v13 forKeyedSubscript:kCAFieldValue_WindowDuration];

    id v14 = v3;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (id)_signatureForSubsystem:(id)a3 category:(id)a4 name:(id)a5 aggregationDescription:(id)a6
{
  if (a6) {
    [NSString stringWithFormat:@"%@__%@__%@__%@", a3, a4, a5, a6];
  }
  else {
  uint64_t v6 = [NSString stringWithFormat:@"%@__%@__%@", a3, a4, a5, v8];
  }

  return v6;
}

+ (id)_aggregationDescriptionStringForInterval:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = objc_msgSend(a3, "beginEvent", 0);
  id v4 = [v3 metadataSegments];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
      if (!_placeholderTypeForSegment(v9)) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    uint64_t v10 = [v9 argument];
    if ([v10 type] == 1)
    {
      id v11 = [v9 argument];
      uint64_t v12 = [v11 argumentObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_13;
      }
      uint64_t v10 = [v9 argument];
      id v14 = [v10 argumentObject];
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
LABEL_13:
    id v14 = 0;
  }

  return v14;
}

- (NSString)signatureString
{
  v3 = objc_opt_class();
  id v4 = [(SignpostAggregation *)self subsystem];
  uint64_t v5 = [(SignpostAggregation *)self category];
  uint64_t v6 = [(SignpostAggregation *)self name];
  uint64_t v7 = [(SignpostAggregation *)self aggregationDescription];
  uint64_t v8 = [v3 _signatureForSubsystem:v4 category:v5 name:v6 aggregationDescription:v7];

  return (NSString *)v8;
}

- (BOOL)telemetryEnabled
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(SignpostAggregation *)self groupNameToGroupDict];
  v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) telemetryEnabled])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
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

- (NSString)aggregationDescription
{
  return self->_aggregationDescription;
}

- (NSArray)rawIntervals
{
  return self->_rawIntervals;
}

- (unint64_t)durationNs
{
  return self->_durationNs;
}

- (NSDate)earliestDate
{
  return self->_earliestDate;
}

- (NSDate)latestDate
{
  return self->_latestDate;
}

- (NSDictionary)groupNameToGroupDict
{
  return self->_groupNameToGroupDict;
}

- (NSMutableDictionary)_groupToTypeToDuration
{
  return self->__groupToTypeToDuration;
}

- (void)set_groupToTypeToDuration:(id)a3
{
}

- (NSMutableDictionary)_groupToTypeToMeasuredValue
{
  return self->__groupToTypeToMeasuredValue;
}

- (void)set_groupToTypeToMeasuredValue:(id)a3
{
}

- (unint64_t)earliestMCT
{
  return self->_earliestMCT;
}

- (void)setEarliestMCT:(unint64_t)a3
{
  self->_earliestMCT = a3;
}

- (unint64_t)latestMCT
{
  return self->_latestMCT;
}

- (void)setLatestMCT:(unint64_t)a3
{
  self->_latestMCT = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__groupToTypeToMeasuredValue, 0);
  objc_storeStrong((id *)&self->__groupToTypeToDuration, 0);
  objc_storeStrong((id *)&self->_groupNameToGroupDict, 0);
  objc_storeStrong((id *)&self->_latestDate, 0);
  objc_storeStrong((id *)&self->_earliestDate, 0);
  objc_storeStrong((id *)&self->_rawIntervals, 0);
  objc_storeStrong((id *)&self->_aggregationDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong((id *)&self->_subsystem, 0);
}

@end