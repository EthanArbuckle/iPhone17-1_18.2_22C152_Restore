@interface WBSFaviconProviderPrivateCache
- (BOOL)linkPageURLString:(id)a3 toIconURLString:(id)a4;
- (WBSFaviconProviderPrivateCache)init;
- (id)firstImageDataMatchingPageURLStringIn:(id)a3 matchedPageURLString:(id *)a4;
- (id)imageDataForIconURLString:(id)a3;
- (id)imageDataForPageURLString:(id)a3;
- (id)imageInfoForIconURLString:(id)a3;
- (id)imageInfoForPageURLString:(id)a3;
- (id)pageURLStringsWithPrefixesIn:(id)a3;
- (id)rejectedResourceInfosForPageURLString:(id)a3 iconURLString:(id)a4;
- (void)removeAllImageDataWithCompletionHandler:(id)a3;
- (void)removeImageDataForPageURLString:(id)a3;
- (void)setImageData:(id)a3 forPageURLString:(id)a4 iconURLString:(id)a5 iconSize:(CGSize)a6 hasGeneratedResolutions:(BOOL)a7;
- (void)setIsRejectedResource:(BOOL)a3 forPageURLString:(id)a4 iconURLString:(id)a5;
@end

@implementation WBSFaviconProviderPrivateCache

- (WBSFaviconProviderPrivateCache)init
{
  v13.receiver = self;
  v13.super_class = (Class)WBSFaviconProviderPrivateCache;
  v2 = [(WBSFaviconProviderPrivateCache *)&v13 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    uuidToImageDataCache = v2->_uuidToImageDataCache;
    v2->_uuidToImageDataCache = v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    pageURLStringToIconInfoDict = v2->_pageURLStringToIconInfoDict;
    v2->_pageURLStringToIconInfoDict = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    iconURLStringToIconInfoDict = v2->_iconURLStringToIconInfoDict;
    v2->_iconURLStringToIconInfoDict = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    urlStringToRejectedResourceIconInfoDict = v2->_urlStringToRejectedResourceIconInfoDict;
    v2->_urlStringToRejectedResourceIconInfoDict = (NSMutableDictionary *)v9;

    v11 = v2;
  }

  return v2;
}

