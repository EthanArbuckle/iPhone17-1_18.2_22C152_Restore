@interface TVPSecureKeyRequest
- (BOOL)isRenewal;
- (BOOL)loadKeyRequestDataWithError:(id *)a3;
- (BOOL)offlineKeyUsageAllowed;
- (BOOL)retrievesOfflineKeys;
- (NSData)certificateData;
- (NSData)contentIdentifierData;
- (NSData)keyRequestData;
- (NSDate)requestEndDate;
- (NSDate)requestStartDate;
- (NSDate)startDate;
- (NSDictionary)requestOptions;
- (NSNumber)rentalID;
- (NSNumber)requestCompletionTime;
- (NSString)reportingID;
- (TVPPlaybackReportingEventCollection)eventCollection;
- (TVPSecureKeyRequest)initWithAssetResourceLoadingRequest:(id)a3;
- (id)offlineKeyDataForResponseData:(id)a3 error:(id *)a4;
- (unint64_t)requestID;
- (unint64_t)retryCount;
- (void)finishLoadingWithResponseData:(id)a3 renewalDate:(id)a4 keyType:(int64_t)a5;
- (void)loadKeyRequestDataAsynchronouslyWithCompletion:(id)a3;
- (void)setCertificateData:(id)a3;
- (void)setContentIdentifierData:(id)a3;
- (void)setEventCollection:(id)a3;
- (void)setKeyRequestData:(id)a3;
- (void)setRentalID:(id)a3;
- (void)setRequestCompletionTime:(id)a3;
- (void)setRequestEndDate:(id)a3;
- (void)setRequestOptions:(id)a3;
- (void)setRequestStartDate:(id)a3;
- (void)setRetrievesOfflineKeys:(BOOL)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setStartDate:(id)a3;
@end

@implementation TVPSecureKeyRequest

- (TVPSecureKeyRequest)initWithAssetResourceLoadingRequest:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TVPSecureKeyRequest;
  v3 = [(TVPResourceLoadingRequest *)&v9 initWithAssetResourceLoadingRequest:a3];
  v4 = v3;
  if (v3)
  {
    v3->_requestID = (int)(atomic_fetch_add_explicit(sSecureRequestID, 1u, memory_order_relaxed) + 1);
    v5 = [MEMORY[0x263F08C38] UUID];
    uint64_t v6 = [v5 UUIDString];
    reportingID = v4->_reportingID;
    v4->_reportingID = (NSString *)v6;
  }
  return v4;
}

- (BOOL)loadKeyRequestDataWithError:(id *)a3
{
  v5 = [MEMORY[0x263EFF910] date];
  [(TVPSecureKeyRequest *)self setStartDate:v5];

  uint64_t v6 = [(TVPSecureKeyRequest *)self keyRequestData];

  if (v6) {
    return 1;
  }
  v8 = [(TVPSecureKeyRequest *)self requestOptions];
  id v9 = (id)[v8 mutableCopy];

  if (!v9) {
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  if ([(TVPSecureKeyRequest *)self retrievesOfflineKeys]) {
    [v9 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EF95D0]];
  }
  v10 = [(TVPResourceLoadingRequest *)self loadingRequest];
  v11 = [(TVPSecureKeyRequest *)self certificateData];
  v12 = [(TVPSecureKeyRequest *)self contentIdentifierData];
  v13 = [v10 streamingContentKeyRequestDataForApp:v11 contentIdentifier:v12 options:v9 error:a3];

  BOOL v7 = v13 != 0;
  if (v13) {
    [(TVPSecureKeyRequest *)self setKeyRequestData:v13];
  }

  return v7;
}

