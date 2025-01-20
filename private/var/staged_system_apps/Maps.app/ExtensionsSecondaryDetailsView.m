@interface ExtensionsSecondaryDetailsView
- (ExtensionsSecondaryDetailsView)initWithCoder:(id)a3;
- (ExtensionsSecondaryDetailsView)initWithFrame:(CGRect)a3;
- (UILabel)disclaimerLabel;
- (UILabel)informationLabel;
- (id)_newLabelWithNumberOfLines:(int64_t)a3;
- (void)_commonInit;
- (void)_updateConstraints;
- (void)setDetailEntries:(id)a3;
- (void)setDisclaimerLabel:(id)a3;
- (void)setInformationLabel:(id)a3;
@end

@implementation ExtensionsSecondaryDetailsView

- (ExtensionsSecondaryDetailsView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ExtensionsSecondaryDetailsView;
  v3 = [(ExtensionsSecondaryDetailsView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ExtensionsSecondaryDetailsView *)v3 _commonInit];
  }
  return v4;
}

- (ExtensionsSecondaryDetailsView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ExtensionsSecondaryDetailsView;
  v3 = -[ExtensionsSecondaryDetailsView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(ExtensionsSecondaryDetailsView *)v3 _commonInit];
  }
  return v4;
}

- (id)_newLabelWithNumberOfLines:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)UILabel);
  [v4 setNumberOfLines:a3];
  v5 = +[UIColor secondaryLabelColor];
  [v4 setTextColor:v5];

  +[DynamicTypeWizard autorefreshLabel:v4 withFontProvider:&stru_101321340];
  return v4;
}

- (void)_commonInit
{
  [(ExtensionsSecondaryDetailsView *)self setLeftHairlineInset:16.0];
  [(ExtensionsSecondaryDetailsView *)self setRightHairlineInset:0.0];
  v3 = [(ExtensionsSecondaryDetailsView *)self theme];
  id v4 = [v3 hairlineColor];
  [(ExtensionsSecondaryDetailsView *)self setHairlineColor:v4];

  [(ExtensionsSecondaryDetailsView *)self setTopHairlineHidden:0];
  [(ExtensionsSecondaryDetailsView *)self setBottomHairlineHidden:1];
  v5 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  detailsStackView = self->_detailsStackView;
  self->_detailsStackView = v5;

  [(UIStackView *)self->_detailsStackView setAxis:1];
  [(UIStackView *)self->_detailsStackView setSpacing:5.0];
  [(ExtensionsSecondaryDetailsView *)self addSubview:self->_detailsStackView];
  v7 = [(ExtensionsSecondaryDetailsView *)self _newLabelWithNumberOfLines:0];
  informationLabel = self->_informationLabel;
  self->_informationLabel = v7;

  [(ExtensionsSecondaryDetailsView *)self addSubview:self->_informationLabel];
  v9 = [(ExtensionsSecondaryDetailsView *)self _newLabelWithNumberOfLines:0];
  disclaimerLabel = self->_disclaimerLabel;
  self->_disclaimerLabel = v9;

  [(ExtensionsSecondaryDetailsView *)self addSubview:self->_disclaimerLabel];

  [(ExtensionsSecondaryDetailsView *)self _updateConstraints];
}

