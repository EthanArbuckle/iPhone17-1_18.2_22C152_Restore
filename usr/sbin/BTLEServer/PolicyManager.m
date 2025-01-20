@interface PolicyManager
+ (id)instance;
- (PolicyManager)init;
- (unint64_t)activeHIDDeviceCount;
- (void)activateHIDPolicy;
- (void)activeHIDDeviceCountDidChange:(id)a3;
- (void)deactivateHIDPolicy;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setActiveHIDDeviceCount:(unint64_t)a3;
@end

@implementation PolicyManager

+ (id)instance
{
  if (qword_1000CD048 != -1) {
    dispatch_once(&qword_1000CD048, &stru_1000B1660);
  }
  v2 = (void *)qword_1000CD040;

  return v2;
}

- (PolicyManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)PolicyManager;
  v2 = [(PolicyManager *)&v5 init];
  if (v2)
  {
    v3 = pthread_self();
    pthread_getschedparam(v3, &v2->_defaultMainThreadSchedPolicy, &v2->_defaultMainThreadSchedParam);
    v2->_activeHIDDeviceCount = 0;
    [(PolicyManager *)v2 addObserver:v2 forKeyPath:@"activeHIDDeviceCount" options:3 context:0];
  }
  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a5;
  if ([a3 isEqualToString:@"activeHIDDeviceCount"]) {
    [(PolicyManager *)self activeHIDDeviceCountDidChange:v8];
  }
}

- (void)activeHIDDeviceCountDidChange:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 objectForKeyedSubscript:NSKeyValueChangeOldKey];
  id v6 = [v5 unsignedIntegerValue];

  v7 = [v4 objectForKeyedSubscript:NSKeyValueChangeNewKey];

  id v8 = [v7 unsignedIntegerValue];
  v9 = qword_1000CD178;
  if (!os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
  {
    if (v6) {
      goto LABEL_3;
    }
LABEL_6:
    [(PolicyManager *)self activateHIDPolicy];
    return;
  }
  sub_10006E3F8((uint64_t)v6, (uint64_t)v8, v9);
  if (!v6) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v8) {
    [(PolicyManager *)self deactivateHIDPolicy];
  }
}

- (void)activateHIDPolicy
{
  *(_DWORD *)v4.__opaque = HIDWORD(*(void *)&self->_defaultMainThreadSchedParam);
  v4.sched_priority = 63;
  v3 = pthread_self();
  pthread_setschedparam(v3, self->_defaultMainThreadSchedPolicy, &v4);
}

- (void)deactivateHIDPolicy
{
  v3 = pthread_self();
  int defaultMainThreadSchedPolicy = self->_defaultMainThreadSchedPolicy;

  pthread_setschedparam(v3, defaultMainThreadSchedPolicy, &self->_defaultMainThreadSchedParam);
}

- (unint64_t)activeHIDDeviceCount
{
  return self->_activeHIDDeviceCount;
}

- (void)setActiveHIDDeviceCount:(unint64_t)a3
{
  self->_activeHIDDeviceCount = a3;
}

@end