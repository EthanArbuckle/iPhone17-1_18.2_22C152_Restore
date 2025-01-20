@interface ICSecureKeyDeliveryRequest
- (AVAssetResourceLoadingRequest)resourceLoadingRequest;
- (AVContentKeyRequest)contentKeyRequest;
- (BOOL)isITunesStoreRequest;
- (BOOL)isOfflineDownload;
- (BOOL)shouldIncludeDeviceGUID;
- (BOOL)skippedRentalCheckout;
- (ICRequestContext)requestContext;
- (ICSecureKeyDeliveryRequest)init;
- (ICSecureKeyDeliveryRequest)initWithRequestContext:(id)a3;
- (ICSecureKeyDeliveryRequest)initWithRequestContext:(id)a3 contentKeyRequest:(id)a4;
- (ICSecureKeyDeliveryRequest)initWithRequestContext:(id)a3 resourceLoadingRequest:(id)a4;
- (ICSecureKeyDeliveryRequest)initWithRequestContext:(id)a3 serverPlaybackContextData:(id)a4;
- (NSData)serverPlaybackContextData;
- (NSNumber)accountDSID;
- (NSNumber)adamID;
- (NSString)contentURI;
- (NSURL)certificateURL;
- (NSURL)keyServerURL;
- (id)asyncServerPlaybackContextDataCreationHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)serverPlaybackContextDataCreationHandler;
- (int64_t)leaseActionType;
- (int64_t)qualityOfService;
- (int64_t)rentalID;
- (int64_t)requestProtocolType;
- (void)performWithResponseHandler:(id)a3;
- (void)setAccountDSID:(id)a3;
- (void)setAdamID:(id)a3;
- (void)setAsyncServerPlaybackContextDataCreationHandler:(id)a3;
- (void)setCertificateURL:(id)a3;
- (void)setContentURI:(id)a3;
- (void)setITunesStoreRequest:(BOOL)a3;
- (void)setIsOfflineDownload:(BOOL)a3;
- (void)setKeyServerURL:(id)a3;
- (void)setLeaseActionType:(int64_t)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRentalID:(int64_t)a3;
- (void)setRequestContext:(id)a3;
- (void)setRequestProtocolType:(int64_t)a3;
- (void)setServerPlaybackContextDataCreationHandler:(id)a3;
- (void)setShouldIncludeDeviceGUID:(BOOL)a3;
- (void)setSkippedRentalCheckout:(BOOL)a3;
@end

@implementation ICSecureKeyDeliveryRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentKeyRequest, 0);
  objc_storeStrong((id *)&self->_resourceLoadingRequest, 0);
  objc_storeStrong((id *)&self->_serverPlaybackContextData, 0);
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong(&self->_asyncServerPlaybackContextDataCreationHandler, 0);
  objc_storeStrong(&self->_serverPlaybackContextDataCreationHandler, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_contentURI, 0);

  objc_storeStrong((id *)&self->_certificateURL, 0);
}

- (AVContentKeyRequest)contentKeyRequest
{
  return self->_contentKeyRequest;
}

- (AVAssetResourceLoadingRequest)resourceLoadingRequest
{
  return self->_resourceLoadingRequest;
}

- (NSData)serverPlaybackContextData
{
  return self->_serverPlaybackContextData;
}

- (void)setAccountDSID:(id)a3
{
}

- (NSNumber)accountDSID
{
  return self->_accountDSID;
}

