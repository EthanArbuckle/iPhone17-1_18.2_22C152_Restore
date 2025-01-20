@interface SSVLeaseRequestOperation
- (BOOL)_loadCertificateDataIfNecessary:(id *)a3;
- (BOOL)_resolveConfigurationAndURLReturningError:(id *)a3;
- (BOOL)_shouldRetryForError:(id)a3;
- (NSString)certificateURLBagKey;
- (SSVLeaseRequestOperation)initWithLeaseRequest:(id)a3 URLBag:(id)a4;
- (SSVLeaseRequestOperation)initWithLeaseRequest:(id)a3 configuration:(id)a4;
- (SSVPlaybackLeaseRequest)leaseRequest;
- (id)outputBlock;
- (void)cancel;
- (void)main;
- (void)setCertificateURLBagKey:(id)a3;
- (void)setOutputBlock:(id)a3;
@end

@implementation SSVLeaseRequestOperation

- (SSVLeaseRequestOperation)initWithLeaseRequest:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SSVLeaseRequestOperation;
  v8 = [(SSVOperation *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    configuration = v8->_configuration;
    v8->_configuration = (SSVPlaybackLeaseConfiguration *)v9;

    uint64_t v11 = [v6 copy];
    request = v8->_request;
    v8->_request = (SSVPlaybackLeaseRequest *)v11;
  }
  return v8;
}

- (SSVLeaseRequestOperation)initWithLeaseRequest:(id)a3 URLBag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SSVLeaseRequestOperation;
  v8 = [(SSVOperation *)&v14 init];
  if (v8)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    bagLoadSemaphore = v8->_bagLoadSemaphore;
    v8->_bagLoadSemaphore = (OS_dispatch_semaphore *)v9;

    uint64_t v11 = [v6 copy];
    request = v8->_request;
    v8->_request = (SSVPlaybackLeaseRequest *)v11;

    objc_storeStrong((id *)&v8->_urlBag, a4);
  }

  return v8;
}

- (NSString)certificateURLBagKey
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__56;
  dispatch_semaphore_t v9 = __Block_byref_object_dispose__56;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__SSVLeaseRequestOperation_certificateURLBagKey__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVOperation *)self dispatchSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __48__SSVLeaseRequestOperation_certificateURLBagKey__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 312) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (SSVPlaybackLeaseRequest)leaseRequest
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__56;
  dispatch_semaphore_t v9 = __Block_byref_object_dispose__56;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__SSVLeaseRequestOperation_leaseRequest__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVOperation *)self dispatchSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SSVPlaybackLeaseRequest *)v2;
}

void __40__SSVLeaseRequestOperation_leaseRequest__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 336) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)outputBlock
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  dispatch_semaphore_t v9 = __Block_byref_object_dispose__2;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__SSVLeaseRequestOperation_outputBlock__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVOperation *)self dispatchSync:v4];
  uint64_t v2 = (void *)MEMORY[0x1A6268200](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __39__SSVLeaseRequestOperation_outputBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 328) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setCertificateURLBagKey:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__SSVLeaseRequestOperation_setCertificateURLBagKey___block_invoke;
  v6[3] = &unk_1E5BA7018;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVOperation *)self dispatchAsync:v6];
}

void __52__SSVLeaseRequestOperation_setCertificateURLBagKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 312);
  *(void *)(v3 + 312) = v2;
}

- (void)setOutputBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__SSVLeaseRequestOperation_setOutputBlock___block_invoke;
  v6[3] = &unk_1E5BA7350;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVOperation *)self dispatchAsync:v6];
}

void __43__SSVLeaseRequestOperation_setOutputBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 328);
  *(void *)(v3 + 328) = v2;
}

- (void)cancel
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_bagLoadSemaphore);
  v3.receiver = self;
  v3.super_class = (Class)SSVLeaseRequestOperation;
  [(SSVOperation *)&v3 cancel];
}

