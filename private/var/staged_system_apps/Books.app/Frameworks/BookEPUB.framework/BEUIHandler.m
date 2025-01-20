@interface BEUIHandler
- (BEUIHandlerDelegate)delegate;
- (BUBlockCallThrottler)alertThrottler;
- (id)_contextMenuHintPreviewContainerViewForWebView:(id)a3;
- (id)_webView:(id)a3 adjustedDataInteractionItemProvidersForItemProvider:(id)a4 representingObjects:(id)a5 additionalData:(id)a6;
- (void)_handleContextMenuConfigurationForElement:(id)a3 completionHandler:(id)a4;
- (void)_throttledRunJavaScriptAlertPanel:(id)a3;
- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5;
- (void)_webView:(id)a3 didNotHandleTapAsClickAtPoint:(CGPoint)a4;
- (void)_webView:(id)a3 requestGeolocationPermissionForFrame:(id)a4 decisionHandler:(id)a5;
- (void)_webViewDidEnterFullscreen:(id)a3;
- (void)_webViewDidExitFullscreen:(id)a3;
- (void)_webViewFullscreenMayReturnToInline:(id)a3;
- (void)buildMenuWithBuilder:(id)a3 inWebView:(id)a4 atPoint:(CGPoint)a5;
- (void)setAlertThrottler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5;
- (void)webView:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 initiatedByFrame:(id)a5 completionHandler:(id)a6;
- (void)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5 completionHandler:(id)a6;
@end

@implementation BEUIHandler

- (void)buildMenuWithBuilder:(id)a3 inWebView:(id)a4 atPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v11 = a3;
  id v9 = a4;
  v10 = [(BEUIHandler *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 buildMenuWithBuilder:v11 inWebView:v9 atPoint:x, y];
  }
}

- (void)webView:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 initiatedByFrame:(id)a5 completionHandler:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_2EF30;
  v10[3] = &unk_3C10C8;
  id v11 = a4;
  id v12 = a6;
  v10[4] = self;
  id v8 = v11;
  id v9 = v12;
  [(BEUIHandler *)self _throttledRunJavaScriptAlertPanel:v10];
}

- (void)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5 completionHandler:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_2F208;
  v10[3] = &unk_3C10C8;
  id v11 = a4;
  id v12 = a6;
  v10[4] = self;
  id v8 = v11;
  id v9 = v12;
  [(BEUIHandler *)self _throttledRunJavaScriptAlertPanel:v10];
}

- (void)webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5
{
}

- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5
{
}

- (void)_webView:(id)a3 requestGeolocationPermissionForFrame:(id)a4 decisionHandler:(id)a5
{
}

- (id)_webView:(id)a3 adjustedDataInteractionItemProvidersForItemProvider:(id)a4 representingObjects:(id)a5 additionalData:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [UTTypeImage identifier];
  unsigned __int8 v13 = [v10 hasItemConformingToTypeIdentifier:v12];

  if (v13)
  {
    id v14 = &__NSArray0__struct;
  }
  else
  {
    v15 = [(BEUIHandler *)self delegate];
    id v16 = v10;
    if (v11)
    {
      v17 = [UTTypeUTF8PlainText identifier];
      v18 = [v11 objectForKeyedSubscript:v17];

      id v19 = [objc_alloc((Class)NSString) initWithData:v18 encoding:4];
      if ([v19 length] && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v20 = [v15 handler:self citationForText:v19 webView:v9];
      }
      else
      {
        v20 = &stru_3D7B70;
      }
    }
    else
    {
      v20 = &stru_3D7B70;
    }
    if ([(__CFString *)v20 length] && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v24 = v16;
      v21 = +[NSArray arrayWithObjects:&v24 count:1];
      v22 = [v15 adjustedItemProvidersWithCitation:v21 withExcerptString:v20];
    }
    else
    {
      v22 = &__NSArray0__struct;
    }
    id v14 = v22;
  }

  return v14;
}

- (void)_webView:(id)a3 didNotHandleTapAsClickAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v13 = a3;
  v7 = [(BEUIHandler *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v13 be_contentView];
    [v8 convertPoint:v13 toView:x, y];
    double v10 = v9;
    double v12 = v11;

    [v7 handler:self webView:v13 didNotHandleTapAsClickAtPoint:v10 v12];
  }
}

- (void)_webViewDidEnterFullscreen:(id)a3
{
  id v5 = a3;
  v4 = [(BEUIHandler *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 webViewDidEnterFullscreen:v5];
  }
}

- (void)_webViewDidExitFullscreen:(id)a3
{
  id v5 = a3;
  v4 = [(BEUIHandler *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 webViewDidExitFullscreen:v5];
  }
}

- (void)_webViewFullscreenMayReturnToInline:(id)a3
{
  id v5 = a3;
  v4 = [(BEUIHandler *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 webViewFullscreenMayReturnToInline:v5];
  }
}

- (id)_contextMenuHintPreviewContainerViewForWebView:(id)a3
{
  return [a3 window];
}

- (BUBlockCallThrottler)alertThrottler
{
  alertThrottler = self->_alertThrottler;
  if (!alertThrottler)
  {
    v4 = (BUBlockCallThrottler *)objc_alloc_init((Class)BUBlockCallThrottler);
    id v5 = self->_alertThrottler;
    self->_alertThrottler = v4;

    alertThrottler = self->_alertThrottler;
  }

  return alertThrottler;
}

- (void)_throttledRunJavaScriptAlertPanel:(id)a3
{
  id v4 = a3;
  id v5 = [(BEUIHandler *)self alertThrottler];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_2FB1C;
  v9[3] = &unk_3C10F0;
  id v6 = v4;
  id v10 = v6;
  LOBYTE(v4) = [v5 runBlockThrottled:v9];

  if ((v4 & 1) == 0)
  {
    v7 = _BookEPUBLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&def_7BFC0, v7, OS_LOG_TYPE_ERROR, "Suppressed JS alert panels", v8, 2u);
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void)_handleContextMenuConfigurationForElement:(id)a3 completionHandler:(id)a4
{
  double v11 = (void (**)(id, void *))a4;
  id v5 = a3;
  id v6 = [v5 linkURL];
  v7 = [v5 _activatedElementInfo];

  id v8 = (char *)[v7 type];
  if (v8)
  {
    if (v8 == (unsigned char *)&def_7BFC0 + 1)
    {
      double v9 = 0;
LABEL_6:
      id v10 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v9];
      goto LABEL_8;
    }
  }
  else if (BEURLHandlerSchemeIsOkForBookToLoad(v6))
  {
    double v9 = &stru_3C1130;
    goto LABEL_6;
  }
  id v10 = 0;
LABEL_8:
  v11[2](v11, v10);
}

- (BEUIHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BEUIHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setAlertThrottler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertThrottler, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end