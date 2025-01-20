@interface PKAddressSearcherViewController
- (BOOL)_validateContact:(id)a3;
- (BOOL)supportsSearchBarCancelButton;
- (BOOL)tableView:(id)a3 wantsHeaderForSection:(int64_t)a4;
- (CNPostalAddress)selectedAddress;
- (NSArray)completionSearchResults;
- (NSArray)contactsSearchResults;
- (NSArray)requiredKeys;
- (NSDictionary)sectionMapping;
- (NSSet)supportedCountryCodes;
- (NSString)headerSubtitle;
- (NSString)headerTitle;
- (PKAddressSearchModel)searchModel;
- (PKAddressSearcherViewController)initWithIdentityVerificationController:(id)a3 setupDelegate:(id)a4 style:(int64_t)a5;
- (PKAddressSearcherViewController)initWithStyle:(int64_t)a3;
- (PKAddressSearcherViewControllerDelegate)delegate;
- (PKContactFormatValidator)contactFormatValidator;
- (PKPaymentSetupViewControllerDelegate)setupDelegate;
- (PKPeerPaymentIdentityVerificationController)identityVerificationController;
- (PKTableHeaderView)headerView;
- (UIColor)backgroundColor;
- (UISearchBar)searchBar;
- (UIView)headerContainerView;
- (_UINavigationControllerPalette)palette;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)style;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)identityVerificationError;
- (void)_handleCancelButtonTapped:(id)a3;
- (void)_processNextViewController;
- (void)_removeNavigationBarButtonItems;
- (void)_setNavigationBarEnabled:(BOOL)a3;
- (void)_showAddressEditorWithContact:(id)a3 withContactErrors:(id)a4;
- (void)_terminateFlow;
- (void)_updateNavigationButtons;
- (void)_updateSectionMapping;
- (void)addressEditorViewController:(id)a3 selectedContact:(id)a4;
- (void)addressEditorViewControllerDidCancel:(id)a3;
- (void)contactsSearchUpdated:(id)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)loadView;
- (void)mapSearchUpdated:(id)a3;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)selectedAddress:(id)a3 withError:(id)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setCompletionSearchResults:(id)a3;
- (void)setContactFormatValidator:(id)a3;
- (void)setContactsSearchResults:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderContainerView:(id)a3;
- (void)setHeaderSubtitle:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setIdentityVerificationController:(id)a3;
- (void)setIdentityVerificationError:(unint64_t)a3;
- (void)setPalette:(id)a3;
- (void)setRequiredKeys:(id)a3;
- (void)setSearchBar:(id)a3;
- (void)setSearchModel:(id)a3;
- (void)setSectionMapping:(id)a3;
- (void)setSelectedAddress:(id)a3;
- (void)setSetupDelegate:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSupportedCountryCodes:(id)a3;
- (void)setSupportsSearchBarCancelButton:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKAddressSearcherViewController

- (PKAddressSearcherViewController)initWithStyle:(int64_t)a3
{
  return [(PKAddressSearcherViewController *)self initWithIdentityVerificationController:0 setupDelegate:0 style:a3];
}

- (PKAddressSearcherViewController)initWithIdentityVerificationController:(id)a3 setupDelegate:(id)a4 style:(int64_t)a5
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKAddressSearcherViewController;
  v9 = [(PKAddressSearcherViewController *)&v18 initWithNibName:0 bundle:0];
  if (v9)
  {
    v10 = (PKAddressSearchModel *)objc_alloc_init(MEMORY[0x1E4F843C8]);
    searchModel = v9->_searchModel;
    v9->_searchModel = v10;

    [(PKAddressSearchModel *)v9->_searchModel setDelegate:v9];
    v9->_style = a5;
    objc_storeStrong((id *)&v9->_identityVerificationController, a3);
    uint64_t v12 = *MEMORY[0x1E4F1B7C8];
    v19[0] = *MEMORY[0x1E4F87118];
    v19[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    requiredKeys = v9->_requiredKeys;
    v9->_requiredKeys = (NSArray *)v13;

    v9->_supportsSearchBarCancelButton = 1;
    v15 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sectionMapping = v9->_sectionMapping;
    v9->_sectionMapping = v15;

    [(PKAddressSearcherViewController *)v9 _updateSectionMapping];
    [(PKAddressSearcherViewController *)v9 _updateNavigationButtons];
  }

  return v9;
}

