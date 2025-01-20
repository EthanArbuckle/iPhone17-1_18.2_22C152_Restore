@interface PKPaymentSetupFieldsViewController
- (BOOL)fieldCell:(id)a3 supportsKeyboardAccessory:(unint64_t)a4;
- (BOOL)fieldCellEditableTextFieldShouldBeginEditing:(id)a3;
- (BOOL)fieldCellEditableTextFieldShouldClear:(id)a3;
- (BOOL)fieldCellEditableTextFieldShouldReturn:(id)a3;
- (BOOL)isComplete;
- (BOOL)isEmpty;
- (BOOL)isPerformingNextActionLoop;
- (BOOL)isProvisioningPaymentAccount;
- (BOOL)isShowingActivitySpinner;
- (BOOL)shouldAppearWithFirstEmptyFieldAsFirstResponder;
- (BOOL)shouldDisplayFooterField;
- (BOOL)shouldDisplayFooterFieldInline:(id)a3;
- (NSArray)sectionIdentifiers;
- (PKPaymentSetupFieldsModel)fieldsModel;
- (PKPaymentSetupFieldsViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6;
- (PKPaymentSetupViewControllerDelegate)setupDelegate;
- (PKPaymentWebService)webService;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_contextSpecificStringForAggDKey:(id)a3;
- (id)_footerTextForValidationError;
- (id)allCells;
- (id)cellForIdentifier:(id)a3;
- (id)defaultFields;
- (id)defaultHeaderViewSubTitle;
- (id)defaultHeaderViewTitle;
- (id)displayedFooterField;
- (id)fieldForIdentifier:(id)a3;
- (id)firstEmptyCell;
- (id)firstEmptyField;
- (id)firstEmptySetupField;
- (id)firstResponderCell;
- (id)footerHyperlinkView;
- (id)footerView;
- (id)footerViewForIdentifier:(id)a3;
- (id)headerView;
- (id)identifierForIndexPath:(id)a3;
- (id)nextResponderCellForCurrentIdentifier:(id)a3;
- (id)readonlyFieldIdentifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)visibleFieldIdentifiers;
- (id)visibleFieldIdentifiersForSection:(unint64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_continueNextActionLoop:(BOOL)a3;
- (void)_destroyNavigationBarButtonItemsAnimated:(BOOL)a3;
- (void)_fieldLabelDidTapButton:(id)a3;
- (void)_handleNextButtonTapped:(id)a3;
- (void)_noteFieldIdentifiersChangedUpdateHeaders:(BOOL)a3;
- (void)_setCellsEnabled:(BOOL)a3;
- (void)_setIdleTimerDisabled:(BOOL)a3 title:(id)a4 subtitle:(id)a5;
- (void)_setLeftBarButtonItems:(id)a3 animated:(BOOL)a4;
- (void)_setNavigationBarEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)_setRightBarButtonItems:(id)a3 animated:(BOOL)a4;
- (void)_setRightBarButtonItemsEnabled:(BOOL)a3;
- (void)_setTableViewHeaderActivityIndicatorActive:(BOOL)a3 title:(id)a4 subtitle:(id)a5 animated:(BOOL)a6;
- (void)_triggerNextActionLoop:(BOOL)a3;
- (void)_updateErrorFooterIfNeeded;
- (void)_updateNavigationItemAnimated:(BOOL)a3;
- (void)_updateRightBarButtonState;
- (void)endUserInteraction;
- (void)fieldCellDidTapButton:(id)a3;
- (void)fieldCellEditableTextFieldDidBeginEditing:(id)a3;
- (void)fieldCellEditableTextFieldDidEndEditing:(id)a3;
- (void)fieldCellEditableTextFieldValueDidChange:(id)a3;
- (void)handleNextButtonTapped:(id)a3;
- (void)hideActivitySpinner;
- (void)hideActivitySpinnerWithTitle:(id)a3 subtitle:(id)a4 animated:(BOOL)a5;
- (void)logAnalyticsCheckpointForKey:(id)a3;
- (void)logAnalyticsContextSpecificCheckpointForKey:(id)a3;
- (void)noteFieldIdentifiersChanged;
- (void)noteFieldIdentifiersChangedAndUpdateHeaders;
- (void)reloadHeaderView;
- (void)resetCellStyling;
- (void)setFieldsModel:(id)a3;
- (void)setHeaderViewTitle:(id)a3 subtitle:(id)a4;
- (void)setHidesBackButton:(BOOL)a3 animated:(BOOL)a4;
- (void)setSectionIdentifiers:(id)a3;
- (void)setSetupDelegate:(id)a3;
- (void)setWebService:(id)a3;
- (void)showActivitySpinnerWithTitle:(id)a3 subtitle:(id)a4;
- (void)showCheckmarkAnimated:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)triggerNextActionLoop;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKPaymentSetupFieldsViewController

- (PKPaymentSetupFieldsViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PKPaymentSetupFieldsViewController;
  v14 = [(PKPaymentSetupTableViewController *)&v24 initWithContext:a4];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_webService, a3);
    objc_storeWeak((id *)&v15->_setupDelegate, v12);
    id v16 = v13;
    if (!v13) {
      id v16 = objc_alloc_init(MEMORY[0x1E4F84C88]);
    }
    objc_storeStrong((id *)&v15->_fieldsModel, v16);
    if (!v13) {

    }
    uint64_t v17 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    fieldIdentifierToCellMap = v15->_fieldIdentifierToCellMap;
    v15->_fieldIdentifierToCellMap = (NSMapTable *)v17;

    v15->_navigationEnabled = 1;
    v15->_rightBarButtonItemsEnabled = 0;
    v15->_cellsAreEnabled = 1;
    id v19 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v20 = PKLocalizedPaymentString(&cfstr_Next.isa);
    v21 = (void *)[v19 initWithTitle:v20 style:2 target:v15 action:sel__handleNextButtonTapped_];

    [v21 setEnabled:v15->_rightBarButtonItemsEnabled];
    [v21 setAccessibilityIdentifier:*MEMORY[0x1E4F85720]];
    if (v21)
    {
      v25[0] = v21;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    }
    else
    {
      v22 = 0;
    }
    objc_storeStrong((id *)&v15->_rightBarButtonItems, v22);
    if (v21) {

    }
    v15->_validationErrorCode = 0;
  }

  return v15;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentSetupFieldsViewController;
  [(PKPaymentSetupFieldsViewController *)&v13 viewDidLoad];
  v3 = [(PKPaymentSetupFieldsModel *)self->_fieldsModel visiblePaymentSetupFields];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    fieldsModel = self->_fieldsModel;
    v6 = [(PKPaymentSetupFieldsViewController *)self defaultFields];
    [(PKPaymentSetupFieldsModel *)fieldsModel updateWithPaymentSetupFields:v6];
  }
  v7 = [(PKPaymentSetupTableViewController *)self tableView];
  [v7 setAccessibilityIdentifier:*MEMORY[0x1E4F857F8]];

  v8 = [(PKPaymentSetupFieldsViewController *)self headerView];
  v9 = [(PKPaymentSetupTableViewController *)self tableView];
  [v9 setTableHeaderView:v8];

  v10 = [(PKPaymentSetupFieldsViewController *)self footerView];
  id v11 = [(PKPaymentSetupTableViewController *)self tableView];
  [v11 setTableFooterView:v10];

  [(PKPaymentSetupFieldsViewController *)self _updateNavigationItemAnimated:0];
  id v12 = [(PKPaymentSetupTableViewController *)self tableView];
  [v12 setSectionHeaderHeight:12.0];
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentSetupFieldsViewController;
  [(PKPaymentSetupTableViewController *)&v10 viewWillAppear:a3];
  [(PKPaymentSetupFieldsViewController *)self noteFieldIdentifiersChangedAndUpdateHeaders];
  [(PKPaymentSetupFieldsViewController *)self _setRightBarButtonItemsEnabled:[(PKPaymentSetupFieldsViewController *)self isComplete]];
  if ([(PKPaymentSetupFieldsViewController *)self shouldAppearWithFirstEmptyFieldAsFirstResponder])
  {
    uint64_t v4 = [(PKPaymentSetupFieldsViewController *)self firstEmptyField];
    uint64_t v5 = [v4 window];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(PKPaymentSetupFieldsViewController *)self firstEmptyCell];
      char v8 = [v7 becomeFirstResponder];

      if (v8) {
        return;
      }
      uint64_t v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [(PKPaymentSetupFieldsViewController *)self firstEmptyCell];
        *(_DWORD *)buf = 138412290;
        id v12 = v9;
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "-[%@ becomeFirstResponder]; failed.", buf, 0xCu);
      }
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentSetupFieldsViewController;
  [(PKPaymentSetupTableViewController *)&v10 viewDidAppear:a3];
  if ([(PKPaymentSetupFieldsViewController *)self shouldAppearWithFirstEmptyFieldAsFirstResponder])
  {
    uint64_t v4 = [(PKPaymentSetupFieldsViewController *)self firstEmptyField];
    uint64_t v5 = [v4 window];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(PKPaymentSetupFieldsViewController *)self firstEmptyCell];
      char v8 = [v7 becomeFirstResponder];

      if (v8) {
        return;
      }
      uint64_t v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [(PKPaymentSetupFieldsViewController *)self firstEmptyCell];
        *(_DWORD *)buf = 138412290;
        id v12 = v9;
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "-[%@ becomeFirstResponder]; failed.", buf, 0xCu);
      }
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupFieldsViewController;
  [(PKPaymentSetupTableViewController *)&v5 viewWillDisappear:a3];
  uint64_t v4 = [(PKPaymentSetupTableViewController *)self tableView];
  [v4 resignFirstResponder];

  [(PKPaymentSetupFieldCell *)self->_activeEditingCell resignFirstResponder];
}

- (void)viewDidLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupFieldsViewController;
  [(PKPaymentSetupFieldsViewController *)&v9 viewDidLayoutSubviews];
  v3 = [(PKPaymentSetupFieldsViewController *)self headerView];
  [v3 sizeToFit];

  uint64_t v4 = [(PKPaymentSetupTableViewController *)self tableView];
  objc_super v5 = [(PKPaymentSetupFieldsViewController *)self headerView];
  [v5 bounds];
  [v4 _tableHeaderHeightDidChangeToHeight:CGRectGetHeight(v10)];

  v6 = [(PKPaymentSetupFieldsViewController *)self footerView];
  [v6 sizeToFit];

  v7 = [(PKPaymentSetupTableViewController *)self tableView];
  char v8 = [(PKPaymentSetupFieldsViewController *)self footerView];
  [v8 bounds];
  [v7 _tableFooterHeightDidChangeToHeight:CGRectGetHeight(v11)];
}

