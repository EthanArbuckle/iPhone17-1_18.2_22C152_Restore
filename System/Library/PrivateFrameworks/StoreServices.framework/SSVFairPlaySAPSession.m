@interface SSVFairPlaySAPSession
- (BOOL)_primeTheConnection;
- (BOOL)_shouldRetrySAPOperationForError:(id)a3;
- (BOOL)_verifyPrimeResponse:(id)a3;
- (BOOL)_verifySignature:(id)a3 forData:(id)a4 error:(id *)a5;
- (BOOL)primed;
- (BOOL)useSharedBagInterpreter;
- (BOOL)verifyData:(id)a3 withSignature:(id)a4 error:(id *)a5;
- (NSData)certificateData;
- (SSVFairPlaySAPSession)init;
- (SSVFairPlaySAPSession)initWithSAPVersion:(int64_t)a3;
- (SSVFairPlaySAPSession)initWithSSBag:(id)a3 SAPVersion:(int64_t)a4;
- (SSVFairPlaySAPSession)initWithURLBag:(id)a3;
- (SSVFairPlaySAPSession)initWithURLBag:(id)a3 SAPVersion:(int64_t)a4;
- (SSVFairPlaySAPSession)initWithURLBagDictionary:(id)a3;
- (SSVFairPlaySAPSession)initWithURLBagDictionary:(id)a3 SAPVersion:(int64_t)a4;
- (SSVURLBagInterpreter)urlBagInterpreter;
- (id)_establishContext;
- (id)_initSSVFairPlaySAPSession;
- (id)_initWithURLBagInterpreter:(id)a3 SAPVersion:(int64_t)a4;
- (id)_loadCertificateData;
- (id)_postExchangeData:(id)a3;
- (id)_signData:(id)a3 error:(id *)a4;
- (id)_urlBagInterpreter;
- (id)signatureWithData:(id)a3 error:(id *)a4;
- (int64_t)SAPVersion;
- (int64_t)version;
- (void)establishSessionWithCompletionBlock:(id)a3;
- (void)primeSessionWithCompletionBlock:(id)a3;
- (void)setCertificateData:(id)a3;
- (void)setUseSharedBagInterpreter:(BOOL)a3;
- (void)signData:(id)a3 completionBlock:(id)a4;
- (void)verifySignature:(id)a3 forData:(id)a4 completionBlock:(id)a5;
@end

@implementation SSVFairPlaySAPSession

- (id)_initSSVFairPlaySAPSession
{
  v8.receiver = self;
  v8.super_class = (Class)SSVFairPlaySAPSession;
  v2 = [(SSVFairPlaySAPSession *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.StoreServices.SSVFairPlaySAPSession.completion", 0);
    completionBlockQueue = v2->_completionBlockQueue;
    v2->_completionBlockQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.StoreServices.SSVFairPlaySAPSession", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (SSVFairPlaySAPSession)init
{
  return [(SSVFairPlaySAPSession *)self initWithSAPVersion:0];
}

- (SSVFairPlaySAPSession)initWithSAPVersion:(int64_t)a3
{
  return [(SSVFairPlaySAPSession *)self initWithURLBag:0 SAPVersion:a3];
}

- (SSVFairPlaySAPSession)initWithURLBag:(id)a3
{
  return [(SSVFairPlaySAPSession *)self initWithURLBag:a3 SAPVersion:0];
}

- (SSVFairPlaySAPSession)initWithSSBag:(id)a3 SAPVersion:(int64_t)a4
{
  id v7 = a3;
  objc_super v8 = [(SSVFairPlaySAPSession *)self _initSSVFairPlaySAPSession];
  v9 = (SSVFairPlaySAPSession *)v8;
  if (v8)
  {
    if (v7)
    {
      objc_storeStrong(v8 + 1, a3);
      v10 = [[SSVURLBagInterpreter alloc] initWithSSBag:v7];
      urlBagInterpreter = v9->_urlBagInterpreter;
      v9->_urlBagInterpreter = v10;
    }
    v9->_version = a4;
  }

  return v9;
}

- (SSVFairPlaySAPSession)initWithURLBag:(id)a3 SAPVersion:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SSVFairPlaySAPSession *)self _initSSVFairPlaySAPSession];
  if (v7)
  {
    if (v6)
    {
      objc_super v8 = (SSURLBag *)v6;
      urlBag = v7->_urlBag;
      v7->_urlBag = v8;
    }
    else
    {
      urlBag = +[SSURLBagContext contextWithBagType:0];
      v10 = [[SSURLBag alloc] initWithURLBagContext:urlBag];
      v11 = v7->_urlBag;
      v7->_urlBag = v10;
    }
    v7->_version = a4;
  }

  return v7;
}

