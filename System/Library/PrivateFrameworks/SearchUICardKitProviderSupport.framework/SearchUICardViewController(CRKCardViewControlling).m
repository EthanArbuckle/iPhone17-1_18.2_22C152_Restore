@interface SearchUICardViewController(CRKCardViewControlling)
- (id)cardSectionViewSource;
- (id)cardViewControllerDelegate;
- (id)defaultFeedbackAdapter;
- (void)cardSectionView:()CRKCardViewControlling willProcessEngagementFeedback:;
- (void)cardSectionViewDidAppearForCardSection:()CRKCardViewControlling withAppearanceFeedback:;
- (void)cardSectionViewDidDisappearForCardSection:()CRKCardViewControlling withDisappearanceFeedback:;
- (void)cardSectionViewDidInvalidateSizeForCardSection:()CRKCardViewControlling;
- (void)cardSectionViewWillAppearForCardSection:()CRKCardViewControlling withAppearanceFeedback:;
- (void)cardViewDidAppearForCard:()CRKCardViewControlling withAppearanceFeedback:;
- (void)cardViewDidDisappearForCard:()CRKCardViewControlling withDisappearanceFeedback:;
- (void)commandWasPerformed:()CRKCardViewControlling;
- (void)presentViewController:()CRKCardViewControlling;
- (void)presentViewControllerForCard:()CRKCardViewControlling animate:;
- (void)setCardSectionViewSource:()CRKCardViewControlling;
- (void)setCardViewControllerDelegate:()CRKCardViewControlling;
- (void)setDefaultFeedbackAdapter:()CRKCardViewControlling;
- (void)userDidEngageCardSection:()CRKCardViewControlling withEngagementFeedback:;
- (void)userDidReportFeedback:()CRKCardViewControlling fromCardSection:;
- (void)willDismissViewController:()CRKCardViewControlling;
@end

@implementation SearchUICardViewController(CRKCardViewControlling)

- (id)cardSectionViewSource
{
  uint64_t v1 = objc_getAssociatedObject(a1, sel_cardSectionViewSource);
  v2 = (void *)v1;
  if (v1)
  {
    v3 = (*(void (**)(uint64_t))(v1 + 16))(v1);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setCardSectionViewSource:()CRKCardViewControlling
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__SearchUICardViewController_CRKCardViewControlling__setCardSectionViewSource___block_invoke;
  v10[3] = &unk_26490F5B8;
  objc_copyWeak(&v11, &location);
  v5 = (void *)MEMORY[0x230F5EF40](v10);
  v9 = (void *)MEMORY[0x230F5EF40](v5, v6, v7, v8);
  objc_setAssociatedObject(a1, sel_cardSectionViewSource, v9, (void *)0x303);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)cardViewControllerDelegate
{
  uint64_t v1 = objc_getAssociatedObject(a1, sel_cardViewControllerDelegate);
  v2 = (void *)v1;
  if (v1)
  {
    v3 = (*(void (**)(uint64_t))(v1 + 16))(v1);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setCardViewControllerDelegate:()CRKCardViewControlling
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __84__SearchUICardViewController_CRKCardViewControlling__setCardViewControllerDelegate___block_invoke;
  v10[3] = &unk_26490F5E0;
  objc_copyWeak(&v11, &location);
  v5 = (void *)MEMORY[0x230F5EF40](v10);
  v9 = (void *)MEMORY[0x230F5EF40](v5, v6, v7, v8);
  objc_setAssociatedObject(a1, sel_cardViewControllerDelegate, v9, (void *)0x303);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)defaultFeedbackAdapter
{
  return objc_getAssociatedObject(a1, sel_defaultFeedbackAdapter);
}

- (void)setDefaultFeedbackAdapter:()CRKCardViewControlling
{
}

- (void)presentViewController:()CRKCardViewControlling
{
  id v7 = a3;
  id v4 = [a1 cardViewControllerDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [a1 cardViewControllerDelegate];
    [v6 presentViewController:v7 forCardViewController:a1];
  }
}

- (void)willDismissViewController:()CRKCardViewControlling
{
  id v7 = a3;
  id v4 = [a1 cardViewControllerDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [a1 cardViewControllerDelegate];
    [v6 cardViewController:a1 willDismissViewController:v7];
  }
}

- (void)presentViewControllerForCard:()CRKCardViewControlling animate:
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v4 asynchronous]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v5 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_22C0E8000, v5, OS_LOG_TYPE_INFO, "Started loading asynchronous card\n    Card: %@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, a1);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __91__SearchUICardViewController_CRKCardViewControlling__presentViewControllerForCard_animate___block_invoke;
    v11[3] = &unk_26490F608;
    objc_copyWeak(&v13, (id *)buf);
    id v12 = v4;
    [v12 loadCardWithCompletion:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v6 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_22C0E8000, v6, OS_LOG_TYPE_INFO, "Presenting view controller for synchronous card\n    Card: %@", buf, 0xCu);
    }
    id v7 = objc_alloc_init(MEMORY[0x263F31688]);
    [v7 setNextCard:v4];
    uint64_t v8 = [a1 cardViewControllerDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v10 = [a1 cardViewControllerDelegate];
      [v10 performNextCardCommand:v7 forCardViewController:a1];
    }
  }
}

