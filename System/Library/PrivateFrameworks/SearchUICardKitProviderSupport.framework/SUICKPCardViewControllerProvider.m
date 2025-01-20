@interface SUICKPCardViewControllerProvider
- (BOOL)_askDelegateToPerformReferentialCommand:(id)a3 forCardSection:(id)a4;
- (BOOL)performCommand:(id)a3 forCardSectionViewController:(id)a4;
- (CGSize)boundingSizeForCardSectionViewController:(id)a3;
- (NSMutableDictionary)feedbackDelegateDemultiplexersByCardIdentifiers;
- (SUICKPCardViewControllerProvider)init;
- (id)_cardViewControllerForCardSection:(id)a3;
- (id)_createCardViewControllerForCard:(id)a3;
- (id)cardViewControllerForCard:(id)a3;
- (id)customInteractionsForCardSection:(id)a3;
- (id)customLayerForCardSection:(id)a3;
- (id)customViewControllerForCardSection:(id)a3;
- (id)extractLinkID:(id)a3;
- (int64_t)preferredPunchoutIndexForCardSectionViewController:(id)a3;
- (unint64_t)displayPriorityForCard:(id)a3;
- (void)cardSectionView:(id)a3 willProcessEngagementFeedback:(id)a4;
- (void)cardSectionViewController:(id)a3 didSelectPreferredPunchoutIndex:(int64_t)a4;
- (void)cardSectionViewDidAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4;
- (void)cardSectionViewDidDisappearForCardSection:(id)a3 withDisappearanceFeedback:(id)a4;
- (void)cardSectionViewWillAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4;
- (void)cardViewController:(id)a3 preferredContentSizeDidChange:(CGSize)a4 animated:(BOOL)a5;
- (void)presentViewController:(id)a3 forCardSectionViewController:(id)a4;
- (void)presentation:(id)a3 didApplyCardSectionViewSource:(id)a4 toCardViewController:(id)a5;
- (void)setFeedbackDelegateDemultiplexersByCardIdentifiers:(id)a3;
- (void)unregisterCardViewController:(id)a3;
- (void)userDidEngageCardSection:(id)a3 withEngagementFeedback:(id)a4;
@end

@implementation SUICKPCardViewControllerProvider

- (SUICKPCardViewControllerProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)SUICKPCardViewControllerProvider;
  v2 = [(SUICKPCardViewControllerProvider *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cardsByCardSectionIdentifiers = v2->_cardsByCardSectionIdentifiers;
    v2->_cardsByCardSectionIdentifiers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cardViewControllersByCardIdentifiers = v2->_cardViewControllersByCardIdentifiers;
    v2->_cardViewControllersByCardIdentifiers = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    feedbackDelegateDemultiplexersByCardIdentifiers = v2->_feedbackDelegateDemultiplexersByCardIdentifiers;
    v2->_feedbackDelegateDemultiplexersByCardIdentifiers = v7;
  }
  return v2;
}

- (id)cardViewControllerForCard:(id)a3
{
  id v4 = a3;
  self->_preferredContentSize = (CGSize)*MEMORY[0x263F001B0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy_;
    v28 = __Block_byref_object_dispose_;
    id v29 = 0;
    v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 1;
    if (v5
      && [v5 type] == 2
      && [v5 source] == 1
      && (objc_opt_respondsToSelector() & 1) != 0
      && ([v5 cardSections], v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
    {
      objc_initWeak(&location, self);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __62__SUICKPCardViewControllerProvider_cardViewControllerForCard___block_invoke;
      v13[3] = &unk_26490F590;
      objc_copyWeak(&v18, &location);
      v16 = &v24;
      id v14 = v5;
      v17 = &v20;
      v15 = v6;
      [v14 loadCardWithCompletion:v13];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v8 = [(SUICKPCardViewControllerProvider *)self _createCardViewControllerForCard:v5];
      v9 = (void *)v25[5];
      v25[5] = v8;

      if (*((unsigned char *)v21 + 24))
      {
        dispatch_group_leave(v6);
        *((unsigned char *)v21 + 24) = 0;
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR))
      {
        -[SUICKPCardViewControllerProvider cardViewControllerForCard:]();
      }
    }
    dispatch_time_t v11 = dispatch_time(0, 200000000);
    if (dispatch_group_wait(v6, v11) && os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      -[SUICKPCardViewControllerProvider cardViewControllerForCard:]();
    }
    id v10 = (id)v25[5];
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      -[SUICKPCardViewControllerProvider cardViewControllerForCard:]();
    }
    id v10 = 0;
  }

  return v10;
}

