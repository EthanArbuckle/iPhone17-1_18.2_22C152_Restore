@interface NFLookbackReaderRestrictor
- (BOOL)loadCustomDefaults;
- (BOOL)loadDefaultValues;
- (NFLookbackReaderRestrictor)initWithThermalMonitor:(id)a3 delegate:(id)a4;
- (double)getCooloffTime;
- (double)maxOperationTimeSpan;
- (double)maxReaderTime;
- (float)getMaxOnTimeAtIndex:(int)a3;
- (id)_allOperationsSince:(double)a3 referenceTime:(id)a4;
- (id)description;
- (void)_getReaderOnTime:(double *)a3 andOff:(double *)a4 since:(double)a5 referenceTime:(id)a6;
- (void)dealloc;
@end

@implementation NFLookbackReaderRestrictor

- (BOOL)loadCustomDefaults
{
  v3 = +[NSUserDefaults standardUserDefaults];
  v4 = [v3 arrayForKey:@"lookBackRestrictorWindows"];
  v5 = [v3 arrayForKey:@"lookBackRestrictorValues"];
  id v6 = [v5 count];
  if (v6 != [v4 count])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v32 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      id v48 = [v5 count];
      id v49 = [v4 count];
      uint64_t v37 = 45;
      if (isMetaClass) {
        uint64_t v37 = 43;
      }
      v32(3, "%c[%{public}s %{public}s]:%i Invalid custom value count. Windows = %d, Values = %d", v37, ClassName, Name, 39, v48, v49);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v38 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = object_getClass(self);
      if (class_isMetaClass(v39)) {
        int v40 = 43;
      }
      else {
        int v40 = 45;
      }
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v53 = v40;
      *(_WORD *)&v53[4] = 2082;
      *(void *)&v53[6] = object_getClassName(self);
      __int16 v54 = 2082;
      v55 = sel_getName(a2);
      __int16 v56 = 1024;
      int v57 = 39;
      __int16 v58 = 1024;
      *(_DWORD *)v59 = [v5 count];
      *(_WORD *)&v59[4] = 1024;
      *(_DWORD *)&v59[6] = [v4 count];
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid custom value count. Windows = %d, Values = %d", buf, 0x2Eu);
    }

    goto LABEL_30;
  }
  if (![v5 count])
  {
LABEL_30:
    BOOL v30 = 0;
    goto LABEL_31;
  }
  int v7 = [v5 count];
  self->_maxTimeWindows = v7;
  self->_timeWindows = (double *)malloc_type_calloc(1uLL, 8 * v7, 0x100004000313F17uLL);
  self->_maxOnTimesNominal = (float *)malloc_type_calloc(1uLL, 4 * self->_maxTimeWindows, 0x100004052888210uLL);
  self->_maxOnTimesBackOff = (float *)malloc_type_calloc(1uLL, 4 * self->_maxTimeWindows, 0x100004052888210uLL);
  v8 = (float *)malloc_type_calloc(1uLL, 4 * self->_maxTimeWindows, 0x100004052888210uLL);
  self->_maxOnTimesCritical = v8;
  if (!self->_timeWindows || !self->_maxOnTimesNominal || !self->_maxOnTimesBackOff || !v8)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v42 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v42) {
      v42(3, "%s:%i Error allocating buffers.", "-[NFLookbackReaderRestrictor loadCustomDefaults]", 52);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v43 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)v53 = "-[NFLookbackReaderRestrictor loadCustomDefaults]";
      *(_WORD *)&v53[8] = 1024;
      *(_DWORD *)&v53[10] = 52;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%{public}s:%i Error allocating buffers.", buf, 0x12u);
    }

    timeWindows = self->_timeWindows;
    if (timeWindows)
    {
      free(timeWindows);
      self->_timeWindows = 0;
    }
    maxOnTimesNominal = self->_maxOnTimesNominal;
    if (maxOnTimesNominal)
    {
      free(maxOnTimesNominal);
      self->_maxOnTimesNominal = 0;
    }
    maxOnTimesBackOff = self->_maxOnTimesBackOff;
    if (maxOnTimesBackOff)
    {
      free(maxOnTimesBackOff);
      self->_maxOnTimesBackOff = 0;
    }
    maxOnTimesCritical = self->_maxOnTimesCritical;
    if (maxOnTimesCritical)
    {
      free(maxOnTimesCritical);
      BOOL v30 = 0;
      self->_maxOnTimesCritical = 0;
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (self->_maxTimeWindows < 1)
  {
    BOOL v30 = 1;
  }
  else
  {
    v50 = v3;
    uint64_t v9 = 0;
    do
    {
      v10 = [v5 objectAtIndex:v9];
      [v10 floatValue];
      float v12 = v11;

      v13 = [v4 objectAtIndex:v9];
      [v13 floatValue];
      self->_timeWindows[v9] = v14;

      self->_maxOnTimesNominal[v9] = v12;
      self->_maxOnTimesBackOff[v9] = v12;
      self->_maxOnTimesCritical[v9] = 0.0;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v15 = NFLogGetLogger();
      if (v15)
      {
        v16 = (void (*)(uint64_t, const char *, ...))v15;
        v17 = object_getClass(self);
        BOOL v18 = class_isMetaClass(v17);
        v19 = object_getClassName(self);
        v20 = sel_getName(a2);
        uint64_t v22 = 45;
        if (v18) {
          uint64_t v22 = 43;
        }
        float v21 = self->_timeWindows[v9];
        v16(6, "%c[%{public}s %{public}s]:%i Using window of %f seconds with a max ratio of %f", v22, v19, v20, 78, v21, self->_maxOnTimesNominal[v9]);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v23 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = object_getClass(self);
        if (class_isMetaClass(v24)) {
          int v25 = 43;
        }
        else {
          int v25 = 45;
        }
        v26 = object_getClassName(self);
        v27 = sel_getName(a2);
        float v28 = self->_timeWindows[v9];
        double v29 = self->_maxOnTimesNominal[v9];
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)v53 = v25;
        *(_WORD *)&v53[4] = 2082;
        *(void *)&v53[6] = v26;
        __int16 v54 = 2082;
        v55 = v27;
        __int16 v56 = 1024;
        int v57 = 78;
        __int16 v58 = 2048;
        *(double *)v59 = v28;
        *(_WORD *)&v59[8] = 2048;
        double v60 = v29;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Using window of %f seconds with a max ratio of %f", buf, 0x36u);
      }

      ++v9;
    }
    while (v9 < self->_maxTimeWindows);
    BOOL v30 = 1;
    v3 = v50;
  }
