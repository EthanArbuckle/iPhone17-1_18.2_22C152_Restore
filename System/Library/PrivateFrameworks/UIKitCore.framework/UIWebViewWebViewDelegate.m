@interface UIWebViewWebViewDelegate
- (BOOL)webView:(id)a3 resource:(id)a4 canAuthenticateAgainstProtectionSpace:(id)a5 forDataSource:(id)a6;
- (BOOL)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5;
- (UIWebViewWebViewDelegate)initWithUIWebView:(id)a3;
- (id)webThreadWebView:(id)a3 resource:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6 fromDataSource:(id)a7;
- (id)webView:(id)a3 connectionPropertiesForResource:(id)a4 dataSource:(id)a5;
- (id)webView:(id)a3 createWebViewWithRequest:(id)a4;
- (id)webView:(id)a3 identifierForInitialRequest:(id)a4 fromDataSource:(id)a5;
- (id)webView:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 initiatedByFrame:(id)a6;
- (void)_clearUIWebView;
- (void)webView:(id)a3 decidePolicyForGeolocationRequestFromOrigin:(id)a4 frame:(id)a5 listener:(id)a6;
- (void)webView:(id)a3 decidePolicyForMIMEType:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7;
- (void)webView:(id)a3 decidePolicyForNewWindowAction:(id)a4 request:(id)a5 newFrameName:(id)a6 decisionListener:(id)a7;
- (void)webView:(id)a3 didChangeLocationWithinPageForFrame:(id)a4;
- (void)webView:(id)a3 didClearWindowObject:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 didCommitLoadForFrame:(id)a4;
- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 didFailProvisionalLoadWithError:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4;
- (void)webView:(id)a3 didFirstLayoutInFrame:(id)a4;
- (void)webView:(id)a3 didReceiveServerRedirectForProvisionalLoadForFrame:(id)a4;
- (void)webView:(id)a3 didReceiveTitle:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 didStartProvisionalLoadForFrame:(id)a4;
- (void)webView:(id)a3 exceededApplicationCacheOriginQuotaForSecurityOrigin:(id)a4 totalSpaceNeeded:(unint64_t)a5;
- (void)webView:(id)a3 frame:(id)a4 exceededDatabaseQuotaForSecurityOrigin:(id)a5 database:(id)a6;
- (void)webView:(id)a3 printFrameView:(id)a4;
- (void)webView:(id)a3 resource:(id)a4 didCancelAuthenticationChallenge:(id)a5 fromDataSource:(id)a6;
- (void)webView:(id)a3 resource:(id)a4 didFailLoadingWithError:(id)a5 fromDataSource:(id)a6;
- (void)webView:(id)a3 resource:(id)a4 didFinishLoadingFromDataSource:(id)a5;
- (void)webView:(id)a3 resource:(id)a4 didReceiveAuthenticationChallenge:(id)a5 fromDataSource:(id)a6;
- (void)webView:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 initiatedByFrame:(id)a5;
- (void)webView:(id)a3 unableToImplementPolicyWithError:(id)a4 frame:(id)a5;
- (void)webViewClose:(id)a3;
- (void)webViewSupportedOrientationsUpdated:(id)a3;
@end

@implementation UIWebViewWebViewDelegate

- (UIWebViewWebViewDelegate)initWithUIWebView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIWebViewWebViewDelegate;
  result = [(UIWebViewWebViewDelegate *)&v5 init];
  if (result) {
    result->uiWebView = (UIWebView *)a3;
  }
  return result;
}

- (id)webView:(id)a3 createWebViewWithRequest:(id)a4
{
  id v4 = [(UIWebView *)self->uiWebView _browserView];
  return (id)[v4 webView];
}

- (void)webView:(id)a3 decidePolicyForNewWindowAction:(id)a4 request:(id)a5 newFrameName:(id)a6 decisionListener:(id)a7
{
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
}