- (void)setAdamID:(id)a3
{
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setIsOfflineDownload:(BOOL)a3
{
  self->_isOfflineDownload = a3;
}

- (BOOL)isOfflineDownload
{
  return self->_isOfflineDownload;
}

- (void)setRequestProtocolType:(int64_t)a3
{
  self->_requestProtocolType = a3;
}

- (int64_t)requestProtocolType
{
  return self->_requestProtocolType;
}

- (void)setShouldIncludeDeviceGUID:(BOOL)a3
{
  self->_shouldIncludeDeviceGUID = a3;
}

- (BOOL)shouldIncludeDeviceGUID
{
  return self->_shouldIncludeDeviceGUID;
}

- (void)setAsyncServerPlaybackContextDataCreationHandler:(id)a3
{
}

- (id)asyncServerPlaybackContextDataCreationHandler
{
  return self->_asyncServerPlaybackContextDataCreationHandler;
}

- (void)setServerPlaybackContextDataCreationHandler:(id)a3
{
}

- (id)serverPlaybackContextDataCreationHandler
{
  return self->_serverPlaybackContextDataCreationHandler;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setITunesStoreRequest:(BOOL)a3
{
  self->_ITunesStoreRequest = a3;
}

- (BOOL)isITunesStoreRequest
{
  return self->_ITunesStoreRequest;
}

- (void)setSkippedRentalCheckout:(BOOL)a3
{
  self->_skippedRentalCheckout = a3;
}

- (BOOL)skippedRentalCheckout
{
  return self->_skippedRentalCheckout;
}

- (void)setRentalID:(int64_t)a3
{
  self->_rentalID = a3;
}

- (int64_t)rentalID
{
  return self->_rentalID;
}

- (void)setRequestContext:(id)a3
{
}

- (ICRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setLeaseActionType:(int64_t)a3
{
  self->_leaseActionType = a3;
}

- (int64_t)leaseActionType
{
  return self->_leaseActionType;
}

- (void)setKeyServerURL:(id)a3
{
}

- (NSURL)keyServerURL
{
  return self->_keyServerURL;
}

- (void)setContentURI:(id)a3
{
}

- (NSString)contentURI
{
  return self->_contentURI;
}

- (void)setCertificateURL:(id)a3
{
}

- (NSURL)certificateURL
{
  return self->_certificateURL;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4 = a3;
  v6 = objc_alloc_init(ICSecureKeyDeliveryRequestOperation);
  [(ICSecureKeyDeliveryRequestOperation *)v6 setRequest:self];
  [(ICSecureKeyDeliveryRequestOperation *)v6 setResponseHandler:v4];

  v5 = objc_msgSend(MEMORY[0x1E4F28F08], "ic_sharedRequestOperationQueueWithQualityOfService:", self->_qualityOfService);
  [v5 addOperation:v6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 2, self->_certificateURL);
    objc_storeStrong(v5 + 3, self->_contentURI);
    v5[5] = self->_leaseActionType;
    objc_storeStrong(v5 + 4, self->_keyServerURL);
    v5[8] = self->_qualityOfService;
    objc_storeStrong(v5 + 6, self->_requestContext);
    v5[7] = self->_rentalID;
    *((unsigned char *)v5 + 8) = self->_skippedRentalCheckout;
    *((unsigned char *)v5 + 9) = self->_ITunesStoreRequest;
    uint64_t v6 = MEMORY[0x1A6240BF0](self->_serverPlaybackContextDataCreationHandler);
    id v7 = v5[9];
    v5[9] = (id)v6;

    uint64_t v8 = MEMORY[0x1A6240BF0](self->_asyncServerPlaybackContextDataCreationHandler);
    id v9 = v5[10];
    v5[10] = (id)v8;

    *((unsigned char *)v5 + 10) = self->_shouldIncludeDeviceGUID;
    v5[11] = self->_requestProtocolType;
    *((unsigned char *)v5 + 11) = self->_isOfflineDownload;
    objc_storeStrong(v5 + 12, self->_adamID);
    objc_storeStrong(v5 + 15, self->_resourceLoadingRequest);
    objc_storeStrong(v5 + 16, self->_contentKeyRequest);
    objc_storeStrong(v5 + 14, self->_serverPlaybackContextData);
    objc_storeStrong(v5 + 13, self->_accountDSID);
  }
  return v5;
}

- (id)description
{
  v22[7] = *MEMORY[0x1E4F143B8];
  id v18 = objc_alloc(MEMORY[0x1E4F28E78]);
  v3 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v3);
  if (self->_isOfflineDownload) {
    uint64_t v4 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v4 = MEMORY[0x1E4F1CC28];
  }
  v22[0] = v4;
  v21[0] = @"isOfflineDownload";
  v21[1] = @"requestProtocolType";
  v19 = [NSNumber numberWithInteger:self->_requestProtocolType];
  v22[1] = v19;
  v21[2] = @"contentURI";
  contentURI = self->_contentURI;
  uint64_t v6 = (uint64_t)contentURI;
  if (!contentURI)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v17 = (void *)v6;
  v22[2] = v6;
  v21[3] = @"adamID";
  adamID = self->_adamID;
  uint64_t v8 = adamID;
  if (!adamID)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v8;
  v21[4] = @"certificateURL";
  certificateURL = self->_certificateURL;
  v10 = certificateURL;
  if (!certificateURL)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v10;
  v21[5] = @"keyServerURL";
  keyServerURL = self->_keyServerURL;
  v12 = keyServerURL;
  if (!keyServerURL)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[5] = v12;
  v21[6] = @"leaseActionType";
  v13 = [NSNumber numberWithInteger:self->_leaseActionType];
  v22[6] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:7];
  v15 = (void *)[v18 initWithFormat:@"<%@: %p; params = %@>", v20, self, v14];

  if (keyServerURL)
  {
    if (certificateURL) {
      goto LABEL_14;
    }
  }
  else
  {

    if (certificateURL)
    {
LABEL_14:
      if (adamID) {
        goto LABEL_15;
      }
LABEL_21:

      if (contentURI) {
        goto LABEL_16;
      }
      goto LABEL_22;
    }
  }

  if (!adamID) {
    goto LABEL_21;
  }
LABEL_15:
  if (contentURI) {
    goto LABEL_16;
  }
LABEL_22:

LABEL_16:

  return v15;
}

