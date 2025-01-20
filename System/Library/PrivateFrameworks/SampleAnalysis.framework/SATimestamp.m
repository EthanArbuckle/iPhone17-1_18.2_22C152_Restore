@interface SATimestamp
+ (SATimestamp)timestampWithMachAbsTime:(unint64_t)a3 machAbsTimeSec:(double)a4 machContTime:(unint64_t)a5 machContTimeSec:(double)a6 wallTime:(double)a7;
+ (SATimestamp)timestampWithMachAbsTime:(unint64_t)a3 machContTime:(unint64_t)a4 wallTime:(double)a5 machTimebase:(mach_timebase_info)a6;
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (id)now;
+ (id)timestampWithKTraceEvent:(uint64_t)a1 fromSession:(uint64_t)a2;
+ (id)timestampWithMachAbsTime:(uint64_t)a1 fromKtraceSession:(uint64_t)a2;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)eq:(id)a3;
- (BOOL)ge:(id)a3;
- (BOOL)gt:(id)a3;
- (BOOL)isComparable:(id)a3;
- (BOOL)isEqualToTimestamp:(id)a3;
- (BOOL)le:(id)a3;
- (BOOL)lt:(id)a3;
- (BOOL)ne:(id)a3;
- (NSString)debugDescription;
- (SATimestamp)initWithMachAbsTime:(unint64_t)a3 machAbsTimeSec:(double)a4 machContTime:(unint64_t)a5 machContTimeSec:(double)a6 wallTime:(double)a7;
- (double)deltaSecondsTo:(id)a3 timeDomainPriorityList:(id)a4 timeDomainUsed:(unint64_t *)a5;
- (double)machAbsTimeSeconds;
- (double)machContTimeSeconds;
- (double)wallTime;
- (id)copyDate;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)compare:(id)a3;
- (int64_t)deltaMachTo:(id)a3 timeDomainPriorityList:(id)a4 timeDomainUsed:(unint64_t *)a5;
- (uint64_t)applyMachTimebase:(uint64_t)result;
- (unint64_t)machAbsTime;
- (unint64_t)machContTime;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)guessMissingTimesBasedOnCurrentTime;
- (void)guessMissingTimesBasedOnTimestamp:(id)a3;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SATimestamp

- (BOOL)ge:(id)a3
{
  return [(SATimestamp *)self compare:a3] != -1;
}

- (SATimestamp)initWithMachAbsTime:(unint64_t)a3 machAbsTimeSec:(double)a4 machContTime:(unint64_t)a5 machContTimeSec:(double)a6 wallTime:(double)a7
{
  v13.receiver = self;
  v13.super_class = (Class)SATimestamp;
  result = [(SATimestamp *)&v13 init];
  if (result)
  {
    result->_machAbsTime = a3;
    result->_machAbsTimeSeconds = a4;
    result->_machContTime = a5;
    result->_machContTimeSeconds = a6;
    result->_wallTime = a7;
  }
  return result;
}

- (BOOL)le:(id)a3
{
  return [(SATimestamp *)self compare:a3] != 1;
}

- (int64_t)compare:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self == a3) {
    return 0;
  }
  unint64_t machAbsTime = self->_machAbsTime;
  if (machAbsTime && (unint64_t v4 = *((void *)a3 + 1)) != 0
    || (unint64_t machAbsTime = self->_machContTime) != 0 && (v4 = *((void *)a3 + 3)) != 0)
  {
    BOOL v5 = machAbsTime > v4;
    if (machAbsTime >= v4) {
      int64_t v6 = 0;
    }
    else {
      int64_t v6 = -1;
    }
    if (v5) {
      return 1;
    }
    else {
      return v6;
    }
  }
  else
  {
    double machAbsTimeSeconds = self->_machAbsTimeSeconds;
    if ((machAbsTimeSeconds == 0.0 || (double v9 = *((double *)a3 + 2), v9 == 0.0))
      && ((double machAbsTimeSeconds = self->_machContTimeSeconds, machAbsTimeSeconds == 0.0)
       || (double v9 = *((double *)a3 + 4), v9 == 0.0))
      && ((double machAbsTimeSeconds = self->_wallTime, machAbsTimeSeconds == 0.0) || (v9 = *((double *)a3 + 5), v9 == 0.0)))
    {
      int v11 = *__error();
      v12 = _sa_logt();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = [(SATimestamp *)self debugDescription];
        uint64_t v14 = [v13 UTF8String];
        id v15 = [a3 debugDescription];
        *(_DWORD *)buf = 136315394;
        uint64_t v28 = v14;
        __int16 v29 = 2080;
        uint64_t v30 = [v15 UTF8String];
        _os_log_error_impl(&dword_1BF22B000, v12, OS_LOG_TYPE_ERROR, "Incomparable timestamps: %s vs %s", buf, 0x16u);
      }
      *__error() = v11;
      id v16 = [(SATimestamp *)self debugDescription];
      char v17 = [v16 UTF8String];
      id v18 = [a3 debugDescription];
      [v18 UTF8String];
      _SASetCrashLogMessage(173, "Incomparable timestamps: %s vs %s", v19, v20, v21, v22, v23, v24, v17);

      int64_t result = _os_crash();
      __break(1u);
    }
    else
    {
      if (machAbsTimeSeconds >= v9) {
        int64_t v10 = 0;
      }
      else {
        int64_t v10 = -1;
      }
      if (machAbsTimeSeconds <= v9) {
        return v10;
      }
      else {
        return 1;
      }
    }
  }
  return result;
}

