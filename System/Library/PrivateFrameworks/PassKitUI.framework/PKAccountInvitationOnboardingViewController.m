@interface PKAccountInvitationOnboardingViewController
- (PKAccountInvitationOnboardingViewController)initWithController:(id)a3;
- (id)_listItemConfigWithTitle:(id)a3 body:(id)a4 image:(id)a5;
- (void)_beginReportingIfNecessary;
- (void)_endReportingIfNecessary;
- (void)_reportContinueTapped;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKAccountInvitationOnboardingViewController

- (PKAccountInvitationOnboardingViewController)initWithController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountInvitationOnboardingViewController;
  v6 = -[PKExplanationViewController initWithContext:](&v9, sel_initWithContext_, [v5 context]);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_controller, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v21[3] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)PKAccountInvitationOnboardingViewController;
  [(PKExplanationViewController *)&v20 viewDidLoad];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = PKLocalizedMadisonString(&cfstr_AppleCardForFa.isa);
  [v3 setTitleText:v4];

  id v5 = PKLocalizedMadisonString(&cfstr_AppleCardInvit.isa);
  [v3 setBodyText:v5];

  [v3 setBodyViewPadding:24.0];
  v6 = [PKAccountInvitationOnboardingListView alloc];
  v19 = PKLocalizedMadisonString(&cfstr_AppleCardInvit_0.isa);
  v18 = PKLocalizedMadisonString(&cfstr_AppleCardInvit_1.isa);
  v17 = [(PKAccountInvitationOnboardingViewController *)self _listItemConfigWithTitle:v19 body:v18 image:@"CardFamilySharing/CoOwners"];
  v21[0] = v17;
  v7 = PKLocalizedMadisonString(&cfstr_AppleCardInvit_2.isa);
  v8 = PKLocalizedMadisonString(&cfstr_AppleCardInvit_3.isa);
  objc_super v9 = [(PKAccountInvitationOnboardingViewController *)self _listItemConfigWithTitle:v7 body:v8 image:@"CardFamilySharing/Participants"];
  v21[1] = v9;
  v10 = PKLocalizedMadisonString(&cfstr_AppleCardInvit_4.isa);
  v11 = PKLocalizedMadisonString(&cfstr_AppleCardInvit_5.isa);
  v12 = [(PKAccountInvitationOnboardingViewController *)self _listItemConfigWithTitle:v10 body:v11 image:@"CardFamilySharing/BuildCredit"];
  v21[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  v14 = [(PKAccountInvitationOnboardingListView *)v6 initWithConfigurations:v13];
  [v3 setBodyView:v14];

  [v3 setShowPrivacyView:1];
  v15 = objc_msgSend(MEMORY[0x1E4F83AD0], "pk_privacyLinkForContext:", 4);
  [(PKExplanationViewController *)self setPrivacyLinkController:v15];

  v16 = [(PKAccountInvitationOnboardingViewController *)self view];
  [v16 setAccessibilityIdentifier:*MEMORY[0x1E4F85230]];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PKAccountInvitationOnboardingViewController;
  [(PKAccountInvitationOnboardingViewController *)&v8 viewDidAppear:a3];
  [(PKAccountInvitationOnboardingViewController *)self _beginReportingIfNecessary];
  v4 = [(PKAccountInvitationController *)self->_controller applyController];
  uint64_t v5 = *MEMORY[0x1E4F86FF8];
  uint64_t v6 = *MEMORY[0x1E4F85F38];
  uint64_t v9 = *MEMORY[0x1E4F86308];
  v10[0] = *MEMORY[0x1E4F864A0];
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v4 reportAnalyticsDictionaryForPage:0 subject:v5 pageTag:v6 additionalValues:v7];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PKAccountInvitationOnboardingViewController;
  [(PKAccountInvitationOnboardingViewController *)&v8 viewDidDisappear:a3];
  v4 = [(PKAccountInvitationController *)self->_controller applyController];
  uint64_t v5 = *MEMORY[0x1E4F86FF8];
  uint64_t v6 = *MEMORY[0x1E4F85F38];
  uint64_t v9 = *MEMORY[0x1E4F86308];
  v10[0] = *MEMORY[0x1E4F864A8];
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v4 reportAnalyticsDictionaryForPage:0 subject:v5 pageTag:v6 additionalValues:v7];

  [(PKAccountInvitationOnboardingViewController *)self _endReportingIfNecessary];
}

