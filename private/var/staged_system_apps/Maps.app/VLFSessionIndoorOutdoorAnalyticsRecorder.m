@interface VLFSessionIndoorOutdoorAnalyticsRecorder
- (MapsRingBuffer)entries;
- (NSDate)lastUpdate;
- (VLFSessionIndoorOutdoorAnalyticsRecorder)init;
- (void)dealloc;
- (void)recordFrame:(id)a3;
- (void)setEntries:(id)a3;
- (void)setLastUpdate:(id)a3;
@end

@implementation VLFSessionIndoorOutdoorAnalyticsRecorder

- (VLFSessionIndoorOutdoorAnalyticsRecorder)init
{
  v8.receiver = self;
  v8.super_class = (Class)VLFSessionIndoorOutdoorAnalyticsRecorder;
  v2 = [(VLFSessionIndoorOutdoorAnalyticsRecorder *)&v8 init];
  if (v2)
  {
    uint64_t UInteger = GEOConfigGetUInteger();
    v4 = sub_100B9BDC8();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349312;
      v10 = v2;
      __int16 v11 = 2048;
      uint64_t v12 = UInteger;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Initializing with max entries: %lu", buf, 0x16u);
    }

    v5 = [[MapsRingBuffer alloc] initWithLength:UInteger];
    entries = v2->_entries;
    v2->_entries = v5;
  }
  return v2;
}

- (void)dealloc
{
  v3 = sub_100B9BDC8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)VLFSessionIndoorOutdoorAnalyticsRecorder;
  [(VLFSessionIndoorOutdoorAnalyticsRecorder *)&v4 dealloc];
}

- (void)recordFrame:(id)a3
{
  id v4 = a3;
  v5 = sub_100B9BDC8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v25 = 134349312;
    v26 = self;
    __int16 v27 = 2048;
    double v28 = *(double *)&v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Received frame: %p", (uint8_t *)&v25, 0x16u);
  }

  GEOConfigGetDouble();
  double v7 = v6;
  objc_super v8 = self;
  objc_sync_enter(v8);
  v9 = [(VLFSessionIndoorOutdoorAnalyticsRecorder *)v8 lastUpdate];
  if (!v9) {
    goto LABEL_7;
  }
  v10 = +[NSDate date];
  __int16 v11 = [(VLFSessionIndoorOutdoorAnalyticsRecorder *)v8 lastUpdate];
  [v10 timeIntervalSinceDate:v11];
  BOOL v13 = v12 < v7;

  if (v13)
  {
    v14 = sub_100B9BDC8();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v25 = 134349312;
      v26 = v8;
      __int16 v27 = 2048;
      double v28 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[%{public}p] Last frame update was too soon (< %0.2fs ago); ignoring",
        (uint8_t *)&v25,
        0x16u);
    }
  }
  else
  {
LABEL_7:
    v15 = +[NSDate date];
    [(VLFSessionIndoorOutdoorAnalyticsRecorder *)v8 setLastUpdate:v15];

    objc_sync_exit(v8);
    [v4 indoorConfidence];
    float v17 = v16;
    [v4 outdoorConfidence];
    float v19 = v18;
    BOOL v20 = v17 < v18;
    v21 = sub_100B9BDC8();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      CFStringRef v22 = @"Indoor";
      if (v17 < v19) {
        CFStringRef v22 = @"Outdoor";
      }
      int v25 = 134349314;
      v26 = v8;
      __int16 v27 = 2112;
      double v28 = *(double *)&v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}p] Recording frame with type: %@", (uint8_t *)&v25, 0x16u);
    }

    v23 = v8;
    objc_sync_enter(v23);
    v14 = [(VLFSessionIndoorOutdoorAnalyticsRecorder *)v23 entries];
    v24 = +[NSNumber numberWithInteger:v20];
    [v14 push:v24];
  }
  objc_sync_exit(v8);
}

- (NSDate)lastUpdate
{
  return self->_lastUpdate;
}

- (void)setLastUpdate:(id)a3
{
}

- (MapsRingBuffer)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);

  objc_storeStrong((id *)&self->_lastUpdate, 0);
}

@end