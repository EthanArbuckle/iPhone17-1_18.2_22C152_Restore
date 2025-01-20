@interface WFWidgetConfigurationCardContainerViewController
- (CGRect)configurationCardViewFrame;
- (MTVisualStylingProvider)fillProvider;
- (MTVisualStylingProvider)strokeProvider;
- (UIColor)containerBackgroundColor;
- (UIViewController)contentViewController;
- (WFWidgetConfigurationCardContainerViewController)initWithRequest:(id)a3 contentViewController:(id)a4;
- (WFWidgetConfigurationCardView)cardView;
- (WFWidgetConfigurationContainerView)containerView;
- (WFWidgetConfigurationContainerViewControllerProtocolDelegate)containerDelegate;
- (WFWidgetConfigurationRequest)request;
- (unint64_t)widgetConfigurationStyle;
- (void)loadView;
- (void)setCardView:(id)a3;
- (void)setConfigurationCardViewFrame:(CGRect)a3;
- (void)setContainerBackgroundColor:(id)a3;
- (void)setContainerDelegate:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setWidgetConfigurationStyle:(unint64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateUserInterfaceStyle;
- (void)viewDidLoad;
- (void)widgetConfigurationCardViewDidRequestToClose:(id)a3;
@end

@implementation WFWidgetConfigurationCardContainerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_destroyWeak((id *)&self->_containerDelegate);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

- (void)setContainerView:(id)a3
{
}

- (WFWidgetConfigurationContainerView)containerView
{
  return (WFWidgetConfigurationContainerView *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setCardView:(id)a3
{
}

- (WFWidgetConfigurationCardView)cardView
{
  return (WFWidgetConfigurationCardView *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setWidgetConfigurationStyle:(unint64_t)a3
{
  self->_widgetConfigurationStyle = a3;
}

- (unint64_t)widgetConfigurationStyle
{
  return self->_widgetConfigurationStyle;
}

- (void)setContainerDelegate:(id)a3
{
}

- (WFWidgetConfigurationContainerViewControllerProtocolDelegate)containerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerDelegate);
  return (WFWidgetConfigurationContainerViewControllerProtocolDelegate *)WeakRetained;
}

- (WFWidgetConfigurationRequest)request
{
  return self->_request;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)widgetConfigurationCardViewDidRequestToClose:(id)a3
{
  v4 = [(WFWidgetConfigurationCardContainerViewController *)self containerDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WFWidgetConfigurationCardContainerViewController *)self containerDelegate];
    [v6 widgetConfigurationContainerViewControllerDidRequestToClose:self];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFWidgetConfigurationCardContainerViewController;
  id v4 = a3;
  [(WFWidgetConfigurationCardContainerViewController *)&v8 traitCollectionDidChange:v4];
  char v5 = [(WFWidgetConfigurationCardContainerViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(WFWidgetConfigurationCardContainerViewController *)self updateUserInterfaceStyle];
  }
}

- (void)updateUserInterfaceStyle
{
  id v4 = [(WFWidgetConfigurationCardContainerViewController *)self cardView];
  char v5 = [v4 backgroundColor];
  uint64_t v6 = [(WFWidgetConfigurationCardContainerViewController *)self containerView];
  uint64_t v7 = [v6 traitCollection];
  objc_super v8 = [v5 resolvedColorWithTraitCollection:v7];

  id v26 = v8;
  if (WFCGColorPerceivedLightness((CGColor *)[v26 CGColor]) > 0.7) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  v10 = [(WFWidgetConfigurationCardContainerViewController *)self containerView];
  v11 = [v10 traitCollection];
  uint64_t v12 = [v11 userInterfaceStyle];
  uint64_t v25 = v9;
  if (v12)
  {
    v13 = [(WFWidgetConfigurationCardContainerViewController *)self containerView];
    v2 = [v13 traitCollection];
    if ([v2 userInterfaceStyle] != v9)
    {

LABEL_14:
      v19 = [(WFWidgetConfigurationCardContainerViewController *)self cardView];
      [v19 setOverrideUserInterfaceStyle:v25];

      v20 = [(WFWidgetConfigurationCardContainerViewController *)self contentViewController];
      v21 = v20;
      uint64_t v22 = v25;
      goto LABEL_16;
    }
    v24 = v13;
  }
  v14 = [(WFWidgetConfigurationCardContainerViewController *)self cardView];
  v15 = [v14 traitCollection];
  if ([v15 userInterfaceStyle])
  {
    v16 = [(WFWidgetConfigurationCardContainerViewController *)self cardView];
    v17 = [v16 traitCollection];
    BOOL v18 = [v17 userInterfaceStyle] != v9;
  }
  else
  {
    BOOL v18 = 0;
  }

  if (v12)
  {
  }
  if (v18) {
    goto LABEL_14;
  }
  v23 = [(WFWidgetConfigurationCardContainerViewController *)self cardView];
  [v23 setOverrideUserInterfaceStyle:0];

  v20 = [(WFWidgetConfigurationCardContainerViewController *)self contentViewController];
  v21 = v20;
  uint64_t v22 = 0;
LABEL_16:
  [v20 setOverrideUserInterfaceStyle:v22];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)WFWidgetConfigurationCardContainerViewController;
  [(WFWidgetConfigurationCardContainerViewController *)&v6 viewDidLoad];
  v3 = [(WFWidgetConfigurationCardContainerViewController *)self request];
  id v4 = [v3 widgetTintColor];
  char v5 = [(WFWidgetConfigurationCardContainerViewController *)self view];
  [v5 setTintColor:v4];

  [(WFWidgetConfigurationCardContainerViewController *)self updateUserInterfaceStyle];
}

- (void)loadView
{
  v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 bounds];
  double v5 = v4;

  objc_super v6 = [(WFWidgetConfigurationCardContainerViewController *)self request];
  if (v6)
  {
    uint64_t v7 = [(WFWidgetConfigurationCardContainerViewController *)self request];
    [v7 defaultCardSize];
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v9 = v5 + -56.0;
    double v11 = ceil(v9 * 0.7);
  }

  uint64_t v12 = [WFWidgetConfigurationView alloc];
  v13 = -[WFWidgetConfigurationView initWithFrame:preferredCardSize:](v12, "initWithFrame:preferredCardSize:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24), v9, v11);
  [(WFWidgetConfigurationCardContainerViewController *)self setView:v13];

  v14 = [(WFWidgetConfigurationCardContainerViewController *)self configurationView];
  [v14 setAutoresizingMask:18];

  v15 = [(WFWidgetConfigurationCardContainerViewController *)self contentViewController];
  [(WFWidgetConfigurationCardContainerViewController *)self addChildViewController:v15];

  v16 = [(WFWidgetConfigurationCardContainerViewController *)self contentViewController];
  id v70 = [v16 view];

  v17 = [WFWidgetConfigurationCardView alloc];
  BOOL v18 = [(WFWidgetConfigurationCardContainerViewController *)self request];
  v19 = [(WFWidgetConfigurationCardView *)v17 initWithRequest:v18 contentView:v70];
  [(WFWidgetConfigurationCardContainerViewController *)self setCardView:v19];

  v20 = [(WFWidgetConfigurationCardContainerViewController *)self cardView];
  [v20 setDelegate:self];

  v21 = [(WFWidgetConfigurationCardContainerViewController *)self request];
  uint64_t v22 = [v21 widgetPrimaryColor];
  v23 = v22;
  if (v22)
  {
    id v24 = v22;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F825C8], "wf_defaultWidgetConfigurationCardBackgroundColor");
    id v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v25 = v24;

  id v26 = [(WFWidgetConfigurationCardContainerViewController *)self cardView];
  [v26 setBackgroundColor:v25];

  v27 = [(WFWidgetConfigurationCardContainerViewController *)self request];
  v28 = [v27 widgetTintColor];
  v29 = [(WFWidgetConfigurationCardContainerViewController *)self cardView];
  [v29 setTintColor:v28];

  v30 = [WFWidgetConfigurationContainerView alloc];
  v31 = [(WFWidgetConfigurationCardContainerViewController *)self cardView];
  v32 = -[WFWidgetConfigurationContainerView initWithCardView:preferredSize:](v30, "initWithCardView:preferredSize:", v31, v9, v11);
  [(WFWidgetConfigurationCardContainerViewController *)self setContainerView:v32];

  v33 = [(WFWidgetConfigurationCardContainerViewController *)self request];
  uint64_t v34 = [v33 resolvedWidgetConfigurationStyle];
  v35 = [(WFWidgetConfigurationCardContainerViewController *)self containerView];
  [v35 setWidgetConfigurationStyle:v34];

  v36 = [(WFWidgetConfigurationCardContainerViewController *)self request];

  if (v36)
  {
    v37 = [(WFWidgetConfigurationCardContainerViewController *)self request];
    [v37 initialCardFrame];
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    v46 = [(WFWidgetConfigurationCardContainerViewController *)self configurationView];
    objc_msgSend(v46, "setOverridingCardViewFrame:", v39, v41, v43, v45);

    v47 = [(WFWidgetConfigurationCardContainerViewController *)self request];
    [v47 initialCardFrame];
    LODWORD(v46) = CGRectIsNull(v72);

    v48 = [(WFWidgetConfigurationCardContainerViewController *)self request];
    v49 = v48;
    if (v46)
    {
      [v48 defaultCardSize];
    }
    else
    {
      [v48 initialCardFrame];
      double v50 = v52;
      double v51 = v53;
    }
    -[WFWidgetConfigurationCardContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v50, v51);
  }
  else
  {
    -[WFWidgetConfigurationCardContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v9, v11);
  }
  v54 = [(WFWidgetConfigurationCardContainerViewController *)self containerView];
  [v54 setAutoresizingMask:18];

  v55 = [(WFWidgetConfigurationCardContainerViewController *)self containerView];
  [v55 setDelegate:self];

  v56 = [(WFWidgetConfigurationCardContainerViewController *)self view];
  [v56 bounds];
  double v58 = v57;
  double v60 = v59;
  double v62 = v61;
  double v64 = v63;
  v65 = [(WFWidgetConfigurationCardContainerViewController *)self containerView];
  objc_msgSend(v65, "setFrame:", v58, v60, v62, v64);

  v66 = [(WFWidgetConfigurationCardContainerViewController *)self contentViewController];
  [(WFWidgetConfigurationCardContainerViewController *)self addChildViewController:v66];

  v67 = [(WFWidgetConfigurationCardContainerViewController *)self containerView];
  v68 = [(WFWidgetConfigurationCardContainerViewController *)self configurationView];
  [v68 setContainerView:v67];

  v69 = [(WFWidgetConfigurationCardContainerViewController *)self contentViewController];
  [v69 didMoveToParentViewController:self];
}

