@interface WFWorkflowWizardNameSuggestionCell
+ (double)preferredHeightForWidth:(double)a3 infoText:(id)a4 suggestedPhrases:(id)a5;
+ (id)infoFont;
+ (id)suggestionsFont;
+ (id)suggestionsText;
- (NSArray)suggestedPhrases;
- (NSArray)suggestionsViews;
- (NSString)infoText;
- (UILabel)infoLabel;
- (UIStackView)stackView;
- (WFWorkflowWizardNameSuggestionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (WFWorkflowWizardNameSuggestionCellDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setInfoLabel:(id)a3;
- (void)setInfoText:(id)a3;
- (void)setStackView:(id)a3;
- (void)setSuggestedPhrases:(id)a3;
- (void)setSuggestionsViews:(id)a3;
- (void)workflowWizardSuggestedPhraseViewDidSelectSuggestedPhrase:(id)a3;
@end

@implementation WFWorkflowWizardNameSuggestionCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsViews, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_suggestedPhrases, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setSuggestionsViews:(id)a3
{
}

- (NSArray)suggestionsViews
{
  return self->_suggestionsViews;
}

- (void)setInfoLabel:(id)a3
{
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setStackView:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (NSArray)suggestedPhrases
{
  return self->_suggestedPhrases;
}

- (void)setDelegate:(id)a3
{
}

- (WFWorkflowWizardNameSuggestionCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFWorkflowWizardNameSuggestionCellDelegate *)WeakRetained;
}

- (void)workflowWizardSuggestedPhraseViewDidSelectSuggestedPhrase:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWorkflowWizardNameSuggestionCell *)self delegate];
  [v5 workflowWizardNameSuggestionCellDidSelectSuggestedPhrase:v4];
}

- (void)setInfoText:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWorkflowWizardNameSuggestionCell *)self infoLabel];
  [v5 setText:v4];
}

- (NSString)infoText
{
  v2 = [(WFWorkflowWizardNameSuggestionCell *)self infoLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setSuggestedPhrases:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v4 = (NSArray *)[a3 copy];
  suggestedPhrases = self->_suggestedPhrases;
  self->_suggestedPhrases = v4;

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v6 = [(WFWorkflowWizardNameSuggestionCell *)self suggestionsViews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v59;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v59 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v58 + 1) + 8 * v10);
        v12 = [(WFWorkflowWizardNameSuggestionCell *)self stackView];
        [v12 removeArrangedSubview:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v8);
  }

  if ([(NSArray *)self->_suggestedPhrases count])
  {
    v13 = (NSArray *)objc_opt_new();
    id v14 = objc_alloc_init(MEMORY[0x263F82E00]);
    v15 = [(WFWorkflowWizardNameSuggestionCell *)self stackView];
    [v15 addArrangedSubview:v14];

    [(NSArray *)v13 addObject:v14];
    id v16 = objc_alloc_init(MEMORY[0x263F828E0]);
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = [(id)objc_opt_class() suggestionsText];
    [v16 setText:v17];

    v18 = [(id)objc_opt_class() suggestionsFont];
    [v16 setFont:v18];

    v19 = [MEMORY[0x263F825C8] labelColor];
    [v16 setTextColor:v19];

    [v14 addSubview:v16];
    id v20 = objc_alloc_init(MEMORY[0x263F82E00]);
    v21 = [(WFWorkflowWizardNameSuggestionCell *)self stackView];
    [v21 addArrangedSubview:v20];

    v52 = v20;
    [(NSArray *)v13 addObject:v20];
    v22 = [(WFWorkflowWizardNameSuggestionCell *)self suggestedPhrases];
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __58__WFWorkflowWizardNameSuggestionCell_setSuggestedPhrases___block_invoke;
    v57[3] = &unk_2649CB708;
    v57[4] = self;
    v23 = objc_msgSend(v22, "if_map:", v57);

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v24 = v23;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v53 objects:v63 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v54;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v54 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v53 + 1) + 8 * v28);
          v30 = [(WFWorkflowWizardNameSuggestionCell *)self stackView];
          [v30 addArrangedSubview:v29];

          [(NSArray *)v13 addObject:v29];
          ++v28;
        }
        while (v26 != v28);
        uint64_t v26 = [v24 countByEnumeratingWithState:&v53 objects:v63 count:16];
      }
      while (v26);
    }

    v45 = (void *)MEMORY[0x263F08938];
    v51 = [v52 heightAnchor];
    v50 = [v51 constraintEqualToConstant:2.0];
    v62[0] = v50;
    v49 = [v16 topAnchor];
    v48 = [v14 topAnchor];
    v46 = [v49 constraintEqualToAnchor:v48];
    v62[1] = v46;
    v43 = [v16 leadingAnchor];
    v42 = [v14 leadingAnchor];
    v41 = [v43 constraintEqualToAnchor:v42 constant:16.0];
    v62[2] = v41;
    v31 = [v16 bottomAnchor];
    [v14 bottomAnchor];
    v32 = v16;
    v33 = v47 = v16;
    v34 = [v31 constraintEqualToAnchor:v33];
    v62[3] = v34;
    v35 = [v32 trailingAnchor];
    v36 = [v14 trailingAnchor];
    v37 = [v35 constraintEqualToAnchor:v36 constant:-16.0];
    v62[4] = v37;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:5];
    v38 = v44 = v14;
    [v45 activateConstraints:v38];

    suggestionsViews = self->_suggestionsViews;
    self->_suggestionsViews = v13;
    v40 = v13;
  }
}

WFWorkflowWizardSuggestedPhraseView *__58__WFWorkflowWizardNameSuggestionCell_setSuggestedPhrases___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[WFWorkflowWizardSuggestedPhraseView alloc] initWithSuggestedPhrase:v3];

  [(WFWorkflowWizardSuggestedPhraseView *)v4 setDelegate:*(void *)(a1 + 32)];
  return v4;
}

- (WFWorkflowWizardNameSuggestionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v53[9] = *MEMORY[0x263EF8340];
  v52.receiver = self;
  v52.super_class = (Class)WFWorkflowWizardNameSuggestionCell;
  id v4 = [(WFWorkflowWizardNameSuggestionCell *)&v52 initWithStyle:a3 reuseIdentifier:a4];
  id v5 = v4;
  if (v4)
  {
    v6 = [(WFWorkflowWizardNameSuggestionCell *)v4 contentView];
    v51 = v5;
    uint64_t v7 = objc_msgSend(MEMORY[0x263F825C8], "wf_wizardBackgroundColor");
    [v6 setBackgroundColor:v7];

    uint64_t v8 = (UIStackView *)objc_alloc_init(MEMORY[0x263F82BF8]);
    [(UIStackView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v8 setAxis:1];
    [(UIStackView *)v8 setDistribution:3];
    [(UIStackView *)v8 setAlignment:0];
    [v6 addSubview:v8];
    stackView = v5->_stackView;
    v5->_stackView = v8;
    uint64_t v10 = v8;

    id v11 = objc_alloc_init(MEMORY[0x263F82E00]);
    [(UIStackView *)v10 addArrangedSubview:v11];
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    [(UILabel *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v12 setNumberOfLines:0];
    v13 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
    [(UILabel *)v12 setFont:v13];

    id v14 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v12 setTextColor:v14];

    [v11 addSubview:v12];
    infoLabel = v5->_infoLabel;
    v51->_infoLabel = v12;
    id v16 = v12;

    id v33 = objc_alloc_init(MEMORY[0x263F82E00]);
    [(UIStackView *)v10 addArrangedSubview:v33];
    v37 = (void *)MEMORY[0x263F08938];
    v50 = [(UIStackView *)v10 topAnchor];
    v49 = [v6 topAnchor];
    v48 = [v50 constraintEqualToAnchor:v49 constant:15.0];
    v53[0] = v48;
    v47 = [(UIStackView *)v10 leadingAnchor];
    v45 = [v6 leadingAnchor];
    v44 = [v47 constraintEqualToAnchor:v45];
    v53[1] = v44;
    v43 = [(UIStackView *)v10 bottomAnchor];
    v46 = v6;
    v42 = [v6 bottomAnchor];
    v41 = [v43 constraintEqualToAnchor:v42 constant:-15.0];
    v53[2] = v41;
    v40 = [(UIStackView *)v10 trailingAnchor];
    v39 = [v6 trailingAnchor];
    v38 = [v40 constraintEqualToAnchor:v39];
    v53[3] = v38;
    v35 = [(UILabel *)v16 topAnchor];
    v34 = [v11 topAnchor];
    v32 = [v35 constraintEqualToAnchor:v34];
    v53[4] = v32;
    v31 = [(UILabel *)v16 leadingAnchor];
    v30 = [v11 leadingAnchor];
    uint64_t v29 = [v31 constraintEqualToAnchor:v30 constant:16.0];
    v53[5] = v29;
    uint64_t v28 = [(UILabel *)v16 bottomAnchor];
    v17 = v11;
    v36 = v11;
    v18 = [v11 bottomAnchor];
    v19 = [v28 constraintEqualToAnchor:v18];
    v53[6] = v19;
    id v20 = [(UILabel *)v16 trailingAnchor];
    v21 = [v17 trailingAnchor];
    v22 = [v20 constraintEqualToAnchor:v21 constant:-16.0];
    v53[7] = v22;
    v23 = [v33 heightAnchor];
    id v24 = [v23 constraintEqualToConstant:31.0];
    v53[8] = v24;
    uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:9];
    [v37 activateConstraints:v25];

    id v5 = v51;
    uint64_t v26 = v51;
  }
  return v5;
}

+ (id)suggestionsText
{
  return WFLocalizedString(@"Suggestions");
}

+ (id)suggestionsFont
{
  return (id)[MEMORY[0x263F81708] systemFontOfSize:13.0];
}

+ (id)infoFont
{
  return (id)[MEMORY[0x263F81708] systemFontOfSize:17.0];
}

+ (double)preferredHeightForWidth:(double)a3 infoText:(id)a4 suggestedPhrases:(id)a5
{
  v42[1] = *MEMORY[0x263EF8340];
  double v7 = a3 + -32.0;
  uint64_t v41 = *MEMORY[0x263F814F0];
  uint64_t v8 = v41;
  id v9 = a5;
  id v10 = a4;
  id v11 = [a1 infoFont];
  v42[0] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];
  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v12, 0, v7, 1.79769313e308);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v43.origin.x = v14;
  v43.origin.y = v16;
  v43.size.width = v18;
  v43.size.height = v20;
  double Height = CGRectGetHeight(v43);
  v22 = [a1 suggestionsText];
  uint64_t v39 = v8;
  v23 = [a1 suggestionsFont];
  v40 = v23;
  id v24 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  objc_msgSend(v22, "boundingRectWithSize:options:attributes:context:", 1, v24, 0, v7, 1.79769313e308);
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;

  v44.origin.x = v26;
  v44.origin.y = v28;
  v44.size.width = v30;
  v44.size.height = v32;
  double v33 = CGRectGetHeight(v44);
  v34 = objc_alloc_init(WFWorkflowWizardSuggestedPhraseView);
  [(WFWorkflowWizardSuggestedPhraseView *)v34 intrinsicContentSize];
  double v36 = v35;
  unint64_t v37 = [v9 count];

  return Height + 30.0 + 31.0 + v33 + 2.0 + v36 * (double)v37;
}

@end