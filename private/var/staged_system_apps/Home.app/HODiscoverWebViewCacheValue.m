@interface HODiscoverWebViewCacheValue
+ (id)valueWithWebView:(id)a3;
- (WKWebView)webView;
- (unint64_t)navigationState;
- (void)setNavigationState:(unint64_t)a3;
- (void)setWebView:(id)a3;
@end

@implementation HODiscoverWebViewCacheValue

+ (id)valueWithWebView:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(HODiscoverWebViewCacheValue);
  [(HODiscoverWebViewCacheValue *)v4 setWebView:v3];

  [(HODiscoverWebViewCacheValue *)v4 setNavigationState:0];

  return v4;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (unint64_t)navigationState
{
  return self->_navigationState;
}

- (void)setNavigationState:(unint64_t)a3
{
  self->_navigationState = a3;
}

- (void).cxx_destruct
{
}

@end