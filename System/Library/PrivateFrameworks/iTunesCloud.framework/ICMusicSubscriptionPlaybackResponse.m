@interface ICMusicSubscriptionPlaybackResponse
- (ICMusicSubscriptionPlaybackResponse)initWithResponseDictionary:(id)a3 requestDate:(id)a4 urlBag:(id)a5;
- (ICStoreDialogResponse)dialog;
- (NSArray)items;
- (NSData)leaseInfoData;
- (NSData)subscriptionKeyBagData;
- (NSDate)leaseExpirationDate;
- (NSDictionary)metricsDictionary;
- (NSError)serverError;
- (NSString)householdID;
- (id)itemWithStoreAdamID:(int64_t)a3;
@end

@implementation ICMusicSubscriptionPlaybackResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_requestDate, 0);

  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

- (NSDictionary)metricsDictionary
{
  return (NSDictionary *)[(NSDictionary *)self->_responseDictionary ic_dictionaryValueForKey:@"metrics"];
}

- (NSData)subscriptionKeyBagData
{
  return (NSData *)ICMusicSubscriptionFairPlaySubscriptionKeyBagForResponseDictionary(self->_responseDictionary);
}

- (NSError)serverError
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"failureType"];
  if (objc_opt_respondsToSelector())
  {
    v3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"ICStoreServerError", objc_msgSend(v2, "integerValue"), 0);
  }
  else
  {
    v3 = 0;
  }

  return (NSError *)v3;
}

- (NSData)leaseInfoData
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"ckc"];
  if (_NSIsNSData())
  {
    id v3 = v2;
LABEL_5:
    v4 = v3;
    goto LABEL_7;
  }
  if (_NSIsNSString())
  {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v2 options:0];
    goto LABEL_5;
  }
  v4 = 0;
LABEL_7:
  if ([v4 length]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (id)itemWithStoreAdamID:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(ICMusicSubscriptionPlaybackResponse *)self items];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "storeAdamID", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (NSArray)items
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSDictionary *)self->_responseDictionary objectForKey:@"songList"];
  if (_NSIsNSArray())
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = v3;
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
            v11 = [[ICMusicSubscriptionPlaybackResponseItem alloc] initWithItemResponseDictionary:v10 urlBag:self->_urlBag];
            long long v12 = [(NSDate *)self->_requestDate dateByAddingTimeInterval:7200.0];
            [(ICMusicSubscriptionPlaybackResponseItem *)v11 setAssetExpirationDate:v12];

            if (v11)
            {
              if (!v7) {
                id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              [v7 addObject:v11];
            }
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

    id v3 = v14;
  }
  else
  {
    id v7 = 0;
  }

  return (NSArray *)v7;
}

- (NSDate)leaseExpirationDate
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [v3 objectForKey:@"ICMusicSubscriptionLeaseDurationInterval"];

  if (objc_opt_respondsToSelector())
  {
    if (v4) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v4 = [(NSDictionary *)self->_responseDictionary objectForKey:@"leaseDurationInSeconds"];
LABEL_6:
  if (objc_opt_respondsToSelector())
  {
    requestDate = self->_requestDate;
    [v4 doubleValue];
    id v7 = requestDate;
  }
  else
  {
    uint64_t v8 = [(ICMusicSubscriptionPlaybackResponse *)self serverError];

    if (v8)
    {
      v9 = 0;
      goto LABEL_12;
    }
    id v7 = self->_requestDate;
    double v6 = 600.0;
  }
  v9 = [(NSDate *)v7 dateByAddingTimeInterval:v6];
LABEL_12:

  return (NSDate *)v9;
}

- (NSString)householdID
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"householdId"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (ICStoreDialogResponse)dialog
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"dialog"];
  if (_NSIsNSDictionary()) {
    id v3 = [[ICStoreDialogResponse alloc] initWithResponseDictionary:v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (ICMusicSubscriptionPlaybackResponse)initWithResponseDictionary:(id)a3 requestDate:(id)a4 urlBag:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v12 = [(ICMusicSubscriptionPlaybackResponse *)self init];
  long long v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_responseDictionary, a3);
    objc_storeStrong((id *)&v13->_requestDate, a4);
    objc_storeStrong((id *)&v13->_urlBag, a5);
  }

  return v13;
}

@end