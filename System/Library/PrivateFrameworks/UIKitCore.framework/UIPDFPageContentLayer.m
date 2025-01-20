@interface UIPDFPageContentLayer
- (UIPDFPageContentLayer)init;
- (void)dealloc;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)layoutSublayers;
- (void)setNeedsDisplay;
- (void)setSelectionNeedsDisplay;
@end

@implementation UIPDFPageContentLayer

- (UIPDFPageContentLayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIPDFPageContentLayer;
  v2 = [(UIPDFPageContentLayer *)&v6 init];
  if (v2)
  {
    CATransform3DMakeScale(&v5, 1.0, -1.0, 1.0);
    CATransform3D v4 = v5;
    [(UIPDFPageContentLayer *)v2 setTransform:&v4];
    [(UIPDFPageContentLayer *)v2 setOpaque:1];
    if (MGGetBoolAnswer()) {
      [(UIPDFPageContentLayer *)v2 setContentsFormat:*MEMORY[0x1E4F39E28]];
    }
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UIPDFPageContentLayer;
  [(UIPDFPageContentLayer *)&v3 dealloc];
}

- (void)setSelectionNeedsDisplay
{
  selectionLayer = self->_selectionLayer;
  if (selectionLayer) {
    [(CALayer *)selectionLayer setNeedsDisplay];
  }
}

- (void)setNeedsDisplay
{
  [(CALayer *)self->_selectionLayer setNeedsDisplay];
  v3.receiver = self;
  v3.super_class = (Class)UIPDFPageContentLayer;
  [(UIPDFPageContentLayer *)&v3 setNeedsDisplay];
}

- (void)layoutSublayers
{
  objc_super v3 = (void *)[(UIPDFPageContentLayer *)self delegate];
  if (v3)
  {
    CATransform3D v4 = v3;
    [v3 computeTransform];
    int v5 = [v4 pageHasSelection];
    selectionLayer = self->_selectionLayer;
    if (v5)
    {
      if (!selectionLayer)
      {
        v7 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
        self->_selectionLayer = v7;
        [(CALayer *)v7 setDelegate:self];
        [(UIPDFPageContentLayer *)self addSublayer:self->_selectionLayer];
      }
      [(UIPDFPageContentLayer *)self bounds];
      -[CALayer setFrame:](self->_selectionLayer, "setFrame:");
      v8 = self->_selectionLayer;
      [(CALayer *)v8 setNeedsDisplay];
    }
    else if (selectionLayer)
    {
      [(CALayer *)selectionLayer removeFromSuperlayer];

      self->_selectionLayer = 0;
    }
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  objc_super v6 = (void *)[(UIPDFPageContentLayer *)self delegate];
  if (v6)
  {
    [v6 drawSelectionLayer:a3 inContext:a4];
  }
}

@end