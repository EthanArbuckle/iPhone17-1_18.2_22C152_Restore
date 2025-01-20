@interface TransparencyAuditorReport
- (NSString)auditorName;
- (TransparencyAuditorReport)initWithAuditorId:(int64_t)a3;
- (int64_t)auditorId;
- (void)getReportForUUID:(id)a3 completionBlock:(id)a4;
- (void)getReportsForUUIDs:(id)a3 completionBlock:(id)a4;
- (void)makeReport:(id)a3 additionalData:(id)a4 completionBlock:(id)a5;
- (void)makeReports:(id)a3 additionalData:(id)a4 completionBlock:(id)a5;
- (void)setAuditorId:(int64_t)a3;
@end

@implementation TransparencyAuditorReport

- (TransparencyAuditorReport)initWithAuditorId:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TransparencyAuditorReport;
  v4 = [(TransparencyAuditorReport *)&v7 init];
  v5 = v4;
  if (v4) {
    [(TransparencyAuditorReport *)v4 setAuditorId:a3];
  }
  return v5;
}

- (NSString)auditorName
{
  if ([(TransparencyAuditorReport *)self auditorId]) {
    return (NSString *)@"Unknown";
  }
  else {
    return (NSString *)@"Apple Inc.";
  }
}

- (void)getReportForUUID:(id)a3 completionBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__TransparencyAuditorReport_getReportForUUID_completionBlock___block_invoke;
  v11[3] = &unk_26479E888;
  id v12 = v5;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__TransparencyAuditorReport_getReportForUUID_completionBlock___block_invoke_2_107;
  v9[3] = &unk_26479E748;
  id v10 = v13;
  id v7 = v13;
  id v8 = v5;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v11 errorHandler:v9];
}

void __62__TransparencyAuditorReport_getReportForUUID_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_12);
    }
    v11 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl(&dword_226345000, v11, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_102);
    }
    id v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl(&dword_226345000, v8, OS_LOG_TYPE_INFO, "Sending asynchronous get auditor report for %@", buf, 0xCu);
    }
    uint64_t v14 = *(void *)(a1 + 32);
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __62__TransparencyAuditorReport_getReportForUUID_completionBlock___block_invoke_104;
    v12[3] = &unk_26479F0F8;
    id v13 = *(id *)(a1 + 40);
    [v5 getReportsForUUIDs:v10 completionBlock:v12];
  }
}

uint64_t __62__TransparencyAuditorReport_getReportForUUID_completionBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __62__TransparencyAuditorReport_getReportForUUID_completionBlock___block_invoke_100()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __62__TransparencyAuditorReport_getReportForUUID_completionBlock___block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id v5 = a3;
    id v7 = [a2 objectAtIndexedSubscript:0];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    id v6 = *(void (**)(uint64_t, void))(v3 + 16);
    id v7 = a3;
    v6(v3, 0);
  }
}

void __62__TransparencyAuditorReport_getReportForUUID_completionBlock___block_invoke_2_107(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_109_0);
  }
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown getReportForUUID error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__TransparencyAuditorReport_getReportForUUID_completionBlock___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)getReportsForUUIDs:(id)a3 completionBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__TransparencyAuditorReport_getReportsForUUIDs_completionBlock___block_invoke;
  v11[3] = &unk_26479E888;
  id v12 = v5;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__TransparencyAuditorReport_getReportsForUUIDs_completionBlock___block_invoke_116;
  v9[3] = &unk_26479E748;
  id v10 = v13;
  id v7 = v13;
  id v8 = v5;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v11 errorHandler:v9];
}

void __64__TransparencyAuditorReport_getReportsForUUIDs_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_112);
    }
    id v10 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_226345000, v10, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v11, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_115);
    }
    id v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_226345000, v8, OS_LOG_TYPE_INFO, "Sending asynchronous get auditor report for %@", (uint8_t *)&v11, 0xCu);
    }
    [v5 getReportsForUUIDs:*(void *)(a1 + 32) completionBlock:*(void *)(a1 + 40)];
  }
}

