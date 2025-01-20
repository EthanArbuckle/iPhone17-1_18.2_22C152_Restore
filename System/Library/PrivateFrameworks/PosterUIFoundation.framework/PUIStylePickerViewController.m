@interface PUIStylePickerViewController
- (BOOL)_shouldShowWeightSliderForSelectedFont;
- (NSArray)additionalFonts;
- (NSArray)centerBarButtonItems;
- (NSArray)dividerViews;
- (NSArray)layoutConstraints;
- (NSArray)leadingBarButtonItems;
- (NSArray)trailingBarButtonItems;
- (NSHashTable)observers;
- (NSURL)extensionBundleURL;
- (PUIFontPickerComponentViewController)fontPickerComponentViewController;
- (PUINumberingSystemPickerComponentViewController)numberingSystemPickerComponentViewController;
- (PUINumberingSystemPickerMenuController)numberingSystemPickerMenuController;
- (PUIStylePickerComponentViewController)stylePickerComponentViewController;
- (PUIStylePickerComponents)components;
- (PUIStylePickerConfiguration)stylePickerConfiguration;
- (PUIStylePickerHomeScreenComponentViewController)homeScreenComponentViewController;
- (PUIStylePickerViewController)initWithComponents:(id)a3 previewTextString:(id)a4;
- (PUIStylePickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PUIStylePickerViewController)initWithStylePickerConfiguration:(id)a3;
- (PUIStylePickerViewControllerDelegate)delegate;
- (PUITextAlignmentBarButtonItem)textAlignmentBarItem;
- (PUITextLayoutPickerComponentViewController)textLayoutPickerComponentViewController;
- (UIBarButtonItem)numberSystemBarItem;
- (UIStackView)rootStackView;
- (UIVisualEffectView)backgroundView;
- (double)contentsLuminance;
- (double)desiredDetent;
- (id)changeHandler;
- (id)componentViewControllers;
- (id)stylePickerComponentViewController:(id)a3 coordinatorForStyle:(id)a4 isSuggested:(BOOL)a5;
- (void)_closeButtonTapped:(id)a3;
- (void)_didPressTextAlignmentBarButtonItem:(id)a3;
- (void)_navigateHomeScreenColorPickerSlidersToColor:(id)a3;
- (void)_notifyChangeHandlersOfChange:(id)a3;
- (void)_notifyClientsOfChangedNumberingSystem:(id)a3;
- (void)_notifyClientsOfPickerConfigurationUpdate:(id)a3;
- (void)_notifyDelegateRespondingToSelector:(SEL)a3 handler:(id)a4;
- (void)_notifyObserversOfChangedDesiredDetent;
- (void)_notifyObserversRespondingToSelector:(SEL)a3 enumerator:(id)a4;
- (void)_refreshBarButtonItems;
- (void)_refreshComponentViewControllers;
- (void)_setupComponentViewControllersIfNeeded;
- (void)_signalDelegateDidFinish;
- (void)_signalDelegateWillFinish;
- (void)_updatePreferredContentSize;
- (void)_updateViews;
- (void)addObserver:(id)a3;
- (void)fontPickerComponentViewController:(id)a3 didChangeFontWeight:(double)a4;
- (void)fontPickerComponentViewController:(id)a3 didSelectItem:(id)a4;
- (void)homeScreenComponentViewController:(id)a3 didUpdateHomeScreenConfiguration:(id)a4;
- (void)loadView;
- (void)numberingSystemPickerMenuController:(id)a3 didSelectNumberingSystem:(id)a4;
- (void)numberingSystemPickerViewController:(id)a3 didSelectNumberingSystem:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setAdditionalFonts:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCenterBarButtonItems:(id)a3;
- (void)setChangeHandler:(id)a3;
- (void)setContentsLuminance:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDividerViews:(id)a3;
- (void)setExtensionBundleURL:(id)a3;
- (void)setFontPickerComponentViewController:(id)a3;
- (void)setHomeScreenComponentViewController:(id)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setLeadingBarButtonItems:(id)a3;
- (void)setNumberSystemBarItem:(id)a3;
- (void)setNumberingSystemPickerComponentViewController:(id)a3;
- (void)setNumberingSystemPickerMenuController:(id)a3;
- (void)setRootStackView:(id)a3;
- (void)setStylePickerComponentViewController:(id)a3;
- (void)setStylePickerConfiguration:(id)a3;
- (void)setTextAlignmentBarItem:(id)a3;
- (void)setTextLayoutPickerComponentViewController:(id)a3;
- (void)setTrailingBarButtonItems:(id)a3;
- (void)stylePickerComponentViewController:(id)a3 didSelectStyle:(id)a4 isSuggestedStyle:(BOOL)a5 userSelected:(BOOL)a6;
- (void)textLayoutPickerComponentViewController:(id)a3 didSelectTextLayout:(unint64_t)a4 userSelected:(BOOL)a5;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewLayoutMarginsDidChange;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PUIStylePickerViewController

- (PUIStylePickerViewController)initWithStylePickerConfiguration:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v7 = [v5 components];
    if ([v7 numberOfComponents])
    {
      v17.receiver = self;
      v17.super_class = (Class)PUIStylePickerViewController;
      v8 = [(PUIStylePickerViewController *)&v17 initWithNibName:0 bundle:0];
      if (v8)
      {
        [v6 defaultContentsLuminance];
        v8->_contentsLuminance = v9;
        uint64_t v10 = [v6 copy];
        stylePickerConfiguration = v8->_stylePickerConfiguration;
        v8->_stylePickerConfiguration = (PUIStylePickerConfiguration *)v10;

        uint64_t v12 = [MEMORY[0x263F088B0] weakObjectsHashTable];
        observers = v8->_observers;
        v8->_observers = (NSHashTable *)v12;
      }
      self = v8;
      v14 = self;
    }
    else
    {
      v14 = 0;
    }

    return v14;
  }
  else
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"stylePickerConfiguration"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      [(PUIStylePickerViewController *)a2 initWithStylePickerConfiguration:(uint64_t)v16];
    }
    [v16 UTF8String];
    result = (PUIStylePickerViewController *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (PUIStylePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = +[PUIStylePickerConfiguration defaultStylePickerConfigurationForRole:](PUIStylePickerConfiguration, "defaultStylePickerConfigurationForRole:", *MEMORY[0x263F5F460], a4);
  v6 = [(PUIStylePickerViewController *)self initWithStylePickerConfiguration:v5];

  return v6;
}

- (PUIStylePickerViewController)initWithComponents:(id)a3 previewTextString:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [PUIStylePickerConfiguration alloc];
  double v9 = [(PUIStylePickerConfiguration *)v8 initWithPreviewTextString:v6 defaultRole:*MEMORY[0x263F5F460] components:v7 defaultContentsLuminance:0 styleConfiguration:0 textLayoutConfiguration:0.5];

  uint64_t v10 = [(PUIStylePickerViewController *)self initWithStylePickerConfiguration:v9];
  return v10;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUIStylePickerViewController;
  [(PUIStylePickerViewController *)&v3 viewDidLayoutSubviews];
  [(PUIStylePickerViewController *)self _updatePreferredContentSize];
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PUIStylePickerViewController;
  [(PUIStylePickerViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(PUIStylePickerViewController *)self _updatePreferredContentSize];
}

- (void)viewLayoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PUIStylePickerViewController;
  [(PUIStylePickerViewController *)&v3 viewLayoutMarginsDidChange];
  [(PUIStylePickerViewController *)self _updatePreferredContentSize];
}

- (void)_updatePreferredContentSize
{
  id v9 = [(PUIStylePickerViewController *)self navigationController];
  if (v9)
  {
    objc_super v3 = [v9 navigationBar];
    [v3 frame];
    double v5 = v4;

    id v6 = [(PUIStylePickerViewController *)self rootStackView];
    [v6 bounds];
    objc_msgSend(v9, "setPreferredContentSize:", v8, v5 + v7 + -15.0);
  }
  [(PUIStylePickerViewController *)self _notifyObserversOfChangedDesiredDetent];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUIStylePickerViewController;
  [(PUIStylePickerViewController *)&v4 viewWillAppear:a3];
  self->_hasNotifiedDelegateOfDismissal = 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUIStylePickerViewController;
  [(PUIStylePickerViewController *)&v4 viewWillDisappear:a3];
  [(PUIStylePickerViewController *)self _signalDelegateWillFinish];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUIStylePickerViewController;
  [(PUIStylePickerViewController *)&v4 viewDidDisappear:a3];
  if (!self->_hasNotifiedDelegateOfDismissal) {
    [(PUIStylePickerViewController *)self _signalDelegateDidFinish];
  }
}

