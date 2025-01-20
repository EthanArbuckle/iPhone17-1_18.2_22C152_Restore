@interface NDOWarrantyBenefitsViewController
- (NDOWarranty)warranty;
- (NDOWarrantyBenefitsViewController)initWithWarranty:(id)a3;
- (void)donePressed:(id)a3;
- (void)loadView;
- (void)setWarranty:(id)a3;
@end

@implementation NDOWarrantyBenefitsViewController

- (NDOWarrantyBenefitsViewController)initWithWarranty:(id)a3
{
  id v4 = a3;
  v5 = [v4 localizedBenefitsCardTitle];
  v8.receiver = self;
  v8.super_class = (Class)NDOWarrantyBenefitsViewController;
  v6 = [(OBTextWelcomeController *)&v8 initWithTitle:v5];

  if (v6) {
    objc_storeWeak((id *)&v6->_warranty, v4);
  }

  return v6;
}

- (void)loadView
{
  v16.receiver = self;
  v16.super_class = (Class)NDOWarrantyBenefitsViewController;
  [(OBTextWelcomeController *)&v16 loadView];
  v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_donePressed_];
  id v4 = [(OBBaseWelcomeController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  v5 = [(NDOWarrantyBenefitsViewController *)self warranty];
  v6 = [v5 localizedBenefitsCardSubTitle];

  if (v6)
  {
    v7 = [(NDOWarrantyBenefitsViewController *)self warranty];
    objc_super v8 = [v7 localizedBenefitsCardSubTitle];
    [(OBTextWelcomeController *)self addSectionWithHeader:0 content:v8];
  }
  v9 = [(NDOWarrantyBenefitsViewController *)self warranty];
  v10 = [v9 benefitDetailsArray];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __45__NDOWarrantyBenefitsViewController_loadView__block_invoke;
  v15[3] = &unk_264D49CB8;
  v15[4] = self;
  [v10 enumerateObjectsUsingBlock:v15];

  v11 = [(NDOWarrantyBenefitsViewController *)self warranty];
  v12 = [v11 localizedBenefitsCardFooter];

  if (v12)
  {
    v13 = [(NDOWarrantyBenefitsViewController *)self warranty];
    v14 = [v13 localizedBenefitsCardFooter];
    [(OBTextWelcomeController *)self addSectionWithHeader:0 content:v14];
  }
}

void __45__NDOWarrantyBenefitsViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 objectForKeyedSubscript:@"localizedBenefitLabel"];
  id v4 = [v3 objectForKeyedSubscript:@"localizedBenefitValue"];

  [v2 addSectionWithHeader:v5 content:v4];
}

- (void)donePressed:(id)a3
{
  id v3 = [(NDOWarrantyBenefitsViewController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (NDOWarranty)warranty
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_warranty);
  return (NDOWarranty *)WeakRetained;
}

- (void)setWarranty:(id)a3
{
}

- (void).cxx_destruct
{
}

@end