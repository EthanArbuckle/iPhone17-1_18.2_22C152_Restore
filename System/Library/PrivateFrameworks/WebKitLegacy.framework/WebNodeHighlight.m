@interface WebNodeHighlight
- (NakedPtr<WebCore::InspectorController>)inspectorController;
- (WebNodeHighlight)initWithTargetView:(id)a3 inspectorController:(NakedPtr<WebCore::InspectorController>)a4;
- (id).cxx_construct;
- (id)delegate;
- (id)highlightView;
- (id)targetView;
- (void)attach;
- (void)dealloc;
- (void)detach;
- (void)setDelegate:(id)a3;
- (void)setNeedsDisplay;
@end

@implementation WebNodeHighlight

- (WebNodeHighlight)initWithTargetView:(id)a3 inspectorController:(NakedPtr<WebCore::InspectorController>)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WebNodeHighlight;
  v6 = [(WebNodeHighlight *)&v9 init];
  if (v6)
  {
    v6->_targetView = (WAKView *)a3;
    v6->_inspectorController.m_ptr = *(InspectorController **)a4.m_ptr;
    v6->_highlightView = [[WebNodeHighlightView alloc] initWithWebNodeHighlight:v6];
    v7 = [[WebHighlightLayer alloc] initWithHighlightView:v6->_highlightView webView:a3];
    v6->_highlightLayer = v7;
    objc_msgSend((id)-[WAKView window](v6->_targetView, "window"), "screenScale");
    -[WebHighlightLayer setContentsScale:](v7, "setContentsScale:");
    [(WebHighlightLayer *)v6->_highlightLayer setCanDrawConcurrently:0];
  }
  return v6;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WebNodeHighlight;
  [(WebNodeHighlight *)&v2 dealloc];
}

- (void)attach
{
  objc_msgSend((id)objc_msgSend((id)-[WAKView window](self->_targetView, "window"), "hostLayer"), "addSublayer:", self->_highlightLayer);
  [(WebNodeHighlight *)self setNeedsDisplay];
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id delegate = self->_delegate;
    [delegate didAttachWebNodeHighlight:self];
  }
}

- (id)delegate
{
  return self->_delegate;
}

- (void)detach
{
  if (self->_highlightLayer)
  {
    if (self->_delegate)
    {
      if (objc_opt_respondsToSelector()) {
        [self->_delegate willDetachWebNodeHighlight:self];
      }
    }
    [(WebHighlightLayer *)self->_highlightLayer removeFromSuperlayer];

    self->_highlightLayer = 0;
    self->_targetView = 0;
    [(WebNodeHighlightView *)self->_highlightView detachFromWebNodeHighlight];

    self->_highlightView = 0;
  }
}

- (id)highlightView
{
  return self->_highlightView;
}

- (void)setDelegate:(id)a3
{
  self->_id delegate = a3;
}

- (void)setNeedsDisplay
{
  [(WebHighlightLayer *)self->_highlightLayer setNeedsLayout];
  [(WebHighlightLayer *)self->_highlightLayer setNeedsDisplay];
  highlightLayer = self->_highlightLayer;
  [(WebHighlightLayer *)highlightLayer displayIfNeeded];
}

- (id)targetView
{
  return self->_targetView;
}

- (NakedPtr<WebCore::InspectorController>)inspectorController
{
  *objc_super v2 = self->_inspectorController.m_ptr;
  return (NakedPtr<WebCore::InspectorController>)self;
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  return self;
}

@end