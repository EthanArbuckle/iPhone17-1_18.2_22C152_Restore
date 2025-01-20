@interface TPSCallForwardingRequestController
- (id)valueForNotificationData:(id)a3;
- (void)executeFetchForRequest:(id)a3;
- (void)executeRequest:(id)a3;
- (void)executeSetForRequest:(id)a3;
- (void)respondWithSubscriptionContext:(id)a3 value:(id)a4 error:(id)a5;
- (void)suppServicesEvent:(id)a3 event:(int)a4 settingsType:(int)a5 data:(id)a6;
@end

@implementation TPSCallForwardingRequestController

- (void)executeRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(TPSCallForwardingRequestController *)self executeSetForRequest:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(TPSCallForwardingRequestController *)self executeFetchForRequest:v4];
    }
  }
}

- (void)executeFetchForRequest:(id)a3
{
  id v4 = a3;
  v5 = [(TPSRequestController *)self telephonyClient];
  v6 = [v4 subscriptionContext];
  uint64_t v7 = [v4 reason];
  uint64_t v8 = [v4 callClass];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__TPSCallForwardingRequestController_executeFetchForRequest___block_invoke;
  v10[3] = &unk_1E6EB24D0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v5 fetchCallForwardingValue:v6 reason:v7 callClass:v8 completion:v10];
}

void __61__TPSCallForwardingRequestController_executeFetchForRequest___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    id v4 = a2;
    id v5 = [v3 subscriptionContext];
    [v2 respondWithSubscriptionContext:v5 value:0 error:v4];
  }
}

- (void)executeSetForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSRequestController *)self telephonyClient];
  v6 = [v4 subscriptionContext];
  uint64_t v7 = [v4 value];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__TPSCallForwardingRequestController_executeSetForRequest___block_invoke;
  v9[3] = &unk_1E6EB24D0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v5 saveCallForwardingValue:v6 value:v7 completion:v9];
}

void __59__TPSCallForwardingRequestController_executeSetForRequest___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    id v4 = a2;
    id v5 = [v3 subscriptionContext];
    [v2 respondWithSubscriptionContext:v5 value:0 error:v4];
  }
}

- (void)respondWithSubscriptionContext:(id)a3 value:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[TPSCallForwardingResponse alloc] initWithSubscriptionContext:v10 error:v8 value:v9];

  [(TPSRequestController *)self postResponse:v11];
}

- (void)suppServicesEvent:(id)a3 event:(int)a4 settingsType:(int)a5 data:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (a5 == 1)
  {
    v12 = TPSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = TPSStringForCTSuppServicesEventType(a4);
      v14 = TPSStringForCTSuppServicesSettingsType(1u);
      int v24 = 138413058;
      v25 = v13;
      __int16 v26 = 2112;
      v27 = v14;
      __int16 v28 = 2112;
      id v29 = v11;
      __int16 v30 = 2112;
      id v31 = v10;
      _os_log_impl(&dword_1E4DD4000, v12, OS_LOG_TYPE_DEFAULT, "Received event %@, settings type %@, data %@ for context %@.", (uint8_t *)&v24, 0x2Au);
    }
    v15 = [(TPSRequestController *)self pendingRequest];
    switch(a4)
    {
      case 1:
        if (v11)
        {
          v16 = [(TPSCallForwardingRequestController *)self valueForNotificationData:v11];
        }
        else
        {
          v16 = 0;
        }
        v23 = TPSLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 138412546;
          v25 = v15;
          __int16 v26 = 2112;
          v27 = v16;
          _os_log_impl(&dword_1E4DD4000, v23, OS_LOG_TYPE_DEFAULT, "Call forwarding fetch request succeeded for %@; value is %@.",
            (uint8_t *)&v24,
            0x16u);
        }

        goto LABEL_21;
      case 2:
        v16 = +[TPSResponseError errorWithCode:2 userInfo:0];
        v17 = TPSLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[TPSCallForwardingRequestController suppServicesEvent:event:settingsType:data:]();
        }
        goto LABEL_16;
      case 3:
        v18 = TPSLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 138412290;
          v25 = v15;
          _os_log_impl(&dword_1E4DD4000, v18, OS_LOG_TYPE_DEFAULT, "Call forwarding save request succeeded for %@.", (uint8_t *)&v24, 0xCu);
        }

        v16 = [v15 value];
LABEL_21:
        v19 = self;
        id v20 = v10;
        v21 = v16;
        v22 = 0;
        goto LABEL_22;
      case 4:
        v16 = +[TPSResponseError errorWithCode:4 userInfo:0];
        v17 = TPSLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[TPSCallForwardingRequestController suppServicesEvent:event:settingsType:data:]();
        }
LABEL_16:

        v19 = self;
        id v20 = v10;
        v21 = 0;
        v22 = v16;
LABEL_22:
        [(TPSCallForwardingRequestController *)v19 respondWithSubscriptionContext:v20 value:v21 error:v22];
        break;
      default:
        v16 = TPSLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[TPSCallForwardingRequestController suppServicesEvent:event:settingsType:data:](a4, v16);
        }
        break;
    }
  }
}

- (id)valueForNotificationData:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F23940];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v4 callClass];
  objc_msgSend(v5, "setClss:", objc_msgSend(v6, "unsignedIntValue"));

  uint64_t v7 = [v4 enabled];
  objc_msgSend(v5, "setEnabled:", objc_msgSend(v7, "BOOLValue"));

  id v8 = [v4 callForwardingNoReplyTime];
  [v5 setNoReplyTime:v8];

  id v9 = [v4 callForwardingReason];
  objc_msgSend(v5, "setReason:", objc_msgSend(v9, "unsignedIntValue"));

  id v10 = [v4 callForwardingNumber];

  [v5 setSaveNumber:v10];
  return v5;
}

- (void)suppServicesEvent:(int)a1 event:(NSObject *)a2 settingsType:data:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1E4DD4000, a2, OS_LOG_TYPE_ERROR, "Event type %u is not recognized as a valid call forwarding request event.", (uint8_t *)v2, 8u);
}

- (void)suppServicesEvent:event:settingsType:data:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E4DD4000, v0, v1, "Call forwarding fetch request failed with error %@ for %@.");
}

- (void)suppServicesEvent:event:settingsType:data:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E4DD4000, v0, v1, "Call forwarding save request failed with error %@ for %@.");
}

@end