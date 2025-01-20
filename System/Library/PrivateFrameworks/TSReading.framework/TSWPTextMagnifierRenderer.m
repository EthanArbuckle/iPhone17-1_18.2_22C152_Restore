@interface TSWPTextMagnifierRenderer
- (TSWPTextMagnifierRenderer)initWithFrame:(CGRect)a3;
- (TSWPTextMagnifierRendererDelegate)delegate;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)p_createChildLayer;
- (int)autoscrollDirections;
- (void)canvasNeedsDisplay;
- (void)dealloc;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)layoutSubviews;
- (void)setAutoscrollDirections:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setNeedsDisplay;
- (void)tearDown;
@end

@implementation TSWPTextMagnifierRenderer

- (TSWPTextMagnifierRenderer)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSWPTextMagnifierRenderer;
  v3 = -[TSWPTextMagnifierRenderer initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(TSWPTextMagnifierRenderer *)v3 setUserInteractionEnabled:0];
    [(TSWPTextMagnifierRenderer *)v4 setOpaque:0];
  }
  return v4;
}

- (void)dealloc
{
  [(TSWPTextMagnifierRenderer *)self tearDown];
  v3.receiver = self;
  v3.super_class = (Class)TSWPTextMagnifierRenderer;
  [(TSWPTextMagnifierRenderer *)&v3 dealloc];
}

- (void)tearDown
{
  underlayLayer = self->_underlayLayer;
  if (underlayLayer)
  {
    [(CALayer *)underlayLayer setDelegate:0];
    [(CALayer *)self->_underlayLayer removeFromSuperlayer];

    self->_underlayLayer = 0;
  }
  [(CALayer *)self->_canvasLayer setDelegate:0];
  [(CALayer *)self->_canvasLayer removeFromSuperlayer];

  self->_canvasLayer = 0;
  [(CALayer *)self->_overlayLayer setDelegate:0];
  [(CALayer *)self->_overlayLayer removeFromSuperlayer];

  self->_overlayLayer = 0;
}

- (void)canvasNeedsDisplay
{
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
    [(TSWPTextMagnifierRenderer *)self setAlpha:v4];
    [(TSWPTextMagnifierRenderer *)self setNeedsLayout];
    [(TSWPTextMagnifierRenderer *)self setNeedsDisplay];
  }
}

- (void)setNeedsDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPTextMagnifierRenderer;
  [(TSWPTextMagnifierRenderer *)&v3 setNeedsDisplay];
  [(CALayer *)self->_canvasLayer setNeedsDisplay];
}

- (id)p_createChildLayer
{
  id v3 = objc_alloc_init(MEMORY[0x263F157E8]);
  [v3 setDelegate:self];
  [v3 setOpaque:0];
  [(TSWPTextMagnifierRenderer *)self bounds];
  objc_msgSend(v3, "setFrame:");
  TSUScreenScale();
  objc_msgSend(v3, "setContentsScale:");
  return v3;
}

- (void)layoutSubviews
{
  if (self->_underlayLayer
    || ![(TSWPTextMagnifierRendererDelegate *)self->_delegate underlayImageName])
  {
    uint64_t v3 = 0;
  }
  else
  {
    self->_underlayLayer = (CALayer *)[(TSWPTextMagnifierRenderer *)self p_createChildLayer];
    -[CALayer setContents:](self->_underlayLayer, "setContents:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:compatibleWithTraitCollection:", -[TSWPTextMagnifierRendererDelegate underlayImageName](self->_delegate, "underlayImageName"), TSWPBundle(), 0), "CGImage"));
    objc_msgSend((id)-[TSWPTextMagnifierRenderer layer](self, "layer"), "insertSublayer:atIndex:", self->_underlayLayer, 0);
    uint64_t v3 = 1;
  }
  if (!self->_canvasLayer)
  {
    self->_canvasLayer = (CALayer *)[(TSWPTextMagnifierRenderer *)self p_createChildLayer];
    -[CALayer setBackgroundColor:](self->_canvasLayer, "setBackgroundColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C550], "clearColor"), "CGColor"));
    objc_msgSend((id)-[TSWPTextMagnifierRenderer layer](self, "layer"), "insertSublayer:atIndex:", self->_canvasLayer, v3);
    uint64_t v3 = (v3 + 1);
  }
  if (!self->_overlayLayer)
  {
    self->_overlayLayer = (CALayer *)[(TSWPTextMagnifierRenderer *)self p_createChildLayer];
    -[CALayer setContents:](self->_overlayLayer, "setContents:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:compatibleWithTraitCollection:", -[TSWPTextMagnifierRendererDelegate overlayImageName](self->_delegate, "overlayImageName"), TSWPBundle(), 0), "CGImage"));
    objc_msgSend((id)-[TSWPTextMagnifierRenderer layer](self, "layer"), "insertSublayer:atIndex:", self->_overlayLayer, v3);
  }
  if ([(TSWPTextMagnifierRendererDelegate *)self->_delegate shouldHideCanvasLayer])BOOL v4 = [(TSWPTextMagnifierRenderer *)self autoscrollDirections] != 0; {
  else
  }
    BOOL v4 = 0;
  [(CALayer *)self->_canvasLayer setHidden:v4];

  [(TSWPTextMagnifierRenderer *)self setNeedsDisplay];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", a3, a4);
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  if (self->_canvasLayer == a3 && ([a3 isHidden] & 1) == 0)
  {
    delegate = self->_delegate;
    [(TSWPTextMagnifierRendererDelegate *)delegate drawMagnifierClippedCanvasLayer:a3 inContext:a4];
  }
}

- (TSWPTextMagnifierRendererDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSWPTextMagnifierRendererDelegate *)a3;
}

- (int)autoscrollDirections
{
  return self->_autoscrollDirections;
}

@end