@interface WFContentLocation(Icon)
- (id)icon;
@end

@implementation WFContentLocation(Icon)

- (id)icon
{
  v2 = (void *)MEMORY[0x263F337F0];
  v3 = [a1 identifier];
  v4 = [v2 sfSymbolNameForContentLocationWithIdentifier:v3];

  v5 = (void *)MEMORY[0x263F337F0];
  v6 = [a1 identifier];
  v7 = [v5 symbolBackgroundColorForContentLocationWithIdentifier:v6];

  id v8 = objc_alloc(MEMORY[0x263F85438]);
  id v9 = objc_alloc(MEMORY[0x263F852F8]);
  v10 = v9;
  if (v4)
  {
    v11 = (void *)[v9 initWithColor:v7];
    v12 = (void *)[v8 initWithSymbolName:v4 background:v11];
  }
  else
  {
    v11 = (void *)[objc_alloc(MEMORY[0x263F851A8]) initWithSystemColor:9];
    v13 = (void *)[v10 initWithColor:v11];
    v12 = (void *)[v8 initWithSymbolName:@"square.and.arrow.up.fill" background:v13];
  }
  return v12;
}

@end