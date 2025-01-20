@interface NSURLComponents(IC)
- (id)ic_queryItemWithKey:()IC;
- (id)ic_stringValueForQueryItemWithKey:()IC;
- (uint64_t)ic_BOOLValueForQueryItemWithKey:()IC;
@end

@implementation NSURLComponents(IC)

- (id)ic_queryItemWithKey:()IC
{
  id v4 = a3;
  v5 = [a1 queryItems];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__NSURLComponents_IC__ic_queryItemWithKey___block_invoke;
  v9[3] = &unk_2640CE338;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "ic_objectPassingTest:", v9);

  return v7;
}

- (id)ic_stringValueForQueryItemWithKey:()IC
{
  v1 = objc_msgSend(a1, "ic_queryItemWithKey:");
  v2 = [v1 value];

  return v2;
}

- (uint64_t)ic_BOOLValueForQueryItemWithKey:()IC
{
  v1 = objc_msgSend(a1, "ic_stringValueForQueryItemWithKey:");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end