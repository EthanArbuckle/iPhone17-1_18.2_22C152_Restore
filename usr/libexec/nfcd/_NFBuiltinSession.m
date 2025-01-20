@interface _NFBuiltinSession
+ (id)createSessionWithWorkQueue:(id)a3 routing:(id)a4 sessionQueuer:(id)a5 didStartWork:(id)a6;
- (_NFBuiltinSession)initWithWorkQueue:(id)a3 routing:(id)a4 sessionQueuer:(id)a5 didStartWork:(id)a6;
- (id)initialRoutingConfig;
- (void)didStartSession:(id)a3;
@end

@implementation _NFBuiltinSession

- (_NFBuiltinSession)initWithWorkQueue:(id)a3 routing:(id)a4 sessionQueuer:(id)a5 didStartWork:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_NFBuiltinSession;
  v14 = [(_NFSession *)&v20 initWithWorkQueue:a3 expressModeManager:0 allowsBackgroundMode:1];
  v15 = v14;
  if (v14)
  {
    v19.receiver = v14;
    v19.super_class = (Class)_NFBuiltinSession;
    [(_NFSession *)&v19 setQueue:v12];
    objc_storeStrong((id *)&v15->_initialRoute, a4);
    id v16 = objc_retainBlock(v13);
    id workBlock = v15->_workBlock;
    v15->_id workBlock = v16;
  }
  return v15;
}

+ (id)createSessionWithWorkQueue:(id)a3 routing:(id)a4 sessionQueuer:(id)a5 didStartWork:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = [[_NFBuiltinSession alloc] initWithWorkQueue:v13 routing:v12 sessionQueuer:v10 didStartWork:v11];

  if (v14)
  {
    [v10 queueSession:v14];
    id v15 = 0;
  }
  else
  {
    id v16 = objc_alloc((Class)NSError);
    v17 = +[NSString stringWithUTF8String:"nfcd"];
    v23[0] = NSLocalizedDescriptionKey;
    v18 = +[NSString stringWithUTF8String:"Unknown Error"];
    v24[0] = v18;
    v24[1] = &off_10031B0E8;
    v23[1] = @"Line";
    v23[2] = @"Method";
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v24[2] = v19;
    v23[3] = NSDebugDescriptionErrorKey;
    id v20 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 51];
    v24[3] = v20;
    v21 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
    id v15 = [v16 initWithDomain:v17 code:6 userInfo:v21];
  }

  return v15;
}

- (void)didStartSession:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_NFBuiltinSession;
  if ([(_NFSession *)&v9 didStart] && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Session already started with error %@ ??", buf, 0xCu);
  }
  v8.receiver = self;
  v8.super_class = (Class)_NFBuiltinSession;
  [(_NFSession *)&v8 didStartSession:v4];
  if (!v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)_NFBuiltinSession;
    v5 = [(_NFSession *)&v7 workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B6908;
    block[3] = &unk_100301C68;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

- (id)initialRoutingConfig
{
  return self->_initialRoute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialRoute, 0);

  objc_storeStrong(&self->_workBlock, 0);
}

@end