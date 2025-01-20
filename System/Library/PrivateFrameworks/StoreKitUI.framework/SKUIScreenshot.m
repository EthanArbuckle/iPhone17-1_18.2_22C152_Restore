@interface SKUIScreenshot
- (CGSize)sizeForVariant:(id)a3;
- (NSMutableDictionary)cacheRepresentation;
- (NSString)orientationString;
- (SKUIScreenshot)initWithCacheRepresentation:(id)a3;
- (SKUIScreenshot)initWithScreenshotDictionary:(id)a3;
- (id)URLForVariant:(id)a3;
- (id)_firstVariant;
- (id)_initSKUIScreenshot;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)numberOfVariants;
- (int64_t)uniqueIdentifier;
- (void)_addURLsFromDictionary:(id)a3 withRemoteLocalKeysMap:(id)a4;
- (void)_initSKUIScreenshot;
- (void)setArtwork:(id)a3 forVariant:(id)a4;
@end

@implementation SKUIScreenshot

- (id)_initSKUIScreenshot
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIScreenshot *)v3 _initSKUIScreenshot];
      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIScreenshot;
  id result = [(SKUIScreenshot *)&v12 init];
  if (result) {
    *((void *)result + 2) = atomic_fetch_add_explicit(&_initSKUIScreenshot_sUniqueID, 1uLL, memory_order_relaxed) + 1;
  }
  return result;
}

- (SKUIScreenshot)initWithScreenshotDictionary:(id)a3
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIScreenshot initWithScreenshotDictionary:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13 = [(SKUIScreenshot *)self _initSKUIScreenshot];
  if (v13)
  {
    v14 = [v4 objectForKey:@"orientation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v14 copy];
      orientation = v13->_orientation;
      v13->_orientation = (NSString *)v15;
    }
    v43 = v14;
    v46[0] = @"low-dpi";
    v46[1] = @"high-dpi";
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    urls = v13->_urls;
    v13->_urls = v17;

    uint64_t v19 = 0;
    char v20 = 1;
    do
    {
      char v21 = v20;
      uint64_t v22 = v46[v19];
      v23 = objc_msgSend(v4, "objectForKey:", v22, v43);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v24 = [v23 objectForKey:@"url"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v24];
          if (v25) {
            [(NSMutableDictionary *)v13->_urls setObject:v25 forKey:v22];
          }
        }
      }

      char v20 = 0;
      uint64_t v19 = 1;
    }
    while ((v21 & 1) != 0);
    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sizes = v13->_sizes;
    v13->_sizes = v26;

    v28 = [v4 objectForKey:@"width"];

    v29 = [v4 objectForKey:@"height"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v30 = (double)(int)[v28 intValue];
        int v31 = [v29 intValue];
        v32 = v13->_sizes;
        v33 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v30, (double)v31);
        [(NSMutableDictionary *)v32 setObject:v33 forKey:@"low-dpi"];
      }
    }
    v34 = [v4 objectForKey:@"width2x"];

    v35 = [v4 objectForKey:@"height2x"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v36 = (double)(int)[v34 intValue];
        int v37 = [v35 intValue];
        v38 = v13->_sizes;
        v39 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v36, (double)v37);
        [(NSMutableDictionary *)v38 setObject:v39 forKey:@"high-dpi"];
      }
    }
    v44[0] = @"url";
    v44[1] = @"url2x";
    v45[0] = @"low-dpi";
    v45[1] = @"high-dpi";
    v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
    [(SKUIScreenshot *)v13 _addURLsFromDictionary:v4 withRemoteLocalKeysMap:v40];

    for (uint64_t i = 1; i != -1; --i)
  }

  return v13;
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
  if (![(SKUIScreenshot *)self numberOfVariants])
  {
    uint64_t v9 = @"portrait";
    orientation = self->_orientation;
    if (v7 > v8) {
      uint64_t v9 = @"landscape";
    }
    self->_orientation = &v9->isa;
  }
  sizes = self->_sizes;
  if (!sizes)
  {
    uint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v13 = self->_sizes;
    self->_sizes = v12;

    sizes = self->_sizes;
  }
  v14 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v7, v8);
  [(NSMutableDictionary *)sizes setObject:v14 forKey:v6];

  urls = self->_urls;
  if (!urls)
  {
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
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
        [(SKUIScreenshot *)self _firstVariant],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
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
    double v6 = *MEMORY[0x1E4F1DB30];
    double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
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
      double v6 = [(SKUIScreenshot *)self _firstVariant];
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
  uint64_t v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSMutableDictionary *)self->_urls mutableCopyWithZone:a3];
  double v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (SKUIScreenshot)initWithCacheRepresentation:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIScreenshot initWithCacheRepresentation:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v13 = [(SKUIScreenshot *)self _initSKUIScreenshot];
  if (v13)
  {
    v14 = [v4 objectForKey:@"orient"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v13->_orientation, v14);
    }
    self = [v4 objectForKey:@"urls"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      urls = v13->_urls;
      v13->_urls = v15;

      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __46__SKUIScreenshot_initWithCacheRepresentation___block_invoke;
      v18[3] = &unk_1E6427138;
      v13 = v13;
      id v19 = v13;
      [(SKUIScreenshot *)self enumerateKeysAndObjectsUsingBlock:v18];
    }
    goto LABEL_12;
  }
LABEL_13:

  return v13;
}

void __46__SKUIScreenshot_initWithCacheRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v5];
      if (v6) {
        [*(id *)(*(void *)(a1 + 32) + 24) setObject:v6 forKey:v7];
      }
    }
  }
}

- (NSMutableDictionary)cacheRepresentation
{
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  orientation = self->_orientation;
  if (orientation) {
    [v3 setObject:orientation forKey:@"orient"];
  }
  if (self->_urls)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    urls = self->_urls;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__SKUIScreenshot_cacheRepresentation__block_invoke;
    v10[3] = &unk_1E6427160;
    id v11 = v6;
    id v8 = v6;
    [(NSMutableDictionary *)urls enumerateKeysAndObjectsUsingBlock:v10];
    [v4 setObject:v8 forKey:@"urls"];
  }

  return (NSMutableDictionary *)v4;
}

void __37__SKUIScreenshot_cacheRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 absoluteString];
  [v4 setObject:v6 forKey:v5];
}

- (void)_addURLsFromDictionary:(id)a3 withRemoteLocalKeysMap:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__SKUIScreenshot__addURLsFromDictionary_withRemoteLocalKeysMap___block_invoke;
  v8[3] = &unk_1E6427188;
  id v9 = v6;
  uint64_t v10 = self;
  id v7 = v6;
  [a4 enumerateKeysAndObjectsUsingBlock:v8];
}

void __64__SKUIScreenshot__addURLsFromDictionary_withRemoteLocalKeysMap___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v5];
    if (v6) {
      [*(id *)(*(void *)(a1 + 40) + 24) setObject:v6 forKey:v7];
    }
  }
}

- (id)_firstVariant
{
  v2 = [(NSMutableDictionary *)self->_urls keysSortedByValueUsingComparator:&__block_literal_global_27];
  if ([v2 count])
  {
    BOOL v3 = [v2 objectAtIndex:0];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

uint64_t __31__SKUIScreenshot__firstVariant__block_invoke(uint64_t a1, void *a2)
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

- (void)_initSKUIScreenshot
{
}

- (void)initWithScreenshotDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCacheRepresentation:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end