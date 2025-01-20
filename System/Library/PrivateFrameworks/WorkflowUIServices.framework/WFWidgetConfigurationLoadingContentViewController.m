@interface WFWidgetConfigurationLoadingContentViewController
- (UIView)currentContentView;
- (void)setCurrentContentView:(id)a3;
- (void)showMessage:(id)a3;
- (void)startLoading;
- (void)viewDidLoad;
@end

@implementation WFWidgetConfigurationLoadingContentViewController

- (void).cxx_destruct
{
}

- (UIView)currentContentView
{
  return self->_currentContentView;
}

- (void)showMessage:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F828E0];
  id v5 = a3;
  id v8 = objc_alloc_init(v4);
  [v8 setText:v5];

  v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v8 setFont:v6];

  [v8 setAdjustsFontForContentSizeCategory:1];
  [v8 setNumberOfLines:0];
  [v8 setTextAlignment:1];
  v7 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [v8 setTextColor:v7];

  [(WFWidgetConfigurationLoadingContentViewController *)self setCurrentContentView:v8];
}

- (void)startLoading
{
  id v3 = (id)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:101];
  [v3 startAnimating];
  [(WFWidgetConfigurationLoadingContentViewController *)self setCurrentContentView:v3];
}

- (void)viewDidLoad
{
  v33[4] = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)WFWidgetConfigurationLoadingContentViewController;
  [(WFWidgetConfigurationLoadingContentViewController *)&v32 viewDidLoad];
  id v3 = [(WFWidgetConfigurationLoadingContentViewController *)self currentContentView];

  if (v3)
  {
    v4 = [(WFWidgetConfigurationLoadingContentViewController *)self view];
    id v5 = [(WFWidgetConfigurationLoadingContentViewController *)self currentContentView];
    [v4 addSubview:v5];

    v20 = (void *)MEMORY[0x263F08938];
    v31 = [(WFWidgetConfigurationLoadingContentViewController *)self currentContentView];
    v29 = [v31 centerXAnchor];
    v30 = [(WFWidgetConfigurationLoadingContentViewController *)self view];
    v28 = [v30 layoutMarginsGuide];
    v27 = [v28 centerXAnchor];
    v26 = [v29 constraintEqualToAnchor:v27];
    v33[0] = v26;
    v25 = [(WFWidgetConfigurationLoadingContentViewController *)self currentContentView];
    v23 = [v25 centerYAnchor];
    v24 = [(WFWidgetConfigurationLoadingContentViewController *)self view];
    v22 = [v24 layoutMarginsGuide];
    v21 = [v22 centerYAnchor];
    v19 = [v23 constraintEqualToAnchor:v21];
    v33[1] = v19;
    v18 = [(WFWidgetConfigurationLoadingContentViewController *)self currentContentView];
    v16 = [v18 widthAnchor];
    v17 = [(WFWidgetConfigurationLoadingContentViewController *)self view];
    v6 = [v17 layoutMarginsGuide];
    v7 = [v6 widthAnchor];
    id v8 = [v16 constraintLessThanOrEqualToAnchor:v7];
    v33[2] = v8;
    v9 = [(WFWidgetConfigurationLoadingContentViewController *)self currentContentView];
    v10 = [v9 heightAnchor];
    v11 = [(WFWidgetConfigurationLoadingContentViewController *)self view];
    v12 = [v11 layoutMarginsGuide];
    v13 = [v12 heightAnchor];
    v14 = [v10 constraintLessThanOrEqualToAnchor:v13];
    v33[3] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
    [v20 activateConstraints:v15];
  }
  else
  {
    [(WFWidgetConfigurationLoadingContentViewController *)self startLoading];
  }
}

- (void)setCurrentContentView:(id)a3
{
  v30[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  currentContentView = self->_currentContentView;
  if (currentContentView) {
    [(UIView *)currentContentView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_currentContentView, a3);
  [(UIView *)self->_currentContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  if (v5 && [(WFWidgetConfigurationLoadingContentViewController *)self isViewLoaded])
  {
    v7 = [(WFWidgetConfigurationLoadingContentViewController *)self view];
    [v7 addSubview:v5];

    v20 = (void *)MEMORY[0x263F08938];
    v28 = [v5 centerXAnchor];
    v29 = [(WFWidgetConfigurationLoadingContentViewController *)self view];
    v27 = [v29 layoutMarginsGuide];
    v26 = [v27 centerXAnchor];
    v25 = [v28 constraintEqualToAnchor:v26];
    v30[0] = v25;
    v23 = [v5 centerYAnchor];
    v24 = [(WFWidgetConfigurationLoadingContentViewController *)self view];
    v22 = [v24 layoutMarginsGuide];
    v21 = [v22 centerYAnchor];
    v19 = [v23 constraintEqualToAnchor:v21];
    v30[1] = v19;
    v17 = [v5 widthAnchor];
    v18 = [(WFWidgetConfigurationLoadingContentViewController *)self view];
    id v8 = [v18 layoutMarginsGuide];
    v9 = [v8 widthAnchor];
    v10 = [v17 constraintLessThanOrEqualToAnchor:v9];
    v30[2] = v10;
    v11 = [v5 heightAnchor];
    v12 = [(WFWidgetConfigurationLoadingContentViewController *)self view];
    v13 = [v12 layoutMarginsGuide];
    v14 = [v13 heightAnchor];
    v15 = [v11 constraintLessThanOrEqualToAnchor:v14];
    v30[3] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];
    [v20 activateConstraints:v16];
  }
}

@end