@interface NMAPIRadioRequest
- (Class)responseParserClass;
- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4;
@end

@implementation NMAPIRadioRequest

- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4
{
  v31[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NMAPIRadioRequest;
  v7 = [(NMAPIRequest *)&v29 urlComponentsWithStoreURLBag:v6 error:a4];
  v8 = MusicURLPathStorefrontWithURLBag(v6);
  if (v8)
  {
    v9 = [v6 dictionaryForBagKey:*MEMORY[0x263F89058]];
    v10 = [v9 valueForKeyPath:@"radioTabGroupingName"];
    if (v10)
    {
      v11 = NSString;
      v31[0] = @"/v1/editorial";
      v31[1] = v8;
      v31[2] = @"groupings";
      v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:3];
      v13 = [v11 pathWithComponents:v12];
      [v7 setPath:v13];

      v14 = [v7 queryItems];
      v28 = v9;
      v26 = [MEMORY[0x263F08BD0] queryItemWithName:@"name" value:v10];
      v30[0] = v26;
      v15 = (void *)MEMORY[0x263F08BD0];
      [&unk_26DA89768 componentsJoinedByString:@","];
      v16 = v27 = v10;
      v17 = [v15 queryItemWithName:@"include" value:v16];
      v30[1] = v17;
      v18 = [MEMORY[0x263F08BD0] queryItemWithName:@"include[stations]" value:@"events"];
      v30[2] = v18;
      v19 = [MEMORY[0x263F08BD0] queryItemWithName:@"art[url]" value:@"f,c"];
      v30[3] = v19;
      v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];
      v21 = [v14 arrayByAddingObjectsFromArray:v20];
      [v7 setQueryItems:v21];

      v9 = v28;
      v10 = v27;

      id v22 = v7;
    }
    else
    {
      v24 = NMLogForCategory(9);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[NMAPIRadioRequest urlComponentsWithStoreURLBag:error:](v24);
      }

      if (a4)
      {
        [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7201 userInfo:0];
        id v22 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v22 = 0;
      }
    }
  }
  else
  {
    v23 = NMLogForCategory(9);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[NMAPIRadioRequest urlComponentsWithStoreURLBag:error:](v23);
    }

    if (a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7201 userInfo:0];
      id v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v22 = 0;
    }
  }

  return v22;
}

- (Class)responseParserClass
{
  return (Class)objc_opt_class();
}

- (void)urlComponentsWithStoreURLBag:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2269EF000, log, OS_LOG_TYPE_ERROR, "[NMAPIRequest] Missing musicURLPath.", v1, 2u);
}

- (void)urlComponentsWithStoreURLBag:(os_log_t)log error:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2269EF000, log, OS_LOG_TYPE_ERROR, "[NMAPIRequest] Missing radioGroupingName.", v1, 2u);
}

@end