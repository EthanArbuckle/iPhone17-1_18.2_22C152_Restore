@interface MusicTermsUpdateOperation
- (BOOL)_authenticateReturningError:(id *)a3;
- (BOOL)_runRequestWithTermsCheckURL:(id)a3 allowingAuthentication:(BOOL)a4 returningError:(id *)a5 termsContentText:(id *)a6 hasAcceptedLatestTerms:(BOOL *)a7 latestStoreTermsVersion:(unint64_t *)a8;
- (BOOL)hasAcceptedLatestTerms;
- (MusicTermsUpdateOperation)initWithAcceptedStoreTermsVersion:(unint64_t)a3 termsContext:(id)a4;
- (NSString)termsContentText;
- (NSString)termsContext;
- (id)error;
- (unint64_t)acceptedStoreTermsVersion;
- (unint64_t)latestStoreTermsVersion;
- (void)main;
@end

@implementation MusicTermsUpdateOperation

- (MusicTermsUpdateOperation)initWithAcceptedStoreTermsVersion:(unint64_t)a3 termsContext:(id)a4
{
  id v6 = a4;
  v7 = [(MusicTermsUpdateOperation *)self init];
  v8 = v7;
  if (v7)
  {
    v7->_acceptedStoreTermsVersion = a3;
    v9 = (NSString *)[v6 copy];
    termsContext = v8->_termsContext;
    v8->_termsContext = v9;
  }
  return v8;
}

- (void)main
{
  char v20 = 0;
  uint64_t v19 = 0;
  if (![(MusicTermsUpdateOperation *)self isCancelled])
  {
    v5 = [(MusicTermsUpdateOperation *)self URLBagDictionary];
    id v6 = [v5 objectForKey:@"sub-terms-check"];
    if ((_NSIsNSString() & 1) == 0)
    {
      v7 = [v5 objectForKey:@"terms-check"];

      if ((_NSIsNSString() & 1) == 0)
      {

        id v6 = 0;
        goto LABEL_10;
      }
      id v6 = v7;
    }
    if (v6)
    {
      uint64_t v8 = +[NSURL URLWithString:v6];
      if (v8)
      {
        v9 = (void *)v8;
        id v18 = 0;
        id v17 = 0;
        [(MusicTermsUpdateOperation *)self _runRequestWithTermsCheckURL:v8 allowingAuthentication:1 returningError:&v18 termsContentText:&v17 hasAcceptedLatestTerms:&v20 latestStoreTermsVersion:&v19];
        id v3 = v18;
        id v4 = v17;

LABEL_11:
        goto LABEL_12;
      }
    }
LABEL_10:
    SSError();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = 0;
    goto LABEL_11;
  }
  SSError();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = 0;
LABEL_12:
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __33__MusicTermsUpdateOperation_main__block_invoke;
  v12[3] = &unk_CCB888;
  v12[4] = self;
  id v13 = v3;
  char v16 = v20;
  id v14 = v4;
  uint64_t v15 = v19;
  id v10 = v4;
  id v11 = v3;
  [(MusicTermsUpdateOperation *)self dispatchAsync:v12];
}

void __33__MusicTermsUpdateOperation_main__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = *(unsigned char *)(a1 + 64);
  *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 56);
  v2 = *(void **)(a1 + 48);
  id v3 = (id *)(*(void *)(a1 + 32) + 32);

  objc_storeStrong(v3, v2);
}

