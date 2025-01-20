@interface WFWorkflowWizardSuggestedPhraseView
- (CGSize)intrinsicContentSize;
- (NSString)suggestedPhrase;
- (UILabel)label;
- (WFWorkflowWizardSuggestedPhraseView)initWithSuggestedPhrase:(id)a3;
- (WFWorkflowWizardSuggestedPhraseViewDelegate)delegate;
- (void)fadeOutHighlight;
- (void)highlight;
- (void)setDelegate:(id)a3;
- (void)setLabel:(id)a3;
- (void)tintColorDidChange;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)unhighlight;
@end

@implementation WFWorkflowWizardSuggestedPhraseView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_label);
  objc_storeStrong((id *)&self->_suggestedPhrase, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setLabel:(id)a3
{
}

- (UILabel)label
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_label);
  return (UILabel *)WeakRetained;
}

- (NSString)suggestedPhrase
{
  return self->_suggestedPhrase;
}

- (void)setDelegate:(id)a3
{
}

- (WFWorkflowWizardSuggestedPhraseViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFWorkflowWizardSuggestedPhraseViewDelegate *)WeakRetained;
}

- (void)fadeOutHighlight
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __55__WFWorkflowWizardSuggestedPhraseView_fadeOutHighlight__block_invoke;
  v2[3] = &unk_2649CBF20;
  v2[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:65538 delay:v2 options:0 animations:0.5 completion:0.0];
}

uint64_t __55__WFWorkflowWizardSuggestedPhraseView_fadeOutHighlight__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unhighlight];
}

- (void)unhighlight
{
  id v3 = [MEMORY[0x263F825C8] clearColor];
  [(WFWorkflowWizardSuggestedPhraseView *)self setBackgroundColor:v3];
}

- (void)highlight
{
  objc_msgSend(MEMORY[0x263F825C8], "wf_tableCellDefaultSelectionTintColor");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(WFWorkflowWizardSuggestedPhraseView *)self setBackgroundColor:v3];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)WFWorkflowWizardSuggestedPhraseView;
  [(WFWorkflowWizardSuggestedPhraseView *)&v7 touchesEnded:a3 withEvent:a4];
  [(WFWorkflowWizardSuggestedPhraseView *)self fadeOutHighlight];
  v5 = [(WFWorkflowWizardSuggestedPhraseView *)self delegate];
  v6 = [(WFWorkflowWizardSuggestedPhraseView *)self suggestedPhrase];
  [v5 workflowWizardSuggestedPhraseViewDidSelectSuggestedPhrase:v6];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WFWorkflowWizardSuggestedPhraseView;
  [(WFWorkflowWizardSuggestedPhraseView *)&v5 touchesCancelled:a3 withEvent:a4];
  [(WFWorkflowWizardSuggestedPhraseView *)self unhighlight];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WFWorkflowWizardSuggestedPhraseView;
  [(WFWorkflowWizardSuggestedPhraseView *)&v5 touchesBegan:a3 withEvent:a4];
  [(WFWorkflowWizardSuggestedPhraseView *)self highlight];
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)WFWorkflowWizardSuggestedPhraseView;
  [(WFWorkflowWizardSuggestedPhraseView *)&v5 tintColorDidChange];
  id v3 = [(WFWorkflowWizardSuggestedPhraseView *)self tintColor];
  v4 = [(WFWorkflowWizardSuggestedPhraseView *)self label];
  [v4 setTextColor:v3];
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F83C20];
  double v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (WFWorkflowWizardSuggestedPhraseView)initWithSuggestedPhrase:(id)a3
{
  v45[7] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)WFWorkflowWizardSuggestedPhraseView;
  objc_super v5 = [(WFWorkflowWizardSuggestedPhraseView *)&v44 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    suggestedPhrase = v5->_suggestedPhrase;
    v5->_suggestedPhrase = (NSString *)v6;

    id v8 = objc_alloc_init(MEMORY[0x263F828E0]);
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = NSString;
    v10 = WFLocalizedString(@"“%@”");
    v11 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v4);
    [v8 setText:v11];

    v12 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
    [v8 setFont:v12];

    v13 = [(WFWorkflowWizardSuggestedPhraseView *)v5 tintColor];
    [v8 setTextColor:v13];

    [(WFWorkflowWizardSuggestedPhraseView *)v5 addSubview:v8];
    objc_storeWeak((id *)&v5->_label, v8);
    id v14 = objc_alloc_init(MEMORY[0x263F82E00]);
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [MEMORY[0x263F825C8] separatorColor];
    [v14 setBackgroundColor:v15];

    [(WFWorkflowWizardSuggestedPhraseView *)v5 addSubview:v14];
    v33 = (void *)MEMORY[0x263F08938];
    v43 = [v8 leadingAnchor];
    v42 = [(WFWorkflowWizardSuggestedPhraseView *)v5 leadingAnchor];
    [v43 constraintEqualToAnchor:v42 constant:16.0];
    v41 = v40 = v8;
    v45[0] = v41;
    v39 = [v8 trailingAnchor];
    v38 = [(WFWorkflowWizardSuggestedPhraseView *)v5 trailingAnchor];
    v37 = [v39 constraintEqualToAnchor:v38 constant:-16.0];
    v45[1] = v37;
    v36 = [v8 centerYAnchor];
    v35 = [(WFWorkflowWizardSuggestedPhraseView *)v5 centerYAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v45[2] = v34;
    v31 = [v14 heightAnchor];
    v32 = [MEMORY[0x263F82B60] mainScreen];
    [v32 scale];
    v30 = [v31 constraintEqualToConstant:1.0 / v16];
    v45[3] = v30;
    v29 = [v14 leadingAnchor];
    v28 = [(WFWorkflowWizardSuggestedPhraseView *)v5 leadingAnchor];
    v27 = [v29 constraintEqualToAnchor:v28 constant:16.0];
    v45[4] = v27;
    v17 = [v14 trailingAnchor];
    v18 = [(WFWorkflowWizardSuggestedPhraseView *)v5 trailingAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v45[5] = v19;
    v20 = [v14 bottomAnchor];
    v21 = [(WFWorkflowWizardSuggestedPhraseView *)v5 bottomAnchor];
    [v20 constraintEqualToAnchor:v21];
    v23 = id v22 = v4;
    v45[6] = v23;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:7];
    [v33 activateConstraints:v24];

    id v4 = v22;
    v25 = v5;
  }
  return v5;
}

@end