@interface SUUIGiftPurchaseRequest
- (SUUIGiftPurchaseRequest)initWithDonation:(id)a3 configuration:(id)a4;
- (SUUIGiftPurchaseRequest)initWithGift:(id)a3 configuration:(id)a4;
- (id)_requestWithURL:(id)a3 bodyDictionary:(id)a4;
- (void)purchaseWithCompletionBlock:(id)a3;
@end

@implementation SUUIGiftPurchaseRequest

- (SUUIGiftPurchaseRequest)initWithDonation:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SUUIGiftPurchaseRequest;
  v8 = [(SUUIGiftPurchaseRequest *)&v14 init];
  if (v8)
  {
    v9 = [v7 donationPurchaseURL];
    v10 = [v6 HTTPBodyDictionary];
    uint64_t v11 = [(SUUIGiftPurchaseRequest *)v8 _requestWithURL:v9 bodyDictionary:v10];
    request = v8->_request;
    v8->_request = (SUUIURLConnectionRequest *)v11;
  }
  return v8;
}

- (SUUIGiftPurchaseRequest)initWithGift:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SUUIGiftPurchaseRequest;
  v8 = [(SUUIGiftPurchaseRequest *)&v14 init];
  if (v8)
  {
    v9 = [v7 giftPurchaseURL];
    v10 = [v6 HTTPBodyDictionary];
    uint64_t v11 = [(SUUIGiftPurchaseRequest *)v8 _requestWithURL:v9 bodyDictionary:v10];
    request = v8->_request;
    v8->_request = (SUUIURLConnectionRequest *)v11;
  }
  return v8;
}

- (void)purchaseWithCompletionBlock:(id)a3
{
  id v4 = a3;
  request = self->_request;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__SUUIGiftPurchaseRequest_purchaseWithCompletionBlock___block_invoke;
  v7[3] = &unk_265406D38;
  id v8 = v4;
  id v6 = v4;
  [(SUUIURLConnectionRequest *)request startWithConnectionResponseBlock:v7];
}

void __55__SUUIGiftPurchaseRequest_purchaseWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  v5 = [a2 bodyData];
  if (v5)
  {
    id v6 = [MEMORY[0x263F08AC0] propertyListWithData:v5 options:0 format:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 objectForKey:@"status"];
      if ((objc_opt_respondsToSelector() & 1) != 0 && ![v7 integerValue])
      {
        id v9 = 0;
      }
      else
      {
        id v8 = [v6 objectForKey:@"dialog"];
        if (v8)
        {
          id v9 = 0;
        }
        else
        {
          v10 = [v6 objectForKey:@"userPresentableErrorMessage"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v9 = v10;
          }
          else {
            id v9 = 0;
          }
        }
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = [v11 localizedDescription];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_requestWithURL:(id)a3 bodyDictionary:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F7B290];
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[[v5 alloc] initWithURL:v7];

  [v8 setAllowedRetryCount:0];
  [v8 setITunesStoreRequest:1];
  [v8 setKBSyncType:2];
  [v8 setRequestParameters:v6];

  [v8 setShouldProcessProtocol:1];
  [v8 setShouldSendSecureToken:1];
  id v9 = SSVDefaultUserAgent();
  [v8 setValue:v9 forHTTPHeaderField:@"User-Agent"];

  [v8 setHTTPMethod:@"POST"];
  [v8 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v10 = [(SSURLConnectionRequest *)[SUUIURLConnectionRequest alloc] initWithRequestProperties:v8];
  [(SSURLConnectionRequest *)v10 setShouldMescalSign:1];

  return v10;
}

- (void).cxx_destruct
{
}

@end