- (BOOL)shouldAppearWithFirstEmptyFieldAsFirstResponder
{
  v3 = [(PKPaymentSetupTableViewController *)self tableView];
  [v3 contentSize];
  double v5 = v4;

  v6 = [(PKPaymentSetupFieldsViewController *)self view];
  [v6 safeAreaInsets];
  double v8 = v7;
  unint64_t v9 = PKUIGetMinScreenType();
  CGRect v10 = (double *)((char *)&unk_1A04449C8 + 8 * v9);
  if (v9 >= 0x14) {
    CGRect v10 = (double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v11 = *v10;
  [MEMORY[0x1E4FB18E0] defaultSizeForInterfaceOrientation:1];
  double v13 = v12;
  v14 = [(PKPaymentSetupFieldsViewController *)self firstEmptySetupField];
  char v15 = [v14 isOptional];

  id v16 = [(PKPaymentSetupTableViewController *)self footerAttributedText];
  uint64_t v17 = [v16 length];

  BOOL v18 = 0;
  if ((v15 & 1) == 0 && !v17 && v8 + v5 + v13 < v11) {
    BOOL v18 = !self->_showingActivitySpinner;
  }

  return v18;
}

- (id)headerView
{
  headerView = self->_headerView;
  if (!headerView)
  {
    double v4 = [PKTableHeaderView alloc];
    double v5 = -[PKTableHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_headerView;
    self->_headerView = v5;

    [(PKTableHeaderView *)self->_headerView setTopPadding:20.0];
    [(PKTableHeaderView *)self->_headerView setBottomPadding:16.0];
    double v7 = [(PKPaymentSetupFieldsViewController *)self traitCollection];
    uint64_t v8 = [v7 userInterfaceIdiom];

    unint64_t v9 = self->_headerView;
    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      [(PKPaymentSetupTableViewController *)self context];
      uint64_t IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
    }
    else
    {
      uint64_t IsSetupAssistant = 0;
    }
    [(PKTableHeaderView *)v9 setStyle:IsSetupAssistant];
    [(PKTableHeaderView *)self->_headerView setShouldReserveSubtitleHeight:1];
    [(PKPaymentSetupFieldsViewController *)self reloadHeaderView];
    headerView = self->_headerView;
  }

  return headerView;
}

- (void)reloadHeaderView
{
  v3 = [(PKTableHeaderView *)self->_headerView titleLabel];
  double v4 = [(PKPaymentSetupFieldsViewController *)self defaultHeaderViewTitle];
  [v3 setText:v4];

  double v5 = [(PKTableHeaderView *)self->_headerView subtitleLabel];
  v6 = [(PKPaymentSetupFieldsViewController *)self defaultHeaderViewSubTitle];
  [v5 setText:v6];

  headerView = self->_headerView;
  uint64_t v8 = [(PKPaymentSetupTableViewController *)self tableView];
  [v8 bounds];
  -[PKTableHeaderView sizeThatFits:](headerView, "sizeThatFits:", CGRectGetWidth(v17), 3.40282347e38);
  double v10 = v9;
  double v12 = v11;

  double v13 = self->_headerView;
  double v14 = *MEMORY[0x1E4F1DAD8];
  double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);

  -[PKTableHeaderView setFrame:](v13, "setFrame:", v14, v15, v10, v12);
}

- (id)footerView
{
  return 0;
}

- (BOOL)isComplete
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = [(PKPaymentSetupFieldsViewController *)self visibleFieldIdentifiers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    int v7 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        double v10 = [(PKPaymentSetupFieldsViewController *)self fieldForIdentifier:v9];
        double v11 = [(PKPaymentSetupFieldsViewController *)self readonlyFieldIdentifiers];
        char v12 = [v11 containsObject:v9];

        LODWORD(v11) = [v10 isOptional];
        int v13 = [v10 submissionStringMeetsAllRequirements];
        int v14 = [v10 submissionStringMeetsValidationRegex];
        if (v11) {
          int v15 = v14;
        }
        else {
          int v15 = v13;
        }
        int v16 = v15 & v7;
        if ((v12 & 1) == 0) {
          int v7 = v16;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7 & 1;
}

- (void)_updateErrorFooterIfNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(PKPaymentSetupFieldsViewController *)self visibleFieldIdentifiers];
  int64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = [(PKPaymentSetupFieldsViewController *)self cellForIdentifier:v7];
        if ([v8 isShowingError])
        {
          uint64_t v9 = [(PKPaymentSetupFieldsViewController *)self fieldForIdentifier:v7];
          double v10 = [v9 textFieldObject];

          int64_t v4 = [v10 codeOnError];
          goto LABEL_11;
        }
      }
      int64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (self->_validationErrorCode != v4 && !self->_sectionIdentifiers)
  {
    self->_validationErrorCode = v4;
    double v11 = [(PKPaymentSetupTableViewController *)self tableView];
    char v12 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
    [v11 _reloadSectionHeaderFooters:v12 withRowAnimation:5];
  }
}

- (void)setSectionIdentifiers:(id)a3
{
  id v8 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sectionIdentifiers, a3);
    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    fieldIdentifierToFooterViewMap = self->_fieldIdentifierToFooterViewMap;
    self->_fieldIdentifierToFooterViewMap = v5;

    uint64_t v7 = [(PKPaymentSetupTableViewController *)self tableView];
    [v7 reloadData];
  }
}