- (SSVFairPlaySAPSession)initWithURLBagDictionary:(id)a3
{
  return [(SSVFairPlaySAPSession *)self initWithURLBagDictionary:a3 SAPVersion:0];
}

- (SSVFairPlaySAPSession)initWithURLBagDictionary:(id)a3 SAPVersion:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SSVFairPlaySAPSession *)self _initSSVFairPlaySAPSession];
  if (v7)
  {
    objc_super v8 = [[SSVURLBagInterpreter alloc] initWithURLBagDictionary:v6];
    urlBagInterpreter = v7->_urlBagInterpreter;
    v7->_urlBagInterpreter = v8;

    v7->_version = a4;
  }

  return v7;
}

- (id)_initWithURLBagInterpreter:(id)a3 SAPVersion:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SSVFairPlaySAPSession *)self _initSSVFairPlaySAPSession];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    v9 = (void *)v7[10];
    v7[10] = v8;

    v7[8] = a4;
  }

  return v7;
}

- (NSData)certificateData
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__79;
  v10 = __Block_byref_object_dispose__79;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__SSVFairPlaySAPSession_certificateData__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __40__SSVFairPlaySAPSession_certificateData__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)establishSessionWithCompletionBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__SSVFairPlaySAPSession_establishSessionWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E5BA7350;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __61__SSVFairPlaySAPSession_establishSessionWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) _establishContext];
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = *(void *)(v4 + 32) != 0;
    id v6 = *(NSObject **)(v4 + 16);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__SSVFairPlaySAPSession_establishSessionWithCompletionBlock___block_invoke_2;
    v7[3] = &unk_1E5BA9D20;
    id v8 = v3;
    BOOL v9 = v5;
    dispatch_async(v6, v7);
  }
}

uint64_t __61__SSVFairPlaySAPSession_establishSessionWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)primeSessionWithCompletionBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SSVFairPlaySAPSession_primeSessionWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E5BA7350;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __57__SSVFairPlaySAPSession_primeSessionWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) _establishContext];
  char v3 = [*(id *)(a1 + 32) _primeTheConnection];
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    char v5 = v3;
    id v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__SSVFairPlaySAPSession_primeSessionWithCompletionBlock___block_invoke_2;
    v7[3] = &unk_1E5BA9D20;
    id v8 = v4;
    char v9 = v5;
    dispatch_async(v6, v7);
  }
}

uint64_t __57__SSVFairPlaySAPSession_primeSessionWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (int64_t)SAPVersion
{
  return self->_version;
}

- (void)setCertificateData:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SSVFairPlaySAPSession_setCertificateData___block_invoke;
  v7[3] = &unk_1E5BA7018;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __44__SSVFairPlaySAPSession_setCertificateData___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 24) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v4;
  }
}

- (void)signData:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SSVFairPlaySAPSession_signData_completionBlock___block_invoke;
  block[3] = &unk_1E5BA6FF0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __50__SSVFairPlaySAPSession_signData_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v50 = 0;
  uint64_t v4 = [v2 _signData:v3 error:&v50];
  id v5 = v50;
  if (v4) {
    goto LABEL_27;
  }
  if (![*(id *)(a1 + 32) _shouldRetrySAPOperationForError:v5]) {
    goto LABEL_15;
  }
  id v6 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v6)
  {
    id v6 = +[SSLogConfig sharedConfig];
  }
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  id v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    v8 &= 2u;
  }
  if (v8)
  {
    id v10 = objc_opt_class();
    int v51 = 138412290;
    v52 = v10;
    id v11 = v10;
    LODWORD(v44) = 12;
    v43 = &v51;
    id v12 = (void *)_os_log_send_and_compose_impl();

    if (!v12) {
      goto LABEL_14;
    }
    id v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v51, v44);
    free(v12);
    SSFileLog(v6, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v9);
  }

