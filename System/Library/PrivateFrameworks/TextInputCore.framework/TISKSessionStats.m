@interface TISKSessionStats
+ (BOOL)supportsSecureCoding;
- (BOOL)_isPublishable;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTypingTimerHalted;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSMutableArray)sessionIds;
- (NSMutableDictionary)keyedMetrics;
- (NSString)identifier;
- (NSString)inputMode;
- (NSString)version;
- (TIKeyboardLayout)layout;
- (TISKSessionStats)initWithCoder:(id)a3;
- (id)_roundUpToNearestHalfHour:(id)a3;
- (id)_roundedSessionInterval;
- (id)counter:(id)a3;
- (id)description:(BOOL)a3;
- (id)generateDataForSR;
- (id)init:(id)a3 endDate:(id)a4 identifier:(id)a5 version:(id)a6 inputMode:(id)a7 sessionIds:(id)a8 layout:(id)a9;
- (id)positionalMetric:(id)a3;
- (id)samples:(id)a3;
- (id)samples:(id)a3 withPosition:(unint64_t)a4;
- (id)singleMetric:(id)a3;
- (void)addSample:(id)a3 forKey:(id)a4;
- (void)addSample:(id)a3 forKey:(id)a4 withPosition:(unint64_t)a5;
- (void)addToCounterForRateMetric:(int)a3 forKey:(id)a4;
- (void)addToDurationForRateMetric:(double)a3 forKey:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)haltTypingTimer;
- (void)haltTypingTimerWithEvent:(id)a3;
- (void)merge:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsEmpty:(BOOL)a3;
- (void)setKeyedMetrics:(id)a3;
- (void)setLayout:(id)a3;
- (void)setSessionIds:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setVersion:(id)a3;
- (void)setup;
- (void)startTypingTimerWithEvent:(id)a3;
@end

@implementation TISKSessionStats

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_sessionIds, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_keyedMetrics, 0);

  objc_storeStrong((id *)&self->_startTimerEvent, 0);
}

- (void)setIsEmpty:(BOOL)a3
{
  self->_isEmpty = a3;
}

- (BOOL)isEmpty
{
  return self->_isEmpty;
}

- (void)setLayout:(id)a3
{
}

- (TIKeyboardLayout)layout
{
  return self->_layout;
}

- (void)setSessionIds:(id)a3
{
}

- (NSMutableArray)sessionIds
{
  return self->_sessionIds;
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (void)setVersion:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setEndTime:(id)a3
{
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setKeyedMetrics:(id)a3
{
}

- (NSMutableDictionary)keyedMetrics
{
  return self->_keyedMetrics;
}

- (void)encodeWithCoder:(id)a3
{
  keyedMetrics = self->_keyedMetrics;
  id v5 = a3;
  [v5 encodeObject:keyedMetrics forKey:@"MetricSampleDictionary"];
  [v5 encodeObject:self->_startTime forKey:@"StartDateKey"];
  [v5 encodeObject:self->_endTime forKey:@"EndDateKey"];
  [v5 encodeObject:self->_identifier forKey:@"IdentifierKey"];
  [v5 encodeObject:self->_version forKey:@"VersionKey"];
  [v5 encodeObject:self->_inputMode forKey:@"InputModeKey"];
  [v5 encodeObject:self->_sessionIds forKey:@"SessionIdsKey"];
  [v5 encodeObject:self->_layout forKey:@"LayoutKey"];
}

- (TISKSessionStats)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v16 = [v5 decodeObjectOfClasses:v12 forKey:@"MetricSampleDictionary"];
  keyedMetrics = self->_keyedMetrics;
  self->_keyedMetrics = v16;

  v18 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"StartDateKey"];
  startTime = self->_startTime;
  self->_startTime = v18;

  v20 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"EndDateKey"];
  endTime = self->_endTime;
  self->_endTime = v20;

  v22 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"IdentifierKey"];
  identifier = self->_identifier;
  self->_identifier = v22;

  v24 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"VersionKey"];
  version = self->_version;
  self->_version = v24;

  v26 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"InputModeKey"];
  inputMode = self->_inputMode;
  self->_inputMode = v26;

  v28 = [v5 decodeObjectOfClasses:v15 forKey:@"SessionIdsKey"];
  sessionIds = self->_sessionIds;
  self->_sessionIds = v28;

  v30 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"LayoutKey"];

  layout = self->_layout;
  self->_layout = v30;

  return self;
}