- (id)displayedFooterField
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([(PKPaymentSetupFieldsViewController *)self shouldDisplayFooterField])
  {
    v3 = [(PKPaymentSetupFieldsModel *)self->_fieldsModel footerPaymentSetupField];
    int64_t v4 = (void *)[v3 copy];

    if (v4 && self->_validationErrorCode)
    {
      uint64_t v5 = [(PKPaymentSetupFieldsViewController *)self _footerTextForValidationError];
      if (v5)
      {
        id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
        uint64_t v11 = *MEMORY[0x1E4FB0700];
        uint64_t v7 = [MEMORY[0x1E4FB1618] systemRedColor];
        v12[0] = v7;
        id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
        uint64_t v9 = (void *)[v6 initWithString:v5 attributes:v8];

        [v4 setBody:v9];
      }
    }
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_footerTextForValidationError
{
  unint64_t v2 = self->_validationErrorCode - 60043;
  if (v2 <= 0xA && ((0x683u >> (LOBYTE(self->_validationErrorCode) + 117)) & 1) != 0)
  {
    v3 = PKLocalizedPeerPaymentString(&off_1E59D8CB0[v2]->isa);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  sectionIdentifiers = self->_sectionIdentifiers;
  if (!sectionIdentifiers) {
    return *MEMORY[0x1E4FB2F28];
  }
  id v6 = [(NSArray *)sectionIdentifiers objectAtIndexedSubscript:a4];
  uint64_t v7 = [v6 firstObject];

  id v8 = [(PKPaymentSetupFieldsViewController *)self footerViewForIdentifier:v7];
  [v8 frame];
  double v10 = v9;

  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  sectionIdentifiers = self->_sectionIdentifiers;
  if (sectionIdentifiers)
  {
    id v6 = [(NSArray *)sectionIdentifiers objectAtIndexedSubscript:a4];
    uint64_t v7 = [v6 firstObject];

    id v8 = [(PKPaymentSetupFieldsViewController *)self footerViewForIdentifier:v7];
  }
  else
  {
    uint64_t v7 = [(PKPaymentSetupFieldsViewController *)self displayedFooterField];
    if (v7
      && [(PKPaymentSetupFieldsViewController *)self shouldDisplayFooterFieldInline:v7])
    {
      id v8 = [(PKPaymentSetupFieldsViewController *)self footerHyperlinkView];
      double v9 = [v7 body];
      [v8 setAttributedText:v9];
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  sectionIdentifiers = self->_sectionIdentifiers;
  if (sectionIdentifiers) {
    return [(NSArray *)sectionIdentifiers count];
  }
  else {
    return 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (self->_sectionIdentifiers) {
    [(NSArray *)self->_sectionIdentifiers objectAtIndexedSubscript:a4];
  }
  else {
  int64_t v4 = [(PKPaymentSetupFieldsViewController *)self visibleFieldIdentifiers];
  }
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  int64_t v5 = [(PKPaymentSetupFieldsViewController *)self identifierForIndexPath:a4];
  id v6 = [(PKPaymentSetupFieldsViewController *)self cellForIdentifier:v5];
  [v6 setDelegate:self];
  uint64_t v7 = [(PKPaymentSetupFieldsViewController *)self readonlyFieldIdentifiers];
  int v8 = [v7 containsObject:v5];

  if (self->_cellsAreEnabled) {
    [v6 setEnabled:v8 ^ 1u];
  }

  return v6;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(PKPaymentSetupFieldsViewController *)self identifierForIndexPath:a4];
  int v8 = [(PKPaymentSetupFieldsViewController *)self cellForIdentifier:v7];
  [v6 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v20.origin.x = v10;
  v20.origin.y = v12;
  v20.size.width = v14;
  v20.size.height = v16;
  [v8 heightForWidth:CGRectGetWidth(v20)];
  double v18 = v17;

  return v18;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentSetupFieldsViewController;
  [(PKPaymentSetupTableViewController *)&v23 tableView:a3 willDisplayCell:v8 forRowAtIndexPath:v9];
  CGFloat v10 = -[PKPaymentSetupFieldsViewController visibleFieldIdentifiersForSection:](self, "visibleFieldIdentifiersForSection:", [v9 section]);
  double v11 = [v8 textLabel];
  CGFloat v12 = [v11 font];
  double v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:18.0];
  }
  double v15 = v14;

  [(PKPaymentSetupFieldsModel *)self->_fieldsModel minimumRequiredWidthForFieldIdentifiers:v10 withFont:v15];
  PKFloatCeilToPixel();
  objc_msgSend(v8, "setMinimumTextLabelWidth:");
  CGFloat v16 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v9, "row"));
  double v17 = [(PKPaymentSetupFieldsViewController *)self fieldForIdentifier:v16];
  unint64_t v18 = [v9 row] + 1;
  if (v18 >= [v10 count])
  {
    uint64_t v21 = [v17 isFieldTypeLabel] ^ 1;
LABEL_12:
    uint64_t v22 = v21;
    goto LABEL_13;
  }
  long long v19 = [v10 objectAtIndexedSubscript:v18];
  if (v19)
  {
    CGRect v20 = [(PKPaymentSetupFieldsViewController *)self fieldForIdentifier:v19];
  }
  else
  {
    CGRect v20 = 0;
  }

  if ([v17 isFieldTypeLabel])
  {
    if (!v20)
    {
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      goto LABEL_13;
    }
    uint64_t v21 = [v20 isFieldTypeLabel] ^ 1;

    goto LABEL_12;
  }
  if (v20)
  {
    uint64_t v22 = [v20 isFieldTypeLabel];

    uint64_t v21 = 1;
  }
  else
  {
    uint64_t v21 = 1;
    uint64_t v22 = 1;
  }
LABEL_13:
  [v8 setShouldDrawSeperator:v21];
  [v8 setShouldDrawFullWidthSeperator:v22];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupFieldsViewController;
  id v5 = a4;
  id v6 = a3;
  [(PKPaymentSetupTableViewController *)&v8 tableView:v6 didSelectRowAtIndexPath:v5];
  uint64_t v7 = objc_msgSend(v6, "cellForRowAtIndexPath:", v5, v8.receiver, v8.super_class);

  [v7 becomeFirstResponder];
}

- (BOOL)fieldCellEditableTextFieldShouldBeginEditing:(id)a3
{
  id v4 = a3;
  if (!self->_hasScrolledToShowFields)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__PKPaymentSetupFieldsViewController_fieldCellEditableTextFieldShouldBeginEditing___block_invoke;
    block[3] = &unk_1E59CA7D0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    self->_hasScrolledToShowFields = 1;
  }
  PKPaymentSetupApplyContextAppearance([(PKPaymentSetupTableViewController *)self context], v4);

  return 1;
}

void __83__PKPaymentSetupFieldsViewController_fieldCellEditableTextFieldShouldBeginEditing___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  v1 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  [v2 scrollToRowAtIndexPath:v1 atScrollPosition:2 animated:1];
}

- (void)fieldCellEditableTextFieldDidBeginEditing:(id)a3
{
  id v4 = (PKPaymentSetupFieldCell *)a3;
  if ([(PKPaymentSetupFieldCell *)v4 usesCustomInputView]) {
    [(PKPaymentSetupFieldsViewController *)self fieldCellEditableTextFieldValueDidChange:v4];
  }
  activeEditingCell = self->_activeEditingCell;
  self->_activeEditingCell = v4;
}

- (void)fieldCellEditableTextFieldDidEndEditing:(id)a3
{
  id v5 = a3;
  if ([v5 usesCustomInputView]) {
    [(PKPaymentSetupFieldsViewController *)self fieldCellEditableTextFieldValueDidChange:v5];
  }
  [(PKPaymentSetupFieldsViewController *)self _updateErrorFooterIfNeeded];
  activeEditingCell = self->_activeEditingCell;
  self->_activeEditingCell = 0;
}

- (void)fieldCellEditableTextFieldValueDidChange:(id)a3
{
  [(PKPaymentSetupFieldsViewController *)self _setRightBarButtonItemsEnabled:[(PKPaymentSetupFieldsViewController *)self isComplete]];

  [(PKPaymentSetupFieldsViewController *)self _updateErrorFooterIfNeeded];
}

- (BOOL)fieldCellEditableTextFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = [v4 editableTextField];
  int v6 = [v5 hasText];

  if (v6)
  {
    uint64_t v7 = [v4 paymentSetupField];
    objc_super v8 = [v7 identifier];
    id v9 = [(PKPaymentSetupFieldsViewController *)self nextResponderCellForCurrentIdentifier:v8];

    if (v9)
    {
      [v9 becomeFirstResponder];
    }
    else if ([(PKPaymentSetupFieldsViewController *)self isComplete])
    {
      [(PKPaymentSetupFieldsViewController *)self handleNextButtonTapped:self];
    }
  }
  return 0;
}

- (BOOL)fieldCellEditableTextFieldShouldClear:(id)a3
{
  return 1;
}

- (void)fieldCellDidTapButton:(id)a3
{
  id v8 = a3;
  id v4 = [v8 paymentSetupField];
  int v5 = [v4 isFieldTypeLabel];

  if (v5)
  {
    int v6 = [v8 paymentSetupField];
    uint64_t v7 = [v6 labelFieldObject];

    [(PKPaymentSetupFieldsViewController *)self _fieldLabelDidTapButton:v7];
  }
}

- (BOOL)fieldCell:(id)a3 supportsKeyboardAccessory:(unint64_t)a4
{
  return 0;
}