+ (SATimestamp)timestampWithMachAbsTime:(unint64_t)a3 machContTime:(unint64_t)a4 wallTime:(double)a5 machTimebase:(mach_timebase_info)a6
{
  unint64_t v10 = 0;
  double v11 = 0.0;
  if (a6.numer && a6.denom)
  {
    if (a6.numer == a6.denom)
    {
      double v11 = (double)a3 / 1000000000.0;
      unint64_t v10 = a4;
    }
    else
    {
      double v11 = (double)(unint64_t)__udivti3() / 1000000000.0;
      unint64_t v10 = __udivti3();
    }
  }
  return (SATimestamp *)[a1 timestampWithMachAbsTime:a3 machAbsTimeSec:a4 machContTime:v11 machContTimeSec:(double)v10 / 1000000000.0 wallTime:a5];
}

- (unint64_t)machContTime
{
  return self->_machContTime;
}

+ (SATimestamp)timestampWithMachAbsTime:(unint64_t)a3 machAbsTimeSec:(double)a4 machContTime:(unint64_t)a5 machContTimeSec:(double)a6 wallTime:(double)a7
{
  v7 = (void *)[objc_alloc((Class)a1) initWithMachAbsTime:a3 machAbsTimeSec:a5 machContTime:a4 machContTimeSec:a6 wallTime:a7];
  return (SATimestamp *)v7;
}

+ (id)timestampWithKTraceEvent:(uint64_t)a1 fromSession:(uint64_t)a2
{
  v3 = self;
  uint64_t absolute_from_timestamp = ktrace_get_absolute_from_timestamp();
  uint64_t continuous_from_timestamp = ktrace_get_continuous_from_timestamp();
  uint64_t ns_from_timestamp = ktrace_get_ns_from_timestamp();
  uint64_t v7 = ktrace_get_ns_from_timestamp();
  uint64_t v8 = *(void *)(a2 + 56);
  if (v8)
  {
    double v9 = (double)v8;
    double v10 = (double)*(int *)(a2 + 64);
    double v11 = 1000000.0;
LABEL_3:
    double v12 = v10 / v11 + v9 - *MEMORY[0x1E4F1CF78];
    goto LABEL_5;
  }
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  int v13 = ktrace_convert_timestamp_to_walltime();
  double v12 = 0.0;
  if (!v13)
  {
    double v9 = (double)0;
    double v10 = (double)0;
    double v11 = 1000000000.0;
    goto LABEL_3;
  }
LABEL_5:
  uint64_t v14 = objc_msgSend(v3, "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:", absolute_from_timestamp, continuous_from_timestamp, (double)(unint64_t)ns_from_timestamp / 1000000000.0, (double)(unint64_t)v7 / 1000000000.0, v12, v16, v17);
  return v14;
}

+ (id)timestampWithMachAbsTime:(uint64_t)a1 fromKtraceSession:(uint64_t)a2
{
  self;
  uint64_t ns_from_timestamp = ktrace_get_ns_from_timestamp();
  uint64_t continuous_from_absolute = ktrace_get_continuous_from_absolute();
  uint64_t v5 = ktrace_get_ns_from_timestamp();
  int v6 = ktrace_convert_absolute_to_walltime();
  double v7 = 0.0;
  if (!v6) {
    double v7 = (double)0 - *MEMORY[0x1E4F1CF78] + (double)0 / 1000000000.0;
  }
  uint64_t v8 = +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:](SATimestamp, "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:", a2, continuous_from_absolute, (double)(unint64_t)ns_from_timestamp / 1000000000.0, (double)(unint64_t)v5 / 1000000000.0, v7, 0, 0);
  return v8;
}

+ (id)now
{
  mach_get_times();
  double v3 = *MEMORY[0x1E4F1CF78];
  if (_MergedGlobals_7 != -1) {
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_9);
  }
  unint64_t v4 = objc_msgSend(a1, "timestampWithMachAbsTime:machContTime:wallTime:machTimebase:", 0, 0, qword_1EB699210, (double)0 - v3 + (double)0 / 1000000000.0, 0, 0, 0, 0);
  return v4;
}

- (BOOL)isComparable:(id)a3
{
  unint64_t v4 = (SATimestamp *)a3;
  BOOL v5 = self == v4
    || self->_machAbsTime && v4->_machAbsTime
    || self->_machContTime && v4->_machContTime
    || self->_machAbsTimeSeconds != 0.0 && v4->_machAbsTimeSeconds != 0.0
    || self->_machContTimeSeconds != 0.0 && v4->_machContTimeSeconds != 0.0
    || self->_wallTime != 0.0 && v4->_wallTime != 0.0;

  return v5;
}

- (double)deltaSecondsTo:(id)a3 timeDomainPriorityList:(id)a4 timeDomainUsed:(unint64_t *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = a4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v35;
    *(void *)&long long v11 = 134217984;
    long long v33 = v11;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "unsignedLongLongValue", v33, (void)v34);
        switch(v16)
        {
          case 16:
            [(SATimestamp *)self machContTimeSeconds];
            if (v19 != 0.0)
            {
              [v8 machContTimeSeconds];
              if (v20 != 0.0)
              {
                if (a5) {
                  *a5 = 16;
                }
                [v8 machContTimeSeconds];
                double v28 = v30;
                [(SATimestamp *)self machContTimeSeconds];
                goto LABEL_34;
              }
            }
            break;
          case 4:
            [(SATimestamp *)self machAbsTimeSeconds];
            if (v21 != 0.0)
            {
              [v8 machAbsTimeSeconds];
              if (v22 != 0.0)
              {
                if (a5) {
                  *a5 = 4;
                }
                [v8 machAbsTimeSeconds];
                double v28 = v31;
                [(SATimestamp *)self machAbsTimeSeconds];
                goto LABEL_34;
              }
            }
            break;
          case 1:
            [(SATimestamp *)self wallTime];
            if (v17 != 0.0)
            {
              [v8 wallTime];
              if (v18 != 0.0)
              {
                if (a5) {
                  *a5 = 1;
                }
                [v8 wallTime];
                double v28 = v27;
                [(SATimestamp *)self wallTime];
LABEL_34:
                double v26 = v28 - v29;

                goto LABEL_35;
              }
            }
            break;
          default:
            int v23 = *__error();
            uint64_t v24 = _sa_logt();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            {
              uint64_t v25 = [v15 unsignedLongLongValue];
              *(_DWORD *)buf = v33;
              uint64_t v39 = v25;
              _os_log_fault_impl(&dword_1BF22B000, v24, OS_LOG_TYPE_FAULT, "Invalid time domain 0x%llx", buf, 0xCu);
            }

            *__error() = v23;
            break;
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  double v26 = 0.0;
  if (a5) {
    *a5 = 0;
  }
LABEL_35:

  return v26;
}

