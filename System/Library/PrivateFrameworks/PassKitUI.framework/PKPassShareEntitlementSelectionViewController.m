@interface PKPassShareEntitlementSelectionViewController
- (BOOL)showDoneButton;
- (PKPassShareEntitlementSelectionViewController)initWithAccessType:(int64_t)a3 mode:(unint64_t)a4 entitlementComposer:(id)a5;
- (id)_initWithAccessType:(int64_t)a3 mode:(unint64_t)a4 entitlementComposer:(id)a5 isShowingMyEntitlements:(BOOL)a6;
- (void)_dismissButtonPressed;
- (void)_reloadSections:(BOOL)a3;
- (void)didTapPassEntitlementTimeSectionController:(id)a3;
- (void)entitlementSelectionDidChange;
- (void)loadView;
- (void)setShowDoneButton:(BOOL)a3;
- (void)showAdvancedScheduleSelectionFlowForEntitlementEntry:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPassShareEntitlementSelectionViewController

- (PKPassShareEntitlementSelectionViewController)initWithAccessType:(int64_t)a3 mode:(unint64_t)a4 entitlementComposer:(id)a5
{
  return (PKPassShareEntitlementSelectionViewController *)[(PKPassShareEntitlementSelectionViewController *)self _initWithAccessType:a3 mode:a4 entitlementComposer:a5 isShowingMyEntitlements:0];
}

- (id)_initWithAccessType:(int64_t)a3 mode:(unint64_t)a4 entitlementComposer:(id)a5 isShowingMyEntitlements:(BOOL)a6
{
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PKPassShareEntitlementSelectionViewController;
  v12 = [(PKPaymentSetupOptionsViewController *)&v26 initWithProvisioningController:0 context:0 delegate:0];
  v13 = v12;
  if (v12)
  {
    v12->_accessType = a3;
    v12->_mode = a4;
    p_entitlementComposer = (id *)&v12->_entitlementComposer;
    objc_storeStrong((id *)&v12->_entitlementComposer, a5);
    v13->_isShowingMyEntitlements = a6;
    v15 = [[PKPassEntitlementSelectionSectionController alloc] initWithMode:a4 entitlementComposer:*p_entitlementComposer delegate:v13];
    entitlementSectionController = v13->_entitlementSectionController;
    v13->_entitlementSectionController = v15;

    v17 = [[PKPassEntitlementTimeSectionController alloc] initWithMode:v13->_mode entitlementComposer:*p_entitlementComposer delegate:v13];
    timeSectionController = v13->_timeSectionController;
    v13->_timeSectionController = v17;

    v19 = [*p_entitlementComposer globalView];
    v20 = [*p_entitlementComposer activePredefinedSelectionEntry];

    if (v20)
    {
      v21 = [[PKPassSharePredefinedEntitlementSectionController alloc] initWithMode:v13->_mode entitlementComposer:*p_entitlementComposer delegate:v13];
      uint64_t v22 = 1312;
    }
    else
    {
      if (![v19 isManagingTimeConfiguration]
        || ![*p_entitlementComposer preferDetailedCapabilityDisplay])
      {
        goto LABEL_5;
      }
      v21 = [[PKPassEntitlementCapabilitySectionController alloc] initWithMode:v13->_mode entitlementComposer:*p_entitlementComposer composerView:v19 isDisabled:0 delegate:v13];
      uint64_t v22 = 1320;
    }
    v23 = *(Class *)((char *)&v13->super.super.super.super.super.isa + v22);
    *(Class *)((char *)&v13->super.super.super.super.super.isa + v22) = (Class)v21;

LABEL_5:
    [(PKDynamicCollectionViewController *)v13 setUseItemIdentityWhenUpdating:1];
    [(PKPassShareEntitlementSelectionViewController *)v13 setModalPresentationStyle:6];
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v24 addObject:v13->_entitlementSectionController];
    [v24 safelyAddObject:v13->_predefinedSectionController];
    [v24 safelyAddObject:v13->_capabilitySectionController];
    [v24 addObject:v13->_timeSectionController];
    [(PKPaymentSetupOptionsViewController *)v13 setSections:v24 animated:0];
  }
  return v13;
}

