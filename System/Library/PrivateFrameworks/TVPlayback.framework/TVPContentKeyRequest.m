@interface TVPContentKeyRequest
+ (id)secureInvalidationRequestForIdentifier:(id)a3 offlineKeyData:(id)a4 additionalRequestParams:(id)a5 contentID:(id)a6;
+ (void)initialize;
- (AVContentKeyRequest)avContentKeyRequest;
- (BOOL)allowManualRenewal;
- (BOOL)isCancelled;
- (BOOL)isLowValueKey;
- (BOOL)isRenewal;
- (BOOL)wantsOfflineKeysIfPossible;
- (NSArray)keyFormatVersions;
- (NSData)keyRequestData;
- (NSData)keyResponseData;
- (NSData)offlineKeyData;
- (NSData)secureInvalidationNonceData;
- (NSDate)availabilityEndDate;
- (NSDate)expirationDate;
- (NSDate)renewalDate;
- (NSDate)requestEndDate;
- (NSDate)requestStartDate;
- (NSDate)serverRequestStartDate;
- (NSDictionary)additionalRequestParams;
- (NSDictionary)additionalRequestParamsFromResponse;
- (NSError)error;
- (NSMutableDictionary)userInfo;
- (NSNumber)playbackDuration;
- (NSNumber)renewalInterval;
- (NSString)adamID;
- (NSString)contentID;
- (NSString)eventReportingID;
- (NSURL)keyIdentifier;
- (TVPContentKeyRequest)initWithAVContentKeyRequest:(id)a3;
- (TVPContentKeySession)contentKeySession;
- (id)context;
- (id)description;
- (id)offlineKeyDataFromServerKeyData:(id)a3 error:(id *)a4;
- (int64_t)type;
- (unint64_t)requestID;
- (void)finish;
- (void)finishByRequestingOfflineKeysIfPossible;
- (void)makeKeyRequestDataForCertificateData:(id)a3 assetIDData:(id)a4 completion:(id)a5;
- (void)offlineKeyDataFromServerKeyData:(id)a3 completion:(id)a4;
- (void)setAdamID:(id)a3;
- (void)setAdditionalRequestParams:(id)a3;
- (void)setAdditionalRequestParamsFromResponse:(id)a3;
- (void)setAllowManualRenewal:(BOOL)a3;
- (void)setAvailabilityEndDate:(id)a3;
- (void)setContentID:(id)a3;
- (void)setContentKeySession:(id)a3;
- (void)setContext:(id)a3;
- (void)setError:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setIsLowValueKey:(BOOL)a3;
- (void)setIsRenewal:(BOOL)a3;
- (void)setKeyFormatVersions:(id)a3;
- (void)setKeyIdentifier:(id)a3;
- (void)setKeyRequestData:(id)a3;
- (void)setKeyResponseData:(id)a3;
- (void)setOfflineKeyData:(id)a3;
- (void)setPlaybackDuration:(id)a3;
- (void)setRenewalDate:(id)a3;
- (void)setRenewalInterval:(id)a3;
- (void)setRequestEndDate:(id)a3;
- (void)setRequestStartDate:(id)a3;
- (void)setSecureInvalidationNonceData:(id)a3;
- (void)setServerRequestStartDate:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setWantsOfflineKeysIfPossible:(BOOL)a3;
@end

@implementation TVPContentKeyRequest

+ (void)initialize
{
  if (initialize_onceToken_8 != -1) {
    dispatch_once(&initialize_onceToken_8, &__block_literal_global_17);
  }
}

uint64_t __34__TVPContentKeyRequest_initialize__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "SecureKeyDelivery");
  v1 = (void *)sLogObject_5;
  sLogObject_5 = (uint64_t)v0;

  sOfflineKeyDataSerialQueue = (uint64_t)dispatch_queue_create("TVPContentKeyRequest offline key data queue", 0);
  return MEMORY[0x270F9A758]();
}

