@interface CACBugReporter
+ (id)sharedReporter;
- (CACBugReporter)init;
- (SDRDiagnosticReporter)diagnosticReporter;
- (void)reportIssue:(id)a3 subtype:(id)a4 description:(id)a5;
- (void)reportIssue:(id)a3 subtype:(id)a4 description:(id)a5 completionBlock:(id)a6;
- (void)setDiagnosticReporter:(id)a3;
@end

@implementation CACBugReporter

+ (id)sharedReporter
{
  if (sharedReporter_onceToken != -1) {
    dispatch_once(&sharedReporter_onceToken, &__block_literal_global_49);
  }
  v2 = (void *)sharedReporter_sDiagnosticReporter;
  return v2;
}

uint64_t __32__CACBugReporter_sharedReporter__block_invoke()
{
  sharedReporter_sDiagnosticReporter = objc_alloc_init(CACBugReporter);
  return MEMORY[0x270F9A758]();
}

- (CACBugReporter)init
{
  v6.receiver = self;
  v6.super_class = (Class)CACBugReporter;
  v2 = [(CACBugReporter *)&v6 init];
  if (v2)
  {
    v3 = (SDRDiagnosticReporter *)objc_alloc_init(MEMORY[0x263F7C078]);
    diagnosticReporter = v2->_diagnosticReporter;
    v2->_diagnosticReporter = v3;
  }
  return v2;
}

- (void)reportIssue:(id)a3 subtype:(id)a4 description:(id)a5 completionBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(CACBugReporter *)self diagnosticReporter];
  v15 = [MEMORY[0x263F086E0] mainBundle];
  v16 = [v15 bundleIdentifier];
  uint64_t v17 = [v14 signatureWithDomain:@"Command and Control" type:v13 subType:v12 subtypeContext:v11 detectedProcess:v16 triggerThresholdValues:0];

  v18 = [(CACBugReporter *)self diagnosticReporter];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __66__CACBugReporter_reportIssue_subtype_description_completionBlock___block_invoke;
  v22[3] = &unk_264D12D88;
  id v23 = (id)v17;
  id v24 = v10;
  id v19 = v10;
  id v20 = (id)v17;
  LOBYTE(v17) = [v18 snapshotWithSignature:v20 duration:0 events:0 payload:0 actions:v22 reply:10.0];

  if ((v17 & 1) == 0)
  {
    v21 = CACLogGeneral();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[CACBugReporter reportIssue:subtype:description:completionBlock:](v21);
    }
  }
}

void __66__CACBugReporter_reportIssue_subtype_description_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = CACLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __66__CACBugReporter_reportIssue_subtype_description_completionBlock___block_invoke_cold_1((uint64_t)v3, a1, v4);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void)reportIssue:(id)a3 subtype:(id)a4 description:(id)a5
{
}

- (SDRDiagnosticReporter)diagnosticReporter
{
  return (SDRDiagnosticReporter *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDiagnosticReporter:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)reportIssue:(os_log_t)log subtype:description:completionBlock:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_238377000, log, OS_LOG_TYPE_ERROR, "SDRDiagnosticReporter payload invalid.", v1, 2u);
}

void __66__CACBugReporter_reportIssue_subtype_description_completionBlock___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_238377000, log, OS_LOG_TYPE_DEBUG, "SDRDiagnosticReporter response = %@, issue = %@", (uint8_t *)&v4, 0x16u);
}

@end