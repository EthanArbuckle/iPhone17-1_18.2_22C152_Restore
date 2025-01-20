@interface HIDTimestampSync
- (BOOL)isTimestampSyncEnabled;
- (BOOL)lastBTSyncTimestampUsValid;
- (BOOL)obtainTimestampFromDriver:(unint64_t *)a3 count:(unint64_t *)a4 period:(unsigned int *)a5;
- (BOOL)timestampSyncIsValid:(unint64_t)a3 hostTimestamp:(unint64_t)a4 btSyncTimestampUs:(unint64_t)a5;
- (HIDTimestampSync)initWithBtClockMask:(unint64_t)a3;
- (HIDTimestampSyncErrorHandler)btSyncErrorHandler;
- (HIDTimestampSyncErrorHandler)reportErrorHandler;
- (int64_t)calculateTimestampDifference:(unint64_t)a3 current:(unint64_t)a4 threshold:(unint64_t)a5 compensation:(unint64_t)a6 errorHandler:(id)a7;
- (unint64_t)applyInverseTimestampOffset:(unint64_t)a3;
- (unint64_t)applyTimestampOffset:(unsigned int)a3 precise:(BOOL)a4;
- (unint64_t)btClockMask;
- (unint64_t)btSyncCompensation;
- (unint64_t)convertBTClockToMicrosec:(unint64_t)a3;
- (unint64_t)lastBTSyncTimestampUs;
- (unint64_t)lastHostTimestampCount;
- (unint64_t)lastHostTimestampUs;
- (unint64_t)machTimeToMicrosec:(unint64_t)a3;
- (unint64_t)microsecToMachTime:(unint64_t)a3;
- (unsigned)periodMs;
- (unsigned)syncService;
- (void)dealloc;
- (void)processTimestampSync:(unsigned int)a3 phase:(unsigned int)a4;
- (void)setBtClockMask:(unint64_t)a3;
- (void)setBtSyncCompensation:(unint64_t)a3;
- (void)setBtSyncErrorHandler:(id)a3;
- (void)setLastBTSyncTimestampUs:(unint64_t)a3;
- (void)setLastBTSyncTimestampUsValid:(BOOL)a3;
- (void)setLastHostTimestampCount:(unint64_t)a3;
- (void)setLastHostTimestampUs:(unint64_t)a3;
- (void)setPeriodMs:(unsigned int)a3;
- (void)setReportErrorHandler:(id)a3;
- (void)setSyncService:(unsigned int)a3;
@end

@implementation HIDTimestampSync

