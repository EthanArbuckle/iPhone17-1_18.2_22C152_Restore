@interface SearchUICommandButton
- (SFButtonItem)buttonItem;
- (SearchUICommandButton)initWithWatchListState:(id)a3;
- (SearchUIWatchListState)watchListState;
- (void)setButtonItem:(id)a3;
- (void)setWatchListState:(id)a3;
- (void)updateStateIfNecessary;
- (void)watchListStateDidChange:(id)a3;
@end

@implementation SearchUICommandButton

- (SearchUICommandButton)initWithWatchListState:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SearchUICommandButton;
  v5 = [(TLKTextButton *)&v12 init];
  v6 = v5;
  if (v5)
  {
    [(SearchUICommandButton *)v5 setWatchListState:v4];
    [(SearchUICommandButton *)v6 updateStateIfNecessary];
    v7 = [(TLKTextButton *)v6 tlkImageView];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__SearchUICommandButton_initWithWatchListState___block_invoke;
    v10[3] = &unk_1E6E72730;
    id v11 = v7;
    id v8 = v7;
    [v8 performBatchUpdates:v10];
  }
  return v6;
}

uint64_t __48__SearchUICommandButton_initWithWatchListState___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setProminence:0];
  v2 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
  [*(id *)(a1 + 32) setSymbolFont:v2];

  [*(id *)(a1 + 32) setSymbolWeight:7];
  v3 = *(void **)(a1 + 32);
  return [v3 setSymbolScale:3];
}

- (void)watchListStateDidChange:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__SearchUICommandButton_watchListStateDidChange___block_invoke;
  v3[3] = &unk_1E6E72730;
  v3[4] = self;
  +[SearchUIUtilities dispatchMainIfNecessary:v3];
}

uint64_t __49__SearchUICommandButton_watchListStateDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateStateIfNecessary];
}

- (void)updateStateIfNecessary
{
  v3 = [(SearchUICommandButton *)self watchListState];

  if (v3)
  {
    id v4 = [(SearchUICommandButton *)self watchListState];
    int v5 = [v4 isWatchListed];
    v6 = @"plus";
    if (v5) {
      v6 = @"checkmark";
    }
    v7 = v6;

    id v8 = objc_alloc(MEMORY[0x1E4FAE0C0]);
    v9 = +[SearchUISymbolImage uiImageWithSymbolName:v7];

    id v10 = (id)[v8 initWithImage:v9];
    [v10 setIsTemplate:1];
    [(TLKTextButton *)self setTlkImage:v10];
  }
}

- (SFButtonItem)buttonItem
{
  return (SFButtonItem *)objc_getProperty(self, a2, 800, 1);
}

- (void)setButtonItem:(id)a3
{
}

- (SearchUIWatchListState)watchListState
{
  return (SearchUIWatchListState *)objc_getProperty(self, a2, 808, 1);
}

- (void)setWatchListState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchListState, 0);
  objc_storeStrong((id *)&self->buttonItem, 0);
}

@end