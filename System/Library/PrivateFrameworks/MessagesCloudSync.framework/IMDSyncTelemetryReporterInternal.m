@interface IMDSyncTelemetryReporterInternal
- (BOOL)postMessage:(id)a3 category:(int64_t)a4 error:(id *)a5;
- (IMDSyncTelemetryReporterInternal)init;
@end

@implementation IMDSyncTelemetryReporterInternal

- (IMDSyncTelemetryReporterInternal)init
{
  return (IMDSyncTelemetryReporterInternal *)SyncTelemetryReporter.init()();
}

- (BOOL)postMessage:(id)a3 category:(int64_t)a4 error:(id *)a5
{
  uint64_t v7 = sub_22342C270();
  v8 = self;
  SyncTelemetryReporter.postMessage(payload:category:)(v7, a4);
  swift_bridgeObjectRelease();

  return 1;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDSyncTelemetryReporterInternal_reporter);
}

@end