void __62__SUICKPCardViewControllerProvider_cardViewControllerForCard___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (os_log_t *)MEMORY[0x263F31630];
  id v5 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412290;
    id v28 = v3;
    _os_log_impl(&dword_22C0E8000, v5, OS_LOG_TYPE_DEFAULT, "Asynchronous card loading completed for first level card\n    Card: %@", (uint8_t *)&v27, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v7 = [v3 cardSections];
    if (v7
      && (uint64_t v8 = (void *)v7,
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v8,
          (isKindOfClass & 1) != 0))
    {
      uint64_t v10 = [WeakRetained _createCardViewControllerForCard:v3];
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    else
    {
      v13 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
        __62__SUICKPCardViewControllerProvider_cardViewControllerForCard___block_invoke_cold_2(a1, v13, v14, v15, v16, v17, v18, v19);
      }
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    uint64_t v20 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
      __62__SUICKPCardViewControllerProvider_cardViewControllerForCard___block_invoke_cold_1(a1, v20, v21, v22, v23, v24, v25, v26);
    }
  }
}

- (void)unregisterCardViewController:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 card];
  v6 = [v5 cardIdentifier];

  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_cardViewControllersByCardIdentifiers objectForKey:v6];
    if (v7 == v4)
    {
      uint64_t v8 = [v4 card];
      v9 = *MEMORY[0x263F31630];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = v8;
        __int16 v25 = 2112;
        id v26 = v4;
        _os_log_impl(&dword_22C0E8000, v9, OS_LOG_TYPE_INFO, "Unregistering SearchUICardViewController\n    Card: %@\n    Card view controller: %@", buf, 0x16u);
      }
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v17 = v8;
      uint64_t v10 = [v8 resolvedCardSections];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v19;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            cardsByCardSectionIdentifiers = self->_cardsByCardSectionIdentifiers;
            uint64_t v16 = [*(id *)(*((void *)&v18 + 1) + 8 * v14) cardSectionIdentifier];
            [(NSMutableDictionary *)cardsByCardSectionIdentifiers removeObjectForKey:v16];

            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v12);
      }

      [(NSMutableDictionary *)self->_feedbackDelegateDemultiplexersByCardIdentifiers removeObjectForKey:v6];
      [v4 setDelegate:0];
      [(NSMutableDictionary *)self->_cardViewControllersByCardIdentifiers removeObjectForKey:v6];
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR))
    {
      -[SUICKPCardViewControllerProvider unregisterCardViewController:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR))
  {
    -[SUICKPCardViewControllerProvider unregisterCardViewController:]();
  }
}

- (unint64_t)displayPriorityForCard:(id)a3
{
  return 2;
}

