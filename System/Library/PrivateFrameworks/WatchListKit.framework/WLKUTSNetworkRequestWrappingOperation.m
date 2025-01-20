@interface WLKUTSNetworkRequestWrappingOperation
- (WLKUTSNetworkRequestOperation)underlyingOperation;
- (WLKUTSNetworkRequestWrappingOperation)initWithRequestProperties:(id)a3 underlyingOperation:(id)a4;
- (id)data;
- (id)error;
- (id)httpResponse;
- (id)responseDictionary;
- (int64_t)resourceFetchType;
- (int64_t)responseStatusCode;
- (void)setUnderlyingOperation:(id)a3;
@end

@implementation WLKUTSNetworkRequestWrappingOperation

- (WLKUTSNetworkRequestWrappingOperation)initWithRequestProperties:(id)a3 underlyingOperation:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WLKUTSNetworkRequestWrappingOperation;
  v8 = [(WLKUTSNetworkRequestOperation *)&v11 initWithRequestProperties:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_underlyingOperation, a4);
    [(WLKUTSNetworkRequestWrappingOperation *)v9 addDependency:v7];
  }

  return v9;
}

- (id)httpResponse
{
  v2 = [(WLKUTSNetworkRequestWrappingOperation *)self underlyingOperation];
  v3 = [v2 httpResponse];

  return v3;
}

- (int64_t)responseStatusCode
{
  v2 = [(WLKUTSNetworkRequestWrappingOperation *)self underlyingOperation];
  int64_t v3 = [v2 responseStatusCode];

  return v3;
}

- (id)data
{
  v2 = [(WLKUTSNetworkRequestWrappingOperation *)self underlyingOperation];
  int64_t v3 = [v2 data];

  return v3;
}

- (id)error
{
  v2 = [(WLKUTSNetworkRequestWrappingOperation *)self underlyingOperation];
  int64_t v3 = [v2 error];

  return v3;
}

- (int64_t)resourceFetchType
{
  v2 = [(WLKUTSNetworkRequestWrappingOperation *)self underlyingOperation];
  int64_t v3 = [v2 resourceFetchType];

  return v3;
}

- (id)responseDictionary
{
  v2 = [(WLKUTSNetworkRequestWrappingOperation *)self underlyingOperation];
  int64_t v3 = [v2 responseDictionary];

  return v3;
}

- (WLKUTSNetworkRequestOperation)underlyingOperation
{
  return self->_underlyingOperation;
}

- (void)setUnderlyingOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end