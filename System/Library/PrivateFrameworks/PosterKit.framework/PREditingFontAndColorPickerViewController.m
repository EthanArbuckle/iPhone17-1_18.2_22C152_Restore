@interface PREditingFontAndColorPickerViewController
+ (id)defaultFontIdentifiersForRole:(id)a3;
+ (id)defaultFontIdentifiersForRole:(id)a3 titleString:(id)a4;
- (BOOL)_shouldShowWeightSliderForSelectedFont;
- (BOOL)hasLoadedComponentViewControllers;
- (NSArray)additionalFontConfigurations;
- (NSString)role;
- (NSString)titleString;
- (NSURL)extensionBundleURL;
- (PREditingColorPickerComponentViewController)colorPickerController;
- (PREditingColorVariationStore)colorVariationStore;
- (PREditingFontAndColorPickerViewController)initWithComponents:(unint64_t)a3 role:(id)a4 titleString:(id)a5;
- (PREditingFontAndColorPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PREditingFontAndColorPickerViewControllerDelegate)delegate;
- (PREditingFontPickerComponentViewController)fontPickerController;
- (PREditingTitleLayoutPickerComponentViewController)titleLayoutPickerController;
- (PREditorColorPickerConfiguration)colorPickerConfiguration;
- (PREditorNumberingSystemPickerController)numberingSystemController;
- (PREditorNumberingSystemViewController)numberingSystemViewController;
- (PRPosterTitleStyleConfiguration)titleStyleConfiguration;
- (PRTitleAlignmentBarButtonItem)titleAlignmentBarItem;
- (PUIColorWell)colorWell;
- (PUIColorWellView)colorWellView;
- (UIBarButtonItem)numberSystemBarItem;
- (UIStackView)rootStackView;
- (double)contentsLuminance;
- (double)desiredDetent;
- (id)changeHandler;
- (id)localeWithNumberingSystem:(id)a3;
- (unint64_t)components;
- (void)_closeButtonTapped:(id)a3;
- (void)_signalDelegateDidFinish;
- (void)colorPickerComponentViewController:(id)a3 didSelectColorItem:(id)a4 userSelected:(BOOL)a5;
- (void)colorPickerComponentViewControllerDidChangeHeight:(id)a3;
- (void)colorWellDidUpdateColor:(id)a3;
- (void)didPressTitleAlignmentBarButtonItem:(id)a3;
- (void)fontPickerComponentViewController:(id)a3 didChangeFontWeight:(double)a4;
- (void)fontPickerComponentViewController:(id)a3 didSelectItem:(id)a4;
- (void)fontPickerComponentViewControllerDidChangeHeight:(id)a3;
- (void)loadComponentViewControllersIfNeeded;
- (void)loadView;
- (void)numberingSystemPickerController:(id)a3 didSelectNumberingSystem:(id)a4;
- (void)numberingSystemViewController:(id)a3 didSelectNumberingSystem:(id)a4;
- (void)numberingSystemWasChanged:(id)a3 locale:(id)a4;
- (void)setAdditionalFontConfigurations:(id)a3;
- (void)setChangeHandler:(id)a3;
- (void)setColorPickerConfiguration:(id)a3;
- (void)setColorPickerController:(id)a3;
- (void)setColorVariationStore:(id)a3;
- (void)setColorWell:(id)a3;
- (void)setColorWellView:(id)a3;
- (void)setContentsLuminance:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setExtensionBundleURL:(id)a3;
- (void)setFontPickerController:(id)a3;
- (void)setHasLoadedComponentViewControllers:(BOOL)a3;
- (void)setNumberSystemBarItem:(id)a3;
- (void)setNumberingSystemController:(id)a3;
- (void)setNumberingSystemViewController:(id)a3;
- (void)setRole:(id)a3;
- (void)setRootStackView:(id)a3;
- (void)setTitleAlignmentBarItem:(id)a3;
- (void)setTitleLayoutPickerController:(id)a3;
- (void)setTitleString:(id)a3;
- (void)setTitleStyleConfiguration:(id)a3;
- (void)titleLayoutPickerComponentViewController:(id)a3 didSelectTitleLayout:(unint64_t)a4 userSelected:(BOOL)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePopoverContentSize;
- (void)viewDidLayoutSubviews;
@end

@implementation PREditingFontAndColorPickerViewController

- (PREditingFontAndColorPickerViewController)initWithComponents:(unint64_t)a3 role:(id)a4 titleString:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PREditingFontAndColorPickerViewController;
  v11 = [(PREditingFontAndColorPickerViewController *)&v16 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    v11->_components = a3;
    v11->_contentsLuminance = 0.5;
    objc_storeStrong((id *)&v11->_role, a4);
    uint64_t v13 = [v10 copy];
    titleString = v12->_titleString;
    v12->_titleString = (NSString *)v13;
  }
  return v12;
}

- (PREditingFontAndColorPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return [(PREditingFontAndColorPickerViewController *)self initWithComponents:31 role:@"PRPosterRoleLockScreen" titleString:0];
}