- (id)generateDataForSR
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if (!self->_identifier)
  {
    self->_identifier = (NSString *)@"KEYBOARD-digest";
    v3 = IXADefaultLogFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v61 = objc_msgSend(NSString, "stringWithFormat:", @"%s [SensorKit] _identifier is nil", "-[TISKSessionStats generateDataForSR]");
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v61;
      _os_log_error_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
    }
  }
  if ([(TISKSessionStats *)self _isPublishable])
  {
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x2020000000;
    v4 = (id *)getSRKeyboardMetaInformationIdentifierKeySymbolLoc_ptr;
    uint64_t v73 = getSRKeyboardMetaInformationIdentifierKeySymbolLoc_ptr;
    if (!getSRKeyboardMetaInformationIdentifierKeySymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v79 = __getSRKeyboardMetaInformationIdentifierKeySymbolLoc_block_invoke;
      v80 = &unk_1E6E2E248;
      v81 = &v70;
      id v5 = (void *)SensorKitLibrary_19465();
      uint64_t v6 = dlsym(v5, "SRKeyboardMetaInformationIdentifierKey");
      *(void *)(v81[1] + 24) = v6;
      getSRKeyboardMetaInformationIdentifierKeySymbolLoc_ptr = *(void *)(v81[1] + 24);
      v4 = (id *)v71[3];
    }
    _Block_object_dispose(&v70, 8);
    if (!v4) {
      goto LABEL_56;
    }
    id v7 = *v4;
    v75[0] = v7;
    v77[0] = self->_identifier;
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x2020000000;
    uint64_t v8 = (id *)getSRKeyboardMetaInformationVersionKeySymbolLoc_ptr;
    uint64_t v73 = getSRKeyboardMetaInformationVersionKeySymbolLoc_ptr;
    if (!getSRKeyboardMetaInformationVersionKeySymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v79 = __getSRKeyboardMetaInformationVersionKeySymbolLoc_block_invoke;
      v80 = &unk_1E6E2E248;
      v81 = &v70;
      uint64_t v9 = (void *)SensorKitLibrary_19465();
      uint64_t v10 = dlsym(v9, "SRKeyboardMetaInformationVersionKey");
      *(void *)(v81[1] + 24) = v10;
      getSRKeyboardMetaInformationVersionKeySymbolLoc_ptr = *(void *)(v81[1] + 24);
      uint64_t v8 = (id *)v71[3];
    }
    _Block_object_dispose(&v70, 8);
    if (!v8) {
      goto LABEL_56;
    }
    id v11 = *v8;
    v75[1] = v11;
    v77[1] = self->_version;
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x2020000000;
    v12 = (id *)getSRKeyboardMetaInformationWidthKeySymbolLoc_ptr;
    uint64_t v73 = getSRKeyboardMetaInformationWidthKeySymbolLoc_ptr;
    if (!getSRKeyboardMetaInformationWidthKeySymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v79 = __getSRKeyboardMetaInformationWidthKeySymbolLoc_block_invoke;
      v80 = &unk_1E6E2E248;
      v81 = &v70;
      v13 = (void *)SensorKitLibrary_19465();
      uint64_t v14 = dlsym(v13, "SRKeyboardMetaInformationWidthKey");
      *(void *)(v81[1] + 24) = v14;
      getSRKeyboardMetaInformationWidthKeySymbolLoc_ptr = *(void *)(v81[1] + 24);
      v12 = (id *)v71[3];
    }
    _Block_object_dispose(&v70, 8);
    if (!v12) {
      goto LABEL_56;
    }
    id v15 = *v12;
    v75[2] = v15;
    v16 = NSNumber;
    [(TIKeyboardLayout *)self->_layout frame];
    +[TISKMetricDefinition pointsToMM:v17];
    v18 = objc_msgSend(v16, "numberWithDouble:");
    v77[2] = v18;
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x2020000000;
    v19 = (id *)getSRKeyboardMetaInformationHeightKeySymbolLoc_ptr;
    uint64_t v73 = getSRKeyboardMetaInformationHeightKeySymbolLoc_ptr;
    if (!getSRKeyboardMetaInformationHeightKeySymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v79 = __getSRKeyboardMetaInformationHeightKeySymbolLoc_block_invoke;
      v80 = &unk_1E6E2E248;
      v81 = &v70;
      v20 = (void *)SensorKitLibrary_19465();
      v21 = dlsym(v20, "SRKeyboardMetaInformationHeightKey");
      *(void *)(v81[1] + 24) = v21;
      getSRKeyboardMetaInformationHeightKeySymbolLoc_ptr = *(void *)(v81[1] + 24);
      v19 = (id *)v71[3];
    }
    _Block_object_dispose(&v70, 8);
    if (!v19) {
      goto LABEL_56;
    }
    id v64 = v15;
    id v22 = *v19;
    v75[3] = v22;
    v23 = NSNumber;
    [(TIKeyboardLayout *)self->_layout frame];
    +[TISKMetricDefinition pointsToMM:v24];
    v25 = objc_msgSend(v23, "numberWithDouble:");
    v77[3] = v25;
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x2020000000;
    v26 = (id *)getSRKeyboardMetaInformationInputModesKeySymbolLoc_ptr;
    uint64_t v73 = getSRKeyboardMetaInformationInputModesKeySymbolLoc_ptr;
    if (!getSRKeyboardMetaInformationInputModesKeySymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v79 = __getSRKeyboardMetaInformationInputModesKeySymbolLoc_block_invoke;
      v80 = &unk_1E6E2E248;
      v81 = &v70;
      v27 = (void *)SensorKitLibrary_19465();
      v28 = dlsym(v27, "SRKeyboardMetaInformationInputModesKey");
      *(void *)(v81[1] + 24) = v28;
      getSRKeyboardMetaInformationInputModesKeySymbolLoc_ptr = *(void *)(v81[1] + 24);
      v26 = (id *)v71[3];
    }
    _Block_object_dispose(&v70, 8);
    if (!v26) {
      goto LABEL_56;
    }
    v29 = v11;
    v62 = v7;
    id v30 = *v26;
    v75[4] = v30;
    v31 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_inputMode, 0);
    v77[4] = v31;
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x2020000000;
    v32 = (id *)getSRKeyboardMetaInformationSessionIdentifiersKeySymbolLoc_ptr;
    uint64_t v73 = getSRKeyboardMetaInformationSessionIdentifiersKeySymbolLoc_ptr;
    if (!getSRKeyboardMetaInformationSessionIdentifiersKeySymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v79 = __getSRKeyboardMetaInformationSessionIdentifiersKeySymbolLoc_block_invoke;
      v80 = &unk_1E6E2E248;
      v81 = &v70;
      v33 = (void *)SensorKitLibrary_19465();
      v34 = dlsym(v33, "SRKeyboardMetaInformationSessionIdentifiersKey");
      *(void *)(v81[1] + 24) = v34;
      getSRKeyboardMetaInformationSessionIdentifiersKeySymbolLoc_ptr = *(void *)(v81[1] + 24);
      v32 = (id *)v71[3];
    }
    _Block_object_dispose(&v70, 8);
    if (!v32)
    {
LABEL_56:
      dlerror();
      abort_report_np();
    }
    id v76 = *v32;
    sessionIds = self->_sessionIds;
    id v36 = v76;
    v37 = (void *)[(NSMutableArray *)sessionIds copy];
    v77[5] = v37;
    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v75 count:6];

    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x2050000000;
    v39 = (void *)getSRKeyboardMetricsClass_softClass;
    uint64_t v73 = getSRKeyboardMetricsClass_softClass;
    if (!getSRKeyboardMetricsClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v79 = __getSRKeyboardMetricsClass_block_invoke;
      v80 = &unk_1E6E2E248;
      v81 = &v70;
      __getSRKeyboardMetricsClass_block_invoke((uint64_t)&buf);
      v39 = (void *)v71[3];
    }
    v40 = v39;
    _Block_object_dispose(&v70, 8);
    id v41 = [v40 alloc];
    v42 = [(TISKSessionStats *)self _roundedSessionInterval];
    id v65 = (id)[v41 initWithInterval:v42 metaInformation:v38];

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v43 = +[TISKMetricDefinition metricDefinitions];
    uint64_t v44 = [v43 countByEnumeratingWithState:&v66 objects:v74 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      v63 = v38;
      id v46 = 0;
      uint64_t v47 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          v49 = v46;
          if (*(void *)v67 != v47) {
            objc_enumerationMutation(v43);
          }
          id v46 = *(id *)(*((void *)&v66 + 1) + 8 * i);

          keyedMetrics = self->_keyedMetrics;
          v51 = [v46 metricName];
          v52 = [(NSMutableDictionary *)keyedMetrics objectForKey:v51];

          if (v52)
          {
            switch([v46 metricType])
            {
              case 0u:
                [v52 doubleValue];
                if (v53 != 0.0)
                {
                  v54 = [v65 mutableScalarMetrics];
                  v55 = [v46 metricName];
                  [v54 setObject:v52 forKey:v55];
                  goto LABEL_44;
                }
                break;
              case 1u:
                if (([v52 isEmpty] & 1) == 0)
                {
                  v54 = [v52 generateDataForSR:v46];
                  if (!v54) {
                    goto LABEL_45;
                  }
                  uint64_t v56 = [v65 mutableProbabilityMetrics];
                  goto LABEL_43;
                }
                break;
              case 2u:
                v54 = [v52 rate];
                [v54 doubleValue];
                if (v57 == 0.0) {
                  goto LABEL_45;
                }
                uint64_t v56 = [v65 mutableScalarMetrics];
                goto LABEL_43;
              case 3u:
                if (([v52 isEmpty] & 1) == 0)
                {
                  v54 = [v52 generateDataForSR:v46];
                  if (v54)
                  {
                    uint64_t v56 = [v65 mutablePositionalMetrics];
LABEL_43:
                    v55 = (void *)v56;
                    v58 = [v46 metricName];
                    [v55 setObject:v54 forKey:v58];

LABEL_44:
                  }
LABEL_45:
                }
                break;
              default:
                break;
            }
          }
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v66 objects:v74 count:16];
      }
      while (v45);

      v38 = v63;
    }
  }
  else
  {
    v38 = IXADefaultLogFacility();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v60 = objc_msgSend(NSString, "stringWithFormat:", @"%s TISKSessionStats has metadata that resolves to nil and cannot be published", "-[TISKSessionStats generateDataForSR]");
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v60;
      _os_log_error_impl(&dword_1E3F0E000, v38, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
    }
    id v65 = 0;
  }

  return v65;
}

