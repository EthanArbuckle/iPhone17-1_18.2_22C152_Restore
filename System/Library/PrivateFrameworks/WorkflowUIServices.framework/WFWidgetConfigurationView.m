@interface WFWidgetConfigurationView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (CGRect)overridingCardViewFrame;
- (WFWidgetConfigurationContainerView)containerView;
- (WFWidgetConfigurationRemoteViewController)remoteViewController;
- (WFWidgetConfigurationView)initWithFrame:(CGRect)a3;
- (WFWidgetConfigurationView)initWithFrame:(CGRect)a3 preferredCardSize:(CGSize)a4;
- (void)requestDismissal;
- (void)setContainerView:(id)a3;
- (void)setOverridingCardViewFrame:(CGRect)a3;
- (void)setRemoteViewController:(id)a3;
@end

@implementation WFWidgetConfigurationView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

- (WFWidgetConfigurationRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (WFWidgetConfigurationContainerView)containerView
{
  return self->_containerView;
}

- (CGRect)overridingCardViewFrame
{
  double x = self->_overridingCardViewFrame.origin.x;
  double y = self->_overridingCardViewFrame.origin.y;
  double width = self->_overridingCardViewFrame.size.width;
  double height = self->_overridingCardViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  v6 = [v5 view];
  if (v6)
  {
    v7 = [v5 view];
    v8 = [(WFWidgetConfigurationView *)self containerView];
    v9 = [v8 cardView];
    int v10 = [v7 isDescendantOfView:v9] ^ 1;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)requestDismissal
{
  id v2 = [(WFWidgetConfigurationView *)self containerView];
  [v2 requestDismissal];
}

- (void)setContainerView:(id)a3
{
  v4 = (WFWidgetConfigurationContainerView *)a3;
  id v5 = [(WFWidgetConfigurationView *)self containerView];
  [v5 removeFromSuperview];

  containerView = self->_containerView;
  self->_containerView = v4;

  v7 = [(WFWidgetConfigurationView *)self containerView];
  [v7 setAutoresizingMask:18];

  [(WFWidgetConfigurationView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(WFWidgetConfigurationView *)self containerView];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  [(WFWidgetConfigurationView *)self overridingCardViewFrame];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  v25 = [(WFWidgetConfigurationView *)self containerView];
  objc_msgSend(v25, "setConfigurationCardViewFrame:", v18, v20, v22, v24);

  id v26 = [(WFWidgetConfigurationView *)self containerView];
  [(WFWidgetConfigurationView *)self addSubview:v26];
}

- (void)setRemoteViewController:(id)a3
{
  id v9 = a3;
  id v5 = [(WFWidgetConfigurationView *)self remoteViewController];
  v6 = [v5 view];
  [v6 removeFromSuperview];

  objc_storeStrong((id *)&self->_remoteViewController, a3);
  if (v9)
  {
    v7 = [v9 view];
    [(WFWidgetConfigurationView *)self bounds];
    objc_msgSend(v7, "setFrame:");
    [v7 setAutoresizingMask:18];
    [(WFWidgetConfigurationView *)self overridingCardViewFrame];
    objc_msgSend(v9, "setConfigurationCardViewFrame:");
    [(WFWidgetConfigurationView *)self insertSubview:v7 atIndex:0];
  }
  double v8 = [(WFWidgetConfigurationView *)self containerView];
  [v8 setHidden:v9 != 0];
}

- (void)setOverridingCardViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self->_overridingCardViewFrame = a3;
  double v8 = [(WFWidgetConfigurationView *)self remoteViewController];
  objc_msgSend(v8, "setConfigurationCardViewFrame:", x, y, width, height);

  id v9 = [(WFWidgetConfigurationView *)self containerView];
  objc_msgSend(v9, "setConfigurationCardViewFrame:", x, y, width, height);
}

- (WFWidgetConfigurationView)initWithFrame:(CGRect)a3
{
  double v3 = fmax(a3.size.width + -40.0, 0.0);
  return -[WFWidgetConfigurationView initWithFrame:preferredCardSize:](self, "initWithFrame:preferredCardSize:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, v3, (v3 + v3) / 3.0);
}

- (WFWidgetConfigurationView)initWithFrame:(CGRect)a3 preferredCardSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v14.receiver = self;
  v14.super_class = (Class)WFWidgetConfigurationView;
  v6 = -[WFWidgetConfigurationView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = (WFWidgetConfigurationView *)v6;
  if (v6)
  {
    *((CGFloat *)v6 + 51) = width;
    *((CGFloat *)v6 + 52) = height;
    long long v8 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
    *(_OWORD *)(v6 + 440) = *MEMORY[0x263F001A0];
    *(_OWORD *)(v6 + 456) = v8;
    id v9 = [MEMORY[0x263F825C8] whiteColor];
    double v10 = [v9 colorWithAlphaComponent:0.01];
    [(WFWidgetConfigurationView *)v7 setBackgroundColor:v10];

    double v11 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v7 action:sel_requestDismissal];
    [v11 setDelegate:v7];
    [(WFWidgetConfigurationView *)v7 addGestureRecognizer:v11];
    double v12 = v7;
  }
  return v7;
}

@end