- (id)error
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __34__MusicTermsUpdateOperation_error__block_invoke;
  v4[3] = &unk_CCB800;
  v4[4] = self;
  v4[5] = &v5;
  [(MusicTermsUpdateOperation *)self dispatchSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __34__MusicTermsUpdateOperation_error__block_invoke(uint64_t a1)
{
}

- (BOOL)hasAcceptedLatestTerms
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __51__MusicTermsUpdateOperation_hasAcceptedLatestTerms__block_invoke;
  v4[3] = &unk_CCB800;
  v4[4] = self;
  v4[5] = &v5;
  [(MusicTermsUpdateOperation *)self dispatchSync:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __51__MusicTermsUpdateOperation_hasAcceptedLatestTerms__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

- (NSString)termsContentText
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __45__MusicTermsUpdateOperation_termsContentText__block_invoke;
  v4[3] = &unk_CCB800;
  v4[4] = self;
  v4[5] = &v5;
  [(MusicTermsUpdateOperation *)self dispatchSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __45__MusicTermsUpdateOperation_termsContentText__block_invoke(uint64_t a1)
{
}

- (BOOL)_authenticateReturningError:(id *)a3
{
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  id v29 = 0;
  id v4 = +[ICUserIdentity activeAccount];
  uint64_t v5 = +[ICUserIdentityStore defaultIdentityStore];
  id v6 = (id *)(v25 + 5);
  id obj = (id)v25[5];
  uint64_t v7 = [v5 DSIDForUserIdentity:v4 outError:&obj];
  objc_storeStrong(v6, obj);

  if (v7)
  {
    id v8 = objc_alloc_init((Class)AMSAuthenticateOptions);
    [v8 setAuthenticationType:0];
    id v9 = [objc_alloc((Class)AMSAuthenticateRequest) initWithDSID:v7 altDSID:0 username:0 options:v8];
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    id v11 = +[UIApplication sharedApplication];
    v12 = [v11 keyWindow];
    id v13 = [v12 rootViewController];

    id v14 = [objc_alloc((Class)AMSUIAuthenticateTask) initWithRequest:v9 presentingViewController:v13];
    uint64_t v15 = [v14 performAuthentication];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __57__MusicTermsUpdateOperation__authenticateReturningError___block_invoke;
    v20[3] = &unk_CCB8B0;
    v22 = &v24;
    char v16 = v10;
    v21 = v16;
    [v15 addFinishBlock:v20];

    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    uint64_t v17 = SSError();
    id v8 = (id)v25[5];
    v25[5] = v17;
  }

  if (a3) {
    *a3 = (id) v25[5];
  }
  BOOL v18 = v25[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v18;
}

void __57__MusicTermsUpdateOperation__authenticateReturningError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_runRequestWithTermsCheckURL:(id)a3 allowingAuthentication:(BOOL)a4 returningError:(id *)a5 termsContentText:(id *)a6 hasAcceptedLatestTerms:(BOOL *)a7 latestStoreTermsVersion:(unint64_t *)a8
{
  v73[0] = 0;
  id v72 = 0;
  id v46 = a3;
  id v13 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v46];
  [v13 setHTTPMethod:@"POST"];
  id v14 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  uint64_t v15 = v14;
  termsContext = self->_termsContext;
  if (termsContext) {
    [v14 setObject:termsContext forKey:@"context"];
  }
  if (self->_acceptedStoreTermsVersion)
  {
    uint64_t v17 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
    [v15 setObject:v17 forKey:@"accepted"];
  }
  v44 = a6;
  v45 = a7;
  if ([v15 count])
  {
    BOOL v18 = +[NSJSONSerialization dataWithJSONObject:v15 options:0 error:0];
  }
  else
  {
    BOOL v18 = 0;
  }
  [v13 setHTTPBody:v18];
  id v19 = [(MusicTermsUpdateOperation *)self newLoadURLOperationWithRequest:v13];
  char v20 = +[SSVURLProtocolConsumer consumer];
  [v19 setDataConsumer:v20];

  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__0;
  v70 = __Block_byref_object_dispose__0;
  id v71 = 0;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__0;
  v64 = __Block_byref_object_dispose__0;
  id v65 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v59 = 0;
  objc_initWeak(&location, v19);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = __160__MusicTermsUpdateOperation__runRequestWithTermsCheckURL_allowingAuthentication_returningError_termsContentText_hasAcceptedLatestTerms_latestStoreTermsVersion___block_invoke;
  v53[3] = &unk_CCB8D8;
  v53[4] = &v66;
  v53[5] = &v60;
  objc_copyWeak(&v54, &location);
  v53[6] = &v56;
  [v19 setOutputBlock:v53];
  [(MusicTermsUpdateOperation *)self runChildOperation:v19];
  v21 = a8;
  uint64_t v22 = v57[3];
  if (!v22)
  {
    v23 = [0 userInfo];
    uint64_t v24 = [v23 objectForKey:SSErrorHTTPStatusCodeKey];
    id v25 = [v24 integerValue];
    v57[3] = (uint64_t)v25;

    uint64_t v22 = v57[3];
  }
  if (v22 != 401)
  {
    v32 = (void *)v61[5];
    if (v32)
    {
      id v33 = v32;
LABEL_30:
      id v30 = v33;
      id v31 = 0;
      goto LABEL_31;
    }
    if (!_NSIsNSDictionary())
    {
      SSError();
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    v34 = [(id)v67[5] objectForKey:@"status"];
    if (objc_opt_respondsToSelector())
    {
      v35 = (uint32_t *)[v34 integerValue];
      if (v35 == (uint32_t *)((char *)&stru_15D0.dylib.current_version + 1) || v35 == &stru_14B0.cmdsize)
      {
        id v49 = 0;
        unsigned int v39 = [(MusicTermsUpdateOperation *)self _authenticateReturningError:&v49];
        id v40 = v49;
        v41 = v40;
        if (v40) {
          unsigned int v42 = 0;
        }
        else {
          unsigned int v42 = v39;
        }
        if (v42 == 1)
        {
          id v47 = 0;
          id v48 = 0;
          [(MusicTermsUpdateOperation *)self _runRequestWithTermsCheckURL:v46 allowingAuthentication:0 returningError:&v48 termsContentText:&v47 hasAcceptedLatestTerms:v73 latestStoreTermsVersion:&v72];
          id v30 = v48;
          id v31 = v47;
        }
        else
        {
          id v30 = v40;
          id v31 = 0;
        }
LABEL_51:

        goto LABEL_52;
      }
      if (!v35)
      {
        v36 = [(id)v67[5] objectForKey:@"isCurrent"];
        if (objc_opt_respondsToSelector()) {
          v73[0] = [v36 BOOLValue];
        }
        v37 = [(id)v67[5] objectForKey:@"termsContentText"];

        if (_NSIsNSString()) {
          id v31 = v37;
        }
        else {
          id v31 = 0;
        }
        v41 = [(id)v67[5] objectForKey:@"latestTermsVersionId"];

        id v30 = 0;
        if (objc_opt_respondsToSelector()) {
          id v72 = [v41 longLongValue];
        }
        goto LABEL_51;
      }
    }
    SSError();
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    id v31 = 0;
LABEL_52:

    goto LABEL_31;
  }
  id v52 = 0;
  unsigned int v26 = [(MusicTermsUpdateOperation *)self _authenticateReturningError:&v52];
  id v27 = v52;
  v28 = v27;
  if (v27) {
    unsigned int v29 = 0;
  }
  else {
    unsigned int v29 = v26;
  }
  if (v29 == 1)
  {
    id v50 = 0;
    id v51 = 0;
    [(MusicTermsUpdateOperation *)self _runRequestWithTermsCheckURL:v46 allowingAuthentication:0 returningError:&v51 termsContentText:&v50 hasAcceptedLatestTerms:v73 latestStoreTermsVersion:&v72];
    id v30 = v51;
    id v31 = v50;
  }
  else
  {
    id v30 = v27;
    id v31 = 0;
  }

LABEL_31:
  if (v43) {
    void *v43 = v30;
  }
  if (v44) {
    id *v44 = v31;
  }
  if (v45) {
    BOOL *v45 = v73[0];
  }
  if (v21) {
    unint64_t *v21 = (unint64_t)v72;
  }
  objc_destroyWeak(&v54);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(&v66, 8);
  return v30 == 0;
}

void __160__MusicTermsUpdateOperation__runRequestWithTermsCheckURL_allowingAuthentication_returningError_termsContentText_hasAcceptedLatestTerms_latestStoreTermsVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
  id v12 = v6;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v13 = [WeakRetained URLResponse];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v13 statusCode];
}

- (unint64_t)acceptedStoreTermsVersion
{
  return self->_acceptedStoreTermsVersion;
}

- (NSString)termsContext
{
  return self->_termsContext;
}

- (unint64_t)latestStoreTermsVersion
{
  return self->_latestStoreTermsVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsContext, 0);
  objc_storeStrong((id *)&self->_termsContentText, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end