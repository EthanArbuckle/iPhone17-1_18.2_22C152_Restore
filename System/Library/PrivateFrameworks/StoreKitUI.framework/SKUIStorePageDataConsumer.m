@interface SKUIStorePageDataConsumer
- (Class)storePageClass;
- (SKUIStorePageDataConsumer)init;
- (id)_artistPageComponentsForDictionary:(id)a3 items:(id)a4;
- (id)_backgroundArtworkWithDictionary:(id)a3;
- (id)_bannerRoomComponentsForDictionary:(id)a3 items:(id)a4;
- (id)_customPageComponentsForDictionary:(id)a3 items:(id)a4;
- (id)_groupingPageComponentsForDictionary:(id)a3 items:(id)a4;
- (id)_multiRoomComponentsForDictionary:(id)a3 items:(id)a4;
- (id)_newCustomPageComponentForBlockType:(id)a3 context:(id)a4;
- (id)_newFeaturedContentComponentForKind:(int64_t)a3 context:(id)a4;
- (id)_newPageComponentContextWithDictionary:(id)a3;
- (id)_roomComponentsForDictionary:(id)a3 items:(id)a4 gridType:(int64_t)a5;
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
- (id)storePageWithDictionary:(id)a3;
- (id)storePageWithDictionary:(id)a3 response:(id)a4;
- (void)init;
- (void)setStorePageClass:(Class)a3;
@end

@implementation SKUIStorePageDataConsumer

- (SKUIStorePageDataConsumer)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStorePageDataConsumer init]();
  }
  v5.receiver = self;
  v5.super_class = (Class)SKUIStorePageDataConsumer;
  v3 = [(SKUIStorePageDataConsumer *)&v5 init];
  if (v3) {
    v3->_storePageClass = (Class)objc_opt_class();
  }
  return v3;
}

- (id)storePageWithDictionary:(id)a3
{
  return [(SKUIStorePageDataConsumer *)self storePageWithDictionary:a3 response:0];
}

