@interface GlobalConfiguration
+ (GlobalConfiguration)sharedInstance;
- (BOOL)hasInternalContent;
- (BOOL)isMemoryConstrainedDevice;
- (BOOL)setTestMode:(BOOL)a3 withError:(id *)a4;
- (BOOL)testMode;
- (BOOL)testModeEnabled;
- (GlobalConfiguration)init;
- (NSString)currentUsername;
- (OS_dispatch_queue)testModeQueue;
- (id)debugDescription;
- (void)setTestModeEnabled:(BOOL)a3;
- (void)setTestModeQueue:(id)a3;
@end

@implementation GlobalConfiguration

- (void).cxx_destruct
{
}

- (void)setTestModeEnabled:(BOOL)a3
{
  self->_testModeEnabled = a3;
}

- (BOOL)testModeEnabled
{
  return self->_testModeEnabled;
}

- (void)setTestModeQueue:(id)a3
{
}

- (OS_dispatch_queue)testModeQueue
{
  return self->_testModeQueue;
}

- (id)debugDescription
{
  v3 = [(GlobalConfiguration *)self currentUsername];
  v4 = +[NSString stringWithFormat:@"<GlobalConfiguration currUser: %@, testMode: %d>", v3, [(GlobalConfiguration *)self testMode]];

  return v4;
}

- (BOOL)testMode
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(GlobalConfiguration *)self testModeQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F84C;
  v5[3] = &unk_100039020;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)setTestMode:(BOOL)a3 withError:(id *)a4
{
  BOOL v7 = [(GlobalConfiguration *)self hasInternalContent];
  if (v7)
  {
    uint64_t v8 = [(GlobalConfiguration *)self testModeQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000F9F4;
    v12[3] = &unk_100038C98;
    v12[4] = self;
    BOOL v13 = a3;
    dispatch_sync(v8, v12);

    id v9 = 0;
  }
  else
  {
    v10 = sub_10000D0EC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[GlobalConfiguration setTestMode:withError:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s: Test mode can only be set on internal builds", buf, 0xCu);
    }

    id v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (a4)
    {
      id v9 = v9;
      *a4 = v9;
    }
  }

  return v7;
}

- (NSString)currentUsername
{
  return (NSString *)@"mobile";
}

- (BOOL)isMemoryConstrainedDevice
{
  if (qword_10004C830 != -1) {
    dispatch_once(&qword_10004C830, &stru_100038C70);
  }
  return byte_10004C838;
}

- (BOOL)hasInternalContent
{
  if (qword_10004C820 != -1) {
    dispatch_once(&qword_10004C820, &stru_100038C50);
  }
  return byte_10004C828;
}

- (GlobalConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)GlobalConfiguration;
  v2 = [(GlobalConfiguration *)&v6 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.eligibilityd.testMode", v3);
    [(GlobalConfiguration *)v2 setTestModeQueue:v4];
  }
  return v2;
}

+ (GlobalConfiguration)sharedInstance
{
  if (qword_10004C818 != -1) {
    dispatch_once(&qword_10004C818, &stru_100038C30);
  }
  v2 = (void *)qword_10004C810;

  return (GlobalConfiguration *)v2;
}

@end