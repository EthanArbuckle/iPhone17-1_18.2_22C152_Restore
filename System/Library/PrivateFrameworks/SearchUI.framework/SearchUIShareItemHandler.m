@interface SearchUIShareItemHandler
- (BOOL)prefersModalPresentation;
- (BOOL)presentShareViewControllerForItem:(id)a3;
- (SearchUICommandHandler)handlerForSharing;
- (id)defaultSymbolName;
- (id)defaultTitle;
- (unint64_t)destination;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
- (void)setHandlerForSharing:(id)a3;
@end

@implementation SearchUIShareItemHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v6 = a3;
  v7 = [(SearchUIShareItemHandler *)self handlerForSharing];
  v8 = v7;
  if (v7)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__SearchUIShareItemHandler_performCommand_triggerEvent_environment___block_invoke;
    v11[3] = &unk_1E6E72848;
    v11[4] = self;
    id v12 = v7;
    [v12 fetchShareableURLWithCompletionHandler:v11];
    id v9 = v12;
  }
  else
  {
    id v9 = [v6 shareItem];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__SearchUIShareItemHandler_performCommand_triggerEvent_environment___block_invoke_8;
    v10[3] = &unk_1E6E72870;
    v10[4] = self;
    objc_msgSend(v9, "searchUI_fetchShareableItemWithCompletionHandler:", v10);
  }
}

void __68__SearchUIShareItemHandler_performCommand_triggerEvent_environment___block_invoke(uint64_t a1, uint64_t a2)
{
  if (([*(id *)(a1 + 32) presentShareViewControllerForItem:a2] & 1) == 0)
  {
    v3 = SearchUIPeekLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __68__SearchUIShareItemHandler_performCommand_triggerEvent_environment___block_invoke_cold_1(a1, v3);
    }
  }
}

uint64_t __68__SearchUIShareItemHandler_performCommand_triggerEvent_environment___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) presentShareViewControllerForItem:a2];
}

- (BOOL)presentShareViewControllerForItem:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __62__SearchUIShareItemHandler_presentShareViewControllerForItem___block_invoke;
    v7[3] = &unk_1E6E72620;
    id v8 = v4;
    id v9 = self;
    +[SearchUIUtilities dispatchMainIfNecessary:v7];
  }
  return v5 != 0;
}

void __62__SearchUIShareItemHandler_presentShareViewControllerForItem___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F9F2E8]);
  v5[0] = *(void *)(a1 + 32);
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  id v4 = (void *)[v2 initWithActivityItems:v3 applicationActivities:0];

  [*(id *)(a1 + 40) requestAuthIfNecessaryAndPresentViewController:v4 animated:1];
}

- (BOOL)prefersModalPresentation
{
  return 1;
}

- (id)defaultTitle
{
  return +[SearchUIUtilities localizedStringForKey:@"SHARE"];
}

- (id)defaultSymbolName
{
  return @"square.and.arrow.up";
}

- (unint64_t)destination
{
  return 3;
}

- (SearchUICommandHandler)handlerForSharing
{
  return (SearchUICommandHandler *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHandlerForSharing:(id)a3
{
}

- (void).cxx_destruct
{
}

void __68__SearchUIShareItemHandler_performCommand_triggerEvent_environment___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_FAULT, "failed to fetch url for share for handler %@", (uint8_t *)&v3, 0xCu);
}

@end