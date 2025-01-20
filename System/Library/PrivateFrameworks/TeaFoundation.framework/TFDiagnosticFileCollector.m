@interface TFDiagnosticFileCollector
- (TFDiagnosticFileCollector)init;
- (TFDiagnosticFileCollector)initWithDiagnosticDumpDir:(id)a3 diagnosticDumpNotificationName:(id)a4 diagnosticFilesNotificationName:(id)a5 diagnosticFileListURL:(id)a6 log:(id)a7;
- (void)addDiagnosticFileProvider:(id)a3;
- (void)dealloc;
- (void)removeDiagnosticFileProvider:(id)a3;
@end

@implementation TFDiagnosticFileCollector

- (TFDiagnosticFileCollector)initWithDiagnosticDumpDir:(id)a3 diagnosticDumpNotificationName:(id)a4 diagnosticFilesNotificationName:(id)a5 diagnosticFileListURL:(id)a6 log:(id)a7
{
  uint64_t v8 = sub_191EE73F0();
  uint64_t v9 = MEMORY[0x1F4188790](v8 - 8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  v13 = (char *)&v21 - v12;
  sub_191EE7380();
  uint64_t v14 = sub_191EE8110();
  uint64_t v16 = v15;
  uint64_t v17 = sub_191EE8110();
  uint64_t v19 = v18;
  sub_191EE7380();
  return (TFDiagnosticFileCollector *)DiagnosticFileCollector.init(diagnosticDumpDir:diagnosticDumpNotificationName:diagnosticFilesNotificationName:diagnosticFileListURL:log:)((uint64_t)v13, v14, v16, v17, v19, (uint64_t)v11, a7);
}

- (void)dealloc
{
  v2 = self;
  DiagnosticFileCollector.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___TFDiagnosticFileCollector_diagnosticDumpDir;
  uint64_t v4 = sub_191EE73F0();
  OUTLINED_FUNCTION_19();
  v6 = *(void (**)(char *, uint64_t))(v5 + 8);
  v6(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6((char *)self + OBJC_IVAR___TFDiagnosticFileCollector_diagnosticFileListURL, v4);
  swift_release();
  v7 = (char *)self + OBJC_IVAR___TFDiagnosticFileCollector_logger;
  sub_191EE7940();
  OUTLINED_FUNCTION_19();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v9 + 8);

  v10(v7, v8);
}

- (void)addDiagnosticFileProvider:(id)a3
{
}

- (void)removeDiagnosticFileProvider:(id)a3
{
}

- (TFDiagnosticFileCollector)init
{
}

@end