@interface WFParameterValuePickerTableViewCellContentView
- (UIImageView)iconImageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)contentStackView;
- (UIStackView)labelsStackView;
- (UISwitch)selectedSwitch;
- (WFIconHostingView)iconView;
- (WFParameterValuePickerTableViewCellConfiguration)configuration;
- (WFParameterValuePickerTableViewCellContentView)initWithConfiguration:(id)a3;
- (void)applyConfiguration:(id)a3;
- (void)selectedSwitchDidToggle:(id)a3;
- (void)setConfiguration:(id)a3;
@end

@implementation WFParameterValuePickerTableViewCellContentView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_selectedSwitch, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (UIStackView)labelsStackView
{
  return self->_labelsStackView;
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (UISwitch)selectedSwitch
{
  return self->_selectedSwitch;
}

- (WFIconHostingView)iconView
{
  return self->_iconView;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (WFParameterValuePickerTableViewCellConfiguration)configuration
{
  return self->_configuration;
}

- (void)selectedSwitchDidToggle:(id)a3
{
  v4 = [(WFParameterValuePickerTableViewCellContentView *)self superview];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  id v9 = [(WFParameterValuePickerTableViewCellContentView *)self configuration];
  v7 = [v9 delegate];
  v8 = [(WFParameterValuePickerTableViewCellContentView *)self selectedSwitch];
  objc_msgSend(v7, "parameterValuePickerTableViewCell:didToggleSelection:", v6, objc_msgSend(v8, "isOn"));
}

- (void)applyConfiguration:(id)a3
{
  id v6 = a3;
  id v7 = [(WFParameterValuePickerTableViewCellContentView *)self configuration];
  id v8 = v6;
  id v54 = v8;
  if (v7 == v8)
  {

    v11 = v54;
LABEL_26:

    v10 = v54;
    goto LABEL_27;
  }
  if (!v8 || !v7)
  {

    goto LABEL_8;
  }
  char v9 = [v7 isEqual:v8];

  v10 = v54;
  if ((v9 & 1) == 0)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_configuration, a3);
    v12 = [v54 text];
    v13 = [(WFParameterValuePickerTableViewCellContentView *)self titleLabel];
    [v13 setText:v12];

    v14 = [v54 textColor];
    v15 = [(WFParameterValuePickerTableViewCellContentView *)self titleLabel];
    [v15 setTextColor:v14];

    v16 = [v54 textFont];
    v17 = [(WFParameterValuePickerTableViewCellContentView *)self titleLabel];
    [v17 setFont:v16];

    v18 = [v54 secondaryText];
    v19 = [(WFParameterValuePickerTableViewCellContentView *)self subtitleLabel];
    [v19 setText:v18];

    v20 = [v54 secondaryTextColor];
    v21 = [(WFParameterValuePickerTableViewCellContentView *)self subtitleLabel];
    [v21 setTextColor:v20];

    v22 = [v54 secondaryTextFont];
    v23 = [(WFParameterValuePickerTableViewCellContentView *)self subtitleLabel];
    [v23 setFont:v22];

    v24 = [v54 secondaryText];
    BOOL v25 = [v24 length] == 0;
    v26 = [(WFParameterValuePickerTableViewCellContentView *)self subtitleLabel];
    [v26 setHidden:v25];

    v27 = [v54 image];
    v28 = [v27 untintedUIImage];
    v29 = [(WFParameterValuePickerTableViewCellContentView *)self iconImageView];
    [v29 setImage:v28];

    v30 = [v54 image];
    v31 = [v30 tintColor];
    v32 = [v31 platformColor];
    v33 = [(WFParameterValuePickerTableViewCellContentView *)self iconImageView];
    [v33 setTintColor:v32];

    [v54 cornerRadius];
    double v35 = v34;
    v36 = [(WFParameterValuePickerTableViewCellContentView *)self iconImageView];
    [v36 _setContinuousCornerRadius:v35];

    v37 = [v54 image];
    uint64_t v38 = v37 == 0;
    v39 = [(WFParameterValuePickerTableViewCellContentView *)self iconImageView];
    [v39 setHidden:v38];

    char v40 = [v54 forceImageScaling];
    if (v40)
    {
      int v41 = 0;
      uint64_t v42 = 1;
    }
    else
    {
      uint64_t v38 = [v54 image];
      v39 = [(id)v38 platformImage];
      [v39 size];
      if (v43 <= 29.0)
      {
        v33 = [v54 image];
        v3 = [v33 platformImage];
        [v3 size];
        if (v44 > 29.0) {
          uint64_t v42 = 1;
        }
        else {
          uint64_t v42 = 4;
        }
        int v41 = 1;
      }
      else
      {
        int v41 = 0;
        uint64_t v42 = 1;
      }
    }
    v45 = [(WFParameterValuePickerTableViewCellContentView *)self iconImageView];
    [v45 setContentMode:v42];

    if (v41)
    {
    }
    if ((v40 & 1) == 0)
    {
    }
    v46 = [v54 icon];
    v47 = [(WFParameterValuePickerTableViewCellContentView *)self iconView];
    [v47 setIcon:v46];

    v48 = [v54 image];
    if (v48)
    {
      BOOL v49 = 1;
    }
    else
    {
      v47 = [v54 icon];
      BOOL v49 = v47 == 0;
    }
    v50 = [(WFParameterValuePickerTableViewCellContentView *)self iconView];
    [v50 setHidden:v49];

    if (!v48) {
    uint64_t v51 = [v54 isContainedInState];
    }
    v52 = [(WFParameterValuePickerTableViewCellContentView *)self selectedSwitch];
    [v52 setOn:v51];

    uint64_t v53 = [v54 usesToggleForSelection] ^ 1;
    v11 = [(WFParameterValuePickerTableViewCellContentView *)self selectedSwitch];
    [v11 setHidden:v53];
    goto LABEL_26;
  }
LABEL_27:
}

