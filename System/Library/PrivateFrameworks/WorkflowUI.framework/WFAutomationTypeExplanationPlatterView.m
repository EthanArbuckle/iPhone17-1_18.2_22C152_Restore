@interface WFAutomationTypeExplanationPlatterView
- (UIButton)button;
- (UIImageView)iconView;
- (UILabel)explanationTextLabel;
- (UIStackView)stackView;
- (WFAutomationTypeExplanationPlatterView)initWithFrame:(CGRect)a3;
- (id)homeAutomationIcon;
- (id)homeButtonColor;
- (id)homeExplanatoryText;
- (id)personalAutomationIcon;
- (void)configureForAutomationType:(unint64_t)a3;
- (void)prepareForReuse;
- (void)setButtonTarget:(id)a3 action:(SEL)a4;
- (void)setButtonTitle:(id)a3 color:(id)a4;
- (void)setExplanatoryText:(id)a3;
- (void)setIcon:(id)a3;
@end

@implementation WFAutomationTypeExplanationPlatterView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_explanationTextLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

- (UIButton)button
{
  return self->_button;
}

- (UILabel)explanationTextLabel
{
  return self->_explanationTextLabel;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)prepareForReuse
{
  v3 = [(WFAutomationTypeExplanationPlatterView *)self button];
  [v3 removeTarget:0 action:0 forControlEvents:64];

  id v5 = [MEMORY[0x263F825C8] systemBlueColor];
  v4 = [(WFAutomationTypeExplanationPlatterView *)self iconView];
  [v4 setTintColor:v5];
}

- (id)homeButtonColor
{
  return (id)objc_msgSend(MEMORY[0x263F825C8], "wf_homeTintColor");
}

- (id)homeExplanatoryText
{
  return WFLocalizedString(@"Create an automation that works for everyone in the home.");
}

- (id)homeAutomationIcon
{
  v10[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F82818] configurationWithPointSize:60.0];
  v3 = (void *)MEMORY[0x263F82818];
  v4 = objc_msgSend(MEMORY[0x263F825C8], "wf_homeTintColor");
  v10[0] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  v6 = [v3 _configurationWithHierarchicalColors:v5];
  v7 = [v2 configurationByApplyingConfiguration:v6];

  v8 = [MEMORY[0x263F827E8] systemImageNamed:@"homekit" withConfiguration:v7];

  return v8;
}

- (id)personalAutomationIcon
{
  v10[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F82818] configurationWithPointSize:60.0];
  v3 = (void *)MEMORY[0x263F82818];
  v4 = [MEMORY[0x263F825C8] systemBlueColor];
  v10[0] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  v6 = [v3 _configurationWithHierarchicalColors:v5];
  v7 = [v2 configurationByApplyingConfiguration:v6];

  v8 = [MEMORY[0x263F827E8] systemImageNamed:@"ipad.and.iphone" withConfiguration:v7];

  return v8;
}

- (void)setButtonTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  id v7 = [(WFAutomationTypeExplanationPlatterView *)self button];
  [v7 addTarget:v6 action:a4 forControlEvents:64];
}

- (void)setButtonTitle:(id)a3 color:(id)a4
{
  id v6 = (void *)MEMORY[0x263F824F0];
  id v7 = a4;
  id v8 = a3;
  id v11 = [v6 filledButtonConfiguration];
  [v11 setTitle:v8];

  [v11 setButtonSize:3];
  v9 = [v11 background];
  [v9 setBackgroundColor:v7];

  v10 = [(WFAutomationTypeExplanationPlatterView *)self button];
  [v10 setConfiguration:v11];
}

- (void)setExplanatoryText:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAutomationTypeExplanationPlatterView *)self explanationTextLabel];
  [v5 setText:v4];
}

- (void)setIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAutomationTypeExplanationPlatterView *)self iconView];
  [v5 setImage:v4];
}

- (void)configureForAutomationType:(unint64_t)a3
{
  id v4 = @"automations.add-home";
  id v5 = @"Create Home Automation";
  switch(a3)
  {
    case 0uLL:
      id v14 = [(WFAutomationTypeExplanationPlatterView *)self personalAutomationIcon];
      id v6 = WFLocalizedString(@"Create an automation that runs on a personal iPhone or iPad.");
      id v7 = [MEMORY[0x263F825C8] systemBlueColor];
      uint64_t v8 = WFLocalizedString(@"Create Personal Automation");
      id v9 = v14;
      v10 = (void *)v8;
      id v4 = @"automations.add-personal";
      goto LABEL_4;
    case 1uLL:
      goto LABEL_7;
    case 2uLL:
      id v4 = @"automations.setup-home";
      id v5 = @"Set Up Your Home";
      goto LABEL_7;
    case 3uLL:
      id v4 = @"automations.setup-homehub";
      id v5 = @"Set Up Home Hub";
LABEL_7:
      id v15 = [(WFAutomationTypeExplanationPlatterView *)self homeAutomationIcon];
      id v11 = [(WFAutomationTypeExplanationPlatterView *)self homeButtonColor];
      id v6 = [(WFAutomationTypeExplanationPlatterView *)self homeExplanatoryText];
      id v7 = [(WFAutomationTypeExplanationPlatterView *)self homeButtonColor];
      v10 = WFLocalizedString(v5);
      [(WFAutomationTypeExplanationPlatterView *)self setIcon:v15];
      if (v11)
      {
        v12 = [(WFAutomationTypeExplanationPlatterView *)self iconView];
        [v12 setTintColor:v11];
      }
      break;
    default:
      id v9 = 0;
      id v6 = 0;
      id v7 = 0;
      v10 = 0;
      id v4 = 0;
LABEL_4:
      id v15 = v9;
      [(WFAutomationTypeExplanationPlatterView *)self setIcon:v9];
      break;
  }
  [(WFAutomationTypeExplanationPlatterView *)self setExplanatoryText:v6];
  [(WFAutomationTypeExplanationPlatterView *)self setButtonTitle:v10 color:v7];
  v13 = [(WFAutomationTypeExplanationPlatterView *)self button];
  [v13 setAccessibilityIdentifier:v4];
}

