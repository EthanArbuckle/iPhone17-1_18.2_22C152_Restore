@interface PLIOReportStats
- (BOOL)subscribeToGroup:(id)a3 andSubGroup:(id)a4;
- (BOOL)subscribeToGroup:(id)a3 andSubGroup:(id)a4 withChannelIDs:(id)a5;
- (BOOL)subscribeToGroup:(id)a3 andSubGroup:(id)a4 withChannelIDs:(id)a5 manualChannelOnly:(BOOL)a6;
- (BOOL)updateStats;
- (BOOL)updateStatsWithBlock:(id)a3;
- (NSDate)sampleTime;
- (NSDate)sampleTimePrevious;
- (NSDictionary)ioReportSample;
- (NSDictionary)previousIOReportSample;
- (NSDictionary)subscribedChannels;
- (NSString)driverName;
- (PLIOReportStats)initWithDriverName:(id)a3 withGroup:(id)a4;
- (PLIOReportStats)initWithGroup:(id)a3 andSubGroup:(id)a4;
- (PLIOReportStats)initWithGroup:(id)a3 andSubGroup:(id)a4 withChannelIDs:(id)a5;
- (PLIOReportStats)initWithGroup:(id)a3 andSubGroup:(id)a4 withChannelIDs:(id)a5 manualChannelOnly:(BOOL)a6;
- (__IOReportSubscriptionCF)subscription;
- (double)_convertValue:(int64_t)a3 toUnityScaleFromUnit:(unint64_t)a4;
- (double)getSampleDuration;
- (id)_calculateDeltaFromPreviousStats:(id)a3 toCurrentStats:(id)a4;
- (id)_init;
- (id)_parseIOReportSampleFromStats:(id)a3 convertingUnitToUnityScale:(BOOL)a4;
- (id)calculateDeltaFromPreviousSamples;
- (id)calculateDeltaFromPreviousSamplesConvertingUnitToUnityScale:(BOOL)a3;
- (id)currentValueForSimpleChannel:(id)a3;
- (id)currentValueForStateChannel:(id)a3 atIndex:(int)a4;
- (id)deltaValueForSimpleChannel:(id)a3;
- (id)deltaValueForStateChannel:(id)a3 atIndex:(int)a4;
- (id)getCurrentStats;
- (id)getDeltaStats;
- (id)parseIOReportSample;
- (id)parseSimpleDeltaSample;
- (void)clearSubscription;
- (void)dealloc;
- (void)setDriverName:(id)a3;
- (void)setIoReportSample:(id)a3;
- (void)setPreviousIOReportSample:(id)a3;
- (void)setSampleTime:(id)a3;
- (void)setSampleTimePrevious:(id)a3;
- (void)setSubscribedChannels:(id)a3;
- (void)setSubscription:(__IOReportSubscriptionCF *)a3;
@end

@implementation PLIOReportStats

- (__IOReportSubscriptionCF)subscription
{
  return self->_subscription;
}

- (NSDate)sampleTime
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)ioReportSample
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSampleTimePrevious:(id)a3
{
}

- (void)setSampleTime:(id)a3
{
}

- (void)setIoReportSample:(id)a3
{
}

- (NSDictionary)subscribedChannels
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)sampleTimePrevious
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)PLIOReportStats;
  v2 = [(PLIOReportStats *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(PLIOReportStats *)v2 setDriverName:@"ApplePMGR"];
    [(PLIOReportStats *)v3 setSubscription:0];
    [(PLIOReportStats *)v3 setSubscribedChannels:0];
  }
  return v3;
}

