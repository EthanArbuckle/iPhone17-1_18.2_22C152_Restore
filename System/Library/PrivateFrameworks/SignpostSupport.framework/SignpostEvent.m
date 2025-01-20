@interface SignpostEvent
+ (id)_generatedEventArrayForEvent:(id)a3;
+ (id)_generatedEventFromMetadata:(id)a3 generatorEvent:(id)a4;
+ (id)_nameStringFromFormatPrefix:(id)a3;
+ (id)serializationTypeNumber;
- (BOOL)_hasTotalSkyLightCompositeCount;
- (BOOL)_overridesOwnTime;
- (BOOL)isAnimationStart;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGenerator;
- (BOOL)isSyntheticIntervalEvent;
- (BOOL)overridesBeginTime;
- (BOOL)overridesEmitTime;
- (BOOL)overridesEndTime;
- (BOOL)overridesTime;
- (NSArray)metadataSegments;
- (NSArray)stackFrames;
- (NSString)_key;
- (NSString)debugDescription;
- (NSString)metadata;
- (NSString)processImagePath;
- (NSString)processName;
- (NSString)senderImagePath;
- (NSUUID)processImageUUID;
- (NSUUID)senderImageUUID;
- (SignpostEvent)initWithDictionary:(id)a3;
- (SignpostEvent)initWithName:(id)a3 beginMct:(unint64_t)a4 endMct:(unint64_t)a5 emitMct:(unint64_t)a6 signpostId:(unint64_t)a7 generatorEvent:(id)a8;
- (SignpostEvent)initWithSubsystem:(id)a3 category:(id)a4 timebaseRatio:(double)a5 unixDate:(timeval *)a6 unixTimeZone:(timezone *)a7 stackFrames:(id)a8;
- (SignpostMetrics)metrics;
- (float)durationSeconds;
- (id)_argumentObjectWithName:(id)a3;
- (id)_argumentObjectWithName:(id)a3 expectedClass:(Class)a4;
- (id)_dataArgumentWithName:(id)a3;
- (id)_debugDescription:(BOOL)a3;
- (id)_descriptionStringForColumn:(unint64_t)a3 timeFormat:(unint64_t)a4 asBegin:(BOOL)a5;
- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4;
- (id)_nameStringFromSegment:(id)a3;
- (id)_numberArgumentWithName:(id)a3;
- (id)_stringArgumentWithName:(id)a3;
- (id)humanReadableType;
- (id)metadataSegmentsWithPlaceholderToken:(id)a3;
- (id)metadataSegmentsWithPlaceholderTokenKey:(id)a3 value:(id)a4;
- (id)placeholderTokenValueDictForTokenKey:(id)a3;
- (int)processID;
- (int)tv_usec;
- (int)tz_dsttime;
- (int)tz_minuteswest;
- (int64_t)tv_sec;
- (unint64_t)_machContinuousTimestamp;
- (unint64_t)_resolvedBeginTime;
- (unint64_t)_resolvedEndTime;
- (unint64_t)_resolvedEventType;
- (unint64_t)_totalSkyLightCompositeCount;
- (unint64_t)animationType;
- (unint64_t)durationMachContinuousTime;
- (unint64_t)eventType;
- (unint64_t)overridingBeginMachContinuousTime;
- (unint64_t)overridingBeginNanoseconds;
- (unint64_t)overridingEmitMachContinuousTime;
- (unint64_t)overridingEmitNanoseconds;
- (unint64_t)overridingEndMachContinuousTime;
- (unint64_t)overridingEndNanoseconds;
- (unint64_t)processUniqueID;
- (unint64_t)threadID;
- (unint64_t)timeRecordedNanoseconds;
- (void)_adjustBeginTimeVal:(timeval *)a3;
- (void)_adjustEndTimeVal:(timeval *)a3;
- (void)_adjustTimeStruct:(timeval *)a3 asBegin:(BOOL)a4;
- (void)_populateMetrics;
- (void)setAnimationType:(unint64_t)a3;
- (void)setAnimationTypeFromRawMetadata:(id)a3;
- (void)setEventType:(unint64_t)a3;
- (void)setIsAnimationStart:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataSegments:(id)a3;
- (void)setOverridingBeginMachContinuousTime:(unint64_t)a3;
- (void)setOverridingEmitMachContinuousTime:(unint64_t)a3;
- (void)setOverridingEndMachContinuousTime:(unint64_t)a3;
- (void)setProcessID:(int)a3;
- (void)setProcessImagePath:(id)a3;
- (void)setProcessImageUUID:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setProcessUniqueID:(unint64_t)a3;
- (void)setSenderImagePath:(id)a3;
- (void)setSenderImageUUID:(id)a3;
- (void)setStackFrames:(id)a3;
- (void)setThreadID:(unint64_t)a3;
- (void)setTv_sec:(int64_t)a3;
- (void)setTv_usec:(int)a3;
- (void)setTz_dsttime:(int)a3;
- (void)setTz_minuteswest:(int)a3;
- (void)set_hasTotalSkyLightCompositeCount:(BOOL)a3;
- (void)set_machContinuousTimestamp:(unint64_t)a3;
- (void)set_totalSkyLightCompositeCount:(unint64_t)a3;
@end

@implementation SignpostEvent

- (NSString)metadata
{
  return self->_metadata;
}

- (void)set_machContinuousTimestamp:(unint64_t)a3
{
  self->__machContinuousTimestamp = a3;
}

- (void)setThreadID:(unint64_t)a3
{
  self->_threadID = a3;
}

- (void)setProcessUniqueID:(unint64_t)a3
{
  self->_processUniqueID = a3;
}

- (void)setProcessID:(int)a3
{
  self->_processID = a3;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (id)_numberArgumentWithName:(id)a3
{
  id v4 = a3;
  v5 = [(SignpostEvent *)self _argumentObjectWithName:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (id)_argumentObjectWithName:(id)a3 expectedClass:(Class)a4
{
  id v4 = [(SignpostEvent *)self _argumentObjectWithName:a3];
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)_argumentObjectWithName:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithFormat:@"name=%@", a3];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = [(SignpostEvent *)self metadataSegments];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        v11 = [v10 placeholderTokens];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v20;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              if ([*(id *)(*((void *)&v19 + 1) + 8 * j) isEqualToString:v4])
              {
                v17 = [v10 argument];
                v16 = [v17 argumentObject];

                goto LABEL_19;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      v16 = 0;
    }
    while (v7);
  }
  else
  {
    v16 = 0;
  }
LABEL_19:

  return v16;
}

- (NSArray)metadataSegments
{
  return self->_metadataSegments;
}

- (BOOL)isAnimationStart
{
  return self->_isAnimationStart;
}

- (int)processID
{
  return self->_processID;
}

- (unint64_t)_machContinuousTimestamp
{
  return self->__machContinuousTimestamp;
}

