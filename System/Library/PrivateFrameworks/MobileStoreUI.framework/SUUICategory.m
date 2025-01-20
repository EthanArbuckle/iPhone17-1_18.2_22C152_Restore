@interface SUUICategory
- (BOOL)containsURL:(id)a3;
- (NSArray)children;
- (NSString)name;
- (NSString)parentLabel;
- (NSURL)URL;
- (SUUIArtworkProviding)artworkProvider;
- (SUUICategory)initWithCategoryDictionary:(id)a3;
- (id)subcategoryContainingURL:(id)a3;
- (int64_t)categoryIdentifier;
@end

@implementation SUUICategory

- (SUUICategory)initWithCategoryDictionary:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)SUUICategory;
  v5 = [(SUUICategory *)&v37 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 copy];
      name = v5->_name;
      v5->_name = (NSString *)v7;
    }
    v9 = [v4 objectForKey:@"url"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [objc_alloc(NSURL) initWithString:v9];
      url = v5->_url;
      v5->_url = (NSURL *)v10;
    }
    v12 = [v4 objectForKey:@"parentCategoryLabel"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 copy];
      parentLabel = v5->_parentLabel;
      v5->_parentLabel = (NSString *)v13;
    }
    v15 = [v4 objectForKey:@"artwork"];

    uint64_t v16 = +[SUUIArtworkProvidingFactory artworkProviderForStoreResponse:v15];
    artworkProvider = v5->_artworkProvider;
    v5->_artworkProvider = (SUUIArtworkProviding *)v16;

    v18 = [v4 objectForKey:@"genreId"];

    if (objc_opt_respondsToSelector()) {
      v5->_categoryIdentifier = [v18 longLongValue];
    }
    id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
    v20 = [v4 objectForKey:@"children"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = (objc_class *)objc_opt_class();
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v32 = v20;
      id v22 = v20;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v34;
        do
        {
          uint64_t v26 = 0;
          do
          {
            if (*(void *)v34 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v33 + 1) + 8 * v26);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v28 = (void *)[[v21 alloc] initWithCategoryDictionary:v27];
              if (v28) {
                [v19 addObject:v28];
              }
            }
            ++v26;
          }
          while (v24 != v26);
          uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v24);
      }

      v20 = v32;
    }
    uint64_t v29 = [v19 copy];
    children = v5->_children;
    v5->_children = (NSArray *)v29;
  }
  return v5;
}

- (BOOL)containsURL:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SUUICategory *)self URL];
  char v6 = [v4 isEqual:v5];

  if (v6)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v8 = [(SUUICategory *)self children];
    uint64_t v7 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v8);
          }
          if ([*(id *)(*((void *)&v12 + 1) + 8 * i) containsURL:v4])
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v7;
}

- (id)subcategoryContainingURL:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(SUUICategory *)self children];
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 containsURL:v4])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (int64_t)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSArray)children
{
  return self->_children;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)parentLabel
{
  return self->_parentLabel;
}

- (NSURL)URL
{
  return self->_url;
}

- (SUUIArtworkProviding)artworkProvider
{
  return self->_artworkProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkProvider, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_parentLabel, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end