- (void)main
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  uint64_t v107 = 0;
  v108 = &v107;
  uint64_t v109 = 0x3032000000;
  v110 = __Block_byref_object_copy__56;
  v111 = __Block_byref_object_dispose__56;
  id v112 = 0;
  id obj = 0;
  BOOL v3 = [(SSVLeaseRequestOperation *)self _resolveConfigurationAndURLReturningError:&obj];
  objc_storeStrong(&v112, obj);
  if (!v3)
  {
    v29 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v29)
    {
      v29 = +[SSLogConfig sharedConfig];
    }
    int v30 = [v29 shouldLog];
    int v31 = [v29 shouldLogToDisk];
    v32 = [v29 OSLogObject];
    v33 = v32;
    if (v31) {
      v30 |= 2u;
    }
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      v30 &= 2u;
    }
    if (v30)
    {
      v34 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v34);
      uint64_t v36 = v108[5];
      *(_DWORD *)v117 = 138412546;
      *(void *)&v117[4] = v35;
      *(_WORD *)&v117[12] = 2112;
      *(void *)&v117[14] = v36;
      LODWORD(v96) = 22;
      v95 = (int *)v117;
      v37 = (void *)_os_log_send_and_compose_impl();

      if (!v37)
      {
LABEL_27:

LABEL_39:
        v59 = 0;
        goto LABEL_77;
      }
      v33 = objc_msgSend(NSString, "stringWithCString:encoding:", v37, 4, v117, v96);
      free(v37);
      SSFileLog(v29, @"%@", v38, v39, v40, v41, v42, v43, (uint64_t)v33);
    }

    goto LABEL_27;
  }
  id v4 = (id *)(v108 + 5);
  id v105 = (id)v108[5];
  BOOL v5 = [(SSVLeaseRequestOperation *)self _loadCertificateDataIfNecessary:&v105];
  objc_storeStrong(v4, v105);
  if (!v5)
  {
    v44 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v44)
    {
      v44 = +[SSLogConfig sharedConfig];
    }
    int v45 = [v44 shouldLog];
    int v46 = [v44 shouldLogToDisk];
    v47 = [v44 OSLogObject];
    v48 = v47;
    if (v46) {
      v45 |= 2u;
    }
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
      v45 &= 2u;
    }
    if (v45)
    {
      v49 = (objc_class *)objc_opt_class();
      v50 = NSStringFromClass(v49);
      uint64_t v51 = v108[5];
      *(_DWORD *)v117 = 138412546;
      *(void *)&v117[4] = v50;
      *(_WORD *)&v117[12] = 2112;
      *(void *)&v117[14] = v51;
      LODWORD(v96) = 22;
      v95 = (int *)v117;
      v52 = (void *)_os_log_send_and_compose_impl();

      if (!v52)
      {
LABEL_38:

        goto LABEL_39;
      }
      v48 = objc_msgSend(NSString, "stringWithCString:encoding:", v52, 4, v117, v96);
      free(v52);
      SSFileLog(v44, @"%@", v53, v54, v55, v56, v57, v58, (uint64_t)v48);
    }

    goto LABEL_38;
  }
  id v6 = 0;
  uint64_t v101 = 0;
  v102 = &v101;
  uint64_t v103 = 0x2020000000;
  uint64_t v104 = 0;
  *(void *)v117 = 0;
  *(void *)&v117[8] = v117;
  *(void *)&v117[16] = 0x3032000000;
  v118 = __Block_byref_object_copy__56;
  v119 = __Block_byref_object_dispose__56;
  id v120 = 0;
  while (1)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28E88]);
    v8 = [(SSVPlaybackLeaseRequest *)self->_request _URL];
    dispatch_semaphore_t v9 = (void *)[v7 initWithURL:v8];

    [v9 setHTTPMethod:@"POST"];
    id v10 = [[SSVLoadURLOperation alloc] initWithURLRequest:v9];

    uint64_t v11 = +[SSVURLDataConsumer consumer];
    [(SSVLoadURLOperation *)v10 setDataConsumer:v11];

    [(SSVLoadURLOperation *)v10 setITunesStoreRequest:1];
    [(SSVLoadURLOperation *)v10 setMachineDataStyle:3];
    v12 = [(SSVPlaybackLeaseConfiguration *)self->_configuration storeFrontSuffix];
    [(SSVLoadURLOperation *)v10 setStoreFrontSuffix:v12];

    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __32__SSVLeaseRequestOperation_main__block_invoke;
    v100[3] = &unk_1E5BACC90;
    v100[4] = &v107;
    v100[5] = v117;
    [(SSVLoadURLOperation *)v10 setOutputBlock:v100];
    v99[0] = MEMORY[0x1E4F143A8];
    v99[1] = 3221225472;
    v99[2] = __32__SSVLeaseRequestOperation_main__block_invoke_2;
    v99[3] = &unk_1E5BACCB8;
    v99[4] = self;
    v99[5] = &v101;
    [(SSVLoadURLOperation *)v10 setPrepareRequestBlock:v99];
    [(SSVOperation *)self runChildOperation:v10];
    if (![(SSVLeaseRequestOperation *)self _shouldRetryForError:v108[5]]) {
      break;
    }
    v13 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v13)
    {
      v13 = +[SSLogConfig sharedConfig];
    }
    int v14 = objc_msgSend(v13, "shouldLog", v95, v96);
    int v15 = [v13 shouldLogToDisk];
    v16 = [v13 OSLogObject];
    v17 = v16;
    if (v15) {
      v14 |= 2u;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      int v18 = v14;
    }
    else {
      int v18 = v14 & 2;
    }
    if (v18)
    {
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      int v113 = 138412290;
      v114 = v20;
      LODWORD(v96) = 12;
      v95 = &v113;
      v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21) {
        goto LABEL_16;
      }
      v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v113, v96);
      free(v21);
      SSFileLog(v13, @"%@", v22, v23, v24, v25, v26, v27, (uint64_t)v17);
    }