- (id)storePageWithDictionary:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init([(SKUIStorePageDataConsumer *)self storePageClass]);
  v9 = [v7 URL];
  [v8 setPageURL:v9];

  v10 = [v6 objectForKey:@"pageType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 setPageType:v10];
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  if (SKUIStorePageTypeIsProductPage(v11))
  {
    v12 = +[SSVURLDataConsumer consumer];
    v13 = [v12 productPageWithDictionary:v6];

    if (v13)
    {
      v14 = [v7 URL];
      [v13 setDefaultPageFragment:SKUIProductPageFragmentWithURL(v14)];

      [v8 setProductPage:v13];
      goto LABEL_50;
    }
  }
  v15 = [v6 objectForKey:@"pageTitle"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 setTitle:v15];
  }
  v16 = [(SKUIStorePageDataConsumer *)self _backgroundArtworkWithDictionary:v6];
  v17 = [v16 URL];

  if (v17) {
    [v8 setBackgroundArtwork:v16];
  }
  v49 = v16;
  uint64_t v18 = [objc_alloc(MEMORY[0x1E4FA8208]) initWithStorePlatformData:v6];
  [v8 setMetricsConfiguration:v18];
  v19 = SSVGetMetricsPageDescriptionWithPlatformDictionary();
  [v8 setMetricsPageDescription:v19];

  v20 = [v6 objectForKey:@"uber"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v20 count]
    && (v21 = [[SKUIUber alloc] initWithUberDictionary:v20]) != 0)
  {
    v51 = v21;
    objc_msgSend(v8, "setUber:");
  }
  else
  {
    v51 = 0;
  }
  v22 = [v6 objectForKey:@"artist"];
  objc_opt_class();
  id v50 = v7;
  v47 = v22;
  if (objc_opt_isKindOfClass())
  {
    if (!v11)
    {
      v11 = @"artist";
      [v8 setPageType:v11];
    }
    v23 = [v22 objectForKey:@"name"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v8 setTitle:v23];
    }
  }
  else
  {
    v23 = v20;
  }
  v24 = [v6 objectForKey:@"storePlatfromData"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v25 = [v6 objectForKey:@"storePlatformData"];

    v24 = (void *)v25;
  }
  objc_opt_class();
  v48 = (void *)v18;
  if (objc_opt_isKindOfClass())
  {
    v10 = [v6 objectForKey:@"storePlatformPrewarmDataKey"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v26 = v10;
    }
    else {
      id v26 = 0;
    }
    v28 = v51;
    uint64_t v29 = objc_opt_class();
    uint64_t v27 = SKUIStorePageItemsWithStorePlatformDictionary(v24, v26, v29);
  }
  else
  {
    uint64_t v27 = 0;
    v10 = v23;
    v28 = v51;
  }
  if (![(__CFString *)v11 isEqualToString:@"grouping"])
  {
    if (![(__CFString *)v11 isEqualToString:@"room"])
    {
      if ([(__CFString *)v11 isEqualToString:@"multiroom"])
      {
        uint64_t v30 = [(SKUIStorePageDataConsumer *)self _multiRoomComponentsForDictionary:v6 items:v27];
        goto LABEL_43;
      }
      if ([(__CFString *)v11 isEqualToString:@"artist"])
      {
        uint64_t v30 = [(SKUIStorePageDataConsumer *)self _artistPageComponentsForDictionary:v6 items:v27];
        goto LABEL_43;
      }
      if ([(__CFString *)v11 isEqualToString:@"bannerRoom"])
      {
        uint64_t v30 = [(SKUIStorePageDataConsumer *)self _bannerRoomComponentsForDictionary:v6 items:v27];
        goto LABEL_43;
      }
      if ([(__CFString *)v11 isEqualToString:@"custom"])
      {
        uint64_t v30 = [(SKUIStorePageDataConsumer *)self _customPageComponentsForDictionary:v6 items:v27];
        goto LABEL_43;
      }
      if ([(__CFString *)v11 isEqualToString:@"trailerRoom"])
      {
        v31 = self;
        id v32 = v6;
        uint64_t v33 = v27;
        uint64_t v34 = 5;
        goto LABEL_34;
      }
      if (![(__CFString *)v11 isEqualToString:@"search-doc-type"])
      {
        v35 = 0;
        goto LABEL_44;
      }
    }
    v31 = self;
    id v32 = v6;
    uint64_t v33 = v27;
    uint64_t v34 = 0;
LABEL_34:
    uint64_t v30 = [(SKUIStorePageDataConsumer *)v31 _roomComponentsForDictionary:v32 items:v33 gridType:v34];
    goto LABEL_43;
  }
  uint64_t v30 = [(SKUIStorePageDataConsumer *)self _groupingPageComponentsForDictionary:v6 items:v27];
LABEL_43:
  v35 = (void *)v30;
LABEL_44:
  v36 = [(SKUIUber *)v28 artworkProvider];
  v46 = v11;
  v37 = (void *)v27;
  if ([v36 hasArtwork])
  {
    uint64_t v38 = 1;
    v39 = [[SKUIMediaComponent alloc] initWithArtworkProvider:v36 appearance:1];
    [v35 insertObject:v39 atIndex:0];
  }
  else
  {
    uint64_t v38 = 0;
  }
  v40 = [(SKUIUber *)v28 text];
  if ([v40 length])
  {
    v41 = [[SKUIEditorialComponent alloc] initWithUberText:v40];
    [v35 insertObject:v41 atIndex:v38];
  }
  [v8 setPageComponents:v35];
  v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", @"pageTitle", @"pageType", @"backgroundImage", @"uber", @"storePlatformData", @"storePlatformPrewarmDataKey", @"blocks", @"contents", @"children", @"fcStructure", @"charts", @"genreId", @"omnitureMetrics", @"mediaType", @"unAvailableContentIds", @"allCategoriesLink", @"metrics",
                  @"metrics_base",
                  @"metricsBase",
                  @"mt",
                  @"gratisIdentifiers",
                  0);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __62__SKUIStorePageDataConsumer_storePageWithDictionary_response___block_invoke;
  v52[3] = &unk_1E6425528;
  id v53 = v42;
  id v54 = v8;
  id v43 = v42;
  [v6 enumerateKeysAndObjectsUsingBlock:v52];

  v13 = v49;
  id v7 = v50;
  v11 = v46;
