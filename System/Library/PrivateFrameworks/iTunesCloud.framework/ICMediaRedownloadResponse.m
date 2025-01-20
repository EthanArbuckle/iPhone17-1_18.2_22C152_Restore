@interface ICMediaRedownloadResponse
- (BOOL)authorized;
- (BOOL)shouldCancelPurchaseBatch;
- (ICMediaRedownloadResponse)initWithResponseDictionary:(id)a3 requestDate:(id)a4 urlBag:(id)a5;
- (ICStoreDialogResponse)dialog;
- (NSArray)items;
- (NSData)subscriptionKeyBagData;
- (NSDictionary)responseDictionary;
- (NSError)serverError;
- (NSString)jingleAction;
- (int64_t)status;
- (unsigned)downloadQueueItemCount;
@end

@implementation ICMediaRedownloadResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);

  objc_storeStrong((id *)&self->_requestDate, 0);
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (NSData)subscriptionKeyBagData
{
  return (NSData *)ICMusicSubscriptionFairPlaySubscriptionKeyBagForResponseDictionary(self->_responseDictionary);
}

- (NSArray)items
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(NSDictionary *)self->_responseDictionary objectForKey:@"songList"];
  if (_NSIsNSArray())
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v14 = v3;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = 0;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            v11 = [[ICStoreMediaResponseItem alloc] initWithItemResponseDictionary:v10 urlBag:self->_urlBag];
            v12 = [(NSDate *)self->_requestDate dateByAddingTimeInterval:7200.0];
            [(ICStoreMediaResponseItem *)v11 setAssetExpirationDate:v12];

            if (!v7) {
              id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v7 addObject:v11];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
    else
    {
      id v7 = 0;
    }

    v3 = v14;
  }
  else
  {
    id v7 = 0;
  }

  return (NSArray *)v7;
}

- (NSString)jingleAction
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"jingleAction"];
  if (_NSIsNSString()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (unsigned)downloadQueueItemCount
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"download-queue-item-count"];
  if (_NSIsNSNumber()) {
    unsigned int v3 = [v2 unsignedIntValue];
  }
  else {
    unsigned int v3 = 0;
  }

  return v3;
}

- (NSError)serverError
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"failureType"];
  if (objc_opt_respondsToSelector())
  {
    unsigned int v3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"ICStoreServerError", objc_msgSend(v2, "integerValue"), 0);
  }
  else
  {
    unsigned int v3 = 0;
  }

  return (NSError *)v3;
}

- (ICStoreDialogResponse)dialog
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"dialog"];
  if (_NSIsNSDictionary()) {
    unsigned int v3 = [[ICStoreDialogResponse alloc] initWithResponseDictionary:v2];
  }
  else {
    unsigned int v3 = 0;
  }

  return v3;
}

- (int64_t)status
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"status"];
  if (_NSIsNSNumber()) {
    int64_t v3 = [v2 longLongValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (BOOL)shouldCancelPurchaseBatch
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"cancel-purchase-batch"];
  if (_NSIsNSNumber()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)authorized
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"authorized"];
  if (_NSIsNSNumber()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (ICMediaRedownloadResponse)initWithResponseDictionary:(id)a3 requestDate:(id)a4 urlBag:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICMediaRedownloadResponse;
  v11 = [(ICMediaRedownloadResponse *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    requestDate = v11->_requestDate;
    v11->_requestDate = (NSDate *)v12;

    uint64_t v14 = [v8 copy];
    responseDictionary = v11->_responseDictionary;
    v11->_responseDictionary = (NSDictionary *)v14;

    objc_storeStrong((id *)&v11->_urlBag, a5);
  }

  return v11;
}

@end