@interface FTOpenArbitraryURLEngagementDescriptor
- (FTOpenArbitraryURLEngagementDescriptor)init;
- (FTOpenArbitraryURLEngagementDescriptor)initWithURL:(id)a3 engagementReporter:(id)a4;
- (NSURL)baseNewsURL;
- (NSURL)targetURL;
- (id)openInNewsReferralItemWithTrackableWidgetState:(id)a3 assetHandlesByRemoteURL:(id)a4;
- (id)reporter;
- (id)userEngagementWithWidgetEventTracker:(id)a3 trackableWidgetState:(id)a4;
@end

@implementation FTOpenArbitraryURLEngagementDescriptor

- (FTOpenArbitraryURLEngagementDescriptor)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FTOpenArbitraryURLEngagementDescriptor init]";
    __int16 v7 = 2080;
    v8 = "FTOpenArbitraryURLEngagementDescriptor.m";
    __int16 v9 = 1024;
    int v10 = 24;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FTOpenArbitraryURLEngagementDescriptor init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (FTOpenArbitraryURLEngagementDescriptor)initWithURL:(id)a3 engagementReporter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000C83BC();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000C82F8();
  }
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)FTOpenArbitraryURLEngagementDescriptor;
  v8 = [(FTOpenArbitraryURLEngagementDescriptor *)&v14 init];
  if (v8)
  {
    __int16 v9 = (NSURL *)[v6 copy];
    targetURL = v8->_targetURL;
    v8->_targetURL = v9;

    id v11 = [v7 copy];
    id reporter = v8->_reporter;
    v8->_id reporter = v11;
  }
  return v8;
}

- (id)userEngagementWithWidgetEventTracker:(id)a3 trackableWidgetState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000C8544();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000C8480();
  }
LABEL_6:
  v8 = [(FTOpenArbitraryURLEngagementDescriptor *)self reporter];
  __int16 v9 = ((void (**)(void, id, id))v8)[2](v8, v6, v7);

  return v9;
}

- (NSURL)baseNewsURL
{
  return [(FTOpenArbitraryURLEngagementDescriptor *)self targetURL];
}

- (id)openInNewsReferralItemWithTrackableWidgetState:(id)a3 assetHandlesByRemoteURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000C8608();
  }

  return 0;
}

- (NSURL)targetURL
{
  return self->_targetURL;
}

- (id)reporter
{
  return self->_reporter;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reporter, 0);

  objc_storeStrong((id *)&self->_targetURL, 0);
}

@end