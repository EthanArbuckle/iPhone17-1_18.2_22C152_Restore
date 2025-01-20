@interface PBFExtensionTestingViewController
- (PBFExtensionTestingViewController)init;
- (void)_variantSelectorValueChanged:(id)a3;
- (void)presentPage:(id)a3;
- (void)viewDidLoad;
@end

@implementation PBFExtensionTestingViewController

- (PBFExtensionTestingViewController)init
{
  v14.receiver = self;
  v14.super_class = (Class)PBFExtensionTestingViewController;
  v2 = [(PBFExtensionTestingViewController *)&v14 init];
  if (v2)
  {
    v3 = objc_alloc_init(ExtensionListViewController);
    renderingController = v2->_renderingController;
    v2->_renderingController = v3;

    [(ExtensionListViewController *)v2->_renderingController setTitle:@"Rendering"];
    [(ExtensionListViewController *)v2->_renderingController setExtensionItemActivationStyle:0];
    v5 = objc_alloc_init(ExtensionListViewController);
    editingController = v2->_editingController;
    v2->_editingController = v5;

    [(ExtensionListViewController *)v2->_editingController setTitle:@"Editing"];
    [(ExtensionListViewController *)v2->_editingController setExtensionItemActivationStyle:1];
    v7 = objc_alloc_init(PBFGalleryViewController);
    galleryController = v2->_galleryController;
    v2->_galleryController = v7;

    [(PBFGalleryViewController *)v2->_galleryController setTitle:@"Gallery"];
    v9 = objc_alloc_init(PBFConfigViewController);
    configController = v2->_configController;
    v2->_configController = v9;

    [(PBFConfigViewController *)v2->_configController setTitle:@"Configurations"];
    v11 = objc_alloc_init(PBFClientTesterViewController);
    clientTesterController = v2->_clientTesterController;
    v2->_clientTesterController = v11;
  }
  return v2;
}

