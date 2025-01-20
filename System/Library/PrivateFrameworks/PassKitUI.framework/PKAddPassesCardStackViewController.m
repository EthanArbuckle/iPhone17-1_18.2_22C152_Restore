@interface PKAddPassesCardStackViewController
- (BOOL)areGroupsSeparated;
- (BOOL)hasDiscoveryContent;
- (BOOL)isInField;
- (BOOL)supportsExternalPresentation;
- (PKAddPassesCardStackViewController)initWithPasses:(id)a3 orPassesContainer:(id)a4 fromPresentationSource:(unint64_t)a5;
- (PKAddPassesCardStackViewControllerDelegate)delegate;
- (UIButton)aboutWalletButton;
- (UILabel)infoTextLabel;
- (id)groupAtIndex:(unint64_t)a3;
- (unint64_t)indexOfGroup:(id)a3;
- (unint64_t)indexOfSeparationGroup;
- (unint64_t)numberOfGroups;
- (unint64_t)suppressedContent;
- (void)_aboutButtonPressed;
- (void)_addButtonPressed:(id)a3;
- (void)_addPassesWithCompletion:(id)a3;
- (void)_beginReportingIfNecessary;
- (void)_cancelButtonPressed:(id)a3;
- (void)_configureAddOrNextButtonItemAsPending:(BOOL)a3;
- (void)_configureNavigationItemTitle;
- (void)_endReportingIfNecessary;
- (void)_nextButtonPressedForPersonalization:(id)a3;
- (void)_sendAnalyticsDidTapButton:(id)a3;
- (void)_sendAnalyticsViewVisibilityUpdateWithType:(id)a3;
- (void)dealloc;
- (void)evaluateBrightness;
- (void)groupStackView:(id)a3 deleteConfirmedForPass:(id)a4;
- (void)groupStackView:(id)a3 didTransitionToState:(int64_t)a4 animated:(BOOL)a5;
- (void)groupStackViewDidBeginReordering:(id)a3;
- (void)groupStackViewDidEndReordering:(id)a3;
- (void)groupsController:(id)a3 didInsertGroup:(id)a4 atIndex:(unint64_t)a5;
- (void)groupsController:(id)a3 didMoveGroup:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6;
- (void)groupsController:(id)a3 didRemoveGroup:(id)a4 atIndex:(unint64_t)a5;
- (void)passPersonalizationViewController:(id)a3 didFinishPersonalizingPass:(id)a4 success:(BOOL)a5;
- (void)resetBrightness;
- (void)setAboutWalletButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInfoTextLabel:(id)a3;
- (void)setUpAboutWalletButton;
- (void)setUpInfoTextLabel;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKAddPassesCardStackViewController

- (PKAddPassesCardStackViewController)initWithPasses:(id)a3 orPassesContainer:(id)a4 fromPresentationSource:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v9 && ![v9 unarchivePassesWithOptions:0 usingBlock:0])
  {
    uint64_t v12 = v11;
    if (v11) {
      goto LABEL_4;
    }
LABEL_7:
    v18 = 0;
    goto LABEL_15;
  }
  uint64_t v12 = [v8 count];
  if (!v12) {
    goto LABEL_7;
  }
LABEL_4:
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v12];
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__28;
  v35[4] = __Block_byref_object_dispose__28;
  id v36 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PKAddPassesCardStackViewController_initWithPasses_orPassesContainer_fromPresentationSource___block_invoke;
  aBlock[3] = &unk_1E59D5A08;
  v34 = v35;
  id v14 = v13;
  id v33 = v14;
  v15 = _Block_copy(aBlock);
  v16 = v15;
  if (v10)
  {
    v17 = v31;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __94__PKAddPassesCardStackViewController_initWithPasses_orPassesContainer_fromPresentationSource___block_invoke_2;
    v31[3] = &unk_1E59D5A30;
    v31[4] = v15;
    [v10 unarchivePassesWithOptions:0 usingBlock:v31];
  }
  else
  {
    v17 = v30;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __94__PKAddPassesCardStackViewController_initWithPasses_orPassesContainer_fromPresentationSource___block_invoke_3;
    v30[3] = &unk_1E59D5A58;
    v30[4] = v15;
    [v8 enumerateObjectsUsingBlock:v30];
  }

  if ([v14 count])
  {
    v29.receiver = self;
    v29.super_class = (Class)PKAddPassesCardStackViewController;
    v19 = [(PKAddPassesCardStackViewController *)&v29 initWithNibName:0 bundle:0];
    if (v19)
    {
      uint64_t v20 = [v14 copy];
      passes = v19->_passes;
      v19->_passes = (NSArray *)v20;

      objc_storeStrong((id *)&v19->_passesContainer, a4);
      uint64_t v22 = [v8 copy];
      passDataArray = v19->_passDataArray;
      v19->_passDataArray = (NSArray *)v22;

      v19->_presentationSource = a5;
      [(PKAddPassesCardStackViewController *)v19 _beginReportingIfNecessary];
      uint64_t v24 = [objc_alloc(MEMORY[0x1E4F84740]) initLimited];
      groupsController = v19->_groupsController;
      v19->_groupsController = (PKGroupsController *)v24;

      [(PKGroupsController *)v19->_groupsController setDelegate:v19];
      v26 = [(PKAddPassesCardStackViewController *)v19 navigationItem];
      id v27 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
      [v27 configureWithTransparentBackground];
      [v26 setStandardAppearance:v27];
    }
    self = v19;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  _Block_object_dispose(v35, 8);
LABEL_15:

  return v18;
}

