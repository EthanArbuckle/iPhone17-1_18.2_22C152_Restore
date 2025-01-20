@interface ExtensionsPrimaryDetailsView
- (NSLayoutConstraint)actionButtonStackViewBottomConstraint;
- (NSLayoutConstraint)actionButtonStackViewHeightConstraint;
- (NSLayoutConstraint)heightConstraint;
- (UIImageView)appIconImageView;
- (UILabel)subtitleLabel;
- (UILabel)tertiaryLabel;
- (UILabel)titleLabel;
- (UIStackView)actionButtonStackView;
- (id)_buttonFont;
- (void)_updateTertiaryLabelContent;
- (void)configureWithActionButtons:(id)a3;
- (void)contentViewDidLoad;
- (void)layoutSubviews;
- (void)setActionButtonStackView:(id)a3;
- (void)setActionButtonStackViewBottomConstraint:(id)a3;
- (void)setActionButtonStackViewHeightConstraint:(id)a3;
- (void)setAppIconImageView:(id)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTertiaryLabel:(id)a3;
- (void)setTertiaryText:(id)a3 badge:(id)a4;
- (void)setTitleLabel:(id)a3;
- (void)updateLayout;
@end

@implementation ExtensionsPrimaryDetailsView

- (void)contentViewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)ExtensionsPrimaryDetailsView;
  [(NibView *)&v21 contentViewDidLoad];
  v3 = +[UIColor labelColor];
  v4 = [(ExtensionsPrimaryDetailsView *)self titleLabel];
  [v4 setTextColor:v3];

  v5 = +[UIColor secondaryLabelColor];
  v6 = [(ExtensionsPrimaryDetailsView *)self subtitleLabel];
  [v6 setTextColor:v5];

  v7 = +[UIColor labelColor];
  v8 = [(ExtensionsPrimaryDetailsView *)self tertiaryLabel];
  [v8 setTextColor:v7];

  v9 = [(ExtensionsPrimaryDetailsView *)self titleLabel];
  +[DynamicTypeWizard autorefreshLabel:v9 withFontProvider:&stru_101321480];

  v10 = [(ExtensionsPrimaryDetailsView *)self subtitleLabel];
  +[DynamicTypeWizard autorefreshLabel:v10 withFontProvider:&stru_101321340];

  v11 = [(ExtensionsPrimaryDetailsView *)self titleLabel];
  [v11 setLineBreakMode:0];

  v12 = [(ExtensionsPrimaryDetailsView *)self titleLabel];
  [v12 setNumberOfLines:0];

  v13 = [(ExtensionsPrimaryDetailsView *)self subtitleLabel];
  [v13 setLineBreakMode:0];

  v14 = [(ExtensionsPrimaryDetailsView *)self subtitleLabel];
  [v14 setNumberOfLines:0];

  v15 = [(ExtensionsPrimaryDetailsView *)self tertiaryLabel];
  [v15 setLineBreakMode:0];

  v16 = [(ExtensionsPrimaryDetailsView *)self tertiaryLabel];
  [v16 setNumberOfLines:0];

  v17 = +[NSNotificationCenter defaultCenter];
  [v17 addObserver:self selector:"updateLayout" name:UIContentSizeCategoryDidChangeNotification object:0];

  v18 = [(ExtensionsPrimaryDetailsView *)self heightAnchor];
  v19 = [v18 constraintGreaterThanOrEqualToConstant:147.0];
  [(ExtensionsPrimaryDetailsView *)self setHeightConstraint:v19];

  [(ExtensionsPrimaryDetailsView *)self _updateTertiaryLabelContent];
  heightConstraint = self->_heightConstraint;
  v20 = +[NSArray arrayWithObjects:&heightConstraint count:1];
  +[NSLayoutConstraint activateConstraints:v20];
}

