@interface WCRCipherMLClient
+ (id)categoryForCategoryLetter:(id)a3;
+ (id)categoryForString:(id)a3 withError:(id *)a4;
+ (void)activateCipherML;
@end

@implementation WCRCipherMLClient

+ (id)categoryForCategoryLetter:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"v"])
  {
    v4 = &unk_270D82730;
  }
  else if ([v3 isEqualToString:@"|"])
  {
    v4 = &unk_270D82748;
  }
  else if ([v3 isEqualToString:@"g"])
  {
    v4 = &unk_270D82760;
  }
  else if ([v3 isEqualToString:@"w"])
  {
    v4 = &unk_270D82778;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)categoryForString:(id)a3 withError:(id *)a4
{
  v5 = (objc_class *)MEMORY[0x263F32000];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithUseCase:@"webContentRestrictions"];
  v8 = (void *)[objc_alloc(MEMORY[0x263F32010]) initWithClientConfig:v7];
  id v15 = 0;
  v9 = [v8 dataByStringKeyword:v6 error:&v15];

  id v10 = v15;
  v11 = v10;
  if (v9)
  {
    v12 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
    v13 = [(id)objc_opt_class() categoryForCategoryLetter:v12];
  }
  else
  {
    v13 = 0;
    if (a4) {
      *a4 = v10;
    }
  }

  return v13;
}

+ (void)activateCipherML
{
  v2 = [NSString stringWithFormat:@"Getting CipherML status..."];
  +[WCRLogging log:v2 withType:0];

  id v3 = (void *)[objc_alloc(MEMORY[0x263F32000]) initWithUseCase:@"webContentRestrictions"];
  v4 = (void *)MEMORY[0x263F32030];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__WCRCipherMLClient_activateCipherML__block_invoke;
  v6[3] = &unk_265585818;
  id v7 = 0;
  id v8 = v3;
  id v5 = v3;
  [v4 requestStatusForClientConfig:v5 options:0 completionHandler:v6];
}

void __37__WCRCipherMLClient_activateCipherML__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v11)
  {
    uint64_t v6 = [v11 status];
    id v7 = "needs activation";
    if (v6 == 6) {
      id v7 = "doesn't need activation";
    }
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"CipherML status: %s", v7);
    +[WCRLogging log:v8 withType:0];

    if (v6 != 6)
    {
      v9 = [NSString stringWithFormat:@"Activating CipherML..."];
      +[WCRLogging log:v9 withType:0];

      [MEMORY[0x263F32030] requestStatusForClientConfig:*(void *)(a1 + 40) options:11 completionHandler:&__block_literal_global_0];
    }
  }
  else
  {
    id v10 = [NSString stringWithFormat:@"Failed to get CipherML status: %@", *(void *)(a1 + 32)];
    +[WCRLogging log:v10 withType:1];
  }
}

uint64_t __37__WCRCipherMLClient_activateCipherML__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  uint64_t v4 = [a2 status];
  id v5 = "inactive";
  if (v4 == 6) {
    id v5 = "active";
  }
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"CipherML activation response: %s", v5);
  +[WCRLogging log:v6 withType:0];

  if (v9)
  {
    id v7 = [NSString stringWithFormat:@"CipherML activation error: %@", v9];
    +[WCRLogging log:v7 withType:1];
  }
  return MEMORY[0x270F9A758]();
}

@end