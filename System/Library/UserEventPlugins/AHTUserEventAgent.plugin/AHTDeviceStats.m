@interface AHTDeviceStats
- (AHTDeviceStats)init;
- (BOOL)getCalibrationSource:(id *)a3;
- (BOOL)getFirstInputPropertyValue:(unsigned int)a3;
- (BOOL)start:(id)a3 error:(id *)a4;
- (BOOL)stop:(id *)a3;
- (BOOL)ultimateDecisionSet;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)criticalErrorTimer;
- (int)getAGMDecision:(id *)a3 andAGMDecisionEnum:(unsigned int *)a4 andCalibrationSource:(id *)a5 withAGMEntry:(unsigned int)a6;
- (int)getAuthStatus:(id *)a3 withAGMDecisionEnum:(unsigned int)a4;
- (int)getFirstInputReceived:(BOOL *)a3;
- (unsigned)checkChildrenForMatches:(unsigned int)a3 matchingFunc:(id)a4 depth:(int)a5;
- (unsigned)copyEntryWithClass:(id)a3 withParentName:(id)a4 depth:(int)a5;
- (unsigned)copyEntryWithName:(id)a3 withParentName:(id)a4 depth:(int)a5;
- (unsigned)copyEntryWithParentName:(id)a3 matchingFunc:(id)a4 depth:(int)a5;
- (unsigned)getAGMEntry;
- (void)agmStackChoiceStatsCollection;
- (void)restartCriticalErrorCollectionTimer:(unint64_t)a3;
- (void)setCriticalErrorTimer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUltimateDecisionSet:(BOOL)a3;
- (void)startCriticalErrorCollectionTimer;
@end

@implementation AHTDeviceStats

- (AHTDeviceStats)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[AHTDeviceStats init]";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v9.receiver = self;
  v9.super_class = (Class)AHTDeviceStats;
  v3 = [(AHTDeviceStats *)&v9 init];
  v4 = v3;
  if (v3)
  {
    queue = v3->_queue;
    v3->_queue = 0;

    criticalErrorTimer = v4->_criticalErrorTimer;
    v4->_criticalErrorTimer = 0;

    v7 = v4;
  }

  return v4;
}

- (BOOL)start:(id)a3 error:(id *)a4
{
  v5 = (OS_dispatch_queue *)a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[AHTDeviceStats start:error:]";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v10, 0xCu);
  }
  queue = self->_queue;
  self->_queue = v5;

  unsigned int v7 = [(AHTDeviceStats *)self getAGMEntry];
  if (v7)
  {
    io_object_t v8 = v7;
    [(AHTDeviceStats *)self startCriticalErrorCollectionTimer];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      v11 = "-[AHTDeviceStats start:error:]";
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s Is AGM-based device", (uint8_t *)&v10, 0xCu);
    }
    IOObjectRelease(v8);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[AHTDeviceStats start:error:]";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s Not AGM-based device", (uint8_t *)&v10, 0xCu);
  }
  return 1;
}

- (BOOL)stop:(id *)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    objc_super v9 = "-[AHTDeviceStats stop:]";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v8, 0xCu);
  }
  queue = self->_queue;
  self->_queue = 0;

  criticalErrorTimer = self->_criticalErrorTimer;
  if (criticalErrorTimer)
  {
    dispatch_source_cancel(criticalErrorTimer);
    v6 = self->_criticalErrorTimer;
    self->_criticalErrorTimer = 0;
  }
  return 1;
}

- (unsigned)getAGMEntry
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [&off_E728 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v9 != v5) {
        objc_enumerationMutation(&off_E728);
      }
      LODWORD(v3) = [(AHTDeviceStats *)self copyEntryWithName:@"AppleGenericMultitouchDecider" withParentName:*(void *)(*((void *)&v8 + 1) + 8 * v6) depth:1];
      if (v3) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v3 = [&off_E728 countByEnumeratingWithState:&v8 objects:v12 count:16];
        id v4 = v3;
        if (v3) {
          goto LABEL_3;
        }
        return v3;
      }
    }
  }
  return v3;
}

- (void)startCriticalErrorCollectionTimer
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v11 = "-[AHTDeviceStats startCriticalErrorCollectionTimer]";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  if (queue)
  {
    if (!self->_criticalErrorTimer)
    {
      id v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, queue);
      criticalErrorTimer = self->_criticalErrorTimer;
      self->_criticalErrorTimer = v4;

      uint64_t v6 = self->_criticalErrorTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_6D30;
      handler[3] = &unk_C3A8;
      handler[4] = self;
      dispatch_source_set_event_handler(v6, handler);
      unsigned int v7 = self->_criticalErrorTimer;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_6D38;
      v8[3] = &unk_C3A8;
      v8[4] = self;
      dispatch_source_set_cancel_handler(v7, v8);
      [(AHTDeviceStats *)self restartCriticalErrorCollectionTimer:0];
      dispatch_resume((dispatch_object_t)self->_criticalErrorTimer);
    }
  }
}

