@interface NMAPIRequest
+ (id)allSupportedItemProperties;
+ (id)allSupportedSectionProperties;
- (Class)responseParserClass;
- (NSURL)cacheURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4;
- (unint64_t)cachePolicy;
- (void)setCachePolicy:(unint64_t)a3;
- (void)setCacheURL:(id)a3;
- (void)setDefaultMusicRequestProperties;
- (void)setEditorialRequestProperties;
@end

@implementation NMAPIRequest

- (void)setDefaultMusicRequestProperties
{
  [(MPStoreModelRequest *)self setClientIdentifier:@"com.apple.NanoMusic"];
  [(MPStoreModelRequest *)self setClientVersion:@"1"];

  [(MPStoreModelRequest *)self setAuthenticationOptions:3];
}

- (void)setEditorialRequestProperties
{
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = [[NMAPIRequestOperation alloc] initWithRequest:self responseHandler:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NMAPIRequest;
  id v4 = [(MPStoreModelRequest *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    v4[14] = self->_cachePolicy;
    objc_storeStrong(v4 + 15, self->_cacheURL);
  }
  return v5;
}

- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = MusicURLComponentsWithURLBag(v6, 0);
  v8 = v7;
  if (v7)
  {
    [v7 setQueryItems:MEMORY[0x263EFFA68]];
    v9 = [(MPStoreModelRequest *)self clientPlatformIdentifier];

    if (v9)
    {
      v10 = [v8 queryItems];
      v11 = (void *)MEMORY[0x263F08BD0];
      v12 = [(MPStoreModelRequest *)self clientPlatformIdentifier];
      v13 = [v11 queryItemWithName:@"platform" value:v12];
      v14 = [v10 arrayByAddingObject:v13];
      [v8 setQueryItems:v14];
    }
    v15 = MusicURLQueryItemLanguageWithURLBag(v6);
    if (v15)
    {
      v16 = [v8 queryItems];
      v17 = [v16 arrayByAddingObject:v15];
      [v8 setQueryItems:v17];

      id v18 = v8;
    }
    else
    {
      v20 = NMLogForCategory(9);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[NMAPIRequest urlComponentsWithStoreURLBag:error:](v20);
      }

      if (a4)
      {
        [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7201 userInfo:0];
        id v18 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v18 = 0;
      }
    }
  }
  else
  {
    v19 = NMLogForCategory(9);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[NMAPIRequest urlComponentsWithStoreURLBag:error:](v19);
    }

    if (a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7201 userInfo:0];
      id v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v18 = 0;
    }
  }

  return v18;
}

- (Class)responseParserClass
{
  return (Class)objc_opt_class();
}

+ (id)allSupportedItemProperties
{
  v52[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v51 = *MEMORY[0x263F119D8];
  v3 = [MEMORY[0x263F122D8] allSupportedProperties];
  v52[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v52 forKeys:&v51 count:1];
  uint64_t v5 = MEMORY[0x263EFFA68];
  v39 = (void *)[v2 initWithProperties:MEMORY[0x263EFFA68] relationships:v4];

  id v6 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v49 = *MEMORY[0x263F11998];
  objc_super v7 = [MEMORY[0x263F122C0] allSupportedProperties];
  v50 = v7;
  v8 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
  v9 = (void *)[v6 initWithProperties:v5 relationships:v8];

  id v10 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v47 = *MEMORY[0x263F119A0];
  v11 = [MEMORY[0x263F122C8] allSupportedProperties];
  v48 = v11;
  v12 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
  v13 = (void *)[v10 initWithProperties:v5 relationships:v12];

  id v14 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v45 = *MEMORY[0x263F11A18];
  v15 = [MEMORY[0x263F122F0] allSupportedProperties];
  v46 = v15;
  v16 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  v17 = (void *)[v14 initWithProperties:v5 relationships:v16];

  id v18 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v43 = *MEMORY[0x263F119F8];
  v19 = [MEMORY[0x263F122E0] allSupportedProperties];
  v44 = v19;
  v20 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  v21 = (void *)[v18 initWithProperties:v5 relationships:v20];

  id v22 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v41 = *MEMORY[0x263F11A00];
  v23 = (void *)MEMORY[0x263F12180];
  uint64_t v24 = *MEMORY[0x263F11740];
  v40[0] = *MEMORY[0x263F11760];
  v40[1] = v24;
  uint64_t v25 = *MEMORY[0x263F11748];
  v40[2] = *MEMORY[0x263F11758];
  v40[3] = v25;
  uint64_t v26 = *MEMORY[0x263F11750];
  v40[4] = *MEMORY[0x263F11738];
  v40[5] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:6];
  v28 = [v23 propertySetWithProperties:v27];
  v42 = v28;
  v29 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  v30 = (void *)[v22 initWithProperties:v5 relationships:v29];

  v31 = [MEMORY[0x263F12180] emptyPropertySet];
  v32 = [v31 propertySetByCombiningWithPropertySet:v39];

  v33 = [v32 propertySetByCombiningWithPropertySet:v9];

  v34 = [v33 propertySetByCombiningWithPropertySet:v13];

  v35 = [v34 propertySetByCombiningWithPropertySet:v17];

  v36 = [v35 propertySetByCombiningWithPropertySet:v21];

  v37 = [v36 propertySetByCombiningWithPropertySet:v30];

  return v37;
}

+ (id)allSupportedSectionProperties
{
  v32[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v31 = *MEMORY[0x263F119D8];
  v3 = [MEMORY[0x263F122D8] allSupportedProperties];
  v32[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
  uint64_t v5 = MEMORY[0x263EFFA68];
  id v6 = (void *)[v2 initWithProperties:MEMORY[0x263EFFA68] relationships:v4];

  id v7 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v29 = *MEMORY[0x263F11998];
  v8 = [MEMORY[0x263F122C0] allSupportedProperties];
  v30 = v8;
  v9 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  id v10 = (void *)[v7 initWithProperties:v5 relationships:v9];

  id v11 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v27 = *MEMORY[0x263F119A0];
  v12 = [MEMORY[0x263F122C8] allSupportedProperties];
  v28 = v12;
  v13 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  id v14 = (void *)[v11 initWithProperties:v5 relationships:v13];

  id v15 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v25 = *MEMORY[0x263F119F8];
  v16 = [MEMORY[0x263F122E0] allSupportedProperties];
  uint64_t v26 = v16;
  v17 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  id v18 = (void *)[v15 initWithProperties:v5 relationships:v17];

  v19 = [MEMORY[0x263F12180] emptyPropertySet];
  v20 = [v19 propertySetByCombiningWithPropertySet:v6];

  v21 = [v20 propertySetByCombiningWithPropertySet:v10];

  id v22 = [v21 propertySetByCombiningWithPropertySet:v14];

  v23 = [v22 propertySetByCombiningWithPropertySet:v18];

  return v23;
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (void)setCachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (void)setCacheURL:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)urlComponentsWithStoreURLBag:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2269EF000, log, OS_LOG_TYPE_ERROR, "[NMAPIRequest] Missing base url components.", v1, 2u);
}

- (void)urlComponentsWithStoreURLBag:(os_log_t)log error:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2269EF000, log, OS_LOG_TYPE_ERROR, "[NMAPIRequest] Missing language query item.", v1, 2u);
}

@end