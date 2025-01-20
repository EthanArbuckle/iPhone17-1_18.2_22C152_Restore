@interface VSIdentityProviderStorefrontParser
- (NSArray)allIdentityProviders;
- (NSArray)allStorefronts;
- (NSArray)tvProviderSupportedStorefronts;
- (NSDictionary)identityProvidersByStorefront;
- (NSDictionary)providersByStorefront;
- (NSDictionary)storefrontsByCountryCode;
- (VSIdentityProviderStorefrontParser)init;
- (id)featuredProvidersForStorefront:(id)a3;
- (id)providersForStorefront:(id)a3;
- (id)providersForStorefront:(id)a3 featuredOnly:(BOOL)a4;
- (id)updateFeaturedStorefronts:(id)a3 withCurrentStorefrontCodeOrNil:(id)a4;
- (void)setAllIdentityProviders:(id)a3;
- (void)setAllStorefronts:(id)a3;
- (void)setAllStorefronts:(id)a3 withCurrentStorefrontCode:(id)a4;
- (void)setProvidersByStorefront:(id)a3;
- (void)setStorefrontsByCountryCode:(id)a3;
@end

@implementation VSIdentityProviderStorefrontParser

- (VSIdentityProviderStorefrontParser)init
{
  v10.receiver = self;
  v10.super_class = (Class)VSIdentityProviderStorefrontParser;
  v2 = [(VSIdentityProviderStorefrontParser *)&v10 init];
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    allIdentityProviders = v2->_allIdentityProviders;
    v2->_allIdentityProviders = v3;

    v5 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    allStorefronts = v2->_allStorefronts;
    v2->_allStorefronts = v5;

    v7 = (NSDictionary *)objc_alloc_init(NSDictionary);
    storefrontsByCountryCode = v2->_storefrontsByCountryCode;
    v2->_storefrontsByCountryCode = v7;
  }
  return v2;
}

- (void)setAllStorefronts:(id)a3
{
}

- (void)setAllStorefronts:(id)a3 withCurrentStorefrontCode:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v5 = [(VSIdentityProviderStorefrontParser *)self updateFeaturedStorefronts:a3 withCurrentStorefrontCodeOrNil:a4];
  objc_storeStrong((id *)&self->_allStorefronts, v5);
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "identitifer", (void)v18);
        [v6 setObject:v12 forKey:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  v14 = objc_alloc_init(VSStorefront);
  v15 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  v16 = [v15 localizedStringForKey:@"REGIONS_PICKER_SETTINGS_DEVELOPER_PROVIDERS_DISPLAY_NAME" value:0 table:0];
  [(VSStorefront *)v14 setDisplayName:v16];

  [(VSStorefront *)v14 setIdentitifer:@"__"];
  [(VSStorefront *)v14 setIsFeatured:1];
  [v6 setObject:v14 forKey:@"__"];
  v17 = (void *)[v6 copy];
  [(VSIdentityProviderStorefrontParser *)self setStorefrontsByCountryCode:v17];
}

