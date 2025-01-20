@interface BRCloudTelemetryTTRDecisionRequest
+ (id)requestWithSenderID:(id)a3 ruleID:(id)a4 completionHandler:(id)a5;
- (NSObject)networkingDelegate;
- (id)_initWithSenderID:(id)a3 ruleID:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)resume;
- (void)setNetworkingDelegate:(id)a3;
@end

@implementation BRCloudTelemetryTTRDecisionRequest

+ (id)requestWithSenderID:(id)a3 ruleID:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[BRCloudTelemetryTTRDecisionRequest alloc] _initWithSenderID:v9 ruleID:v8 completionHandler:v7];

  return v10;
}

- (id)_initWithSenderID:(id)a3 ruleID:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)BRCloudTelemetryTTRDecisionRequest;
  v12 = [(BRCloudTelemetryTTRDecisionRequest *)&v32 init];
  if (v12)
  {
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.rtctaptoradar.pushtokenprovider", v13);

    apsQueue = v12->_apsQueue;
    v12->_apsQueue = (OS_dispatch_queue *)v14;

    id v16 = objc_alloc(MEMORY[0x263F280F0]);
    uint64_t v17 = [v16 initWithEnvironmentName:*MEMORY[0x263F280D0] namedDelegatePort:*MEMORY[0x263F280B8] queue:v12->_apsQueue];
    apsConnection = v12->_apsConnection;
    v12->_apsConnection = (APSConnection *)v17;

    uint64_t v19 = [(APSConnection *)v12->_apsConnection publicToken];
    publicToken = v12->_publicToken;
    v12->_publicToken = (NSData *)v19;

    v21 = +[BRCUserDefaults defaultsForMangledID:0];
    v12->_useDecisionServer = [v21 useIDSDecisionService];

    v22 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v23 = [v22 idsDecisionServiceURL];
    decisonServerURL = v12->_decisonServerURL;
    v12->_decisonServerURL = (NSURL *)v23;

    objc_storeStrong((id *)&v12->_senderID, a3);
    objc_storeStrong((id *)&v12->_ruleID, a4);
    v25 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    responseBody = v12->_responseBody;
    v12->_responseBody = v25;

    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __81__BRCloudTelemetryTTRDecisionRequest__initWithSenderID_ruleID_completionHandler___block_invoke;
    v30[3] = &unk_2650804E8;
    id v31 = v11;
    uint64_t v27 = MEMORY[0x2455D9A50](v30);
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = (id)v27;
  }
  return v12;
}