LABEL_16:
    v28 = (void *)v108[5];
    v108[5] = 0;

    id v6 = v10;
  }

  v60 = [(SSVLoadURLOperation *)v10 URLResponse];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v61 = [*(id *)(*(void *)&v117[8] + 40) objectForKey:@"failureType"];
    if (v61)
    {
      uint64_t v62 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v63 = [*(id *)(*(void *)&v117[8] + 40) objectForKey:@"dialog"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(id)v62 setObject:v63 forKey:@"SSVPlaybackResponseErrorUserInfoKeyDialogDictionary"];
      }
      if (!objc_msgSend((id)v62, "count", v95, v96))
      {

        uint64_t v62 = 0;
      }
      v64 = (void *)MEMORY[0x1E4F28C58];
      if (objc_opt_respondsToSelector()) {
        uint64_t v65 = [v61 integerValue];
      }
      else {
        uint64_t v65 = 0;
      }
      uint64_t v72 = [v64 errorWithDomain:@"SSServerErrorDomain" code:v65 userInfo:v62];
      v59 = 0;
      v70 = (SSVFairPlaySubscriptionController *)v108[5];
      v108[5] = v72;
LABEL_56:

      goto LABEL_57;
    }
    v67 = [SSVPlaybackLeaseResponse alloc];
    v59 = [(SSVPlaybackResponse *)v67 initWithDictionary:*(void *)(*(void *)&v117[8] + 40) URLResponse:v60];
    v68 = [(SSVPlaybackLeaseConfiguration *)self->_configuration pastisKeyServerURL];
    [(SSVPlaybackResponse *)v59 setFallbackStreamingKeyServerURL:v68];

    v69 = [(SSVPlaybackLeaseConfiguration *)self->_configuration pastisCertificateURL];
    [(SSVPlaybackResponse *)v59 setFallbackStreamingKeyCertificateURL:v69];

    if (![(SSVPlaybackLeaseRequest *)self->_request _leaseType])
    {
      uint64_t v62 = [(SSVPlaybackLeaseResponse *)v59 leaseInfoData];
      uint64_t v63 = [(SSVPlaybackLeaseResponse *)v59 subscriptionKeyBagData];
      if (v62 | v63)
      {
        v70 = objc_alloc_init(SSVFairPlaySubscriptionController);
        v71 = (id *)(v108 + 5);
        id v98 = (id)v108[5];
        [(SSVFairPlaySubscriptionController *)v70 importSubscriptionKeyBagData:v63 leaseInfoData:v62 returningError:&v98];
        objc_storeStrong(v71, v98);
        goto LABEL_56;
      }
LABEL_57:
    }
LABEL_58:
  }
  else
  {
    if (!v108[5])
    {
      uint64_t v66 = SSError(@"SSErrorDomain", 100, 0, 0);
      v59 = 0;
      v61 = (void *)v108[5];
      v108[5] = v66;
      goto LABEL_58;
    }
    v59 = 0;
  }
  if (v102[3])
  {
    v73 = [(SSVPlaybackLeaseResponse *)v59 leaseInfoData];
    v74 = v73;
    if (v73)
    {
      uint64_t v97 = 0;
      uint64_t v75 = v102[3];
      id v76 = v73;
      int v77 = C956s6fM(v75, [v76 bytes], objc_msgSend(v76, "length"), &v97);
      if (v77)
      {
        v78 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v78)
        {
          v78 = +[SSLogConfig sharedConfig];
        }
        int v79 = objc_msgSend(v78, "shouldLog", v95);
        int v80 = [v78 shouldLogToDisk];
        v81 = [v78 OSLogObject];
        v82 = v81;
        if (v80) {
          v79 |= 2u;
        }
        if (!os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT)) {
          v79 &= 2u;
        }
        if (v79)
        {
          v83 = (objc_class *)objc_opt_class();
          v84 = NSStringFromClass(v83);
          int v113 = 138412546;
          v114 = v84;
          __int16 v115 = 2048;
          uint64_t v116 = v77;
          LODWORD(v96) = 22;
          v95 = &v113;
          v85 = (void *)_os_log_send_and_compose_impl();

          if (v85)
          {
            v82 = objc_msgSend(NSString, "stringWithCString:encoding:", v85, 4, &v113, v96);
            free(v85);
            SSFileLog(v78, @"%@", v86, v87, v88, v89, v90, v91, (uint64_t)v82);
            goto LABEL_71;
          }
        }
        else
        {
LABEL_71:
        }
      }
      if (v97) {
        N8pdwAfn(v97);
      }
    }
    JE2f6WCx(v102[3]);
  }
  _Block_object_dispose(v117, 8);

  _Block_object_dispose(&v101, 8);
