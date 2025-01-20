@interface SBIconLabelImageCache
- (CGSize)maxLabelSize;
- (CPMemoryPool)colorPool;
- (CPMemoryPool)grayPool;
- (NSString)description;
- (SBIconLabelImageCache)initWithMaxLabelSize:(CGSize)a3 scale:(double)a4;
- (double)scale;
- (id)cachedLabelImageForParameters:(id)a3;
- (id)cachedLabelImagesWithParametersPassingTest:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)generateAndStoreLabelImageForParameters:(id)a3;
- (id)labelImageForParameters:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)numberOfCacheHits;
- (unint64_t)numberOfCacheMisses;
- (unint64_t)numberOfCachedImages;
- (void)cacheLabelImageForParameters:(id)a3;
- (void)ensureLabelImagesAreCached:(id)a3;
- (void)removeLabelImageForParameters:(id)a3;
- (void)removeLabelImagesWithParametersPassingTest:(id)a3;
@end

@implementation SBIconLabelImageCache

- (id)labelImageForParameters:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_labelImages objectForKey:v4];
  v6 = SBLogIconLabelImageCache();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      -[SBIconLabelImageCache labelImageForParameters:]((uint64_t)v4, v6, v8, v9, v10, v11, v12, v13);
    }

    ++self->_cacheHits;
  }
  else
  {
    if (v7) {
      -[SBIconLabelImageCache labelImageForParameters:]((uint64_t)v4, v6, v8, v9, v10, v11, v12, v13);
    }

    ++self->_cacheMisses;
    v5 = [(SBIconLabelImageCache *)self generateAndStoreLabelImageForParameters:v4];
  }

  return v5;
}

- (SBIconLabelImageCache)initWithMaxLabelSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v18.receiver = self;
  v18.super_class = (Class)SBIconLabelImageCache;
  BOOL v7 = [(SBIconLabelImageCache *)&v18 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_maxLabelSize.double width = width;
    v7->_maxLabelSize.double height = height;
    v7->_scale = a4;
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1818], "sbf_bytesNeededForSize:scale:withContextType:", 4, width, height, a4);
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4FB1818], "sbf_bytesNeededForSize:scale:withContextType:", 0, width, height, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F4BE60]) initWithLabel:"iconLabels_gray" slotLength:v9];
    grayPool = v8->_grayPool;
    v8->_grayPool = (CPMemoryPool *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F4BE60]) initWithLabel:"iconLabels_color" slotLength:v10];
    colorPool = v8->_colorPool;
    v8->_colorPool = (CPMemoryPool *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    labelImages = v8->_labelImages;
    v8->_labelImages = v15;
  }
  return v8;
}

- (void)ensureLabelImagesAreCached:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9484600]();
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v7 = [(NSMutableDictionary *)self->_labelImages allKeys];
  uint64_t v8 = [v6 setWithArray:v7];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v8, "containsObject:", v14, (void)v16) & 1) == 0)
        {
          ++self->_cacheMisses;
          id v15 = [(SBIconLabelImageCache *)self generateAndStoreLabelImageForParameters:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (id)cachedLabelImageForParameters:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_labelImages objectForKey:a3];
}

- (void)cacheLabelImageForParameters:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_labelImages objectForKey:v4];

  if (!v5)
  {
    v6 = SBLogIconLabelImageCache();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[SBIconLabelImageCache cacheLabelImageForParameters:]((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    }

    id v13 = [(SBIconLabelImageCache *)self generateAndStoreLabelImageForParameters:v4];
  }
}

- (id)generateAndStoreLabelImageForParameters:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 copy];
  [v4 maxSize];
  if (v7 <= self->_maxLabelSize.width && v6 <= self->_maxLabelSize.height)
  {
    int v9 = [v4 isColorspaceGrayscale];
    uint64_t v10 = 48;
    if (v9) {
      uint64_t v10 = 40;
    }
    id v8 = *(id *)((char *)&self->super.isa + v10);
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v11 = +[SBIconLabelImage imageWithParameters:v5 pool:v8];
  if (v11) {
    [(NSMutableDictionary *)self->_labelImages setObject:v11 forKey:v5];
  }

  return v11;
}

- (void)removeLabelImageForParameters:(id)a3
{
}

- (id)cachedLabelImagesWithParametersPassingTest:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA80] set];
  labelImages = self->_labelImages;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__SBIconLabelImageCache_cachedLabelImagesWithParametersPassingTest___block_invoke;
  v12[3] = &unk_1E6AAED08;
  id v14 = v4;
  id v7 = v5;
  id v13 = v7;
  id v8 = v4;
  [(NSMutableDictionary *)labelImages enumerateKeysAndObjectsUsingBlock:v12];
  int v9 = v13;
  id v10 = v7;

  return v10;
}

void __68__SBIconLabelImageCache_cachedLabelImagesWithParametersPassingTest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (void)removeLabelImagesWithParametersPassingTest:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = (unsigned int (**)(id, void))a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = self->_labelImages;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (v4[2](v4, v11))
        {
          if (!v8) {
            id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v8 addObject:v11];
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[NSMutableDictionary removeObjectForKey:](self->_labelImages, "removeObjectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (unint64_t)numberOfCachedImages
{
  return [(NSMutableDictionary *)self->_labelImages count];
}

- (unint64_t)numberOfCacheHits
{
  return self->_cacheHits;
}

- (unint64_t)numberOfCacheMisses
{
  return self->_cacheMisses;
}

- (NSString)description
{
  return (NSString *)[(SBIconLabelImageCache *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBIconLabelImageCache *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBIconLabelImageCache *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBIconLabelImageCache *)self succinctDescriptionBuilder];
  [(SBIconLabelImageCache *)self maxLabelSize];
  id v5 = (id)objc_msgSend(v4, "appendSize:withName:", @"maxLabelSize");
  [(SBIconLabelImageCache *)self scale];
  id v6 = (id)objc_msgSend(v4, "appendFloat:withName:", @"scale");
  return v4;
}

- (CGSize)maxLabelSize
{
  double width = self->_maxLabelSize.width;
  double height = self->_maxLabelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (CPMemoryPool)grayPool
{
  return self->_grayPool;
}

- (CPMemoryPool)colorPool
{
  return self->_colorPool;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPool, 0);
  objc_storeStrong((id *)&self->_grayPool, 0);
  objc_storeStrong((id *)&self->_labelImages, 0);
}

- (void)labelImageForParameters:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)labelImageForParameters:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cacheLabelImageForParameters:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end