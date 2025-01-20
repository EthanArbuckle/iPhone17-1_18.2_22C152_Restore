@interface SUUIProductPageDataConsumer
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
- (id)productPageWithDictionary:(id)a3;
@end

@implementation SUUIProductPageDataConsumer

- (id)productPageWithDictionary:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v42 = objc_alloc_init(SUUIProductPage);
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__31;
  v56 = __Block_byref_object_dispose__31;
  id v57 = 0;
  v41 = [v3 objectForKey:@"storePlatformPrewarmDataKey"];
  v40 = [v3 objectForKey:@"storePlatformData"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v40 objectForKey:v41], (v39 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v39 = [v40 objectForKey:@"product"];
    if (!v39)
    {
      v39 = [v40 objectForKey:@"product-dv-product"];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v39 objectForKey:@"results"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = __57__SUUIProductPageDataConsumer_productPageWithDictionary___block_invoke;
      v51[3] = &unk_265403958;
      v51[4] = &v52;
      [v4 enumerateKeysAndObjectsUsingBlock:v51];
    }
  }
  if (v53[5])
  {
    v38 = [v3 objectForKey:@"versionHistory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
      v6 = +[SUUIReleaseNote dateFormatter];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v7 = v38;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v47 objects:v59 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v48 != v9) {
              objc_enumerationMutation(v7);
            }
            uint64_t v11 = *(void *)(*((void *)&v47 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v12 = [[SUUIReleaseNote alloc] initWithReleaseNoteDictionary:v11 dateFormatter:v6];
              if (v12) {
                [v5 addObject:v12];
              }
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v47 objects:v59 count:16];
        }
        while (v8);
      }

      [(id)v53[5] _setVersionHistory:v5];
    }
    v13 = [v3 objectForKey:@"topInAppPurchases"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v15 = v13;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v58 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v44 != v17) {
              objc_enumerationMutation(v15);
            }
            uint64_t v19 = *(void *)(*((void *)&v43 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v20 = [[SUUIInAppPurchase alloc] initWithInAppPurchaseDictionary:v19];
              if (v20) {
                [v14 addObject:v20];
              }
            }
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v58 count:16];
        }
        while (v16);
      }

      [(id)v53[5] _setInAppPurchases:v14];
    }
    [(SUUIProductPage *)v42 setItem:v53[5]];
  }
  v21 = [v3 objectForKey:@"infoSection"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = [[SUUIProductPageProductInfo alloc] initWithInfoSectionDictionaries:v21];
    if ([(SUUIProductPageProductInfo *)v22 numberOfEntries] >= 1) {
      [(SUUIProductPage *)v42 setProductInformation:v22];
    }
  }
  v23 = [v3 objectForKey:@"customersAlsoBought"];
  v24 = [v3 objectForKey:@"moreByThisDeveloper"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v26 = objc_opt_class();
    v27 = SUUIStorePageItemsWithStorePlatformDictionary(v40, v41, v26);
    v28 = objc_alloc_init(SUUIPageComponentContext);
    [(SUUIPageComponentContext *)v28 setItems:v27];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(SUUIPageComponentContext *)v28 setComponentDictionary:v24];
      v29 = [[SUUISwooshPageComponent alloc] initWithRelatedContentContext:v28];
      [v25 addObject:v29];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(SUUIPageComponentContext *)v28 setComponentDictionary:v23];
      v30 = [[SUUISwooshPageComponent alloc] initWithRelatedContentContext:v28];
      [v25 addObject:v30];
    }
    [(SUUIProductPage *)v42 setRelatedContentSwooshes:v25];
  }
  v31 = [v3 objectForKey:@"reviewsUrlsData"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v32 = [[SUUIReviewConfiguration alloc] initWithConfigurationDictionary:v31];
    [(SUUIProductPage *)v42 setReviewConfiguration:v32];
  }
  v33 = (void *)[objc_alloc(MEMORY[0x263F7B230]) initWithStorePlatformData:v3];
  [(SUUIProductPage *)v42 setMetricsConfiguration:v33];
  v34 = SSVGetMetricsPageDescriptionWithPlatformDictionary();
  [(SUUIProductPage *)v42 setMetricsPageDescription:v34];

  v35 = [v3 objectForKey:@"uber"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v36 = [[SUUIUber alloc] initWithUberDictionary:v35];
    [(SUUIProductPage *)v42 setUber:v36];
  }
  _Block_object_dispose(&v52, 8);

  return v42;
}

void __57__SUUIProductPageDataConsumer_productPageWithDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [[SUUIProductPageItem alloc] initWithLookupDictionary:v9];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  *a4 = 1;
}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 allHeaderFields];
  uint64_t v11 = ISDictionaryValueForCaseInsensitiveString();

  if (v11 || ([v9 MIMEType], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if ([v11 rangeOfString:@"itml" options:1] != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v14 = objc_alloc_init(SUUIProductPage);
      [(SUUIProductPage *)v14 setITMLData:v8];
      [(SUUIProductPage *)v14 setITMLResponse:v9];
      id v13 = 0;
      if (!a5) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
  }
  id v18 = 0;
  v12 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:&v18];
  id v13 = v18;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([(SUUIProductPageDataConsumer *)self productPageWithDictionary:v12],
        id v14 = (SUUIProductPage *)objc_claimAutoreleasedReturnValue(),
        [v9 URL],
        id v15 = objc_claimAutoreleasedReturnValue(),
        [(SUUIProductPage *)v14 setPageURL:v15],
        v15,
        !v14))
  {
    if ([v11 isEqualToString:@"text/html"])
    {
      uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:@"SUUIErrorDomain" code:1 userInfo:0];

      id v14 = 0;
      id v13 = (id)v16;
    }
    else
    {
      id v14 = 0;
    }
  }

  if (a5)
  {
LABEL_12:
    if (!v14) {
      *a5 = v13;
    }
  }
LABEL_14:

  return v14;
}

@end