+ (id)secureInvalidationRequestForIdentifier:(id)a3 offlineKeyData:(id)a4 additionalRequestParams:(id)a5 contentID:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithAVContentKeyRequest:0];
  [v14 setKeyIdentifier:v13];

  [v14 setOfflineKeyData:v12];
  [v14 setAdditionalRequestParams:v11];

  [v14 setType:3];
  [v14 setContentID:v10];

  return v14;
}

- (TVPContentKeyRequest)initWithAVContentKeyRequest:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TVPContentKeyRequest;
  v6 = [(TVPContentKeyRequest *)&v19 init];
  if (v6)
  {
    v7 = [v5 identifier];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = v7;
LABEL_11:
        keyIdentifier = v6->_keyIdentifier;
        v6->_keyIdentifier = v8;
        id v11 = v8;

        objc_storeStrong((id *)&v6->_avContentKeyRequest, a3);
        uint64_t v12 = initWithAVContentKeyRequest__sRequestID++;
        v6->_requestID = v12;
        id v13 = [MEMORY[0x263F08C38] UUID];
        uint64_t v14 = [v13 UUIDString];
        eventReportingID = v6->_eventReportingID;
        v6->_eventReportingID = (NSString *)v14;

        v6->_type = 0;
        v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        userInfo = v6->_userInfo;
        v6->_userInfo = v16;

        goto LABEL_12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v7;
        if ([v9 length])
        {
          v8 = [NSURL URLWithString:v9];
        }
        else
        {
          v8 = 0;
        }

        goto LABEL_11;
      }
    }
    v8 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v6;
}

- (BOOL)isCancelled
{
  v2 = [(TVPContentKeyRequest *)self avContentKeyRequest];
  uint64_t v3 = [v2 status];

  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (id)description
{
  int64_t v3 = [(TVPContentKeyRequest *)self type];
  v4 = &stru_26EA147D8;
  if (v3 == 3) {
    v4 = @" [secure invalidation request]";
  }
  if (v3 == 2) {
    id v5 = @" [offline request]";
  }
  else {
    id v5 = v4;
  }
  id v6 = [NSString alloc];
  unint64_t v7 = [(TVPContentKeyRequest *)self requestID];
  v8 = [(TVPContentKeyRequest *)self keyIdentifier];
  id v9 = (void *)[v6 initWithFormat:@"[%lu: %@%@]", v7, v8, v5];

  return v9;
}

- (void)makeKeyRequestDataForCertificateData:(id)a3 assetIDData:(id)a4 completion:(id)a5
{
  v39[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(TVPContentKeyRequest *)self offlineKeyData];
  uint64_t v12 = [v11 length];

  if (!v12)
  {
    v18 = [(TVPContentKeyRequest *)self keyFormatVersions];
    uint64_t v19 = [v18 count];

    if (v19)
    {
      v20 = (void *)sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        v22 = [(TVPContentKeyRequest *)self keyFormatVersions];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v22;
        __int16 v36 = 2112;
        v37 = self;
        _os_log_impl(&dword_236FC5000, v21, OS_LOG_TYPE_DEFAULT, "Using key format versions %@ for key request: %@", buf, 0x16u);
      }
      uint64_t v33 = *MEMORY[0x263EF97E0];
      v15 = [(TVPContentKeyRequest *)self keyFormatVersions];
      v34 = v15;
      id v17 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      goto LABEL_10;
    }
LABEL_15:
    id v17 = 0;
    goto LABEL_16;
  }
  id v13 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = self;
    _os_log_impl(&dword_236FC5000, v13, OS_LOG_TYPE_DEFAULT, "Creating sync SPC for offline key rewewal: %@", buf, 0xCu);
  }
  *(void *)buf = 3737844653;
  uint64_t v14 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:buf length:8];
  if (v14)
  {
    v15 = (void *)v14;
    v38[0] = *MEMORY[0x263EF97E8];
    v16 = [(TVPContentKeyRequest *)self offlineKeyData];
    v38[1] = *MEMORY[0x263EF97F0];
    v39[0] = v16;
    v39[1] = v15;
    id v17 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];

