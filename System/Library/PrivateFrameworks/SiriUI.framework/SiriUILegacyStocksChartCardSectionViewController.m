@interface SiriUILegacyStocksChartCardSectionViewController
+ (id)cardSectionClasses;
- (BOOL)_shouldRenderButtonOverlay;
- (void)_loadCardSectionView;
- (void)_updateContentSize;
- (void)viewDidLayoutSubviews;
@end

@implementation SiriUILegacyStocksChartCardSectionViewController

+ (id)cardSectionClasses
{
  if (cardSectionClasses_onceToken != -1) {
    dispatch_once(&cardSectionClasses_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)cardSectionClasses_cardSectionClasses;
  return v2;
}

uint64_t __70__SiriUILegacyStocksChartCardSectionViewController_cardSectionClasses__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  uint64_t v1 = cardSectionClasses_cardSectionClasses;
  cardSectionClasses_cardSectionClasses = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)_loadCardSectionView
{
  v18[1] = *MEMORY[0x263EF8340];
  v3 = [SiriUICardSectionView alloc];
  v4 = -[SiriUICardSectionView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(SiriUILegacyStocksChartCardSectionViewController *)self setView:v4];

  v5 = [(CRKCardSectionViewController *)self cardSection];
  v6 = [v5 backingCardSection];

  id v7 = objc_alloc_init(MEMORY[0x263F64E40]);
  id v8 = [NSString alloc];
  v9 = [v6 chartData];
  v10 = (void *)[v8 initWithData:v9 encoding:4];
  [v7 setChartData:v10];

  id v11 = objc_alloc_init(MEMORY[0x263F64E48]);
  v18[0] = v7;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  [v11 setStocks:v12];

  v13 = +[SiriUISnippetManager sharedInstance];
  v14 = [v13 snippetViewControllerForSnippet:v11];
  snippetViewController = self->_snippetViewController;
  self->_snippetViewController = v14;

  [(SiriUILegacyStocksChartCardSectionViewController *)self _updateContentSize];
  [(SiriUILegacyStocksChartCardSectionViewController *)self addChildViewController:self->_snippetViewController];
  v16 = [(SiriUILegacyStocksChartCardSectionViewController *)self view];
  v17 = [(SiriUISnippetViewController *)self->_snippetViewController view];
  [v16 setContentView:v17];

  [(SiriUISnippetViewController *)self->_snippetViewController didMoveToParentViewController:self];
}

- (BOOL)_shouldRenderButtonOverlay
{
  return 1;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SiriUILegacyStocksChartCardSectionViewController;
  [(CRKCardSectionViewController *)&v3 viewDidLayoutSubviews];
  [(SiriUILegacyStocksChartCardSectionViewController *)self _updateContentSize];
}

- (void)_updateContentSize
{
  objc_super v3 = [(CRKCardSectionViewController *)self delegate];
  [v3 boundingSizeForCardSectionViewController:self];
  double v5 = v4;

  if (objc_opt_respondsToSelector())
  {
    id v7 = [(SiriUILegacyStocksChartCardSectionViewController *)self view];
    [(SiriUISnippetViewController *)self->_snippetViewController desiredHeightForWidth:v5];
  }
  else
  {
    id v7 = [(SiriUILegacyStocksChartCardSectionViewController *)self view];
    [(SiriUIBaseSnippetViewController *)self->_snippetViewController desiredHeight];
  }
  objc_msgSend(v7, "setContentSize:", v5, v6);
}

- (void).cxx_destruct
{
}

@end