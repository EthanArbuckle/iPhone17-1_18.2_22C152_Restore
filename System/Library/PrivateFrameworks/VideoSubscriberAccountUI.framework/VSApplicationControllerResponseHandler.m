@interface VSApplicationControllerResponseHandler
- (id)_accountAuthenticationWithJavascriptResponse:(id)a3 error:(id *)a4;
- (id)_parseSAMLResponseString:(id)a3 error:(id *)a4;
- (void)_handleJavascriptResponseInternal:(id)a3 requestType:(int64_t)a4 accountAuthentication:(id)a5 completionHandler:(id)a6;
- (void)_setSubscriptionDataWithResponse:(id)a3 forJavascriptResponse:(id)a4;
- (void)handleJavascriptResponse:(id)a3 requestType:(int64_t)a4 completionHandler:(id)a5;
@end

@implementation VSApplicationControllerResponseHandler

- (void)handleJavascriptResponse:(id)a3 requestType:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void *))a5;
  v10 = [v8 authN];
  if ([v10 length])
  {
    id v15 = 0;
    v11 = [(VSApplicationControllerResponseHandler *)self _accountAuthenticationWithJavascriptResponse:v8 error:&v15];
    id v12 = v15;
    v13 = v12;
    if (v11)
    {
      [(VSApplicationControllerResponseHandler *)self _handleJavascriptResponseInternal:v8 requestType:a4 accountAuthentication:v11 completionHandler:v9];
    }
    else
    {
      if (!v12) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The errorOrNil parameter must not be nil."];
      }
      v14 = [MEMORY[0x263F1E208] failableWithError:v13];
      v9[2](v9, v14);
    }
  }
  else
  {
    [(VSApplicationControllerResponseHandler *)self _handleJavascriptResponseInternal:v8 requestType:a4 accountAuthentication:0 completionHandler:v9];
  }
}

- (id)_accountAuthenticationWithJavascriptResponse:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 authenticationScheme];
  int v7 = [v6 isEqual:*MEMORY[0x263F1E3F0]];

  if (v7)
  {
    id v8 = [v5 authN];
    v9 = VSSharedSAMLParserController();
    id v34 = 0;
    v10 = [v9 parseResponse:v8 error:&v34];
    id v11 = v34;

    if (v10)
    {
      id v12 = objc_alloc_init(VSAccountAuthentication);
      v13 = [v10 userName];
      [(VSAccountAuthentication *)v12 setUsername:v13];

      if ([v10 expectedAction] == 1 && objc_msgSend(v10, "hasValidAuthentication"))
      {
        id v14 = objc_alloc_init(MEMORY[0x263F1E280]);
        [v14 setBody:v8];
      }
      else
      {
        id v14 = 0;
      }
      v31 = [MEMORY[0x263F1E250] optionalWithObject:v14];
      [(VSAccountAuthentication *)v12 setAuthenticationToken:v31];

      v21 = 0;
    }
    else
    {
      v21 = VSPublicError();
      id v12 = 0;
    }

LABEL_19:
    if (!a4) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  id v15 = [v5 expectedAction];
  uint64_t v16 = [v15 integerValue];

  if (v16 == 1)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F1E248]);
    v17 = [v5 expirationDate];
    [v8 setExpirationDate:v17];

    v18 = [v5 authN];
    [v8 setBody:v18];

    if ([v8 isValid])
    {
      id v12 = objc_alloc_init(VSAccountAuthentication);
      v19 = [v5 username];
      [(VSAccountAuthentication *)v12 setUsername:v19];

      v20 = [MEMORY[0x263F1E250] optionalWithObject:v8];
      [(VSAccountAuthentication *)v12 setAuthenticationToken:v20];
      v21 = 0;
    }
    else
    {
      v20 = VSPrivateError();
      v21 = VSPublicError();
      id v12 = 0;
    }

    goto LABEL_19;
  }
  v22 = VSErrorLogObject();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[VSApplicationControllerResponseHandler _accountAuthenticationWithJavascriptResponse:error:](v22, v23, v24, v25, v26, v27, v28, v29);
  }

  v30 = VSPrivateError();
  v21 = VSPublicError();

  id v12 = 0;
  if (a4) {
LABEL_20:
  }
    *a4 = v21;