- (id)_roundedSessionInterval
{
  v3 = [(TISKSessionStats *)self _roundUpToNearestHalfHour:self->_startTime];
  v4 = [(TISKSessionStats *)self _roundUpToNearestHalfHour:self->_endTime];
  if ([v4 isEqualToDate:v3])
  {
    uint64_t v5 = [v3 dateByAddingTimeInterval:1800.0];

    v4 = (void *)v5;
  }
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v3 endDate:v4];

  return v6;
}

- (id)_roundUpToNearestHalfHour:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  uint64_t v5 = [v3 currentCalendar];
  uint64_t v6 = [v5 components:252 fromDate:v4];

  uint64_t v7 = [v6 minute];
  uint64_t v8 = 60;
  if (v7 < 45) {
    uint64_t v8 = 30;
  }
  if (v7 >= 15) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  [v6 setMinute:v9];
  [v6 setSecond:0];
  uint64_t v10 = [v5 dateFromComponents:v6];

  return v10;
}

- (id)description:(BOOL)a3
{
  BOOL v17 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28E78];
  v23.receiver = self;
  v23.super_class = (Class)TISKSessionStats;
  uint64_t v5 = [(TISKSessionStats *)&v23 description];
  uint64_t v6 = [v4 stringWithString:v5];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(NSMutableDictionary *)self->_keyedMetrics allKeys];
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v12 = [(NSMutableDictionary *)self->_keyedMetrics objectForKey:v11];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v13 = [v12 description];
        }
        else
        {
          v13 = 0;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = [v12 description];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v12, "intValue"));
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_16;
            }
            uint64_t v14 = [v12 description:v17];
          }
        }
        id v15 = (void *)v14;

        v13 = v15;
