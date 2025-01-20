@interface WebNodeHighlighter
- (WebNodeHighlighter)initWithInspectedWebView:(id)a3;
- (void)dealloc;
- (void)didAttachWebNodeHighlight:(id)a3;
- (void)hideHighlight;
- (void)highlight;
- (void)willDetachWebNodeHighlight:(id)a3;
@end

@implementation WebNodeHighlighter

- (WebNodeHighlighter)initWithInspectedWebView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WebNodeHighlighter;
  result = [(WebNodeHighlighter *)&v5 init];
  if (result) {
    result->_inspectedWebView = (WebView *)a3;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WebNodeHighlighter;
  [(WebNodeHighlighter *)&v2 dealloc];
}

- (void)highlight
{
  inspectedWebView = self->_inspectedWebView;
  if ([inspectedWebView window])
  {
    currentHighlight = self->_currentHighlight;
    if (currentHighlight)
    {
      [(WebNodeHighlight *)currentHighlight setNeedsDisplay];
    }
    else
    {
      objc_super v5 = [WebNodeHighlight alloc];
      [self->_inspectedWebView page];
      uint64_t v8 = *(void *)(v7 + 80);
      v6 = [(WebNodeHighlight *)v5 initWithTargetView:inspectedWebView inspectorController:&v8];
      self->_currentHighlight = v6;
      [(WebNodeHighlight *)v6 setDelegate:self];
      [(WebNodeHighlight *)self->_currentHighlight attach];
    }
  }
}

- (void)hideHighlight
{
  self->_currentHighlight = 0;
}

- (void)didAttachWebNodeHighlight:(id)a3
{
}

- (void)willDetachWebNodeHighlight:(id)a3
{
}

@end