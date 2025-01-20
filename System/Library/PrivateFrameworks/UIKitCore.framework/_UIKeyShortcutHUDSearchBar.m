@interface _UIKeyShortcutHUDSearchBar
- (BOOL)becomeFirstResponder;
- (BOOL)isEditing;
- (BOOL)isFirstResponder;
- (BOOL)isSearching;
- (BOOL)isUsingFallbackSearchAnimation;
- (BOOL)resignFirstResponder;
- (NSArray)searchTextFieldTransitionConstraints;
- (NSArray)standardSearchTextFieldConstraints;
- (NSString)text;
- (UIButton)cancelButton;
- (UIView)backgroundView;
- (_UIKeyShortcutHUDSearchBar)initWithCoder:(id)a3;
- (_UIKeyShortcutHUDSearchBar)initWithFrame:(CGRect)a3;
- (_UIKeyShortcutHUDSearchBarDelegate)delegate;
- (_UIKeyShortcutHUDSearchButton)searchButton;
- (_UIKeyShortcutHUDSearchTextField)searchTextField;
- (void)_commonInit;
- (void)_createBackgroundView;
- (void)_createCancelButton;
- (void)_createSearchTextField;
- (void)_setupLayout;
- (void)_textChanged:(id)a3;
- (void)didCompleteSearchTransition;
- (void)prepareForSearchTransition:(BOOL)a3 usingCell:(id)a4;
- (void)selectAll:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSearchButton:(id)a3;
- (void)setSearchTextFieldTransitionConstraints:(id)a3;
- (void)setSearching:(BOOL)a3;
- (void)setStandardSearchTextFieldConstraints:(id)a3;
- (void)setText:(id)a3;
- (void)setUsingFallbackSearchAnimation:(BOOL)a3;
@end

@implementation _UIKeyShortcutHUDSearchBar

- (_UIKeyShortcutHUDSearchBar)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDSearchBar;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_UIKeyShortcutHUDSearchBar *)v3 _commonInit];
  }
  return v4;
}