- (HIDTimestampSync)initWithBtClockMask:(unint64_t)a3
{
  kern_return_t MatchingServices;
  int v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  HIDTimestampSync *v19;
  io_object_t v21;
  NSObject *v22;
  HIDTimestampSyncErrorHandler *v23;
  HIDTimestampSyncErrorHandler *reportErrorHandler;
  HIDTimestampSyncErrorHandler *v25;
  HIDTimestampSyncErrorHandler *btSyncErrorHandler;
  __int16 v27[6];
  io_iterator_t existing;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)HIDTimestampSync;
  v4 = [(HIDTimestampSync *)&v29 init];
  v5 = v4;
  if (v4)
  {
    v4->_btClockMask = a3;
    v6 = [(HIDTimestampSync *)v4 convertBTClockToMicrosec:a3];
    v5->_btSyncCompensation = (unint64_t)&v6[[(HIDTimestampSync *)v5 convertBTClockToMicrosec:1]];
    v5->_syncService = 0;
    CFDictionaryRef v7 = IOServiceNameMatching("AppleMultitouchTimestampSync");
    if (v7)
    {
      existing = 0;
      MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v7, &existing);
      if (MatchingServices)
      {
        v9 = MatchingServices;
        v10 = qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_100071254(v9, v10);
        }
      }
      else
      {
        v21 = IOIteratorNext(existing);
        if (v21)
        {
          v5->_syncService = v21;
          v22 = qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
          {
            v27[0] = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Found AppleMultitouchTimestampSync driver", (uint8_t *)v27, 2u);
          }
        }
        if (existing) {
          IOObjectRelease(existing);
        }
        if (v5->_syncService)
        {
          v23 = [[HIDTimestampSyncErrorHandler alloc] initWithSubType:@"InterruptReportTimestampErrors"];
          reportErrorHandler = v5->_reportErrorHandler;
          v5->_reportErrorHandler = v23;

          v25 = [[HIDTimestampSyncErrorHandler alloc] initWithSubType:@"TimestampSyncErrors"];
          btSyncErrorHandler = v5->_btSyncErrorHandler;
          v5->_btSyncErrorHandler = v25;

          v19 = v5;
          goto LABEL_9;
        }
      }
    }
    else
    {
      v11 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_1000711DC(v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  v19 = 0;
LABEL_9:

  return v19;
}

- (void)dealloc
{
  io_object_t syncService = self->_syncService;
  if (syncService)
  {
    IOObjectRelease(syncService);
    self->_io_object_t syncService = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)HIDTimestampSync;
  [(HIDTimestampSync *)&v4 dealloc];
}

- (unint64_t)convertBTClockToMicrosec:(unint64_t)a3
{
  return 312500 * (self->_btClockMask & a3) / 0x3E8;
}

- (void)processTimestampSync:(unsigned int)a3 phase:(unsigned int)a4
{
  unint64_t v6 = [(HIDTimestampSync *)self convertBTClockToMicrosec:a3];
  unint64_t v11 = 0;
  uint64_t v12 = 0;
  if ([(HIDTimestampSync *)self obtainTimestampFromDriver:&v12 count:&v11 period:&self->_periodMs])
  {
    unint64_t v7 = v6 + a4;
    unint64_t v8 = 1000 * v12;
    if ([(HIDTimestampSync *)self timestampSyncIsValid:1000 * v12 hostTimestamp:v11 btSyncTimestampUs:v7])
    {
      self->_lastBTSyncTimestampUs = v7;
      BOOL v9 = 1;
    }
    else
    {
      BOOL v9 = 0;
    }
    self->_lastBTSyncTimestampUsValid = v9;
    unint64_t v10 = v11;
    self->_lastHostTimestampUs = v8;
    self->_lastHostTimestampCount = v10;
  }
}

- (BOOL)obtainTimestampFromDriver:(unint64_t *)a3 count:(unint64_t *)a4 period:(unsigned int *)a5
{
  io_registry_entry_t syncService = self->_syncService;
  if (!syncService)
  {
    BOOL v16 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR);
    if (!v16) {
      return v16;
    }
    sub_1000712CC();
    goto LABEL_21;
  }
  if (a3)
  {
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(syncService, @"Last Timestamp Sync", kCFAllocatorDefault, 0);
    if (!CFProperty)
    {
      BOOL v16 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR);
      if (!v16) {
        return v16;
      }
      sub_100071368();
      goto LABEL_21;
    }
    CFNumberRef v11 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt64Type, a3);
    CFRelease(v11);
  }
  if (a4)
  {
    CFNumberRef v12 = (const __CFNumber *)IORegistryEntryCreateCFProperty(self->_syncService, @"Timestamp Sync Count", kCFAllocatorDefault, 0);
    if (!v12)
    {
      BOOL v16 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR);
      if (!v16) {
        return v16;
      }
      sub_100071334();
      goto LABEL_21;
    }
    CFNumberRef v13 = v12;
    CFNumberGetValue(v12, kCFNumberSInt64Type, a4);
    CFRelease(v13);
  }
  if (!a5)
  {
LABEL_11:
    LOBYTE(v16) = 1;
    return v16;
  }
  CFNumberRef v14 = (const __CFNumber *)IORegistryEntryCreateCFProperty(self->_syncService, @"Timestamp Sync Period", kCFAllocatorDefault, 0);
  if (v14)
  {
    CFNumberRef v15 = v14;
    CFNumberGetValue(v14, kCFNumberSInt32Type, a5);
    CFRelease(v15);
    goto LABEL_11;
  }
  BOOL v16 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR);
  if (!v16) {
    return v16;
  }
  sub_100071300();
LABEL_21:
  LOBYTE(v16) = 0;
  return v16;
}

