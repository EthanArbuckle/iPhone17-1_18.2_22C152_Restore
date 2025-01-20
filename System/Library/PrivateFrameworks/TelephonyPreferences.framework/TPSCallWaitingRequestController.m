@interface TPSCallWaitingRequestController
- (void)executeFetchForRequest:(id)a3;
- (void)executeRequest:(id)a3;
- (void)executeSetForRequest:(id)a3;
- (void)respondWithSubscriptionContext:(id)a3 enabled:(BOOL)a4 error:(id)a5;
- (void)suppServicesEvent:(id)a3 event:(int)a4 settingsType:(int)a5 data:(id)a6;
@end

@implementation TPSCallWaitingRequestController

- (void)executeRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(TPSCallWaitingRequestController *)self executeSetForRequest:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(TPSCallWaitingRequestController *)self executeFetchForRequest:v4];
    }
  }
}

- (void)executeFetchForRequest:(id)a3
{
  id v4 = a3;
  v5 = [(TPSRequestController *)self telephonyClient];
  v6 = [v4 subscriptionContext];
  uint64_t v7 = [v4 callClass];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__TPSCallWaitingRequestController_executeFetchForRequest___block_invoke;
  v9[3] = &unk_1E6EB24D0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v5 fetchCallWaitingValue:v6 callClass:v7 completion:v9];
}

void __58__TPSCallWaitingRequestController_executeFetchForRequest___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    id v4 = a2;
    id v5 = [v3 subscriptionContext];
    [v2 respondWithSubscriptionContext:v5 enabled:0 error:v4];
  }
}

- (void)executeSetForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSRequestController *)self telephonyClient];
  v6 = [v4 subscriptionContext];
  uint64_t v7 = [v4 callClass];
  uint64_t v8 = [v4 enabled];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__TPSCallWaitingRequestController_executeSetForRequest___block_invoke;
  v10[3] = &unk_1E6EB24D0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v5 saveCallWaitingValue:v6 callClass:v7 enabled:v8 completion:v10];
}

void __56__TPSCallWaitingRequestController_executeSetForRequest___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    id v4 = a2;
    id v5 = [v3 subscriptionContext];
    [v2 respondWithSubscriptionContext:v5 enabled:0 error:v4];
  }
}

- (void)respondWithSubscriptionContext:(id)a3 enabled:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [[TPSCallWaitingResponse alloc] initWithsubscriptionContext:v9 error:v8 enabled:v5];

  [(TPSRequestController *)self postResponse:v10];
}

- (void)suppServicesEvent:(id)a3 event:(int)a4 settingsType:(int)a5 data:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (a5 == 3)
  {
    v12 = TPSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = TPSStringForCTSuppServicesEventType(a4);
      v14 = TPSStringForCTSuppServicesSettingsType(3u);
      *(_DWORD *)buf = 138413058;
      v36 = v13;
      __int16 v37 = 2112;
      v38 = v14;
      __int16 v39 = 2112;
      id v40 = v11;
      __int16 v41 = 2112;
      id v42 = v10;
      _os_log_impl(&dword_1E4DD4000, v12, OS_LOG_TYPE_DEFAULT, "Received event %@, settings type %@, data %@ for context %@.", buf, 0x2Au);
    }
    v15 = [(TPSRequestController *)self pendingRequest];
    switch(a4)
    {
      case 1:
        v16 = TPSLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = [v11 enabled];
          *(_DWORD *)buf = 138412546;
          v36 = v15;
          __int16 v37 = 2112;
          v38 = v17;
          _os_log_impl(&dword_1E4DD4000, v16, OS_LOG_TYPE_DEFAULT, "Call waiting fetch request succeeded for %@; enabled value is %@.",
            buf,
            0x16u);
        }
        v18 = [v11 enabled];
        uint64_t v19 = [v18 BOOLValue];
        v20 = self;
        id v21 = v10;
        v22 = 0;
        goto LABEL_14;
      case 2:
        v18 = +[TPSResponseError errorWithCode:2 userInfo:0];
        v24 = TPSLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[TPSCallWaitingRequestController suppServicesEvent:event:settingsType:data:]((uint64_t)v18, (uint64_t)v15, v24);
        }

        v20 = self;
        id v21 = v10;
        uint64_t v19 = 0;
        v22 = v18;
LABEL_14:
        [(TPSCallWaitingRequestController *)v20 respondWithSubscriptionContext:v21 enabled:v19 error:v22];

        break;
      case 3:
        v25 = TPSLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v15;
          _os_log_impl(&dword_1E4DD4000, v25, OS_LOG_TYPE_DEFAULT, "Call waiting save request succeeded for %@.", buf, 0xCu);
        }

        -[TPSCallWaitingRequestController respondWithSubscriptionContext:enabled:error:](self, "respondWithSubscriptionContext:enabled:error:", v10, [v15 enabled], 0);
        break;
      case 4:
        v33[0] = *MEMORY[0x1E4F28578];
        v26 = +[TPSLocalizedString localizedStringForKey:@"CALL_WAITING_SAVE_REQUEST_ERROR_LOCALIZED_DESCRIPTION"];
        uint64_t v27 = *MEMORY[0x1E4F28588];
        v34[0] = v26;
        v34[1] = @"Call waiting save request failed with error kCTSuppServicesEventTypeSaveError";
        uint64_t v28 = *MEMORY[0x1E4F28228];
        v33[1] = v27;
        v33[2] = v28;
        v29 = [NSString stringWithFormat:@"%@ for %@", @"Call waiting save request failed with error kCTSuppServicesEventTypeSaveError", v15];
        v34[2] = v29;
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
        v31 = +[TPSResponseError errorWithCode:4 userInfo:v30];

        v32 = TPSLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[TPSCallWaitingRequestController suppServicesEvent:event:settingsType:data:](v31, v32);
        }

        [(TPSCallWaitingRequestController *)self respondWithSubscriptionContext:v10 enabled:0 error:v31];
        break;
      default:
        v23 = TPSLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[TPSCallingLineIdRestrictionRequestController suppServicesEvent:event:settingsType:data:](a4, v23);
        }

        break;
    }
  }
}

- (void)suppServicesEvent:(os_log_t)log event:settingsType:data:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1E4DD4000, log, OS_LOG_TYPE_ERROR, "Call waiting fetch request failed with error %@ for %@.", (uint8_t *)&v3, 0x16u);
}

- (void)suppServicesEvent:(void *)a1 event:(NSObject *)a2 settingsType:data:.cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = [a1 description];
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_error_impl(&dword_1E4DD4000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v4, 0xCu);
}

@end