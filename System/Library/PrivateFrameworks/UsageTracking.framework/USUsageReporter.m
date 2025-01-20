@interface USUsageReporter
+ (id)getLocalDeviceIdentifierAndReturnError:(id *)a3;
+ (void)synchronizeUsageWithCompletionHandler:(id)a3;
- (NSXPCConnection)xpcConnection;
- (USUsageReporter)init;
- (id)fetchUsageForApplications:(id)a3 webDomains:(id)a4 categories:(id)a5 interval:(id)a6 error:(id *)a7;
- (id)getLocalDeviceIdentifierAndReturnError:(id *)a3;
- (void)dealloc;
- (void)fetchReportsDuringInterval:(id)a3 partitionInterval:(double)a4 completionHandler:(id)a5;
- (void)fetchReportsDuringInterval:(id)a3 partitionInterval:(double)a4 forceImmediateSync:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation USUsageReporter

- (USUsageReporter)init
{
  v6.receiver = self;
  v6.super_class = (Class)USUsageReporter;
  v2 = [(USUsageReporter *)&v6 init];
  v3 = +[USTrackingAgentPrivateConnection newConnection];
  xpcConnection = v2->_xpcConnection;
  v2->_xpcConnection = v3;

  [(NSXPCConnection *)v2->_xpcConnection resume];
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)USUsageReporter;
  [(USUsageReporter *)&v3 dealloc];
}

+ (id)getLocalDeviceIdentifierAndReturnError:(id *)a3
{
  return +[USUsageQuerying getLocalDeviceIdentifierAndReturnError:a3];
}

- (id)getLocalDeviceIdentifierAndReturnError:(id *)a3
{
  return +[USUsageQuerying getLocalDeviceIdentifierAndReturnError:a3];
}

+ (void)synchronizeUsageWithCompletionHandler:(id)a3
{
}

- (void)fetchReportsDuringInterval:(id)a3 partitionInterval:(double)a4 forceImmediateSync:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v10 = a6;
  if (v7) {
    [(id)objc_opt_class() synchronizeUsageWithCompletionHandler:&__block_literal_global_2];
  }
  [(USUsageReporter *)self fetchReportsDuringInterval:v11 partitionInterval:v10 completionHandler:a4];
}

void __101__USUsageReporter_fetchReportsDuringInterval_partitionInterval_forceImmediateSync_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __101__USUsageReporter_fetchReportsDuringInterval_partitionInterval_forceImmediateSync_completionHandler___block_invoke_cold_1((uint64_t)v2);
  }
}

- (void)fetchReportsDuringInterval:(id)a3 partitionInterval:(double)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(USUsageReporter *)self xpcConnection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__USUsageReporter_fetchReportsDuringInterval_partitionInterval_completionHandler___block_invoke;
  v13[3] = &unk_26431E718;
  double v17 = a4;
  id v14 = v8;
  v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  +[USXPCRemoteObjectProxy proxyFromConnection:v10 withRetryCount:1 proxyHandler:v13];
}

void __82__USUsageReporter_fetchReportsDuringInterval_partitionInterval_completionHandler___block_invoke(double *a1, void *a2)
{
  if (a2)
  {
    double v3 = a1[7];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __82__USUsageReporter_fetchReportsDuringInterval_partitionInterval_completionHandler___block_invoke_2;
    v7[3] = &unk_26431E6F0;
    uint64_t v4 = *((void *)a1 + 4);
    v5 = (void *)*((void *)a1 + 6);
    *(double *)&v7[4] = a1[5];
    id v8 = v5;
    [a2 fetchReportsDuringInterval:v4 partitionInterval:v7 replyHandler:v3];
  }
  else
  {
    objc_super v6 = *(void (**)(void))(*((void *)a1 + 6) + 16);
    v6();
  }
}

uint64_t __82__USUsageReporter_fetchReportsDuringInterval_partitionInterval_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)fetchUsageForApplications:(id)a3 webDomains:(id)a4 categories:(id)a5 interval:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__2;
  v41 = __Block_byref_object_dispose__2;
  id v42 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__2;
  v35 = __Block_byref_object_dispose__2;
  id v36 = 0;
  id v16 = [(USUsageReporter *)self xpcConnection];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __82__USUsageReporter_fetchUsageForApplications_webDomains_categories_interval_error___block_invoke;
  v24[3] = &unk_26431E768;
  id v17 = v12;
  id v25 = v17;
  id v18 = v13;
  id v26 = v18;
  id v19 = v14;
  id v27 = v19;
  id v20 = v15;
  id v28 = v20;
  v29 = &v37;
  v30 = &v31;
  +[USXPCRemoteObjectProxy synchronousProxyFromConnection:v16 withRetryCount:1 proxyHandler:v24];

  if (a7)
  {
    v21 = (void *)v32[5];
    if (v21) {
      *a7 = v21;
    }
  }
  id v22 = (id)v38[5];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v22;
}

void __82__USUsageReporter_fetchUsageForApplications_webDomains_categories_interval_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __82__USUsageReporter_fetchUsageForApplications_webDomains_categories_interval_error___block_invoke_2;
    v11[3] = &unk_26431E740;
    long long v12 = *(_OWORD *)(a1 + 64);
    [a2 fetchUsageForApplications:v7 webDomains:v8 categories:v9 interval:v10 replyHandler:v11];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
  }
}

void __82__USUsageReporter_fetchUsageForApplications_webDomains_categories_interval_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v7 = v10;
  }
  else
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v7 = v5;
  }
  id v8 = v7;
  uint64_t v9 = *v6;
  *id v6 = v8;
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

void __101__USUsageReporter_fetchReportsDuringInterval_partitionInterval_forceImmediateSync_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Error synchronizing with high urgency: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end