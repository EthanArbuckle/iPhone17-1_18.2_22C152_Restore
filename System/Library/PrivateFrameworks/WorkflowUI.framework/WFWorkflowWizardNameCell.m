@interface WFWorkflowWizardNameCell
+ (double)defaultRowHeight;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)shortcutNameIsEmpty;
- (BOOL)showsHeySiri;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)useDoneButtonOnKeyboard;
- (BOOL)useDropdownMenuIconButton;
- (BOOL)useHorizontalInset;
- (NSArray)horizontalConstraintsWithInset;
- (NSArray)horizontalConstraintsWithoutInset;
- (NSString)name;
- (UITextField)shortcutNameTextField;
- (UIView)phraseView;
- (UIView)platterView;
- (WFWorkflowWizardNameCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (WFWorkflowWizardNameCellDataSource)dataSource;
- (WFWorkflowWizardNameCellDelegate)delegate;
- (WFWorkflowWizardNameClearButton)clearButton;
- (WFWorkflowWizardNameIconButton)iconButton;
- (WFWorkflowWizardNameRecordButton)recordButton;
- (id)dropdownMenuIconButton;
- (id)regularIconButton;
- (void)configureIconButton;
- (void)configureWithName:(id)a3 showsHeySiri:(BOOL)a4 icon:(id)a5;
- (void)configureWithName:(id)a3 showsHeySiri:(BOOL)a4 useHorizontalInset:(BOOL)a5 icon:(id)a6;
- (void)configureWithName:(id)a3 showsHeySiri:(BOOL)a4 useHorizontalInset:(BOOL)a5 icon:(id)a6 customImageData:(id)a7;
- (void)didTapClearButton;
- (void)didTapIconButton;
- (void)didTapRecordButton;
- (void)setClearButton:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDropdownMenuForIconButton:(id)a3;
- (void)setHorizontalConstraintsWithInset:(id)a3;
- (void)setHorizontalConstraintsWithoutInset:(id)a3;
- (void)setIcon:(id)a3 customImageData:(id)a4;
- (void)setIconButton:(id)a3;
- (void)setIconButtonConstraints;
- (void)setName:(id)a3;
- (void)setPhraseView:(id)a3;
- (void)setPlatterView:(id)a3;
- (void)setRecordButton:(id)a3;
- (void)setShortcutNameTextField:(id)a3;
- (void)setShowsHeySiri:(BOOL)a3;
- (void)setUseDoneButtonOnKeyboard:(BOOL)a3;
- (void)setUseHorizontalContraints:(BOOL)a3;
- (void)setUseHorizontalInset:(BOOL)a3;
- (void)textFieldDidChange;
- (void)updateButtonVisibility;
- (void)updateViewForDoneButton;
- (void)updateViewForHorizontalConstraints;
@end

@implementation WFWorkflowWizardNameCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalConstraintsWithoutInset, 0);
  objc_storeStrong((id *)&self->_horizontalConstraintsWithInset, 0);
  objc_storeStrong((id *)&self->_shortcutNameTextField, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_recordButton, 0);
  objc_storeStrong((id *)&self->_iconButton, 0);
  objc_storeStrong((id *)&self->_phraseView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setHorizontalConstraintsWithoutInset:(id)a3
{
}

- (NSArray)horizontalConstraintsWithoutInset
{
  return self->_horizontalConstraintsWithoutInset;
}

- (void)setHorizontalConstraintsWithInset:(id)a3
{
}

- (NSArray)horizontalConstraintsWithInset
{
  return self->_horizontalConstraintsWithInset;
}

- (void)setShortcutNameTextField:(id)a3
{
}

- (UITextField)shortcutNameTextField
{
  return self->_shortcutNameTextField;
}

- (void)setClearButton:(id)a3
{
}

- (WFWorkflowWizardNameClearButton)clearButton
{
  return self->_clearButton;
}

- (void)setRecordButton:(id)a3
{
}

- (WFWorkflowWizardNameRecordButton)recordButton
{
  return self->_recordButton;
}

- (void)setIconButton:(id)a3
{
}

- (WFWorkflowWizardNameIconButton)iconButton
{
  return self->_iconButton;
}

- (void)setPhraseView:(id)a3
{
}

- (UIView)phraseView
{
  return self->_phraseView;
}

- (void)setPlatterView:(id)a3
{
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setUseHorizontalInset:(BOOL)a3
{
  self->_useHorizontalInset = a3;
}

- (BOOL)useHorizontalInset
{
  return self->_useHorizontalInset;
}

- (BOOL)useDoneButtonOnKeyboard
{
  return self->_useDoneButtonOnKeyboard;
}

- (BOOL)showsHeySiri
{
  return self->_showsHeySiri;
}

- (void)setDataSource:(id)a3
{
}

- (WFWorkflowWizardNameCellDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (WFWorkflowWizardNameCellDataSource *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WFWorkflowWizardNameCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFWorkflowWizardNameCellDelegate *)WeakRetained;
}

- (void)didTapClearButton
{
  v3 = [(WFWorkflowWizardNameCell *)self shortcutNameTextField];
  [v3 setText:0];

  [(WFWorkflowWizardNameCell *)self updateButtonVisibility];
  id v4 = [(WFWorkflowWizardNameCell *)self delegate];
  [v4 workflowWizardNameCell:self didUpdateName:0];
}

- (void)didTapRecordButton
{
  v2 = [(WFWorkflowWizardNameCell *)self shortcutNameTextField];
  [v2 becomeFirstResponder];

  id v3 = [MEMORY[0x263F828C0] sharedInputModeController];
  [v3 switchToDictationInputMode];
}

- (void)didTapIconButton
{
  id v3 = [(WFWorkflowWizardNameCell *)self delegate];
  [v3 workflowWizardNameCellDidSelectEditIcon:self];
}

- (void)updateViewForHorizontalConstraints
{
  BOOL v3 = [(WFWorkflowWizardNameCell *)self useHorizontalInset];
  id v4 = (void *)MEMORY[0x263F08938];
  if (v3)
  {
    v5 = [(WFWorkflowWizardNameCell *)self horizontalConstraintsWithoutInset];
    [v4 deactivateConstraints:v5];

    v6 = (void *)MEMORY[0x263F08938];
    [(WFWorkflowWizardNameCell *)self horizontalConstraintsWithInset];
  }
  else
  {
    v7 = [(WFWorkflowWizardNameCell *)self horizontalConstraintsWithInset];
    [v4 deactivateConstraints:v7];

    v6 = (void *)MEMORY[0x263F08938];
    [(WFWorkflowWizardNameCell *)self horizontalConstraintsWithoutInset];
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activateConstraints:");
}

- (void)updateViewForDoneButton
{
  BOOL v3 = [(WFWorkflowWizardNameCell *)self useDoneButtonOnKeyboard];
  id v4 = [(WFWorkflowWizardNameCell *)self shortcutNameTextField];
  v5 = v4;
  if (v3)
  {
    [v4 setReturnKeyType:9];

    v6 = [(WFWorkflowWizardNameCell *)self shortcutNameTextField];
    id v8 = v6;
    uint64_t v7 = 1;
  }
  else
  {
    [v4 setReturnKeyType:0];

    v6 = [(WFWorkflowWizardNameCell *)self shortcutNameTextField];
    id v8 = v6;
    uint64_t v7 = 0;
  }
  [v6 setEnablesReturnKeyAutomatically:v7];
}

- (void)updateButtonVisibility
{
  BOOL v3 = [(WFWorkflowWizardNameCell *)self shortcutNameIsEmpty];
  id v4 = [(WFWorkflowWizardNameCell *)self clearButton];
  [v4 setHidden:v3];

  if ([MEMORY[0x263F82680] currentInputModeSupportsDictation]) {
    uint64_t v5 = [(WFWorkflowWizardNameCell *)self shortcutNameIsEmpty] ^ 1;
  }
  else {
    uint64_t v5 = 1;
  }
  id v6 = [(WFWorkflowWizardNameCell *)self recordButton];
  [v6 setHidden:v5];
}

- (void)textFieldDidChange
{
  BOOL v3 = [(WFWorkflowWizardNameCell *)self delegate];
  id v4 = [(WFWorkflowWizardNameCell *)self name];
  [v3 workflowWizardNameCell:self didUpdateName:v4];

  [(WFWorkflowWizardNameCell *)self updateButtonVisibility];
  [(WFWorkflowWizardNameCell *)self updateViewForDoneButton];
}

- (BOOL)shortcutNameIsEmpty
{
  v2 = [(WFWorkflowWizardNameCell *)self shortcutNameTextField];
  BOOL v3 = [v2 text];
  BOOL v4 = [v3 length] == 0;

  return v4;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 text];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    [v4 resignFirstResponder];
    uint64_t v7 = [(WFWorkflowWizardNameCell *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [(WFWorkflowWizardNameCell *)self delegate];
      [v9 workflowWizardNameCellDidFinishEditing:self];
    }
  }

  return v6 != 0;
}

- (BOOL)becomeFirstResponder
{
  v6.receiver = self;
  v6.super_class = (Class)WFWorkflowWizardNameCell;
  if (![(WFWorkflowWizardNameCell *)&v6 becomeFirstResponder]
    || ![(WFWorkflowWizardNameCell *)self canBecomeFirstResponder])
  {
    return 0;
  }
  BOOL v3 = [(WFWorkflowWizardNameCell *)self shortcutNameTextField];
  char v4 = [v3 becomeFirstResponder];

  return v4;
}

- (BOOL)canBecomeFirstResponder
{
  v2 = [(WFWorkflowWizardNameCell *)self shortcutNameTextField];
  char v3 = [v2 canBecomeFirstResponder];

  return v3;
}

- (void)configureWithName:(id)a3 showsHeySiri:(BOOL)a4 useHorizontalInset:(BOOL)a5 icon:(id)a6 customImageData:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  [(WFWorkflowWizardNameCell *)self setShowsHeySiri:v9];
  [(WFWorkflowWizardNameCell *)self setName:v14];

  [(WFWorkflowWizardNameCell *)self configureIconButton];
  [(WFWorkflowWizardNameCell *)self setIcon:v13 customImageData:v12];

  [(WFWorkflowWizardNameCell *)self setUseHorizontalContraints:v8];
}

- (void)configureWithName:(id)a3 showsHeySiri:(BOOL)a4 useHorizontalInset:(BOOL)a5 icon:(id)a6
{
}

- (void)configureWithName:(id)a3 showsHeySiri:(BOOL)a4 icon:(id)a5
{
}

- (void)setIcon:(id)a3 customImageData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(WFWorkflowWizardNameCell *)self iconButton];
  [v8 setIcon:v7 customImageData:v6];

  if ([(WFWorkflowWizardNameCell *)self useDropdownMenuIconButton])
  {
    id v9 = [(WFWorkflowWizardNameCell *)self iconButton];
    [(WFWorkflowWizardNameCell *)self setDropdownMenuForIconButton:v9];
  }
}