- (void)loadKeyRequestDataAsynchronouslyWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF910] date];
  [(TVPSecureKeyRequest *)self setStartDate:v5];

  uint64_t v6 = [(TVPSecureKeyRequest *)self keyRequestData];

  if (v6)
  {
    uint64_t v7 = sTVPPlaybackPerfToken_0++;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__TVPSecureKeyRequest_loadKeyRequestDataAsynchronouslyWithCompletion___block_invoke_3;
    block[3] = &unk_264CC5588;
    uint64_t v15 = v7;
    id v14 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    objc_initWeak(&location, self);
    v8 = [(TVPSecureKeyRequest *)self requestOptions];
    id v9 = (id)[v8 mutableCopy];

    if (!v9) {
      id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    if ([(TVPSecureKeyRequest *)self retrievesOfflineKeys]) {
      [v9 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EF95D0]];
    }
    v10 = [(TVPResourceLoadingRequest *)self loadingRequest];
    v11 = [(TVPSecureKeyRequest *)self certificateData];
    v12 = [(TVPSecureKeyRequest *)self contentIdentifierData];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __70__TVPSecureKeyRequest_loadKeyRequestDataAsynchronouslyWithCompletion___block_invoke;
    v16[3] = &unk_264CC6950;
    objc_copyWeak(&v18, &location);
    id v17 = v4;
    [v10 generateStreamingContentKeyRequestDataAsynchronouslyForApp:v11 contentIdentifier:v12 options:v9 completionHandler:v16];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __70__TVPSecureKeyRequest_loadKeyRequestDataAsynchronouslyWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)sTVPPlaybackPerfToken_0++;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__TVPSecureKeyRequest_loadKeyRequestDataAsynchronouslyWithCompletion___block_invoke_2;
  block[3] = &unk_264CC6928;
  v15[1] = v7;
  id v12 = v5;
  id v8 = v5;
  objc_copyWeak(v15, (id *)(a1 + 40));
  id v9 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v9;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(v15);
}

uint64_t __70__TVPSecureKeyRequest_loadKeyRequestDataAsynchronouslyWithCompletion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained setKeyRequestData:*(void *)(a1 + 32)];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __70__TVPSecureKeyRequest_loadKeyRequestDataAsynchronouslyWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (id)offlineKeyDataForResponseData:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id v6 = a3;
    uint64_t v7 = [(TVPResourceLoadingRequest *)self loadingRequest];
    id v8 = [v7 persistentContentKeyFromKeyVendorResponse:v6 options:0 error:a4];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (void)finishLoadingWithResponseData:(id)a3 renewalDate:(id)a4 keyType:(int64_t)a5
{
  v5.receiver = self;
  v5.super_class = (Class)TVPSecureKeyRequest;
  [(TVPResourceLoadingRequest *)&v5 finishLoadingWithResponseData:a3 renewalDate:a4 keyType:a5];
}

- (BOOL)isRenewal
{
  v2 = [(TVPResourceLoadingRequest *)self loadingRequest];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)offlineKeyUsageAllowed
{
  v2 = [(TVPResourceLoadingRequest *)self loadingRequest];
  v3 = [v2 contentInformationRequest];
  id v4 = [v3 allowedContentTypes];
  char v5 = [v4 containsObject:*MEMORY[0x263EFA1A8]];

  return v5;
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (NSData)certificateData
{
  return self->_certificateData;
}

- (void)setCertificateData:(id)a3
{
}

- (NSData)contentIdentifierData
{
  return self->_contentIdentifierData;
}

- (void)setContentIdentifierData:(id)a3
{
}

- (NSData)keyRequestData
{
  return self->_keyRequestData;
}

- (void)setKeyRequestData:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSNumber)rentalID
{
  return self->_rentalID;
}

- (void)setRentalID:(id)a3
{
}

- (BOOL)retrievesOfflineKeys
{
  return self->_retrievesOfflineKeys;
}

- (void)setRetrievesOfflineKeys:(BOOL)a3
{
  self->_retrievesOfflineKeys = a3;
}

- (NSDictionary)requestOptions
{
  return self->_requestOptions;
}

- (void)setRequestOptions:(id)a3
{
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (NSString)reportingID
{
  return self->_reportingID;
}

- (TVPPlaybackReportingEventCollection)eventCollection
{
  return self->_eventCollection;
}

- (void)setEventCollection:(id)a3
{
}

- (NSNumber)requestCompletionTime
{
  return self->_requestCompletionTime;
}

- (void)setRequestCompletionTime:(id)a3
{
}

- (NSDate)requestEndDate
{
  return self->_requestEndDate;
}

- (void)setRequestEndDate:(id)a3
{
}

- (NSDate)requestStartDate
{
  return self->_requestStartDate;
}

- (void)setRequestStartDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestStartDate, 0);
  objc_storeStrong((id *)&self->_requestEndDate, 0);
  objc_storeStrong((id *)&self->_requestCompletionTime, 0);
  objc_storeStrong((id *)&self->_eventCollection, 0);
  objc_storeStrong((id *)&self->_reportingID, 0);
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_storeStrong((id *)&self->_rentalID, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_keyRequestData, 0);
  objc_storeStrong((id *)&self->_contentIdentifierData, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
}

@end