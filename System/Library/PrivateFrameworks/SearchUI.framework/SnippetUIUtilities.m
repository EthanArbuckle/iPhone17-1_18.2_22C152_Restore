@interface SnippetUIUtilities
+ (BOOL)shouldHideViewForCardSection:(id)a3;
+ (BOOL)supportsConfigurationForCardSection:(id)a3;
+ (id)presentingViewController:(id)a3 delegate:(id)a4;
+ (id)supportsConfigurationForCombinedRowModel:(id)a3;
+ (unint64_t)searchUIButtonItemViewStyleFromVRXButtonStyle:(int)a3;
+ (void)createViewControllersForButtons:(id)a3 buttonFont:(id)a4 isCompact:(BOOL)a5 sourceView:(id)a6 rowModel:(id)a7 delegate:(id)a8 completionHandler:(id)a9;
+ (void)emitInstrumentationEvent:(id)a3 delegate:(id)a4;
+ (void)performSFCommand:(id)a3 rowModel:(id)a4 delegate:(id)a5;
+ (void)reportFeedback:(id)a3 queryId:(unint64_t)a4 delegate:(id)a5;
@end

@implementation SnippetUIUtilities

+ (BOOL)supportsConfigurationForCardSection:(id)a3
{
  return +[SearchUIRFCardSectionRowModel supportsConfigurationFor:a3];
}

+ (id)supportsConfigurationForCombinedRowModel:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = objc_msgSend(v3, "cardSectionRowModels", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v10 cardSection];
        BOOL v12 = +[SnippetUIUtilities supportsConfigurationForCardSection:v11];

        if (v12)
        {
          v13 = [v10 cardSection];
          [v4 addObject:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (void)createViewControllersForButtons:(id)a3 buttonFont:(id)a4 isCompact:(BOOL)a5 sourceView:(id)a6 rowModel:(id)a7 delegate:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  uint64_t v20 = createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler__onceToken;
  id v21 = a6;
  if (v20 != -1) {
    dispatch_once(&createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler__onceToken, &__block_literal_global_30);
  }
  v22 = objc_opt_new();
  [v22 setSourceView:v21];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __122__SnippetUIUtilities_createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler___block_invoke_2;
  v29[3] = &unk_1E6E73DF8;
  id v30 = v22;
  id v31 = v18;
  BOOL v37 = a5;
  id v35 = v19;
  id v36 = a1;
  id v32 = v15;
  id v33 = v17;
  id v34 = v16;
  id v23 = v19;
  id v24 = v16;
  id v25 = v17;
  id v26 = v15;
  id v27 = v18;
  id v28 = v22;
  +[SearchUIUtilities dispatchMainIfNecessary:v29];
}

uint64_t __122__SnippetUIUtilities_createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler__activeFactories;
  createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler__activeFactories = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __122__SnippetUIUtilities_createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = objc_opt_new();
  [v2 setTimeLimitForSubsequentButtonGeneratorUpdates:0.5];
  [v2 setDelegate:*(void *)(a1 + 32)];
  [v2 setFeedbackDelegate:*(void *)(a1 + 40)];
  [(id)createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler__activeFactories addObject:v2];
  objc_initWeak(&location, v2);
  uint64_t v3 = *(void *)(a1 + 48);
  if (*(unsigned char *)(a1 + 88)) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 48) count];
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __122__SnippetUIUtilities_createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler___block_invoke_3;
  v5[3] = &unk_1E6E73DD0;
  objc_copyWeak(v10, &location);
  v10[1] = *(id *)(a1 + 80);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  char v11 = *(unsigned char *)(a1 + 88);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 72);
  [v2 fetchSearchUIButtonitemsWithSFButtonItems:v3 maxButtonItems:v4 shouldReverseButtonOrder:0 completion:v5];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __122__SnippetUIUtilities_createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler___block_invoke_3(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __122__SnippetUIUtilities_createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler___block_invoke_4;
  v8[3] = &unk_1E6E73DA8;
  objc_copyWeak(v14, (id *)(a1 + 64));
  id v6 = v5;
  id v7 = *(void **)(a1 + 72);
  id v9 = v6;
  v14[1] = v7;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  char v15 = *(unsigned char *)(a1 + 80);
  id v12 = *(id *)(a1 + 48);
  char v16 = a3;
  id v13 = *(id *)(a1 + 56);
  +[SearchUIUtilities dispatchMainIfNecessary:v8];

  objc_destroyWeak(v14);
}

