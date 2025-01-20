@interface SearchUIOpenCoreSpotlightItemHandler
- (BOOL)supportsCopy;
- (id)createViewControllerForCommand:(id)a3 environment:(id)a4;
- (id)itemProvider;
- (void)getUserActivityForCommand:(id)a3 environment:(id)a4 completionHandler:(id)a5;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
@end

@implementation SearchUIOpenCoreSpotlightItemHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(SearchUICommandHandler *)self rowModel];
  v11 = [v10 cardSection];
  v12 = [v11 appEntityAnnotation];

  if (v12)
  {
    v13 = [(SearchUICommandHandler *)self rowModel];
    v14 = [v13 cardSection];
    v15 = [v14 appEntityAnnotation];
    v16 = [v8 applicationBundleIdentifier];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __80__SearchUIOpenCoreSpotlightItemHandler_performCommand_triggerEvent_environment___block_invoke;
    v18[3] = &unk_1E6E72588;
    id v19 = v8;
    unint64_t v22 = a4;
    id v20 = v9;
    v21 = self;
    +[SearchUIToolKitUtilities performOpenIntentForAnnotation:v15 bundleId:v16 completionHandler:v18];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)SearchUIOpenCoreSpotlightItemHandler;
    [(SearchUIOpenUserActivityHandler *)&v17 performCommand:v8 triggerEvent:a4 environment:v9];
  }
}

void __80__SearchUIOpenCoreSpotlightItemHandler_performCommand_triggerEvent_environment___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __80__SearchUIOpenCoreSpotlightItemHandler_performCommand_triggerEvent_environment___block_invoke_2;
    v7[3] = &unk_1E6E72560;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 56);
    id v8 = v3;
    uint64_t v11 = v4;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    id v9 = v5;
    uint64_t v10 = v6;
    +[SearchUIUtilities dispatchMainIfNecessary:v7];
  }
}

id __80__SearchUIOpenCoreSpotlightItemHandler_performCommand_triggerEvent_environment___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5.receiver = *(id *)(a1 + 48);
  v5.super_class = (Class)SearchUIOpenCoreSpotlightItemHandler;
  return objc_msgSendSuper2(&v5, sel_performCommand_triggerEvent_environment_, v2, v1, v3);
}

- (void)getUserActivityForCommand:(id)a3 environment:(id)a4 completionHandler:(id)a5
{
  id v17 = a3;
  id v7 = a4;
  id v8 = (objc_class *)MEMORY[0x1E4F22488];
  id v9 = (void (**)(id, void *, void *))a5;
  id v10 = [v8 alloc];
  uint64_t v11 = (void *)[v10 initWithActivityType:*MEMORY[0x1E4F229F0]];
  v12 = objc_opt_new();
  v13 = [v17 coreSpotlightIdentifier];
  if (v13) {
    [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F229F8]];
  }
  v14 = [v7 searchString];
  if (v14) {
    [v12 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F229E8]];
  }
  v15 = [v17 actionIdentifier];
  if (v15) {
    [v12 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F22770]];
  }
  [v11 setUserInfo:v12];
  v16 = [v17 applicationBundleIdentifier];
  v9[2](v9, v11, v16);
}

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SearchUICommandHandler *)self rowModel];
  id v9 = [v7 coreSpotlightIdentifier];
  id v10 = [v7 applicationBundleIdentifier];

  id v11 = objc_alloc(MEMORY[0x1E4F3A648]);
  v12 = [v6 searchString];

  v13 = [v8 displayTitle];
  v14 = (void *)[v11 initWithSearchableItemUniqueIdentifier:v9 queryString:v12 applicationBundleIdentifier:v10 previewTitle:v13];

  if ([MEMORY[0x1E4F3A650] canPreviewItem:v14]
    && ([v8 identifyingResult],
        v15 = objc_claimAutoreleasedReturnValue(),
        BOOL v16 = +[SearchUIUtilities resultIsSiriAction:v15],
        v15,
        !v16))
  {
    id v21 = objc_alloc(MEMORY[0x1E4F3A650]);
    v24[0] = v14;
    unint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    id v20 = (SearchUIFallbackPeekViewController *)[v21 initWithPreviewItems:v22];
  }
  else
  {
    id v17 = +[SearchUIUtilities bundleIdentifierForApp:4];
    int v18 = [v10 isEqualToString:v17];

    if (v18)
    {
      id v19 = +[SearchUICalendarStore eventControllerWithIdentifier:v9];
LABEL_8:
      id v20 = v19;
      goto LABEL_11;
    }
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = [[SearchUIFallbackPeekViewController alloc] initWithDetailedRowModel:v8];
        goto LABEL_8;
      }
    }
    id v20 = 0;
  }
LABEL_11:

  return v20;
}

- (BOOL)supportsCopy
{
  return 0;
}

- (id)itemProvider
{
  v18.receiver = self;
  v18.super_class = (Class)SearchUIOpenCoreSpotlightItemHandler;
  uint64_t v3 = [(SearchUICommandHandler *)&v18 itemProvider];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = objc_opt_new();
    id v7 = [(SearchUICommandHandler *)self rowModel];
    id v8 = [v7 identifyingResult];
    id v9 = [v8 itemProviderFileTypes];
    [v6 setFileProviderTypeIdentifiers:v9];

    id v10 = [(SearchUICommandHandler *)self rowModel];
    id v11 = [v10 identifyingResult];
    v12 = [v11 itemProviderDataTypes];
    [v6 setDataProviderTypeIdentifiers:v12];

    v13 = [(SearchUICommandHandler *)self command];
    v14 = [v13 applicationBundleIdentifier];
    [v6 setApplicationBundleIdentifier:v14];

    v15 = [(SearchUICommandHandler *)self command];
    BOOL v16 = [v15 coreSpotlightIdentifier];
    [v6 setCoreSpotlightIdentifier:v16];

    id v5 = +[SearchUIItemProviderUtilities itemProviderForItem:v6];
  }
  return v5;
}

@end