- (PLIOReportStats)initWithDriverName:(id)a3 withGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PLIOReportStats *)self _init];
  v9 = v8;
  if (v8)
  {
    [v8 setDriverName:v6];
    v10 = 0;
    if ([v9 subscribeToGroup:v7 andSubGroup:0 withChannelIDs:0]) {
      v10 = v9;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (PLIOReportStats)initWithGroup:(id)a3 andSubGroup:(id)a4
{
  return [(PLIOReportStats *)self initWithGroup:a3 andSubGroup:a4 withChannelIDs:0];
}

- (PLIOReportStats)initWithGroup:(id)a3 andSubGroup:(id)a4 withChannelIDs:(id)a5
{
  return [(PLIOReportStats *)self initWithGroup:a3 andSubGroup:a4 withChannelIDs:a5 manualChannelOnly:0];
}

- (PLIOReportStats)initWithGroup:(id)a3 andSubGroup:(id)a4 withChannelIDs:(id)a5 manualChannelOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(PLIOReportStats *)self _init];
  v14 = v13;
  if (v13
    && [v13 subscribeToGroup:v10 andSubGroup:v11 withChannelIDs:v12 manualChannelOnly:v6])
  {
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  if ([(PLIOReportStats *)self subscription]) {
    CFRelease([(PLIOReportStats *)self subscription]);
  }
  v3.receiver = self;
  v3.super_class = (Class)PLIOReportStats;
  [(PLIOReportStats *)&v3 dealloc];
}

- (BOOL)subscribeToGroup:(id)a3 andSubGroup:(id)a4
{
  return [(PLIOReportStats *)self subscribeToGroup:a3 andSubGroup:a4 withChannelIDs:0];
}

- (BOOL)subscribeToGroup:(id)a3 andSubGroup:(id)a4 withChannelIDs:(id)a5
{
  return [(PLIOReportStats *)self subscribeToGroup:a3 andSubGroup:a4 withChannelIDs:a5 manualChannelOnly:0];
}

- (BOOL)subscribeToGroup:(id)a3 andSubGroup:(id)a4 withChannelIDs:(id)a5 manualChannelOnly:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)MEMORY[0x1C1869120]([(PLIOReportStats *)self clearSubscription]);
  v48[0] = 0;
  v48[1] = 0;
  uint64_t v42 = MEMORY[0x1E4F143A8];
  uint64_t v43 = 3221225472;
  v44 = __81__PLIOReportStats_subscribeToGroup_andSubGroup_withChannelIDs_manualChannelOnly___block_invoke;
  v45 = &unk_1E62545F0;
  id v14 = v10;
  id v46 = v14;
  id v15 = v11;
  id v47 = v15;
  v16 = (void *)IOReportCopyFilteredChannels();
  id v17 = v16;
  if (![v16 count] && !v6) {
    goto LABEL_5;
  }
  if (!v17) {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v20 = PLLogCommon();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v51 = v14;
    __int16 v52 = 2112;
    id v53 = v15;
    __int16 v54 = 2112;
    id v55 = v17;
    _os_log_debug_impl(&dword_1BBD2F000, v20, OS_LOG_TYPE_DEBUG, "Retrieved channels from group(%@) subgroup(%@) = %@\n", buf, 0x20u);
  }

  if (v12 && [v12 count])
  {
    id v34 = v15;
    id v35 = v14;
    v36 = v13;
    id v21 = [(PLIOReportStats *)self driverName];
    CFMutableDictionaryRef v22 = IOServiceMatching((const char *)[v21 UTF8String]);

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v37 = v12;
    id v23 = v12;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v49 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v39 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          [v28 unsignedLongLongValue];
          uint64_t v29 = IOReportCopyChannelsWithID();
          if (v29)
          {
            v30 = (const void *)v29;
            v31 = PLLogCommon();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
              -[PLIOReportStats subscribeToGroup:andSubGroup:withChannelIDs:manualChannelOnly:].cold.4(buf, v28, (uint64_t *)&v51, v31);
            }

            IOReportMergeChannels();
            CFRelease(v30);
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v38 objects:v49 count:16];
      }
      while (v25);
    }

    CFRelease(v22);
    id v13 = v36;
    id v12 = v37;
    id v15 = v34;
    id v14 = v35;
  }
  [(PLIOReportStats *)self setSubscription:IOReportCreateSubscription()];
  LOBYTE(v11) = v48[0] == 0;
  if (v48[0])
  {
    v32 = PLLogCommon();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[PLIOReportStats subscribeToGroup:andSubGroup:withChannelIDs:manualChannelOnly:]((uint64_t *)v48, v32);
    }

    CFRelease(v48[0]);
  }
  else
  {
    if (![(PLIOReportStats *)self subscription])
    {
LABEL_5:
      char v18 = 0;
      goto LABEL_6;
    }
    [(PLIOReportStats *)self setSubscribedChannels:0];

    v33 = PLLogCommon();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[PLIOReportStats subscribeToGroup:andSubGroup:withChannelIDs:manualChannelOnly:](self);
    }
  }
  char v18 = 1;