void __94__PKAddPassesCardStackViewController_initWithPasses_orPassesContainer_fromPresentationSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v9 = v3;
    if ([v3 passType] == 1)
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (!v4)
      {
        id v5 = objc_alloc_init(MEMORY[0x1E4F84FC0]);
        uint64_t v6 = [v5 secureElementIdentifiers];
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
        id v8 = *(void **)(v7 + 40);
        *(void *)(v7 + 40) = v6;

        uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      }
      [v9 updateDevicePaymentApplicationsWithSecureElementIdentifiers:v4];
    }
    [*(id *)(a1 + 32) addObject:v9];
    id v3 = v9;
  }
}

uint64_t __94__PKAddPassesCardStackViewController_initWithPasses_orPassesContainer_fromPresentationSource___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __94__PKAddPassesCardStackViewController_initWithPasses_orPassesContainer_fromPresentationSource___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id)[MEMORY[0x1E4F84850] createWithData:a2 warnings:0 error:0];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)dealloc
{
  [(PKAddPassesCardStackViewController *)self _endReportingIfNecessary];
  [(PKGroupsController *)self->_groupsController setDelegate:0];
  [(PKPassGroupStackView *)self->_passGroupStackView setDelegate:0];
  [(PKPassGroupStackView *)self->_passGroupStackView setDatasource:0];
  [(PKPassGroupStackView *)self->_passGroupStackView removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)PKAddPassesCardStackViewController;
  [(PKAddPassesCardStackViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)PKAddPassesCardStackViewController;
  [(PKAddPassesCardStackViewController *)&v17 viewDidLoad];
  objc_super v3 = [(PKAddPassesCardStackViewController *)self view];
  uint64_t v4 = [PKPassGroupStackView alloc];
  [v3 bounds];
  id v5 = -[PKPassGroupStackView initWithFrame:](v4, "initWithFrame:");
  passGroupStackView = self->_passGroupStackView;
  self->_passGroupStackView = v5;

  uint64_t v7 = self->_passGroupStackView;
  id v8 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(PKPassGroupStackView *)v7 setBackgroundColor:v8];

  [(PKPassGroupStackView *)self->_passGroupStackView setShowsVerticalScrollIndicator:0];
  [(PKPassGroupStackView *)self->_passGroupStackView setFooterSuppressed:1];
  [(PKPassGroupStackView *)self->_passGroupStackView setDelegate:self];
  [(PKPassGroupStackView *)self->_passGroupStackView setDatasource:self];
  id v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v9];

  [v3 setOpaque:1];
  [v3 addSubview:self->_passGroupStackView];
  if (self->_passes)
  {
    -[PKGroupsController addLocalPasses:](self->_groupsController, "addLocalPasses:");
    v10 = [(NSArray *)self->_passes firstObject];
    groupsController = self->_groupsController;
    uint64_t v12 = [v10 uniqueID];
    uint64_t v13 = [(PKGroupsController *)groupsController groupIndexForPassUniqueID:v12];

    [(PKPassGroupStackView *)self->_passGroupStackView setModalGroupIndex:v13];
    [(PKAddPassesCardStackViewController *)self _configureNavigationItemTitle];
    if (-[NSArray count](self->_passes, "count") == 1 && [v10 isPersonalizable])
    {
      [(PKAddPassesCardStackViewController *)self _configureAddOrNextButtonItemAsPending:1];
      id v14 = [v10 passTypeIdentifier];
      PKPassPersonalizationRequestToken();
    }
    else
    {
      [(PKAddPassesCardStackViewController *)self _configureAddOrNextButtonItemAsPending:0];
    }
  }
  else
  {
    [(PKPassGroupStackView *)self->_passGroupStackView setModalGroupIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  v15 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonPressed_];
  if (PKIsPad())
  {
    [(PKAddPassesCardStackViewController *)self setUpAboutWalletButton];
    [(PKAddPassesCardStackViewController *)self setUpInfoTextLabel];
  }
  v16 = [(PKAddPassesCardStackViewController *)self navigationItem];
  [v16 setLeftBarButtonItem:v15 animated:0];
}

