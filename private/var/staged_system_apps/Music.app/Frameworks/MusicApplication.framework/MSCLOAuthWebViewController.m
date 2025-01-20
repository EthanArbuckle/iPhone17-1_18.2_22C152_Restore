@interface MSCLOAuthWebViewController
- (BOOL)isAuthenticating;
- (MSCLOAuthWebViewController)initWithAuthURL:(id)a3 redirectURL:(id)a4;
- (NSURL)authURL;
- (NSURL)interceptedRedirectURL;
- (NSURL)redirectURL;
- (UIActivityIndicatorView)activityIndicator;
- (WKWebView)webView;
- (id)completionBlock;
- (void)_endAuthenticationWithError:(id)a3;
- (void)cancelAuthentication;
- (void)setActivityIndicator:(id)a3;
- (void)setAuthenticating:(BOOL)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setInterceptedRedirectURL:(id)a3;
- (void)setWebView:(id)a3;
- (void)startAuthentication;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4;
@end

@implementation MSCLOAuthWebViewController

- (MSCLOAuthWebViewController)initWithAuthURL:(id)a3 redirectURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MSCLOAuthWebViewController;
  v8 = [(MSCLOAuthWebViewController *)&v14 init];
  if (v8)
  {
    v9 = (NSURL *)[v6 copy];
    authURL = v8->_authURL;
    v8->_authURL = v9;

    v11 = (NSURL *)[v7 copy];
    redirectURL = v8->_redirectURL;
    v8->_redirectURL = v11;
  }
  return v8;
}

- (void)cancelAuthentication
{
  [(WKWebView *)self->_webView stopLoading];
  id v3 = +[NSError errorWithDomain:@"MSCLOAuthErrorDomain" code:1 userInfo:0];
  [(MSCLOAuthWebViewController *)self _endAuthenticationWithError:v3];
}

- (void)startAuthentication
{
  if (!self->_authenticating)
  {
    [(MSCLOAuthWebViewController *)self loadViewIfNeeded];
    id v3 = +[NSHTTPCookieStorage sharedHTTPCookieStorage];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v4 = [v3 cookiesForURL:self->_authURL];
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 deleteCookie:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        }
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    v9 = +[NSURLRequest requestWithURL:self->_authURL cachePolicy:1 timeoutInterval:30.0];
    id v10 = [(WKWebView *)self->_webView loadRequest:v9];
    [(MSCLOAuthWebViewController *)self setAuthenticating:1];
  }
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)MSCLOAuthWebViewController;
  [(MSCLOAuthWebViewController *)&v13 viewDidLayoutSubviews];
  id v3 = [(MSCLOAuthWebViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[WKWebView setFrame:](self->_webView, "setFrame:", v5, v7, v9, v11);
  -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", v5, v7, v9, v11);
  long long v12 = [(MSCLOAuthWebViewController *)self view];
  [v12 bringSubviewToFront:self->_activityIndicator];
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)MSCLOAuthWebViewController;
  [(MSCLOAuthWebViewController *)&v17 viewDidLoad];
  id v3 = [(MSCLOAuthWebViewController *)self view];
  double v4 = +[UIColor whiteColor];
  [v3 setBackgroundColor:v4];

  id v5 = objc_alloc((Class)WKWebView);
  double v6 = [(MSCLOAuthWebViewController *)self view];
  [v6 bounds];
  double v7 = [v5 initWithFrame:];

  [(WKWebView *)v7 setNavigationDelegate:self];
  double v8 = [(MSCLOAuthWebViewController *)self view];
  [v8 addSubview:v7];

  double v9 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  [(UIActivityIndicatorView *)v9 setHidesWhenStopped:1];
  double v10 = [(MSCLOAuthWebViewController *)self view];
  [v10 addSubview:v9];

  webView = self->_webView;
  self->_webView = v7;
  long long v12 = v7;

  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v9;
  long long v14 = v9;

  v15 = [(MSCLOAuthWebViewController *)self navigationItem];
  id v16 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancelAuthentication"];

  [v15 setLeftBarButtonItem:v16];
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  if (!self->_interceptedRedirectURL) {
    -[MSCLOAuthWebViewController _endAuthenticationWithError:](self, "_endAuthenticationWithError:", a5, a4);
  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  v20 = (void (**)(id, uint64_t))a5;
  double v7 = [a4 request];
  double v8 = [v7 URL];

  double v9 = [v8 host];
  double v10 = [v9 lowercaseString];

  double v11 = [v8 path];
  long long v12 = [v11 lowercaseString];

  objc_super v13 = [(NSURL *)self->_redirectURL host];
  long long v14 = [v13 lowercaseString];

  v15 = [(NSURL *)self->_redirectURL path];
  id v16 = [v15 lowercaseString];

  if ([v10 isEqualToString:v14]
    && [v12 isEqualToString:v16])
  {
    objc_super v17 = (NSURL *)[v8 copy];
    interceptedRedirectURL = self->_interceptedRedirectURL;
    self->_interceptedRedirectURL = v17;

    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = 1;
  }
  v20[2](v20, v19);
  if (self->_interceptedRedirectURL) {
    [(MSCLOAuthWebViewController *)self _endAuthenticationWithError:0];
  }
}

- (void)_endAuthenticationWithError:(id)a3
{
  id v8 = a3;
  [(MSCLOAuthWebViewController *)self setAuthenticating:0];
  double v4 = [(MSCLOAuthWebViewController *)self completionBlock];
  if (v4)
  {
    id v5 = v8;
    double v6 = v5;
    if (!v5)
    {
      if (self->_interceptedRedirectURL)
      {
        double v6 = 0;
      }
      else
      {
        double v6 = +[NSError errorWithDomain:@"MSCLOAuthErrorDomain" code:0 userInfo:0];
      }
    }
    id v7 = [(NSURL *)self->_interceptedRedirectURL copy];
    ((void (**)(void, id, id))v4)[2](v4, v7, v5);
  }
}

- (NSURL)authURL
{
  return self->_authURL;
}

- (NSURL)redirectURL
{
  return self->_redirectURL;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (BOOL)isAuthenticating
{
  return self->_authenticating;
}

- (void)setAuthenticating:(BOOL)a3
{
  self->_authenticating = a3;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (NSURL)interceptedRedirectURL
{
  return self->_interceptedRedirectURL;
}

- (void)setInterceptedRedirectURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interceptedRedirectURL, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_redirectURL, 0);

  objc_storeStrong((id *)&self->_authURL, 0);
}

@end