LABEL_50:

  id v44 = v8;
  return v44;
}

void __62__SKUIStorePageDataConsumer_storePageWithDictionary_response___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) containsObject:v6] & 1) == 0) {
    [*(id *)(a1 + 40) setValue:v5 forPageKey:v6];
  }
}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    id v14 = 0;
    v15 = 0;
    if (!a5) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  v11 = [v9 allHeaderFields];
  v12 = ISDictionaryValueForCaseInsensitiveString();

  if ((v12 || ([v10 MIMEType], (v12 = objc_claimAutoreleasedReturnValue()) != 0))
    && [v12 rangeOfString:@"itml" options:1] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = objc_alloc_init(SKUIStorePage);
    [(SKUIStorePage *)v15 setITMLData:v8];
    [(SKUIStorePage *)v15 setITMLResponse:v10];
    [(SKUIStorePage *)v15 setPageType:@"itml"];
    id v14 = 0;
  }
  else
  {
    id v17 = 0;
    v13 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:&v17];
    id v14 = v17;
    objc_opt_class();
    v15 = 0;
    if (objc_opt_isKindOfClass())
    {
      v15 = [(SKUIStorePageDataConsumer *)self storePageWithDictionary:v13 response:v10];
    }
  }
  if (a5)
  {
LABEL_12:
    if (!v15) {
      *a5 = v14;
    }
  }
LABEL_14:

  return v15;
}

- (id)_artistPageComponentsForDictionary:(id)a3 items:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [(SKUIStorePageDataConsumer *)self _customPageComponentsForDictionary:v6 items:v7];
  if ([v9 count]) {
    [v8 addObjectsFromArray:v9];
  }
  v10 = [v6 objectForKey:@"contentData"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [(SKUIStorePageDataConsumer *)self _newPageComponentContextWithDictionary:v6];
    [v11 setItems:v7];
    v12 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    if (v13)
    {
      id v14 = [v10 objectForKey:@"iPadSoftware"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v11 setComponentDictionary:v14];
        v15 = [[SKUISwooshPageComponent alloc] initWithFeaturedContentContext:v11 kind:260];
        [v8 addObject:v15];
      }
      v16 = [v10 objectForKey:@"mobileSoftwareBundles"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v11 setComponentDictionary:v16];
        id v17 = [[SKUIGridComponent alloc] initWithFeaturedContentContext:v11 kind:0];
        [v8 addObject:v17];
      }
      uint64_t v18 = [v10 objectForKey:@"iPhoneSoftware"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v11 setComponentDictionary:v18];
        v19 = [[SKUISwooshPageComponent alloc] initWithFeaturedContentContext:v11 kind:260];
        [v8 addObject:v19];
      }
    }
    else
    {
      id v14 = [v10 objectForKey:@"iPhoneSoftware"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v11 setComponentDictionary:v14];
        v20 = [[SKUIGridComponent alloc] initWithFeaturedContentContext:v11 kind:0];
        [v8 addObject:v20];
      }
      v16 = [v10 objectForKey:@"mobileSoftwareBundles"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_16;
      }
      [v11 setComponentDictionary:v16];
      uint64_t v18 = [[SKUIGridComponent alloc] initWithFeaturedContentContext:v11 kind:0];
      [v8 addObject:v18];
    }

LABEL_16:
  }

  return v8;
}

- (id)_backgroundArtworkWithDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 objectForKey:@"backgroundImage"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [[SKUIArtwork alloc] initWithArtworkDictionary:v4];
  }
  else
  {
    id v6 = [v3 objectForKey:@"blocks"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        v15 = v4;
        v16 = v6;
        uint64_t v10 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v13 = [v12 objectForKey:@"type"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && [v13 isEqualToString:@"page"])
              {
                v4 = [v12 objectForKey:@"backgroundImage"];

                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  id v5 = [[SKUIArtwork alloc] initWithArtworkDictionary:v4];
                }
                else {
                  id v5 = 0;
                }
                id v6 = v16;

                goto LABEL_22;
              }
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v9) {
            continue;
          }
          break;
        }
        id v5 = 0;
        v4 = v15;
        id v6 = v16;
      }
      else
      {
        id v5 = 0;
      }
