@interface SignpostInterval
+ (id)serializationTypeNumber;
- (BOOL)_hasBeginTimeval;
- (BOOL)_hasEndTimeval;
- (BOOL)beginTimezone:(timezone *)a3;
- (BOOL)endTimezone:(timezone *)a3;
- (BOOL)intersectsInterval:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSyntheticInterval;
- (BOOL)telemetryEnabled;
- (NSString)_intervalTypeString;
- (SignpostEvent)beginEvent;
- (SignpostEvent)endEvent;
- (SignpostInterval)initWithBeginEvent:(id)a3 endEvent:(id)a4;
- (SignpostInterval)initWithDictionary:(id)a3;
- (float)durationSeconds;
- (id)_descriptionStringForColumn:(unint64_t)a3 timeFormat:(unint64_t)a4 asBegin:(BOOL)a5;
- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4;
- (id)_eventDescriptions;
- (id)debugDescription;
- (id)descriptionWithTimeFormat:(unint64_t)a3 verbosity:(unsigned __int8)a4;
- (id)humanReadableType;
- (id)number1Name;
- (id)number1Value;
- (id)number2Name;
- (id)number2Value;
- (id)string1Name;
- (id)string1Value;
- (id)string2Name;
- (id)string2Value;
- (int)tv_usec;
- (int)tz_dsttime;
- (int)tz_minuteswest;
- (int64_t)tv_sec;
- (unint64_t)durationMachContinuousTime;
- (unint64_t)endMachContinuousTime;
- (unint64_t)hash;
- (unint64_t)scope;
- (unint64_t)startMachContinuousTime;
- (void)_adjustBeginTimeVal:(timeval *)a3;
- (void)_adjustEndTimeVal:(timeval *)a3;
- (void)setBeginEvent:(id)a3;
- (void)setEndEvent:(id)a3;
@end

@implementation SignpostInterval

- (SignpostInterval)initWithBeginEvent:(id)a3 endEvent:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7 || !v8)
  {
    v11 = _signpost_debug_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[SignpostInterval initWithBeginEvent:endEvent:].cold.6();
    }
    goto LABEL_11;
  }
  uint64_t v10 = [v7 signpostId];
  if (v10 != [v9 signpostId])
  {
    v11 = _signpost_debug_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[SignpostInterval initWithBeginEvent:endEvent:].cold.5();
    }
    goto LABEL_11;
  }
  if (([v7 _resolvedEventType] & 1) == 0)
  {
    v11 = _signpost_debug_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[SignpostInterval initWithBeginEvent:endEvent:]();
    }
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  if (([v9 _resolvedEventType] & 2) == 0)
  {
    v11 = _signpost_debug_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[SignpostInterval initWithBeginEvent:endEvent:]();
    }
    goto LABEL_11;
  }
  uint64_t v14 = [v7 scope];
  if (v14 != [v9 scope])
  {
    v11 = _signpost_debug_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[SignpostInterval initWithBeginEvent:endEvent:].cold.4();
    }
    goto LABEL_11;
  }
  unint64_t v15 = [v7 startMachContinuousTime];
  if ([v9 overridesBeginTime]) {
    unint64_t v15 = [v9 overridingBeginMachContinuousTime];
  }
  unint64_t v16 = [v9 endMachContinuousTime];
  if ([v7 overridesEndTime]) {
    unint64_t v16 = [v7 overridingEndMachContinuousTime];
  }
  if (v15 >= v16)
  {
    v11 = _signpost_debug_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[SignpostInterval initWithBeginEvent:endEvent:](v7, v9, v11);
    }
    goto LABEL_11;
  }
  obuint64_t j = a3;
  id v43 = a4;
  v44 = self;
  v11 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v17 = [v7 attributes];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v52 objects:v65 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v53 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        v23 = [v7 attributes];
        v24 = [v23 objectForKeyedSubscript:v22];
        [v11 setObject:v24 forKeyedSubscript:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v52 objects:v65 count:16];
    }
    while (v19);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v25 = [v9 attributes];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v48 objects:v64 count:16];
  v45 = v9;
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v49 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v48 + 1) + 8 * j);
        v31 = [v11 objectForKeyedSubscript:v30];

        if (v31)
        {
          v32 = _signpost_debug_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            v46 = [v7 subsystem];
            v33 = [v7 category];
            v34 = [v7 name];
            *(_DWORD *)buf = 138413058;
            uint64_t v57 = v30;
            __int16 v58 = 2112;
            v59 = v46;
            __int16 v60 = 2112;
            v61 = v33;
            __int16 v62 = 2112;
            v63 = v34;
            _os_log_debug_impl(&dword_1A4576000, v32, OS_LOG_TYPE_DEBUG, "Collision on attribute key %@ in %@/%@/%@", buf, 0x2Au);

            v9 = v45;
          }
        }
        else
        {
          v32 = [v9 attributes];
          v35 = [v32 objectForKeyedSubscript:v30];
          [v11 setObject:v35 forKeyedSubscript:v30];
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v48 objects:v64 count:16];
    }
    while (v27);
  }

  v36 = [v7 subsystem];
  v37 = [v7 category];
  v38 = [v7 name];
  uint64_t v39 = [v7 signpostId];
  uint64_t v40 = [v7 scope];
  [v7 timebaseRatio];
  v47.receiver = v44;
  v47.super_class = (Class)SignpostInterval;
  v41 = -[SignpostObject initWithSubsystem:category:name:signpostId:scope:timebaseRatio:attributes:](&v47, sel_initWithSubsystem_category_name_signpostId_scope_timebaseRatio_attributes_, v36, v37, v38, v39, v40, v11);

  if (v41)
  {
    objc_storeStrong((id *)&v41->_beginEvent, obj);
    objc_storeStrong((id *)&v41->_endEvent, v43);
  }
  self = v41;
  v12 = self;
  v9 = v45;
