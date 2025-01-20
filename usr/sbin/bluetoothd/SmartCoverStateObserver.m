@interface SmartCoverStateObserver
- (SmartCoverStateObserver)init;
- (void)smartCoverStateDidChange:(int64_t)a3;
@end

@implementation SmartCoverStateObserver

- (void)smartCoverStateDidChange:(int64_t)a3
{
  uint64_t v4 = sub_1004AF8EC();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003DD324;
  v5[3] = &unk_100997528;
  v5[4] = a3;
  sub_100013018(v4, v5);
}

- (SmartCoverStateObserver)init
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v3 = (void *)qword_100A12A28;
  uint64_t v21 = qword_100A12A28;
  if (!qword_100A12A28)
  {
    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_1003E6174;
    v16 = &unk_1009995E0;
    v17 = &v18;
    sub_1003E6174((uint64_t)buf);
    v3 = (void *)v19[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v18, 8);
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)SmartCoverStateObserver;
    v5 = [(SmartCoverStateObserver *)&v12 init];
    if (v5)
    {
      v6 = [v4 sharedInstance];
      uint64_t v7 = [v6 registerSmartCoverStateObserver:v5];
      observability = v5->observability;
      v5->observability = (BSInvalidatable *)v7;

      if (!v5->observability && os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_ERROR)) {
        sub_10075F408();
      }
    }
    self = v5;
    v9 = self;
  }
  else
  {
    v10 = qword_100A19E50;
    if (os_log_type_enabled((os_log_t)qword_100A19E50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SpringBoardServices framework is missing", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end