- (void)loadView
{
  v35.receiver = self;
  v35.super_class = (Class)PKAddressSearcherViewController;
  [(PKAddressSearcherViewController *)&v35 loadView];
  v3 = [(PKAddressSearcherViewController *)self view];
  v4 = v3;
  if (self->_backgroundColor)
  {
    objc_msgSend(v3, "setBackgroundColor:");
  }
  else
  {
    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [v4 setBackgroundColor:v5];
  }
  id v6 = objc_alloc(MEMORY[0x1E4FB1BF0]);
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v11 = (UISearchBar *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
  searchBar = self->_searchBar;
  self->_searchBar = v11;

  [(UISearchBar *)self->_searchBar setAutocorrectionType:0];
  [(UISearchBar *)self->_searchBar setDelegate:self];
  uint64_t v13 = self->_searchBar;
  v14 = PKLocalizedPaymentString(&cfstr_InAppPaymentSe_0.isa);
  [(UISearchBar *)v13 setPlaceholder:v14];

  [(UISearchBar *)self->_searchBar setReturnKeyType:9];
  [(UISearchBar *)self->_searchBar setEnablesReturnKeyAutomatically:1];
  [(UISearchBar *)self->_searchBar setTextContentType:*MEMORY[0x1E4FB2F80]];
  [(UISearchBar *)self->_searchBar _setAutoDisableCancelButton:0];
  [(UISearchBar *)self->_searchBar setSearchBarStyle:2];
  v15 = self->_searchBar;
  BOOL v16 = [(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts];
  BOOL supportsSearchBarCancelButton = 0;
  if (!v16) {
    BOOL supportsSearchBarCancelButton = self->_supportsSearchBarCancelButton;
  }
  [(UISearchBar *)v15 setShowsCancelButton:supportsSearchBarCancelButton];
  -[UISearchBar setContentInset:](self->_searchBar, "setContentInset:", 0.0, 15.0, 0.0, 15.0);
  [(UISearchBar *)self->_searchBar sizeToFit];
  [(UISearchBar *)self->_searchBar setAccessibilityIdentifier:*MEMORY[0x1E4F85970]];
  if (self->_headerTitle || self->_headerSubtitle)
  {
    objc_super v18 = -[PKTableHeaderView initWithFrame:]([PKTableHeaderView alloc], "initWithFrame:", v7, v8, v9, v10);
    headerView = self->_headerView;
    self->_headerView = v18;

    if (self->_headerTitle)
    {
      v20 = [(PKTableHeaderView *)self->_headerView titleLabel];
      [v20 setText:self->_headerTitle];
    }
    if (self->_headerSubtitle)
    {
      v21 = [(PKTableHeaderView *)self->_headerView subtitleLabel];
      [v21 setText:self->_headerSubtitle];
    }
    [(PKTableHeaderView *)self->_headerView sizeToFit];
    v22 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v7, v8, v9, v10);
    headerContainerView = self->_headerContainerView;
    self->_headerContainerView = v22;

    [(UIView *)self->_headerContainerView addSubview:self->_headerView];
    [(UIView *)self->_headerContainerView addSubview:self->_searchBar];
    v24 = [(PKAddressSearcherViewController *)self tableView];
    [v24 setTableHeaderView:self->_headerContainerView];
  }
  else
  {
    [(UISearchBar *)self->_searchBar bounds];
    double v28 = v27;
    v29 = [(PKAddressSearcherViewController *)self view];
    [v29 bounds];
    double v31 = v30;

    v32 = [(PKAddressSearcherViewController *)self navigationController];
    objc_msgSend(v32, "paletteForEdge:size:", 2, v31, v28);
    v33 = (_UINavigationControllerPalette *)objc_claimAutoreleasedReturnValue();
    palette = self->_palette;
    self->_palette = v33;

    [(_UINavigationControllerPalette *)self->_palette addSubview:self->_searchBar];
  }
  v25 = [(PKAddressSearcherViewController *)self tableView];
  [v25 setKeyboardDismissMode:1];

  if (self->_style == 2)
  {
    v26 = PKBridgeAppearanceGetAppearanceSpecifier();
    PKAppearanceApplyToContainer(v26, self->_searchBar);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAddressSearcherViewController;
  [(PKAddressSearcherViewController *)&v5 viewWillAppear:a3];
  if (self->_palette)
  {
    v4 = [(PKAddressSearcherViewController *)self navigationController];
    [v4 attachPalette:self->_palette isPinned:0];
  }
  [(UISearchBar *)self->_searchBar becomeFirstResponder];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKAddressSearcherViewController;
  [(PKAddressSearcherViewController *)&v3 viewDidAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKAddressSearcherViewController;
  [(PKAddressSearcherViewController *)&v4 viewWillDisappear:a3];
  [(UISearchBar *)self->_searchBar resignFirstResponder];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKAddressSearcherViewController;
  [(PKAddressSearcherViewController *)&v4 viewDidDisappear:a3];
  [(PKAddressSearchModel *)self->_searchModel endSearch];
}

- (void)viewWillLayoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)PKAddressSearcherViewController;
  [(PKAddressSearcherViewController *)&v18 viewWillLayoutSubviews];
  [(UISearchBar *)self->_searchBar bounds];
  double v4 = v3;
  if (self->_headerContainerView && (headerView = self->_headerView) != 0)
  {
    id v6 = [(PKAddressSearcherViewController *)self tableView];
    [v6 bounds];
    -[PKTableHeaderView sizeThatFits:](headerView, "sizeThatFits:", CGRectGetWidth(v19), 3.40282347e38);
    double v8 = v7;
    double v10 = v9;

    CGFloat v11 = v4 + v10;
    -[UIView setFrame:](self->_headerContainerView, "setFrame:", 0.0, 0.0, v8, v11);
    memset(&slice, 0, sizeof(slice));
    memset(&v16, 0, sizeof(v16));
    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    v20.size.width = v8;
    v20.size.height = v11;
    CGRectDivide(v20, &slice, &v16, v10, CGRectMinYEdge);
    -[PKTableHeaderView setFrame:](self->_headerView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[UISearchBar setContentInset:](self->_searchBar, "setContentInset:", 0.0, 15.0, 0.0, 15.0);
    -[UISearchBar setFrame:](self->_searchBar, "setFrame:", *(_OWORD *)&v16.origin, *(_OWORD *)&v16.size);
  }
  else
  {
    palette = self->_palette;
    if (palette)
    {
      [(_UINavigationControllerPalette *)palette frame];
      -[_UINavigationControllerPalette setFrame:isAnimating:](self->_palette, "setFrame:isAnimating:", [MEMORY[0x1E4FB1EB0] _isInAnimationBlock], v13, v14, v15, v4);
    }
  }
}

- (void)_handleCancelButtonTapped:(id)a3
{
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E68], 0, a3);
  id v4 = [(PKAddressSearcherViewController *)self setupDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 viewControllerDidCancelSetupFlow:self];
  }
  else {
    [(PKAddressSearcherViewController *)self _terminateFlow];
  }
}

