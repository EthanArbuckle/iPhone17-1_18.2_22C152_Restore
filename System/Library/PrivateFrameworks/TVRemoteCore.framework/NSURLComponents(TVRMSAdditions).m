@interface NSURLComponents(TVRMSAdditions)
- (id)rms_componentsByAddingQueryParameters:()TVRMSAdditions;
@end

@implementation NSURLComponents(TVRMSAdditions)

- (id)rms_componentsByAddingQueryParameters:()TVRMSAdditions
{
  v19[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)[a1 copy];
  v6 = objc_opt_new();
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __73__NSURLComponents_TVRMSAdditions__rms_componentsByAddingQueryParameters___block_invoke;
  v17 = &unk_2647AE7B8;
  id v7 = v6;
  id v18 = v7;
  [v4 enumerateKeysAndObjectsUsingBlock:&v14];

  v8 = objc_msgSend(v7, "componentsJoinedByString:", @"&", v14, v15, v16, v17);
  v9 = [v5 query];

  if (v9)
  {
    v10 = [v5 query];
    v19[0] = v10;
    v19[1] = v8;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    v12 = [v11 componentsJoinedByString:@"&"];
    [v5 setQuery:v12];
  }
  else
  {
    [v5 setQuery:v8];
  }

  return v5;
}

@end