@interface CompanionTestObject
+ (id)sharedObject;
- (CompanionTestObject)init;
- (OS_dispatch_queue)serialQueue;
- (void)clearAllSeenArticleIdentifiersWithReply:(id)a3;
- (void)consumeSeenArticleIdentifiers:(id)a3 withReply:(id)a4;
- (void)fetchHeadlineMetadataWithReply:(id)a3;
- (void)markArticleIdentifiersAsSaved:(id)a3 articleIdentifiersAsNotSaved:(id)a4 withReply:(id)a5;
- (void)setPreferredRefreshDates:(id)a3 withReply:(id)a4;
- (void)setSavedArticleIdentifiers:(id)a3 withReply:(id)a4;
- (void)updateAndSyncHeadlinesWithReply:(id)a3;
@end

@implementation CompanionTestObject

+ (id)sharedObject
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002490;
  block[3] = &unk_1000103B8;
  block[4] = a1;
  if (qword_1000175D0 != -1) {
    dispatch_once(&qword_1000175D0, block);
  }
  v2 = (void *)qword_1000175C8;
  return v2;
}

- (CompanionTestObject)init
{
  v7.receiver = self;
  v7.super_class = (Class)CompanionTestObject;
  v2 = [(CompanionTestObject *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.nanonewscd.xpc.serialQueue", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)updateAndSyncHeadlinesWithReply:(id)a3
{
  v3 = (void (**)(void))a3;
  dispatch_queue_t v4 = NNSetupCompanionSyncLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "updateAndSyncHeadlinesWithReply: called…", v6, 2u);
  }

  v5 = +[NNCompanionSyncService sharedCompanionSyncService];
  [v5 updateHeadlines];

  if (v3) {
    v3[2](v3);
  }
}

- (void)fetchHeadlineMetadataWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(CompanionTestObject *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000269C;
  block[3] = &unk_1000103E0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)clearAllSeenArticleIdentifiersWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(CompanionTestObject *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000289C;
  block[3] = &unk_1000103E0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)setSavedArticleIdentifiers:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CompanionTestObject *)self serialQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000029C8;
  v11[3] = &unk_100010408;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)setPreferredRefreshDates:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CompanionTestObject *)self serialQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100002AF8;
  v11[3] = &unk_100010408;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)markArticleIdentifiersAsSaved:(id)a3 articleIdentifiersAsNotSaved:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CompanionTestObject *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002CCC;
  block[3] = &unk_100010430;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);
}

- (void)consumeSeenArticleIdentifiers:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CompanionTestObject *)self serialQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000301C;
  v11[3] = &unk_100010408;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void).cxx_destruct
{
}

@end