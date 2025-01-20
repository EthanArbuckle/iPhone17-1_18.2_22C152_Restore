@interface SearchUIMovieCardSectionUpNextButtonView
- (SearchUIWatchListState)watchListState;
- (id)initIsInUpNext:(BOOL)a3 cardSectionView:(id)a4;
- (void)buttonPressed;
- (void)setWatchListState:(id)a3;
- (void)updateUpNextStatus;
@end

@implementation SearchUIMovieCardSectionUpNextButtonView

- (id)initIsInUpNext:(BOOL)a3 cardSectionView:(id)a4
{
  BOOL v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SearchUIMovieCardSectionUpNextButtonView;
  v5 = [(SearchUIMovieCardSectionBuyButtonView *)&v12 initWithTitle:0 subtitle:0 punchout:0 cardSectionView:a4];
  if (v5)
  {
    v6 = [SearchUIWatchListState alloc];
    v7 = [(SearchUIMovieCardSectionBuyButtonView *)v5 cardSectionView];
    v8 = [v7 section];
    v9 = [v8 watchListIdentifier];
    v10 = [(SearchUIWatchListState *)v6 initWithIdentifier:v9 watchListed:v4];
    [(SearchUIMovieCardSectionUpNextButtonView *)v5 setWatchListState:v10];

    [(SearchUIMovieCardSectionUpNextButtonView *)v5 updateUpNextStatus];
  }
  return v5;
}

- (void)updateUpNextStatus
{
  v3 = [(SearchUIMovieCardSectionUpNextButtonView *)self watchListState];
  int v4 = [v3 isWatchListed];

  if (v4) {
    v5 = @"IN_UP_NEXT_BUTTON_SUBTITLE";
  }
  else {
    v5 = @"ADD_TO_UP_NEXT_BUTTON_SUBTITLE";
  }
  if (v4) {
    v6 = @"checkmark";
  }
  else {
    v6 = @"plus";
  }
  v7 = +[SearchUIUtilities localizedStringForKey:v5];
  v8 = [(SearchUIMovieCardSectionBuyButtonView *)self subtitleLabel];
  [v8 setText:v7];

  v9 = [(SearchUIMovieCardSectionBuyButtonView *)self button];
  [v9 setUserInteractionEnabled:1];

  id v10 = [(SearchUIMovieCardSectionBuyButtonView *)self button];
  [v10 setSymbolImageName:v6];
}

- (void)buttonPressed
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUIMovieCardSectionUpNextButtonView;
  [(SearchUIMovieCardSectionBuyButtonView *)&v6 buttonPressed];
  v3 = [(SearchUIMovieCardSectionBuyButtonView *)self button];
  [v3 setUserInteractionEnabled:0];

  int v4 = [(SearchUIMovieCardSectionUpNextButtonView *)self watchListState];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__SearchUIMovieCardSectionUpNextButtonView_buttonPressed__block_invoke;
  v5[3] = &unk_1E6E72730;
  v5[4] = self;
  [v4 toggleStateWithCompletion:v5];
}

uint64_t __57__SearchUIMovieCardSectionUpNextButtonView_buttonPressed__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateUpNextStatus];
}

- (SearchUIWatchListState)watchListState
{
  return self->_watchListState;
}

- (void)setWatchListState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end