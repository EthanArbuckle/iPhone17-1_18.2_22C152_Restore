@interface VSStorefrontSection
- (NSArray)storefronts;
- (VSStorefrontSection)init;
- (void)setStorefronts:(id)a3;
@end

@implementation VSStorefrontSection

- (VSStorefrontSection)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSStorefrontSection;
  v2 = [(VSStorefrontSection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    storefronts = v2->_storefronts;
    v2->_storefronts = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v3;
}

- (NSArray)storefronts
{
  return self->_storefronts;
}

- (void)setStorefronts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end