- (void)loadView
{
  v10.receiver = self;
  v10.super_class = (Class)PKPassShareEntitlementSelectionViewController;
  [(PKDynamicCollectionViewController *)&v10 loadView];
  int64_t accessType = self->_accessType;
  if (self->_mode == 2 && self->_isShowingMyEntitlements)
  {
    if (accessType == 4) {
      v4 = @"MY_ENTITLEMENTS_TITLE_VEHICLE";
    }
    else {
      v4 = @"MY_ENTITLEMENTS_TITLE";
    }
    uint64_t v5 = 1;
  }
  else
  {
    if (accessType == 4) {
      v4 = @"SHARE_OVERVIEW_SECTION_ENTITLEMENTS_TITLE_VEHICLE";
    }
    else {
      v4 = @"SHARE_OVERVIEW_SECTION_ENTITLEMENTS_TITLE";
    }
    uint64_t v5 = 2;
  }
  v6 = PKLocalizedShareableCredentialString(&v4->isa);
  [(PKPassShareEntitlementSelectionViewController *)self setTitle:v6];

  [(PKPaymentSetupOptionsViewController *)self setHeaderMode:v5];
  v7 = [(PKPaymentSetupOptionsViewController *)self dockView];
  v8 = [v7 footerView];
  [v7 setPrimaryButton:0];
  [v7 setButtonsEnabled:1];
  [v8 setSetupLaterButton:0];
  [v8 setManualEntryButton:0];
  v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(PKPaymentSetupOptionsViewController *)self setBackgroundColor:v9];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPassShareEntitlementSelectionViewController;
  [(PKPaymentSetupOptionsViewController *)&v4 viewWillAppear:a3];
  [(PKPassShareEntitlementSelectionViewController *)self _reloadSections:0];
}

- (void)_dismissButtonPressed
{
}

- (void)setShowDoneButton:(BOOL)a3
{
  if (self->_showDoneButton != a3)
  {
    self->_showDoneButton = a3;
    id v5 = [(PKPassShareEntitlementSelectionViewController *)self navigationItem];
    if (self->_showDoneButton)
    {
      objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__dismissButtonPressed];
      [v5 setLeftBarButtonItem:v4];
    }
    else
    {
      [v5 setLeftBarButtonItem:0];
    }
  }
}

- (void)_reloadSections:(BOOL)a3
{
  [(PKPassEntitlementTimeSectionController *)self->_timeSectionController reloadItemsAnimated:a3];

  [(PKDynamicCollectionViewController *)self reloadDataWithoutRebuildingDataStores];
}

- (void)entitlementSelectionDidChange
{
  id v6 = [(PKPassEntitlementsComposer *)self->_entitlementComposer composeSharedEntitlements];
  v3 = [(PKPaymentSetupOptionsViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PKPaymentSetupOptionsViewController *)self delegate];
    [v5 viewController:self entitlementSelectionDidChange:v6];
  }
}

- (void)showAdvancedScheduleSelectionFlowForEntitlementEntry:(id)a3
{
  id v4 = a3;
  id v6 = [[PKPassShareTimeLimitViewController alloc] initWithMode:self->_mode entitlementComposer:self->_entitlementComposer entitlementEntry:v4 delegate:self];

  id v5 = [(PKPassShareEntitlementSelectionViewController *)self navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (void)didTapPassEntitlementTimeSectionController:(id)a3
{
  id v5 = [[PKPassShareTimeLimitViewController alloc] initWithMode:self->_mode entitlementComposer:self->_entitlementComposer entitlementEntry:0 delegate:self];
  id v4 = [(PKPassShareEntitlementSelectionViewController *)self navigationController];
  [v4 pushViewController:v5 animated:1];
}

- (BOOL)showDoneButton
{
  return self->_showDoneButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeSectionController, 0);
  objc_storeStrong((id *)&self->_capabilitySectionController, 0);
  objc_storeStrong((id *)&self->_predefinedSectionController, 0);
  objc_storeStrong((id *)&self->_entitlementSectionController, 0);

  objc_storeStrong((id *)&self->_entitlementComposer, 0);
}

@end