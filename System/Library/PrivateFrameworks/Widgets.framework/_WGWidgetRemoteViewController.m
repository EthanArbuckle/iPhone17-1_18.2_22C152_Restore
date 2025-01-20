@interface _WGWidgetRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)__shouldRemoteViewControllerFenceOperations;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isValid;
- (BOOL)_serviceHasScrollToTopView;
- (OS_dispatch_queue)managingHostQueue;
- (WGWidgetHostingViewController)managingHost;
- (_WGWidgetRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)disconnect;
- (void)__closeTransactionForAppearanceCallWithState:(int)a3 withIdentifier:(id)a4;
- (void)__requestPreferredViewHeight:(double)a3;
- (void)__setLargestAvailableDisplayMode:(int64_t)a3;
- (void)_openTransactionForAppearanceCallWithState:(int)a3 withIdentifier:(id)a4;
- (void)_performUpdateWithReplyHandler:(id)a3;
- (void)_requestEncodedLayerTreeAtURL:(id)a3 withReplyHandler:(id)a4;
- (void)_setActiveDisplayMode:(int64_t)a3;
- (void)_setMaximumSize:(CGSize)a3 forDisplayMode:(int64_t)a4;
- (void)_setValid:(BOOL)a3;
- (void)_updateLayoutMargins:(UIEdgeInsets)a3;
- (void)_updateVisibilityState:(int64_t)a3;
- (void)_updateVisibleFrame:(CGRect)a3 withReplyHandler:(id)a4;
- (void)dealloc;
- (void)setManagingHost:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation _WGWidgetRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D617BD8];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D60D848];
}

- (_WGWidgetRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_WGWidgetRemoteViewController;
  v4 = [(_WGWidgetRemoteViewController *)&v9 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = (char *)QueueName(@"com.apple.widgets.managinghostqueue", 0);
    uint64_t v6 = NewSerialQueue(v5);
    managingHostQueue = v4->_managingHostQueue;
    v4->_managingHostQueue = (OS_dispatch_queue *)v6;

    SuspendQueueIfNecessary(v4->_managingHostQueue);
  }
  return v4;
}

- (void)dealloc
{
  InvalidateQueue(self->_managingHostQueue);
  v3.receiver = self;
  v3.super_class = (Class)_WGWidgetRemoteViewController;
  [(_UIRemoteViewController *)&v3 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)disconnect
{
  self->_valid = 0;
  v4.receiver = self;
  v4.super_class = (Class)_WGWidgetRemoteViewController;
  v2 = [(_UIRemoteViewController *)&v4 disconnect];
  return v2;
}

- (BOOL)__shouldRemoteViewControllerFenceOperations
{
  return 0;
}

- (BOOL)_serviceHasScrollToTopView
{
  return 0;
}

- (void)setManagingHost:(id)a3
{
  objc_storeWeak((id *)&self->_managingHost, a3);
  managingHostQueue = self->_managingHostQueue;
  if (a3)
  {
    ResumeQueueIfNecessary(managingHostQueue);
  }
  else
  {
    SuspendQueueIfNecessary(managingHostQueue);
  }
}

- (void)_setActiveDisplayMode:(int64_t)a3
{
  id v4 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  objc_msgSend(v4, "__setActiveDisplayMode:", a3);
}

- (void)_setMaximumSize:(CGSize)a3 forDisplayMode:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  objc_msgSend(v7, "__setMaximumSize:forDisplayMode:", a4, width, height);
}

- (void)_openTransactionForAppearanceCallWithState:(int)a3 withIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  objc_msgSend(v7, "__openTransactionForAppearanceCallWithState:withIdentifier:", v4, v6);
}

- (void)_requestEncodedLayerTreeAtURL:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80___WGWidgetRemoteViewController__requestEncodedLayerTreeAtURL_withReplyHandler___block_invoke;
  v11[3] = &unk_264677CF8;
  id v12 = v6;
  id v7 = v6;
  id v8 = a3;
  objc_super v9 = [(_UIRemoteViewController *)self serviceViewControllerProxyWithErrorHandler:v11];
  if (_WGSupportsASTC()) {
    v10 = @"com.apple.atx";
  }
  else {
    v10 = 0;
  }
  objc_msgSend(v9, "__requestEncodedLayerTreeToURL:withCodingImageFormat:withReplyHandler:", v8, v10, v7);
}

- (void)_performUpdateWithReplyHandler:(id)a3
{
  id v4 = a3;
  objc_copyWeak(&to, (id *)&self->_managingHost);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64___WGWidgetRemoteViewController__performUpdateWithReplyHandler___block_invoke;
  v7[3] = &unk_264677D20;
  id v5 = v4;
  id v8 = v5;
  objc_copyWeak(&v9, &to);
  id v6 = [(_UIRemoteViewController *)self serviceViewControllerProxyWithErrorHandler:v7];
  objc_msgSend(v6, "__performUpdateWithReplyHandler:", v5);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&to);
}

- (void)_updateVisibilityState:(int64_t)a3
{
  id v4 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  objc_msgSend(v4, "__updateVisibilityState:", a3);
}