- (void)presentation:(id)a3 didApplyCardSectionViewSource:(id)a4 toCardViewController:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v42 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v8 feedbackListener];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 isMemberOfClass:objc_opt_class()])
    {
      id v10 = v9;
      uint64_t v11 = [v7 delegate];
      if ([v11 conformsToProtocol:&unk_26DFA1E30])
      {
        [v10 setSnippetUIDelegate:v11];
        id v40 = v11;
      }
      else
      {
        id v40 = 0;
      }
    }
    else
    {
      id v40 = 0;
    }
  }
  else
  {
    id v40 = 0;
  }
  v37 = v7;
  uint64_t v12 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C0E8000, v12, OS_LOG_TYPE_INFO, "Configuring demuxes and weeding out empty card section views", buf, 2u);
  }
  uint64_t v13 = objc_msgSend(v8, "card", v8);
  uint64_t v14 = [v13 resolvedCardSections];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v14;
  uint64_t v15 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v41 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v44 != v41) {
          objc_enumerationMutation(obj);
        }
        long long v18 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        long long v19 = [v42 viewConfigurationForCardSection:v18];
        if (v19)
        {
          cardsByCardSectionIdentifiers = self->_cardsByCardSectionIdentifiers;
          long long v21 = [v18 cardSectionIdentifier];
          uint64_t v22 = [(NSMutableDictionary *)cardsByCardSectionIdentifiers objectForKey:v21];
          uint64_t v23 = [v22 cardIdentifier];

          uint64_t v24 = [(NSMutableDictionary *)self->_feedbackDelegateDemultiplexersByCardIdentifiers objectForKey:v23];
          __int16 v25 = objc_alloc_init(SUICKPFeedbackAdapter);
          id v26 = [v19 _cardKitCardSectionViewController];
          [v26 setDelegate:self];
          [(SUICKPFeedbackAdapter *)v25 setFeedbackDelegate:v26];
          uint64_t v27 = [v24 feedbackDelegatesByCardSectionIdentifiers];
          id v28 = [v19 cardSection];
          uint64_t v29 = [v28 cardSectionIdentifier];
          [v27 setObject:v25 forKey:v29];

          v30 = [v19 cardSectionView];
          v31 = [v30 cardSectionViewIdentifier];

          if (v31)
          {
            v32 = [v24 feedbackDelegatesByCardSectionViewIds];
            v33 = [v19 cardSectionView];
            v34 = [v33 cardSectionViewIdentifier];
            [v32 setObject:v25 forKey:v34];
          }
          [v24 setSnippetUIDelegate:v40];
          v35 = *MEMORY[0x263F31630];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v48 = v24;
            __int16 v49 = 2112;
            v50 = v19;
            _os_log_impl(&dword_22C0E8000, v35, OS_LOG_TYPE_INFO, "Configured demux %@ for card section view configuration: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v16);
  }
}

- (id)customViewControllerForCardSection:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SUICKPCardViewControllerProvider *)self _cardViewControllerForCardSection:v4];
  v6 = [v5 cardSectionViewSource];
  id v7 = [v6 viewConfigurationForCardSection:v4];

  id v8 = (os_log_t *)MEMORY[0x263F31630];
  v9 = (void *)*MEMORY[0x263F31630];
  BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      uint64_t v11 = v9;
      uint64_t v12 = [v7 _providerIdentifier];
      int v22 = 138412290;
      id v23 = v12;
      _os_log_impl(&dword_22C0E8000, v11, OS_LOG_TYPE_DEFAULT, "Found custom card section view configuration to provide to SearchUI from provider: %@", (uint8_t *)&v22, 0xCu);
    }
    uint64_t v13 = [v7 _cardKitCardSectionViewController];
    uint64_t v14 = [v7 _providerIdentifier];
    int v15 = [v14 isEqualToString:@"com.apple.cards.SearchUICardKitProvider"];

    uint64_t v16 = *v8;
    BOOL v17 = os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        int v22 = 138412802;
        id v23 = v4;
        __int16 v24 = 2112;
        __int16 v25 = v13;
        __int16 v26 = 2112;
        uint64_t v27 = v5;
        _os_log_impl(&dword_22C0E8000, v16, OS_LOG_TYPE_DEFAULT, "NOT providing custom view controller for card section to SearchUI because it originated from the SearchUI provider\n    Card section: %@\n    Card section view controller: %@\n    Card view controller: %@", (uint8_t *)&v22, 0x20u);
      }
      id v18 = 0;
    }
    else
    {
      if (v17)
      {
        int v22 = 138412802;
        id v23 = v4;
        __int16 v24 = 2112;
        __int16 v25 = v13;
        __int16 v26 = 2112;
        uint64_t v27 = v5;
        _os_log_impl(&dword_22C0E8000, v16, OS_LOG_TYPE_DEFAULT, "Providing custom view controller for card section to SearchUI\n    Card section: %@\n    Card section view controller: %@\n    Card view controller: %@", (uint8_t *)&v22, 0x20u);
      }
      id v18 = v13;
    }
  }
  else
  {
    if (v10)
    {
      long long v19 = v9;
      long long v20 = [v5 cardSectionViewSource];
      int v22 = 138412802;
      id v23 = v4;
      __int16 v24 = 2112;
      __int16 v25 = v20;
      __int16 v26 = 2112;
      uint64_t v27 = v5;
      _os_log_impl(&dword_22C0E8000, v19, OS_LOG_TYPE_DEFAULT, "NOT providing custom view controller for card section to SearchUI because card section view provider manager didn't vend a configuration\n    Card section: %@\n    Card section view provider manager: %@\n    Card view controller: %@", (uint8_t *)&v22, 0x20u);
    }
    id v18 = 0;
  }

  return v18;
}