LABEL_14:
  uint64_t v19 = *(void *)(a1 + 32);
  v20 = *(void **)(v19 + 32);
  *(void *)(v19 + 32) = 0;

  v21 = *(void **)(a1 + 32);
  uint64_t v22 = *(void *)(a1 + 40);
  id v49 = v5;
  uint64_t v4 = [v21 _signData:v22 error:&v49];
  id v23 = v49;

  id v5 = v23;
  if (!v4)
  {
LABEL_15:
    v24 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v24)
    {
      v24 = +[SSLogConfig sharedConfig];
    }
    int v25 = [v24 shouldLog];
    if ([v24 shouldLogToDisk]) {
      int v26 = v25 | 2;
    }
    else {
      int v26 = v25;
    }
    v27 = [v24 OSLogObject];
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      v26 &= 2u;
    }
    if (v26)
    {
      v28 = objc_opt_class();
      int v51 = 138412546;
      v52 = v28;
      __int16 v53 = 2112;
      id v54 = v5;
      id v29 = v28;
      LODWORD(v44) = 22;
      v30 = (void *)_os_log_send_and_compose_impl();

      if (!v30)
      {
LABEL_26:

        uint64_t v37 = *(void *)(a1 + 32);
        v38 = *(void **)(v37 + 32);
        *(void *)(v37 + 32) = 0;

        uint64_t v4 = 0;
        *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
        goto LABEL_27;
      }
      v27 = objc_msgSend(NSString, "stringWithCString:encoding:", v30, 4, &v51, v44);
      free(v30);
      SSFileLog(v24, @"%@", v31, v32, v33, v34, v35, v36, (uint64_t)v27);
    }

    goto LABEL_26;
  }
LABEL_27:
  v39 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SSVFairPlaySAPSession_signData_completionBlock___block_invoke_14;
  block[3] = &unk_1E5BA6EB8;
  id v40 = *(id *)(a1 + 48);
  id v47 = v5;
  id v48 = v40;
  id v46 = v4;
  id v41 = v5;
  id v42 = v4;
  dispatch_async(v39, block);
}

uint64_t __50__SSVFairPlaySAPSession_signData_completionBlock___block_invoke_14(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)verifySignature:(id)a3 forData:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__SSVFairPlaySAPSession_verifySignature_forData_completionBlock___block_invoke;
  v15[3] = &unk_1E5BAE6E0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

void __65__SSVFairPlaySAPSession_verifySignature_forData_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v52 = 0;
  char v5 = [v2 _verifySignature:v3 forData:v4 error:&v52];
  id v6 = v52;
  if ((v5 & 1) == 0)
  {
    if (![*(id *)(a1 + 32) _shouldRetrySAPOperationForError:v6])
    {
      char v7 = 0;
      goto LABEL_18;
    }
    id v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    id v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      v10 &= 2u;
    }
    if (v10)
    {
      id v12 = objc_opt_class();
      int v53 = 138412290;
      id v54 = v12;
      id v13 = v12;
      LODWORD(v46) = 12;
      v45 = &v53;
      id v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14) {
        goto LABEL_15;
      }
      id v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v53, v46);
      free(v14);
      SSFileLog(v8, @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v11);
    }

LABEL_15:
    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v22 = *(void **)(v21 + 32);
    *(void *)(v21 + 32) = 0;

    id v23 = *(void **)(a1 + 32);
    uint64_t v24 = *(void *)(a1 + 40);
    uint64_t v25 = *(void *)(a1 + 48);
    id v51 = v6;
    char v7 = [v23 _verifySignature:v24 forData:v25 error:&v51];
    id v26 = v51;

    id v6 = v26;
    if (v7) {
      goto LABEL_31;
    }