- (unint64_t)_resolvedEndTime
{
  unint64_t result = [(SignpostEvent *)self _resolvedEventType];
  if (result - 2 < 2)
  {
    unint64_t result = [(SignpostEvent *)self overridingEndMachContinuousTime];
    if (result) {
      return result;
    }
  }
  else if (result == 1)
  {
    unint64_t result = [(SignpostEvent *)self overridingBeginMachContinuousTime];
    if (result) {
      return result;
    }
  }
  else
  {
    if (result != 4) {
      return result;
    }
    unint64_t result = [(SignpostEvent *)self overridingEmitMachContinuousTime];
    if (result) {
      return result;
    }
  }

  return [(SignpostEvent *)self _machContinuousTimestamp];
}

- (BOOL)overridesEndTime
{
  return [(SignpostEvent *)self overridingEndMachContinuousTime] != 0;
}

- (unint64_t)overridingEndMachContinuousTime
{
  return self->_overridingEndMachContinuousTime;
}

- (unint64_t)_resolvedBeginTime
{
  unint64_t result = [(SignpostEvent *)self _resolvedEventType];
  switch(result)
  {
    case 1uLL:
    case 3uLL:
      unint64_t result = [(SignpostEvent *)self overridingBeginMachContinuousTime];
      if (!result) {
        goto LABEL_7;
      }
      break;
    case 2uLL:
      unint64_t result = [(SignpostEvent *)self overridingEndMachContinuousTime];
      if (!result) {
        goto LABEL_7;
      }
      break;
    case 4uLL:
      unint64_t result = [(SignpostEvent *)self overridingEmitMachContinuousTime];
      if (!result)
      {
LABEL_7:
        unint64_t result = [(SignpostEvent *)self _machContinuousTimestamp];
      }
      break;
    default:
      return result;
  }
  return result;
}

- (unint64_t)_resolvedEventType
{
  if ([(SignpostEvent *)self isSyntheticIntervalEvent]) {
    return 3;
  }
  unint64_t v4 = [(SignpostEvent *)self eventType];
  unint64_t v5 = 1;
  if (v4 == 1) {
    unint64_t v5 = 2;
  }
  if (v4 == 2) {
    return 4;
  }
  else {
    return v5;
  }
}

- (BOOL)isSyntheticIntervalEvent
{
  if ([(SignpostEvent *)self eventType] != 2) {
    return 0;
  }
  if ([(SignpostEvent *)self overridesBeginTime]) {
    return 1;
  }

  return [(SignpostEvent *)self overridesEndTime];
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (BOOL)overridesBeginTime
{
  return [(SignpostEvent *)self overridingBeginMachContinuousTime] != 0;
}

- (unint64_t)overridingBeginMachContinuousTime
{
  return self->_overridingBeginMachContinuousTime;
}

- (NSString)_key
{
  v3 = NSString;
  unint64_t v4 = [(SignpostSupportObject *)self subsystem];
  unint64_t v5 = [(SignpostSupportObject *)self category];
  uint64_t v6 = [(SignpostObject *)self name];
  uint64_t v7 = [v3 stringWithFormat:@"%@__%@__%@__%#llx", v4, v5, v6, -[SignpostObject signpostId](self, "signpostId")];

  return (NSString *)v7;
}

- (SignpostEvent)initWithSubsystem:(id)a3 category:(id)a4 timebaseRatio:(double)a5 unixDate:(timeval *)a6 unixTimeZone:(timezone *)a7 stackFrames:(id)a8
{
  id v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)SignpostEvent;
  v16 = [(SignpostSupportObject *)&v19 initWithSubsystem:a3 category:a4 timebaseRatio:a5];
  v17 = v16;
  if (v16)
  {
    if (a6)
    {
      v16->_tv_sec = a6->tv_sec;
      v16->_tv_usec = a6->tv_usec;
    }
    if (a7)
    {
      v16->_tz_minuteswest = a7->tz_minuteswest;
      v16->_tz_dsttime = a7->tz_dsttime;
    }
    objc_storeStrong((id *)&v16->_stackFrames, a8);
  }

  return v17;
}

- (id)_stringArgumentWithName:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SignpostEvent *)self _argumentObjectWithName:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (void)setMetadataSegments:(id)a3
{
}

- (void)setProcessImageUUID:(id)a3
{
}

- (void)setProcessImagePath:(id)a3
{
}

- (void)setSenderImageUUID:(id)a3
{
}

- (void)setSenderImagePath:(id)a3
{
}

- (void)setProcessName:(id)a3
{
}

- (void)setMetadata:(id)a3
{
}

- (void)setOverridingBeginMachContinuousTime:(unint64_t)a3
{
  self->_overridingBeginMachContinuousTime = a3;
}

- (BOOL)isGenerator
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(SignpostEvent *)self metadataSegments];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    unint64_t v5 = [(SignpostEvent *)self metadataSegments];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isGenerator])
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)_populateMetrics
{
  self->_metrics = (SignpostMetrics *)+[SignpostMetrics newMetricsForSignpostEvent:self];

  MEMORY[0x1F41817F8]();
}

- (BOOL)_overridesOwnTime
{
  unint64_t v3 = [(SignpostEvent *)self _resolvedEventType];
  switch(v3)
  {
    case 4uLL:
      return [(SignpostEvent *)self overridesEmitTime];
    case 2uLL:
      return [(SignpostEvent *)self overridesEndTime];
    case 1uLL:
      return [(SignpostEvent *)self overridesBeginTime];
    default:
      return 1;
  }
}

- (BOOL)overridesEmitTime
{
  return [(SignpostEvent *)self overridingEmitMachContinuousTime] != 0;
}

- (unint64_t)overridingEmitMachContinuousTime
{
  return self->_overridingEmitMachContinuousTime;
}

- (void)setOverridingEndMachContinuousTime:(unint64_t)a3
{
  self->_overridingEndMachContinuousTime = a3;
}

- (void)setAnimationTypeFromRawMetadata:(id)a3
{
  id v5 = a3;
  if (strstr((char *)[v5 UTF8String], "animation_type=1")) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2 * (strstr((char *)[v5 UTF8String], "animation_type=2") != 0);
  }
  [(SignpostEvent *)self setAnimationType:v4];
}

- (void)setAnimationType:(unint64_t)a3
{
  self->_animationType = a3;
}

- (id)_nameStringFromSegment:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 stringPrefix];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v3 stringPrefix];
    uint64_t v8 = [v6 _nameStringFromFormatPrefix:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)_nameStringFromFormatPrefix:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  id v5 = v3;
  uint64_t v6 = [v5 UTF8String];
  uint64_t v7 = (char *)(v6 + v4 - 1);
  if (*v7 != 61) {
    goto LABEL_19;
  }
  uint64_t v8 = MEMORY[0x1E4F14390];
  if (v4 == 1)
  {
    unsigned int v11 = 61;
    v9 = v7;
    goto LABEL_13;
  }
  v9 = (char *)v6;
  for (char i = 61; (i & 0x80) == 0; char i = v9[v4-- - 2])
  {
    if ((*(_DWORD *)(v8 + 4 * i + 60) & 0x4000) != 0) {
      goto LABEL_11;
    }
LABEL_8:
    if (v4 == 2) {
      goto LABEL_12;
    }
  }
  if (!__maskrune(i, 0x4000uLL)) {
    goto LABEL_8;
  }
