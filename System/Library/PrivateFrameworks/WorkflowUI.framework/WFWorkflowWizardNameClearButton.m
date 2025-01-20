@interface WFWorkflowWizardNameClearButton
- (WFWorkflowWizardNameClearButton)initWithFrame:(CGRect)a3;
- (id)accessibilityLabel;
@end

@implementation WFWorkflowWizardNameClearButton

- (id)accessibilityLabel
{
  return WFLocalizedStringWithKey(@"Clear (Accessibility label)", @"Clear");
}

- (WFWorkflowWizardNameClearButton)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)WFWorkflowWizardNameClearButton;
  v3 = -[WFWorkflowWizardNameClearButton initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(WFWorkflowWizardNameClearButton *)v3 layer];
    [v5 setMasksToBounds:1];

    v6 = [MEMORY[0x263F825C8] tertiaryLabelColor];
    [(WFWorkflowWizardNameClearButton *)v4 setTintColor:v6];

    v7 = [MEMORY[0x263F81708] systemFontOfSize:19.0];
    v8 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
    v9 = [v8 scaledFontForFont:v7];
    v10 = [MEMORY[0x263F82818] configurationWithFont:v9];
    v11 = [MEMORY[0x263F827E8] systemImageNamed:@"xmark.circle.fill" withConfiguration:v10];
    [(WFWorkflowWizardNameClearButton *)v4 setImage:v11 forState:0];
    LODWORD(v12) = 1148846080;
    [(WFWorkflowWizardNameClearButton *)v4 setContentHuggingPriority:0 forAxis:v12];
    LODWORD(v13) = 1148846080;
    [(WFWorkflowWizardNameClearButton *)v4 setContentHuggingPriority:1 forAxis:v13];
    LODWORD(v14) = 1148846080;
    [(WFWorkflowWizardNameClearButton *)v4 setContentCompressionResistancePriority:0 forAxis:v14];
    LODWORD(v15) = 1148846080;
    [(WFWorkflowWizardNameClearButton *)v4 setContentCompressionResistancePriority:1 forAxis:v15];
    v16 = v4;
  }
  return v4;
}

@end