@interface SearchUIRequestUserReportHandler
+ (id)contextMenuForCardSection:(id)a3 result:(id)a4 feedbackRequest:(id)a5 environment:(id)a6;
+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4;
- (BOOL)prefersContextMenu;
- (BOOL)prefersModalPresentation;
- (id)contextMenu;
- (id)createViewControllerForCommand:(id)a3 environment:(id)a4;
- (id)defaultSymbolName;
- (unint64_t)destination;
@end

@implementation SearchUIRequestUserReportHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  id v4 = a3;
  v5 = [v4 cardSection];
  v6 = [v5 userReportRequest];

  if (v6 && ([v4 supportsCustomUserReportRequestAfforance] & 1) == 0)
  {
    v7 = objc_opt_new();
    [v7 setUserReportRequest:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  id v6 = a4;
  v7 = [a3 userReportRequest];
  v8 = [(SearchUICommandHandler *)self rowModel];
  v9 = +[SearchUIRequestUserReportUtility createUserReportViewControllerWith:v7 rowModel:v8 environment:v6];

  return v9;
}

- (BOOL)prefersModalPresentation
{
  return 1;
}

- (BOOL)prefersContextMenu
{
  return 1;
}

- (id)contextMenu
{
  v3 = [(SearchUICommandHandler *)self rowModel];
  id v4 = [v3 cardSection];
  v5 = [v3 identifyingResult];
  id v6 = [v4 userReportRequest];
  v7 = objc_opt_class();
  v8 = [(SearchUICommandHandler *)self environment];
  v9 = [v7 contextMenuForCardSection:v4 result:v5 feedbackRequest:v6 environment:v8];

  return v9;
}

+ (id)contextMenuForCardSection:(id)a3 result:(id)a4 feedbackRequest:(id)a5 environment:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v27 = a4;
  id v9 = a5;
  id v26 = a6;
  id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v11 = [v9 userReportOptions];
  v12 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

  id val = [v26 feedbackDelegate];
  objc_initWeak(&location, val);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v13 = [v9 userReportOptions];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x1E4FB13F0];
        v19 = [v17 name];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __97__SearchUIRequestUserReportHandler_contextMenuForCardSection_result_feedbackRequest_environment___block_invoke;
        v29[3] = &unk_1E6E74888;
        v29[4] = v17;
        objc_copyWeak(&v32, &location);
        id v30 = v27;
        id v31 = v28;
        v20 = [v18 actionWithTitle:v19 image:0 identifier:0 handler:v29];

        [v12 addObject:v20];
        objc_destroyWeak(&v32);
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v14);
  }

  if ([v12 count])
  {
    v21 = (void *)MEMORY[0x1E4FB1970];
    v22 = [v9 title];
    v23 = [v21 menuWithTitle:v22 children:v12];
  }
  else
  {
    v23 = 0;
  }
  objc_destroyWeak(&location);

  return v23;
}

void __97__SearchUIRequestUserReportHandler_contextMenuForCardSection_result_feedbackRequest_environment___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) preferredOpenableURL];

  if (v2) {
    +[SearchUIUtilities openPunchout:*(void *)(a1 + 32)];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (objc_opt_respondsToSelector())
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F9A528]) initWithSelection:*(void *)(a1 + 32) result:*(void *)(a1 + 40) cardSection:*(void *)(a1 + 48)];
    [WeakRetained didReportUserResponseFeedback:v3];
  }
}

- (unint64_t)destination
{
  return 3;
}

- (id)defaultSymbolName
{
  return @"exclamationmark.bubble";
}

@end