void __49__PKAddPassesCardStackViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__PKAddPassesCardStackViewController_viewDidLoad__block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __49__PKAddPassesCardStackViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1016), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _configureAddOrNextButtonItemAsPending:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)PKAddPassesCardStackViewController;
  [(PKAddPassesCardStackViewController *)&v14 viewWillAppear:a3];
  id v4 = [MEMORY[0x1E4F84898] sharedInstance];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_passes;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "getContainmentStatusAndSettingsForPass:withHandler:");
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }

  [(PKPassGroupStackView *)self->_passGroupStackView setPresentationState:6 animated:0];
}

void __53__PKAddPassesCardStackViewController_viewWillAppear___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PKAddPassesCardStackViewController_viewWillAppear___block_invoke_2;
  block[3] = &unk_1E59CBCB8;
  block[4] = *(void *)(a1 + 32);
  block[5] = a2;
  block[6] = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __53__PKAddPassesCardStackViewController_viewWillAppear___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 40)) {
    return [*(id *)(result + 32) setSettings:*(void *)(result + 48)];
  }
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKAddPassesCardStackViewController;
  [(PKAddPassesCardStackViewController *)&v4 viewDidAppear:a3];
  [(PKAddPassesCardStackViewController *)self _sendAnalyticsViewVisibilityUpdateWithType:*MEMORY[0x1E4F864A0]];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKAddPassesCardStackViewController;
  [(PKAddPassesCardStackViewController *)&v4 viewDidDisappear:a3];
  [(PKAddPassesCardStackViewController *)self _sendAnalyticsViewVisibilityUpdateWithType:*MEMORY[0x1E4F864A8]];
}

