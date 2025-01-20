@interface CRLWPTextMagnifierRenderer
- (CRLWPTextMagnifierRenderer)initWithFrame:(CGRect)a3;
- (CRLWPTextMagnifierRendererDelegate)rendererDelegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int)autoscrollDirections;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAutoscrollDirections:(int)a3;
- (void)setRendererDelegate:(id)a3;
@end

@implementation CRLWPTextMagnifierRenderer

- (CRLWPTextMagnifierRenderer)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLWPTextMagnifierRenderer;
  v3 = -[CRLWPTextMagnifierRenderer initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CRLWPTextMagnifierRenderer *)v3 setUserInteractionEnabled:0];
    [(CRLWPTextMagnifierRenderer *)v4 setOpaque:0];
  }
  return v4;
}

- (void)setAutoscrollDirections:(int)a3
{
  if (self->_autoscrollDirections != a3)
  {
    self->_autoscrollDirections = a3;
    double v4 = 0.800000012;
    if (!a3) {
      double v4 = 1.0;
    }
    [(CRLWPTextMagnifierRenderer *)self setAlpha:v4];
    [(CRLWPTextMagnifierRenderer *)self setNeedsLayout];
    [(CRLWPTextMagnifierRenderer *)self setNeedsDisplay];
  }
}

- (void)layoutSubviews
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rendererDelegate);
  unsigned int v4 = [WeakRetained shouldHideCanvasLayer];

  if (v4) {
    BOOL v5 = [(CRLWPTextMagnifierRenderer *)self autoscrollDirections] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  [(CRLWPTextMagnifierRenderer *)self setHidden:v5];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  BOOL v5 = [(CRLWPTextMagnifierRenderer *)self layer];
  [v5 crl_ignoreAccessibilityInvertColorsIfNeeded:1];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_rendererDelegate);
  objc_super v6 = [(CRLWPTextMagnifierRenderer *)self layer];
  [WeakRetained drawMagnifierClippedCanvasLayer:v6 inContext:CurrentContext];
}

- (CRLWPTextMagnifierRendererDelegate)rendererDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rendererDelegate);

  return (CRLWPTextMagnifierRendererDelegate *)WeakRetained;
}

- (void)setRendererDelegate:(id)a3
{
}

- (int)autoscrollDirections
{
  return self->_autoscrollDirections;
}

- (void).cxx_destruct
{
}

@end