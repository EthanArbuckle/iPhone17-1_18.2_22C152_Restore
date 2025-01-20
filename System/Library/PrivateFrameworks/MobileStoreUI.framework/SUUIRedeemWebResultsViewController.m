@interface SUUIRedeemWebResultsViewController
+ (BOOL)canShowResultsForRedeem:(id)a3;
- (void)dealloc;
- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation SUUIRedeemWebResultsViewController

+ (BOOL)canShowResultsForRedeem:(id)a3
{
  v3 = [a3 customizedThankyouURL];

  return v3 != 0;
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)SUUIRedeemWebResultsViewController;
  [(SUUIRedeemResultsViewController *)&v20 viewDidLoad];
  v3 = [(SUUIRedeemResultsViewController *)self redeem];
  v4 = [v3 customizedThankyouURL];

  v5 = [(SUUIRedeemStepViewController *)self clientContext];
  v6 = [v5 clientInterface];

  v7 = (void *)[objc_alloc(MEMORY[0x263F895B0]) initWithExternalAccountURL:v4];
  [v7 setCanMoveToOverlay:0];
  [v7 setClientInterface:v6];
  [(SUUIRedeemWebResultsViewController *)self addChildViewController:v7];
  v8 = [(SUUIRedeemWebResultsViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [v7 view];
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  v18 = [(SUUIRedeemWebResultsViewController *)self view];
  v19 = [v7 view];
  [v18 addSubview:v19];

  [v7 didMoveToParentViewController:self];
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [(SUUIRedeemWebResultsViewController *)self childViewControllers];
  v4 = (void *)[v3 copy];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v10 willMoveToParentViewController:0];
        double v11 = [v10 view];
        [v11 removeFromSuperview];

        [v10 removeFromParentViewController];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v12.receiver = self;
  v12.super_class = (Class)SUUIRedeemWebResultsViewController;
  [(SUUIRedeemWebResultsViewController *)&v12 dealloc];
}

- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4
{
  if (!a4)
  {
    uint64_t v6 = [SUUIRedeemNativeResultsViewController alloc];
    uint64_t v7 = [(SUUIRedeemResultsViewController *)self redeem];
    objc_super v12 = [(SUUIRedeemNativeResultsViewController *)v6 initWithRedeem:v7];

    uint64_t v8 = [(SUUIRedeemStepViewController *)self clientContext];
    [(SUUIRedeemStepViewController *)v12 setClientContext:v8];

    [(SUUIRedeemResultsViewController *)v12 setRedeemCategory:[(SUUIRedeemResultsViewController *)self redeemCategory]];
    double v9 = [(SUUIRedeemStepViewController *)self operationQueue];
    [(SUUIRedeemNativeResultsViewController *)v12 setOperationQueue:v9];

    double v10 = [(SUUIRedeemStepViewController *)self configuration];
    [(SUUIRedeemStepViewController *)v12 setConfiguration:v10];

    double v11 = [(SUUIRedeemWebResultsViewController *)self navigationController];
    [v11 pushViewController:v12 animated:1];
  }
}

@end