- (void)configureWithActionButtons:(id)a3
{
  id v4 = a3;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v5 = [(ExtensionsPrimaryDetailsView *)self actionButtonStackView];
  v6 = [v5 arrangedSubviews];

  id v7 = [v6 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v39 + 1) + 8 * i) removeFromSuperview];
      }
      id v8 = [v6 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v8);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v4;
  id v11 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v34 = *(void *)v36;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v36 != v34) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
        v15 = [v14 titleLabel];
        +[DynamicTypeWizard autorefreshLabel:v15 withFontProvider:&stru_1013214E0];

        v16 = [v14 heightAnchor];
        v17 = [v16 constraintGreaterThanOrEqualToConstant:50.0];

        v18 = +[DynamicTypeWizard autoscaledConstraint:v17 constant:&stru_1013214E0 withFontProvider:50.0];
        v43 = v18;
        v19 = +[NSArray arrayWithObjects:&v43 count:1];
        +[NSLayoutConstraint activateConstraints:v19];

        v20 = [(ExtensionsPrimaryDetailsView *)self actionButtonStackView];
        [v20 addArrangedSubview:v14];
      }
      id v12 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v12);
  }

  objc_super v21 = [(ExtensionsPrimaryDetailsView *)self actionButtonStackViewBottomConstraint];
  unsigned int v22 = [v21 isActive];

  v23 = [(ExtensionsPrimaryDetailsView *)self actionButtonStackView];
  v24 = [v23 arrangedSubviews];
  id v25 = [v24 count];

  if (v25)
  {
    if ((v22 & 1) == 0)
    {
      v26 = [(ExtensionsPrimaryDetailsView *)self actionButtonStackViewHeightConstraint];
      [v26 setConstant:40.0];

      v27 = [(ExtensionsPrimaryDetailsView *)self actionButtonStackViewBottomConstraint];
      [v27 setActive:1];

      v28 = [(ExtensionsPrimaryDetailsView *)self heightConstraint];
      v29 = v28;
      double v30 = 147.0;
LABEL_20:
      [v28 setConstant:v30];

      [(ExtensionsPrimaryDetailsView *)self setNeedsUpdateConstraints];
    }
  }
  else if (v22)
  {
    v31 = [(ExtensionsPrimaryDetailsView *)self actionButtonStackViewHeightConstraint];
    [v31 setConstant:0.0];

    v32 = [(ExtensionsPrimaryDetailsView *)self actionButtonStackViewBottomConstraint];
    [v32 setActive:0];

    v28 = [(ExtensionsPrimaryDetailsView *)self heightConstraint];
    v29 = v28;
    double v30 = 100.0;
    goto LABEL_20;
  }
  [(ExtensionsPrimaryDetailsView *)self updateLayout];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ExtensionsPrimaryDetailsView;
  [(ExtensionsPrimaryDetailsView *)&v3 layoutSubviews];
  [(ExtensionsPrimaryDetailsView *)self updateLayout];
}

- (id)_buttonFont
{
  objc_super v3 = [(UIStackView *)self->_actionButtonStackView arrangedSubviews];
  id v4 = [v3 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [(UIStackView *)self->_actionButtonStackView arrangedSubviews];
    id v7 = [v6 lastObject];
    id v8 = [v7 titleLabel];
    uint64_t v9 = [v8 font];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)updateLayout
{
  objc_super v3 = [(ExtensionsPrimaryDetailsView *)self actionButtonStackView];
  id v4 = [v3 arrangedSubviews];
  if ((unint64_t)[v4 count] < 2
    || ([(ExtensionsPrimaryDetailsView *)self frame], floor(v5) > 320.0))
  {
    uint64_t v6 = [(ExtensionsPrimaryDetailsView *)self _buttonFont];
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = [(ExtensionsPrimaryDetailsView *)self _buttonFont];
      [v8 pointSize];
      double v10 = v9;

      if (v10 > 21.0) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    id v11 = [(ExtensionsPrimaryDetailsView *)self actionButtonStackView];
    id v12 = v11;
    uint64_t v13 = 0;
    goto LABEL_10;
  }

LABEL_9:
  id v11 = [(ExtensionsPrimaryDetailsView *)self actionButtonStackView];
  id v12 = v11;
  uint64_t v13 = 1;
LABEL_10:
  [v11 setAxis:v13];

  [(ExtensionsPrimaryDetailsView *)self _updateTertiaryLabelContent];
}

- (void)setTertiaryText:(id)a3 badge:(id)a4
{
  uint64_t v6 = (RidesharingSpecialPricingBadge *)a4;
  id v7 = (NSString *)[a3 copy];
  tertiaryText = self->_tertiaryText;
  self->_tertiaryText = v7;

  badge = self->_badge;
  self->_badge = v6;

  [(ExtensionsPrimaryDetailsView *)self _updateTertiaryLabelContent];
}

- (void)_updateTertiaryLabelContent
{
  objc_super v3 = +[UIFont system15Bold];
  id v4 = objc_alloc((Class)NSAttributedString);
  if (self->_tertiaryText) {
    CFStringRef tertiaryText = (const __CFString *)self->_tertiaryText;
  }
  else {
    CFStringRef tertiaryText = &stru_101324E70;
  }
  NSAttributedStringKey v10 = NSFontAttributeName;
  id v11 = v3;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v7 = [v4 initWithString:tertiaryText attributes:v6];

  id v8 = [v7 _maps_attributedStringByAppendingRidesharingSpecialPricingBadge:self->_badge representativeContentFont:v3];
  double v9 = [(ExtensionsPrimaryDetailsView *)self tertiaryLabel];
  [v9 setAttributedText:v8];
}

- (UIImageView)appIconImageView
{
  return self->_appIconImageView;
}

- (void)setAppIconImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UILabel)tertiaryLabel
{
  return self->_tertiaryLabel;
}

- (void)setTertiaryLabel:(id)a3
{
}

- (UIStackView)actionButtonStackView
{
  return self->_actionButtonStackView;
}

- (void)setActionButtonStackView:(id)a3
{
}

- (NSLayoutConstraint)actionButtonStackViewBottomConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionButtonStackViewBottomConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setActionButtonStackViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)actionButtonStackViewHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionButtonStackViewHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setActionButtonStackViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_destroyWeak((id *)&self->_actionButtonStackViewHeightConstraint);
  objc_destroyWeak((id *)&self->_actionButtonStackViewBottomConstraint);
  objc_storeStrong((id *)&self->_actionButtonStackView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_appIconImageView, 0);
  objc_storeStrong((id *)&self->_badge, 0);

  objc_storeStrong((id *)&self->_tertiaryText, 0);
}

@end