void __122__SnippetUIUtilities_createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v2 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v8 = *(void **)(a1 + 80);
        id v9 = objc_msgSend(v7, "sfButtonItem", WeakRetained);
        id v10 = [v9 buttonAppearance];
        uint64_t v11 = objc_msgSend(v8, "searchUIButtonItemViewStyleFromVRXButtonStyle:", objc_msgSend(v10, "style"));

        id v12 = +[SearchUIButtonItemViewController buttonItemViewControllerForButtonItem:v7];
        [v12 setRowModel:*(void *)(a1 + 40)];
        [v12 setButtonFont:*(void *)(a1 + 48)];
        [v12 setIsCompact:*(unsigned __int8 *)(a1 + 88)];
        [v12 setFeedbackDelegate:*(void *)(a1 + 56)];
        [v12 updateWithButtonItem:v7 buttonItemViewType:v11];
        id v13 = objc_opt_new();
        [v13 setButtonViewController:v12];
        v14 = [v12 view];
        [v13 setView:v14];

        [v2 addObject:v13];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  if (*(unsigned char *)(a1 + 89))
  {
    [(id)createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler__activeFactories removeObject:WeakRetained];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

+ (unint64_t)searchUIButtonItemViewStyleFromVRXButtonStyle:(int)a3
{
  if ((a3 - 2) > 3) {
    return 1;
  }
  else {
    return qword_1E46B68F8[a3 - 2];
  }
}

+ (void)performSFCommand:(id)a3 rowModel:(id)a4 delegate:(id)a5
{
  if (a3)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = a3;
    id v12 = (id)objc_opt_new();
    [v12 setCommand:v9];

    id v10 = +[SearchUIUtilities environmentForDelegate:v7];

    uint64_t v11 = +[SearchUICommandHandler handlerForButton:v12 rowModel:v8 environment:v10];

    [v11 executeWithTriggerEvent:2];
  }
}

+ (void)emitInstrumentationEvent:(id)a3 delegate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 feedbackListener];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__SnippetUIUtilities_emitInstrumentationEvent_delegate___block_invoke;
    v9[3] = &unk_1E6E72620;
    id v10 = v7;
    id v11 = v5;
    id v8 = v7;
    +[SearchUIUtilities dispatchAsyncIfNecessary:v9];
  }
}

uint64_t __56__SnippetUIUtilities_emitInstrumentationEvent_delegate___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 emitInstrumentationEvent:v4];
  }
  return result;
}

+ (id)presentingViewController:(id)a3 delegate:(id)a4
{
  id v5 = a3;
  id v6 = +[SearchUIUtilities environmentForDelegate:a4];
  id v7 = [v6 presentingViewController];
  if (!v7)
  {
    id v8 = [v6 sourceView];
    id v9 = [v8 window];
    id v7 = [v9 rootViewController];

    if (v5)
    {
      if (!v7)
      {
        id v10 = [v5 window];
        id v7 = [v10 rootViewController];
      }
    }
  }

  return v7;
}

+ (void)reportFeedback:(id)a3 queryId:(unint64_t)a4 delegate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__SnippetUIUtilities_reportFeedback_queryId_delegate___block_invoke;
  v11[3] = &unk_1E6E73598;
  id v12 = v8;
  id v13 = v7;
  unint64_t v14 = a4;
  id v9 = v7;
  id v10 = v8;
  +[SearchUIUtilities dispatchAsyncIfNecessary:v11];
}

void __54__SnippetUIUtilities_reportFeedback_queryId_delegate___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void *)(a1 + 48);
    id v3 = *(id *)(a1 + 40);
    [v3 setQueryId:v2];
    [*(id *)(a1 + 32) reportFeedback:*(void *)(a1 + 40) queryId:*(void *)(a1 + 48)];
  }
}

+ (BOOL)shouldHideViewForCardSection:(id)a3
{
  return +[SearchUIRFCardSectionRowModel shouldHideViewForCardSection:a3];
}

@end