- (void)_terminateFlow
{
  double v3 = [(PKAddressSearcherViewController *)self setupDelegate];
  id v5 = v3;
  if (v3)
  {
    [v3 viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    id v4 = [(PKAddressSearcherViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_showAddressEditorWithContact:(id)a3 withContactErrors:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_identityVerificationController)
  {
    if ([(PKAddressSearcherViewController *)self _validateContact:v6])
    {
      double v8 = [(PKAddressSearcherViewController *)self delegate];
      [v8 addressSearcherViewController:self selectedContact:v6];

      [(PKAddressSearcherViewController *)self _processNextViewController];
    }
  }
  else
  {
    double v9 = [PKAddressEditorViewController alloc];
    double v10 = [(PKAddressSearcherViewController *)self requiredKeys];
    v16[0] = *MEMORY[0x1E4F87118];
    CGFloat v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    if (v7) {
      id v12 = v7;
    }
    else {
      id v12 = (id)MEMORY[0x1E4F1CBF0];
    }
    double v13 = [(PKAddressEditorViewController *)v9 initWithContact:v6 requiredKeys:v10 highlightedKeys:v11 errors:v12 style:self->_style];

    double v14 = [(PKAddressSearcherViewController *)self title];
    [(PKAddressEditorViewController *)v13 setTitle:v14];

    [(PKAddressEditorViewController *)v13 setDelegate:self];
    [(PKAddressEditorViewController *)v13 setContactFormatValidator:self->_contactFormatValidator];
    double v15 = [(PKAddressSearcherViewController *)self navigationController];
    [v15 pushViewController:v13 animated:1];
  }
}

- (BOOL)_validateContact:(id)a3
{
  id v4 = a3;
  if (v4 && [(NSSet *)self->_supportedCountryCodes count])
  {
    id v5 = [v4 postalAddresses];
    id v6 = [v5 firstObject];
    id v7 = [v6 value];

    double v8 = [v7 ISOCountryCode];
    BOOL v9 = [(NSSet *)self->_supportedCountryCodes containsObject:v8];
    if (!v9)
    {
      supportedCountryCodes = self->_supportedCountryCodes;
      CGFloat v11 = [MEMORY[0x1E4F1CAD0] setWithObject:@"US"];
      LODWORD(supportedCountryCodes) = [(NSSet *)supportedCountryCodes isEqualToSet:v11];

      if (supportedCountryCodes)
      {
        id v12 = PKLocalizedPaymentString(&cfstr_AddressNotSupp.isa);
        double v13 = PKLocalizedPaymentString(&cfstr_AddressNotSupp_0.isa);
        double v14 = PKDisplayableErrorCustom();

        id v15 = PKAlertForDisplayableErrorWithHandlers(v14, 0, 0, 0);
        CGRect v16 = [(PKAddressSearcherViewController *)self navigationController];
        [v16 presentViewController:v15 animated:1 completion:0];
      }
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)_processNextViewController
{
  objc_initWeak(&location, self);
  identityVerificationController = self->_identityVerificationController;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__PKAddressSearcherViewController__processNextViewController__block_invoke;
  v4[3] = &unk_1E59CB2D8;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [(PKPeerPaymentIdentityVerificationController *)identityVerificationController nextViewControllerWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __61__PKAddressSearcherViewController__processNextViewController__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __61__PKAddressSearcherViewController__processNextViewController__block_invoke_2;
  v16[3] = &unk_1E59D7658;
  objc_copyWeak(v20, (id *)(a1 + 40));
  uint64_t v12 = *(void *)(a1 + 32);
  v20[1] = a5;
  v16[4] = v12;
  id v17 = v9;
  id v18 = v11;
  id v19 = v10;
  id v13 = v10;
  id v14 = v11;
  id v15 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v16);

  objc_destroyWeak(v20);
}

void __61__PKAddressSearcherViewController__processNextViewController__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    *(void *)(*(void *)(a1 + 32) + 1096) = *(void *)(a1 + 72);
    if (*(void *)(a1 + 40))
    {
      id v5 = [WeakRetained navigationController];
      id v6 = v5;
      uint64_t v7 = *(void *)(a1 + 40);
LABEL_4:
      [v5 pushViewController:v7 animated:1];
LABEL_7:

      goto LABEL_8;
    }
    if (*(void *)(a1 + 48))
    {
      id v6 = objc_msgSend(MEMORY[0x1E4F84D80], "displayableErrorForError:");
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __61__PKAddressSearcherViewController__processNextViewController__block_invoke_3;
      void v19[3] = &unk_1E59CA7D0;
      v19[4] = v4;
      id v8 = PKAlertForDisplayableErrorWithHandlers(v6, 0, v19, 0);
      id v9 = [v4 navigationController];
      [v9 presentViewController:v8 animated:1 completion:0];

      goto LABEL_7;
    }
    id v10 = *(void **)(a1 + 56);
    if (v10)
    {
      id v11 = [v10 explanationView];
      [v11 setDelegate:v4];

      id v5 = [v4 navigationController];
      id v6 = v5;
      uint64_t v7 = *(void *)(a1 + 56);
      goto LABEL_4;
    }
    if (*(void *)(*(void *)(a1 + 32) + 1096) == 1)
    {
      uint64_t v12 = [v4 headerView];
      id v13 = [v12 checkmarkLayer];
      [v13 setRevealed:1 animated:0];

      id v14 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_0.isa);
      [v4 setHeaderTitle:v14];

      [v4 setHeaderSubtitle:&stru_1EF1B5B50];
      [v12 setNeedsLayout];
      [*(id *)(a1 + 32) _setNavigationBarEnabled:0];
      [*(id *)(a1 + 32) _removeNavigationBarButtonItems];
      id v15 = [*(id *)(a1 + 32) view];
      [v15 setUserInteractionEnabled:0];

      dispatch_time_t v16 = dispatch_time(0, 1000000000);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __61__PKAddressSearcherViewController__processNextViewController__block_invoke_4;
      v17[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v18, v2);
      dispatch_after(v16, MEMORY[0x1E4F14428], v17);
      objc_destroyWeak(&v18);
    }
  }
LABEL_8:
}

uint64_t __61__PKAddressSearcherViewController__processNextViewController__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void __61__PKAddressSearcherViewController__processNextViewController__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _terminateFlow];
    id WeakRetained = v2;
  }
}

