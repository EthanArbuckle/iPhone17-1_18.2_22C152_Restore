@interface WLKChannelLookupOperation
- (WLKChannelLookupOperation)initWithAdamId:(id)a3;
- (WLKChannelResponse)channelResponse;
- (void)processResponse;
- (void)setChannelResponse:(id)a3;
@end

@implementation WLKChannelLookupOperation

- (WLKChannelLookupOperation)initWithAdamId:(id)a3
{
  v4 = [NSString stringWithFormat:@"/%@/%@", @"channels", a3];
  v5 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:v4 queryParameters:0 httpMethod:0 headers:0 caller:0 timeout:0 apiVersion:&unk_1F13D9758 options:0];
  v8.receiver = self;
  v8.super_class = (Class)WLKChannelLookupOperation;
  v6 = [(WLKUTSNetworkRequestOperation *)&v8 initWithRequestProperties:v5];

  return v6;
}

- (void)processResponse
{
  v3 = [(WLKUTSNetworkRequestOperation *)self responseDictionary];
  if (v3)
  {
    id v7 = v3;
    v4 = objc_msgSend(v3, "wlk_numberForKey:", @"expirationInSeconds");
    if (v4
      || ([(WLKNetworkRequestOperation *)self httpHeaderMaxAge],
          (v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", (double)(unint64_t)objc_msgSend(v4, "unsignedIntegerValue"));
    }
    else
    {
      v5 = 0;
    }
    v6 = [[WLKChannelResponse alloc] initWithDictionary:v7 expirationDate:v5 environmentHash:[(WLKUTSNetworkRequestOperation *)self environmentHash]];
    [(WLKChannelLookupOperation *)self setChannelResponse:v6];

    v3 = v7;
  }
}

- (WLKChannelResponse)channelResponse
{
  return self->_channelResponse;
}

- (void)setChannelResponse:(id)a3
{
}

- (void).cxx_destruct
{
}

@end