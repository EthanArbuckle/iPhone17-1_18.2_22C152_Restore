@interface PKValueAddedServiceWebService
- (NSDictionary)merchantPayload;
- (PKPass)pass;
- (PKValueAddedServiceWebService)initWithValueAddedServiceTransaction:(id)a3;
- (void)downloadMerchantPayloadWithCompletion:(id)a3;
- (void)downloadPassWithCompletion:(id)a3;
@end

@implementation PKValueAddedServiceWebService

- (PKValueAddedServiceWebService)initWithValueAddedServiceTransaction:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKValueAddedServiceWebService;
  v6 = [(PKValueAddedServiceWebService *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_valueAddedTransaction, a3);
    v8 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
    [v8 setURLCache:0];
    uint64_t v9 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v8];
    urlSession = v7->_urlSession;
    v7->_urlSession = (NSURLSession *)v9;
  }
  return v7;
}

- (void)downloadMerchantPayloadWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  urlSession = self->_urlSession;
  v7 = [(PKValueAddedServiceTransaction *)self->_valueAddedTransaction merchantURL];
  v8 = [v5 URLWithString:v7];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __71__PKValueAddedServiceWebService_downloadMerchantPayloadWithCompletion___block_invoke;
  v14 = &unk_1E56E1400;
  v15 = self;
  id v16 = v4;
  id v9 = v4;
  v10 = [(NSURLSession *)urlSession dataTaskWithURL:v8 completionHandler:&v11];
  objc_msgSend(v10, "resume", v11, v12, v13, v14, v15);
}

void __71__PKValueAddedServiceWebService_downloadMerchantPayloadWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (*(void *)(a1 + 40))
  {
    if (v9)
    {
      uint64_t v11 = PKLogFacilityTypeGetObject(2uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        v17 = v10;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "VAS Merchant Payload download failed with error: %@", (uint8_t *)&v16, 0xCu);
      }

      uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:0];
      uint64_t v14 = *(void *)(a1 + 32);
      v15 = *(void **)(v14 + 24);
      *(void *)(v14 + 24) = v13;

      uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v12();
  }
}

- (void)downloadPassWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_merchantPayload objectForKey:@"URLs"];
  v6 = [v5 objectForKey:@"passDownload"];

  id v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
  id v8 = [v7 scheme];
  if ([v8 isEqualToString:@"https"])
  {
    BOOL v9 = 1;
  }
  else
  {
    v10 = [v7 scheme];
    if ([v10 isEqualToString:@"http"]) {
      BOOL v9 = PKAllowHTTP();
    }
    else {
      BOOL v9 = 0;
    }
  }
  if (v7) {
    BOOL v11 = !v9;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    uint64_t v12 = PKLogFacilityTypeGetObject(2uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "VAS Pass download failed: invalid passDownload URL", v15, 2u);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
  else
  {
    urlSession = self->_urlSession;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__PKValueAddedServiceWebService_downloadPassWithCompletion___block_invoke;
    v16[3] = &unk_1E56E1400;
    v16[4] = self;
    id v17 = v4;
    uint64_t v14 = [(NSURLSession *)urlSession dataTaskWithURL:v7 completionHandler:v16];
    [v14 resume];
  }
}

void __60__PKValueAddedServiceWebService_downloadPassWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (*(void *)(a1 + 40))
  {
    v10 = [v8 MIMEType];
    if ([v10 isEqualToString:@"application/vnd.apple.pkpass"])
    {
      uint64_t v11 = [v8 expectedContentLength];

      if (v11 <= 15728640)
      {
        if (!v9)
        {
          id v16 = +[PKObject createWithData:v7 warnings:0 error:0];
          uint64_t v17 = *(void *)(a1 + 32);
          uint64_t v18 = *(void **)(v17 + 32);
          *(void *)(v17 + 32) = v16;

          (*(void (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 32) != 0);
          goto LABEL_12;
        }
        uint64_t v12 = PKLogFacilityTypeGetObject(2uLL);
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_11;
        }
        int v19 = 138412290;
        id v20 = v9;
        uint64_t v13 = "VAS Pass download failed with error: %@";
        uint64_t v14 = v12;
        uint32_t v15 = 12;
        goto LABEL_10;
      }
    }
    else
    {
    }
    uint64_t v12 = PKLogFacilityTypeGetObject(2uLL);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

      (*(void (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0);
      goto LABEL_12;
    }
    LOWORD(v19) = 0;
    uint64_t v13 = "VAS Pass download failed: invalid pass";
    uint64_t v14 = v12;
    uint32_t v15 = 2;
LABEL_10:
    _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v19, v15);
    goto LABEL_11;
  }
LABEL_12:
}

- (NSDictionary)merchantPayload
{
  return self->_merchantPayload;
}

- (PKPass)pass
{
  return self->_pass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_merchantPayload, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_valueAddedTransaction, 0);
}

@end