- (int64_t)deltaMachTo:(id)a3 timeDomainPriorityList:(id)a4 timeDomainUsed:(unint64_t *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = a4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v26;
    *(void *)&long long v11 = 134217984;
    long long v24 = v11;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "unsignedLongLongValue", v24, (void)v25);
        if (v16 == 2)
        {
          if (-[SATimestamp machAbsTime](self, "machAbsTime") && [v8 machAbsTime])
          {
            if (a5) {
              *a5 = 2;
            }
            uint64_t v21 = [v8 machAbsTime];
            unint64_t v22 = [(SATimestamp *)self machAbsTime];
            goto LABEL_27;
          }
        }
        else if (v16 == 8)
        {
          if (-[SATimestamp machContTime](self, "machContTime") && [v8 machContTime])
          {
            if (a5) {
              *a5 = 8;
            }
            uint64_t v21 = [v8 machContTime];
            unint64_t v22 = [(SATimestamp *)self machContTime];
LABEL_27:
            int64_t v20 = v21 - v22;

            goto LABEL_28;
          }
        }
        else
        {
          int v17 = *__error();
          double v18 = _sa_logt();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            uint64_t v19 = [v15 unsignedLongLongValue];
            *(_DWORD *)buf = v24;
            uint64_t v30 = v19;
            _os_log_fault_impl(&dword_1BF22B000, v18, OS_LOG_TYPE_FAULT, "Invalid time domain 0x%llx", buf, 0xCu);
          }

          *__error() = v17;
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  int64_t v20 = 0;
  if (a5) {
    *a5 = 0;
  }
LABEL_28:

  return v20;
}

- (BOOL)lt:(id)a3
{
  return [(SATimestamp *)self compare:a3] == -1;
}

- (BOOL)gt:(id)a3
{
  return [(SATimestamp *)self compare:a3] == 1;
}

- (BOOL)eq:(id)a3
{
  return [(SATimestamp *)self compare:a3] == 0;
}

- (BOOL)ne:(id)a3
{
  return [(SATimestamp *)self compare:a3] != 0;
}

- (BOOL)isEqualToTimestamp:(id)a3
{
  unint64_t v4 = (SATimestamp *)a3;
  BOOL v5 = self == v4
    || self->_machAbsTime == v4->_machAbsTime
    && self->_machContTime == v4->_machContTime
    && self->_wallTime == v4->_wallTime;

  return v5;
}

