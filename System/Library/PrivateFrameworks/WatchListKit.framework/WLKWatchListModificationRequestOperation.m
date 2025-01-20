@interface WLKWatchListModificationRequestOperation
- (NSString)itemID;
- (WLKWatchListModificationRequestOperation)initWithAction:(unint64_t)a3 canonicalID:(id)a4 caller:(id)a5;
- (WLKWatchListModificationRequestOperation)initWithAction:(unint64_t)a3 channelID:(id)a4 externalID:(id)a5 caller:(id)a6;
- (WLKWatchListModificationRequestOperation)initWithAction:(unint64_t)a3 statsID:(id)a4 caller:(id)a5;
- (WLKWatchListModificationResponse)response;
- (id)_initWithAction:(unint64_t)a3 identifier:(id)a4 identifierType:(id)a5 brandID:(id)a6 caller:(id)a7;
- (unint64_t)action;
- (void)processResponse;
@end

@implementation WLKWatchListModificationRequestOperation

- (WLKWatchListModificationRequestOperation)initWithAction:(unint64_t)a3 canonicalID:(id)a4 caller:(id)a5
{
  return (WLKWatchListModificationRequestOperation *)[(WLKWatchListModificationRequestOperation *)self _initWithAction:a3 identifier:a4 identifierType:@"Canonical" brandID:0 caller:a5];
}

- (WLKWatchListModificationRequestOperation)initWithAction:(unint64_t)a3 statsID:(id)a4 caller:(id)a5
{
  return (WLKWatchListModificationRequestOperation *)[(WLKWatchListModificationRequestOperation *)self _initWithAction:a3 identifier:a4 identifierType:@"Stats" brandID:0 caller:a5];
}

- (id)_initWithAction:(unint64_t)a3 identifier:(id)a4 identifierType:(id)a5 brandID:(id)a6 caller:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    v17 = objc_opt_new();
    [v17 setObject:v13 forKeyedSubscript:@"id"];
    [v17 setObject:v14 forKeyedSubscript:@"idType"];
    if (v15) {
      [v17 setObject:v15 forKeyedSubscript:@"brandId"];
    }
    if (a3 == 1)
    {
      v19 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"watchlist" queryParameters:v17 httpMethod:@"DELETE" httpBody:0 headers:0 caller:v16 timeout:0 apiVersion:&unk_1F13D97A0 options:0];
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Invalid action provided (%ld)", a3);
      v19 = 0;
    }
    else
    {
      v18 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v17 options:0 error:0];
      v19 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"watchlist" queryParameters:0 httpMethod:@"POST" httpBody:v18 headers:&unk_1F13D99E0 caller:v16 timeout:0 apiVersion:&unk_1F13D97A0 options:0];
    }
    v24.receiver = self;
    v24.super_class = (Class)WLKWatchListModificationRequestOperation;
    v21 = [(WLKUTSNetworkRequestOperation *)&v24 initWithRequestProperties:v19];
    v22 = v21;
    if (v21)
    {
      v21->_action = a3;
      objc_storeStrong((id *)&v21->_itemID, a4);
    }
    self = v22;

    v20 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"identifier is required"];
    v20 = 0;
  }

  return v20;
}

- (WLKWatchListModificationRequestOperation)initWithAction:(unint64_t)a3 channelID:(id)a4 externalID:(id)a5 caller:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v10)
  {
    id v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    id v16 = @"channelID is required";
LABEL_6:
    [v14 raise:v15 format:v16];
    id v13 = 0;
    goto LABEL_7;
  }
  if (!v11)
  {
    id v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    id v16 = @"externalID is required";
    goto LABEL_6;
  }
  self = (WLKWatchListModificationRequestOperation *)[(WLKWatchListModificationRequestOperation *)self _initWithAction:a3 identifier:v11 identifierType:@"External" brandID:v10 caller:v12];
  id v13 = self;
LABEL_7:

  return v13;
}

- (void)processResponse
{
  v6 = objc_alloc_init(WLKDictionaryResponseProcessor);
  [(WLKDictionaryResponseProcessor *)v6 setObjectClass:objc_opt_class()];
  v3 = [(WLKNetworkRequestOperation *)self data];
  v4 = [(WLKDictionaryResponseProcessor *)v6 processResponseData:v3 error:0];
  response = self->_response;
  self->_response = v4;
}

- (unint64_t)action
{
  return self->_action;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (WLKWatchListModificationResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_itemID, 0);
}

@end