- (void)loadView
{
  v15[1] = *MEMORY[0x263EF8340];
  [(PUIStylePickerViewController *)self _setupComponentViewControllersIfNeeded];
  objc_super v3 = [(PUIStylePickerViewController *)self rootStackView];
  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C9B8]);
    objc_super v3 = (void *)[v4 initWithArrangedSubviews:MEMORY[0x263EFFA68]];
    [v3 setAxis:1];
    [v3 setSpacing:48.0];
    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUIStylePickerViewController *)self setRootStackView:v3];
  }
  double v5 = [(PUIStylePickerViewController *)self backgroundView];
  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F1CB98]);
    double v7 = [MEMORY[0x263F1C480] effectWithStyle:8];
    double v5 = (void *)[v6 initWithEffect:v7];

    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUIStylePickerViewController *)self setBackgroundView:v5];
  }
  if (![(PUIStylePickerViewController *)self isViewLoaded]
    || ([(PUIStylePickerViewController *)self view], (id v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v8 = objc_alloc_init(MEMORY[0x263F1CB60]);
    [(PUIStylePickerViewController *)self setView:v8];
  }
  [v8 addSubview:v5];
  [v8 addSubview:v3];
  [(PUIStylePickerViewController *)self _updateViews];
  [(PUIStylePickerViewController *)self _refreshComponentViewControllers];
  [(PUIStylePickerViewController *)self _refreshBarButtonItems];
  objc_initWeak(&location, self);
  id v9 = self;
  v15[0] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __40__PUIStylePickerViewController_loadView__block_invoke;
  v12[3] = &unk_265470FD8;
  objc_copyWeak(&v13, &location);
  id v11 = (id)[(PUIStylePickerViewController *)self registerForTraitChanges:v10 withHandler:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __40__PUIStylePickerViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v2 = [WeakRetained numberSystemBarItem];
    objc_super v3 = [v5 numberingSystemPickerMenuController];
    id v4 = [v3 menu];
    [v2 setMenu:v4];

    id WeakRetained = v5;
  }
}

- (double)desiredDetent
{
  [(PUIStylePickerViewController *)self _refreshComponentViewControllers];
  [(PUIStylePickerViewController *)self additionalSafeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(PUIStylePickerViewController *)self stylePickerConfiguration];
  id v8 = [v7 components];
  if ([v8 containsComponent:1])
  {
    id v9 = [(PUIStylePickerViewController *)self fontPickerComponentViewController];
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  if ([v8 containsComponent:8])
  {
    id v11 = [(PUIStylePickerViewController *)self textLayoutPickerComponentViewController];
    BOOL v12 = v11 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  if ([v8 containsComponent:4])
  {
    id v13 = [(PUIStylePickerViewController *)self stylePickerComponentViewController];
    BOOL v14 = v13 != 0;
  }
  else
  {
    BOOL v14 = 0;
  }
  if ([v8 containsComponent:2])
  {
    v15 = [(PUIStylePickerViewController *)self numberingSystemPickerComponentViewController];
    BOOL v16 = v15 != 0;
  }
  else
  {
    BOOL v16 = 0;
  }
  if ([v8 containsComponent:32])
  {
    objc_super v17 = [(PUIStylePickerViewController *)self homeScreenComponentViewController];
    BOOL v18 = v17 != 0;
  }
  else
  {
    BOOL v18 = 0;
  }
  double v19 = v4 + v6;
  if (v16)
  {
    v20 = [(PUIStylePickerViewController *)self numberingSystemPickerComponentViewController];
    [v20 estimatedHeight];
    double v19 = v19 + v21;

    uint64_t v22 = 1;
    if (!v10) {
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v22 = 0;
    if (!v10) {
      goto LABEL_22;
    }
  }
  v23 = [(PUIStylePickerViewController *)self fontPickerComponentViewController];
  [v23 estimatedHeight];
  double v19 = v19 + v24;

  ++v22;
  if (v14) {
    double v19 = v19 + 48.0;
  }
LABEL_22:
  if (!v12)
  {
    if (!v14) {
      goto LABEL_24;
    }
LABEL_33:
    v35 = [(PUIStylePickerViewController *)self stylePickerComponentViewController];
    [v35 estimatedHeight];
    double v19 = v19 + v36;

    ++v22;
    if (!v18) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  v33 = [(PUIStylePickerViewController *)self textLayoutPickerComponentViewController];
  [v33 estimatedHeight];
  double v19 = v19 + v34;

  ++v22;
  if (v14) {
    goto LABEL_33;
  }
LABEL_24:
  if (v18)
  {
LABEL_25:
    v25 = [(PUIStylePickerViewController *)self homeScreenComponentViewController];
    [v25 estimatedHeight];
    double v19 = v19 + v26;

    uint64_t v22 = 1;
  }
LABEL_26:
  v27 = [(PUIStylePickerViewController *)self navigationController];

  [v7 edgeInsets];
  if (v31 == *(double *)(MEMORY[0x263F1C228] + 8)
    && v28 == *MEMORY[0x263F1C228]
    && v30 == *(double *)(MEMORY[0x263F1C228] + 24))
  {
    double v32 = v28 + v29;
    if (v29 == *(double *)(MEMORY[0x263F1C228] + 16)) {
      double v32 = -0.0;
    }
  }
  else
  {
    double v32 = v28 + v29;
  }
  double v37 = v19 + 100.0;
  if (v22) {
    double v37 = v19;
  }
  if (v27) {
    double v37 = v37 + 44.0;
  }
  double v38 = v37 + v32;

  return v38;
}

- (BOOL)_shouldShowWeightSliderForSelectedFont
{
  double v3 = [(PUIStylePickerViewController *)self stylePickerConfiguration];
  double v4 = [v3 textLayoutConfiguration];
  double v5 = [v4 fontConfiguration];

  double v6 = [(PUIStylePickerViewController *)self extensionBundleURL];
  double v7 = [v5 PUIFontWithExtensionBundleURL:v6];

  if ([v5 isSystemItem])
  {
    id v8 = [v7 fontIdentifier];
    int v9 = [v8 isEqual:@"PRTimeFontIdentifierRail"] ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)setContentsLuminance:(double)a3
{
  if ((BSEqualDoubles() & 1) == 0)
  {
    self->_contentsLuminance = a3;
    double v5 = [(PUIStylePickerViewController *)self stylePickerComponentViewController];

    if (v5)
    {
      id v6 = [(PUIStylePickerViewController *)self stylePickerComponentViewController];
      [v6 setContentsLuminance:a3];
    }
  }
}

- (void)setTrailingBarButtonItems:(id)a3
{
  id v6 = a3;
  if ((-[NSArray isEqual:](self->_trailingBarButtonItems, "isEqual:") & 1) == 0)
  {
    double v4 = (NSArray *)[v6 copy];
    trailingBarButtonItems = self->_trailingBarButtonItems;
    self->_trailingBarButtonItems = v4;

    [(PUIStylePickerViewController *)self _refreshBarButtonItems];
  }
}

- (void)setLeadingBarButtonItems:(id)a3
{
  id v6 = a3;
  if ((-[NSArray isEqual:](self->_leadingBarButtonItems, "isEqual:") & 1) == 0)
  {
    double v4 = (NSArray *)[v6 copy];
    leadingBarButtonItems = self->_leadingBarButtonItems;
    self->_leadingBarButtonItems = v4;

    [(PUIStylePickerViewController *)self _refreshBarButtonItems];
  }
}

- (void)setCenterBarButtonItems:(id)a3
{
  id v6 = a3;
  if ((-[NSArray isEqual:](self->_centerBarButtonItems, "isEqual:") & 1) == 0)
  {
    double v4 = (NSArray *)[v6 copy];
    centerBarButtonItems = self->_centerBarButtonItems;
    self->_centerBarButtonItems = v4;

    [(PUIStylePickerViewController *)self _refreshBarButtonItems];
  }
}

- (void)fontPickerComponentViewController:(id)a3 didChangeFontWeight:(double)a4
{
  id v6 = [(PUIStylePickerViewController *)self stylePickerConfiguration];
  double v7 = [v6 textLayoutConfiguration];
  id v8 = [v7 fontConfiguration];
  int v9 = [(PUIStylePickerViewController *)self extensionBundleURL];
  BOOL v10 = [v8 PUIFontWithExtensionBundleURL:v9];

  id v11 = [v6 defaultRole];
  BOOL v12 = [v10 effectiveFontForRole:v11 ignoringWeight:1];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __86__PUIStylePickerViewController_fontPickerComponentViewController_didChangeFontWeight___block_invoke;
  v14[3] = &unk_265471F18;
  id v15 = v12;
  double v16 = a4;
  id v13 = v12;
  [(PUIStylePickerViewController *)self _notifyChangeHandlersOfChange:v14];
}

void __86__PUIStylePickerViewController_fontPickerComponentViewController_didChangeFontWeight___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  unint64_t v5 = objc_msgSend(v3, "pui_variantWeightRange");
  id v7 = [NSNumber numberWithDouble:*(double *)(a1 + 40) * (double)v6 + (1.0 - *(double *)(a1 + 40)) * (double)v5];
  [v4 setFontWeight:v7];
}

- (void)fontPickerComponentViewController:(id)a3 didSelectItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUIStylePickerViewController *)self stylePickerConfiguration];
  int v9 = [v8 defaultRole];
  BOOL v10 = [(PUIStylePickerViewController *)self numberingSystemPickerMenuController];
  id v11 = [(PUIStylePickerViewController *)self numberSystemBarItem];
  BOOL v12 = [v7 font];
  id v13 = [v12 effectiveFontForRole:v9];

  [v10 setFont:v13];
  BOOL v14 = [(PUIStylePickerViewController *)self numberingSystemPickerMenuController];
  id v15 = [v14 menu];

  [v11 setMenu:v15];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __80__PUIStylePickerViewController_fontPickerComponentViewController_didSelectItem___block_invoke;
  v19[3] = &unk_265471F40;
  v19[4] = self;
  id v20 = v7;
  id v21 = v13;
  id v22 = v6;
  id v16 = v6;
  id v17 = v13;
  id v18 = v7;
  [(PUIStylePickerViewController *)self _notifyChangeHandlersOfChange:v19];
}

void __80__PUIStylePickerViewController_fontPickerComponentViewController_didSelectItem___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  unint64_t v5 = [v3 additionalFonts];
  id v6 = [*(id *)(a1 + 40) font];
  int v7 = [v5 containsObject:v6];

  id v8 = [*(id *)(a1 + 40) font];
  id v20 = [v8 fontIdentifier];

  if ((v7 & 1) != 0 || v20 == @"PRTimeFontIdentifierRail")
  {
    id v15 = [*(id *)(a1 + 40) font];
    [v15 weight];
    double v13 = v16;

    if (!v7) {
      goto LABEL_4;
    }
  }
  else
  {
    unint64_t v9 = objc_msgSend(*(id *)(a1 + 48), "pui_variantWeightRange");
    unint64_t v11 = v10;
    [*(id *)(a1 + 56) fontWeight];
    double v13 = v12 * (double)v11 + (1.0 - v12) * (double)v9;
    if (!v7)
    {
LABEL_4:
      BOOL v14 = 0;
      goto LABEL_7;
    }
  }
  BOOL v14 = *(void **)(a1 + 48);
LABEL_7:
  id v17 = v14;
  [v4 setFontIdentifier:v20];
  id v18 = [NSNumber numberWithDouble:v13];
  [v4 setFontWeight:v18];

  double v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isSystemItem"));
  [v4 setSystemItem:v19];

  [v4 setCustomFont:v17];
}

- (void)textLayoutPickerComponentViewController:(id)a3 didSelectTextLayout:(unint64_t)a4 userSelected:(BOOL)a5
{
  unint64_t v5 = a4;
  int v7 = [(PUIStylePickerViewController *)self stylePickerConfiguration];
  id v8 = [v7 previewTextString];

  unint64_t v9 = +[PUITextLayoutConfiguration maximumVerticalTextCharacters];
  if (PUITextLayoutIsVertical(v5) && [v8 length] > v9)
  {
    unint64_t v10 = NSString;
    unint64_t v11 = PUIBundle();
    double v12 = [v11 localizedStringForKey:@"CANNOT_CHANGE_LAYOUT_EXPLANATION" value:&stru_270801C00 table:0];
    double v13 = objc_msgSend(v10, "stringWithFormat:", v12, v9);

    BOOL v14 = (void *)MEMORY[0x263F1C3F8];
    id v15 = PUIBundle();
    double v16 = [v15 localizedStringForKey:@"CANNOT_CHANGE_LAYOUT" value:&stru_270801C00 table:0];
    id v17 = [v14 alertControllerWithTitle:v16 message:v13 preferredStyle:1];

    id v18 = (void *)MEMORY[0x263F1C3F0];
    double v19 = PUIBundle();
    id v20 = [v19 localizedStringForKey:@"CANNOT_CHANGE_LAYOUT_DISMISS_ACTION" value:&stru_270801C00 table:0];
    id v21 = [v18 actionWithTitle:v20 style:0 handler:0];

    [v17 addAction:v21];
    [(PUIStylePickerViewController *)self presentViewController:v17 animated:1 completion:0];

    unint64_t v5 = 0;
  }
  id v22 = [(PUIStylePickerViewController *)self textLayoutPickerComponentViewController];
  [v22 setSelectedLayout:v5];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __105__PUIStylePickerViewController_textLayoutPickerComponentViewController_didSelectTextLayout_userSelected___block_invoke;
  v23[3] = &__block_descriptor_40_e39_v16__0__PUIStylePickerSelectionChange_8l;
  v23[4] = v5;
  [(PUIStylePickerViewController *)self _notifyChangeHandlersOfChange:v23];
}

void __105__PUIStylePickerViewController_textLayoutPickerComponentViewController_didSelectTextLayout_userSelected___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 numberWithUnsignedInteger:v3];
  [v4 setPreferredLayout:v5];
}

