@interface WLKTopShelfNetworkOperation
- (NSDictionary)payload;
- (WLKTopShelfNetworkOperation)initWithEndPoint:(id)a3 queryParameters:(id)a4 ignoreCache:(BOOL)a5;
- (void)processResponse;
@end

@implementation WLKTopShelfNetworkOperation

- (WLKTopShelfNetworkOperation)initWithEndPoint:(id)a3 queryParameters:(id)a4 ignoreCache:(BOOL)a5
{
  if (a5) {
    uint64_t v7 = 9;
  }
  else {
    uint64_t v7 = 1;
  }
  v8 = NSNumber;
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 numberWithDouble:15.0];
  v12 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:v10 queryParameters:v9 httpMethod:0 headers:0 caller:0 timeout:v11 apiVersion:&unk_1F13D9788 options:v7];

  v15.receiver = self;
  v15.super_class = (Class)WLKTopShelfNetworkOperation;
  v13 = [(WLKUTSNetworkRequestOperation *)&v15 initWithRequestProperties:v12];

  return v13;
}

- (void)processResponse
{
  self->_payload = [(WLKUTSNetworkRequestOperation *)self responseDictionary];

  MEMORY[0x1F41817F8]();
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
}

@end