- (void)cardSectionView:()CRKCardViewControlling willProcessEngagementFeedback:
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [a1 cardViewControllerDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [a1 cardViewControllerDelegate];
    [v9 cardSectionView:v10 willProcessEngagementFeedback:v6];
  }
}

- (void)userDidEngageCardSection:()CRKCardViewControlling withEngagementFeedback:
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = a1;
    _os_log_impl(&dword_22C0E8000, v8, OS_LOG_TYPE_INFO, "Card section engaged with feedback: %@  from cardViewController %@ ", (uint8_t *)&v12, 0x16u);
  }
  char v9 = [a1 cardViewControllerDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [a1 cardViewControllerDelegate];
    [v11 userDidEngageCardSection:v6 withEngagementFeedback:v7];
  }
}

- (void)commandWasPerformed:()CRKCardViewControlling
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    int v12 = a1;
    _os_log_impl(&dword_22C0E8000, v5, OS_LOG_TYPE_INFO, "Command was performed with feedback: %@ from cardViewController %@ ", (uint8_t *)&v9, 0x16u);
  }
  id v6 = [a1 cardViewControllerDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = [a1 cardViewControllerDelegate];
    [v8 commandWasPerformed:v4];
  }
}

- (void)cardViewDidAppearForCard:()CRKCardViewControlling withAppearanceFeedback:
{
  id v10 = a3;
  id v6 = a4;
  char v7 = [a1 cardViewControllerDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [a1 cardViewControllerDelegate];
    [v9 cardViewDidAppearForCard:v10 withAppearanceFeedback:v6];
  }
}

- (void)cardViewDidDisappearForCard:()CRKCardViewControlling withDisappearanceFeedback:
{
  id v10 = a3;
  id v6 = a4;
  char v7 = [a1 cardViewControllerDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [a1 cardViewControllerDelegate];
    [v9 cardViewDidDisappearForCard:v10 withDisappearanceFeedback:v6];
  }
}

- (void)cardSectionViewDidInvalidateSizeForCardSection:()CRKCardViewControlling
{
  v2 = [a1 cardViewControllerDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [a1 cardViewControllerDelegate];
    [v4 cardViewControllerBoundsDidChange:a1];
  }
}

- (void)userDidReportFeedback:()CRKCardViewControlling fromCardSection:
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = a1;
    _os_log_impl(&dword_22C0E8000, v8, OS_LOG_TYPE_INFO, "Card section did report feedback: %@  from cardViewController %@ ", (uint8_t *)&v12, 0x16u);
  }
  int v9 = [a1 cardViewControllerDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    __int16 v11 = [a1 cardViewControllerDelegate];
    [v11 userDidReportFeedback:v6 fromCardSection:v7];
  }
}

- (void)cardSectionViewWillAppearForCardSection:()CRKCardViewControlling withAppearanceFeedback:
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = a1;
    _os_log_impl(&dword_22C0E8000, v8, OS_LOG_TYPE_INFO, "Card section will appear : %@  from cardViewController %@ ", (uint8_t *)&v12, 0x16u);
  }
  int v9 = [a1 cardViewControllerDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    __int16 v11 = [a1 cardViewControllerDelegate];
    [v11 cardSectionViewWillAppearForCardSection:v6 withAppearanceFeedback:v7];
  }
}

- (void)cardSectionViewDidAppearForCardSection:()CRKCardViewControlling withAppearanceFeedback:
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = a1;
    _os_log_impl(&dword_22C0E8000, v8, OS_LOG_TYPE_INFO, "Card section did appear: %@  in cardViewController %@ ", (uint8_t *)&v12, 0x16u);
  }
  int v9 = [a1 cardViewControllerDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    __int16 v11 = [a1 cardViewControllerDelegate];
    [v11 cardSectionViewDidAppearForCardSection:v6 withAppearanceFeedback:v7];
  }
}

- (void)cardSectionViewDidDisappearForCardSection:()CRKCardViewControlling withDisappearanceFeedback:
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = a1;
    _os_log_impl(&dword_22C0E8000, v8, OS_LOG_TYPE_INFO, "Card section did disappear: %@  in cardViewController %@ ", (uint8_t *)&v12, 0x16u);
  }
  int v9 = [a1 cardViewControllerDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    __int16 v11 = [a1 cardViewControllerDelegate];
    [v11 cardSectionViewDidDisappearForCardSection:v6 withDisappearanceFeedback:v7];
  }
}

@end