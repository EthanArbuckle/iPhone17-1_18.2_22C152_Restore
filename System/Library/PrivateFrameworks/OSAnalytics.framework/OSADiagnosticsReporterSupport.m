@interface OSADiagnosticsReporterSupport
+ (void)handleDiagnosticLog:(int64_t)a3 logPath:(id)a4 completion:(id)a5;
@end

@implementation OSADiagnosticsReporterSupport

+ (void)handleDiagnosticLog:(int64_t)a3 logPath:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (seedFeedbackPromptingEnabled())
  {
    if (DiagnosticsReporterServicesLibraryCore())
    {
      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x2050000000;
      v9 = (void *)getOSADiagnosticsReporterClass_softClass;
      uint64_t v24 = getOSADiagnosticsReporterClass_softClass;
      if (!getOSADiagnosticsReporterClass_softClass)
      {
        uint64_t v16 = MEMORY[0x1E4F143A8];
        uint64_t v17 = 3221225472;
        v18 = __getOSADiagnosticsReporterClass_block_invoke;
        v19 = &unk_1E5D1F8E0;
        v20 = &v21;
        __getOSADiagnosticsReporterClass_block_invoke((uint64_t)&v16);
        v9 = (void *)v22[3];
      }
      id v10 = v9;
      _Block_object_dispose(&v21, 8);
      handleDiagnosticLog_logPath_completion__OSADiagnosticsReporterClass = (uint64_t)v10;
      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x2050000000;
      v11 = (void *)getDiagnosticsReporterLaunchOptionsClass_softClass;
      uint64_t v24 = getDiagnosticsReporterLaunchOptionsClass_softClass;
      if (!getDiagnosticsReporterLaunchOptionsClass_softClass)
      {
        uint64_t v16 = MEMORY[0x1E4F143A8];
        uint64_t v17 = 3221225472;
        v18 = __getDiagnosticsReporterLaunchOptionsClass_block_invoke;
        v19 = &unk_1E5D1F8E0;
        v20 = &v21;
        __getDiagnosticsReporterLaunchOptionsClass_block_invoke((uint64_t)&v16);
        v11 = (void *)v22[3];
      }
      id v12 = v11;
      _Block_object_dispose(&v21, 8);
      handleDiagnosticLog_logPath_completion__DiagnosticsReporterLaunchOptionsClass = (uint64_t)v12;
      if (objc_opt_class() && objc_opt_class())
      {
        v13 = objc_opt_new();
        objc_msgSend(v13, "setLog_path:", v7);
        v14 = (void *)MEMORY[0x1AD0D8280](v8);
        v15 = v14;
        if (!v8)
        {

          v15 = &__block_literal_global_0;
        }
        [(id)handleDiagnosticLog_logPath_completion__OSADiagnosticsReporterClass launchAppWith:a3 options:v13 completion:v15];
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        +[OSADiagnosticsReporterSupport handleDiagnosticLog:logPath:completion:]();
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "DiagnosticsReporterServices.framework is unavailable", (uint8_t *)&v16, 2u);
    }
  }
}

void __72__OSADiagnosticsReporterSupport_handleDiagnosticLog_logPath_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __72__OSADiagnosticsReporterSupport_handleDiagnosticLog_logPath_completion___block_invoke_cold_1(v2);
  }
}

+ (void)handleDiagnosticLog:logPath:completion:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "DiagnosticsReporter or DiagnosticsReporterLaunchOptions class not found.", v0, 2u);
}

void __72__OSADiagnosticsReporterSupport_handleDiagnosticLog_logPath_completion___block_invoke_cold_1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = [a1 localizedDescription];
  int v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to launch DR with error: %@", (uint8_t *)&v2, 0xCu);
}

@end