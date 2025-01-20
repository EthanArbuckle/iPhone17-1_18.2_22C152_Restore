@interface ICQNetworkRequestController
- (ICQNetworkRequestController)init;
- (ICQNetworkRequestController)initWithSession:(id)a3;
- (ICQNetworkRequestController)initWithSession:(id)a3 numberOfSecondsBetweenRetries:(id)a4;
- (void)executeRequest:(id)a3 acceptedStatusCodes:(id)a4 renewHeadersBlock:(id)a5 completion:(id)a6;
@end

@implementation ICQNetworkRequestController

- (ICQNetworkRequestController)init
{
  v3 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F4EF78]) initWithIdentifier:@"ICQNetworkRequestControllerSession"];
  objc_msgSend(v3, "set_appleIDContext:", v4);

  v5 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v3];
  v6 = [(ICQNetworkRequestController *)self initWithSession:v5];

  return v6;
}

- (ICQNetworkRequestController)initWithSession:(id)a3
{
  return [(ICQNetworkRequestController *)self initWithSession:a3 numberOfSecondsBetweenRetries:&unk_1F2DE1A98];
}

- (ICQNetworkRequestController)initWithSession:(id)a3 numberOfSecondsBetweenRetries:(id)a4
{
  v6 = (NSURLSession *)a3;
  v7 = (NSArray *)a4;
  v13.receiver = self;
  v13.super_class = (Class)ICQNetworkRequestController;
  v8 = [(ICQNetworkRequestController *)&v13 init];
  session = v8->_session;
  v8->_session = v6;
  v10 = v6;

  numberOfSecondsBetweenRetries = v8->_numberOfSecondsBetweenRetries;
  v8->_numberOfSecondsBetweenRetries = v7;

  return v8;
}

- (void)executeRequest:(id)a3 acceptedStatusCodes:(id)a4 renewHeadersBlock:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)[(NSArray *)self->_numberOfSecondsBetweenRetries copy];
  objc_initWeak(&location, self);
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy_;
  v43[4] = __Block_byref_object_dispose_;
  id v44 = (id)[v10 mutableCopy];
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  char v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  id v38 = 0;
  v15 = [ICQRetryController alloc];
  NSUInteger v16 = [(NSArray *)self->_numberOfSecondsBetweenRetries count];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke;
  v23[3] = &unk_1E6A51EA0;
  objc_copyWeak(&v32, &location);
  v23[4] = self;
  id v17 = v13;
  id v26 = v17;
  v28 = &v33;
  v29 = v43;
  id v18 = v11;
  id v24 = v18;
  v30 = v41;
  v31 = v39;
  id v19 = v14;
  id v25 = v19;
  id v20 = v12;
  id v27 = v20;
  uint64_t v21 = [(ICQRetryController *)v15 initWithMaxNumberOfRetries:v16 block:v23];
  v22 = (void *)v34[5];
  v34[5] = v21;

  [(id)v34[5] executeBlock];
  _Block_object_dispose(&v33, 8);

  objc_destroyWeak(&v32);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);

  objc_destroyWeak(&location);
}

