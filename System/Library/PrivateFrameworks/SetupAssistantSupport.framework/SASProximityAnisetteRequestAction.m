@interface SASProximityAnisetteRequestAction
+ (id)actionFromDictionary:(id)a3;
+ (unint64_t)actionID;
- (AKAnisetteData)anisetteData;
- (BOOL)hasResponse;
- (BOOL)shouldProvision;
- (BOOL)success;
- (NSData)sim;
- (NSString)dsid;
- (id)requestPayload;
- (id)responsePayload;
- (int64_t)request;
- (void)eraseAnisetteWithCompletion:(id)a3;
- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4;
- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4;
- (void)provisionAnisetteWithCompletion:(id)a3;
- (void)setAnisetteData:(id)a3;
- (void)setDsid:(id)a3;
- (void)setRequest:(int64_t)a3;
- (void)setResponseFromData:(id)a3;
- (void)setShouldProvision:(BOOL)a3;
- (void)setSim:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4;
@end

@implementation SASProximityAnisetteRequestAction

+ (unint64_t)actionID
{
  return 5;
}

+ (id)actionFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SASProximityAnisetteRequestAction);
  v5 = [v3 objectForKeyedSubscript:@"request"];

  -[SASProximityAnisetteRequestAction setRequest:](v4, "setRequest:", [v5 integerValue]);
  return v4;
}

- (id)requestPayload
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"request";
  v2 = objc_msgSend(NSNumber, "numberWithInteger:", -[SASProximityAnisetteRequestAction request](self, "request"));
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (BOOL)hasResponse
{
  return 1;
}

- (id)responsePayload
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  switch([(SASProximityAnisetteRequestAction *)self request])
  {
    case 0:
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __52__SASProximityAnisetteRequestAction_responsePayload__block_invoke;
      v24[3] = &unk_1E6CABC08;
      v24[4] = self;
      v4 = (id *)&v25;
      v25 = v3;
      [(SASProximityAnisetteRequestAction *)self provisionAnisetteWithCompletion:v24];
      goto LABEL_8;
    case 1:
      v5 = [(SASProximityAnisetteRequestAction *)self sim];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __52__SASProximityAnisetteRequestAction_responsePayload__block_invoke_11;
      v22[3] = &unk_1E6CABC08;
      v22[4] = self;
      v4 = (id *)&v23;
      v23 = v3;
      [(SASProximityAnisetteRequestAction *)self syncAnisetteWithSIMData:v5 completion:v22];
      goto LABEL_7;
    case 2:
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __52__SASProximityAnisetteRequestAction_responsePayload__block_invoke_12;
      v20[3] = &unk_1E6CABC08;
      v20[4] = self;
      v4 = (id *)&v21;
      v21 = v3;
      [(SASProximityAnisetteRequestAction *)self eraseAnisetteWithCompletion:v20];
      goto LABEL_8;
    case 3:
      BOOL v6 = [(SASProximityAnisetteRequestAction *)self shouldProvision];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __52__SASProximityAnisetteRequestAction_responsePayload__block_invoke_13;
      v18[3] = &unk_1E6CABC30;
      v18[4] = self;
      v4 = (id *)&v19;
      v19 = v3;
      [(SASProximityAnisetteRequestAction *)self fetchAnisetteDataAndProvisionIfNecessary:v6 withCompletion:v18];
      goto LABEL_8;
    case 4:
      v5 = [(SASProximityAnisetteRequestAction *)self dsid];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __52__SASProximityAnisetteRequestAction_responsePayload__block_invoke_15;
      v16[3] = &unk_1E6CABC30;
      v16[4] = self;
      v4 = (id *)&v17;
      v17 = v3;
      [(SASProximityAnisetteRequestAction *)self legacyAnisetteDataForDSID:v5 withCompletion:v16];
LABEL_7:

LABEL_8:
      break;
    default:
      break;
  }
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[SASProximityAnisetteRequestAction success](self, "success"));
  [v7 setObject:v8 forKeyedSubscript:@"success"];

  v9 = [(SASProximityAnisetteRequestAction *)self anisetteData];

  if (v9)
  {
    v10 = [(SASProximityAnisetteRequestAction *)self anisetteData];
    [v7 setObject:v10 forKeyedSubscript:@"anisette"];
  }
  id v15 = 0;
  v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v15];
  id v12 = v15;
  if (!v11)
  {
    v13 = +[SASLogging facility];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v12;
      _os_log_impl(&dword_1DCC71000, v13, OS_LOG_TYPE_DEFAULT, "Failed to archive response: %@", buf, 0xCu);
    }
  }
  return v11;
}