- (void)guessMissingTimesBasedOnTimestamp:(id)a3
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_machAbsTime
    || self->_machAbsTimeSeconds == 0.0
    || !self->_machContTime
    || self->_machContTimeSeconds == 0.0
    || self->_wallTime == 0.0)
  {
    uint64_t v121 = 0;
    v122 = &v121;
    uint64_t v123 = 0x2810000000;
    v124 = &unk_1BF343D4B;
    uint64_t v125 = 0;
    uint64_t v117 = 0;
    v118 = (double *)&v117;
    uint64_t v119 = 0x2020000000;
    uint64_t v120 = 0;
    v112[0] = MEMORY[0x1E4F143A8];
    v112[1] = 3221225472;
    v112[2] = __49__SATimestamp_guessMissingTimesBasedOnTimestamp___block_invoke;
    v112[3] = &unk_1E63F8F60;
    v115 = &v117;
    id v87 = v4;
    id v5 = v4;
    id v113 = v5;
    v114 = self;
    v116 = &v121;
    int v6 = (void (**)(void))MEMORY[0x1C18A6C80](v112);
    v6[2]();
    uint64_t v108 = 0;
    v109 = (double *)&v108;
    uint64_t v110 = 0x2020000000;
    uint64_t v111 = 0;
    uint64_t v104 = 0;
    v105 = &v104;
    uint64_t v106 = 0x2020000000;
    char v107 = 0;
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __49__SATimestamp_guessMissingTimesBasedOnTimestamp___block_invoke_4;
    v100[3] = &unk_1E63F8F60;
    v102 = &v104;
    v100[4] = self;
    id v7 = v5;
    id v101 = v7;
    v103 = &v108;
    id v8 = (void (**)(void))MEMORY[0x1C18A6C80](v100);
    v8[2]();
    uint64_t v96 = 0;
    v97 = &v96;
    uint64_t v98 = 0x2020000000;
    uint64_t v99 = 0;
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x2020000000;
    char v95 = 0;
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __49__SATimestamp_guessMissingTimesBasedOnTimestamp___block_invoke_2;
    v88[3] = &unk_1E63F8F60;
    v90 = &v92;
    v88[4] = self;
    id v9 = (double *)v7;
    v89 = v9;
    v91 = &v96;
    uint64_t v10 = (void (**)(void))MEMORY[0x1C18A6C80](v88);
    v10[2]();
    long long v11 = 0;
    while (1)
    {
      if (v118[3] == 0.0)
      {
        char v16 = 0;
        goto LABEL_84;
      }
      double machAbsTimeSeconds = self->_machAbsTimeSeconds;
      if (!self->_machAbsTime)
      {
        if (machAbsTimeSeconds == 0.0)
        {
LABEL_32:
          char v16 = 0;
          goto LABEL_51;
        }
        if (!v11) {
          long long v11 = (SATimestamp *)[(SATimestamp *)self copy];
        }
        int v17 = v122;
        if (*((_DWORD *)v122 + 8))
        {
          double v18 = self->_machAbsTimeSeconds;
          if (*((_DWORD *)v122 + 9))
          {
            uint64_t v19 = v122[4];
            if (v19) {
              BOOL v20 = HIDWORD(v19) == 0;
            }
            else {
              BOOL v20 = 1;
            }
            if (v20)
            {
              unint64_t v21 = 0;
            }
            else
            {
              unint64_t v21 = (unint64_t)(v18 * 1000000000.0);
              if (HIDWORD(v19) != v19) {
                unint64_t v21 = __udivti3();
              }
            }
            unint64_t v24 = 0;
            self->_unint64_t machAbsTime = v21;
            uint64_t v25 = v17[4];
            if (v25)
            {
              double v23 = 1000000000.0;
              if (HIDWORD(v25))
              {
                if (v25 != HIDWORD(v25)) {
                  unint64_t v21 = __udivti3();
                }
                unint64_t v24 = v21;
                goto LABEL_48;
              }
            }
            else
            {
LABEL_48:
              double v23 = 1000000000.0;
            }
LABEL_49:
            self->_double machAbsTimeSeconds = (double)v24 / v23;
            ((void (*)(void (**)(void)))v6[2])(v6);
            ((void (*)(void (**)(void)))v8[2])(v8);
            ((void (*)(void (**)(void)))v10[2])(v10);
            goto LABEL_50;
          }
        }
        else
        {
          double v18 = self->_machAbsTimeSeconds;
        }
        double v23 = v118[3];
        unint64_t v24 = (unint64_t)(v18 * v23);
        self->_unint64_t machAbsTime = v24;
        goto LABEL_49;
      }
      if (machAbsTimeSeconds != 0.0) {
        goto LABEL_32;
      }
      if (!v11) {
        long long v11 = (SATimestamp *)[(SATimestamp *)self copy];
      }
      if (*((_DWORD *)v122 + 8))
      {
        unint64_t machAbsTime = self->_machAbsTime;
        if (*((_DWORD *)v122 + 9))
        {
          uint64_t v14 = v122[4];
          if (v14) {
            BOOL v15 = HIDWORD(v14) == 0;
          }
          else {
            BOOL v15 = 1;
          }
          if (v15)
          {
            unint64_t machAbsTime = 0;
          }
          else if (v14 != HIDWORD(v14))
          {
            unint64_t machAbsTime = __udivti3();
          }
          double v22 = (double)machAbsTime / 1000000000.0;
          goto LABEL_40;
        }
      }
      else
      {
        unint64_t machAbsTime = self->_machAbsTime;
      }
      double v22 = (double)machAbsTime / v118[3];
LABEL_40:
      self->_double machAbsTimeSeconds = v22;
      ((void (*)(void (**)(void)))v6[2])(v6);
      ((void (*)(void (**)(void)))v8[2])(v8);
      ((void (*)(void (**)(void)))v10[2])(v10);
LABEL_50:
      char v16 = 1;
LABEL_51:
      double machContTimeSeconds = self->_machContTimeSeconds;
      if (!self->_machContTime)
      {
        if (machContTimeSeconds == 0.0) {
          goto LABEL_84;
        }
        if (!v11) {
          long long v11 = (SATimestamp *)[(SATimestamp *)self copy];
        }
        double v31 = v122;
        if (*((_DWORD *)v122 + 8))
        {
          double v32 = self->_machContTimeSeconds;
          if (*((_DWORD *)v122 + 9))
          {
            unint64_t v33 = 0;
            uint64_t v34 = v122[4];
            if (v34)
            {
              if (HIDWORD(v34))
              {
                unint64_t v33 = (unint64_t)(v32 * 1000000000.0);
                if (HIDWORD(v34) != v34) {
                  unint64_t v33 = __udivti3();
                }
              }
            }
            unint64_t v35 = 0;
            self->_unint64_t machContTime = v33;
            uint64_t v36 = v31[4];
            if (v36)
            {
              double v37 = 1000000000.0;
              if (HIDWORD(v36))
              {
                if (v36 != HIDWORD(v36)) {
                  unint64_t v33 = __udivti3();
                }
                unint64_t v35 = v33;
                goto LABEL_76;
              }
            }
            else
            {
LABEL_76:
              double v37 = 1000000000.0;
            }
LABEL_82:
            self->_double machContTimeSeconds = (double)v35 / v37;
            ((void (*)(void (**)(void)))v6[2])(v6);
            ((void (*)(void (**)(void)))v8[2])(v8);
            ((void (*)(void (**)(void)))v10[2])(v10);
            goto LABEL_83;
          }
        }
        else
        {
          double v32 = self->_machContTimeSeconds;
        }
        double v37 = v118[3];
        unint64_t v35 = (unint64_t)(v32 * v37);
        self->_unint64_t machContTime = v35;
        goto LABEL_82;
      }
      if (machContTimeSeconds != 0.0) {
        goto LABEL_84;
      }
      if (!v11) {
        long long v11 = (SATimestamp *)[(SATimestamp *)self copy];
      }
      if (*((_DWORD *)v122 + 8))
      {
        unint64_t machContTime = self->_machContTime;
        if (*((_DWORD *)v122 + 9))
        {
          unint64_t v28 = 0;
          uint64_t v29 = v122[4];
          if (v29)
          {
            if (HIDWORD(v29))
            {
              unint64_t v28 = self->_machContTime;
              if (v29 != HIDWORD(v29)) {
                unint64_t v28 = __udivti3();
              }
            }
          }
          double v30 = (double)v28 / 1000000000.0;
          goto LABEL_79;
        }
      }
      else
      {
        unint64_t machContTime = self->_machContTime;
      }
      double v30 = (double)machContTime / v118[3];
LABEL_79:
      self->_double machContTimeSeconds = v30;
      ((void (*)(void (**)(void)))v6[2])(v6);
      ((void (*)(void (**)(void)))v8[2])(v8);
      ((void (*)(void (**)(void)))v10[2])(v10);
LABEL_83:
      char v16 = 1;
LABEL_84:
      if (!*((unsigned char *)v93 + 24)) {
        goto LABEL_89;
      }
      if (!self->_machAbsTime)
      {
        uint64_t v40 = *((void *)v9 + 1);
        if (v40)
        {
          unint64_t v41 = v97[3] + v40;
          if (v41 > self->_machContTime)
          {
            int v42 = *__error();
            v43 = _sa_logt();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              unint64_t v83 = v97[3];
              if (v11) {
                v59 = v11;
              }
              else {
                v59 = self;
              }
              v86 = [(SATimestamp *)v59 debugDescription];
              uint64_t v60 = [v9 debugDescription];
              *(_DWORD *)buf = 134218498;
              unint64_t v127 = v83;
              __int16 v128 = 2114;
              double v129 = *(double *)&v86;
              __int16 v130 = 2114;
              uint64_t v131 = v60;
              v84 = (void *)v60;
              _os_log_debug_impl(&dword_1BF22B000, v43, OS_LOG_TYPE_DEBUG, "guessing missing timestamps: underflowed mach abs time with delta %llu:\n%{public}@ based on\n%{public}@", buf, 0x20u);
            }
            *__error() = v42;
            goto LABEL_86;
          }
          if (!v11)
          {
            long long v11 = (SATimestamp *)[(SATimestamp *)self copy];
            unint64_t v41 = v97[3] + *((void *)v9 + 1);
          }
          self->_unint64_t machAbsTime = v41;
          double v54 = v118[3];
          if (v54 != 0.0)
          {
            if (*((_DWORD *)v122 + 8) && *((_DWORD *)v122 + 9))
            {
              uint64_t v55 = 0;
              uint64_t v56 = v122[4];
              if (!v56) {
                goto LABEL_140;
              }
              double v54 = 1000000000.0;
              if (HIDWORD(v56))
              {
                if (v56 == HIDWORD(v56)) {
                  uint64_t v55 = v41;
                }
                else {
                  uint64_t v55 = __udivti3();
                }
LABEL_140:
                double v54 = 1000000000.0;
              }
            }
            else
            {
              uint64_t v55 = v41;
            }
            self->_double machAbsTimeSeconds = (double)(unint64_t)v55 / v54;
          }
          ((void (*)(void (**)(void)))v6[2])(v6);
          ((void (*)(void (**)(void)))v8[2])(v8);
          ((void (*)(void (**)(void)))v10[2])(v10);
          char v16 = 1;
        }
      }
LABEL_86:
      if (self->_machContTime || (uint64_t v44 = *((void *)v9 + 3)) == 0)
      {
        if ((v16 & 1) == 0)
        {
          char v16 = 0;
          if (!*((unsigned char *)v105 + 24)) {
            goto LABEL_124;
          }
LABEL_89:
          if (self->_machAbsTimeSeconds == 0.0)
          {
            double v38 = v9[2];
            if (v38 != 0.0)
            {
              double v39 = v38 + v109[3];
              if (v39 <= 0.0)
              {
                int v49 = *__error();
                v50 = _sa_logt();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
                {
                  unint64_t v81 = *((void *)v109 + 3);
                  if (v11) {
                    v57 = v11;
                  }
                  else {
                    v57 = self;
                  }
                  v85 = [(SATimestamp *)v57 debugDescription];
                  uint64_t v58 = [v9 debugDescription];
                  *(_DWORD *)buf = 134218498;
                  unint64_t v127 = v81;
                  __int16 v128 = 2114;
                  double v129 = *(double *)&v85;
                  __int16 v130 = 2114;
                  uint64_t v131 = v58;
                  v82 = (void *)v58;
                  _os_log_debug_impl(&dword_1BF22B000, v50, OS_LOG_TYPE_DEBUG, "guessing missing timestamps: underflowed mach abs time seconds with delta %f:\n%{public}@ based on\n%{public}@", buf, 0x20u);
                }
                *__error() = v49;
              }
              else
              {
                if (!v11)
                {
                  long long v11 = (SATimestamp *)[(SATimestamp *)self copy];
                  double v39 = v9[2] + v109[3];
                }
                self->_double machAbsTimeSeconds = v39;
                ((void (*)(void (**)(void)))v6[2])(v6);
                ((void (*)(void (**)(void)))v8[2])(v8);
                ((void (*)(void (**)(void)))v10[2])(v10);
                char v16 = 1;
              }
            }
          }
          if (self->_machContTimeSeconds == 0.0)
          {
            double v51 = v9[4];
            if (v51 != 0.0)
            {
              double v52 = v51 + v109[3];
              if (v52 > 0.0)
              {
                if (!v11)
                {
                  long long v11 = (SATimestamp *)[(SATimestamp *)self copy];
                  double v52 = v9[4] + v109[3];
                }
                self->_double machContTimeSeconds = v52;
                ((void (*)(void (**)(void)))v6[2])(v6);
                ((void (*)(void (**)(void)))v8[2])(v8);
                ((void (*)(void (**)(void)))v10[2])(v10);
                char v16 = 1;
              }
            }
          }
          if (self->_wallTime == 0.0 && (double v53 = v9[5], v53 != 0.0))
          {
            if (!v11)
            {
              long long v11 = (SATimestamp *)[(SATimestamp *)self copy];
              double v53 = v9[5];
            }
            self->_wallTime = v53 + v109[3];
            ((void (*)(void (**)(void)))v6[2])(v6);
            ((void (*)(void (**)(void)))v8[2])(v8);
            ((void (*)(void (**)(void)))v10[2])(v10);
          }
          else
          {
LABEL_124:
            if ((v16 & 1) == 0)
            {
              if (self->_machAbsTime || self->_machAbsTimeSeconds == 0.0)
              {
                if (self->_machContTime || self->_machContTimeSeconds == 0.0)
                {

                  _Block_object_dispose(&v92, 8);
                  _Block_object_dispose(&v96, 8);

                  _Block_object_dispose(&v104, 8);
                  _Block_object_dispose(&v108, 8);

                  _Block_object_dispose(&v117, 8);
                  _Block_object_dispose(&v121, 8);

                  id v4 = v87;
                  break;
                }
              }
              else
              {
                int v61 = *__error();
                v62 = _sa_logt();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                {
                  unint64_t v63 = self->_machAbsTime;
                  double v64 = self->_machAbsTimeSeconds;
                  *(_DWORD *)buf = 134218240;
                  unint64_t v127 = v63;
                  __int16 v128 = 2048;
                  double v129 = v64;
                  _os_log_error_impl(&dword_1BF22B000, v62, OS_LOG_TYPE_ERROR, "machAbs %llu and machAbsSec %f", buf, 0x16u);
                }

                *__error() = v61;
                _SASetCrashLogMessage(516, "machAbs %llu and machAbsSec %f", v65, v66, v67, v68, v69, v70, self->_machAbsTime);
                _os_crash();
                __break(1u);
              }
              int v71 = *__error();
              v72 = _sa_logt();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
              {
                unint64_t v73 = self->_machContTime;
                double v74 = self->_machContTimeSeconds;
                *(_DWORD *)buf = 134218240;
                unint64_t v127 = v73;
                __int16 v128 = 2048;
                double v129 = v74;
                _os_log_error_impl(&dword_1BF22B000, v72, OS_LOG_TYPE_ERROR, "machCont %llu and machContSec %f", buf, 0x16u);
              }

              *__error() = v71;
              _SASetCrashLogMessage(517, "machCont %llu and machContSec %f", v75, v76, v77, v78, v79, v80, self->_machContTime);
              _os_crash();
              __break(1u);
            }
          }
        }
      }
      else
      {
        if (!v11)
        {
          long long v11 = (SATimestamp *)[(SATimestamp *)self copy];
          uint64_t v44 = *((void *)v9 + 3);
        }
        unint64_t v45 = v97[3] + v44;
        self->_unint64_t machContTime = v45;
        double v46 = v118[3];
        if (v46 != 0.0)
        {
          if (*((_DWORD *)v122 + 8) && *((_DWORD *)v122 + 9))
          {
            uint64_t v47 = 0;
            uint64_t v48 = v122[4];
            if (!v48) {
              goto LABEL_110;
            }
            double v46 = 1000000000.0;
            if (HIDWORD(v48))
            {
              uint64_t v47 = v45;
              double v46 = 1000000000.0;
              if (v48 != HIDWORD(v48))
              {
                uint64_t v47 = __udivti3();
LABEL_110:
                double v46 = 1000000000.0;
              }
            }
          }
          else
          {
            uint64_t v47 = v45;
          }
          self->_double machContTimeSeconds = (double)(unint64_t)v47 / v46;
        }
        ((void (*)(void (**)(void)))v6[2])(v6);
        ((void (*)(void (**)(void)))v8[2])(v8);
        ((void (*)(void (**)(void)))v10[2])(v10);
      }
    }
  }
}