- (ICSecureKeyDeliveryRequest)initWithRequestContext:(id)a3 serverPlaybackContextData:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(ICSecureKeyDeliveryRequest *)self initWithRequestContext:a3];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_serverPlaybackContextData, a4);
  }

  return v9;
}

- (ICSecureKeyDeliveryRequest)initWithRequestContext:(id)a3 contentKeyRequest:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(ICSecureKeyDeliveryRequest *)self initWithRequestContext:a3];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contentKeyRequest, a4);
    uint64_t v10 = [v7 identifier];
    contentURI = v9->_contentURI;
    v9->_contentURI = (NSString *)v10;
  }
  return v9;
}

- (ICSecureKeyDeliveryRequest)initWithRequestContext:(id)a3 resourceLoadingRequest:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(ICSecureKeyDeliveryRequest *)self initWithRequestContext:a3];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_resourceLoadingRequest, a4);
    uint64_t v10 = [v7 request];
    v11 = [v10 URL];
    uint64_t v12 = [v11 absoluteString];
    contentURI = v9->_contentURI;
    v9->_contentURI = (NSString *)v12;
  }
  return v9;
}

- (ICSecureKeyDeliveryRequest)initWithRequestContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSecureKeyDeliveryRequest;
  uint64_t v6 = [(ICSecureKeyDeliveryRequest *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    v6->_qualityOfService = 25;
    objc_storeStrong((id *)&v6->_requestContext, a3);
  }

  return v7;
}

- (ICSecureKeyDeliveryRequest)init
{
  v3 = [ICStoreRequestContext alloc];
  uint64_t v4 = +[ICUserIdentity activeAccount];
  id v5 = [(ICStoreRequestContext *)v3 initWithIdentity:v4];
  uint64_t v6 = [(ICSecureKeyDeliveryRequest *)self initWithRequestContext:v5];

  return v6;
}

@end