LABEL_31:

  return v30;
}

- (BOOL)loadDefaultValues
{
  self->_maxTimeWindows = 3;
  self->_timeWindows = (double *)malloc_type_calloc(1uLL, 0x18uLL, 0x100004000313F17uLL);
  self->_maxOnTimesNominal = (float *)malloc_type_calloc(1uLL, 4 * self->_maxTimeWindows, 0x100004052888210uLL);
  self->_maxOnTimesBackOff = (float *)malloc_type_calloc(1uLL, 4 * self->_maxTimeWindows, 0x100004052888210uLL);
  v3 = (float *)malloc_type_calloc(1uLL, 4 * self->_maxTimeWindows, 0x100004052888210uLL);
  self->_maxOnTimesCritical = v3;
  timeWindows = self->_timeWindows;
  if (timeWindows && self->_maxOnTimesNominal && (self->_maxOnTimesBackOff ? (BOOL v5 = v3 == 0) : (BOOL v5 = 1), !v5))
  {
    *(_OWORD *)timeWindows = xmmword_1002843A8;
    timeWindows[2] = 180.0;
    maxOnTimesNominal = self->_maxOnTimesNominal;
    *(void *)maxOnTimesNominal = 0x3F3333333F4CCCCDLL;
    maxOnTimesNominal[2] = 0.6;
    maxOnTimesBackOff = self->_maxOnTimesBackOff;
    *(void *)maxOnTimesBackOff = 0x3F3333333F4CCCCDLL;
    maxOnTimesBackOff[2] = 0.6;
    maxOnTimesCritical = self->_maxOnTimesCritical;
    *(void *)maxOnTimesCritical = 0;
    maxOnTimesCritical[2] = 0.0;
    LOBYTE(v14) = 1;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Error allocating buffers.", "-[NFLookbackReaderRestrictor loadDefaultValues]", 93);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v7 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "-[NFLookbackReaderRestrictor loadDefaultValues]";
      __int16 v18 = 1024;
      int v19 = 93;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%i Error allocating buffers.", buf, 0x12u);
    }

    v8 = self->_timeWindows;
    if (v8)
    {
      free(v8);
      self->_timeWindows = 0;
    }
    uint64_t v9 = self->_maxOnTimesNominal;
    if (v9)
    {
      free(v9);
      self->_maxOnTimesNominal = 0;
    }
    v10 = self->_maxOnTimesBackOff;
    if (v10)
    {
      free(v10);
      self->_maxOnTimesBackOff = 0;
    }
    float v14 = self->_maxOnTimesCritical;
    if (v14)
    {
      free(v14);
      LOBYTE(v14) = 0;
      self->_maxOnTimesCritical = 0;
    }
  }
  return (char)v14;
}

