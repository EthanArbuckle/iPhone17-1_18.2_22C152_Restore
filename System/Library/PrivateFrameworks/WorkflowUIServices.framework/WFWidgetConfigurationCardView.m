@interface WFWidgetConfigurationCardView
- (MTStylingProvidingSolidColorView)backgroundView;
- (MTVisualStylingProvider)fillProvider;
- (MTVisualStylingProvider)strokeProvider;
- (UILayoutGuide)contentViewGuide;
- (UIView)contentView;
- (WFWidgetConfigurationCardHeaderView)headerView;
- (WFWidgetConfigurationCardView)initWithRequest:(id)a3 contentView:(id)a4;
- (WFWidgetConfigurationCardViewDelegate)delegate;
- (double)widgetDescriptionTallScriptCompensatedSpacing;
- (void)setBackgroundColor:(id)a3;
- (void)setContentView:(id)a3;
- (void)setContentView:(id)a3 stretchToFit:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setWidgetDescriptionTallScriptCompensatedSpacing:(double)a3;
- (void)widgetConfigurationCardHeaderViewDidRequestToClose:(id)a3;
@end

@implementation WFWidgetConfigurationCardView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewGuide, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_fillProvider, 0);
  objc_storeStrong((id *)&self->_strokeProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

- (UILayoutGuide)contentViewGuide
{
  return self->_contentViewGuide;
}

- (MTStylingProvidingSolidColorView)backgroundView
{
  return self->_backgroundView;
}

- (MTVisualStylingProvider)fillProvider
{
  return self->_fillProvider;
}

- (MTVisualStylingProvider)strokeProvider
{
  return self->_strokeProvider;
}

- (double)widgetDescriptionTallScriptCompensatedSpacing
{
  return self->_widgetDescriptionTallScriptCompensatedSpacing;
}

- (void)setDelegate:(id)a3
{
}

- (WFWidgetConfigurationCardViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFWidgetConfigurationCardViewDelegate *)WeakRetained;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (WFWidgetConfigurationCardHeaderView)headerView
{
  return self->_headerView;
}

- (void)widgetConfigurationCardHeaderViewDidRequestToClose:(id)a3
{
  id v4 = [(WFWidgetConfigurationCardView *)self delegate];
  [v4 widgetConfigurationCardViewDidRequestToClose:self];
}

- (void)setWidgetDescriptionTallScriptCompensatedSpacing:(double)a3
{
  self->_widgetDescriptionTallScriptCompensatedSpacing = a3;
  id v4 = [(WFWidgetConfigurationCardView *)self headerView];
  [v4 setWidgetDescriptionTallScriptCompensatedSpacing:a3];
}

- (void)setContentView:(id)a3 stretchToFit:(BOOL)a4
{
  BOOL v4 = a4;
  v31[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  contentView = self->_contentView;
  if (contentView) {
    [(UIView *)contentView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_contentView, a3);
  [(UIView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
  if (v7)
  {
    [(WFWidgetConfigurationCardView *)self bounds];
    objc_msgSend(v7, "setFrame:");
    v9 = [(WFWidgetConfigurationCardView *)self backgroundView];
    v10 = [(WFWidgetConfigurationCardView *)self headerView];
    [v9 insertSubview:v7 belowSubview:v10];

    v27 = (void *)MEMORY[0x263F08938];
    if (v4)
    {
      v11 = [v7 leadingAnchor];
      v28 = [(UILayoutGuide *)self->_contentViewGuide leadingAnchor];
      v29 = v11;
      v26 = objc_msgSend(v11, "constraintEqualToAnchor:");
      v31[0] = v26;
      v12 = [v7 trailingAnchor];
      v13 = [(UILayoutGuide *)self->_contentViewGuide trailingAnchor];
      v25 = v12;
      v14 = [v12 constraintEqualToAnchor:v13];
      v31[1] = v14;
      v15 = [v7 topAnchor];
      v16 = [(UILayoutGuide *)self->_contentViewGuide topAnchor];
      v17 = [v15 constraintEqualToAnchor:v16];
      v31[2] = v17;
      v18 = [v7 bottomAnchor];
      v19 = [(UILayoutGuide *)self->_contentViewGuide bottomAnchor];
      v20 = [v18 constraintEqualToAnchor:v19];
      v31[3] = v20;
      v21 = v31;
    }
    else
    {
      v22 = [v7 centerXAnchor];
      v28 = [(UILayoutGuide *)self->_contentViewGuide centerXAnchor];
      v29 = v22;
      v26 = objc_msgSend(v22, "constraintEqualToAnchor:");
      v30[0] = v26;
      v23 = [v7 centerYAnchor];
      v13 = [(UILayoutGuide *)self->_contentViewGuide centerYAnchor];
      [(WFWidgetConfigurationCardView *)self widgetDescriptionTallScriptCompensatedSpacing];
      v25 = v23;
      v14 = objc_msgSend(v23, "constraintEqualToAnchor:constant:", v13);
      v30[1] = v14;
      v15 = [v7 widthAnchor];
      v16 = [(UILayoutGuide *)self->_contentViewGuide widthAnchor];
      v17 = [v15 constraintLessThanOrEqualToAnchor:v16];
      v30[2] = v17;
      v18 = [v7 heightAnchor];
      v19 = [(UILayoutGuide *)self->_contentViewGuide heightAnchor];
      v20 = [v18 constraintLessThanOrEqualToAnchor:v19];
      v30[3] = v20;
      v21 = v30;
    }
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];
    [v27 activateConstraints:v24];
  }
}

- (void)setContentView:(id)a3
{
}

- (void)setBackgroundColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFWidgetConfigurationCardView;
  id v4 = a3;
  [(WFWidgetConfigurationCardView *)&v6 setBackgroundColor:v4];
  v5 = [(WFWidgetConfigurationCardView *)self backgroundView];
  [v5 setBackgroundColor:v4];
}

- (WFWidgetConfigurationCardView)initWithRequest:(id)a3 contentView:(id)a4
{
  v95[11] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = *MEMORY[0x263F00148];
  double v9 = *(double *)(MEMORY[0x263F00148] + 8);
  [v6 defaultCardSize];
  v94.receiver = self;
  v94.super_class = (Class)WFWidgetConfigurationCardView;
  v12 = -[WFWidgetConfigurationCardView initWithFrame:](&v94, sel_initWithFrame_, v8, v9, v10, v11);
  if (v12)
  {
    id v92 = v7;
    v13 = (MTStylingProvidingSolidColorView *)objc_alloc_init(MEMORY[0x263F53FF8]);
    backgroundView = v12->_backgroundView;
    v12->_backgroundView = v13;

    v15 = [(WFWidgetConfigurationCardView *)v12 backgroundView];
    uint64_t v16 = [v15 visualStylingProviderForCategory:1];
    strokeProvider = v12->_strokeProvider;
    v12->_strokeProvider = (MTVisualStylingProvider *)v16;

    v18 = [(WFWidgetConfigurationCardView *)v12 backgroundView];
    uint64_t v19 = [v18 visualStylingProviderForCategory:2];
    fillProvider = v12->_fillProvider;
    v12->_fillProvider = (MTVisualStylingProvider *)v19;

    v21 = [(WFWidgetConfigurationCardView *)v12 backgroundView];
    [v21 setUserInteractionEnabled:1];

    if ([v6 resolvedWidgetConfigurationStyle] == 1)
    {
      v22 = [(WFWidgetConfigurationCardView *)v12 layer];
      [v22 setCornerRadius:25.0];

      uint64_t v23 = *MEMORY[0x263F15A20];
      v24 = [(WFWidgetConfigurationCardView *)v12 layer];
      [v24 setCornerCurve:v23];

      [(WFWidgetConfigurationCardView *)v12 setClipsToBounds:1];
      double v25 = 16.0;
      double v26 = 17.0;
      double v27 = 16.0;
    }
    else
    {
      double v26 = 20.0;
      double v25 = 20.0;
      double v27 = 20.0;
    }
    -[WFWidgetConfigurationCardView setLayoutMargins:](v12, "setLayoutMargins:", v26, v25, v26, v27);
    v28 = [[WFWidgetConfigurationCardHeaderView alloc] initWithRequest:v6];
    [(WFWidgetConfigurationCardHeaderView *)v28 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WFWidgetConfigurationCardHeaderView *)v28 setPreservesSuperviewLayoutMargins:1];
    [(WFWidgetConfigurationCardHeaderView *)v28 setDelegate:v12];
    v29 = [(WFWidgetConfigurationCardView *)v12 backgroundView];
    [v29 addSubview:v28];

    id v93 = v6;
    headerView = v12->_headerView;
    v12->_headerView = v28;
    v31 = v28;

    v32 = [(WFWidgetConfigurationCardView *)v12 strokeProvider];
    v33 = [(WFWidgetConfigurationCardHeaderView *)v31 titleLabel];
    [v32 automaticallyUpdateView:v33 withStyle:0];

    v34 = [(WFWidgetConfigurationCardView *)v12 strokeProvider];
    v35 = [(WFWidgetConfigurationCardHeaderView *)v31 subtitleLabel];
    [v34 automaticallyUpdateView:v35 withStyle:2];

    v36 = [(WFWidgetConfigurationCardView *)v12 strokeProvider];
    v37 = [(WFWidgetConfigurationCardHeaderView *)v31 closeButton];
    [v36 automaticallyUpdateView:v37 withStyle:2 andObserverBlock:&__block_literal_global_732];

    v38 = [(WFWidgetConfigurationCardView *)v12 backgroundView];
    [(WFWidgetConfigurationCardView *)v12 addSubview:v38];

    v39 = [(WFWidgetConfigurationCardView *)v12 backgroundView];
    [v39 setTranslatesAutoresizingMaskIntoConstraints:0];

    v40 = [(WFWidgetConfigurationCardView *)v12 backgroundView];
    [v40 setPreservesSuperviewLayoutMargins:1];

    v41 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F82908]);
    contentViewGuide = v12->_contentViewGuide;
    v12->_contentViewGuide = v41;

    v43 = [(WFWidgetConfigurationCardView *)v12 backgroundView];
    [v43 addLayoutGuide:v12->_contentViewGuide];

    v72 = (void *)MEMORY[0x263F08938];
    v91 = [(WFWidgetConfigurationCardView *)v12 backgroundView];
    v90 = [v91 leadingAnchor];
    v89 = [(WFWidgetConfigurationCardView *)v12 leadingAnchor];
    v88 = [v90 constraintEqualToAnchor:v89];
    v95[0] = v88;
    v87 = [(WFWidgetConfigurationCardView *)v12 backgroundView];
    v86 = [v87 trailingAnchor];
    v85 = [(WFWidgetConfigurationCardView *)v12 trailingAnchor];
    v84 = [v86 constraintEqualToAnchor:v85];
    v95[1] = v84;
    v83 = [(WFWidgetConfigurationCardView *)v12 backgroundView];
    v82 = [v83 topAnchor];
    v81 = [(WFWidgetConfigurationCardView *)v12 topAnchor];
    v80 = [v82 constraintEqualToAnchor:v81];
    v95[2] = v80;
    v79 = [(WFWidgetConfigurationCardView *)v12 backgroundView];
    v78 = [v79 bottomAnchor];
    v77 = [(WFWidgetConfigurationCardView *)v12 bottomAnchor];
    v76 = [v78 constraintEqualToAnchor:v77];
    v95[3] = v76;
    v74 = [(WFWidgetConfigurationCardHeaderView *)v31 topAnchor];
    v75 = [(WFWidgetConfigurationCardView *)v12 backgroundView];
    v73 = [v75 topAnchor];
    v71 = [v74 constraintEqualToAnchor:v73];
    v95[4] = v71;
    v59 = v31;
    v69 = [(WFWidgetConfigurationCardHeaderView *)v31 leadingAnchor];
    v70 = [(WFWidgetConfigurationCardView *)v12 backgroundView];
    v68 = [v70 leadingAnchor];
    v67 = [v69 constraintEqualToAnchor:v68];
    v95[5] = v67;
    v65 = [(WFWidgetConfigurationCardHeaderView *)v31 trailingAnchor];
    v66 = [(WFWidgetConfigurationCardView *)v12 backgroundView];
    v64 = [v66 trailingAnchor];
    v63 = [v65 constraintEqualToAnchor:v64];
    v95[6] = v63;
    v62 = [(UILayoutGuide *)v12->_contentViewGuide topAnchor];
    v61 = [(WFWidgetConfigurationCardHeaderView *)v12->_headerView bottomAnchor];
    v60 = [v62 constraintEqualToAnchor:v61];
    v95[7] = v60;
    v57 = [(UILayoutGuide *)v12->_contentViewGuide leadingAnchor];
    v58 = [(WFWidgetConfigurationCardView *)v12 backgroundView];
    v56 = [v58 leadingAnchor];
    v55 = [v57 constraintEqualToAnchor:v56];
    v95[8] = v55;
    v44 = [(UILayoutGuide *)v12->_contentViewGuide trailingAnchor];
    v45 = [(WFWidgetConfigurationCardView *)v12 backgroundView];
    v46 = [v45 trailingAnchor];
    v47 = [v44 constraintEqualToAnchor:v46];
    v95[9] = v47;
    v48 = [(UILayoutGuide *)v12->_contentViewGuide bottomAnchor];
    v49 = [(WFWidgetConfigurationCardView *)v12 backgroundView];
    v50 = [v49 bottomAnchor];
    v51 = [v48 constraintEqualToAnchor:v50];
    v95[10] = v51;
    v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v95 count:11];
    [v72 activateConstraints:v52];

    id v6 = v93;
    id v7 = v92;
    [(WFWidgetConfigurationCardView *)v12 setContentView:v92];
    v53 = v12;
  }

  return v12;
}

void *__61__WFWidgetConfigurationCardView_initWithRequest_contentView___block_invoke()
{
  return &__block_literal_global_53;
}

void __61__WFWidgetConfigurationCardView_initWithRequest_contentView___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v7 = [a2 _visualStylingForContinuallyUpdatedView:v4];
  v5 = [MEMORY[0x263F825C8] clearColor];
  [v4 setBackgroundColor:v5];

  id v6 = [v7 color];
  [v4 _setImageColor:v6 forState:0];
}

@end