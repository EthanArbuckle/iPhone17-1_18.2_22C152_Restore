@interface JSAPostReviewRequest
- (NSDictionary)metadata;
- (id)_httpBody;
- (void)send;
- (void)setMetadata:(id)a3;
@end

@implementation JSAPostReviewRequest

- (void)send
{
  v3 = [(NSDictionary *)self->metadata objectForKeyedSubscript:@"submitURL"];

  if (v3)
  {
    v4 = [(NSDictionary *)self->metadata objectForKeyedSubscript:@"submitURL"];
    [(JSAStoreHTTPRequest *)self setUrl:v4];

    v5 = [(JSAPostReviewRequest *)self _httpBody];
    [(JSAStoreHTTPRequest *)self setBody:v5];

    [(JSAStoreHTTPRequest *)self setMethod:@"POST"];
    v9.receiver = self;
    v9.super_class = (Class)JSAPostReviewRequest;
    [(JSAStoreHTTPRequest *)&v9 send];
  }
  else
  {
    v6 = [(JSAStoreHTTPRequest *)self onResponse];

    if (v6)
    {
      id v8 = +[JSABridge sharedInstance];
      v7 = [(JSAStoreHTTPRequest *)self onResponse];
      [v8 enqueueValueCall:v7 arguments:&off_B9BE0 file:@"JSAPostReviewRequest.m" line:49];
    }
  }
}

- (id)_httpBody
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(NSDictionary *)self->metadata objectForKeyedSubscript:@"rating"];

  if (v4)
  {
    objc_opt_class();
    v5 = [(NSDictionary *)self->metadata objectForKeyedSubscript:@"rating"];
    v6 = BUDynamicCast();

    if (v6)
    {
      objc_opt_class();
      v7 = [(NSDictionary *)self->metadata objectForKeyedSubscript:@"rating"];
      id v8 = BUDynamicCast();

      [v8 floatValue];
      float v10 = v9;
    }
    else
    {
      objc_opt_class();
      v11 = [(NSDictionary *)self->metadata objectForKeyedSubscript:@"rating"];
      v12 = BUDynamicCast();

      if (!v12)
      {
        float v10 = 0.0;
        goto LABEL_7;
      }
      objc_opt_class();
      id v8 = [(NSDictionary *)self->metadata objectForKeyedSubscript:@"rating"];
      v13 = BUDynamicCast();
      [v13 floatValue];
      float v10 = v14;
    }
LABEL_7:
    v15 = +[NSString stringWithFormat:@"%.2f", v10];
    [v3 setObject:v15 forKey:@"rating"];
  }
  v16 = [(NSDictionary *)self->metadata objectForKeyedSubscript:@"body"];

  if (v16)
  {
    objc_opt_class();
    v17 = [(NSDictionary *)self->metadata objectForKeyedSubscript:@"body"];
    v18 = BUDynamicCast();

    if ([v18 length]) {
      [v3 setObject:v18 forKey:@"body"];
    }
  }
  v19 = +[AMSDevice deviceGUID];

  if (v19)
  {
    v20 = +[AMSDevice deviceGUID];
    if (v20) {
      [v3 setObject:v20 forKey:@"guid"];
    }
  }
  v21 = [(NSDictionary *)self->metadata objectForKeyedSubscript:@"nickname"];

  if (v21)
  {
    objc_opt_class();
    v22 = [(NSDictionary *)self->metadata objectForKeyedSubscript:@"nickname"];
    v23 = BUDynamicCast();

    if ([v23 length]) {
      [v3 setObject:v23 forKey:@"nickname"];
    }
  }
  v24 = [(NSDictionary *)self->metadata objectForKeyedSubscript:@"title"];

  if (v24)
  {
    objc_opt_class();
    v25 = [(NSDictionary *)self->metadata objectForKeyedSubscript:@"title"];
    v26 = BUDynamicCast();

    if ([v26 length]) {
      [v3 setObject:v26 forKey:@"title"];
    }
  }
  v27 = +[NSURL jsa_queryStringForParameters:v3 escapedValues:1];

  return v27;
}

- (NSDictionary)metadata
{
  return self->metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end