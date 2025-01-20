@interface TelemetrySessionManager
- (void)networkEventMonitor:(id)a3 loggedEvent:(id)a4 inSession:(id)a5;
@end

@implementation TelemetrySessionManager

- (void)networkEventMonitor:(id)a3 loggedEvent:(id)a4 inSession:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  swift_retain();
  sub_1DFDE84B0();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  *(void *)(v10 + 24) = v9;
  id v11 = v8;
  id v12 = v9;
  sub_1DFDE87F0();

  swift_release();
  swift_release();
  swift_release();
}

@end