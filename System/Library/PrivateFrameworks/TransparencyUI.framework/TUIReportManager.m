@interface TUIReportManager
- (NSDictionary)reportData;
- (NSString)additionalDetails;
- (TUIReportManager)initWithStaticIdentityManager:(id)a3;
- (TUIStaticIdentityManager)staticIdentityManager;
- (TransparencyAuditorReport)auditor;
- (id)reportDetails;
- (void)fetchDataWithUUID:(id)a3;
- (void)sendReport:(id)a3;
- (void)setAdditionalDetails:(id)a3;
- (void)setAuditor:(id)a3;
- (void)setStaticIdentityManager:(id)a3;
@end

@implementation TUIReportManager

- (TUIReportManager)initWithStaticIdentityManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIReportManager;
  v6 = [(TUIReportManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_staticIdentityManager, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x263F80D58]) initWithAuditorId:0];
    auditor = v7->_auditor;
    v7->_auditor = (TransparencyAuditorReport *)v8;
  }
  return v7;
}

- (void)sendReport:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void (**)(void, void))v4;
  reportData = self->_reportData;
  if (reportData)
  {
    p_additionalDetails = &self->_additionalDetails;
    additionalDetails = self->_additionalDetails;
    uint64_t v8 = p_additionalDetails[1];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __31__TUIReportManager_sendReport___block_invoke_3;
    v12[3] = &unk_2655534C8;
    id v13 = v4;
    [(NSString *)v8 makeReport:reportData additionalData:additionalDetails completionBlock:v12];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_9 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_9, &__block_literal_global_9);
    }
    v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9, OS_LOG_TYPE_ERROR))
    {
      reportDataError = self->_reportDataError;
      *(_DWORD *)buf = 138412290;
      v15 = reportDataError;
      _os_log_impl(&dword_260338000, v10, OS_LOG_TYPE_ERROR, "No report data, error = %@", buf, 0xCu);
    }
    if (v5) {
      ((void (**)(void, NSError *))v5)[2](v5, self->_reportDataError);
    }
  }
}

uint64_t __31__TUIReportManager_sendReport___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __31__TUIReportManager_sendReport___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_9 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_9, &__block_literal_global_5_0);
    }
    id v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_260338000, v4, OS_LOG_TYPE_ERROR, "Failed to send report, error = %@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __31__TUIReportManager_sendReport___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)fetchDataWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    auditor = self->_auditor;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __38__TUIReportManager_fetchDataWithUUID___block_invoke_11;
    v10[3] = &unk_2655534F0;
    objc_super v11 = (NSError *)v4;
    v12 = self;
    [(TransparencyAuditorReport *)auditor getReportForUUID:v11 completionBlock:v10];
    reportDataError = v11;
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_9 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_9, &__block_literal_global_8);
    }
    uint64_t v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_260338000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch report data, no UUID provided", buf, 2u);
    }
    v9 = [MEMORY[0x263F80D68] errorWithDomain:*MEMORY[0x263F80DB8], -1, @"Failed to fetch report data, no UUID provided" code description];
    reportDataError = self->_reportDataError;
    self->_reportDataError = v9;
  }
}

uint64_t __38__TUIReportManager_fetchDataWithUUID___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __38__TUIReportManager_fetchDataWithUUID___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v8 = (void *)(a1 + 40);
    v10 = *(void **)(v9 + 8);
    *(void *)(v9 + 8) = 0;

    uint64_t v11 = 24;
    a3 = a2;
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_9 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_9, &__block_literal_global_13_0);
    }
    v12 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = 138412546;
      uint64_t v15 = v13;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_260338000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch report data for UUID (%@), error = %@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v8 = (void *)(a1 + 40);
    uint64_t v11 = 8;
  }
  objc_storeStrong((id *)(*v8 + v11), a3);
}

uint64_t __38__TUIReportManager_fetchDataWithUUID___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)reportDetails
{
  id v3 = [(TUIStaticIdentityManager *)self->_staticIdentityManager selfAccountKeyDisplayString];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    uint64_t v5 = NSString;
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"REPORTING_ACCOUNT_KEY" value:&stru_270C3F140 table:@"Localizable"];
    uint64_t v8 = [(TUIStaticIdentityManager *)self->_staticIdentityManager selfAccountKeyDisplayString];
    uint64_t v9 = [v5 stringWithFormat:@"%@\n%@", v7, v8];
  }
  else
  {
    uint64_t v9 = &stru_270C3F140;
  }
  v10 = [(TUIStaticIdentityManager *)self->_staticIdentityManager peerAccountKeyDisplayString];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    v12 = NSString;
    uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v14 = [v13 localizedStringForKey:@"CONTACT_ACCOUNT_KEY" value:&stru_270C3F140 table:@"Localizable"];
    uint64_t v15 = [(TUIStaticIdentityManager *)self->_staticIdentityManager peerAccountKeyDisplayString];
    uint64_t v16 = [v12 stringWithFormat:@"%@\n\n%@\n%@", v9, v14, v15];

    uint64_t v9 = (__CFString *)v16;
  }
  if ([(NSString *)self->_additionalDetails length])
  {
    id v17 = NSString;
    uint64_t v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"ADDITIONAL_DETAILS" value:&stru_270C3F140 table:@"Localizable"];
    uint64_t v20 = [v17 stringWithFormat:@"%@\n\n%@\n%@", v9, v19, self->_additionalDetails];

    uint64_t v9 = (__CFString *)v20;
  }
  if ([(NSDictionary *)self->_reportData count])
  {
    v21 = NSString;
    v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"COMMUNICATION_LOG" value:&stru_270C3F140 table:@"Localizable"];
    uint64_t v24 = [v21 stringWithFormat:@"%@\n\n%@ (ids.apple.com)\n%@", v9, v23, self->_reportData];

    uint64_t v9 = (__CFString *)v24;
  }
  return v9;
}

- (TUIStaticIdentityManager)staticIdentityManager
{
  return self->_staticIdentityManager;
}

- (void)setStaticIdentityManager:(id)a3
{
}

- (NSDictionary)reportData
{
  return self->_reportData;
}

- (NSString)additionalDetails
{
  return self->_additionalDetails;
}

- (void)setAdditionalDetails:(id)a3
{
}

- (TransparencyAuditorReport)auditor
{
  return self->_auditor;
}

- (void)setAuditor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditor, 0);
  objc_storeStrong((id *)&self->_additionalDetails, 0);
  objc_storeStrong((id *)&self->_reportData, 0);
  objc_storeStrong((id *)&self->_staticIdentityManager, 0);
  objc_storeStrong((id *)&self->_reportDataError, 0);
}

@end