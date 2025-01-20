@interface PKAutoBugCaptureReporter
- (BOOL)isExpectedFailureReason:(int)a3;
- (BOOL)isRunningUnitTests;
- (BOOL)shouldReportIssueOfType:(id)a3;
- (void)handleResponse:(id)a3;
- (void)reportIssueWithDomain:(id)a3 type:(id)a4 subtype:(id)a5 subtypeContext:(id)a6 payload:(id)a7;
@end

@implementation PKAutoBugCaptureReporter

- (void)reportIssueWithDomain:(id)a3 type:(id)a4 subtype:(id)a5 subtypeContext:(id)a6 payload:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (![(PKAutoBugCaptureReporter *)self isRunningUnitTests])
  {
    if ([(PKAutoBugCaptureReporter *)self shouldReportIssueOfType:v13])
    {
      v17 = [MEMORY[0x1E4F28F80] processInfo];
      v18 = [v17 processName];
      v19 = v18;
      if (v18)
      {
        v20 = v18;
      }
      else
      {
        v21 = [MEMORY[0x1E4F28B50] mainBundle];
        v20 = [v21 bundleIdentifier];
      }
      sdrReporter = self->sdrReporter;
      if (!sdrReporter)
      {
        v23 = (SDRDiagnosticReporter *)objc_alloc_init(MEMORY[0x1E4FA8AF0]);
        v24 = self->sdrReporter;
        self->sdrReporter = v23;

        sdrReporter = self->sdrReporter;
      }
      v25 = [(SDRDiagnosticReporter *)sdrReporter signatureWithDomain:v12 type:v13 subType:v14 subtypeContext:v15 detectedProcess:v20 triggerThresholdValues:0];
      v26 = PKLogFacilityTypeGetObject(4uLL);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        id v30 = v12;
        __int16 v31 = 2112;
        id v32 = v13;
        __int16 v33 = 2112;
        id v34 = v14;
        __int16 v35 = 2112;
        id v36 = v15;
        _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_INFO, "AutoBugCapture - Submitting snapshot request to ABC for signature: %@.%@.%@.%@", buf, 0x2Au);
      }

      v27 = self->sdrReporter;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __86__PKAutoBugCaptureReporter_reportIssueWithDomain_type_subtype_subtypeContext_payload___block_invoke;
      v28[3] = &unk_1E56E37E0;
      v28[4] = self;
      [(SDRDiagnosticReporter *)v27 snapshotWithSignature:v25 duration:0 event:v16 payload:v28 reply:0.0];
    }
    else
    {
      v20 = PKLogFacilityTypeGetObject(4uLL);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        id v30 = v12;
        __int16 v31 = 2112;
        id v32 = v13;
        __int16 v33 = 2112;
        id v34 = v14;
        __int16 v35 = 2112;
        id v36 = v15;
        _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_INFO, "AutoBugCapture - Not reporting to AutoBugCapture because we are rate limited: %@.%@.%@.%@", buf, 0x2Au);
      }
    }
  }
}

uint64_t __86__PKAutoBugCaptureReporter_reportIssueWithDomain_type_subtype_subtypeContext_payload___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleResponse:a2];
}

- (void)handleResponse:(id)a3
{
  *(void *)&v15[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA8C70]];
  int v6 = [v5 BOOLValue];

  if (!v6)
  {
    v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA8C58]];
    uint64_t v10 = [v9 intValue];

    v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA8C60]];
    BOOL v11 = [(PKAutoBugCaptureReporter *)self isExpectedFailureReason:v10];
    v8 = PKLogFacilityTypeGetObject(4uLL);
    BOOL v12 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v11)
    {
      if (!v12) {
        goto LABEL_8;
      }
      int v14 = 67109378;
      v15[0] = v10;
      LOWORD(v15[1]) = 2112;
      *(void *)((char *)&v15[1] + 2) = v7;
      id v13 = "AutoBugCapture - Diagnostic reporter snapshot rejected with expected reason %d (%@)";
    }
    else
    {
      if (!v12) {
        goto LABEL_8;
      }
      int v14 = 67109378;
      v15[0] = v10;
      LOWORD(v15[1]) = 2112;
      *(void *)((char *)&v15[1] + 2) = v7;
      id v13 = "AutoBugCapture - Diagnostic reporter snapshot rejected with unexpected reason %d (%@)";
    }
    _os_log_error_impl(&dword_190E10000, v8, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v14, 0x12u);
    goto LABEL_8;
  }
  v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA8C68]];
  v8 = PKLogFacilityTypeGetObject(4uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    *(void *)id v15 = v7;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_INFO, "AutoBugCapture - Diagnostic reporter snapshot accepted with sessionID %@", (uint8_t *)&v14, 0xCu);
  }
LABEL_8:
}

- (BOOL)isExpectedFailureReason:(int)a3
{
  return *MEMORY[0x1E4FA8B68] == a3
      || *MEMORY[0x1E4FA8B70] == a3
      || *MEMORY[0x1E4FA8B60] == a3
      || *MEMORY[0x1E4FA8B88] == a3;
}

- (BOOL)shouldReportIssueOfType:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_219);
  v5 = (void *)qword_1EB402D58;
  if (!qword_1EB402D58)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7 = (void *)qword_1EB402D58;
    qword_1EB402D58 = (uint64_t)v6;

    v5 = (void *)qword_1EB402D58;
  }
  v8 = [v5 objectForKeyedSubscript:v3];
  if (v8 && ([v4 timeIntervalSinceDate:v8], v9 < 86400.0))
  {
    BOOL v10 = 0;
  }
  else
  {
    [(id)qword_1EB402D58 setObject:v4 forKeyedSubscript:v3];
    BOOL v10 = 1;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_219);

  return v10;
}

- (BOOL)isRunningUnitTests
{
  return NSClassFromString(&cfstr_Xctest.isa) != 0;
}

- (void).cxx_destruct
{
}

@end