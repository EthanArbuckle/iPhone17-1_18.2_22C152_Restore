@interface WLKBasicContentRequestOperation
- (NSArray)contentIDs;
- (WLKBasicContentMetadata)basicContentMetadata;
- (WLKBasicContentRequestOperation)initWithContentID:(id)a3 caller:(id)a4;
- (WLKBasicContentRequestOperation)initWithContentIDs:(id)a3 caller:(id)a4;
- (WLKBasicContentRequestResponse)response;
- (void)processResponse;
@end

@implementation WLKBasicContentRequestOperation

- (WLKBasicContentRequestOperation)initWithContentID:(id)a3 caller:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v12 count:1];

  v10 = -[WLKBasicContentRequestOperation initWithContentIDs:caller:](self, "initWithContentIDs:caller:", v9, v7, v12, v13);
  return v10;
}

- (WLKBasicContentRequestOperation)initWithContentIDs:(id)a3 caller:(id)a4
{
  id v6 = a3;
  id v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  v10 = [v6 componentsJoinedByString:@","];
  [v9 setObject:v10 forKey:@"ids"];

  v11 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"content/get" queryParameters:v9 httpMethod:0 caller:v8];

  v16.receiver = self;
  v16.super_class = (Class)WLKBasicContentRequestOperation;
  id v12 = [(WLKUTSNetworkRequestOperation *)&v16 initWithRequestProperties:v11];
  if (v12)
  {
    uint64_t v13 = [v6 copy];
    contentIDs = v12->_contentIDs;
    v12->_contentIDs = (NSArray *)v13;
  }
  return v12;
}

- (void)processResponse
{
  id v6 = objc_alloc_init(WLKDictionaryResponseProcessor);
  [(WLKDictionaryResponseProcessor *)v6 setObjectClass:objc_opt_class()];
  v3 = [(WLKNetworkRequestOperation *)self data];
  v4 = [(WLKDictionaryResponseProcessor *)v6 processResponseData:v3 error:0];
  response = self->_response;
  self->_response = v4;
}

- (WLKBasicContentMetadata)basicContentMetadata
{
  v2 = [(WLKBasicContentRequestOperation *)self response];
  v3 = [v2 items];
  v4 = [v3 firstObject];

  return (WLKBasicContentMetadata *)v4;
}

- (NSArray)contentIDs
{
  return self->_contentIDs;
}

- (WLKBasicContentRequestResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_contentIDs, 0);
}

@end