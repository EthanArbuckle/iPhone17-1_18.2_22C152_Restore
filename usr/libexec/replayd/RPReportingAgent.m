@interface RPReportingAgent
+ (void)reportSCSessionErroredWithEventType:(unsigned __int16)a3 endReason:(id)a4 streamID:(id)a5 payload:(id)a6;
+ (void)reportSessionEnded:(unsigned __int16)a3 endReason:(id)a4 withServiceName:(id)a5 clientBundleId:(id)a6;
+ (void)sendReportEventWithType:(unsigned __int16)a3 dictionary:(id)a4 withServiceName:(id)a5 clientBundleId:(id)a6 sessionID:(id)a7;
+ (void)sendReportSessionEnded:(unsigned __int16)a3 endReason:(id)a4 withServiceName:(id)a5 clientBundleId:(id)a6 sessionID:(id)a7 payload:(id)a8;
- (BOOL)backCameraUsed;
- (BOOL)frontCameraUsed;
- (CGSize)videoCaptureSize;
- (NSDate)captureStartTime;
- (NSString)serviceName;
- (RPReportingAgent)initWithServiceName:(id)a3;
- (id)collectSummaryEventMetrics;
- (id)thermalDescription;
- (int64_t)appAudioFrameCount;
- (int64_t)endReason;
- (int64_t)micFrameCount;
- (int64_t)videoCaptureRate;
- (int64_t)videoFrameCount;
- (unint64_t)recordedFileSize;
- (void)addToThermalResultsWithLevel:(int64_t)a3;
- (void)reportEventWithType:(unsigned __int16)a3 dictionary:(id)a4 clientBundleId:(id)a5;
- (void)reportSCEventWithType:(unsigned __int16)a3 dictionary:(id)a4 streamID:(id)a5;
- (void)resetReportingMetrics;
- (void)resetThermalResults;
- (void)setAppAudioFrameCount:(int64_t)a3;
- (void)setBackCameraUsed:(BOOL)a3;
- (void)setCaptureStartTime:(id)a3;
- (void)setEndReason:(int64_t)a3;
- (void)setFrontCameraUsed:(BOOL)a3;
- (void)setMicFrameCount:(int64_t)a3;
- (void)setRecordedFileSize:(unint64_t)a3;
- (void)setServiceName:(id)a3;
- (void)setVideoCaptureRate:(int64_t)a3;
- (void)setVideoCaptureSize:(CGSize)a3;
- (void)setVideoFrameCount:(int64_t)a3;
- (void)thermalPressureDidChangeWithLevel:(int64_t)a3;
@end

@implementation RPReportingAgent

- (RPReportingAgent)initWithServiceName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RPReportingAgent;
  v5 = [(RPReportingAgent *)&v11 init];
  if (v5)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v13 = "-[RPReportingAgent initWithServiceName:]";
      __int16 v14 = 1024;
      int v15 = 46;
      __int16 v16 = 2048;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    [(RPReportingAgent *)v5 setServiceName:v4];
    v6 = objc_alloc_init(RPThermalPressure);
    thermalPressureMonitor = v5->_thermalPressureMonitor;
    v5->_thermalPressureMonitor = v6;

    [(RPThermalPressure *)v5->_thermalPressureMonitor setDelegate:v5];
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    thermalResults = v5->_thermalResults;
    v5->_thermalResults = v8;

    [(RPReportingAgent *)v5 resetThermalResults];
  }

  return v5;
}

