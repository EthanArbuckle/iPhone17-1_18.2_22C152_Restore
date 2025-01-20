@interface WLKMarkAsWatchedRequestOperation
- (NSString)brandID;
- (NSString)itemID;
- (WLKMarkAsWatchedRequestOperation)initWithItemID:(id)a3;
@end

@implementation WLKMarkAsWatchedRequestOperation

- (WLKMarkAsWatchedRequestOperation)initWithItemID:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v6 setObject:v5 forKey:@"id"];
    v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:0 error:0];
    v8 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"play-history" queryParameters:0 httpMethod:@"POST" httpBody:v7 headers:&unk_1F13D9AD0 caller:0 timeout:0 apiVersion:&unk_1F13D9950 options:0];
    v13.receiver = self;
    v13.super_class = (Class)WLKMarkAsWatchedRequestOperation;
    v9 = [(WLKUTSNetworkRequestOperation *)&v13 initWithRequestProperties:v8];
    v10 = v9;
    if (v9) {
      objc_storeStrong((id *)&v9->_itemID, a3);
    }
    self = v10;

    v11 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"item ID is required"];
    v11 = 0;
  }

  return v11;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (NSString)brandID
{
  return self->_brandID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandID, 0);

  objc_storeStrong((id *)&self->_itemID, 0);
}

@end