int *__49__SATimestamp_guessMissingTimesBasedOnTimestamp___block_invoke(int *result, double a2, double a3, double a4, double a5)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(*((void *)result + 6) + 8);
  double v6 = *(double *)(v5 + 24);
  if (v6 == 0.0)
  {
    id v7 = result;
    uint64_t v8 = *((void *)result + 4);
    unint64_t v9 = *(void *)(v8 + 8);
    if (v9)
    {
      double v10 = *(double *)(v8 + 16);
      if (v10 != 0.0) {
        goto LABEL_10;
      }
    }
    if ((unint64_t v9 = *(void *)(v8 + 24)) != 0 && (v10 = *(double *)(v8 + 32), v10 != 0.0)
      || (v11 = *((void *)result + 5), (unint64_t v9 = *(void *)(v11 + 8)) != 0) && (v10 = *(double *)(v11 + 16), v10 != 0.0)
      || (unint64_t v9 = *(void *)(v11 + 24)) != 0 && (v10 = *(double *)(v11 + 32), v10 != 0.0))
    {
LABEL_10:
      *(double *)(v5 + 24) = (double)v9 / v10;
      double v6 = *(double *)(*(void *)(*((void *)result + 6) + 8) + 24);
    }
    uint64_t v12 = 0;
    char v13 = 1;
    while (1)
    {
      uint64_t v14 = &TRIGeneralErrorDomain_block_invoke_knownMachTimebases[v12];
      LODWORD(a5) = *(_DWORD *)v14;
      LODWORD(a4) = *((_DWORD *)v14 + 1);
      double v15 = (double)*(unint64_t *)&a4 * 1000000000.0 / (double)*(unint64_t *)&a5;
      a5 = vabdd_f64(v15, v6);
      a4 = a5 / v15;
      if (a4 < 0.0000001) {
        break;
      }
      char v16 = v13;
      char v13 = 0;
      uint64_t v12 = 1;
      if ((v16 & 1) == 0) {
        goto LABEL_16;
      }
    }
    *(void *)(*(void *)(*((void *)result + 7) + 8) + 32) = *v14;
LABEL_16:
    uint64_t v17 = *(void *)(*((void *)result + 7) + 8);
    if (!*(_DWORD *)(v17 + 32) || !*(_DWORD *)(v17 + 36))
    {
      int v18 = *__error();
      uint64_t v19 = _sa_logt();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        double v20 = *(double *)(*(void *)(*((void *)v7 + 6) + 8) + 24) / 1000000000.0;
        int v21 = 134217984;
        double v22 = v20;
        _os_log_fault_impl(&dword_1BF22B000, v19, OS_LOG_TYPE_FAULT, "Using unknown mach timebase %f", (uint8_t *)&v21, 0xCu);
      }

      int64_t result = __error();
      SATimestamp *result = v18;
    }
  }
  return result;
}