- (void)_fieldLabelDidTapButton:(id)a3
{
  id v4 = a3;
  double v13 = [[PKPaymentMoreInformationViewController alloc] initWithContext:[(PKPaymentSetupTableViewController *)self context]];
  int v5 = [v4 detailTitle];
  [(PKPaymentMoreInformationViewController *)v13 setDetailTitle:v5];

  int v6 = [v4 detailSubtitle];
  [(PKPaymentMoreInformationViewController *)v13 setDetailSubtitle:v6];

  uint64_t v7 = [v4 detailBody];
  [(PKPaymentMoreInformationViewController *)v13 setDetailBody:v7];

  id v8 = [v4 businessChatIntentName];
  [(PKPaymentMoreInformationViewController *)v13 setBusinessChatIntentName:v8];

  id v9 = [v4 businessChatButtonTitle];
  [(PKPaymentMoreInformationViewController *)v13 setBusinessChatButtonTitle:v9];

  CGFloat v10 = [v4 businessChatIdentifier];

  [(PKPaymentMoreInformationViewController *)v13 setBusinessChatIdentifier:v10];
  double v11 = [[PKNavigationController alloc] initWithRootViewController:v13];
  CGFloat v12 = [(PKPaymentSetupFieldsViewController *)self navigationController];
  objc_msgSend(v12, "presentModalViewController:withPaymentSetupContext:", v11, -[PKPaymentSetupTableViewController context](self, "context"));
}

- (void)_handleNextButtonTapped:(id)a3
{
  if (self->_rightBarButtonItemsEnabled)
  {
    id v4 = a3;
    int v5 = [(PKPaymentSetupTableViewController *)self tableView];
    int v6 = [(PKPaymentSetupTableViewController *)self tableView];
    [v6 safeAreaInsets];
    objc_msgSend(v5, "setContentOffset:animated:", 1, 0.0, -v7);

    id v8 = [(PKPaymentSetupFieldsViewController *)self navigationController];
    id v9 = [v8 navigationBar];
    [v9 setUserInteractionEnabled:0];

    CGFloat v10 = [(PKPaymentSetupTableViewController *)self tableView];
    double v11 = [v10 firstResponder];
    [v11 resignFirstResponder];

    [(PKPaymentSetupFieldsViewController *)self handleNextButtonTapped:v4];
    id v13 = [(PKPaymentSetupFieldsViewController *)self navigationController];
    CGFloat v12 = [v13 navigationBar];
    [v12 setUserInteractionEnabled:1];
  }
}

- (void)handleNextButtonTapped:(id)a3
{
}

- (void)triggerNextActionLoop
{
}

- (void)_triggerNextActionLoop:(BOOL)a3
{
  if (!self->_performingNextActionLoop)
  {
    self->_performingNextActionLoop = 1;
    [(PKPaymentSetupFieldsViewController *)self _continueNextActionLoop:a3];
  }
}

- (void)_continueNextActionLoop:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PKPaymentSetupFieldsViewController__continueNextActionLoop___block_invoke;
  aBlock[3] = &unk_1E59CEAC0;
  objc_copyWeak(&v12, &location);
  int v5 = _Block_copy(aBlock);
  int v6 = (void *)[v5 copy];

  double v7 = _Block_copy(v6);
  id currentNextActionBlock = self->_currentNextActionBlock;
  self->_id currentNextActionBlock = v7;

  if (v3)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__PKPaymentSetupFieldsViewController__continueNextActionLoop___block_invoke_4;
    v9[3] = &unk_1E59CAD18;
    v9[4] = self;
    id v10 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
  else
  {
    [(PKPaymentSetupFieldsViewController *)self handleNextActionWithCompletion:v6];
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __62__PKPaymentSetupFieldsViewController__continueNextActionLoop___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKPaymentSetupFieldsViewController__continueNextActionLoop___block_invoke_2;
  block[3] = &unk_1E59CFB30;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  char v10 = a2;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __62__PKPaymentSetupFieldsViewController__continueNextActionLoop___block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[1193] = *(unsigned char *)(a1 + 48);
    if (*(void *)(a1 + 32))
    {
      if (!*(unsigned char *)(a1 + 48) && [WeakRetained isShowingActivitySpinner]) {
        [v4 hideActivitySpinner];
      }
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __62__PKPaymentSetupFieldsViewController__continueNextActionLoop___block_invoke_3;
      v7[3] = &unk_1E59CB0B0;
      objc_copyWeak(&v8, v2);
      char v9 = *(unsigned char *)(a1 + 48);
      [v4 handleNextActionError:v5 shouldContinue:v6 withCompletion:v7];
      objc_destroyWeak(&v8);
    }
    else if (*(unsigned char *)(a1 + 48))
    {
      [WeakRetained _continueNextActionLoop:1];
    }
    else if ([WeakRetained isShowingActivitySpinner])
    {
      [v4 hideActivitySpinner];
    }
  }
}

void __62__PKPaymentSetupFieldsViewController__continueNextActionLoop___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(unsigned char *)(a1 + 40))
  {
    id v3 = WeakRetained;
    [WeakRetained _continueNextActionLoop:1];
    id WeakRetained = v3;
  }
}

uint64_t __62__PKPaymentSetupFieldsViewController__continueNextActionLoop___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleNextActionWithCompletion:*(void *)(a1 + 40)];
}

- (void)showActivitySpinnerWithTitle:(id)a3 subtitle:(id)a4
{
}

- (void)hideActivitySpinner
{
  id v3 = [(PKPaymentSetupFieldsViewController *)self defaultHeaderViewSubTitle];
  [(PKPaymentSetupFieldsViewController *)self hideActivitySpinnerWithTitle:0 subtitle:v3 animated:1];
}

- (void)hideActivitySpinnerWithTitle:(id)a3 subtitle:(id)a4 animated:(BOOL)a5
{
}

- (void)_setTableViewHeaderActivityIndicatorActive:(BOOL)a3 title:(id)a4 subtitle:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a3;
  self->_showingActivitySpinner = a3;
  BOOL v10 = !a3;
  id v11 = a5;
  id v12 = a4;
  id v13 = [(PKPaymentSetupFieldsViewController *)self view];
  [v13 setUserInteractionEnabled:v10];

  [(PKPaymentSetupFieldsViewController *)self _setNavigationBarEnabled:v10 animated:v6];
  id v17 = [(PKPaymentSetupFieldsViewController *)self headerView];
  id v14 = [v17 activityIndicator];
  double v15 = v14;
  if (v10)
  {
    [v14 stopAnimating];
  }
  else if (([v14 isAnimating] & 1) == 0)
  {
    [v15 startAnimating];
  }
  [(PKPaymentSetupFieldsViewController *)self setHeaderViewTitle:v12 subtitle:v11];
  CGFloat v16 = [(PKPaymentSetupFieldsViewController *)self footerView];
  [v16 setButtonsEnabled:v10];

  [(PKPaymentSetupFieldsViewController *)self _setIdleTimerDisabled:v8 title:v12 subtitle:v11];
}