- (id)imageDataForPageURLString:(id)a3
{
  v4 = [(NSMutableDictionary *)self->_pageURLStringToIconInfoDict objectForKeyedSubscript:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    uuidToImageDataCache = self->_uuidToImageDataCache;
    uint64_t v7 = [v4 UUIDString];
    v8 = [(NSCache *)uuidToImageDataCache objectForKey:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)imageDataForIconURLString:(id)a3
{
  v4 = [(NSMutableDictionary *)self->_iconURLStringToIconInfoDict objectForKeyedSubscript:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    uuidToImageDataCache = self->_uuidToImageDataCache;
    uint64_t v7 = [v4 UUIDString];
    v8 = [(NSCache *)uuidToImageDataCache objectForKey:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)firstImageDataMatchingPageURLStringIn:(id)a3 matchedPageURLString:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = -[WBSFaviconProviderPrivateCache imageDataForPageURLString:](self, "imageDataForPageURLString:", v11, (void)v15);
        if (v12)
        {
          objc_super v13 = (void *)v12;
          if (a4) {
            *a4 = v11;
          }
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  objc_super v13 = 0;
LABEL_12:

  return v13;
}

- (id)pageURLStringsWithPrefixesIn:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = [(NSMutableDictionary *)self->_pageURLStringToIconInfoDict allKeys];
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v11 = v4;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              if (![v10 rangeOfString:*(void *)(*((void *)&v19 + 1) + 8 * j) options:3]) {
                [v5 addObject:v10];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  long long v16 = [v5 allObjects];

  return v16;
}

- (id)imageInfoForPageURLString:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_pageURLStringToIconInfoDict objectForKeyedSubscript:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    uuidToImageDataCache = self->_uuidToImageDataCache;
    uint64_t v7 = [v4 UUIDString];
    uint64_t v8 = [(NSCache *)uuidToImageDataCache objectForKey:v7];
    if (v8) {
      uint64_t v9 = v5;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)imageInfoForIconURLString:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_iconURLStringToIconInfoDict objectForKeyedSubscript:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    uuidToImageDataCache = self->_uuidToImageDataCache;
    uint64_t v7 = [v4 UUIDString];
    uint64_t v8 = [(NSCache *)uuidToImageDataCache objectForKey:v7];
    if (v8) {
      uint64_t v9 = v5;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)setImageData:(id)a3 forPageURLString:(id)a4 iconURLString:(id)a5 iconSize:(CGSize)a6 hasGeneratedResolutions:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a6.height;
  double width = a6.width;
  id v36 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = [(WBSFaviconProviderPrivateCache *)self imageInfoForPageURLString:v13];
  uint64_t v16 = [(WBSFaviconProviderPrivateCache *)self imageInfoForIconURLString:v14];
  uint64_t v17 = v16;
  if (v15 && !v16)
  {
LABEL_8:
    [(WBSFaviconProviderPrivateCache *)self removeImageDataForPageURLString:v13];

    uint64_t v15 = 0;
    goto LABEL_9;
  }
  if (v15 && v16)
  {
    long long v18 = [(id)v15 UUIDString];
    long long v19 = [(id)v17 UUIDString];
    int v20 = [v18 isEqual:v19];

    if (v20)
    {
      if (v36)
      {
        uuidToImageDataCache = self->_uuidToImageDataCache;
        long long v22 = [(id)v15 UUIDString];
        [(NSCache *)uuidToImageDataCache setObject:v36 forKey:v22];
      }
      else
      {
        [(WBSFaviconProviderPrivateCache *)self removeImageDataForPageURLString:v13];
      }
      goto LABEL_16;
    }
    goto LABEL_8;
  }
LABEL_9:
  if (!v36) {
    goto LABEL_16;
  }
  if (!(v15 | v17))
  {
    v31 = [MEMORY[0x1E4F29128] UUID];
    v32 = [v31 UUIDString];

    v33 = [MEMORY[0x1E4F1C9C8] date];
    v34 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:]([WBSFaviconProviderIconInfo alloc], "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", v13, v14, v32, v33, v7, 0, width, height);
    [(NSMutableDictionary *)self->_pageURLStringToIconInfoDict setObject:v34 forKeyedSubscript:v13];

    v35 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:]([WBSFaviconProviderIconInfo alloc], "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", 0, v14, v32, v33, v7, 0, width, height);
    [(NSMutableDictionary *)self->_iconURLStringToIconInfoDict setObject:v35 forKeyedSubscript:v14];

    [(NSCache *)self->_uuidToImageDataCache setObject:v36 forKey:v32];
    goto LABEL_15;
  }
  if (!v15 && v17)
  {
    long long v23 = [WBSFaviconProviderIconInfo alloc];
    long long v24 = [(id)v17 UUIDString];
    long long v25 = [(id)v17 dateAdded];
    [(id)v17 size];
    v28 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:](v23, "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", v13, v14, v24, v25, [(id)v17 hasGeneratedResolutions], 0, v26, v27);
    [(NSMutableDictionary *)self->_pageURLStringToIconInfoDict setObject:v28 forKeyedSubscript:v13];

    uint64_t v29 = self->_uuidToImageDataCache;
    v30 = [(id)v17 UUIDString];
    [(NSCache *)v29 setObject:v36 forKey:v30];

LABEL_15:
    uint64_t v15 = 0;
  }
LABEL_16:
}

- (void)setIsRejectedResource:(BOOL)a3 forPageURLString:(id)a4 iconURLString:(id)a5
{
  BOOL v6 = a3;
  id v12 = a4;
  id v8 = a5;
  if (v6)
  {
    uint64_t v9 = [WBSFaviconProviderIconInfo alloc];
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    id v11 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:](v9, "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", v12, v8, 0, v10, 0, 1, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
  else
  {
    id v11 = 0;
  }
  [(NSMutableDictionary *)self->_urlStringToRejectedResourceIconInfoDict setObject:v11 forKeyedSubscript:v12];
  [(NSMutableDictionary *)self->_urlStringToRejectedResourceIconInfoDict setObject:v11 forKeyedSubscript:v8];
}

- (id)rejectedResourceInfosForPageURLString:(id)a3 iconURLString:(id)a4
{
  id v6 = a4;
  BOOL v7 = (void *)MEMORY[0x1E4F1CA48];
  id v8 = a3;
  uint64_t v9 = [v7 array];
  id v10 = [(NSMutableDictionary *)self->_urlStringToRejectedResourceIconInfoDict objectForKeyedSubscript:v8];

  if (v10) {
    [v9 addObject:v10];
  }
  id v11 = [(NSMutableDictionary *)self->_urlStringToRejectedResourceIconInfoDict objectForKeyedSubscript:v6];

  if (v11) {
    [v9 addObject:v11];
  }

  return v9;
}

- (BOOL)linkPageURLString:(id)a3 toIconURLString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSFaviconProviderPrivateCache *)self imageInfoForPageURLString:v6];
  uint64_t v9 = [(WBSFaviconProviderPrivateCache *)self imageInfoForIconURLString:v7];
  if (v9)
  {
    id v10 = [v8 UUIDString];
    id v11 = [v9 UUIDString];
    char v12 = [v10 isEqual:v11];

    if ((v12 & 1) == 0)
    {
      [(WBSFaviconProviderPrivateCache *)self removeImageDataForPageURLString:v6];
      id v13 = [WBSFaviconProviderIconInfo alloc];
      id v14 = [v9 UUIDString];
      uint64_t v15 = [v9 dateAdded];
      [v9 size];
      long long v18 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:](v13, "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", v6, v7, v14, v15, [v9 hasGeneratedResolutions], 0, v16, v17);
      [(NSMutableDictionary *)self->_pageURLStringToIconInfoDict setObject:v18 forKeyedSubscript:v6];
    }
  }

  return v9 != 0;
}