- (NFLookbackReaderRestrictor)initWithThermalMonitor:(id)a3 delegate:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)NFLookbackReaderRestrictor;
  BOOL v5 = [(NFReaderRestrictor *)&v20 initWithThermalMonitor:a3 delegate:a4];
  if (!v5) {
    goto LABEL_16;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    int v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(v5);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(v5);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i Using lookback mechanism", v11, ClassName, Name, 124);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  float v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = object_getClass(v5);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    uint64_t v15 = object_getClassName(v5);
    v16 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v22 = v14;
    __int16 v23 = 2082;
    v24 = v15;
    __int16 v25 = 2082;
    v26 = v16;
    __int16 v27 = 1024;
    int v28 = 124;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Using lookback mechanism", buf, 0x22u);
  }

  if (NFIsInternalBuild())
  {
    if (![(NFLookbackReaderRestrictor *)v5 loadCustomDefaults]
      && ![(NFLookbackReaderRestrictor *)v5 loadDefaultValues])
    {
      goto LABEL_14;
    }
LABEL_16:
    v17 = v5;
    goto LABEL_17;
  }
  if ([(NFLookbackReaderRestrictor *)v5 loadDefaultValues]) {
    goto LABEL_16;
  }
LABEL_14:
  v17 = 0;
LABEL_17:

  return v17;
}

- (void)dealloc
{
  timeWindows = self->_timeWindows;
  if (timeWindows)
  {
    free(timeWindows);
    self->_timeWindows = 0;
  }
  maxOnTimesNominal = self->_maxOnTimesNominal;
  if (maxOnTimesNominal)
  {
    free(maxOnTimesNominal);
    self->_maxOnTimesNominal = 0;
  }
  maxOnTimesBackOff = self->_maxOnTimesBackOff;
  if (maxOnTimesBackOff)
  {
    free(maxOnTimesBackOff);
    self->_maxOnTimesBackOff = 0;
  }
  maxOnTimesCritical = self->_maxOnTimesCritical;
  if (maxOnTimesCritical)
  {
    free(maxOnTimesCritical);
    self->_maxOnTimesCritical = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)NFLookbackReaderRestrictor;
  [(NFLookbackReaderRestrictor *)&v7 dealloc];
}

- (double)maxOperationTimeSpan
{
  return 350.0;
}

