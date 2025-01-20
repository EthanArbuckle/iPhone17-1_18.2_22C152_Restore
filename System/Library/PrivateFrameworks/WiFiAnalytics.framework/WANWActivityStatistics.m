@interface WANWActivityStatistics
- (NSArray)activityUUIDs;
- (NSArray)externallyVisibleActivityUUIDs;
- (PBCodable)awdReport;
- (WANWActivityStatistics)initWithPBCodableData:(id)a3;
- (WANWActivityStatistics)initWithWAActivityReport:(const void *)a3 length:(unint64_t)a4;
- (_TtC13WiFiAnalytics21WANWActivityTransform)obj;
- (id)expandKeyNameLengths:(id)a3;
- (id)getTransformedFlattened:(int)a3;
- (id)getTransformedFlattenedFrom:(id)a3 style:(int)a4;
- (id)getTransformedFlattenedFrom:(id)a3 style:(int)a4 index:(unsigned int)a5;
- (unsigned)awdMetricID;
- (void)setActivityUUIDs:(id)a3;
- (void)setAwdMetricID:(unsigned int)a3;
- (void)setAwdReport:(id)a3;
- (void)setExternallyVisibleActivityUUIDs:(id)a3;
- (void)setObj:(id)a3;
@end

@implementation WANWActivityStatistics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obj, 0);
  objc_storeStrong((id *)&self->_externallyVisibleActivityUUIDs, 0);
  objc_storeStrong((id *)&self->_activityUUIDs, 0);
  objc_storeStrong((id *)&self->_awdReport, 0);
}

- (WANWActivityStatistics)initWithPBCodableData:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WANWActivityStatistics;
  v5 = [(WANWActivityStatistics *)&v12 init];
  v6 = v5;
  if (v4 && v5 && [v4 length])
  {
    v7 = [[WiFiAnalyticsAWDWiFiNWActivity alloc] initWithData:v4];
    awdReport = v6->_awdReport;
    v6->_awdReport = &v7->super;

    v6->_fromInitWithPBCodableData = 1;
  }
  else
  {
    v9 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [v4 length];
      *(_DWORD *)buf = 136446978;
      v14 = "-[WANWActivityStatistics initWithPBCodableData:]";
      __int16 v15 = 1024;
      int v16 = 63;
      __int16 v17 = 1024;
      BOOL v18 = v6 != 0;
      __int16 v19 = 2048;
      uint64_t v20 = v10;
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:initWithPBCodableData Failed self %d length %lu", buf, 0x22u);
    }
  }
  return v6;
}

- (PBCodable)awdReport
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  BOOL fromInitWithPBCodableData = self->_fromInitWithPBCodableData;
  awdReport = self->_awdReport;
  if (fromInitWithPBCodableData)
  {
    v5 = awdReport;
    goto LABEL_18;
  }
  if (!awdReport)
  {
    v6 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v26 = "-[WANWActivityStatistics awdReport]";
      __int16 v27 = 1024;
      int v28 = 124;
      _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:_awdReport missing Debug", buf, 0x12u);
    }

    awdReport = self->_awdReport;
    if (!awdReport)
    {
      __int16 v19 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v26 = "-[WANWActivityStatistics awdReport]";
        __int16 v27 = 1024;
        int v28 = 128;
        uint64_t v20 = "%{public}s::%d:_awdReport missing";
LABEL_25:
        _os_log_impl(&dword_21D96D000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0x12u);
      }
LABEL_26:

      v5 = 0;
      goto LABEL_18;
    }
  }
  v7 = [(PBCodable *)awdReport activities];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    __int16 v19 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v26 = "-[WANWActivityStatistics awdReport]";
      __int16 v27 = 1024;
      int v28 = 132;
      uint64_t v20 = "%{public}s::%d:_awdReport has activities already";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v9 = [(WANWActivityStatistics *)self externallyVisibleActivityUUIDs];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = self->_awdReport;
        __int16 v15 = [*(id *)(*((void *)&v21 + 1) + 8 * i) UUIDString];
        [(PBCodable *)v14 addActivities:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v11);
  }

  [(WANWActivityStatistics *)self setAwdMetricID:589927];
  int v16 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    __int16 v17 = self->_awdReport;
    *(_DWORD *)buf = 136446722;
    v26 = "-[WANWActivityStatistics awdReport]";
    __int16 v27 = 1024;
    int v28 = 143;
    __int16 v29 = 2114;
    v30 = v17;
    _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Generated wifi nw_activity report: %{public}@", buf, 0x1Cu);
  }

  v5 = self->_awdReport;
LABEL_18:
  return v5;
}

