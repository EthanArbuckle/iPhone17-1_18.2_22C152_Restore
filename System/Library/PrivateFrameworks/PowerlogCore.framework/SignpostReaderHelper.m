@interface SignpostReaderHelper
- (NSXPCConnection)connectionToServer;
- (id)createXPCConnection;
- (id)customGetNearestMidnight;
- (id)generateRapidMSSWithStartDate:(id)a3 endDate:(id)a4 atPath:(id)a5;
- (id)generateRapidSignpostSummaryWithStartDate:(id)a3 endDate:(id)a4;
- (id)generateSignpostSubmissionWithTagConfig:(id)a3 withAllowlist:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6 includeSPFile:(BOOL)a7;
- (id)generateTaskingMSSWithStartDate:(id)a3 endDate:(id)a4 atPath:(id)a5;
- (id)getSignpostMetricsWithStartDate:(id)a3 withEndDate:(id)a4 processMXSignpost:(BOOL)a5;
- (id)getSignpostSummaryWithAllowlist:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5;
- (id)processSignpostWithConfig:(id)a3 withServiceType:(int)a4;
- (void)closeXPCConnection;
- (void)setConnectionToServer:(id)a3;
@end

@implementation SignpostReaderHelper

- (id)getSignpostMetricsWithStartDate:(id)a3 withEndDate:(id)a4 processMXSignpost:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v9 = [(SignpostReaderHelper *)self customGetNearestMidnight];
  }
  v10 = (void *)MEMORY[0x1E4F1CC08];
  if (v8 && v9)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v11 setObject:v9 forKey:@"end_date"];
    [v11 setObject:v8 forKey:@"start_date"];
    v12 = [NSNumber numberWithBool:v5];
    [v11 setObject:v12 forKey:@"process_mxsignpost"];

    v10 = [(SignpostReaderHelper *)self processSignpostWithConfig:v11 withServiceType:1];
  }
  return v10;
}

- (id)getSignpostSummaryWithAllowlist:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5
{
  BOOL v5 = (void *)MEMORY[0x1E4F1CC08];
  if (a3 && a4 && a5)
  {
    id v9 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v10 = a5;
    id v11 = a4;
    id v12 = a3;
    id v13 = objc_alloc_init(v9);
    [v13 setObject:v12 forKey:@"taskingAllowlist"];

    [v13 setObject:v11 forKey:@"taskingStartDate"];
    [v13 setObject:v10 forKey:@"taskingEndDate"];

    BOOL v5 = [(SignpostReaderHelper *)self processSignpostWithConfig:v13 withServiceType:2];
  }
  return v5;
}

- (id)generateSignpostSubmissionWithTagConfig:(id)a3 withAllowlist:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6 includeSPFile:(BOOL)a7
{
  v7 = (void *)MEMORY[0x1E4F1CC08];
  if (a3 && a4 && a5 && a6)
  {
    BOOL v10 = a7;
    id v13 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v14 = a6;
    id v15 = a5;
    id v16 = a4;
    id v17 = a3;
    id v18 = objc_alloc_init(v13);
    [v18 setObject:v16 forKey:@"taskingAllowlist"];

    [v18 setObject:v15 forKey:@"taskingStartDate"];
    [v18 setObject:v14 forKey:@"taskingEndDate"];

    [v18 setObject:v17 forKey:@"taskingTagConfig"];
    v19 = [NSNumber numberWithBool:v10];
    [v18 setObject:v19 forKeyedSubscript:@"taskingSubmitSP"];

    v7 = [(SignpostReaderHelper *)self processSignpostWithConfig:v18 withServiceType:0];
  }
  return v7;
}

- (id)generateRapidSignpostSummaryWithStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v9 setObject:v6 forKey:@"start_date"];
    [v9 setObject:v8 forKey:@"end_date"];
    BOOL v10 = [(SignpostReaderHelper *)self processSignpostWithConfig:v9 withServiceType:3];
  }
  else
  {
    id v11 = logHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SignpostReaderHelper generateRapidSignpostSummaryWithStartDate:endDate:]();
    }

    BOOL v10 = 0;
  }

  return v10;
}

