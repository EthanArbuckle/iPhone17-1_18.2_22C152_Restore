@interface WLKCanonicalPlayablesRequestOperation
- (NSString)contentID;
- (WLKCanonicalPlayablesRequestOperation)initWithContentID:(id)a3 caller:(id)a4 canonicalType:(int64_t)a5;
- (WLKCanonicalPlayablesRequestOperation)initWithContentID:(id)a3 caller:(id)a4 isMovie:(BOOL)a5;
- (WLKCanonicalPlayablesRequestOperation)initWithContentID:(id)a3 profiles:(id)a4 caller:(id)a5;
- (WLKCanonicalPlayablesResponse)response;
- (void)processResponse;
@end

@implementation WLKCanonicalPlayablesRequestOperation

- (WLKCanonicalPlayablesRequestOperation)initWithContentID:(id)a3 profiles:(id)a4 caller:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v11 = a5;
  id v12 = objc_alloc_init(v10);
  if ([v9 count])
  {
    v13 = [v9 componentsJoinedByString:@","];
    [v12 setObject:v13 forKey:@"profiles"];
  }
  v14 = [@"view/product/{id}/personalized" stringByReplacingOccurrencesOfString:@"{id}" withString:v8];
  v15 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:v14 queryParameters:v12 httpMethod:0 caller:v11];

  v20.receiver = self;
  v20.super_class = (Class)WLKCanonicalPlayablesRequestOperation;
  v16 = [(WLKUTSNetworkRequestOperation *)&v20 initWithRequestProperties:v15];
  if (v16)
  {
    uint64_t v17 = [v8 copy];
    contentID = v16->_contentID;
    v16->_contentID = (NSString *)v17;
  }
  return v16;
}

- (WLKCanonicalPlayablesRequestOperation)initWithContentID:(id)a3 caller:(id)a4 isMovie:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    v10 = @"/movies/{movieId}";
    id v11 = @"{movieId}";
  }
  else
  {
    v10 = @"/shows/{showId}";
    id v11 = @"{showId}";
  }
  id v12 = [(__CFString *)v10 stringByReplacingOccurrencesOfString:v11 withString:v8];
  v13 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:v12 queryParameters:&unk_1F13D9A80 httpMethod:@"GET" httpBody:0 headers:0 caller:v9 timeout:0 apiVersion:&unk_1F13D98C0 options:0];
  v18.receiver = self;
  v18.super_class = (Class)WLKCanonicalPlayablesRequestOperation;
  v14 = [(WLKUTSNetworkRequestOperation *)&v18 initWithRequestProperties:v13];
  if (v14)
  {
    uint64_t v15 = [v8 copy];
    contentID = v14->_contentID;
    v14->_contentID = (NSString *)v15;
  }
  return v14;
}

- (WLKCanonicalPlayablesRequestOperation)initWithContentID:(id)a3 caller:(id)a4 canonicalType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  switch(a5)
  {
    case 0:
      v10 = @"/shows/{showId}";
      id v11 = @"{showId}";
      goto LABEL_7;
    case 1:
      v10 = @"/movies/{movieId}";
      id v11 = @"{movieId}";
      goto LABEL_7;
    case 2:
      v10 = @"/sporting-events/{sportingEventId}";
      id v11 = @"{sportingEventId}";
      goto LABEL_7;
    case 3:
      v10 = @"/episodes/{episodeId}";
      id v11 = @"{episodeId}";
LABEL_7:
      id v12 = [(__CFString *)v10 stringByReplacingOccurrencesOfString:v11 withString:v8];
      break;
    default:
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid canonical type."];
      id v12 = 0;
      break;
  }
  v13 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:v12 queryParameters:&unk_1F13D9AA8 httpMethod:@"GET" httpBody:0 headers:0 caller:v9 timeout:0 apiVersion:&unk_1F13D98C0 options:0];
  v18.receiver = self;
  v18.super_class = (Class)WLKCanonicalPlayablesRequestOperation;
  v14 = [(WLKUTSNetworkRequestOperation *)&v18 initWithRequestProperties:v13];
  if (v14)
  {
    uint64_t v15 = [v8 copy];
    contentID = v14->_contentID;
    v14->_contentID = (NSString *)v15;
  }
  return v14;
}

- (void)processResponse
{
  v6 = objc_alloc_init(WLKDictionaryResponseProcessor);
  [(WLKDictionaryResponseProcessor *)v6 setObjectClass:objc_opt_class()];
  v3 = [(WLKNetworkRequestOperation *)self data];
  v4 = [(WLKDictionaryResponseProcessor *)v6 processResponseData:v3 error:0];
  response = self->_response;
  self->_response = v4;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (WLKCanonicalPlayablesResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_contentID, 0);
}

@end