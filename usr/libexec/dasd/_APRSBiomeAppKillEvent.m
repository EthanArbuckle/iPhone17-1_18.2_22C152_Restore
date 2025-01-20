@interface _APRSBiomeAppKillEvent
+ (id)eventWithAppBundleID:(id)a3 pid:(int)a4 exitReason:(unsigned int)a5;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (NSString)bundleID;
- (NSString)description;
- (id)log;
- (id)serialize;
- (int)pid;
- (unsigned)dataVersion;
- (unsigned)exitReason;
- (void)setBundleID:(id)a3;
- (void)setExitReason:(unsigned int)a3;
- (void)setPid:(int)a3;
@end

@implementation _APRSBiomeAppKillEvent

+ (id)eventWithAppBundleID:(id)a3 pid:(int)a4 exitReason:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)objc_opt_class());
  v9 = v8;
  if (v8)
  {
    [v8 setBundleID:v7];
    [v9 setPid:v6];
    [v9 setExitReason:v5];
  }

  return v9;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  unsigned int v10 = 0;
  long long v9 = 0u;
  memset(v8, 0, sizeof(v8));
  [a3 getBytes:v8 length:68];
  v4 = objc_opt_class();
  uint64_t v5 = +[NSString stringWithUTF8String:v8];
  uint64_t v6 = [v4 eventWithAppBundleID:v5 pid:HIDWORD(v9) exitReason:v10];

  return v6;
}

- (id)log
{
  if (qword_1001C4008 != -1) {
    dispatch_once(&qword_1001C4008, &stru_1001767C8);
  }
  v2 = (void *)qword_1001C4010;

  return v2;
}

- (id)serialize
{
  LODWORD(v11) = 0;
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSString *)v2->_bundleID copy];
  if ((unint64_t)[v3 length] >= 0x3D)
  {
    v4 = [(_APRSBiomeAppKillEvent *)v2 log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000F6A44((uint64_t *)&v2->_bundleID, (uint64_t)v3, v4);
    }

    uint64_t v5 = [v3 substringToIndex:60];

    id v3 = (id)v5;
  }
  if (([v3 getCString:&v9 maxLength:60 encoding:4] & 1) == 0)
  {
    uint64_t v6 = [(_APRSBiomeAppKillEvent *)v2 log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000F69C8((uint64_t *)&v2->_bundleID, v6);
    }
  }
  HIDWORD(v10) = v2->_pid;
  LODWORD(v11) = v2->_exitReason;

  objc_sync_exit(v2);
  id v7 = +[NSData dataWithBytes:&v9 length:68];

  return v7;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"App %@ \n pid %d \n exit reason %d", self->_bundleID, self->_pid, self->_exitReason];
}

- (unsigned)dataVersion
{
  return self->dataVersion;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (unsigned)exitReason
{
  return self->_exitReason;
}

- (void)setExitReason:(unsigned int)a3
{
  self->_exitReason = a3;
}

- (void).cxx_destruct
{
}

@end