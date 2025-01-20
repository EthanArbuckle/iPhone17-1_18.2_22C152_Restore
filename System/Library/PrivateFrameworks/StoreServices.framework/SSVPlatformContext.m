@interface SSVPlatformContext
- (NSArray)signedHeaders;
- (NSArray)signedQueryParameters;
- (NSDictionary)bagDictionary;
- (NSString)lookupURLString;
- (NSString)unpersonalizedLookupURLString;
- (SSVPlatformContext)initWithBagDictionary:(id)a3;
- (SSVPlatformContext)initWithLookupURL:(id)a3 unpersonalizedLookupURL:(id)a4 signedHeaders:(id)a5 signedQueryParameters:(id)a6;
- (SSVSAPContext)SAPContext;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setSAPContext:(id)a3;
@end

@implementation SSVPlatformContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unpersonalizedLookupURLString, 0);
  objc_storeStrong((id *)&self->_signedQueryParameters, 0);
  objc_storeStrong((id *)&self->_signedHeaders, 0);
  objc_storeStrong((id *)&self->_sapContext, 0);
  objc_storeStrong((id *)&self->_lookupURLString, 0);
}

- (SSVPlatformContext)initWithBagDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SSVPlatformContext;
  v5 = [(SSVPlatformContext *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"storeplatform-lookup-url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 copy];
      lookupURLString = v5->_lookupURLString;
      v5->_lookupURLString = (NSString *)v7;

      v9 = [v4 objectForKey:@"storeplatform-lookup-url-unpersonalized"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v9 copy];
        unpersonalizedLookupURLString = v5->_unpersonalizedLookupURLString;
        v5->_unpersonalizedLookupURLString = (NSString *)v10;
      }
      v12 = [v4 objectForKey:@"signed-actions"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [v12 objectForKey:@"MZStorePlatform"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v14 = [v13 objectForKey:@"lookup"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v15 = [v14 objectForKey:@"fields"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v16 = [v15 copy];
              signedQueryParameters = v5->_signedQueryParameters;
              v5->_signedQueryParameters = (NSArray *)v16;
            }
            v18 = [v14 objectForKey:@"headers"];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v19 = [v18 copy];
              signedHeaders = v5->_signedHeaders;
              v5->_signedHeaders = (NSArray *)v19;
            }
          }
        }
      }
    }
    else
    {
      v12 = v5;
      v9 = v6;
      v5 = 0;
    }
  }
  return v5;
}

- (SSVPlatformContext)initWithLookupURL:(id)a3 unpersonalizedLookupURL:(id)a4 signedHeaders:(id)a5 signedQueryParameters:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    v25.receiver = self;
    v25.super_class = (Class)SSVPlatformContext;
    v14 = [(SSVPlatformContext *)&v25 init];
    if (v14)
    {
      uint64_t v15 = [v10 absoluteString];
      lookupURLString = v14->_lookupURLString;
      v14->_lookupURLString = (NSString *)v15;

      uint64_t v17 = [v12 copy];
      signedHeaders = v14->_signedHeaders;
      v14->_signedHeaders = (NSArray *)v17;

      uint64_t v19 = [v13 copy];
      signedQueryParameters = v14->_signedQueryParameters;
      v14->_signedQueryParameters = (NSArray *)v19;

      uint64_t v21 = [v11 absoluteString];
      unpersonalizedLookupURLString = v14->_unpersonalizedLookupURLString;
      v14->_unpersonalizedLookupURLString = (NSString *)v21;
    }
    self = v14;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (NSDictionary)bagDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  lookupURLString = self->_lookupURLString;
  if (lookupURLString) {
    [v3 setObject:lookupURLString forKey:@"storeplatform-lookup-url"];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = v6;
  signedHeaders = self->_signedHeaders;
  if (signedHeaders) {
    [v6 setObject:signedHeaders forKey:@"headers"];
  }
  signedQueryParameters = self->_signedQueryParameters;
  if (signedQueryParameters) {
    [v7 setObject:signedQueryParameters forKey:@"fields"];
  }
  if ([v7 count])
  {
    id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"lookup", 0);
    id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v10, @"MZStorePlatform", 0);
    [v4 setObject:v11 forKey:@"signed-actions"];
  }
  return (NSDictionary *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_lookupURLString copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  objc_storeStrong((id *)(v5 + 16), self->_sapContext);
  uint64_t v8 = [(NSArray *)self->_signedHeaders copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSArray *)self->_signedQueryParameters copyWithZone:a3];
  id v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSString *)self->_unpersonalizedLookupURLString copyWithZone:a3];
  id v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  return (id)v5;
}

- (NSString)lookupURLString
{
  return self->_lookupURLString;
}

- (SSVSAPContext)SAPContext
{
  return self->_sapContext;
}

- (void)setSAPContext:(id)a3
{
}

- (NSArray)signedHeaders
{
  return self->_signedHeaders;
}

- (NSArray)signedQueryParameters
{
  return self->_signedQueryParameters;
}

- (NSString)unpersonalizedLookupURLString
{
  return self->_unpersonalizedLookupURLString;
}

@end