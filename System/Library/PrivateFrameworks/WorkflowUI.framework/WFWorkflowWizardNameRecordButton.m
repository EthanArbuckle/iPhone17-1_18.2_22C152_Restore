@interface WFWorkflowWizardNameRecordButton
- (WFWorkflowWizardNameRecordButton)initWithFrame:(CGRect)a3;
- (id)accessibilityLabel;
@end

@implementation WFWorkflowWizardNameRecordButton

- (id)accessibilityLabel
{
  return WFLocalizedString(@"Record name");
}

- (WFWorkflowWizardNameRecordButton)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)WFWorkflowWizardNameRecordButton;
  v3 = -[WFWorkflowWizardNameRecordButton initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(WFWorkflowWizardNameRecordButton *)v3 layer];
    [v5 setMasksToBounds:1];

    v6 = [MEMORY[0x263F825C8] systemGrayColor];
    [(WFWorkflowWizardNameRecordButton *)v4 setTintColor:v6];

    v7 = [MEMORY[0x263F827E8] systemImageNamed:@"mic.fill"];
    [(WFWorkflowWizardNameRecordButton *)v4 setImage:v7 forState:0];
    LODWORD(v8) = 1148846080;
    [(WFWorkflowWizardNameRecordButton *)v4 setContentHuggingPriority:0 forAxis:v8];
    LODWORD(v9) = 1148846080;
    [(WFWorkflowWizardNameRecordButton *)v4 setContentHuggingPriority:1 forAxis:v9];
    LODWORD(v10) = 1148846080;
    [(WFWorkflowWizardNameRecordButton *)v4 setContentCompressionResistancePriority:0 forAxis:v10];
    LODWORD(v11) = 1148846080;
    [(WFWorkflowWizardNameRecordButton *)v4 setContentCompressionResistancePriority:1 forAxis:v11];
    v12 = v4;
  }
  return v4;
}

@end