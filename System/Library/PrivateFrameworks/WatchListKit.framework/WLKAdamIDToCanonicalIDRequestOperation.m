@interface WLKAdamIDToCanonicalIDRequestOperation
- (NSString)adamId;
- (WLKAdamIDToCanonicalIDRequestOperation)initWithAdamId:(id)a3;
- (WLKAdamIDToCanonicalIDResponse)response;
- (void)processResponse;
- (void)setAdamId:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation WLKAdamIDToCanonicalIDRequestOperation

- (WLKAdamIDToCanonicalIDRequestOperation)initWithAdamId:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v6 = [v5 componentsJoinedByString:@","];

  v13 = @"ids";
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v8 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"contents/lookup" queryParameters:v7 httpMethod:0 headers:0 caller:0 timeout:0 apiVersion:&unk_1F13D98D8 options:0];
  v12.receiver = self;
  v12.super_class = (Class)WLKAdamIDToCanonicalIDRequestOperation;
  v9 = [(WLKUTSNetworkRequestOperation *)&v12 initWithRequestProperties:v8];
  v10 = v9;
  if (v9) {
    [(WLKAdamIDToCanonicalIDRequestOperation *)v9 setAdamId:v4];
  }

  return v10;
}

- (void)processResponse
{
  v3 = [(WLKUTSNetworkRequestOperation *)self responseDictionary];
  if (v3)
  {
    id v8 = v3;
    id v4 = objc_msgSend(v3, "wlk_dictionaryForKey:", @"content");
    if (v4)
    {
      v5 = [(WLKAdamIDToCanonicalIDRequestOperation *)self adamId];
      v6 = objc_msgSend(v4, "wlk_dictionaryForKey:", v5);

      if (v6)
      {
        v7 = [[WLKAdamIDToCanonicalIDResponse alloc] initWithDictionary:v6];
        [(WLKAdamIDToCanonicalIDRequestOperation *)self setResponse:v7];
      }
    }

    v3 = v8;
  }
}

- (WLKAdamIDToCanonicalIDResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (NSString)adamId
{
  return self->_adamId;
}

- (void)setAdamId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamId, 0);

  objc_storeStrong((id *)&self->_response, 0);
}

@end