- (void)setHeaderViewTitle:(id)a3 subtitle:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  double v7 = [(PKPaymentSetupFieldsViewController *)self headerView];
  uint64_t v8 = (uint64_t)v17;
  if (!v17)
  {
    uint64_t v8 = [(PKPaymentSetupFieldsViewController *)self defaultHeaderViewTitle];
  }
  id v18 = (id)v8;
  char v9 = [v7 titleLabel];
  [v9 setText:v18];

  if (v6)
  {
    BOOL v10 = [v7 subtitleLabel];
    [v10 setText:v6];
  }
  id v11 = [(PKPaymentSetupTableViewController *)self tableView];
  [v7 frame];
  double v13 = v12;
  [v11 bounds];
  objc_msgSend(v7, "sizeThatFits:", v14, 1.79769313e308);
  if (v15 > v13)
  {
    double v16 = v15;
    [v11 _rectForTableHeaderView];
    objc_msgSend(v7, "setFrame:");
    [v11 _tableHeaderHeightDidChangeToHeight:v16];
  }
  [v7 setNeedsLayout];
}

- (void)_setIdleTimerDisabled:(BOOL)a3 title:(id)a4 subtitle:(id)a5
{
  BOOL v6 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  char v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = @"enabled";
    int v12 = 138413058;
    if (v6) {
      BOOL v10 = @"disabled";
    }
    double v13 = v10;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    long long v19 = @"PaymentCardVerification";
    _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Payment Setup has %@ the Idle Timer. (For: %@ - %@) - %@.", (uint8_t *)&v12, 0x2Au);
  }

  id v11 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v11 _setIdleTimerDisabled:v6 forReason:@"PaymentCardVerification"];
}

- (void)showCheckmarkAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKPaymentSetupFieldsViewController *)self headerView];
  id v4 = [v5 checkmarkLayer];
  [v4 setRevealed:1 animated:v3];

  [v5 setNeedsLayout];
}

- (void)endUserInteraction
{
  [(PKPaymentSetupFieldsViewController *)self _setNavigationBarEnabled:0 animated:0];
  [(PKPaymentSetupFieldsViewController *)self _destroyNavigationBarButtonItemsAnimated:0];
  BOOL v3 = [(PKPaymentSetupFieldsViewController *)self view];
  [v3 setUserInteractionEnabled:0];

  id v4 = [(PKPaymentSetupFieldsViewController *)self footerView];
  [v4 setButtonsEnabled:0];
}

- (void)setHidesBackButton:(BOOL)a3 animated:(BOOL)a4
{
  self->_hidesBackButton = a3;
  [(PKPaymentSetupFieldsViewController *)self _updateNavigationItemAnimated:a4];
}

- (void)_setNavigationBarEnabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_navigationEnabled != a3)
  {
    BOOL v4 = a4;
    self->_navigationEnabled = a3;
    id v8 = [(PKPaymentSetupFieldsViewController *)self navigationController];
    BOOL v6 = [v8 navigationBar];
    [v6 setUserInteractionEnabled:self->_navigationEnabled];

    id v7 = [v8 interactivePopGestureRecognizer];
    [v7 setEnabled:self->_navigationEnabled];

    [(PKPaymentSetupFieldsViewController *)self _updateNavigationItemAnimated:v4];
  }
}

- (void)_setRightBarButtonItemsEnabled:(BOOL)a3
{
  if (self->_rightBarButtonItemsEnabled != a3)
  {
    self->_rightBarButtonItemsEnabled = a3;
    [(PKPaymentSetupFieldsViewController *)self _updateRightBarButtonState];
  }
}

- (void)_setLeftBarButtonItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = (NSArray *)[a3 copy];
  leftBarButtonItems = self->_leftBarButtonItems;
  self->_leftBarButtonItems = v6;

  [(PKPaymentSetupFieldsViewController *)self _updateNavigationItemAnimated:v4];
}

- (void)_setRightBarButtonItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = (NSArray *)[a3 copy];
  rightBarButtonItems = self->_rightBarButtonItems;
  self->_rightBarButtonItems = v6;

  [(PKPaymentSetupFieldsViewController *)self _updateNavigationItemAnimated:v4];
}

- (void)_destroyNavigationBarButtonItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  leftBarButtonItems = self->_leftBarButtonItems;
  if (leftBarButtonItems) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = self->_rightBarButtonItems != 0;
  }
  self->_leftBarButtonItems = 0;

  rightBarButtonItems = self->_rightBarButtonItems;
  self->_rightBarButtonItems = 0;

  self->_rightBarButtonItemsEnabled = 0;
  if (v6)
  {
    [(PKPaymentSetupFieldsViewController *)self _updateNavigationItemAnimated:v3];
  }
}

- (void)_updateNavigationItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKPaymentSetupFieldsViewController *)self navigationItem];
  id v16 = v5;
  if (self->_hidesBackButton)
  {
    [v5 setHidesBackButton:1 animated:v3];
  }
  else
  {
    BOOL navigationEnabled = self->_navigationEnabled;
    int v7 = !self->_navigationEnabled;
    if ([v5 hidesBackButton] != v7) {
      [v16 setHidesBackButton:!navigationEnabled animated:v3];
    }
  }
  if (self->_navigationEnabled) {
    leftBarButtonItems = self->_leftBarButtonItems;
  }
  else {
    leftBarButtonItems = 0;
  }
  char v9 = leftBarButtonItems;
  BOOL v10 = [v16 leftBarButtonItems];
  char v11 = PKEqualObjects();

  if ((v11 & 1) == 0) {
    [v16 setLeftBarButtonItems:v9 animated:v3];
  }
  if (self->_navigationEnabled) {
    rightBarButtonItems = self->_rightBarButtonItems;
  }
  else {
    rightBarButtonItems = 0;
  }
  double v13 = rightBarButtonItems;

  __int16 v14 = [v16 rightBarButtonItems];
  char v15 = PKEqualObjects();

  if ((v15 & 1) == 0) {
    [v16 setRightBarButtonItems:v13 animated:v3];
  }
  [(PKPaymentSetupFieldsViewController *)self _updateRightBarButtonState];
}

