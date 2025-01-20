@interface WFWidgetConfigurationContainerView
- (CGRect)configurationCardViewFrame;
- (NSArray)configuredCardLayoutConstraints;
- (NSArray)configuredSheetLayoutConstraints;
- (NSArray)defaultCardLayoutConstraints;
- (NSLayoutConstraint)configuratedCardHeightConstraint;
- (NSLayoutConstraint)configuratedCardOriginXConstraint;
- (NSLayoutConstraint)configuratedCardOriginYConstraint;
- (NSLayoutConstraint)configuratedCardWidthConstraint;
- (NSLayoutConstraint)configuredSheetHeightConstraint;
- (NSLayoutConstraint)configuredSheetOriginXConstraint;
- (NSLayoutConstraint)configuredSheetOriginYConstraint;
- (NSLayoutConstraint)configuredSheetWidthConstraint;
- (NSLayoutConstraint)preferredCardHeightLayoutConstraint;
- (NSLayoutConstraint)preferredCardWidthLayoutConstraint;
- (WFWidgetConfigurationCardView)cardView;
- (WFWidgetConfigurationContainerView)initWithCardView:(id)a3 preferredSize:(CGSize)a4;
- (WFWidgetConfigurationContainerViewDelegate)delegate;
- (unint64_t)widgetConfigurationStyle;
- (void)configureConstraints;
- (void)keyboardWillChangeFrame:(id)a3;
- (void)requestDismissal;
- (void)setConfigurationCardViewFrame:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setWidgetConfigurationStyle:(unint64_t)a3;
- (void)setupConfiguredCardFrameConstraints;
- (void)setupConfiguredSheetFrameConstraints;
- (void)setupDefaultConstraintsWithPreferredSize:(CGSize)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WFWidgetConfigurationContainerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_configuredSheetHeightConstraint, 0);
  objc_storeStrong((id *)&self->_configuredSheetWidthConstraint, 0);
  objc_storeStrong((id *)&self->_configuredSheetOriginYConstraint, 0);
  objc_storeStrong((id *)&self->_configuredSheetOriginXConstraint, 0);
  objc_storeStrong((id *)&self->_configuredSheetLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_configuratedCardHeightConstraint, 0);
  objc_storeStrong((id *)&self->_configuratedCardWidthConstraint, 0);
  objc_storeStrong((id *)&self->_configuratedCardOriginYConstraint, 0);
  objc_storeStrong((id *)&self->_configuratedCardOriginXConstraint, 0);
  objc_storeStrong((id *)&self->_configuredCardLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_preferredCardHeightLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_preferredCardWidthLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_defaultCardLayoutConstraints, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (WFWidgetConfigurationCardView)cardView
{
  return self->_cardView;
}

- (NSLayoutConstraint)configuredSheetHeightConstraint
{
  return self->_configuredSheetHeightConstraint;
}

- (NSLayoutConstraint)configuredSheetWidthConstraint
{
  return self->_configuredSheetWidthConstraint;
}

- (NSLayoutConstraint)configuredSheetOriginYConstraint
{
  return self->_configuredSheetOriginYConstraint;
}

- (NSLayoutConstraint)configuredSheetOriginXConstraint
{
  return self->_configuredSheetOriginXConstraint;
}

- (NSArray)configuredSheetLayoutConstraints
{
  return self->_configuredSheetLayoutConstraints;
}

- (NSLayoutConstraint)configuratedCardHeightConstraint
{
  return self->_configuratedCardHeightConstraint;
}

- (NSLayoutConstraint)configuratedCardWidthConstraint
{
  return self->_configuratedCardWidthConstraint;
}

- (NSLayoutConstraint)configuratedCardOriginYConstraint
{
  return self->_configuratedCardOriginYConstraint;
}

- (NSLayoutConstraint)configuratedCardOriginXConstraint
{
  return self->_configuratedCardOriginXConstraint;
}

- (NSArray)configuredCardLayoutConstraints
{
  return self->_configuredCardLayoutConstraints;
}

- (NSLayoutConstraint)preferredCardHeightLayoutConstraint
{
  return self->_preferredCardHeightLayoutConstraint;
}

- (NSLayoutConstraint)preferredCardWidthLayoutConstraint
{
  return self->_preferredCardWidthLayoutConstraint;
}

- (NSArray)defaultCardLayoutConstraints
{
  return self->_defaultCardLayoutConstraints;
}

- (unint64_t)widgetConfigurationStyle
{
  return self->_widgetConfigurationStyle;
}

- (void)setDelegate:(id)a3
{
}

- (WFWidgetConfigurationContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFWidgetConfigurationContainerViewDelegate *)WeakRetained;
}