LABEL_18:
    if (!v6) {
      goto LABEL_31;
    }
    v27 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v27)
    {
      v27 = +[SSLogConfig sharedConfig];
    }
    int v28 = objc_msgSend(v27, "shouldLog", v45);
    if ([v27 shouldLogToDisk]) {
      int v29 = v28 | 2;
    }
    else {
      int v29 = v28;
    }
    v30 = [v27 OSLogObject];
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      v29 &= 2u;
    }
    if (v29)
    {
      uint64_t v31 = objc_opt_class();
      int v53 = 138412546;
      id v54 = v31;
      __int16 v55 = 2112;
      id v56 = v6;
      id v32 = v31;
      LODWORD(v46) = 22;
      uint64_t v33 = (void *)_os_log_send_and_compose_impl();

      if (!v33)
      {
LABEL_30:

        uint64_t v40 = *(void *)(a1 + 32);
        id v41 = *(void **)(v40 + 32);
        *(void *)(v40 + 32) = 0;

        char v7 = 0;
        goto LABEL_31;
      }
      v30 = objc_msgSend(NSString, "stringWithCString:encoding:", v33, 4, &v53, v46);
      free(v33);
      SSFileLog(v27, @"%@", v34, v35, v36, v37, v38, v39, (uint64_t)v30);
    }

    goto LABEL_30;
  }
  char v7 = 1;
LABEL_31:
  id v42 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SSVFairPlaySAPSession_verifySignature_forData_completionBlock___block_invoke_15;
  block[3] = &unk_1E5BAB848;
  id v43 = *(id *)(a1 + 56);
  char v50 = v7;
  id v48 = v6;
  id v49 = v43;
  id v44 = v6;
  dispatch_async(v42, block);
}

uint64_t __65__SSVFairPlaySAPSession_verifySignature_forData_completionBlock___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (id)signatureWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__79;
  id v26 = __Block_byref_object_dispose__79;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__79;
  uint64_t v20 = __Block_byref_object_dispose__79;
  id v21 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__SSVFairPlaySAPSession_signatureWithData_error___block_invoke;
  v12[3] = &unk_1E5BACCE0;
  id v14 = &v22;
  uint64_t v15 = &v16;
  id v8 = v7;
  id v13 = v8;
  [(SSVFairPlaySAPSession *)self signData:v6 completionBlock:v12];
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  int v9 = (void *)v17[5];
  if (a4 && !v9)
  {
    *a4 = (id) v23[5];
    int v9 = (void *)v17[5];
  }
  id v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __49__SSVFairPlaySAPSession_signatureWithData_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)verifyData:(id)a3 withSignature:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__79;
  id v27 = __Block_byref_object_dispose__79;
  id v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__SSVFairPlaySAPSession_verifyData_withSignature_error___block_invoke;
  v15[3] = &unk_1E5BA9918;
  uint64_t v17 = &v23;
  uint64_t v18 = &v19;
  id v11 = v10;
  uint64_t v16 = v11;
  [(SSVFairPlaySAPSession *)self verifySignature:v9 forData:v8 completionBlock:v15];
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  int v12 = *((unsigned __int8 *)v20 + 24);
  if (a5 && !*((unsigned char *)v20 + 24))
  {
    *a5 = (id) v24[5];
    int v12 = *((unsigned __int8 *)v20 + 24);
  }
  BOOL v13 = v12 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __56__SSVFairPlaySAPSession_verifyData_withSignature_error___block_invoke(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_establishContext
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  context = self->_context;
  if (context) {
    goto LABEL_29;
  }
  uint64_t v4 = [(SSVFairPlaySAPSession *)self _loadCertificateData];
  if (v4)
  {
    id v5 = [[SSVFairPlaySAPContext alloc] initWithSAPVersion:self->_version];
    id v29 = 0;
    id v6 = [(SSVFairPlaySAPContext *)v5 exchangeData:v4 error:&v29];
    id v7 = v29;
    if (v6)
    {
      while (![(SSVFairPlaySAPContext *)v5 isComplete])
      {
        certificateData = [(SSVFairPlaySAPSession *)self _postExchangeData:v6];
        if (!certificateData)
        {

          goto LABEL_12;
        }
        id v28 = 0;
        uint64_t v9 = [(SSVFairPlaySAPContext *)v5 exchangeData:certificateData error:&v28];
        id v10 = v28;

        if (!v7) {
          id v7 = v10;
        }

        id v6 = (void *)v9;
        if (!v9) {
          break;
        }
      }
    }
    else
    {
      certificateData = self->_certificateData;
      self->_certificateData = 0;
LABEL_12:

      id v6 = 0;
    }
    if ([(SSVFairPlaySAPContext *)v5 isComplete])
    {
      id v11 = v5;
      int v12 = self->_context;
      self->_context = v11;
LABEL_26:

      goto LABEL_27;
    }
    int v12 = +[SSLogConfig sharedConfig];
    if (!v12)
    {
      int v12 = +[SSLogConfig sharedConfig];
    }
    int v13 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    uint64_t v15 = [v12 OSLogObject];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      v14 &= 2u;
    }
    if (v14)
    {
      uint64_t v16 = objc_opt_class();
      int v30 = 138543618;
      uint64_t v31 = v16;
      __int16 v32 = 2112;
      id v33 = v7;
      id v17 = v16;
      LODWORD(v27) = 22;
      uint64_t v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18) {
        goto LABEL_26;
      }
      uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v30, v27);
      free(v18);
      SSFileLog(v12, @"%@", v19, v20, v21, v22, v23, v24, (uint64_t)v15);
    }

    goto LABEL_26;
  }
