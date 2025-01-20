@interface CLFallNotifierSysdiagnoseLogCollector
+ (id)getSysdiagnoseOutputFilename;
+ (id)getSysdiagnoseOutputPath;
+ (void)writeAnomalyInfoToFileWithLastFallEvent:(ImpactEvent *)a3 writeMask:(unint64_t)a4 fallNotifierConfig:(Config *)a5 stateLogger:(id)a6 statsLogger:(id)a7 sensorsLogger:(id)a8 pressureLogger:(id)a9 heartRateLogger:(id)a10 wristStateLogger:(id)a11 odometerLogger:(id)a12 falsePositiveSuppressionFeaturesLogger:(id)a13 hgalLogger:(id)a14 logDirectory:(id)a15 logFilePrefix:(id)a16;
+ (void)writeOtherFallLoggerData:(id)a3 otherLoggerDirectory:(id)a4 otherLoggerFilePrefix:(id)a5 destinationLogger:(id)a6;
@end

@implementation CLFallNotifierSysdiagnoseLogCollector

+ (id)getSysdiagnoseOutputPath
{
  sub_1012FAA88((uint64_t)__p);
  if (v6 >= 0) {
    v2 = __p;
  }
  else {
    v2 = (void **)__p[0];
  }
  v3 = +[NSString stringWithFormat:@"%s", v2];
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  return v3;
}

+ (id)getSysdiagnoseOutputFilename
{
  v2 = +[NSDate date];
  id v3 = objc_alloc_init((Class)NSDateFormatter);
  [v3 setDateFormat:@"yyyyMMdd_HH-mm-ss"];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"CoreMotionDebug_AnomalyData_%@.bin", [v3 stringFromDate:v2]);
}

+ (void)writeAnomalyInfoToFileWithLastFallEvent:(ImpactEvent *)a3 writeMask:(unint64_t)a4 fallNotifierConfig:(Config *)a5 stateLogger:(id)a6 statsLogger:(id)a7 sensorsLogger:(id)a8 pressureLogger:(id)a9 heartRateLogger:(id)a10 wristStateLogger:(id)a11 odometerLogger:(id)a12 falsePositiveSuppressionFeaturesLogger:(id)a13 hgalLogger:(id)a14 logDirectory:(id)a15 logFilePrefix:(id)a16
{
  __int16 v19 = a4;
  id v21 = [[CLFallLogger alloc] initToDirectory:a15 prefix:a16 rotation:0];
  if (qword_1024190F0 != -1) {
    dispatch_once(&qword_1024190F0, &stru_1022DAEF8);
  }
  v22 = qword_1024190F8;
  if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = [a15 UTF8String];
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = [a16 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Logging anomaly info in file [%s] [%s]", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_1022DAEF8);
    }
    int v28 = 136315394;
    id v29 = [a15 UTF8String];
    __int16 v30 = 2080;
    id v31 = [a16 UTF8String];
    v24 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "+[CLFallNotifierSysdiagnoseLogCollector writeAnomalyInfoToFileWithLastFallEvent:writeMask:fallNotifierConfig:stateLogger:statsLogger:sensorsLogger:pressureLogger:heartRateLogger:wristStateLogger:odometerLogger:falsePositiveSuppressionFeaturesLogger:hgalLogger:logDirectory:logFilePrefix:]", "%s\n", v24);
    if (v24 != buf) {
      free(v24);
    }
  }
  if ((v19 & 0x80) != 0)
  {
    *(_WORD *)&buf[16] = 0;
    *(void *)buf = off_1022E7110;
    *(void *)&buf[8] = 0;
    buf[18] = 2;
    sub_100103240();
    *(_DWORD *)&buf[20] = sub_1000B5AD4();
    unsigned __int8 v27 = 0;
    sub_10006ACBC((unsigned __int8 *)&v28, "FallStatsEnabled", &v27, 0);
    char v33 = BYTE1(v28);
    unsigned __int8 v27 = 0;
    sub_10006ACBC((unsigned __int8 *)&v28, "FallStatsPressureEnabled", &v27, 0);
    char v34 = BYTE1(v28);
    unsigned __int8 v27 = 0;
    sub_10006ACBC((unsigned __int8 *)&v28, "FallStatsSensorRecordingEnabled", &v27, 0);
    char v35 = BYTE1(v28);
    char v36 = sub_100A39D2C();
    char v37 = sub_100A39DF0();
    unsigned __int8 v27 = 0;
    sub_10006ACBC((unsigned __int8 *)&v28, "AnomalyMotionInternalTest", &v27, 0);
    char v38 = BYTE1(v28);
    char v39 = 0;
    BOOL var1 = a5->var1;
    unint64_t var0 = a5->var0.var0;
    unsigned __int8 v42 = a5->var0.var1;
    BOOL v43 = a5->var0.var2 != 0;
    unsigned __int8 var3 = a5->var0.var3;
    BOOL v45 = a5->var0.var5 != 0;
    char v46 = 0;
    [v21 logData:[CLFallLoggerManager encodeBinaryLog:](CLFallLoggerManager, "encodeBinaryLog:", buf)];
  }
  if ((v19 & 2) != 0)
  {
    sub_100A5F794((uint64_t)buf, (uint64_t)a3);
    [v21 logData:+[CLFallLoggerManager encodeBinaryLog:](CLFallLoggerManager, "encodeBinaryLog:", buf)];
  }
  if ((v19 & 4) != 0) {
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:a6 otherLoggerDirectory:@"/var/root/Library/Caches/locationd/logs/newtonStats" otherLoggerFilePrefix:@"newtonState" destinationLogger:v21];
  }
  if ((v19 & 8) != 0) {
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:a7 otherLoggerDirectory:@"/var/root/Library/Caches/locationd/logs/newtonStats" otherLoggerFilePrefix:@"newtonStats" destinationLogger:v21];
  }
  if ((v19 & 0x10) != 0) {
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:a8 otherLoggerDirectory:@"/var/root/Library/Caches/locationd/logs/newtonStats" otherLoggerFilePrefix:@"newtonSensors" destinationLogger:v21];
  }
  if ((v19 & 0x20) != 0) {
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:a9 otherLoggerDirectory:@"/var/root/Library/Caches/locationd/logs/newtonStats" otherLoggerFilePrefix:@"pressure" destinationLogger:v21];
  }
  if ((v19 & 0x40) != 0) {
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:a10 otherLoggerDirectory:@"/var/root/Library/Caches/locationd/logs/newtonStats" otherLoggerFilePrefix:@"heartRate" destinationLogger:v21];
  }
  if ((v19 & 0x100) != 0) {
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:a11 otherLoggerDirectory:@"/var/root/Library/Caches/locationd/logs/newtonStats" otherLoggerFilePrefix:@"wristState" destinationLogger:v21];
  }
  if ((v19 & 0x400) != 0) {
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:a12 otherLoggerDirectory:@"/var/root/Library/Caches/locationd/logs/newtonStats" otherLoggerFilePrefix:@"odometer" destinationLogger:v21];
  }
  if ((v19 & 0x200) != 0) {
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:a13 otherLoggerDirectory:@"/var/root/Library/Caches/locationd/logs/newtonStats" otherLoggerFilePrefix:@"falsePositiveSuppressionFeatures" destinationLogger:v21];
  }
  if ((v19 & 0x800) != 0) {
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:a14 otherLoggerDirectory:@"/var/root/Library/Caches/locationd/logs/newtonStats" otherLoggerFilePrefix:@"hgal" destinationLogger:v21];
  }
  [v21 flushToFile];
  [v21 stopLogging];

  if (qword_1024190F0 != -1) {
    dispatch_once(&qword_1024190F0, &stru_1022DAEF8);
  }
  v23 = qword_1024190F8;
  if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Logging anomaly info done packing file", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_1022DAEF8);
    }
    LOWORD(v28) = 0;
    v25 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "+[CLFallNotifierSysdiagnoseLogCollector writeAnomalyInfoToFileWithLastFallEvent:writeMask:fallNotifierConfig:stateLogger:statsLogger:sensorsLogger:pressureLogger:heartRateLogger:wristStateLogger:odometerLogger:falsePositiveSuppressionFeaturesLogger:hgalLogger:logDirectory:logFilePrefix:]", "%s\n", v25);
    if (v25 != buf) {
      free(v25);
    }
  }
}

