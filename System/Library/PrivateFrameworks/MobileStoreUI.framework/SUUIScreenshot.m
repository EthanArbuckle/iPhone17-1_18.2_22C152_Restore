@interface SUUIScreenshot
- (CGSize)sizeForVariant:(id)a3;
- (NSMutableDictionary)cacheRepresentation;
- (NSString)orientationString;
- (SUUIScreenshot)initWithCacheRepresentation:(id)a3;
- (SUUIScreenshot)initWithScreenshotDictionary:(id)a3;
- (id)URLForVariant:(id)a3;
- (id)_firstVariant;
- (id)_initSUUIScreenshot;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)numberOfVariants;
- (int64_t)uniqueIdentifier;
- (void)_addURLsFromDictionary:(id)a3 withRemoteLocalKeysMap:(id)a4;
- (void)setArtwork:(id)a3 forVariant:(id)a4;
@end

@implementation SUUIScreenshot

- (id)_initSUUIScreenshot
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIScreenshot;
  id result = [(SUUIScreenshot *)&v3 init];
  if (result) {
    *((void *)result + 2) = atomic_fetch_add_explicit(&_initSUUIScreenshot_sUniqueID, 1uLL, memory_order_relaxed) + 1;
  }
  return result;
}

- (SUUIScreenshot)initWithScreenshotDictionary:(id)a3
{
  v38[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SUUIScreenshot *)self _initSUUIScreenshot];
  if (v5)
  {
    v6 = [v4 objectForKey:@"orientation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 copy];
      orientation = v5->_orientation;
      v5->_orientation = (NSString *)v7;
    }
    v35 = v6;
    v38[0] = @"low-dpi";
    v38[1] = @"high-dpi";
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    urls = v5->_urls;
    v5->_urls = v9;

    uint64_t v11 = 0;
    char v12 = 1;
    do
    {
      char v13 = v12;
      uint64_t v14 = v38[v11];
      v15 = objc_msgSend(v4, "objectForKey:", v14, v35);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [v15 objectForKey:@"url"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v17 = (void *)[objc_alloc(NSURL) initWithString:v16];
          if (v17) {
            [(NSMutableDictionary *)v5->_urls setObject:v17 forKey:v14];
          }
        }
      }

      char v12 = 0;
      uint64_t v11 = 1;
    }
    while ((v13 & 1) != 0);
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    sizes = v5->_sizes;
    v5->_sizes = v18;

    v20 = [v4 objectForKey:@"width"];

    v21 = [v4 objectForKey:@"height"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v22 = (double)(int)[v20 intValue];
        int v23 = [v21 intValue];
        v24 = v5->_sizes;
        v25 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v22, (double)v23);
        [(NSMutableDictionary *)v24 setObject:v25 forKey:@"low-dpi"];
      }
    }
    v26 = [v4 objectForKey:@"width2x"];

    v27 = [v4 objectForKey:@"height2x"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v28 = (double)(int)[v26 intValue];
        int v29 = [v27 intValue];
        v30 = v5->_sizes;
        v31 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v28, (double)v29);
        [(NSMutableDictionary *)v30 setObject:v31 forKey:@"high-dpi"];
      }
    }
    v36[0] = @"url";
    v36[1] = @"url2x";
    v37[0] = @"low-dpi";
    v37[1] = @"high-dpi";
    v32 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
    [(SUUIScreenshot *)v5 _addURLsFromDictionary:v4 withRemoteLocalKeysMap:v32];

    for (uint64_t i = 1; i != -1; --i)
  }

  return v5;
}

- (int64_t)numberOfVariants
{
  return [(NSMutableDictionary *)self->_urls count];
}

- (void)setArtwork:(id)a3 forVariant:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  double v7 = (double)[v19 width];
  double v8 = (double)[v19 height];
  if (![(SUUIScreenshot *)self numberOfVariants])
  {
    v9 = @"portrait";
    orientation = self->_orientation;
    if (v7 > v8) {
      v9 = @"landscape";
    }
    self->_orientation = &v9->isa;
  }
  sizes = self->_sizes;
  if (!sizes)
  {
    char v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    char v13 = self->_sizes;
    self->_sizes = v12;

    sizes = self->_sizes;
  }
  uint64_t v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v7, v8);
  [(NSMutableDictionary *)sizes setObject:v14 forKey:v6];

  urls = self->_urls;
  if (!urls)
  {
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v17 = self->_urls;
    self->_urls = v16;

    urls = self->_urls;
  }
  v18 = [v19 URL];
  [(NSMutableDictionary *)urls setObject:v18 forKey:v6];
}

