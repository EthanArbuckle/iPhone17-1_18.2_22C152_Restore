@interface RbdcConverterHelper
- (BOOL)isProcessRbdcAllowed;
- (NSXPCConnection)connectionToServer;
- (id)copyRBDCLogsToPath:(id)a3 withServiceType:(int)a4;
- (id)createXPCConnection;
- (id)processRbdc:(id)a3 withServiceType:(int)a4;
- (void)closeXPCConnection;
- (void)isProcessRbdcAllowed;
- (void)setConnectionToServer:(id)a3;
@end

@implementation RbdcConverterHelper

- (id)copyRBDCLogsToPath:(id)a3 withServiceType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setObject:v7 forKey:@"epsql_filepath"];

  v9 = [(RbdcConverterHelper *)self processRbdc:v8 withServiceType:v4];

  return v9;
}

- (BOOL)isProcessRbdcAllowed
{
  __int16 v9 = 0;
  int v8 = 0;
  IOAccessoryManagerGetServiceWithPrimaryPort();
  int DigitalIDAccessoryVersionInfo = IOAccesoryManagerGetDigitalIDAccessoryVersionInfo();
  if (DigitalIDAccessoryVersionInfo)
  {
    int v3 = DigitalIDAccessoryVersionInfo;
    uint64_t v4 = logHandleRbdcHelper();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(RbdcConverterHelper *)v3 isProcessRbdcAllowed];
    }
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = 1;
    if (v8 <= 1u && (v8 != 1 || BYTE1(v8) == 0)) {
      BOOL v5 = 0;
    }
    uint64_t v4 = logHandleRbdcHelper();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      [(RbdcConverterHelper *)(unsigned __int8 *)&v8 isProcessRbdcAllowed];
    }
  }

  return v5;
}

- (id)processRbdc:(id)a3 withServiceType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  v6 = logHandleRbdcHelper();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v4;
    LOWORD(v45) = 2112;
    *(void *)((char *)&v45 + 2) = v34;
    _os_log_impl(&dword_1BBD2F000, v6, OS_LOG_TYPE_INFO, "processRbdc for service type (%d) with config %@", buf, 0x12u);
  }

  v33 = [MEMORY[0x1E4F1C9C8] date];
  v32 = [(RbdcConverterHelper *)self createXPCConnection];
  *(void *)buf = 0;
  *(void *)&long long v45 = buf;
  *((void *)&v45 + 1) = 0x3032000000;
  v46 = __Block_byref_object_copy__17;
  v47 = __Block_byref_object_dispose__17;
  id v48 = [MEMORY[0x1E4F1C9E8] dictionary];
  if (v4 == 1)
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __51__RbdcConverterHelper_processRbdc_withServiceType___block_invoke_16;
    v36[3] = &unk_1E6254920;
    v36[4] = buf;
    [v32 getHeatmapData:v34 withReply:v36];
  }
  else if (v4)
  {
    id v7 = logHandleRbdcHelper();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v38 = 67109120;
      LODWORD(v39) = v4;
      _os_log_impl(&dword_1BBD2F000, v7, OS_LOG_TYPE_INFO, "Unknown service type specified: %d", v38, 8u);
    }
  }
  else
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __51__RbdcConverterHelper_processRbdc_withServiceType___block_invoke;
    v37[3] = &unk_1E6254920;
    v37[4] = buf;
    [v32 getRbdcData:v34 withReply:v37];
  }
  [(RbdcConverterHelper *)self closeXPCConnection];
  int v8 = logHandleRbdcHelper();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    double v9 = *(double *)(v45 + 40);
    *(_DWORD *)v38 = 138412290;
    double v39 = v9;
    _os_log_impl(&dword_1BBD2F000, v8, OS_LOG_TYPE_INFO, "RBDC reply received: result=%@", v38, 0xCu);
  }

  v10 = [MEMORY[0x1E4F1C9C8] date];
  [v10 timeIntervalSinceDate:v33];
  double v12 = v11;
  v13 = logHandleRbdcHelper();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v38 = 134218498;
    double v39 = v12;
    __int16 v40 = 2112;
    v41 = v33;
    __int16 v42 = 2112;
    v43 = v10;
    _os_log_impl(&dword_1BBD2F000, v13, OS_LOG_TYPE_INFO, "Time for RBDC processing to run: %f, %@, %@", v38, 0x20u);
  }

  v14 = [v34 objectForKeyedSubscript:@"epsql_filepath"];
  v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v35 = 0;
  v16 = [v15 attributesOfItemAtPath:v14 error:&v35];
  id v17 = v35;

  if (v17)
  {
    v18 = logHandleRbdcHelper();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[RbdcConverterHelper processRbdc:withServiceType:]();
    }

    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = [v16 fileSize];
  }
  v20 = +[PLUtilities deviceBootTime];
  v21 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [v21 timeIntervalSinceDate:v20];
  double v23 = v22;
  v24 = [MEMORY[0x1E4F1CA60] dictionary];
  v25 = [NSNumber numberWithUnsignedInt:v4];
  [v24 setObject:v25 forKeyedSubscript:@"serviceType"];

  v26 = [*(id *)(v45 + 40) objectForKeyedSubscript:@"rbdcStatus"];
  [v24 setObject:v26 forKeyedSubscript:@"rbdcStatus"];

  v27 = [NSNumber numberWithDouble:v12];
  [v24 setObject:v27 forKeyedSubscript:@"rbdcDurationInSeconds"];

  v28 = [NSNumber numberWithDouble:v23];
  [v24 setObject:v28 forKeyedSubscript:@"uptimeInSeconds"];

  v29 = [NSNumber numberWithUnsignedInteger:v19];
  [v24 setObject:v29 forKeyedSubscript:@"fileSizeInBytes"];

  v30 = logHandleRbdcHelper();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
    -[RbdcConverterHelper processRbdc:withServiceType:]();
  }

  _Block_object_dispose(buf, 8);
  return v24;
}

