@interface CLFallLoggerManager
+ (id)encodeBinaryLog:(const BinaryData *)a3;
+ (id)encodeFilteredPressure:(const FilteredPressure *)a3;
+ (id)encodeHeartRate:(const CLCatherineData *)a3;
+ (id)encodePressure:(const Pressure *)a3;
+ (id)loggerDataTypeString:(unsigned __int8)a3;
+ (unsigned)loggerDataTypeFrom:(unsigned __int8)a3;
- (BOOL)isLoggingEnabled;
- (CLGizmoOrientation)orientation;
- (id)addLogger:(unsigned __int8)a3;
- (id)addLogger:(unsigned __int8)a3 toDirectory:(id)a4 prefix:(id)a5 rotation:(int64_t)a6;
- (id)initInUniverse:(id)a3;
- (void)_addLogger:(id)a3 type:(unsigned __int8)a4;
- (void)_forEachLogger:(id)a3;
- (void)_forEachLoggerWithType:(unsigned __int8)a3 logData:(id)a4;
- (void)_forEachLoggerWithType:(unsigned __int8)a3 logItem:(const BinaryData *)a4;
- (void)clearAllLogs;
- (void)dealloc;
- (void)flushData:(id)a3 userProfile:(id)a4;
- (void)logFalsePositiveSuppressionFeatures:(const FalsePositiveSuppressionFeatures *)a3;
- (void)logFilteredPressure:(const FilteredPressure *)a3;
- (void)logHeartRate:(const CLCatherineData *)a3;
- (void)logImpactEvent:(const ImpactEvent *)a3;
- (void)logImpactEventState:(const ImpactEvent *)a3;
- (void)logImpactSensorData:(const ImpactData *)a3;
- (void)logOdometer:(const OdometerEntry *)a3;
- (void)logPressure:(const Pressure *)a3;
- (void)logSensorType:(unsigned __int8)a3 data:(id)a4 startTime:(double)a5 timestamp:(unint64_t)a6;
- (void)setLoggingEnabled:(BOOL)a3;
- (void)setOrientation:(CLGizmoOrientation)a3;
- (void)stopLogging;
@end

@implementation CLFallLoggerManager

+ (unsigned)loggerDataTypeFrom:(unsigned __int8)a3
{
  if (a3 == 4) {
    unsigned __int8 v3 = 3;
  }
  else {
    unsigned __int8 v3 = 0;
  }
  if (a3 == 3) {
    return 2;
  }
  else {
    return v3;
  }
}

+ (id)loggerDataTypeString:(unsigned __int8)a3
{
  if (a3 > 0xCu) {
    return 0;
  }
  else {
    return *(&off_102319C50 + (char)a3);
  }
}

- (id)initInUniverse:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLFallLoggerManager;
  v4 = [(CLFallLoggerManager *)&v7 init];
  if (v4)
  {
    v4->fLoggers = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->fUniverse = (CLIntersiloUniverse *)a3;
    v5 = [a3 silo].queue;
    v4->fQueue = (OS_dispatch_queue *)v5;
    dispatch_retain(v5);
    v4->fEventTimes = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v4;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->fQueue);
  v3.receiver = self;
  v3.super_class = (Class)CLFallLoggerManager;
  [(CLFallLoggerManager *)&v3 dealloc];
}

- (void)_addLogger:(id)a3 type:(unsigned __int8)a4
{
  id v6 = +[CLFallLoggerManager loggerDataTypeString:a4];
  id v7 = [(NSMutableDictionary *)self->fLoggers objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v7 = objc_alloc_init((Class)NSMutableSet);
    [(NSMutableDictionary *)self->fLoggers setObject:v7 forKeyedSubscript:v6];
  }

  [v7 addObject:a3];
}

- (id)addLogger:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  v5 = objc_alloc_init(CLFallLogger);
  [(CLFallLoggerManager *)self _addLogger:v5 type:v3];

  return v5;
}

- (id)addLogger:(unsigned __int8)a3 toDirectory:(id)a4 prefix:(id)a5 rotation:(int64_t)a6
{
  uint64_t v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  id v11 = [[CLFallLogger alloc] initToDirectory:a4 prefix:a5 rotation:a6];
  [(CLFallLoggerManager *)self _addLogger:v11 type:v9];

  return v11;
}

- (void)_forEachLogger:(id)a3
{
  fLoggers = self->fLoggers;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_101245CF8;
  v4[3] = &unk_102319B60;
  v4[4] = a3;
  [(NSMutableDictionary *)fLoggers enumerateKeysAndObjectsUsingBlock:v4];
}

- (void)stopLogging
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);

  [(CLFallLoggerManager *)self _forEachLogger:&stru_102319BA0];
}

