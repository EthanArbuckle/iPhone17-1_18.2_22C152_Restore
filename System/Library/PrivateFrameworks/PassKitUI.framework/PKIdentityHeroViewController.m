@interface PKIdentityHeroViewController
- (PKIdentityHeroViewController)initWithConfiguration:(id)a3;
- (id)primaryButtonClickedBlock;
- (id)secondaryButtonClickedBlock;
- (void)primaryButtonClicked:(id)a3;
- (void)secondaryButtonClicked:(id)a3;
- (void)setPrimaryButtonClickedBlock:(id)a3;
- (void)setSecondaryButtonClickedBlock:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKIdentityHeroViewController

- (PKIdentityHeroViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKIdentityHeroViewController;
  v6 = [(PKExplanationViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)PKIdentityHeroViewController;
  [(PKExplanationViewController *)&v21 viewDidLoad];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = objc_msgSend(MEMORY[0x1E4F83AD0], "pk_privacyLinkForContext:", 64);
  [(PKIdentityHeroViewController *)self addChildViewController:v4];
  [v3 setPrivacyLink:v4];
  [v3 setShowPrivacyView:1];
  [v4 didMoveToParentViewController:self];
  [v3 setDelegate:self];
  [v3 setBodyDataDetectorTypes:0];
  id v5 = [(PKIdentityHeroViewConfiguration *)self->_configuration title];
  [v3 setTitleText:v5];

  v6 = [(PKIdentityHeroViewConfiguration *)self->_configuration subtitle];
  [v3 setBodyText:v6];

  v7 = [(PKIdentityHeroViewConfiguration *)self->_configuration image];
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F84AC0]);
    objc_super v9 = [PKPaymentSetupHeroView alloc];
    v22[0] = v7;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    v11 = [(PKPaymentSetupHeroView *)v9 initWithContext:0 heroImageController:v8 heroImages:v10];
  }
  else
  {
    v11 = 0;
  }
  [v3 setHeroView:v11];
  v12 = PKProvisioningSecondaryBackgroundColor();
  [v3 setTopBackgroundColor:v12];

  v13 = [v3 dockView];
  v14 = [v13 primaryButton];
  v15 = [(PKIdentityHeroViewConfiguration *)self->_configuration primaryButtonTitle];
  [v14 setTitle:v15 forState:0];

  [v14 addTarget:self action:sel_primaryButtonClicked_ forControlEvents:64];
  v16 = [(PKIdentityHeroViewConfiguration *)self->_configuration secondaryButtonTitle];

  if (v16)
  {
    v17 = [v3 dockView];
    v18 = [v17 footerView];

    v19 = [v18 manualEntryButton];
    v20 = [(PKIdentityHeroViewConfiguration *)self->_configuration secondaryButtonTitle];
    [v19 setTitle:v20 forState:0];

    [v19 addTarget:self action:sel_secondaryButtonClicked_ forControlEvents:64];
  }
  [(PKExplanationViewController *)self setShowCancelButton:0];
}

- (void)primaryButtonClicked:(id)a3
{
  v3 = (void (**)(void))_Block_copy(self->_primaryButtonClickedBlock);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }
}

- (void)secondaryButtonClicked:(id)a3
{
  v3 = (void (**)(void))_Block_copy(self->_secondaryButtonClickedBlock);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }
}

- (id)primaryButtonClickedBlock
{
  return self->_primaryButtonClickedBlock;
}

- (void)setPrimaryButtonClickedBlock:(id)a3
{
}

- (id)secondaryButtonClickedBlock
{
  return self->_secondaryButtonClickedBlock;
}

- (void)setSecondaryButtonClickedBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_secondaryButtonClickedBlock, 0);
  objc_storeStrong(&self->_primaryButtonClickedBlock, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end