- (void)setUseDoneButtonOnKeyboard:(BOOL)a3
{
  if (self->_useDoneButtonOnKeyboard != a3)
  {
    self->_useDoneButtonOnKeyboard = a3;
    [(WFWorkflowWizardNameCell *)self updateViewForDoneButton];
  }
}

- (void)setUseHorizontalContraints:(BOOL)a3
{
  if (self->_useHorizontalInset != a3)
  {
    self->_useHorizontalInset = a3;
    [(WFWorkflowWizardNameCell *)self updateViewForHorizontalConstraints];
  }
}

- (void)setName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFWorkflowWizardNameCell *)self shortcutNameTextField];
  [v5 setText:v4];

  [(WFWorkflowWizardNameCell *)self updateButtonVisibility];
}

- (NSString)name
{
  v2 = [(WFWorkflowWizardNameCell *)self shortcutNameTextField];
  char v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setShowsHeySiri:(BOOL)a3
{
  self->_showsHeySiri = a3;
}

- (void)setDropdownMenuForIconButton:(id)a3
{
  id v4 = a3;
  id v6 = [(WFWorkflowWizardNameCell *)self dataSource];
  uint64_t v5 = [v6 iconButtonDropdownMenuInWorkflowWizardNameCell:self];
  [v4 setMenu:v5];
}

- (id)dropdownMenuIconButton
{
  char v3 = [MEMORY[0x263F823D0] actionWithTitle:&stru_26E1A5FC0 image:0 identifier:0 handler:&__block_literal_global_2058];
  id v4 = +[WFWorkflowWizardNameIconButton systemButtonWithPrimaryAction:v3];
  [v4 setShowsMenuAsPrimaryAction:1];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(WFWorkflowWizardNameCell *)self setDropdownMenuForIconButton:v4];

  return v4;
}

