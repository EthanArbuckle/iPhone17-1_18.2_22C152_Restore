@interface SWWeakURLSchemeHandler
- (SWWeakURLSchemeHandler)initWithURLSchemeHandler:(id)a3;
- (WKURLSchemeHandler)URLSchemeHandler;
- (void)webView:(id)a3 startURLSchemeTask:(id)a4;
- (void)webView:(id)a3 stopURLSchemeTask:(id)a4;
@end

@implementation SWWeakURLSchemeHandler

- (SWWeakURLSchemeHandler)initWithURLSchemeHandler:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SWWeakURLSchemeHandler;
  v5 = [(SWWeakURLSchemeHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_URLSchemeHandler, v4);
  }

  return v6;
}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SWWeakURLSchemeHandler *)self URLSchemeHandler];
  [v8 webView:v7 startURLSchemeTask:v6];
}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SWWeakURLSchemeHandler *)self URLSchemeHandler];
  [v8 webView:v7 stopURLSchemeTask:v6];
}

- (WKURLSchemeHandler)URLSchemeHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_URLSchemeHandler);
  return (WKURLSchemeHandler *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end