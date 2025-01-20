@interface TabExplanationView
- (CGRect)labelsContainerFrame;
- (TabExplanationView)initWithVariant:(unint64_t)a3 query:(id)a4;
- (id)_basicLabel;
- (unint64_t)variant;
- (void)_updateLabelBlendMode;
- (void)setQuery:(id)a3;
- (void)setVariant:(unint64_t)a3 query:(id)a4;
- (void)updateConstraints;
@end

@implementation TabExplanationView

- (id)_basicLabel
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1930]);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setTextAlignment:1];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setOpaque:0];
  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_colorNamed:", @"TabExplanationLabelColor");
  [v3 setTextColor:v5];

  v6 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A018]];
  v7 = [v3 layer];
  [v7 setCompositingFilter:v6];

  return v3;
}

- (TabExplanationView)initWithVariant:(unint64_t)a3 query:(id)a4
{
  v78[4] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v74.receiver = self;
  v74.super_class = (Class)TabExplanationView;
  v7 = -[TabExplanationView initWithFrame:](&v74, sel_initWithFrame_, 0.0, 0.0, 320.0, 300.0);
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    labelsContainer = v7->_labelsContainer;
    v7->_labelsContainer = (UIView *)v9;

    [(UIView *)v7->_labelsContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [(UIView *)v7->_labelsContainer layer];
    [v11 setAllowsGroupBlending:0];

    [(TabExplanationView *)v7 addSubview:v7->_labelsContainer];
    uint64_t v12 = [(TabExplanationView *)v7 _basicLabel];
    title = v7->_title;
    v7->_title = (UILabel *)v12;

    v14 = v7->_title;
    [MEMORY[0x1E4FB17A8] metricsForTextStyle:*MEMORY[0x1E4FB2988]];
    v15 = id v72 = v6;
    [MEMORY[0x1E4FB08E0] systemFontOfSize:27.0];
    v16 = unint64_t v73 = a3;
    v17 = [v15 scaledFontForFont:v16];
    [(UILabel *)v14 setFont:v17];

    [(UILabel *)v7->_title setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v7->_title setNumberOfLines:0];
    [(UIView *)v7->_labelsContainer addSubview:v7->_title];
    uint64_t v18 = [(TabExplanationView *)v7 _basicLabel];
    message = v7->_message;
    v7->_message = (UILabel *)v18;

    v20 = v7->_message;
    v21 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [(UILabel *)v20 setFont:v21];

    [(UILabel *)v7->_message setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v7->_message setNumberOfLines:0];
    [(UIView *)v7->_labelsContainer addSubview:v7->_message];
    [(TabExplanationView *)v7 _updateLabelBlendMode];
    v22 = [MEMORY[0x1E4F28DC8] constraintWithItem:v7->_labelsContainer attribute:9 relatedBy:0 toItem:v7 attribute:9 multiplier:1.0 constant:0.0];
    [(TabExplanationView *)v7 addConstraint:v22];

    v23 = [MEMORY[0x1E4F28DC8] constraintWithItem:v7->_labelsContainer attribute:10 relatedBy:0 toItem:v7 attribute:10 multiplier:1.0 constant:0.0];
    [(TabExplanationView *)v7 addConstraint:v23];

    v65 = (void *)MEMORY[0x1E4F28DC8];
    v70 = [(UIView *)v7->_labelsContainer leadingAnchor];
    v69 = [(TabExplanationView *)v7 leadingAnchor];
    v68 = [v70 constraintGreaterThanOrEqualToAnchor:v69];
    v78[0] = v68;
    v67 = [(UIView *)v7->_labelsContainer trailingAnchor];
    v66 = [(TabExplanationView *)v7 trailingAnchor];
    v24 = [v67 constraintLessThanOrEqualToAnchor:v66];
    v78[1] = v24;
    v25 = [(UIView *)v7->_labelsContainer topAnchor];
    v26 = [(TabExplanationView *)v7 topAnchor];
    v27 = [v25 constraintGreaterThanOrEqualToAnchor:v26];
    v78[2] = v27;
    v28 = [(UIView *)v7->_labelsContainer bottomAnchor];
    v29 = [(TabExplanationView *)v7 bottomAnchor];
    v30 = [v28 constraintLessThanOrEqualToAnchor:v29];
    v78[3] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:4];
    [v65 activateConstraints:v31];

    v71 = _NSDictionaryOfVariableBindings((NSString *)@"_labelsContainer", v7->_labelsContainer, 0);
    uint64_t v32 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(>=horizontalPadding)-[_labelsContainer]-(>=horizontalPadding)-|" options:0 metrics:&unk_1F3C73CD0 views:v71];
    defaultHorizontalPaddingConstraints = v7->_defaultHorizontalPaddingConstraints;
    v7->_defaultHorizontalPaddingConstraints = (NSArray *)v32;

    uint64_t v34 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[_labelsContainer]-|" options:0 metrics:0 views:v71];
    accessibilityHorizontalPaddingConstraints = v7->_accessibilityHorizontalPaddingConstraints;
    v7->_accessibilityHorizontalPaddingConstraints = (NSArray *)v34;

    v36 = [(UILabel *)v7->_message topAnchor];
    v37 = [(UILabel *)v7->_title bottomAnchor];
    double v38 = 18.0;
    if (v73 == 2) {
      double v38 = 10.0;
    }
    uint64_t v39 = [v36 constraintEqualToAnchor:v37 constant:v38];
    spaceBetweenTitleAndMessageConstraint = v7->_spaceBetweenTitleAndMessageConstraint;
    v7->_spaceBetweenTitleAndMessageConstraint = (NSLayoutConstraint *)v39;

    [(NSLayoutConstraint *)v7->_spaceBetweenTitleAndMessageConstraint setActive:1];
    v41 = v7->_labelsContainer;
    v42 = [MEMORY[0x1E4F28DC8] constraintWithItem:v7->_title attribute:3 relatedBy:0 toItem:v41 attribute:3 multiplier:1.0 constant:0.0];
    [(UIView *)v41 addConstraint:v42];

    v43 = v7->_labelsContainer;
    v44 = [MEMORY[0x1E4F28DC8] constraintWithItem:v7->_message attribute:4 relatedBy:0 toItem:v43 attribute:4 multiplier:1.0 constant:0.0];
    [(UIView *)v43 addConstraint:v44];

    v45 = (void *)MEMORY[0x1E4F28DC8];
    v46 = [(UIView *)v7->_labelsContainer widthAnchor];
    v47 = [v46 constraintGreaterThanOrEqualToConstant:124.0];
    v77[0] = v47;
    v48 = [(UIView *)v7->_labelsContainer widthAnchor];
    v49 = [v48 constraintLessThanOrEqualToConstant:439.0];
    v77[1] = v49;
    v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:2];
    [v45 activateConstraints:v50];

    v51 = v7->_labelsContainer;
    v52 = (void *)MEMORY[0x1E4F28DC8];
    v53 = _NSDictionaryOfVariableBindings((NSString *)@"_title", v7->_title, 0);
    v54 = [v52 constraintsWithVisualFormat:@"H:|[_title]|" options:0 metrics:0 views:v53];
    [(UIView *)v51 addConstraints:v54];

    v55 = v7->_labelsContainer;
    v56 = (void *)MEMORY[0x1E4F28DC8];
    v57 = _NSDictionaryOfVariableBindings((NSString *)@"_message", v7->_message, 0);
    v58 = [v56 constraintsWithVisualFormat:@"H:|[_message]|" options:0 metrics:0 views:v57];
    [(UIView *)v55 addConstraints:v58];

    id v6 = v72;
    [(TabExplanationView *)v7 setVariant:v73 query:v72];
    uint64_t v76 = objc_opt_class();
    v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
    id v60 = (id)[(TabExplanationView *)v7 registerForTraitChanges:v59 withTarget:v7 action:sel_setNeedsUpdateConstraints];

    uint64_t v75 = objc_opt_class();
    v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
    id v62 = (id)[(TabExplanationView *)v7 registerForTraitChanges:v61 withTarget:v7 action:sel__updateLabelBlendMode];

    v63 = v7;
  }

  return v7;
}