- (WFAutomationTypeExplanationPlatterView)initWithFrame:(CGRect)a3
{
  v43[4] = *MEMORY[0x263EF8340];
  v42.receiver = self;
  v42.super_class = (Class)WFAutomationTypeExplanationPlatterView;
  v3 = -[WFAutomationTypeExplanationPlatterView initWithFrame:](&v42, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(WFAutomationTypeExplanationPlatterView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v5) = 1148846080;
    [(WFAutomationTypeExplanationPlatterView *)v4 setContentCompressionResistancePriority:0 forAxis:v5];
    LODWORD(v6) = 1148846080;
    [(WFAutomationTypeExplanationPlatterView *)v4 setContentCompressionResistancePriority:1 forAxis:v6];
    id v7 = [MEMORY[0x263F825C8] secondarySystemGroupedBackgroundColor];
    [(WFAutomationTypeExplanationPlatterView *)v4 setBackgroundColor:v7];

    uint64_t v8 = [(WFAutomationTypeExplanationPlatterView *)v4 layer];
    [v8 setCornerRadius:16.0];

    uint64_t v9 = *MEMORY[0x263F15A20];
    v10 = [(WFAutomationTypeExplanationPlatterView *)v4 layer];
    [v10 setCornerCurve:v9];

    id v11 = objc_alloc(MEMORY[0x263F82BF8]);
    double v12 = *MEMORY[0x263F001A8];
    double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v16 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x263F001A8], v13, v14, v15);
    stackView = v4->_stackView;
    v4->_stackView = (UIStackView *)v16;

    [(UIStackView *)v4->_stackView setAxis:1];
    [(UIStackView *)v4->_stackView setAlignment:0];
    [(UIStackView *)v4->_stackView setDistribution:3];
    [(UIStackView *)v4->_stackView setSpacing:18.0];
    [(UIStackView *)v4->_stackView setLayoutMarginsRelativeArrangement:1];
    -[UIStackView setLayoutMargins:](v4->_stackView, "setLayoutMargins:", 18.0, 8.0, 8.0, 8.0);
    [(UIStackView *)v4->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WFAutomationTypeExplanationPlatterView *)v4 addSubview:v4->_stackView];
    v36 = (void *)MEMORY[0x263F08938];
    v41 = [(UIStackView *)v4->_stackView topAnchor];
    v40 = [(WFAutomationTypeExplanationPlatterView *)v4 topAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v43[0] = v39;
    v38 = [(UIStackView *)v4->_stackView bottomAnchor];
    v37 = [(WFAutomationTypeExplanationPlatterView *)v4 bottomAnchor];
    v18 = [v38 constraintEqualToAnchor:v37];
    v43[1] = v18;
    v19 = [(UIStackView *)v4->_stackView leadingAnchor];
    v20 = [(WFAutomationTypeExplanationPlatterView *)v4 leadingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v43[2] = v21;
    v22 = [(UIStackView *)v4->_stackView trailingAnchor];
    v23 = [(WFAutomationTypeExplanationPlatterView *)v4 trailingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v43[3] = v24;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:4];
    [v36 activateConstraints:v25];

    uint64_t v26 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:0];
    iconView = v4->_iconView;
    v4->_iconView = (UIImageView *)v26;

    [(UIImageView *)v4->_iconView setContentMode:4];
    [(UIImageView *)v4->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v28) = 1148846080;
    [(UIImageView *)v4->_iconView setContentCompressionResistancePriority:1 forAxis:v28];
    [(UIStackView *)v4->_stackView addArrangedSubview:v4->_iconView];
    uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v12, v13, v14, v15);
    explanationTextLabel = v4->_explanationTextLabel;
    v4->_explanationTextLabel = (UILabel *)v29;

    [(UILabel *)v4->_explanationTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_explanationTextLabel setNumberOfLines:0];
    [(UILabel *)v4->_explanationTextLabel setTextAlignment:1];
    LODWORD(v31) = 1148846080;
    [(UILabel *)v4->_explanationTextLabel setContentCompressionResistancePriority:1 forAxis:v31];
    [(UIStackView *)v4->_stackView addArrangedSubview:v4->_explanationTextLabel];
    uint64_t v32 = [MEMORY[0x263F824E8] buttonWithType:1];
    button = v4->_button;
    v4->_button = (UIButton *)v32;

    [(UIButton *)v4->_button setRole:1];
    [(UIButton *)v4->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_stackView addArrangedSubview:v4->_button];
    v34 = v4;
  }

  return v4;
}

@end