double __49__SATimestamp_guessMissingTimesBasedOnTimestamp___block_invoke_4(void *a1)
{
  uint64_t v1 = *(void *)(a1[6] + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    v2 = (double *)a1[4];
    if (v2[4] == 0.0 || *(double *)(a1[5] + 32) == 0.0)
    {
      if (v2[5] == 0.0 || *(double *)(a1[5] + 40) == 0.0)
      {
        double result = v2[2];
        if (result == 0.0) {
          return result;
        }
        double result = *(double *)(a1[5] + 16);
        if (result == 0.0) {
          return result;
        }
        uint64_t v3 = 16;
      }
      else
      {
        uint64_t v3 = 40;
      }
    }
    else
    {
      uint64_t v3 = 32;
    }
    *(unsigned char *)(v1 + 24) = 1;
    double result = *(double *)(a1[4] + v3) - *(double *)(a1[5] + v3);
    *(double *)(*(void *)(a1[7] + 8) + 24) = result;
  }
  return result;
}

void *__49__SATimestamp_guessMissingTimesBasedOnTimestamp___block_invoke_2(void *result)
{
  uint64_t v1 = *(void *)(result[6] + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result[4];
    if (*(void *)(v2 + 8) && *(void *)(result[5] + 8))
    {
      uint64_t v3 = 8;
    }
    else
    {
      if (!*(void *)(v2 + 24) || !*(void *)(result[5] + 24)) {
        return result;
      }
      uint64_t v3 = 24;
    }
    *(unsigned char *)(v1 + 24) = 1;
    *(void *)(*(void *)(result[7] + 8) + 24) = *(void *)(result[4] + v3) - *(void *)(result[5] + v3);
  }
  return result;
}