- (void)keyboardWillChangeFrame:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKey:*MEMORY[0x263F83778]];
  uint64_t v7 = [v6 unsignedIntegerValue];

  v8 = [v4 userInfo];

  v9 = [v8 objectForKey:*MEMORY[0x263F83780]];
  [v9 doubleValue];
  double v11 = v10;

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__WFWidgetConfigurationContainerView_keyboardWillChangeFrame___block_invoke;
  v12[3] = &unk_2642A5EA0;
  v12[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v7 << 16 delay:v12 options:0 animations:v11 completion:0.0];
}

uint64_t __62__WFWidgetConfigurationContainerView_keyboardWillChangeFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFWidgetConfigurationContainerView;
  id v4 = a3;
  [(WFWidgetConfigurationContainerView *)&v10 traitCollectionDidChange:v4];
  v5 = [(WFWidgetConfigurationContainerView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    v8 = [(WFWidgetConfigurationContainerView *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0) {
      return;
    }
    v5 = [(WFWidgetConfigurationContainerView *)self delegate];
    [v5 widgetConfigurationContainerViewUserInterfaceStyleDidChange:self];
  }
}

- (void)requestDismissal
{
  id v5 = [(WFWidgetConfigurationContainerView *)self cardView];
  v3 = [v5 delegate];
  id v4 = [(WFWidgetConfigurationContainerView *)self cardView];
  [v3 widgetConfigurationCardViewDidRequestToClose:v4];
}

- (void)configureConstraints
{
  if ([(WFWidgetConfigurationContainerView *)self widgetConfigurationStyle] == 2)
  {
    v3 = (void *)MEMORY[0x263F08938];
    id v4 = [(WFWidgetConfigurationContainerView *)self configuredCardLayoutConstraints];
    [v3 deactivateConstraints:v4];

    id v5 = (void *)MEMORY[0x263F08938];
    uint64_t v6 = [(WFWidgetConfigurationContainerView *)self defaultCardLayoutConstraints];
    [v5 deactivateConstraints:v6];

    uint64_t v7 = (void *)MEMORY[0x263F08938];
    uint64_t v8 = [(WFWidgetConfigurationContainerView *)self configuredSheetLayoutConstraints];
  }
  else
  {
    BOOL IsNull = CGRectIsNull(self->_configurationCardViewFrame);
    objc_super v10 = (void *)MEMORY[0x263F08938];
    if (IsNull)
    {
      double v11 = [(WFWidgetConfigurationContainerView *)self configuredCardLayoutConstraints];
      [v10 deactivateConstraints:v11];

      v12 = (void *)MEMORY[0x263F08938];
      v13 = [(WFWidgetConfigurationContainerView *)self configuredSheetLayoutConstraints];
      [v12 deactivateConstraints:v13];

      uint64_t v7 = (void *)MEMORY[0x263F08938];
      [(WFWidgetConfigurationContainerView *)self defaultCardLayoutConstraints];
    }
    else
    {
      v14 = [(WFWidgetConfigurationContainerView *)self defaultCardLayoutConstraints];
      [v10 deactivateConstraints:v14];

      v15 = (void *)MEMORY[0x263F08938];
      v16 = [(WFWidgetConfigurationContainerView *)self configuredSheetLayoutConstraints];
      [v15 deactivateConstraints:v16];

      uint64_t v7 = (void *)MEMORY[0x263F08938];
      [(WFWidgetConfigurationContainerView *)self configuredCardLayoutConstraints];
    uint64_t v8 = };
  }
  id v17 = (id)v8;
  objc_msgSend(v7, "activateConstraints:");
}

- (void)setConfigurationCardViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self->_configurationCardViewFrame = a3;
  if (!CGRectIsNull(a3))
  {
    uint64_t v8 = [(WFWidgetConfigurationContainerView *)self configuratedCardOriginXConstraint];
    [v8 setConstant:x];

    char v9 = [(WFWidgetConfigurationContainerView *)self configuratedCardOriginYConstraint];
    [v9 setConstant:y];

    v20.origin.double x = x;
    v20.origin.double y = y;
    v20.size.double width = width;
    v20.size.double height = height;
    if (CGRectIsEmpty(v20))
    {
      objc_super v10 = [(WFWidgetConfigurationContainerView *)self preferredCardWidthLayoutConstraint];
      [v10 constant];
      double v12 = v11;
      v13 = [(WFWidgetConfigurationContainerView *)self configuratedCardWidthConstraint];
      [v13 setConstant:v12];

      v14 = [(WFWidgetConfigurationContainerView *)self preferredCardHeightLayoutConstraint];
      [v14 constant];
      double v16 = v15;
      id v17 = [(WFWidgetConfigurationContainerView *)self configuratedCardHeightConstraint];
      [v17 setConstant:v16];
    }
    else
    {
      v18 = [(WFWidgetConfigurationContainerView *)self configuratedCardWidthConstraint];
      [v18 setConstant:width];

      v14 = [(WFWidgetConfigurationContainerView *)self configuratedCardHeightConstraint];
      [v14 setConstant:height];
    }
  }
  [(WFWidgetConfigurationContainerView *)self configureConstraints];
}