- (void)_updateSectionMapping
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(NSArray *)self->_contactsSearchResults count])
  {
    double v3 = [NSNumber numberWithInteger:0];
    [v9 setObject:&unk_1EF2B94B0 forKey:v3];

    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  if ([(NSArray *)self->_completionSearchResults count])
  {
    id v5 = [NSNumber numberWithInteger:v4];
    [v9 setObject:&unk_1EF2B94C8 forKey:v5];

    ++v4;
  }
  id v6 = [NSNumber numberWithInteger:v4];
  [v9 setObject:&unk_1EF2B94E0 forKey:v6];

  uint64_t v7 = (NSDictionary *)[v9 copy];
  sectionMapping = self->_sectionMapping;
  self->_sectionMapping = v7;
}

- (void)setHeaderTitle:(id)a3
{
  id v5 = a3;
  id v6 = self->_headerTitle;
  uint64_t v7 = (NSString *)v5;
  id v10 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v6 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_headerTitle, a3);
    id v9 = [(PKTableHeaderView *)self->_headerView titleLabel];
    [v9 setText:self->_headerTitle];

    [(PKTableHeaderView *)self->_headerView setNeedsLayout];
  }
LABEL_9:
}

- (void)setHeaderSubtitle:(id)a3
{
  id v5 = a3;
  id v6 = self->_headerSubtitle;
  uint64_t v7 = (NSString *)v5;
  id v10 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v6 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_headerSubtitle, a3);
    id v9 = [(PKTableHeaderView *)self->_headerView subtitleLabel];
    [v9 setText:self->_headerSubtitle];

    [(PKTableHeaderView *)self->_headerView setNeedsLayout];
  }
LABEL_9:
}

