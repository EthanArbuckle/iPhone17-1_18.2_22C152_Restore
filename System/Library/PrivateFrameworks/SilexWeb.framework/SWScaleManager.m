@interface SWScaleManager
- (SWScaleManager)initWithWebView:(id)a3 scale:(double)a4;
- (WKWebView)webView;
- (double)scale;
- (void)setScale:(double)a3;
@end

@implementation SWScaleManager

- (SWScaleManager)initWithWebView:(id)a3 scale:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SWScaleManager;
  v8 = [(SWScaleManager *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_webView, a3);
    [(SWScaleManager *)v9 setScale:a4];
  }

  return v9;
}

- (void)setScale:(double)a3
{
}

- (double)scale
{
  [(WKWebView *)self->_webView _viewScale];
  return result;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void).cxx_destruct
{
}

@end