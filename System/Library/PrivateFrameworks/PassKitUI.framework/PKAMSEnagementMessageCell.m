@interface PKAMSEnagementMessageCell
- (BOOL)messageViewController:(id)a3 shouldEnqueueMetricsForDialogResult:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKDashboardPassMessage)message;
- (void)displayDialogRequest:(id)a3;
- (void)layoutSubviews;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
- (void)prepareForReuse;
- (void)setMessage:(id)a3;
@end

@implementation PKAMSEnagementMessageCell

- (void)setMessage:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_message, a3);
  if (self->_message)
  {
    objc_initWeak(&location, self);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    v9 = __40__PKAMSEnagementMessageCell_setMessage___block_invoke;
    v10 = &unk_1E59CA7F8;
    objc_copyWeak(&v11, &location);
    [v5 setActionOnViewed:&v7];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  v6 = objc_msgSend(v5, "dialogRequest", v7, v8, v9, v10);
  [(PKAMSEnagementMessageCell *)self displayDialogRequest:v6];
}

void __40__PKAMSEnagementMessageCell_setMessage___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[127] enqueueImpressionMetrics];
    WeakRetained = v2;
  }
}

- (void)displayDialogRequest:(id)a3
{
  id v4 = a3;
  dashboardMessageController = self->_dashboardMessageController;
  id v18 = v4;
  if (dashboardMessageController)
  {
    v6 = [(AMSUIDashboardMessageViewController *)dashboardMessageController view];
    [v6 removeFromSuperview];

    [(AMSUIDashboardMessageViewController *)self->_dashboardMessageController removeFromParentViewController];
    uint64_t v7 = self->_dashboardMessageController;
    self->_dashboardMessageController = 0;

    id v4 = v18;
  }
  if (v4)
  {
    uint64_t v8 = (AMSUIDashboardMessageViewController *)[objc_alloc(MEMORY[0x1E4F4DFA0]) initWithRequest:v18];
    v9 = self->_dashboardMessageController;
    self->_dashboardMessageController = v8;

    [(AMSUIDashboardMessageViewController *)self->_dashboardMessageController setImpressionsReportingFrequency:0];
    [(AMSUIDashboardMessageViewController *)self->_dashboardMessageController setShouldAutomaticallyReportMetrics:0];
    [(AMSUIDashboardMessageViewController *)self->_dashboardMessageController setDelegate:self];
    v10 = [(UIView *)self pkui_viewControllerFromResponderChain];
    [v10 addChildViewController:self->_dashboardMessageController];

    id v11 = [(AMSUIDashboardMessageViewController *)self->_dashboardMessageController view];
    [(PKAMSEnagementMessageCell *)self addSubview:v11];

    v12 = [(AMSUIDashboardMessageViewController *)self->_dashboardMessageController view];
    v13 = [v12 backgroundColor];
    v14 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    int v15 = [v13 isEqual:v14];

    id v4 = v18;
    if (v15)
    {
      v16 = [(AMSUIDashboardMessageViewController *)self->_dashboardMessageController view];
      v17 = [MEMORY[0x1E4FB1618] clearColor];
      [v16 setBackgroundColor:v17];

      id v4 = v18;
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(AMSUIDashboardMessageViewController *)self->_dashboardMessageController view];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKAMSEnagementMessageCell;
  [(PKAMSEnagementMessageCell *)&v4 layoutSubviews];
  v3 = [(AMSUIDashboardMessageViewController *)self->_dashboardMessageController view];
  [(PKAMSEnagementMessageCell *)self bounds];
  objc_msgSend(v3, "setFrame:");
}

- (void)prepareForReuse
{
  [(PKAMSEnagementMessageCell *)self setMessage:0];
  v3.receiver = self;
  v3.super_class = (Class)PKAMSEnagementMessageCell;
  [(PKAMSEnagementMessageCell *)&v3 prepareForReuse];
}

- (BOOL)messageViewController:(id)a3 shouldEnqueueMetricsForDialogResult:(id)a4
{
  return 1;
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v5 = a4;
  double v6 = [v5 originalRequest];
  double v7 = [v5 selectedActionIdentifier];

  id v11 = [v6 locateActionWithIdentifier:v7];

  if (v11)
  {
    unint64_t v8 = [v11 style];
    if (v8 >= 2)
    {
      if (v8 != 2) {
        goto LABEL_8;
      }
      uint64_t v9 = [(PKDashboardPassMessage *)self->_message actionOnDismiss];
    }
    else
    {
      uint64_t v9 = [(PKDashboardPassMessage *)self->_message actionOnButtonPress];
    }
    double v10 = (void *)v9;
    if (v9)
    {
      (*(void (**)(uint64_t))(v9 + 16))(v9);
    }
  }
LABEL_8:
}

- (PKDashboardPassMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_dashboardMessageController, 0);
}

@end