LABEL_21:
  v32 = [v5 appBundleIdentifier];
  [(VSAccountAuthentication *)v12 setAppBundleIdentifier:v32];

  -[VSAccountAuthentication setSynchronizable:](v12, "setSynchronizable:", [v5 isSynchronizable]);
  return v12;
}

- (void)_handleJavascriptResponseInternal:(id)a3 requestType:(int64_t)a4 accountAuthentication:(id)a5 completionHandler:(id)a6
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v67 = a5;
  id v11 = (void (**)(id, void *))a6;
  switch(a4)
  {
    case 1:
    case 2:
      id v12 = [v10 authN];
      if (v12) {
        goto LABEL_9;
      }
      goto LABEL_34;
    case 3:
      id v12 = [v10 userMetadata];
      if (!v12) {
        goto LABEL_34;
      }
      goto LABEL_9;
    case 4:
      id v12 = [v10 logout];
      if (!v12) {
        goto LABEL_34;
      }
LABEL_9:
      id v21 = v12;
      id v22 = [v10 authenticationScheme];
      uint64_t v23 = (uint64_t *)MEMORY[0x263F1E3F0];
      if (!v22) {
        id v22 = (id)*MEMORY[0x263F1E3F0];
      }
      uint64_t v24 = [v10 userChannelList];
      v65 = self;
      v66 = v24;
      if ([v24 count])
      {
        id v63 = v22;
        id v25 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v26 = v24;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v69 objects:v73 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v70;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v70 != v29) {
                objc_enumerationMutation(v26);
              }
              uint64_t v31 = *(void *)(*((void *)&v69 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v25 addObject:v31];
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v69 objects:v73 count:16];
          }
          while (v28);
        }

        id v22 = v63;
        uint64_t v23 = (uint64_t *)MEMORY[0x263F1E3F0];
      }
      else
      {
        id v25 = 0;
      }
      uint64_t v37 = *v23;
      if ([v22 isEqual:v37])
      {
        id v68 = 0;
        v38 = [(VSApplicationControllerResponseHandler *)self _parseSAMLResponseString:v21 error:&v68];
        v39 = (VSApplicationControllerResponse *)v68;
        v40 = v39;
        if (v38)
        {
          v64 = v38;
          id v41 = v38;
          v42 = objc_alloc_init(VSApplicationControllerResponse);
          [(VSApplicationControllerResponse *)v42 setAuthenticationScheme:v37];
          v43 = [v41 primaryStatusCode];
          [(VSApplicationControllerResponse *)v42 setResponseStatusCode:v43];

          [(VSApplicationControllerResponse *)v42 setResponseString:v21];
          v62 = NSNumber;
          id v44 = v22;
          uint64_t v45 = [v41 expectedAction];

          uint64_t v46 = v45;
          id v22 = v44;
          v47 = [v62 numberWithInteger:v46];
          [(VSApplicationControllerResponse *)v42 setExpectedAction:v47];

          [(VSApplicationControllerResponse *)v42 setAccountChannelIDs:v25];
          [(VSApplicationControllerResponse *)v42 setAccountAuthentication:v67];
          v48 = [v10 userAccounts];
          [(VSApplicationControllerResponse *)v42 setApplicationUserAccounts:v48];

          [(VSApplicationControllerResponseHandler *)v65 _setSubscriptionDataWithResponse:v42 forJavascriptResponse:v10];
          v49 = [MEMORY[0x263F1E208] failableWithObject:v42];

          v50 = v64;
        }
        else
        {
          v50 = 0;
          if (!v39) {
            [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The parseErrorOrNil parameter must not be nil."];
          }
          v49 = [MEMORY[0x263F1E208] failableWithError:v40];
        }
        v54 = v66;
      }
      else
      {
        v40 = objc_alloc_init(VSApplicationControllerResponse);
        [(VSApplicationControllerResponse *)v40 setAuthenticationScheme:v22];
        [(VSApplicationControllerResponse *)v40 setResponseString:v21];
        v51 = [v10 statusCode];
        [(VSApplicationControllerResponse *)v40 setResponseStatusCode:v51];

        v52 = [v10 expectedAction];
        [(VSApplicationControllerResponse *)v40 setExpectedAction:v52];

        [(VSApplicationControllerResponse *)v40 setAccountChannelIDs:v25];
        [(VSApplicationControllerResponse *)v40 setAccountAuthentication:v67];
        v53 = [v10 userAccounts];
        [(VSApplicationControllerResponse *)v40 setApplicationUserAccounts:v53];

        [(VSApplicationControllerResponseHandler *)self _setSubscriptionDataWithResponse:v40 forJavascriptResponse:v10];
        v49 = [MEMORY[0x263F1E208] failableWithObject:v40];
        v54 = v66;
      }

      if (!v49) {
        goto LABEL_40;
      }
      goto LABEL_41;
    case 5:
      v32 = [v10 expectedAction];
      uint64_t v33 = [v32 integerValue];

      if (v33 == 1)
      {
        id v34 = objc_alloc_init(VSApplicationControllerResponse);
        v35 = [v10 expectedAction];
        [(VSApplicationControllerResponse *)v34 setExpectedAction:v35];

        uint64_t v36 = [MEMORY[0x263F1E208] failableWithObject:v34];
      }
      else
      {
        v13 = VSErrorLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[VSApplicationControllerResponseHandler _handleJavascriptResponseInternal:requestType:accountAuthentication:completionHandler:](v13, v55, v56, v57, v58, v59, v60, v61);
        }
LABEL_31:

        VSPublicError();
        id v34 = (VSApplicationControllerResponse *)objc_claimAutoreleasedReturnValue();
        uint64_t v36 = [MEMORY[0x263F1E208] failableWithError:v34];
      }
      v49 = (void *)v36;

      if (v49)
      {
        id v21 = 0;
      }
      else
      {
LABEL_34:
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"No result nor error to return for request."];
        id v21 = 0;