- (void)numberingSystemPickerMenuController:(id)a3 didSelectNumberingSystem:(id)a4
{
}

- (void)numberingSystemPickerViewController:(id)a3 didSelectNumberingSystem:(id)a4
{
}

- (void)stylePickerComponentViewController:(id)a3 didSelectStyle:(id)a4 isSuggestedStyle:(BOOL)a5 userSelected:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  unint64_t v10 = v9;
  if (v6)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __112__PUIStylePickerViewController_stylePickerComponentViewController_didSelectStyle_isSuggestedStyle_userSelected___block_invoke;
    v11[3] = &unk_265471F88;
    id v12 = v9;
    BOOL v13 = a5;
    [(PUIStylePickerViewController *)self _notifyChangeHandlersOfChange:v11];
  }
}

void __112__PUIStylePickerViewController_stylePickerComponentViewController_didSelectStyle_isSuggestedStyle_userSelected___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setStyle:v3];
  id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [v4 setSuggestedStyle:v5];
}

- (id)stylePickerComponentViewController:(id)a3 coordinatorForStyle:(id)a4 isSuggested:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__1;
  id v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __99__PUIStylePickerViewController_stylePickerComponentViewController_coordinatorForStyle_isSuggested___block_invoke;
  v13[3] = &unk_265471FB0;
  id v15 = &v17;
  v13[4] = self;
  id v10 = v9;
  id v14 = v10;
  BOOL v16 = a5;
  [(PUIStylePickerViewController *)self _notifyDelegateRespondingToSelector:sel_stylePickerViewController_coordinatorForStyle_isSuggested_ handler:v13];
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __99__PUIStylePickerViewController_stylePickerComponentViewController_coordinatorForStyle_isSuggested___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 stylePickerViewController:*(void *)(a1 + 32) coordinatorForStyle:*(void *)(a1 + 40) isSuggested:*(unsigned __int8 *)(a1 + 56)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v3;
  return MEMORY[0x270F9A758](v3);
}

- (void)homeScreenComponentViewController:(id)a3 didUpdateHomeScreenConfiguration:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __99__PUIStylePickerViewController_homeScreenComponentViewController_didUpdateHomeScreenConfiguration___block_invoke;
  v7[3] = &unk_265471FD8;
  id v8 = v5;
  id v6 = v5;
  [(PUIStylePickerViewController *)self _notifyClientsOfPickerConfigurationUpdate:v7];
}

uint64_t __99__PUIStylePickerViewController_homeScreenComponentViewController_didUpdateHomeScreenConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHomeScreenConfiguration:*(void *)(a1 + 32)];
}

- (void)addObserver:(id)a3
{
  if (a3) {
    -[NSHashTable addObject:](self->_observers, "addObject:");
  }
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (void)_notifyDelegateRespondingToSelector:(SEL)a3 handler:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  if (v5)
  {
    int v7 = v5;
    id v6 = [(PUIStylePickerViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      v7[2](v7, v6);
    }

    id v5 = v7;
  }
}

- (void)_notifyObserversRespondingToSelector:(SEL)a3 enumerator:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(id, uint64_t, char *))a4;
  if (v5)
  {
    id v6 = [(PUIStylePickerViewController *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) == 0 || (char v17 = 0, v5[2](v5, (uint64_t)v6, &v17), !v17))
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      int v7 = [(PUIStylePickerViewController *)self observers];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
LABEL_6:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector())
          {
            char v17 = 0;
            v5[2](v5, v12, &v17);
            if (v17) {
              break;
            }
          }
          if (v9 == ++v11)
          {
            uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
            if (v9) {
              goto LABEL_6;
            }
            break;
          }
        }
      }
    }
  }
}