LABEL_27:

  context = self->_context;
  if (!context)
  {
    uint64_t v25 = self->_certificateData;
    self->_certificateData = 0;

    context = self->_context;
  }
LABEL_29:
  return context;
}

- (id)_loadCertificateData
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  certificateData = self->_certificateData;
  if (!certificateData)
  {
    uint64_t v4 = [(SSVFairPlaySAPSession *)self _urlBagInterpreter];
    id v5 = [v4 URLForURLBagKey:@"sign-sap-setup-cert"];
    if (v5)
    {
      id v6 = [[SSVLoadURLOperation alloc] initWithURL:v5];
      [(SSVLoadURLOperation *)v6 _configureWithURLBagInterpreter:v4];
      id v7 = +[SSVURLDataConsumer consumer];
      [(SSVLoadURLOperation *)v6 setDataConsumer:v7];

      [(SSVLoadURLOperation *)v6 setITunesStoreRequest:1];
      [(SSVLoadURLOperation *)v6 setBag:self->_bag];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __45__SSVFairPlaySAPSession__loadCertificateData__block_invoke;
      v23[3] = &unk_1E5BAE708;
      v23[4] = self;
      [(SSVLoadURLOperation *)v6 setOutputBlock:v23];
      [(SSVLoadURLOperation *)v6 main];
    }
    certificateData = self->_certificateData;
    if (!certificateData)
    {
      id v8 = +[SSLogConfig sharedConfig];
      if (!v8)
      {
        id v8 = +[SSLogConfig sharedConfig];
      }
      int v9 = [v8 shouldLog];
      if ([v8 shouldLogToDisk]) {
        int v10 = v9 | 2;
      }
      else {
        int v10 = v9;
      }
      id v11 = [v8 OSLogObject];
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        v10 &= 2u;
      }
      if (v10)
      {
        int v12 = objc_opt_class();
        int v24 = 138543362;
        uint64_t v25 = v12;
        id v13 = v12;
        LODWORD(v22) = 12;
        int v14 = (void *)_os_log_send_and_compose_impl();

        if (!v14)
        {
LABEL_16:

          certificateData = self->_certificateData;
          goto LABEL_17;
        }
        id v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v24, v22);
        free(v14);
        SSFileLog(v8, @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v11);
      }

      goto LABEL_16;
    }
  }
LABEL_17:
  return certificateData;
}

void __45__SSVFairPlaySAPSession__loadCertificateData__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v4 = v6;
  if (isKindOfClass)
  {
    id v5 = [v6 objectForKey:@"sign-sap-setup-cert"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), v5);
    }

    uint64_t v4 = v6;
  }
}

