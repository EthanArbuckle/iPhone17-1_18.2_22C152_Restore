@interface WLKSportsFavoriteRequestOperation
- (NSArray)ids;
- (NSString)caller;
- (WLKSportsFavoriteRequestOperation)initWithAction:(unint64_t)a3 ids:(id)a4;
- (WLKSportsFavoriteRequestOperation)initWithAction:(unint64_t)a3 ids:(id)a4 caller:(id)a5;
- (WLKSportsFavoriteResponse)response;
- (id)_preparePOSTQueryOnlyWithRequest:(id)a3;
- (unint64_t)action;
- (void)prepareURLRequest:(id)a3;
- (void)processResponse;
- (void)setResponse:(id)a3;
@end

@implementation WLKSportsFavoriteRequestOperation

- (WLKSportsFavoriteRequestOperation)initWithAction:(unint64_t)a3 ids:(id)a4
{
  return [(WLKSportsFavoriteRequestOperation *)self initWithAction:a3 ids:a4 caller:0];
}

- (WLKSportsFavoriteRequestOperation)initWithAction:(unint64_t)a3 ids:(id)a4 caller:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (a3 == 2)
  {
    WLKRequireNonNilParameter((uint64_t)v8);
    v21 = @"id";
    v11 = [v8 componentsJoinedByString:@","];
    v22 = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"favorite-teams" queryParameters:v12 httpMethod:@"DELETE" httpBody:0 headers:0 caller:v9 timeout:0 apiVersion:&unk_1F13D9848 options:0x200000];
    v10 = LABEL_7:;

    goto LABEL_9;
  }
  if (a3 == 1)
  {
    WLKRequireNonNilParameter((uint64_t)v8);
    v23 = @"id";
    v11 = [v8 componentsJoinedByString:@","];
    v24[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"favorite-teams" queryParameters:v12 httpMethod:@"POST" httpBody:0 headers:0 caller:v9 timeout:0 apiVersion:&unk_1F13D9848 options:0x200000];
    goto LABEL_7;
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Invalid action provided (%ld)", a3);
    v10 = 0;
  }
  else
  {
    v10 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"favorite-teams" queryParameters:0 httpMethod:@"GET" httpBody:0 headers:0 caller:v9 timeout:0 apiVersion:&unk_1F13D9848 options:2097160];
  }
LABEL_9:
  v20.receiver = self;
  v20.super_class = (Class)WLKSportsFavoriteRequestOperation;
  v13 = [(WLKUTSNetworkRequestOperation *)&v20 initWithRequestProperties:v10];
  v14 = v13;
  if (v13)
  {
    v13->_action = a3;
    uint64_t v15 = [v8 copy];
    ids = v14->_ids;
    v14->_ids = (NSArray *)v15;

    uint64_t v17 = [v9 copy];
    caller = v14->_caller;
    v14->_caller = (NSString *)v17;
  }
  return v14;
}

- (void)processResponse
{
  v7 = objc_alloc_init(WLKDictionaryResponseProcessor);
  [(WLKDictionaryResponseProcessor *)v7 setObjectClass:objc_opt_class()];
  v3 = [(WLKNetworkRequestOperation *)self data];
  v4 = [(WLKDictionaryResponseProcessor *)v7 processResponseData:v3 error:0];
  response = self->_response;
  self->_response = v4;

  if ([(WLKSportsFavoriteRequestOperation *)self action] == 1
    || [(WLKSportsFavoriteRequestOperation *)self action] == 2)
  {
    v6 = dispatch_get_global_queue(21, 0);
    dispatch_async(v6, &__block_literal_global_23);
  }
}

void __52__WLKSportsFavoriteRequestOperation_processResponse__block_invoke()
{
  if (WLKIsTVApp())
  {
    id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  else
  {
    id v0 = objc_alloc(MEMORY[0x1E4F1CB18]);
    v1 = WLKTVAppBundleID();
    id v6 = (id)[v0 initWithSuiteName:v1];
  }
  v2 = [MEMORY[0x1E4F1C9C8] now];
  [v6 setObject:v2 forKey:@"WLKSettingsLastSyncDate"];

  id v3 = objc_alloc_init(MEMORY[0x1E4F79CE0]);
  v4 = WLKTVAppBundleID();
  v5 = [MEMORY[0x1E4F1CAD0] setWithObject:@"WLKSettingsLastSyncDate"];
  [v3 synchronizeUserDefaultsDomain:v4 keys:v5];
}

- (void)prepareURLRequest:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__WLKSportsFavoriteRequestOperation_prepareURLRequest___block_invoke;
  v7[3] = &unk_1E620AD70;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WLKSportsFavoriteRequestOperation;
  id v5 = v4;
  [(WLKUTSNetworkRequestOperation *)&v6 prepareURLRequest:v7];
}

void __55__WLKSportsFavoriteRequestOperation_prepareURLRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  if ([v5 action] == 1)
  {
    uint64_t v7 = [*(id *)(a1 + 32) _preparePOSTQueryOnlyWithRequest:v6];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v6 = (id)v7;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_preparePOSTQueryOnlyWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[v3 mutableCopy];
  id v5 = [v3 URL];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F29088];
    uint64_t v7 = [v3 URL];
    id v8 = [v6 componentsWithURL:v7 resolvingAgainstBaseURL:0];

    id v9 = [NSString alloc];
    v10 = [v3 HTTPBody];
    v11 = (void *)[v9 initWithData:v10 encoding:4];

    if (v8 && v11)
    {
      [v8 setQuery:v11];
      v12 = [v8 URL];
      if (v12)
      {
        [v4 setURL:v12];
        [v4 setHTTPBody:0];
        [v4 setValue:0 forHTTPHeaderField:@"Content-Type"];
      }
    }
  }

  return v4;
}

- (unint64_t)action
{
  return self->_action;
}

- (NSArray)ids
{
  return self->_ids;
}

- (NSString)caller
{
  return self->_caller;
}

- (WLKSportsFavoriteResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_caller, 0);

  objc_storeStrong((id *)&self->_ids, 0);
}

@end