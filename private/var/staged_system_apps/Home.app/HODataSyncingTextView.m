@interface HODataSyncingTextView
- (HODataSyncingTextView)init;
- (NSArray)activeConstraints;
- (NSArray)buttonLayoutConstraints;
- (NSArray)spinnerLayoutConstraints;
- (UIActivityIndicatorView)spinner;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (id)_createConstraintsForFirstItem:(id)a3 secondItem:(id)a4;
- (id)boldFontForStyle:(id)a3;
- (unint64_t)dataSyncState;
- (void)_configureForSpinnerLayout;
- (void)_configureForTwoLabelLayout;
- (void)setActiveConstraints:(id)a3;
- (void)setButtonLayoutConstraints:(id)a3;
- (void)setDataSyncState:(unint64_t)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setSpinnerLayoutConstraints:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation HODataSyncingTextView

- (HODataSyncingTextView)init
{
  v13.receiver = self;
  v13.super_class = (Class)HODataSyncingTextView;
  v2 = [(HODataSyncingTextView *)&v13 init];
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v3;

    v5 = [(HODataSyncingTextView *)v2 boldFontForStyle:UIFontTextStyleTitle1];
    [(UILabel *)v2->_titleLabel setFont:v5];

    [(UILabel *)v2->_titleLabel setNumberOfLines:0];
    [(UILabel *)v2->_titleLabel setTextAlignment:1];
    v6 = (UILabel *)objc_alloc_init((Class)UILabel);
    descriptionLabel = v2->_descriptionLabel;
    v2->_descriptionLabel = v6;

    v8 = [(HODataSyncingTextView *)v2 boldFontForStyle:UIFontTextStyleSubheadline];
    [(UILabel *)v2->_descriptionLabel setFont:v8];

    [(UILabel *)v2->_descriptionLabel setNumberOfLines:0];
    [(UILabel *)v2->_descriptionLabel setTextAlignment:1];
    v9 = +[UIColor secondaryLabelColor];
    [(UILabel *)v2->_descriptionLabel setTextColor:v9];

    v10 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    spinner = v2->_spinner;
    v2->_spinner = v10;

    [(UIActivityIndicatorView *)v2->_spinner setHidesWhenStopped:1];
    [(HODataSyncingTextView *)v2 addSubview:v2->_titleLabel];
    [(HODataSyncingTextView *)v2 addSubview:v2->_descriptionLabel];
    [(HODataSyncingTextView *)v2 addSubview:v2->_spinner];
    [(UILabel *)v2->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v2->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v2->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  return v2;
}

- (void)setDataSyncState:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 4uLL:
    case 5uLL:
      v4 = sub_10004B478(@"HODataSyncingTitleGeneric");
      v5 = [(HODataSyncingTextView *)self titleLabel];
      [v5 setText:v4];

      v6 = [(HODataSyncingTextView *)self spinner];
      [v6 startAnimating];

      [(HODataSyncingTextView *)self _configureForSpinnerLayout];
      break;
    case 1uLL:
      return;
    case 2uLL:
      v12 = sub_10004B478(@"HODataSyncingTitleKeychain");
      objc_super v13 = [(HODataSyncingTextView *)self titleLabel];
      [v13 setText:v12];

      if (+[HFUtilities isAMac]) {
        v9 = @"HODataSyncingDescriptionEnableKeychain_iosMac";
      }
      else {
        v9 = @"HODataSyncingDescriptionEnableKeychain";
      }
      goto LABEL_12;
    case 3uLL:
    case 6uLL:
      v7 = sub_10004B478(@"HODataSyncingTitleiCloud");
      v8 = [(HODataSyncingTextView *)self titleLabel];
      [v8 setText:v7];

      v9 = @"HODataSyncingDescriptionEnableiCloud";
LABEL_12:
      v14 = sub_10004B478(v9);
      v15 = [(HODataSyncingTextView *)self descriptionLabel];
      [v15 setText:v14];

      v16 = [(HODataSyncingTextView *)self spinner];
      [v16 stopAnimating];

      [(HODataSyncingTextView *)self _configureForTwoLabelLayout];
      break;
    default:
      v10 = +[NSString stringWithFormat:@"Unhandled dataSyncState %lu", a3];
      v11 = HFLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100083970((uint64_t)v10, v11);
      }

      NSLog(@"%@", v10);
      break;
  }
}