void __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  v3 = _ICQGetLogSystem();
  v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) numberOfAttempts];
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      *(_DWORD *)buf = 134218242;
      uint64_t v48 = v5;
      __int16 v49 = 2112;
      uint64_t v50 = v6;
      _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "Making attempt (%lu) for network request %@.", buf, 0x16u);
    }

    v7 = (void *)WeakRetained[1];
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_21;
    v40[3] = &unk_1E6A51E50;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 80);
    id v41 = v9;
    uint64_t v44 = v10;
    id v11 = *(id *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 72);
    id v43 = v11;
    uint64_t v45 = v12;
    long long v46 = *(_OWORD *)(a1 + 88);
    id v42 = *(id *)(a1 + 48);
    id v13 = [v7 dataTaskWithRequest:v8 completionHandler:v40];
    if (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "icq_hasAuthHeaders")
      && !*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
    {
      [v13 resume];
    }
    else
    {
      uint64_t v14 = *(void *)(a1 + 88);
      if (*(unsigned char *)(*(void *)(v14 + 8) + 24))
      {
        v15 = _ICQGetLogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_cold_2(v15, v16, v17, v18, v19, v20, v21, v22);
        }

        uint64_t v23 = *(void *)(a1 + 56);
        id v24 = ICQCreateError(15);
        (*(void (**)(uint64_t, void, void, void *))(v23 + 16))(v23, 0, 0, v24);

        uint64_t v25 = *(void *)(*(void *)(a1 + 72) + 8);
        id v26 = *(void **)(v25 + 40);
        *(void *)(v25 + 40) = 0;
      }
      else
      {
        uint64_t v31 = *(void *)(a1 + 64);
        uint64_t v32 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_25;
        v35[3] = &unk_1E6A51E78;
        uint64_t v38 = v14;
        id v36 = v13;
        id v33 = *(id *)(a1 + 56);
        uint64_t v34 = *(void *)(a1 + 72);
        id v37 = v33;
        uint64_t v39 = v34;
        (*(void (**)(uint64_t, uint64_t, void *))(v31 + 16))(v31, v32, v35);
      }
    }

    v30 = v41;
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_cold_1(a1, v4);
    }

    uint64_t v27 = *(void *)(a1 + 56);
    v28 = ICQCreateError(0);
    (*(void (**)(uint64_t, void, void, void *))(v27 + 16))(v27, 0, 0, v28);

    uint64_t v29 = *(void *)(*(void *)(a1 + 72) + 8);
    v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = 0;
  }
}

