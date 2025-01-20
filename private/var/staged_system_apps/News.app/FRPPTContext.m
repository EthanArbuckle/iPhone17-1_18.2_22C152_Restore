@interface FRPPTContext
+ (id)sharedContext;
- (BOOL)isPrefetchDisabled;
- (BOOL)isRunningPPT;
- (NSString)testName;
- (void)d_logState;
- (void)setPrefetchDisabled:(BOOL)a3;
- (void)setRunningPPT:(BOOL)a3;
- (void)setTestName:(id)a3;
@end

@implementation FRPPTContext

+ (id)sharedContext
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018FF4;
  block[3] = &unk_1000C8748;
  block[4] = a1;
  if (qword_1000EE3B8 != -1) {
    dispatch_once(&qword_1000EE3B8, block);
  }
  v2 = (void *)qword_1000EE3C0;

  return v2;
}

- (void)d_logState
{
  unsigned int v3 = [(FRPPTContext *)self isRunningPPT];
  v4 = FCPPTLog;
  BOOL v5 = os_log_type_enabled(FCPPTLog, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PPT Reported as Running", (uint8_t *)&v13, 2u);
    }
  }
  else if (v5)
  {
    BOOL runningPPT = self->_runningPPT;
    v7 = v4;
    v8 = +[NSNumber numberWithBool:runningPPT];
    v9 = +[UIApplication sharedApplication];
    v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 launchedToTest]);
    v11 = +[UIApplication sharedApplication];
    v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isRunningTest]);
    int v13 = 138412802;
    v14 = v8;
    __int16 v15 = 2112;
    v16 = v10;
    __int16 v17 = 2112;
    v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PPT Reported as Not Running. _runningPPT : %@, launchedToTest : %@, isRunningTest : %@", (uint8_t *)&v13, 0x20u);
  }
}

- (BOOL)isRunningPPT
{
  return self->_runningPPT;
}

- (void)setRunningPPT:(BOOL)a3
{
  BOOL v3 = a3;
  self->_BOOL runningPPT = a3;
  id v4 = +[FCAppleAccount sharedAccount];
  [v4 setRunningPPT:v3];
}

- (BOOL)isPrefetchDisabled
{
  return self->_prefetchDisabled;
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
}

- (void)setPrefetchDisabled:(BOOL)a3
{
  self->_prefetchDisabled = a3;
}

- (void).cxx_destruct
{
}

@end