- (void)loadComponentViewControllersIfNeeded
{
  if (!self->_hasLoadedComponentViewControllers)
  {
    unint64_t v3 = [(PREditingFontAndColorPickerViewController *)self components];
    v4 = [(PREditingFontAndColorPickerViewController *)self extensionBundleURL];
    if (v4)
    {
      v5 = [(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration effectiveTimeFontWithExtensionBundleURL:v4 forRole:self->_role];
    }
    else
    {
      v5 = 0;
    }
    v6 = [(PREditingFontAndColorPickerViewController *)self delegate];
    v77 = v6;
    if (v3)
    {
      v74 = v5;
      v7 = +[PREditingFontPickerComponentViewController defaultItemsForRole:self->_role titleString:self->_titleString];
      if (![(NSString *)self->_role isEqualToString:@"PRPosterRoleIncomingCall"]
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v8 = [v6 additionalFontConfigurationsForFontAndColorPickerViewController:self];
        if (v8)
        {
          [(PREditingFontAndColorPickerViewController *)self setAdditionalFontConfigurations:v8];
          id v9 = objc_msgSend(v8, "bs_map:", &__block_literal_global_12);
          uint64_t v10 = [v7 arrayByAddingObjectsFromArray:v9];

          v7 = (void *)v10;
          v6 = v77;
        }
      }
      if (objc_opt_respondsToSelector())
      {
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v86[2] = __81__PREditingFontAndColorPickerViewController_loadComponentViewControllersIfNeeded__block_invoke_2;
        v86[3] = &unk_1E54DB158;
        id v87 = v6;
        v88 = self;
        uint64_t v11 = objc_msgSend(v7, "bs_filter:", v86);

        v7 = (void *)v11;
      }
      v12 = [(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration timeFontConfiguration];
      uint64_t v13 = [v12 timeFontConfigurationWithExtensionBundleURL:v4];
      v14 = [v13 customFont];

      v75 = v4;
      v72 = v12;
      v73 = v13;
      if (v14)
      {
        v15 = [v13 customFont];
        v84[0] = MEMORY[0x1E4F143A8];
        v84[1] = 3221225472;
        v84[2] = __81__PREditingFontAndColorPickerViewController_loadComponentViewControllersIfNeeded__block_invoke_3;
        v84[3] = &unk_1E54DB180;
        id v85 = v15;
        id v16 = v15;
        v17 = objc_msgSend(v7, "bs_firstObjectPassingTest:", v84);
      }
      else
      {
        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __81__PREditingFontAndColorPickerViewController_loadComponentViewControllersIfNeeded__block_invoke_4;
        v81[3] = &unk_1E54DB158;
        id v18 = v13;
        id v82 = v18;
        id v19 = v12;
        id v83 = v19;
        v17 = objc_msgSend(v7, "bs_firstObjectPassingTest:", v81);
        if (!v17)
        {
          v78[0] = MEMORY[0x1E4F143A8];
          v78[1] = 3221225472;
          v78[2] = __81__PREditingFontAndColorPickerViewController_loadComponentViewControllersIfNeeded__block_invoke_5;
          v78[3] = &unk_1E54DB158;
          id v79 = v18;
          id v80 = v19;
          v17 = objc_msgSend(v7, "bs_firstObjectPassingTest:", v78);
        }
        id v16 = v82;
        v6 = v77;
      }

      uint64_t v20 = [v7 count];
      BOOL v76 = v20 != 0;
      if (v20)
      {
        v21 = [[PREditingFontPickerComponentViewController alloc] initWithItems:v7 selectedItem:v17 role:self->_role titleString:self->_titleString];
        v22 = [(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration timeFontConfiguration];
        v23 = [(PREditingFontAndColorPickerViewController *)self extensionBundleURL];
        v24 = [v22 timeFontConfigurationWithExtensionBundleURL:v23];

        v25 = [v24 effectiveFontForRole:self->_role ignoringWeight:1];
        unint64_t v26 = objc_msgSend(v25, "pr_variantWeightRange");
        unint64_t v28 = v27;
        [v24 weight];
        [(PREditingFontPickerComponentViewController *)v21 setFontWeight:(v29 - (double)v26) / ((double)v28 - (double)v26)];
        v30 = [(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration timeNumberingSystem];
        if (v30)
        {
          v31 = [(PREditingFontAndColorPickerViewController *)self localeWithNumberingSystem:v30];
          [(PREditingFontPickerComponentViewController *)v21 setLocale:v31];
        }
        [(PREditingFontPickerComponentViewController *)v21 setDelegate:self];
        [(PREditingFontAndColorPickerViewController *)self setFontPickerController:v21];

        v6 = v77;
        v12 = v72;
      }

      v5 = v74;
      v4 = v75;
      if ((v3 & 0x10) == 0)
      {
LABEL_26:
        if ((v3 & 8) != 0)
        {
          v51 = +[PREditingTitleLayoutPickerComponentViewController defaultTitleLayoutsForRole:self->_role];
          v52 = [PREditingTitleLayoutPickerComponentViewController alloc];
          titleStyleConfiguration = self->_titleStyleConfiguration;
          v54 = [(PREditingFontAndColorPickerViewController *)self titleString];
          v55 = titleStyleConfiguration;
          v6 = v77;
          v56 = [(PREditingTitleLayoutPickerComponentViewController *)v52 initWithTitleLayouts:v51 selectedLayout:[(PRPosterTitleStyleConfiguration *)v55 effectiveTitleLayoutForText:v54]];

          [(PREditingTitleLayoutPickerComponentViewController *)v56 setDelegate:self];
          [(PREditingFontAndColorPickerViewController *)self setTitleLayoutPickerController:v56];

          if ((v3 & 4) == 0)
          {
LABEL_28:
            if ((v3 & 2) == 0) {
              goto LABEL_36;
            }
            goto LABEL_32;
          }
        }
        else if ((v3 & 4) == 0)
        {
          goto LABEL_28;
        }
        v57 = [[PREditingColorPickerComponentViewController alloc] initWithConfiguration:self->_colorPickerConfiguration variationStore:self->_colorVariationStore];
        [(PREditingColorPickerComponentViewController *)v57 setDelegate:self];
        [(PREditingColorPickerComponentViewController *)v57 setContentsLuminance:self->_contentsLuminance];
        [(PREditingFontAndColorPickerViewController *)self setColorPickerController:v57];

        if ((v3 & 2) == 0)
        {
LABEL_36:
          self->_hasLoadedComponentViewControllers = 1;

          return;
        }
LABEL_32:
        if ((v3 >> 2) & 1 | v76)
        {
          v58 = [PREditorNumberingSystemPickerController alloc];
          v59 = [(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration effectiveTimeNumberingSystem];
          v60 = [(PREditorNumberingSystemPickerController *)v58 initWithSelectedNumberingSystem:v59 selectedFont:v5];

          [(PREditorNumberingSystemPickerController *)v60 setDelegate:self];
          numberingSystemController = self->_numberingSystemController;
          self->_numberingSystemController = v60;
          v62 = v60;

          v63 = (void *)MEMORY[0x1E4FB1818];
          v64 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
          v65 = [v63 systemImageNamed:@"globe" withConfiguration:v64];

          id v66 = objc_alloc(MEMORY[0x1E4FB14A8]);
          v67 = [(PREditorNumberingSystemPickerController *)v62 menu];
          v68 = (UIBarButtonItem *)[v66 initWithImage:v65 menu:v67];

          numberSystemBarItem = self->_numberSystemBarItem;
          self->_numberSystemBarItem = v68;

          v6 = v77;
        }
        else
        {
          v70 = [PREditorNumberingSystemViewController alloc];
          v71 = [(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration effectiveTimeNumberingSystem];
          v65 = [(PREditorNumberingSystemViewController *)v70 initWithSelectedNumberingSystem:v71 selectedFont:v5];

          v6 = v77;
          [(PREditorNumberingSystemViewController *)v65 setDelegate:self];
          [(PREditingFontAndColorPickerViewController *)self setNumberingSystemViewController:v65];
        }

        goto LABEL_36;
      }
    }
    else
    {
      BOOL v76 = 0;
      if ((v3 & 0x10) == 0) {
        goto LABEL_26;
      }
    }
    v32 = self->_titleStyleConfiguration;
    v33 = [(PREditingFontAndColorPickerViewController *)self titleString];
    uint64_t v34 = [(PRPosterTitleStyleConfiguration *)v32 effectiveTitleLayoutForText:v33];

    v35 = [(PREditingFontAndColorPickerViewController *)self fontPickerController];
    v36 = [v35 selectedItem];
    [v36 fontConfiguration];
    v38 = v37 = v5;
    v39 = [v38 effectiveFontForRole:self->_role];

    v40 = [(PREditingFontAndColorPickerViewController *)self titleString];
    +[PRIncomingCallFontsProvider idealEmphasizedFontSizeForName:v40 usingLayout:v34];
    double v42 = v41;

    v43 = [v39 fontWithSize:v42];
    v44 = [PRTitleAlignmentBarButtonItem alloc];
    v45 = self->_titleStyleConfiguration;
    v46 = [(PREditingFontAndColorPickerViewController *)self titleString];
    v47 = [(PRTitleAlignmentBarButtonItem *)v44 initWithTitleAlignment:[(PRPosterTitleStyleConfiguration *)v45 effectiveTitleAlignmentForText:v46 withFont:v43] target:self action:sel_didPressTitleAlignmentBarButtonItem_];
    titleAlignmentBarItem = self->_titleAlignmentBarItem;
    self->_titleAlignmentBarItem = v47;

    v49 = self->_titleAlignmentBarItem;
    v50 = [(PREditingFontAndColorPickerViewController *)self titleString];
    v6 = v77;
    [(PRTitleAlignmentBarButtonItem *)v49 setEnabled:+[PRIncomingCallMetricsProvider canApplyKashidaToText:v50 withFont:v43]];

    v5 = v37;
    goto LABEL_26;
  }
}

PREditingFontPickerItem *__81__PREditingFontAndColorPickerViewController_loadComponentViewControllersIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [[PREditingFontPickerItem alloc] initWithFontConfiguration:v2 systemItem:0];

  return v3;
}

uint64_t __81__PREditingFontAndColorPickerViewController_loadComponentViewControllersIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSystemItem])
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v6 = [v3 fontConfiguration];
    uint64_t v7 = [v5 fontAndColorPickerViewController:v4 shouldShowFontConfiguration:v6];
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __81__PREditingFontAndColorPickerViewController_loadComponentViewControllersIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 fontConfiguration];
  uint64_t v4 = [v3 customFont];

  v5 = [v4 fontName];
  v6 = [*(id *)(a1 + 32) fontName];
  uint64_t v7 = BSEqualObjects();

  return v7;
}

uint64_t __81__PREditingFontAndColorPickerViewController_loadComponentViewControllersIfNeeded__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 fontConfiguration];
  int v5 = BSEqualObjects();

  [v3 isSystemItem];
  [*(id *)(a1 + 40) isSystemItem];
  return v5 & BSFloatEqualToFloat();
}

