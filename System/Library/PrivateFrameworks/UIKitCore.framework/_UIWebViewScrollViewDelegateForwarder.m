@interface _UIWebViewScrollViewDelegateForwarder
- (BOOL)respondsToSelector:(SEL)a3;
- (UIScrollViewDelegate)delegate;
- (UIWebView)webView;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWebView:(id)a3;
@end

@implementation _UIWebViewScrollViewDelegateForwarder

- (id)methodSignatureForSelector:(SEL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIWebViewScrollViewDelegateForwarder;
  id result = -[_UIWebViewScrollViewDelegateForwarder methodSignatureForSelector:](&v6, sel_methodSignatureForSelector_);
  if (!result)
  {
    id result = (id)[(UIWebView *)self->_webView methodSignatureForSelector:a3];
    if (!result) {
      return (id)[(UIScrollViewDelegate *)self->_delegate methodSignatureForSelector:a3];
    }
  }
  return result;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIWebViewScrollViewDelegateForwarder;
  if (-[_UIWebViewScrollViewDelegateForwarder respondsToSelector:](&v5, sel_respondsToSelector_)
    || (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v3 = 1;
  }
  else
  {
    char v3 = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

- (void)forwardInvocation:(id)a3
{
  [a3 selector];
  char v5 = objc_opt_respondsToSelector();
  if (v5) {
    [a3 invokeWithTarget:self->_webView];
  }
  [a3 selector];
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [a3 invokeWithTarget:delegate];
  }
  else if ((v5 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIWebViewScrollViewDelegateForwarder;
    [(_UIWebViewScrollViewDelegateForwarder *)&v7 forwardInvocation:a3];
  }
}

- (UIScrollViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (UIScrollViewDelegate *)a3;
}

- (UIWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  self->_webView = (UIWebView *)a3;
}

@end