LABEL_11:
  v9 = &v9[v4 - 1];
LABEL_12:
  unsigned int v11 = *v9;
  if ((v11 & 0x80000000) != 0) {
    int v12 = __maskrune(v11, 0x4000uLL);
  }
  else {
LABEL_13:
  }
    int v12 = *(_DWORD *)(v8 + 4 * v11 + 60) & 0x4000;
  if (v12) {
    ++v9;
  }
  if (v7 != v9)
  {
    long long v13 = (void *)[[NSString alloc] initWithBytes:v9 length:v7 - v9 encoding:4];
    goto LABEL_20;
  }
LABEL_19:
  long long v13 = 0;
LABEL_20:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_stackFrames, 0);
  objc_storeStrong((id *)&self->_metadataSegments, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_senderImagePath, 0);
  objc_storeStrong((id *)&self->_senderImageUUID, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_processImagePath, 0);

  objc_storeStrong((id *)&self->_processImageUUID, 0);
}

- (unint64_t)durationMachContinuousTime
{
  return 0;
}

- (void)set_totalSkyLightCompositeCount:(unint64_t)a3
{
  self->__totalSkyLightCompositeCount = a3;
}

- (void)set_hasTotalSkyLightCompositeCount:(BOOL)a3
{
  self->__hasTotalSkyLightCompositeCount = a3;
}

- (unint64_t)_totalSkyLightCompositeCount
{
  return self->__totalSkyLightCompositeCount;
}

- (BOOL)_hasTotalSkyLightCompositeCount
{
  return self->__hasTotalSkyLightCompositeCount;
}

- (unint64_t)animationType
{
  return self->_animationType;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)processImagePath
{
  return self->_processImagePath;
}

- (void)setIsAnimationStart:(BOOL)a3
{
  self->_isAnimationStart = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SignpostEvent;
  if ([(SignpostObject *)&v26 isEqual:v5])
  {
    id v6 = v5;
    unint64_t v7 = [(SignpostEvent *)self eventType];
    if (v7 != [v6 eventType] || !_archiveEventsAreEqual(self, v6)) {
      goto LABEL_22;
    }
    id v8 = [(SignpostEvent *)self metadata];
    if (v8)
    {
      id v3 = [v6 metadata];
      if (!v3)
      {
        char v9 = 0;
LABEL_36:

        goto LABEL_23;
      }
    }
    long long v10 = [(SignpostEvent *)self metadata];
    if (v10)
    {

      if (v8)
      {
      }
    }
    else
    {
      unsigned int v11 = [v6 metadata];

      if (v8)
      {
      }
      if (v11) {
        goto LABEL_22;
      }
    }
    int v12 = [(SignpostEvent *)self metadata];

    if (v12)
    {
      long long v13 = [(SignpostEvent *)self metadata];
      uint64_t v14 = [v6 metadata];
      int v15 = [v13 isEqual:v14];

      if (!v15)
      {
LABEL_22:
        char v9 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    v16 = [(SignpostEvent *)self metadataSegments];
    v17 = [v6 metadataSegments];
    id v18 = v16;
    id v19 = v17;
    long long v20 = v19;
    if (v18)
    {
      if (v18 == v19)
      {

LABEL_26:
        long long v23 = [(SignpostEvent *)self stackFrames];
        long long v24 = [v6 stackFrames];
        id v8 = v23;
        id v25 = v24;
        id v18 = v25;
        if (v8)
        {
          if (v8 == v25)
          {
            char v9 = 1;
          }
          else if (v25)
          {
            char v9 = [v8 isEqualToArray:v25];
          }
          else
          {
            char v9 = 0;
          }
        }
        else
        {
          char v9 = v25 == 0;
        }

        goto LABEL_35;
      }
      if (!v19)
      {
        char v9 = 0;
        id v8 = v18;
LABEL_35:

        goto LABEL_36;
      }
      char v21 = [v18 isEqualToArray:v19];
    }
    else
    {
      char v21 = v19 == 0;
    }

    if ((v21 & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_26;
  }
  char v9 = 0;
LABEL_24:

  return v9;
}

+ (id)serializationTypeNumber
{
  if (serializationTypeNumber_onceToken != -1) {
    dispatch_once(&serializationTypeNumber_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)serializationTypeNumber_serializationTypeNumber;

  return v2;
}

void __55__SignpostEvent_Serialization__serializationTypeNumber__block_invoke()
{
  v0 = (void *)serializationTypeNumber_serializationTypeNumber;
  serializationTypeNumber_serializationTypeNumber = (uint64_t)&unk_1EF81E7A8;
}

- (id)humanReadableType
{
  unint64_t v2 = [(SignpostEvent *)self eventType];
  id v3 = @"SignpostEvent_Standalone";
  if (!v2) {
    id v3 = @"SignpostEvent_IntervalBegin";
  }
  if (v2 == 1) {
    return @"SignpostEvent_IntervalEnd";
  }
  else {
    return v3;
  }
}

- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v58.receiver = self;
  v58.super_class = (Class)SignpostEvent;
  unint64_t v7 = -[SignpostObject _dictionaryRepresentationWithIsHumanReadable:shouldRedact:](&v58, sel__dictionaryRepresentationWithIsHumanReadable_shouldRedact_);
  _addArchiveEventFieldsInDictionaryWithArchiveEvent(v7, self, v5);
  id v8 = [(SignpostEvent *)self metadata];

  if (v8)
  {
    char v9 = [(SignpostEvent *)self metadata];
    if (v5) {
      long long v10 = @"MetadataString";
    }
    else {
      long long v10 = @"Meta";
    }
    [v7 setObject:v9 forKeyedSubscript:v10];
  }
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SignpostEvent eventType](self, "eventType"));
  if (v5) {
    int v12 = @"EventType";
  }
  else {
    int v12 = @"EType";
  }
  if (v5) {
    long long v13 = @"IsAnimation";
  }
  else {
    long long v13 = @"IsAni";
  }
  [v7 setObject:v11 forKeyedSubscript:v12];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[SignpostEvent isAnimationStart](self, "isAnimationStart"));
  [v7 setObject:v14 forKeyedSubscript:v13];

  if ([(SignpostEvent *)self overridesBeginTime])
  {
    int v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SignpostEvent overridingBeginMachContinuousTime](self, "overridingBeginMachContinuousTime"));
    if (v5) {
      v16 = @"OverridingBeginMCTimestamp";
    }
    else {
      v16 = @"OBegin";
    }
    [v7 setObject:v15 forKeyedSubscript:v16];
  }
  if ([(SignpostEvent *)self overridesEndTime])
  {
    v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SignpostEvent overridingEndMachContinuousTime](self, "overridingEndMachContinuousTime"));
    if (v5) {
      id v18 = @"OverridingEndMCTimestamp";
    }
    else {
      id v18 = @"OEnd";
    }
    [v7 setObject:v17 forKeyedSubscript:v18];
  }
  if ([(SignpostEvent *)self overridesEmitTime])
  {
    id v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SignpostEvent overridingEmitMachContinuousTime](self, "overridingEmitMachContinuousTime"));
    if (v5) {
      long long v20 = @"OverridingEmitMCTimestamp";
    }
    else {
      long long v20 = @"OEmit";
    }
    [v7 setObject:v19 forKeyedSubscript:v20];
  }
  char v21 = [(SignpostEvent *)self metadataSegments];

  unint64_t v22 = 0x1E4F1C000uLL;
  if (v21)
  {
    long long v23 = [MEMORY[0x1E4F1CA48] array];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v24 = [(SignpostEvent *)self metadataSegments];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v54 objects:v60 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      v48 = v7;
      BOOL v27 = 0;
      uint64_t v28 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v55 != v28) {
            objc_enumerationMutation(v24);
          }
          v30 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          char v53 = 0;
          v31 = [v30 _dictionaryRepresentationWithIsHumanReadable:v5 shouldRedact:v4 didRedactOut:&v53];
          [(__CFString *)v23 addObject:v31];

          unsigned __int8 v32 = v53 | v27;
          BOOL v27 = v32 != 0;
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v54 objects:v60 count:16];
      }
      while (v26);
      int v33 = v32;

      unint64_t v7 = v48;
      [v48 setObject:v23 forKeyedSubscript:@"Placeholders"];
      unint64_t v22 = 0x1E4F1C000;
      if (!v33) {
        goto LABEL_43;
      }
      v34 = [(SignpostEvent *)self metadata];

      if (!v34) {
        goto LABEL_43;
      }
      if (v5) {
        v35 = @"MetadataString";
      }
      else {
        v35 = @"Meta";
      }
      v36 = @"<redacted>";
      v37 = v48;
    }
    else
    {

      v35 = @"Placeholders";
      v37 = v7;
      v36 = v23;
    }
    [v37 setObject:v36 forKeyedSubscript:v35];
