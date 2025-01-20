@interface PREditingFontAndContentStylePickerViewController
+ (id)defaultFontIdentifiersForRole:(id)a3;
+ (id)defaultFontIdentifiersForRole:(id)a3 titleString:(id)a4;
- (BOOL)_shouldShowWeightSliderForSelectedFont;
- (BOOL)hasLoadedComponentViewControllers;
- (NSArray)additionalFontConfigurations;
- (NSString)role;
- (NSString)titleString;
- (NSURL)extensionBundleURL;
- (PREditingContentStylePickerComponentViewController)contentStylePickerController;
- (PREditingFontAndContentStylePickerViewController)initWithComponents:(unint64_t)a3 role:(id)a4 titleString:(id)a5;
- (PREditingFontAndContentStylePickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PREditingFontAndContentStylePickerViewControllerDelegate)delegate;
- (PREditingFontPickerComponentViewController)fontPickerController;
- (PREditingTitleLayoutPickerComponentViewController)titleLayoutPickerController;
- (PREditorContentStylePickerConfiguration)contentStylePickerConfiguration;
- (PREditorNumberingSystemPickerController)numberingSystemController;
- (PREditorNumberingSystemViewController)numberingSystemViewController;
- (PRPosterTitleStyleConfiguration)titleStyleConfiguration;
- (PRTitleAlignmentBarButtonItem)titleAlignmentBarItem;
- (UIBarButtonItem)numberSystemBarItem;
- (UIStackView)rootStackView;
- (double)contentsLuminance;
- (double)desiredDetent;
- (id)changeHandler;
- (id)contentStylePickerComponentViewController:(id)a3 coordinatorForStyle:(id)a4 isSuggested:(BOOL)a5;
- (id)localeWithNumberingSystem:(id)a3;
- (unint64_t)components;
- (void)_closeButtonTapped:(id)a3;
- (void)_signalDelegateDidFinish;
- (void)contentStylePickerComponentViewController:(id)a3 didSelectStyle:(id)a4 isSuggestedStyle:(BOOL)a5 userSelected:(BOOL)a6;
- (void)contentStylePickerComponentViewControllerDidChangeHeight:(id)a3;
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
- (void)setContentStylePickerConfiguration:(id)a3;
- (void)setContentStylePickerController:(id)a3;
- (void)setContentsLuminance:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setExtensionBundleURL:(id)a3;
- (void)setFontPickerController:(id)a3;
- (void)setHasLoadedComponentViewControllers:(BOOL)a3;
- (void)setNumberSystemBarItem:(id)a3;
- (void)setNumberingSystemController:(id)a3;
- (void)setNumberingSystemViewController:(id)a3;
- (void)setRootStackView:(id)a3;
- (void)setTitleAlignmentBarItem:(id)a3;
- (void)setTitleLayoutPickerController:(id)a3;
- (void)setTitleString:(id)a3;
- (void)setTitleStyleConfiguration:(id)a3;
- (void)titleLayoutPickerComponentViewController:(id)a3 didSelectTitleLayout:(unint64_t)a4 userSelected:(BOOL)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation PREditingFontAndContentStylePickerViewController

- (PREditingFontAndContentStylePickerViewController)initWithComponents:(unint64_t)a3 role:(id)a4 titleString:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PREditingFontAndContentStylePickerViewController;
  v10 = [(PREditingFontAndContentStylePickerViewController *)&v17 initWithNibName:0 bundle:0];
  v11 = v10;
  if (v10)
  {
    v10->_components = a3;
    v10->_contentsLuminance = 0.5;
    uint64_t v12 = [v8 copy];
    role = v11->_role;
    v11->_role = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    titleString = v11->_titleString;
    v11->_titleString = (NSString *)v14;
  }
  return v11;
}

- (PREditingFontAndContentStylePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return [(PREditingFontAndContentStylePickerViewController *)self initWithComponents:31 role:@"PRPosterRoleLockScreen" titleString:0];
}

