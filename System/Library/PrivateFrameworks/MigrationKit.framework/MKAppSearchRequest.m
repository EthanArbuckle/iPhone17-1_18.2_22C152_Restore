@interface MKAppSearchRequest
- (void)search:(id)a3 androidIDs:(id)a4 completion:(id)a5;
@end

@implementation MKAppSearchRequest

- (void)search:(id)a3 androidIDs:(id)a4 completion:(id)a5
{
  v21[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count] || objc_msgSend(v8, "count"))
  {
    v10 = objc_alloc_init(MKDevice);
    uint64_t v11 = [(MKDevice *)v10 type];
    v12 = [MEMORY[0x263F27D18] createBagForSubProfile];
    v13 = (void *)[objc_alloc(MEMORY[0x263F27D18]) initWithType:0 clientIdentifier:@"com.apple.welcomemat" clientVersion:@"1" bag:v12];
    if ([v7 count]) {
      [v13 setBundleIdentifiers:v7];
    }
    if ([v8 count])
    {
      v20 = @"androidAppId";
      v14 = [v8 componentsJoinedByString:@","];
      v21[0] = v14;
      v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
      [v13 setFilters:v15];
    }
    v16 = [v13 perform];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __51__MKAppSearchRequest_search_androidIDs_completion___block_invoke;
    v17[3] = &unk_264905DB8;
    id v18 = v9;
    uint64_t v19 = v11;
    [v16 addFinishBlock:v17];
  }
  else
  {
    v10 = [MEMORY[0x263F087E8] errorWithDomain:@"MKAppSearchRequestError" code:1 userInfo:0];
    if (v9) {
      (*((void (**)(id, void, MKDevice *))v9 + 2))(v9, 0, v10);
    }
  }
}

void __51__MKAppSearchRequest_search_androidIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
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
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v9 = [v5 responseDataItems];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [[MKApp alloc] initWithJSONData:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          v15 = v14;
          if (v14 && [(MKApp *)v14 isSupported:*(void *)(a1 + 40)]) {
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      (*(void (**)(uint64_t, id, void))(v16 + 16))(v16, v8, 0);
    }
  }
}

@end