LABEL_16:
        [v6 appendFormat:@"%@ %@\n", v11, v13];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)positionalMetric:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_keyedMetrics objectForKey:a3];
}

- (id)singleMetric:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_keyedMetrics objectForKey:a3];
}

- (id)samples:(id)a3 withPosition:(unint64_t)a4
{
  uint64_t v5 = [(NSMutableDictionary *)self->_keyedMetrics objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    if ([v6 size] <= a4)
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v7 = [v6 positionalMetricSample];
      uint64_t v8 = [v7 objectAtIndex:a4];
      uint64_t v9 = [v8 samples];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)samples:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_keyedMetrics objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 samples];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)counter:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_keyedMetrics objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)addToDurationForRateMetric:(double)a3 forKey:(id)a4
{
  id v5 = [(NSMutableDictionary *)self->_keyedMetrics objectForKey:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 addToDuration:a3];
  }
}

- (void)addToCounterForRateMetric:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = [(NSMutableDictionary *)self->_keyedMetrics objectForKey:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 addToCounter:v4];
  }
}

- (void)addSample:(id)a3 forKey:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)self->_keyedMetrics objectForKey:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 addSample:v15];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      keyedMetrics = self->_keyedMetrics;
      uint64_t v9 = NSNumber;
      [v7 floatValue];
      float v11 = v10;
      [v15 floatValue];
      *(float *)&double v13 = v11 + v12;
      uint64_t v14 = [v9 numberWithFloat:v13];
      [(NSMutableDictionary *)keyedMetrics setObject:v14 forKey:v6];
    }
  }
  self->_isEmpty = 0;
}

