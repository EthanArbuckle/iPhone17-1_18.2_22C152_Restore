@interface APMetricHelpers
+ (Class)diagnosticDaemonMetricHelper;
+ (Class)journeyDaemonMetricHelper;
+ (id)diagnosticMetricHelperForContentData:(id)a3;
+ (id)journeyMetricHelperForContentData:(id)a3;
+ (void)setDiagnosticDaemonMetricHelper:(Class)a3;
+ (void)setJourneyDaemonMetricHelper:(Class)a3;
@end

@implementation APMetricHelpers

+ (Class)diagnosticDaemonMetricHelper
{
  if (qword_100289C28 != -1) {
    dispatch_once(&qword_100289C28, &stru_100236890);
  }
  v2 = (void *)qword_100289C30;

  return (Class)v2;
}

+ (void)setDiagnosticDaemonMetricHelper:(Class)a3
{
  v4 = +[NSProcessInfo processInfo];
  unsigned int v5 = [v4 isRunningTests];

  if (v5)
  {
    proto = &OBJC_PROTOCOL___APDiagnosticDaemonMetricHelping;
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:"))
    {
      qword_100289C30 = (uint64_t)a3;
    }
    else
    {
      v6 = NSStringFromClass(a3);
      v7 = NSStringFromProtocol((Protocol *)proto);
      v8 = +[NSString stringWithFormat:@"Class %@ does not implement protocol %@!", v6, v7];

      APSimulateCrash();
    }
  }
}

+ (Class)journeyDaemonMetricHelper
{
  if (qword_100289C38 != -1) {
    dispatch_once(&qword_100289C38, &stru_1002368B0);
  }
  v2 = (void *)qword_100289C40;

  return (Class)v2;
}

+ (void)setJourneyDaemonMetricHelper:(Class)a3
{
  v4 = +[NSProcessInfo processInfo];
  unsigned int v5 = [v4 isRunningTests];

  if (v5)
  {
    proto = &OBJC_PROTOCOL___APJourneyDaemonMetricHelping;
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:"))
    {
      qword_100289C40 = (uint64_t)a3;
    }
    else
    {
      v6 = NSStringFromClass(a3);
      v7 = NSStringFromProtocol((Protocol *)proto);
      v8 = +[NSString stringWithFormat:@"Class %@ does not implement protocol %@!", v6, v7];

      APSimulateCrash();
    }
  }
}

+ (id)diagnosticMetricHelperForContentData:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_msgSend(a1, "diagnosticDaemonMetricHelper")) initWithContentData:v4];

  return v5;
}

+ (id)journeyMetricHelperForContentData:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_msgSend(a1, "journeyDaemonMetricHelper")) initWithContentData:v4];

  return v5;
}

@end