- (MTVisualStylingProvider)fillProvider
{
  v2 = [(WFWidgetConfigurationCardContainerViewController *)self cardView];
  v3 = [v2 fillProvider];

  return (MTVisualStylingProvider *)v3;
}

- (MTVisualStylingProvider)strokeProvider
{
  v2 = [(WFWidgetConfigurationCardContainerViewController *)self cardView];
  v3 = [v2 strokeProvider];

  return (MTVisualStylingProvider *)v3;
}

- (void)setConfigurationCardViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(WFWidgetConfigurationCardContainerViewController *)self containerView];
  objc_msgSend(v7, "setConfigurationCardViewFrame:", x, y, width, height);
}

- (CGRect)configurationCardViewFrame
{
  v2 = [(WFWidgetConfigurationCardContainerViewController *)self containerView];
  [v2 configurationCardViewFrame];
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

- (void)setContainerBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWidgetConfigurationCardContainerViewController *)self cardView];
  [v5 setBackgroundColor:v4];
}

- (UIColor)containerBackgroundColor
{
  v2 = [(WFWidgetConfigurationCardContainerViewController *)self cardView];
  double v3 = [v2 backgroundColor];

  return (UIColor *)v3;
}

- (WFWidgetConfigurationCardContainerViewController)initWithRequest:(id)a3 contentViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFWidgetConfigurationCardContainerViewController;
  double v9 = [(WFWidgetConfigurationCardContainerViewController *)&v13 initWithNibName:0 bundle:0];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_contentViewController, a4);
    double v11 = v10;
  }

  return v10;
}

@end