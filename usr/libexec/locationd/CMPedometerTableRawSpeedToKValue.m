@interface CMPedometerTableRawSpeedToKValue
+ (id)sharedInstance;
- ($F24F406B2B787EFB06265DBA3D28CBD5)binIntervalForRawSpeed:(double)a3;
- (BOOL)isBinaryLogging;
- (BOOL)isRawSpeedValid:(double)a3;
- (BOOL)isRunCalibrationAvailable;
- (BOOL)isWalkCalibrationAvailable;
- (CMPedometerTableRawSpeedToKValue)initWithTestMode:(BOOL)a3;
- (void)binsDidChange;
- (void)logBins;
- (void)updateBinsWithTrack:(id)a3;
@end

@implementation CMPedometerTableRawSpeedToKValue

- (BOOL)isBinaryLogging
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_102484FD8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_102484FD8))
  {
    unsigned __int8 v3 = 0;
    sub_10006ACBC((unsigned __int8 *)&unk_102484FD0, "LogBinaryPedometerCalibrationTables", &v3, 0);
    __cxa_guard_release(&qword_102484FD8);
  }
  return byte_102484FD1;
}

+ (id)sharedInstance
{
  if (qword_102484FE8 != -1) {
    dispatch_once(&qword_102484FE8, &stru_10230DC08);
  }
  return (id)qword_102484FE0;
}

- (CMPedometerTableRawSpeedToKValue)initWithTestMode:(BOOL)a3
{
  BOOL v3 = a3;
  v15 = 0;
  v16 = 0;
  uint64_t v17 = 0;
  sub_1001DD364(&v15, (const void *)qword_102484FA0, qword_102484FA8, (qword_102484FA8 - qword_102484FA0) >> 3);
  __p = 0;
  v13 = 0;
  uint64_t v14 = 0;
  sub_1001DD364(&__p, (const void *)qword_102484FB8, qword_102484FC0, (qword_102484FC0 - qword_102484FB8) >> 3);
  v11.receiver = self;
  v11.super_class = (Class)CMPedometerTableRawSpeedToKValue;
  v5 = [(CMPedometerTable *)&v11 initWithTableName:@"RawSpeedToKValueTable" valueInName:@"RawSpeed" valueOutName:@"KValue" defaultValue:&v15 binBoundariesWalk:&__p binBoundariesRun:v3 testMode:1.0];
  if (__p)
  {
    v13 = __p;
    operator delete(__p);
  }
  if (v15)
  {
    v16 = v15;
    operator delete(v15);
  }
  if (v5)
  {
    uint64_t v6 = sub_1000A6958();
    CFTypeRef v10 = 0;
    if (sub_1004D01D8(v6, @"StrideCalibrationDataBins", &v10))
    {
      CFTypeRef v7 = v10;
      uint64_t v8 = objc_opt_class();
      [(CMPedometerTable *)v5 setBins:+[CMPedometerTable convertToCMPedometerBins:](CMPedometerTableRawSpeedToKValue, "convertToCMPedometerBins:", +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0), v7, 0))];
      sub_1004CF870(v6);
      (*(void (**)(uint64_t))(*(void *)v6 + 944))(v6);
    }
  }
  return v5;
}

- (void)logBins
{
  id v3 = [[-[CMPedometerTable description](self, "description") componentsSeparatedByCharactersInSet:+[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet")];
  id v4 = [(CMPedometerTable *)self copyBins];
  if ([v4 count])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10108FAAC;
    v5[3] = &unk_10230DC30;
    v5[4] = v3;
    v5[5] = self;
    [v4 enumerateObjectsUsingBlock:v5];
  }
}

- (void)binsDidChange
{
  if (![(CMPedometerTable *)self testMode])
  {
    id v2 = [[[objc_msgSend((id)sub_1000D5BCC(), "vendor")] proxyForService:@"CLMotionSyncStore"];
    [v2 doAsync:&stru_10230DC50];
  }
}

- (void)updateBinsWithTrack:(id)a3
{
  [a3 distanceGps];
  double v6 = v5;
  [a3 distanceRawPed];
  double v8 = v6 / v7;
  [a3 distanceRawPed];
  double v10 = v9;
  [objc_msgSend(a3, "stop") timeIntervalSinceReferenceDate];
  double v12 = v11;
  [objc_msgSend(a3, "start") timeIntervalSinceReferenceDate];
  double v14 = v10 / (v12 - v13);
  [a3 distanceGps];
  double v16 = v15 / 400.0;
  if (v16 <= 1.0) {
    double v17 = v16 * 0.4;
  }
  else {
    double v17 = 0.4;
  }
  [(CMPedometerTable *)self updateBinsWithValueOut:v8 valueIn:v14 alpha:v17];
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_10230DC70);
  }
  v18 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316674;
    id v21 = [@"RawSpeedToKValueTable" UTF8String];
    __int16 v22 = 2080;
    id v23 = [@"RawSpeed" UTF8String];
    __int16 v24 = 2048;
    double v25 = v14;
    __int16 v26 = 2080;
    id v27 = [@"KValue" UTF8String];
    __int16 v28 = 2048;
    double v29 = v8;
    __int16 v30 = 2048;
    double v31 = v17;
    __int16 v32 = 2080;
    id v33 = [[objc_msgSend(a3, "description") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s,Updated,With,%s,%0.4f,%s,%0.4f,Alpha,%0.4f,%s", buf, 0x48u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_10230DC70);
    }
    [@"RawSpeedToKValueTable" UTF8String];
    [@"RawSpeed" UTF8String];
    [@"KValue" UTF8String];
    [objc_msgSend(a3, "description") UTF8String];
    v19 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMPedometerTableRawSpeedToKValue updateBinsWithTrack:]", "%s\n", v19);
    if (v19 != (char *)buf) {
      free(v19);
    }
  }
}

- (BOOL)isWalkCalibrationAvailable
{
  return [(CMPedometerTable *)self isWalkNativeValueOutAvailable];
}

- (BOOL)isRunCalibrationAvailable
{
  return [(CMPedometerTable *)self isRunNativeValueOutAvailable];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)binIntervalForRawSpeed:(double)a3
{
  [(CMPedometerTable *)self binIntervalForValueIn:a3];
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (BOOL)isRawSpeedValid:(double)a3
{
  return [(CMPedometerTable *)self isValueInValid:a3];
}

@end