LABEL_77:
  v92 = [(SSVPlaybackLeaseRequest *)self->_request _certificateData];
  [(SSVPlaybackLeaseResponse *)v59 setCertificateData:v92];

  [(SSVPlaybackLeaseResponse *)v59 setKDMovieIdentifier:[(SSVPlaybackLeaseRequest *)self->_request _KDMovieIdentifier]];
  uint64_t v93 = [(SSVLeaseRequestOperation *)self outputBlock];
  v94 = (void *)v93;
  if (v93) {
    (*(void (**)(uint64_t, SSVPlaybackLeaseResponse *, uint64_t))(v93 + 16))(v93, v59, v108[5]);
  }

  _Block_object_dispose(&v107, 8);
}

void __32__SSVLeaseRequestOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __32__SSVLeaseRequestOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = *(void *)(*(void *)(a1 + 32) + 344);
  double v5 = 30.0;
  if (v4 <= 2) {
    double v5 = dbl_1A52F6588[v4];
  }
  uint64_t v6 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v6)
  {
    uint64_t v6 = +[SSLogConfig sharedConfig];
  }
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  dispatch_semaphore_t v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    v8 &= 2u;
  }
  if (v8)
  {
    id v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    int v29 = 138412546;
    int v30 = v11;
    __int16 v31 = 2048;
    double v32 = v5;
    LODWORD(v26) = 22;
    uint64_t v25 = &v29;
    v12 = (void *)_os_log_send_and_compose_impl();

    if (!v12) {
      goto LABEL_14;
    }
    dispatch_semaphore_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v29, v26);
    free(v12);
    SSFileLog(v6, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v9);
  }

LABEL_14:
  [v3 setTimeoutInterval:v5];
  uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v20 = *(void *)(v19 + 24);
  if (v20)
  {
    JE2f6WCx(v20);
    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  v21 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 336), "_copyBodyDictionaryWithFairPlaySession:", v19 + 24, v25);
  if ([v21 count])
  {
    uint64_t v22 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v21 options:0 error:0];
    [v3 setHTTPBody:v22];

    [v3 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  }
  uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 336) HTTPHeaderFields];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __32__SSVLeaseRequestOperation_main__block_invoke_21;
  v27[3] = &unk_1E5BA8D80;
  id v28 = v3;
  id v24 = v3;
  [v23 enumerateKeysAndObjectsUsingBlock:v27];
}

uint64_t __32__SSVLeaseRequestOperation_main__block_invoke_21(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

- (BOOL)_loadCertificateDataIfNecessary:(id *)a3
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__56;
  uint64_t v16 = __Block_byref_object_dispose__56;
  id v17 = 0;
  double v5 = [(SSVPlaybackLeaseRequest *)self->_request _certificateData];
  if (v5)
  {
    int v6 = 1;
    *((unsigned char *)v19 + 24) = 1;
  }
  else
  {
    int v7 = [[SSVLeaseCertificateRequestOperation alloc] initWithConfiguration:self->_configuration];
    int v8 = [(SSVLeaseRequestOperation *)self certificateURLBagKey];
    [(SSVLeaseCertificateRequestOperation *)v7 setCertificateURLBagKey:v8];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__SSVLeaseRequestOperation__loadCertificateDataIfNecessary___block_invoke;
    v11[3] = &unk_1E5BACCE0;
    v11[5] = &v12;
    v11[6] = &v18;
    v11[4] = self;
    [(SSVLeaseCertificateRequestOperation *)v7 setOutputBlock:v11];
    [(SSVOperation *)self runChildOperation:v7];

    int v6 = *((unsigned __int8 *)v19 + 24);
    if (a3 && !*((unsigned char *)v19 + 24))
    {
      *a3 = (id) v13[5];
      int v6 = *((unsigned __int8 *)v19 + 24);
    }
  }
  BOOL v9 = v6 != 0;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

void __60__SSVLeaseRequestOperation__loadCertificateDataIfNecessary___block_invoke(void *a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), obj);
  id v6 = obj;
  id v7 = a2;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v7 != 0;
  [*(id *)(a1[4] + 336) _setCertificateData:v7];
}