- (void)viewWillLayoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)PKAddPassesCardStackViewController;
  [(PKAddPassesCardStackViewController *)&v24 viewWillLayoutSubviews];
  id v3 = [(PKAddPassesCardStackViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  remainder.origin.x = v4;
  remainder.origin.y = v6;
  remainder.size.width = v8;
  remainder.size.height = v10;
  objc_msgSend(v3, "safeAreaInsets", 0, 0, 0, 0);
  CGFloat v13 = v12;
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  CGRectDivide(v25, &v22, &remainder, v13, CGRectMinYEdge);
  -[PKPassGroupStackView setFrame:](self->_passGroupStackView, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
  [(PKPassGroupStackView *)self->_passGroupStackView layoutContentForCurrentPresentationState:0];
  aboutWalletButton = self->_aboutWalletButton;
  [(PKPassGroupStackView *)self->_passGroupStackView frame];
  double v16 = (v15 + -274.0) * 0.5;
  [(PKPassGroupStackView *)self->_passGroupStackView frame];
  -[UIButton setFrame:](aboutWalletButton, "setFrame:", v16, v17 + -40.0 + -12.0, 274.0, 40.0);
  infoTextLabel = self->_infoTextLabel;
  [(UIButton *)self->_aboutWalletButton frame];
  double v20 = v19 + -8.0 + -30.0;
  v21 = [(PKAddPassesCardStackViewController *)self view];
  [v21 frame];
  -[UILabel setFrame:](infoTextLabel, "setFrame:", 0.0, v20);
}

- (void)setUpInfoTextLabel
{
  id v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  infoTextLabel = self->_infoTextLabel;
  self->_infoTextLabel = v3;

  CGFloat v5 = self->_infoTextLabel;
  CGFloat v6 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [(UILabel *)v5 setTextColor:v6];

  CGFloat v7 = self->_infoTextLabel;
  CGFloat v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  [(UILabel *)v7 setFont:v8];

  [(UILabel *)self->_infoTextLabel setTextAlignment:1];
  [(UILabel *)self->_infoTextLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_infoTextLabel setNumberOfLines:0];
  -[UILabel setLayoutMargins:](self->_infoTextLabel, "setLayoutMargins:", 24.0, 0.0, 0.0, 0.0);
  CGFloat v9 = self->_infoTextLabel;
  CGFloat v10 = PKLocalizedString(&cfstr_InfoTextAddToW.isa);
  [(UILabel *)v9 setText:v10];

  id v11 = [(PKAddPassesCardStackViewController *)self view];
  [v11 addSubview:self->_infoTextLabel];
}

- (void)setUpAboutWalletButton
{
  id v3 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
  aboutWalletButton = self->_aboutWalletButton;
  self->_aboutWalletButton = v3;

  CGFloat v5 = self->_aboutWalletButton;
  CGFloat v6 = PKCoreLocalizedString(&cfstr_AboutWalletBut.isa);
  [(UIButton *)v5 setTitle:v6 forState:0];

  CGFloat v7 = [(UIButton *)self->_aboutWalletButton titleLabel];
  CGFloat v8 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2908], (NSString *)*MEMORY[0x1E4FB2790]);
  [v7 setFont:v8];

  CGFloat v9 = [(UIButton *)self->_aboutWalletButton titleLabel];
  [v9 setAdjustsFontSizeToFitWidth:1];

  [(UIButton *)self->_aboutWalletButton _setCornerRadius:14.0];
  CGFloat v10 = self->_aboutWalletButton;
  id v11 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [(UIButton *)v10 setBackgroundColor:v11];

  [(UIButton *)self->_aboutWalletButton addTarget:self action:sel__aboutButtonPressed forControlEvents:64];
  id v12 = [(PKAddPassesCardStackViewController *)self view];
  [v12 addSubview:self->_aboutWalletButton];
}

- (id)groupAtIndex:(unint64_t)a3
{
  if ([(PKAddPassesCardStackViewController *)self numberOfGroups] <= a3)
  {
    CGFloat v5 = 0;
  }
  else
  {
    CGFloat v5 = [(PKGroupsController *)self->_groupsController groupAtIndex:a3];
  }

  return v5;
}

- (unint64_t)numberOfGroups
{
  return [(PKGroupsController *)self->_groupsController groupCount];
}

- (unint64_t)indexOfGroup:(id)a3
{
  return [(PKGroupsController *)self->_groupsController indexOfGroup:a3];
}

- (BOOL)areGroupsSeparated
{
  return [(PKGroupsController *)self->_groupsController shouldSeparatePaymentPasses];
}

- (unint64_t)indexOfSeparationGroup
{
  return [(PKGroupsController *)self->_groupsController indexOfSeparationGroup];
}

- (BOOL)hasDiscoveryContent
{
  return 0;
}

- (void)groupStackView:(id)a3 deleteConfirmedForPass:(id)a4
{
  groupsController = self->_groupsController;
  objc_msgSend(a4, "uniqueID", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(PKGroupsController *)groupsController handleUserPassDelete:v5];
}

- (void)groupStackViewDidBeginReordering:(id)a3
{
}

- (void)groupStackViewDidEndReordering:(id)a3
{
}

- (unint64_t)suppressedContent
{
  if (PKIsLowEndDevice()) {
    return 2849;
  }
  else {
    return 2337;
  }
}

- (void)groupStackView:(id)a3 didTransitionToState:(int64_t)a4 animated:(BOOL)a5
{
  id v7 = a3;
  if (a4 == 6 && !self->_passes)
  {
    id v9 = v7;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained addPassesCardStackViewController:self didCancelAddingPasses:self->_passes];

    id v7 = v9;
  }
}

- (BOOL)supportsExternalPresentation
{
  return 0;
}

- (BOOL)isInField
{
  return 0;
}

- (void)groupsController:(id)a3 didInsertGroup:(id)a4 atIndex:(unint64_t)a5
{
  [(PKPassGroupStackView *)self->_passGroupStackView reloadData];
  groupsController = self->_groupsController;
  CGFloat v8 = [(NSArray *)self->_passes firstObject];
  id v9 = [v8 uniqueID];
  uint64_t v10 = [(PKGroupsController *)groupsController groupIndexForPassUniqueID:v9];

  if (v10 != a5)
  {
    passGroupStackView = self->_passGroupStackView;
    [(PKPassGroupStackView *)passGroupStackView stageGroupInPresentationState:2 atIndex:a5];
  }
}