- (id)collectSummaryEventMetrics
{
  [(RPReportingAgent *)self addToThermalResultsWithLevel:[(RPThermalPressure *)self->_thermalPressureMonitor getCurrentPressureLevel]];
  id v20 = objc_alloc((Class)NSMutableDictionary);
  v30[0] = @"ActiveDuration";
  v23 = +[NSDate date];
  [v23 timeIntervalSinceDate:self->_captureStartTime];
  *(float *)&double v3 = v3;
  v22 = +[NSNumber numberWithLong:llroundf(*(float *)&v3)];
  v31[0] = v22;
  v30[1] = @"VideoCaptureWidth";
  [(RPReportingAgent *)self videoCaptureSize];
  *(float *)&double v4 = v4;
  v21 = +[NSNumber numberWithLong:llroundf(*(float *)&v4)];
  v31[1] = v21;
  v30[2] = @"VideoCaptureHeight";
  [(RPReportingAgent *)self videoCaptureSize];
  float v6 = v5;
  v19 = +[NSNumber numberWithLong:llroundf(v6)];
  v31[2] = v19;
  v30[3] = @"VideoCaptureRate";
  v18 = +[NSNumber numberWithInteger:[(RPReportingAgent *)self videoCaptureRate]];
  v31[3] = v18;
  v30[4] = @"VideoFrameCount";
  v7 = +[NSNumber numberWithInteger:[(RPReportingAgent *)self videoFrameCount]];
  v31[4] = v7;
  v31[5] = &off_100089C60;
  v30[5] = @"AppAudioCaptureRate";
  v30[6] = @"AppAudioFrameCount";
  v8 = +[NSNumber numberWithInteger:[(RPReportingAgent *)self appAudioFrameCount]];
  v31[6] = v8;
  v31[7] = &off_100089C60;
  v30[7] = @"MicCaptureRate";
  v30[8] = @"MicFrameCount";
  v9 = +[NSNumber numberWithInteger:[(RPReportingAgent *)self micFrameCount]];
  v31[8] = v9;
  v30[9] = @"FrontCameraUsed";
  v10 = +[NSNumber numberWithBool:[(RPReportingAgent *)self frontCameraUsed]];
  v31[9] = v10;
  v30[10] = @"BackCameraUsed";
  objc_super v11 = +[NSNumber numberWithBool:[(RPReportingAgent *)self backCameraUsed]];
  v31[10] = v11;
  v30[11] = @"RecordedFileSize";
  v12 = +[NSNumber numberWithUnsignedInteger:[(RPReportingAgent *)self recordedFileSize]];
  v31[11] = v12;
  v31[12] = &stru_100087990;
  v30[12] = @"BroadcastExtensionBundleID";
  v30[13] = @"ClientAppBundleID";
  v31[13] = &stru_100087990;
  v30[14] = @"EndReason";
  v13 = +[NSNumber numberWithInteger:[(RPReportingAgent *)self endReason]];
  v31[14] = v13;
  v30[15] = @"TPL";
  __int16 v14 = [(RPReportingAgent *)self thermalDescription];
  v31[15] = v14;
  int v15 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:16];
  id v16 = [v20 initWithDictionary:v15];

  if (!dword_100099BB8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v25 = "-[RPReportingAgent collectSummaryEventMetrics]";
    __int16 v26 = 1024;
    int v27 = 76;
    __int16 v28 = 2112;
    id v29 = v16;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d %@", buf, 0x1Cu);
  }

  return v16;
}

- (id)thermalDescription
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(NSMutableDictionary *)self->_thermalResults allKeys];
  id v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  double v4 = &stru_100087990;
  if (v3)
  {
    id v5 = v3;
    int v6 = 0;
    uint64_t v7 = *(void *)v17;
    do
    {
      v8 = 0;
      v9 = v4;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = [(NSMutableDictionary *)self->_thermalResults objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * (void)v8)];
        objc_super v11 = (void *)v10;
        v12 = ",";
        if (!(v6 + v8)) {
          v12 = "";
        }
        if (v10) {
          CFStringRef v13 = (const __CFString *)v10;
        }
        else {
          CFStringRef v13 = &stru_100087990;
        }
        double v4 = [(__CFString *)v9 stringByAppendingFormat:@"%s%@", v12, v13];

        v8 = (char *)v8 + 1;
        v9 = v4;
      }
      while (v5 != v8);
      id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      v6 += (int)v8;
    }
    while (v5);
  }

  return v4;
}

- (void)resetReportingMetrics
{
  self->_captureStartTime = (NSDate *)+[NSDate date];
  self->_videoCaptureSize = CGSizeZero;
  *(_WORD *)&self->_frontCameraUsed = 0;
  *(_OWORD *)&self->_videoCaptureRate = 0u;
  *(_OWORD *)&self->_appAudioFrameCount = 0u;
  *(_OWORD *)&self->_recordedFileSize = 0u;

  [(RPReportingAgent *)self resetThermalResults];
}