uint64_t __81__PREditingFontAndColorPickerViewController_loadComponentViewControllersIfNeeded__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 fontConfiguration];
  int v5 = [v4 timeFontIdentifier];
  v6 = [*(id *)(a1 + 32) timeFontIdentifier];
  int v7 = BSEqualObjects();

  [v3 isSystemItem];
  [*(id *)(a1 + 40) isSystemItem];
  return v7 & BSFloatEqualToFloat();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PREditingFontAndColorPickerViewController;
  [(PREditingFontAndColorPickerViewController *)&v3 viewDidLayoutSubviews];
  [(PREditingFontAndColorPickerViewController *)self updatePopoverContentSize];
}

- (void)loadView
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  [(PREditingFontAndColorPickerViewController *)self loadComponentViewControllersIfNeeded];
  objc_super v3 = [(PREditingFontAndColorPickerViewController *)self navigationController];
  uint64_t v4 = [v3 navigationBar];
  int v5 = [v4 topItem];

  [v5 _setManualScrollEdgeAppearanceProgress:0.0];
  v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 target:self action:sel__closeButtonTapped_];
    [v5 setRightBarButtonItem:v8];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v10 = [(PREditingFontAndColorPickerViewController *)self components];
  if ((self->_components & 8) != 0 && self->_titleLayoutPickerController) {
    objc_msgSend(v9, "addObject:");
  }
  if ((v10 & 1) != 0 && self->_fontPickerController) {
    objc_msgSend(v9, "addObject:");
  }
  if ((self->_components & 0x10) == 0)
  {
    if ((v10 & 2) == 0) {
      goto LABEL_11;
    }
LABEL_33:
    if (self->_numberingSystemViewController)
    {
      objc_msgSend(v9, "addObject:");
      if ((v10 & 4) == 0) {
        goto LABEL_13;
      }
    }
    else
    {
      [v5 setLeftBarButtonItem:self->_numberSystemBarItem];
      if ((v10 & 4) == 0) {
        goto LABEL_13;
      }
    }
    goto LABEL_12;
  }
  [v5 setLeftBarButtonItem:self->_titleAlignmentBarItem];
  if ((v10 & 2) != 0) {
    goto LABEL_33;
  }
