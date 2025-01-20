@interface ICDatabaseVacuum
+ (ICDatabaseVacuum)activeVacuum;
+ (NSDate)lastVacuumDate;
+ (id)activeVacuumQueue;
+ (void)setActiveVacuum:(id)a3;
+ (void)setLastVacuumDate:(id)a3;
+ (void)startDatabaseVacuumPolicy;
+ (void)startDatabaseVacuumPolicyWithPreVacuumHandler:(id)a3 postVacuumHandler:(id)a4;
- (ICDatabaseVacuum)init;
- (NSTimer)timer;
- (OS_dispatch_queue)queue;
- (id)postVacuumHandler;
- (id)preVacuumHandler;
- (void)setPostVacuumHandler:(id)a3;
- (void)setPreVacuumHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)startDatabaseVacuumPolicy;
- (void)stopDatabaseVacuumPolicy;
- (void)timerFired:(id)a3;
- (void)vacuum;
- (void)vacuumHTMLDatabase;
@end

@implementation ICDatabaseVacuum

- (ICDatabaseVacuum)init
{
  v7.receiver = self;
  v7.super_class = (Class)ICDatabaseVacuum;
  v2 = [(ICDatabaseVacuum *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.notes.vacuum", 0);
    [(ICDatabaseVacuum *)v2 setQueue:v3];

    v4 = [(ICDatabaseVacuum *)v2 queue];
    v5 = dispatch_get_global_queue(-32768, 0);
    dispatch_set_target_queue(v4, v5);
  }
  return v2;
}

+ (id)activeVacuumQueue
{
  if (qword_1006AA128 != -1) {
    dispatch_once(&qword_1006AA128, &stru_1006276A8);
  }
  v2 = (void *)qword_1006AA120;

  return v2;
}

+ (ICDatabaseVacuum)activeVacuum
{
  return (ICDatabaseVacuum *)(id)qword_1006AA130;
}

+ (void)setActiveVacuum:(id)a3
{
}

+ (void)startDatabaseVacuumPolicyWithPreVacuumHandler:(id)a3 postVacuumHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 activeVacuumQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000893C4;
  block[3] = &unk_1006276D0;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

+ (void)startDatabaseVacuumPolicy
{
}

+ (NSDate)lastVacuumDate
{
  v2 = +[NSUserDefaults standardUserDefaults];
  [v2 doubleForKey:@"LastVacuumDate"];
  double v4 = v3;

  return +[NSDate dateWithTimeIntervalSinceReferenceDate:v4];
}

+ (void)setLastVacuumDate:(id)a3
{
  id v3 = a3;
  double v4 = os_log_create("com.apple.notes", "Vacuum");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1004D77E4((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  v11 = +[NSUserDefaults standardUserDefaults];
  [v3 timeIntervalSinceReferenceDate];
  [v11 setDouble:@"LastVacuumDate"];
}

- (void)startDatabaseVacuumPolicy
{
  id v3 = [(ICDatabaseVacuum *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100089638;
  block[3] = &unk_100625AF0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)stopDatabaseVacuumPolicy
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100089980;
  block[3] = &unk_100625AF0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)timerFired:(id)a3
{
  double v4 = os_log_create("com.apple.notes", "Vacuum");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1004D7958();
  }

  uint64_t v5 = [(ICDatabaseVacuum *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100089A84;
  block[3] = &unk_100625AF0;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)vacuum
{
  id v3 = os_log_create("com.apple.notes", "Vacuum");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1004D798C();
  }

  double v4 = +[NSUUID UUID];
  uint64_t v5 = [(ICDatabaseVacuum *)self preVacuumHandler];

  if (v5)
  {
    uint64_t v6 = [(ICDatabaseVacuum *)self preVacuumHandler];
    ((void (**)(void, void *))v6)[2](v6, v4);
  }
  uint64_t v7 = +[ICNoteContext sharedContext];
  uint64_t v8 = [v7 persistentContainer];

  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_100089C00;
  id v14 = &unk_100625860;
  v15 = self;
  id v16 = v4;
  id v9 = v4;
  [v8 vacuumStoreWithCompletionHandler:&v11];
  [(ICDatabaseVacuum *)self vacuumHTMLDatabase];
  uint64_t v10 = +[NSDate date];
  [(id)objc_opt_class() setLastVacuumDate:v10];
}

- (void)vacuumHTMLDatabase
{
  id v3 = +[NSUUID UUID];
  double v4 = [(ICDatabaseVacuum *)self preVacuumHandler];

  if (v4)
  {
    uint64_t v5 = [(ICDatabaseVacuum *)self preVacuumHandler];
    ((void (**)(void, void *))v5)[2](v5, v3);
  }
  uint64_t v6 = +[NoteContext urlForPersistentStore];
  uint64_t v7 = +[NoteContext sharedContext];
  uint64_t v8 = [v7 managedObjectContext];

  id v9 = os_log_create("com.apple.notes", "Vacuum");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1004D79C0((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
  }

  [v8 setShouldPerformSecureOperation:1];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100089E9C;
  v19[3] = &unk_100625A78;
  id v20 = v8;
  id v21 = v6;
  v22 = self;
  id v23 = v3;
  id v16 = v3;
  id v17 = v6;
  id v18 = v8;
  [v18 performBlock:v19];
}

- (id)preVacuumHandler
{
  return self->_preVacuumHandler;
}

- (void)setPreVacuumHandler:(id)a3
{
}

- (id)postVacuumHandler
{
  return self->_postVacuumHandler;
}

- (void)setPostVacuumHandler:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_postVacuumHandler, 0);

  objc_storeStrong(&self->_preVacuumHandler, 0);
}

@end