- (void)guessMissingTimesBasedOnCurrentTime
{
  id v3 = +[SATimestamp timestamp];
  [(SATimestamp *)self guessMissingTimesBasedOnTimestamp:v3];
}

- (NSString)debugDescription
{
  id v3 = _CopyStringForTime(3, self->_wallTime);
  id v4 = (void *)[[NSString alloc] initWithFormat:@"%@ machabs:%llu (%fs) machcont:%llu (%fs)", v3, self->_machAbsTime, *(void *)&self->_machAbsTimeSeconds, self->_machContTime, *(void *)&self->_machContTimeSeconds];

  return (NSString *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t machAbsTime = self->_machAbsTime;
  double machAbsTimeSeconds = self->_machAbsTimeSeconds;
  unint64_t machContTime = self->_machContTime;
  double machContTimeSeconds = self->_machContTimeSeconds;
  double wallTime = self->_wallTime;
  return (id)[v4 initWithMachAbsTime:machAbsTime machAbsTimeSec:machContTime machContTime:machAbsTimeSeconds machContTimeSec:machContTimeSeconds wallTime:wallTime];
}

- (id)copyDate
{
  if (self->_wallTime == 0.0) {
    return 0;
  }
  id v3 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  double wallTime = self->_wallTime;
  return (id)[v3 initWithTimeIntervalSinceReferenceDate:wallTime];
}

- (unint64_t)machAbsTime
{
  return self->_machAbsTime;
}

- (double)machAbsTimeSeconds
{
  return self->_machAbsTimeSeconds;
}

- (double)machContTimeSeconds
{
  return self->_machContTimeSeconds;
}

- (double)wallTime
{
  return self->_wallTime;
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v7 = a3;
  if (self->_wallTime != 0.0)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithDouble:");
    SAJSONWriteDictionaryFirstEntry(v7, @"wallTimeCF", v4);

    if (!self->_machAbsTime)
    {
LABEL_7:
      if (!self->_machContTime) {
        goto LABEL_10;
      }
      double v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
      SAJSONWriteDictionaryEntry(v7, @"machContTime", v6);
      goto LABEL_9;
    }
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    SAJSONWriteDictionaryEntry(v7, @"machAbsTime", v5);
LABEL_6:

    goto LABEL_7;
  }
  if (self->_machAbsTime)
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    SAJSONWriteDictionaryFirstEntry(v7, @"machAbsTime", v5);
    goto LABEL_6;
  }
  if (self->_machContTime)
  {
    double v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    SAJSONWriteDictionaryFirstEntry(v7, @"machContTime", v6);
LABEL_9:
  }