- (void)cardViewController:(id)a3 preferredContentSizeDidChange:(CGSize)a4 animated:(BOOL)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  if (self->_preferredContentSize.width != width || self->_preferredContentSize.height != height)
  {
    self->_preferredContentSize.double width = width;
    self->_preferredContentSize.double height = height;
    id v12 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v12;
      uint64_t v11 = [v10 cardViewControllerDelegate];
      [v11 cardViewControllerBoundsDidChange:v10];
    }
  }
  MEMORY[0x270F9A758]();
}

- (id)customInteractionsForCardSection:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFF980], "array", a3);
}

- (id)customLayerForCardSection:(id)a3
{
  return 0;
}

- (id)extractLinkID:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [a3 resultIdentifier];
  id v4 = (os_log_t *)MEMORY[0x263F31630];
  id v5 = *MEMORY[0x263F31630];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_22C0E8000, v5, OS_LOG_TYPE_DEFAULT, "ResultIdentifier on card section set, using that for Link Identifier", (uint8_t *)&v10, 2u);
    }
    id v6 = v3;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      -[SUICKPCardViewControllerProvider extractLinkID:](v5);
    }
    id v7 = [MEMORY[0x263F08C38] UUID];
    id v6 = [v7 UUIDString];
  }
  id v8 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_22C0E8000, v8, OS_LOG_TYPE_DEFAULT, "Using linkIdentifier: %@", (uint8_t *)&v10, 0xCu);
  }

  return v6;
}

- (id)_cardViewControllerForCardSection:(id)a3
{
  cardsByCardSectionIdentifiers = self->_cardsByCardSectionIdentifiers;
  cardViewControllersByCardIdentifiers = self->_cardViewControllersByCardIdentifiers;
  id v5 = [a3 cardSectionIdentifier];
  id v6 = [(NSMutableDictionary *)cardsByCardSectionIdentifiers objectForKey:v5];
  id v7 = [v6 cardIdentifier];
  id v8 = [(NSMutableDictionary *)cardViewControllersByCardIdentifiers objectForKey:v7];

  return v8;
}

- (BOOL)_askDelegateToPerformReferentialCommand:(id)a3 forCardSection:(id)a4
{
  id v7 = a3;
  id v8 = [(SUICKPCardViewControllerProvider *)self _cardViewControllerForCardSection:a4];
  v9 = [v8 cardViewControllerDelegate];
  char v10 = objc_opt_respondsToSelector();
  if ((v10 & 1) != 0
    && ([v8 cardViewControllerDelegate],
        id v4 = objc_claimAutoreleasedReturnValue(),
        ![v4 canPerformReferentialCommand:v7 forCardViewController:v8]))
  {
    char v12 = 0;
  }
  else
  {
    id v11 = [v8 cardViewControllerDelegate];
    char v12 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0) {
      goto LABEL_7;
    }
  }

LABEL_7:
  char v13 = 0;
  if (v7 && (v12 & 1) != 0)
  {
    uint64_t v14 = [v8 cardViewControllerDelegate];
    char v13 = [v14 performReferentialCommand:v7 forCardViewController:v8];
  }
  return v13;
}

- (id)_createCardViewControllerForCard:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(SUICKPFeedbackDelegateDemultiplexer);
  id v6 = (void *)[objc_alloc(MEMORY[0x263F67C28]) initWithCard:v4 feedbackListener:v5];
  id v7 = objc_alloc_init(SUICKPFeedbackAdapter);
  [(SUICKPFeedbackAdapter *)v7 setFeedbackDelegate:v6];
  long long v21 = v5;
  [(SUICKPFeedbackDelegateDemultiplexer *)v5 setDefaultDelegate:v7];
  [v6 setDefaultFeedbackAdapter:v7];
  [v6 setScrollEnabled:0];
  [v6 setThreeDTouchEnabled:0];
  [v6 setDelegate:self];
  id v8 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v4;
    __int16 v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_22C0E8000, v8, OS_LOG_TYPE_INFO, "Instantiating SearchUICardViewController\n    Card: %@\n    Card view controller: %@", buf, 0x16u);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v9 = [v4 resolvedCardSections];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        cardsByCardSectionIdentifiers = self->_cardsByCardSectionIdentifiers;
        int v15 = [*(id *)(*((void *)&v22 + 1) + 8 * i) cardSectionIdentifier];
        [(NSMutableDictionary *)cardsByCardSectionIdentifiers setObject:v4 forKey:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  feedbackDelegateDemultiplexersByCardIdentifiers = self->_feedbackDelegateDemultiplexersByCardIdentifiers;
  BOOL v17 = [v4 cardIdentifier];
  [(NSMutableDictionary *)feedbackDelegateDemultiplexersByCardIdentifiers setObject:v21 forKey:v17];

  cardViewControllersByCardIdentifiers = self->_cardViewControllersByCardIdentifiers;
  long long v19 = [v4 cardIdentifier];
  [(NSMutableDictionary *)cardViewControllersByCardIdentifiers setObject:v6 forKey:v19];

  return v6;
}