- (void)addSample:(id)a3 forKey:(id)a4 withPosition:(unint64_t)a5
{
  id v9 = a3;
  uint64_t v8 = [(NSMutableDictionary *)self->_keyedMetrics objectForKey:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 addSample:v9 withPosition:a5];
  }
  self->_isEmpty = 0;
}

- (BOOL)_isPublishable
{
  return self->_identifier && self->_version && self->_layout && self->_inputMode && self->_sessionIds != 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TISKSessionStats *)a3;
  id v5 = v4;
  if (self != v4)
  {
    startTime = self->_startTime;
    uint64_t v7 = [(TISKSessionStats *)v4 startTime];
    if ([(NSDate *)startTime isEqual:v7])
    {
      endTime = self->_endTime;
      id v9 = [(TISKSessionStats *)v5 endTime];
      if ([(NSDate *)endTime isEqual:v9])
      {
        layout = self->_layout;
        float v11 = [(TISKSessionStats *)v5 layout];
        if ([(TIKeyboardLayout *)layout isEqual:v11])
        {
          version = self->_version;
          double v13 = [(TISKSessionStats *)v5 version];
          if ([(NSString *)version isEqual:v13])
          {
            identifier = self->_identifier;
            id v15 = [(TISKSessionStats *)v5 identifier];
            if ([(NSString *)identifier isEqual:v15])
            {
              inputMode = self->_inputMode;
              BOOL v17 = [(TISKSessionStats *)v5 inputMode];
              if ([(NSString *)inputMode isEqual:v17])
              {
                sessionIds = self->_sessionIds;
                long long v19 = [(TISKSessionStats *)v5 sessionIds];
                LODWORD(sessionIds) = [(NSMutableArray *)sessionIds isEqual:v19];

                if (!sessionIds)
                {
                  char v21 = 0;
                  goto LABEL_18;
                }
                keyedMetrics = self->_keyedMetrics;
                uint64_t v7 = [(TISKSessionStats *)v5 keyedMetrics];
                char v21 = [(NSMutableDictionary *)keyedMetrics isEqual:v7];
                goto LABEL_17;
              }
            }
          }
        }
      }
    }
    char v21 = 0;
LABEL_17:

    goto LABEL_18;
  }
  char v21 = 1;