- (void)_notifyChangeHandlersOfChange:(id)a3
{
  id v4 = (void (**)(id, PUIStylePickerSelectionChange *))a3;
  id v5 = [(PUIStylePickerViewController *)self changeHandler];
  id v6 = objc_alloc_init(PUIStylePickerSelectionChange);
  v4[2](v4, v6);

  if ([(PUIStylePickerSelectionChange *)v6 hasChanges])
  {
    if (v5) {
      ((void (**)(void, PUIStylePickerSelectionChange *))v5)[2](v5, v6);
    }
    int v7 = [(PUIStylePickerViewController *)self stylePickerConfiguration];
    uint64_t v8 = [(PUIStylePickerSelectionChange *)v6 fontIdentifier];
    uint64_t v9 = [(PUIStylePickerSelectionChange *)v6 preferredAlignment];
    uint64_t v10 = [(PUIStylePickerSelectionChange *)v6 preferredLayout];
    uint64_t v11 = [(PUIStylePickerSelectionChange *)v6 fontWeight];
    uint64_t v12 = [(PUIStylePickerSelectionChange *)v6 customFont];
    uint64_t v13 = [(PUIStylePickerSelectionChange *)v6 numberingSystem];
    uint64_t v14 = [(PUIStylePickerSelectionChange *)v6 isSystemItem];
    v46 = (void *)v13;
    v47 = (void *)v12;
    v43 = v11;
    v44 = v10;
    v45 = (void *)v14;
    if (v9 || v10 || v13 || v8 || v11 || v12 || v14)
    {
      long long v16 = [v7 textLayoutConfiguration];
      long long v15 = (void *)[v16 mutableCopy];

      if (v8 || v11 || v47 || v45)
      {
        if (v47)
        {
          v39 = [PUICustomFontConfiguration alloc];
          char v17 = (void *)MEMORY[0x263F086E0];
          id v18 = [(PUIStylePickerViewController *)self extensionBundleURL];
          uint64_t v19 = [v17 bundleWithURL:v18];
          id v20 = [(PUICustomFontConfiguration *)v39 initWithFont:v47 extensionBundle:v19];

          uint64_t v10 = v44;
        }
        else
        {
          id v21 = [PUISystemFontConfiguration alloc];
          objc_msgSend(v11, "bs_CGFloatValue");
          id v20 = -[PUISystemFontConfiguration initWithFontIdentifier:weight:systemItem:](v21, "initWithFontIdentifier:weight:systemItem:", v8, [v45 BOOLValue], v22);
        }
        [v15 setFontConfiguration:v20];
      }
      if (v10) {
        objc_msgSend(v15, "setPreferredLayout:", objc_msgSend(v10, "unsignedIntegerValue"));
      }
      if (v9) {
        objc_msgSend(v15, "setPreferredAlignment:", objc_msgSend(v9, "unsignedIntegerValue"));
      }
      if (v46)
      {
        v23 = [v46 type];
        [v15 setNumberingSystemType:v23];
      }
    }
    else
    {
      long long v15 = 0;
    }
    uint64_t v24 = [(PUIStylePickerSelectionChange *)v6 style];
    uint64_t v25 = [(PUIStylePickerSelectionChange *)v6 isSuggestedStyle];
    double v26 = (void *)v25;
    if (!(v24 | v25))
    {
      double v30 = 0;
LABEL_39:
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __62__PUIStylePickerViewController__notifyChangeHandlersOfChange___block_invoke;
      v48[3] = &unk_265472000;
      id v49 = v30;
      id v50 = v15;
      id v37 = v15;
      id v38 = v30;
      [(PUIStylePickerViewController *)self _notifyClientsOfPickerConfigurationUpdate:v48];

      goto LABEL_40;
    }
    v41 = v8;
    v42 = v5;
    v40 = v9;
    if (v25
      && ([v7 styleConfiguration],
          v27 = objc_claimAutoreleasedReturnValue(),
          [v27 suggestedStyle],
          double v28 = objc_claimAutoreleasedReturnValue(),
          char v29 = [v28 isEqual:v24],
          v28,
          v27,
          (v29 & 1) == 0))
    {
      double v31 = [v7 styleConfiguration];
      double v30 = (void *)[v31 mutableCopy];

      [v30 setSuggestedStyle:v24];
      if (!v24)
      {
LABEL_35:
        uint64_t v8 = v41;
        id v5 = v42;
        uint64_t v9 = v40;
        goto LABEL_39;
      }
    }
    else
    {
      double v30 = 0;
      if (!v24) {
        goto LABEL_35;
      }
    }
    double v32 = v7;
    v33 = [v7 styleConfiguration];
    double v34 = [v33 selectedStyle];
    char v35 = [v34 isEqual:v24];

    if ((v35 & 1) == 0)
    {
      int v7 = v32;
      uint64_t v9 = v40;
      uint64_t v8 = v41;
      if (!v30)
      {
        double v36 = [v32 styleConfiguration];
        double v30 = (void *)[v36 mutableCopy];

        uint64_t v9 = v40;
      }
      [v30 setSelectedStyle:v24];
      id v5 = v42;
      goto LABEL_39;
    }
    int v7 = v32;
    goto LABEL_35;
  }
LABEL_40:
}

void __62__PUIStylePickerViewController__notifyChangeHandlersOfChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(v3, "setStyleConfiguration:");
    id v3 = v4;
  }
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(v4, "setTextLayoutConfiguration:");
    id v3 = v4;
  }
}

- (void)_notifyClientsOfPickerConfigurationUpdate:(id)a3
{
  if (a3)
  {
    id v4 = (void (**)(id, void *))a3;
    id v5 = [(PUIStylePickerViewController *)self stylePickerConfiguration];
    id v6 = (void *)[v5 mutableCopy];
    v4[2](v4, v6);

    int v7 = objc_opt_new();
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __74__PUIStylePickerViewController__notifyClientsOfPickerConfigurationUpdate___block_invoke;
    v32[3] = &unk_2654712C8;
    id v8 = v7;
    id v33 = v8;
    double v34 = self;
    id v9 = v6;
    id v35 = v9;
    uint64_t v10 = (void (**)(void))MEMORY[0x25A2F6090](v32);
    uint64_t v11 = [v5 textLayoutConfiguration];
    uint64_t v12 = [v9 textLayoutConfiguration];
    char v13 = [v11 isEqual:v12];

    if ((v13 & 1) == 0)
    {
      v10[2](v10);
      uint64_t v14 = [v9 textLayoutConfiguration];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __74__PUIStylePickerViewController__notifyClientsOfPickerConfigurationUpdate___block_invoke_2;
      v30[3] = &unk_265472028;
      v30[4] = self;
      id v31 = v14;
      id v15 = v14;
      [(PUIStylePickerViewController *)self _notifyObserversRespondingToSelector:sel_stylePickerViewController_didUpdateStyleConfiguration_ enumerator:v30];
    }
    long long v16 = [v5 styleConfiguration];
    char v17 = [v9 styleConfiguration];
    char v18 = [v16 isEqual:v17];

    if ((v18 & 1) == 0)
    {
      v10[2](v10);
      uint64_t v19 = [v9 styleConfiguration];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __74__PUIStylePickerViewController__notifyClientsOfPickerConfigurationUpdate___block_invoke_3;
      v28[3] = &unk_265472028;
      v28[4] = self;
      id v29 = v19;
      id v20 = v19;
      [(PUIStylePickerViewController *)self _notifyObserversRespondingToSelector:sel_stylePickerViewController_didUpdateStyleConfiguration_ enumerator:v28];
    }
    id v21 = [v5 homeScreenConfiguration];
    double v22 = [v9 homeScreenConfiguration];
    char v23 = [v21 isEqual:v22];

    if ((v23 & 1) == 0)
    {
      v10[2](v10);
      uint64_t v24 = [v9 homeScreenConfiguration];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __74__PUIStylePickerViewController__notifyClientsOfPickerConfigurationUpdate___block_invoke_4;
      v26[3] = &unk_265472050;
      v26[4] = self;
      id v27 = v24;
      id v25 = v24;
      [(PUIStylePickerViewController *)self _notifyObserversRespondingToSelector:sel_stylePickerViewController_didUpdateHomeScreenConfiguration_ enumerator:v26];
    }
  }
}

void __74__PUIStylePickerViewController__notifyClientsOfPickerConfigurationUpdate___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) signal])
  {
    v2 = *(void **)(a1 + 40);
    id v3 = (id)[*(id *)(a1 + 48) copy];
    [v2 setStylePickerConfiguration:v3];
  }
}

uint64_t __74__PUIStylePickerViewController__notifyClientsOfPickerConfigurationUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 stylePickerViewController:*(void *)(a1 + 32) didUpdateTextLayoutConfiguration:*(void *)(a1 + 40)];
}

uint64_t __74__PUIStylePickerViewController__notifyClientsOfPickerConfigurationUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 stylePickerViewController:*(void *)(a1 + 32) didUpdateStyleConfiguration:*(void *)(a1 + 40)];
}

uint64_t __74__PUIStylePickerViewController__notifyClientsOfPickerConfigurationUpdate___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 stylePickerViewController:*(void *)(a1 + 32) didUpdateHomeScreenConfiguration:*(void *)(a1 + 40)];
}