- (void)restartCriticalErrorCollectionTimer:(unint64_t)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    long long v8 = "-[AHTDeviceStats restartCriticalErrorCollectionTimer:]";
    __int16 v9 = 2048;
    unint64_t v10 = a3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s interval: %llu", (uint8_t *)&v7, 0x16u);
  }
  criticalErrorTimer = self->_criticalErrorTimer;
  dispatch_time_t v6 = dispatch_time(0, 1000000000 * a3);
  dispatch_source_set_timer(criticalErrorTimer, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (unsigned)copyEntryWithName:(id)a3 withParentName:(id)a4 depth:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_6FA4;
  v12[3] = &unk_C3D0;
  id v13 = a3;
  id v8 = v13;
  id v9 = a4;
  unint64_t v10 = objc_retainBlock(v12);
  LODWORD(v5) = [(AHTDeviceStats *)self copyEntryWithParentName:v9 matchingFunc:v10 depth:v5];

  return v5;
}

- (unsigned)copyEntryWithClass:(id)a3 withParentName:(id)a4 depth:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_7120;
  v12[3] = &unk_C3D0;
  id v13 = a3;
  id v8 = v13;
  id v9 = a4;
  unint64_t v10 = objc_retainBlock(v12);
  LODWORD(v5) = [(AHTDeviceStats *)self copyEntryWithParentName:v9 matchingFunc:v10 depth:v5];

  return v5;
}

- (unsigned)copyEntryWithParentName:(id)a3 matchingFunc:(id)a4 depth:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  io_iterator_t existing = 0;
  CFMutableDictionaryRef v9 = IOServiceNameMatching((const char *)[a3 UTF8String]);
  CFMutableDictionaryRef v10 = v9;
  if (v9 && !IOServiceGetMatchingServices(0, v9, &existing))
  {
    if (!existing)
    {
      unsigned int v13 = 0;
      goto LABEL_11;
    }
    if (IOIteratorIsValid(existing))
    {
      while (1)
      {
        uint64_t v11 = IOIteratorNext(existing);
        if (!v11) {
          break;
        }
        unsigned int v12 = [(AHTDeviceStats *)self checkChildrenForMatches:v11 matchingFunc:v8 depth:v5];
        if (v12)
        {
          unsigned int v13 = v12;
          goto LABEL_9;
        }
      }
    }
  }
  unsigned int v13 = 0;
LABEL_9:
  if (existing) {
    IOObjectRelease(existing);
  }
LABEL_11:

  return v13;
}

- (unsigned)checkChildrenForMatches:(unsigned int)a3 matchingFunc:(id)a4 depth:(int)a5
{
  id v8 = (unsigned int (**)(id, void))a4;
  io_iterator_t iterator = 0;
  if (IORegistryEntryGetChildIterator(a3, "IOService", &iterator)) {
    goto LABEL_15;
  }
  if (!iterator)
  {
    unsigned int v11 = 0;
    goto LABEL_19;
  }
  if (IOIteratorIsValid(iterator) && (uint64_t v9 = IOIteratorNext(iterator), v9))
  {
    uint64_t v10 = v9;
    while (!v8[2](v8, v10))
    {
      if (a5) {
        unsigned int v11 = [(AHTDeviceStats *)self checkChildrenForMatches:v10 matchingFunc:v8 depth:(a5 - 1)];
      }
      else {
        unsigned int v11 = 0;
      }
      uint64_t v10 = IOIteratorNext(iterator);
      if (v10) {
        BOOL v12 = v11 == 0;
      }
      else {
        BOOL v12 = 0;
      }
      if (!v12) {
        goto LABEL_17;
      }
    }
    IOObjectRetain(v10);
    unsigned int v11 = v10;
  }
  else
  {
LABEL_15:
    unsigned int v11 = 0;
  }
LABEL_17:
  if (iterator) {
    IOObjectRelease(iterator);
  }
LABEL_19:

  return v11;
}