LABEL_43:
  }
  v38 = [(SignpostEvent *)self stackFrames];

  if (v38)
  {
    v39 = [*(id *)(v22 + 2632) array];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v40 = [(SignpostEvent *)self stackFrames];
    uint64_t v41 = [v40 countByEnumeratingWithState:&v49 objects:v59 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v50 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = [*(id *)(*((void *)&v49 + 1) + 8 * j) _serializableArrayRepresentation];
          [v39 addObject:v45];
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v49 objects:v59 count:16];
      }
      while (v42);
    }

    if (v5) {
      v46 = @"StackFrames";
    }
    else {
      v46 = @"Stack";
    }
    [v7 setObject:v39 forKeyedSubscript:v46];
  }

  return v7;
}

- (SignpostEvent)initWithDictionary:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_35;
  }
  v48.receiver = self;
  v48.super_class = (Class)SignpostEvent;
  BOOL v5 = [(SignpostObject *)&v48 initWithDictionary:v4];
  self = v5;
  if (!v5)
  {
LABEL_33:
    self = self;
    unint64_t v7 = self;
    goto LABEL_36;
  }
  if (!_initArchiveEventFieldsWithSerializedObjectDictionary(v5, v4))
  {
LABEL_35:
    unint64_t v7 = 0;
    goto LABEL_36;
  }
  id v6 = [v4 objectForKeyedSubscript:@"EType"];
  unint64_t v7 = v6;
  if (v6)
  {
    [(SignpostEvent *)self setEventType:[(SignpostEvent *)v6 unsignedIntegerValue]];
    id v8 = [v4 objectForKeyedSubscript:@"IsAni"];
    if (v8)
    {
      v38 = v8;
      -[SignpostEvent setIsAnimationStart:](self, "setIsAnimationStart:", [v8 BOOLValue]);
      char v9 = [v4 objectForKeyedSubscript:@"Meta"];
      [(SignpostEvent *)self setMetadata:v9];

      if ([(SignpostEvent *)self isAnimationStart])
      {
        long long v10 = [(SignpostEvent *)self metadata];
        [(SignpostEvent *)self setAnimationTypeFromRawMetadata:v10];
      }
      unsigned int v11 = [v4 objectForKeyedSubscript:@"OBegin"];
      int v12 = v11;
      if (v11) {
        -[SignpostEvent setOverridingBeginMachContinuousTime:](self, "setOverridingBeginMachContinuousTime:", [v11 unsignedLongLongValue]);
      }
      long long v13 = [v4 objectForKeyedSubscript:@"OEnd"];
      uint64_t v14 = v13;
      if (v13) {
        -[SignpostEvent setOverridingEndMachContinuousTime:](self, "setOverridingEndMachContinuousTime:", [v13 unsignedLongLongValue]);
      }
      v36 = v14;
      v37 = v12;
      int v15 = [v4 objectForKeyedSubscript:@"OEmit"];
      v16 = v15;
      if (v15) {
        -[SignpostEvent setOverridingEmitMachContinuousTime:](self, "setOverridingEmitMachContinuousTime:", [v15 unsignedLongLongValue]);
      }
      v35 = v16;
      v17 = [v4 objectForKeyedSubscript:@"Placeholders"];
      v39 = v17;
      if (v17)
      {
        id v18 = [MEMORY[0x1E4F1CA48] array];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v19 = v17;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v50 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v45 != v22) {
                objc_enumerationMutation(v19);
              }
              long long v24 = [[SignpostSupportMetadataSegment alloc] initWithDictionary:*(void *)(*((void *)&v44 + 1) + 8 * i)];
              [v18 addObject:v24];
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v50 count:16];
          }
          while (v21);
        }

        [(SignpostEvent *)self setMetadataSegments:v18];
        [(SignpostEvent *)self _populateMetrics];
      }
      uint64_t v25 = [v4 objectForKeyedSubscript:@"Stack"];
      if (v25)
      {
        v34 = v7;
        uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v27 = v25;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v41;
          do
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v41 != v30) {
                objc_enumerationMutation(v27);
              }
              unsigned __int8 v32 = [[SignpostStackFrame alloc] initWithArrayRepresentation:*(void *)(*((void *)&v40 + 1) + 8 * j)];
              [v26 addObject:v32];
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v40 objects:v49 count:16];
          }
          while (v29);
        }

        [(SignpostEvent *)self setStackFrames:v26];
        unint64_t v7 = v34;
        v17 = v39;
      }

      goto LABEL_33;
    }

    goto LABEL_35;
  }
LABEL_36:

  return v7;
}

