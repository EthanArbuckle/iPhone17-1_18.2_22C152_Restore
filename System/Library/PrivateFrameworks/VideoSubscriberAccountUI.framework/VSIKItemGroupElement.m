@interface VSIKItemGroupElement
+ (id)supportedFeaturesForElementName:(id)a3;
- (VSIKItemGroup)itemGroup;
- (VSIKItemGroupElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
@end

@implementation VSIKItemGroupElement

+ (id)supportedFeaturesForElementName:(id)a3
{
  v5[1] = *MEMORY[0x263EF8340];
  if ([a3 isEqual:@"itemGroup"])
  {
    v5[0] = 0x26F3627D0;
    v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  }
  else
  {
    v3 = (void *)MEMORY[0x263EFFA68];
  }
  return v3;
}

- (VSIKItemGroupElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)VSIKItemGroupElement;
  v5 = [(VSIKItemGroupElement *)&v13 initWithDOMElement:a3 parent:a4 elementFactory:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(VSIKItemGroupElement *)v5 features];
    v8 = [v7 firstObject];

    if (!v8) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [[self features] firstObject] parameter must not be nil."];
    }
    v9 = [(VSIKItemGroupElement *)v6 features];
    uint64_t v10 = [v9 firstObject];

    itemGroup = v6->_itemGroup;
    v6->_itemGroup = (VSIKItemGroup *)v10;
  }
  return v6;
}

- (VSIKItemGroup)itemGroup
{
  return self->_itemGroup;
}

- (void).cxx_destruct
{
}

@end