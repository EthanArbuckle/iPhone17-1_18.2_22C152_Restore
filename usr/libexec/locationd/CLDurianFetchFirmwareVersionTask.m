@interface CLDurianFetchFirmwareVersionTask
- (CLDurianFetchFirmwareVersionTask)initWithIncludeCrashLogs:(BOOL)a3;
- (CLDurianNordicCrashEvent)nordicCrash;
- (CLFindMyAccessoryFirmwareVersion)firmwareVersion;
- (NSArray)roseCrashes;
- (id)description;
- (int64_t)timeoutSeconds;
- (void)appendNordicCrashData:(id)a3;
- (void)appendRoseCrashData:(id)a3;
- (void)dealloc;
- (void)setFirmwareVersion:(id)a3;
- (void)setNordicCrash:(id)a3;
@end

@implementation CLDurianFetchFirmwareVersionTask

- (CLDurianFetchFirmwareVersionTask)initWithIncludeCrashLogs:(BOOL)a3
{
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CLDurianFetchFirmwareVersionTask;
  v3 = [(CLDurianTask *)&v5 initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 7, +[NSData dataWithBytes:&v6 length:1]) desiredLatency:-6 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];
  if (v3) {
    v3->_crashData = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianFetchFirmwareVersionTask;
  [(CLDurianTask *)&v3 dealloc];
}

- (id)description
{
  id v3 = +[NSMutableString string];
  nordicCrash = self->_nordicCrash;
  if (nordicCrash) {
    [v3 appendFormat:@"<Nordic Crash: %@>, ", -[CLDurianNordicCrashEvent description](nordicCrash, "description")];
  }
  crashData = self->_crashData;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1015FD4FC;
  v7[3] = &unk_102332138;
  v7[4] = v3;
  [(NSMutableDictionary *)crashData enumerateKeysAndObjectsUsingBlock:v7];
  return v3;
}

- (int64_t)timeoutSeconds
{
  return 20;
}

- (NSArray)roseCrashes
{
  id v2 = [(NSMutableDictionary *)self->_crashData allValues];
  if (![v2 count]) {
    return 0;
  }
  id v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v2 count]);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        [(NSMutableArray *)v3 addObject:[[CLDurianRoseCrashEvent alloc] initWithData:*(void *)(*((void *)&v9 + 1) + 8 * i)]];
      }
      id v5 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  return &v3->super;
}

- (void)appendNordicCrashData:(id)a3
{
  id v4 = [[CLDurianNordicCrashEvent alloc] initWithData:a3];
  [(CLDurianFetchFirmwareVersionTask *)self setNordicCrash:v4];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    v8 = "";
    __int16 v9 = 2114;
    long long v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #crash nordic data\", \"nordicCrashEvent\":%{public, location:escape_only}@}", (uint8_t *)v6, 0x1Cu);
  }
}

- (void)appendRoseCrashData:(id)a3
{
  id v4 = [a3 subdataWithRange:1, [a3 length] - 1];
  unint64_t v5 = *(unsigned __int8 *)[v4 bytes];
  id v6 = [(NSMutableDictionary *)self->_crashData objectForKey:+[NSNumber numberWithUnsignedInt:v5 >> 4]];
  if (!v6)
  {
    id v6 = +[NSMutableData data];
    [(NSMutableDictionary *)self->_crashData setObject:v6 forKey:+[NSNumber numberWithUnsignedInt:v5 >> 4]];
  }
  [v6 appendData:[v4 subdataWithRange:1, (char *)[v4 length] - 1]];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  __int16 v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289794;
    v8[1] = 0;
    __int16 v9 = 2082;
    long long v10 = "";
    __int16 v11 = 2050;
    unint64_t v12 = v5 >> 4;
    __int16 v13 = 2050;
    uint64_t v14 = v5 & 0xF;
    __int16 v15 = 2050;
    id v16 = [v4 length];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #crash rose data\", \"core\":%{public}lu, \"seqno\":%{public}lu, \"length\":%{public}lu}", (uint8_t *)v8, 0x30u);
  }
}

- (CLFindMyAccessoryFirmwareVersion)firmwareVersion
{
  return (CLFindMyAccessoryFirmwareVersion *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFirmwareVersion:(id)a3
{
}

- (CLDurianNordicCrashEvent)nordicCrash
{
  return (CLDurianNordicCrashEvent *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNordicCrash:(id)a3
{
}

@end