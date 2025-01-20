@interface PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController
- (PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 pass:(id)a5 delegate:(id)a6;
- (void)_nextButtonPressed;
- (void)loadView;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController

- (PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 pass:(id)a5 delegate:(id)a6
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController;
  v14 = [(PKPaymentSetupOptionsViewController *)&v26 initWithProvisioningController:0 context:0 delegate:0];
  v15 = v14;
  if (v14)
  {
    v14->_mode = a3;
    p_entitlementComposer = (id *)&v14->_entitlementComposer;
    objc_storeStrong((id *)&v14->_entitlementComposer, a4);
    objc_storeStrong((id *)&v15->_pass, a5);
    objc_storeStrong((id *)&v15->_delegate, a6);
    v17 = [*p_entitlementComposer viewForEnabledEntitlements];
    [v17 setIsManagingEntitlementConfiguration:1];
    [v17 setShareability:0];
    [v17 setVisibility:1];
    [v17 setManageability:1];
    objc_msgSend(v17, "setIntraAccountSharingEnabled:", objc_msgSend(v17, "possibleIntraAccountSharing"));
    [v17 setEnabled:1];
    v18 = [[PKPassEntitlementCapabilitySectionController alloc] initWithMode:v15->_mode entitlementComposer:*p_entitlementComposer composerView:v17 isDisabled:0 delegate:v15];
    capabilitySectionController = v15->_capabilitySectionController;
    v15->_capabilitySectionController = v18;

    [(PKDynamicCollectionViewController *)v15 setUseItemIdentityWhenUpdating:1];
    [(PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController *)v15 setModalPresentationStyle:6];
    v27[0] = v15->_capabilitySectionController;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    [(PKPaymentSetupOptionsViewController *)v15 setSections:v20 animated:0];

    v21 = [(PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController *)v15 navigationItem];
    id v22 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v23 = PKLocalizedPaymentString(&cfstr_Next.isa);
    v24 = (void *)[v22 initWithTitle:v23 style:0 target:v15 action:sel__nextButtonPressed];

    [v21 setRightBarButtonItem:v24];
  }

  return v15;
}

- (void)loadView
{
  v9.receiver = self;
  v9.super_class = (Class)PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController;
  [(PKDynamicCollectionViewController *)&v9 loadView];
  [(PKPaymentSetupOptionsViewController *)self setHeaderMode:0];
  v3 = PKLocalizedShareableCredentialString(&cfstr_ShareInitiatio_2.isa);
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v3];

  v4 = PKLocalizedShareableCredentialString(&cfstr_ShareInitiatio_3.isa);
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v4];

  v5 = [(PKPaymentSetupOptionsViewController *)self headerView];
  [v5 setTitleAccessoriesEnabled:0];

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
  v4.super_class = (Class)PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController;
  [(PKPaymentSetupOptionsViewController *)&v4 viewWillAppear:a3];
  [(PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController *)self _reloadSections:0];
}

- (void)_nextButtonPressed
{
  v3 = [(PKPassEntitlementsComposer *)self->_entitlementComposer composeSharedEntitlements];
  objc_super v4 = [v3 firstObject];
  v5 = [v4 entitlementIdentifier];

  v6 = [(PKPassEntitlementsComposer *)self->_entitlementComposer entitlementEntries];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94__PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController__nextButtonPressed__block_invoke;
  v13[3] = &unk_1E59DC7C0;
  id v14 = v5;
  id v7 = v5;
  v8 = objc_msgSend(v6, "pk_firstObjectPassingTest:", v13);

  objc_super v9 = PKLocalizedShareableCredentialString(&cfstr_ShareOverviewP_2.isa);
  v10 = [v8 displayableEntitlement];
  id v11 = [v10 localizedTitle];

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F84E80]) initWithTitle:v9 preshareDescription:v11 postshareDescription:v11 sharedEntitlements:v3];
  [(PKPassShareCreateEntitlementSetTemplateDelegate *)self->_delegate createPredefinedSelectionViewController:self didCreatePredefinedSelection:v12];
}

uint64_t __94__PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController__nextButtonPressed__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 displayableEntitlement];
  objc_super v4 = [v3 entitlementIdentifier];
  v5 = *(void **)(a1 + 32);
  id v6 = v4;
  id v7 = v5;
  v8 = v7;
  if (v6 == v7)
  {
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
    if (v6 && v7) {
      uint64_t v9 = [v6 isEqualToString:v7];
    }
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilitySectionController, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_entitlementComposer, 0);
}

@end