@interface WLKPlayActivityDecorateLiveOperation
- (NSString)channelID;
- (NSString)serviceID;
- (WLKPlayActivityDecorateLiveOperation)initWithChannelID:(id)a3 serviceID:(id)a4;
@end

@implementation WLKPlayActivityDecorateLiveOperation

- (WLKPlayActivityDecorateLiveOperation)initWithChannelID:(id)a3 serviceID:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    -[WLKPlayActivityDecorateLiveOperation initWithChannelID:serviceID:]();
  }
  v8 = v7;
  if (!v7) {
    -[WLKPlayActivityDecorateLiveOperation initWithChannelID:serviceID:]();
  }
  v18[0] = @"brandId";
  v18[1] = @"externalServiceId";
  v19[0] = v6;
  v19[1] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  v10 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"contents/play-metadata/live" queryParameters:v9 httpMethod:0 headers:0 caller:0 timeout:0 apiVersion:&unk_1F13D97D0 options:0];

  v17.receiver = self;
  v17.super_class = (Class)WLKPlayActivityDecorateLiveOperation;
  v11 = [(WLKUTSNetworkRequestOperation *)&v17 initWithRequestProperties:v10];
  if (v11)
  {
    uint64_t v12 = [v6 copy];
    channelID = v11->_channelID;
    v11->_channelID = (NSString *)v12;

    uint64_t v14 = [v8 copy];
    serviceID = v11->_serviceID;
    v11->_serviceID = (NSString *)v14;
  }
  return v11;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceID, 0);

  objc_storeStrong((id *)&self->_channelID, 0);
}

- (void)initWithChannelID:serviceID:.cold.1()
{
  __assert_rtn("-[WLKPlayActivityDecorateLiveOperation initWithChannelID:serviceID:]", "WLKPlayActivityDecorateLiveOperation.m", 27, "channelID != nil");
}

- (void)initWithChannelID:serviceID:.cold.2()
{
  __assert_rtn("-[WLKPlayActivityDecorateLiveOperation initWithChannelID:serviceID:]", "WLKPlayActivityDecorateLiveOperation.m", 28, "serviceID != nil");
}

@end