- (void)_configureForTwoLabelLayout
{
  v3 = [(HODataSyncingTextView *)self buttonLayoutConstraints];

  if (!v3)
  {
    v4 = [(HODataSyncingTextView *)self titleLabel];
    v5 = [(HODataSyncingTextView *)self descriptionLabel];
    v6 = [(HODataSyncingTextView *)self _createConstraintsForFirstItem:v4 secondItem:v5];
    [(HODataSyncingTextView *)self setButtonLayoutConstraints:v6];
  }
  v7 = [(HODataSyncingTextView *)self spinner];
  [v7 setHidden:1];

  v8 = [(HODataSyncingTextView *)self descriptionLabel];
  [v8 setHidden:0];

  v9 = [(HODataSyncingTextView *)self activeConstraints];
  v10 = [(HODataSyncingTextView *)self buttonLayoutConstraints];

  if (v9 != v10)
  {
    v11 = [(HODataSyncingTextView *)self activeConstraints];
    +[NSLayoutConstraint deactivateConstraints:v11];

    v12 = [(HODataSyncingTextView *)self buttonLayoutConstraints];
    [(HODataSyncingTextView *)self setActiveConstraints:v12];

    id v13 = [(HODataSyncingTextView *)self activeConstraints];
    +[NSLayoutConstraint activateConstraints:v13];
  }
}

- (void)_configureForSpinnerLayout
{
  v3 = [(HODataSyncingTextView *)self spinnerLayoutConstraints];

  if (!v3)
  {
    v4 = [(HODataSyncingTextView *)self spinner];
    v5 = [(HODataSyncingTextView *)self titleLabel];
    v6 = [(HODataSyncingTextView *)self _createConstraintsForFirstItem:v4 secondItem:v5];
    [(HODataSyncingTextView *)self setSpinnerLayoutConstraints:v6];
  }
  v7 = [(HODataSyncingTextView *)self spinner];
  [v7 setHidden:0];

  v8 = [(HODataSyncingTextView *)self descriptionLabel];
  [v8 setHidden:1];

  v9 = [(HODataSyncingTextView *)self activeConstraints];
  v10 = [(HODataSyncingTextView *)self spinnerLayoutConstraints];

  if (v9 != v10)
  {
    v11 = [(HODataSyncingTextView *)self activeConstraints];
    +[NSLayoutConstraint deactivateConstraints:v11];

    v12 = [(HODataSyncingTextView *)self spinnerLayoutConstraints];
    [(HODataSyncingTextView *)self setActiveConstraints:v12];

    id v13 = [(HODataSyncingTextView *)self activeConstraints];
    +[NSLayoutConstraint activateConstraints:v13];
  }
}

- (id)_createConstraintsForFirstItem:(id)a3 secondItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v9 = [v7 topAnchor];
  v10 = [(HODataSyncingTextView *)self topAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  [v8 addObject:v11];

  v12 = [v7 centerXAnchor];
  id v13 = [(HODataSyncingTextView *)self centerXAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  [v8 addObject:v14];

  v15 = [v7 leadingAnchor];
  v16 = [(HODataSyncingTextView *)self leadingAnchor];
  v17 = [v15 constraintGreaterThanOrEqualToAnchor:v16];
  [v8 addObject:v17];

  v18 = [v7 trailingAnchor];
  v19 = [(HODataSyncingTextView *)self trailingAnchor];
  v20 = [v18 constraintLessThanOrEqualToAnchor:v19];
  [v8 addObject:v20];

  v21 = [v7 bottomAnchor];

  v22 = [v6 topAnchor];
  v23 = [v21 constraintEqualToAnchor:v22 constant:-10.0];
  [v8 addObject:v23];

  v24 = [v6 centerXAnchor];
  v25 = [(HODataSyncingTextView *)self centerXAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  [v8 addObject:v26];

  v27 = [v6 leadingAnchor];
  v28 = [(HODataSyncingTextView *)self leadingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  [v8 addObject:v29];

  v30 = [v6 trailingAnchor];
  v31 = [(HODataSyncingTextView *)self trailingAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  [v8 addObject:v32];

  v33 = [v6 bottomAnchor];

  v34 = [(HODataSyncingTextView *)self bottomAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  [v8 addObject:v35];

  return v8;
}

- (id)boldFontForStyle:(id)a3
{
  v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:2 options:0];
  v4 = +[UIFont fontWithDescriptor:v3 size:0.0];

  return v4;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (unint64_t)dataSyncState
{
  return self->_dataSyncState;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
}

- (NSArray)spinnerLayoutConstraints
{
  return self->_spinnerLayoutConstraints;
}

- (void)setSpinnerLayoutConstraints:(id)a3
{
}

- (NSArray)buttonLayoutConstraints
{
  return self->_buttonLayoutConstraints;
}

- (void)setButtonLayoutConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_spinnerLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end