- (WANWActivityStatistics)initWithWAActivityReport:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)WANWActivityStatistics;
  v6 = [(WANWActivityStatistics *)&v20 init];
  v7 = v6;
  if (v6)
  {
    v6->_BOOL fromInitWithPBCodableData = 0;
    uint64_t v8 = (void *)MEMORY[0x223C0F2E0]();
    v9 = [MEMORY[0x263EFF8F8] dataWithBytes:a3 length:a4];
    if (!v9)
    {
      uint64_t v11 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        long long v22 = "-[WANWActivityStatistics initWithWAActivityReport:length:]";
        __int16 v23 = 1024;
        int v24 = 97;
        _os_log_impl(&dword_21D96D000, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:resultData failed", buf, 0x12u);
      }
      goto LABEL_18;
    }
    id v19 = 0;
    uint64_t v10 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v19];
    uint64_t v11 = v19;
    awdReport = v7->_awdReport;
    v7->_awdReport = (PBCodable *)v10;

    if (v7->_awdReport) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (!v13)
    {
      __int16 v17 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        long long v22 = "-[WANWActivityStatistics initWithWAActivityReport:length:]";
        __int16 v23 = 1024;
        int v24 = 100;
        __int16 v25 = 2112;
        v26 = v11;
        _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive WAMessageAWD: %@", buf, 0x1Cu);
      }

LABEL_18:
      __int16 v15 = 0;
      goto LABEL_12;
    }

    v14 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      long long v22 = "-[WANWActivityStatistics initWithWAActivityReport:length:]";
      __int16 v23 = 1024;
      int v24 = 102;
      _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_INFO, "%{public}s::%d:Success", buf, 0x12u);
    }
  }
  __int16 v15 = v7;
LABEL_12:

  return v15;
}

- (unsigned)awdMetricID
{
  if (self->_awdMetricID) {
    return self->_awdMetricID;
  }
  else {
    return 589927;
  }
}

- (id)getTransformedFlattenedFrom:(id)a3 style:(int)a4
{
  return [(WANWActivityStatistics *)self getTransformedFlattenedFrom:a3 style:*(void *)&a4 index:1];
}

- (id)getTransformedFlattenedFrom:(id)a3 style:(int)a4 index:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (void *)MEMORY[0x223C0F2E0]();
  uint64_t v10 = [(WANWActivityStatistics *)self obj];

  if (!v10)
  {
    if (os_signpost_enabled(&_os_log_internal))
    {
      LOWORD(v20) = 0;
      _os_signpost_emit_with_name_impl(&dword_21D96D000, &_os_log_internal, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "getTransformedFlattenedFrom init", "", (uint8_t *)&v20, 2u);
    }
    uint64_t v11 = [_TtC13WiFiAnalytics21WANWActivityTransform alloc];
    uint64_t v12 = [(WANWActivityStatistics *)self awdReport];
    BOOL v13 = [v12 dictionaryRepresentation];
    v14 = [(WANWActivityTransform *)v11 initWithLater:v13 early:v8];
    [(WANWActivityStatistics *)self setObj:v14];

    if (os_signpost_enabled(&_os_log_internal))
    {
      LOWORD(v20) = 0;
      _os_signpost_emit_with_name_impl(&dword_21D96D000, &_os_log_internal, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "getTransformedFlattenedFrom init", "", (uint8_t *)&v20, 2u);
    }
  }
  if (os_signpost_enabled(&_os_log_internal))
  {
    LOWORD(v20) = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, &_os_log_internal, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "getTransformedFlattenedFrom Transform", "", (uint8_t *)&v20, 2u);
  }
  __int16 v15 = [(WANWActivityStatistics *)self obj];

  if (!v15)
  {
    int v16 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136446466;
      long long v21 = "-[WANWActivityStatistics getTransformedFlattenedFrom:style:index:]";
      __int16 v22 = 1024;
      int v23 = 189;
      _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to create WANWActivityTransform", (uint8_t *)&v20, 0x12u);
    }
    BOOL v18 = 0;
    goto LABEL_19;
  }
  switch(a4)
  {
    case 2:
      int v16 = [(WANWActivityStatistics *)self obj];
      uint64_t v17 = [v16 getTransformedMeasurementForLogging];
      goto LABEL_18;
    case 1:
      int v16 = [(WANWActivityStatistics *)self obj];
      uint64_t v17 = [v16 getTransformedMeasurementWithIndex:v5];
      goto LABEL_18;
    case 0:
      int v16 = [(WANWActivityStatistics *)self obj];
      uint64_t v17 = [v16 getTransformedMeasurementForTelemetryWithIndex:v5];
LABEL_18:
      BOOL v18 = (void *)v17;
LABEL_19:

      goto LABEL_20;
  }
  BOOL v18 = 0;