LABEL_10:
LABEL_16:
    v27 = [(TVPContentKeyRequest *)self avContentKeyRequest];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __84__TVPContentKeyRequest_makeKeyRequestDataForCertificateData_assetIDData_completion___block_invoke;
    v31[3] = &unk_264CC69A0;
    v25 = &v32;
    id v32 = v10;
    id v26 = v10;
    [v27 makeStreamingContentKeyRequestDataForApp:v8 contentIdentifier:v9 options:v17 completionHandler:v31];
    goto LABEL_17;
  }
  v23 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR)) {
    -[TVPContentKeyRequest makeKeyRequestDataForCertificateData:assetIDData:completion:](v23);
  }
  v24 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.ATV.secureKeyDelivery" code:-345012 userInfo:0];
  if (!v24) {
    goto LABEL_15;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__TVPContentKeyRequest_makeKeyRequestDataForCertificateData_assetIDData_completion___block_invoke_3;
  block[3] = &unk_264CC69C8;
  v25 = &v30;
  v29 = v24;
  id v30 = v10;
  id v26 = v24;
  id v17 = v10;
  dispatch_async(MEMORY[0x263EF83A0], block);
  v27 = v29;
LABEL_17:
}

void __84__TVPContentKeyRequest_makeKeyRequestDataForCertificateData_assetIDData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__TVPContentKeyRequest_makeKeyRequestDataForCertificateData_assetIDData_completion___block_invoke_2;
  block[3] = &unk_264CC6978;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __84__TVPContentKeyRequest_makeKeyRequestDataForCertificateData_assetIDData_completion___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

uint64_t __84__TVPContentKeyRequest_makeKeyRequestDataForCertificateData_assetIDData_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

- (id)offlineKeyDataFromServerKeyData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(TVPContentKeyRequest *)self type] == 2
    && ([(TVPContentKeyRequest *)self avContentKeyRequest],
        id v7 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        (isKindOfClass & 1) != 0))
  {
    id v9 = [(TVPContentKeyRequest *)self avContentKeyRequest];
    id v10 = [v9 persistableContentKeyFromKeyVendorResponse:v6 options:0 error:a4];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)offlineKeyDataFromServerKeyData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(TVPContentKeyRequest *)self type] == 2)
  {
    id v8 = [(TVPContentKeyRequest *)self avContentKeyRequest];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = sOfflineKeyDataSerialQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __67__TVPContentKeyRequest_offlineKeyDataFromServerKeyData_completion___block_invoke;
      block[3] = &unk_264CC69F0;
      id v11 = v8;
      id v12 = v6;
      id v13 = v7;
      dispatch_async(v9, block);
    }
    else if (v7)
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __67__TVPContentKeyRequest_offlineKeyDataFromServerKeyData_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v13 = 0;
  v4 = [v2 persistableContentKeyFromKeyVendorResponse:v3 options:0 error:&v13];
  id v5 = v13;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__TVPContentKeyRequest_offlineKeyDataFromServerKeyData_completion___block_invoke_2;
  v9[3] = &unk_264CC6978;
  id v6 = *(id *)(a1 + 48);
  id v11 = v5;
  id v12 = v6;
  id v10 = v4;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __67__TVPContentKeyRequest_offlineKeyDataFromServerKeyData_completion___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)finish
{
  id v3 = [(TVPContentKeyRequest *)self contentKeySession];
  [v3 finishKeyRequest:self];
}

- (void)finishByRequestingOfflineKeysIfPossible
{
  [(TVPContentKeyRequest *)self setWantsOfflineKeysIfPossible:1];
  [(TVPContentKeyRequest *)self finish];
}

- (NSURL)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (NSString)eventReportingID
{
  return self->_eventReportingID;
}

- (BOOL)isRenewal
{
  return self->_isRenewal;
}

- (void)setIsRenewal:(BOOL)a3
{
  self->_isRenewal = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSDate)requestStartDate
{
  return self->_requestStartDate;
}

- (void)setRequestStartDate:(id)a3
{
}

- (NSDate)requestEndDate
{
  return self->_requestEndDate;
}

- (void)setRequestEndDate:(id)a3
{
}