- (void)groupsController:(id)a3 didRemoveGroup:(id)a4 atIndex:(unint64_t)a5
{
}

- (void)groupsController:(id)a3 didMoveGroup:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
}

- (void)passPersonalizationViewController:(id)a3 didFinishPersonalizingPass:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  v12[1] = *MEMORY[0x1E4F143B8];
  p_delegate = &self->_delegate;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (v5)
  {
    v12[0] = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

    [WeakRetained addPassesCardStackViewController:self didFinishAddingPasses:v10];
  }
  else
  {
    id v11 = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];

    [WeakRetained addPassesCardStackViewController:self didCancelAddingPasses:v10];
  }
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained addPassesCardStackViewController:self didFinishAddingPasses:self->_passes];
}

- (void)evaluateBrightness
{
}

- (void)resetBrightness
{
}

- (void)_beginReportingIfNecessary
{
  id v3 = [(NSArray *)self->_passes firstObject];
  int v4 = [v3 supportsIssuerBinding];

  if (v4)
  {
    self->_shouldReportAnalytics = 1;
    uint64_t v5 = *MEMORY[0x1E4F87050];
    CGFloat v6 = [MEMORY[0x1E4F843E0] reporterForSubject:*MEMORY[0x1E4F87050]];

    if (!v6)
    {
      self->_didBeginVASSubject = 1;
      id v7 = (void *)MEMORY[0x1E4F843E0];
      [v7 beginSubjectReporting:v5];
    }
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginVASSubject)
  {
    self->_didBeginVASSubject = 0;
    self->_shouldReportAnalytics = 0;
    [MEMORY[0x1E4F843E0] endSubjectReporting:*MEMORY[0x1E4F87050]];
  }
}

- (void)_sendAnalyticsViewVisibilityUpdateWithType:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  if (self->_shouldReportAnalytics)
  {
    v34 = +[PKPassSemanticTileFactory sharedInstance];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obj = self->_passes;
    uint64_t v36 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v36)
    {
      uint64_t v33 = *(void *)v38;
      uint64_t v32 = *MEMORY[0x1E4F87050];
      uint64_t v31 = *MEMORY[0x1E4F86308];
      uint64_t v30 = *MEMORY[0x1E4F86730];
      uint64_t v29 = *MEMORY[0x1E4F86738];
      uint64_t v28 = *MEMORY[0x1E4F86DA8];
      uint64_t v27 = *MEMORY[0x1E4F86D78];
      uint64_t v26 = *MEMORY[0x1E4F86B38];
      uint64_t v25 = *MEMORY[0x1E4F867E0];
      uint64_t v24 = *MEMORY[0x1E4F86770];
      uint64_t v23 = *MEMORY[0x1E4F877A8];
      uint64_t v22 = *MEMORY[0x1E4F86B70];
      uint64_t v21 = *MEMORY[0x1E4F86D28];
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v38 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          CGFloat v6 = (void *)MEMORY[0x1E4F843E0];
          v41[0] = v31;
          v41[1] = v30;
          v42[0] = v35;
          v42[1] = v29;
          v41[2] = v28;
          uint64_t v7 = [v5 passTypeIdentifier];
          id v8 = (void *)v7;
          if (v7) {
            uint64_t v9 = v7;
          }
          else {
            uint64_t v9 = v27;
          }
          v42[2] = v9;
          v41[3] = v26;
          uint64_t v10 = AnalyticsVASReferralSource();
          v42[3] = v10;
          v41[4] = v25;
          [v5 style];
          uint64_t v11 = PKPassStyleToString();
          id v12 = (void *)v11;
          if (v11) {
            uint64_t v13 = v11;
          }
          else {
            uint64_t v13 = v27;
          }
          v42[4] = v13;
          v41[5] = v24;
          uint64_t v14 = [v5 stringForSemanticKey:v23];
          double v15 = (void *)v14;
          if (v14) {
            uint64_t v16 = v14;
          }
          else {
            uint64_t v16 = v27;
          }
          v42[5] = v16;
          v41[6] = v22;
          double v17 = AnalyticsRelevancyTypeForPass();
          v42[6] = v17;
          v41[7] = v21;
          v18 = [v34 analyticsTileAvailabilityForPass:v5];
          v42[7] = v18;
          double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:8];
          [v6 subject:v32 sendEvent:v19];
        }
        uint64_t v36 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v36);
    }
  }
}

