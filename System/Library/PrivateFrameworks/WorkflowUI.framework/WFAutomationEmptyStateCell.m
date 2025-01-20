@interface WFAutomationEmptyStateCell
- (NSArray)currentConstraints;
- (WFAutomationEmptyStateCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (WFAutomationTypeExplanationPlatterView)automationTypeView;
- (void)configureForAutomationType:(unint64_t)a3 buttonTarget:(id)a4 action:(SEL)a5;
- (void)prepareForReuse;
- (void)setCurrentConstraints:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateLayoutConstraints;
@end

@implementation WFAutomationEmptyStateCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_automationTypeView, 0);
}

- (void)setCurrentConstraints:(id)a3
{
}

- (NSArray)currentConstraints
{
  return self->_currentConstraints;
}

- (WFAutomationTypeExplanationPlatterView)automationTypeView
{
  return self->_automationTypeView;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFAutomationEmptyStateCell;
  id v4 = a3;
  [(WFAutomationEmptyStateCell *)&v8 traitCollectionDidChange:v4];
  uint64_t v5 = objc_msgSend(v4, "horizontalSizeClass", v8.receiver, v8.super_class);

  v6 = [MEMORY[0x263F82DA0] currentTraitCollection];
  uint64_t v7 = [v6 horizontalSizeClass];

  if (v5 != v7) {
    [(WFAutomationEmptyStateCell *)self updateLayoutConstraints];
  }
}

- (void)updateLayoutConstraints
{
  v3 = (void *)MEMORY[0x263F08938];
  id v4 = [(WFAutomationEmptyStateCell *)self currentConstraints];
  [v3 deactivateConstraints:v4];

  uint64_t v5 = [MEMORY[0x263F82DA0] currentTraitCollection];
  uint64_t v6 = [v5 horizontalSizeClass];

  id v11 = [(WFAutomationEmptyStateCell *)self automationTypeView];
  uint64_t v7 = [(WFAutomationEmptyStateCell *)self contentView];
  objc_super v8 = v7;
  if (v6 == 1)
  {
    v9 = objc_msgSend(v11, "wf_addConstraintsToFillSuperview:insets:", v7, 0.0, 0.0, 24.0, 0.0);
    [(WFAutomationEmptyStateCell *)self setCurrentConstraints:v9];
  }
  else
  {
    v9 = [v7 readableContentGuide];
    v10 = objc_msgSend(v11, "wf_addConstraintsToFillLayoutGuide:", v9);
    [(WFAutomationEmptyStateCell *)self setCurrentConstraints:v10];
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)WFAutomationEmptyStateCell;
  [(WFAutomationEmptyStateCell *)&v4 prepareForReuse];
  v3 = [(WFAutomationEmptyStateCell *)self automationTypeView];
  [v3 prepareForReuse];
}

- (void)configureForAutomationType:(unint64_t)a3 buttonTarget:(id)a4 action:(SEL)a5
{
  id v8 = a4;
  v9 = [(WFAutomationEmptyStateCell *)self automationTypeView];
  [v9 configureForAutomationType:a3];

  id v10 = [(WFAutomationEmptyStateCell *)self automationTypeView];
  [v10 setButtonTarget:v8 action:a5];
}

- (WFAutomationEmptyStateCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)WFAutomationEmptyStateCell;
  objc_super v4 = [(WFAutomationEmptyStateCell *)&v13 initWithStyle:0 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F825C8] clearColor];
    [(WFAutomationEmptyStateCell *)v4 setBackgroundColor:v5];

    uint64_t v6 = [MEMORY[0x263F825C8] clearColor];
    uint64_t v7 = [(WFAutomationEmptyStateCell *)v4 contentView];
    [v7 setBackgroundColor:v6];

    [(WFAutomationEmptyStateCell *)v4 setSelectionStyle:0];
    id v8 = (WFAutomationTypeExplanationPlatterView *)objc_opt_new();
    [(WFAutomationTypeExplanationPlatterView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(WFAutomationEmptyStateCell *)v4 contentView];
    [v9 addSubview:v8];

    automationTypeView = v4->_automationTypeView;
    v4->_automationTypeView = v8;

    [(WFAutomationEmptyStateCell *)v4 updateLayoutConstraints];
    id v11 = v4;
  }

  return v4;
}

@end