- (id)_descriptionStringForColumn:(unint64_t)a3 timeFormat:(unint64_t)a4 asBegin:(BOOL)a5
{
  v15.receiver = self;
  v15.super_class = (Class)SignpostEvent;
  unint64_t v7 = [(SignpostObject *)&v15 _descriptionStringForColumn:a3 timeFormat:a4 asBegin:a5];
  id v8 = v7;
  if (v7)
  {
    char v9 = v7;
LABEL_3:
    long long v10 = v9;
    goto LABEL_4;
  }
  long long v10 = 0;
  if ((uint64_t)a3 > 9)
  {
    if (a3 == 10)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%#llx", -[SignpostEvent threadID](self, "threadID"));
      char v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
    if (a3 == 18)
    {
      char v9 = [(SignpostEvent *)self metadata];
      goto LABEL_3;
    }
  }
  else if (a3 == 5)
  {
    unint64_t v14 = [(SignpostEvent *)self _resolvedEventType];
    if (v14 - 1 > 3) {
      long long v10 = @"UNKNOWN";
    }
    else {
      long long v10 = off_1E5B40770[v14 - 1];
    }
  }
  else if (a3 == 9)
  {
    int v12 = NSString;
    long long v13 = [(SignpostEvent *)self processName];
    long long v10 = [v12 stringWithFormat:@"%@[%d]", v13, -[SignpostEvent processID](self, "processID")];
  }
LABEL_4:

  return v10;
}

- (id)_debugDescription:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(SignpostObject *)self attributes];

  unint64_t v6 = 0x1E4F29000uLL;
  if (v5)
  {
    unint64_t v7 = NSString;
    id v8 = [(SignpostObject *)self attributes];
    char v9 = [v8 debugDescription];
    v70 = [v7 stringWithFormat:@"Attributes:\n%@\n", v9];
  }
  else
  {
    v70 = &stru_1EF807BF0;
  }
  long long v10 = [(SignpostEvent *)self metadata];

  if (v10)
  {
    unsigned int v11 = NSString;
    int v12 = [(SignpostEvent *)self metadata];
    v69 = [v11 stringWithFormat:@"\nMetadata:\n%@\n", v12];
  }
  else
  {
    v69 = &stru_1EF807BF0;
  }
  long long v13 = [(SignpostEvent *)self metrics];

  if (v13)
  {
    unint64_t v14 = NSString;
    objc_super v15 = [(SignpostEvent *)self metrics];
    v16 = [v15 description];
    v68 = [v14 stringWithFormat:@"\nPerformance Metrics:\n%@\n", v16];
  }
  else
  {
    v68 = &stru_1EF807BF0;
  }
  v17 = (void *)MEMORY[0x1E4F28E78];
  BOOL v18 = [(SignpostObject *)self telemetryEnabled];
  id v19 = @"Disabled";
  if (v18) {
    id v19 = @"Enabled";
  }
  uint64_t v20 = [v17 stringWithFormat:@"Telemetry:%@\n", v19];
  uint64_t v21 = [(SignpostObject *)self string1Name];

  if (v21)
  {
    uint64_t v22 = [(SignpostObject *)self string1Name];
    long long v23 = [(SignpostObject *)self string1Value];
    [v20 appendFormat:@"String1: %@ -> %@\n", v22, v23];
  }
  long long v24 = [(SignpostObject *)self string2Name];

  if (v24)
  {
    uint64_t v25 = [(SignpostObject *)self string2Name];
    uint64_t v26 = [(SignpostObject *)self string2Value];
    [v20 appendFormat:@"String2: %@ -> %@\n", v25, v26];
  }
  id v27 = [(SignpostObject *)self number1Name];

  if (v27)
  {
    uint64_t v28 = [(SignpostObject *)self number1Name];
    uint64_t v29 = [(SignpostObject *)self number1Value];
    [v20 appendFormat:@"Number1: %@ -> %@\n", v28, v29];
  }
  uint64_t v30 = [(SignpostObject *)self number2Name];

  if (v30)
  {
    v31 = [(SignpostObject *)self number2Name];
    unsigned __int8 v32 = [(SignpostObject *)self number2Value];
    [v20 appendFormat:@"Number2: %@ -> %@\n", v31, v32];
  }
  if ([(SignpostEvent *)self _overridesOwnTime])
  {
    objc_msgSend(NSString, "stringWithFormat:", @" (Overrides %llu)", -[SignpostEvent timeRecordedMachContinuousTime](self, "timeRecordedMachContinuousTime"));
    v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v66 = &stru_1EF807BF0;
  }
  if ([(SignpostObject *)self signpostId] == 0xEEEEB0B5B2B2EEEELL
    || [(SignpostObject *)self signpostId] == 0xCABA71571CC0FFEELL)
  {
    v65 = @"OS_SIGNPOST_ID_EXCLUSIVE";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%#llx", -[SignpostObject signpostId](self, "signpostId"));
    v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v67 = v20;
  int v33 = [(SignpostEvent *)self stackFrames];

  if (v33)
  {
    v34 = (void *)MEMORY[0x1E4F28E78];
    v35 = [(SignpostEvent *)self stackFrames];
    objc_msgSend(v34, "stringWithFormat:", @"Stack Frames (%lu frames):\n", objc_msgSend(v35, "count"));
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v37 = [(SignpostEvent *)self stackFrames];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v71 objects:v75 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v72 != v40) {
            objc_enumerationMutation(v37);
          }
          long long v42 = [*(id *)(*((void *)&v71 + 1) + 8 * i) debugDescription];
          [(__CFString *)v36 appendFormat:@"%@\n", v42];
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v71 objects:v75 count:16];
      }
      while (v39);
    }

    unint64_t v6 = 0x1E4F29000;
  }
  else
  {
    v36 = &stru_1EF807BF0;
  }
  id v63 = *(id *)(v6 + 24);
  if (v3) {
    unint64_t v43 = [(SignpostEvent *)self startMachContinuousTime];
  }
  else {
    unint64_t v43 = [(SignpostEvent *)self endMachContinuousTime];
  }
  unint64_t v62 = v43;
  [(SignpostSupportObject *)self timebaseRatio];
  uint64_t v45 = v44;
  int64_t v60 = [(SignpostEvent *)self tv_sec];
  uint64_t v59 = [(SignpostEvent *)self tv_usec];
  uint64_t v58 = [(SignpostEvent *)self tz_minuteswest];
  uint64_t v57 = [(SignpostEvent *)self tz_dsttime];
  uint64_t v61 = [(SignpostEvent *)self processName];
  uint64_t v55 = [(SignpostEvent *)self processID];
  long long v46 = [(SignpostSupportObject *)self subsystem];
  long long v47 = [(SignpostSupportObject *)self category];
  long long v56 = [(SignpostObject *)self name];
  unint64_t v48 = [(SignpostObject *)self scope];
  if (v48 > 2) {
    long long v49 = @"UNKNOWN";
  }
  else {
    long long v49 = off_1E5B40758[v48];
  }
  unint64_t v50 = [(SignpostEvent *)self _resolvedEventType] - 1;
  if (v50 > 3) {
    uint64_t v51 = @"UNKNOWN";
  }
  else {
    uint64_t v51 = off_1E5B40770[v50];
  }
  BOOL v52 = [(SignpostEvent *)self isAnimationStart];
  char v53 = @"Animation Start";
  if (!v52) {
    char v53 = &stru_1EF807BF0;
  }
  objc_msgSend(v63, "stringWithFormat:", @"mach_continuous_time: %llu%@\nTimebase Ratio:%f\nUnix Date Seconds:%lu Usec: %d\nUnix Time Zone Minutes West: %d DSTTime: %d\nProcess:%@[%d]\nSubsystem:%@\nCategory:%@\nName:%@\nScope:%@\nID:%@\nType:%@\n%@%@%@%@%@%@", v62, v66, v45, v60, v59, v58, v57, v61, v55, v46, v47, v56, v49, v65, v51, v53,
    v70,
    v67,
    v69,
    v36,
    v68);
  id v64 = (id)objc_claimAutoreleasedReturnValue();

  return v64;
}