- (BOOL)isTimestampSyncEnabled
{
  p_periodMs = (int *)&self->_periodMs;
  if (self->_periodMs)
  {
    unint64_t v4 = [(HIDTimestampSync *)self machTimeToMicrosec:mach_absolute_time()]
       - self->_lastHostTimestampUs;
    if (v4 < 2000 * self->_periodMs) {
      return 1;
    }
    int v9 = 0;
    v5 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
      sub_10007139C(p_periodMs, v4, v5);
    }
    if ([(HIDTimestampSync *)self obtainTimestampFromDriver:0 count:0 period:&v9])
    {
      if (v9) {
        return 1;
      }
      int *p_periodMs = 0;
      unint64_t v7 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Timestamp sync is disabled.", v8, 2u);
      }
    }
  }
  return 0;
}

- (unint64_t)applyTimestampOffset:(unsigned int)a3 precise:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(HIDTimestampSync *)self isTimestampSyncEnabled]) {
    return 0;
  }
  unint64_t v7 = [(HIDTimestampSync *)self convertBTClockToMicrosec:a3];
  if (v4)
  {
    unint64_t v8 = 2000 * self->_periodMs;
    unint64_t btSyncCompensation = self->_btSyncCompensation;
  }
  else
  {
    unint64_t btSyncCompensation = self->_btSyncCompensation;
    unint64_t v8 = btSyncCompensation;
  }
  int64_t v10 = [(HIDTimestampSync *)self calculateTimestampDifference:self->_lastBTSyncTimestampUs current:v7 threshold:v8 compensation:btSyncCompensation errorHandler:self->_reportErrorHandler];
  if (!v10 && self->_lastBTSyncTimestampUs != v7)
  {
    if (![(HIDTimestampSyncErrorHandler *)self->_reportErrorHandler isMuted])
    {
      CFNumberRef v12 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        unint64_t lastBTSyncTimestampUs = self->_lastBTSyncTimestampUs;
        unsigned int periodMs = self->_periodMs;
        int v16 = 134218496;
        unint64_t v17 = v7;
        __int16 v18 = 2048;
        unint64_t v19 = lastBTSyncTimestampUs;
        __int16 v20 = 1024;
        unsigned int v21 = periodMs;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Packet timestamp (%llu) is out of sync with BT (ts=%lluus, period=%ums). Ignoring.", (uint8_t *)&v16, 0x1Cu);
      }
    }
    return 0;
  }
  unint64_t v11 = self->_lastHostTimestampUs + v10;
  [(HIDTimestampSyncErrorHandler *)self->_reportErrorHandler reportSuccess];
  return v11;
}

- (unint64_t)applyInverseTimestampOffset:(unint64_t)a3
{
  if (![(HIDTimestampSync *)self isTimestampSyncEnabled]) {
    return 0;
  }
  if (!self->_lastBTSyncTimestampUsValid)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100071428();
    }
    return 0;
  }
  unint64_t v5 = a3 - self->_lastHostTimestampUs;
  unint64_t v6 = self->_lastBTSyncTimestampUs + v5;
  unint64_t v7 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
  {
    unint64_t lastBTSyncTimestampUs = self->_lastBTSyncTimestampUs;
    unint64_t lastHostTimestampUs = self->_lastHostTimestampUs;
    int v11 = 134219008;
    unint64_t v12 = lastHostTimestampUs;
    __int16 v13 = 2048;
    unint64_t v14 = a3;
    __int16 v15 = 2048;
    unint64_t v16 = v5;
    __int16 v17 = 2048;
    unint64_t v18 = lastBTSyncTimestampUs;
    __int16 v19 = 2048;
    unint64_t v20 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Diff from last host tsync (%7lluµs) to current packet host tstamp (%7lluµs) = %+5lldµs. Applied to last BT tsync (%7lldµs) results in packet BT tstamp = %7lldµs", (uint8_t *)&v11, 0x34u);
  }
  return v6;
}

