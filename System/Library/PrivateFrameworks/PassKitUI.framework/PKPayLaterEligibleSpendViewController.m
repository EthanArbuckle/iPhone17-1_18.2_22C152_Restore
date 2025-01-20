@interface PKPayLaterEligibleSpendViewController
- (PKPayLaterEligibleSpendViewController)initWithPayLaterAccount:(id)a3;
- (void)didUpdatePayLaterAccount:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKPayLaterEligibleSpendViewController

- (PKPayLaterEligibleSpendViewController)initWithPayLaterAccount:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterEligibleSpendViewController;
  v5 = [(PKPayLaterViewController *)&v9 initWithPayLaterAccount:v4];
  if (v5)
  {
    v6 = [[PKPayLaterEligibleSpendSectionController alloc] initWithPayLaterAccount:v4 dynamicContentPage:0 viewControllerDelegate:v5];
    sectionController = v5->_sectionController;
    v5->_sectionController = v6;

    [(PKPayLaterSectionController *)v5->_sectionController setDynamicCollectionDelegate:v5];
    [(PKDynamicCollectionViewController *)v5 setUseItemIdentityWhenUpdating:1];
  }

  return v5;
}

- (void)viewDidLoad
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterEligibleSpendViewController;
  [(PKPayLaterViewController *)&v4 viewDidLoad];
  v5[0] = self->_sectionController;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v3 animated:0];
}

- (void)didUpdatePayLaterAccount:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKPayLaterEligibleSpendViewController_didUpdatePayLaterAccount___block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __66__PKPayLaterEligibleSpendViewController_didUpdatePayLaterAccount___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1328) setPayLaterAccount:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 reloadDataAnimated:1];
}

- (void).cxx_destruct
{
}

@end