LABEL_20:
  if (os_signpost_enabled(&_os_log_internal))
  {
    LOWORD(v20) = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, &_os_log_internal, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "getTransformedFlattenedFrom Transform", "", (uint8_t *)&v20, 2u);
  }

  return v18;
}

- (id)getTransformedFlattened:(int)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)MEMORY[0x223C0F2E0](self, a2);
  if (os_signpost_enabled(&_os_log_internal))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, &_os_log_internal, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "getTransformedFlattened init", "", (uint8_t *)&v17, 2u);
  }
  v6 = [(WANWActivityStatistics *)self obj];

  if (!v6)
  {
    v7 = [_TtC13WiFiAnalytics21WANWActivityTransform alloc];
    id v8 = [(WANWActivityStatistics *)self awdReport];
    v9 = [v8 dictionaryRepresentation];
    uint64_t v10 = [(WANWActivityTransform *)v7 initWithSingle:v9];
    [(WANWActivityStatistics *)self setObj:v10];
  }
  if (os_signpost_enabled(&_os_log_internal))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, &_os_log_internal, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "getTransformedFlattened init", "", (uint8_t *)&v17, 2u);
  }
  if (os_signpost_enabled(&_os_log_internal))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, &_os_log_internal, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "getTransformedFlattened Transform", "", (uint8_t *)&v17, 2u);
  }
  uint64_t v11 = [(WANWActivityStatistics *)self obj];

  if (!v11)
  {
    uint64_t v12 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136446466;
      BOOL v18 = "-[WANWActivityStatistics getTransformedFlattened:]";
      __int16 v19 = 1024;
      int v20 = 228;
      _os_log_impl(&dword_21D96D000, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to create WANWActivityTransform", (uint8_t *)&v17, 0x12u);
    }
    goto LABEL_22;
  }
  switch(a3)
  {
    case 2:
      uint64_t v12 = [(WANWActivityStatistics *)self obj];
      uint64_t v13 = [v12 getTransformedMeasurementForLogging];
      goto LABEL_17;
    case 1:
      __int16 v15 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136446466;
        BOOL v18 = "-[WANWActivityStatistics getTransformedFlattened:]";
        __int16 v19 = 1024;
        int v20 = 218;
        _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:Invalid style for single parameter, timeOffset invalid", (uint8_t *)&v17, 0x12u);
      }

      uint64_t v12 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v17) = 0;
        _os_log_fault_impl(&dword_21D96D000, v12, OS_LOG_TYPE_FAULT, "Invalid style for single parameter, timeOffset invalid", (uint8_t *)&v17, 2u);
      }
LABEL_22:
      v14 = 0;
      goto LABEL_23;
    case 0:
      uint64_t v12 = [(WANWActivityStatistics *)self obj];
      uint64_t v13 = [v12 getTransformedMeasurementForTelemetryWithIndex:0];
LABEL_17:
      v14 = (void *)v13;
LABEL_23:

      goto LABEL_24;
  }
  v14 = 0;
LABEL_24:
  if (os_signpost_enabled(&_os_log_internal))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, &_os_log_internal, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "getTransformedFlattened Transform", "", (uint8_t *)&v17, 2u);
  }
  return v14;
}

- (id)expandKeyNameLengths:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x223C0F2E0]();
  v6 = [(WANWActivityStatistics *)self obj];

  if (v6)
  {
    if (os_signpost_enabled(&_os_log_internal))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_21D96D000, &_os_log_internal, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "expandKeyNameLengths", "", (uint8_t *)&v11, 2u);
    }
    v7 = [(WANWActivityStatistics *)self obj];
    id v8 = [v7 expandKeyNameLengthsFrom:v4];

    if (os_signpost_enabled(&_os_log_internal))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_21D96D000, &_os_log_internal, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "expandKeyNameLengths", "", (uint8_t *)&v11, 2u);
    }
  }
  else
  {
    v9 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446466;
      uint64_t v12 = "-[WANWActivityStatistics expandKeyNameLengths:]";
      __int16 v13 = 1024;
      int v14 = 247;
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:No WATransformForTelemetry alloctated", (uint8_t *)&v11, 0x12u);
    }

    id v8 = 0;
  }

  return v8;
}

- (void)setAwdReport:(id)a3
{
}

- (void)setAwdMetricID:(unsigned int)a3
{
  self->_awdMetricID = a3;
}

- (NSArray)activityUUIDs
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActivityUUIDs:(id)a3
{
}

- (NSArray)externallyVisibleActivityUUIDs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExternallyVisibleActivityUUIDs:(id)a3
{
}

- (_TtC13WiFiAnalytics21WANWActivityTransform)obj
{
  return self->_obj;
}

- (void)setObj:(id)a3
{
}

@end