- (NSData)keyRequestData
{
  return self->_keyRequestData;
}

- (void)setKeyRequestData:(id)a3
{
}

- (NSDictionary)additionalRequestParams
{
  return self->_additionalRequestParams;
}

- (void)setAdditionalRequestParams:(id)a3
{
}

- (NSDate)serverRequestStartDate
{
  return self->_serverRequestStartDate;
}

- (void)setServerRequestStartDate:(id)a3
{
}

- (NSArray)keyFormatVersions
{
  return self->_keyFormatVersions;
}

- (void)setKeyFormatVersions:(id)a3
{
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
}

- (NSData)offlineKeyData
{
  return self->_offlineKeyData;
}

- (void)setOfflineKeyData:(id)a3
{
}

- (NSData)secureInvalidationNonceData
{
  return self->_secureInvalidationNonceData;
}

- (void)setSecureInvalidationNonceData:(id)a3
{
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSData)keyResponseData
{
  return self->_keyResponseData;
}

- (void)setKeyResponseData:(id)a3
{
}

- (NSDate)renewalDate
{
  return self->_renewalDate;
}

- (void)setRenewalDate:(id)a3
{
}

- (NSNumber)renewalInterval
{
  return self->_renewalInterval;
}

- (void)setRenewalInterval:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSDate)availabilityEndDate
{
  return self->_availabilityEndDate;
}

- (void)setAvailabilityEndDate:(id)a3
{
}

- (NSString)contentID
{
  return self->_contentID;
}

- (void)setContentID:(id)a3
{
}

- (BOOL)isLowValueKey
{
  return self->_isLowValueKey;
}

- (void)setIsLowValueKey:(BOOL)a3
{
  self->_isLowValueKey = a3;
}

- (NSNumber)playbackDuration
{
  return self->_playbackDuration;
}

- (void)setPlaybackDuration:(id)a3
{
}

- (BOOL)allowManualRenewal
{
  return self->_allowManualRenewal;
}

- (void)setAllowManualRenewal:(BOOL)a3
{
  self->_allowManualRenewal = a3;
}

- (NSDictionary)additionalRequestParamsFromResponse
{
  return self->_additionalRequestParamsFromResponse;
}

- (void)setAdditionalRequestParamsFromResponse:(id)a3
{
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (AVContentKeyRequest)avContentKeyRequest
{
  return self->_avContentKeyRequest;
}

- (TVPContentKeySession)contentKeySession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentKeySession);
  return (TVPContentKeySession *)WeakRetained;
}

- (void)setContentKeySession:(id)a3
{
}

- (BOOL)wantsOfflineKeysIfPossible
{
  return self->_wantsOfflineKeysIfPossible;
}

- (void)setWantsOfflineKeysIfPossible:(BOOL)a3
{
  self->_wantsOfflineKeysIfPossible = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentKeySession);
  objc_storeStrong((id *)&self->_avContentKeyRequest, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_additionalRequestParamsFromResponse, 0);
  objc_storeStrong((id *)&self->_playbackDuration, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_availabilityEndDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_renewalInterval, 0);
  objc_storeStrong((id *)&self->_renewalDate, 0);
  objc_storeStrong((id *)&self->_keyResponseData, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_secureInvalidationNonceData, 0);
  objc_storeStrong((id *)&self->_offlineKeyData, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_keyFormatVersions, 0);
  objc_storeStrong((id *)&self->_serverRequestStartDate, 0);
  objc_storeStrong((id *)&self->_additionalRequestParams, 0);
  objc_storeStrong((id *)&self->_keyRequestData, 0);
  objc_storeStrong((id *)&self->_requestEndDate, 0);
  objc_storeStrong((id *)&self->_requestStartDate, 0);
  objc_storeStrong((id *)&self->_eventReportingID, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

- (void)makeKeyRequestDataForCertificateData:(os_log_t)log assetIDData:completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_236FC5000, log, OS_LOG_TYPE_ERROR, "Required nonce data is nil.  Failing SPC generation", v1, 2u);
}

@end