- (CGSize)sizeForVariant:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_sizes objectForKey:a3];
  if (v4
    || [(NSMutableDictionary *)self->_sizes count]
    && (sizes = self->_sizes,
        [(SUUIScreenshot *)self _firstVariant],
        v10 = objc_claimAutoreleasedReturnValue(),
        [(NSMutableDictionary *)sizes objectForKey:v10],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v10,
        v4))
  {
    [v4 CGSizeValue];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v6 = *MEMORY[0x263F001B0];
    double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v11 = v6;
  double v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)URLForVariant:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_urls objectForKey:a3];
  if (!v4)
  {
    if ([(NSMutableDictionary *)self->_urls count])
    {
      urls = self->_urls;
      double v6 = [(SUUIScreenshot *)self _firstVariant];
      id v4 = [(NSMutableDictionary *)urls objectForKey:v6];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_orientation copyWithZone:a3];
  double v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSMutableDictionary *)self->_sizes mutableCopyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSMutableDictionary *)self->_urls mutableCopyWithZone:a3];
  double v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (SUUIScreenshot)initWithCacheRepresentation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [(SUUIScreenshot *)self _initSUUIScreenshot];
    if (v5)
    {
      uint64_t v6 = [v4 objectForKey:@"orient"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v5->_orientation, v6);
      }
      double v7 = [v4 objectForKey:@"urls"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        urls = v5->_urls;
        v5->_urls = v8;

        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __46__SUUIScreenshot_initWithCacheRepresentation___block_invoke;
        v11[3] = &unk_265406D60;
        double v12 = v5;
        [v7 enumerateKeysAndObjectsUsingBlock:v11];
      }
    }
  }
  else
  {

    double v5 = 0;
  }

  return v5;
}

void __46__SUUIScreenshot_initWithCacheRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void *)[objc_alloc(NSURL) initWithString:v5];
      if (v6) {
        [*(id *)(*(void *)(a1 + 32) + 24) setObject:v6 forKey:v7];
      }
    }
  }
}

- (NSMutableDictionary)cacheRepresentation
{
  objc_super v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  orientation = self->_orientation;
  if (orientation) {
    [v3 setObject:orientation forKey:@"orient"];
  }
  if (self->_urls)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    urls = self->_urls;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __37__SUUIScreenshot_cacheRepresentation__block_invoke;
    v10[3] = &unk_265409518;
    id v11 = v6;
    id v8 = v6;
    [(NSMutableDictionary *)urls enumerateKeysAndObjectsUsingBlock:v10];
    [v4 setObject:v8 forKey:@"urls"];
  }

  return (NSMutableDictionary *)v4;
}

void __37__SUUIScreenshot_cacheRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 absoluteString];
  [v4 setObject:v6 forKey:v5];
}

- (void)_addURLsFromDictionary:(id)a3 withRemoteLocalKeysMap:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__SUUIScreenshot__addURLsFromDictionary_withRemoteLocalKeysMap___block_invoke;
  v8[3] = &unk_265409540;
  id v9 = v6;
  uint64_t v10 = self;
  id v7 = v6;
  [a4 enumerateKeysAndObjectsUsingBlock:v8];
}

void __64__SUUIScreenshot__addURLsFromDictionary_withRemoteLocalKeysMap___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (void *)[objc_alloc(NSURL) initWithString:v5];
    if (v6) {
      [*(id *)(*(void *)(a1 + 40) + 24) setObject:v6 forKey:v7];
    }
  }
}

- (id)_firstVariant
{
  v2 = [(NSMutableDictionary *)self->_urls keysSortedByValueUsingComparator:&__block_literal_global_69];
  if ([v2 count])
  {
    objc_super v3 = [v2 objectAtIndex:0];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

uint64_t __31__SUUIScreenshot__firstVariant__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (NSString)orientationString
{
  return self->_orientation;
}

- (int64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlTemplate, 0);
  objc_storeStrong((id *)&self->_sizes, 0);
  objc_storeStrong((id *)&self->_urls, 0);

  objc_storeStrong((id *)&self->_orientation, 0);
}

@end