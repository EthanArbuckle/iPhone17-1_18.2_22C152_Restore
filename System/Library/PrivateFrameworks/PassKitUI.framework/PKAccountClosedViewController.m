@interface PKAccountClosedViewController
- (PKAccountClosedViewController)initWithAccount:(id)a3 accountUserCollection:(id)a4 familyMemberCollection:(id)a5 context:(int64_t)a6;
- (void)explanationViewDidSelectBodyButton:(id)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKAccountClosedViewController

- (PKAccountClosedViewController)initWithAccount:(id)a3 accountUserCollection:(id)a4 familyMemberCollection:(id)a5 context:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKAccountClosedViewController;
  v14 = [(PKExplanationViewController *)&v17 initWithContext:a6];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_account, a3);
    objc_storeStrong((id *)&v15->_accountUserCollection, a4);
    objc_storeStrong((id *)&v15->_familyMemberCollection, a5);
  }

  return v15;
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)PKAccountClosedViewController;
  [(PKExplanationViewController *)&v18 viewDidLoad];
  v3 = [(PKExplanationViewController *)self explanationView];
  [v3 setShowPrivacyView:0];
  v4 = PKLocalizedMadisonString(&cfstr_AccountClosure.isa);
  [v3 setTitleText:v4];

  v5 = [(PKAccountUserCollection *)self->_accountUserCollection coOwnerAccountUser];
  familyMemberCollection = self->_familyMemberCollection;
  v7 = [v5 altDSID];
  v8 = [(PKFamilyMemberCollection *)familyMemberCollection familyMemberForAltDSID:v7];

  v9 = (void *)MEMORY[0x1E4F845E8];
  v10 = [v5 nameComponents];
  id v11 = [v9 contactForFamilyMember:v8 nameComponents:v10 imageData:0];

  id v12 = [v11 givenName];
  id v13 = PKLocalizedMadisonString(&cfstr_AccountClosure_0.isa, &stru_1EF1B4C70.isa, v12);

  [v3 setBodyText:v13];
  v14 = PKLocalizedMadisonString(&cfstr_AccountClosure_1.isa);
  [v3 setBodyButtonText:v14];

  v15 = [v3 dockView];
  v16 = [v15 primaryButton];
  objc_super v17 = PKLocalizedMadisonString(&cfstr_AccountClosure_2.isa);
  [v16 setTitle:v17 forState:0];
}

- (void)explanationViewDidSelectContinue:(id)a3
{
}

- (void)explanationViewDidSelectBodyButton:(id)a3
{
  v7 = [[PKPaymentMoreInformationViewController alloc] initWithContext:[(PKExplanationViewController *)self context]];
  v4 = PKLocalizedMadisonString(&cfstr_AccountClosure_3.isa);
  [(PKPaymentMoreInformationViewController *)v7 setDetailTitle:v4];

  v5 = PKLocalizedMadisonString(&cfstr_AccountClosure_4.isa);
  [(PKPaymentMoreInformationViewController *)v7 setDetailBody:v5];

  v6 = [[PKNavigationController alloc] initWithRootViewController:v7];
  [(PKAccountClosedViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMemberCollection, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end