- (void)removeImageDataForPageURLString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WBSFaviconProviderPrivateCache *)self imageInfoForPageURLString:v4];
  if (v5)
  {
    [(NSMutableDictionary *)self->_pageURLStringToIconInfoDict removeObjectForKey:v4];
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 1;
    pageURLStringToIconInfoDict = self->_pageURLStringToIconInfoDict;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __66__WBSFaviconProviderPrivateCache_removeImageDataForPageURLString___block_invoke;
    v24[3] = &unk_1E5E424D8;
    id v7 = v5;
    id v25 = v7;
    double v26 = &v27;
    [(NSMutableDictionary *)pageURLStringToIconInfoDict enumerateKeysAndObjectsUsingBlock:v24];
    if (*((unsigned char *)v28 + 24))
    {
      uint64_t v18 = 0;
      long long v19 = &v18;
      uint64_t v20 = 0x3032000000;
      long long v21 = __Block_byref_object_copy__5;
      long long v22 = __Block_byref_object_dispose__5;
      id v23 = 0;
      iconURLStringToIconInfoDict = self->_iconURLStringToIconInfoDict;
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      id v14 = __66__WBSFaviconProviderPrivateCache_removeImageDataForPageURLString___block_invoke_7;
      uint64_t v15 = &unk_1E5E424D8;
      id v9 = v7;
      id v16 = v9;
      double v17 = &v18;
      [(NSMutableDictionary *)iconURLStringToIconInfoDict enumerateKeysAndObjectsUsingBlock:&v12];
      if (v19[5])
      {
        -[NSMutableDictionary removeObjectForKey:](self->_iconURLStringToIconInfoDict, "removeObjectForKey:", v12, v13, v14, v15);
        uuidToImageDataCache = self->_uuidToImageDataCache;
        id v11 = [v9 UUIDString];
        [(NSCache *)uuidToImageDataCache removeObjectForKey:v11];
      }
      _Block_object_dispose(&v18, 8);
    }
    _Block_object_dispose(&v27, 8);
  }
}

void __66__WBSFaviconProviderPrivateCache_removeImageDataForPageURLString___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = [v6 UUIDString];
  id v9 = [v7 UUIDString];

  LODWORD(v7) = [v8 isEqual:v9];
  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __66__WBSFaviconProviderPrivateCache_removeImageDataForPageURLString___block_invoke_7(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  id v8 = *(void **)(a1 + 32);
  id v9 = a3;
  id v10 = [v8 UUIDString];
  id v11 = [v9 UUIDString];

  LODWORD(v9) = [v10 isEqual:v11];
  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)removeAllImageDataWithCompletionHandler:(id)a3
{
  uint64_t v5 = (void (**)(id, void *))a3;
  id v4 = [(NSMutableDictionary *)self->_pageURLStringToIconInfoDict allKeys];
  [(NSCache *)self->_uuidToImageDataCache removeAllObjects];
  [(NSMutableDictionary *)self->_pageURLStringToIconInfoDict removeAllObjects];
  [(NSMutableDictionary *)self->_iconURLStringToIconInfoDict removeAllObjects];
  if (v5) {
    v5[2](v5, v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlStringToRejectedResourceIconInfoDict, 0);
  objc_storeStrong((id *)&self->_iconURLStringToIconInfoDict, 0);
  objc_storeStrong((id *)&self->_pageURLStringToIconInfoDict, 0);
  objc_storeStrong((id *)&self->_uuidToImageDataCache, 0);
}

@end