- (double)maxReaderTime
{
  unsigned __int8 v3 = [(NFReaderRestrictor *)self thermalPressureNominal];
  double result = 20.0;
  if ((v3 & 1) == 0)
  {
    unsigned int v5 = [(NFReaderRestrictor *)self thermalPressureBackoff];
    double result = 0.0;
    if (v5) {
      return 7.0;
    }
  }
  return result;
}

- (id)_allOperationsSince:(double)a3 referenceTime:(id)a4
{
  id v6 = a4;
  objc_super v7 = [(NFReaderRestrictor *)self readerOperations];
  v8 = [v7 reverseObjectEnumerator];
  uint64_t v9 = [v8 allObjects];

  v10 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v27;
    while (2)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v15);
        if (v16) {
          v17 = *(void **)(v16 + 8);
        }
        else {
          v17 = 0;
        }
        id v18 = v17;
        [v6 timeIntervalSinceDate:v18];
        double v20 = v19;

        if (v20 > a3)
        {
          if (v16) {
            int v22 = *(void **)(v16 + 16);
          }
          else {
            int v22 = 0;
          }
          id v23 = v22;
          unsigned int v24 = [v23 isEqualToString:@"ReaderStarted"];

          if (v24) {
            [v10 insertObject:v16 atIndex:0];
          }
          goto LABEL_18;
        }
        [v10 insertObject:v16 atIndex:0];
        uint64_t v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v21 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      id v13 = v21;
      if (v21) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  return v10;
}

- (void)_getReaderOnTime:(double *)a3 andOff:(double *)a4 since:(double)a5 referenceTime:(id)a6
{
  id v10 = a6;
  id v11 = [(NFLookbackReaderRestrictor *)self _allOperationsSince:v10 referenceTime:a5];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v37 = a3;
    v38 = a4;
    v39 = v10;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v41;
    float v17 = 0.0;
    float v18 = 0.0;
    do
    {
      double v19 = 0;
      do
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v11);
        }
        uint64_t v20 = *(void *)(*((void *)&v40 + 1) + 8 * (void)v19);
        if (v20) {
          id v21 = *(void **)(v20 + 16);
        }
        else {
          id v21 = 0;
        }
        id v22 = v21;
        unsigned int v23 = [v22 isEqualToString:@"ReaderStarted"];

        if (v23)
        {
          if (v15)
          {
            if (v20) {
              unsigned int v24 = *(void **)(v20 + 8);
            }
            else {
              unsigned int v24 = 0;
            }
            id v25 = v24;
            [v25 timeIntervalSinceDate:v15];
            float v17 = v26 + v17;
          }
          if (v20)
          {
            uint64_t v15 = 0;
            long long v27 = *(void **)(v20 + 8);
            long long v28 = v14;
            uint64_t v14 = v27;
          }
          else
          {
            long long v27 = 0;
            uint64_t v15 = 0;
            long long v28 = v14;
            uint64_t v14 = 0;
          }
        }
        else
        {
          if (v14)
          {
            if (v20) {
              long long v29 = *(void **)(v20 + 8);
            }
            else {
              long long v29 = 0;
            }
            id v30 = v29;
            [v30 timeIntervalSinceDate:v14];
            float v18 = v31 + v18;
          }
          if (v20)
          {
            uint64_t v14 = 0;
            long long v27 = *(void **)(v20 + 8);
            long long v28 = v15;
            uint64_t v15 = v27;
          }
          else
          {
            long long v27 = 0;
            uint64_t v14 = 0;
            long long v28 = v15;
            uint64_t v15 = 0;
          }
        }
        id v32 = v27;

        double v19 = (char *)v19 + 1;
      }
      while (v13 != v19);
      id v33 = [v11 countByEnumeratingWithState:&v40 objects:v44 count:16];
      id v13 = v33;
    }
    while (v33);
    id v10 = v39;
    if (v14)
    {
      [v39 timeIntervalSinceDate:v14];
      float v18 = v34 + v18;
    }
    a3 = v37;
    a4 = v38;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v14 = 0;
    float v17 = 0.0;
    float v18 = 0.0;
  }
  if ((float)(v17 + v18) >= a5)
  {
    float v36 = v17;
  }
  else
  {
    float v35 = a5 - v18;
    float v36 = v35;
  }
  *a3 = v18;
  *a4 = v36;
}

