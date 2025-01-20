@interface BCMessageViewControllerProvider
- (AMSDialogRequest)request;
- (BAMessageData)messageData;
- (BCMessageViewControllerProvider)initWithRequest:(id)a3 placement:(id)a4;
- (BCMessageViewControllerProvider)initWithRequest:(id)a3 placement:(id)a4 style:(int64_t)a5 messageType:(int64_t)a6;
- (BCMessageViewControllerProviderDelegate)delegate;
- (NSString)placement;
- (UIViewController)viewController;
- (int64_t)messageType;
- (int64_t)userInterfaceStyle;
- (void)messageViewController:(id)a3 didFailWithError:(id)a4;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setMessageType:(int64_t)a3;
- (void)setPlacement:(id)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation BCMessageViewControllerProvider

- (BCMessageViewControllerProvider)initWithRequest:(id)a3 placement:(id)a4
{
  return [(BCMessageViewControllerProvider *)self initWithRequest:a3 placement:a4 style:0 messageType:6];
}

- (BCMessageViewControllerProvider)initWithRequest:(id)a3 placement:(id)a4 style:(int64_t)a5 messageType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BCMessageViewControllerProvider;
  v13 = [(BCMessageViewControllerProvider *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_request, a3);
    v15 = (NSString *)[v12 copy];
    placement = v14->_placement;
    v14->_placement = v15;

    v14->_userInterfaceStyle = a5;
    v14->_messageType = a6;
  }

  return v14;
}

- (UIViewController)viewController
{
  if (!self->_viewController)
  {
    v3 = (int *)[(AMSDialogRequest *)self->_request style];
    if (v3 == &dword_4)
    {
      v4 = [[BCAMSUIBubbleTipViewController alloc] initWithRequest:self->_request placement:self->_placement messageType:self->_messageType];
      [(BCAMSUIBubbleTipViewController *)v4 setDelegate:self];
      if ([(BCMessageViewControllerProvider *)self userInterfaceStyle]) {
        [(BCAMSUIBubbleTipViewController *)v4 setOverrideUserInterfaceStyle:[(BCMessageViewControllerProvider *)self userInterfaceStyle]];
      }
    }
    else
    {
      if (v3 != (int *)((char *)&def_7D91C + 3)) {
        goto LABEL_8;
      }
      v4 = [[BCAMSUIBannerMessageViewController alloc] initWithRequest:self->_request placement:self->_placement];
      [(BCAMSUIBubbleTipViewController *)v4 setDelegate:self];
    }
    viewController = self->_viewController;
    self->_viewController = (UIViewController *)v4;
  }
LABEL_8:
  v6 = self->_viewController;

  return v6;
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v20 = a4;
  id v6 = a3;
  v7 = [v20 originalRequest];
  v8 = [v20 selectedActionIdentifier];
  v9 = [v7 locateActionWithIdentifier:v8];

  v10 = [v9 deepLink];

  id v11 = [(BCMessageViewControllerProvider *)self delegate];
  id v12 = v11;
  if (v10)
  {
    v13 = [v9 deepLink];
    [v12 messageViewController:self didSelectActionWithURL:v13];
  }
  else
  {
    [v11 messageViewControllerDidSelectCancel:self];
  }

  unsigned __int8 v14 = [v6 shouldAutomaticallyReportMetrics];
  if ((v14 & 1) == 0)
  {
    id v15 = objc_alloc((Class)AMSEngagement);
    v16 = +[BUBag defaultBag];
    id v17 = [v15 initWithBag:v16];
    [v17 handleDialogResult:v20];
  }
  objc_super v18 = [(BCMessageViewControllerProvider *)self viewController];
  v19 = BUProtocolCast();

  [v19 reportActionTriggered:v9];
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_17AC9C;
  v8[3] = &unk_2C3AF8;
  v8[4] = self;
  id v4 = a4;
  id v9 = v4;
  v5 = objc_retainBlock(v8);
  if (v5)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v5[2])(v5);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_17ACF0;
      block[3] = &unk_2C4280;
      v7 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (AMSDialogRequest)request
{
  return self->_request;
}

- (NSString)placement
{
  return self->_placement;
}

- (void)setPlacement:(id)a3
{
}

- (BCMessageViewControllerProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BCMessageViewControllerProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BAMessageData)messageData
{
  return self->_messageData;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int64_t)a3
{
  self->_messageType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_viewController, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end