- (void)_updateRightBarButtonState
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = self->_rightBarButtonItems;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setEnabled:", self->_rightBarButtonItemsEnabled, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)defaultFields
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)visibleFieldIdentifiersForSection:(unint64_t)a3
{
  sectionIdentifiers = self->_sectionIdentifiers;
  if (sectionIdentifiers && [(NSArray *)sectionIdentifiers count] > a3)
  {
    uint64_t v6 = [(NSArray *)self->_sectionIdentifiers objectAtIndexedSubscript:a3];
  }
  else
  {
    uint64_t v6 = [(PKPaymentSetupFieldsViewController *)self visibleFieldIdentifiers];
  }

  return v6;
}

- (id)visibleFieldIdentifiers
{
  id v2 = [(PKPaymentSetupFieldsViewController *)self fieldsModel];
  BOOL v3 = [v2 visibleSetupFieldIdentifiers];

  return v3;
}

- (id)readonlyFieldIdentifiers
{
  id v2 = [(PKPaymentSetupFieldsViewController *)self fieldsModel];
  BOOL v3 = [v2 readonlySetupFieldIdentifiers];

  return v3;
}

- (void)noteFieldIdentifiersChangedAndUpdateHeaders
{
}

- (void)noteFieldIdentifiersChanged
{
}

- (BOOL)shouldDisplayFooterField
{
  return 1;
}

- (void)_noteFieldIdentifiersChangedUpdateHeaders:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = [(PKPaymentSetupFieldsViewController *)self firstResponderCell];
  uint64_t v6 = v5;
  if (v5) {
    [v5 setCanResignFirstResponder:0];
  }
  uint64_t v7 = [(PKPaymentSetupTableViewController *)self tableView];
  [v7 reloadData];

  if (v3) {
    [(PKPaymentSetupFieldsViewController *)self reloadHeaderView];
  }
  if (v6)
  {
    dispatch_time_t v8 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__PKPaymentSetupFieldsViewController__noteFieldIdentifiersChangedUpdateHeaders___block_invoke;
    block[3] = &unk_1E59CA7D0;
    id v15 = v6;
    long long v9 = (void *)MEMORY[0x1E4F14428];
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
  }
  long long v10 = [(PKPaymentSetupFieldsViewController *)self displayedFooterField];
  if (v10
    && ![(PKPaymentSetupFieldsViewController *)self shouldDisplayFooterFieldInline:v10])
  {
    long long v11 = [v10 body];
    [(PKPaymentSetupTableViewController *)self setFooterAttributedText:v11];
  }
  else
  {
    [(PKPaymentSetupTableViewController *)self setFooterAttributedText:0];
  }
  int v12 = [(PKPaymentSetupFieldsViewController *)self navigationItem];
  uint64_t v13 = [v12 rightBarButtonItem];
  objc_msgSend(v13, "setEnabled:", -[PKPaymentSetupFieldsViewController isComplete](self, "isComplete"));
}

uint64_t __80__PKPaymentSetupFieldsViewController__noteFieldIdentifiersChangedUpdateHeaders___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCanResignFirstResponder:1];
}

- (BOOL)shouldDisplayFooterFieldInline:(id)a3
{
  return !self->_sectionIdentifiers && [a3 position] == 2;
}

- (id)footerHyperlinkView
{
  footerHyperlinkView = self->_footerHyperlinkView;
  if (!footerHyperlinkView)
  {
    uint64_t v4 = objc_alloc_init(PKFooterHyperlinkView);
    uint64_t v5 = self->_footerHyperlinkView;
    self->_footerHyperlinkView = v4;

    uint64_t v6 = PKGenericOnboardingPresenter(self, 0);
    uint64_t v7 = [(PKPaymentSetupTableViewController *)self context];
    dispatch_time_t v8 = [(PKPaymentSetupFieldsViewController *)self navigationController];
    long long v9 = PKOpenURLModallyHyperlinkAction(v7, v8);
    long long v10 = PKGenericHyperlinkAction(v6, v9);
    [(PKFooterHyperlinkView *)self->_footerHyperlinkView setAction:v10];

    footerHyperlinkView = self->_footerHyperlinkView;
  }

  return footerHyperlinkView;
}

- (id)footerViewForIdentifier:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSMapTable *)self->_fieldIdentifierToFooterViewMap objectForKey:v4];
  uint64_t v6 = [(PKPaymentSetupFieldsViewController *)self fieldsModel];
  uint64_t v7 = [v6 footerFieldForIdentifier:v4];

  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v7 == 0;
  }
  if (!v8)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    long long v9 = [(PKPaymentSetupTableViewController *)self tableView];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;

    __int16 v14 = [(PKPaymentSetupTableViewController *)self tableView];
    [v14 _sectionContentInset];
    double v16 = v15;
    double v18 = v17;

    double v19 = v13 - v16 - v18;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v33 = v7;
    id v20 = v7;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v35;
      double v24 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v26 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          v27 = objc_alloc_init(PKPaymentSetupFieldFooterView);
          [(PKPaymentSetupFieldFooterView *)v27 setField:v26];
          [(PKPaymentSetupFieldFooterView *)v27 setDelegate:self];
          -[PKPaymentSetupFieldFooterView sizeThatFits:](v27, "sizeThatFits:", v19, 1.79769313e308);
          double v29 = v28;
          -[PKPaymentSetupFieldFooterView setFrame:](v27, "setFrame:", v11, v24, v30, v28);
          double v24 = v24 + v29;
          [v5 addSubview:v27];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v22);
    }
    else
    {
      double v24 = 0.0;
    }

    objc_msgSend(v5, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v19, v24);
    [(NSMapTable *)self->_fieldIdentifierToFooterViewMap setObject:v5 forKey:v4];
    uint64_t v7 = v33;
  }
  id v31 = v5;

  return v31;
}

- (id)identifierForIndexPath:(id)a3
{
  sectionIdentifiers = self->_sectionIdentifiers;
  id v5 = a3;
  uint64_t v6 = v5;
  if (sectionIdentifiers) {
    -[NSArray objectAtIndexedSubscript:](sectionIdentifiers, "objectAtIndexedSubscript:", [v5 section]);
  }
  else {
  uint64_t v7 = [(PKPaymentSetupFieldsViewController *)self visibleFieldIdentifiers];
  }
  uint64_t v8 = [v6 row];

  long long v9 = [v7 objectAtIndex:v8];

  return v9;
}