- (int64_t)calculateTimestampDifference:(unint64_t)a3 current:(unint64_t)a4 threshold:(unint64_t)a5 compensation:(unint64_t)a6 errorHandler:(id)a7
{
  id v11 = a7;
  if (a6 < a5 || (unint64_t v12 = a6 - a3, a6 < a3) || (v13 = a6 - a4, a6 < a4))
  {
    +[NSString stringWithFormat:@"Compensation should be equal or larger than timestamps and threshold.(compensation=%llu, threshold=%llu, previous=%llu, current=%llu)", a6, a5, a3, a4, v18];
    __int16 v15 = LABEL_8:;
    [v11 reportFailure:v15];

    int64_t v14 = 0;
    goto LABEL_9;
  }
  if ((uint64_t)(a4 - a3) > (uint64_t)a5 || (uint64_t)(a4 - a3) < -(uint64_t)a5)
  {
    if (a4 <= a3)
    {
      int64_t v14 = v12 + a4;
      if ((uint64_t)(v12 + a4) > (uint64_t)a5)
      {
        +[NSString stringWithFormat:@"Timestamp going backwards (%llu=>%llu, diff=%lld). This is not a rollover(threshold=%llu, compensation=%llu).", a3, a4, a4 - a3, a5, a6];
        goto LABEL_8;
      }
      __int16 v17 = qword_1000CD178;
      if (!os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
    }
    else
    {
      int64_t v14 = v13 + a3;
      if ((uint64_t)(v13 + a3) > (uint64_t)a5)
      {
        +[NSString stringWithFormat:@"Compensation should be equal or larger than timestamps and threshold.Timestamp jump (%llu=>%llu, diff=%lld). This is not a rollover(threshold=%llu, compensation=%llu).", a3, a4, a4 - a3, a5, a6];
        goto LABEL_8;
      }
      __int16 v17 = qword_1000CD178;
      if (!os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
    }
    *(_DWORD *)buf = 134219008;
    unint64_t v20 = a3;
    __int16 v21 = 2048;
    unint64_t v22 = a4;
    __int16 v23 = 2048;
    int64_t v24 = v14;
    __int16 v25 = 2048;
    unint64_t v26 = a5;
    __int16 v27 = 2048;
    unint64_t v28 = a6;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Rollover detected (%llu=>%llu). Return diff=%lld (threshold=%llu, compensation=%llu)", buf, 0x34u);
    goto LABEL_9;
  }
  int64_t v14 = a4 - a3;
LABEL_9:

  return v14;
}

- (BOOL)timestampSyncIsValid:(unint64_t)a3 hostTimestamp:(unint64_t)a4 btSyncTimestampUs:(unint64_t)a5
{
  unint64_t lastHostTimestampCount = self->_lastHostTimestampCount;
  if (lastHostTimestampCount)
  {
    if (a4 != 1 && lastHostTimestampCount + 1 != a4)
    {
      btSyncErrorHandler = self->_btSyncErrorHandler;
      id v11 = +[NSString stringWithFormat:@"Host timestamp jump detected (%llu:%llu -> %llu:%llu). Discard this BTSync packet.", lastHostTimestampCount, self->_lastHostTimestampUs, a4, a3];
      [(HIDTimestampSyncErrorHandler *)btSyncErrorHandler reportFailure:v11];

      kdebug_trace();
      return 0;
    }
    if (a4 < 2)
    {
      unint64_t v19 = 0;
    }
    else
    {
      unint64_t lastHostTimestampUs = self->_lastHostTimestampUs;
      int64_t v18 = [(HIDTimestampSync *)self calculateTimestampDifference:self->_lastBTSyncTimestampUs current:a5 threshold:2000 * self->_periodMs compensation:self->_btSyncCompensation errorHandler:self->_btSyncErrorHandler];
      unint64_t v19 = a3 - lastHostTimestampUs - v18;
      if (self->_lastHostTimestampUs && self->_lastBTSyncTimestampUs) {
        kdebug_trace();
      }
      if (v18 || self->_lastBTSyncTimestampUs == a5) {
        [(HIDTimestampSyncErrorHandler *)self->_btSyncErrorHandler reportSuccess];
      }
    }
    uint64_t v20 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v22 = self->_lastHostTimestampUs;
      unint64_t v21 = self->_lastHostTimestampCount;
      unint64_t lastBTSyncTimestampUs = self->_lastBTSyncTimestampUs;
      *(_DWORD *)buf = 134219520;
      unint64_t v25 = v21;
      __int16 v26 = 2048;
      unint64_t v27 = v22;
      __int16 v28 = 2048;
      unint64_t v29 = a4;
      __int16 v30 = 2048;
      unint64_t v31 = a3;
      __int16 v32 = 2048;
      unint64_t v33 = lastBTSyncTimestampUs;
      __int16 v34 = 2048;
      unint64_t v35 = a5;
      __int16 v36 = 2048;
      unint64_t v37 = v19;
      int64_t v14 = "New timestamp sync (Host=%llu:%llu->%llu:%llu, BT=%llu->%llu, drift=%lld)";
      __int16 v15 = v20;
      uint32_t v16 = 72;
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v13 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      unint64_t v25 = a4;
      __int16 v26 = 2048;
      unint64_t v27 = a3;
      __int16 v28 = 2048;
      unint64_t v29 = a5;
      int64_t v14 = "First timestamp sync (Host=%llu:%llu, BT=%llu)";
      __int16 v15 = v13;
      uint32_t v16 = 32;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }
  }
  return 1;
}

- (unint64_t)machTimeToMicrosec:(unint64_t)a3
{
  unsigned int v4 = dword_1000CD0C4;
  if (!dword_1000CD0C4)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_1000CD0C0);
    unsigned int v4 = dword_1000CD0C4;
  }
  return a3 / v4 * dword_1000CD0C0 / 0x3E8;
}

