@interface MetricsModuleClasses
+ (Class)batchClass;
+ (Class)httpDeliveryClass;
+ (Class)metricClass;
+ (Class)notificationRegistrarClass;
+ (Class)purposeClass;
+ (Class)serverDeliveryClass;
+ (Class)storageClass;
+ (void)setBatchClass:(Class)a3;
+ (void)setHttpDeliveryClass:(Class)a3;
+ (void)setMetricClass:(Class)a3;
+ (void)setNotificationRegistrarClass:(Class)a3;
+ (void)setRouteClass:(Class)a3;
+ (void)setServerDeliveryClass:(Class)a3;
+ (void)setStorageClass:(Class)a3;
@end

@implementation MetricsModuleClasses

+ (Class)metricClass
{
  if (qword_100289B98 != -1) {
    dispatch_once(&qword_100289B98, &stru_100236720);
  }
  v2 = (void *)qword_100289BA0;

  return (Class)v2;
}

+ (void)setMetricClass:(Class)a3
{
  v4 = +[NSProcessInfo processInfo];
  unsigned int v5 = [v4 isRunningTests];

  if (v5)
  {
    proto = &OBJC_PROTOCOL___APMetricProtocol;
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:"))
    {
      qword_100289BA0 = (uint64_t)a3;
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

+ (Class)batchClass
{
  if (qword_100289BA8 != -1) {
    dispatch_once(&qword_100289BA8, &stru_100236740);
  }
  v2 = (void *)qword_100289BB0;

  return (Class)v2;
}

+ (void)setBatchClass:(Class)a3
{
  v4 = +[NSProcessInfo processInfo];
  unsigned int v5 = [v4 isRunningTests];

  if (v5)
  {
    proto = &OBJC_PROTOCOL___APMetricBatchable;
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:"))
    {
      qword_100289BB0 = (uint64_t)a3;
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

+ (Class)notificationRegistrarClass
{
  if (qword_100289BB8 != -1) {
    dispatch_once(&qword_100289BB8, &stru_100236760);
  }
  v2 = (void *)qword_100289BC0;

  return (Class)v2;
}

+ (void)setNotificationRegistrarClass:(Class)a3
{
  v4 = +[NSProcessInfo processInfo];
  unsigned int v5 = [v4 isRunningTests];

  if (v5)
  {
    proto = &OBJC_PROTOCOL___APMetricNotificationRegister;
    v6 = &OBJC_PROTOCOL___APMetricReceiving;
    if ([(objc_class *)a3 conformsToProtocol:proto]
      && [(objc_class *)a3 conformsToProtocol:v6])
    {
      qword_100289BC0 = (uint64_t)a3;
    }
    else
    {
      v7 = NSStringFromClass(a3);
      v8 = NSStringFromProtocol((Protocol *)proto);
      v9 = NSStringFromProtocol((Protocol *)v6);
      v10 = +[NSString stringWithFormat:@"Class %@ does not implement both the %@ or %@ protocols!", v7, v8, v9];

      APSimulateCrash();
    }
  }
}

+ (Class)purposeClass
{
  if (qword_100289BC8 != -1) {
    dispatch_once(&qword_100289BC8, &stru_100236780);
  }
  v2 = (void *)qword_100289BD0;

  return (Class)v2;
}

+ (void)setRouteClass:(Class)a3
{
  v4 = +[NSProcessInfo processInfo];
  unsigned int v5 = [v4 isRunningTests];

  if (v5)
  {
    proto = &OBJC_PROTOCOL___APMetricRoutable;
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:"))
    {
      qword_100289BD0 = (uint64_t)a3;
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

+ (Class)httpDeliveryClass
{
  if (qword_100289BD8 != -1) {
    dispatch_once(&qword_100289BD8, &stru_1002367A0);
  }
  v2 = (void *)qword_100289BE0;

  return (Class)v2;
}

+ (void)setHttpDeliveryClass:(Class)a3
{
  v4 = +[NSProcessInfo processInfo];
  unsigned int v5 = [v4 isRunningTests];

  if (v5)
  {
    proto = &OBJC_PROTOCOL___APMetricHTTPDelivering;
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:"))
    {
      qword_100289BE0 = (uint64_t)a3;
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

+ (Class)serverDeliveryClass
{
  if (qword_100289BE8 != -1) {
    dispatch_once(&qword_100289BE8, &stru_1002367C0);
  }
  v2 = (void *)qword_100289BF0;

  return (Class)v2;
}

+ (void)setServerDeliveryClass:(Class)a3
{
  v4 = +[NSProcessInfo processInfo];
  unsigned int v5 = [v4 isRunningTests];

  if (v5)
  {
    proto = &OBJC_PROTOCOL___APMetricServerDelivering;
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:"))
    {
      qword_100289BF0 = (uint64_t)a3;
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

+ (Class)storageClass
{
  if (qword_100289BF8 != -1) {
    dispatch_once(&qword_100289BF8, &stru_1002367E0);
  }
  v2 = (void *)qword_100289C00;

  return (Class)v2;
}

+ (void)setStorageClass:(Class)a3
{
  v4 = +[NSProcessInfo processInfo];
  unsigned int v5 = [v4 isRunningTests];

  if (v5)
  {
    proto = &OBJC_PROTOCOL___APMetricReceiving;
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:")
      && [(objc_class *)a3 conformsToProtocol:&OBJC_PROTOCOL___APMetricStoring])
    {
      qword_100289C00 = (uint64_t)a3;
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

@end