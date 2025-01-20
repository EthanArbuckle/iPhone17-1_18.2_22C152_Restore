@interface UIPDFPageContentTiledLayer
- (UIPDFPageContentTiledLayer)init;
- (void)dealloc;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)layoutSublayers;
- (void)setNeedsDisplay;
- (void)setSelectionNeedsDisplay;
@end

@implementation UIPDFPageContentTiledLayer

- (UIPDFPageContentTiledLayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIPDFPageContentTiledLayer;
  v2 = [(UIPDFPageContentTiledLayer *)&v6 init];
  if (v2)
  {
    CATransform3DMakeScale(&v5, 1.0, -1.0, 1.0);
    CATransform3D v4 = v5;
    [(UIPDFPageContentTiledLayer *)v2 setTransform:&v4];
    [(UIPDFPageContentTiledLayer *)v2 setOpaque:1];
    if (MGGetBoolAnswer()) {
      [(UIPDFPageContentTiledLayer *)v2 setContentsFormat:*MEMORY[0x1E4F39E28]];
    }
  }
  return v2;
}

- (void)dealloc
{
  selectionLayer = self->_selectionLayer;
  if (selectionLayer) {

  }
  v4.receiver = self;
  v4.super_class = (Class)UIPDFPageContentTiledLayer;
  [(CATiledLayer *)&v4 dealloc];
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
  selectionLayer = self->_selectionLayer;
  if (selectionLayer) {
    [(CALayer *)selectionLayer setNeedsDisplay];
  }
  v4.receiver = self;
  v4.super_class = (Class)UIPDFPageContentTiledLayer;
  [(UIPDFPageContentTiledLayer *)&v4 setNeedsDisplay];
}

- (void)layoutSublayers
{
  v3 = (void *)[(UIPDFPageContentTiledLayer *)self delegate];
  if (v3)
  {
    objc_super v4 = v3;
    [v3 computeTransform];
    int v5 = [v4 pageHasSelection];
    if (self->_selectionLayer)
    {
      if ((v5 & 1) == 0)
      {
        [(CALayer *)self->_selectionLayer removeFromSuperlayer];

        self->_selectionLayer = 0;
      }
    }
    else if (v5)
    {
      objc_super v6 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      self->_selectionLayer = v6;
      [(CALayer *)v6 setDelegate:self];
      [(UIPDFPageContentTiledLayer *)self bounds];
      -[CALayer setFrame:](self->_selectionLayer, "setFrame:");
      [(UIPDFPageContentTiledLayer *)self addSublayer:self->_selectionLayer];
      [(CALayer *)self->_selectionLayer setNeedsLayout];
      selectionLayer = self->_selectionLayer;
      [(CALayer *)selectionLayer setNeedsDisplay];
    }
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  objc_super v6 = (void *)[(UIPDFPageContentTiledLayer *)self delegate];
  if (v6)
  {
    [v6 drawSelectionLayer:a3 inContext:a4];
  }
}

@end