- (CGRect)configurationCardViewFrame
{
  v2 = [(WFWidgetConfigurationContainerView *)self cardView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)setWidgetConfigurationStyle:(unint64_t)a3
{
  self->_widgetConfigurationStyle = a3;
  [(WFWidgetConfigurationContainerView *)self configureConstraints];
}

- (void)setupConfiguredSheetFrameConstraints
{
  v23[4] = *MEMORY[0x263EF8340];
  double v3 = [(WFWidgetConfigurationCardView *)self->_cardView leftAnchor];
  double v4 = [(WFWidgetConfigurationContainerView *)self leftAnchor];
  double v5 = [v3 constraintEqualToAnchor:v4];
  configuredSheetOriginXConstraint = self->_configuredSheetOriginXConstraint;
  self->_configuredSheetOriginXConstraint = v5;

  double v7 = [(WFWidgetConfigurationCardView *)self->_cardView topAnchor];
  double v8 = [(WFWidgetConfigurationContainerView *)self topAnchor];
  double v9 = [v7 constraintEqualToAnchor:v8];
  configuredSheetOriginYConstraint = self->_configuredSheetOriginYConstraint;
  self->_configuredSheetOriginYConstraint = v9;

  double v11 = [(WFWidgetConfigurationCardView *)self->_cardView widthAnchor];
  double v12 = [(WFWidgetConfigurationContainerView *)self widthAnchor];
  double v13 = [v11 constraintEqualToAnchor:v12];
  configuredSheetWidthConstraint = self->_configuredSheetWidthConstraint;
  self->_configuredSheetWidthConstraint = v13;

  double v15 = [(WFWidgetConfigurationCardView *)self->_cardView heightAnchor];
  double v16 = [(WFWidgetConfigurationContainerView *)self heightAnchor];
  id v17 = [v15 constraintEqualToAnchor:v16];
  configuredSheetHeightConstraint = self->_configuredSheetHeightConstraint;
  self->_configuredSheetHeightConstraint = v17;

  v19 = self->_configuredSheetOriginYConstraint;
  v23[0] = self->_configuredSheetOriginXConstraint;
  v23[1] = v19;
  CGRect v20 = self->_configuredSheetHeightConstraint;
  v23[2] = self->_configuredSheetWidthConstraint;
  v23[3] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
  configuredSheetLayoutConstraints = self->_configuredSheetLayoutConstraints;
  self->_configuredSheetLayoutConstraints = v21;
}

- (void)setupConfiguredCardFrameConstraints
{
  v31[5] = *MEMORY[0x263EF8340];
  double v3 = [(WFWidgetConfigurationCardView *)self->_cardView leftAnchor];
  double v4 = [(WFWidgetConfigurationContainerView *)self leftAnchor];
  double v5 = [v3 constraintEqualToAnchor:v4 constant:0.0];
  configuratedCardOriginXConstraint = self->_configuratedCardOriginXConstraint;
  self->_configuratedCardOriginXConstraint = v5;

  double v7 = [(WFWidgetConfigurationCardView *)self->_cardView topAnchor];
  double v8 = [(WFWidgetConfigurationContainerView *)self topAnchor];
  double v9 = [v7 constraintEqualToAnchor:v8 constant:0.0];
  configuratedCardOriginYConstraint = self->_configuratedCardOriginYConstraint;
  self->_configuratedCardOriginYConstraint = v9;

  double v11 = [(WFWidgetConfigurationCardView *)self->_cardView widthAnchor];
  double v12 = [v11 constraintEqualToConstant:0.0];
  configuratedCardWidthConstraint = self->_configuratedCardWidthConstraint;
  self->_configuratedCardWidthConstraint = v12;

  double v14 = [(WFWidgetConfigurationCardView *)self->_cardView heightAnchor];
  double v15 = [v14 constraintEqualToConstant:0.0];
  configuratedCardHeightConstraint = self->_configuratedCardHeightConstraint;
  self->_configuratedCardHeightConstraint = v15;

  id v17 = [(WFWidgetConfigurationCardView *)self->_cardView bottomAnchor];
  v18 = [(WFWidgetConfigurationContainerView *)self keyboardLayoutGuide];
  v19 = [v18 topAnchor];
  CGRect v20 = [v17 constraintLessThanOrEqualToAnchor:v19 constant:-24.0];

  LODWORD(v21) = 1148813312;
  [v20 setPriority:v21];
  LODWORD(v22) = 1148682240;
  [(NSLayoutConstraint *)self->_configuratedCardOriginXConstraint setPriority:v22];
  LODWORD(v23) = 1148682240;
  [(NSLayoutConstraint *)self->_configuratedCardOriginYConstraint setPriority:v23];
  LODWORD(v24) = 1148764160;
  [(NSLayoutConstraint *)self->_configuratedCardWidthConstraint setPriority:v24];
  LODWORD(v25) = 1148764160;
  [(NSLayoutConstraint *)self->_configuratedCardHeightConstraint setPriority:v25];
  v26 = self->_configuratedCardOriginYConstraint;
  v27 = self->_configuratedCardWidthConstraint;
  v28 = self->_configuratedCardHeightConstraint;
  v31[0] = self->_configuratedCardOriginXConstraint;
  v31[1] = v26;
  v31[2] = v27;
  v31[3] = v28;
  v31[4] = v20;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:5];
  configuredCardLayoutConstraints = self->_configuredCardLayoutConstraints;
  self->_configuredCardLayoutConstraints = v29;
}

- (void)setupDefaultConstraintsWithPreferredSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v42[8] = *MEMORY[0x263EF8340];
  double v6 = [(WFWidgetConfigurationCardView *)self->_cardView widthAnchor];
  double v7 = [v6 constraintEqualToConstant:width];
  preferredCardWidthLayoutConstraint = self->_preferredCardWidthLayoutConstraint;
  self->_preferredCardWidthLayoutConstraint = v7;

  double v9 = [(WFWidgetConfigurationCardView *)self->_cardView heightAnchor];
  double v10 = [v9 constraintEqualToConstant:height];
  preferredCardHeightLayoutConstraint = self->_preferredCardHeightLayoutConstraint;
  self->_preferredCardHeightLayoutConstraint = v10;

  v40 = [(WFWidgetConfigurationCardView *)self->_cardView centerXAnchor];
  v41 = [(WFWidgetConfigurationContainerView *)self readableContentGuide];
  v39 = [v41 centerXAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v42[0] = v38;
  v36 = [(WFWidgetConfigurationCardView *)self->_cardView centerYAnchor];
  v37 = [(WFWidgetConfigurationContainerView *)self readableContentGuide];
  v35 = [v37 centerYAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v42[1] = v34;
  v32 = [(WFWidgetConfigurationCardView *)self->_cardView leadingAnchor];
  v33 = [(WFWidgetConfigurationContainerView *)self layoutMarginsGuide];
  v31 = [v33 leadingAnchor];
  v30 = [v32 constraintGreaterThanOrEqualToAnchor:v31];
  v42[2] = v30;
  v28 = [(WFWidgetConfigurationCardView *)self->_cardView trailingAnchor];
  v29 = [(WFWidgetConfigurationContainerView *)self layoutMarginsGuide];
  v27 = [v29 trailingAnchor];
  double v12 = [v28 constraintLessThanOrEqualToAnchor:v27];
  v42[3] = v12;
  double v13 = [(WFWidgetConfigurationCardView *)self->_cardView topAnchor];
  double v14 = [(WFWidgetConfigurationContainerView *)self layoutMarginsGuide];
  double v15 = [v14 topAnchor];
  double v16 = [v13 constraintGreaterThanOrEqualToAnchor:v15];
  v42[4] = v16;
  id v17 = [(WFWidgetConfigurationCardView *)self->_cardView bottomAnchor];
  v18 = [(WFWidgetConfigurationContainerView *)self layoutMarginsGuide];
  v19 = [v18 bottomAnchor];
  CGRect v20 = [v17 constraintLessThanOrEqualToAnchor:v19];
  double v21 = self->_preferredCardWidthLayoutConstraint;
  v42[5] = v20;
  v42[6] = v21;
  v42[7] = self->_preferredCardHeightLayoutConstraint;
  double v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:8];
  defaultCardLayoutConstraints = self->_defaultCardLayoutConstraints;
  self->_defaultCardLayoutConstraints = v22;

  double v24 = [(WFWidgetConfigurationContainerView *)self defaultCardLayoutConstraints];
  [v24 enumerateObjectsUsingBlock:&__block_literal_global];

  LODWORD(v25) = 1148010496;
  [(NSLayoutConstraint *)self->_preferredCardWidthLayoutConstraint setPriority:v25];
  LODWORD(v26) = 1148010496;
  [(NSLayoutConstraint *)self->_preferredCardHeightLayoutConstraint setPriority:v26];
}