- (void)resetThermalResults
{
  [(RPThermalPressure *)self->_thermalPressureMonitor stopMonitoring];
  [(NSMutableDictionary *)self->_thermalResults removeAllObjects];
  [(NSMutableDictionary *)self->_thermalResults setObject:&off_100089C78 forKeyedSubscript:&off_100089C90];
  [(NSMutableDictionary *)self->_thermalResults setObject:&off_100089C78 forKeyedSubscript:&off_100089CA8];
  [(NSMutableDictionary *)self->_thermalResults setObject:&off_100089C78 forKeyedSubscript:&off_100089CC0];
  [(NSMutableDictionary *)self->_thermalResults setObject:&off_100089C78 forKeyedSubscript:&off_100089CD8];
  [(NSMutableDictionary *)self->_thermalResults setObject:&off_100089C78 forKeyedSubscript:&off_100089CF0];
  [(NSMutableDictionary *)self->_thermalResults setObject:&off_100089C78 forKeyedSubscript:&off_100089D08];
  id v3 = +[NSDate date];
  thermalLevelIntervalStartTime = self->_thermalLevelIntervalStartTime;
  self->_thermalLevelIntervalStartTime = v3;

  thermalPressureMonitor = self->_thermalPressureMonitor;

  [(RPThermalPressure *)thermalPressureMonitor startMonitoring];
}

- (void)reportEventWithType:(unsigned __int16)a3 dictionary:(id)a4 clientBundleId:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(RPReportingAgent *)self serviceName];
  +[RPReportingAgent sendReportEventWithType:v6 dictionary:v9 withServiceName:v10 clientBundleId:v8 sessionID:&stru_100087990];
}

- (void)reportSCEventWithType:(unsigned __int16)a3 dictionary:(id)a4 streamID:(id)a5
{
}

+ (void)sendReportEventWithType:(unsigned __int16)a3 dictionary:(id)a4 withServiceName:(id)a5 clientBundleId:(id)a6 sessionID:(id)a7
{
  uint64_t v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  int v15 = v14;
  if (v11)
  {
    if ([v14 length])
    {
      unint64_t v16 = (unint64_t)[v15 hash];
      uint64_t v17 = v16 + (v16 / 0xFFFFFFFF);
    }
    else
    {
      uint64_t v17 = 0;
    }
    v34[0] = kRTCReportingSessionInfoClientType;
    v34[1] = kRTCReportingSessionInfoClientVersion;
    v35[0] = &off_100089D20;
    v35[1] = &off_100089D38;
    v34[2] = kRTCReportingSessionInfoSessionID;
    long long v18 = +[NSNumber numberWithUnsignedInt:v17];
    v35[2] = v18;
    v35[3] = &__kCFBooleanTrue;
    v34[3] = kRTCReportingSessionInfoBatchEvent;
    v34[4] = kRTCReportingSessionInfoRequireUserInfo;
    v34[5] = kRTCReportingSessionInfoClientBundleID;
    v35[4] = &__kCFBooleanTrue;
    v35[5] = v13;
    long long v19 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:6];

    v32[0] = kRTCReportingUserInfoClientName;
    v32[1] = kRTCReportingUserInfoServiceName;
    v33[0] = @"ReplayKit";
    v33[1] = v12;
    id v20 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
    id v23 = 0;
    unsigned __int8 v21 = +[RTCReporting sendOneMessageWithSessionInfo:v19 userInfo:v20 category:v10 type:0 payload:v11 error:&v23];
    id v22 = v23;
    if (v21)
    {
      if (!dword_100099BB8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        v25 = "+[RPReportingAgent sendReportEventWithType:dictionary:withServiceName:clientBundleId:sessionID:]";
        __int16 v26 = 1024;
        int v27 = 158;
        __int16 v28 = 1024;
        int v29 = v10;
        __int16 v30 = 2112;
        id v31 = v11;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d reported eventType:%d payloadDict=%@", buf, 0x22u);
      }
    }
    else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100051728(v10, v22);
    }
  }
  else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100051690();
  }
}