- (NSDictionary)identityProvidersByStorefront
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  v2 = [(VSIdentityProviderStorefrontParser *)self allIdentityProviders];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v2;
  uint64_t v5 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v44;
    uint64_t v35 = *MEMORY[0x263EFF4A0];
    uint64_t v30 = *(void *)v44;
    id v31 = v4;
    do
    {
      uint64_t v8 = 0;
      uint64_t v32 = v6;
      do
      {
        if (*(void *)v44 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v43 + 1) + 8 * v8);
        if ([v9 isDeveloper])
        {
          [v4 addObject:v9];
        }
        else
        {
          uint64_t v34 = v8;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v38 = [v9 storefronts];
          uint64_t v10 = [v38 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v40;
            v37 = v9;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v40 != v12) {
                  objc_enumerationMutation(v38);
                }
                v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                v15 = [v14 storefrontTwoCharCode];
                v16 = [v3 objectForKey:v15];
                if (!v16)
                {
                  uint64_t v17 = v11;
                  long long v18 = v3;
                  v16 = objc_alloc_init(VSIdentityProviderStorefrontCollection);
                  [(VSIdentityProviderStorefrontCollection *)v16 setStorefrontTwoCharCode:v15];
                  long long v19 = [(VSIdentityProviderStorefrontParser *)self storefrontsByCountryCode];
                  long long v20 = [v19 valueForKey:v15];
                  long long v21 = [v20 displayName];

                  if (v21) {
                    v22 = v21;
                  }
                  else {
                    v22 = v15;
                  }
                  [(VSIdentityProviderStorefrontCollection *)v16 setLocalizedDisplayName:v22];
                  if (!v16) {
                    [MEMORY[0x263EFF940] raise:v35 format:@"The sfCollection parameter must not be nil."];
                  }
                  id v3 = v18;
                  [v18 setObject:v16 forKey:v15];

                  uint64_t v11 = v17;
                  uint64_t v9 = v37;
                }
                uint64_t v23 = [(VSIdentityProviderStorefrontCollection *)v16 mutableAllIdentityProviders];
                [v23 addObject:v9];

                if ([v14 isFeatured])
                {
                  v24 = [(VSIdentityProviderStorefrontCollection *)v16 mutableFeaturedIdentityProviders];
                  [v24 addObject:v9];
                }
              }
              uint64_t v11 = [v38 countByEnumeratingWithState:&v39 objects:v47 count:16];
            }
            while (v11);
          }

          uint64_t v7 = v30;
          id v4 = v31;
          uint64_t v6 = v32;
          uint64_t v8 = v34;
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v6);
  }

  if ([v4 count])
  {
    v25 = objc_alloc_init(VSIdentityProviderStorefrontCollection);
    [(VSIdentityProviderStorefrontCollection *)v25 setStorefrontTwoCharCode:@"__"];
    v26 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    v27 = [v26 localizedStringForKey:@"REGIONS_PICKER_SETTINGS_DEVELOPER_PROVIDERS_DISPLAY_NAME" value:0 table:0];
    [(VSIdentityProviderStorefrontCollection *)v25 setLocalizedDisplayName:v27];

    [(VSIdentityProviderStorefrontCollection *)v25 setMutableAllIdentityProviders:v4];
    [v3 setObject:v25 forKey:@"__"];
  }
  v28 = (void *)[v3 copy];
  [(VSIdentityProviderStorefrontParser *)self setProvidersByStorefront:v28];

  return (NSDictionary *)v3;
}

- (NSArray)tvProviderSupportedStorefronts
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = [(VSIdentityProviderStorefrontParser *)self providersByStorefront];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(VSIdentityProviderStorefrontParser *)self identityProvidersByStorefront];
  }
  uint64_t v6 = v5;

  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v14 = [(VSIdentityProviderStorefrontParser *)self storefrontsByCountryCode];
        v15 = [v14 objectForKey:v13];

        if (v15) {
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return (NSArray *)v7;
}

- (id)providersForStorefront:(id)a3
{
  return [(VSIdentityProviderStorefrontParser *)self providersForStorefront:a3 featuredOnly:0];
}

- (id)featuredProvidersForStorefront:(id)a3
{
  return [(VSIdentityProviderStorefrontParser *)self providersForStorefront:a3 featuredOnly:1];
}

- (id)providersForStorefront:(id)a3 featuredOnly:(BOOL)a4
{
  BOOL v20 = a4;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [(VSIdentityProviderStorefrontParser *)self allIdentityProviders];
  uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v8 = [v7 storefronts];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v24;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v24 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * j);
              v14 = [v13 storefrontTwoCharCode];
              int v15 = [v14 isEqualToString:v5];

              if (v15)
              {
                if (!v20 || [v13 isFeatured]) {
                  [v18 addObject:v7];
                }
                goto LABEL_18;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
LABEL_18:
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v22);
  }

  v16 = (void *)[v18 copy];
  return v16;
}

- (id)updateFeaturedStorefronts:(id)a3 withCurrentStorefrontCodeOrNil:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "identitifer", (void)v18);
          uint64_t v15 = [v14 isEqualToString:v6];

          [v13 setIsFeatured:v15];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    id v16 = (id)[v7 copy];
  }
  else
  {
    id v16 = v5;
  }

  return v16;
}

- (NSArray)allIdentityProviders
{
  return self->_allIdentityProviders;
}

- (void)setAllIdentityProviders:(id)a3
{
}

- (NSArray)allStorefronts
{
  return self->_allStorefronts;
}

- (NSDictionary)providersByStorefront
{
  return self->_providersByStorefront;
}

- (void)setProvidersByStorefront:(id)a3
{
}

- (NSDictionary)storefrontsByCountryCode
{
  return self->_storefrontsByCountryCode;
}

- (void)setStorefrontsByCountryCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontsByCountryCode, 0);
  objc_storeStrong((id *)&self->_providersByStorefront, 0);
  objc_storeStrong((id *)&self->_allStorefronts, 0);
  objc_storeStrong((id *)&self->_allIdentityProviders, 0);
}

@end