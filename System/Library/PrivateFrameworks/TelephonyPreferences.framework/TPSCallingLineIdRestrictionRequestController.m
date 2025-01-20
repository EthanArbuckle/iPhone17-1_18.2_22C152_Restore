@interface TPSCallingLineIdRestrictionRequestController
- (void)executeFetchForRequest:(id)a3;
- (void)executeRequest:(id)a3;
- (void)executeSetForRequest:(id)a3;
- (void)respondWithSubscriptionContext:(id)a3 editable:(BOOL)a4 state:(int64_t)a5 error:(id)a6;
- (void)suppServicesEvent:(id)a3 event:(int)a4 settingsType:(int)a5 data:(id)a6;
@end

@implementation TPSCallingLineIdRestrictionRequestController

- (void)executeRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(TPSCallingLineIdRestrictionRequestController *)self executeSetForRequest:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(TPSCallingLineIdRestrictionRequestController *)self executeFetchForRequest:v4];
    }
  }
}

- (void)executeFetchForRequest:(id)a3
{
  id v4 = a3;
  v5 = [(TPSRequestController *)self telephonyClient];
  v6 = [v4 subscriptionContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__TPSCallingLineIdRestrictionRequestController_executeFetchForRequest___block_invoke;
  v8[3] = &unk_1E6EB24D0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 fetchCallingLineIdRestrictionValue:v6 completion:v8];
}

void __71__TPSCallingLineIdRestrictionRequestController_executeFetchForRequest___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    id v4 = a2;
    id v5 = [v3 subscriptionContext];
    [v2 respondWithSubscriptionContext:v5 editable:0 state:0 error:v4];
  }
}

- (void)executeSetForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CTCallingLineIdRestrictionValueForState([v4 state]);
  v6 = [(TPSRequestController *)self telephonyClient];
  id v7 = [v4 subscriptionContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__TPSCallingLineIdRestrictionRequestController_executeSetForRequest___block_invoke;
  v9[3] = &unk_1E6EB24D0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v6 saveCallingLineIdRestrictionValue:v7 restrictionValue:v5 completion:v9];
}

void __69__TPSCallingLineIdRestrictionRequestController_executeSetForRequest___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    id v4 = a2;
    id v5 = [v3 subscriptionContext];
    [v2 respondWithSubscriptionContext:v5 editable:0 state:0 error:v4];
  }
}

- (void)respondWithSubscriptionContext:(id)a3 editable:(BOOL)a4 state:(int64_t)a5 error:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  v12 = [[TPSCallingLineIdRestrictionResponse alloc] initWithsubscriptionContext:v11 editable:v7 state:a5 error:v10];

  [(TPSRequestController *)self postResponse:v12];
}

- (void)suppServicesEvent:(id)a3 event:(int)a4 settingsType:(int)a5 data:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (a5 == 6)
  {
    v12 = TPSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = TPSStringForCTSuppServicesEventType(a4);
      v14 = TPSStringForCTSuppServicesSettingsType(6u);
      int v29 = 138413058;
      v30 = v13;
      __int16 v31 = 2112;
      id v32 = v14;
      __int16 v33 = 2112;
      id v34 = v11;
      __int16 v35 = 2112;
      id v36 = v10;
      _os_log_impl(&dword_1E4DD4000, v12, OS_LOG_TYPE_DEFAULT, "Received event %@, settings type %@, data %@ for context %@.", (uint8_t *)&v29, 0x2Au);
    }
    v15 = [(TPSRequestController *)self pendingRequest];
    switch(a4)
    {
      case 1:
        v16 = TPSLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v29 = 138412546;
          v30 = v15;
          __int16 v31 = 2112;
          id v32 = v11;
          _os_log_impl(&dword_1E4DD4000, v16, OS_LOG_TYPE_DEFAULT, "Calling Line ID Restriction fetch request succeeded for %@; data value is %@.",
            (uint8_t *)&v29,
            0x16u);
        }

        v17 = [v11 callingLineIdRestrictionModification];
        BOOL v18 = [v17 intValue] == 1;

        v19 = [v11 callingLineIdRestriction];
        uint64_t v20 = TPSCallingLineIdRestrictionStateForValue([v19 intValue]);

        v21 = self;
        id v22 = v10;
        uint64_t v23 = v18;
        uint64_t v24 = v20;
        goto LABEL_16;
      case 2:
        v26 = +[TPSResponseError errorWithCode:2 userInfo:0];
        v27 = TPSLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[TPSCallingLineIdRestrictionRequestController suppServicesEvent:event:settingsType:data:]();
        }
        goto LABEL_19;
      case 3:
        v28 = TPSLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          int v29 = 138412290;
          v30 = v15;
          _os_log_impl(&dword_1E4DD4000, v28, OS_LOG_TYPE_DEFAULT, "Calling Line ID Restriction save request succeeded for %@.", (uint8_t *)&v29, 0xCu);
        }

        uint64_t v24 = [v15 state];
        v21 = self;
        id v22 = v10;
        uint64_t v23 = 1;
LABEL_16:
        [(TPSCallingLineIdRestrictionRequestController *)v21 respondWithSubscriptionContext:v22 editable:v23 state:v24 error:0];
        break;
      case 4:
        v26 = +[TPSResponseError errorWithCode:4 userInfo:0];
        v27 = TPSLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[TPSCallingLineIdRestrictionRequestController suppServicesEvent:event:settingsType:data:]();
        }
LABEL_19:

        [(TPSCallingLineIdRestrictionRequestController *)self respondWithSubscriptionContext:v10 editable:0 state:0 error:v26];
        break;
      default:
        v25 = TPSLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[TPSCallingLineIdRestrictionRequestController suppServicesEvent:event:settingsType:data:](a4, v25);
        }

        break;
    }
  }
}

- (void)suppServicesEvent:(int)a1 event:(NSObject *)a2 settingsType:data:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1E4DD4000, a2, OS_LOG_TYPE_ERROR, "Event type %u is not recognized as a valid call waiting request event.", (uint8_t *)v2, 8u);
}

- (void)suppServicesEvent:event:settingsType:data:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E4DD4000, v0, v1, "Calling Line ID Restriction fetch request failed with error %@ for %@.");
}

- (void)suppServicesEvent:event:settingsType:data:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E4DD4000, v0, v1, "Calling Line ID Restriction save request failed with error %@ for %@.");
}

@end