- (id)regularIconButton
{
  char v3 = objc_alloc_init(WFWorkflowWizardNameIconButton);
  [(WFWorkflowWizardNameIconButton *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(WFWorkflowWizardNameIconButton *)v3 addTarget:self action:sel_didTapIconButton forControlEvents:64];
  return v3;
}

- (void)setIconButtonConstraints
{
  v18[3] = *MEMORY[0x263EF8340];
  char v3 = [(WFWorkflowWizardNameCell *)self iconButton];
  id v4 = [(WFWorkflowWizardNameCell *)self platterView];
  uint64_t v5 = [(WFWorkflowWizardNameCell *)self phraseView];
  id v14 = (void *)MEMORY[0x263F08938];
  v15 = v5;
  v17 = [v3 leadingAnchor];
  v16 = [v4 leadingAnchor];
  id v6 = [v17 constraintEqualToAnchor:v16 constant:13.0];
  v18[0] = v6;
  id v7 = [v3 centerYAnchor];
  BOOL v8 = [v4 centerYAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8];
  v18[1] = v9;
  v10 = [v5 leadingAnchor];
  v11 = [v3 trailingAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11 constant:10.0];
  v18[2] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  [v14 activateConstraints:v13];
}

- (BOOL)useDropdownMenuIconButton
{
  v2 = [(WFWorkflowWizardNameCell *)self dataSource];
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (void)configureIconButton
{
  char v3 = [(WFWorkflowWizardNameCell *)self iconButton];

  if (v3)
  {
    id v4 = [(WFWorkflowWizardNameCell *)self iconButton];
    [v4 removeFromSuperview];
  }
  if ([(WFWorkflowWizardNameCell *)self useDropdownMenuIconButton]) {
    [(WFWorkflowWizardNameCell *)self dropdownMenuIconButton];
  }
  else {
  uint64_t v5 = [(WFWorkflowWizardNameCell *)self regularIconButton];
  }
  iconButton = self->_iconButton;
  self->_iconButton = v5;
  id v7 = v5;

  BOOL v8 = [(WFWorkflowWizardNameCell *)self platterView];
  [v8 addSubview:v7];

  [(WFWorkflowWizardNameCell *)self setIconButtonConstraints];
}

- (WFWorkflowWizardNameCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v79[10] = *MEMORY[0x263EF8340];
  v76.receiver = self;
  v76.super_class = (Class)WFWorkflowWizardNameCell;
  id v4 = [(WFWorkflowWizardNameCell *)&v76 initWithStyle:a3 reuseIdentifier:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_showsHeySiri = 1;
    v4->_useHorizontalInset = 1;
    [(WFWorkflowWizardNameCell *)v4 setSelectionStyle:0];
    id v6 = [(WFWorkflowWizardNameCell *)v5 contentView];
    id v7 = objc_msgSend(MEMORY[0x263F825C8], "wf_settingsCellColor");
    [v6 setBackgroundColor:v7];

    id v8 = objc_alloc_init(MEMORY[0x263F82E00]);
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v9 = objc_msgSend(MEMORY[0x263F825C8], "wf_settingsCellColor");
    [v8 setBackgroundColor:v9];

    [v8 _setContinuousCornerRadius:14.0];
    [v6 addSubview:v8];
    objc_storeStrong((id *)&v5->_platterView, v8);
    v10 = objc_alloc_init(WFWorkflowWizardNameRecordButton);
    [(WFWorkflowWizardNameRecordButton *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WFWorkflowWizardNameRecordButton *)v10 addTarget:v5 action:sel_didTapRecordButton forControlEvents:64];
    [v8 addSubview:v10];
    objc_storeStrong((id *)&v5->_recordButton, v10);
    v11 = objc_alloc_init(WFWorkflowWizardNameClearButton);
    [(WFWorkflowWizardNameClearButton *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WFWorkflowWizardNameClearButton *)v11 addTarget:v5 action:sel_didTapClearButton forControlEvents:64];
    [v8 addSubview:v11];
    objc_storeStrong((id *)&v5->_clearButton, v11);
    id v12 = objc_alloc_init(MEMORY[0x263F82BF8]);
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v12 setAxis:1];
    [v12 setDistribution:3];
    [v12 setAlignment:0];
    [v8 addSubview:v12];
    objc_storeStrong((id *)&v5->_phraseView, v12);
    id v13 = objc_alloc_init(MEMORY[0x263F82E00]);
    [v12 addArrangedSubview:v13];
    id v14 = (UITextField *)objc_alloc_init(MEMORY[0x263F82CF0]);
    [(UITextField *)v14 setAutocapitalizationType:WFAutocapitalizationTypeFromLocale()];
    [(UITextField *)v14 setDelegate:v5];
    v15 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
    [(UITextField *)v14 setFont:v15];

    [(UITextField *)v14 setAccessibilityIdentifier:@"name_field"];
    [(UITextField *)v14 addTarget:v5 action:sel_textFieldDidChange forControlEvents:0x20000];
    if ([(UITextField *)v14 conformsToProtocol:&unk_26E2154C0]) {
      [(UITextField *)v14 setAcceptsDictationSearchResults:1];
    }
    [v12 addArrangedSubview:v14];
    shortcutNameTextField = v5->_shortcutNameTextField;
    v5->_shortcutNameTextField = v14;
    v75 = v14;

    id v71 = objc_alloc_init(MEMORY[0x263F82E00]);
    [v12 addArrangedSubview:v71];
    v57 = (void *)MEMORY[0x263F08938];
    v69 = [v8 topAnchor];
    v68 = [v6 topAnchor];
    v67 = [v69 constraintEqualToAnchor:v68];
    v79[0] = v67;
    v66 = [v8 bottomAnchor];
    v65 = [v6 bottomAnchor];
    v64 = [v66 constraintEqualToAnchor:v65];
    v79[1] = v64;
    v63 = [(WFWorkflowWizardNameRecordButton *)v10 trailingAnchor];
    v62 = [v8 trailingAnchor];
    v61 = [v63 constraintEqualToAnchor:v62 constant:-16.0];
    v79[2] = v61;
    v60 = [(WFWorkflowWizardNameRecordButton *)v10 centerYAnchor];
    v59 = [v8 centerYAnchor];
    v58 = [v60 constraintEqualToAnchor:v59];
    v79[3] = v58;
    v56 = [(WFWorkflowWizardNameClearButton *)v11 trailingAnchor];
    v55 = [v8 trailingAnchor];
    v54 = [v56 constraintEqualToAnchor:v55 constant:-16.0];
    v79[4] = v54;
    v52 = [(WFWorkflowWizardNameClearButton *)v11 centerYAnchor];
    v51 = [v8 centerYAnchor];
    v50 = [v52 constraintEqualToAnchor:v51];
    v79[5] = v50;
    v49 = [v12 topAnchor];
    v48 = [v8 topAnchor];
    v47 = [v49 constraintEqualToAnchor:v48 constant:12.0];
    v79[6] = v47;
    v46 = [v12 bottomAnchor];
    v45 = [v8 bottomAnchor];
    v17 = [v46 constraintEqualToAnchor:v45 constant:-12.0];
    v79[7] = v17;
    [v12 trailingAnchor];
    v18 = v74 = v12;
    [(WFWorkflowWizardNameRecordButton *)v10 leadingAnchor];
    v19 = v53 = v6;
    [v18 constraintEqualToAnchor:v19 constant:-10.0];
    v20 = v73 = v10;
    v79[8] = v20;
    v21 = [v13 heightAnchor];
    v22 = [v71 heightAnchor];
    [v21 constraintEqualToAnchor:v22];
    v23 = v72 = v11;
    v79[9] = v23;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:10];
    v24 = v70 = v13;
    [v57 activateConstraints:v24];

    v25 = [v8 leadingAnchor];
    v26 = [v53 leadingAnchor];
    v27 = [v25 constraintEqualToAnchor:v26 constant:13.0];
    v78[0] = v27;
    v28 = [v8 trailingAnchor];
    v29 = [v53 trailingAnchor];
    v30 = [v28 constraintEqualToAnchor:v29 constant:-13.0];
    v78[1] = v30;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:2];
    [(WFWorkflowWizardNameCell *)v5 setHorizontalConstraintsWithInset:v31];

    v32 = [v8 leadingAnchor];
    v33 = [v53 leadingAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    v77[0] = v34;
    v35 = [v8 trailingAnchor];
    v36 = [v53 trailingAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    v77[1] = v37;
    v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:2];
    [(WFWorkflowWizardNameCell *)v5 setHorizontalConstraintsWithoutInset:v38];

    v39 = WFLocalizedString(@"Shortcut Name");
    v40 = [(WFWorkflowWizardNameCell *)v5 shortcutNameTextField];
    [v40 setPlaceholder:v39];

    [(WFWorkflowWizardNameCell *)v5 updateViewForHorizontalConstraints];
    [(WFWorkflowWizardNameCell *)v5 updateButtonVisibility];
    [(WFWorkflowWizardNameCell *)v5 updateViewForDoneButton];
    v41 = [MEMORY[0x263F08A00] defaultCenter];
    [v41 addObserver:v5 selector:sel_updateButtonVisibility name:*MEMORY[0x263F83BD0] object:0];

    v42 = [MEMORY[0x263F08A00] defaultCenter];
    [v42 addObserver:v5 selector:sel_updateButtonVisibility name:*MEMORY[0x263F83788] object:0];

    v43 = v5;
  }

  return v5;
}

+ (double)defaultRowHeight
{
  return 66.0;
}

@end