@interface UIWebOverflowScrollView
- (BOOL)fixUpViewAfterInsertion;
- (BOOL)isBeingRemoved;
- (CALayer)webLayer;
- (DOMNode)node;
- (UIWebBrowserView)webBrowserView;
- (UIWebOverflowContentView)overflowContentView;
- (UIWebOverflowScrollListener)scrollListener;
- (UIWebOverflowScrollView)initWithLayer:(id)a3 node:(id)a4 webBrowserView:(id)a5;
- (id)superview;
- (void)dealloc;
- (void)replaceLayer:(id)a3;
- (void)setBeingRemoved:(BOOL)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setNode:(id)a3;
- (void)setOverflowContentView:(id)a3;
- (void)setScrollListener:(id)a3;
- (void)setWebBrowserView:(id)a3;
- (void)setWebLayer:(id)a3;
- (void)willBeRemoved;
@end

@implementation UIWebOverflowScrollView

- (UIWebOverflowScrollView)initWithLayer:(id)a3 node:(id)a4 webBrowserView:(id)a5
{
  [a3 bounds];
  v12.receiver = self;
  v12.super_class = (Class)UIWebOverflowScrollView;
  v9 = -[UIScrollView initWithFrame:](&v12, sel_initWithFrame_);
  v10 = v9;
  if (v9)
  {
    [(UIWebOverflowScrollView *)v9 replaceLayer:a3];
    v10->_webBrowserView = (UIWebBrowserView *)a5;
    v10->_scrollListener = [[UIWebOverflowScrollListener alloc] initWithScrollView:v10];
    [(UIWebOverflowScrollView *)v10 setNode:a4];
    [(UIScrollView *)v10 setDirectionalLockEnabled:1];
    [(UIScrollView *)v10 setScrollsToTop:0];
    [(UIScrollView *)v10 setContentInsetAdjustmentBehavior:2];
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UIWebOverflowScrollView;
  [(UIScrollView *)&v3 dealloc];
}

- (void)replaceLayer:(id)a3
{
  -[UIView _replaceLayer:](self, "_replaceLayer:");
  [(UIWebOverflowScrollView *)self setWebLayer:a3];
}

- (void)willBeRemoved
{
}

- (id)superview
{
  objc_super v3 = [(CALayer *)[(UIView *)self layer] superlayer];
  if (v3)
  {
    v4 = v3;
    while (1)
    {
      if ([(CALayer *)v4 delegate])
      {
        [(CALayer *)v4 delegate];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
      }
      v4 = [(CALayer *)v4 superlayer];
      if (!v4) {
        goto LABEL_6;
      }
    }
    return [(CALayer *)v4 delegate];
  }
  else
  {
LABEL_6:
    if (self->_beingRemoved) {
      return self->_webBrowserView;
    }
    else {
      return 0;
    }
  }
}

- (BOOL)fixUpViewAfterInsertion
{
  id v3 = [(UIWebOverflowScrollView *)self superview];
  if (v3)
  {
    -[UIView _webCustomViewWasAddedAsSubviewOfView:](self, [(UIWebOverflowScrollView *)self superview]);
    BOOL v4 = ([+[UIDevice currentDevice] userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) == 1&& [(UIWebOverflowScrollView *)self superview] == self->_webBrowserView;
    [(UIScrollView *)self setScrollsToTop:v4];
    [(UIView *)self _invalidateSubviewCache];
  }
  return v3 != 0;
}

- (void)setContentOffset:(CGPoint)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIWebOverflowScrollView;
  -[UIScrollView setContentOffset:](&v4, sel_setContentOffset_, a3.x, a3.y);
  [(UIWebBrowserView *)self->_webBrowserView _overflowScrollView:self scrollOffsetChangedForNode:self->_node whileScrolling:1];
}

- (UIWebBrowserView)webBrowserView
{
  return self->_webBrowserView;
}

- (void)setWebBrowserView:(id)a3
{
  self->_webBrowserView = (UIWebBrowserView *)a3;
}

- (UIWebOverflowScrollListener)scrollListener
{
  return self->_scrollListener;
}

- (void)setScrollListener:(id)a3
{
}

- (UIWebOverflowContentView)overflowContentView
{
  return self->_overflowContentView;
}

- (void)setOverflowContentView:(id)a3
{
}

- (DOMNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
}

- (BOOL)isBeingRemoved
{
  return self->_beingRemoved;
}

- (void)setBeingRemoved:(BOOL)a3
{
  self->_beingRemoved = a3;
}

- (CALayer)webLayer
{
  return self->_webLayer;
}

- (void)setWebLayer:(id)a3
{
}

@end