uint64_t __79__WFWidgetConfigurationContainerView_setupDefaultConstraintsWithPreferredSize___block_invoke(double a1, uint64_t a2, void *a3)
{
  LODWORD(a1) = 1148026880;
  return [a3 setPriority:a1];
}

- (WFWidgetConfigurationContainerView)initWithCardView:(id)a3 preferredSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  if (!v9)
  {
    id v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFWidgetConfigurationContainerView.m", 39, @"Invalid parameter not satisfying: %@", @"cardView" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)WFWidgetConfigurationContainerView;
  double v10 = -[WFWidgetConfigurationContainerView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  double v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_cardView, a3);
    [(WFWidgetConfigurationCardView *)v11->_cardView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WFWidgetConfigurationContainerView *)v11 addSubview:v9];
    -[WFWidgetConfigurationContainerView setupDefaultConstraintsWithPreferredSize:](v11, "setupDefaultConstraintsWithPreferredSize:", width, height);
    [(WFWidgetConfigurationContainerView *)v11 setupConfiguredCardFrameConstraints];
    [(WFWidgetConfigurationContainerView *)v11 setupConfiguredSheetFrameConstraints];
    double v12 = (void *)MEMORY[0x263F08938];
    double v13 = [(WFWidgetConfigurationContainerView *)v11 defaultCardLayoutConstraints];
    [v12 activateConstraints:v13];

    double v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v11 selector:sel_keyboardWillChangeFrame_ name:*MEMORY[0x263F83800] object:0];
    [v14 addObserver:v11 selector:sel_keyboardWillChangeFrame_ name:*MEMORY[0x263F837F8] object:0];
    double v15 = v11;
  }
  return v11;
}

@end