LABEL_22:
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)_bannerRoomComponentsForDictionary:(id)a3 items:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [(SKUIStorePageDataConsumer *)self _customPageComponentsForDictionary:v6 items:v7];
  if ([v9 count]) {
    [v8 addObjectsFromArray:v9];
  }
  uint64_t v10 = [v6 objectForKey:@"contents"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [(SKUIStorePageDataConsumer *)self _newPageComponentContextWithDictionary:v6];
    id v25 = v6;
    [v11 setComponentDictionary:v6];
    id v24 = v7;
    [v11 setItems:v7];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v23 = v10;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v19 = (void *)[v11 copy];
            [v19 setComponentDictionary:v18];
            long long v20 = [[SKUIBrickItem alloc] initWithBannerRoomContext:v19];
            if (v20) {
              [v12 addObject:v20];
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v15);
    }

    v21 = [[SKUIGridComponent alloc] initWithBrickItems:v12];
    [v8 addObject:v21];

    id v6 = v25;
    id v7 = v24;
    uint64_t v10 = v23;
  }

  return v8;
}

- (id)_customPageComponentsForDictionary:(id)a3 items:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = [v5 objectForKey:@"customBlocks"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v9 = v7;
  if ((isKindOfClass & 1) != 0
    || ([v5 objectForKey:@"children"],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = v5,
        !v10))
  {
    uint64_t v10 = [v9 objectForKey:@"blocks"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v22 = v7;
    id v23 = v5;
    id v11 = [(SKUIStorePageDataConsumer *)self _newPageComponentContextWithDictionary:v5];
    [v11 setItems:v6];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v21 = v10;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v18 = [v17 objectForKey:@"type"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v11 setComponentDictionary:v17];
              id v19 = [(SKUIStorePageDataConsumer *)self _newCustomPageComponentForBlockType:v18 context:v11];
              if (v19) {
                [v24 addObject:v19];
              }
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v14);
    }

    id v5 = v23;
    uint64_t v10 = v21;
    id v7 = v22;
  }

  return v24;
}

- (id)_groupingPageComponentsForDictionary:(id)a3 items:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = [(SKUIStorePageDataConsumer *)self _newPageComponentContextWithDictionary:v6];
  [v9 setItems:v7];
  uint64_t v10 = [v6 objectForKey:@"fcStructure"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = v7;
    id v31 = v6;
    long long v29 = v10;
    long long v28 = [v10 objectForKey:@"model"];
    id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v28, 0);
    uint64_t v12 = [v11 count];
    if (v12 >= 1)
    {
      uint64_t v13 = v12;
      for (uint64_t i = 0; i < v13; ++i)
      {
        uint64_t v15 = [v11 objectAtIndex:i];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v16 = [v15 objectForKey:@"fcKind"];
          if ((objc_opt_respondsToSelector() & 1) != 0
            && ([v9 setComponentDictionary:v15],
                (id v17 = -[SKUIStorePageDataConsumer _newFeaturedContentComponentForKind:context:](self, "_newFeaturedContentComponentForKind:context:", [v16 integerValue], v9)) != 0))
          {
            uint64_t v18 = v17;
            [v8 addObject:v17];
          }
          else
          {
            uint64_t v18 = [v15 objectForKey:@"children"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v19 = self;
              id v20 = v9;
              id v21 = v8;
              uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", i + 1, objc_msgSend(v18, "count"));
              [v11 insertObjects:v18 atIndexes:v22];
              uint64_t v13 = [v11 count];

              id v8 = v21;
              id v9 = v20;
              self = v19;
            }
          }
        }
      }
    }

    id v7 = v30;
    id v6 = v31;
    uint64_t v10 = v29;
  }
  id v23 = [v6 objectForKey:@"subtitle"];
  if (!v23)
  {
    id v24 = [v6 objectForKey:@"isAgeBandGrouping"];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v24 BOOLValue])
    {
      id v23 = [v6 objectForKey:@"ageBandGroupingTitle"];
    }
    else
    {
      id v23 = 0;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v25 = [[SKUIDividerPageComponent alloc] initWithDividerTitle:v23];
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x2020000000;
    uint64_t v36 = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __72__SKUIStorePageDataConsumer__groupingPageComponentsForDictionary_items___block_invoke;
    v32[3] = &unk_1E6425550;
    v32[4] = &v33;
    [v8 enumerateObjectsUsingBlock:v32];
    [v8 insertObject:v25 atIndex:v34[3]];
    _Block_object_dispose(&v33, 8);
  }
  [v9 setComponentDictionary:v6];
  long long v26 = [[SKUIAccountButtonsComponent alloc] initWithFeaturedContentContext:v9 kind:0];
  [v8 addObject:v26];

  return v8;
}

