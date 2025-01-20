@interface SHListeningInnerCircleLayer
- (CALayer)circleContainerLayer;
- (CAShapeLayer)circle;
- (CGPath)circlePathForRect:(CGRect)a3;
- (void)layoutSublayers;
- (void)setCircle:(id)a3;
- (void)setCircleContainerLayer:(id)a3;
- (void)setup;
@end

@implementation SHListeningInnerCircleLayer

- (void)setup
{
  +[SHPalette contentsScale];
  -[SHListeningInnerCircleLayer setContentsScale:](self, "setContentsScale:");
  id v3 = objc_alloc_init(MEMORY[0x263F157E8]);
  [(SHListeningInnerCircleLayer *)self setCircleContainerLayer:v3];

  id v4 = objc_alloc_init(MEMORY[0x263F15880]);
  [(SHListeningInnerCircleLayer *)self setCircle:v4];

  +[SHPalette contentsScale];
  double v6 = v5;
  v7 = [(SHListeningInnerCircleLayer *)self circle];
  [v7 setContentsScale:v6];

  v8 = [(SHListeningInnerCircleLayer *)self circle];
  [v8 setNeedsDisplayOnBoundsChange:1];

  v9 = [(SHPaletteLayer *)self palette];
  uint64_t v10 = [v9 listeningCircleColor];
  v11 = [(SHListeningInnerCircleLayer *)self circle];
  [v11 setFillColor:v10];

  v12 = [(SHListeningInnerCircleLayer *)self circleContainerLayer];
  [(SHListeningInnerCircleLayer *)self addSublayer:v12];

  id v14 = [(SHListeningInnerCircleLayer *)self circleContainerLayer];
  v13 = [(SHListeningInnerCircleLayer *)self circle];
  [v14 addSublayer:v13];
}

- (void)layoutSublayers
{
  v29.receiver = self;
  v29.super_class = (Class)SHListeningInnerCircleLayer;
  [(SHListeningInnerCircleLayer *)&v29 layoutSublayers];
  [(SHListeningInnerCircleLayer *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SHListeningInnerCircleLayer *)self circleContainerLayer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = [(SHListeningInnerCircleLayer *)self circleContainerLayer];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(SHListeningInnerCircleLayer *)self circle];
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  v22 = [(SHListeningInnerCircleLayer *)self circle];
  [v22 bounds];
  v23 = -[SHListeningInnerCircleLayer circlePathForRect:](self, "circlePathForRect:");

  v24 = [(SHListeningInnerCircleLayer *)self circle];
  [v24 setPath:v23];

  v25 = [(SHPaletteLayer *)self palette];
  uint64_t v26 = [v25 listeningCircleColor];
  v27 = [(SHListeningInnerCircleLayer *)self circle];
  [v27 setFillColor:v26];

  v28 = [(SHListeningInnerCircleLayer *)self circle];
  [v28 setNeedsDisplay];
}

- (CGPath)circlePathForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  CGPathAddEllipseInRect(Mutable, 0, v9);
  CFAutorelease(Mutable);
  return Mutable;
}

- (CALayer)circleContainerLayer
{
  return self->_circleContainerLayer;
}

- (void)setCircleContainerLayer:(id)a3
{
}

- (CAShapeLayer)circle
{
  return self->_circle;
}

- (void)setCircle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circle, 0);
  objc_storeStrong((id *)&self->_circleContainerLayer, 0);
}

@end