- (void)setSupportsSearchBarCancelButton:(BOOL)a3
{
  if (self->_supportsSearchBarCancelButton != a3)
  {
    self->_BOOL supportsSearchBarCancelButton = a3;
    [(PKAddressSearcherViewController *)self _updateNavigationButtons];
  }
}

- (void)_updateNavigationButtons
{
  double v3 = [(PKAddressSearcherViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (self->_identityVerificationController) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  }
  if (v5)
  {
    id v9 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__handleCancelButtonTapped_];
    BOOL v8 = [(PKAddressSearcherViewController *)self navigationItem];
    [v8 setRightBarButtonItem:v9];
  }
  else
  {
    if (v4 == 6)
    {
      id v6 = objc_alloc(MEMORY[0x1E4FB14A8]);
      uint64_t v7 = 24;
    }
    else
    {
      if (self->_supportsSearchBarCancelButton) {
        return;
      }
      id v6 = objc_alloc(MEMORY[0x1E4FB14A8]);
      uint64_t v7 = 1;
    }
    id v9 = (id)[v6 initWithBarButtonSystemItem:v7 target:self action:sel__handleCancelButtonTapped_];
    BOOL v8 = [(PKAddressSearcherViewController *)self navigationItem];
    [v8 setLeftBarButtonItem:v9];
  }
}

- (void)_setNavigationBarEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(PKAddressSearcherViewController *)self navigationController];
  BOOL v5 = [v10 navigationBar];
  [v5 setUserInteractionEnabled:v3];

  id v6 = [v10 interactivePopGestureRecognizer];
  [v6 setEnabled:v3];

  uint64_t v7 = [(PKAddressSearcherViewController *)self navigationItem];
  BOOL v8 = [v7 leftBarButtonItem];
  [v8 setEnabled:v3];

  id v9 = [v7 rightBarButtonItem];
  [v9 setEnabled:v3];
}

- (void)_removeNavigationBarButtonItems
{
  BOOL v3 = [(PKAddressSearcherViewController *)self navigationItem];
  [v3 setLeftBarButtonItem:0];

  uint64_t v4 = [(PKAddressSearcherViewController *)self navigationItem];
  [v4 setRightBarButtonItem:0];

  id v5 = [(PKAddressSearcherViewController *)self navigationItem];
  [v5 setHidesBackButton:1];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSDictionary *)self->_sectionMapping count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  sectionMapping = self->_sectionMapping;
  id v6 = [NSNumber numberWithInteger:a4];
  uint64_t v7 = [(NSDictionary *)sectionMapping objectForKey:v6];

  if (v7)
  {
    uint64_t v8 = [v7 unsignedIntegerValue];
    if (v8)
    {
      if (v8 == 1) {
        int64_t v9 = [(NSArray *)self->_completionSearchResults count];
      }
      else {
        int64_t v9 = v8 == 2;
      }
    }
    else
    {
      uint64_t v10 = [(NSArray *)self->_contactsSearchResults count];
      if (v10 >= 4) {
        int64_t v9 = 4;
      }
      else {
        int64_t v9 = v10;
      }
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (BOOL)tableView:(id)a3 wantsHeaderForSection:(int64_t)a4
{
  sectionMapping = self->_sectionMapping;
  id v6 = [NSNumber numberWithInteger:a4];
  uint64_t v7 = [(NSDictionary *)sectionMapping objectForKey:v6];

  if (v7)
  {
    uint64_t v8 = [v7 unsignedIntegerValue];
    if (!v8)
    {
      int64_t v9 = &OBJC_IVAR___PKAddressSearcherViewController__contactsSearchResults;
      goto LABEL_7;
    }
    if (v8 == 1)
    {
      int64_t v9 = &OBJC_IVAR___PKAddressSearcherViewController__completionSearchResults;
LABEL_7:
      BOOL v10 = [*(id *)((char *)&self->super.super.super.super.isa + *v9) count] != 0;
      goto LABEL_8;
    }
  }
  BOOL v10 = 0;
LABEL_8:

  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  sectionMapping = self->_sectionMapping;
  id v5 = [NSNumber numberWithInteger:a4];
  id v6 = [(NSDictionary *)sectionMapping objectForKey:v5];

  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v7 = [v6 unsignedIntegerValue];
  if (!v7)
  {
    uint64_t v8 = @"CONTACTS";
    goto LABEL_7;
  }
  if (v7 != 1)
  {
LABEL_5:
    int64_t v9 = 0;
    goto LABEL_8;
  }
  uint64_t v8 = @"LOCATIONS";
LABEL_7:
  int64_t v9 = PKLocalizedString(&v8->isa);
LABEL_8:

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 32.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sectionMapping = self->_sectionMapping;
  int64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "section"));
  BOOL v10 = [(NSDictionary *)sectionMapping objectForKey:v9];

  if (!v10)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4FB1D08]);
    goto LABEL_20;
  }
  uint64_t v11 = [v10 unsignedIntegerValue];
  if (v11)
  {
    if (v11 != 1)
    {
      if (v11 == 2)
      {
        id v12 = [v6 dequeueReusableCellWithIdentifier:@"Manual"];
        if (!v12) {
          id v12 = (id)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"Manual"];
        }
        id v13 = [v12 textLabel];
        id v14 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_14.isa);
        [v13 setText:v14];

        id v15 = [v12 detailTextLabel];
        [v15 setText:0];

        PKAccessibilityIDCellSet(v12, (void *)*MEMORY[0x1E4F854E0]);
      }
      else
      {
        id v12 = objc_alloc_init(MEMORY[0x1E4FB1D08]);
      }
      goto LABEL_17;
    }
    id v12 = [v6 dequeueReusableCellWithIdentifier:@"Address"];
    if (!v12) {
      id v12 = (id)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"Address"];
    }
    dispatch_time_t v16 = -[NSArray objectAtIndex:](self->_completionSearchResults, "objectAtIndex:", [v7 row]);
    v22 = [v12 textLabel];
    v23 = [v16 title];
    [v22 setText:v23];

    v24 = [v12 detailTextLabel];
    v25 = [v16 subtitle];
    [v24 setText:v25];

    v21 = (void **)MEMORY[0x1E4F856B8];
  }
  else
  {
    id v12 = [v6 dequeueReusableCellWithIdentifier:@"Address"];
    if (!v12) {
      id v12 = (id)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"Address"];
    }
    dispatch_time_t v16 = -[NSArray objectAtIndex:](self->_contactsSearchResults, "objectAtIndex:", [v7 row]);
    id v17 = [v12 textLabel];
    id v18 = objc_msgSend(v16, "pk_displayName");
    [v17 setText:v18];

    id v19 = [v12 detailTextLabel];
    CGRect v20 = [v16 pkSingleLineFormattedContactAddress];
    [v19 setText:v20];

    v21 = (void **)MEMORY[0x1E4F853C0];
  }
  PKAccessibilityIDCellSet(v12, *v21);

