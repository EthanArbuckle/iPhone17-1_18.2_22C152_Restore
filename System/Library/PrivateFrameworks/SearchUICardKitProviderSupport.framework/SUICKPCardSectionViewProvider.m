@interface SUICKPCardSectionViewProvider
- (CRCard)card;
- (CRKCardSectionViewProviderDelegate)delegate;
- (NSArray)viewConfigurations;
- (NSString)providerIdentifier;
- (SUICKPCardSectionViewProvider)initWithCard:(id)a3;
- (unint64_t)displayPriorityForCardSection:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SUICKPCardSectionViewProvider

- (SUICKPCardSectionViewProvider)initWithCard:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUICKPCardSectionViewProvider;
  v6 = [(SUICKPCardSectionViewProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_card, a3);
  }

  return v7;
}

- (NSString)providerIdentifier
{
  return (NSString *)@"com.apple.cards.SearchUICardKitProvider";
}

- (NSArray)viewConfigurations
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  card = self->_card;
  if (card)
  {
    viewConfigurations = self->_viewConfigurations;
    if (!viewConfigurations)
    {
      v28 = self;
      id v5 = [(CRCard *)card resolvedCardSections];
      v29 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v35 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              v12 = [v11 backingCardSection];
              if (v12)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0
                  || ([v12 visualCATOutput],
                      v13 = objc_claimAutoreleasedReturnValue(),
                      v13,
                      v13))
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      [v29 addObject:v12];
                    }
                  }
                }
              }
            }
            else
            {
              v12 = 0;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v8);
      }

      v14 = objc_alloc_init(SUICKPFeedbackDelegateDemultiplexer);
      feedbackDelegateDemux = v28->_feedbackDelegateDemux;
      v28->_feedbackDelegateDemux = v14;

      id WeakRetained = objc_loadWeakRetained((id *)&v28->_delegate);
      char v17 = objc_opt_respondsToSelector();

      if (v17)
      {
        id v18 = objc_loadWeakRetained((id *)&v28->_delegate);
        v19 = [v18 defaultFeedbackDelegateForProvider:v28];

        if (v19)
        {
          v20 = objc_alloc_init(SUICKPFeedbackAdapter);
          [(SUICKPFeedbackAdapter *)v20 setFeedbackDelegate:v19];
          [(SUICKPFeedbackDelegateDemultiplexer *)v28->_feedbackDelegateDemux setDefaultDelegate:v20];
        }
      }
      v21 = [MEMORY[0x263F67C00] viewsForCardSections:v29 feedbackListener:v28->_feedbackDelegateDemux];
      id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __51__SUICKPCardSectionViewProvider_viewConfigurations__block_invoke;
      v30[3] = &unk_26490F630;
      id v31 = v21;
      v32 = v28;
      v23 = (NSArray *)v22;
      v33 = v23;
      id v24 = v21;
      [v29 enumerateObjectsUsingBlock:v30];
      v25 = v28->_viewConfigurations;
      v28->_viewConfigurations = v23;
      v26 = v23;

      viewConfigurations = v28->_viewConfigurations;
    }
    card = viewConfigurations;
  }
  return (NSArray *)card;
}

void __51__SUICKPCardSectionViewProvider_viewConfigurations__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = objc_alloc_init(MEMORY[0x263F315F8]);
  uint64_t v7 = objc_alloc_init(SUICKPFeedbackAdapter);
  [v6 setCardSection:v5];
  [v6 setFeedbackDelegateProxy:v7];
  if ([*(id *)(a1 + 32) count] <= a3)
  {
    v11 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
    {
      int v16 = 134217984;
      unint64_t v17 = a3;
      _os_log_impl(&dword_22C0E8000, v11, OS_LOG_TYPE_INFO, "No cardSectionView was found for backingCardSection at index %lu", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) objectAtIndex:a3];
    [v6 setCardSectionView:v8];
    uint64_t v9 = [v8 cardSectionViewIdentifier];
    if (v9)
    {
      v10 = [*(id *)(*(void *)(a1 + 40) + 8) feedbackDelegatesByCardSectionViewIds];
      [v10 setObject:v7 forKey:v9];
    }
    else
    {
      v12 = *MEMORY[0x263F31630];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
        __51__SUICKPCardSectionViewProvider_viewConfigurations__block_invoke_cold_2((uint64_t)v8, v12);
      }
    }
  }
  v13 = [v5 cardSectionIdentifier];
  if (v13)
  {
    v14 = [*(id *)(*(void *)(a1 + 40) + 8) feedbackDelegatesByCardSectionIdentifiers];
    [v14 setObject:v7 forKey:v13];
  }
  else
  {
    v15 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      __51__SUICKPCardSectionViewProvider_viewConfigurations__block_invoke_cold_1((uint64_t)v5, v15);
    }
  }
  [*(id *)(a1 + 48) addObject:v6];
}

- (unint64_t)displayPriorityForCardSection:(id)a3
{
  return 0;
}

- (CRCard)card
{
  return self->_card;
}

- (CRKCardSectionViewProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CRKCardSectionViewProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewConfigurations, 0);
  objc_storeStrong((id *)&self->_card, 0);
  objc_storeStrong((id *)&self->_feedbackDelegateDemux, 0);
}

void __51__SUICKPCardSectionViewProvider_viewConfigurations__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C0E8000, a2, OS_LOG_TYPE_ERROR, "No card section identifier available for card section: %@. Unable to hook up to demux for user interaction. This is a bad state and needs a radar!", (uint8_t *)&v2, 0xCu);
}

void __51__SUICKPCardSectionViewProvider_viewConfigurations__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C0E8000, a2, OS_LOG_TYPE_ERROR, "No card section view identifier available for card section view: %@. Unable to hook up to demux for user interaction. This is a bad state and needs a radar!", (uint8_t *)&v2, 0xCu);
}

@end