- (NSString)debugDescription
{
  return (NSString *)[(SignpostEvent *)self _debugDescription:1];
}

- (unint64_t)timeRecordedNanoseconds
{
  double v3 = (double)[(SignpostEvent *)self timeRecordedMachContinuousTime];
  [(SignpostSupportObject *)self timebaseRatio];
  return (unint64_t)(v4 * v3);
}

- (unint64_t)overridingBeginNanoseconds
{
  double v3 = (double)[(SignpostEvent *)self overridingBeginMachContinuousTime];
  [(SignpostSupportObject *)self timebaseRatio];
  return (unint64_t)(v4 * v3);
}

- (unint64_t)overridingEndNanoseconds
{
  double v3 = (double)[(SignpostEvent *)self overridingEndMachContinuousTime];
  [(SignpostSupportObject *)self timebaseRatio];
  return (unint64_t)(v4 * v3);
}

- (unint64_t)overridingEmitNanoseconds
{
  double v3 = (double)[(SignpostEvent *)self overridingEmitMachContinuousTime];
  [(SignpostSupportObject *)self timebaseRatio];
  return (unint64_t)(v4 * v3);
}

- (BOOL)overridesTime
{
  if ([(SignpostEvent *)self overridesEmitTime]
    || [(SignpostEvent *)self overridesBeginTime])
  {
    return 1;
  }

  return [(SignpostEvent *)self overridesEndTime];
}

- (float)durationSeconds
{
  return 0.0;
}

- (void)_adjustTimeStruct:(timeval *)a3 asBegin:(BOOL)a4
{
  BOOL v4 = a4;
  a3->tv_sec = [(SignpostEvent *)self tv_sec];
  a3->tv_usec = [(SignpostEvent *)self tv_usec];
  if (v4) {
    unint64_t v7 = [(SignpostSupportObject *)self startNanoseconds];
  }
  else {
    unint64_t v7 = [(SignpostSupportObject *)self endNanoseconds];
  }
  uint64_t v8 = v7 - [(SignpostEvent *)self timeRecordedNanoseconds];

  _adjustTimeVal(&a3->tv_sec, v8);
}

- (void)_adjustBeginTimeVal:(timeval *)a3
{
}

- (void)_adjustEndTimeVal:(timeval *)a3
{
}

- (id)_dataArgumentWithName:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SignpostEvent *)self _argumentObjectWithName:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (SignpostEvent)initWithName:(id)a3 beginMct:(unint64_t)a4 endMct:(unint64_t)a5 emitMct:(unint64_t)a6 signpostId:(unint64_t)a7 generatorEvent:(id)a8
{
  id v14 = a3;
  id v15 = a8;
  v16 = v15;
  unint64_t v17 = a5 | a4;
  if (a5 | a4 && a6)
  {
    BOOL v18 = _signpost_debug_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[SignpostEvent initWithName:beginMct:endMct:emitMct:signpostId:generatorEvent:]();
    }
LABEL_13:

LABEL_14:
    uint64_t v26 = 0;
    goto LABEL_15;
  }
  if (!(v17 | a6))
  {
    BOOL v18 = _signpost_debug_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      [(SignpostEvent *)(uint64_t)v14 initWithName:v20 beginMct:v21 endMct:v22 emitMct:v23 signpostId:v24 generatorEvent:v25];
    }
    goto LABEL_13;
  }
  if (a4 > a5 && v17)
  {
    id v19 = _signpost_debug_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[SignpostEvent initWithName:beginMct:endMct:emitMct:signpostId:generatorEvent:](a4, a5, v19);
    }

    goto LABEL_14;
  }
  uint64_t v28 = [v15 subsystem];
  uint64_t v29 = [v16 category];
  [v16 timebaseRatio];
  v37.receiver = self;
  v37.super_class = (Class)SignpostEvent;
  uint64_t v30 = -[SignpostSupportObject initWithSubsystem:category:timebaseRatio:](&v37, sel_initWithSubsystem_category_timebaseRatio_, v28, v29);

  if (v30)
  {
    [(SignpostObject *)v30 setName:v14];
    [(SignpostEvent *)v30 setOverridingBeginMachContinuousTime:a4];
    [(SignpostEvent *)v30 setOverridingEndMachContinuousTime:a5];
    [(SignpostEvent *)v30 setOverridingEmitMachContinuousTime:a6];
    [(SignpostObject *)v30 setSignpostId:a7];
    [(SignpostEvent *)v30 setEventType:2];
    -[SignpostEvent set_machContinuousTimestamp:](v30, "set_machContinuousTimestamp:", [v16 _machContinuousTimestamp]);
    -[SignpostEvent setProcessID:](v30, "setProcessID:", [v16 processID]);
    -[SignpostEvent setProcessUniqueID:](v30, "setProcessUniqueID:", [v16 processUniqueID]);
    -[SignpostEvent setThreadID:](v30, "setThreadID:", [v16 threadID]);
    v31 = [v16 processImageUUID];
    [(SignpostEvent *)v30 setProcessImageUUID:v31];

    unsigned __int8 v32 = [v16 processImagePath];
    [(SignpostEvent *)v30 setProcessImagePath:v32];

    int v33 = [v16 processName];
    [(SignpostEvent *)v30 setProcessName:v33];

    v34 = [v16 senderImageUUID];
    [(SignpostEvent *)v30 setSenderImageUUID:v34];

    v35 = [v16 senderImagePath];
    [(SignpostEvent *)v30 setSenderImagePath:v35];

    v36 = [v16 stackFrames];
    [(SignpostEvent *)v30 setStackFrames:v36];

    -[SignpostObject setScope:](v30, "setScope:", [v16 scope]);
    -[SignpostEvent setTv_sec:](v30, "setTv_sec:", objc_msgSend(v16, "tv_sec"));
    -[SignpostEvent setTv_usec:](v30, "setTv_usec:", objc_msgSend(v16, "tv_usec"));
    -[SignpostEvent setTz_minuteswest:](v30, "setTz_minuteswest:", objc_msgSend(v16, "tz_minuteswest"));
    -[SignpostEvent setTz_dsttime:](v30, "setTz_dsttime:", objc_msgSend(v16, "tz_dsttime"));
  }
  self = v30;
  uint64_t v26 = self;
LABEL_15:

  return v26;
}