void __81__BRCloudTelemetryTTRDecisionRequest__initWithSenderID_ruleID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u)) {
      __81__BRCloudTelemetryTTRDecisionRequest__initWithSenderID_ruleID_completionHandler___block_invoke_cold_1();
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)resume
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: !_dataTask dataTask must be nil.%@", (uint8_t *)&v2, 0xCu);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  if (a7) {
    (*((void (**)(id, id))a7 + 2))(a7, a6);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    -[BRCloudTelemetryTTRDecisionRequest URLSession:task:needNewBodyStream:]((uint64_t)v5, v6);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v7 = a5;
  uint64_t v8 = [a4 response];
  id v9 = (void *)v8;
  if (v7)
  {
    (*((void (**)(void))self->_completionHandler + 2))();
    goto LABEL_31;
  }
  if (!v8)
  {
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    v21 = (void *)MEMORY[0x263F087E8];
    v22 = @"Unexpected empty response from service";
LABEL_15:
    uint64_t v23 = objc_msgSend(v21, "brc_unkownErrorWithDescription:", v22);
    completionHandler[2](completionHandler, 0, v23);

    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    v21 = (void *)MEMORY[0x263F087E8];
    v22 = @"Invalid response type";
    goto LABEL_15;
  }
  id v10 = v9;
  id v11 = [v10 valueForHTTPHeaderField:@"X-Apple-Splunk-Hint"];
  v12 = brc_bread_crumbs();
  v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[BRCloudTelemetryTTRDecisionRequest URLSession:task:didCompleteWithError:]();
  }

  if ([v10 statusCode] != 200)
  {
    v24 = (void (**)(id, void, void *))self->_completionHandler;
    v25 = (void *)MEMORY[0x263F087E8];
    v26 = objc_msgSend(NSString, "stringWithFormat:", @"HTTP request failed: %ld", objc_msgSend(v10, "statusCode"));
    uint64_t v27 = objc_msgSend(v25, "brc_unkownErrorWithDescription:", v26);
    v24[2](v24, 0, v27);

LABEL_30:
    goto LABEL_31;
  }
  dispatch_queue_t v14 = [v10 valueForHTTPHeaderField:@"Content-Type"];
  if (!v14)
  {
    v28 = (void (**)(id, void, void *))self->_completionHandler;
    v29 = objc_msgSend(MEMORY[0x263F087E8], "brc_unkownErrorWithDescription:", @"Missing response Content-Type");
    v28[2](v28, 0, v29);

    goto LABEL_30;
  }
  v15 = v14;
  if (([v14 containsString:@"application/json"] & 1) == 0)
  {
    v30 = (void (**)(id, void, id))self->_completionHandler;
    id v31 = (void *)MEMORY[0x263F087E8];
    objc_super v32 = @"Invalid response Content-Type";
LABEL_28:
    objc_msgSend(v31, "brc_unkownErrorWithDescription:", v32);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    v30[2](v30, 0, v17);
LABEL_29:

    goto LABEL_30;
  }
  if (![(NSMutableData *)self->_responseBody length]) {
    goto LABEL_27;
  }
  responseBody = self->_responseBody;
  id v49 = 0;
  id v17 = [MEMORY[0x263F08900] JSONObjectWithData:responseBody options:0 error:&v49];
  id v18 = v49;
  if (v18)
  {
    uint64_t v19 = v18;
    (*((void (**)(void))self->_completionHandler + 2))();

    goto LABEL_31;
  }
  if (!v17)
  {
LABEL_27:
    v30 = (void (**)(id, void, id))self->_completionHandler;
    id v31 = (void *)MEMORY[0x263F087E8];
    objc_super v32 = @"Empty response body";
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v39 = (void (**)(id, void, void *))self->_completionHandler;
    v40 = objc_msgSend(MEMORY[0x263F087E8], "brc_unkownErrorWithDescription:", @"Invalid response body");
    v39[2](v39, 0, v40);

    goto LABEL_29;
  }
  id v17 = v17;
  uint64_t v33 = [v17 objectForKey:@"showTTR"];
  if (!v33)
  {
    v41 = (void (**)(id, void, id))self->_completionHandler;
    objc_msgSend(MEMORY[0x263F087E8], "brc_unkownErrorWithDescription:", @"Missing show TTR info");
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    v41[2](v41, 0, v34);
LABEL_36:

    goto LABEL_29;
  }
  id v34 = (id)v33;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v42 = (void (**)(id, void, void *))self->_completionHandler;
    v43 = objc_msgSend(MEMORY[0x263F087E8], "brc_unkownErrorWithDescription:", @"Unexpected show TTR info type");
    v42[2](v42, 0, v43);

    goto LABEL_36;
  }
  id v34 = v34;
  int v35 = [v34 BOOLValue];
  v36 = [v17 objectForKey:@"reason"];
  if (v36)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v44 = (void (**)(id, void, void *))self->_completionHandler;
      v45 = objc_msgSend(MEMORY[0x263F087E8], "brc_unkownErrorWithDescription:", @"Unexpected show TTR reason");
      v44[2](v44, 0, v45);

      goto LABEL_36;
    }
  }
  int v47 = v35;
  id v48 = v36;
  v37 = brc_bread_crumbs();
  v38 = brc_default_log();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    v46 = @"N";
    *(_DWORD *)buf = 138412802;
    if (v47) {
      v46 = @"Y";
    }
    v51 = v46;
    __int16 v52 = 2112;
    id v53 = v48;
    __int16 v54 = 2112;
    v55 = v37;
    _os_log_debug_impl(&dword_23FA42000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] Decision Server Response showTTR=%@, reason=%@%@", buf, 0x20u);
  }

  (*((void (**)(void))self->_completionHandler + 2))();
LABEL_31:
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  if (a6) {
    (*((void (**)(id, id))a6 + 2))(a6, a5);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  if (a6) {
    (*((void (**)(id, uint64_t))a6 + 2))(a6, 1);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
}

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5
{
  v6 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
  responseBody = self->_responseBody;
  self->_responseBody = v6;
}

- (NSObject)networkingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_networkingDelegate);
  return WeakRetained;
}

- (void)setNetworkingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_networkingDelegate);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_responseBody, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_publicToken, 0);
  objc_storeStrong((id *)&self->_ruleID, 0);
  objc_storeStrong((id *)&self->_senderID, 0);
  objc_storeStrong((id *)&self->_decisonServerURL, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_apsQueue, 0);
}

void __81__BRCloudTelemetryTTRDecisionRequest__initWithSenderID_ruleID_completionHandler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] Failed calling the IDS TTR Decision Service: %@%@", v1, 0x16u);
}

- (void)URLSession:(uint64_t)a1 task:(NSObject *)a2 needNewBodyStream:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: NO Unexpected callback.%@", (uint8_t *)&v2, 0xCu);
}

- (void)URLSession:task:didCompleteWithError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_23FA42000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Decision splunkHint=%@%@", v1, 0x16u);
}

@end