LABEL_6:

  return v18 & v11;
}

uint64_t __81__PLIOReportStats_subscribeToGroup_andSubGroup_withChannelIDs_manualChannelOnly___block_invoke(uint64_t a1)
{
  v2 = IOReportChannelGetGroup();
  objc_super v3 = IOReportChannelGetSubGroup();
  v4 = *(void **)(a1 + 32);
  if (v4
    && ([v4 isEqualToString:v2]
     && *(void *)(a1 + 40)
     && (objc_msgSend(v3, "isEqualToString:") & 1) != 0
     || (objc_super v5 = *(void **)(a1 + 32)) != 0
     && [v5 isEqualToString:v2]
     && !*(void *)(a1 + 40)))
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 16;
  }

  return v6;
}

- (void)clearSubscription
{
  [(PLIOReportStats *)self setSubscribedChannels:0];
  if ([(PLIOReportStats *)self subscription])
  {
    CFRelease([(PLIOReportStats *)self subscription]);
    [(PLIOReportStats *)self setSubscription:0];
  }
}

- (id)getCurrentStats
{
  Samples = self;
  if (self)
  {
    if ([(PLIOReportStats *)self subscription]
      && ([Samples subscribedChannels],
          objc_super v3 = objc_claimAutoreleasedReturnValue(),
          v3,
          v3))
    {
      [Samples subscription];
      v4 = [Samples subscribedChannels];
      Samples = (void *)IOReportCreateSamples();
    }
    else
    {
      Samples = 0;
    }
  }
  return Samples;
}

- (id)getDeltaStats
{
  objc_super v3 = [(PLIOReportStats *)self getCurrentStats];
  v4 = [(PLIOReportStats *)self ioReportSample];
  objc_super v5 = [(PLIOReportStats *)self _calculateDeltaFromPreviousStats:v4 toCurrentStats:v3];

  return v5;
}