- (void)clearAllLogs
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  [(CLFallLoggerManager *)self _forEachLogger:&stru_102319BC0];
  fEventTimes = self->fEventTimes;

  [(NSMutableArray *)fEventTimes removeAllObjects];
}

- (void)flushData:(id)a3 userProfile:(id)a4
{
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = dispatch_queue_create("com.apple.CoreMotion.CLFallManager.flush", 0);
  uint64_t v9 = dispatch_group_create();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_101245FC8;
  v10[3] = &unk_102319C10;
  v10[4] = v9;
  v10[5] = v8;
  v10[6] = v7;
  [(CLFallLoggerManager *)self _forEachLogger:v10];
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (a3) {
    (*((void (**)(id, id, id, id, id))a3 + 2))(a3, [(NSMutableArray *)self->fEventTimes firstObject], [(NSMutableArray *)self->fEventTimes lastObject], v7, a4);
  }
  [(NSMutableArray *)self->fEventTimes removeAllObjects];

  dispatch_release(v8);
  dispatch_release(v9);
}

- (void)_forEachLoggerWithType:(unsigned __int8)a3 logData:(id)a4
{
  fQueue = self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10124613C;
  block[3] = &unk_1022DC050;
  unsigned __int8 v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(fQueue, block);
}

+ (id)encodeBinaryLog:(const BinaryData *)a3
{
  uint64_t v4 = (*((uint64_t (**)(const BinaryData *, SEL))a3->var0 + 5))(a3, a2);
  double v5 = __chkstk_darwin(v4);
  id v7 = &v11[-v6];
  v12[0] = 0;
  (*((void (**)(const BinaryData *, unsigned char *, uint64_t, _DWORD *, double))a3->var0 + 2))(a3, &v11[-v6], v4, v12, v5);
  if (v4 == v12[0]) {
    return +[NSData dataWithBytes:v7 length:(int)v4];
  }
  if (qword_1024190F0 != -1) {
    dispatch_once(&qword_1024190F0, &stru_102319C30);
  }
  uint64_t v9 = qword_1024190F8;
  if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_FAULT))
  {
    v15[0] = 67240448;
    v15[1] = v12[0];
    __int16 v16 = 1026;
    int v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "bufferLength(%{public}d)!=kSize(%{public}d)", (uint8_t *)v15, 0xEu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(v15, 0x65CuLL);
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_102319C30);
    }
    v12[1] = 67240448;
    v12[2] = v12[0];
    __int16 v13 = 1026;
    int v14 = v4;
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "+[CLFallLoggerManager encodeBinaryLog:]", "%s\n", v10);
    if (v10 != (char *)v15) {
      free(v10);
    }
  }
  return 0;
}

+ (id)encodeFilteredPressure:(const FilteredPressure *)a3
{
  v4[0] = off_1022E6A30;
  v4[1] = *((void *)a3 + 4);
  v4[3] = *(void *)((char *)a3 + 12);
  int v5 = *((_DWORD *)a3 + 1);
  return +[CLFallLoggerManager encodeBinaryLog:v4];
}

+ (id)encodePressure:(const Pressure *)a3
{
  v6[0] = off_1022E69D8;
  double v3 = (double)*(unint64_t *)((char *)a3 + 12);
  v6[1] = *((void *)a3 + 4);
  uint64_t v4 = *(void *)((char *)a3 + 4);
  *(double *)&v6[3] = v3;
  v6[4] = v4;
  return +[CLFallLoggerManager encodeBinaryLog:v6];
}

+ (id)encodeHeartRate:(const CLCatherineData *)a3
{
  v5[0] = off_1022E7878;
  v5[1] = CFAbsoluteTimeGetCurrent();
  *(void *)((char *)&v5[2] + 4) = *(void *)&a3->var0;
  long long v6 = *(_OWORD *)&a3->var2;
  BOOL var4 = a3->var4;
  long long v8 = *(_OWORD *)&a3->var5;
  double var7 = a3->var7;
  BOOL v10 = a3->var8 == 5;
  return +[CLFallLoggerManager encodeBinaryLog:v5];
}

- (void)_forEachLoggerWithType:(unsigned __int8)a3 logItem:(const BinaryData *)a4
{
  uint64_t v4 = a3;
  id v6 = +[CLFallLoggerManager encodeBinaryLog:a4];
  if (v6)
  {
    [(CLFallLoggerManager *)self _forEachLoggerWithType:v4 logData:v6];
  }
}

- (void)logImpactEvent:(const ImpactEvent *)a3
{
  [(NSMutableArray *)self->fEventTimes addObject:+[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)&a3->fImpact.fOperatingMode]];
  sub_100A5F794((uint64_t)v5, (uint64_t)a3);
  [(CLFallLoggerManager *)self _forEachLoggerWithType:1 logItem:v5];
}

