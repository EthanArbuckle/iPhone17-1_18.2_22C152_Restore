@interface PXPeopleDetailSettingsOneUpViewController
- (PXPeopleDetailSettingsOneUpViewController)initWithAsset:(id)a3;
- (UIImage)asset;
- (void)setAsset:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PXPeopleDetailSettingsOneUpViewController

- (void).cxx_destruct
{
}

- (UIImage)asset
{
  return self->_asset;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __96__PXPeopleDetailSettingsOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_1E5DD0FA8;
  v4[4] = self;
  [a4 animateAlongsideTransition:v4 completion:&__block_literal_global_272731];
}

void __96__PXPeopleDetailSettingsOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  id v5 = [v2 viewWithTag:1];

  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 bounds];
  objc_msgSend(v5, "setBounds:");

  v4 = [*(id *)(a1 + 32) view];
  [v4 center];
  objc_msgSend(v5, "setCenter:");
}

- (void)setAsset:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4FB1838];
  id v5 = a3;
  id v7 = (id)[[v4 alloc] initWithImage:v5];

  [v7 setContentMode:1];
  v6 = [(PXPeopleDetailSettingsOneUpViewController *)self view];
  [v6 addSubview:v7];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)PXPeopleDetailSettingsOneUpViewController;
  [(PXPeopleDetailSettingsOneUpViewController *)&v12 viewDidLoad];
  v3 = [(PXPeopleDetailSettingsOneUpViewController *)self view];
  [v3 frame];
  double v5 = v4;
  v6 = [(PXPeopleDetailSettingsOneUpViewController *)self view];
  [v6 frame];
  double v8 = v7;

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", 0.0, 0.0, v5, v8);
  v10 = [MEMORY[0x1E4FB1618] whiteColor];
  [v9 setBackgroundColor:v10];

  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setContentMode:1];
  [v9 setClipsToBounds:0];
  [v9 setTag:1];
  v11 = [(PXPeopleDetailSettingsOneUpViewController *)self view];
  [v11 addSubview:v9];
}

- (PXPeopleDetailSettingsOneUpViewController)initWithAsset:(id)a3
{
  id v5 = a3;
  if (self)
  {
    [(PXPeopleDetailSettingsOneUpViewController *)self superclass];
    objc_storeStrong((id *)&self->_asset, a3);
  }

  return self;
}

@end