- (void)loadComponentViewControllersIfNeeded
{
  if (!self->_hasLoadedComponentViewControllers)
  {
    unint64_t v3 = [(PREditingFontAndContentStylePickerViewController *)self components];
    v4 = [(PREditingFontAndContentStylePickerViewController *)self extensionBundleURL];
    if (v4)
    {
      v5 = [(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration effectiveTimeFontWithExtensionBundleURL:v4 forRole:self->_role];
    }
    else
    {
      v5 = 0;
    }
    v6 = [(PREditingFontAndContentStylePickerViewController *)self delegate];
    if (v3)
    {
      v61 = v5;
      id v8 = +[PREditingFontPickerComponentViewController defaultItemsForRole:self->_role titleString:self->_titleString];
      if (![(NSString *)self->_role isEqualToString:@"PRPosterRoleIncomingCall"]
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        id v9 = [v6 additionalFontConfigurationsForFontAndContentStylePickerViewController:self];
        if (v9)
        {
          [(PREditingFontAndContentStylePickerViewController *)self setAdditionalFontConfigurations:v9];
          v10 = objc_msgSend(v9, "bs_map:", &__block_literal_global_24);
          [v8 arrayByAddingObjectsFromArray:v10];
          uint64_t v12 = v11 = v6;

          id v8 = (void *)v12;
          v6 = v11;
        }
      }
      if (objc_opt_respondsToSelector())
      {
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __88__PREditingFontAndContentStylePickerViewController_loadComponentViewControllersIfNeeded__block_invoke_2;
        v71[3] = &unk_1E54DB158;
        id v72 = v6;
        v73 = self;
        uint64_t v13 = objc_msgSend(v8, "bs_filter:", v71);

        v59 = (void *)v13;
      }
      else
      {
        v59 = v8;
      }
      uint64_t v14 = [(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration timeFontConfiguration];
      v15 = [v14 timeFontConfigurationWithExtensionBundleURL:v4];
      v16 = [v15 customFont];

      v62 = v4;
      v60 = v15;
      if (v16)
      {
        objc_super v17 = [v15 customFont];
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __88__PREditingFontAndContentStylePickerViewController_loadComponentViewControllersIfNeeded__block_invoke_3;
        v69[3] = &unk_1E54DB180;
        id v70 = v17;
        id v18 = v17;
        v19 = v59;
        v20 = objc_msgSend(v59, "bs_firstObjectPassingTest:", v69);
      }
      else
      {
        v57 = v6;
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __88__PREditingFontAndContentStylePickerViewController_loadComponentViewControllersIfNeeded__block_invoke_4;
        v66[3] = &unk_1E54DB158;
        id v21 = v15;
        id v67 = v21;
        id v22 = v14;
        id v68 = v22;
        v19 = v59;
        v20 = objc_msgSend(v59, "bs_firstObjectPassingTest:", v66);
        if (!v20)
        {
          v63[0] = MEMORY[0x1E4F143A8];
          v63[1] = 3221225472;
          v63[2] = __88__PREditingFontAndContentStylePickerViewController_loadComponentViewControllersIfNeeded__block_invoke_5;
          v63[3] = &unk_1E54DB158;
          id v64 = v21;
          id v65 = v22;
          v20 = objc_msgSend(v59, "bs_firstObjectPassingTest:", v63);
        }
        id v18 = v67;
        v6 = v57;
      }

      unint64_t v23 = [v19 count];
      BOOL v24 = [(PREditingFontAndContentStylePickerViewController *)self _shouldShowWeightSliderForSelectedFont];
      LODWORD(v7) = v23 > 1 || v24;
      if (v7 == 1)
      {
        v56 = v14;
        v58 = v6;
        v25 = [[PREditingFontPickerComponentViewController alloc] initWithItems:v19 selectedItem:v20 role:self->_role titleString:self->_titleString];
        v26 = [(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration timeFontConfiguration];
        v27 = [(PREditingFontAndContentStylePickerViewController *)self extensionBundleURL];
        v7 = [v26 timeFontConfigurationWithExtensionBundleURL:v27];

        v28 = [(PREditingTitleLayoutPickerComponentViewController *)v7 effectiveFontForRole:self->_role ignoringWeight:1];
        unint64_t v29 = objc_msgSend(v28, "pr_variantWeightRange");
        unint64_t v31 = v30;
        [(PREditingTitleLayoutPickerComponentViewController *)v7 weight];
        [(PREditingFontPickerComponentViewController *)v25 setFontWeight:(v32 - (double)v29) / ((double)v31 - (double)v29)];
        v33 = [(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration timeNumberingSystem];
        if (v33)
        {
          v34 = [(PREditingFontAndContentStylePickerViewController *)self localeWithNumberingSystem:v33];
          [(PREditingFontPickerComponentViewController *)v25 setLocale:v34];
        }
        [(PREditingFontPickerComponentViewController *)v25 setDelegate:self];
        [(PREditingFontAndContentStylePickerViewController *)self setFontPickerController:v25];

        uint64_t v14 = v56;
        v6 = v58;
        LOBYTE(v7) = 1;
      }

      v5 = v61;
      v4 = v62;
      if ((v3 & 0x10) == 0)
      {
LABEL_30:
        if ((v3 & 8) != 0)
        {
          char v37 = (char)v7;
          v38 = +[PREditingTitleLayoutPickerComponentViewController defaultTitleLayoutsForRole:self->_role];
          v7 = [[PREditingTitleLayoutPickerComponentViewController alloc] initWithTitleLayouts:v38 selectedLayout:[(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration preferredTitleLayout]];
          [(PREditingTitleLayoutPickerComponentViewController *)v7 setDelegate:self];
          [(PREditingFontAndContentStylePickerViewController *)self setTitleLayoutPickerController:v7];

          LOBYTE(v7) = v37;
          if ((v3 & 4) == 0)
          {
LABEL_32:
            if ((v3 & 2) == 0) {
              goto LABEL_40;
            }
            goto LABEL_36;
          }
        }
        else if ((v3 & 4) == 0)
        {
          goto LABEL_32;
        }
        v39 = [[PREditingContentStylePickerComponentViewController alloc] initWithConfiguration:self->_contentStylePickerConfiguration];
        [(PREditingContentStylePickerComponentViewController *)v39 setDelegate:self];
        [(PREditingContentStylePickerComponentViewController *)v39 setContentsLuminance:self->_contentsLuminance];
        [(PREditingFontAndContentStylePickerViewController *)self setContentStylePickerController:v39];

        if ((v3 & 2) == 0)
        {
LABEL_40:
          self->_hasLoadedComponentViewControllers = 1;

          return;
        }
LABEL_36:
        if ((v3 >> 2) & 1 | v7 & 1)
        {
          v40 = [PREditorNumberingSystemPickerController alloc];
          v41 = [(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration effectiveTimeNumberingSystem];
          v42 = [(PREditorNumberingSystemPickerController *)v40 initWithSelectedNumberingSystem:v41 selectedFont:v5];

          [(PREditorNumberingSystemPickerController *)v42 setDelegate:self];
          numberingSystemController = self->_numberingSystemController;
          self->_numberingSystemController = v42;
          v44 = v6;
          v45 = v42;

          v46 = (void *)MEMORY[0x1E4FB1818];
          v47 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
          v48 = [v46 systemImageNamed:@"globe" withConfiguration:v47];

          id v49 = objc_alloc(MEMORY[0x1E4FB14A8]);
          v50 = [(PREditorNumberingSystemPickerController *)v45 menu];
          v51 = (UIBarButtonItem *)[v49 initWithImage:v48 menu:v50];

          numberSystemBarItem = self->_numberSystemBarItem;
          self->_numberSystemBarItem = v51;

          v6 = v44;
        }
        else
        {
          v53 = [PREditorNumberingSystemViewController alloc];
          [(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration effectiveTimeNumberingSystem];
          v55 = v54 = v6;
          v48 = [(PREditorNumberingSystemViewController *)v53 initWithSelectedNumberingSystem:v55 selectedFont:v5];

          v6 = v54;
          [(PREditorNumberingSystemViewController *)v48 setDelegate:self];
          [(PREditingFontAndContentStylePickerViewController *)self setNumberingSystemViewController:v48];
        }

        goto LABEL_40;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
      if ((v3 & 0x10) == 0) {
        goto LABEL_30;
      }
    }
    v35 = [[PRTitleAlignmentBarButtonItem alloc] initWithTitleAlignment:[(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration preferredTitleAlignment] target:self action:sel_didPressTitleAlignmentBarButtonItem_];
    titleAlignmentBarItem = self->_titleAlignmentBarItem;
    self->_titleAlignmentBarItem = v35;

    goto LABEL_30;
  }
}

PREditingFontPickerItem *__88__PREditingFontAndContentStylePickerViewController_loadComponentViewControllersIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [[PREditingFontPickerItem alloc] initWithFontConfiguration:v2 systemItem:0];

  return v3;
}

uint64_t __88__PREditingFontAndContentStylePickerViewController_loadComponentViewControllersIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSystemItem])
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v6 = [v3 fontConfiguration];
    uint64_t v7 = [v5 fontAndContentStylePickerViewController:v4 shouldShowFontConfiguration:v6];
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __88__PREditingFontAndContentStylePickerViewController_loadComponentViewControllersIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 fontConfiguration];
  uint64_t v4 = [v3 customFont];

  v5 = [v4 fontName];
  v6 = [*(id *)(a1 + 32) fontName];
  uint64_t v7 = BSEqualObjects();

  return v7;
}

uint64_t __88__PREditingFontAndContentStylePickerViewController_loadComponentViewControllersIfNeeded__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 fontConfiguration];
  int v5 = BSEqualObjects();

  [v3 isSystemItem];
  [*(id *)(a1 + 40) isSystemItem];
  return v5 & BSFloatEqualToFloat();
}

uint64_t __88__PREditingFontAndContentStylePickerViewController_loadComponentViewControllersIfNeeded__block_invoke_5(uint64_t a1, void *a2)
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
  v10.receiver = self;
  v10.super_class = (Class)PREditingFontAndContentStylePickerViewController;
  [(PREditingFontAndContentStylePickerViewController *)&v10 viewDidLayoutSubviews];
  id v3 = [(PREditingFontAndContentStylePickerViewController *)self navigationController];
  uint64_t v4 = [v3 navigationBar];
  [v4 frame];
  double v6 = v5;

  int v7 = [(PREditingFontAndContentStylePickerViewController *)self rootStackView];
  [v7 bounds];
  objc_msgSend(v3, "setPreferredContentSize:", v9, v6 + v8 + -15.0);
}

- (void)loadView
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  [(PREditingFontAndContentStylePickerViewController *)self loadComponentViewControllersIfNeeded];
  id v3 = [(PREditingFontAndContentStylePickerViewController *)self navigationController];
  uint64_t v4 = [v3 navigationBar];
  double v5 = [v4 topItem];

  [v5 _setManualScrollEdgeAppearanceProgress:0.0];
  double v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    double v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 target:self action:sel__closeButtonTapped_];
    [v5 setRightBarButtonItem:v8];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v10 = [(PREditingFontAndContentStylePickerViewController *)self components];
  if ((v10 & 1) != 0 && (fontPickerController = self->_fontPickerController) != 0)
  {
    uint64_t v12 = [(PREditingFontPickerComponentViewController *)fontPickerController items];
    unint64_t v13 = [v12 count];

    if (v13 < 2)
    {
      int v14 = 0;
      int v15 = 0;
    }
    else
    {
      [v9 addObject:self->_fontPickerController];
      int v14 = 0;
      int v15 = 1;
    }
  }
  else
  {
    int v15 = 0;
    int v14 = 1;
  }
  unint64_t components = self->_components;
  if ((components & 0x10) != 0)
  {
    [v5 setLeftBarButtonItem:self->_titleAlignmentBarItem];
    unint64_t components = self->_components;
  }
  if ((components & 8) != 0 && self->_titleLayoutPickerController) {
    objc_msgSend(v9, "addObject:");
  }
  if (((v14 | v15) & 1) == 0) {
    [v9 addObject:self->_fontPickerController];
  }
  if ((v10 & 2) != 0)
  {
    if (self->_numberingSystemViewController) {
      objc_msgSend(v9, "addObject:");
    }
    else {
      [v5 setLeftBarButtonItem:self->_numberSystemBarItem];
    }
  }
  if ((v10 & 4) != 0) {
    [v9 addObject:self->_contentStylePickerController];
  }
  objc_super v17 = [(PREditingContentStylePickerComponentViewController *)self->_contentStylePickerController colorWell];
  if (v17)
  {
    numberSystemBarItem = self->_numberSystemBarItem;

    if (!numberSystemBarItem)
    {
      v19 = [(PREditingContentStylePickerComponentViewController *)self->_contentStylePickerController colorWellView];
      v20 = [v19 colorWell];
      [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v21 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v19];
      [v5 setLeftBarButtonItem:v21];
    }
  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v23 = v9;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v107 objects:v115 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v108;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v108 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = [*(id *)(*((void *)&v107 + 1) + 8 * i) view];
        [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v22 addObject:v28];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v107 objects:v115 count:16];
    }
    while (v25);
  }

  unint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v22];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v30 = v23;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v103 objects:v114 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v104;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v104 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v103 + 1) + 8 * j);
        [(PREditingFontAndContentStylePickerViewController *)self addChildViewController:v35];
        [v35 didMoveToParentViewController:self];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v103 objects:v114 count:16];
    }
    while (v32);
  }
  v82 = v22;
  v78 = v5;

  [v29 setAxis:1];
  [v29 setSpacing:48.0];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PREditingFontAndContentStylePickerViewController *)self setRootStackView:v29];
  id v36 = objc_alloc(MEMORY[0x1E4FB1F00]);
  char v37 = [MEMORY[0x1E4FB14C8] effectWithStyle:8];
  v38 = (void *)[v36 initWithEffect:v37];

  [v38 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v39 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v39 addSubview:v38];
  [v39 addSubview:v29];
  [(PREditingFontAndContentStylePickerViewController *)self setView:v39];
  v74 = (void *)MEMORY[0x1E4F28DC8];
  v95 = [v29 leadingAnchor];
  v97 = [v39 safeAreaLayoutGuide];
  v93 = [v97 leadingAnchor];
  v91 = [v95 constraintEqualToAnchor:v93];
  v113[0] = v91;
  v87 = [v29 trailingAnchor];
  v89 = [v39 safeAreaLayoutGuide];
  v85 = [v89 trailingAnchor];
  id obja = [v87 constraintEqualToAnchor:v85];
  v113[1] = obja;
  v80 = v29;
  v75 = [v29 topAnchor];
  v76 = [v39 safeAreaLayoutGuide];
  v73 = [v76 topAnchor];
  id v72 = [v75 constraintEqualToAnchor:v73 constant:7.0];
  v113[2] = v72;
  v71 = [v38 leadingAnchor];
  id v70 = [v39 leadingAnchor];
  v69 = [v71 constraintEqualToAnchor:v70];
  v113[3] = v69;
  id v68 = [v38 trailingAnchor];
  [v39 trailingAnchor];
  v40 = v81 = v30;
  v41 = [v68 constraintEqualToAnchor:v40];
  v113[4] = v41;
  v42 = [v38 bottomAnchor];
  v43 = [v39 bottomAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  v113[5] = v44;
  v77 = v38;
  v45 = [v38 topAnchor];
  v79 = v39;
  v46 = [v39 topAnchor];
  v47 = [v45 constraintEqualToAnchor:v46];
  v113[6] = v47;
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:7];
  [v74 activateConstraints:v48];

  if ([v81 count] == 1)
  {
    id v49 = [v81 firstObject];
    v50 = [(PREditingFontAndContentStylePickerViewController *)self numberingSystemViewController];

    if (v49 == v50)
    {
      v51 = [v80 bottomAnchor];
      v52 = [v79 safeAreaLayoutGuide];
      v53 = [v52 bottomAnchor];
      v54 = [v51 constraintEqualToAnchor:v53];

      [v54 setActive:1];
    }
  }
  if ((unint64_t)[v82 count] < 2)
  {
    v55 = 0;
  }
  else
  {
    v55 = objc_msgSend(v82, "subarrayWithRange:", 1, objc_msgSend(v82, "count") - 1);
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  obuint64_t j = v55;
  uint64_t v88 = [obj countByEnumeratingWithState:&v99 objects:v112 count:16];
  if (v88)
  {
    uint64_t v86 = *(void *)v100;
    do
    {
      for (uint64_t k = 0; k != v88; ++k)
      {
        if (*(void *)v100 != v86) {
          objc_enumerationMutation(obj);
        }
        v57 = *(void **)(*((void *)&v99 + 1) + 8 * k);
        id v58 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        v59 = [MEMORY[0x1E4FB1618] separatorColor];
        [v58 setBackgroundColor:v59];

        [v58 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v57 addSubview:v58];
        v90 = (void *)MEMORY[0x1E4F28DC8];
        v98 = [v58 heightAnchor];
        v96 = [v98 constraintEqualToConstant:1.0];
        v111[0] = v96;
        v94 = [v58 leadingAnchor];
        v92 = [v57 leadingAnchor];
        v60 = [v94 constraintEqualToAnchor:v92];
        v111[1] = v60;
        v61 = [v58 trailingAnchor];
        v62 = [v57 trailingAnchor];
        v63 = [v61 constraintEqualToAnchor:v62];
        v111[2] = v63;
        id v64 = [v58 bottomAnchor];
        id v65 = [v57 topAnchor];
        v66 = [v64 constraintEqualToAnchor:v65 constant:-24.0];
        v111[3] = v66;
        id v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:4];
        [v90 activateConstraints:v67];
      }
      uint64_t v88 = [obj countByEnumeratingWithState:&v99 objects:v112 count:16];
    }
    while (v88);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PREditingFontAndContentStylePickerViewController;
  id v4 = a3;
  [(PREditingFontAndContentStylePickerViewController *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = objc_msgSend(v4, "userInterfaceStyle", v10.receiver, v10.super_class);

  double v6 = [(PREditingFontAndContentStylePickerViewController *)self traitCollection];
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
  [(PREditingFontAndContentStylePickerViewController *)self loadComponentViewControllersIfNeeded];
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
  BOOL v6 = self->_contentStylePickerController != 0;
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
    [(PREditingContentStylePickerComponentViewController *)self->_contentStylePickerController estimatedHeight];
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
    id v3 = [(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration timeFontConfiguration];
    BOOL v4 = [(PREditingFontAndContentStylePickerViewController *)self extensionBundleURL];
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
  if ([(PREditingFontAndContentStylePickerViewController *)self isViewLoaded])
  {
    contentStylePickerController = self->_contentStylePickerController;
    [(PREditingContentStylePickerComponentViewController *)contentStylePickerController setContentsLuminance:a3];
  }
}

- (void)_closeButtonTapped:(id)a3
{
  [(PREditingFontAndContentStylePickerViewController *)self _signalDelegateDidFinish];
  [(PREditingFontAndContentStylePickerViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_signalDelegateDidFinish
{
  id v3 = [(PREditingFontAndContentStylePickerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 fontAndContentStylePickerViewControllerDidFinish:self];
  }
}

- (id)localeWithNumberingSystem:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA20];
  id v4 = a3;
  BOOL v5 = [v3 currentLocale];
  BOOL v6 = [v5 localeIdentifier];

  int v7 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v6];
  double v8 = (void *)[v7 mutableCopy];

  [v8 setObject:v4 forKey:@"numbers"];
  double v9 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v8];
  uint64_t v10 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v9];

  return v10;
}

- (void)fontPickerComponentViewControllerDidChangeHeight:(id)a3
{
  id v4 = [(PREditingFontAndContentStylePickerViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [(PREditingFontAndContentStylePickerViewController *)self desiredDetent];
    objc_msgSend(v4, "fontAndContentStylePickerViewController:didUpdateDesiredDetent:", self);
  }
}

- (void)fontPickerComponentViewController:(id)a3 didChangeFontWeight:(double)a4
{
  BOOL v6 = [(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration timeFontConfiguration];
  int v7 = [(PREditingFontAndContentStylePickerViewController *)self extensionBundleURL];
  id v16 = [v6 timeFontConfigurationWithExtensionBundleURL:v7];

  double v8 = [v16 effectiveFontForRole:self->_role ignoringWeight:1];
  unint64_t v9 = objc_msgSend(v8, "pr_variantWeightRange");
  unint64_t v11 = v10;
  double v12 = [(PREditingFontAndContentStylePickerViewController *)self changeHandler];
  if (v12)
  {
    double v13 = (double)v11 * a4 + (1.0 - a4) * (double)v9;
    int v14 = objc_alloc_init(PREditingFontAndContentStylePickerSelectionChange);
    double v15 = [NSNumber numberWithDouble:v13];
    [(PREditingFontAndContentStylePickerSelectionChange *)v14 setFontWeight:v15];

    ((void (**)(void, PREditingFontAndContentStylePickerSelectionChange *))v12)[2](v12, v14);
  }
}

- (void)fontPickerComponentViewController:(id)a3 didSelectItem:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  int v7 = [v6 fontConfiguration];
  double v8 = [v7 effectiveFontForRole:self->_role];

  [(PREditorNumberingSystemPickerController *)self->_numberingSystemController setFont:v8];
  unint64_t v9 = [(PREditorNumberingSystemPickerController *)self->_numberingSystemController menu];
  [(UIBarButtonItem *)self->_numberSystemBarItem setMenu:v9];
  unint64_t v10 = [(PREditingFontAndContentStylePickerViewController *)self changeHandler];
  if (v10)
  {
    unint64_t v11 = [(PREditingFontAndContentStylePickerViewController *)self additionalFontConfigurations];
    double v12 = [v6 fontConfiguration];
    int v13 = [v11 containsObject:v12];

    int v14 = [v6 fontConfiguration];
    double v15 = [v14 timeFontIdentifier];

    if ((v13 & 1) != 0 || v15 == @"PRTimeFontIdentifierRail")
    {
      id v21 = [v6 fontConfiguration];
      [v21 weight];
      double v20 = v22;
    }
    else
    {
      unint64_t v16 = objc_msgSend(v8, "pr_variantWeightRange");
      unint64_t v18 = v17;
      [v28 fontWeight];
      double v20 = v19 * (double)v18 + (1.0 - v19) * (double)v16;
    }
    if (v13) {
      id v23 = v8;
    }
    else {
      id v23 = 0;
    }
    id v24 = v23;
    uint64_t v25 = objc_alloc_init(PREditingFontAndContentStylePickerSelectionChange);
    [(PREditingFontAndContentStylePickerSelectionChange *)v25 setTimeFontIdentifier:v15];
    uint64_t v26 = [NSNumber numberWithDouble:v20];
    [(PREditingFontAndContentStylePickerSelectionChange *)v25 setFontWeight:v26];

    v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isSystemItem"));
    [(PREditingFontAndContentStylePickerSelectionChange *)v25 setSystemItem:v27];

    [(PREditingFontAndContentStylePickerSelectionChange *)v25 setCustomFont:v24];
    ((void (**)(void, PREditingFontAndContentStylePickerSelectionChange *))v10)[2](v10, v25);
  }
}

- (void)titleLayoutPickerComponentViewController:(id)a3 didSelectTitleLayout:(unint64_t)a4 userSelected:(BOOL)a5
{
  unint64_t v5 = a4;
  unint64_t v7 = +[PRIncomingCallMetricsProvider maxVerticalTextLength];
  if (PRPosterTitleLayoutIsVertical(v5))
  {
    double v8 = [(PREditingFontAndContentStylePickerViewController *)self titleString];
    unint64_t v9 = [v8 length];

    if (v9 > v7)
    {
      unint64_t v10 = NSString;
      unint64_t v11 = PRBundle();
      double v12 = [v11 localizedStringForKey:@"CANNOT_CHANGE_LAYOUT_EXPLANATION" value:&stru_1ED9A3120 table:@"PosterKit"];
      int v13 = objc_msgSend(v10, "stringWithFormat:", v12, v7);

      int v14 = (void *)MEMORY[0x1E4FB1418];
      double v15 = PRBundle();
      unint64_t v16 = [v15 localizedStringForKey:@"CANNOT_CHANGE_LAYOUT" value:&stru_1ED9A3120 table:@"PosterKit"];
      unint64_t v17 = [v14 alertControllerWithTitle:v16 message:v13 preferredStyle:1];

      unint64_t v18 = (void *)MEMORY[0x1E4FB1410];
      double v19 = PRBundle();
      double v20 = [v19 localizedStringForKey:@"CANNOT_CHANGE_LAYOUT_DISMISS_ACTION" value:&stru_1ED9A3120 table:@"PosterKit"];
      id v21 = [v18 actionWithTitle:v20 style:0 handler:0];

      [v17 addAction:v21];
      [(PREditingFontAndContentStylePickerViewController *)self presentViewController:v17 animated:1 completion:0];

      unint64_t v5 = 0;
    }
  }
  double v22 = [(PREditingFontAndContentStylePickerViewController *)self titleLayoutPickerController];
  [v22 setSelectedTitleLayout:v5];

  id v23 = [(PREditingFontAndContentStylePickerViewController *)self changeHandler];
  if (v23)
  {
    uint64_t v26 = v23;
    id v24 = objc_alloc_init(PREditingFontAndContentStylePickerSelectionChange);
    uint64_t v25 = [NSNumber numberWithUnsignedInteger:v5];
    [(PREditingFontAndContentStylePickerSelectionChange *)v24 setPreferredTitleLayout:v25];

    v26[2](v26, v24);
    id v23 = v26;
  }
}

- (void)numberingSystemPickerController:(id)a3 didSelectNumberingSystem:(id)a4
{
  id v6 = a4;
  id v7 = [a3 displayLocale];
  [(PREditingFontAndContentStylePickerViewController *)self numberingSystemWasChanged:v6 locale:v7];
}

- (void)numberingSystemViewController:(id)a3 didSelectNumberingSystem:(id)a4
{
  id v6 = a4;
  id v7 = [a3 displayLocale];
  [(PREditingFontAndContentStylePickerViewController *)self numberingSystemWasChanged:v6 locale:v7];
}

- (void)numberingSystemWasChanged:(id)a3 locale:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(PREditingFontAndContentStylePickerViewController *)self fontPickerController];
  double v8 = v7;
  if (v7) {
    [v7 setLocale:v6];
  }
  numberingSystemController = self->_numberingSystemController;
  if (numberingSystemController)
  {
    unint64_t v10 = [(PREditorNumberingSystemPickerController *)numberingSystemController menu];
    [(UIBarButtonItem *)self->_numberSystemBarItem setMenu:v10];
  }
  unint64_t v11 = [(PREditingFontAndContentStylePickerViewController *)self changeHandler];
  if (v11)
  {
    double v12 = objc_alloc_init(PREditingFontAndContentStylePickerSelectionChange);
    [(PREditingFontAndContentStylePickerSelectionChange *)v12 setNumberingSystem:v13];
    ((void (**)(void, PREditingFontAndContentStylePickerSelectionChange *))v11)[2](v11, v12);
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
  id v7 = [(PREditingFontAndContentStylePickerViewController *)self changeHandler];
  if (v7)
  {
    unint64_t v5 = objc_alloc_init(PREditingFontAndContentStylePickerSelectionChange);
    id v6 = [NSNumber numberWithUnsignedInteger:v4];
    [(PREditingFontAndContentStylePickerSelectionChange *)v5 setPreferredTitleAlignment:v6];

    v7[2](v7, v5);
  }
}

- (void)contentStylePickerComponentViewController:(id)a3 didSelectStyle:(id)a4 isSuggestedStyle:(BOOL)a5 userSelected:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a4;
  if (v6)
  {
    id v13 = v9;
    unint64_t v10 = [(PREditingFontAndContentStylePickerViewController *)self changeHandler];
    if (v10)
    {
      unint64_t v11 = objc_alloc_init(PREditingFontAndContentStylePickerSelectionChange);
      [(PREditingFontAndContentStylePickerSelectionChange *)v11 setContentStyle:v13];
      double v12 = [NSNumber numberWithBool:v7];
      [(PREditingFontAndContentStylePickerSelectionChange *)v11 setSuggestedContentStyle:v12];

      ((void (**)(void, PREditingFontAndContentStylePickerSelectionChange *))v10)[2](v10, v11);
    }

    id v9 = v13;
  }
}

