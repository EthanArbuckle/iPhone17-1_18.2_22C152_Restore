@interface VSIdentityProviderStorefrontCollection
- (NSMutableArray)mutableAllIdentityProviders;
- (NSMutableArray)mutableFeaturedIdentityProviders;
- (NSString)localizedDisplayName;
- (NSString)storefrontTwoCharCode;
- (VSIdentityProviderStorefrontCollection)init;
- (id)allIdentityProviders;
- (id)featuredIdentityProviders;
- (void)featureProvidersInCurrentStorefront;
- (void)setLocalizedDisplayName:(id)a3;
- (void)setMutableAllIdentityProviders:(id)a3;
- (void)setMutableFeaturedIdentityProviders:(id)a3;
- (void)setStorefrontTwoCharCode:(id)a3;
@end

@implementation VSIdentityProviderStorefrontCollection

- (VSIdentityProviderStorefrontCollection)init
{
  v8.receiver = self;
  v8.super_class = (Class)VSIdentityProviderStorefrontCollection;
  v2 = [(VSIdentityProviderStorefrontCollection *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mutableFeaturedIdentityProviders = v2->_mutableFeaturedIdentityProviders;
    v2->_mutableFeaturedIdentityProviders = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mutableAllIdentityProviders = v2->_mutableAllIdentityProviders;
    v2->_mutableAllIdentityProviders = v5;
  }
  return v2;
}

- (id)featuredIdentityProviders
{
  v2 = [(VSIdentityProviderStorefrontCollection *)self mutableFeaturedIdentityProviders];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)allIdentityProviders
{
  v2 = [(VSIdentityProviderStorefrontCollection *)self mutableAllIdentityProviders];
  v3 = (void *)[v2 copy];

  return v3;
}

- (void)featureProvidersInCurrentStorefront
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = [(VSIdentityProviderStorefrontCollection *)self storefrontTwoCharCode];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = [(VSIdentityProviderStorefrontCollection *)self featuredIdentityProviders];
  uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        v6 = [v5 storefronts];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v18 != v9) {
                objc_enumerationMutation(v6);
              }
              v11 = *(void **)(*((void *)&v17 + 1) + 8 * j);
              v12 = [v11 storefrontTwoCharCode];
              if ([v12 isEqualToString:v3])
              {
                v13 = [v5 rankForSorting];

                if (v13) {
                  continue;
                }
                v12 = [v11 sortOrdinal];
                [v5 setRankForSorting:v12];
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v8);
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v16);
  }
}

- (NSString)storefrontTwoCharCode
{
  return self->_storefrontTwoCharCode;
}

- (void)setStorefrontTwoCharCode:(id)a3
{
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
}

- (NSMutableArray)mutableFeaturedIdentityProviders
{
  return self->_mutableFeaturedIdentityProviders;
}

- (void)setMutableFeaturedIdentityProviders:(id)a3
{
}

- (NSMutableArray)mutableAllIdentityProviders
{
  return self->_mutableAllIdentityProviders;
}

- (void)setMutableAllIdentityProviders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableAllIdentityProviders, 0);
  objc_storeStrong((id *)&self->_mutableFeaturedIdentityProviders, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_storefrontTwoCharCode, 0);
}

@end