LABEL_40:
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The resultOrNil parameter must not be nil."];
        v49 = 0;
      }
LABEL_41:
      v11[2](v11, v49);

      return;
    default:
      v13 = VSErrorLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[VSApplicationControllerResponseHandler _handleJavascriptResponseInternal:requestType:accountAuthentication:completionHandler:](v13, v14, v15, v16, v17, v18, v19, v20);
      }
      goto LABEL_31;
  }
}

- (id)_parseSAMLResponseString:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = VSSharedSAMLParserController();
  id v11 = 0;
  int v7 = [v6 parseResponse:v5 error:&v11];

  id v8 = v11;
  v9 = 0;
  if (v7)
  {
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v9 = VSPublicError();
  if (a4) {
LABEL_3:
  }
    *a4 = v9;
LABEL_4:

  return v7;
}

- (void)_setSubscriptionDataWithResponse:(id)a3 forJavascriptResponse:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  v6 = [v5 subscriptions];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = [v5 subscriptions];

    if (!v8) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [javascriptResponse subscriptions] parameter must not be nil."];
    }
    v9 = [v5 subscriptions];
    id v10 = +[VSJSSubscription toVSSubscriptions:v9];
    [v12 setSubscriptionsToAdd:v10];
  }
  id v11 = [v5 clearSubscriptions];
  [v12 setSubscriptionsToRemoveByBundleID:v11];
}

- (void)_accountAuthenticationWithJavascriptResponse:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleJavascriptResponseInternal:(uint64_t)a3 requestType:(uint64_t)a4 accountAuthentication:(uint64_t)a5 completionHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleJavascriptResponseInternal:(uint64_t)a3 requestType:(uint64_t)a4 accountAuthentication:(uint64_t)a5 completionHandler:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end