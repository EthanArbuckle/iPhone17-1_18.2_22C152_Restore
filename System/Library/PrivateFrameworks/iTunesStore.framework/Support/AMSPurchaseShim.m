@interface AMSPurchaseShim
- (AMSBag)bag;
- (AMSPurchaseResult)result;
- (AMSPurchaseShim)initWithPurchase:(id)a3;
- (ISURLRequestPerformance)requestPerformanceMetrics;
- (NSDictionary)rawOutput;
- (NSDictionary)tidHeaders;
- (NSNumber)authenticatedAccountDSID;
- (NSString)storeCorrelationID;
- (SSAMSPurchase)purchase;
- (SSPurchase)ssPurchase;
- (SSURLConnectionResponse)URLResponse;
- (id)_legacyErrorFromError:(id)a3;
- (id)runPurchase:(id *)a3;
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
- (void)setAuthenticatedAccountDSID:(id)a3;
- (void)setBag:(id)a3;
- (void)setPurchase:(id)a3;
- (void)setRawOutput:(id)a3;
- (void)setRequestPerformanceMetrics:(id)a3;
- (void)setResult:(id)a3;
- (void)setSsPurchase:(id)a3;
- (void)setStoreCorrelationID:(id)a3;
- (void)setTidHeaders:(id)a3;
- (void)setURLResponse:(id)a3;
@end

@implementation AMSPurchaseShim

- (AMSPurchaseShim)initWithPurchase:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSPurchaseShim;
  v5 = [(AMSPurchaseShim *)&v18 init];
  if (v5)
  {
    id v6 = [v4 newAMSPurchase];
    [(AMSPurchaseShim *)v5 setPurchase:v6];

    [(AMSPurchaseShim *)v5 setSsPurchase:v4];
    v7 = +[AMSPurchaseTask createBagForSubProfile];
    [(AMSPurchaseShim *)v5 setBag:v7];

    v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      v10 &= 2u;
    }
    if (v10)
    {
      v12 = objc_opt_class();
      id v13 = v12;
      v14 = AMSSetLogKeyIfNeeded();
      int v19 = 138543618;
      v20 = v12;
      __int16 v21 = 2114;
      v22 = v14;
      LODWORD(v17) = 22;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_13:

        goto LABEL_14;
      }
      v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v19, v17);
      free(v15);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:

  return v5;
}

- (id)runPurchase:(id *)a3
{
  v5 = AMSSetLogKeyIfNeeded();
  id v6 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v6)
  {
    id v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  unsigned int v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
    v8 &= 2u;
  }
  if (v8)
  {
    int v59 = 138543618;
    id v60 = (id)objc_opt_class();
    __int16 v61 = 2114;
    id v62 = v5;
    id v10 = v60;
    LODWORD(v50) = 22;
    v49 = &v59;
    v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11) {
      goto LABEL_12;
    }
    unsigned int v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v59, v50);
    free(v11);
    v49 = (int *)v9;
    SSFileLog();
  }

LABEL_12:
  v12 = [(AMSPurchaseShim *)self purchase];
  [v12 setLogUUID:v5];
  uint64_t v13 = [v12 mediaType];
  v14 = [v12 accountIdentifier];

  v54 = (void *)v13;
  if (v14)
  {
    v15 = +[ACAccountStore ams_sharedAccountStoreForMediaType:v13];
    v16 = +[ACAccountStore ams_accountTypeIdentifierForMediaType:v13];
    uint64_t v17 = [v12 accountIdentifier];
    objc_msgSend(v15, "ams_accountWithAltDSID:DSID:username:accountTypeIdentifier:", 0, v17, 0, v16);
    v19 = objc_super v18 = a3;
    v20 = +[AMSPromise promiseWithResult:v19];

    a3 = v18;
  }
  else
  {
    v15 = +[ACAccountStore ams_sharedAccountStore];
    v20 = objc_msgSend(v15, "ams_activeiTunesAccountForMediaType:", v13);
  }

  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_10013989C;
  v56[3] = &unk_1003A7558;
  v56[4] = self;
  id v21 = v5;
  id v57 = v21;
  id v22 = v12;
  id v58 = v22;
  v53 = v20;
  [v20 continueWithBlock:v56];
  v52 = id v55 = 0;
  v23 = [v52 resultWithError:&v55];
  v24 = v55;
  if (v24)
  {
    v25 = v24;
    v26 = [(AMSPurchaseShim *)self _legacyErrorFromError:v24];
    if (!v26) {
      goto LABEL_39;
    }
    v27 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v27)
    {
      v27 = +[SSLogConfig sharedConfig];
    }
    unsigned int v28 = objc_msgSend(v27, "shouldLog", v49);
    if ([v27 shouldLogToDisk]) {
      v28 |= 2u;
    }
    v29 = [v27 OSLogObject];
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO)) {
      v28 &= 2u;
    }
    id v51 = v21;
    if (v28)
    {
      v30 = objc_opt_class();
      int v59 = 138543618;
      id v60 = v30;
      __int16 v61 = 2114;
      id v62 = v21;
      v31 = a3;
      id v32 = v30;
      LODWORD(v50) = 22;
      v49 = &v59;
      v33 = (void *)_os_log_send_and_compose_impl();

      a3 = v31;
      if (!v33)
      {
LABEL_27:

        v26 = v26;
        v34 = v26;
        id v21 = v51;
LABEL_38:

        v25 = v34;
        goto LABEL_39;
      }
      v29 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, &v59, v50);
      free(v33);
      v49 = (int *)v29;
      SSFileLog();
    }

    goto LABEL_27;
  }
  v26 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v26)
  {
    v26 = +[SSLogConfig sharedConfig];
  }
  unsigned int v35 = [v26 shouldLog];
  if ([v26 shouldLogToDisk]) {
    v35 |= 2u;
  }
  v25 = [v26 OSLogObject];
  if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
    v35 &= 2u;
  }
  if (!v35)
  {
LABEL_37:
    v34 = 0;
    goto LABEL_38;
  }
  v36 = objc_opt_class();
  int v59 = 138543618;
  id v60 = v36;
  __int16 v61 = 2114;
  id v62 = v21;
  id v37 = v36;
  LODWORD(v50) = 22;
  v49 = &v59;
  v38 = (void *)_os_log_send_and_compose_impl();

  if (v38)
  {
    v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v38, 4, &v59, v50);
    free(v38);
    v49 = (int *)v25;
    SSFileLog();
    goto LABEL_37;
  }
  v25 = 0;
