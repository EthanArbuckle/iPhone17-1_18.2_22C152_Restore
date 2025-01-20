@interface WebHighlightLayer
- (WebHighlightLayer)initWithHighlightView:(id)a3 webView:(id)a4;
- (id)actionForKey:(id)a3;
- (void)layoutSublayers;
@end

@implementation WebHighlightLayer

- (WebHighlightLayer)initWithHighlightView:(id)a3 webView:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)WebHighlightLayer;
  result = [(WebHighlightLayer *)&v7 init];
  if (result)
  {
    result->_view = (WebNodeHighlightView *)a3;
    result->_webView = (WebView *)a4;
  }
  return result;
}

- (void)layoutSublayers
{
  objc_msgSend(-[WebFrame documentView](-[WebView mainFrame](self->_webView, "mainFrame"), "documentView"), "scale");
  CATransform3DMakeScale(&v4, v3, v3, 1.0);
  [(WebHighlightLayer *)self setTransform:&v4];
  [(WebNodeHighlightView *)self->_view layoutSublayers:self];
}

- (id)actionForKey:(id)a3
{
  return 0;
}

@end