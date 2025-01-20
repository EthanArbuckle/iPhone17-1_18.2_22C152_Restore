@interface UIWebRotatingAlertController
- (BOOL)presentSheet;
- (UIWebRotatingAlertController)initWithUIWebDocumentView:(id)a3;
- (void)_disableWebView;
- (void)_enableWebView;
- (void)dealloc;
- (void)doneWithSheet;
@end

@implementation UIWebRotatingAlertController

- (UIWebRotatingAlertController)initWithUIWebDocumentView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIWebRotatingAlertController;
  v6 = [(_UIRotatingAlertController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_webBrowserView, a3);
  }

  return v7;
}

- (void)_disableWebView
{
  WebThreadLock();
  v3 = [(UIWebDocumentView *)self->_webBrowserView webView];
  v4 = [v3 mainFrame];
  [v4 setTimeoutsPaused:1];

  id v5 = [(UIWebDocumentView *)self->_webBrowserView webView];
  self->_wasDeferringCallbacks = [v5 defersCallbacks];

  id v6 = [(UIWebDocumentView *)self->_webBrowserView webView];
  [v6 setDefersCallbacks:1];
}

- (void)_enableWebView
{
  WebThreadLock();
  v3 = [(UIWebDocumentView *)self->_webBrowserView webView];
  v4 = [v3 mainFrame];
  [v4 setTimeoutsPaused:0];

  id v5 = [(UIWebDocumentView *)self->_webBrowserView webView];
  [v5 setDefersCallbacks:self->_wasDeferringCallbacks];
}

- (void)dealloc
{
  [(UIWebRotatingAlertController *)self _enableWebView];
  v3.receiver = self;
  v3.super_class = (Class)UIWebRotatingAlertController;
  [(_UIRotatingAlertController *)&v3 dealloc];
}

- (void)doneWithSheet
{
  [(UIWebRotatingAlertController *)self _enableWebView];
  webBrowserView = self->_webBrowserView;
  self->_webBrowserView = 0;

  v4.receiver = self;
  v4.super_class = (Class)UIWebRotatingAlertController;
  [(_UIRotatingAlertController *)&v4 doneWithSheet];
}

- (BOOL)presentSheet
{
  [(UIWebRotatingAlertController *)self _disableWebView];
  v4.receiver = self;
  v4.super_class = (Class)UIWebRotatingAlertController;
  return [(_UIRotatingAlertController *)&v4 presentSheet];
}

- (void).cxx_destruct
{
}

@end