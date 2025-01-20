@interface PearlCoreAnalyticsEvent
- (BOOL)postEvent;
- (PearlCoreAnalyticsEvent)initWithName:(id)a3;
- (PearlCoreAnalyticsEvent)initWithName:(id)a3 awdMetric:(id)a4;
- (id)getAWDMetric;
- (id)getEventDictionary;
- (void)logAnalyticsDictionary:(id)a3;
- (void)prepareEventDictionary;
- (void)reset;
@end

@implementation PearlCoreAnalyticsEvent

- (PearlCoreAnalyticsEvent)initWithName:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PearlCoreAnalyticsEvent;
  v5 = [(BiometricKitCoreAnalyticsEvent *)&v15 initWithName:v4];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = (int)*MEMORY[0x263F2AAF0];
    v8 = *(Class *)((char *)&v5->super.super.isa + v7);
    *(Class *)((char *)&v5->super.super.isa + v7) = (Class)&unk_26D5C1068;

    uint64_t v9 = [&unk_26D5C13E0 objectForKey:v4];
    awdMetricName = v6->_awdMetricName;
    v6->_awdMetricName = (NSString *)v9;

    if (v6->_awdMetricName)
    {
      uint64_t v11 = [[&unk_26D5C13B8 objectForKey:];
      awdMetricId = v6->_awdMetricId;
      v6->_awdMetricId = (NSNumber *)v11;

      if (!v6->_awdMetricId)
      {
        if (__osLog) {
          v14 = __osLog;
        }
        else {
          v14 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v17 = "_awdMetricId";
          __int16 v18 = 2048;
          uint64_t v19 = 0;
          __int16 v20 = 2080;
          v21 = &unk_222DFB9BF;
          __int16 v22 = 2080;
          v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/CoreAnalyticsEvents/PearlCoreAnalyticsEvent.m";
          __int16 v24 = 1024;
          int v25 = 37;
          _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

        v6 = 0;
      }
    }
  }

  return v6;
}

- (PearlCoreAnalyticsEvent)initWithName:(id)a3 awdMetric:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = [(PearlCoreAnalyticsEvent *)self initWithName:a3];
  uint64_t v9 = v8;
  if (v8)
  {
    if (v7)
    {
      objc_storeStrong((id *)&v8->_awdMetric, a4);
    }
    else
    {
      if (__osLog) {
        uint64_t v11 = __osLog;
      }
      else {
        uint64_t v11 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316162;
        v13 = "awdMetric";
        __int16 v14 = 2048;
        uint64_t v15 = 0;
        __int16 v16 = 2080;
        v17 = &unk_222DFB9BF;
        __int16 v18 = 2080;
        uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/CoreAnalyticsEvents/PearlCoreAnalyticsEvent.m";
        __int16 v20 = 1024;
        int v21 = 51;
        _os_log_impl(&dword_222D7E000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
      }

      uint64_t v9 = 0;
    }
  }

  return v9;
}

- (void)reset
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (__osLog) {
    v3 = __osLog;
  }
  else {
    v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F2AAE8]);
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v4;
    _os_log_impl(&dword_222D7E000, v3, OS_LOG_TYPE_DEBUG, "PearlCoreAnalyticsEvent reset event: %@\n", buf, 0xCu);
  }
  v8.receiver = self;
  v8.super_class = (Class)PearlCoreAnalyticsEvent;
  [(BiometricKitCoreAnalyticsEvent *)&v8 reset];
  awdMetric = self->_awdMetric;
  self->_awdMetric = 0;

  awdMetricDictionary = self->_awdMetricDictionary;
  self->_awdMetricDictionary = 0;

  eventDictionary = self->_eventDictionary;
  self->_eventDictionary = 0;
}