- (double)getSampleDuration
{
  objc_super v3 = [(PLIOReportStats *)self sampleTimePrevious];
  if (v3)
  {
    v4 = [(PLIOReportStats *)self sampleTime];
    objc_super v5 = [(PLIOReportStats *)self sampleTimePrevious];
    [v4 timeIntervalSinceDate:v5];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (BOOL)updateStats
{
  return [(PLIOReportStats *)self updateStatsWithBlock:&__block_literal_global_15];
}

id __30__PLIOReportStats_updateStats__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  return v3;
}

- (BOOL)updateStatsWithBlock:(id)a3
{
  v4 = (void (**)(id, PLIOReportStats *, void *, void *))a3;
  objc_super v5 = [(PLIOReportStats *)self ioReportSample];
  [(PLIOReportStats *)self setPreviousIOReportSample:v5];

  double v6 = [(PLIOReportStats *)self getCurrentStats];
  if (v6)
  {
    double v7 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    uint64_t v8 = v4[2](v4, self, v6, v7);

    LOBYTE(v6) = v8 != 0;
    if (v8)
    {
      [(PLIOReportStats *)self setIoReportSample:v8];
      v9 = [(PLIOReportStats *)self sampleTime];
      [(PLIOReportStats *)self setSampleTimePrevious:v9];

      [(PLIOReportStats *)self setSampleTime:v7];
      double v7 = (void *)v8;
    }
  }
  return (char)v6;
}

- (id)parseIOReportSample
{
  id v3 = [(PLIOReportStats *)self ioReportSample];

  if (v3)
  {
    v4 = [(PLIOReportStats *)self ioReportSample];
    objc_super v5 = [(PLIOReportStats *)self _parseIOReportSampleFromStats:v4 convertingUnitToUnityScale:0];
  }
  else
  {
    objc_super v5 = 0;
  }
  return v5;
}

- (id)parseSimpleDeltaSample
{
  id v3 = [(PLIOReportStats *)self ioReportSample];

  if (v3)
  {
    v4 = [(PLIOReportStats *)self getDeltaStats];
    objc_super v5 = [(PLIOReportStats *)self _parseIOReportSampleFromStats:v4 convertingUnitToUnityScale:0];
  }
  else
  {
    objc_super v5 = 0;
  }
  return v5;
}

- (id)calculateDeltaFromPreviousSamples
{
  return [(PLIOReportStats *)self calculateDeltaFromPreviousSamplesConvertingUnitToUnityScale:0];
}

- (id)calculateDeltaFromPreviousSamplesConvertingUnitToUnityScale:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PLIOReportStats *)self ioReportSample];
  if (v5
    && (double v6 = (void *)v5,
        [(PLIOReportStats *)self previousIOReportSample],
        double v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    uint64_t v8 = [(PLIOReportStats *)self previousIOReportSample];
    v9 = [(PLIOReportStats *)self ioReportSample];
    id v10 = [(PLIOReportStats *)self _calculateDeltaFromPreviousStats:v8 toCurrentStats:v9];

    id v11 = [(PLIOReportStats *)self _parseIOReportSampleFromStats:v10 convertingUnitToUnityScale:v3];
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

- (id)_calculateDeltaFromPreviousStats:(id)a3 toCurrentStats:(id)a4
{
  SamplesDelta = 0;
  if (a3 && a4)
  {
    SamplesDelta = (void *)IOReportCreateSamplesDelta();
    uint64_t v4 = vars8;
  }
  return SamplesDelta;
}

- (id)_parseIOReportSampleFromStats:(id)a3 convertingUnitToUnityScale:(BOOL)a4
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v8 = [v4 dictionary];
  IOReportIterate();

  id v6 = v8;
  return v6;
}

void __76__PLIOReportStats__parseIOReportSampleFromStats_convertingUnitToUnityScale___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1C1869120]();
  int Format = IOReportChannelGetFormat();
  if (Format == 2)
  {
    context = v2;
    uint64_t Count = IOReportStateGetCount();
    id v10 = IOReportChannelGetChannelName();
    if ((int)Count >= 1)
    {
      uint64_t v11 = 0;
      unint64_t v12 = 0x1E4F29000uLL;
      do
      {
        id v13 = IOReportStateGetNameForIndex();
        if (!v13)
        {
          id v13 = objc_msgSend(*(id *)(v12 + 24), "stringWithFormat:", @"%d", v11);
        }
        id v14 = [*(id *)(v12 + 24) stringWithFormat:@"%@_%@", v10, v13];
        IOReportStateGetDutyCycle();
        uint64_t v15 = objc_msgSend(NSNumber, "numberWithDouble:");
        v16 = (void *)v15;
        id v17 = &unk_1F1580840;
        if (v15) {
          id v17 = (void *)v15;
        }
        id v18 = v17;

        [*(id *)(a1 + 40) setObject:v18 forKeyedSubscript:v14];
        uint64_t v19 = IOReportStateGetInTransitions();
        if (v19 != 0x8000000000000000)
        {
          uint64_t v20 = v19;
          [*(id *)(v12 + 24) stringWithFormat:@"%@_transitions", v14];
          id v21 = v10;
          uint64_t v22 = Count;
          v24 = unint64_t v23 = v12;
          uint64_t v25 = [NSNumber numberWithUnsignedLongLong:v20];
          [*(id *)(a1 + 40) setObject:v25 forKeyedSubscript:v24];

          unint64_t v12 = v23;
          uint64_t Count = v22;
          id v10 = v21;
        }

        uint64_t v11 = (v11 + 1);
      }
      while (Count != v11);
    }

    v2 = context;
  }
  else
  {
    int v4 = Format;
    if (Format == 1)
    {
      id v5 = IOReportChannelGetChannelName();
      uint64_t IntegerValue = IOReportSimpleGetIntegerValue();
      uint64_t Unit = IOReportChannelGetUnit();
      if (*(unsigned char *)(a1 + 48))
      {
        [*(id *)(a1 + 32) _convertValue:IntegerValue toUnityScaleFromUnit:Unit];
        objc_msgSend(NSNumber, "numberWithDouble:");
      }
      else
      {
        [NSNumber numberWithLongLong:IntegerValue];
      uint64_t v8 = };
      v27 = (void *)v8;
      if (v8) {
        v28 = (void *)v8;
      }
      else {
        v28 = &unk_1F1580840;
      }
      [*(id *)(a1 + 40) setObject:v28 forKeyedSubscript:v5];
    }
    else
    {
      uint64_t v26 = PLLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        __76__PLIOReportStats__parseIOReportSampleFromStats_convertingUnitToUnityScale___block_invoke_cold_1(v4, v26);
      }
    }
  }
}

