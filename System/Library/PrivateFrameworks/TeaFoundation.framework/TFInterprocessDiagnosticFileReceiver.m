@interface TFInterprocessDiagnosticFileReceiver
- (TFInterprocessDiagnosticFileReceiver)init;
- (TFInterprocessDiagnosticFileReceiver)initWithNotificationName:(id)a3 diagnosticFileListURL:(id)a4 log:(id)a5;
- (id)diagnosticFileURLs;
- (void)dealloc;
@end

@implementation TFInterprocessDiagnosticFileReceiver

- (TFInterprocessDiagnosticFileReceiver)initWithNotificationName:(id)a3 diagnosticFileListURL:(id)a4 log:(id)a5
{
  uint64_t v6 = sub_191EE73F0();
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_191EE8110();
  uint64_t v11 = v10;
  sub_191EE7380();
  return (TFInterprocessDiagnosticFileReceiver *)InterprocessDiagnosticFileReceiver.init(interprocessDiagnosticFilesNotificationName:diagnosticFileListURL:log:)(v9, v11, (uint64_t)v8, a5);
}

- (void)dealloc
{
  v2 = self;
  InterprocessDiagnosticFileReceiver.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___TFInterprocessDiagnosticFileReceiver_diagnosticFileListURL;
  sub_191EE73F0();
  OUTLINED_FUNCTION_4_1();
  (*(void (**)(char *))(v4 + 8))(v3);
  v5 = (char *)self + OBJC_IVAR___TFInterprocessDiagnosticFileReceiver_logger;
  sub_191EE7940();
  OUTLINED_FUNCTION_4_1();
  (*(void (**)(char *))(v6 + 8))(v5);

  swift_bridgeObjectRelease();
}

- (id)diagnosticFileURLs
{
  InterprocessDiagnosticFileReceiver.diagnosticFileURLs()();
  sub_191EE73F0();
  v2 = (void *)sub_191EE8510();
  swift_bridgeObjectRelease();

  return v2;
}

- (TFInterprocessDiagnosticFileReceiver)init
{
}

@end