@interface _OSLowSOCEventPredictor
+ (id)sharedInstance;
- (OS_os_log)log;
- (_OSLowSOCEventPredictor)init;
- (void)setLog:(id)a3;
@end

@implementation _OSLowSOCEventPredictor

- (_OSLowSOCEventPredictor)init
{
  v6.receiver = self;
  v6.super_class = (Class)_OSLowSOCEventPredictor;
  v2 = [(_OSLowSOCEventPredictor *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.osintelligence", "highDrainPredictor");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003E38;
  block[3] = &unk_100064720;
  block[4] = a1;
  if (qword_10007A7F0 != -1) {
    dispatch_once(&qword_10007A7F0, block);
  }
  v2 = (void *)qword_10007A7E8;

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