- (float)getMaxOnTimeAtIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->_maxTimeWindows <= a3)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i Error : invalid index %d", v12, ClassName, Name, 244, v3);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v19 = v15;
      __int16 v20 = 2082;
      id v21 = object_getClassName(self);
      __int16 v22 = 2082;
      unsigned int v23 = sel_getName(a2);
      __int16 v24 = 1024;
      int v25 = 244;
      __int16 v26 = 1024;
      int v27 = v3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error : invalid index %d", buf, 0x28u);
    }

    return 0.0;
  }
  else if ([(NFReaderRestrictor *)self thermalPressureCritical])
  {
    return self->_maxOnTimesCritical[(int)v3];
  }
  else
  {
    if ([(NFReaderRestrictor *)self thermalPressureBackoff]) {
      uint64_t v16 = 88;
    }
    else {
      uint64_t v16 = 80;
    }
    return (*(float **)((char *)&self->super.super.isa + v16))[(int)v3];
  }
}

- (double)getCooloffTime
{
  v18.receiver = self;
  v18.super_class = (Class)NFLookbackReaderRestrictor;
  uint64_t v3 = [(NFReaderRestrictor *)&v18 currentTestTime];
  if (v3)
  {
    v17.receiver = self;
    v17.super_class = (Class)NFLookbackReaderRestrictor;
    uint64_t v4 = [(NFReaderRestrictor *)&v17 currentTestTime];
  }
  else
  {
    uint64_t v4 = +[NSDate dateWithTimeIntervalSinceNow:0.0];
  }
  unsigned int v5 = (void *)v4;

  if (self->_maxTimeWindows < 1)
  {
    double v7 = 0.0;
  }
  else
  {
    uint64_t v6 = 0;
    double v7 = 0.0;
    while (1)
    {
      double v8 = self->_timeWindows[v6];
      [(NFLookbackReaderRestrictor *)self getMaxOnTimeAtIndex:v6];
      double v15 = 0.0;
      double v16 = 0.0;
      if (v9 == 0.0) {
        break;
      }
      float v10 = v9;
      [(NFLookbackReaderRestrictor *)self _getReaderOnTime:&v16 andOff:&v15 since:v5 referenceTime:v8];
      if (v16 != 0.0)
      {
        if (v16 / v10 - (v16 + v15) >= 1.0) {
          double v11 = v16 / v10 - (v16 + v15);
        }
        else {
          double v11 = 0.0;
        }
        if (v11 != 0.0)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (Logger) {
            Logger(6, "%s:%i Cooloff of %f required for window %d", "-[NFLookbackReaderRestrictor getCooloffTime]", 291, *(void *)&v11, v6);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          id v13 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446978;
            __int16 v20 = "-[NFLookbackReaderRestrictor getCooloffTime]";
            __int16 v21 = 1024;
            int v22 = 291;
            __int16 v23 = 2048;
            double v24 = v11;
            __int16 v25 = 1024;
            int v26 = v6;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Cooloff of %f required for window %d", buf, 0x22u);
          }
        }
        if (v11 > v7) {
          double v7 = v11;
        }
      }
      if (++v6 >= self->_maxTimeWindows) {
        goto LABEL_23;
      }
    }
    double v7 = 315360000.0;
  }
LABEL_23:

  return v7;
}

