@interface VTUICheckMarkView
- (CALayer)checkMaskLayer;
- (CALayer)xMaskLayer;
- (CGSize)intrinsicContentSize;
- (VTUIColorLayer)colorLayer;
- (void)animateForSuccess:(BOOL)a3 completion:(id)a4;
- (void)setCheckMaskLayer:(id)a3;
- (void)setColorLayer:(id)a3;
- (void)setXMaskLayer:(id)a3;
@end

@implementation VTUICheckMarkView

- (CGSize)intrinsicContentSize
{
  v2 = [(VTUICheckMarkView *)self checkMaskLayer];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)animateForSuccess:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3) {
    [(VTUICheckMarkView *)self checkMaskLayer];
  }
  else {
  double v7 = [(VTUICheckMarkView *)self xMaskLayer];
  }
  [(VTUICheckMarkView *)self bounds];
  double v9 = v8;
  [v7 bounds];
  CGFloat v11 = v9 / v10;
  [(VTUICheckMarkView *)self bounds];
  double v13 = v12;
  [v7 bounds];
  CGAffineTransformMakeScale(&v39, v11, v13 / v14);
  CGAffineTransform v38 = v39;
  [v7 setAffineTransform:&v38];
  [(VTUICheckMarkView *)self bounds];
  double v16 = v15;
  v17 = [(VTUICheckMarkView *)self colorLayer];
  [v17 bounds];
  CGFloat v19 = v16 / v18;
  [(VTUICheckMarkView *)self bounds];
  double v21 = v20;
  v22 = [(VTUICheckMarkView *)self colorLayer];
  [v22 bounds];
  CGAffineTransformMakeScale(&v37, v19, v21 / v23);
  v24 = [(VTUICheckMarkView *)self colorLayer];
  CGAffineTransform v36 = v37;
  [v24 setAffineTransform:&v36];

  v25 = [(VTUICheckMarkView *)self layer];
  [v25 setMask:v7];

  [(VTUICheckMarkView *)self setAlpha:1.0];
  [(VTUICheckMarkView *)self setHidden:0];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setAnimationDuration:0.666666687];
  [MEMORY[0x263F158F8] disableActions];
  uint64_t v30 = MEMORY[0x263EF8330];
  uint64_t v31 = 3221225472;
  v32 = __50__VTUICheckMarkView_animateForSuccess_completion___block_invoke;
  v33 = &unk_264D4C230;
  v34 = self;
  id v35 = v6;
  v26 = (void *)MEMORY[0x263F158F8];
  id v27 = v6;
  [v26 setCompletionBlock:&v30];
  v28 = [(VTUICheckMarkView *)self colorLayer];
  LODWORD(v29) = 1.0;
  [v28 setPhase:v29];

  [MEMORY[0x263F158F8] commit];
}

void __50__VTUICheckMarkView_animateForSuccess_completion___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F82E00];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__VTUICheckMarkView_animateForSuccess_completion___block_invoke_2;
  v4[3] = &unk_264D4C280;
  uint64_t v5 = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __50__VTUICheckMarkView_animateForSuccess_completion___block_invoke_3;
  v2[3] = &unk_264D4C710;
  v2[4] = v5;
  id v3 = *(id *)(a1 + 40);
  [v1 animateWithDuration:v4 animations:v2 completion:0.333333343];
}

uint64_t __50__VTUICheckMarkView_animateForSuccess_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __50__VTUICheckMarkView_animateForSuccess_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:1];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = [*(id *)(a1 + 32) colorLayer];
  [v3 setPhase:0.0];
}

