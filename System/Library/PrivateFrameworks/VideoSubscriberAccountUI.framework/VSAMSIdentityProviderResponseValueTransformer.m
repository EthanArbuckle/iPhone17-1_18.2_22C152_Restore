@interface VSAMSIdentityProviderResponseValueTransformer
- (VSAMSIdentityProviderResponseValueTransformer)init;
@end

@implementation VSAMSIdentityProviderResponseValueTransformer

- (VSAMSIdentityProviderResponseValueTransformer)init
{
  v10[2] = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)VSAMSIdentityProviderResponseValueTransformer;
  v2 = [(VSCompoundValueTransformer *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(VSAMSIdentityProviderResponseDictionaryValueTransformer);
    id v4 = objc_alloc_init(MEMORY[0x263F1E210]);
    [v4 setObjectValueTransformer:v3];
    v5 = [MEMORY[0x263F08D50] valueTransformerForName:*MEMORY[0x263F1E440]];
    id v6 = objc_alloc_init(MEMORY[0x263F1E210]);
    [v6 setObjectValueTransformer:v5];
    v10[0] = v6;
    v10[1] = v4;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    [(VSCompoundValueTransformer *)v2 setValueTransformers:v7];
  }
  return v2;
}

@end