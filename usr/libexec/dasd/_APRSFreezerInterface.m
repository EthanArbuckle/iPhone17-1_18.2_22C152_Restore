@interface _APRSFreezerInterface
+ (id)sharedInstance;
- (OS_os_log)log;
- (_APRSFreezerInterface)init;
- (void)setLog:(id)a3;
@end

@implementation _APRSFreezerInterface

- (_APRSFreezerInterface)init
{
  v6.receiver = self;
  v6.super_class = (Class)_APRSFreezerInterface;
  v2 = [(_APRSFreezerInterface *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.aprs", "appResume.freezerInterface");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1001C3DD8 != -1) {
    dispatch_once(&qword_1001C3DD8, &stru_100176270);
  }
  v2 = (void *)qword_1001C3DD0;

  return v2;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end