LABEL_17:
  if (self->_style == 2)
  {
    v26 = PKBridgeAppearanceGetAppearanceSpecifier();
    PKAppearanceApplyToContainer(v26, v12);
  }
  [v12 setAccessoryType:1];
  double v27 = [v12 contentView];
  double v28 = [MEMORY[0x1E4FB1618] clearColor];
  [v27 setBackgroundColor:v28];

  v29 = [MEMORY[0x1E4FB1618] clearColor];
  [v12 setBackgroundColor:v29];

LABEL_20:

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  sectionMapping = self->_sectionMapping;
  int64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "section"));
  BOOL v10 = [(NSDictionary *)sectionMapping objectForKey:v9];

  if (v10)
  {
    uint64_t v11 = [v10 unsignedIntegerValue];
    if (v11)
    {
      if (v11 != 1)
      {
        if (v11 == 2)
        {
          [(PKAddressSearchModel *)self->_searchModel endSearch];
          if (self->_identityVerificationController)
          {
            id v12 = 0;
          }
          else
          {
            id v24 = objc_alloc_init(MEMORY[0x1E4F1BA58]);
            v25 = [(UISearchBar *)self->_searchBar text];
            [v24 setStreet:v25];

            v26 = PKCurrentRegion();
            [v24 setISOCountryCode:v26];

            double v27 = [MEMORY[0x1E4F1CA20] currentLocale];
            double v28 = [v24 ISOCountryCode];
            v29 = PKLocalizedStringForCountryCode();

            [v24 setCountry:v29];
            double v30 = (void *)MEMORY[0x1E4F1BA20];
            double v31 = PKLocalizedPaymentString(&cfstr_InAppPaymentDe_0.isa);
            v32 = (void *)[v24 copy];
            v33 = [v30 labeledValueWithLabel:v31 value:v32];

            v34 = (void *)MEMORY[0x1E4F1B8F8];
            v39[0] = v33;
            objc_super v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
            id v12 = [v34 pkContactWithNameComponents:0 postalAddresses:v35 emailAddresses:0 phoneNumbers:0];
          }
          [(PKAddressSearcherViewController *)self _showAddressEditorWithContact:v12 withContactErrors:0];
        }
        goto LABEL_30;
      }
      id v14 = -[NSArray objectAtIndex:](self->_completionSearchResults, "objectAtIndex:", [v7 row]);
      [(PKAddressSearchModel *)self->_searchModel selectMapSearchCompletion:v14];
LABEL_29:

LABEL_30:
      [v6 deselectRowAtIndexPath:v7 animated:1];
      goto LABEL_31;
    }
    id v13 = -[NSArray objectAtIndex:](self->_contactsSearchResults, "objectAtIndex:", [v7 row]);
    id v14 = [v13 pkContactWithCleanedUpCountryCode];

    id v15 = [v14 postalAddresses];
    dispatch_time_t v16 = [v15 firstObject];

    id v17 = [v16 value];
    id v18 = [v17 ISOCountryCode];
    id v19 = (void *)[(PKContactFormatValidator *)self->_contactFormatValidator checkPostalAddressFormat:v17];
    if ([v18 length] == 2)
    {
      v37 = v16;
      if ([v18 caseInsensitiveCompare:@"cn"]
        || ([v17 subLocality],
            CGRect v20 = objc_claimAutoreleasedReturnValue(),
            uint64_t v21 = [v20 length],
            v20,
            v21))
      {
        if (!v19)
        {
          dispatch_time_t v16 = v37;
          if ([(PKAddressSearcherViewController *)self _validateContact:v14])
          {
            v36 = [(PKAddressSearcherViewController *)self delegate];
            [v36 addressSearcherViewController:self selectedContact:v14];

            dispatch_time_t v16 = v37;
            if (self->_identityVerificationController) {
              [(PKAddressSearcherViewController *)self _processNextViewController];
            }
          }
          goto LABEL_28;
        }
        v22 = PKLogFacilityTypeGetObject();
        dispatch_time_t v16 = v37;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v22, OS_LOG_TYPE_DEFAULT, "Selected address has invalid format", buf, 2u);
        }

        goto LABEL_26;
      }
      v23 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v23, OS_LOG_TYPE_DEFAULT, "Selected address was in China and missing a sublocality, redirecting to the edit flow for confirmation", buf, 2u);
      }
      dispatch_time_t v16 = v37;
    }
    else
    {
      v23 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v23, OS_LOG_TYPE_DEFAULT, "Unable to derive a country code, redirecting to the edit flow for confirmation", buf, 2u);
      }
    }

    if (!v19)
    {
LABEL_27:
      [(PKAddressSearcherViewController *)self _showAddressEditorWithContact:v14 withContactErrors:v19];

LABEL_28:
      goto LABEL_29;
    }