- (id)_postExchangeData:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__79;
  __int16 v32 = __Block_byref_object_dispose__79;
  id v33 = 0;
  id v5 = [(SSVFairPlaySAPSession *)self _urlBagInterpreter];
  id v6 = [v5 URLForURLBagKey:@"sign-sap-setup"];
  if (v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v6];
    [v7 setHTTPMethod:@"POST"];
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v4, @"sign-sap-setup-buffer", 0);
    int v9 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v8 format:100 options:0 error:0];
    [v7 setHTTPBody:v9];

    int v10 = [[SSVLoadURLOperation alloc] initWithURLRequest:v7];
    [(SSVLoadURLOperation *)v10 _configureWithURLBagInterpreter:v5];
    id v11 = +[SSVURLDataConsumer consumer];
    [(SSVLoadURLOperation *)v10 setDataConsumer:v11];

    [(SSVLoadURLOperation *)v10 setITunesStoreRequest:1];
    [(SSVLoadURLOperation *)v10 setBag:self->_bag];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __43__SSVFairPlaySAPSession__postExchangeData___block_invoke;
    v27[3] = &unk_1E5BAE730;
    v27[4] = &v28;
    [(SSVLoadURLOperation *)v10 setOutputBlock:v27];
    [(SSVLoadURLOperation *)v10 main];

LABEL_3:
    goto LABEL_4;
  }
  id v7 = +[SSLogConfig sharedConfig];
  if (!v7)
  {
    id v7 = +[SSLogConfig sharedConfig];
  }
  int v14 = [v7 shouldLog];
  int v15 = [v7 shouldLogToDisk];
  uint64_t v16 = [v7 OSLogObject];
  id v8 = v16;
  if (v15) {
    v14 |= 2u;
  }
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    v14 &= 2u;
  }
  if (!v14) {
    goto LABEL_3;
  }
  uint64_t v17 = objc_opt_class();
  int v34 = 138543362;
  uint64_t v35 = v17;
  id v18 = v17;
  LODWORD(v26) = 12;
  uint64_t v19 = (void *)_os_log_send_and_compose_impl();

  if (v19)
  {
    id v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v34, v26);
    free(v19);
    SSFileLog(v7, @"%@", v20, v21, v22, v23, v24, v25, (uint64_t)v8);
    goto LABEL_3;
  }
LABEL_4:

  id v12 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v12;
}

void __43__SSVFairPlaySAPSession__postExchangeData___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v4 = v6;
  if (isKindOfClass)
  {
    id v5 = [v6 objectForKey:@"sign-sap-setup-buffer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v5);
    }

    id v4 = v6;
  }
}

- (BOOL)_primeTheConnection
{
  BOOL v2 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  if (self->_version == 1)
  {
    context = self->_context;
    id v5 = [MEMORY[0x1E4F1C9B8] data];
    id v6 = [(SSVFairPlaySAPContext *)context primingSignatureForData:v5 error:0];

    if (v6)
    {
      id v7 = [v6 base64EncodedStringWithOptions:0];
    }
    else
    {
      id v7 = 0;
    }

    id v8 = [(SSVFairPlaySAPSession *)self _urlBagInterpreter];
    int v9 = [v8 mescalPrimingURL];
    if (v9)
    {
      int v10 = +[SSDevice currentDevice];
      id v11 = [v10 uniqueDeviceIdentifier];
      id v12 = [v11 uppercaseString];

      id v13 = [v9 URLByAppendingQueryParameter:@"guid" value:v12];

      if (v13 && v7)
      {
        int v14 = [[SSVLoadURLOperation alloc] initWithURL:v13];
        [(SSVLoadURLOperation *)v14 _configureWithURLBagInterpreter:v8];
        [(SSVLoadURLOperation *)v14 setSAPSession:self];
        int v15 = +[SSVURLDataConsumer consumer];
        [(SSVLoadURLOperation *)v14 setDataConsumer:v15];

        [(SSVLoadURLOperation *)v14 setITunesStoreRequest:1];
        [(SSVLoadURLOperation *)v14 setBag:self->_bag];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __44__SSVFairPlaySAPSession__primeTheConnection__block_invoke;
        v20[3] = &unk_1E5BADFB8;
        id v21 = v7;
        [(SSVLoadURLOperation *)v14 setPrepareRequestBlock:v20];
        objc_initWeak(&location, v14);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __44__SSVFairPlaySAPSession__primeTheConnection__block_invoke_2;
        v17[3] = &unk_1E5BAE758;
        objc_copyWeak(&v18, &location);
        v17[4] = self;
        v17[5] = &v22;
        [(SSVLoadURLOperation *)v14 setOutputBlock:v17];
        [(SSVLoadURLOperation *)v14 main];
        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      id v13 = 0;
    }
    BOOL v2 = *((unsigned char *)v23 + 24) != 0;
  }
  _Block_object_dispose(&v22, 8);
  return v2;
}

void __44__SSVFairPlaySAPSession__primeTheConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setHTTPMethod:@"POST"];
  [v3 setValue:*(void *)(a1 + 32) forHTTPHeaderField:@"X-Apple-ActionSignature"];
}

