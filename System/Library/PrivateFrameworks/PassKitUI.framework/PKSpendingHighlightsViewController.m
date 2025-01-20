@interface PKSpendingHighlightsViewController
- (PKSpendingHighlightsViewController)init;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKSpendingHighlightsViewController

- (PKSpendingHighlightsViewController)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  v6.receiver = self;
  v6.super_class = (Class)PKSpendingHighlightsViewController;
  v4 = [(PKSpendingHighlightsViewController *)&v6 initWithCollectionViewLayout:v3];

  return v4;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PKSpendingHighlightsViewController;
  [(PKSpendingHighlightsViewController *)&v6 viewDidLoad];
  id v3 = [(PKSpendingHighlightsViewController *)self navigationItem];
  v4 = PKLocalizedPaymentString(&cfstr_FinhealthInsig.isa);
  [v3 setTitle:v4];

  v5 = [(PKSpendingHighlightsViewController *)self collectionView];
  [v5 setShowsVerticalScrollIndicator:1];
  [v5 setAlwaysBounceVertical:1];
  [v5 setBounces:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKSpendingHighlightsViewController;
  [(PKSpendingHighlightsViewController *)&v3 viewWillAppear:a3];
}

- (void)viewWillLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)PKSpendingHighlightsViewController;
  [(PKSpendingHighlightsViewController *)&v2 viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)PKSpendingHighlightsViewController;
  [(PKSpendingHighlightsViewController *)&v2 viewDidLayoutSubviews];
}

@end