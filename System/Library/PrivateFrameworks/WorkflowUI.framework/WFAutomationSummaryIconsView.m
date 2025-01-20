@interface WFAutomationSummaryIconsView
- (CGSize)intrinsicContentSize;
- (HUTriggerIconView)homeTriggerIconView;
- (UIImageView)arrowImageView;
- (UIImageView)triggerIconView;
- (UIStackView)stackView;
- (WFAutomationSummaryIconsView)initWithFrame:(CGRect)a3;
- (WFRowOfIconsView)actionsIconsView;
- (void)configureIconView:(id)a3;
- (void)setActionIcons:(id)a3;
- (void)setHomeActionIcons:(id)a3;
- (void)setHomeTriggerIcon:(id)a3;
- (void)setHomeTriggerIconView:(id)a3;
- (void)setTriggerIcon:(id)a3 tintColor:(id)a4 withCornerRadius:(double)a5;
- (void)setTriggerIcon:(id)a3 tintColor:(id)a4 withTrigger:(id)a5;
- (void)setTriggerIconView:(id)a3;
@end

@implementation WFAutomationSummaryIconsView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsIconsView, 0);
  objc_storeStrong((id *)&self->_arrowImageView, 0);
  objc_storeStrong((id *)&self->_homeTriggerIconView, 0);
  objc_storeStrong((id *)&self->_triggerIconView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

- (WFRowOfIconsView)actionsIconsView
{
  return self->_actionsIconsView;
}

- (UIImageView)arrowImageView
{
  return self->_arrowImageView;
}

- (void)setHomeTriggerIconView:(id)a3
{
}

- (HUTriggerIconView)homeTriggerIconView
{
  return self->_homeTriggerIconView;
}

- (void)setTriggerIconView:(id)a3
{
}

- (UIImageView)triggerIconView
{
  return self->_triggerIconView;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setHomeActionIcons:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WFAutomationSummaryIconsView.m", 169, @"Invalid parameter not satisfying: %@", @"homeActionIcons" object file lineNumber description];
  }
  v5 = [(WFAutomationSummaryIconsView *)self actionsIconsView];
  [v5 setHomeIcons:v9];

  BOOL v6 = [v9 count] == 0;
  v7 = [(WFAutomationSummaryIconsView *)self arrowImageView];
  [v7 setHidden:v6];
}

- (void)setActionIcons:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WFAutomationSummaryIconsView.m", 163, @"Invalid parameter not satisfying: %@", @"actionIcons" object file lineNumber description];
  }
  v5 = [(WFAutomationSummaryIconsView *)self actionsIconsView];
  [v5 setIcons:v9];

  BOOL v6 = [v9 count] == 0;
  v7 = [(WFAutomationSummaryIconsView *)self arrowImageView];
  [v7 setHidden:v6];
}