- (void)webView:(id)a3 unableToImplementPolicyWithError:(id)a4 frame:(id)a5
{
}

- (void)webView:(id)a3 frame:(id)a4 exceededDatabaseQuotaForSecurityOrigin:(id)a5 database:(id)a6
{
}

- (void)webView:(id)a3 exceededApplicationCacheOriginQuotaForSecurityOrigin:(id)a4 totalSpaceNeeded:(unint64_t)a5
{
}

- (void)webView:(id)a3 printFrameView:(id)a4
{
}

- (void)webView:(id)a3 didStartProvisionalLoadForFrame:(id)a4
{
}

- (void)webView:(id)a3 didCommitLoadForFrame:(id)a4
{
}

- (void)webView:(id)a3 didReceiveTitle:(id)a4 forFrame:(id)a5
{
}

- (void)webViewSupportedOrientationsUpdated:(id)a3
{
}

- (id)webView:(id)a3 connectionPropertiesForResource:(id)a4 dataSource:(id)a5
{
  return [(UIWebView *)self->uiWebView webView:a3 connectionPropertiesForResource:a4 dataSource:a5];
}

- (id)webThreadWebView:(id)a3 resource:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6 fromDataSource:(id)a7
{
  return [(UIWebView *)self->uiWebView webThreadWebView:a3 resource:a4 willSendRequest:a5 redirectResponse:a6 fromDataSource:a7];
}

- (void)webView:(id)a3 didClearWindowObject:(id)a4 forFrame:(id)a5
{
}

- (void)webView:(id)a3 didReceiveServerRedirectForProvisionalLoadForFrame:(id)a4
{
}

- (void)webView:(id)a3 didFailProvisionalLoadWithError:(id)a4 forFrame:(id)a5
{
}

- (void)webView:(id)a3 decidePolicyForMIMEType:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
}

- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4
{
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5
{
}

- (void)webView:(id)a3 didFirstLayoutInFrame:(id)a4
{
}

- (void)webViewClose:(id)a3
{
}

- (void)webView:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 initiatedByFrame:(id)a5
{
}

- (BOOL)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5
{
  return [(UIWebView *)self->uiWebView webView:a3 runJavaScriptConfirmPanelWithMessage:a4 initiatedByFrame:a5];
}

- (id)webView:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 initiatedByFrame:(id)a6
{
  return [(UIWebView *)self->uiWebView webView:a3 runJavaScriptTextInputPanelWithPrompt:a4 defaultText:a5 initiatedByFrame:a6];
}

- (void)webView:(id)a3 decidePolicyForGeolocationRequestFromOrigin:(id)a4 frame:(id)a5 listener:(id)a6
{
}

- (id)webView:(id)a3 identifierForInitialRequest:(id)a4 fromDataSource:(id)a5
{
  return [(UIWebView *)self->uiWebView webView:a3 identifierForInitialRequest:a4 fromDataSource:a5];
}

- (void)webView:(id)a3 resource:(id)a4 didFinishLoadingFromDataSource:(id)a5
{
}

- (void)webView:(id)a3 resource:(id)a4 didFailLoadingWithError:(id)a5 fromDataSource:(id)a6
{
}

- (void)webView:(id)a3 resource:(id)a4 didReceiveAuthenticationChallenge:(id)a5 fromDataSource:(id)a6
{
}

- (void)webView:(id)a3 resource:(id)a4 didCancelAuthenticationChallenge:(id)a5 fromDataSource:(id)a6
{
}

- (BOOL)webView:(id)a3 resource:(id)a4 canAuthenticateAgainstProtectionSpace:(id)a5 forDataSource:(id)a6
{
  return [(UIWebView *)self->uiWebView webView:a3 resource:a4 canAuthenticateAgainstProtectionSpace:a5 forDataSource:a6];
}

- (void)webView:(id)a3 didChangeLocationWithinPageForFrame:(id)a4
{
}

- (void)_clearUIWebView
{
  self->uiWebView = 0;
}

@end