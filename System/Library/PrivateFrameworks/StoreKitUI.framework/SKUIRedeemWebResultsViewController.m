@interface SKUIRedeemWebResultsViewController
+ (BOOL)canShowResultsForRedeem:(id)a3;
- (void)dealloc;
- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation SKUIRedeemWebResultsViewController

+ (BOOL)canShowResultsForRedeem:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIRedeemWebResultsViewController canShowResultsForRedeem:]();
  }
  v4 = [v3 customizedThankyouURL];

  return v4 != 0;
}

- (void)viewDidLoad
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRedeemWebResultsViewController viewDidLoad]";
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(SKUIRedeemWebResultsViewController *)self childViewControllers];
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
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v10 willMoveToParentViewController:0];
        v11 = [v10 view];
        [v11 removeFromSuperview];

        [v10 removeFromParentViewController];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v12.receiver = self;
  v12.super_class = (Class)SKUIRedeemWebResultsViewController;
  [(SKUIRedeemWebResultsViewController *)&v12 dealloc];
}

- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4
{
  if (!a4)
  {
    uint64_t v6 = [SKUIRedeemNativeResultsViewController alloc];
    uint64_t v7 = [(SKUIRedeemResultsViewController *)self redeem];
    objc_super v12 = [(SKUIRedeemNativeResultsViewController *)v6 initWithRedeem:v7];

    uint64_t v8 = [(SKUIRedeemStepViewController *)self clientContext];
    [(SKUIRedeemStepViewController *)v12 setClientContext:v8];

    [(SKUIRedeemResultsViewController *)v12 setRedeemCategory:[(SKUIRedeemResultsViewController *)self redeemCategory]];
    v9 = [(SKUIRedeemStepViewController *)self operationQueue];
    [(SKUIRedeemNativeResultsViewController *)v12 setOperationQueue:v9];

    v10 = [(SKUIRedeemStepViewController *)self configuration];
    [(SKUIRedeemStepViewController *)v12 setConfiguration:v10];

    v11 = [(SKUIRedeemWebResultsViewController *)self navigationController];
    [v11 pushViewController:v12 animated:1];
  }
}

+ (void)canShowResultsForRedeem:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIRedeemWebResultsViewController canShowResultsForRedeem:]";
}

@end