- (void)setDetailEntries:(id)a3
{
  id v4 = a3;
  latestEntries = self->_latestEntries;
  if (!latestEntries || ([(NSArray *)latestEntries isEqual:v4] & 1) == 0)
  {
    objc_super v6 = (NSArray *)[v4 copy];
    v7 = self->_latestEntries;
    self->_latestEntries = v6;

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v8 = [(UIStackView *)self->_detailsStackView arrangedSubviews];
    id v9 = [v8 countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v61;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v61 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          [(UIStackView *)self->_detailsStackView removeArrangedSubview:v13];
          [v13 removeFromSuperview];
        }
        id v10 = [v8 countByEnumeratingWithState:&v60 objects:v66 count:16];
      }
      while (v10);
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v35 = v4;
    id obj = v4;
    id v39 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
    if (v39)
    {
      uint64_t v37 = *(void *)v57;
      v38 = self;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v57 != v37) {
            objc_enumerationMutation(obj);
          }
          uint64_t v55 = v14;
          v15 = *(void **)(*((void *)&v56 + 1) + 8 * v14);
          id v16 = objc_alloc_init((Class)UIView);
          v17 = +[UIApplication sharedApplication];
          id v18 = [v17 userInterfaceLayoutDirection];
          BOOL v19 = v18 != 0;
          BOOL v20 = v18 == 0;

          id v21 = [(ExtensionsSecondaryDetailsView *)self _newLabelWithNumberOfLines:1];
          [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
          v22 = [v15 title];
          [v21 setText:v22];

          [v21 setTextAlignment:2 * v19];
          [v16 addSubview:v21];
          id v23 = [(ExtensionsSecondaryDetailsView *)self _newLabelWithNumberOfLines:1];
          [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
          v24 = [v15 details];
          [v23 setText:v24];

          [v23 setTextAlignment:2 * v20];
          [v16 addSubview:v23];
          LODWORD(v25) = 1144733696;
          [v21 setContentCompressionResistancePriority:0 forAxis:v25];
          LODWORD(v26) = 1144750080;
          [v23 setContentCompressionResistancePriority:0 forAxis:v26];
          v54 = [v21 topAnchor];
          v53 = [v16 topAnchor];
          v52 = [v54 constraintEqualToAnchor:v53];
          v64[0] = v52;
          v51 = [v21 leadingAnchor];
          v50 = [v16 leadingAnchor];
          v49 = [v51 constraintEqualToAnchor:v50];
          v64[1] = v49;
          v48 = [v21 bottomAnchor];
          v46 = [v16 bottomAnchor];
          v45 = [v48 constraintEqualToAnchor:v46];
          v64[2] = v45;
          v44 = [v23 trailingAnchor];
          v47 = v16;
          v43 = [v16 trailingAnchor];
          v42 = [v44 constraintEqualToAnchor:v43];
          v64[3] = v42;
          v41 = [v23 bottomAnchor];
          v40 = [v16 bottomAnchor];
          v27 = [v41 constraintEqualToAnchor:v40];
          v64[4] = v27;
          v28 = [v21 firstBaselineAnchor];
          v29 = [v23 firstBaselineAnchor];
          v30 = [v28 constraintEqualToAnchor:v29];
          v64[5] = v30;
          v31 = [v21 trailingAnchor];
          v32 = [v23 leadingAnchor];
          v33 = [v31 constraintLessThanOrEqualToAnchor:v32];
          v64[6] = v33;
          v34 = +[NSArray arrayWithObjects:v64 count:7];
          +[NSLayoutConstraint activateConstraints:v34];

          self = v38;
          [(UIStackView *)v38->_detailsStackView addArrangedSubview:v47];

          uint64_t v14 = v55 + 1;
        }
        while (v39 != (id)(v55 + 1));
        id v39 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
      }
      while (v39);
    }

    [(ExtensionsSecondaryDetailsView *)self _updateConstraints];
    id v4 = v35;
  }
}

- (void)setDisclaimerLabel:(id)a3
{
  objc_storeStrong((id *)&self->_disclaimerLabel, a3);

  [(ExtensionsSecondaryDetailsView *)self _updateConstraints];
}

- (void)setInformationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_informationLabel, a3);

  [(ExtensionsSecondaryDetailsView *)self _updateConstraints];
}