- (id)_listItemConfigWithTitle:(id)a3 body:(id)a4 image:(id)a5
{
  v7 = (void *)MEMORY[0x1E4FB1948];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v7 cellConfiguration];
  [v11 setText:v10];

  v12 = [v11 textProperties];
  v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  [v12 setFont:v13];

  [v11 setSecondaryText:v9];
  v14 = [v11 secondaryTextProperties];
  v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [v14 setFont:v15];

  v16 = [v11 secondaryTextProperties];
  v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v16 setColor:v17];

  v18 = (void *)MEMORY[0x1E4FB1818];
  v19 = PKPassKitUIBundle();
  objc_super v20 = [v18 imageNamed:v8 inBundle:v19 withConfiguration:0];

  [v11 setImage:v20];
  v21 = [v11 imageProperties];
  objc_msgSend(v21, "setReservedLayoutSize:", 52.0, 53.0);

  [v11 setImageToTextPadding:20.0];

  return v11;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  [(PKExplanationViewController *)self showNavigationBarSpinner:1];
  [(PKAccountInvitationOnboardingViewController *)self _reportContinueTapped];
  [(PKAccountInvitationController *)self->_controller setFamilyMember:0];
  [(PKAccountInvitationController *)self->_controller setAccessLevel:0];
  controller = self->_controller;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__PKAccountInvitationOnboardingViewController_explanationViewDidSelectContinue___block_invoke;
  v5[3] = &unk_1E59CB6B0;
  v5[4] = self;
  [(PKAccountInvitationController *)controller nextViewControllerWithCompletion:v5];
}

void __80__PKAccountInvitationOnboardingViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v5)
  {
    id v8 = [v7 navigationController];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__PKAccountInvitationOnboardingViewController_explanationViewDidSelectContinue___block_invoke_2;
    v9[3] = &unk_1E59CB6D8;
    v9[4] = *(void *)(a1 + 32);
    objc_msgSend(v8, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v9);
LABEL_5:

    goto LABEL_6;
  }
  [v7 showNavigationBarSpinner:0];
  if (v6)
  {
    id v8 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
    [*(id *)(a1 + 32) presentViewController:v8 animated:1 completion:0];
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __80__PKAccountInvitationOnboardingViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) showNavigationBarSpinner:0];
}

- (void)_reportContinueTapped
{
  v7[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F86380];
  uint64_t v3 = *MEMORY[0x1E4F86120];
  v6[0] = *MEMORY[0x1E4F86308];
  v6[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F861B8];
  v7[0] = v2;
  v7[1] = v4;
  v6[2] = *MEMORY[0x1E4F86730];
  v7[2] = *MEMORY[0x1E4F85F38];
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  [MEMORY[0x1E4F843E0] subject:*MEMORY[0x1E4F86FF8] sendEvent:v5];
  [MEMORY[0x1E4F843E0] subject:*MEMORY[0x1E4F86FF0] sendEvent:v5];
}

- (void)_beginReportingIfNecessary
{
  uint64_t v3 = *MEMORY[0x1E4F86FF8];
  uint64_t v4 = [MEMORY[0x1E4F843E0] reporterForSubject:*MEMORY[0x1E4F86FF8]];

  if (!v4)
  {
    self->_didBeginOnboardingSubject = 1;
    id v5 = (void *)MEMORY[0x1E4F843E0];
    [v5 beginSubjectReporting:v3];
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginOnboardingSubject) {
    [MEMORY[0x1E4F843E0] endSubjectReporting:*MEMORY[0x1E4F86FF8]];
  }
}

- (void).cxx_destruct
{
}

@end