- (WFParameterValuePickerTableViewCellContentView)initWithConfiguration:(id)a3
{
  v72[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)WFParameterValuePickerTableViewCellContentView;
  v5 = -[WFParameterValuePickerTableViewCellContentView initWithFrame:](&v69, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v6 = v5;
  if (v5)
  {
    [(WFParameterValuePickerTableViewCellContentView *)v5 setPreservesSuperviewLayoutMargins:1];
    id v7 = (UILabel *)objc_opt_new();
    [(UILabel *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v7 setNumberOfLines:2];
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = v7;
    v67 = v7;

    char v9 = (UILabel *)objc_opt_new();
    [(UILabel *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v9 setNumberOfLines:2];
    subtitleLabel = v6->_subtitleLabel;
    v6->_subtitleLabel = v9;
    v66 = v9;

    v11 = (UIImageView *)objc_opt_new();
    [(UIImageView *)v11 setClipsToBounds:1];
    [(UIImageView *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    iconImageView = v6->_iconImageView;
    v6->_iconImageView = v11;
    v64 = v11;

    id v13 = objc_alloc(MEMORY[0x263F879A8]);
    v14 = [v4 icon];
    v15 = objc_msgSend(v13, "initWithIcon:size:", v14, 29.0, 29.0);

    [v15 setUseAccentColor:1];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v16) = 1132396544;
    [v15 setContentHuggingPriority:0 forAxis:v16];
    iconView = v6->_iconView;
    v6->_iconView = (WFIconHostingView *)v15;
    id v63 = v15;

    v18 = (UISwitch *)objc_opt_new();
    [(UISwitch *)v18 addTarget:v6 action:sel_selectedSwitchDidToggle_ forControlEvents:4096];
    selectedSwitch = v6->_selectedSwitch;
    v6->_selectedSwitch = v18;
    v62 = v18;

    id v20 = objc_alloc(MEMORY[0x263F82BF8]);
    v72[0] = v67;
    v72[1] = v66;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:2];
    uint64_t v22 = [v20 initWithArrangedSubviews:v21];
    id v68 = v4;
    labelsStackView = v6->_labelsStackView;
    v6->_labelsStackView = (UIStackView *)v22;

    [(UIStackView *)v6->_labelsStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v6->_labelsStackView setAxis:1];
    [(UIStackView *)v6->_labelsStackView setDistribution:0];
    [(UIStackView *)v6->_labelsStackView setAlignment:0];
    [(UIStackView *)v6->_labelsStackView setLayoutMarginsRelativeArrangement:1];
    [(UIStackView *)v6->_labelsStackView setSpacing:2.0];
    double v24 = 0.0;
    -[UIStackView setDirectionalLayoutMargins:](v6->_labelsStackView, "setDirectionalLayoutMargins:", 8.0, 0.0, 8.0, 0.0);
    id v25 = objc_alloc(MEMORY[0x263F82BF8]);
    v71[0] = v64;
    v71[1] = v63;
    v71[2] = v6->_labelsStackView;
    v71[3] = v62;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:4];
    uint64_t v27 = [v25 initWithArrangedSubviews:v26];
    contentStackView = v6->_contentStackView;
    v6->_contentStackView = (UIStackView *)v27;

    [(UIStackView *)v6->_contentStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v6->_contentStackView setAxis:0];
    [(UIStackView *)v6->_contentStackView setDistribution:0];
    [(UIStackView *)v6->_contentStackView setAlignment:3];
    int v29 = [v4 usesInsetGroupedTableStyle];
    double v30 = 12.0;
    if (v29) {
      double v30 = 8.0;
    }
    [(UIStackView *)v6->_contentStackView setSpacing:v30];
    -[UIStackView setDirectionalLayoutMargins:](v6->_contentStackView, "setDirectionalLayoutMargins:", 8.0, 0.0, 8.0, 0.0);
    v31 = [(WFParameterValuePickerTableViewCellContentView *)v6 contentStackView];
    [(WFParameterValuePickerTableViewCellContentView *)v6 addSubview:v31];

    if ([v4 usesInsetGroupedTableStyle]) {
      double v24 = -4.0;
    }
    v48 = (void *)MEMORY[0x263F08938];
    v65 = [(WFParameterValuePickerTableViewCellContentView *)v6 contentStackView];
    v60 = [v65 leadingAnchor];
    v61 = [(WFParameterValuePickerTableViewCellContentView *)v6 layoutMarginsGuide];
    v59 = [v61 leadingAnchor];
    v58 = [v60 constraintEqualToAnchor:v59 constant:v24];
    v70[0] = v58;
    v57 = [(WFParameterValuePickerTableViewCellContentView *)v6 contentStackView];
    v55 = [v57 trailingAnchor];
    v56 = [(WFParameterValuePickerTableViewCellContentView *)v6 layoutMarginsGuide];
    id v54 = [v56 trailingAnchor];
    uint64_t v53 = [v55 constraintEqualToAnchor:v54];
    v70[1] = v53;
    v52 = [(WFParameterValuePickerTableViewCellContentView *)v6 contentStackView];
    uint64_t v51 = [v52 topAnchor];
    v50 = [(WFParameterValuePickerTableViewCellContentView *)v6 topAnchor];
    BOOL v49 = [v51 constraintEqualToAnchor:v50];
    v70[2] = v49;
    v47 = [(WFParameterValuePickerTableViewCellContentView *)v6 contentStackView];
    v46 = [v47 bottomAnchor];
    v45 = [(WFParameterValuePickerTableViewCellContentView *)v6 bottomAnchor];
    double v44 = [v46 constraintEqualToAnchor:v45];
    v70[3] = v44;
    v32 = [(WFParameterValuePickerTableViewCellContentView *)v6 heightAnchor];
    v33 = [v32 constraintGreaterThanOrEqualToConstant:44.0];
    v70[4] = v33;
    double v34 = [(UIImageView *)v6->_iconImageView widthAnchor];
    double v35 = [v34 constraintEqualToConstant:29.0];
    LODWORD(v36) = 1148026880;
    v37 = objc_msgSend(v35, "wf_withPriority:", v36);
    v70[5] = v37;
    uint64_t v38 = [(UIImageView *)v6->_iconImageView heightAnchor];
    v39 = [v38 constraintEqualToConstant:29.0];
    LODWORD(v40) = 1148026880;
    int v41 = objc_msgSend(v39, "wf_withPriority:", v40);
    v70[6] = v41;
    uint64_t v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:7];
    [v48 activateConstraints:v42];

    id v4 = v68;
    [(WFParameterValuePickerTableViewCellContentView *)v6 applyConfiguration:v68];
  }

  return v6;
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(WFParameterValuePickerTableViewCellContentView *)self applyConfiguration:v4];
    }
  }
}

@end