- (_UIKeyShortcutHUDSearchBar)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDSearchBar;
  v3 = [(UIView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(_UIKeyShortcutHUDSearchBar *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  [(_UIKeyShortcutHUDSearchBar *)self _createBackgroundView];
  [(_UIKeyShortcutHUDSearchBar *)self _createSearchTextField];
  [(_UIKeyShortcutHUDSearchBar *)self _createCancelButton];
  [(_UIKeyShortcutHUDSearchBar *)self _setupLayout];
}

- (void)_createBackgroundView
{
  v3 = (UIView *)objc_opt_new();
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  v5 = +[UIColor tertiarySystemFillColor];
  [(UIView *)self->_backgroundView setBackgroundColor:v5];

  objc_super v6 = +[UIKeyShortcutHUDMetrics currentMetrics];
  [v6 toolbarCellCornerRadius];
  double v8 = v7;
  v9 = [(UIView *)self->_backgroundView layer];
  [v9 setCornerRadius:v8];

  uint64_t v10 = *MEMORY[0x1E4F39EA8];
  v11 = [(UIView *)self->_backgroundView layer];
  [v11 setCornerCurve:v10];

  v12 = self->_backgroundView;
  [(UIView *)v12 setAlpha:0.0];
}

- (void)_createSearchTextField
{
  v3 = (_UIKeyShortcutHUDSearchTextField *)objc_opt_new();
  searchTextField = self->_searchTextField;
  self->_searchTextField = v3;

  [(UITextField *)self->_searchTextField setBorderStyle:0];
  v5 = _UINSLocalizedStringWithDefaultValue(@"Search", @"Search");
  [(UITextField *)self->_searchTextField setPlaceholder:v5];

  objc_super v6 = +[UIKeyShortcutHUDMetrics currentMetrics];
  double v7 = [v6 searchHUDTextColor];
  double v8 = [(UITextField *)self->_searchTextField _placeholderLabel];
  [v8 setTextColor:v7];

  v9 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
  [(UITextField *)self->_searchTextField setFont:v9];

  uint64_t v10 = +[_UIKeyShortcutHUDUtilities sharedFocusGroupIdentifier]();
  [(UIView *)self->_searchTextField setFocusGroupIdentifier:v10];

  [(UIView *)self->_searchTextField setAlpha:0.0];
  [(UITextField *)self->_searchTextField setLeftView:0];
  id v15 = (id)objc_opt_new();
  v11 = +[UIKeyCommand keyCommandWithInput:@"?" modifierFlags:0x100000 action:sel__doNothing_];
  v12 = +[_UIKeyShortcutHUDShortcut shortcutWithUIKeyCommand:v11];
  [v15 setWantsCompressedWidth:1];
  [v15 setShortcut:v12];
  v13 = +[UIKeyShortcutHUDMetrics currentMetrics];
  v14 = [v13 searchHUDTextColor];
  [v15 setTextColor:v14];

  [(_UIKeyShortcutHUDSearchTextField *)self->_searchTextField setShortcutInputView:v15];
  [(UITextField *)self->_searchTextField setClearButtonMode:1];
  [(_UIKeyShortcutHUDSearchTextField *)self->_searchTextField setAutocapitalizationType:0];
  [(_UIKeyShortcutHUDSearchTextField *)self->_searchTextField setAutocorrectionType:1];
  [(_UIKeyShortcutHUDSearchTextField *)self->_searchTextField setKeyboardType:13];
  [(_UIKeyShortcutHUDSearchTextField *)self->_searchTextField setDisableInputBars:1];
  [(_UIKeyShortcutHUDSearchTextField *)self->_searchTextField setDisableHandwritingKeyboard:1];
  [(UIControl *)self->_searchTextField addTarget:self action:sel__textChanged_ forControlEvents:0x20000];
}

- (void)_createCancelButton
{
  objc_initWeak(&location, self);
  v3 = _UINSLocalizedStringWithDefaultValue(@"Cancel", @"Cancel");
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __49___UIKeyShortcutHUDSearchBar__createCancelButton__block_invoke;
  v18 = &unk_1E52DDB60;
  objc_copyWeak(&v19, &location);
  v4 = +[UIAction actionWithTitle:v3 image:0 identifier:0 handler:&v15];
  +[UIButton systemButtonWithPrimaryAction:](UIButton, "systemButtonWithPrimaryAction:", v4, v15, v16, v17, v18);
  v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
  cancelButton = self->_cancelButton;
  self->_cancelButton = v5;

  double v7 = +[UIKeyShortcutHUDMetrics currentMetrics];
  double v8 = [v7 searchHUDTextColor];
  [(UIButton *)self->_cancelButton setTintColor:v8];

  v9 = +[UIKeyShortcutHUDMetrics currentMetrics];
  uint64_t v10 = [v9 cancelButtonFont];
  v11 = [(UIButton *)self->_cancelButton titleLabel];
  [v11 setFont:v10];

  v12 = [(UIButton *)self->_cancelButton titleLabel];
  [v12 setAdjustsFontForContentSizeCategory:1];

  [(UIView *)self->_cancelButton setAlpha:0.0];
  LODWORD(v13) = 1148846080;
  [(UIView *)self->_cancelButton setContentHuggingPriority:0 forAxis:v13];
  LODWORD(v14) = 1148846080;
  [(UIView *)self->_cancelButton setContentCompressionResistancePriority:0 forAxis:v14];
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)_setupLayout
{
  v41[4] = *MEMORY[0x1E4F143B8];
  [(UIView *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_searchTextField setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_cancelButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self addSubview:self->_backgroundView];
  [(UIView *)self addSubview:self->_searchTextField];
  [(UIView *)self addSubview:self->_cancelButton];
  v3 = +[UIKeyShortcutHUDMetrics currentMetrics];
  [v3 toolbarContentInset];
  double v5 = v4;

  v38 = [(UIView *)self->_searchTextField leadingAnchor];
  v36 = [(UIView *)self leadingAnchor];
  v34 = [v38 constraintEqualToAnchor:v36 constant:v5];
  v41[0] = v34;
  v32 = [(UIView *)self->_searchTextField topAnchor];
  v30 = [(UIView *)self topAnchor];
  objc_super v6 = [v32 constraintEqualToAnchor:v30 constant:v5];
  v41[1] = v6;
  double v7 = [(UIView *)self->_searchTextField bottomAnchor];
  double v8 = [(UIView *)self bottomAnchor];
  v9 = [v7 constraintEqualToAnchor:v8 constant:-v5];
  v41[2] = v9;
  uint64_t v10 = [(UIView *)self->_cancelButton leadingAnchor];
  v11 = [(UIView *)self->_searchTextField trailingAnchor];
  v12 = [v10 constraintEqualToSystemSpacingAfterAnchor:v11 multiplier:2.0];
  v41[3] = v12;
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];
  standardSearchTextFieldConstraints = self->_standardSearchTextFieldConstraints;
  self->_standardSearchTextFieldConstraints = v13;

  [MEMORY[0x1E4F5B268] activateConstraints:self->_standardSearchTextFieldConstraints];
  v27 = (void *)MEMORY[0x1E4F5B268];
  v39 = [(UIView *)self->_backgroundView leadingAnchor];
  v37 = [(UIView *)self->_searchTextField leadingAnchor];
  v35 = [v39 constraintEqualToAnchor:v37];
  v40[0] = v35;
  v33 = [(UIView *)self->_backgroundView topAnchor];
  v31 = [(UIView *)self->_searchTextField topAnchor];
  v29 = [v33 constraintEqualToAnchor:v31];
  v40[1] = v29;
  v28 = [(UIView *)self->_backgroundView trailingAnchor];
  v26 = [(UIView *)self->_searchTextField trailingAnchor];
  v25 = [v28 constraintEqualToAnchor:v26];
  v40[2] = v25;
  uint64_t v15 = [(UIView *)self->_backgroundView bottomAnchor];
  uint64_t v16 = [(UIView *)self->_searchTextField bottomAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v40[3] = v17;
  v18 = [(UIView *)self trailingAnchor];
  id v19 = [(UIView *)self->_cancelButton trailingAnchor];
  v20 = [v18 constraintEqualToSystemSpacingAfterAnchor:v19 multiplier:2.17];
  v40[4] = v20;
  v21 = [(UIView *)self centerYAnchor];
  v22 = [(UIView *)self->_cancelButton centerYAnchor];
  v23 = [v21 constraintEqualToAnchor:v22 constant:1.0];
  v40[5] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:6];
  [v27 activateConstraints:v24];
}

- (NSString)text
{
  return (NSString *)[(UISearchTextField *)self->_searchTextField text];
}

- (void)setText:(id)a3
{
}

- (BOOL)isEditing
{
  return [(UITextField *)self->_searchTextField isEditing];
}

- (void)setSearchButton:(id)a3
{
}

- (_UIKeyShortcutHUDSearchButton)searchButton
{
  return [(_UIKeyShortcutHUDSearchTextField *)self->_searchTextField searchButton];
}

- (void)prepareForSearchTransition:(BOOL)a3 usingCell:(id)a4
{
  BOOL v30 = a3;
  v31[4] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  if (v11)
  {
    v12 = v11;
    [(UIView *)self->_backgroundView setAlpha:1.0];
  }
  else
  {
    self->_usingFallbackSearchAnimation = 1;
    double v4 = [(_UIKeyShortcutHUDSearchBar *)self searchButton];
    double v5 = [v4 collectionView];
    double v13 = [(_UIKeyShortcutHUDSearchBar *)self searchButton];
    objc_super v6 = [v13 searchButtonIndexPath];
    double v7 = [v6 indexPath];
    v12 = [v5 cellForItemAtIndexPath:v7];
  }
  double v14 = 0.0;
  if ([(UIView *)self effectiveUserInterfaceLayoutDirection] == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    double v4 = +[UIKeyShortcutHUDMetrics currentMetrics];
    [v4 toolbarContentInset];
    double v14 = v15;
  }
  if (v12)
  {
    v29 = [(_UIKeyShortcutHUDSearchBar *)self searchTextField];
    uint64_t v16 = [v29 leadingAnchor];
    v27 = [v12 leadingAnchor];
    v28 = v16;
    v26 = [v16 constraintEqualToAnchor:v27 constant:v14];
    v31[0] = v26;
    v25 = [(_UIKeyShortcutHUDSearchBar *)self searchTextField];
    v17 = [v25 topAnchor];
    v23 = [v12 topAnchor];
    v24 = v17;
    v22 = [v17 constraintEqualToAnchor:v23];
    v31[1] = v22;
    v21 = [(_UIKeyShortcutHUDSearchBar *)self searchTextField];
    v18 = [v21 bottomAnchor];
    objc_super v6 = [v12 bottomAnchor];
    v20 = v18;
    double v7 = [v18 constraintEqualToAnchor:v6];
    v31[2] = v7;
    double v8 = [(_UIKeyShortcutHUDSearchBar *)self searchTextField];
    v9 = [v8 widthAnchor];
    double v4 = [v12 widthAnchor];
    double v5 = [v9 constraintEqualToAnchor:v4];
    v31[3] = v5;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
  }
  else
  {
    id v19 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)&self->_searchTextFieldTransitionConstraints, v19);
  if (v12)
  {
  }
  if (v30)
  {
    [MEMORY[0x1E4F5B268] deactivateConstraints:self->_standardSearchTextFieldConstraints];
    [MEMORY[0x1E4F5B268] activateConstraints:self->_searchTextFieldTransitionConstraints];
    [(UIView *)self layoutIfNeeded];
  }
}

- (void)setSearching:(BOOL)a3
{
  if (self->_searching == a3) {
    return;
  }
  self->_searching = a3;
  if (a3)
  {
    [MEMORY[0x1E4F5B268] deactivateConstraints:self->_searchTextFieldTransitionConstraints];
    [MEMORY[0x1E4F5B268] activateConstraints:self->_standardSearchTextFieldConstraints];
    double v4 = 1.0;
    [(UIView *)self->_searchTextField setAlpha:1.0];
    [(UIView *)self->_cancelButton setAlpha:1.0];
LABEL_5:
    [(UIView *)self->_backgroundView setAlpha:v4];
    goto LABEL_6;
  }
  [MEMORY[0x1E4F5B268] deactivateConstraints:self->_standardSearchTextFieldConstraints];
  [MEMORY[0x1E4F5B268] activateConstraints:self->_searchTextFieldTransitionConstraints];
  double v4 = 0.0;
  [(UIView *)self->_searchTextField setAlpha:0.0];
  [(UIView *)self->_cancelButton setAlpha:0.0];
  if (self->_usingFallbackSearchAnimation) {
    goto LABEL_5;
  }
LABEL_6:
  [(UIView *)self layoutIfNeeded];
}

- (void)didCompleteSearchTransition
{
  [MEMORY[0x1E4F5B268] deactivateConstraints:self->_searchTextFieldTransitionConstraints];
  [MEMORY[0x1E4F5B268] activateConstraints:self->_standardSearchTextFieldConstraints];
  searchTextFieldTransitionConstraints = self->_searchTextFieldTransitionConstraints;
  self->_searchTextFieldTransitionConstraints = 0;

  self->_usingFallbackSearchAnimation = 0;
  if (!self->_searching)
  {
    backgroundView = self->_backgroundView;
    [(UIView *)backgroundView setAlpha:0.0];
  }
}

- (void)selectAll:(id)a3
{
}

- (BOOL)becomeFirstResponder
{
  return [(UISearchTextField *)self->_searchTextField becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
  return [(UISearchTextField *)self->_searchTextField resignFirstResponder];
}

- (BOOL)isFirstResponder
{
  return [(UIView *)self->_searchTextField isFirstResponder];
}

- (void)_textChanged:(id)a3
{
  id v4 = a3;
  id v6 = [(_UIKeyShortcutHUDSearchBar *)self delegate];
  double v5 = [v4 text];

  [v6 searchBar:self didUpdateSearchText:v5];
}

- (_UIKeyShortcutHUDSearchBarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIKeyShortcutHUDSearchBarDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UIKeyShortcutHUDSearchTextField)searchTextField
{
  return self->_searchTextField;
}

- (BOOL)isSearching
{
  return self->_searching;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (NSArray)standardSearchTextFieldConstraints
{
  return self->_standardSearchTextFieldConstraints;
}

- (void)setStandardSearchTextFieldConstraints:(id)a3
{
}

- (NSArray)searchTextFieldTransitionConstraints
{
  return self->_searchTextFieldTransitionConstraints;
}

- (void)setSearchTextFieldTransitionConstraints:(id)a3
{
}

- (BOOL)isUsingFallbackSearchAnimation
{
  return self->_usingFallbackSearchAnimation;
}

- (void)setUsingFallbackSearchAnimation:(BOOL)a3
{
  self->_usingFallbackSearchAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTextFieldTransitionConstraints, 0);
  objc_storeStrong((id *)&self->_standardSearchTextFieldConstraints, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_searchTextField, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end