void __51__RbdcConverterHelper_processRbdc_withServiceType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = logHandleRbdcHelper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __51__RbdcConverterHelper_processRbdc_withServiceType___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __51__RbdcConverterHelper_processRbdc_withServiceType___block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = logHandleRbdcHelper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __51__RbdcConverterHelper_processRbdc_withServiceType___block_invoke_16_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (id)createXPCConnection
{
  id v3 = logHandleRbdcHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_INFO, "PL establishing a connection", buf, 2u);
  }

  uint64_t v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.rbdcConverter"];
  connectionToServer = self->_connectionToServer;
  self->_connectionToServer = v4;

  v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F15AB218];
  [(NSXPCConnection *)self->_connectionToServer setRemoteObjectInterface:v6];

  [(NSXPCConnection *)self->_connectionToServer setInterruptionHandler:&__block_literal_global_43];
  [(NSXPCConnection *)self->_connectionToServer setInvalidationHandler:&__block_literal_global_46];
  [(NSXPCConnection *)self->_connectionToServer resume];
  id v7 = logHandleRbdcHelper();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1BBD2F000, v7, OS_LOG_TYPE_INFO, "spinning up xpc svc", v10, 2u);
  }

  int v8 = [(NSXPCConnection *)self->_connectionToServer synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_50_0];
  return v8;
}

void __42__RbdcConverterHelper_createXPCConnection__block_invoke()
{
  v0 = logHandleRbdcHelper();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __43__SignpostReaderHelper_createXPCConnection__block_invoke_cold_1(v0);
  }
}

void __42__RbdcConverterHelper_createXPCConnection__block_invoke_44()
{
  v0 = logHandleRbdcHelper();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __43__SignpostReaderHelper_createXPCConnection__block_invoke_53_cold_1(v0);
  }
}

void __42__RbdcConverterHelper_createXPCConnection__block_invoke_47(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = logHandleRbdcHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __43__SignpostReaderHelper_createXPCConnection__block_invoke_56_cold_1(v2, v3);
  }
}

- (void)closeXPCConnection
{
  [(NSXPCConnection *)self->_connectionToServer suspend];
  connectionToServer = self->_connectionToServer;
  [(NSXPCConnection *)connectionToServer invalidate];
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

- (void)isProcessRbdcAllowed
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "GetVersionInfo failed with status %d", (uint8_t *)v2, 8u);
}

- (void)processRbdc:withServiceType:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "RBDC metrics: %@", v2, v3, v4, v5, v6);
}

- (void)processRbdc:withServiceType:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_ERROR, "Failed to get EPSQL file attributes with error %@", v1, 0xCu);
}

void __51__RbdcConverterHelper_processRbdc_withServiceType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "getRbdcDataWithReply: %@", v2, v3, v4, v5, v6);
}

void __51__RbdcConverterHelper_processRbdc_withServiceType___block_invoke_16_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "getHeatmapDataWithReply: %@", v2, v3, v4, v5, v6);
}

@end