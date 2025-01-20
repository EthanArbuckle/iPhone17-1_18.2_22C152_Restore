@interface NDOFollowUpPost
+ (id)nextFollowUpPostDateWithDevicesInfo:(id)a3;
- (BOOL)followUpPostInProgress;
- (BOOL)requiresNetwork;
- (NSString)identifier;
- (NSString)uuid;
- (NSTimer)followUpPostTimer;
- (void)performActivityForScheduler:(id)a3 withCompletionHandler:(id)a4;
- (void)setFollowUpPostInProgress:(BOOL)a3;
- (void)setFollowUpPostTimer:(id)a3;
@end

@implementation NDOFollowUpPost

- (NSString)uuid
{
  return 0;
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.ndoagent.followuppost";
}

- (BOOL)requiresNetwork
{
  return 1;
}

- (void)performActivityForScheduler:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NDOFollowUpPost *)self setFollowUpPostInProgress:1];
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100009FB4;
  v18[3] = &unk_10001C658;
  objc_copyWeak(&v21, &location);
  id v8 = v6;
  id v19 = v8;
  id v9 = v7;
  id v20 = v9;
  v10 = +[NSTimer timerWithTimeInterval:1 repeats:v18 block:2000000000.0];
  [(NDOFollowUpPost *)self setFollowUpPostTimer:v10];

  v11 = +[NSRunLoop mainRunLoop];
  v12 = [(NDOFollowUpPost *)self followUpPostTimer];
  [v11 addTimer:v12 forMode:NSDefaultRunLoopMode];

  v13 = [[NDOAgent alloc] initWithCallingProcessBundleID:@"com.apple.ndoagent.followuppost"];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000A084;
  v15[3] = &unk_10001CA18;
  objc_copyWeak(&v17, &location);
  v15[4] = self;
  id v14 = v9;
  id v16 = v14;
  [(NDOAgent *)v13 getAllFUPEligibleDeviceInfosUsingPolicy:2 updateFollowUps:0 withReply:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

+ (id)nextFollowUpPostDateWithDevicesInfo:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_10000A484;
  v11 = sub_10000A494;
  id v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000A49C;
  v6[3] = &unk_10001CA40;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (NSTimer)followUpPostTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFollowUpPostTimer:(id)a3
{
}

- (BOOL)followUpPostInProgress
{
  return self->_followUpPostInProgress;
}

- (void)setFollowUpPostInProgress:(BOOL)a3
{
  self->_followUpPostInProgress = a3;
}

- (void).cxx_destruct
{
}

@end