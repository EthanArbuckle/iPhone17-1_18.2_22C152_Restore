@interface WLKContentPlayRequestOperation
- (NSString)canonicalID;
- (WLKContentPlayRequestOperation)initWithCanonicalID:(id)a3 caller:(id)a4;
- (WLKContentPlayResponse)response;
- (void)processResponse;
- (void)setResponse:(id)a3;
@end

@implementation WLKContentPlayRequestOperation

- (WLKContentPlayRequestOperation)initWithCanonicalID:(id)a3 caller:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [@"content/{id}/play" stringByReplacingOccurrencesOfString:@"{id}" withString:v6];
  v9 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:v8 queryParameters:0 httpMethod:0 headers:0 caller:v7 timeout:0 options:0];

  v14.receiver = self;
  v14.super_class = (Class)WLKContentPlayRequestOperation;
  v10 = [(WLKUTSNetworkRequestOperation *)&v14 initWithRequestProperties:v9];
  if (v10)
  {
    uint64_t v11 = [v6 copy];
    canonicalID = v10->_canonicalID;
    v10->_canonicalID = (NSString *)v11;
  }
  return v10;
}

- (void)processResponse
{
  v5 = objc_alloc_init(WLKDictionaryResponseProcessor);
  [(WLKDictionaryResponseProcessor *)v5 setObjectClass:objc_opt_class()];
  v3 = [(WLKNetworkRequestOperation *)self data];
  v4 = [(WLKDictionaryResponseProcessor *)v5 processResponseData:v3 error:0];

  [(WLKContentPlayRequestOperation *)self setResponse:v4];
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (WLKContentPlayResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_canonicalID, 0);
}

@end