LABEL_39:

  if (a3) {
    *a3 = v25;
  }
  v39 = [(AMSPurchaseShim *)self ssPurchase];
  id v40 = [v23 newSSPurchaseResponseWithSSPurchase:v39];

  v41 = [v40 URLResponse];
  [(AMSPurchaseShim *)self setResult:v23];
  v42 = [v22 account];
  v43 = objc_msgSend(v42, "ams_DSID");
  [(AMSPurchaseShim *)self setAuthenticatedAccountDSID:v43];

  v44 = [v23 responseDictionary];
  [(AMSPurchaseShim *)self setRawOutput:v44];

  [(AMSPurchaseShim *)self setRequestPerformanceMetrics:0];
  [(AMSPurchaseShim *)self setURLResponse:v41];
  v45 = [v41 storeCorrelationID];
  [(AMSPurchaseShim *)self setStoreCorrelationID:v45];

  v46 = [(AMSPurchaseShim *)self ssPurchase];
  v47 = [v46 tidHeaders];
  [(AMSPurchaseShim *)self setTidHeaders:v47];

  return v23;
}

- (id)_legacyErrorFromError:(id)a3
{
  v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:AMSErrorUserInfoKeyServerPayload];

  v5 = [v4 objectForKey:kISDialogKey];
  id v6 = [v4 objectForKey:kISFailureTypeKey];
  id v7 = [objc_alloc((Class)ISDialog) initWithDialogDictionary:v5];
  if ([v7 kind] == (id)1)
  {
    int v8 = 0;
    goto LABEL_28;
  }
  unsigned int v9 = [v7 buttons];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v10) {
    goto LABEL_22;
  }
  id v11 = v10;
  char v12 = 0;
  char v13 = 0;
  uint64_t v14 = *(void *)v21;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v21 != v14) {
        objc_enumerationMutation(v9);
      }
      unsigned int v16 = [*(id *)(*((void *)&v20 + 1) + 8 * i) actionType];
      if (v16 == 1)
      {
        char v12 = 1;
      }
      else if (v16 == 11 || v16 == 3)
      {
        char v13 = 1;
      }
    }
    id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v11);
  if ((v13 & 1) == 0)
  {
    if (v12)
    {
      int v8 = ISError();
      goto LABEL_27;
    }
LABEL_22:
    objc_super v18 = [v4 objectForKey:@"customerMessage"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      objc_super v18 = 0;
    }
    if (v6) {
      [v6 integerValue];
    }
    int v8 = SSError();

    goto LABEL_27;
  }
  int v8 = 0;
LABEL_27:

LABEL_28:

  return v8;
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = objc_alloc((Class)AMSAuthenticateTask);
  id v10 = [(AMSPurchaseShim *)self bag];
  id v12 = [v9 initWithRequest:v8 bag:v10];

  [v12 setDelegate:self];
  id v11 = [v12 performAuthentication];
  [v11 addFinishBlock:v7];
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v9 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v7];

  id v8 = [v9 present];
  [v8 addFinishBlock:v6];
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v9 = [objc_alloc((Class)AMSSystemEngagementTask) initWithRequest:v7];

  id v8 = [v9 present];
  [v8 addFinishBlock:v6];
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v9 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v7];

  id v8 = [v9 present];
  [v8 addFinishBlock:v6];
}

- (NSNumber)authenticatedAccountDSID
{
  return self->_authenticatedAccountDSID;
}

- (void)setAuthenticatedAccountDSID:(id)a3
{
}

- (NSDictionary)rawOutput
{
  return self->_rawOutput;
}

- (void)setRawOutput:(id)a3
{
}

- (ISURLRequestPerformance)requestPerformanceMetrics
{
  return self->_requestPerformanceMetrics;
}

- (void)setRequestPerformanceMetrics:(id)a3
{
}

- (NSString)storeCorrelationID
{
  return self->_storeCorrelationID;
}

- (void)setStoreCorrelationID:(id)a3
{
}

- (NSDictionary)tidHeaders
{
  return self->_tidHeaders;
}

- (void)setTidHeaders:(id)a3
{
}

- (SSURLConnectionResponse)URLResponse
{
  return self->_URLResponse;
}

- (void)setURLResponse:(id)a3
{
}

- (SSAMSPurchase)purchase
{
  return self->_purchase;
}

- (void)setPurchase:(id)a3
{
}

- (SSPurchase)ssPurchase
{
  return self->_ssPurchase;
}

- (void)setSsPurchase:(id)a3
{
}

- (AMSPurchaseResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (AMSBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_ssPurchase, 0);
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_URLResponse, 0);
  objc_storeStrong((id *)&self->_tidHeaders, 0);
  objc_storeStrong((id *)&self->_storeCorrelationID, 0);
  objc_storeStrong((id *)&self->_requestPerformanceMetrics, 0);
  objc_storeStrong((id *)&self->_rawOutput, 0);

  objc_storeStrong((id *)&self->_authenticatedAccountDSID, 0);
}

@end