LABEL_11:
  if ((v10 & 4) != 0) {
LABEL_12:
  }
    [v9 addObject:self->_colorPickerController];
LABEL_13:
  if ([(PREditorColorPickerConfiguration *)self->_colorPickerConfiguration colorWellDisplayMode] == 2
    && !self->_numberSystemBarItem)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F927B8]);
    v12 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v13 = [v12 colorWell];
    [v13 addTarget:self action:sel_colorWellDidUpdateColor_ forControlEvents:4096];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v12];
    [v5 setLeftBarButtonItem:v14];
    colorWell = self->_colorWell;
    self->_colorWell = (PUIColorWell *)v13;
    id v16 = v13;

    colorWellView = self->_colorWellView;
    self->_colorWellView = (PUIColorWellView *)v12;
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v19 = v9;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v97 objects:v105 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v98;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v98 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = [*(id *)(*((void *)&v97 + 1) + 8 * i) view];
        [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v18 addObject:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v97 objects:v105 count:16];
    }
    while (v21);
  }

  v72 = v18;
  v25 = (void *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v18];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v26 = v19;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v93 objects:v104 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v94;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v94 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v93 + 1) + 8 * j);
        [(PREditingFontAndColorPickerViewController *)self addChildViewController:v31];
        [v31 didMoveToParentViewController:self];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v93 objects:v104 count:16];
    }
    while (v28);
  }
  v71 = v5;
  v69 = v26;

  [v25 setAxis:1];
  [v25 setSpacing:48.0];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PREditingFontAndColorPickerViewController *)self setRootStackView:v25];
  id v32 = objc_alloc(MEMORY[0x1E4FB1F00]);
  v33 = [MEMORY[0x1E4FB14C8] effectWithStyle:8];
  uint64_t v34 = (void *)[v32 initWithEffect:v33];

  [v34 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v35 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v35 addSubview:v34];
  [v35 addSubview:v25];
  [(PREditingFontAndColorPickerViewController *)self setView:v35];
  v64 = (void *)MEMORY[0x1E4F28DC8];
  id v85 = [v25 leadingAnchor];
  id v87 = [v35 safeAreaLayoutGuide];
  id v83 = [v87 leadingAnchor];
  v81 = [v85 constraintEqualToAnchor:v83];
  v103[0] = v81;
  v77 = [v25 trailingAnchor];
  id v79 = [v35 safeAreaLayoutGuide];
  v75 = [v79 trailingAnchor];
  id obja = [v77 constraintEqualToAnchor:v75];
  v103[1] = obja;
  v70 = v25;
  v65 = [v25 topAnchor];
  id v66 = [v35 safeAreaLayoutGuide];
  v63 = [v66 topAnchor];
  v62 = [v65 constraintEqualToAnchor:v63 constant:7.0];
  v103[2] = v62;
  v61 = [v34 leadingAnchor];
  v60 = [v35 leadingAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v103[3] = v59;
  v36 = [v34 trailingAnchor];
  v37 = [v35 trailingAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  v103[4] = v38;
  v39 = [v34 bottomAnchor];
  v40 = [v35 bottomAnchor];
  double v41 = [v39 constraintEqualToAnchor:v40];
  v103[5] = v41;
  v68 = v34;
  double v42 = [v34 topAnchor];
  v67 = v35;
  v43 = [v35 topAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  v103[6] = v44;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:7];
  [v64 activateConstraints:v45];

  if ((unint64_t)[v72 count] < 2)
  {
    v46 = 0;
  }
  else
  {
    v46 = objc_msgSend(v72, "subarrayWithRange:", 1, objc_msgSend(v72, "count") - 1);
  }
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  obuint64_t j = v46;
  uint64_t v78 = [obj countByEnumeratingWithState:&v89 objects:v102 count:16];
  if (v78)
  {
    uint64_t v76 = *(void *)v90;
    do
    {
      for (uint64_t k = 0; k != v78; ++k)
      {
        if (*(void *)v90 != v76) {
          objc_enumerationMutation(obj);
        }
        v48 = *(void **)(*((void *)&v89 + 1) + 8 * k);
        id v49 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        v50 = [MEMORY[0x1E4FB1618] separatorColor];
        [v49 setBackgroundColor:v50];

        [v49 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v48 addSubview:v49];
        id v80 = (void *)MEMORY[0x1E4F28DC8];
        v88 = [v49 heightAnchor];
        v86 = [v88 constraintEqualToConstant:1.0];
        v101[0] = v86;
        v84 = [v49 leadingAnchor];
        id v82 = [v48 leadingAnchor];
        v51 = [v84 constraintEqualToAnchor:v82];
        v101[1] = v51;
        v52 = [v49 trailingAnchor];
        v53 = [v48 trailingAnchor];
        v54 = [v52 constraintEqualToAnchor:v53];
        v101[2] = v54;
        v55 = [v49 bottomAnchor];
        v56 = [v48 topAnchor];
        v57 = [v55 constraintEqualToAnchor:v56 constant:-24.0];
        v101[3] = v57;
        v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:4];
        [v80 activateConstraints:v58];
      }
      uint64_t v78 = [obj countByEnumeratingWithState:&v89 objects:v102 count:16];
    }
    while (v78);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PREditingFontAndColorPickerViewController;
  id v4 = a3;
  [(PREditingFontAndColorPickerViewController *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = objc_msgSend(v4, "userInterfaceStyle", v10.receiver, v10.super_class);

  v6 = [(PREditingFontAndColorPickerViewController *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    numberSystemBarItem = self->_numberSystemBarItem;
    id v9 = [(PREditorNumberingSystemPickerController *)self->_numberingSystemController menu];
    [(UIBarButtonItem *)numberSystemBarItem setMenu:v9];
  }
}

- (double)desiredDetent
{
  [(PREditingFontAndColorPickerViewController *)self loadComponentViewControllersIfNeeded];
  unint64_t components = self->_components;
  if ((components & 1) == 0)
  {
    BOOL v4 = 0;
    if ((components & 8) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    BOOL v5 = 0;
    if ((components & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    BOOL v6 = 0;
    goto LABEL_8;
  }
  BOOL v4 = self->_fontPickerController != 0;
  if ((components & 8) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  BOOL v5 = self->_titleLayoutPickerController != 0;
  if ((components & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  BOOL v6 = self->_colorPickerController != 0;
LABEL_8:
  double v7 = 0.0;
  if ((components & 2) != 0 && (numberingSystemViewController = self->_numberingSystemViewController) != 0)
  {
    [(PREditorNumberingSystemViewController *)numberingSystemViewController estimatedHeight];
    double v7 = v9 + 0.0;
    uint64_t v10 = 1;
    if (!v4) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if (!v4) {
      goto LABEL_16;
    }
  }
  [(PREditingFontPickerComponentViewController *)self->_fontPickerController estimatedHeight];
  double v12 = v7 + v11;
  ++v10;
  if (v6) {
    double v7 = v12 + 48.0;
  }
  else {
    double v7 = v12;
  }
LABEL_16:
  if (v5)
  {
    [(PREditingTitleLayoutPickerComponentViewController *)self->_titleLayoutPickerController estimatedHeight];
    double v7 = v7 + v15;
    uint64_t v10 = 1;
    if (v6) {
      goto LABEL_18;
    }
  }
  else if (v6)
  {
LABEL_18:
    [(PREditingColorPickerComponentViewController *)self->_colorPickerController estimatedHeight];
    return v7 + v13 + 84.0;
  }
  double result = v7 + 84.0;
  if (!v10) {
    return 100.0;
  }
  return result;
}

- (BOOL)_shouldShowWeightSliderForSelectedFont
{
  if (_os_feature_enabled_impl())
  {
    objc_super v3 = [(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration timeFontConfiguration];
    BOOL v4 = [(PREditingFontAndColorPickerViewController *)self extensionBundleURL];
    BOOL v5 = [v3 timeFontConfigurationWithExtensionBundleURL:v4];

    if ([v3 isSystemItem])
    {
      BOOL v6 = [v5 timeFontIdentifier];
      int v7 = [v6 isEqual:@"PRTimeFontIdentifierRail"] ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)setContentsLuminance:(double)a3
{
  self->_contentsLuminance = a3;
  if ([(PREditingFontAndColorPickerViewController *)self isViewLoaded])
  {
    colorPickerController = self->_colorPickerController;
    [(PREditingColorPickerComponentViewController *)colorPickerController setContentsLuminance:a3];
  }
}

- (void)_closeButtonTapped:(id)a3
{
  [(PREditingFontAndColorPickerViewController *)self _signalDelegateDidFinish];
  [(PREditingFontAndColorPickerViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_signalDelegateDidFinish
{
  id v3 = [(PREditingFontAndColorPickerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 fontAndColorPickerViewControllerDidFinish:self];
  }
}

- (id)localeWithNumberingSystem:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA20];
  id v4 = a3;
  BOOL v5 = [v3 currentLocale];
  BOOL v6 = [v5 localeIdentifier];

  int v7 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v6];
  v8 = (void *)[v7 mutableCopy];

  [v8 setObject:v4 forKey:@"numbers"];
  double v9 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v8];
  uint64_t v10 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v9];

  return v10;
}

- (void)fontPickerComponentViewControllerDidChangeHeight:(id)a3
{
  id v4 = [(PREditingFontAndColorPickerViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [(PREditingFontAndColorPickerViewController *)self desiredDetent];
    objc_msgSend(v4, "fontAndColorPickerViewController:didUpdateDesiredDetent:", self);
  }
}

- (void)fontPickerComponentViewController:(id)a3 didChangeFontWeight:(double)a4
{
  BOOL v6 = [(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration timeFontConfiguration];
  int v7 = [(PREditingFontAndColorPickerViewController *)self extensionBundleURL];
  id v14 = [v6 timeFontConfigurationWithExtensionBundleURL:v7];

  v8 = [v14 effectiveFontForRole:self->_role ignoringWeight:1];
  unint64_t v9 = objc_msgSend(v8, "pr_variantWeightRange");
  unint64_t v11 = v10;
  double v12 = [(PREditingFontAndColorPickerViewController *)self changeHandler];
  if (v12)
  {
    double v13 = [NSNumber numberWithDouble:(double)v11 * a4 + (1.0 - a4) * (double)v9];
    ((void (**)(void, void, void, void, void *, void, void, void, void))v12)[2](v12, 0, 0, 0, v13, 0, 0, 0, 0);
  }
}

- (void)fontPickerComponentViewController:(id)a3 didSelectItem:(id)a4
{
  id v30 = a3;
  id v6 = a4;
  int v7 = [v6 fontConfiguration];
  v8 = [v7 effectiveFontForRole:self->_role];

  [(PREditorNumberingSystemPickerController *)self->_numberingSystemController setFont:v8];
  unint64_t v9 = [(PREditorNumberingSystemPickerController *)self->_numberingSystemController menu];
  [(UIBarButtonItem *)self->_numberSystemBarItem setMenu:v9];
  unint64_t v10 = [v6 fontConfiguration];
  unint64_t v11 = [v10 effectiveFontForRole:self->_role ignoringWeight:1];

  double v12 = [(PREditingFontAndColorPickerViewController *)self changeHandler];
  if (v12)
  {
    double v13 = [(PREditingFontAndColorPickerViewController *)self additionalFontConfigurations];
    id v14 = [v6 fontConfiguration];
    int v15 = [v13 containsObject:v14];

    id v16 = [v6 fontConfiguration];
    v17 = [v16 timeFontIdentifier];

    if ((v15 & 1) != 0 || v17 == @"PRTimeFontIdentifierRail")
    {
      v23 = [v6 fontConfiguration];
      [v23 weight];
      double v22 = v24;
    }
    else
    {
      unint64_t v18 = objc_msgSend(v11, "pr_variantWeightRange");
      unint64_t v20 = v19;
      [v30 fontWeight];
      double v22 = v21 * (double)v20 + (1.0 - v21) * (double)v18;
    }
    if (v15) {
      v25 = v8;
    }
    else {
      v25 = 0;
    }
    id v26 = NSNumber;
    id v27 = v25;
    uint64_t v28 = [v26 numberWithDouble:v22];
    uint64_t v29 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isSystemItem"));
    ((void (**)(void, __CFString *, void, void, void *, void *, id, void, void))v12)[2](v12, v17, 0, 0, v28, v29, v27, 0, 0);
  }
}

- (void)titleLayoutPickerComponentViewController:(id)a3 didSelectTitleLayout:(unint64_t)a4 userSelected:(BOOL)a5
{
  unint64_t v5 = a4;
  unint64_t v7 = +[PRIncomingCallMetricsProvider maxVerticalTextLength];
  if (PRPosterTitleLayoutIsVertical(v5))
  {
    v8 = [(PREditingFontAndColorPickerViewController *)self titleString];
    unint64_t v9 = [v8 length];

    if (v9 > v7)
    {
      unint64_t v10 = NSString;
      unint64_t v11 = PRBundle();
      double v12 = [v11 localizedStringForKey:@"CANNOT_CHANGE_LAYOUT_EXPLANATION" value:&stru_1ED9A3120 table:@"PosterKit"];
      double v13 = objc_msgSend(v10, "stringWithFormat:", v12, v7);

      id v14 = (void *)MEMORY[0x1E4FB1418];
      int v15 = PRBundle();
      id v16 = [v15 localizedStringForKey:@"CANNOT_CHANGE_LAYOUT" value:&stru_1ED9A3120 table:@"PosterKit"];
      v17 = [v14 alertControllerWithTitle:v16 message:v13 preferredStyle:1];

      unint64_t v18 = (void *)MEMORY[0x1E4FB1410];
      unint64_t v19 = PRBundle();
      unint64_t v20 = [v19 localizedStringForKey:@"CANNOT_CHANGE_LAYOUT_DISMISS_ACTION" value:&stru_1ED9A3120 table:@"PosterKit"];
      double v21 = [v18 actionWithTitle:v20 style:0 handler:0];

      [v17 addAction:v21];
      [(PREditingFontAndColorPickerViewController *)self presentViewController:v17 animated:1 completion:0];

      unint64_t v5 = 0;
    }
  }
  double v22 = [(PREditingFontAndColorPickerViewController *)self titleLayoutPickerController];

  if (v22)
  {
    v23 = [(PREditingFontAndColorPickerViewController *)self titleLayoutPickerController];
    [v23 setSelectedTitleLayout:v5];
  }
  double v24 = [(PREditingFontAndColorPickerViewController *)self changeHandler];
  if (v24)
  {
    id v26 = v24;
    v25 = [NSNumber numberWithUnsignedInteger:v5];
    (*((void (**)(id, void, void, void *, void, void, void, void, void))v26 + 2))(v26, 0, 0, v25, 0, 0, 0, 0, 0);

    double v24 = v26;
  }
}

- (void)numberingSystemPickerController:(id)a3 didSelectNumberingSystem:(id)a4
{
  id v6 = a4;
  id v7 = [a3 displayLocale];
  [(PREditingFontAndColorPickerViewController *)self numberingSystemWasChanged:v6 locale:v7];
}

- (void)numberingSystemViewController:(id)a3 didSelectNumberingSystem:(id)a4
{
  id v6 = a4;
  id v7 = [a3 displayLocale];
  [(PREditingFontAndColorPickerViewController *)self numberingSystemWasChanged:v6 locale:v7];
}

- (void)numberingSystemWasChanged:(id)a3 locale:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(PREditingFontAndColorPickerViewController *)self fontPickerController];
  v8 = v7;
  if (v7) {
    [v7 setLocale:v6];
  }
  numberingSystemController = self->_numberingSystemController;
  if (numberingSystemController)
  {
    unint64_t v10 = [(PREditorNumberingSystemPickerController *)numberingSystemController menu];
    [(UIBarButtonItem *)self->_numberSystemBarItem setMenu:v10];
  }
  uint64_t v11 = [(PREditingFontAndColorPickerViewController *)self changeHandler];
  double v12 = (void *)v11;
  if (v11) {
    (*(void (**)(uint64_t, void, void, void, void, void, void, id, void))(v11 + 16))(v11, 0, 0, 0, 0, 0, 0, v13, 0);
  }
}

+ (id)defaultFontIdentifiersForRole:(id)a3
{
  return (id)[a1 defaultFontIdentifiersForRole:a3 titleString:0];
}

+ (id)defaultFontIdentifiersForRole:(id)a3 titleString:(id)a4
{
  return +[PREditingFontPickerComponentViewController defaultFontIdentifiersForRole:a3 titleString:a4];
}

- (void)didPressTitleAlignmentBarButtonItem:(id)a3
{
  unint64_t v4 = [(PRTitleAlignmentBarButtonItem *)self->_titleAlignmentBarItem toggle];
  id v6 = [(PREditingFontAndColorPickerViewController *)self changeHandler];
  if (v6)
  {
    unint64_t v5 = [NSNumber numberWithUnsignedInteger:v4];
    (*((void (**)(id, void, void *, void, void, void, void, void, void))v6 + 2))(v6, 0, v5, 0, 0, 0, 0, 0, 0);
  }
}

- (void)updatePopoverContentSize
{
  id v8 = [(PREditingFontAndColorPickerViewController *)self navigationController];
  id v3 = [v8 navigationBar];
  [v3 frame];
  double v5 = v4;

  id v6 = [(PREditingFontAndColorPickerViewController *)self rootStackView];
  [v6 bounds];
  objc_msgSend(v8, "setPreferredContentSize:", 370.0, v5 + v7 + -15.0);
}

- (void)colorPickerComponentViewController:(id)a3 didSelectColorItem:(id)a4 userSelected:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a4;
  if ([v12 isFromUIKitColorPicker])
  {
    colorWell = self->_colorWell;
    if (colorWell)
    {
      id v8 = [v12 color];
      unint64_t v9 = [v8 color];
      [(PUIColorWell *)colorWell setSelectedColor:v9];
    }
  }
  if (v5)
  {
    uint64_t v10 = [(PREditingFontAndColorPickerViewController *)self changeHandler];
    uint64_t v11 = (void *)v10;
    if (v10) {
      (*(void (**)(uint64_t, void, void, void, void, void, void, void, id))(v10 + 16))(v10, 0, 0, 0, 0, 0, 0, 0, v12);
    }
  }
}

- (void)colorPickerComponentViewControllerDidChangeHeight:(id)a3
{
  id v4 = [(PREditingFontAndColorPickerViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [(PREditingFontAndColorPickerViewController *)self desiredDetent];
    objc_msgSend(v4, "fontAndColorPickerViewController:didUpdateDesiredDetent:", self);
  }
}

- (void)colorWellDidUpdateColor:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PREditingFontAndColorPickerViewController *)self colorWell];
  [v5 invalidateIntrinsicContentSize];

  id v6 = [(PREditingFontAndColorPickerViewController *)self colorWellView];
  [v6 setNeedsLayout];

  id v12 = [v4 selectedColor];

  double v7 = [[PRPosterColor alloc] initWithColor:v12];
  id v8 = [[PREditorColorPickerConstantColor alloc] initWithColor:v7 initialVariation:0.0];
  unint64_t v9 = [[PREditingColorItem alloc] initWithPickerColor:v8 variation:[(PREditorColorPickerConfiguration *)self->_colorPickerConfiguration context] context:0.0];
  [(PREditingColorItem *)v9 setFromUIKitColorPicker:1];
  [(PREditingColorPickerComponentViewController *)self->_colorPickerController updateForColorWellSelectedItem:v9];
  uint64_t v10 = [(PREditingFontAndColorPickerViewController *)self changeHandler];
  uint64_t v11 = (void *)v10;
  if (v10) {
    (*(void (**)(uint64_t, void, void, void, void, void, void, void, PREditingColorItem *))(v10 + 16))(v10, 0, 0, 0, 0, 0, 0, 0, v9);
  }
}

- (unint64_t)components
{
  return self->_components;
}

- (PREditingColorVariationStore)colorVariationStore
{
  return self->_colorVariationStore;
}

- (void)setColorVariationStore:(id)a3
{
}

- (PRPosterTitleStyleConfiguration)titleStyleConfiguration
{
  return self->_titleStyleConfiguration;
}

- (void)setTitleStyleConfiguration:(id)a3
{
}

- (PREditorColorPickerConfiguration)colorPickerConfiguration
{
  return self->_colorPickerConfiguration;
}

- (void)setColorPickerConfiguration:(id)a3
{
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (NSURL)extensionBundleURL
{
  return self->_extensionBundleURL;
}

- (void)setExtensionBundleURL:(id)a3
{
}

- (PREditingFontAndColorPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PREditingFontAndColorPickerViewControllerDelegate *)WeakRetained;
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

- (PREditingColorPickerComponentViewController)colorPickerController
{
  return self->_colorPickerController;
}

- (void)setColorPickerController:(id)a3
{
}

- (PUIColorWellView)colorWellView
{
  return self->_colorWellView;
}

- (void)setColorWellView:(id)a3
{
}

- (PUIColorWell)colorWell
{
  return self->_colorWell;
}

- (void)setColorWell:(id)a3
{
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
}

- (BOOL)hasLoadedComponentViewControllers
{
  return self->_hasLoadedComponentViewControllers;
}

- (void)setHasLoadedComponentViewControllers:(BOOL)a3
{
  self->_hasLoadedComponentViewControllers = a3;
}

- (UIStackView)rootStackView
{
  return self->_rootStackView;
}

- (void)setRootStackView:(id)a3
{
}

- (UIBarButtonItem)numberSystemBarItem
{
  return self->_numberSystemBarItem;
}

- (void)setNumberSystemBarItem:(id)a3
{
}

- (PREditorNumberingSystemPickerController)numberingSystemController
{
  return self->_numberingSystemController;
}

- (void)setNumberingSystemController:(id)a3
{
}

- (PRTitleAlignmentBarButtonItem)titleAlignmentBarItem
{
  return self->_titleAlignmentBarItem;
}

- (void)setTitleAlignmentBarItem:(id)a3
{
}

- (PREditingFontPickerComponentViewController)fontPickerController
{
  return self->_fontPickerController;
}

- (void)setFontPickerController:(id)a3
{
}

- (PREditingTitleLayoutPickerComponentViewController)titleLayoutPickerController
{
  return self->_titleLayoutPickerController;
}

- (void)setTitleLayoutPickerController:(id)a3
{
}

- (PREditorNumberingSystemViewController)numberingSystemViewController
{
  return self->_numberingSystemViewController;
}

- (void)setNumberingSystemViewController:(id)a3
{
}

- (NSArray)additionalFontConfigurations
{
  return self->_additionalFontConfigurations;
}

- (void)setAdditionalFontConfigurations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalFontConfigurations, 0);
  objc_storeStrong((id *)&self->_numberingSystemViewController, 0);
  objc_storeStrong((id *)&self->_titleLayoutPickerController, 0);
  objc_storeStrong((id *)&self->_fontPickerController, 0);
  objc_storeStrong((id *)&self->_titleAlignmentBarItem, 0);
  objc_storeStrong((id *)&self->_numberingSystemController, 0);
  objc_storeStrong((id *)&self->_numberSystemBarItem, 0);
  objc_storeStrong((id *)&self->_rootStackView, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_colorWell, 0);
  objc_storeStrong((id *)&self->_colorWellView, 0);
  objc_storeStrong((id *)&self->_colorPickerController, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_extensionBundleURL, 0);
  objc_storeStrong((id *)&self->_colorPickerConfiguration, 0);
  objc_storeStrong((id *)&self->_titleStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_colorVariationStore, 0);
}

@end