LABEL_26:
    id v19 = PKContactFormatErrorsFromShippingAddressFormatErrors();
    goto LABEL_27;
  }
LABEL_31:
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a4;
  [(PKAddressSearchModel *)self->_searchModel endSearch];
  if ([v5 length])
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F843D0]) initWithFullText:v5];
    [v6 setOutputKey:*MEMORY[0x1E4F1AF10]];
    [(PKAddressSearchModel *)self->_searchModel beginSearch:v6];
  }
  else
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__PKAddressSearcherViewController_searchBar_textDidChange___block_invoke;
    v7[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v8, &location);
    dispatch_async(MEMORY[0x1E4F14428], v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __59__PKAddressSearcherViewController_searchBar_textDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[147];
    WeakRetained[147] = 0;
    id v5 = WeakRetained;

    BOOL v3 = (void *)v5[148];
    v5[148] = 0;

    [v5 _updateSectionMapping];
    uint64_t v4 = [v5 tableView];
    [v4 reloadData];

    id WeakRetained = v5;
  }
}

- (void)mapSearchUpdated:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 completionSearchResults];
  id v5 = (void *)[v4 copy];

  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Map search updated: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__PKAddressSearcherViewController_mapSearchUpdated___block_invoke;
  v8[3] = &unk_1E59CB010;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __52__PKAddressSearcherViewController_mapSearchUpdated___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    objc_storeStrong(WeakRetained + 147, *(id *)(a1 + 32));
    [v4 _updateSectionMapping];
    BOOL v3 = [v4 tableView];
    [v3 reloadData];

    id WeakRetained = v4;
  }
}

- (void)contactsSearchUpdated:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 contactsSearchResults];
  id v5 = (void *)[v4 copy];

  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Contacts search updated: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__PKAddressSearcherViewController_contactsSearchUpdated___block_invoke;
  v8[3] = &unk_1E59CB010;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __57__PKAddressSearcherViewController_contactsSearchUpdated___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    objc_storeStrong(WeakRetained + 148, *(id *)(a1 + 32));
    [v4 _updateSectionMapping];
    BOOL v3 = [v4 tableView];
    [v3 reloadData];

    id WeakRetained = v4;
  }
}

- (void)selectedAddress:(id)a3 withError:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Selected address: %@", (uint8_t *)&v7, 0xCu);
  }

  [(PKAddressSearcherViewController *)self _showAddressEditorWithContact:v5 withContactErrors:0];
}

- (void)addressEditorViewController:(id)a3 selectedContact:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v7;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Editor inputted address: %@", (uint8_t *)&v10, 0xCu);
  }

  if ([(PKAddressSearcherViewController *)self _validateContact:v7])
  {
    uint64_t v9 = [(PKAddressSearcherViewController *)self delegate];
    [v9 addressSearcherViewController:self selectedContact:v7];
  }
}

