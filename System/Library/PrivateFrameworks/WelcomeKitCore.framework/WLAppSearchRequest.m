@interface WLAppSearchRequest
- (NSString)identifiers;
- (WLAppSearchRequest)initWithAndroidIdentifiers:(id)a3;
- (void)search:(id)a3;
- (void)setIdentifiers:(id)a3;
@end

@implementation WLAppSearchRequest

- (WLAppSearchRequest)initWithAndroidIdentifiers:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WLAppSearchRequest;
  v5 = [(WLAppSearchRequest *)&v8 init];
  if (v5)
  {
    v6 = [v4 componentsJoinedByString:@","];
    [(WLAppSearchRequest *)v5 setIdentifiers:v6];
  }
  return v5;
}

- (void)search:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NSString *)self->_identifiers length])
  {
    v5 = [MEMORY[0x263F27D18] createBagForSubProfile];
    v6 = (void *)[objc_alloc(MEMORY[0x263F27D18]) initWithType:0 clientIdentifier:@"com.apple.welcomemat" clientVersion:@"1" bag:v5];
    identifiers = self->_identifiers;
    v15 = @"androidAppId";
    v16 = identifiers;
    objc_super v8 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    [v6 setFilters:v8];

    v9 = [v6 perform];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __29__WLAppSearchRequest_search___block_invoke;
    v13[3] = &unk_26490C708;
    id v14 = v4;
    [v9 addFinishBlock:v13];
  }
  else
  {
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F86308];
    uint64_t v17 = *MEMORY[0x263F08320];
    v18[0] = @"WLAppSearchRequest could not search identifiers because the request was empty.";
    v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v5 = [v10 errorWithDomain:v11 code:1 userInfo:v12];

    if (v4) {
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v5);
    }
  }
}

void __29__WLAppSearchRequest_search___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
    }
  }
  else
  {
    uint64_t v32 = a1;
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v33 = v5;
    v9 = [v5 responseDataItems];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v39 = *(void *)v45;
      v34 = v9;
      id v35 = v8;
      do
      {
        uint64_t v12 = 0;
        uint64_t v36 = v11;
        do
        {
          if (*(void *)v45 != v39) {
            objc_enumerationMutation(v9);
          }
          v13 = *(void **)(*((void *)&v44 + 1) + 8 * v12);
          id v14 = [v13 objectForKeyedSubscript:@"id"];
          if (v14)
          {
            v15 = [v13 objectForKeyedSubscript:@"attributes"];
            v16 = [v15 objectForKeyedSubscript:@"platformAttributes"];
            uint64_t v17 = [v16 objectForKeyedSubscript:@"ios"];

            if (v17)
            {
              v18 = [v17 objectForKeyedSubscript:@"bundleId"];
              v19 = [v17 objectForKeyedSubscript:@"offers"];
              if (v18) {
                BOOL v20 = v19 == 0;
              }
              else {
                BOOL v20 = 1;
              }
              if (!v20)
              {
                v37 = v19;
                v38 = v18;
                long long v42 = 0u;
                long long v43 = 0u;
                long long v40 = 0u;
                long long v41 = 0u;
                id v21 = v19;
                uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v48 count:16];
                if (v22)
                {
                  uint64_t v23 = *(void *)v41;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v22; ++i)
                    {
                      if (*(void *)v41 != v23) {
                        objc_enumerationMutation(v21);
                      }
                      v25 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                      v26 = [v25 objectForKeyedSubscript:@"type"];
                      v27 = [v26 lowercaseString];

                      v28 = [v25 objectForKeyedSubscript:@"price"];
                      if (v28 && [v27 isEqualToString:@"get"])
                      {
                        [v28 floatValue];
                        uint64_t v22 = v29 == 0.0;

                        goto LABEL_26;
                      }
                    }
                    uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v48 count:16];
                    if (v22) {
                      continue;
                    }
                    break;
                  }
LABEL_26:
                  v9 = v34;
                  id v8 = v35;
                }

                v18 = v38;
                v30 = [[WLApp alloc] initWithBundleIdentifier:v38 appStoreIdentifier:v14 isFree:v22];
                [v8 addObject:v30];

                uint64_t v11 = v36;
                v19 = v37;
              }
            }
          }

          ++v12;
        }
        while (v12 != v11);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v11);
    }
    uint64_t v31 = *(void *)(v32 + 32);
    if (v31) {
      (*(void (**)(uint64_t, id, void))(v31 + 16))(v31, v8, 0);
    }

    id v6 = 0;
    id v5 = v33;
  }
}

- (NSString)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end