void __44__SSVFairPlaySAPSession__primeTheConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = [WeakRetained URLResponse];

    id WeakRetained = v6;
    if (v3)
    {
      id v4 = *(void **)(a1 + 32);
      id v5 = [v6 URLResponse];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 _verifyPrimeResponse:v5];

      id WeakRetained = v6;
    }
  }
}

- (BOOL)_shouldRetrySAPOperationForError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:@"SSErrorDomain"]) {
    BOOL v5 = [v3 code] == 148;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_signData:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(SSVFairPlaySAPSession *)self _establishContext];
  id v8 = v7;
  if (v7)
  {
    id v25 = 0;
    int v9 = [v7 signData:v6 error:&v25];
    id v10 = v25;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v12 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v12)
  {
    id v12 = +[SSLogConfig sharedConfig];
  }
  int v13 = [v12 shouldLog];
  if ([v12 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  int v15 = [v12 OSLogObject];
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
    v14 &= 2u;
  }
  if (v14)
  {
    int v26 = 138412290;
    id v27 = (id)objc_opt_class();
    id v16 = v27;
    LODWORD(v24) = 12;
    uint64_t v17 = (void *)_os_log_send_and_compose_impl();

    if (!v17) {
      goto LABEL_18;
    }
    int v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v26, v24);
    free(v17);
    SSFileLog(v12, @"%@", v18, v19, v20, v21, v22, v23, (uint64_t)v15);
  }

LABEL_18:
  SSError(@"SSErrorDomain", 122, @"No SAP context for signing", 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  int v9 = 0;
  if (a4) {
LABEL_3:
  }
    *a4 = v10;
LABEL_4:

  return v9;
}

- (id)_urlBagInterpreter
{
  if (!self->_urlBagInterpreter)
  {
    bag = self->_bag;
    id v4 = [SSVURLBagInterpreter alloc];
    if (bag) {
      BOOL v5 = [(SSVURLBagInterpreter *)v4 initWithSSBag:self->_bag];
    }
    else {
      BOOL v5 = [(SSVURLBagInterpreter *)v4 initWithURLBag:self->_urlBag];
    }
    urlBagInterpreter = self->_urlBagInterpreter;
    self->_urlBagInterpreter = v5;
  }
  id v7 = self->_urlBagInterpreter;
  return v7;
}

