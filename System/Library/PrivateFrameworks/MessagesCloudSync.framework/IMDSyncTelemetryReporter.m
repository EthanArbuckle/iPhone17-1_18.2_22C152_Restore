@interface IMDSyncTelemetryReporter
- (IMDSyncTelemetryReporter)init;
- (void)postMessage:(id)a3 category:(int64_t)a4;
@end

@implementation IMDSyncTelemetryReporter

- (IMDSyncTelemetryReporter)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMDSyncTelemetryReporter;
  v2 = [(IMDSyncTelemetryReporter *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(IMDSyncTelemetryReporterInternal);
    telemetryReporter = v2->_telemetryReporter;
    v2->_telemetryReporter = v3;
  }
  return v2;
}

- (void)postMessage:(id)a3 category:(int64_t)a4
{
}

- (void).cxx_destruct
{
}

@end