- (void)_notifyObserversOfChangedDesiredDetent
{
  [(PUIStylePickerViewController *)self desiredDetent];
  if (v3 != self->_lastNotifiedDetent)
  {
    self->_lastNotifiedDetent = v3;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __70__PUIStylePickerViewController__notifyObserversOfChangedDesiredDetent__block_invoke;
    v4[3] = &unk_265472078;
    v4[4] = self;
    *(double *)&v4[5] = v3;
    [(PUIStylePickerViewController *)self _notifyDelegateRespondingToSelector:sel_stylePickerViewController_didUpdateDesiredDetent_ handler:v4];
  }
}

uint64_t __70__PUIStylePickerViewController__notifyObserversOfChangedDesiredDetent__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stylePickerViewController:*(void *)(a1 + 32) didUpdateDesiredDetent:*(double *)(a1 + 40)];
}

- (void)_closeButtonTapped:(id)a3
{
  [(PUIStylePickerViewController *)self _signalDelegateDidFinish];
  [(PUIStylePickerViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_signalDelegateWillFinish
{
  self->_hasNotifiedDelegateOfImpendingDismissal = 1;
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __57__PUIStylePickerViewController__signalDelegateWillFinish__block_invoke;
  v2[3] = &unk_2654720A0;
  v2[4] = self;
  [(PUIStylePickerViewController *)self _notifyDelegateRespondingToSelector:sel_stylePickerViewControllerWillFinish_ handler:v2];
}

uint64_t __57__PUIStylePickerViewController__signalDelegateWillFinish__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stylePickerViewControllerWillFinish:*(void *)(a1 + 32)];
}

- (void)_signalDelegateDidFinish
{
  if (!self->_hasNotifiedDelegateOfImpendingDismissal) {
    [(PUIStylePickerViewController *)self _signalDelegateWillFinish];
  }
  self->_hasNotifiedDelegateOfDismissal = 1;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__PUIStylePickerViewController__signalDelegateDidFinish__block_invoke;
  v3[3] = &unk_2654720A0;
  v3[4] = self;
  [(PUIStylePickerViewController *)self _notifyDelegateRespondingToSelector:sel_stylePickerViewControllerDidFinish_ handler:v3];
}

uint64_t __56__PUIStylePickerViewController__signalDelegateDidFinish__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stylePickerViewControllerDidFinish:*(void *)(a1 + 32)];
}

- (void)_didPressTextAlignmentBarButtonItem:(id)a3
{
  id v4 = [(PUIStylePickerViewController *)self textAlignmentBarItem];
  uint64_t v5 = [v4 toggle];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__PUIStylePickerViewController__didPressTextAlignmentBarButtonItem___block_invoke;
  v6[3] = &__block_descriptor_40_e39_v16__0__PUIStylePickerSelectionChange_8l;
  v6[4] = v5;
  [(PUIStylePickerViewController *)self _notifyChangeHandlersOfChange:v6];
}

void __68__PUIStylePickerViewController__didPressTextAlignmentBarButtonItem___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 numberWithUnsignedInteger:v3];
  [v4 setPreferredAlignment:v5];
}

- (void)_notifyClientsOfChangedNumberingSystem:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[PUINumberingSystem systemDefaultNumberingSystem];
  }
  id v5 = [(PUIStylePickerViewController *)self fontPickerComponentViewController];
  if (v5)
  {
    id v6 = [v4 locale];
    [v5 setLocale:v6];
  }
  int v7 = [(PUIStylePickerViewController *)self numberingSystemPickerMenuController];
  uint64_t v8 = [(PUIStylePickerViewController *)self numberSystemBarItem];
  id v9 = (void *)v8;
  if (v7 && v8)
  {
    uint64_t v10 = [v7 menu];
    [v9 setMenu:v10];
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__PUIStylePickerViewController__notifyClientsOfChangedNumberingSystem___block_invoke;
  v12[3] = &unk_2654720C8;
  id v13 = v4;
  id v11 = v4;
  [(PUIStylePickerViewController *)self _notifyChangeHandlersOfChange:v12];
}

uint64_t __71__PUIStylePickerViewController__notifyClientsOfChangedNumberingSystem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setNumberingSystem:*(void *)(a1 + 32)];
}

