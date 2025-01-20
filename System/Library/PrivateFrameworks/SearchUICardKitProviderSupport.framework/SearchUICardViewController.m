@interface SearchUICardViewController
@end

@implementation SearchUICardViewController

id __79__SearchUICardViewController_CRKCardViewControlling__setCardSectionViewSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  return WeakRetained;
}

id __84__SearchUICardViewController_CRKCardViewControlling__setCardViewControllerDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  return WeakRetained;
}

void __91__SearchUICardViewController_CRKCardViewControlling__presentViewControllerForCard_animate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (os_log_t *)MEMORY[0x263F31630];
  v5 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    id v24 = v3;
    _os_log_impl(&dword_22C0E8000, v5, OS_LOG_TYPE_DEFAULT, "Asynchronous card loading completed for card\n    Card: %@", (uint8_t *)&v23, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = [v3 resolvedCardSections];

    if (v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x263F31688]);
      [v8 setNextCard:v3];
      v9 = [WeakRetained cardViewControllerDelegate];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        v11 = [WeakRetained cardViewControllerDelegate];
        [v11 performNextCardCommand:v8 forCardViewController:WeakRetained];
      }
      v12 = [WeakRetained cardViewControllerDelegate];
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        id v14 = objc_alloc_init(MEMORY[0x263F31638]);
        v15 = [WeakRetained cardViewControllerDelegate];
        char v16 = objc_opt_respondsToSelector();

        if (v16)
        {
          v17 = [WeakRetained cardViewControllerDelegate];
          v18 = [v17 baseCardForCardViewController:WeakRetained];
        }
        else
        {
          v18 = 0;
        }
        [v14 setBaseCard:v18];
        [v14 setRequestedCard:*(void *)(a1 + 32)];
        [v14 setReceivedCard:v3];
        v22 = [WeakRetained cardViewControllerDelegate];
        [v22 controllerForCard:*(void *)(a1 + 32) didReceiveAsyncCard:v3 withAsyncCardReceiptFeedback:v14];
      }
      goto LABEL_16;
    }
    v19 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
      __91__SearchUICardViewController_CRKCardViewControlling__presentViewControllerForCard_animate___block_invoke_cold_1(a1, v19);
    }
    v20 = [WeakRetained cardViewControllerDelegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      id v8 = [WeakRetained cardViewControllerDelegate];
      [v8 cardViewController:WeakRetained didFailToLoadCard:*(void *)(a1 + 32)];
LABEL_16:
    }
  }
}

void __91__SearchUICardViewController_CRKCardViewControlling__presentViewControllerForCard_animate___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_22C0E8000, a2, OS_LOG_TYPE_ERROR, "Failed to load card view controller for card\n    Card: %@", (uint8_t *)&v3, 0xCu);
}

@end