@interface BSUIHostedMessageViewProvider
- (BCMessageViewControllerProvider)messageViewControllerProvider;
- (BSUIHostedMessageViewProvider)initWithRequest:(id)a3 identifier:(id)a4 delegate:(id)a5;
- (BSUIHostedMessageViewProviderDelegate)delegate;
- (TUIVisibilityOptions)hostedViewProviderVisibilityOptions;
- (id)hostedViewProviderCreateViewController;
- (unint64_t)hostedViewProviderFlags;
- (void)_dismiss;
- (void)hostedViewProviderCustomizeViewController:(id)a3 withAnchorPoint:(CGPoint)a4;
- (void)hostedViewProviderDidChangeVisibility:(BOOL)a3 viewController:(id)a4;
- (void)messageViewController:(id)a3 didSelectActionWithURL:(id)a4;
- (void)messageViewControllerDidSelectCancel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMessageViewControllerProvider:(id)a3;
@end

@implementation BSUIHostedMessageViewProvider

- (BSUIHostedMessageViewProvider)initWithRequest:(id)a3 identifier:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)BSUIHostedMessageViewProvider;
  v12 = [(BSUIHostedMessageViewProvider *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_identifier, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    id v14 = objc_alloc((Class)BCMessageViewControllerProvider);
    request = v13->_request;
    v16 = [(TUIHostingIdentifier *)v13->_identifier identifier];
    v17 = (BCMessageViewControllerProvider *)[v14 initWithRequest:request placement:v16];
    messageViewControllerProvider = v13->_messageViewControllerProvider;
    v13->_messageViewControllerProvider = v17;

    [(BCMessageViewControllerProvider *)v13->_messageViewControllerProvider setDelegate:v13];
  }

  return v13;
}

- (id)hostedViewProviderCreateViewController
{
  v3 = [(BCMessageViewControllerProvider *)self->_messageViewControllerProvider viewController];
  objc_opt_class();
  v7 = &OBJC_PROTOCOL___BCAMSUITrackable;
  v8 = &OBJC_PROTOCOL___AMSUIMessageViewController;
  v4 = BUClassAndProtocolCast();

  if (v4)
  {
    [v4 setIsOnScreen:0];
    [v4 setShouldAutomaticallyReportMetrics:0];
  }
  v5 = [(BCMessageViewControllerProvider *)self->_messageViewControllerProvider viewController];

  return v5;
}

- (void)_dismiss
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained removeProviderForIdentifier:self->_identifier];
}

- (void)messageViewController:(id)a3 didSelectActionWithURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 viewController];
  id v9 = (char *)[v8 modalPresentationStyle];

  if (v9 == (unsigned char *)&dword_4 + 3)
  {
    objc_initWeak(&location, self);
    id v10 = [v6 viewController];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_23EFC;
    v13[3] = &unk_38E2A0;
    objc_copyWeak(&v15, &location);
    id v14 = v7;
    [v10 dismissViewControllerAnimated:1 completion:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = [v7 absoluteString];
    [WeakRetained hostedMessageViewDidTriggerAction:v12];
  }
}

- (void)messageViewControllerDidSelectCancel:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewController];
  id v6 = (char *)[v5 modalPresentationStyle];

  if (v6 == (unsigned char *)&dword_4 + 3)
  {
    objc_initWeak(&location, self);
    id v7 = [v4 viewController];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_2409C;
    v8[3] = &unk_38E9F8;
    objc_copyWeak(&v9, &location);
    [v7 dismissViewControllerAnimated:1 completion:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    [(BSUIHostedMessageViewProvider *)self _dismiss];
  }
}

- (unint64_t)hostedViewProviderFlags
{
  return 2;
}

- (void)hostedViewProviderDidChangeVisibility:(BOOL)a3 viewController:(id)a4
{
  BOOL v4 = a3;
  id v6 = [(BCMessageViewControllerProvider *)self->_messageViewControllerProvider viewController];
  objc_opt_class();
  BUClassAndProtocolCast();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v9 setIsOnScreen:v4 &OBJC_PROTOCOL___BCAMSUITrackable &OBJC_PROTOCOL___AMSUIMessageViewController];
  if (v4)
  {
    [v9 enqueueImpressionMetrics];
    id v7 = [(BSUIHostedMessageViewProvider *)self delegate];
    v8 = [(TUIHostingIdentifier *)self->_identifier identifier];
    [v7 hostedMessageViewDidBecomeVisible:v8];
  }
}

- (TUIVisibilityOptions)hostedViewProviderVisibilityOptions
{
  return (TUIVisibilityOptions *)+[TUIVisibilityOptions defaultOptions];
}

- (void)hostedViewProviderCustomizeViewController:(id)a3 withAnchorPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v6 = a3;
  objc_opt_class();
  BUDynamicCast();
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = v14;
  if (v14)
  {
    if (y == 0.0)
    {
      int v8 = 0;
      uint64_t v9 = 0;
    }
    else if (y == 1.0)
    {
      int v8 = 1;
      uint64_t v9 = 1;
    }
    else if (x == 0.0)
    {
      int v8 = 0;
      uint64_t v9 = 2;
    }
    else
    {
      if (x != 1.0) {
        goto LABEL_16;
      }
      int v8 = 0;
      uint64_t v9 = 3;
    }
    if (y == 0.0) {
      int v8 = 1;
    }
    double v10 = fabs(x);
    double v11 = fabs(y);
    if (v8) {
      double v12 = v10;
    }
    else {
      double v12 = v11;
    }
    id v13 = [objc_alloc((Class)AMSUIBubbleTipInlineAnchorInfo) initWithArrowDirection:v9 relativeArrowOffset:v12];
    [v14 setInlineAnchorInfo:v13];

    id v7 = v14;
  }
LABEL_16:
}

- (BSUIHostedMessageViewProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BSUIHostedMessageViewProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BCMessageViewControllerProvider)messageViewControllerProvider
{
  return self->_messageViewControllerProvider;
}

- (void)setMessageViewControllerProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageViewControllerProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end