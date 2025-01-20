@interface UIAlertView(KNAdditions)
- (uint64_t)showWithCompletionHandler:()KNAdditions;
- (void)initWithError:()KNAdditions;
@end

@implementation UIAlertView(KNAdditions)

- (void)initWithError:()KNAdditions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 localizedRecoverySuggestion];
  if (!v5) {
    uint64_t v5 = [a3 localizedFailureReason];
  }
  v6 = objc_msgSend(a1, "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", objc_msgSend(a3, "localizedDescription"), v5, 0, 0, 0);
  v7 = (void *)[a3 localizedRecoveryOptions];
  if (v7 && (v8 = v7, [v7 count]))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          [v6 addButtonWithTitle:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  else
  {
    objc_msgSend(v6, "addButtonWithTitle:", objc_msgSend((id)TSKBundle(), "localizedStringForKey:value:table:", @"OK", &stru_26D688A48, @"TSKit"));
  }
  return v6;
}

- (uint64_t)showWithCompletionHandler:()KNAdditions
{
  uint64_t v5 = objc_alloc_init(TSKUIAlertViewCompletionHandlerDelegate);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__UIAlertView_KNAdditions__showWithCompletionHandler___block_invoke;
  v7[3] = &unk_2646B0C10;
  v7[5] = v5;
  v7[6] = a3;
  v7[4] = a1;
  [(TSKUIAlertViewCompletionHandlerDelegate *)v5 setCompletionHandler:v7];
  [a1 setDelegate:v5];
  return [a1 show];
}

@end