- (unint64_t)microsecToMachTime:(unint64_t)a3
{
  unsigned int v4 = dword_1000CD0CC;
  if (!dword_1000CD0CC)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_1000CD0C8);
    unsigned int v4 = dword_1000CD0CC;
  }
  return 1000 * a3 * v4 / dword_1000CD0C8;
}

- (unint64_t)btClockMask
{
  return self->_btClockMask;
}

- (void)setBtClockMask:(unint64_t)a3
{
  self->_btClockMask = a3;
}

- (unint64_t)btSyncCompensation
{
  return self->_btSyncCompensation;
}

- (void)setBtSyncCompensation:(unint64_t)a3
{
  self->_unint64_t btSyncCompensation = a3;
}

- (unsigned)syncService
{
  return self->_syncService;
}

- (void)setSyncService:(unsigned int)a3
{
  self->_io_registry_entry_t syncService = a3;
}

- (unsigned)periodMs
{
  return self->_periodMs;
}

- (void)setPeriodMs:(unsigned int)a3
{
  self->_unsigned int periodMs = a3;
}

- (unint64_t)lastBTSyncTimestampUs
{
  return self->_lastBTSyncTimestampUs;
}

- (void)setLastBTSyncTimestampUs:(unint64_t)a3
{
  self->_unint64_t lastBTSyncTimestampUs = a3;
}

- (BOOL)lastBTSyncTimestampUsValid
{
  return self->_lastBTSyncTimestampUsValid;
}

- (void)setLastBTSyncTimestampUsValid:(BOOL)a3
{
  self->_lastBTSyncTimestampUsValid = a3;
}

- (unint64_t)lastHostTimestampUs
{
  return self->_lastHostTimestampUs;
}

- (void)setLastHostTimestampUs:(unint64_t)a3
{
  self->_unint64_t lastHostTimestampUs = a3;
}

- (unint64_t)lastHostTimestampCount
{
  return self->_lastHostTimestampCount;
}

- (void)setLastHostTimestampCount:(unint64_t)a3
{
  self->_unint64_t lastHostTimestampCount = a3;
}

- (HIDTimestampSyncErrorHandler)reportErrorHandler
{
  return self->_reportErrorHandler;
}

- (void)setReportErrorHandler:(id)a3
{
}

- (HIDTimestampSyncErrorHandler)btSyncErrorHandler
{
  return self->_btSyncErrorHandler;
}

- (void)setBtSyncErrorHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btSyncErrorHandler, 0);

  objc_storeStrong((id *)&self->_reportErrorHandler, 0);
}

@end