- (void)_updateVisibleFrame:(CGRect)a3 withReplyHandler:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  objc_copyWeak(&to, (id *)&self->_managingHost);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __70___WGWidgetRemoteViewController__updateVisibleFrame_withReplyHandler___block_invoke;
  v12[3] = &unk_264677D20;
  id v10 = v9;
  id v13 = v10;
  objc_copyWeak(&v14, &to);
  v11 = [(_UIRemoteViewController *)self serviceViewControllerProxyWithErrorHandler:v12];
  objc_msgSend(v11, "__updateVisibleFrame:withReplyHandler:", v10, x, y, width, height);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&to);
}

- (void)_updateLayoutMargins:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  id v8 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  v10.CGFloat top = top;
  v10.CGFloat left = left;
  v10.CGFloat bottom = bottom;
  v10.CGFloat right = right;
  id v7 = NSStringFromUIEdgeInsets(v10);
  objc_msgSend(v8, "__updateLayoutMargins:", v7);
}

- (void)__requestPreferredViewHeight:(double)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_managingHost);
  id v6 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [WeakRetained widgetIdentifier];
    id v9 = [WeakRetained _containerIdentifier];
    *(_DWORD *)buf = 138544130;
    v16 = v8;
    __int16 v17 = 2050;
    id v18 = WeakRetained;
    __int16 v19 = 2114;
    v20 = v9;
    __int16 v21 = 2048;
    double v22 = a3;
    _os_log_impl(&dword_222E49000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Client asked to set a preferred height: %.2f",
      buf,
      0x2Au);
  }
  managingHostQueue = self->_managingHostQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62___WGWidgetRemoteViewController___requestPreferredViewHeight___block_invoke;
  v12[3] = &unk_264676D68;
  id v13 = WeakRetained;
  double v14 = a3;
  id v11 = WeakRetained;
  dispatch_async(managingHostQueue, v12);
}

- (void)__setLargestAvailableDisplayMode:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_managingHost);
  id v6 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [WeakRetained widgetIdentifier];
    id v9 = [WeakRetained _containerIdentifier];
    UIEdgeInsets v10 = NCStringFromWidgetDisplayMode();
    *(_DWORD *)buf = 138544130;
    __int16 v17 = v8;
    __int16 v18 = 2050;
    id v19 = WeakRetained;
    __int16 v20 = 2114;
    __int16 v21 = v9;
    __int16 v22 = 2114;
    uint64_t v23 = v10;
    _os_log_impl(&dword_222E49000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Asked to set largest available display mode to '%{public}@'",
      buf,
      0x2Au);
  }
  managingHostQueue = self->_managingHostQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66___WGWidgetRemoteViewController___setLargestAvailableDisplayMode___block_invoke;
  v13[3] = &unk_264676D68;
  id v14 = WeakRetained;
  int64_t v15 = a3;
  id v12 = WeakRetained;
  dispatch_async(managingHostQueue, v13);
}

- (void)__closeTransactionForAppearanceCallWithState:(int)a3 withIdentifier:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_managingHost);
  id v8 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    UIEdgeInsets v10 = [WeakRetained widgetIdentifier];
    id v11 = [WeakRetained _containerIdentifier];
    id v12 = WGStringForAppearState(a3);
    *(_DWORD *)buf = 138544386;
    __int16 v20 = v10;
    __int16 v21 = 2050;
    id v22 = WeakRetained;
    __int16 v23 = 2114;
    uint64_t v24 = v11;
    __int16 v25 = 2114;
    v26 = v12;
    __int16 v27 = 2114;
    id v28 = v6;
    _os_log_impl(&dword_222E49000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Asked to close appearance transaction with state '%{public}@' and "
      "identifier '%{public}@'",
      buf,
      0x34u);
  }
  managingHostQueue = self->_managingHostQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __93___WGWidgetRemoteViewController___closeTransactionForAppearanceCallWithState_withIdentifier___block_invoke;
  v16[3] = &unk_264676680;
  id v17 = WeakRetained;
  id v18 = v6;
  id v14 = v6;
  id v15 = WeakRetained;
  dispatch_async(managingHostQueue, v16);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_managingHost);
  objc_initWeak(&location, self);
  managingHostQueue = self->_managingHostQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66___WGWidgetRemoteViewController_viewServiceDidTerminateWithError___block_invoke;
  v9[3] = &unk_264677D48;
  id v10 = WeakRetained;
  id v7 = WeakRetained;
  objc_copyWeak(&v12, &location);
  id v11 = v4;
  id v8 = v4;
  dispatch_async(managingHostQueue, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)managingHostQueue
{
  return self->_managingHostQueue;
}

- (WGWidgetHostingViewController)managingHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_managingHost);
  return (WGWidgetHostingViewController *)WeakRetained;
}

- (BOOL)_isValid
{
  return self->_valid;
}

- (void)_setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_managingHost);
  objc_storeStrong((id *)&self->_managingHostQueue, 0);
}

@end