- (void)setVariant:(unint64_t)a3 query:(id)a4
{
  id v9 = a4;
  self->_variant = a3;
  if (a3 == 2 || a3 == 1)
  {
    id v6 = _WBSLocalizedString();
  }
  else
  {
    id v6 = 0;
  }
  [(UILabel *)self->_title setText:v6];

  double v7 = 18.0;
  if (a3 == 2) {
    double v7 = 10.0;
  }
  [(NSLayoutConstraint *)self->_spaceBetweenTitleAndMessageConstraint setConstant:v7];
  id v8 = messageForVariant(a3, v9);
  [(UILabel *)self->_message setText:v8];
}

- (void)setQuery:(id)a3
{
  messageForVariant(self->_variant, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_message setText:v4];
}

- (CGRect)labelsContainerFrame
{
  [(UIView *)self->_labelsContainer frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)updateConstraints
{
  v6.receiver = self;
  v6.super_class = (Class)TabExplanationView;
  [(TabExplanationView *)&v6 updateConstraints];
  double v3 = [(TabExplanationView *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  objc_msgSend(MEMORY[0x1E4F28DC8], "sf_setConstraints:active:", self->_accessibilityHorizontalPaddingConstraints, IsAccessibilityCategory);
  objc_msgSend(MEMORY[0x1E4F28DC8], "sf_setConstraints:active:", self->_defaultHorizontalPaddingConstraints, IsAccessibilityCategory ^ 1);
}

- (void)_updateLabelBlendMode
{
  double v3 = [(TabExplanationView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  double v5 = (void *)MEMORY[0x1E4F3A008];
  if (v4 == 2) {
    double v5 = (void *)MEMORY[0x1E4F3A018];
  }
  id v8 = [MEMORY[0x1E4F39BC0] filterWithType:*v5];
  objc_super v6 = [(UILabel *)self->_title layer];
  [v6 setCompositingFilter:v8];

  double v7 = [(UILabel *)self->_message layer];
  [v7 setCompositingFilter:v8];
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityHorizontalPaddingConstraints, 0);
  objc_storeStrong((id *)&self->_defaultHorizontalPaddingConstraints, 0);
  objc_storeStrong((id *)&self->_spaceBetweenTitleAndMessageConstraint, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_labelsContainer, 0);
}

@end