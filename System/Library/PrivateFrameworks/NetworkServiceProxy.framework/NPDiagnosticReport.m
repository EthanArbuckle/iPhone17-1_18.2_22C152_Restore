@interface NPDiagnosticReport
+ (BOOL)logNSPDiagnosticReport:(id)a3 event:(id)a4 context:(id)a5;
+ (void)logInternalError:(id)a3 context:(id)a4;
@end

@implementation NPDiagnosticReport

+ (BOOL)logNSPDiagnosticReport:(id)a3 event:(id)a4 context:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  buffer[0] = 0;
  if (v8)
  {
    uint64_t v10 = getpid();
    if (proc_name(v10, buffer, 0x40u) < 1) {
      objc_msgSend(NSString, "stringWithFormat:", @"<unknown-name>[%d]", v10);
    }
    else {
    v12 = [NSString stringWithUTF8String:buffer];
    }
    v13 = nplog_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v26 = v8;
      __int16 v27 = 2112;
      v28 = v12;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_debug_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_DEBUG, "Logging diagnostic event <%@> for %@ with context <%@>", buf, 0x20u);
    }

    id v14 = objc_alloc_init(MEMORY[0x1E4FA8AF0]);
    v15 = v14;
    if (v14
      && ([v14 signatureWithDomain:@"Tuscany" type:v7 subType:v8 detectedProcess:v12 triggerThresholdValues:0], (v16 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v17 = v16;
      if (v9) {
        [v16 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4FA8CB8]];
      }
      uint64_t v23 = *MEMORY[0x1E4FA8B40];
      uint64_t v21 = *MEMORY[0x1E4FA8B38];
      v22 = &unk_1EF43BD60;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      v24 = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      char v11 = [v15 snapshotWithSignature:v17 duration:0 events:0 payload:v19 actions:&__block_literal_global_7 reply:120.0];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

void __59__NPDiagnosticReport_logNSPDiagnosticReport_event_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_debug_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEBUG, "Diagnostic report response = %@", (uint8_t *)&v4, 0xCu);
  }
}

+ (void)logInternalError:(id)a3 context:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = +[NPDiagnosticReport logNSPDiagnosticReport:@"InternalError" event:v5 context:a4];
  id v7 = nplog_obj();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEFAULT, "Logged %@ event", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_error_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_ERROR, "Failed to log %@ event", (uint8_t *)&v9, 0xCu);
  }
}

@end