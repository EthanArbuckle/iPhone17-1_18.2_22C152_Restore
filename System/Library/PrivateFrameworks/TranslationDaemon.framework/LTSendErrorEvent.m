@interface LTSendErrorEvent
@end

@implementation LTSendErrorEvent

id ___LTSendErrorEvent_block_invoke(uint64_t a1)
{
  v24[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v4 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v24[0] = v4;
  v23[0] = @"selector";
  v23[1] = @"code";
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "code"));
  v24[1] = v5;
  v23[2] = @"domain";
  v6 = [*(id *)(a1 + 40) domain];
  v24[2] = v6;
  v23[3] = @"domain_code";
  v7 = NSString;
  v8 = [*(id *)(a1 + 40) domain];
  v9 = [v7 stringWithFormat:@"%@_%zd", v8, objc_msgSend(*(id *)(a1 + 40), "code")];
  v24[3] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
  v11 = [v2 dictionaryWithDictionary:v10];

  v12 = [*(id *)(a1 + 40) userInfo];
  uint64_t v13 = *MEMORY[0x263F08608];
  v14 = [v12 objectForKeyedSubscript:*MEMORY[0x263F08608]];

  if (v14)
  {
    v15 = [*(id *)(a1 + 40) userInfo];
    v16 = [v15 objectForKeyedSubscript:v13];

    v17 = [v16 domain];
    [v11 setObject:v17 forKeyedSubscript:@"underlying_domain"];

    v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "code"));
    [v11 setObject:v18 forKeyedSubscript:@"underlying_code"];

    v19 = NSString;
    v20 = [v16 domain];
    v21 = [v19 stringWithFormat:@"%@_%zd", v20, objc_msgSend(v16, "code")];
    [v11 setObject:v21 forKeyedSubscript:@"underlying_domain_code"];
  }
  return v11;
}

@end