- (BOOL)performCommand:(id)a3 forCardSectionViewController:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v48 = v6;
    __int16 v49 = 2112;
    id v50 = v7;
    _os_log_impl(&dword_22C0E8000, v8, OS_LOG_TYPE_INFO, "Got command %@ from card section view controller: %@", buf, 0x16u);
  }
  if ([v6 conformsToProtocol:&unk_26DFA9850])
  {
    id v9 = v6;
    id v35 = v7;
    [v7 cardSection];
    uint64_t v33 = v36 = self;
    -[SUICKPCardViewControllerProvider _cardViewControllerForCardSection:](self, "_cardViewControllerForCardSection:");
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v34 = long long v44 = 0u;
    uint64_t v10 = [v34 card];
    uint64_t v11 = [v10 dismissalCommands];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v42;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v42 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          if ([v16 conformsToProtocol:&unk_26DFA9850])
          {
            BOOL v17 = [v16 referenceIdentifier];
            id v18 = [v9 referenceIdentifier];
            char v19 = [v17 isEqualToString:v18];

            if (v19)
            {

              long long v39 = 0u;
              long long v40 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              long long v23 = v36->_pendingDismissalCommands;
              uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v37 objects:v45 count:16];
              if (v24)
              {
                uint64_t v25 = v24;
                uint64_t v26 = *(void *)v38;
                while (2)
                {
                  for (uint64_t j = 0; j != v25; ++j)
                  {
                    if (*(void *)v38 != v26) {
                      objc_enumerationMutation(v23);
                    }
                    id v28 = *(void **)(*((void *)&v37 + 1) + 8 * j);
                    __int16 v29 = [v28 referenceIdentifier];
                    v30 = [v9 referenceIdentifier];
                    int v31 = [v29 isEqualToString:v30];

                    if (v31)
                    {
                      [(NSMutableArray *)v36->_pendingDismissalCommands removeObject:v28];
                      goto LABEL_28;
                    }
                  }
                  uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v37 objects:v45 count:16];
                  if (v25) {
                    continue;
                  }
                  break;
                }
              }
LABEL_28:

              [(NSMutableArray *)v36->_pendingDismissalCommands addObject:v9];
              char v21 = 1;
              long long v20 = (void *)v33;
              goto LABEL_29;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    long long v20 = (void *)v33;
    char v21 = [(SUICKPCardViewControllerProvider *)v36 _askDelegateToPerformReferentialCommand:v9 forCardSection:v33];
LABEL_29:

    id v7 = v35;
    goto LABEL_30;
  }
  if ([v6 conformsToProtocol:&unk_26DFA2358])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v22 = [v7 cardSection];
      id v9 = [(SUICKPCardViewControllerProvider *)self _cardViewControllerForCardSection:v22];

      long long v20 = [v9 cardViewControllerDelegate];
      char v21 = [v6 handleForCardViewController:v9 cardViewControllerDelegate:v20];
LABEL_30:

      goto LABEL_31;
    }
  }
  char v21 = 0;
LABEL_31:

  return v21;
}

- (void)presentViewController:(id)a3 forCardSectionViewController:(id)a4
{
  id v10 = a3;
  uint64_t v6 = [a4 cardSection];
  id v7 = [(SUICKPCardViewControllerProvider *)self _cardViewControllerForCardSection:v6];

  id v8 = [v7 cardViewControllerDelegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v9 = [v7 cardViewControllerDelegate];
    [v9 presentViewController:v10 forCardViewController:v7];
  }
}

- (void)cardSectionViewController:(id)a3 didSelectPreferredPunchoutIndex:(int64_t)a4
{
  self->_preferredPunchoutIndex = a4;
}

