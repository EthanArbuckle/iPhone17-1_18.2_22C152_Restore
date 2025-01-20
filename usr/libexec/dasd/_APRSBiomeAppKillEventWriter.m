@interface _APRSBiomeAppKillEventWriter
+ (id)sharedInstance;
- (RBSProcessMonitor)appKillMonitor;
- (_APRSBiomeAppKillEventWriter)init;
- (void)setAppKillMonitor:(id)a3;
@end

@implementation _APRSBiomeAppKillEventWriter

+ (id)sharedInstance
{
  if (qword_1001C4018 != -1) {
    dispatch_once(&qword_1001C4018, &stru_1001767E8);
  }
  v2 = (void *)qword_1001C4020;

  return v2;
}

- (_APRSBiomeAppKillEventWriter)init
{
  v9.receiver = self;
  v9.super_class = (Class)_APRSBiomeAppKillEventWriter;
  v2 = [(_APRSBiomeAppKillEventWriter *)&v9 init];
  if (v2)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100066E70;
    v7[3] = &unk_100176838;
    os_log_t v8 = os_log_create("com.apple.aprs", "appResume.AppKillWriter");
    v3 = v8;
    uint64_t v4 = +[RBSProcessMonitor monitorWithConfiguration:v7];
    appKillMonitor = v2->_appKillMonitor;
    v2->_appKillMonitor = (RBSProcessMonitor *)v4;
  }
  return v2;
}

- (RBSProcessMonitor)appKillMonitor
{
  return self->_appKillMonitor;
}

- (void)setAppKillMonitor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end