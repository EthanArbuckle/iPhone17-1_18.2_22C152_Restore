@interface WebDefaultUIDelegate
+ (id)sharedUIDelegate;
- (BOOL)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5;
- (BOOL)webViewAreToolbarsVisible:(id)a3;
- (BOOL)webViewIsResizable:(id)a3;
- (BOOL)webViewIsStatusBarVisible:(id)a3;
- (CGRect)webViewFrame:(id)a3;
- (id)webView:(id)a3 createWebViewWithRequest:(id)a4 userGesture:(BOOL)a5;
- (id)webView:(id)a3 createWebViewWithRequest:(id)a4 windowFeatures:(id)a5;
- (id)webView:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 initiatedByFrame:(id)a6;
- (id)webViewFirstResponder:(id)a3;
- (id)webViewStatusText:(id)a3;
- (unint64_t)webView:(id)a3 dragDestinationActionMaskForSession:(id)a4;
- (void)webView:(id)a3 makeFirstResponder:(id)a4;
@end

@implementation WebDefaultUIDelegate

+ (id)sharedUIDelegate
{
  if (_MergedGlobals_13 == 1) {
    return (id)qword_1EB3A9740;
  }
  id result = objc_alloc_init(WebDefaultUIDelegate);
  qword_1EB3A9740 = (uint64_t)result;
  _MergedGlobals_13 = 1;
  return result;
}

- (id)webView:(id)a3 createWebViewWithRequest:(id)a4 windowFeatures:(id)a5
{
  [a3 UIDelegate];
  if (objc_opt_respondsToSelector()) {
    return 0;
  }
  [a3 UIDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  v7 = (void *)[a3 UIDelegate];
  return (id)[v7 webView:a3 createWebViewWithRequest:a4];
}

- (id)webView:(id)a3 createWebViewWithRequest:(id)a4 userGesture:(BOOL)a5
{
  return 0;
}

- (id)webViewFirstResponder:(id)a3
{
  v3 = (void *)[a3 window];
  return (id)[v3 firstResponder];
}

- (void)webView:(id)a3 makeFirstResponder:(id)a4
{
  v5 = (void *)[a3 window];
  [v5 makeFirstResponder:a4];
}

- (id)webViewStatusText:(id)a3
{
  return 0;
}

- (BOOL)webViewAreToolbarsVisible:(id)a3
{
  return 0;
}

- (BOOL)webViewIsStatusBarVisible:(id)a3
{
  return 0;
}

- (BOOL)webViewIsResizable:(id)a3
{
  return 0;
}

- (CGRect)webViewFrame:(id)a3
{
  v3 = (void *)[a3 window];
  if (v3)
  {
    [v3 frame];
  }
  else
  {
    double v4 = *MEMORY[0x1E4F28AD8];
    double v5 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (BOOL)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5
{
  return 0;
}

- (id)webView:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 initiatedByFrame:(id)a6
{
  return 0;
}

- (unint64_t)webView:(id)a3 dragDestinationActionMaskForSession:(id)a4
{
  return 4294967291;
}

@end