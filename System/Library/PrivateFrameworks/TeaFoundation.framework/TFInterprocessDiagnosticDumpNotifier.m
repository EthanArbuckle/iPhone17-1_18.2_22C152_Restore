@interface TFInterprocessDiagnosticDumpNotifier
- (TFInterprocessDiagnosticDumpNotifier)init;
- (TFInterprocessDiagnosticDumpNotifier)initWithNotificationName:(id)a3 diagnosticTempDir:(id)a4 log:(id)a5;
- (void)triggerDiagnosticFileDump;
@end

@implementation TFInterprocessDiagnosticDumpNotifier

- (TFInterprocessDiagnosticDumpNotifier)initWithNotificationName:(id)a3 diagnosticTempDir:(id)a4 log:(id)a5
{
  uint64_t v6 = sub_191EE73F0();
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_191EE8110();
  uint64_t v11 = v10;
  sub_191EE7380();
  return (TFInterprocessDiagnosticDumpNotifier *)InterprocessDiagnosticDumpNotifier.init(notificationName:diagnosticTempDir:log:)(v9, v11, (uint64_t)v8, a5);
}

- (void)triggerDiagnosticFileDump
{
  v2 = self;
  InterprocessDiagnosticDumpNotifier.triggerDiagnosticFileDump()();
}

- (TFInterprocessDiagnosticDumpNotifier)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___TFInterprocessDiagnosticDumpNotifier_diagnosticTempDir;
  uint64_t v4 = sub_191EE73F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___TFInterprocessDiagnosticDumpNotifier_logger;
  uint64_t v6 = sub_191EE7940();
  uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end