- (BOOL)_resolveConfigurationAndURLReturningError:(id *)a3
{
  uint64_t v28 = 0;
  int v29 = &v28;
  uint64_t v30 = 0x3032000000;
  __int16 v31 = __Block_byref_object_copy__56;
  double v32 = __Block_byref_object_dispose__56;
  id v33 = 0;
  uint64_t v5 = [(SSVPlaybackLeaseRequest *)self->_request _URLBagKey];
  id v6 = (void *)v5;
  if (self->_urlBag)
  {
    if (v5)
    {
      id v7 = [(SSVPlaybackLeaseRequest *)self->_request _URL];
      if (v7)
      {
        configuration = self->_configuration;

        if (configuration) {
          goto LABEL_12;
        }
      }
    }
    else if (self->_configuration)
    {
      goto LABEL_14;
    }
    bagLoadSemaphore = self->_bagLoadSemaphore;
    if (bagLoadSemaphore) {
      dispatch_semaphore_t v10 = bagLoadSemaphore;
    }
    else {
      dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    }
    dispatch_semaphore_t v11 = v10;
    urlBag = self->_urlBag;
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __70__SSVLeaseRequestOperation__resolveConfigurationAndURLReturningError___block_invoke;
    uint64_t v23 = &unk_1E5BACD08;
    id v24 = v6;
    uint64_t v25 = self;
    uint64_t v27 = &v28;
    uint64_t v13 = v11;
    uint64_t v26 = v13;
    [(SSURLBag *)urlBag loadWithCompletionBlock:&v20];
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (!v6)
  {
    if (self->_configuration) {
      goto LABEL_14;
    }
LABEL_18:
    if (!v29[5])
    {
      uint64_t v18 = SSError(@"SSErrorDomain", 137, 0, 0);
      uint64_t v19 = (void *)v29[5];
      v29[5] = v18;
    }
    BOOL v16 = 0;
    if (a3) {
      goto LABEL_15;
    }
    goto LABEL_16;
  }
LABEL_12:
  uint64_t v14 = [(SSVPlaybackLeaseRequest *)self->_request _URL];
  if (!v14) {
    goto LABEL_18;
  }
  uint64_t v15 = self->_configuration;

  if (!v15) {
    goto LABEL_18;
  }
LABEL_14:
  BOOL v16 = 1;
  if (a3) {
LABEL_15:
  }
    *a3 = (id) v29[5];
LABEL_16:

  _Block_object_dispose(&v28, 8);
  return v16;
}

void __70__SSVLeaseRequestOperation__resolveConfigurationAndURLReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if (v15)
  {
    if (*(void *)(a1 + 32))
    {
      id v6 = objc_msgSend(v15, "objectForKey:");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v6];
        [*(id *)(*(void *)(a1 + 40) + 336) _setURL:v7];
      }
      else
      {
        uint64_t v11 = SSError(@"SSErrorDomain", 124, 0, 0);
        uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
        id v7 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;
      }
    }
    uint64_t v13 = [[SSVPlaybackLeaseConfiguration alloc] initWithURLBagDictionary:v15];
    uint64_t v14 = *(void *)(a1 + 40);
    dispatch_semaphore_t v10 = *(void **)(v14 + 320);
    *(void *)(v14 + 320) = v13;
  }
  else
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
      goto LABEL_11;
    }
    uint64_t v8 = SSError(@"SSErrorDomain", 111, 0, 0);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    dispatch_semaphore_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }

LABEL_11:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (BOOL)_shouldRetryForError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domain];
  if (![v5 isEqualToString:*MEMORY[0x1E4F289A0]])
  {

LABEL_6:
    BOOL v8 = 0;
    goto LABEL_7;
  }
  uint64_t v6 = [v4 code];

  if (v6 != -1001) {
    goto LABEL_6;
  }
  unint64_t retryCount = self->_retryCount;
  if (retryCount > 1) {
    goto LABEL_6;
  }
  self->_unint64_t retryCount = retryCount + 1;
  BOOL v8 = 1;
LABEL_7:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_certificateURLBagKey, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_bagKey, 0);
  objc_storeStrong((id *)&self->_bagLoadSemaphore, 0);
}

@end