- (void)agmStackChoiceStatsCollection
{
  unsigned int v19 = 255;
  uint64_t v3 = [(AHTDeviceStats *)self getAGMEntry];
  if (!v3)
  {
    id v12 = 0;
    id v7 = 0;
    id v6 = 0;
    goto LABEL_17;
  }
  io_object_t v4 = v3;
  id v17 = 0;
  id v18 = 0;
  unsigned int v5 = [(AHTDeviceStats *)self getAGMDecision:&v18 andAGMDecisionEnum:&v19 andCalibrationSource:&v17 withAGMEntry:v3];
  id v6 = v18;
  id v7 = v17;
  IOObjectRelease(v4);
  if (!v6 || !v7) {
    goto LABEL_14;
  }
  if (!v5 && ![(AHTDeviceStats *)self ultimateDecisionSet])
  {
    v14[1] = _NSConcreteStackBlock;
    v14[2] = (id)3221225472;
    v14[3] = sub_76D0;
    v14[4] = &unk_C3F8;
    id v8 = v6;
    id v15 = v8;
    id v9 = v7;
    id v16 = v9;
    AnalyticsSendEventLazy();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v21 = "-[AHTDeviceStats agmStackChoiceStatsCollection]";
      __int16 v22 = 2112;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s Sent Ultimate Decision CA event %@ %@", buf, 0x20u);
    }
    [(AHTDeviceStats *)self setUltimateDecisionSet:1];
  }
  if (![(AHTDeviceStats *)self ultimateDecisionSet])
  {
LABEL_14:
    id v12 = 0;
    if (v5) {
      goto LABEL_15;
    }
LABEL_17:
    uint64_t v13 = 86400;
    goto LABEL_18;
  }
  v14[0] = 0;
  unsigned int v10 = [(AHTDeviceStats *)self getAuthStatus:v14 withAGMDecisionEnum:v19];
  id v11 = v14[0];
  id v12 = v11;
  if (!v10)
  {
    id v12 = v11;
    AnalyticsSendEventLazy();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[AHTDeviceStats agmStackChoiceStatsCollection]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s Sent Auth Status CA event %@", buf, 0x16u);
    }
    [(AHTDeviceStats *)self setUltimateDecisionSet:0];

    goto LABEL_17;
  }
LABEL_15:
  uint64_t v13 = 60;
LABEL_18:
  [(AHTDeviceStats *)self restartCriticalErrorCollectionTimer:v13];
}

- (int)getAGMDecision:(id *)a3 andAGMDecisionEnum:(unsigned int *)a4 andCalibrationSource:(id *)a5 withAGMEntry:(unsigned int)a6
{
  kern_return_t v10;
  CFMutableDictionaryRef v11;
  void *v12;
  id v13;
  unsigned int v14;
  unsigned int v15;
  __CFString *v16;
  __CFString *v17;
  id v18;
  int v19;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  unint64_t v25;

  properties = 0;
  unsigned int v10 = IORegistryEntryCreateCFProperties(a6, &properties, kCFAllocatorDefault, 0);
  if (v10)
  {
    unsigned int v19 = v10;
    uint64_t v13 = 0;
    id v11 = 0;
  }
  else
  {
    id v11 = properties;
    id v12 = [(__CFDictionary *)properties objectForKeyedSubscript:@"UltimateDecision"];
    if (v12)
    {
      uint64_t v13 = v12;
      v14 = [v13 unsignedIntValue];
      id v15 = v14;
      if (v14)
      {
        *a5 = @"None";
        id v16 = @"Other";
        if (v14 == 1) {
          id v16 = @"NotAuthentic";
        }
        if (v14 == 2) {
          id v17 = @"NotAuthenticLaunchFailed";
        }
        else {
          id v17 = v16;
        }
        goto LABEL_11;
      }
      if ([(AHTDeviceStats *)self getCalibrationSource:a5])
      {
        id v17 = @"Authentic";
LABEL_11:
        *a3 = v17;
        *a4 = v15;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          id v23 = "-[AHTDeviceStats getAGMDecision:andAGMDecisionEnum:andCalibrationSource:withAGMEntry:]";
          __int16 v24 = 2048;
          id v25 = v15;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s AGM decision raw value : 0x%016llx", buf, 0x16u);
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = [*a3 UTF8String];
          *(_DWORD *)buf = 136315394;
          id v23 = "-[AHTDeviceStats getAGMDecision:andAGMDecisionEnum:andCalibrationSource:withAGMEntry:]";
          __int16 v24 = 2080;
          id v25 = (unint64_t)v18;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s AGM decision string    : %s", buf, 0x16u);
        }
        unsigned int v19 = 0;
        goto LABEL_16;
      }
      unsigned int v19 = -536870160;
    }
    else
    {
      unsigned int v19 = -536870184;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v23 = "-[AHTDeviceStats getAGMDecision:andAGMDecisionEnum:andCalibrationSource:withAGMEntry:]";
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s Interested property not available yet", buf, 0xCu);
      }
      uint64_t v13 = 0;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v23 = "-[AHTDeviceStats getAGMDecision:andAGMDecisionEnum:andCalibrationSource:withAGMEntry:]";
    __int16 v24 = 1024;
    LODWORD(v25) = v19;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s error: 0x%04x", buf, 0x12u);
  }
LABEL_16:

  return v19;
}