- (void)_updateConstraints
{
  constraints = self->_constraints;
  if (constraints && [(NSArray *)constraints count]) {
    +[NSLayoutConstraint deactivateConstraints:self->_constraints];
  }
  [(ExtensionsSecondaryDetailsView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_informationLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_detailsStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_disclaimerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [(UILabel *)self->_informationLabel text];
  id v5 = [v4 length];

  objc_super v6 = [(UILabel *)self->_disclaimerLabel text];
  id v7 = [v6 length];

  NSUInteger v8 = [(NSArray *)self->_latestEntries count];
  id v9 = [(UILabel *)self->_disclaimerLabel topAnchor];
  v49 = v9;
  uint64_t v10 = [(ExtensionsSecondaryDetailsView *)self topAnchor];
  v48 = (void *)v10;
  double v11 = 41.0;
  if (v5)
  {
    double v12 = 20.0;
  }
  else
  {
    double v11 = 0.0;
    double v12 = 0.0;
  }
  double v13 = 5.0;
  if (v8)
  {
    double v14 = 20.0;
  }
  else
  {
    double v13 = 0.0;
    double v14 = 0.0;
  }
  if (v8) {
    double v15 = v11;
  }
  else {
    double v15 = v12;
  }
  if (v7) {
    double v16 = 20.0;
  }
  else {
    double v16 = 0.0;
  }
  if (v7) {
    double v17 = v13;
  }
  else {
    double v17 = v14;
  }
  v47 = [v9 constraintEqualToAnchor:v10 constant:v16];
  v50[0] = v47;
  v46 = [(UILabel *)self->_disclaimerLabel leadingAnchor];
  v45 = [(ExtensionsSecondaryDetailsView *)self leadingAnchor];
  v44 = [v46 constraintEqualToAnchor:v45 constant:16.0];
  v50[1] = v44;
  v43 = [(ExtensionsSecondaryDetailsView *)self trailingAnchor];
  v42 = [(UILabel *)self->_disclaimerLabel trailingAnchor];
  v41 = [v43 constraintEqualToAnchor:v42 constant:16.0];
  v50[2] = v41;
  v40 = [(UIStackView *)self->_detailsStackView topAnchor];
  id v39 = [(UILabel *)self->_disclaimerLabel bottomAnchor];
  v38 = [v40 constraintEqualToAnchor:v39 constant:v17];
  v50[3] = v38;
  uint64_t v37 = [(UIStackView *)self->_detailsStackView leadingAnchor];
  v36 = [(ExtensionsSecondaryDetailsView *)self leadingAnchor];
  id v35 = [v37 constraintEqualToAnchor:v36 constant:16.0];
  v50[4] = v35;
  v34 = [(ExtensionsSecondaryDetailsView *)self trailingAnchor];
  v33 = [(UIStackView *)self->_detailsStackView trailingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33 constant:16.0];
  v50[5] = v32;
  v31 = [(UILabel *)self->_informationLabel topAnchor];
  v30 = [(UIStackView *)self->_detailsStackView bottomAnchor];
  v29 = [v31 constraintEqualToAnchor:v30 constant:v15];
  v50[6] = v29;
  v28 = [(UILabel *)self->_informationLabel leadingAnchor];
  id v18 = [(ExtensionsSecondaryDetailsView *)self leadingAnchor];
  BOOL v19 = [v28 constraintEqualToAnchor:v18 constant:16.0];
  v50[7] = v19;
  BOOL v20 = [(ExtensionsSecondaryDetailsView *)self trailingAnchor];
  id v21 = [(UILabel *)self->_informationLabel trailingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21 constant:16.0];
  v50[8] = v22;
  id v23 = [(ExtensionsSecondaryDetailsView *)self bottomAnchor];
  v24 = [(UILabel *)self->_informationLabel bottomAnchor];
  double v25 = [v23 constraintEqualToAnchor:v24 constant:20.0];
  v50[9] = v25;
  double v26 = +[NSArray arrayWithObjects:v50 count:10];
  v27 = self->_constraints;
  self->_constraints = v26;

  +[NSLayoutConstraint activateConstraints:self->_constraints];
}

- (UILabel)disclaimerLabel
{
  return self->_disclaimerLabel;
}

- (UILabel)informationLabel
{
  return self->_informationLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_informationLabel, 0);
  objc_storeStrong((id *)&self->_disclaimerLabel, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_detailsStackView, 0);

  objc_storeStrong((id *)&self->_latestEntries, 0);
}

@end