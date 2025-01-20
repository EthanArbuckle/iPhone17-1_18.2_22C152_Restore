@interface WLKChannelsRequestOperation
- (BOOL)filtered;
- (NSString)caller;
- (WLKChannelsRequestOperation)initWithCaller:(id)a3;
- (WLKChannelsRequestOperation)initWithCaller:(id)a3 isFilteredByUserChannels:(BOOL)a4;
- (WLKChannelsResponse)channelsResponse;
- (void)processResponse;
- (void)setCaller:(id)a3;
- (void)setChannelsResponse:(id)a3;
- (void)setFiltered:(BOOL)a3;
@end

@implementation WLKChannelsRequestOperation

- (WLKChannelsRequestOperation)initWithCaller:(id)a3
{
  return [(WLKChannelsRequestOperation *)self initWithCaller:a3 isFilteredByUserChannels:0];
}

- (WLKChannelsRequestOperation)initWithCaller:(id)a3 isFilteredByUserChannels:(BOOL)a4
{
  BOOL v4 = a4;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4) {
    v7 = @"true";
  }
  else {
    v7 = @"false";
  }
  v14 = @"filterByUserChannels";
  v15[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v9 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"channels" queryParameters:v8 httpMethod:0 headers:0 caller:v6 timeout:0 options:0];
  v13.receiver = self;
  v13.super_class = (Class)WLKChannelsRequestOperation;
  v10 = [(WLKUTSNetworkRequestOperation *)&v13 initWithRequestProperties:v9];
  v11 = v10;
  if (v10)
  {
    [(WLKChannelsRequestOperation *)v10 setCaller:v6];
    [(WLKChannelsRequestOperation *)v11 setFiltered:v4];
  }

  return v11;
}

- (void)processResponse
{
  v3 = [(WLKUTSNetworkRequestOperation *)self responseDictionary];
  if (v3)
  {
    id v7 = v3;
    BOOL v4 = objc_msgSend(v3, "wlk_numberForKey:", @"expirationInSeconds");
    if (v4
      || ([(WLKNetworkRequestOperation *)self httpHeaderMaxAge],
          (BOOL v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", (double)(unint64_t)objc_msgSend(v4, "unsignedIntegerValue"));
    }
    else
    {
      v5 = 0;
    }
    id v6 = [[WLKChannelsResponse alloc] initWithDictionary:v7 expirationDate:v5 environmentHash:[(WLKUTSNetworkRequestOperation *)self environmentHash] filtered:[(WLKChannelsRequestOperation *)self filtered]];
    [(WLKChannelsRequestOperation *)self setChannelsResponse:v6];

    v3 = v7;
  }
}

- (BOOL)filtered
{
  return self->_filtered;
}

- (void)setFiltered:(BOOL)a3
{
  self->_filtered = a3;
}

- (WLKChannelsResponse)channelsResponse
{
  return self->_channelsResponse;
}

- (void)setChannelsResponse:(id)a3
{
}

- (NSString)caller
{
  return self->_caller;
}

- (void)setCaller:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caller, 0);

  objc_storeStrong((id *)&self->_channelsResponse, 0);
}

@end