LABEL_12:

  return v12;
}

- (unint64_t)endMachContinuousTime
{
  v3 = [(SignpostInterval *)self beginEvent];
  int v4 = [v3 overridesEndTime];

  if (v4)
  {
    v5 = [(SignpostInterval *)self beginEvent];
    uint64_t v6 = [v5 overridingEndMachContinuousTime];
  }
  else
  {
    v5 = [(SignpostInterval *)self endEvent];
    uint64_t v6 = [v5 endMachContinuousTime];
  }
  unint64_t v7 = v6;

  return v7;
}

- (SignpostEvent)beginEvent
{
  return self->_beginEvent;
}

- (unint64_t)startMachContinuousTime
{
  v3 = [(SignpostInterval *)self endEvent];
  int v4 = [v3 overridesBeginTime];

  if (v4)
  {
    v5 = [(SignpostInterval *)self endEvent];
    uint64_t v6 = [v5 overridingBeginMachContinuousTime];
  }
  else
  {
    v5 = [(SignpostInterval *)self beginEvent];
    uint64_t v6 = [v5 startMachContinuousTime];
  }
  unint64_t v7 = v6;

  return v7;
}

- (SignpostEvent)endEvent
{
  return self->_endEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endEvent, 0);

  objc_storeStrong((id *)&self->_beginEvent, 0);
}

