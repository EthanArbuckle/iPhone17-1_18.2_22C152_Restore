@interface BKiAPController
+ (void)setup;
- (BKiAPController)init;
- (id)_currentMediaItemFromQuery:(id)a3;
- (void)dealloc;
- (void)handleSetPlaybackQueueCommand:(id)a3 completionHandler:(id)a4;
@end

@implementation BKiAPController

- (BKiAPController)init
{
  v7.receiver = self;
  v7.super_class = (Class)BKiAPController;
  v2 = [(BKiAPController *)&v7 init];
  if (v2)
  {
    v3 = +[MPRemoteCommandCenter sharedCommandCenter];
    v4 = [v3 setPlaybackQueueCommand];
    [v4 setEnabled:1];
    v5 = BKCarPlayLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1007ECF94(v5);
    }

    [v4 addTarget:v2 action:"handleSetPlaybackQueueCommand:completionHandler:"];
  }
  return v2;
}

+ (void)setup
{
  if (qword_100B4A4C0 != -1) {
    dispatch_once(&qword_100B4A4C0, &stru_100A485E0);
  }
}

- (void)dealloc
{
  v3 = +[MPRemoteCommandCenter sharedCommandCenter];
  v4 = [v3 setPlaybackQueueCommand];
  [v4 removeTarget:self];

  v5.receiver = self;
  v5.super_class = (Class)BKiAPController;
  [(BKiAPController *)&v5 dealloc];
}

- (id)_currentMediaItemFromQuery:(id)a3
{
  id v3 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_100007070;
  v19 = sub_100007214;
  id v20 = 0;
  v4 = [v3 items];
  id v5 = [v4 count];

  if (v5)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0;
    v6 = [v3 items];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001514B0;
    v13[3] = &unk_100A48608;
    v13[4] = v14;
    v13[5] = &v15;
    [v6 enumerateObjectsUsingBlock:v13];

    _Block_object_dispose(v14, 8);
  }
  objc_super v7 = (void *)v16[5];
  if (!v7)
  {
    v8 = [v3 items];
    uint64_t v9 = [v8 firstObject];
    v10 = (void *)v16[5];
    v16[5] = v9;

    objc_super v7 = (void *)v16[5];
  }
  id v11 = v7;
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (void)handleSetPlaybackQueueCommand:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = BKCarPlayLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received handleSetPlaybackQueueCommand:completionHandler:", buf, 2u);
  }

  uint64_t v9 = +[BKAppDelegate delegate];
  [v9 setSuppressOpenLastBook:1];
  kdebug_trace();
  v10 = [v9 appLaunchCoordinator];
  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001516F4;
    v11[3] = &unk_100A45BB0;
    id v12 = v6;
    v13 = self;
    id v14 = v7;
    [v10 appLaunchCoordinatorOnConditionMask:2 blockID:@"Audiobook playback queue request" performBlock:v11];
  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 200);
  }
}

@end