- (double)_convertValue:(int64_t)a3 toUnityScaleFromUnit:(unint64_t)a4
{
  unint64_t v4 = a4 & 0xFFFFFFFFFFFFFFLL;
  if ((a4 & 0xFFFFFFFFFFFFFFLL) <= 0x7BFFFFFFFFLL)
  {
    if ((a4 & 0xFFFFFFFFFFFFFFLL) > 0x75FFFFFFFFLL)
    {
      if (v4 == 0x7600000000)
      {
        double v7 = (double)a3;
        double v8 = 1000000000.0;
      }
      else
      {
        if (v4 != 0x7900000000) {
          return (double)a3;
        }
        double v7 = (double)a3;
        double v8 = 1000000.0;
      }
    }
    else
    {
      if (v4 != 0x7300000000) {
        return (double)a3;
      }
      double v7 = (double)a3;
      double v8 = 1.0e12;
    }
  }
  else
  {
    if ((a4 & 0xFFFFFFFFFFFFFFLL) > 0x84FFFFFFFFLL)
    {
      switch(v4)
      {
        case 0x8500000000uLL:
          double v5 = (double)a3;
          double v6 = 1000000.0;
          return v5 * v6;
        case 0x8800000000uLL:
          double v5 = (double)a3;
          double v6 = 1000000000.0;
          return v5 * v6;
        case 0x8B00000000uLL:
          double v5 = (double)a3;
          double v6 = 1.0e12;
          return v5 * v6;
      }
      return (double)a3;
    }
    if (v4 != 0x7C00000000)
    {
      if (v4 == 0x8200000000)
      {
        double v5 = (double)a3;
        double v6 = 1000.0;
        return v5 * v6;
      }
      return (double)a3;
    }
    double v7 = (double)a3;
    double v8 = 1000.0;
  }
  return v7 / v8;
}

- (id)currentValueForSimpleChannel:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__6;
  id v14 = __Block_byref_object_dispose__6;
  id v15 = 0;
  if (v4)
  {
    double v5 = [(PLIOReportStats *)self getCurrentStats];
    id v9 = v4;
    IOReportIterate();

    double v6 = (void *)v11[5];
  }
  else
  {
    double v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __48__PLIOReportStats_currentValueForSimpleChannel___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1C1869120]();
  if (IOReportChannelGetFormat() == 1)
  {
    BOOL v3 = IOReportChannelGetChannelName();
    if ([v3 isEqualToString:*(void *)(a1 + 32)])
    {
      uint64_t v4 = [NSNumber numberWithLongLong:IOReportSimpleGetIntegerValue()];
      double v5 = (void *)v4;
      if (v4) {
        double v6 = (void *)v4;
      }
      else {
        double v6 = &unk_1F1580840;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v6);
    }
  }
}

- (id)deltaValueForSimpleChannel:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__6;
  id v14 = __Block_byref_object_dispose__6;
  id v15 = 0;
  if (v4)
  {
    double v5 = [(PLIOReportStats *)self getDeltaStats];
    id v9 = v4;
    IOReportIterate();

    double v6 = (void *)v11[5];
  }
  else
  {
    double v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __46__PLIOReportStats_deltaValueForSimpleChannel___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1C1869120]();
  if (IOReportChannelGetFormat() == 1)
  {
    BOOL v3 = IOReportChannelGetChannelName();
    if ([v3 isEqualToString:*(void *)(a1 + 32)])
    {
      uint64_t v4 = [NSNumber numberWithLongLong:IOReportSimpleGetIntegerValue()];
      double v5 = (void *)v4;
      if (v4) {
        double v6 = (void *)v4;
      }
      else {
        double v6 = &unk_1F1580840;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v6);
    }
  }
}