+ (void)sendReportSessionEnded:(unsigned __int16)a3 endReason:(id)a4 withServiceName:(id)a5 clientBundleId:(id)a6 sessionID:(id)a7 payload:(id)a8
{
  uint64_t v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136446722;
    unsigned __int8 v21 = "+[RPReportingAgent sendReportSessionEnded:endReason:withServiceName:clientBundleId:sessionID:payload:]";
    __int16 v22 = 1024;
    int v23 = 163;
    __int16 v24 = 2048;
    id v25 = [v13 code];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d reporting with endReason=%ld", (uint8_t *)&v20, 0x1Cu);
  }
  id v18 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v17];
  long long v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v13 code]);
  [v18 setObject:v19 forKeyedSubscript:@"EndReason"];

  +[RPReportingAgent sendReportEventWithType:v12 dictionary:v18 withServiceName:v14 clientBundleId:v15 sessionID:v16];
}

+ (void)reportSessionEnded:(unsigned __int16)a3 endReason:(id)a4 withServiceName:(id)a5 clientBundleId:(id)a6
{
}

+ (void)reportSCSessionErroredWithEventType:(unsigned __int16)a3 endReason:(id)a4 streamID:(id)a5 payload:(id)a6
{
}

- (void)thermalPressureDidChangeWithLevel:(int64_t)a3
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446722;
    uint64_t v6 = "-[RPReportingAgent thermalPressureDidChangeWithLevel:]";
    __int16 v7 = 1024;
    int v8 = 180;
    __int16 v9 = 2048;
    int64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d level=%ld", (uint8_t *)&v5, 0x1Cu);
  }
  [(RPReportingAgent *)self addToThermalResultsWithLevel:a3];
}

- (void)addToThermalResultsWithLevel:(int64_t)a3
{
  int v5 = +[NSDate date];
  [v5 timeIntervalSinceDate:self->_thermalLevelIntervalStartTime];
  *(float *)&double v6 = v6;
  double v7 = (double)(uint64_t)llroundf(*(float *)&v6);

  thermalResults = self->_thermalResults;
  __int16 v9 = +[NSNumber numberWithInteger:a3];
  int64_t v10 = [(NSMutableDictionary *)thermalResults objectForKeyedSubscript:v9];
  [v10 doubleValue];
  double v12 = v11 + v7;

  id v13 = +[NSNumber numberWithDouble:v12];
  id v14 = self->_thermalResults;
  id v15 = +[NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];

  self->_thermalLevelIntervalStartTime = +[NSDate date];

  _objc_release_x1();
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSDate)captureStartTime
{
  return self->_captureStartTime;
}

- (void)setCaptureStartTime:(id)a3
{
  self->_captureStartTime = (NSDate *)a3;
}

- (CGSize)videoCaptureSize
{
  double width = self->_videoCaptureSize.width;
  double height = self->_videoCaptureSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setVideoCaptureSize:(CGSize)a3
{
  self->_videoCaptureSize = a3;
}

- (int64_t)videoCaptureRate
{
  return self->_videoCaptureRate;
}

- (void)setVideoCaptureRate:(int64_t)a3
{
  self->_videoCaptureRate = a3;
}

- (int64_t)videoFrameCount
{
  return self->_videoFrameCount;
}

- (void)setVideoFrameCount:(int64_t)a3
{
  self->_videoFrameCount = a3;
}

- (int64_t)appAudioFrameCount
{
  return self->_appAudioFrameCount;
}

- (void)setAppAudioFrameCount:(int64_t)a3
{
  self->_appAudioFrameCount = a3;
}

- (int64_t)micFrameCount
{
  return self->_micFrameCount;
}

- (void)setMicFrameCount:(int64_t)a3
{
  self->_micFrameCount = a3;
}

- (BOOL)frontCameraUsed
{
  return self->_frontCameraUsed;
}

- (void)setFrontCameraUsed:(BOOL)a3
{
  self->_frontCameraUsed = a3;
}

- (BOOL)backCameraUsed
{
  return self->_backCameraUsed;
}

- (void)setBackCameraUsed:(BOOL)a3
{
  self->_backCameraUsed = a3;
}

- (unint64_t)recordedFileSize
{
  return self->_recordedFileSize;
}

- (void)setRecordedFileSize:(unint64_t)a3
{
  self->_recordedFileSize = a3;
}

- (int64_t)endReason
{
  return self->_endReason;
}

- (void)setEndReason:(int64_t)a3
{
  self->_endReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_thermalLevelIntervalStartTime, 0);
  objc_storeStrong((id *)&self->_thermalResults, 0);

  objc_storeStrong((id *)&self->_thermalPressureMonitor, 0);
}

@end