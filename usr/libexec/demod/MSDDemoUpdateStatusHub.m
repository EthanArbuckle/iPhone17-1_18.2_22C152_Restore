@interface MSDDemoUpdateStatusHub
+ (id)sharedInstance;
- (BOOL)registerDemoUpdateStatusDelegate:(id)a3;
- (NSMutableSet)delegates;
- (void)demoUpdateCompleted:(id)a3;
- (void)demoUpdateFailed:(id)a3;
- (void)demoUpdateProgress:(int64_t)a3;
- (void)setDelegates:(id)a3;
- (void)unregisterDemoUpdateStatusDelegate:(id)a3;
@end

@implementation MSDDemoUpdateStatusHub

+ (id)sharedInstance
{
  if (qword_100189CF8 != -1) {
    dispatch_once(&qword_100189CF8, &stru_100153FF8);
  }
  v2 = (void *)qword_100189CF0;

  return v2;
}

- (BOOL)registerDemoUpdateStatusDelegate:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000DCC10(v10);
    }
    goto LABEL_14;
  }
  if (([v4 conformsToProtocol:&OBJC_PROTOCOL___MSDDemoUpdateStatusDelegate] & 1) == 0)
  {
    v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000DCC54(v10);
    }
LABEL_14:
    BOOL v8 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v6 = [(MSDDemoUpdateStatusHub *)self delegates];
  unsigned __int8 v7 = [v6 containsObject:v5];

  if ((v7 & 1) == 0)
  {
    v9 = [(MSDDemoUpdateStatusHub *)self delegates];
    [v9 addObject:v5];

    v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(MSDDemoUpdateStatusHub *)self delegates];
      int v13 = 136315394;
      v14 = "-[MSDDemoUpdateStatusHub registerDemoUpdateStatusDelegate:]";
      __int16 v15 = 2048;
      id v16 = [v11 count];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Registed 1 delegate, delegate count = %tu", (uint8_t *)&v13, 0x16u);
    }
    BOOL v8 = 1;
    goto LABEL_8;
  }
  BOOL v8 = 1;
LABEL_9:

  return v8;
}

- (void)unregisterDemoUpdateStatusDelegate:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 conformsToProtocol:&OBJC_PROTOCOL___MSDDemoUpdateStatusDelegate])
  {
    v6 = [(MSDDemoUpdateStatusHub *)self delegates];
    [v6 removeObject:v5];

    unsigned __int8 v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [(MSDDemoUpdateStatusHub *)self delegates];
      int v9 = 136315394;
      v10 = "-[MSDDemoUpdateStatusHub unregisterDemoUpdateStatusDelegate:]";
      __int16 v11 = 2048;
      id v12 = [v8 count];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Unregisted 1 delegate, delegate count = %tu", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)demoUpdateProgress:(int64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "demoUpdateProgress: %td", buf, 0xCu);
  }

  v6 = [(MSDDemoUpdateStatusHub *)v4 delegates];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B5AA4;
  v7[3] = &unk_100154018;
  v7[4] = a3;
  [v6 enumerateObjectsUsingBlock:v7];

  objc_sync_exit(v4);
}

- (void)demoUpdateCompleted:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "demoUpdateCompleted.", buf, 2u);
  }

  unsigned __int8 v7 = [(MSDDemoUpdateStatusHub *)v5 delegates];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000B5BFC;
  v9[3] = &unk_100154040;
  id v8 = v4;
  id v10 = v8;
  [v7 enumerateObjectsUsingBlock:v9];

  objc_sync_exit(v5);
}

- (void)demoUpdateFailed:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = +[MSDTargetDevice sharedInstance];
  if (([v6 isOfflineMode] & 1) == 0) {
    [v6 saveOperationError:v4];
  }
  unsigned __int8 v7 = [(MSDDemoUpdateStatusHub *)v5 delegates];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000B5D38;
  v9[3] = &unk_100154040;
  id v8 = v4;
  id v10 = v8;
  [v7 enumerateObjectsUsingBlock:v9];

  objc_sync_exit(v5);
}

- (NSMutableSet)delegates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDelegates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end