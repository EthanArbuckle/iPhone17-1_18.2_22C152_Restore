@interface WLKPlayActivityDecorateEBSOperation
- (NSString)channelID;
- (NSString)externalContentID;
- (WLKPlayActivityDecorateEBSOperation)initWithChannelID:(id)a3 externalContentID:(id)a4;
@end

@implementation WLKPlayActivityDecorateEBSOperation

- (WLKPlayActivityDecorateEBSOperation)initWithChannelID:(id)a3 externalContentID:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    -[WLKPlayActivityDecorateEBSOperation initWithChannelID:externalContentID:]();
  }
  v8 = v7;
  if (!v7) {
    -[WLKPlayActivityDecorateEBSOperation initWithChannelID:externalContentID:]();
  }
  v18[0] = @"brandId";
  v18[1] = @"externalId";
  v19[0] = v6;
  v19[1] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  v10 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"contents/play-metadata/ebs" queryParameters:v9 httpMethod:0 headers:0 caller:0 timeout:0 apiVersion:&unk_1F13D97E8 options:0];

  v17.receiver = self;
  v17.super_class = (Class)WLKPlayActivityDecorateEBSOperation;
  v11 = [(WLKUTSNetworkRequestOperation *)&v17 initWithRequestProperties:v10];
  if (v11)
  {
    uint64_t v12 = [v6 copy];
    channelID = v11->_channelID;
    v11->_channelID = (NSString *)v12;

    uint64_t v14 = [v8 copy];
    externalContentID = v11->_externalContentID;
    v11->_externalContentID = (NSString *)v14;
  }
  return v11;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (NSString)externalContentID
{
  return self->_externalContentID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalContentID, 0);

  objc_storeStrong((id *)&self->_channelID, 0);
}

- (void)initWithChannelID:externalContentID:.cold.1()
{
  __assert_rtn("-[WLKPlayActivityDecorateEBSOperation initWithChannelID:externalContentID:]", "WLKPlayActivityDecorateEBSOperation.m", 26, "channelID != nil");
}

- (void)initWithChannelID:externalContentID:.cold.2()
{
  __assert_rtn("-[WLKPlayActivityDecorateEBSOperation initWithChannelID:externalContentID:]", "WLKPlayActivityDecorateEBSOperation.m", 27, "externalContentID != nil");
}

@end