- (BOOL)getCalibrationSource:(id *)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    id v15 = "-[AHTDeviceStats getCalibrationSource:]";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v14, 0xCu);
  }
  unsigned int v5 = [(AHTDeviceStats *)self copyEntryWithClass:@"AppleHIDTransportBootloader" withParentName:@"multi-touch" depth:2];
  if (!v5) {
    return 0;
  }
  io_object_t v6 = v5;
  id v7 = sub_7CAC(v5, v5);
  id v8 = v7;
  BOOL v9 = v7 != 0;
  if (!v7)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    int v14 = 136315138;
    id v15 = "-[AHTDeviceStats getCalibrationSource:]";
    id v11 = "%s couldn't find property";
    uint32_t v12 = 12;
    goto LABEL_7;
  }
  *a3 = v7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [*a3 UTF8String];
    int v14 = 136315394;
    id v15 = "-[AHTDeviceStats getCalibrationSource:]";
    __int16 v16 = 2080;
    id v17 = v10;
    id v11 = "%s Calibration source: %s";
    uint32_t v12 = 22;
LABEL_7:
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v12);
  }
LABEL_8:
  IOObjectRelease(v6);

  return v9;
}

- (int)getAuthStatus:(id *)a3 withAGMDecisionEnum:(unsigned int)a4
{
  int v5 = -536870184;
  char v11 = 0;
  if (a4 == 1)
  {
    unsigned int v7 = [(AHTDeviceStats *)self getFirstInputReceived:&v11];
    if (!v7)
    {
      if (v11)
      {
        int v5 = 0;
        io_object_t v6 = @"ConfirmedNotAuthentic";
        goto LABEL_7;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return v5;
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[AHTDeviceStats getAuthStatus:withAGMDecisionEnum:]";
      id v8 = "%s First input not received";
      uint32_t v9 = 12;
LABEL_11:
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, buf, v9);
      return v5;
    }
    int v5 = v7;
    if (v7 == -536870184) {
      return v5;
    }
LABEL_9:
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v5;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = "-[AHTDeviceStats getAuthStatus:withAGMDecisionEnum:]";
    __int16 v14 = 1024;
    int v15 = v5;
    id v8 = "%s error: 0x%04x";
    uint32_t v9 = 18;
    goto LABEL_11;
  }
  if (a4)
  {
    int v5 = -536870212;
    goto LABEL_9;
  }
  int v5 = 0;
  io_object_t v6 = @"ConfirmedAuthentic";
LABEL_7:
  *a3 = v6;
  return v5;
}

- (BOOL)getFirstInputPropertyValue:(unsigned int)a3
{
  io_object_t v4 = IOIteratorNext(a3);
  if (v4)
  {
    io_registry_entry_t v5 = v4;
    BOOL v6 = 0;
    do
    {
      CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v5, @"FirstInputReceived", kCFAllocatorDefault, 0);
      if (CFProperty)
      {
        CFBooleanRef v8 = CFProperty;
        BOOL v6 = v6 || CFBooleanGetValue(CFProperty) != 0;
        CFRelease(v8);
      }
      IOObjectRelease(v5);
      io_registry_entry_t v5 = IOIteratorNext(a3);
    }
    while (v5);
  }
  else
  {
    return 0;
  }
  return v6;
}

- (int)getFirstInputReceived:(BOOL *)a3
{
  kern_return_t MatchingServices;
  CFDictionaryRef v10;
  io_iterator_t existing;

  io_iterator_t existing = 0;
  *a3 = 0;
  CFMutableDictionaryRef v5 = IOServiceMatching("AppleHIDTransportHIDDevice");
  if (v5)
  {
    BOOL v6 = v5;
    id v7 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", &off_E6E8, @"DeviceUsagePage", &off_E700, @"DeviceUsage", 0);
    id v8 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v7, 0);
    CFDictionarySetValue(v6, @"DeviceUsagePairs", v8);
    MatchingServices = IOServiceGetMatchingServices(0, v6, &existing);
    *a3 = [(AHTDeviceStats *)self getFirstInputPropertyValue:existing];
    IOObjectRelease(existing);
    if (!*a3)
    {
      id v10 = IOServiceMatching("AppleGenericMultitouchHIDSPI");
      if (v10)
      {
        MatchingServices = IOServiceGetMatchingServices(0, v10, &existing);
        *a3 = [(AHTDeviceStats *)self getFirstInputPropertyValue:existing];
        IOObjectRelease(existing);
      }
    }
  }
  else
  {
    id v7 = 0;
    id v8 = 0;
    MatchingServices = -536870212;
  }

  return MatchingServices;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)criticalErrorTimer
{
  return self->_criticalErrorTimer;
}

- (void)setCriticalErrorTimer:(id)a3
{
}

- (BOOL)ultimateDecisionSet
{
  return self->_ultimateDecisionSet;
}

- (void)setUltimateDecisionSet:(BOOL)a3
{
  self->_ultimateDecisionSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criticalErrorTimer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end