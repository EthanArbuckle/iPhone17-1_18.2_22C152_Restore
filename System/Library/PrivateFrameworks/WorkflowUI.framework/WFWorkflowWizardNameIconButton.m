@interface WFWorkflowWizardNameIconButton
- (CGSize)intrinsicContentSize;
- (NSData)customImageData;
- (UIImageView)backgroundImageView;
- (WFWorkflowIcon)icon;
- (WFWorkflowWizardNameIconButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)redrawIcon;
- (void)setBackgroundImageView:(id)a3;
- (void)setIcon:(id)a3 customImageData:(id)a4;
@end

@implementation WFWorkflowWizardNameIconButton

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundImageView);
  objc_storeStrong((id *)&self->_customImageData, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

- (void)setBackgroundImageView:(id)a3
{
}

- (UIImageView)backgroundImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundImageView);
  return (UIImageView *)WeakRetained;
}

- (NSData)customImageData
{
  return self->_customImageData;
}

- (WFWorkflowIcon)icon
{
  return self->_icon;
}

- (void)redrawIcon
{
  id v4 = [(WFWorkflowWizardNameIconButton *)self icon];
  v3 = [(WFWorkflowWizardNameIconButton *)self customImageData];
  [(WFWorkflowWizardNameIconButton *)self setIcon:v4 customImageData:v3];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 44.0;
  double v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setIcon:(id)a3 customImageData:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_icon, a3);
  objc_storeStrong((id *)&self->_customImageData, a4);
  v8 = (void *)[objc_alloc(MEMORY[0x263F854B8]) initWithIcon:v13];
  [v8 setCornerRadius:8.10000038];
  v9 = [(WFWorkflowWizardNameIconButton *)self traitCollection];
  objc_msgSend(v8, "setDark:", objc_msgSend(v9, "userInterfaceStyle") == 2);
  objc_msgSend(v8, "setHighContrast:", objc_msgSend(v9, "accessibilityContrast") == 1);
  if (v7)
  {
    [v8 setCustomImageData:v7];
    [v8 setUseCustomImage:1];
  }
  v10 = objc_msgSend(v8, "imageWithSize:", 36.0, 36.0);
  v11 = [v10 UIImage];

  v12 = [(WFWorkflowWizardNameIconButton *)self backgroundImageView];
  [v12 setImage:v11];
}

- (void)layoutSubviews
{
  id v5 = [MEMORY[0x263F825C8] linkColor];
  uint64_t v3 = [v5 CGColor];
  id v4 = [(WFWorkflowWizardNameIconButton *)self layer];
  [v4 setBorderColor:v3];
}

- (WFWorkflowWizardNameIconButton)initWithFrame:(CGRect)a3
{
  v32[2] = *MEMORY[0x263EF8340];
  v31.receiver = self;
  v31.super_class = (Class)WFWorkflowWizardNameIconButton;
  uint64_t v3 = -[WFWorkflowWizardNameIconButton initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    id v5 = [(WFWorkflowWizardNameIconButton *)v3 layer];
    [v5 setMasksToBounds:1];

    v6 = [(WFWorkflowWizardNameIconButton *)v4 layer];
    [v6 setCornerRadius:12.0];

    uint64_t v7 = *MEMORY[0x263F15A20];
    v8 = [(WFWorkflowWizardNameIconButton *)v4 layer];
    [v8 setCornerCurve:v7];

    id v9 = [MEMORY[0x263F825C8] linkColor];
    uint64_t v10 = [v9 CGColor];
    v11 = [(WFWorkflowWizardNameIconButton *)v4 layer];
    [v11 setBorderColor:v10];

    UIRoundToViewScale();
    double v13 = v12;
    v14 = [(WFWorkflowWizardNameIconButton *)v4 layer];
    [v14 setBorderWidth:v13];

    v15 = [(WFWorkflowWizardNameIconButton *)v4 layer];
    [v15 setAllowsEdgeAntialiasing:1];

    v16 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:0];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_storeWeak((id *)&v4->_backgroundImageView, v16);
    [(WFWorkflowWizardNameIconButton *)v4 addSubview:v16];
    v17 = (void *)MEMORY[0x263F08938];
    v18 = [v16 centerXAnchor];
    v19 = [(WFWorkflowWizardNameIconButton *)v4 centerXAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v32[0] = v20;
    v21 = [v16 centerYAnchor];
    v22 = [(WFWorkflowWizardNameIconButton *)v4 centerYAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v32[1] = v23;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
    [v17 activateConstraints:v24];

    LODWORD(v25) = 1148846080;
    [(WFWorkflowWizardNameIconButton *)v4 setContentHuggingPriority:0 forAxis:v25];
    LODWORD(v26) = 1148846080;
    [(WFWorkflowWizardNameIconButton *)v4 setContentHuggingPriority:1 forAxis:v26];
    LODWORD(v27) = 1148846080;
    [(WFWorkflowWizardNameIconButton *)v4 setContentCompressionResistancePriority:0 forAxis:v27];
    LODWORD(v28) = 1148846080;
    [(WFWorkflowWizardNameIconButton *)v4 setContentCompressionResistancePriority:1 forAxis:v28];
    v29 = v4;
  }
  return v4;
}

@end