LABEL_18:

  return v21;
}

- (void)merge:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4 || ([v4 isEmpty] & 1) != 0) {
    goto LABEL_36;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v6 = [v5 keyedMetrics];
  uint64_t v7 = [v6 allKeys];

  uint64_t v38 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (!v38) {
    goto LABEL_30;
  }
  uint64_t v8 = *(void *)v40;
  uint64_t v37 = *(void *)v40;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v40 != v8) {
        objc_enumerationMutation(v7);
      }
      uint64_t v10 = *(void *)(*((void *)&v39 + 1) + 8 * v9);
      float v11 = [(NSMutableDictionary *)self->_keyedMetrics objectForKey:v10];
      float v12 = [v5 keyedMetrics];
      double v13 = [v12 objectForKey:v10];

      if (!v11)
      {
        [(NSMutableDictionary *)self->_keyedMetrics setObject:v13 forKey:v10];

        goto LABEL_36;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          keyedMetrics = self->_keyedMetrics;
          id v15 = v7;
          v16 = NSNumber;
          [v11 floatValue];
          float v18 = v17;
          [v13 floatValue];
          long long v20 = [v16 numberWithInteger:(uint64_t)(float)(v18 + v19)];
          [(NSMutableDictionary *)keyedMetrics setObject:v20 forKey:v10];

          uint64_t v7 = v15;
          uint64_t v8 = v37;
          goto LABEL_25;
        }
        char v21 = IXADefaultLogFacility();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          goto LABEL_17;
        }
LABEL_28:
        v35 = NSString;
        id v36 = v7;
        uint64_t v22 = objc_opt_class();
        objc_super v23 = [v35 stringWithFormat:@"%s [SensorKit] otherObject has different class: %@ than ownObject: %@ for key: %@", "-[TISKSessionStats merge:]", v22, objc_opt_class(), v10];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v44 = v23;
        _os_log_error_impl(&dword_1E3F0E000, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        uint64_t v7 = v36;
LABEL_17:

        goto LABEL_25;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          char v21 = IXADefaultLogFacility();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            goto LABEL_28;
          }
          goto LABEL_17;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            char v21 = IXADefaultLogFacility();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              goto LABEL_28;
            }
            goto LABEL_17;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_25;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            char v21 = IXADefaultLogFacility();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              goto LABEL_28;
            }
            goto LABEL_17;
          }
        }
      }
      [v11 merge:v13];
LABEL_25:

      ++v9;
    }
    while (v38 != v9);
    uint64_t v24 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
    uint64_t v38 = v24;
  }
  while (v24);
