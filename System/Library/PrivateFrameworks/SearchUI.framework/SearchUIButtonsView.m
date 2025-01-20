@interface SearchUIButtonsView
- (SearchUIButtonsView)initWithCardSectionView:(id)a3;
- (SearchUIMovieCardSectionView)cardSectionView;
- (id)buttonWithTitle:(id)a3 subtitle:(id)a4 punchoutURL:(id)a5;
- (void)fetchButtonsWithCompletionHandler:(id)a3;
- (void)setCardSectionView:(id)a3;
@end

@implementation SearchUIButtonsView

- (SearchUIButtonsView)initWithCardSectionView:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SearchUIButtonsView *)self buttonWithTitle:&stru_1F40279D8 subtitle:@"\n" punchoutURL:0];
  [v5 setAlpha:0.0];
  v20[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v19.receiver = self;
  v19.super_class = (Class)SearchUIButtonsView;
  v7 = [(NUIContainerBoxView *)&v19 initWithArrangedSubviews:v6];

  if (v7)
  {
    [(SearchUIButtonsView *)v7 setCardSectionView:v4];
    v8 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    int v10 = [MEMORY[0x1E4FAE100] isSuperLargeAccessibilitySize];
    char v11 = v10;
    if (v9 == 1) {
      int v12 = 1;
    }
    else {
      int v12 = v10;
    }
    if (v12) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = 3;
    }
    [(NUIContainerBoxView *)v7 setHorizontalAlignment:v13];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__SearchUIButtonsView_initWithCardSectionView___block_invoke;
    v15[3] = &unk_1E6E73B48;
    char v18 = v11;
    id v16 = v5;
    v17 = v7;
    [(SearchUIButtonsView *)v17 fetchButtonsWithCompletionHandler:v15];
  }
  return v7;
}

void __47__SearchUIButtonsView_initWithCardSectionView___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FAE158]) initWithArrangedSubviews:v3];
  [v4 setAlignment:1];
  [v4 setDistribution:1];
  [v4 setSpacing:15.0];
  [v4 setAxis:*(unsigned __int8 *)(a1 + 48)];
  if (!*(unsigned char *)(a1 + 48))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v13 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "frame", v13);
          double Height = CGRectGetHeight(v22);
          if (Height == 0.0) {
            [*(id *)(a1 + 32) intrinsicContentSize];
          }
          objc_msgSend(v10, "setMaximumLayoutSize:", 100.0, Height);
          objc_msgSend(v10, "setMinimumLayoutSize:", 100.0, 1.79769313e308);
          +[SearchUIAutoLayout requireIntrinsicSizeForView:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    id v3 = v13;
  }
  objc_msgSend(*(id *)(a1 + 40), "addArrangedSubview:", v4, v13);
  if (*(unsigned char *)(a1 + 48))
  {
    int v12 = [*(id *)(a1 + 40) cardSectionView];
    [v12 didInvalidateSizeAnimate:1];
  }
  else
  {
    [v4 setAlpha:0.0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__SearchUIButtonsView_initWithCardSectionView___block_invoke_2;
    v14[3] = &unk_1E6E72730;
    id v15 = v4;
    +[SearchUIUtilities performAnimatableChanges:v14];
    int v12 = v15;
  }
}

uint64_t __47__SearchUIButtonsView_initWithCardSectionView___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)fetchButtonsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIButtonsView *)self cardSectionView];
  uint64_t v6 = [v5 section];

  uint64_t v7 = +[SearchUIWatchListUtilities watchListTypeForType:isMediaContainer:](SearchUIWatchListUtilities, "watchListTypeForType:isMediaContainer:", [v6 watchListItemType], objc_msgSend(v6, "isMediaContainer"));
  uint64_t v8 = [v6 watchListIdentifier];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__SearchUIButtonsView_fetchButtonsWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E6E72FD0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  +[SearchUIWatchListUtilities fetchButtonsForWatchListIdentifier:v8 type:v7 isHorizontallySrollingStyle:0 completion:v10];
}

void __57__SearchUIButtonsView_fetchButtonsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__SearchUIButtonsView_fetchButtonsWithCompletionHandler___block_invoke_2;
  v16[3] = &unk_1E6E73B70;
  id v7 = v5;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v17 = v7;
  uint64_t v18 = v8;
  id v19 = v9;
  +[SearchUIUtilities dispatchMainIfNecessary:v16];
  if (v6)
  {
    int v10 = [*(id *)(a1 + 32) cardSectionView];
    id v11 = [v10 feedbackDelegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = (void *)[objc_alloc(MEMORY[0x1E4F9A098]) initWithError:v6];
      v14 = [*(id *)(a1 + 32) cardSectionView];
      id v15 = [v14 feedbackDelegate];
      [v15 didErrorOccur:v13];
    }
  }
}

void __57__SearchUIButtonsView_fetchButtonsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
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
        uint64_t v8 = [v7 watchListState];

        if (v8)
        {
          id v9 = [SearchUIMovieCardSectionUpNextButtonView alloc];
          int v10 = [v7 watchListState];
          uint64_t v11 = [v10 isWatchListed];
          char v12 = [*(id *)(a1 + 40) cardSectionView];
          id v13 = [(SearchUIMovieCardSectionUpNextButtonView *)v9 initIsInUpNext:v11 cardSectionView:v12];
        }
        else
        {
          v14 = *(void **)(a1 + 40);
          int v10 = [v7 title];
          char v12 = [v7 subtitle];
          id v15 = [v7 punchoutURL];
          id v13 = [v14 buttonWithTitle:v10 subtitle:v12 punchoutURL:v15];
        }
        [v2 addObject:v13];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)buttonWithTitle:(id)a3 subtitle:(id)a4 punchoutURL:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [SearchUIMovieCardSectionBuyButtonView alloc];
  char v12 = [MEMORY[0x1E4F9A378] textWithString:v9];

  id v13 = [MEMORY[0x1E4F9A2F8] punchoutWithURL:v8];

  v14 = [(SearchUIButtonsView *)self cardSectionView];
  id v15 = [(SearchUIMovieCardSectionBuyButtonView *)v11 initWithTitle:v10 subtitle:v12 punchout:v13 cardSectionView:v14];

  return v15;
}

- (SearchUIMovieCardSectionView)cardSectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardSectionView);
  return (SearchUIMovieCardSectionView *)WeakRetained;
}

- (void)setCardSectionView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end