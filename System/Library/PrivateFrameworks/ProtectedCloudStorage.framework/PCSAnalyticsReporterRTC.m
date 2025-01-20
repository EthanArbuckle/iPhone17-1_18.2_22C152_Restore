@interface PCSAnalyticsReporterRTC
+ (id)rtcAnalyticsReporter;
+ (void)sendMetricWithEvent:(id)a3 success:(BOOL)a4 error:(id)a5;
@end

@implementation PCSAnalyticsReporterRTC

+ (id)rtcAnalyticsReporter
{
  if (rtcAnalyticsReporter_onceToken != -1) {
    dispatch_once(&rtcAnalyticsReporter_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)rtcAnalyticsReporter_rtcReporter;
  return v2;
}

void __47__PCSAnalyticsReporterRTC_rtcAnalyticsReporter__block_invoke()
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v0 = (void *)getAAFAnalyticsTransportRTCClass_softClass;
  uint64_t v15 = getAAFAnalyticsTransportRTCClass_softClass;
  if (!getAAFAnalyticsTransportRTCClass_softClass)
  {
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    v9 = __getAAFAnalyticsTransportRTCClass_block_invoke;
    v10 = &unk_1E5E6DDF8;
    v11 = &v12;
    __getAAFAnalyticsTransportRTCClass_block_invoke((uint64_t)&v7);
    v0 = (void *)v13[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v12, 8);
  v2 = [v1 analyticsTransportRTCWithClientType:0x1F03F7480 clientBundleId:@"com.apple.ProtectedCloudStorage" clientName:@"com.apple.aaa.dnu"];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v3 = (void *)getAAFAnalyticsReporterClass_softClass;
  uint64_t v15 = getAAFAnalyticsReporterClass_softClass;
  if (!getAAFAnalyticsReporterClass_softClass)
  {
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    v9 = __getAAFAnalyticsReporterClass_block_invoke;
    v10 = &unk_1E5E6DDF8;
    v11 = &v12;
    __getAAFAnalyticsReporterClass_block_invoke((uint64_t)&v7);
    v3 = (void *)v13[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v12, 8);
  uint64_t v5 = [v4 analyticsReporterWithTransport:v2];
  v6 = (void *)rtcAnalyticsReporter_rtcReporter;
  rtcAnalyticsReporter_rtcReporter = v5;
}

+ (void)sendMetricWithEvent:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 permittedToSendMetrics])
  {
    v9 = [v7 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PCSAnalyticsReporterRTC_sendMetricWithEvent_success_error___block_invoke;
    block[3] = &unk_1E5E6F460;
    id v11 = v7;
    BOOL v13 = a4;
    id v12 = v8;
    dispatch_sync(v9, block);
  }
}

void __61__PCSAnalyticsReporterRTC_sendMetricWithEvent_success_error___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) getEvent];
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  [v4 setObject:v2 forKeyedSubscript:@"didSucceed"];

  [v4 populateUnderlyingErrorsStartingWithRootError:*(void *)(a1 + 40)];
  v3 = +[PCSAnalyticsReporterRTC rtcAnalyticsReporter];
  [v3 sendEvent:v4];
}

@end