@interface WLKPlayActivityDecorateVODOperation
+ (id)identifierForPlayActivityID:(id)a3 channelID:(id)a4 duration:(id)a5;
- (NSArray)playActivityIdentifiers;
- (NSDictionary)metadataByIdentifier;
- (WLKPlayActivityDecorateVODOperation)initWithExternalId:(id)a3 brandId:(id)a4 hlsAssetDuration:(id)a5;
- (void)processResponse;
@end

@implementation WLKPlayActivityDecorateVODOperation

+ (id)identifierForPlayActivityID:(id)a3 channelID:(id)a4 duration:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 length] && objc_msgSend(v8, "length"))
  {
    v10 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
    v11 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v10];

    v12 = [NSString stringWithFormat:@"%@:%@", v8, v11];
    if ([v9 integerValue] >= 1)
    {
      [v9 doubleValue];
      uint64_t v14 = objc_msgSend(v12, "stringByAppendingFormat:", @":%.0f", v13 * 1000.0);

      v12 = (void *)v14;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WLKPlayActivityDecorateVODOperation)initWithExternalId:(id)a3 brandId:(id)a4 hlsAssetDuration:(id)a5
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    -[WLKPlayActivityDecorateVODOperation initWithExternalId:brandId:hlsAssetDuration:]();
  }
  if (!v9) {
    -[WLKPlayActivityDecorateVODOperation initWithExternalId:brandId:hlsAssetDuration:]();
  }
  v11 = v10;
  if (!v10) {
    -[WLKPlayActivityDecorateVODOperation initWithExternalId:brandId:hlsAssetDuration:]();
  }
  v12 = [(id)objc_opt_class() identifierForPlayActivityID:v8 channelID:v9 duration:v10];
  compoundId = self->_compoundId;
  self->_compoundId = v12;

  v20[0] = @"externalId";
  v20[1] = @"brandId";
  v21[0] = v8;
  v21[1] = v9;
  v20[2] = @"hlsAssetDuration";
  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v11, "integerValue"));
  v21[2] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];

  v16 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"contents/play-metadata/vod" queryParameters:v15 httpMethod:0 headers:0 caller:0 timeout:0 apiVersion:&unk_1F13D9770 options:0];
  v19.receiver = self;
  v19.super_class = (Class)WLKPlayActivityDecorateVODOperation;
  v17 = [(WLKUTSNetworkRequestOperation *)&v19 initWithRequestProperties:v16];

  return v17;
}

- (void)processResponse
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = [(WLKUTSNetworkRequestOperation *)self responseDictionary];
  if (v3)
  {
    v4 = [[WLKPlayActivityMetadata alloc] initWithDictionary:v3];
    v5 = v4;
    if (self->_compoundId)
    {
      if (v4)
      {
        compoundId = self->_compoundId;
        v9[0] = v4;
        v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&compoundId count:1];
        metadataByIdentifier = self->_metadataByIdentifier;
        self->_metadataByIdentifier = v6;
      }
      else
      {
        NSLog(&cfstr_Wlkplayactivit_2.isa);
      }
    }
    else
    {
      NSLog(&cfstr_Wlkplayactivit_1.isa);
    }
  }
}

- (NSArray)playActivityIdentifiers
{
  return self->_playActivityIdentifiers;
}

- (NSDictionary)metadataByIdentifier
{
  return self->_metadataByIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataByIdentifier, 0);
  objc_storeStrong((id *)&self->_playActivityIdentifiers, 0);

  objc_storeStrong((id *)&self->_compoundId, 0);
}

- (void)initWithExternalId:brandId:hlsAssetDuration:.cold.1()
{
  __assert_rtn("-[WLKPlayActivityDecorateVODOperation initWithExternalId:brandId:hlsAssetDuration:]", "WLKPlayActivityDecorateVODOperation.m", 52, "externalId != nil");
}

- (void)initWithExternalId:brandId:hlsAssetDuration:.cold.2()
{
  __assert_rtn("-[WLKPlayActivityDecorateVODOperation initWithExternalId:brandId:hlsAssetDuration:]", "WLKPlayActivityDecorateVODOperation.m", 53, "brandId != nil");
}

- (void)initWithExternalId:brandId:hlsAssetDuration:.cold.3()
{
  __assert_rtn("-[WLKPlayActivityDecorateVODOperation initWithExternalId:brandId:hlsAssetDuration:]", "WLKPlayActivityDecorateVODOperation.m", 54, "hlsAssetDuration != nil");
}

@end