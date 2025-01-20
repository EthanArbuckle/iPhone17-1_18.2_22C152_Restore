@interface SVXAFClientLiteFactory
- (id)create;
@end

@implementation SVXAFClientLiteFactory

- (id)create
{
  id v2 = objc_alloc_init(MEMORY[0x263F28460]);

  return v2;
}

@end