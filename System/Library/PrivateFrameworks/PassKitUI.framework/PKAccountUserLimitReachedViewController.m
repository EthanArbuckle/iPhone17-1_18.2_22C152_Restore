@interface PKAccountUserLimitReachedViewController
- (PKAccountUserLimitReachedViewController)initWithAccount:(id)a3 context:(int64_t)a4;
- (void)explanationViewDidSelectBodyButton:(id)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKAccountUserLimitReachedViewController

- (PKAccountUserLimitReachedViewController)initWithAccount:(id)a3 context:(int64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountUserLimitReachedViewController;
  v8 = [(PKExplanationViewController *)&v13 initWithContext:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_account, a3);
    v10 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    maximumAccountUsersFormatter = v9->_maximumAccountUsersFormatter;
    v9->_maximumAccountUsersFormatter = v10;

    [(NSNumberFormatter *)v9->_maximumAccountUsersFormatter setNumberStyle:5];
    [(PKExplanationViewController *)v9 setShowDoneButton:0];
    [(PKExplanationViewController *)v9 setShowCancelButton:0];
  }

  return v9;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)PKAccountUserLimitReachedViewController;
  [(PKExplanationViewController *)&v14 viewDidLoad];
  v3 = [(PKExplanationViewController *)self explanationView];
  uint64_t v4 = [(PKAccount *)self->_account feature];
  [v3 setShowPrivacyView:0];
  v5 = PKFeatureApplicationHeaderImageWithImage(v4, 0);
  [v3 setImage:v5];
  [v3 setTopMargin:30.0];
  v6 = PKLocalizedMadisonString(&cfstr_AccountUserLim.isa);
  [v3 setTitleText:v6];
  id v7 = [(PKAccount *)self->_account accountUserInvitationAllowedFeatureDescriptor];
  uint64_t v8 = [v7 maximumAccountUsers];

  v9 = PKLocalizedString(&cfstr_AccountUserLim_0.isa, &cfstr_Lu.isa, v8);
  [v3 setBodyText:v9];
  v10 = PKLocalizedMadisonString(&cfstr_AboutAppleCard.isa);
  [v3 setBodyButtonText:v10];
  v11 = PKLocalizedFeatureString();
  v12 = [v3 dockView];
  objc_super v13 = [v12 primaryButton];
  [v13 setTitle:v11 forState:0];
}

- (void)explanationViewDidSelectContinue:(id)a3
{
}

- (void)explanationViewDidSelectBodyButton:(id)a3
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"https://support.apple.com/ht212143?cid=mc-ols-applecard-article_h212143-ios_ui-01212021"];
  v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumAccountUsersFormatter, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end