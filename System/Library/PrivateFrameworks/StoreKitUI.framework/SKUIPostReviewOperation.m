@interface SKUIPostReviewOperation
- (NSDictionary)responseDictionary;
- (SKUIPostReviewOperation)initWithReviewMetadata:(id)a3;
- (id)_httpBody;
- (void)run;
@end

@implementation SKUIPostReviewOperation

- (SKUIPostReviewOperation)initWithReviewMetadata:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIPostReviewOperation;
  v5 = [(SKUIPostReviewOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    review = v5->_review;
    v5->_review = (SKUIReviewMetadata *)v6;
  }
  return v5;
}

- (NSDictionary)responseDictionary
{
  [(SKUIPostReviewOperation *)self lock];
  v3 = self->_responseDictionary;
  [(SKUIPostReviewOperation *)self unlock];

  return v3;
}

- (void)run
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB8858]);
  id v4 = objc_alloc(MEMORY[0x1E4FA8268]);
  v5 = [(SKUIReviewMetadata *)self->_review submitURL];
  uint64_t v6 = (void *)[v4 initWithURL:v5];

  [v6 setAllowedRetryCount:0];
  [v6 setCachePolicy:1];
  v7 = [(SKUIPostReviewOperation *)self _httpBody];
  [v6 setHTTPBody:v7];

  [v6 setHTTPMethod:@"POST"];
  [v3 setRequestProperties:v6];
  v8 = [MEMORY[0x1E4FB8848] provider];
  [v8 setShouldProcessDialogs:0];
  [v3 setDataProvider:v8];
  id v16 = 0;
  int v9 = [(SKUIPostReviewOperation *)self runSubOperation:v3 returningError:&v16];
  id v10 = v16;
  BOOL v11 = 0;
  if (v9)
  {
    v12 = [v8 output];
    v13 = [v12 objectForKey:@"status-code"];
    objc_opt_class();
    BOOL v11 = (objc_opt_isKindOfClass() & 1) != 0 && [v13 integerValue] == 3200;
    [(SKUIPostReviewOperation *)self lock];
    v14 = (NSDictionary *)[v12 copy];
    responseDictionary = self->_responseDictionary;
    self->_responseDictionary = v14;

    [(SKUIPostReviewOperation *)self unlock];
  }
  [(SKUIPostReviewOperation *)self setError:v10];
  [(SKUIPostReviewOperation *)self setSuccess:v11];
}

- (id)_httpBody
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = NSString;
  [(SKUIReviewMetadata *)self->_review rating];
  uint64_t v6 = [v4 stringWithFormat:@"%.2f", v5];
  [v3 setObject:v6 forKey:@"rating"];

  v7 = [(SKUIReviewMetadata *)self->_review body];
  if ([v7 length]) {
    [v3 setObject:v7 forKey:@"body"];
  }
  v8 = [MEMORY[0x1E4FB8800] sharedInstance];
  int v9 = [v8 guid];

  if (v9) {
    [v3 setObject:v9 forKey:@"guid"];
  }
  id v10 = [(SKUIReviewMetadata *)self->_review nickname];

  if ([v10 length]) {
    [v3 setObject:v10 forKey:@"nickname"];
  }
  BOOL v11 = [(SKUIReviewMetadata *)self->_review title];

  if ([v11 length]) {
    [v3 setObject:v11 forKey:@"title"];
  }
  v12 = [MEMORY[0x1E4F1CB10] queryStringForDictionary:v3 escapedValues:1];
  v13 = [v12 dataUsingEncoding:4];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_review, 0);

  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end