LABEL_30:

  uint64_t v25 = [v5 startTime];
  uint64_t v26 = [v25 compare:self->_startTime];

  if (v26 == -1)
  {
    v27 = [v5 startTime];
    startTime = self->_startTime;
    self->_startTime = v27;
  }
  v29 = [v5 endTime];
  uint64_t v30 = [v29 compare:self->_endTime];

  if (v30 == 1)
  {
    v31 = [v5 endTime];
    endTime = self->_endTime;
    self->_endTime = v31;
  }
  sessionIds = self->_sessionIds;
  v34 = [v5 sessionIds];
  [(NSMutableArray *)sessionIds addObjectsFromArray:v34];

  self->_isEmpty = 0;
LABEL_36:
}

- (void)setup
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = +[TISKMetricDefinition metricDefinitions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = v6;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        id v6 = *(id *)(*((void *)&v15 + 1) + 8 * v8);

        switch([v6 metricType])
        {
          case 0u:
            keyedMetrics = self->_keyedMetrics;
            uint64_t v11 = [NSNumber numberWithFloat:0.0];
            goto LABEL_12;
          case 1u:
            keyedMetrics = self->_keyedMetrics;
            float v12 = TISKSingleMetricSample;
            goto LABEL_10;
          case 2u:
            keyedMetrics = self->_keyedMetrics;
            float v12 = TISKRateMetricSample;
LABEL_10:
            uint64_t v11 = [(__objc2_class *)v12 makeMetric];
            goto LABEL_12;
          case 3u:
            keyedMetrics = self->_keyedMetrics;
            uint64_t v11 = +[TISKPositionalMetricSample makeMetric:](TISKPositionalMetricSample, "makeMetric:", [v6 positionalSize]);
LABEL_12:
            double v13 = (void *)v11;
            uint64_t v14 = [v6 metricName];
            [(NSMutableDictionary *)keyedMetrics setObject:v13 forKey:v14];

            break;
          default:
            break;
        }
        ++v8;
        uint64_t v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

- (BOOL)isTypingTimerHalted
{
  return self->_startTimerEvent == 0;
}

- (void)haltTypingTimer
{
  self->_startTimerEvent = 0;
  MEMORY[0x1F41817F8]();
}

- (void)haltTypingTimerWithEvent:(id)a3
{
  if (self->_startTimerEvent)
  {
    [a3 touchUpTimestamp];
    double v5 = v4;
    [(TISKEvent *)self->_startTimerEvent touchDownTimestamp];
    double v7 = v5 - v6;
    if (v7 > 0.0)
    {
      uint64_t v8 = [NSNumber numberWithDouble:v7];
      [(TISKSessionStats *)self addSample:v8 forKey:kTISKTotalSessionTypingDuration];

      [(TISKSessionStats *)self addToDurationForRateMetric:kTISKTapTypingSpeed forKey:v7];
    }
    startTimerEvent = self->_startTimerEvent;
    self->_startTimerEvent = 0;
  }
}

- (void)startTypingTimerWithEvent:(id)a3
{
}

- (id)init:(id)a3 endDate:(id)a4 identifier:(id)a5 version:(id)a6 inputMode:(id)a7 sessionIds:(id)a8 layout:(id)a9
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v30.receiver = self;
  v30.super_class = (Class)TISKSessionStats;
  float v19 = [(TISKSessionStats *)&v30 init];
  if (v19)
  {
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v26, v27, v28, v29);
    keyedMetrics = v19->_keyedMetrics;
    v19->_keyedMetrics = (NSMutableDictionary *)v20;

    objc_storeStrong((id *)&v19->_startTime, a3);
    objc_storeStrong((id *)&v19->_endTime, a4);
    startTimerEvent = v19->_startTimerEvent;
    v19->_startTimerEvent = 0;

    objc_storeStrong((id *)&v19->_identifier, a5);
    objc_storeStrong((id *)&v19->_version, a6);
    objc_storeStrong((id *)&v19->_inputMode, a7);
    uint64_t v23 = [v17 mutableCopy];
    sessionIds = v19->_sessionIds;
    v19->_sessionIds = (NSMutableArray *)v23;

    objc_storeStrong((id *)&v19->_layout, a9);
    v19->_isEmpty = 1;
    [(TISKSessionStats *)v19 setup];
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end