- (void)viewDidLoad
{
  v36[7] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)PBFExtensionTestingViewController;
  [(PBFExtensionTestingViewController *)&v35 viewDidLoad];
  v3 = [(PBFExtensionTestingViewController *)self view];
  if (MEMORY[0x1D9433950]("-[PBFExtensionTestingViewController viewDidLoad]"))
  {
    v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v3 setBackgroundColor:v4];

    v5 = (UISegmentedControl *)[objc_alloc(MEMORY[0x1E4FB1C10]) initWithItems:&unk_1F2AAEC20];
    variantSelector = self->_variantSelector;
    self->_variantSelector = v5;

    [(UISegmentedControl *)self->_variantSelector addTarget:self action:sel__variantSelectorValueChanged_ forControlEvents:4096];
    [(UISegmentedControl *)self->_variantSelector setSelectedSegmentIndex:0];
    [(UISegmentedControl *)self->_variantSelector setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = (UINavigationBar *)objc_alloc_init(MEMORY[0x1E4FB19D0]);
    barView = self->_barView;
    self->_barView = v7;

    [(UINavigationBar *)self->_barView setTranslucent:0];
    [(UINavigationBar *)self->_barView setTranslatesAutoresizingMaskIntoConstraints:0];
    [v3 addSubview:self->_variantSelector];
    [v3 addSubview:self->_barView];
    v25 = (void *)MEMORY[0x1E4F28DC8];
    v34 = [(UINavigationBar *)self->_barView centerXAnchor];
    v33 = [v3 centerXAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v36[0] = v32;
    v31 = [(UINavigationBar *)self->_barView widthAnchor];
    v30 = [v3 widthAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v36[1] = v29;
    v28 = [(UISegmentedControl *)self->_variantSelector centerXAnchor];
    v27 = [v3 centerXAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v36[2] = v26;
    v24 = [(UISegmentedControl *)self->_variantSelector leadingAnchor];
    v23 = [v3 leadingAnchor];
    v22 = [v24 constraintGreaterThanOrEqualToAnchor:v23 constant:10.0];
    v36[3] = v22;
    v21 = [(UISegmentedControl *)self->_variantSelector trailingAnchor];
    v20 = [v3 trailingAnchor];
    v19 = [v21 constraintLessThanOrEqualToAnchor:v20 constant:-10.0];
    v36[4] = v19;
    v18 = [v3 safeAreaLayoutGuide];
    v9 = [v18 bottomAnchor];
    v10 = [(UISegmentedControl *)self->_variantSelector bottomAnchor];
    v11 = [v9 constraintEqualToSystemSpacingBelowAnchor:v10 multiplier:1.0];
    v36[5] = v11;
    v12 = [v3 safeAreaLayoutGuide];
    v13 = [v12 topAnchor];
    objc_super v14 = [(UINavigationBar *)self->_barView topAnchor];
    v15 = [v13 constraintEqualToSystemSpacingBelowAnchor:v14 multiplier:1.0];
    v36[6] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:7];
    [v25 activateConstraints:v16];

    [(PBFExtensionTestingViewController *)self presentPage:self->_renderingController];
  }
  else
  {
    v17 = [MEMORY[0x1E4FB1618] clearColor];
    [v3 setBackgroundColor:v17];
  }
}

- (void)presentPage:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  v5 = (UIViewController *)a3;
  p_presentedViewController = &self->_presentedViewController;
  if (self->_presentedViewController != v5
    && MEMORY[0x1D9433950]("-[PBFExtensionTestingViewController presentPage:]"))
  {
    [(PBFExtensionTestingViewController *)self bs_removeChildViewController:*p_presentedViewController animated:1 transitionBlock:0];
    [(PBFExtensionTestingViewController *)self bs_addChildViewController:v5 animated:1 transitionBlock:0];
    objc_storeStrong((id *)&self->_presentedViewController, a3);
    v7 = [(UIViewController *)v5 navigationItem];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v10 = objc_alloc(MEMORY[0x1E4FB19F0]);
      v11 = [(UIViewController *)v5 title];
      id v9 = (id)[v10 initWithTitle:v11];
    }
    v31 = v9;

    barView = self->_barView;
    v33[0] = v9;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    [(UINavigationBar *)barView setItems:v13];

    objc_super v14 = [(PBFExtensionTestingViewController *)self view];
    v15 = [(UIViewController *)*p_presentedViewController view];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    v25 = (void *)MEMORY[0x1E4F28DC8];
    v30 = [v15 topAnchor];
    v29 = [(UINavigationBar *)self->_barView bottomAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v32[0] = v28;
    v27 = [v15 leftAnchor];
    v24 = v14;
    v26 = [v14 leftAnchor];
    v16 = [v27 constraintEqualToAnchor:v26];
    v32[1] = v16;
    v17 = [v15 bottomAnchor];
    v18 = [(UISegmentedControl *)self->_variantSelector topAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v32[2] = v19;
    v20 = [v15 rightAnchor];
    v21 = [v14 rightAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v32[3] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
    [v25 activateConstraints:v23];
  }
}

- (void)_variantSelectorValueChanged:(id)a3
{
  unint64_t v4 = [a3 selectedSegmentIndex];
  if (v4 > 4) {
    id v5 = 0;
  }
  else {
    id v5 = *(id *)((char *)&self->super.super.super.isa + *off_1E6981DC8[v4]);
  }
  id v6 = v5;
  [(PBFExtensionTestingViewController *)self presentPage:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_clientTesterController, 0);
  objc_storeStrong((id *)&self->_configController, 0);
  objc_storeStrong((id *)&self->_galleryController, 0);
  objc_storeStrong((id *)&self->_editingController, 0);
  objc_storeStrong((id *)&self->_renderingController, 0);
  objc_storeStrong((id *)&self->_variantSelector, 0);
  objc_storeStrong((id *)&self->_barView, 0);
}

@end