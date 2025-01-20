@interface WLKTopShelfUpNextRequestOperation
- (WLKContinueWatchingResponse)response;
- (WLKTopShelfUpNextRequestOperation)init;
- (WLKTopShelfUpNextRequestOperation)initWithQueryParameters:(id)a3 options:(int64_t)a4;
- (void)processResponse;
- (void)setResponse:(id)a3;
@end

@implementation WLKTopShelfUpNextRequestOperation

- (WLKTopShelfUpNextRequestOperation)init
{
  return [(WLKTopShelfUpNextRequestOperation *)self initWithQueryParameters:0 options:1];
}

- (WLKTopShelfUpNextRequestOperation)initWithQueryParameters:(id)a3 options:(int64_t)a4
{
  v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithDouble:15.0];
  v9 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"watchlist/topShelf" queryParameters:v7 httpMethod:0 headers:0 caller:0 timeout:v8 options:a4 clientProtocolVersion:&unk_1F13D9800];

  v12.receiver = self;
  v12.super_class = (Class)WLKTopShelfUpNextRequestOperation;
  v10 = [(WLKUTSNetworkRequestOperation *)&v12 initWithRequestProperties:v9];

  return v10;
}

- (void)processResponse
{
  v5 = objc_alloc_init(WLKDictionaryResponseProcessor);
  [(WLKDictionaryResponseProcessor *)v5 setObjectClass:objc_opt_class()];
  v3 = [(WLKNetworkRequestOperation *)self data];
  v4 = [(WLKDictionaryResponseProcessor *)v5 processResponseData:v3 error:0];
  [(WLKTopShelfUpNextRequestOperation *)self setResponse:v4];
}

- (WLKContinueWatchingResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (void).cxx_destruct
{
}

@end