- (void)configureIconView:(id)a3
{
  id v7 = a3;
  LODWORD(v3) = 1148846080;
  [v7 setContentCompressionResistancePriority:0 forAxis:v3];
  LODWORD(v4) = 1148846080;
  [v7 setContentCompressionResistancePriority:1 forAxis:v4];
  LODWORD(v5) = 1148846080;
  [v7 setContentHuggingPriority:0 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [v7 setContentHuggingPriority:1 forAxis:v6];
}

- (void)setHomeTriggerIcon:(id)a3
{
  id v4 = a3;
  double v5 = [(WFAutomationSummaryIconsView *)self triggerIconView];

  if (v5)
  {
    double v6 = [(WFAutomationSummaryIconsView *)self stackView];
    id v7 = [(WFAutomationSummaryIconsView *)self triggerIconView];
    [v6 removeArrangedSubview:v7];

    v8 = [(WFAutomationSummaryIconsView *)self triggerIconView];
    [v8 removeFromSuperview];

    [(WFAutomationSummaryIconsView *)self setTriggerIconView:0];
  }
  id v9 = [(WFAutomationSummaryIconsView *)self homeTriggerIconView];

  if (v9)
  {
    v10 = [(WFAutomationSummaryIconsView *)self stackView];
    v11 = [(WFAutomationSummaryIconsView *)self homeTriggerIconView];
    [v10 removeArrangedSubview:v11];

    v12 = [(WFAutomationSummaryIconsView *)self homeTriggerIconView];
    [v12 removeFromSuperview];

    [(WFAutomationSummaryIconsView *)self setHomeTriggerIconView:0];
  }
  v13 = (void *)[objc_alloc(getHUTriggerIconViewClass()) initWithIconDescriptor:v4];

  [(WFAutomationSummaryIconsView *)self setHomeTriggerIconView:v13];
  v14 = [(WFAutomationSummaryIconsView *)self homeTriggerIconView];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = [(WFAutomationSummaryIconsView *)self stackView];
  v16 = [(WFAutomationSummaryIconsView *)self homeTriggerIconView];
  [v15 insertArrangedSubview:v16 atIndex:0];

  [(WFAutomationSummaryIconsView *)self setNeedsLayout];
}

- (void)setTriggerIcon:(id)a3 tintColor:(id)a4 withCornerRadius:(double)a5
{
  id v26 = a3;
  id v8 = a4;
  id v9 = [(WFAutomationSummaryIconsView *)self homeTriggerIconView];

  if (v9)
  {
    v10 = [(WFAutomationSummaryIconsView *)self stackView];
    v11 = [(WFAutomationSummaryIconsView *)self homeTriggerIconView];
    [v10 removeArrangedSubview:v11];

    v12 = [(WFAutomationSummaryIconsView *)self homeTriggerIconView];
    [v12 removeFromSuperview];

    [(WFAutomationSummaryIconsView *)self setHomeTriggerIconView:0];
  }
  v13 = [(WFAutomationSummaryIconsView *)self triggerIconView];

  if (v13)
  {
    v14 = [(WFAutomationSummaryIconsView *)self triggerIconView];
    [v14 setImage:v26];

    v15 = [(WFAutomationSummaryIconsView *)self triggerIconView];
    v16 = v15;
    if (a5 <= 0.0)
    {
      [v15 setClipsToBounds:0];

      v17 = [(WFAutomationSummaryIconsView *)self triggerIconView];
      v18 = [v17 layer];
      v19 = v18;
      double v20 = 0.0;
    }
    else
    {
      [v15 setClipsToBounds:1];

      v17 = [(WFAutomationSummaryIconsView *)self triggerIconView];
      v18 = [v17 layer];
      v19 = v18;
      double v20 = a5;
    }
    [v18 setCornerRadius:v20];
  }
  else
  {
    v21 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v26];
    [(WFAutomationSummaryIconsView *)self setTriggerIconView:v21];

    v22 = [(WFAutomationSummaryIconsView *)self triggerIconView];
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

    v23 = [(WFAutomationSummaryIconsView *)self stackView];
    v24 = [(WFAutomationSummaryIconsView *)self triggerIconView];
    [v23 insertArrangedSubview:v24 atIndex:0];

    v17 = [(WFAutomationSummaryIconsView *)self triggerIconView];
    [(WFAutomationSummaryIconsView *)self configureIconView:v17];
  }

  v25 = [(WFAutomationSummaryIconsView *)self triggerIconView];
  [v25 setTintColor:v8];

  [(WFAutomationSummaryIconsView *)self setNeedsLayout];
}