+ (id)_generatedEventFromMetadata:(id)a3 generatorEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 baseMct];
  uint64_t v8 = [v7 unsignedLongLongValue];

  char v9 = [v5 beginMct];
  if (v9)
  {
    long long v10 = [v5 beginMct];
    uint64_t v11 = [v10 unsignedLongLongValue] + v8;
  }
  else
  {
    uint64_t v11 = 0;
  }

  int v12 = [v5 endMct];
  if (v12)
  {
    long long v13 = [v5 endMct];
    uint64_t v14 = [v13 unsignedLongLongValue] + v8;
  }
  else
  {
    uint64_t v14 = 0;
  }

  id v15 = [v5 emitMct];
  if (v15)
  {
    v16 = [v5 emitMct];
    uint64_t v17 = [v16 unsignedLongLongValue] + v8;
  }
  else
  {
    uint64_t v17 = 0;
  }

  BOOL v18 = [v5 signpostId];
  if (v18)
  {
    id v19 = [v5 signpostId];
    uint64_t v20 = [v19 unsignedLongLongValue];
  }
  else
  {
    uint64_t v20 = [v6 signpostId];
  }

  if (!v11 || v14)
  {
    if (v14 && !v11) {
      uint64_t v11 = [v6 _machContinuousTimestamp];
    }
  }
  else
  {
    uint64_t v14 = [v6 _machContinuousTimestamp];
  }
  uint64_t v21 = [SignpostEvent alloc];
  uint64_t v22 = [v5 name];
  uint64_t v23 = [(SignpostEvent *)v21 initWithName:v22 beginMct:v11 endMct:v14 emitMct:v17 signpostId:v20 generatorEvent:v6];

  return v23;
}

+ (id)_generatedEventArrayForEvent:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  uint64_t v59 = v4;
  id v6 = [v4 metadataSegments];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v82 objects:v90 count:16];
  if (!v7)
  {
    id v63 = 0;
    goto LABEL_63;
  }
  uint64_t v8 = v7;
  id v63 = 0;
  uint64_t v9 = *(void *)v83;
  id v62 = v5;
  int64_t v60 = v6;
  id v61 = a1;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v83 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v82 + 1) + 8 * v10);
      if ([v11 isGenerator])
      {
        uint64_t v12 = [v11 typeNamespace];
        if (!v12
          || (long long v13 = (void *)v12,
              [v11 type],
              uint64_t v14 = objc_claimAutoreleasedReturnValue(),
              v14,
              v13,
              !v14))
        {
          BOOL v18 = _signpost_debug_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            +[SignpostEvent _generatedEventArrayForEvent:](&v80, v81);
          }
          goto LABEL_25;
        }
        id v15 = [v11 argument];
        int v16 = [v15 type];

        if (v16 != 3)
        {
          BOOL v18 = _signpost_debug_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            +[SignpostEvent _generatedEventArrayForEvent:].cold.6(&v78, v79);
          }
          goto LABEL_25;
        }
        uint64_t v17 = [v11 argument];
        BOOL v18 = [v17 argumentObject];

        if (v18)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v19 = [v11 type];
            int v20 = [v19 isEqualToString:@"base_mct"];

            if (v20)
            {
              if (v63)
              {
                uint64_t v21 = _signpost_debug_log();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
                  +[SignpostEvent _generatedEventArrayForEvent:](&v72, v73);
                }
                goto LABEL_24;
              }
              BOOL v18 = v18;
              id v63 = v18;
LABEL_25:

              goto LABEL_26;
            }
            long long v70 = 0u;
            long long v71 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            uint64_t v22 = [v11 placeholderTokens];
            uint64_t v23 = [v22 countByEnumeratingWithState:&v68 objects:v89 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v69;
              while (2)
              {
                for (uint64_t i = 0; i != v24; ++i)
                {
                  if (*(void *)v69 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  id v27 = *(void **)(*((void *)&v68 + 1) + 8 * i);
                  if ([v27 hasPrefix:@"name="])
                  {
                    uint64_t v28 = [v27 stringByReplacingOccurrencesOfString:@"name=" withString:&stru_1EF807BF0];
                    goto LABEL_38;
                  }
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v68 objects:v89 count:16];
                if (v24) {
                  continue;
                }
                break;
              }
              uint64_t v28 = 0;
LABEL_38:
              id v5 = v62;
              id v6 = v60;
            }
            else
            {
              uint64_t v28 = 0;
            }

            uint64_t v29 = [v5 objectForKeyedSubscript:v28];
            if (!v29)
            {
              uint64_t v29 = [[_GeneratedSignpostMetadata alloc] initWithName:v28];
              [v5 setObject:v29 forKeyedSubscript:v28];
            }
            uint64_t v30 = (void *)v28;
            v31 = [v11 type];
            int v32 = [v31 isEqualToString:@"id"];

            if (v32)
            {
              [(_GeneratedSignpostMetadata *)v29 setSignpostId:v18];
LABEL_55:
              a1 = v61;

              id v5 = v62;
              goto LABEL_25;
            }
            int v33 = [v11 type];
            int v34 = [v33 isEqualToString:@"begin"];

            if (v34)
            {
              [(_GeneratedSignpostMetadata *)v29 setBeginMct:v18];
              goto LABEL_55;
            }
            v35 = [v11 type];
            int v36 = [v35 isEqualToString:@"end"];

            if (v36)
            {
              [(_GeneratedSignpostMetadata *)v29 setEndMct:v18];
              goto LABEL_55;
            }
            objc_super v37 = [v11 type];
            int v38 = [v37 isEqualToString:@"begin_end_16b"];

            if (v38)
            {
              unsigned int v39 = [v18 unsignedIntValue];
              uint64_t v40 = [NSNumber numberWithUnsignedInt:HIWORD(v39)];
              [(_GeneratedSignpostMetadata *)v29 setBeginMct:v40];

              uint64_t v41 = [NSNumber numberWithUnsignedInt:(unsigned __int16)v39];
              goto LABEL_53;
            }
            long long v42 = [v11 type];
            int v43 = [v42 isEqualToString:@"begin_end_32b"];

            if (v43)
            {
              unint64_t v44 = [v18 unsignedLongLongValue];
              uint64_t v45 = [NSNumber numberWithUnsignedLongLong:HIDWORD(v44)];
              [(_GeneratedSignpostMetadata *)v29 setBeginMct:v45];

              uint64_t v41 = [NSNumber numberWithUnsignedLongLong:v44];
LABEL_53:
              long long v46 = v41;
              [(_GeneratedSignpostMetadata *)v29 setEndMct:v41];
            }
            else
            {
              long long v47 = [v11 type];
              int v48 = [v47 isEqualToString:@"event"];

              if (v48)
              {
                [(_GeneratedSignpostMetadata *)v29 setEmitMct:v18];
                goto LABEL_55;
              }
              long long v46 = _signpost_debug_log();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
                +[SignpostEvent _generatedEventArrayForEvent:].cold.4(v87, v11, &v88, v46);
              }
            }

            goto LABEL_55;
          }
          uint64_t v21 = _signpost_debug_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            +[SignpostEvent _generatedEventArrayForEvent:].cold.5(&v74, v75);
          }
        }
        else
        {
          uint64_t v21 = _signpost_debug_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            +[SignpostEvent _generatedEventArrayForEvent:](&v76, v77);
          }
        }