- (BOOL)isSyntheticInterval
{
  v3 = [(SignpostInterval *)self beginEvent];
  int v4 = [(SignpostInterval *)self endEvent];
  if (v3 == v4)
  {
    uint64_t v6 = [(SignpostInterval *)self beginEvent];
    char v5 = [v6 isSyntheticIntervalEvent];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)number1Value
{
  v3 = [(SignpostInterval *)self beginEvent];
  int v4 = [v3 number1Value];

  if (v4) {
    [(SignpostInterval *)self beginEvent];
  }
  else {
  char v5 = [(SignpostInterval *)self endEvent];
  }
  uint64_t v6 = [v5 number1Value];

  return v6;
}

- (id)number1Name
{
  v3 = [(SignpostInterval *)self beginEvent];
  int v4 = [v3 number1Name];

  if (v4) {
    [(SignpostInterval *)self beginEvent];
  }
  else {
  char v5 = [(SignpostInterval *)self endEvent];
  }
  uint64_t v6 = [v5 number1Name];

  return v6;
}

- (id)string1Value
{
  v3 = [(SignpostInterval *)self beginEvent];
  int v4 = [v3 string1Value];

  if (v4) {
    [(SignpostInterval *)self beginEvent];
  }
  else {
  char v5 = [(SignpostInterval *)self endEvent];
  }
  uint64_t v6 = [v5 string1Value];

  return v6;
}

- (id)string1Name
{
  v3 = [(SignpostInterval *)self beginEvent];
  int v4 = [v3 string1Name];

  if (v4) {
    [(SignpostInterval *)self beginEvent];
  }
  else {
  char v5 = [(SignpostInterval *)self endEvent];
  }
  uint64_t v6 = [v5 string1Name];

  return v6;
}

- (id)string2Value
{
  v3 = [(SignpostInterval *)self beginEvent];
  int v4 = [v3 string2Value];

  if (v4) {
    [(SignpostInterval *)self beginEvent];
  }
  else {
  char v5 = [(SignpostInterval *)self endEvent];
  }
  uint64_t v6 = [v5 string2Value];

  return v6;
}

- (id)string2Name
{
  v3 = [(SignpostInterval *)self beginEvent];
  int v4 = [v3 string2Name];

  if (v4) {
    [(SignpostInterval *)self beginEvent];
  }
  else {
  char v5 = [(SignpostInterval *)self endEvent];
  }
  uint64_t v6 = [v5 string2Name];

  return v6;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3 = [(SignpostInterval *)self endMachContinuousTime];
  return v3 - [(SignpostInterval *)self startMachContinuousTime];
}

+ (id)serializationTypeNumber
{
  return 0;
}

- (SignpostInterval)initWithDictionary:(id)a3
{
  return 0;
}

- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4
{
  if (a3)
  {
    v17.receiver = self;
    v17.super_class = (Class)SignpostInterval;
    char v5 = [(SignpostObject *)&v17 _dictionaryRepresentationWithIsHumanReadable:1 shouldRedact:a4];
    uint64_t v6 = [(SignpostInterval *)self beginEvent];
    unint64_t v7 = [v6 humanReadableDictionaryRepresentation];

    id v8 = [(SignpostInterval *)self endEvent];
    v9 = [v8 humanReadableDictionaryRepresentation];

    [v5 setObject:v7 forKeyedSubscript:@"IntervalBeginEvent"];
    [v5 setObject:v9 forKeyedSubscript:@"IntervalEndEvent"];
    uint64_t v10 = [(SignpostInterval *)self endEvent];
    int v11 = [v10 overridesBeginTime];

    if (v11)
    {
      v12 = [(SignpostSupportObject *)self beginWallTimeStringWithTimeZoneName:0];
      [v5 setObject:v12 forKeyedSubscript:@"OverridingBeginWalltime"];
    }
    v13 = [(SignpostInterval *)self beginEvent];
    int v14 = [v13 overridesEndTime];

    if (v14)
    {
      unint64_t v15 = [(SignpostSupportObject *)self endWallTimeStringWithTimeZoneName:0];
      [v5 setObject:v15 forKeyedSubscript:@"OverridingEndWalltime"];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)humanReadableType
{
  return @"SignpostInterval";
}

- (BOOL)intersectsInterval:(id)a3
{
  id v4 = a3;
  char v5 = [(SignpostSupportObject *)self beginDate];
  uint64_t v6 = [(SignpostSupportObject *)self endDate];
  unint64_t v7 = [v4 beginDate];
  id v8 = [v4 endDate];
  unint64_t v9 = [(SignpostInterval *)self startMachContinuousTime];
  unint64_t v10 = [v4 endMachContinuousTime];
  if (!v5 || !v6 || !v7 || !v8)
  {
    if (v9 < v10)
    {
      unint64_t v25 = [v4 startMachContinuousTime];
      BOOL v24 = v25 < [(SignpostInterval *)self endMachContinuousTime];
      goto LABEL_14;
    }
LABEL_13:
    BOOL v24 = 0;
    goto LABEL_14;
  }
  if (v9 == v10)
  {
    [v5 timeIntervalSince1970];
    unint64_t v12 = (unint64_t)v11;
    [v8 timeIntervalSince1970];
    if (v12 == (unint64_t)v13) {
      goto LABEL_13;
    }
  }
  unint64_t v14 = [(SignpostInterval *)self endMachContinuousTime];
  if (v14 == [v4 startMachContinuousTime])
  {
    [v6 timeIntervalSince1970];
    unint64_t v16 = (unint64_t)v15;
    [v7 timeIntervalSince1970];
    if (v16 == (unint64_t)v17) {
      goto LABEL_13;
    }
  }
  [v5 timeIntervalSince1970];
  double v19 = v18;
  [v8 timeIntervalSince1970];
  if (v19 >= v20) {
    goto LABEL_13;
  }
  [v7 timeIntervalSince1970];
  double v22 = v21;
  [v6 timeIntervalSince1970];
  BOOL v24 = v22 < v23;
LABEL_14:

  return v24;
}

- (NSString)_intervalTypeString
{
  return (NSString *)@"Interval";
}

- (id)_descriptionStringForColumn:(unint64_t)a3 timeFormat:(unint64_t)a4 asBegin:(BOOL)a5
{
  v33.receiver = self;
  v33.super_class = (Class)SignpostInterval;
  unint64_t v7 = [(SignpostObject *)&v33 _descriptionStringForColumn:a3 timeFormat:a4 asBegin:a5];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
LABEL_3:
    unint64_t v10 = v9;
    goto LABEL_17;
  }
  switch(a3)
  {
    case 0xAuLL:
      double v21 = [(SignpostInterval *)self beginEvent];
      uint64_t v22 = [v21 threadID];
      double v23 = [(SignpostInterval *)self endEvent];
      uint64_t v24 = [v23 threadID];

      unint64_t v25 = NSString;
      unint64_t v16 = [(SignpostInterval *)self beginEvent];
      uint64_t v26 = [v16 threadID];
      uint64_t v27 = v26;
      if (v22 == v24)
      {
        unint64_t v10 = objc_msgSend(v25, "stringWithFormat:", @"%#llx", v26);
      }
      else
      {
        v31 = [(SignpostInterval *)self endEvent];
        unint64_t v10 = objc_msgSend(v25, "stringWithFormat:", @"%#llx->%#llx", v27, objc_msgSend(v31, "threadID"));
      }
LABEL_16:

      goto LABEL_17;
    case 9uLL:
      double v11 = [(SignpostInterval *)self beginEvent];
      int v12 = [v11 processID];
      double v13 = [(SignpostInterval *)self endEvent];
      int v14 = [v13 processID];

      double v15 = NSString;
      unint64_t v16 = [(SignpostInterval *)self beginEvent];
      double v17 = [v16 processName];
      double v18 = [(SignpostInterval *)self beginEvent];
      uint64_t v19 = [v18 processID];
      uint64_t v20 = v19;
      if (v12 == v14)
      {
        unint64_t v10 = [v15 stringWithFormat:@"%@[%d]", v17, v19];
      }
      else
      {
        uint64_t v28 = [(SignpostInterval *)self endEvent];
        v29 = [v28 processName];
        uint64_t v30 = [(SignpostInterval *)self endEvent];
        unint64_t v10 = [v15 stringWithFormat:@"%@[%d]->%@[%d]", v17, v20, v29, objc_msgSend(v30, "processID")];
      }
      goto LABEL_16;
    case 5uLL:
      id v9 = [(SignpostInterval *)self _intervalTypeString];
      goto LABEL_3;
  }
  unint64_t v10 = 0;
LABEL_17:

  return v10;
}

- (id)descriptionWithTimeFormat:(unint64_t)a3 verbosity:(unsigned __int8)a4
{
  if (a4 == 2)
  {
    uint64_t v6 = NSString;
    v15.receiver = self;
    v15.super_class = (Class)SignpostInterval;
    unint64_t v7 = -[SignpostSupportObject descriptionWithTimeFormat:verbosity:](&v15, sel_descriptionWithTimeFormat_verbosity_, a3);
    id v8 = [(SignpostInterval *)self beginEvent];
    id v9 = [v8 _descriptionWithTimeFormat:a3 verbosity:2 asBegin:1];
    unint64_t v10 = [(SignpostInterval *)self endEvent];
    double v11 = [v10 _descriptionWithTimeFormat:a3 verbosity:2 asBegin:0];
    int v12 = [v6 stringWithFormat:@"--------\n%@\n↳ %@\n↳ %@\n--------", v7, v9, v11];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SignpostInterval;
    int v12 = -[SignpostSupportObject descriptionWithTimeFormat:verbosity:](&v14, sel_descriptionWithTimeFormat_verbosity_, a3);
  }

  return v12;
}

- (void)_adjustBeginTimeVal:(timeval *)a3
{
  char v5 = [(SignpostInterval *)self endEvent];
  int v6 = [v5 overridesBeginTime];

  unint64_t v7 = [(SignpostInterval *)self beginEvent];
  id v15 = v7;
  if (v6)
  {
    a3->tv_sec = objc_msgSend(v7, "tv_sec");

    id v8 = [(SignpostInterval *)self beginEvent];
    a3->tv_usec = objc_msgSend(v8, "tv_usec");

    [(SignpostSupportObject *)self timebaseRatio];
    double v10 = v9;
    double v11 = [(SignpostInterval *)self endEvent];
    uint64_t v12 = [v11 overridingBeginMachContinuousTime];
    double v13 = [(SignpostInterval *)self beginEvent];
    uint64_t v14 = (uint64_t)(v10 * (double)(v12 - [v13 timeRecordedMachContinuousTime]));

    _adjustTimeVal(&a3->tv_sec, v14);
  }
  else
  {
    [v7 _adjustBeginTimeVal:a3];
  }
}

- (void)_adjustEndTimeVal:(timeval *)a3
{
  char v5 = [(SignpostInterval *)self beginEvent];
  int v6 = [v5 overridesEndTime];

  unint64_t v7 = [(SignpostInterval *)self endEvent];
  id v15 = v7;
  if (v6)
  {
    a3->tv_sec = objc_msgSend(v7, "tv_sec");

    id v8 = [(SignpostInterval *)self endEvent];
    a3->tv_usec = objc_msgSend(v8, "tv_usec");

    [(SignpostSupportObject *)self timebaseRatio];
    double v10 = v9;
    double v11 = [(SignpostInterval *)self beginEvent];
    uint64_t v12 = [v11 overridingEndMachContinuousTime];
    double v13 = [(SignpostInterval *)self endEvent];
    uint64_t v14 = (uint64_t)(v10 * (double)(v12 - [v13 timeRecordedMachContinuousTime]));

    _adjustTimeVal(&a3->tv_sec, v14);
  }
  else
  {
    [v7 _adjustEndTimeVal:a3];
  }
}

- (BOOL)_hasBeginTimeval
{
  v2 = [(SignpostInterval *)self beginEvent];
  char v3 = [v2 _hasBeginTimeval];

  return v3;
}

- (BOOL)_hasEndTimeval
{
  v2 = [(SignpostInterval *)self endEvent];
  char v3 = [v2 _hasEndTimeval];

  return v3;
}

- (BOOL)beginTimezone:(timezone *)a3
{
  id v4 = [(SignpostInterval *)self beginEvent];
  LOBYTE(a3) = [v4 beginTimezone:a3];

  return (char)a3;
}

- (BOOL)endTimezone:(timezone *)a3
{
  id v4 = [(SignpostInterval *)self endEvent];
  LOBYTE(a3) = [v4 endTimezone:a3];

  return (char)a3;
}

- (unint64_t)scope
{
  v2 = [(SignpostInterval *)self beginEvent];
  unint64_t v3 = [v2 scope];

  return v3;
}

- (id)number2Name
{
  unint64_t v3 = [(SignpostInterval *)self beginEvent];
  id v4 = [v3 number2Name];

  if (v4) {
    [(SignpostInterval *)self beginEvent];
  }
  else {
  char v5 = [(SignpostInterval *)self endEvent];
  }
  int v6 = [v5 number2Name];

  return v6;
}

- (id)number2Value
{
  unint64_t v3 = [(SignpostInterval *)self beginEvent];
  id v4 = [v3 number2Value];

  if (v4) {
    [(SignpostInterval *)self beginEvent];
  }
  else {
  char v5 = [(SignpostInterval *)self endEvent];
  }
  int v6 = [v5 number2Value];

  return v6;
}

- (BOOL)telemetryEnabled
{
  unint64_t v3 = [(SignpostInterval *)self beginEvent];
  if ([v3 telemetryEnabled])
  {
    char v4 = 1;
  }
  else
  {
    char v5 = [(SignpostInterval *)self endEvent];
    char v4 = [v5 telemetryEnabled];
  }
  return v4;
}

- (int64_t)tv_sec
{
  v2 = [(SignpostInterval *)self beginEvent];
  int64_t v3 = objc_msgSend(v2, "tv_sec");

  return v3;
}

- (int)tv_usec
{
  v2 = [(SignpostInterval *)self beginEvent];
  int v3 = objc_msgSend(v2, "tv_usec");

  return v3;
}

- (int)tz_minuteswest
{
  v2 = [(SignpostInterval *)self beginEvent];
  int v3 = objc_msgSend(v2, "tz_minuteswest");

  return v3;
}

- (int)tz_dsttime
{
  v2 = [(SignpostInterval *)self beginEvent];
  int v3 = objc_msgSend(v2, "tz_dsttime");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SignpostInterval;
  if ([(SignpostObject *)&v13 isEqual:v4])
  {
    id v5 = v4;
    int v6 = [(SignpostInterval *)self beginEvent];
    unint64_t v7 = [v5 beginEvent];
    int v8 = [v6 isEqual:v7];

    if (v8)
    {
      double v9 = [(SignpostInterval *)self endEvent];
      double v10 = [v5 endEvent];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  int v3 = [(SignpostInterval *)self beginEvent];
  uint64_t v4 = [v3 hash];
  id v5 = [(SignpostInterval *)self endEvent];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (float)durationSeconds
{
  double v3 = (double)[(SignpostInterval *)self durationMachContinuousTime];
  [(SignpostSupportObject *)self timebaseRatio];
  return (float)(unint64_t)(v4 * v3) / 1000000000.0;
}

- (id)_eventDescriptions
{
  double v3 = NSString;
  double v4 = [(SignpostInterval *)self beginEvent];
  id v5 = [v4 _debugDescription:1];
  unint64_t v6 = [(SignpostInterval *)self endEvent];
  unint64_t v7 = [v6 _debugDescription:0];
  int v8 = [v3 stringWithFormat:@"Start Event:\n%@%@%@End Event:\n%@%@%@", @"---------------\n", v5, @"---------------\n", @"---------------\n", v7, @"---------------\n"];

  return v8;
}

- (id)debugDescription
{
  double v3 = NSString;
  double v4 = [(SignpostObject *)self name];
  unint64_t v5 = [(SignpostInterval *)self startMachContinuousTime];
  unint64_t v6 = [(SignpostInterval *)self endMachContinuousTime];
  [(SignpostInterval *)self durationSeconds];
  double v8 = v7;
  if ([(SignpostInterval *)self telemetryEnabled]) {
    double v9 = @"Enabled";
  }
  else {
    double v9 = @"Disabled";
  }
  double v10 = +[SignpostMetrics _deltaDescription:self];
  char v11 = [(SignpostInterval *)self _eventDescriptions];
  uint64_t v12 = [v3 stringWithFormat:@"Interval \"%@\" [%llu - %llu]\nDuration: %.4fs\nTelemetry:%@\n%@%@", v4, v5, v6, *(void *)&v8, v9, v10, v11];

  return v12;
}

- (void)setBeginEvent:(id)a3
{
}

- (void)setEndEvent:(id)a3
{
}

- (void)initWithBeginEvent:endEvent:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1A4576000, v0, v1, "Unexpected beginEvent type", v2, v3, v4, v5, v6);
}

- (void)initWithBeginEvent:endEvent:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1A4576000, v0, v1, "Unexpected endEvent type", v2, v3, v4, v5, v6);
}

- (void)initWithBeginEvent:(NSObject *)a3 endEvent:.cold.3(void *a1, void *a2, NSObject *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = [a1 subsystem];
  float v7 = [a1 category];
  double v8 = [a1 name];
  int v9 = 138413314;
  double v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  __int16 v15 = 2048;
  uint64_t v16 = [a2 startMachContinuousTime];
  __int16 v17 = 2048;
  uint64_t v18 = [a1 startMachContinuousTime];
  _os_log_debug_impl(&dword_1A4576000, a3, OS_LOG_TYPE_DEBUG, "%@/%@/%@: End timestamp (%llu) <= start timestamp (%llu)", (uint8_t *)&v9, 0x34u);
}

- (void)initWithBeginEvent:endEvent:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1A4576000, v0, v1, "Mismatched event scopes", v2, v3, v4, v5, v6);
}

- (void)initWithBeginEvent:endEvent:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1A4576000, v0, v1, "Trying to create SignpostInterval with mismatched event IDs", v2, v3, v4, v5, v6);
}

- (void)initWithBeginEvent:endEvent:.cold.6()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1A4576000, v0, v1, "Passed nil event(s)", v2, v3, v4, v5, v6);
}

@end