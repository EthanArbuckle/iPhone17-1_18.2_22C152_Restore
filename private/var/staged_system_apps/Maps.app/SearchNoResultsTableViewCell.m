@interface SearchNoResultsTableViewCell
+ (id)identifier;
- (BOOL)enableStructuredRAPAffordance;
- (KeyboardAvoidingView)keyboardAvoidingView;
- (NSLayoutConstraint)heightConstraint;
- (SearchNoResultsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (SearchNoResultsTableViewCellDelegate)delegate;
- (UIButton)rapButton;
- (UIStackView)stackView;
- (void)_addRAPButton;
- (void)_didTapOnRAPButton;
- (void)_removeRAPButton;
- (void)clearHeightConstraint;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setEnableStructuredRAPAffordance:(BOOL)a3;
- (void)setHeightConstraint:(double)a3 withPriority:(float)a4;
- (void)setHeightConstraint:(id)a3;
- (void)setKeyboardAvoidingView:(id)a3;
- (void)setRapButton:(id)a3;
- (void)setStackView:(id)a3;
- (void)setupSubviews;
@end

@implementation SearchNoResultsTableViewCell

- (SearchNoResultsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SearchNoResultsTableViewCell;
  v4 = [(SearchNoResultsTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[UIColor clearColor];
    [(SearchNoResultsTableViewCell *)v4 setBackgroundColor:v5];

    [(SearchNoResultsTableViewCell *)v4 setupSubviews];
  }
  return v4;
}

- (void)setupSubviews
{
  id v3 = objc_alloc_init((Class)UIView);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  stackView = self->_stackView;
  self->_stackView = v4;

  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView setAxis:1];
  [(UIStackView *)self->_stackView setDistribution:0];
  [(UIStackView *)self->_stackView setAlignment:3];
  [v3 addSubview:self->_stackView];
  v6 = objc_alloc_init(MapsThemeLabel);
  [(MapsThemeLabel *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"No results [autocomplete]" value:@"localized string not found" table:0];
  [(MapsThemeLabel *)v6 setText:v8];

  v48 = v6;
  +[DynamicTypeWizard autorefreshLabel:v6 withFontProvider:&stru_101321340];
  v9 = +[UIColor secondaryLabelColor];
  [(MapsThemeLabel *)v6 setTextColor:v9];

  [(MapsThemeLabel *)v6 setTextAlignment:1];
  [(MapsThemeLabel *)v6 setAllowsDefaultTighteningForTruncation:1];
  [(MapsThemeLabel *)v6 setAdjustsFontSizeToFitWidth:1];
  [(MapsThemeLabel *)v6 setMinimumScaleFactor:0.699999988];
  [(UIStackView *)self->_stackView addArrangedSubview:v6];
  v10 = [[KeyboardAvoidingView alloc] initWithContentView:v3];
  [(SearchNoResultsTableViewCell *)self setKeyboardAvoidingView:v10];

  v11 = [(SearchNoResultsTableViewCell *)self keyboardAvoidingView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v12 = [(SearchNoResultsTableViewCell *)self contentView];
  v13 = [(SearchNoResultsTableViewCell *)self keyboardAvoidingView];
  [v12 addSubview:v13];

  v14 = +[UIButtonConfiguration plainButtonConfiguration];
  v15 = +[NSBundle mainBundle];
  v16 = [v15 localizedStringForKey:@"Add a Missing Place" value:@"localized string not found" table:0];
  [v14 setTitle:v16];

  v47 = v14;
  [v14 setTitleTextAttributesTransformer:&stru_1012EEAF0];
  v17 = +[UIButton buttonWithType:1];
  rapButton = self->_rapButton;
  self->_rapButton = v17;

  [(UIButton *)self->_rapButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_rapButton addTarget:self action:"_didTapOnRAPButton" forControlEvents:64];
  [(UIButton *)self->_rapButton setConfiguration:v14];
  [(UIStackView *)self->_stackView centerXAnchor];
  v46 = v45 = v3;
  v44 = [v3 centerXAnchor];
  v43 = [v46 constraintEqualToAnchor:v44];
  v49[0] = v43;
  v42 = [(UIStackView *)self->_stackView centerYAnchor];
  v41 = [v3 centerYAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v49[1] = v40;
  v39 = [(SearchNoResultsTableViewCell *)self keyboardAvoidingView];
  v37 = [v39 leadingAnchor];
  v38 = [(SearchNoResultsTableViewCell *)self contentView];
  v36 = [v38 leadingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v49[2] = v35;
  v34 = [(SearchNoResultsTableViewCell *)self keyboardAvoidingView];
  v32 = [v34 trailingAnchor];
  v33 = [(SearchNoResultsTableViewCell *)self contentView];
  v31 = [v33 trailingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v49[3] = v30;
  v29 = [(SearchNoResultsTableViewCell *)self keyboardAvoidingView];
  v19 = [v29 topAnchor];
  v20 = [(SearchNoResultsTableViewCell *)self contentView];
  v21 = [v20 topAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  v49[4] = v22;
  v23 = [(SearchNoResultsTableViewCell *)self keyboardAvoidingView];
  v24 = [v23 bottomAnchor];
  v25 = [(SearchNoResultsTableViewCell *)self contentView];
  v26 = [v25 bottomAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];
  v49[5] = v27;
  v28 = +[NSArray arrayWithObjects:v49 count:6];
  +[NSLayoutConstraint activateConstraints:v28];
}

+ (id)identifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)clearHeightConstraint
{
  id v3 = [(SearchNoResultsTableViewCell *)self heightConstraint];
  [v3 setActive:0];

  [(SearchNoResultsTableViewCell *)self setHeightConstraint:0];
}

- (void)setHeightConstraint:(double)a3 withPriority:(float)a4
{
  uint64_t v7 = [(SearchNoResultsTableViewCell *)self heightConstraint];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(SearchNoResultsTableViewCell *)self heightConstraint];
    [v9 priority];
    if (v10 == a4)
    {
    }
    else
    {
      v11 = [(SearchNoResultsTableViewCell *)self heightConstraint];
      [v11 priority];
      float v13 = v12;

      if (a4 == 1000.0 || v13 == 1000.0) {
        [(SearchNoResultsTableViewCell *)self clearHeightConstraint];
      }
    }
  }
  v14 = [(SearchNoResultsTableViewCell *)self heightConstraint];

  if (v14)
  {
    v15 = [(SearchNoResultsTableViewCell *)self heightConstraint];
    [v15 setConstant:a3];

    v16 = [(SearchNoResultsTableViewCell *)self heightConstraint];
    [v16 priority];
    float v18 = v17;

    if (v18 == a4) {
      return;
    }
    id v25 = [(SearchNoResultsTableViewCell *)self heightConstraint];
    *(float *)&double v19 = a4;
    [v25 setPriority:v19];
  }
  else
  {
    v20 = [(SearchNoResultsTableViewCell *)self contentView];
    v21 = [v20 heightAnchor];
    v22 = [v21 constraintEqualToConstant:a3];
    [(SearchNoResultsTableViewCell *)self setHeightConstraint:v22];

    v23 = [(SearchNoResultsTableViewCell *)self heightConstraint];
    *(float *)&double v24 = a4;
    [v23 setPriority:v24];

    id v25 = [(SearchNoResultsTableViewCell *)self heightConstraint];
    [v25 setActive:1];
  }
}

- (void)setEnableStructuredRAPAffordance:(BOOL)a3
{
  if (!self->_enableStructuredRAPAffordance || a3)
  {
    if (!self->_enableStructuredRAPAffordance && a3) {
      [(SearchNoResultsTableViewCell *)self _addRAPButton];
    }
  }
  else
  {
    [(SearchNoResultsTableViewCell *)self _removeRAPButton];
  }
  self->_enableStructuredRAPAffordance = a3;
}

- (void)_addRAPButton
{
}

- (void)_removeRAPButton
{
  [(UIStackView *)self->_stackView removeArrangedSubview:self->_rapButton];
  rapButton = self->_rapButton;

  [(UIButton *)rapButton removeFromSuperview];
}

- (void)_didTapOnRAPButton
{
  id v2 = [(SearchNoResultsTableViewCell *)self delegate];
  [v2 didTapOnReportAnIssue];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SearchNoResultsTableViewCell;
  [(SearchNoResultsTableViewCell *)&v4 layoutSubviews];
  id v3 = [(SearchNoResultsTableViewCell *)self keyboardAvoidingView];
  [v3 updateForKeyboardFrame];
}

- (BOOL)enableStructuredRAPAffordance
{
  return self->_enableStructuredRAPAffordance;
}

- (SearchNoResultsTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SearchNoResultsTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (KeyboardAvoidingView)keyboardAvoidingView
{
  return self->_keyboardAvoidingView;
}

- (void)setKeyboardAvoidingView:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UIButton)rapButton
{
  return self->_rapButton;
}

- (void)setRapButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapButton, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_keyboardAvoidingView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end