void __52__SASProximityAnisetteRequestAction_responsePayload__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [*(id *)(a1 + 32) setAnisetteData:0];
  [*(id *)(a1 + 32) setSuccess:a2];
  if (v5)
  {
    BOOL v6 = +[SASLogging facility];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1DCC71000, v6, OS_LOG_TYPE_DEFAULT, "Provisioning anisette failed: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __52__SASProximityAnisetteRequestAction_responsePayload__block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [*(id *)(a1 + 32) setAnisetteData:0];
  [*(id *)(a1 + 32) setSuccess:a2];
  if (v5)
  {
    BOOL v6 = +[SASLogging facility];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1DCC71000, v6, OS_LOG_TYPE_DEFAULT, "Syncing anisette with SIM data failed: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __52__SASProximityAnisetteRequestAction_responsePayload__block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [*(id *)(a1 + 32) setAnisetteData:0];
  [*(id *)(a1 + 32) setSuccess:a2];
  if (v5)
  {
    BOOL v6 = +[SASLogging facility];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1DCC71000, v6, OS_LOG_TYPE_DEFAULT, "Erase anisette failed: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __52__SASProximityAnisetteRequestAction_responsePayload__block_invoke_13(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [*(id *)(a1 + 32) setAnisetteData:a2];
  [*(id *)(a1 + 32) setSuccess:v5 != 0];
  if (v5)
  {
    BOOL v6 = +[SASLogging facility];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1DCC71000, v6, OS_LOG_TYPE_DEFAULT, "Fetch anisette data and provision failed: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __52__SASProximityAnisetteRequestAction_responsePayload__block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [*(id *)(a1 + 32) setAnisetteData:a2];
  [*(id *)(a1 + 32) setSuccess:v5 != 0];
  if (v5)
  {
    BOOL v6 = +[SASLogging facility];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1DCC71000, v6, OS_LOG_TYPE_DEFAULT, "Legacy anisette data for DSID failed: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)setResponseFromData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28DC0];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v5, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
  id v16 = 0;
  v11 = [v4 unarchivedObjectOfClasses:v10 fromData:v6 error:&v16];

  id v12 = v16;
  if (!v11)
  {
    v13 = +[SASLogging facility];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v12;
      _os_log_impl(&dword_1DCC71000, v13, OS_LOG_TYPE_DEFAULT, "Failed to unarchive information: %@", buf, 0xCu);
    }
  }
  v14 = [v11 objectForKeyedSubscript:@"anisette"];
  [(SASProximityAnisetteRequestAction *)self setAnisetteData:v14];

  id v15 = [v11 objectForKeyedSubscript:@"success"];
  -[SASProximityAnisetteRequestAction setSuccess:](self, "setSuccess:", [v15 BOOLValue]);
}

- (void)provisionAnisetteWithCompletion:(id)a3
{
  dispatch_semaphore_t v3 = (objc_class *)MEMORY[0x1E4F4EF58];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 provisionWithCompletion:v4];
}

- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F4EF58];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 syncWithSIMData:v7 completion:v6];
}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  dispatch_semaphore_t v3 = (objc_class *)MEMORY[0x1E4F4EF58];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 eraseWithCompletion:v4];
}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  id v4 = (objc_class *)MEMORY[0x1E4F4EF58];
  id v5 = a4;
  id v6 = objc_alloc_init(v4);
  [v6 anisetteDataWithCompletion:v5];
}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F4EF58];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 legacyAnisetteDataForDSID:v7 withCompletion:v6];
}

- (int64_t)request
{
  return self->_request;
}

- (void)setRequest:(int64_t)a3
{
  self->_request = a3;
}

- (NSData)sim
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSim:(id)a3
{
}

- (BOOL)shouldProvision
{
  return self->_shouldProvision;
}

- (void)setShouldProvision:(BOOL)a3
{
  self->_shouldProvision = a3;
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDsid:(id)a3
{
}

- (AKAnisetteData)anisetteData
{
  return (AKAnisetteData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAnisetteData:(id)a3
{
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anisetteData, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_sim, 0);
}

@end