- (void)logImpactEventState:(const ImpactEvent *)a3
{
  -[CLFallLoggerManager _forEachLoggerWithType:logItem:](self, "_forEachLoggerWithType:logItem:", 6, v3, sub_100A60788((uint64_t)v3, (uint64_t)a3));
}

- (void)logImpactSensorData:(const ImpactData *)a3
{
  [(NSMutableArray *)self->fEventTimes addObject:+[NSDate dateWithTimeIntervalSinceReferenceDate:a3->var0]];
  int var2 = a3->var2;
  if (var2 == 2)
  {
    double var1 = a3->var1;
    double var0 = a3->var0;
    double v18 = var1;
    long long v20 = *(_OWORD *)(&a3->var2 + 1);
    uint64_t v12 = *(void *)((char *)&a3->var3.var0[2] + 1);
    __int16 v16 = off_1022E7288;
    uint64_t v19 = v12;
    uint64_t v9 = self;
    uint64_t v10 = 9;
  }
  else if (var2 == 1)
  {
    double v13 = a3->var1;
    double var0 = a3->var0;
    double v18 = v13;
    uint64_t v14 = *(void *)(&a3->var2 + 1);
    DWORD2(v20) = *(_DWORD *)((char *)a3->var3.var0 + 1);
    uint64_t v15 = *(void *)((char *)&a3->var3.var0[2] + 1);
    __int16 v16 = off_1022E7230;
    uint64_t v19 = v15;
    *(void *)&long long v20 = v14;
    uint64_t v9 = self;
    uint64_t v10 = 8;
  }
  else
  {
    if (a3->var2) {
      return;
    }
    double v6 = a3->var1;
    double var0 = a3->var0;
    double v18 = v6;
    uint64_t v7 = *(void *)(&a3->var2 + 1);
    DWORD2(v20) = *(_DWORD *)((char *)a3->var3.var0 + 1);
    uint64_t v8 = *(void *)((char *)&a3->var3.var0[2] + 1);
    __int16 v16 = off_1022E71C0;
    uint64_t v19 = v8;
    *(void *)&long long v20 = v7;
    uint64_t v9 = self;
    uint64_t v10 = 7;
  }
  [(CLFallLoggerManager *)v9 _forEachLoggerWithType:v10 logItem:&v16];
}

- (void)logFalsePositiveSuppressionFeatures:(const FalsePositiveSuppressionFeatures *)a3
{
  -[CLFallLoggerManager _forEachLoggerWithType:logItem:](self, "_forEachLoggerWithType:logItem:", 10, v3, sub_100A607FC((uint64_t)v3, (uint64_t)a3).n128_f64[0]);
}

- (void)logSensorType:(unsigned __int8)a3 data:(id)a4 startTime:(double)a5 timestamp:(unint64_t)a6
{
  uint64_t v10 = +[CLFallLoggerManager loggerDataTypeFrom:a3];
  id v11 = (char *)[a4 length];
  uint64_t v12 = +[NSMutableData dataWithCapacity:v11 + 20];
  id v13 = [objc_alloc((Class)CLSensorRecorderSensorMeta) initWithDataType:v10];
  [v13 setDataSize:v11];
  [v13 setTimestamp:a6];
  [v13 setStartTime:a5];
  +[CLSensorRecorderSensorMetaSerializer serializeMeta:v13 toData:v12];

  [(NSMutableData *)v12 appendData:a4];

  [(CLFallLoggerManager *)self _forEachLoggerWithType:v10 logData:v12];
}

- (void)logFilteredPressure:(const FilteredPressure *)a3
{
  id v4 = +[CLFallLoggerManager encodeFilteredPressure:a3];

  [(CLFallLoggerManager *)self _forEachLoggerWithType:4 logData:v4];
}

- (void)logPressure:(const Pressure *)a3
{
  id v4 = +[CLFallLoggerManager encodePressure:a3];

  [(CLFallLoggerManager *)self _forEachLoggerWithType:4 logData:v4];
}

- (void)logHeartRate:(const CLCatherineData *)a3
{
  id v4 = +[CLFallLoggerManager encodeHeartRate:a3];

  [(CLFallLoggerManager *)self _forEachLoggerWithType:5 logData:v4];
}

- (void)logOdometer:(const OdometerEntry *)a3
{
  -[CLFallLoggerManager _forEachLoggerWithType:logItem:](self, "_forEachLoggerWithType:logItem:", 11, v3, sub_100A606B0((uint64_t)v3, (uint64_t)&a3->var2).n128_f64[0]);
}

- (BOOL)isLoggingEnabled
{
  return self->fLoggingEnabled;
}

- (void)setLoggingEnabled:(BOOL)a3
{
  self->fLoggingEnabled = a3;
}

- (CLGizmoOrientation)orientation
{
  return self->fOrientation;
}

- (void)setOrientation:(CLGizmoOrientation)a3
{
  self->fOrientation = a3;
}

@end