LABEL_10:
}

+ (id)classDictionaryKey
{
  return @"SATimestamp";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 26;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(SATimestamp *)self sizeInBytesForSerializedVersion] != a4)
  {
    int v11 = *__error();
    uint64_t v12 = _sa_logt();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [(SATimestamp *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v43 = [v13 UTF8String];
      __int16 v44 = 2048;
      unint64_t v45 = [(SATimestamp *)self sizeInBytesForSerializedVersion];
      __int16 v46 = 2048;
      unint64_t v47 = a4;
      _os_log_error_impl(&dword_1BF22B000, v12, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v11;
    id v14 = [(SATimestamp *)self debugDescription];
    char v15 = [v14 UTF8String];
    [(SATimestamp *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(765, "%s: size %lu != buffer length %lu", v16, v17, v18, v19, v20, v21, v15);

    _os_crash();
    __break(1u);
    goto LABEL_10;
  }
  *(_WORD *)&a3->var0 = 257;
  unint64_t machAbsTime = self->_machAbsTime;
  if (!machAbsTime && self->_machAbsTimeSeconds != 0.0)
  {
LABEL_10:
    int v22 = *__error();
    uint64_t v23 = _sa_logt();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      unint64_t v24 = self->_machAbsTime;
      double machAbsTimeSeconds = self->_machAbsTimeSeconds;
      *(_DWORD *)buf = 134218240;
      uint64_t v43 = v24;
      __int16 v44 = 2048;
      unint64_t v45 = *(void *)&machAbsTimeSeconds;
      _os_log_error_impl(&dword_1BF22B000, v23, OS_LOG_TYPE_ERROR, "machAbs %llu and machAbsSec %f", buf, 0x16u);
    }

    *__error() = v22;
    _SASetCrashLogMessage(771, "machAbs %llu and machAbsSec %f", v26, v27, v28, v29, v30, v31, self->_machAbsTime);
    _os_crash();
    __break(1u);
LABEL_13:
    int v32 = *__error();
    unint64_t v33 = _sa_logt();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      unint64_t machContTime = self->_machContTime;
      double machContTimeSeconds = self->_machContTimeSeconds;
      *(_DWORD *)buf = 134218240;
      uint64_t v43 = machContTime;
      __int16 v44 = 2048;
      unint64_t v45 = *(void *)&machContTimeSeconds;
      _os_log_error_impl(&dword_1BF22B000, v33, OS_LOG_TYPE_ERROR, "machCont %llu and machContSec %f", buf, 0x16u);
    }

    *__error() = v32;
    _SASetCrashLogMessage(772, "machCont %llu and machContSec %f", v36, v37, v38, v39, v40, v41, self->_machContTime);
    _os_crash();
    __break(1u);
  }
  if (!self->_machContTime && self->_machContTimeSeconds != 0.0) {
    goto LABEL_13;
  }
  *(void *)(&a3->var1 + 1) = machAbsTime;
  *(unint64_t *)((char *)&a3->var2 + 2) = self->_machContTime;
  *(unint64_t *)((char *)&a3->var3 + 2) = *(void *)&self->_wallTime;

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() classDictionaryKey];
  SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)a3 >= 2u) {
    goto LABEL_7;
  }
  if (a4 <= 0x19)
  {
    int v6 = *__error();
    id v7 = _sa_logt();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v16 = a4;
      __int16 v17 = 2048;
      uint64_t v18 = 26;
      _os_log_error_impl(&dword_1BF22B000, v7, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATimestamp struct %lu", buf, 0x16u);
    }

    *__error() = v6;
    _SASetCrashLogMessage(790, "bufferLength %lu < serialized SATimestamp struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    id v14 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SATimestamp version" userInfo:0];
    objc_exception_throw(v14);
  }
  +[SATimestamp timestampWithMachAbsTime:*(void *)((char *)a3 + 2) machAbsTimeSec:*(void *)((char *)a3 + 10) machContTime:0.0 machContTimeSec:0.0 wallTime:*(double *)((char *)a3 + 18)];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)applyMachTimebase:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 8);
    double v5 = *(double *)(result + 16);
    if (v4)
    {
      if (v5 == 0.0)
      {
        double result = 0;
        if (a2)
        {
          if (HIDWORD(a2))
          {
            double result = v4;
            if (a2 != HIDWORD(a2)) {
              double result = __udivti3();
            }
          }
        }
        *(double *)(v3 + 16) = (double)(unint64_t)result / 1000000000.0;
      }
    }
    else if (v5 != 0.0)
    {
      double result = 0;
      if (a2)
      {
        if (HIDWORD(a2))
        {
          double result = (unint64_t)(v5 * 1000000000.0);
          if (HIDWORD(a2) != a2) {
            double result = __udivti3();
          }
        }
      }
      *(void *)(v3 + 8) = result;
    }
    double v6 = *(double *)(v3 + 32);
    if (*(void *)(v3 + 24))
    {
      if (v6 == 0.0)
      {
        double result = 0;
        if (a2 && HIDWORD(a2))
        {
          double result = *(void *)(v3 + 24);
          if (a2 != HIDWORD(a2)) {
            double result = __udivti3();
          }
        }
        *(double *)(v3 + 32) = (double)(unint64_t)result / 1000000000.0;
      }
    }
    else if (v6 != 0.0)
    {
      double result = 0;
      if (a2)
      {
        if (HIDWORD(a2))
        {
          double result = (unint64_t)(v6 * 1000000000.0);
          if (HIDWORD(a2) != a2) {
            double result = __udivti3();
          }
        }
      }
      *(void *)(v3 + 24) = result;
    }
  }
  return result;
}

@end