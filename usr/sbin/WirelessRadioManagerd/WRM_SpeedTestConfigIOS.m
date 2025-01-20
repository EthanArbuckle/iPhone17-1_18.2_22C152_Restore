@interface WRM_SpeedTestConfigIOS
- (BOOL)inProgress;
- (WRM_SpeedTestConfigIOS)init;
- (void)abort;
- (void)startDownloadTest:(id)a3;
@end

@implementation WRM_SpeedTestConfigIOS

- (WRM_SpeedTestConfigIOS)init
{
  v10.receiver = self;
  v10.super_class = (Class)WRM_SpeedTestConfigIOS;
  v2 = [(WRM_SpeedTestConfigIOS *)&v10 init];
  v2->inProgress = 0;
  +[WCM_Logging logLevel:22 message:@"CellularThroughput: CellularTest init"];
  if (!sub_10009666C())
  {
    CFStringRef v8 = @"CellularThroughput: runtime check for presence of NPTKit.framework failed";
    goto LABEL_11;
  }
  +[WCM_Logging logLevel:22 message:@"CellularThroughput: runtime check for presence of NPTKit.framework passed"];
  +[WCM_Logging logLevel:22 message:@"CellularThroughput: Creating Configuration"];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3052000000;
  v19 = sub_1000967B0;
  v20 = sub_1000967C0;
  v3 = (void *)qword_10027D0F0;
  uint64_t v21 = qword_10027D0F0;
  if (!qword_10027D0F0)
  {
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_1000967CC;
    v14 = &unk_10020DAF8;
    v15 = &v16;
    sub_1000967CC((uint64_t)&v11);
    v3 = (void *)v17[5];
  }
  _Block_object_dispose(&v16, 8);
  id v4 = [v3 defaultConfigurationCellular];
  if (!v4)
  {
    CFStringRef v8 = @"CellularThroughput: performanceTestWithConfig is nil";
    goto LABEL_11;
  }
  v5 = v4;
  [v4 setInterfaceType:0];
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"CellularThroughput: performanceTestWithConfig.interfaceType: %d", [v5 interfaceType]);
  [v5 setDownloadSize:100];
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"CellularThroughput: performanceTestWithConfig.downloadSize: %d", [v5 downloadSize]);
  [v5 setClientName:@"analyticsAutomation"];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3052000000;
  v19 = sub_1000967B0;
  v20 = sub_1000967C0;
  v6 = (void *)qword_10027D0F8;
  uint64_t v21 = qword_10027D0F8;
  if (!qword_10027D0F8)
  {
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_100096868;
    v14 = &unk_10020DAF8;
    v15 = &v16;
    sub_100096868((uint64_t)&v11);
    v6 = (void *)v17[5];
  }
  _Block_object_dispose(&v16, 8);
  v7 = (NPTPerformanceTest *)[v6 performanceTestWithConfiguration:v5];
  v2->performanceTest = v7;
  if (!v7)
  {
    CFStringRef v8 = @"CellularThroughput: performanceTest is nil";
LABEL_11:
    +[WCM_Logging logLevel:22 message:v8];
    return 0;
  }
  return v2;
}

- (void)startDownloadTest:(id)a3
{
  if (self->performanceTest)
  {
    if (!self->inProgress)
    {
      self->inProgress = 1;
      v7 = self->performanceTest;
      [(NPTPerformanceTest *)self->performanceTest startMetadataCollectionWithCompletion:0];
      performanceTest = self->performanceTest;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100096210;
      v9[3] = &unk_10020FA50;
      v9[4] = self;
      v9[5] = a3;
      [(NPTPerformanceTest *)performanceTest startDownloadWithCompletion:v9];
      return;
    }
    CFStringRef v5 = @"Download task already started";
  }
  else
  {
    CFStringRef v5 = @"NPTPerformanceTest instance nil, bailing out";
  }
  +[WCM_Logging logLevel:22 message:v5];
  if (a3)
  {
    v6 = (void (*)(id, const __CFString *))*((void *)a3 + 2);
    v6(a3, @"NO");
  }
}

- (void)abort
{
  performanceTest = self->performanceTest;
  if (performanceTest) {
    [(NPTPerformanceTest *)performanceTest cancelAllNetworking];
  }
  self->inProgress = 0;
}

- (BOOL)inProgress
{
  return self->inProgress;
}

@end