- (id)generateRapidMSSWithStartDate:(id)a3 endDate:(id)a4 atPath:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v8 && v9 && v10)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v12 setObject:v8 forKey:@"start_date"];
    [v12 setObject:v9 forKey:@"end_date"];
    [v12 setObject:v11 forKey:@"mss_filepath"];
    id v13 = [(SignpostReaderHelper *)self processSignpostWithConfig:v12 withServiceType:4];
  }
  else
  {
    id v14 = logHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412802;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      v21 = v11;
      _os_log_error_impl(&dword_1BBD2F000, v14, OS_LOG_TYPE_ERROR, "Invalid arguments: startDate=%@ endDate=%@ path=%@", (uint8_t *)&v16, 0x20u);
    }

    id v13 = 0;
  }

  return v13;
}

- (id)generateTaskingMSSWithStartDate:(id)a3 endDate:(id)a4 atPath:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v8 && v9 && v10)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v12 setObject:v8 forKey:@"start_date"];
    [v12 setObject:v9 forKey:@"end_date"];
    [v12 setObject:v11 forKey:@"mss_filepath"];
    id v13 = [(SignpostReaderHelper *)self processSignpostWithConfig:v12 withServiceType:5];
  }
  else
  {
    id v14 = logHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412802;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      v21 = v11;
      _os_log_error_impl(&dword_1BBD2F000, v14, OS_LOG_TYPE_ERROR, "Invalid arguments: startDate=%@ endDate=%@ path=%@", (uint8_t *)&v16, 0x20u);
    }

    id v13 = 0;
  }

  return v13;
}

- (id)processSignpostWithConfig:(id)a3 withServiceType:(int)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = logHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = a4;
    LOWORD(v32) = 2112;
    *(void *)((char *)&v32 + 2) = v6;
    _os_log_impl(&dword_1BBD2F000, v7, OS_LOG_TYPE_INFO, "processSignpost for service type (%d) with config %@", buf, 0x12u);
  }

  id v8 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = [(SignpostReaderHelper *)self createXPCConnection];
  *(void *)buf = 0;
  *(void *)&long long v32 = buf;
  *((void *)&v32 + 1) = 0x3032000000;
  v33 = __Block_byref_object_copy__8;
  v34 = __Block_byref_object_dispose__8;
  id v35 = [MEMORY[0x1E4F1C9E8] dictionary];
  switch(a4)
  {
    case 0:
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke;
      v24[3] = &unk_1E6254920;
      v24[4] = buf;
      [v9 submitSignpostDataWithConfig:v6 withReply:v24];
      break;
    case 1:
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_35;
      v23[3] = &unk_1E6254920;
      v23[4] = buf;
      [v9 summarizeSignpostMetrics:v6 withReply:v23];
      break;
    case 2:
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_36;
      v22[3] = &unk_1E6254920;
      v22[4] = buf;
      [v9 aggregateSignpostData:v6 withReply:v22];
      break;
    case 3:
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_37;
      v21[3] = &unk_1E6254920;
      v21[4] = buf;
      [v9 readRawSignpostData:v6 withReply:v21];
      break;
    case 4:
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_38;
      v20[3] = &unk_1E6254920;
      v20[4] = buf;
      [v9 generateMSSReportForRAPID:v6 withReply:v20];
      break;
    case 5:
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_39;
      v19[3] = &unk_1E6254920;
      v19[4] = buf;
      [v9 generateMSSReportForTasking:v6 withReply:v19];
      break;
    default:
      id v10 = logHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v25 = 67109120;
        LODWORD(v26) = a4;
        _os_log_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_INFO, "Unknown service type specified: %d", v25, 8u);
      }

      break;
  }
  [(SignpostReaderHelper *)self closeXPCConnection];
  id v11 = logHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(v32 + 40);
    *(_DWORD *)v25 = 138412290;
    uint64_t v26 = v12;
    _os_log_impl(&dword_1BBD2F000, v11, OS_LOG_TYPE_INFO, "The successful reply happened: %@", v25, 0xCu);
  }

  id v13 = [MEMORY[0x1E4F1C9C8] date];
  [v13 timeIntervalSinceDate:v8];
  uint64_t v15 = v14;
  int v16 = logHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v25 = 134218498;
    uint64_t v26 = v15;
    __int16 v27 = 2112;
    v28 = v8;
    __int16 v29 = 2112;
    v30 = v13;
    _os_log_impl(&dword_1BBD2F000, v16, OS_LOG_TYPE_INFO, "Time for signpost reading to run: %f, %@, %@", v25, 0x20u);
  }

  id v17 = *(id *)(v32 + 40);
  _Block_object_dispose(buf, 8);

  return v17;
}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = logHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = logHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_35_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_36(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = logHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_36_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_37(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = logHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_37_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_38(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = logHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_38_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_39(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = logHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_39_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (id)createXPCConnection
{
  id v3 = logHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_INFO, "PL establishing a connection", buf, 2u);
  }

  v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.PerfPowerServicesSignpostReader"];
  connectionToServer = self->_connectionToServer;
  self->_connectionToServer = v4;

  id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F15AB1B8];
  [(NSXPCConnection *)self->_connectionToServer setRemoteObjectInterface:v6];

  [(NSXPCConnection *)self->_connectionToServer setInterruptionHandler:&__block_literal_global_52];
  [(NSXPCConnection *)self->_connectionToServer setInvalidationHandler:&__block_literal_global_55_0];
  [(NSXPCConnection *)self->_connectionToServer resume];
  id v7 = logHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1BBD2F000, v7, OS_LOG_TYPE_INFO, "spinning up xpc svc", v10, 2u);
  }

  id v8 = [(NSXPCConnection *)self->_connectionToServer synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_59_0];
  return v8;
}