- (BOOL)_verifyPrimeResponse:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_BOOL primed = 0;
  BOOL v5 = [v4 allHeaderFields];
  id v6 = [v5 objectForKey:@"X-Apple-ActionSignature"];
  if (!v6)
  {
    id v7 = [@"X-Apple-ActionSignature" lowercaseString];
    id v6 = [v5 objectForKey:v7];
  }
  if ([v6 length])
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
    context = self->_context;
    id v46 = 0;
    BOOL v10 = [(SSVFairPlaySAPContext *)context verifyPrimeSignature:v8 error:&v46];
    id v45 = v46;
    uint64_t v11 = +[SSLogConfig sharedStoreServicesConfig];
    id v12 = (void *)v11;
    if (v10)
    {
      if (!v11)
      {
        id v12 = +[SSLogConfig sharedConfig];
      }
      int v13 = [v12 shouldLog];
      if ([v12 shouldLogToDisk]) {
        int v14 = v13 | 2;
      }
      else {
        int v14 = v13;
      }
      int v15 = [v12 OSLogObject];
      BOOL v16 = 1;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
        int v17 = v14;
      }
      else {
        int v17 = v14 & 2;
      }
      if (v17)
      {
        id v44 = v8;
        uint64_t v18 = objc_opt_class();
        id v19 = v18;
        uint64_t v20 = [v4 URL];
        int v47 = 138412546;
        id v48 = v18;
        __int16 v49 = 2112;
        id v50 = v20;
        LODWORD(v43) = 22;
        BOOL v16 = 1;
        uint64_t v21 = (void *)_os_log_send_and_compose_impl();

        if (!v21)
        {
          id v8 = v44;
          __int16 v32 = v45;
          goto LABEL_30;
        }
        int v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v47, v43);
        free(v21);
        SSFileLog(v12, @"%@", v22, v23, v24, v25, v26, v27, (uint64_t)v15);
        id v8 = v44;
      }
    }
    else
    {
      if (!v11)
      {
        id v12 = +[SSLogConfig sharedConfig];
      }
      int v28 = [v12 shouldLog];
      if ([v12 shouldLogToDisk]) {
        int v29 = v28 | 2;
      }
      else {
        int v29 = v28;
      }
      int v15 = [v12 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        int v30 = v29;
      }
      else {
        int v30 = v29 & 2;
      }
      if (v30)
      {
        uint64_t v31 = objc_opt_class();
        int v47 = 138412546;
        id v48 = v31;
        __int16 v49 = 2112;
        __int16 v32 = v45;
        id v50 = v45;
        id v33 = v31;
        LODWORD(v43) = 22;
        int v34 = (void *)_os_log_send_and_compose_impl();

        if (!v34)
        {
          BOOL v16 = 0;
          goto LABEL_30;
        }
        int v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v34, 4, &v47, v43);
        free(v34);
        SSFileLog(v12, @"%@", v35, v36, v37, v38, v39, v40, (uint64_t)v15);
        BOOL v16 = 0;
        goto LABEL_29;
      }
      BOOL v16 = 0;
    }
    __int16 v32 = v45;
LABEL_29:

LABEL_30:
    self->_BOOL primed = v16;
  }
  BOOL primed = self->_primed;

  return primed;
}

- (BOOL)_verifySignature:(id)a3 forData:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(SSVFairPlaySAPSession *)self _establishContext];
  uint64_t v11 = v10;
  if (!v10)
  {
    int v15 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v15)
    {
      int v15 = +[SSLogConfig sharedConfig];
    }
    int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    uint64_t v18 = [v15 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      v17 &= 2u;
    }
    if (v17)
    {
      int v29 = 138412290;
      id v30 = (id)objc_opt_class();
      id v19 = v30;
      LODWORD(v27) = 12;
      uint64_t v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20) {
        goto LABEL_16;
      }
      uint64_t v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v29, v27);
      free(v20);
      SSFileLog(v15, @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v18);
    }

LABEL_16:
    SSError(@"SSErrorDomain", 122, @"No SAP context for signature verification", 0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    char v12 = 0;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v28 = 0;
  char v12 = [v10 verifySignature:v8 forData:v9 error:&v28];
  id v13 = v28;
  if (a5) {
LABEL_3:
  }
    *a5 = v13;
LABEL_4:

  return v12;
}

- (int64_t)version
{
  return self->_version;
}

- (SSVURLBagInterpreter)urlBagInterpreter
{
  return self->_urlBagInterpreter;
}

- (BOOL)useSharedBagInterpreter
{
  return self->_useSharedBagInterpreter;
}

- (void)setUseSharedBagInterpreter:(BOOL)a3
{
  self->_useSharedBagInterpreter = a3;
}

- (BOOL)primed
{
  return self->_primed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBagInterpreter, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_completionBlockQueue, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end