void __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_21(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  id v11 = _ICQGetLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v10 URL];
    id v13 = [v12 absoluteString];
    int v52 = 138412546;
    v53 = v13;
    __int16 v54 = 2048;
    uint64_t v55 = [v10 statusCode];
    _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, "Request to (%@) returned status code %lu.", (uint8_t *)&v52, 0x16u);
  }
  uint64_t v14 = *(void **)(a1 + 32);
  v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "statusCode"));
  LODWORD(v14) = [v14 containsObject:v15];

  if (v14)
  {
    uint64_t v16 = _ICQGetLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v52 = 138413058;
      v53 = v17;
      __int16 v54 = 2112;
      uint64_t v55 = (uint64_t)v7;
      __int16 v56 = 2112;
      uint64_t v57 = (uint64_t)v10;
      __int16 v58 = 2112;
      id v59 = v9;
      _os_log_impl(&dword_1D5851000, v16, OS_LOG_TYPE_DEFAULT, "Request (%@) succeeded with data (%@) with response (%@) with error (%@)", (uint8_t *)&v52, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = 0;
    goto LABEL_15;
  }
  uint64_t v20 = [v10 allHeaderFields];
  uint64_t v19 = [v20 objectForKeyedSubscript:@"Retry-After"];

  if ([v10 statusCode] == 429)
  {
    uint64_t v21 = +[ICQError retryErrorWithRetryAfter:v19];
    uint64_t v22 = _ICQGetLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v52 = 138413314;
      v53 = v23;
      __int16 v54 = 2112;
      uint64_t v55 = (uint64_t)v19;
      __int16 v56 = 2112;
      uint64_t v57 = (uint64_t)v7;
      __int16 v58 = 2112;
      id v59 = v10;
      __int16 v60 = 2112;
      id v61 = v9;
      id v24 = "Request (%@) failed from 429 with Retry-After (%@) with data (%@) with response (%@) with error (%@)";
LABEL_13:
      _os_log_impl(&dword_1D5851000, v22, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v52, 0x34u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if ([v10 statusCode] == 503)
  {
    uint64_t v21 = +[ICQError serviceUnavailableWithRetryAfter:v19];
    uint64_t v22 = _ICQGetLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v52 = 138413314;
      v53 = v25;
      __int16 v54 = 2112;
      uint64_t v55 = (uint64_t)v19;
      __int16 v56 = 2112;
      uint64_t v57 = (uint64_t)v7;
      __int16 v58 = 2112;
      id v59 = v10;
      __int16 v60 = 2112;
      id v61 = v9;
      id v24 = "Request (%@) failed from 503 with Retry-After (%@) with data (%@) with response (%@) with error (%@)";
      goto LABEL_13;
    }
LABEL_14:

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = 0;

    goto LABEL_15;
  }
  if ([v10 statusCode] == 400 || objc_msgSend(v10, "statusCode") == 401)
  {
    v28 = _ICQGetLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v30 = [v10 statusCode];
      int v52 = 138413314;
      v53 = v29;
      __int16 v54 = 2048;
      uint64_t v55 = v30;
      __int16 v56 = 2112;
      uint64_t v57 = (uint64_t)v7;
      __int16 v58 = 2112;
      id v59 = v10;
      __int16 v60 = 2112;
      id v61 = v9;
      _os_log_impl(&dword_1D5851000, v28, OS_LOG_TYPE_DEFAULT, "Request (%@) failed from client error %ld with data (%@) with response (%@) with error (%@). Will attempt to renew headers.", (uint8_t *)&v52, 0x34u);
    }

    int v31 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    uint64_t v32 = _ICQGetLogSystem();
    id v33 = v32;
    if (v31)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_21_cold_1(v33, v34, v35, v36, v37, v38, v39, v40);
      }

      uint64_t v41 = *(void *)(a1 + 48);
      id v42 = +[ICQError clientErrorWithStatusCode:](ICQError, "clientErrorWithStatusCode:", [v10 statusCode]);
      (*(void (**)(uint64_t, id, id, void *))(v41 + 16))(v41, v7, v10, v42);

LABEL_34:
      uint64_t v50 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v51 = *(void **)(v50 + 40);
      *(void *)(v50 + 40) = 0;

      goto LABEL_15;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v52) = 0;
      _os_log_impl(&dword_1D5851000, v33, OS_LOG_TYPE_DEFAULT, "400 or 401 but we have not attempted to renew yet.", (uint8_t *)&v52, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  }
  unint64_t v43 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) numberOfAttempts] - 1;
  if (v43 >= [*(id *)(a1 + 40) count])
  {
    uint64_t v48 = _ICQGetLogSystem();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v49 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v52 = 138413058;
      v53 = v49;
      __int16 v54 = 2112;
      uint64_t v55 = (uint64_t)v7;
      __int16 v56 = 2112;
      uint64_t v57 = (uint64_t)v10;
      __int16 v58 = 2112;
      id v59 = v9;
      _os_log_impl(&dword_1D5851000, v48, OS_LOG_TYPE_DEFAULT, "Request (%@) failed with no more retries with data (%@) with response (%@) with error (%@)", (uint8_t *)&v52, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_34;
  }
  uint64_t v44 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v43];
  uint64_t v45 = [v44 unsignedIntegerValue];

  long long v46 = _ICQGetLogSystem();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v47 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    int v52 = 138412802;
    v53 = v47;
    __int16 v54 = 2048;
    uint64_t v55 = v43;
    __int16 v56 = 2048;
    uint64_t v57 = v45;
    _os_log_impl(&dword_1D5851000, v46, OS_LOG_TYPE_DEFAULT, "Retrying request (%@) with attempt (%lu) with retryAfterSeconds (%lu)", (uint8_t *)&v52, 0x20u);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) retryAfterSeconds:v45];
LABEL_15:
}

void __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_25(uint64_t a1, int a2)
{
  v4 = _ICQGetLogSystem();
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "Request headers renewed successfully", v17, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(a1 + 32) resume];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_25_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = ICQCreateError(15);
    (*(void (**)(uint64_t, void, void, void *))(v13 + 16))(v13, 0, 0, v14);

    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfSecondsBetweenRetries, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl(&dword_1D5851000, a2, OS_LOG_TYPE_ERROR, "%@ instance no longer exist.", (uint8_t *)&v4, 0xCu);
}

void __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_21_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_25_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end