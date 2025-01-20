@interface WebIndicateLayer
- (WebIndicateLayer)initWithWebView:(id)a3;
- (id)actionForKey:(id)a3;
- (void)layoutSublayers;
@end

@implementation WebIndicateLayer

- (WebIndicateLayer)initWithWebView:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WebIndicateLayer;
  v4 = [(WebIndicateLayer *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_webView = (WebView *)a3;
    [(WebIndicateLayer *)v4 setCanDrawConcurrently:0];
    objc_msgSend((id)-[WebView window](v5->_webView, "window"), "screenScale");
    -[WebIndicateLayer setContentsScale:](v5, "setContentsScale:");
    WebCore::cachedCGColor();
    [(WebIndicateLayer *)v5 setBackgroundColor:cf];
    if (cf) {
      CFRelease(cf);
    }
  }
  return v5;
}

- (void)layoutSublayers
{
  objc_msgSend(-[WebFrame documentView](-[WebView mainFrame](self->_webView, "mainFrame"), "documentView"), "scale");
  CATransform3DMakeScale(&v4, v3, v3, 1.0);
  [(WebIndicateLayer *)self setTransform:&v4];
  [(WebView *)self->_webView frame];
  -[WebIndicateLayer setFrame:](self, "setFrame:");
}

- (id)actionForKey:(id)a3
{
  return 0;
}

@end