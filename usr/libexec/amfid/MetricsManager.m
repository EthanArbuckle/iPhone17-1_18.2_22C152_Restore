@interface MetricsManager
+ (id)sharedInstance;
- (MetricsManager)init;
- (void)clean;
- (void)recordWithSigningIdentifier:(id)a3 teamIdentifier:(id)a4 validationCategory:(int64_t)a5 constraintType:(int64_t)a6;
- (void)report;
@end

@implementation MetricsManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000097A4;
  block[3] = &unk_1000252B0;
  block[4] = a1;
  if (qword_100029610[0] != -1) {
    dispatch_once(qword_100029610, block);
  }
  v2 = (void *)qword_100029608;

  return v2;
}

- (MetricsManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)MetricsManager;
  v2 = [(MetricsManager *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC5amfid29ConstraintUsageMetricsManager);
    constraintUsageMetrics = v2->_constraintUsageMetrics;
    v2->_constraintUsageMetrics = v3;
  }
  return v2;
}

- (void)recordWithSigningIdentifier:(id)a3 teamIdentifier:(id)a4 validationCategory:(int64_t)a5 constraintType:(int64_t)a6
{
}

- (void)clean
{
}

- (void)report
{
}

- (void).cxx_destruct
{
}

@end