void __43__SignpostReaderHelper_createXPCConnection__block_invoke()
{
  v0 = logHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __43__SignpostReaderHelper_createXPCConnection__block_invoke_cold_1(v0);
  }
}

void __43__SignpostReaderHelper_createXPCConnection__block_invoke_53()
{
  v0 = logHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __43__SignpostReaderHelper_createXPCConnection__block_invoke_53_cold_1(v0);
  }
}

void __43__SignpostReaderHelper_createXPCConnection__block_invoke_56(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = logHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __43__SignpostReaderHelper_createXPCConnection__block_invoke_56_cold_1(v2, v3);
  }
}

- (void)closeXPCConnection
{
}

- (id)customGetNearestMidnight
{
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v4 = [v3 components:28 fromDate:v2];
  uint64_t v5 = [v3 dateFromComponents:v4];

  return v5;
}

- (NSXPCConnection)connectionToServer
{
  return self->_connectionToServer;
}

- (void)setConnectionToServer:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)generateRapidSignpostSummaryWithStartDate:endDate:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1BBD2F000, v1, OS_LOG_TYPE_ERROR, "Invalid arguments: startDate=%@ endDate=%@", v2, 0x16u);
}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "submitSignpostDataWithConfig: %@", v2, v3, v4, v5, v6);
}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_35_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "summarizeSignpostMetrics: %@", v2, v3, v4, v5, v6);
}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_36_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "aggregateSignpostData : %@", v2, v3, v4, v5, v6);
}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_37_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "readRawSignpostData : %@", v2, v3, v4, v5, v6);
}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_38_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "generateMSSReportForRAPID : %@", v2, v3, v4, v5, v6);
}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_39_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "generateMSSReportForTasking : %@", v2, v3, v4, v5, v6);
}

void __43__SignpostReaderHelper_createXPCConnection__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_ERROR, "Connection was interrupted.", v1, 2u);
}

void __43__SignpostReaderHelper_createXPCConnection__block_invoke_53_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_ERROR, "Invalid connection handler is happening.", v1, 2u);
}

void __43__SignpostReaderHelper_createXPCConnection__block_invoke_56_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "Connection error happened %@", v4, 0xCu);
}

@end