- (void)_sendAnalyticsDidTapButton:(id)a3
{
  v15[4] = *MEMORY[0x1E4F143B8];
  if (self->_shouldReportAnalytics)
  {
    id v3 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v4 = *MEMORY[0x1E4F87050];
    uint64_t v5 = *MEMORY[0x1E4F86380];
    uint64_t v6 = *MEMORY[0x1E4F86730];
    v14[0] = *MEMORY[0x1E4F86308];
    v14[1] = v6;
    uint64_t v7 = *MEMORY[0x1E4F86738];
    v15[0] = v5;
    v15[1] = v7;
    uint64_t v8 = *MEMORY[0x1E4F86120];
    v15[2] = a3;
    uint64_t v9 = *MEMORY[0x1E4F86660];
    v14[2] = v8;
    v14[3] = v9;
    passes = self->_passes;
    id v11 = a3;
    [(NSArray *)passes count];
    id v12 = PKAnalyticsReportSwitchToggleResultValue();
    v15[3] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
    [v3 subject:v4 sendEvent:v13];
  }
}

- (void)_addPassesWithCompletion:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [MEMORY[0x1E4F84898] sharedInstance];
  uint64_t v5 = v4;
  passesContainer = self->_passesContainer;
  if (passesContainer)
  {
    [v4 addPassesContainer:passesContainer withCompletionHandler:v8];
  }
  else
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:self->_passDataArray];
    [v5 addPassesWithData:v7 withCompletionHandler:v8];
  }
}

- (void)_cancelButtonPressed:(id)a3
{
  [(PKAddPassesCardStackViewController *)self _sendAnalyticsDidTapButton:*MEMORY[0x1E4F86148]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained addPassesCardStackViewController:self didCancelAddingPasses:self->_passes];
}

- (void)_addButtonPressed:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  [(PKAddPassesCardStackViewController *)self _sendAnalyticsDidTapButton:*MEMORY[0x1E4F86D98]];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__PKAddPassesCardStackViewController__addButtonPressed___block_invoke;
  v5[3] = &unk_1E59D0FB8;
  objc_copyWeak(&v6, &location);
  [(PKAddPassesCardStackViewController *)self _addPassesWithCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__PKAddPassesCardStackViewController__addButtonPressed___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PKAddPassesCardStackViewController__addButtonPressed___block_invoke_2;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __56__PKAddPassesCardStackViewController__addButtonPressed___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = [MEMORY[0x1E4F84688] sharedInstance];
    objc_initWeak(&location, v2);

    id v3 = objc_loadWeakRetained(&location);
    [v3 beginReporingDiscoveryAnalytics];

    id v4 = objc_loadWeakRetained(&location);
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __56__PKAddPassesCardStackViewController__addButtonPressed___block_invoke_3;
    uint64_t v9 = &unk_1E59CB240;
    objc_copyWeak(&v10, &location);
    [v4 completedDiscoveryItemCTAWithCompletion:&v6];

    id v5 = objc_loadWeakRetained(WeakRetained + 130);
    objc_msgSend(v5, "addPassesCardStackViewController:didFinishAddingPasses:", WeakRetained, WeakRetained[122], v6, v7, v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __56__PKAddPassesCardStackViewController__addButtonPressed___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained endReporingDiscoveryAnalytics];
}

- (void)_aboutButtonPressed
{
  id v3 = objc_alloc_init(PKAddPassesAboutWalletViewController);
  [(PKAddPassesAboutWalletViewController *)v3 setModalTransitionStyle:2];
  [(PKAddPassesAboutWalletViewController *)v3 setModalPresentationStyle:3];
  [(PKAddPassesCardStackViewController *)self presentViewController:v3 animated:1 completion:0];
}

- (void)_nextButtonPressedForPersonalization:(id)a3
{
  id v6 = [(NSArray *)self->_passes firstObject];
  id v4 = [[PKPassPersonalizationViewController alloc] initWithPass:v6 personalizationToken:self->_personalizatonToken personalizationSource:self->_presentationSource == 1];
  [(PKPassPersonalizationViewController *)v4 setDelegate:self];
  id v5 = [(PKAddPassesCardStackViewController *)self navigationController];
  [v5 pushViewController:v4 animated:1];
}