- (id)description
{
  v25.receiver = self;
  v25.super_class = (Class)NFLookbackReaderRestrictor;
  uint64_t v3 = [(NFReaderRestrictor *)&v25 description];
  uint64_t v4 = +[NSMutableString stringWithString:v3];

  v24.receiver = self;
  v24.super_class = (Class)NFLookbackReaderRestrictor;
  unsigned int v5 = [(NFReaderRestrictor *)&v24 currentTestTime];
  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)NFLookbackReaderRestrictor;
    uint64_t v6 = [(NFReaderRestrictor *)&v23 currentTestTime];
  }
  else
  {
    uint64_t v6 = +[NSDate dateWithTimeIntervalSinceNow:0.0];
  }
  double v7 = (void *)v6;

  [v4 appendFormat:@"\n\t Time Windows = {"];
  if (self->_maxTimeWindows >= 1)
  {
    uint64_t v8 = 0;
    do
      [v4 appendFormat:@"%f, ", *(void *)&self->_timeWindows[v8++]];
    while (v8 < self->_maxTimeWindows);
  }
  [v4 appendFormat:@"}\n"];
  [v4 appendFormat:@"\t Nominal Windows = {"];
  if (self->_maxTimeWindows >= 1)
  {
    uint64_t v9 = 0;
    do
      [v4 appendFormat:@"%f, ", self->_maxOnTimesNominal[v9++]];
    while (v9 < self->_maxTimeWindows);
  }
  [v4 appendFormat:@"}\n"];
  [v4 appendFormat:@"\t Backoff Windows = {"];
  if (self->_maxTimeWindows >= 1)
  {
    uint64_t v10 = 0;
    do
      [v4 appendFormat:@"%f, ", self->_maxOnTimesBackOff[v10++]];
    while (v10 < self->_maxTimeWindows);
  }
  [v4 appendFormat:@"}\n"];
  if ([(NFReaderRestrictor *)self thermalPressureCritical])
  {
    CFStringRef v11 = @"\t Current window = Critical\n";
  }
  else if ([(NFReaderRestrictor *)self thermalPressureBackoff])
  {
    CFStringRef v11 = @"\t Current window = Backoff\n";
  }
  else
  {
    CFStringRef v11 = @"\t Current window = Nominal\n";
  }
  [v4 appendFormat:v11];
  [v4 appendFormat:@"\t Current Windows state = {\n"];
  if (self->_maxTimeWindows >= 1)
  {
    uint64_t v12 = 0;
    do
    {
      double v13 = self->_timeWindows[v12];
      double v21 = 0.0;
      double v22 = 0.0;
      unsigned __int8 v14 = [(NFReaderRestrictor *)self thermalPressureCritical];
      double v15 = &OBJC_IVAR___NFLookbackReaderRestrictor__maxOnTimesCritical;
      if ((v14 & 1) == 0)
      {
        unsigned int v16 = [(NFReaderRestrictor *)self thermalPressureBackoff];
        uint64_t v17 = 2;
        if (v16) {
          uint64_t v17 = 3;
        }
        double v15 = &OBJC_IVAR___NFLookbackReaderRestrictor__maxTimeWindows[v17];
      }
      if ((*(float **)((char *)&self->super.super.isa + *v15))[v12] == 0.0) {
        break;
      }
      [(NFLookbackReaderRestrictor *)self _getReaderOnTime:&v22 andOff:&v21 since:v7 referenceTime:v13];
      if (v22 + v21 != 0.0)
      {
        float v18 = v22 / (v22 + v21);
        [v4 appendFormat:@"\t\t Window Size = %f, ON = %f, off = %f, total = %f, ratio = %f\n", *(void *)&v13, *(void *)&v22, *(void *)&v21, v22 + v21, v18];
      }
      ++v12;
    }
    while (v12 < self->_maxTimeWindows);
  }
  [v4 appendFormat:@"}\n"];
  int v19 = [(NFReaderRestrictor *)self readerOperations];
  [v4 appendFormat:@"\t Operations = %@", v19];

  return v4;
}

@end