- (BOOL)postEvent
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = MEMORY[0x263EF8438];
  if (__osLog) {
    uint64_t v4 = __osLog;
  }
  else {
    uint64_t v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(const char **)((char *)&self->super.super.isa + (int)*MEMORY[0x263F2AAE8]);
    *(_DWORD *)buf = 138412290;
    __int16 v14 = v5;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "PearlCoreAnalyticsEvent postEvent: %@\n", buf, 0xCu);
  }
  [(PearlCoreAnalyticsEvent *)self prepareEventDictionary];
  if (self->_eventDictionary)
  {
    v12.receiver = self;
    v12.super_class = (Class)PearlCoreAnalyticsEvent;
    if ([(BiometricKitCoreAnalyticsEvent *)&v12 postEvent])
    {
      if (__osLogTrace) {
        v3 = __osLogTrace;
      }
      BOOL v6 = 1;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = *(const char **)((char *)&self->super.super.isa + (int)*MEMORY[0x263F2AAE8]);
        *(_DWORD *)buf = 138412546;
        __int16 v14 = v7;
        __int16 v15 = 1024;
        LODWORD(v16) = 1;
        _os_log_impl(&dword_222D7E000, v3, OS_LOG_TYPE_DEFAULT, "PearlCoreAnalyticsEvent postEvent: %@ result:%d\n", buf, 0x12u);
      }
      return v6;
    }
  }
  else
  {
    if (__osLog) {
      objc_super v8 = __osLog;
    }
    else {
      objc_super v8 = v3;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v14 = "_eventDictionary";
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      __int16 v18 = &unk_222DFB9BF;
      __int16 v19 = 2080;
      __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/CoreAnalyticsEvents/PearlCoreAnalyticsEvent.m";
      __int16 v21 = 1024;
      int v22 = 75;
      _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if (__osLogTrace) {
    uint64_t v9 = __osLogTrace;
  }
  else {
    uint64_t v9 = v3;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = *(const char **)((char *)&self->super.super.isa + (int)*MEMORY[0x263F2AAE8]);
    *(_DWORD *)buf = 138412546;
    __int16 v14 = v10;
    __int16 v15 = 1024;
    LODWORD(v16) = 0;
    _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_ERROR, "PearlCoreAnalyticsEvent postEvent: %@ result:%d\n", buf, 0x12u);
  }
  return 0;
}

- (void)prepareEventDictionary
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v4 = [(BiometricKitCoreAnalyticsEvent *)self dictionaryRepresentation];
  v5 = [v3 dictionaryWithDictionary:v4];

  BOOL v6 = [(PBCodable *)self->_awdMetric dictionaryRepresentation];
  awdMetricDictionary = self->_awdMetricDictionary;
  self->_awdMetricDictionary = v6;

  objc_super v8 = self->_awdMetricDictionary;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  __int16 v14 = __49__PearlCoreAnalyticsEvent_prepareEventDictionary__block_invoke;
  __int16 v15 = &unk_26466FB10;
  id v16 = v5;
  __int16 v17 = self;
  id v9 = v5;
  [(NSDictionary *)v8 enumerateKeysAndObjectsUsingBlock:&v12];
  [NSDictionary dictionaryWithDictionary:v9, v12, v13, v14, v15];
  uint64_t v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  eventDictionary = self->_eventDictionary;
  self->_eventDictionary = v10;
}

void __49__PearlCoreAnalyticsEvent_prepareEventDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) setObject:v6 forKey:v5];
  }
  else
  {
    if (__osLog) {
      id v7 = __osLog;
    }
    else {
      id v7 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + (int)*MEMORY[0x263F2AAE8]);
      id v9 = v7;
      int v11 = 138412802;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = (id)objc_opt_class();
      id v10 = v16;
      _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_DEBUG, "PearlCoreAnalyticsEvent(%@) getEventDictionary remove unsupported field: %@ of class: %@\n", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (id)getEventDictionary
{
  return self->_eventDictionary;
}

- (void)logAnalyticsDictionary:(id)a3
{
}

- (id)getAWDMetric
{
  return self->_awdMetric;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDictionary, 0);
  objc_storeStrong((id *)&self->_awdMetricId, 0);
  objc_storeStrong((id *)&self->_awdMetricName, 0);
  objc_storeStrong((id *)&self->_awdMetricDictionary, 0);

  objc_storeStrong((id *)&self->_awdMetric, 0);
}

@end