uint64_t __64__TransparencyAuditorReport_getReportsForUUIDs_completionBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __64__TransparencyAuditorReport_getReportsForUUIDs_completionBlock___block_invoke_113()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __64__TransparencyAuditorReport_getReportsForUUIDs_completionBlock___block_invoke_116(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_119);
  }
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown getReportForUUID error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__TransparencyAuditorReport_getReportsForUUIDs_completionBlock___block_invoke_2_117()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)makeReport:(id)a3 additionalData:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __71__TransparencyAuditorReport_makeReport_additionalData_completionBlock___block_invoke;
  v16[3] = &unk_26479F548;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__TransparencyAuditorReport_makeReport_additionalData_completionBlock___block_invoke_125;
  v14[3] = &unk_26479E748;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v16 errorHandler:v14];
}

void __71__TransparencyAuditorReport_makeReport_additionalData_completionBlock___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_121_0);
    }
    id v13 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl(&dword_226345000, v13, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_124_0);
    }
    id v8 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_INFO))
    {
      id v9 = (void *)a1[4];
      id v10 = v8;
      id v11 = [v9 auditorName];
      *(_DWORD *)buf = 138412290;
      v16 = v11;
      _os_log_impl(&dword_226345000, v10, OS_LOG_TYPE_INFO, "Sending asynchronous make auditor report to %@", buf, 0xCu);
    }
    uint64_t v14 = a1[5];
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
    [v5 makeReports:v12 additionalData:a1[6] auditorURI:0 completionBlock:a1[7]];
  }
}

uint64_t __71__TransparencyAuditorReport_makeReport_additionalData_completionBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __71__TransparencyAuditorReport_makeReport_additionalData_completionBlock___block_invoke_122()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __71__TransparencyAuditorReport_makeReport_additionalData_completionBlock___block_invoke_125(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_128_0);
  }
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown makeReport error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__TransparencyAuditorReport_makeReport_additionalData_completionBlock___block_invoke_2_126()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)makeReports:(id)a3 additionalData:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __72__TransparencyAuditorReport_makeReports_additionalData_completionBlock___block_invoke;
  v16[3] = &unk_26479F548;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __72__TransparencyAuditorReport_makeReports_additionalData_completionBlock___block_invoke_134;
  v14[3] = &unk_26479E748;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v16 errorHandler:v14];
}

void __72__TransparencyAuditorReport_makeReports_additionalData_completionBlock___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_130_0);
    }
    id v12 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      uint64_t v14 = v7;
      _os_log_impl(&dword_226345000, v12, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v13, 0xCu);
    }
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_133);
    }
    id v8 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_INFO))
    {
      id v9 = (void *)a1[4];
      id v10 = v8;
      id v11 = [v9 auditorName];
      int v13 = 138412290;
      uint64_t v14 = v11;
      _os_log_impl(&dword_226345000, v10, OS_LOG_TYPE_INFO, "Sending asynchronous make auditor report to %@", (uint8_t *)&v13, 0xCu);
    }
    [v5 makeReports:a1[5] additionalData:a1[6] auditorURI:0 completionBlock:a1[7]];
  }
}

uint64_t __72__TransparencyAuditorReport_makeReports_additionalData_completionBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __72__TransparencyAuditorReport_makeReports_additionalData_completionBlock___block_invoke_131()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __72__TransparencyAuditorReport_makeReports_additionalData_completionBlock___block_invoke_134(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_137);
  }
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown makeReport error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__TransparencyAuditorReport_makeReports_additionalData_completionBlock___block_invoke_2_135()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (int64_t)auditorId
{
  return self->_auditorId;
}

- (void)setAuditorId:(int64_t)a3
{
  self->_auditorId = a3;
}

@end