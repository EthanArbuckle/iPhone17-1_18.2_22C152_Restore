@interface WLKCanonicalPlayablesSiriRequestOperation
- (NSString)sportsEventID;
- (NSString)statsID;
- (WLKCanonicalPlayablesResponse)response;
- (WLKCanonicalPlayablesSiriRequestOperation)initWithSportsEventID:(id)a3 caller:(id)a4;
- (WLKCanonicalPlayablesSiriRequestOperation)initWithStatsID:(id)a3 caller:(id)a4;
- (void)processResponse;
@end

@implementation WLKCanonicalPlayablesSiriRequestOperation

- (WLKCanonicalPlayablesSiriRequestOperation)initWithStatsID:(id)a3 caller:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v20[0] = v6;
  v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a4;
  v9 = [v7 arrayWithObjects:v20 count:1];
  v10 = [v9 componentsJoinedByString:@","];

  v18 = @"statsIds";
  v19 = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v12 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"/siri/sports-tune-in" queryParameters:v11 httpMethod:@"GET" httpBody:0 headers:0 caller:v8 timeout:0 apiVersion:&unk_1F13D98F0 options:0];

  v17.receiver = self;
  v17.super_class = (Class)WLKCanonicalPlayablesSiriRequestOperation;
  v13 = [(WLKUTSNetworkRequestOperation *)&v17 initWithRequestProperties:v12];
  if (v13)
  {
    uint64_t v14 = [v6 copy];
    statsID = v13->_statsID;
    v13->_statsID = (NSString *)v14;
  }
  return v13;
}

- (WLKCanonicalPlayablesSiriRequestOperation)initWithSportsEventID:(id)a3 caller:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [@"/sporting-events/{sportingEventId}" stringByReplacingOccurrencesOfString:@"{sportingEventId}" withString:v6];
  v9 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:v8 queryParameters:0 httpMethod:@"GET" httpBody:0 headers:0 caller:v7 timeout:0 apiVersion:&unk_1F13D98F0 options:0];

  v14.receiver = self;
  v14.super_class = (Class)WLKCanonicalPlayablesSiriRequestOperation;
  v10 = [(WLKUTSNetworkRequestOperation *)&v14 initWithRequestProperties:v9];
  if (v10)
  {
    uint64_t v11 = [v6 copy];
    sportsEventID = v10->_sportsEventID;
    v10->_sportsEventID = (NSString *)v11;
  }
  return v10;
}

- (void)processResponse
{
  v10 = objc_alloc_init(WLKDictionaryResponseProcessor);
  if (self->_statsID)
  {
    [(WLKDictionaryResponseProcessor *)v10 setObjectClass:objc_opt_class()];
    v3 = [(WLKNetworkRequestOperation *)self data];
    v4 = [(WLKDictionaryResponseProcessor *)v10 processResponseData:v3 error:0];

    v5 = [WLKCanonicalPlayablesResponse alloc];
    id v6 = [v4 dictionary];
    id v7 = [(WLKCanonicalPlayablesResponse *)v5 initWithSiriResponse:v6 statsID:self->_statsID];
    response = self->_response;
    self->_response = v7;
  }
  else
  {
    [(WLKDictionaryResponseProcessor *)v10 setObjectClass:objc_opt_class()];
    v4 = [(WLKNetworkRequestOperation *)self data];
    v9 = [(WLKDictionaryResponseProcessor *)v10 processResponseData:v4 error:0];
    id v6 = self->_response;
    self->_response = v9;
  }
}

- (NSString)statsID
{
  return self->_statsID;
}

- (NSString)sportsEventID
{
  return self->_sportsEventID;
}

- (WLKCanonicalPlayablesResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_sportsEventID, 0);

  objc_storeStrong((id *)&self->_statsID, 0);
}

@end