- (id)currentValueForStateChannel:(id)a3 atIndex:(int)a4
{
  id v5 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6;
  id v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  if (v5)
  {
    double v6 = [(PLIOReportStats *)self getCurrentStats];
    id v10 = v5;
    IOReportIterate();

    id v7 = (void *)v12[5];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __55__PLIOReportStats_currentValueForStateChannel_atIndex___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1C1869120]();
  if (IOReportChannelGetFormat() == 2)
  {
    BOOL v3 = IOReportChannelGetChannelName();
    if ([v3 isEqualToString:*(void *)(a1 + 32)])
    {
      uint64_t v4 = NSNumber;
      IOReportStateGetDutyCycle();
      uint64_t v5 = objc_msgSend(v4, "numberWithDouble:");
      double v6 = (void *)v5;
      if (v5) {
        id v7 = (void *)v5;
      }
      else {
        id v7 = &unk_1F1580840;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
    }
  }
}

- (id)deltaValueForStateChannel:(id)a3 atIndex:(int)a4
{
  id v5 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6;
  id v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  if (v5)
  {
    double v6 = [(PLIOReportStats *)self getDeltaStats];
    id v10 = v5;
    IOReportIterate();

    id v7 = (void *)v12[5];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __53__PLIOReportStats_deltaValueForStateChannel_atIndex___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1C1869120]();
  if (IOReportChannelGetFormat() == 2)
  {
    BOOL v3 = IOReportChannelGetChannelName();
    if ([v3 isEqualToString:*(void *)(a1 + 32)])
    {
      uint64_t v4 = NSNumber;
      IOReportStateGetDutyCycle();
      uint64_t v5 = objc_msgSend(v4, "numberWithDouble:");
      double v6 = (void *)v5;
      if (v5) {
        id v7 = (void *)v5;
      }
      else {
        id v7 = &unk_1F1580840;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
    }
  }
}

- (void)setSubscription:(__IOReportSubscriptionCF *)a3
{
  self->_subscription = a3;
}

- (void)setSubscribedChannels:(id)a3
{
}

- (NSString)driverName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDriverName:(id)a3
{
}

- (NSDictionary)previousIOReportSample
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPreviousIOReportSample:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousIOReportSample, 0);
  objc_storeStrong((id *)&self->_driverName, 0);
  objc_storeStrong((id *)&self->_subscribedChannels, 0);
  objc_storeStrong((id *)&self->_sampleTimePrevious, 0);
  objc_storeStrong((id *)&self->_sampleTime, 0);
  objc_storeStrong((id *)&self->_ioReportSample, 0);
}

- (void)subscribeToGroup:(void *)a1 andSubGroup:withChannelIDs:manualChannelOnly:.cold.1(void *a1)
{
  [a1 subscription];
  OUTLINED_FUNCTION_0_2(&dword_1BBD2F000, v1, v2, "IOReportSubscriptionRef returned subscription = %@ in PLIOReportStats", v3, v4, v5, v6, 2u);
}

- (void)subscribeToGroup:(void *)a1 andSubGroup:withChannelIDs:manualChannelOnly:.cold.2(void *a1)
{
  uint64_t v1 = [a1 subscribedChannels];
  OUTLINED_FUNCTION_0_2(&dword_1BBD2F000, v2, v3, "Subscribed to channels %@\n", v4, v5, v6, v7, 2u);
}

- (void)subscribeToGroup:(uint64_t *)a1 andSubGroup:(NSObject *)a2 withChannelIDs:manualChannelOnly:.cold.3(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "IOReportCreateSubscription returned error = %@ in PLIOReportStats", (uint8_t *)&v3, 0xCu);
}

- (void)subscribeToGroup:(uint8_t *)a1 andSubGroup:(void *)a2 withChannelIDs:(uint64_t *)a3 manualChannelOnly:(NSObject *)a4 .cold.4(uint8_t *a1, void *a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7 = [a2 unsignedLongLongValue];
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_debug_impl(&dword_1BBD2F000, a4, OS_LOG_TYPE_DEBUG, "Add manual channel with ID 0x%llx@\n", a1, 0xCu);
}

- (void)subscribeToGroup:(uint64_t *)a1 andSubGroup:(NSObject *)a2 withChannelIDs:manualChannelOnly:.cold.5(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "IOReportCopyFilteredChannels returned error = %@ in PLIOReportStats", (uint8_t *)&v3, 0xCu);
}

void __76__PLIOReportStats__parseIOReportSampleFromStats_convertingUnitToUnityScale___block_invoke_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "Failed to parse: unsupported IOReport channel format %u", (uint8_t *)v2, 8u);
}

@end