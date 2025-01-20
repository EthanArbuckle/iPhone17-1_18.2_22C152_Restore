@interface SUUIReportAConcernOperation
- (NSDictionary)responseDictionary;
- (SUUIReportAConcernMetadata)metadata;
- (SUUIReportAConcernOperation)initWithMetadata:(id)a3;
- (id)_httpBody;
- (void)run;
- (void)setMetadata:(id)a3;
- (void)setResponseDictionary:(id)a3;
@end

@implementation SUUIReportAConcernOperation

- (SUUIReportAConcernOperation)initWithMetadata:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIReportAConcernOperation;
  v6 = [(SUUIReportAConcernOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_metadata, a3);
  }

  return v7;
}

- (void)run
{
  id v3 = objc_alloc_init(MEMORY[0x263F89528]);
  v4 = [(SUUIReportAConcernOperation *)self metadata];
  id v5 = [v4 reportConcernURL];

  v6 = (void *)[objc_alloc(MEMORY[0x263F7B290]) initWithURL:v5];
  [v6 setAllowedRetryCount:0];
  [v6 setCachePolicy:1];
  v7 = [(SUUIReportAConcernOperation *)self _httpBody];
  [v6 setHTTPBody:v7];

  [v6 setHTTPMethod:@"POST"];
  [v3 setRequestProperties:v6];
  v8 = [MEMORY[0x263F89500] provider];
  [v8 setShouldProcessDialogs:0];
  [v3 setDataProvider:v8];
  id v14 = 0;
  int v9 = [(SUUIReportAConcernOperation *)self runSubOperation:v3 returningError:&v14];
  id v10 = v14;
  BOOL v11 = 0;
  if (v9)
  {
    v12 = [v8 output];
    v13 = [v12 objectForKey:@"status-code"];
    objc_opt_class();
    BOOL v11 = (objc_opt_isKindOfClass() & 1) != 0 && [v13 integerValue] == 3200;
    [(SUUIReportAConcernOperation *)self setResponseDictionary:v12];
  }
  [(SUUIReportAConcernOperation *)self setError:v10];
  [(SUUIReportAConcernOperation *)self setSuccess:v11];
}

- (id)_httpBody
{
  v2 = [(SUUIReportAConcernOperation *)self metadata];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v2, "itemIdentifier"));
  [v3 setObject:v4 forKey:@"userReviewId"];

  id v5 = [v2 selectedReason];
  v6 = [v5 reasonID];

  v7 = [v6 stringValue];
  uint64_t v8 = [v7 length];

  if (v8) {
    [v3 setObject:v6 forKey:@"selectedReson"];
  }
  int v9 = [v2 details];
  if ([v9 length]) {
    [v3 setObject:v9 forKey:@"explanation"];
  }
  id v10 = [MEMORY[0x263F89480] sharedInstance];
  BOOL v11 = [v10 guid];

  if (v11) {
    [v3 setObject:v11 forKey:@"guid"];
  }
  v12 = [NSURL queryStringForDictionary:v3 escapedValues:1];
  v13 = [v12 dataUsingEncoding:4];

  return v13;
}

- (NSDictionary)responseDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 336, 1);
}

- (void)setResponseDictionary:(id)a3
{
}

- (SUUIReportAConcernMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end