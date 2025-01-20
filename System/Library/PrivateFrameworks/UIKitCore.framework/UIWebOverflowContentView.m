@interface UIWebOverflowContentView
- (CALayer)webLayer;
- (UIWebOverflowContentView)initWithLayer:(id)a3;
- (id)superview;
- (void)_setCachedSubviews:(id)a3;
- (void)dealloc;
- (void)fixUpViewAfterInsertion;
- (void)replaceLayer:(id)a3;
- (void)setWebLayer:(id)a3;
- (void)willBeRemoved;
@end

@implementation UIWebOverflowContentView

- (UIWebOverflowContentView)initWithLayer:(id)a3
{
  [a3 bounds];
  v8.receiver = self;
  v8.super_class = (Class)UIWebOverflowContentView;
  v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_);
  v6 = v5;
  if (v5) {
    [(UIWebOverflowContentView *)v5 replaceLayer:a3];
  }
  return v6;
}

- (void)dealloc
{
  self->_webLayer = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIWebOverflowContentView;
  [(UIView *)&v3 dealloc];
}

- (void)replaceLayer:(id)a3
{
  -[UIView _replaceLayer:](self, "_replaceLayer:");
  [(UIWebOverflowContentView *)self setWebLayer:a3];
}

- (void)willBeRemoved
{
}

- (id)superview
{
  v2 = [(CALayer *)[(UIView *)self layer] superlayer];
  if (!v2) {
    return 0;
  }
  objc_super v3 = v2;
  while (1)
  {
    if ([(CALayer *)v3 delegate])
    {
      [(CALayer *)v3 delegate];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
    }
    objc_super v3 = [(CALayer *)v3 superlayer];
    if (!v3) {
      return 0;
    }
  }
  return [(CALayer *)v3 delegate];
}

- (void)fixUpViewAfterInsertion
{
  -[UIView _webCustomViewWasAddedAsSubviewOfView:](self, [(UIWebOverflowContentView *)self superview]);
  [(UIView *)self _invalidateSubviewCache];
}

- (void)_setCachedSubviews:(id)a3
{
  subviewCache = self->super._subviewCache;
  if (subviewCache != a3)
  {

    if ((*(void *)&self->super._viewFlags & 0x1000) != 0) {
      v6 = 0;
    }
    else {
      v6 = (NSArray *)a3;
    }
    self->super._subviewCache = v6;
  }
}

- (CALayer)webLayer
{
  return self->_webLayer;
}

- (void)setWebLayer:(id)a3
{
}

@end