LABEL_24:

        goto LABEL_25;
      }
LABEL_26:
      ++v10;
    }
    while (v10 != v8);
    uint64_t v49 = [v6 countByEnumeratingWithState:&v82 objects:v90 count:16];
    uint64_t v8 = v49;
  }
  while (v49);
LABEL_63:

  unint64_t v50 = [MEMORY[0x1E4F1CA48] array];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v51 = [v5 allValues];
  uint64_t v52 = [v51 countByEnumeratingWithState:&v64 objects:v86 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v65;
    do
    {
      for (uint64_t j = 0; j != v53; ++j)
      {
        if (*(void *)v65 != v54) {
          objc_enumerationMutation(v51);
        }
        long long v56 = *(void **)(*((void *)&v64 + 1) + 8 * j);
        [v56 setBaseMct:v63];
        uint64_t v57 = [a1 _generatedEventFromMetadata:v56 generatorEvent:v59];
        if (v57) {
          [v50 addObject:v57];
        }
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v64 objects:v86 count:16];
    }
    while (v53);
  }

  [v50 addObject:v59];
  [v50 sortUsingComparator:&__block_literal_global_26];

  return v50;
}

uint64_t __46__SignpostEvent__generatedEventArrayForEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 startMachContinuousTime];
  if (v6 >= [v5 startMachContinuousTime])
  {
    unint64_t v8 = [v4 startMachContinuousTime];
    uint64_t v7 = v8 > [v5 startMachContinuousTime];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (id)metadataSegmentsWithPlaceholderTokenKey:(id)a3 value:(id)a4
{
  id v4 = 0;
  if (a3 && a4)
  {
    uint64_t v7 = (objc_class *)NSString;
    id v8 = a4;
    id v9 = a3;
    uint64_t v10 = (void *)[[v7 alloc] initWithFormat:@"%@=%@", v9, v8];

    id v4 = [(SignpostEvent *)self metadataSegmentsWithPlaceholderToken:v10];
  }

  return v4;
}

- (id)metadataSegmentsWithPlaceholderToken:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4
    && ([(SignpostEvent *)self metadataSegments],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = [(SignpostEvent *)self metadataSegments];
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
          long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v13 hasPlaceholderToken:v4]) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    if ([v7 count]) {
      id v14 = v7;
    }
    else {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)placeholderTokenValueDictForTokenKey:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  if (v19)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obuint64_t j = [(SignpostEvent *)self metadataSegments];
    uint64_t v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v20)
    {
      uint64_t v18 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v7 = [v6 placeholderTokensForKey:v19];
          if ([v7 count])
          {
            long long v24 = 0u;
            long long v25 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            uint64_t v21 = v7;
            id v8 = v7;
            uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v9)
            {
              uint64_t v10 = v9;
              uint64_t v11 = *(void *)v23;
              do
              {
                for (uint64_t j = 0; j != v10; ++j)
                {
                  if (*(void *)v23 != v11) {
                    objc_enumerationMutation(v8);
                  }
                  uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * j);
                  id v14 = [v4 objectForKeyedSubscript:v13];
                  if (!v14)
                  {
                    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    [v4 setObject:v14 forKeyedSubscript:v13];
                  }
                  [v14 addObject:v6];
                }
                uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
              }
              while (v10);
            }

            id v7 = v21;
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v20);
    }

    if ([v4 count]) {
      id v15 = v4;
    }
    else {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (int64_t)tv_sec
{
  return self->_tv_sec;
}

- (void)setTv_sec:(int64_t)a3
{
  self->_tv_sec = a3;
}

- (int)tv_usec
{
  return self->_tv_usec;
}

- (void)setTv_usec:(int)a3
{
  self->_tv_usec = a3;
}

- (int)tz_minuteswest
{
  return self->_tz_minuteswest;
}

- (void)setTz_minuteswest:(int)a3
{
  self->_tz_minuteswest = a3;
}

- (int)tz_dsttime
{
  return self->_tz_dsttime;
}

- (void)setTz_dsttime:(int)a3
{
  self->_tz_dsttime = a3;
}

- (unint64_t)processUniqueID
{
  return self->_processUniqueID;
}

- (void)setOverridingEmitMachContinuousTime:(unint64_t)a3
{
  self->_overridingEmitMachContinuousTime = a3;
}

- (NSUUID)processImageUUID
{
  return self->_processImageUUID;
}

- (NSUUID)senderImageUUID
{
  return self->_senderImageUUID;
}

- (NSString)senderImagePath
{
  return self->_senderImagePath;
}

- (NSArray)stackFrames
{
  return self->_stackFrames;
}

- (void)setStackFrames:(id)a3
{
}

- (SignpostMetrics)metrics
{
  return self->_metrics;
}

- (void)initWithName:(uint64_t)a3 beginMct:(uint64_t)a4 endMct:(uint64_t)a5 emitMct:(uint64_t)a6 signpostId:(uint64_t)a7 generatorEvent:(uint64_t)a8 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithName:(os_log_t)log beginMct:endMct:emitMct:signpostId:generatorEvent:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1A4576000, log, OS_LOG_TYPE_DEBUG, "Begin timestamp %llu > end timestamp %llu", (uint8_t *)&v3, 0x16u);
}

- (void)initWithName:beginMct:endMct:emitMct:signpostId:generatorEvent:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1A4576000, v0, v1, "Generator for event provided both interval and event timestamps", v2, v3, v4, v5, v6);
}

+ (void)_generatedEventArrayForEvent:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_1(a1, a2);
  OUTLINED_FUNCTION_1_2(&dword_1A4576000, v2, (uint64_t)v2, "Skipping argument lacking type namespace and/or type", v3);
}

+ (void)_generatedEventArrayForEvent:(unsigned char *)a1 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_1(a1, a2);
  OUTLINED_FUNCTION_1_2(&dword_1A4576000, v2, (uint64_t)v2, "Skipping nil argument when generating event", v3);
}

+ (void)_generatedEventArrayForEvent:(unsigned char *)a1 .cold.3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_1(a1, a2);
  OUTLINED_FUNCTION_1_2(&dword_1A4576000, v2, (uint64_t)v2, "Base MCT specified multiple times. Ignoring subsequent values...", v3);
}

+ (void)_generatedEventArrayForEvent:(void *)a3 .cold.4(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 type];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1A4576000, a4, OS_LOG_TYPE_DEBUG, "Unknown generator type: %@", a1, 0xCu);
}

+ (void)_generatedEventArrayForEvent:(unsigned char *)a1 .cold.5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_1(a1, a2);
  OUTLINED_FUNCTION_1_2(&dword_1A4576000, v2, (uint64_t)v2, "Skipping generator argument with invalid type", v3);
}

+ (void)_generatedEventArrayForEvent:(unsigned char *)a1 .cold.6(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_1(a1, a2);
  OUTLINED_FUNCTION_1_2(&dword_1A4576000, v2, (uint64_t)v2, "Skipping non-number argument when generating event", v3);
}

@end