- (void)_configureNavigationItemTitle
{
  id v3 = [(NSArray *)self->_passes firstObject];
  uint64_t v4 = [v3 style];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  passes = self->_passes;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__PKAddPassesCardStackViewController__configureNavigationItemTitle__block_invoke;
  v20[3] = &unk_1E59D5AD0;
  v20[4] = &v21;
  v20[5] = v4;
  [(NSArray *)passes enumerateObjectsUsingBlock:v20];
  id v6 = self->_passes;
  if (!*((unsigned char *)v22 + 24))
  {
    uint64_t v10 = [(NSArray *)v6 count];
    id v11 = (void *)MEMORY[0x1E4F28EE0];
    id v12 = [NSNumber numberWithUnsignedInteger:v10];
    id v8 = [v11 localizedStringFromNumber:v12 numberStyle:0];

    uint64_t v13 = PKCoreLocalizedString(&cfstr_TemplateNamePa.isa);
    uint64_t v14 = PKLocalizedString(&cfstr_IngestionTitle.isa, &stru_1EF1B5770.isa, v8, v13);
LABEL_6:
    uint64_t v9 = (void *)v14;

    goto LABEL_7;
  }
  uint64_t v7 = [(NSArray *)v6 count];
  if (v7 != 1)
  {
    double v15 = (void *)MEMORY[0x1E4F28EE0];
    uint64_t v16 = NSNumber;
    id v17 = v3;
    v18 = [v16 numberWithUnsignedInteger:v7];
    id v8 = [v15 localizedStringFromNumber:v18 numberStyle:0];

    uint64_t v13 = [v17 pluralLocalizedName];

    uint64_t v14 = PKLocalizedString(&cfstr_IngestionTitle.isa, &stru_1EF1B5770.isa, v8, v13);
    goto LABEL_6;
  }
  id v8 = v3;
  uint64_t v9 = [v8 localizedDescription];
LABEL_7:

  double v19 = [(PKAddPassesCardStackViewController *)self navigationItem];
  [v19 setTitle:v9];

  _Block_object_dispose(&v21, 8);
}

uint64_t __67__PKAddPassesCardStackViewController__configureNavigationItemTitle__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 style];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result == *(void *)(a1 + 40);
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

- (void)_configureAddOrNextButtonItemAsPending:(BOOL)a3
{
  id v5 = [(PKAddPassesCardStackViewController *)self navigationItem];
  id v6 = [v5 rightBarButtonItem];

  if (a3)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    id v14 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v7];
    [v7 startAnimating];
  }
  else
  {
    if ([(NSArray *)self->_passes count] < 2)
    {
      uint64_t v10 = [(NSArray *)self->_passes firstObject];
      if ([v10 isPersonalizable] && self->_personalizatonToken)
      {
        uint64_t v9 = 0;
        id v11 = &selRef__nextButtonPressedForPersonalization_;
        id v12 = @"INGESTION_NEXT";
      }
      else
      {
        id v11 = &selRef__addButtonPressed_;
        uint64_t v9 = 2;
        id v12 = @"INGESTION_ADD";
      }
      uint64_t v7 = PKLocalizedString(&v12->isa);
      id v8 = *v11;
    }
    else
    {
      uint64_t v7 = PKLocalizedString(&cfstr_IngestionAddN.isa);
      id v8 = sel__addButtonPressed_;
      uint64_t v9 = 2;
    }
    id v14 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v7 style:v9 target:self action:v8];
  }

  uint64_t v13 = [(PKAddPassesCardStackViewController *)self navigationItem];
  [v13 setRightBarButtonItem:v14 animated:v6 != 0];
}

- (PKAddPassesCardStackViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKAddPassesCardStackViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)infoTextLabel
{
  return self->_infoTextLabel;
}

- (void)setInfoTextLabel:(id)a3
{
}

- (UIButton)aboutWalletButton
{
  return self->_aboutWalletButton;
}

- (void)setAboutWalletButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aboutWalletButton, 0);
  objc_storeStrong((id *)&self->_infoTextLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_personalizatonToken, 0);
  objc_storeStrong((id *)&self->_passGroupStackView, 0);
  objc_storeStrong((id *)&self->_groupsController, 0);
  objc_storeStrong((id *)&self->_passDataArray, 0);
  objc_storeStrong((id *)&self->_passesContainer, 0);

  objc_storeStrong((id *)&self->_passes, 0);
}

@end