- (void)setTriggerIcon:(id)a3 tintColor:(id)a4 withTrigger:(id)a5
{
  id v31 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [(WFAutomationSummaryIconsView *)self homeTriggerIconView];

  if (v10)
  {
    v11 = [(WFAutomationSummaryIconsView *)self stackView];
    v12 = [(WFAutomationSummaryIconsView *)self homeTriggerIconView];
    [v11 removeArrangedSubview:v12];

    v13 = [(WFAutomationSummaryIconsView *)self homeTriggerIconView];
    [v13 removeFromSuperview];

    [(WFAutomationSummaryIconsView *)self setHomeTriggerIconView:0];
  }
  v14 = [(WFAutomationSummaryIconsView *)self triggerIconView];

  if (v14)
  {
    v15 = [(WFAutomationSummaryIconsView *)self triggerIconView];
    [v15 setImage:v31];

    [v8 displayGlyphCornerRadius];
    double v17 = v16;
    v18 = [(WFAutomationSummaryIconsView *)self triggerIconView];
    v19 = v18;
    if (v17 <= 0.0)
    {
      [v18 setClipsToBounds:0];

      v22 = [(WFAutomationSummaryIconsView *)self triggerIconView];
      v23 = [v22 layer];
      v24 = v23;
      double v25 = 0.0;
    }
    else
    {
      [v18 setClipsToBounds:1];

      [v8 displayGlyphCornerRadius];
      double v21 = v20;
      v22 = [(WFAutomationSummaryIconsView *)self triggerIconView];
      v23 = [v22 layer];
      v24 = v23;
      double v25 = v21;
    }
    [v23 setCornerRadius:v25];
  }
  else
  {
    id v26 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v31];
    [(WFAutomationSummaryIconsView *)self setTriggerIconView:v26];

    v27 = [(WFAutomationSummaryIconsView *)self triggerIconView];
    [v27 setTranslatesAutoresizingMaskIntoConstraints:0];

    v28 = [(WFAutomationSummaryIconsView *)self stackView];
    v29 = [(WFAutomationSummaryIconsView *)self triggerIconView];
    [v28 insertArrangedSubview:v29 atIndex:0];

    v22 = [(WFAutomationSummaryIconsView *)self triggerIconView];
    [(WFAutomationSummaryIconsView *)self configureIconView:v22];
  }

  v30 = [(WFAutomationSummaryIconsView *)self triggerIconView];
  [v30 setTintColor:v9];

  [(WFAutomationSummaryIconsView *)self setNeedsLayout];
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F83C20];
  double v3 = 30.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (WFAutomationSummaryIconsView)initWithFrame:(CGRect)a3
{
  v37[4] = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)WFAutomationSummaryIconsView;
  double v3 = -[WFAutomationSummaryIconsView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = (UIStackView *)objc_alloc_init(MEMORY[0x263F82BF8]);
    stackView = v3->_stackView;
    v3->_stackView = v4;

    [(UIStackView *)v3->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v3->_stackView setAxis:0];
    [(UIStackView *)v3->_stackView setAlignment:3];
    [(UIStackView *)v3->_stackView setDistribution:3];
    [(UIStackView *)v3->_stackView setSpacing:12.0];
    [(WFAutomationSummaryIconsView *)v3 addSubview:v3->_stackView];
    v28 = (void *)MEMORY[0x263F08938];
    v33 = [(UIStackView *)v3->_stackView topAnchor];
    v32 = [(WFAutomationSummaryIconsView *)v3 topAnchor];
    id v31 = [v33 constraintEqualToAnchor:v32];
    v37[0] = v31;
    v30 = [(UIStackView *)v3->_stackView bottomAnchor];
    v29 = [(WFAutomationSummaryIconsView *)v3 bottomAnchor];
    double v6 = [v30 constraintEqualToAnchor:v29];
    v37[1] = v6;
    id v7 = [(UIStackView *)v3->_stackView leadingAnchor];
    id v8 = [(WFAutomationSummaryIconsView *)v3 leadingAnchor];
    id v9 = [v7 constraintEqualToAnchor:v8];
    v37[2] = v9;
    v10 = [(UIStackView *)v3->_stackView trailingAnchor];
    v11 = [(WFAutomationSummaryIconsView *)v3 trailingAnchor];
    v12 = [v10 constraintLessThanOrEqualToAnchor:v11];
    v37[3] = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:4];
    [v28 activateConstraints:v13];

    v14 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    triggerIconView = v3->_triggerIconView;
    v3->_triggerIconView = v14;

    [(UIImageView *)v3->_triggerIconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_triggerIconView];
    [(WFAutomationSummaryIconsView *)v3 configureIconView:v3->_triggerIconView];
    id v16 = objc_alloc(MEMORY[0x263F82828]);
    double v17 = (void *)MEMORY[0x263F827E8];
    v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v19 = [v17 imageNamed:@"TriggerSummaryArrow" inBundle:v18 compatibleWithTraitCollection:0];
    uint64_t v20 = [v16 initWithImage:v19];
    arrowImageView = v3->_arrowImageView;
    v3->_arrowImageView = (UIImageView *)v20;

    v22 = [MEMORY[0x263F33718] sharedContext];
    LODWORD(v19) = [v22 shouldReverseLayoutDirection];

    if (v19)
    {
      CGAffineTransformMakeScale(&v35, -1.0, 1.0);
      v23 = v3->_arrowImageView;
      CGAffineTransform v34 = v35;
      [(UIImageView *)v23 setTransform:&v34];
    }
    [(UIImageView *)v3->_arrowImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_arrowImageView];
    v24 = [[WFRowOfIconsView alloc] initWithMaxNumberOfIcons:6 height:30.0];
    actionsIconsView = v3->_actionsIconsView;
    v3->_actionsIconsView = v24;

    [(WFRowOfIconsView *)v3->_actionsIconsView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_actionsIconsView];
    id v26 = v3;
  }

  return v3;
}

@end