- (int64_t)preferredPunchoutIndexForCardSectionViewController:(id)a3
{
  return self->_preferredPunchoutIndex;
}

- (CGSize)boundingSizeForCardSectionViewController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 cardSection];
  uint64_t v6 = [(SUICKPCardViewControllerProvider *)self _cardViewControllerForCardSection:v5];

  id v7 = [v6 cardViewControllerDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [v6 cardViewControllerDelegate];
    [v9 cardViewController:v6 boundingSizeForCardSectionViewController:v4];
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v11 = *MEMORY[0x263F001B0];
    double v13 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (void)cardSectionView:(id)a3 willProcessEngagementFeedback:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(SUICKPCardViewControllerProvider *)self _cardViewControllerForCardSection:v11];
  char v8 = [v7 cardViewControllerDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    double v10 = [v7 cardViewControllerDelegate];
    [v10 cardSectionView:v11 willProcessEngagementFeedback:v6];
  }
}

- (void)userDidEngageCardSection:(id)a3 withEngagementFeedback:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(SUICKPCardViewControllerProvider *)self _cardViewControllerForCardSection:v11];
  char v8 = [v7 cardViewControllerDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    double v10 = [v7 cardViewControllerDelegate];
    [v10 userDidEngageCardSection:v11 withEngagementFeedback:v6];
  }
}

- (void)cardSectionViewWillAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(SUICKPCardViewControllerProvider *)self _cardViewControllerForCardSection:v11];
  char v8 = [v7 cardViewControllerDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    double v10 = [v7 cardViewControllerDelegate];
    [v10 cardSectionViewWillAppearForCardSection:v11 withAppearanceFeedback:v6];
  }
}

- (void)cardSectionViewDidAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(SUICKPCardViewControllerProvider *)self _cardViewControllerForCardSection:v11];
  char v8 = [v7 cardViewControllerDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    double v10 = [v7 cardViewControllerDelegate];
    [v10 cardSectionViewDidAppearForCardSection:v11 withAppearanceFeedback:v6];
  }
}

- (void)cardSectionViewDidDisappearForCardSection:(id)a3 withDisappearanceFeedback:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(SUICKPCardViewControllerProvider *)self _cardViewControllerForCardSection:v11];
  char v8 = [v7 cardViewControllerDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    double v10 = [v7 cardViewControllerDelegate];
    [v10 cardSectionViewDidDisappearForCardSection:v11 withDisappearanceFeedback:v6];
  }
}

- (NSMutableDictionary)feedbackDelegateDemultiplexersByCardIdentifiers
{
  return self->_feedbackDelegateDemultiplexersByCardIdentifiers;
}

- (void)setFeedbackDelegateDemultiplexersByCardIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackDelegateDemultiplexersByCardIdentifiers, 0);
  objc_storeStrong((id *)&self->_pendingDismissalCommands, 0);
  objc_storeStrong((id *)&self->_cardViewControllersByCardIdentifiers, 0);
  objc_storeStrong((id *)&self->_cardsByCardSectionIdentifiers, 0);
}

- (void)cardViewControllerForCard:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22C0E8000, v0, v1, "Timed out loading card : %@", v2, v3, v4, v5, v6);
}

- (void)cardViewControllerForCard:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22C0E8000, v0, v1, "Attempted to double-leave dispatch group loading card: %@", v2, v3, v4, v5, v6);
}

- (void)cardViewControllerForCard:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22C0E8000, v0, v1, "SearchUI couldn't fetch cardViewController for card: %@ as the card is not a search foundation card.", v2, v3, v4, v5, v6);
}

void __62__SUICKPCardViewControllerProvider_cardViewControllerForCard___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __62__SUICKPCardViewControllerProvider_cardViewControllerForCard___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)unregisterCardViewController:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22C0E8000, v0, v1, "Failed to unregister view controller due to invalid identifier: %@", v2, v3, v4, v5, v6);
}

- (void)unregisterCardViewController:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22C0E8000, v0, v1, "Failed to unregister view controller: %@", v2, v3, v4, v5, v6);
}

- (void)extractLinkID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22C0E8000, log, OS_LOG_TYPE_ERROR, "ResultIdentifier on card section not set, generating UUID for Link Identifier", v1, 2u);
}

@end