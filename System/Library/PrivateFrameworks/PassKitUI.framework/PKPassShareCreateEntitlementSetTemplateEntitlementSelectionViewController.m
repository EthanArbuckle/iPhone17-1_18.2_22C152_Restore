@interface PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController
- (PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 pass:(id)a5 delegate:(id)a6;
- (void)_nextButtonPressed;
- (void)entitlementSelectionDidChange;
- (void)loadView;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController

- (PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 pass:(id)a5 delegate:(id)a6
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController;
  v14 = [(PKPaymentSetupOptionsViewController *)&v26 initWithProvisioningController:0 context:0 delegate:0];
  v15 = v14;
  if (v14)
  {
    v14->_mode = a3;
    p_entitlementComposer = (id *)&v14->_entitlementComposer;
    objc_storeStrong((id *)&v14->_entitlementComposer, a4);
    objc_storeStrong((id *)&v15->_pass, a5);
    objc_storeStrong((id *)&v15->_delegate, a6);
    v17 = [*p_entitlementComposer globalView];
    [v17 setIsManagingEntitlementConfiguration:1];
    [v17 setIsManagingTimeConfiguration:1];
    [v17 setEnabled:0];
    v18 = [[PKPassEntitlementSelectionSectionController alloc] initWithMode:a3 entitlementComposer:*p_entitlementComposer delegate:v15];
    entitlementSectionController = v15->_entitlementSectionController;
    v15->_entitlementSectionController = v18;

    [(PKDynamicCollectionViewController *)v15 setUseItemIdentityWhenUpdating:1];
    [(PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController *)v15 setModalPresentationStyle:6];
    v27[0] = v15->_entitlementSectionController;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    [(PKPaymentSetupOptionsViewController *)v15 setSections:v20 animated:0];

    v21 = [(PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController *)v15 navigationItem];
    id v22 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v23 = PKLocalizedPaymentString(&cfstr_Next.isa);
    v24 = (void *)[v22 initWithTitle:v23 style:0 target:v15 action:sel__nextButtonPressed];

    [v24 setEnabled:0];
    [v21 setRightBarButtonItem:v24];
  }
  return v15;
}

- (void)loadView
{
  v9.receiver = self;
  v9.super_class = (Class)PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController;
  [(PKDynamicCollectionViewController *)&v9 loadView];
  [(PKPaymentSetupOptionsViewController *)self setHeaderMode:0];
  v3 = [(PKPaymentSetupOptionsViewController *)self headerView];
  [v3 setTitleAccessoriesEnabled:0];

  if ([(PKSecureElementPass *)self->_pass accessType] == 4)
  {
    v4 = PKLocalizedShareableCredentialString(&cfstr_ShareInitiatio.isa);
    [(PKPaymentSetupOptionsViewController *)self setTitleText:v4];

    v5 = PKLocalizedShareableCredentialString(&cfstr_ShareInitiatio_0.isa);
    [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v5];
  }
  else
  {
    v5 = PKLocalizedShareableCredentialString(&cfstr_ShareInitiatio_1.isa);
    [(PKPaymentSetupOptionsViewController *)self setTitleText:v5];
  }

  v6 = [(PKPaymentSetupOptionsViewController *)self dockView];
  v7 = [v6 footerView];
  [v6 setPrimaryButton:0];
  [v6 setButtonsEnabled:1];
  [v7 setSetupLaterButton:0];
  [v7 setManualEntryButton:0];
  v8 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(PKPaymentSetupOptionsViewController *)self setBackgroundColor:v8];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController;
  [(PKPaymentSetupOptionsViewController *)&v4 viewWillAppear:a3];
  [(PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController *)self _reloadSections:0];
}

- (void)_nextButtonPressed
{
  objc_super v4 = [[PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController alloc] initWithMode:self->_mode entitlementComposer:self->_entitlementComposer pass:self->_pass delegate:self->_delegate];
  v3 = [(PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController *)self navigationController];
  [v3 pushViewController:v4 animated:1];
}

- (void)entitlementSelectionDidChange
{
  v3 = [(PKPassEntitlementsComposer *)self->_entitlementComposer composeSharedEntitlements];
  BOOL v4 = [v3 count] != 0;

  id v6 = [(PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController *)self navigationItem];
  v5 = [v6 rightBarButtonItem];
  [v5 setEnabled:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementSectionController, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_entitlementComposer, 0);
}

@end