- (void)_setupComponentViewControllersIfNeeded
{
  uint64_t v3 = [(PUIStylePickerViewController *)self stylePickerConfiguration];
  id v4 = [v3 components];
  id v5 = [v3 defaultRole];
  v80 = [v3 previewTextString];
  v77 = [v3 styleConfiguration];
  id v6 = [v3 textLayoutConfiguration];
  [(PUIStylePickerViewController *)self contentsLuminance];
  double v8 = v7;
  int v9 = [v4 containsComponent:2];
  int v10 = [v4 containsComponent:4];
  int v11 = [v4 containsComponent:1];
  int v74 = [v4 containsComponent:16];
  int v12 = [v4 containsComponent:8];
  int v75 = [v4 containsComponent:32];
  uint64_t v13 = [(PUIStylePickerViewController *)self extensionBundleURL];
  v79 = (void *)v13;
  if (v13)
  {
    v76 = [v6 effectiveFontWithExtensionBundleURL:v13 forRole:v5];
  }
  else
  {
    v76 = 0;
  }
  v78 = [(PUIStylePickerViewController *)self delegate];
  if (v11)
  {
    int v69 = v9;
    v73 = v6;
    uint64_t v14 = +[PUIFontPickerComponentViewController defaultItemsForRole:v5 text:v80];
    int v70 = v12;
    int v71 = v10;
    if (v5
      && ([v5 isEqualToString:*MEMORY[0x263F5F458]] & 1) == 0
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v15 = [v78 additionalFontsForStylePickerViewController:self];
      [(PUIStylePickerViewController *)self setAdditionalFonts:v15];
      long long v16 = objc_msgSend(v15, "bs_map:", &__block_literal_global_27);
      uint64_t v17 = [v14 arrayByAddingObjectsFromArray:v16];

      int v12 = v70;
      uint64_t v14 = (void *)v17;
    }
    else
    {
      [(PUIStylePickerViewController *)self setAdditionalFonts:0];
    }
    if (objc_opt_respondsToSelector())
    {
      v89[0] = MEMORY[0x263EF8330];
      v89[1] = 3221225472;
      v89[2] = __70__PUIStylePickerViewController__setupComponentViewControllersIfNeeded__block_invoke_2;
      v89[3] = &unk_265472110;
      id v90 = v78;
      v91 = self;
      uint64_t v18 = objc_msgSend(v14, "bs_filter:", v89);

      uint64_t v14 = (void *)v18;
    }
    uint64_t v19 = [v6 fontConfiguration];
    id v20 = [v19 PUIFontWithExtensionBundleURL:v79];
    id v21 = [v20 customFont];

    v68 = v20;
    if (v21)
    {
      double v22 = [v20 customFont];
      v87[0] = MEMORY[0x263EF8330];
      v87[1] = 3221225472;
      v87[2] = __70__PUIStylePickerViewController__setupComponentViewControllersIfNeeded__block_invoke_3;
      v87[3] = &unk_265472138;
      id v88 = v22;
      id v23 = v22;
      uint64_t v24 = objc_msgSend(v14, "bs_firstObjectPassingTest:", v87);
    }
    else
    {
      v84[0] = MEMORY[0x263EF8330];
      v84[1] = 3221225472;
      v84[2] = __70__PUIStylePickerViewController__setupComponentViewControllersIfNeeded__block_invoke_4;
      v84[3] = &unk_265472110;
      id v25 = v20;
      id v85 = v25;
      double v26 = v19;
      id v27 = v19;
      id v86 = v27;
      uint64_t v24 = objc_msgSend(v14, "bs_firstObjectPassingTest:", v84);
      if (!v24)
      {
        v81[0] = MEMORY[0x263EF8330];
        v81[1] = 3221225472;
        v81[2] = __70__PUIStylePickerViewController__setupComponentViewControllersIfNeeded__block_invoke_5;
        v81[3] = &unk_265472110;
        id v82 = v25;
        id v83 = v27;
        uint64_t v24 = objc_msgSend(v14, "bs_firstObjectPassingTest:", v81);
      }
      id v23 = v85;
      int v12 = v70;
      uint64_t v19 = v26;
    }

    unint64_t v28 = [v14 count];
    BOOL v29 = [(PUIStylePickerViewController *)self _shouldShowWeightSliderForSelectedFont];
    int v30 = v28 > 1 || v29;
    int v72 = v30;
    int v10 = v71;
    if (v30 == 1)
    {
      v67 = v3;
      id v31 = v5;
      double v32 = [(PUIStylePickerViewController *)self fontPickerComponentViewController];
      if (!v32)
      {
        double v32 = [[PUIFontPickerComponentViewController alloc] initWithItems:v14 selectedItem:v24 role:v31 titleString:v80];
        [(PUIFontPickerComponentViewController *)v32 setDelegate:self];
        [(PUIStylePickerViewController *)self setFontPickerComponentViewController:v32];
      }
      id v33 = [v73 fontConfiguration];
      double v34 = [(PUIStylePickerViewController *)self extensionBundleURL];
      [v33 PUIFontWithExtensionBundleURL:v34];
      id v35 = v66 = v24;

      double v36 = [v35 effectiveFontForRole:v31 ignoringWeight:1];
      unint64_t v37 = objc_msgSend(v36, "pui_variantWeightRange");
      id v38 = v14;
      unint64_t v40 = v39;
      [v35 weight];
      [(PUIFontPickerComponentViewController *)v32 setFontWeight:(v41 - (double)v37) / ((double)v40 - (double)v37)];
      v42 = [v73 numberingSystemType];
      v43 = +[PUINumberingSystem numberingSystemForType:v42];

      v44 = [v43 locale];
      [(PUIFontPickerComponentViewController *)v32 setLocale:v44];

      uint64_t v14 = v38;
      uint64_t v24 = v66;

      id v5 = v31;
      int v12 = v70;
      int v10 = v71;
      uint64_t v3 = v67;
    }
    else
    {
      [(PUIStylePickerViewController *)self setFontPickerComponentViewController:0];
    }

    id v6 = v73;
    int v9 = v69;
  }
  else
  {
    int v72 = 0;
  }
  if (v74)
  {
    v45 = [(PUIStylePickerViewController *)self textAlignmentBarItem];

    if (!v45)
    {
      v46 = -[PUITextAlignmentBarButtonItem initWithTextAlignment:target:action:]([PUITextAlignmentBarButtonItem alloc], "initWithTextAlignment:target:action:", [v6 preferredAlignment], self, sel__didPressTextAlignmentBarButtonItem_);
      [(PUIStylePickerViewController *)self setTextAlignmentBarItem:v46];
    }
    if (v12) {
      goto LABEL_31;
    }
LABEL_35:
    [(PUIStylePickerViewController *)self setTextLayoutPickerComponentViewController:0];
    goto LABEL_36;
  }
  [(PUIStylePickerViewController *)self setTextAlignmentBarItem:0];
  if (!v12) {
    goto LABEL_35;
  }
LABEL_31:
  v47 = +[PUITextLayoutSet supportedTextLayoutSetForRole:v5];
  v48 = [(PUIStylePickerViewController *)self textLayoutPickerComponentViewController];
  if (!v48)
  {
    v48 = -[PUITextLayoutPickerComponentViewController initWithLayouts:selectedLayout:]([PUITextLayoutPickerComponentViewController alloc], "initWithLayouts:selectedLayout:", v47, [v6 preferredLayout]);
    [(PUITextLayoutPickerComponentViewController *)v48 setDelegate:self];
    [(PUIStylePickerViewController *)self setTextLayoutPickerComponentViewController:v48];
  }

LABEL_36:
  if (v10)
  {
    id v49 = [(PUIStylePickerViewController *)self stylePickerComponentViewController];
    if (!v49)
    {
      id v49 = [[PUIStylePickerComponentViewController alloc] initWithConfiguration:v77];
      [(PUIStylePickerComponentViewController *)v49 setDelegate:self];
      [(PUIStylePickerViewController *)self setStylePickerComponentViewController:v49];
    }
    [(PUIStylePickerComponentViewController *)v49 setContentsLuminance:v8];

    if (!v9) {
      goto LABEL_40;
    }
  }
  else
  {
    [(PUIStylePickerViewController *)self setStylePickerComponentViewController:0];
    if (!v9)
    {
LABEL_40:
      [(PUIStylePickerViewController *)self setNumberSystemBarItem:0];
      [(PUIStylePickerViewController *)self setNumberingSystemPickerMenuController:0];
      [(PUIStylePickerViewController *)self setNumberingSystemPickerComponentViewController:0];
      goto LABEL_51;
    }
  }
  [v6 effectiveNumberingSystemType];
  v51 = int v50 = v10;
  v52 = +[PUINumberingSystem numberingSystemForType:v51];

  if ((v50 | v72))
  {
    v53 = [(PUIStylePickerViewController *)self numberingSystemPickerMenuController];
    if (!v53)
    {
      v53 = [[PUINumberingSystemPickerMenuController alloc] initWithNumberingSystem:v52 font:v76];
      [(PUINumberingSystemPickerMenuController *)v53 setDelegate:self];
      [(PUIStylePickerViewController *)self setNumberingSystemPickerMenuController:v53];
    }
    v54 = [(PUIStylePickerViewController *)self numberSystemBarItem];
    if (!v54)
    {
      v55 = (void *)MEMORY[0x263F1C6B0];
      v56 = [MEMORY[0x263F1C6C8] configurationWithScale:3];
      [v55 systemImageNamed:@"globe" withConfiguration:v56];
      v58 = v57 = v5;

      id v59 = objc_alloc(MEMORY[0x263F1C468]);
      v60 = [(PUINumberingSystemPickerMenuController *)v53 menu];
      v54 = (void *)[v59 initWithImage:v58 menu:v60];

      [(PUIStylePickerViewController *)self setNumberSystemBarItem:v54];
      id v5 = v57;
    }
  }
  else
  {
    v53 = [(PUIStylePickerViewController *)self numberingSystemPickerComponentViewController];
    if (!v53)
    {
      v53 = [[PUINumberingSystemPickerComponentViewController alloc] initWithNumberingSystem:v52 font:v76];
      [(PUINumberingSystemPickerMenuController *)v53 setDelegate:self];
      [(PUIStylePickerViewController *)self setNumberingSystemPickerComponentViewController:v53];
    }
  }

LABEL_51:
  if (v75)
  {
    v61 = [v3 homeScreenConfiguration];
    v62 = v61;
    if (v61) {
      id v63 = v61;
    }
    else {
      id v63 = (id)objc_opt_new();
    }
    v64 = v63;

    v65 = [(PUIStylePickerViewController *)self homeScreenComponentViewController];
    if (!v65)
    {
      v65 = [[PUIStylePickerHomeScreenComponentViewController alloc] initWithHomeScreenConfiguration:v64];
      [(PUIStylePickerHomeScreenComponentViewController *)v65 setDelegate:self];
      [(PUIStylePickerViewController *)self setHomeScreenComponentViewController:v65];
    }
  }
  else
  {
    [(PUIStylePickerViewController *)self setHomeScreenComponentViewController:0];
  }
}

PUIFontPickerItem *__70__PUIStylePickerViewController__setupComponentViewControllersIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[PUIFontPickerItem alloc] initWithFont:v2 systemItem:0];

  return v3;
}

uint64_t __70__PUIStylePickerViewController__setupComponentViewControllersIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSystemItem])
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v6 = [v3 font];
    uint64_t v7 = [v5 stylePickerViewController:v4 shouldShowFont:v6];
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __70__PUIStylePickerViewController__setupComponentViewControllersIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 font];
  uint64_t v4 = [v3 customFont];

  id v5 = [v4 fontName];
  id v6 = [*(id *)(a1 + 32) fontName];
  uint64_t v7 = BSEqualObjects();

  return v7;
}

uint64_t __70__PUIStylePickerViewController__setupComponentViewControllersIfNeeded__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 font];
  int v5 = BSEqualObjects();

  [v3 isSystemItem];
  [*(id *)(a1 + 40) isSystemItem];
  return v5 & BSFloatEqualToFloat();
}

uint64_t __70__PUIStylePickerViewController__setupComponentViewControllersIfNeeded__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 font];
  int v5 = [v4 fontIdentifier];
  id v6 = [*(id *)(a1 + 32) fontIdentifier];
  int v7 = BSEqualObjects();

  [v3 isSystemItem];
  [*(id *)(a1 + 40) isSystemItem];
  return v7 & BSFloatEqualToFloat();
}