- (VTUIColorLayer)colorLayer
{
  colorLayer = self->_colorLayer;
  if (!colorLayer)
  {
    double v4 = +[VTUIColorLayer layer];
    uint64_t v5 = self->_colorLayer;
    self->_colorLayer = v4;

    -[VTUIColorLayer setBounds:](self->_colorLayer, "setBounds:", 0.0, 0.0, 400.0, 400.0);
    id v6 = [(VTUICheckMarkView *)self layer];
    [v6 bounds];
    double MidX = CGRectGetMidX(v13);
    double v8 = [(VTUICheckMarkView *)self layer];
    [v8 bounds];
    double MidY = CGRectGetMidY(v14);

    -[VTUIColorLayer setPosition:](self->_colorLayer, "setPosition:", MidX, MidY);
    double v10 = [(VTUICheckMarkView *)self layer];
    [v10 addSublayer:self->_colorLayer];

    colorLayer = self->_colorLayer;
  }
  return colorLayer;
}

- (CALayer)checkMaskLayer
{
  checkMaskLayer = self->_checkMaskLayer;
  if (!checkMaskLayer)
  {
    double v4 = [MEMORY[0x263F157E8] layer];
    uint64_t v5 = [MEMORY[0x263F82818] configurationWithPointSize:7 weight:62.0];
    id v6 = [MEMORY[0x263F827E8] systemImageNamed:@"checkmark"];
    double v7 = [v6 imageWithConfiguration:v5];

    [v7 size];
    double v9 = v8;
    double v11 = v10;
    v18.origin.x = 0.0;
    v18.origin.y = 0.0;
    v18.size.width = v9;
    v18.size.height = v11;
    double MidX = CGRectGetMidX(v18);
    v19.origin.x = 0.0;
    v19.origin.y = 0.0;
    v19.size.width = v9;
    v19.size.height = v11;
    double MidY = CGRectGetMidY(v19);
    id v14 = v7;
    -[CALayer setContents:](v4, "setContents:", [v14 CGImage]);
    -[CALayer setBounds:](v4, "setBounds:", 0.0, 0.0, v9, v11);
    -[CALayer setPosition:](v4, "setPosition:", MidX, MidY);
    double v15 = self->_checkMaskLayer;
    self->_checkMaskLayer = v4;

    checkMaskLayer = self->_checkMaskLayer;
  }
  return checkMaskLayer;
}

- (CALayer)xMaskLayer
{
  xMaskLayer = self->_xMaskLayer;
  if (!xMaskLayer)
  {
    double v4 = [MEMORY[0x263F15880] layer];
    -[CALayer setBounds:](v4, "setBounds:", 0.0, 0.0, 400.0, 400.0);
    -[CALayer setAnchorPoint:](v4, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, 80.0, 80.0);
    CGPathAddLineToPoint(Mutable, 0, 320.0, 320.0);
    CGPathMoveToPoint(Mutable, 0, 80.0, 320.0);
    CGPathAddLineToPoint(Mutable, 0, 320.0, 80.0);
    [(CALayer *)v4 setPath:Mutable];
    CGPathRelease(Mutable);
    [(CALayer *)v4 setFillColor:0];
    [(CALayer *)v4 setStrokeColor:CGColorGetConstantColor((CFStringRef)*MEMORY[0x263F001C0])];
    [(CALayer *)v4 setLineWidth:36.0];
    id v6 = self->_xMaskLayer;
    self->_xMaskLayer = v4;

    xMaskLayer = self->_xMaskLayer;
  }
  return xMaskLayer;
}

- (void)setCheckMaskLayer:(id)a3
{
}

- (void)setXMaskLayer:(id)a3
{
}

- (void)setColorLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorLayer, 0);
  objc_storeStrong((id *)&self->_xMaskLayer, 0);
  objc_storeStrong((id *)&self->_checkMaskLayer, 0);
  objc_storeStrong((id *)&self->_redView, 0);
  objc_storeStrong((id *)&self->_greenView, 0);
  objc_storeStrong((id *)&self->_blueView, 0);
  objc_storeStrong((id *)&self->_redColor, 0);
  objc_storeStrong((id *)&self->_blueColor, 0);
}

@end