- (void)_setCellsEnabled:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (((!self->_cellsAreEnabled ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    id v5 = [(PKPaymentSetupFieldsViewController *)self allCells];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setUserInteractionEnabled:v3];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
    self->_cellsAreEnabled = v3;
  }
}

- (id)fieldForIdentifier:(id)a3
{
  return (id)[(PKPaymentSetupFieldsModel *)self->_fieldsModel paymentSetupFieldWithIdentifier:a3];
}

- (id)cellForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMapTable *)self->_fieldIdentifierToCellMap objectForKey:v4];
  uint64_t v6 = [(PKPaymentSetupFieldsViewController *)self fieldForIdentifier:v4];
  uint64_t v7 = (void *)v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (!v8)
  {
    id v5 = +[PKPaymentSetupFieldCell paymentSetupFieldCellForField:v6 fromTableView:0];
    if (v5)
    {
      [(NSMapTable *)self->_fieldIdentifierToCellMap setObject:v5 forKey:v4];
      [v5 setEnabled:self->_cellsAreEnabled];
    }
  }
  [v5 setPaymentSetupField:v7];

  return v5;
}

- (id)nextResponderCellForCurrentIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentSetupFieldsViewController *)self visibleFieldIdentifiers];
  uint64_t v6 = [(PKPaymentSetupFieldsViewController *)self readonlyFieldIdentifiers];
  uint64_t v7 = objc_msgSend(v5, "pk_arrayByRemovingObjectsInArray:", v6);

  uint64_t v8 = [v7 indexOfObject:v4];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v9 = v8 + 1, v9 >= [v7 count]))
  {
    long long v11 = 0;
  }
  else
  {
    long long v10 = [v7 objectAtIndex:v9];
    long long v11 = [(PKPaymentSetupFieldsViewController *)self cellForIdentifier:v10];
  }

  return v11;
}

- (id)firstEmptyCell
{
  BOOL v3 = [(PKPaymentSetupFieldsViewController *)self firstEmptySetupField];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 identifier];
    uint64_t v6 = [(PKPaymentSetupFieldsViewController *)self cellForIdentifier:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)firstEmptySetupField
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v3 = [(PKPaymentSetupFieldsViewController *)self visibleFieldIdentifiers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        unint64_t v9 = [(PKPaymentSetupFieldsModel *)self->_fieldsModel paymentSetupFieldWithIdentifier:v8];
        if (([v9 isFieldTypeLabel] & 1) == 0)
        {
          long long v10 = [v9 submissionString];
          if ([v10 length])
          {
          }
          else
          {
            long long v11 = [(PKPaymentSetupFieldsViewController *)self readonlyFieldIdentifiers];
            int v12 = [v11 containsObject:v8];

            if (!v12) {
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  unint64_t v9 = 0;
LABEL_13:

  return v9;
}

- (id)firstResponderCell
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKPaymentSetupFieldsViewController *)self visibleFieldIdentifiers];
  uint64_t v4 = [(PKPaymentSetupFieldsViewController *)self readonlyFieldIdentifiers];
  uint64_t v5 = objc_msgSend(v3, "pk_arrayByRemovingObjectsInArray:", v4);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      long long v11 = -[PKPaymentSetupFieldsViewController cellForIdentifier:](self, "cellForIdentifier:", *(void *)(*((void *)&v15 + 1) + 8 * v10), (void)v15);
      if ([v11 isFirstResponder]) {
        break;
      }
      int v12 = [v11 editableTextField];
      char v13 = [v12 isFirstResponder];

      if (v13) {
        break;
      }

      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        long long v11 = 0;
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

- (id)allCells
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(NSMapTable *)self->_fieldIdentifierToCellMap objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

  return v9;
}

- (id)firstEmptyField
{
  id v2 = [(PKPaymentSetupFieldsViewController *)self firstEmptyCell];
  BOOL v3 = [v2 editableTextField];

  return v3;
}

- (BOOL)isEmpty
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v3 = ![(PKPaymentSetupFieldsViewController *)self isComplete];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(PKPaymentSetupFieldsViewController *)self visibleFieldIdentifiers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(PKPaymentSetupFieldsModel *)self->_fieldsModel paymentSetupFieldWithIdentifier:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        if (([v9 isFieldTypeLabel] & 1) == 0)
        {
          uint64_t v10 = [v9 submissionString];
          BOOL v11 = [v10 length] == 0;

          LOBYTE(v3) = v11 & v3;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3 & 1;
}

- (void)resetCellStyling
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(PKPaymentSetupFieldsViewController *)self allCells];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) resetTextFieldStyling];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)defaultHeaderViewTitle
{
  return 0;
}

- (id)defaultHeaderViewSubTitle
{
  return 0;
}

- (id)_contextSpecificStringForAggDKey:(id)a3
{
  uint64_t v4 = NSString;
  id v5 = a3;
  uint64_t v6 = [v4 stringWithFormat:@"%@.%ld", v5, -[PKPaymentSetupTableViewController context](self, "context")];

  return v6;
}

- (void)logAnalyticsContextSpecificCheckpointForKey:(id)a3
{
  id v3 = [(PKPaymentSetupFieldsViewController *)self _contextSpecificStringForAggDKey:a3];
  MEMORY[0x1A6220EC0](v3, 0);
}

- (void)logAnalyticsCheckpointForKey:(id)a3
{
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setSetupDelegate:(id)a3
{
}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (void)setWebService:(id)a3
{
}

- (PKPaymentSetupFieldsModel)fieldsModel
{
  return self->_fieldsModel;
}

- (void)setFieldsModel:(id)a3
{
}

- (NSArray)sectionIdentifiers
{
  return self->_sectionIdentifiers;
}

- (BOOL)isShowingActivitySpinner
{
  return self->_showingActivitySpinner;
}

- (BOOL)isPerformingNextActionLoop
{
  return self->_performingNextActionLoop;
}

- (BOOL)isProvisioningPaymentAccount
{
  return self->_provisioningPaymentAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_activeEditingCell, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItems, 0);
  objc_storeStrong(&self->_currentNextActionBlock, 0);
  objc_storeStrong((id *)&self->_footerHyperlinkView, 0);
  objc_storeStrong((id *)&self->_fieldIdentifierToFooterViewMap, 0);
  objc_storeStrong((id *)&self->_fieldIdentifierToCellMap, 0);
  objc_storeStrong((id *)&self->_fieldsModel, 0);

  objc_storeStrong((id *)&self->_headerView, 0);
}

@end