- (void)_refreshComponentViewControllers
{
  id v20 = [(PUIStylePickerViewController *)self stylePickerConfiguration];
  id v3 = [v20 components];
  int v4 = [v3 containsComponent:2];
  int v5 = [v3 containsComponent:4];
  LODWORD(v6) = [v3 containsComponent:16];
  int v7 = [v3 containsComponent:8];
  int v8 = [v3 containsComponent:32];
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (!v6
    || ([(PUIStylePickerViewController *)self fontPickerComponentViewController],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    int v13 = 1;
    if (!v7) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  int v10 = [(PUIStylePickerViewController *)self fontPickerComponentViewController];
  int v11 = [v10 items];
  unint64_t v12 = [v11 count];

  if (v12 >= 2)
  {
    id v6 = [(PUIStylePickerViewController *)self fontPickerComponentViewController];
    [v9 addObject:v6];

    int v13 = 0;
    LODWORD(v6) = 1;
    if (!v7) {
      goto LABEL_8;
    }
LABEL_7:
    uint64_t v14 = [(PUIStylePickerViewController *)self textLayoutPickerComponentViewController];
    objc_msgSend(v9, "bs_safeAddObject:", v14);

    goto LABEL_8;
  }
  int v13 = 0;
  LODWORD(v6) = 0;
  if (v7) {
    goto LABEL_7;
  }
LABEL_8:
  if (((v13 | v6) & 1) == 0)
  {
    id v15 = [(PUIStylePickerViewController *)self fontPickerComponentViewController];
    objc_msgSend(v9, "bs_safeAddObject:", v15);
  }
  if (v4)
  {
    long long v16 = [(PUIStylePickerViewController *)self numberingSystemPickerComponentViewController];

    if (v16)
    {
      uint64_t v17 = [(PUIStylePickerViewController *)self numberingSystemPickerComponentViewController];
      [v9 addObject:v17];
    }
  }
  if (v5)
  {
    uint64_t v18 = [(PUIStylePickerViewController *)self stylePickerComponentViewController];
    objc_msgSend(v9, "bs_safeAddObject:", v18);
  }
  if (v8)
  {
    uint64_t v19 = [(PUIStylePickerViewController *)self homeScreenComponentViewController];
    objc_msgSend(v9, "bs_safeAddObject:", v19);
  }
}

- (void)_refreshBarButtonItems
{
  if (![(PUIStylePickerViewController *)self isViewLoaded]) {
    return;
  }
  id v39 = [(PUIStylePickerViewController *)self stylePickerConfiguration];
  id v3 = [v39 components];
  int v4 = [(PUIStylePickerViewController *)self leadingBarButtonItems];
  int v5 = [(PUIStylePickerViewController *)self centerBarButtonItems];
  id v6 = [(PUIStylePickerViewController *)self trailingBarButtonItems];
  int v7 = objc_opt_new();
  int v8 = objc_opt_new();
  uint64_t v9 = objc_opt_new();
  int v10 = [v3 containsComponent:2];
  double v34 = v3;
  if ([v3 containsComponent:16])
  {
    int v11 = [(PUIStylePickerViewController *)self textAlignmentBarItem];
    [v7 addObject:v11];
  }
  if (v10)
  {
    unint64_t v12 = [(PUIStylePickerViewController *)self numberingSystemPickerComponentViewController];

    if (!v12)
    {
      int v13 = [(PUIStylePickerViewController *)self numberSystemBarItem];
      [v7 addObject:v13];
    }
  }
  uint64_t v14 = [(PUIStylePickerViewController *)self stylePickerComponentViewController];
  uint64_t v15 = [v14 colorWell];
  unint64_t v40 = (void *)v9;
  if (!v15) {
    goto LABEL_10;
  }
  long long v16 = (void *)v15;
  uint64_t v17 = [(PUIStylePickerViewController *)self numberSystemBarItem];

  if (!v17)
  {
    uint64_t v14 = [(PUIStylePickerComponentViewController *)self->_stylePickerComponentViewController colorWellView];
    uint64_t v18 = [v14 colorWell];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v14];
    [v7 addObject:v19];

LABEL_10:
  }
  if ([v4 count]) {
    id v20 = (void *)[objc_alloc(MEMORY[0x263F1C470]) initWithBarButtonItems:v4 representativeItem:0];
  }
  else {
    id v20 = 0;
  }
  if ([v7 count]) {
    v43 = (void *)[objc_alloc(MEMORY[0x263F1C470]) initWithBarButtonItems:v7 representativeItem:0];
  }
  else {
    v43 = 0;
  }
  if ([v5 count]) {
    v42 = (void *)[objc_alloc(MEMORY[0x263F1C470]) initWithBarButtonItems:v5 representativeItem:0];
  }
  else {
    v42 = 0;
  }
  if ([v8 count]) {
    double v41 = (void *)[objc_alloc(MEMORY[0x263F1C470]) initWithBarButtonItems:v8 representativeItem:0];
  }
  else {
    double v41 = 0;
  }
  v44 = v5;
  if ([v6 count]) {
    id v21 = (void *)[objc_alloc(MEMORY[0x263F1C470]) initWithBarButtonItems:v6 representativeItem:0];
  }
  else {
    id v21 = 0;
  }
  unint64_t v37 = v6;
  id v38 = v4;
  id v35 = v8;
  double v36 = v7;
  if ([v40 count]) {
    double v22 = (void *)[objc_alloc(MEMORY[0x263F1C470]) initWithBarButtonItems:v40 representativeItem:0];
  }
  else {
    double v22 = 0;
  }
  id v23 = objc_opt_new();
  objc_msgSend(v23, "bs_safeAddObject:", v20);
  objc_msgSend(v23, "bs_safeAddObject:", v43);
  uint64_t v24 = objc_opt_new();
  objc_msgSend(v24, "bs_safeAddObject:", v21);
  objc_msgSend(v24, "bs_safeAddObject:", v22);
  id v25 = objc_opt_new();
  objc_msgSend(v25, "bs_safeAddObject:", v42);
  objc_msgSend(v25, "bs_safeAddObject:", v41);
  double v26 = [(PUIStylePickerViewController *)self navigationController];
  id v27 = [v26 navigationBar];
  unint64_t v28 = [v27 topItem];

  [v28 _setManualScrollEdgeAppearanceProgress:0.0];
  [v28 setLeadingItemGroups:v23];
  if ([v44 count])
  {
    if ([v44 count] == 1
      && ([v44 firstObject],
          BOOL v29 = objc_claimAutoreleasedReturnValue(),
          [v29 customView],
          int v30 = objc_claimAutoreleasedReturnValue(),
          v30,
          v29,
          v30))
    {
      id v31 = [v44 firstObject];
      double v32 = [v31 customView];

      [v32 sizeToFit];
      [v28 setTitleView:v32];
    }
    else
    {
      [v28 setCenterItemGroups:v25];
      [v28 setTitle:0];
    }
  }
  else
  {
    id v33 = [(PUIStylePickerViewController *)self title];
    [v28 setTitle:v33];
  }
  [v28 setTrailingItemGroups:v24];
}

- (id)componentViewControllers
{
  id v3 = objc_opt_new();
  int v4 = [(PUIStylePickerViewController *)self stylePickerConfiguration];
  int v5 = [v4 components];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  int v11 = __56__PUIStylePickerViewController_componentViewControllers__block_invoke;
  unint64_t v12 = &unk_265472160;
  id v13 = v3;
  uint64_t v14 = self;
  id v6 = v3;
  [v5 enumerateComponents:&v9];

  int v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);
  return v7;
}

void __56__PUIStylePickerViewController_componentViewControllers__block_invoke(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 1:
      id v2 = *(void **)(a1 + 32);
      uint64_t v3 = [*(id *)(a1 + 40) fontPickerComponentViewController];
      break;
    case 2:
      id v2 = *(void **)(a1 + 32);
      uint64_t v3 = [*(id *)(a1 + 40) numberingSystemPickerComponentViewController];
      break;
    case 4:
      id v2 = *(void **)(a1 + 32);
      uint64_t v3 = [*(id *)(a1 + 40) stylePickerComponentViewController];
      break;
    case 8:
      id v2 = *(void **)(a1 + 32);
      uint64_t v3 = [*(id *)(a1 + 40) textLayoutPickerComponentViewController];
      break;
    case 32:
      id v2 = *(void **)(a1 + 32);
      uint64_t v3 = [*(id *)(a1 + 40) homeScreenComponentViewController];
      break;
    default:
      return;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, "bs_safeAddObject:");
}