+ (void)writeOtherFallLoggerData:(id)a3 otherLoggerDirectory:(id)a4 otherLoggerFilePrefix:(id)a5 destinationLogger:(id)a6
{
  [a3 flushToFile];
  [a3 stopLogging];
  uint64_t v29 = 0;
  id v9 = [(NSArray *)[+[NSFileManager defaultManager] contentsOfDirectoryAtPath:a4 error:&v29] mutableCopy];
  if (!v29)
  {
    v10 = v9;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = [v9 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v14);
          if (![v15 rangeOfString:a5])
          {
            v34[0] = a4;
            v34[1] = v15;
            v16 = +[NSString pathWithComponents:](NSString, "pathWithComponents:", +[NSArray arrayWithObjects:v34 count:2]);
            v17 = +[NSData dataWithContentsOfFile:v16];
            if (v17)
            {
              v18 = v17;
              if (qword_1024190F0 != -1) {
                dispatch_once(&qword_1024190F0, &stru_1022DAEF8);
              }
              __int16 v19 = qword_1024190F8;
              if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEBUG))
              {
                v20 = [(NSString *)v16 UTF8String];
                *(_DWORD *)buf = 136315138;
                char v33 = v20;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Dumping [%s]", buf, 0xCu);
              }
              if (sub_10013D1A0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1024190F0 != -1) {
                  dispatch_once(&qword_1024190F0, &stru_1022DAEF8);
                }
                id v21 = [(NSString *)v16 UTF8String];
                int v30 = 136315138;
                id v31 = v21;
                v22 = (char *)_os_log_send_and_compose_impl();
                sub_1004BA5E4("Generic", 1, 0, 2, "+[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:]", "%s\n", v22);
                if (v22 != (char *)buf) {
                  free(v22);
                }
              }
              [a6 logData:v18];
            }
          }
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v23 = [v10 countByEnumeratingWithState:&v25 objects:v35 count:16];
        id v12 = v23;
      }
      while (v23);
    }
  }
}

@end