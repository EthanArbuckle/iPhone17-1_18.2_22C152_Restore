@interface WFURLContentLocation(Icon)
- (id)icon;
@end

@implementation WFURLContentLocation(Icon)

- (id)icon
{
  id v0 = objc_alloc(MEMORY[0x263F85438]);
  id v1 = objc_alloc(MEMORY[0x263F852F8]);
  v2 = (void *)[objc_alloc(MEMORY[0x263F851A8]) initWithSystemColor:4];
  v3 = (void *)[v1 initWithColor:v2];
  v4 = (void *)[v0 initWithSymbolName:@"network" background:v3];

  return v4;
}

@end