- (void)contentStylePickerComponentViewControllerDidChangeHeight:(id)a3
{
  id v4 = [(PREditingFontAndContentStylePickerViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [(PREditingFontAndContentStylePickerViewController *)self desiredDetent];
    objc_msgSend(v4, "fontAndContentStylePickerViewController:didUpdateDesiredDetent:", self);
  }
}

- (id)contentStylePickerComponentViewController:(id)a3 coordinatorForStyle:(id)a4 isSuggested:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  double v8 = [(PREditingFontAndContentStylePickerViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v9 = [v8 fontAndContentStylePickerViewController:self coordinatorForStyle:v7 isSuggested:v5];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (unint64_t)components
{
  return self->_components;
}

- (PRPosterTitleStyleConfiguration)titleStyleConfiguration
{
  return self->_titleStyleConfiguration;
}

- (void)setTitleStyleConfiguration:(id)a3
{
}

- (PREditorContentStylePickerConfiguration)contentStylePickerConfiguration
{
  return self->_contentStylePickerConfiguration;
}

- (void)setContentStylePickerConfiguration:(id)a3
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

- (PREditingFontAndContentStylePickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PREditingFontAndContentStylePickerViewControllerDelegate *)WeakRetained;
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

- (NSString)role
{
  return self->_role;
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

- (PREditingContentStylePickerComponentViewController)contentStylePickerController
{
  return self->_contentStylePickerController;
}

- (void)setContentStylePickerController:(id)a3
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
  objc_storeStrong((id *)&self->_contentStylePickerController, 0);
  objc_storeStrong((id *)&self->_titleLayoutPickerController, 0);
  objc_storeStrong((id *)&self->_fontPickerController, 0);
  objc_storeStrong((id *)&self->_titleAlignmentBarItem, 0);
  objc_storeStrong((id *)&self->_numberingSystemController, 0);
  objc_storeStrong((id *)&self->_numberSystemBarItem, 0);
  objc_storeStrong((id *)&self->_rootStackView, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_extensionBundleURL, 0);
  objc_storeStrong((id *)&self->_contentStylePickerConfiguration, 0);
  objc_storeStrong((id *)&self->_titleStyleConfiguration, 0);
}

@end