uint64_t __72__SKUIStorePageDataConsumer__groupingPageComponentsForDictionary_items___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 componentType];
  if (result != 6 && result != 13)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)_multiRoomComponentsForDictionary:(id)a3 items:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = [(SKUIStorePageDataConsumer *)self _customPageComponentsForDictionary:v6 items:v7];
  if ([v9 count]) {
    [v8 addObjectsFromArray:v9];
  }
  uint64_t v10 = [v6 objectForKey:@"segments"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = v6;
    id v11 = [(SKUIStorePageDataConsumer *)self _newPageComponentContextWithDictionary:v6];
    [v11 setItems:v7];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v11 setComponentDictionary:v17];
            uint64_t v18 = [[SKUISwooshPageComponent alloc] initWithRoomContext:v11];
            [v8 addObject:v18];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    id v6 = v20;
  }

  return v8;
}

- (id)_newCustomPageComponentForBlockType:(id)a3 context:(id)a4
{
  id v5 = a4;
  uint64_t v6 = SKUIPageComponentTypeForBlockType(a3);
  id v7 = (objc_class *)SKUIPageComponentClassForComponentType(v6);
  if (v7) {
    id v8 = (void *)[[v7 alloc] initWithCustomPageContext:v5];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)_newFeaturedContentComponentForKind:(int64_t)a3 context:(id)a4
{
  id v5 = a4;
  uint64_t v6 = SKUIPageComponentTypeForFeaturedContentKind(a3);
  id v7 = (objc_class *)SKUIPageComponentClassForComponentType(v6);
  if (v7) {
    id v8 = (void *)[[v7 alloc] initWithFeaturedContentContext:v5 kind:a3];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)_newPageComponentContextWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SKUIPageComponentContext);
  id v5 = [v3 objectForKey:@"storePlatformProfilesMap"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SKUIPageComponentContext *)v4 setPlatformKeyProfileOverrides:v5];
  }
  uint64_t v6 = [v3 objectForKey:@"unAvailableContentIds"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SKUIPageComponentContext *)v4 setUnavailableItemIdentifiers:v6];
  }

  return v4;
}

- (id)_roomComponentsForDictionary:(id)a3 items:(id)a4 gridType:(int64_t)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = [(SKUIStorePageDataConsumer *)self _customPageComponentsForDictionary:v8 items:v9];
  if ([v11 count]) {
    [v10 addObjectsFromArray:v11];
  }
  id v12 = [v8 objectForKey:@"sortData"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v13 = [[SKUIMenuPageComponent alloc] initWithRoomSortData:v12];
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = [(SKUIStorePageDataConsumer *)self _newPageComponentContextWithDictionary:v8];
  [v14 setComponentDictionary:v8];
  [v14 setItems:v9];
  uint64_t v15 = [[SKUIGridComponent alloc] initWithRoomContext:v14 gridType:a5];
  uint64_t v16 = v15;
  if (v15)
  {
    if (v13)
    {
      v21[0] = v15;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      [(SKUIMenuPageComponent *)v13 _setChildComponents:v17 forIndex:[(SKUIMenuPageComponent *)v13 defaultSelectedIndex]];

      uint64_t v18 = v10;
      id v19 = v13;
    }
    else
    {
      uint64_t v18 = v10;
      id v19 = (SKUIMenuPageComponent *)v16;
    }
    [v18 addObject:v19];
  }

  return v10;
}

- (Class)storePageClass
{
  return self->_storePageClass;
}

- (void)setStorePageClass:(Class)a3
{
  self->_storePageClass = a3;
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIStorePageDataConsumer init]";
}

@end