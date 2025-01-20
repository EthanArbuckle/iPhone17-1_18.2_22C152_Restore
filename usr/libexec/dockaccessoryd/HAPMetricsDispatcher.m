@interface HAPMetricsDispatcher
+ (id)sharedInstance;
- (DKMLogEventSubmitting)logDispatcher;
- (void)setLogDispatcher:(id)a3;
- (void)submitLogEvent:(id)a3;
@end

@implementation HAPMetricsDispatcher

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B484;
  block[3] = &unk_1002732C8;
  block[4] = a1;
  if (qword_1002AD670 != -1) {
    dispatch_once(&qword_1002AD670, block);
  }
  v2 = (void *)qword_1002AD668;

  return v2;
}

- (void)submitLogEvent:(id)a3
{
  id v6 = a3;
  v4 = [(HAPMetricsDispatcher *)self logDispatcher];

  if (v4)
  {
    v5 = [(HAPMetricsDispatcher *)self logDispatcher];
    [v5 submitLogEvent:v6];
  }
}

- (DKMLogEventSubmitting)logDispatcher
{
  return self->_logDispatcher;
}

- (void)setLogDispatcher:(id)a3
{
}

- (void).cxx_destruct
{
}

@end