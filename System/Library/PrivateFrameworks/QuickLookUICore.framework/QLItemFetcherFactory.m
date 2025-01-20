@interface QLItemFetcherFactory
+ (id)fetcherForPreviewItem:(id)a3;
+ (id)possibleFetcherClasses;
@end

@implementation QLItemFetcherFactory

+ (id)fetcherForPreviewItem:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isPromisedItem])
  {
LABEL_2:
    v4 = 0;
    goto LABEL_11;
  }
  BOOL v5 = [v3 previewItemType] == 6 || objc_msgSend(v3, "previewItemType") == 4;
  v6 = [v3 sandboxingURLWrapper];

  if (v6)
  {
    v7 = [QLUbiquitousItemFetcher alloc];
    v8 = [v3 sandboxingURLWrapper];
    uint64_t v9 = [(QLUbiquitousItemFetcher *)v7 initWithSandboxingURLWrapper:v8 shouldZipPackageIfNeeded:v5];
LABEL_10:
    v4 = (QLDataFetcher *)v9;

    goto LABEL_11;
  }
  v10 = [v3 previewItemURL];

  if (v10)
  {
    v11 = [QLUbiquitousItemFetcher alloc];
    v8 = [v3 previewItemURL];
    uint64_t v9 = [(QLUbiquitousItemFetcher *)v11 initWithURL:v8 shouldZipPackageIfNeeded:v5];
    goto LABEL_10;
  }
  v13 = [v3 previewItemData];

  if (v13)
  {
    v14 = [QLDataFetcher alloc];
    v15 = [v3 previewItemData];
    v16 = [v3 previewItemContentType];
    v17 = [v3 previewItemTitle];
    uint64_t v18 = [(QLDataFetcher *)v14 initWithData:v15 contentType:v16 previewItemTitle:v17];
  }
  else
  {
    v19 = [v3 previewItemDataProvider];

    if (v19)
    {
      v20 = [QLDataFetcher alloc];
      v15 = [v3 previewItemContentType];
      v4 = [(QLDataFetcher *)v20 initWithItem:v3 contentType:v15];
      goto LABEL_21;
    }
    v21 = [v3 previewItemProvider];

    if (v21)
    {
      v22 = [QLItemProviderFetcher alloc];
      v23 = [v3 previewItemContentType];
      v24 = [v3 itemSize];
      v4 = [(QLItemProviderFetcher *)v22 initWithContentType:v23 fileSize:v24];

      v15 = [v3 previewItemProvider];
      [(QLDataFetcher *)v4 setItemProvider:v15];
      goto LABEL_21;
    }
    uint64_t v25 = [v3 searchableItemIdentifier];
    if (!v25
      || (v26 = (void *)v25,
          [v3 searchableItemApplicationBundleIdentifier],
          v27 = objc_claimAutoreleasedReturnValue(),
          v27,
          v26,
          !v27))
    {
      v29 = [v3 fpItem];

      if (!v29)
      {
        v31 = QLSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          int v32 = 138412290;
          id v33 = v3;
          _os_log_impl(&dword_1E2805000, v31, OS_LOG_TYPE_DEBUG, "No fetcher available for item: %@ #PreviewItem", (uint8_t *)&v32, 0xCu);
        }

        goto LABEL_2;
      }
      v30 = [QLFPItemFetcher alloc];
      v8 = [v3 fpItem];
      uint64_t v9 = [(QLFPItemFetcher *)v30 initWithFPItem:v8 shouldZipPackageIfNeeded:v5];
      goto LABEL_10;
    }
    v28 = [QLSpotlightFetcher alloc];
    v15 = [v3 searchableItemIdentifier];
    v16 = [v3 spotlightQueryString];
    v17 = [v3 searchableItemApplicationBundleIdentifier];
    uint64_t v18 = [(QLSpotlightFetcher *)v28 initWithSearchableItemUniqueIdentifier:v15 queryString:v16 applicationBundleIdentifier:v17];
  }
  v4 = (QLDataFetcher *)v18;

LABEL_21:
LABEL_11:

  return v4;
}

+ (id)possibleFetcherClasses
{
  if (possibleFetcherClasses_onceToken != -1) {
    dispatch_once(&possibleFetcherClasses_onceToken, &__block_literal_global);
  }
  v2 = (void *)possibleFetcherClasses__possibleFetcherClasses;
  return v2;
}

uint64_t __46__QLItemFetcherFactory_possibleFetcherClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  possibleFetcherClasses__possibleFetcherClasses = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  return MEMORY[0x1F41817F8]();
}

@end