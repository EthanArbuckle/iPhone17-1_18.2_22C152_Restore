@interface NSURL(UCNSURLExtras)
- (id)transformPayloadWithBlock:()UCNSURLExtras;
- (uint64_t)padPayloadToV1Length;
- (uint64_t)truncatePayloadToV2Length;
@end

@implementation NSURL(UCNSURLExtras)

- (id)transformPayloadWithBlock:()UCNSURLExtras
{
  v20[1] = *MEMORY[0x263EF8340];
  v4 = (uint64_t (**)(id, id))a3;
  id v5 = (id)[MEMORY[0x263F08BA0] componentsWithURL:a1 resolvingAgainstBaseURL:0];
  id v6 = (id)[v5 queryItems];
  if ([v6 count])
  {
    id v7 = (id)[v6 objectAtIndexedSubscript:0];
    id v8 = (id)[v7 name];
    int v9 = [v8 isEqualToString:@"p"];

    id v10 = 0;
    if (v9)
    {
      id v11 = (id)[v6 objectAtIndexedSubscript:0];
      id v12 = (id)[v11 value];

      id v13 = (id)v4[2](v4, v12);
      v14 = (void *)MEMORY[0x263F08BD0];
      id v15 = (id)[v6 objectAtIndexedSubscript:0];
      id v16 = (id)[v15 name];
      id v17 = (id)[v14 queryItemWithName:v16 value:v13];

      v20[0] = v17;
      id v18 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
      [v5 setQueryItems:v18];

      id v10 = (id)[v5 URL];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (uint64_t)truncatePayloadToV2Length
{
  return [a1 transformPayloadWithBlock:&__block_literal_global];
}

- (uint64_t)padPayloadToV1Length
{
  return [a1 transformPayloadWithBlock:&__block_literal_global_5];
}

@end