- (void)_updateViews
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  id v63 = [(PUIStylePickerViewController *)self view];
  uint64_t v3 = [(PUIStylePickerViewController *)self rootStackView];
  v62 = [(PUIStylePickerViewController *)self backgroundView];
  id v4 = [(PUIStylePickerViewController *)self componentViewControllers];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v96 objects:v105 count:16];
  v73 = v5;
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v97;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v97 != v9) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v96 + 1) + 8 * i);
        unint64_t v12 = [v11 view];
        [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v5 addObject:v12];
        id v13 = [v11 parentViewController];

        if (v13 != self)
        {
          [v11 willMoveToParentViewController:self];
          [(PUIStylePickerViewController *)self addChildViewController:v11];
          [v11 didMoveToParentViewController:self];
          char v8 = 1;
        }

        id v5 = v73;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v96 objects:v105 count:16];
    }
    while (v7);
  }
  else
  {
    char v8 = 0;
  }

  uint64_t v14 = [v3 arrangedSubviews];
  char v15 = [v5 isEqualToArray:v14];

  v60 = self;
  v61 = v3;
  if (v15)
  {
    if ((v8 & 1) == 0) {
      goto LABEL_41;
    }
  }
  else
  {
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v16 = [v3 arrangedSubviews];
    uint64_t v17 = (void *)[v16 copy];

    uint64_t v18 = [v17 countByEnumeratingWithState:&v92 objects:v104 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v93;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v93 != v20) {
            objc_enumerationMutation(v17);
          }
          [v3 removeArrangedSubview:*(void *)(*((void *)&v92 + 1) + 8 * j)];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v92 objects:v104 count:16];
      }
      while (v19);
    }

    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v22 = v73;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v88 objects:v103 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v89;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v89 != v25) {
            objc_enumerationMutation(v22);
          }
          [v3 addArrangedSubview:*(void *)(*((void *)&v88 + 1) + 8 * k)];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v88 objects:v103 count:16];
      }
      while (v24);
    }
  }
  id v27 = [(PUIStylePickerViewController *)self dividerViews];
  [v27 makeObjectsPerformSelector:sel_removeFromSuperview];

  int v69 = objc_opt_new();
  if ((unint64_t)[v73 count] < 2)
  {
    unint64_t v28 = 0;
  }
  else
  {
    unint64_t v28 = objc_msgSend(v73, "subarrayWithRange:", 1, objc_msgSend(v73, "count") - 1);
  }
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v64 = v28;
  uint64_t v71 = [v64 countByEnumeratingWithState:&v84 objects:v102 count:16];
  if (v71)
  {
    uint64_t v67 = *(void *)v85;
    do
    {
      for (uint64_t m = 0; m != v71; ++m)
      {
        if (*(void *)v85 != v67) {
          objc_enumerationMutation(v64);
        }
        int v30 = *(void **)(*((void *)&v84 + 1) + 8 * m);
        id v31 = objc_alloc_init(MEMORY[0x263F1CB60]);
        double v32 = [MEMORY[0x263F1C550] separatorColor];
        [v31 setBackgroundColor:v32];

        [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v30 addSubview:v31];
        [v69 addObject:v31];
        int v74 = (void *)MEMORY[0x263F08938];
        id v82 = [v31 heightAnchor];
        v80 = [v82 constraintEqualToConstant:1.0];
        v101[0] = v80;
        v78 = [v31 leadingAnchor];
        v76 = [v30 leadingAnchor];
        id v33 = [v78 constraintEqualToAnchor:v76];
        v101[1] = v33;
        double v34 = [v31 trailingAnchor];
        id v35 = [v30 trailingAnchor];
        double v36 = [v34 constraintEqualToAnchor:v35];
        v101[2] = v36;
        unint64_t v37 = [v31 bottomAnchor];
        id v38 = [v30 topAnchor];
        id v39 = [v37 constraintEqualToAnchor:v38 constant:-24.0];
        v101[3] = v39;
        unint64_t v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v101 count:4];
        [v74 activateConstraints:v40];
      }
      uint64_t v71 = [v64 countByEnumeratingWithState:&v84 objects:v102 count:16];
    }
    while (v71);
  }

  [(PUIStylePickerViewController *)v60 setDividerViews:v69];
  uint64_t v3 = v61;
LABEL_41:
  double v41 = [v63 safeAreaLayoutGuide];
  v81 = [v3 leadingAnchor];
  v79 = [v41 leadingAnchor];
  v77 = [v81 constraintEqualToAnchor:v79];
  v100[0] = v77;
  int v75 = [v3 trailingAnchor];
  id v83 = v41;
  int v72 = [v41 trailingAnchor];
  int v70 = [v75 constraintEqualToAnchor:v72];
  v100[1] = v70;
  id v65 = [v3 topAnchor];
  v68 = [v63 safeAreaLayoutGuide];
  id v59 = [v68 topAnchor];
  v58 = [v65 constraintEqualToAnchor:v59 constant:7.0];
  v100[2] = v58;
  v57 = [v62 leadingAnchor];
  v56 = [v63 leadingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v100[3] = v55;
  v42 = [v62 trailingAnchor];
  uint64_t v43 = [v63 trailingAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  v100[4] = v44;
  v45 = [v62 bottomAnchor];
  v46 = [v63 bottomAnchor];
  v47 = [v45 constraintEqualToAnchor:v46];
  v100[5] = v47;
  v48 = [v62 topAnchor];
  id v49 = [v63 topAnchor];
  int v50 = [v48 constraintEqualToAnchor:v49];
  v100[6] = v50;
  v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v100 count:7];

  v52 = [(PUIStylePickerViewController *)v60 layoutConstraints];
  LOBYTE(v43) = [v52 isEqualToArray:v51];

  if ((v43 & 1) == 0)
  {
    v53 = (void *)MEMORY[0x263F08938];
    v54 = [(PUIStylePickerViewController *)v60 layoutConstraints];
    [v53 deactivateConstraints:v54];

    [(PUIStylePickerViewController *)v60 setLayoutConstraints:v51];
    [MEMORY[0x263F08938] activateConstraints:v51];
  }
}

- (void)_navigateHomeScreenColorPickerSlidersToColor:(id)a3
{
}

- (PUIStylePickerComponents)components
{
  return self->_components;
}

- (PUIStylePickerConfiguration)stylePickerConfiguration
{
  return self->_stylePickerConfiguration;
}

- (void)setStylePickerConfiguration:(id)a3
{
}

- (NSArray)leadingBarButtonItems
{
  return self->_leadingBarButtonItems;
}

- (NSArray)centerBarButtonItems
{
  return self->_centerBarButtonItems;
}

- (NSArray)trailingBarButtonItems
{
  return self->_trailingBarButtonItems;
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (PUIStylePickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUIStylePickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
}

- (UIStackView)rootStackView
{
  return self->_rootStackView;
}

- (void)setRootStackView:(id)a3
{
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (NSArray)dividerViews
{
  return self->_dividerViews;
}

- (void)setDividerViews:(id)a3
{
}

- (UIBarButtonItem)numberSystemBarItem
{
  return self->_numberSystemBarItem;
}

- (void)setNumberSystemBarItem:(id)a3
{
}

- (PUITextAlignmentBarButtonItem)textAlignmentBarItem
{
  return self->_textAlignmentBarItem;
}

- (void)setTextAlignmentBarItem:(id)a3
{
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (PUINumberingSystemPickerMenuController)numberingSystemPickerMenuController
{
  return self->_numberingSystemPickerMenuController;
}

- (void)setNumberingSystemPickerMenuController:(id)a3
{
}

- (PUIFontPickerComponentViewController)fontPickerComponentViewController
{
  return self->_fontPickerComponentViewController;
}

- (void)setFontPickerComponentViewController:(id)a3
{
}

- (PUITextLayoutPickerComponentViewController)textLayoutPickerComponentViewController
{
  return self->_textLayoutPickerComponentViewController;
}

- (void)setTextLayoutPickerComponentViewController:(id)a3
{
}

- (PUIStylePickerComponentViewController)stylePickerComponentViewController
{
  return self->_stylePickerComponentViewController;
}

- (void)setStylePickerComponentViewController:(id)a3
{
}

- (PUINumberingSystemPickerComponentViewController)numberingSystemPickerComponentViewController
{
  return self->_numberingSystemPickerComponentViewController;
}

- (void)setNumberingSystemPickerComponentViewController:(id)a3
{
}

- (PUIStylePickerHomeScreenComponentViewController)homeScreenComponentViewController
{
  return self->_homeScreenComponentViewController;
}

- (void)setHomeScreenComponentViewController:(id)a3
{
}

- (NSArray)additionalFonts
{
  return self->_additionalFonts;
}

- (void)setAdditionalFonts:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (NSURL)extensionBundleURL
{
  return self->_extensionBundleURL;
}

- (void)setExtensionBundleURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionBundleURL, 0);
  objc_storeStrong((id *)&self->_additionalFonts, 0);
  objc_storeStrong((id *)&self->_homeScreenComponentViewController, 0);
  objc_storeStrong((id *)&self->_numberingSystemPickerComponentViewController, 0);
  objc_storeStrong((id *)&self->_stylePickerComponentViewController, 0);
  objc_storeStrong((id *)&self->_textLayoutPickerComponentViewController, 0);
  objc_storeStrong((id *)&self->_fontPickerComponentViewController, 0);
  objc_storeStrong((id *)&self->_numberingSystemPickerMenuController, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_textAlignmentBarItem, 0);
  objc_storeStrong((id *)&self->_numberSystemBarItem, 0);
  objc_storeStrong((id *)&self->_dividerViews, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_rootStackView, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trailingBarButtonItems, 0);
  objc_storeStrong((id *)&self->_centerBarButtonItems, 0);
  objc_storeStrong((id *)&self->_leadingBarButtonItems, 0);
  objc_storeStrong((id *)&self->_stylePickerConfiguration, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)initWithStylePickerConfiguration:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  int v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  char v15 = @"PUIStylePickerViewController.m";
  __int16 v16 = 1024;
  int v17 = 105;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_25A0AF000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end