- (void)addressEditorViewControllerDidCancel:(id)a3
{
  id v4 = [(PKAddressSearcherViewController *)self delegate];
  [v4 addressSearcherViewControllerDidCancel:self];
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  switch(self->_identityVerificationError)
  {
    case 2uLL:
      id v6 = PKLocalizedPaymentString(&cfstr_CouldNotConnec.isa);
      id v7 = PKLocalizedPaymentString(&cfstr_CouldNotConnec_0.isa);
      id v8 = PKDisplayableErrorCustom();

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      id v20[2] = __68__PKAddressSearcherViewController_explanationViewDidSelectContinue___block_invoke_104;
      v20[3] = &unk_1E59CA7D0;
      v20[4] = self;
      id v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, v20, 0);
      int v10 = [(PKAddressSearcherViewController *)self navigationController];
      [v10 presentViewController:v9 animated:1 completion:0];

      goto LABEL_8;
    case 3uLL:
      id v11 = [v4 dockView];
      [v11 setButtonsEnabled:0];

      uint64_t v12 = [v5 dockView];
      uint64_t v13 = [v12 primaryButton];
      [v13 setShowSpinner:1];

      id v14 = [v5 dockView];
      id v15 = [v14 footerView];
      [v15 setButtonsEnabled:0];

      [(PKAddressSearcherViewController *)self _processNextViewController];
      break;
    case 5uLL:
      id v8 = [(PKPeerPaymentIdentityVerificationController *)self->_identityVerificationController webService];
      dispatch_time_t v16 = [v8 peerPaymentService];
      id v9 = [v16 account];

      id v17 = objc_alloc_init(MEMORY[0x1E4F848A0]);
      id v18 = [[PKPeerPaymentAccountResolutionController alloc] initWithAccount:v9 webService:v8 context:[(PKPeerPaymentIdentityVerificationController *)self->_identityVerificationController context] delegate:self passLibraryDataProvider:v17];
      id v19 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, "Presenting contact apple support alert...", buf, 2u);
      }

      MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E70], 0);
      [(PKPeerPaymentAccountResolutionController *)v18 presentFlowForAccountResolution:3 configuration:0 completion:&__block_literal_global_129];

LABEL_8:
      break;
    default:
      [(PKAddressSearcherViewController *)self _terminateFlow];
      break;
  }
}

void __68__PKAddressSearcherViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = @"NO";
    if (a2) {
      id v4 = @"YES";
    }
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Presented contact apple support alert with success %@", (uint8_t *)&v5, 0xCu);
  }
}

uint64_t __68__PKAddressSearcherViewController_explanationViewDidSelectContinue___block_invoke_104(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCancelButtonTapped:0];
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
}

- (PKAddressSearcherViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKAddressSearcherViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)requiredKeys
{
  return self->_requiredKeys;
}

- (void)setRequiredKeys:(id)a3
{
}

- (PKContactFormatValidator)contactFormatValidator
{
  return self->_contactFormatValidator;
}

- (void)setContactFormatValidator:(id)a3
{
}

- (NSSet)supportedCountryCodes
{
  return self->_supportedCountryCodes;
}

- (void)setSupportedCountryCodes:(id)a3
{
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (BOOL)supportsSearchBarCancelButton
{
  return self->_supportsSearchBarCancelButton;
}

- (PKPeerPaymentIdentityVerificationController)identityVerificationController
{
  return self->_identityVerificationController;
}

- (void)setIdentityVerificationController:(id)a3
{
}

- (unint64_t)identityVerificationError
{
  return self->_identityVerificationError;
}

- (void)setIdentityVerificationError:(unint64_t)a3
{
  self->_identityVerificationError = a3;
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setSetupDelegate:(id)a3
{
}

- (UIView)headerContainerView
{
  return self->_headerContainerView;
}

- (void)setHeaderContainerView:(id)a3
{
}

- (PKTableHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
{
}

- (_UINavigationControllerPalette)palette
{
  return self->_palette;
}

- (void)setPalette:(id)a3
{
}

- (PKAddressSearchModel)searchModel
{
  return self->_searchModel;
}

- (void)setSearchModel:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (CNPostalAddress)selectedAddress
{
  return self->_selectedAddress;
}

- (void)setSelectedAddress:(id)a3
{
}

- (NSDictionary)sectionMapping
{
  return self->_sectionMapping;
}

- (void)setSectionMapping:(id)a3
{
}

- (NSArray)completionSearchResults
{
  return self->_completionSearchResults;
}

- (void)setCompletionSearchResults:(id)a3
{
}

- (NSArray)contactsSearchResults
{
  return self->_contactsSearchResults;
}

- (void)setContactsSearchResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsSearchResults, 0);
  objc_storeStrong((id *)&self->_completionSearchResults, 0);
  objc_storeStrong((id *)&self->_sectionMapping, 0);
  objc_storeStrong((id *)&self->_selectedAddress, 0);
  objc_storeStrong((id *)&self->_searchModel, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_headerContainerView, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_identityVerificationController, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_supportedCountryCodes, 0);
  objc_storeStrong((id *)&self->_contactFormatValidator, 0);
  objc_storeStrong((id *)&self->_requiredKeys, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end