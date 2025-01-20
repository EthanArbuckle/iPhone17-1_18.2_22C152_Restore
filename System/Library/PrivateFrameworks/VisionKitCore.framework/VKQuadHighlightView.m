@interface VKQuadHighlightView
- (VKQuad)quad;
- (VKQuadHighlightView)initWithFrame:(CGRect)a3;
- (void)_drawHighlight;
- (void)animateToQuad:(id)a3;
- (void)layoutSubviews;
- (void)setQuad:(id)a3;
@end

@implementation VKQuadHighlightView

- (VKQuadHighlightView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)VKQuadHighlightView;
  v3 = -[VKQuadHighlightView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F39C88] layer];
    shadowLayerMaskLayer = v3->_shadowLayerMaskLayer;
    v3->_shadowLayerMaskLayer = (CAShapeLayer *)v4;

    id v6 = [MEMORY[0x1E4F428B8] greenColor];
    -[CAShapeLayer setFillColor:](v3->_shadowLayerMaskLayer, "setFillColor:", [v6 CGColor]);

    [(CAShapeLayer *)v3->_shadowLayerMaskLayer setFillRule:*MEMORY[0x1E4F39FB8]];
    uint64_t v7 = [MEMORY[0x1E4F39C88] layer];
    shadowLayer = v3->_shadowLayer;
    v3->_shadowLayer = (CAShapeLayer *)v7;

    id v9 = [MEMORY[0x1E4F428B8] whiteColor];
    -[CAShapeLayer setFillColor:](v3->_shadowLayer, "setFillColor:", [v9 CGColor]);

    [(CAShapeLayer *)v3->_shadowLayer setShadowRadius:3.0];
    id v10 = [MEMORY[0x1E4F428B8] blackColor];
    -[CAShapeLayer setShadowColor:](v3->_shadowLayer, "setShadowColor:", [v10 CGColor]);

    LODWORD(v11) = 0.5;
    [(CAShapeLayer *)v3->_shadowLayer setShadowOpacity:v11];
    -[CAShapeLayer setShadowOffset:](v3->_shadowLayer, "setShadowOffset:", 2.0, 2.0);
    [(CAShapeLayer *)v3->_shadowLayer setMask:v3->_shadowLayerMaskLayer];
    uint64_t v12 = [MEMORY[0x1E4F39C88] layer];
    highlightLayer = v3->_highlightLayer;
    v3->_highlightLayer = (CAShapeLayer *)v12;

    v14 = [MEMORY[0x1E4F428B8] whiteColor];
    id v15 = [v14 colorWithAlphaComponent:0.2];
    -[CAShapeLayer setFillColor:](v3->_highlightLayer, "setFillColor:", [v15 CGColor]);

    v16 = [(VKQuadHighlightView *)v3 layer];
    [v16 addSublayer:v3->_shadowLayer];

    v17 = [(VKQuadHighlightView *)v3 layer];
    [v17 addSublayer:v3->_highlightLayer];
  }
  return v3;
}

- (void)setQuad:(id)a3
{
  v25[8] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_quad, a3);
  if (self->_topLeft)
  {
    [v5 topLeft];
    -[VKPointAnimatableProperty setValue:](self->_topLeft, "setValue:");
    [v5 topRight];
    -[VKPointAnimatableProperty setValue:](self->_topRight, "setValue:");
    [v5 bottomRight];
    -[VKPointAnimatableProperty setValue:](self->_bottomRight, "setValue:");
    [v5 bottomLeft];
    -[VKPointAnimatableProperty setValue:](self->_bottomLeft, "setValue:");
    [(VKQuadHighlightView *)self _drawHighlight];
  }
  else
  {
    id v6 = objc_alloc_init(VKPointAnimatableProperty);
    topLeft = self->_topLeft;
    self->_topLeft = v6;

    v8 = objc_alloc_init(VKPointAnimatableProperty);
    topRight = self->_topRight;
    self->_topRight = v8;

    id v10 = objc_alloc_init(VKPointAnimatableProperty);
    bottomRight = self->_bottomRight;
    self->_bottomRight = v10;

    uint64_t v12 = objc_alloc_init(VKPointAnimatableProperty);
    bottomLeft = self->_bottomLeft;
    self->_bottomLeft = v12;

    [v5 topLeft];
    -[VKPointAnimatableProperty setValue:](self->_topLeft, "setValue:");
    [v5 topRight];
    -[VKPointAnimatableProperty setValue:](self->_topRight, "setValue:");
    [v5 bottomRight];
    -[VKPointAnimatableProperty setValue:](self->_bottomRight, "setValue:");
    [v5 bottomLeft];
    -[VKPointAnimatableProperty setValue:](self->_bottomLeft, "setValue:");
    v22 = (void *)MEMORY[0x1E4F42FF0];
    v23 = [(VKPointAnimatableProperty *)self->_topLeft x];
    v25[0] = v23;
    v14 = [(VKPointAnimatableProperty *)self->_topLeft y];
    v25[1] = v14;
    id v15 = [(VKPointAnimatableProperty *)self->_topRight x];
    v25[2] = v15;
    v16 = [(VKPointAnimatableProperty *)self->_topRight y];
    v25[3] = v16;
    v17 = [(VKPointAnimatableProperty *)self->_bottomLeft x];
    v25[4] = v17;
    v18 = [(VKPointAnimatableProperty *)self->_bottomLeft y];
    v25[5] = v18;
    objc_super v19 = [(VKPointAnimatableProperty *)self->_bottomRight x];
    v25[6] = v19;
    v20 = [(VKPointAnimatableProperty *)self->_bottomRight y];
    v25[7] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:8];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __31__VKQuadHighlightView_setQuad___block_invoke;
    v24[3] = &unk_1E6BF0D18;
    v24[4] = self;
    [v22 _createTransformerWithInputAnimatableProperties:v21 presentationValueChangedCallback:v24];
  }
}

uint64_t __31__VKQuadHighlightView_setQuad___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _drawHighlight];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)VKQuadHighlightView;
  [(VKQuadHighlightView *)&v12 layoutSubviews];
  v3 = [(VKQuadHighlightView *)self layer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[CAShapeLayer setFrame:](self->_shadowLayer, "setFrame:", v5, v7, v9, v11);
  -[CAShapeLayer setFrame:](self->_highlightLayer, "setFrame:", v5, v7, v9, v11);
  -[CAShapeLayer setFrame:](self->_shadowLayerMaskLayer, "setFrame:", v5, v7, v9, v11);
}

- (void)animateToQuad:(id)a3
{
  [(VKQuadHighlightView *)self setQuad:a3];
  [(VKQuadHighlightView *)self _drawHighlight];
}

- (void)_drawHighlight
{
  v33[1] = *MEMORY[0x1E4F143B8];
  v3 = [VKQuad alloc];
  [(VKPointAnimatableProperty *)self->_topLeft presentationValue];
  double v5 = v4;
  double v7 = v6;
  [(VKPointAnimatableProperty *)self->_topRight presentationValue];
  double v9 = v8;
  double v11 = v10;
  [(VKPointAnimatableProperty *)self->_bottomLeft presentationValue];
  double v13 = v12;
  double v15 = v14;
  [(VKPointAnimatableProperty *)self->_bottomRight presentationValue];
  v18 = -[VKQuad initWithTopLeft:topRight:bottomLeft:bottomRight:](v3, "initWithTopLeft:topRight:bottomLeft:bottomRight:", v5, v7, v9, v11, v13, v15, v16, v17);
  objc_super v19 = [MEMORY[0x1E4F42D90] mainScreen];
  [v19 nativeScale];
  double v21 = v20;
  [v19 scale];
  v22 = (void *)MEMORY[0x1E4F427D0];
  double v24 = v21 / v23;
  v25 = [(VKQuad *)v18 path];
  v33[0] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  v27 = objc_msgSend(v22, "vk_groupAndRoundPaths:radius:offset:", v26, 4.0 / v24, 4.0 / v24);

  id v28 = v27;
  -[CAShapeLayer setPath:](self->_shadowLayer, "setPath:", [v28 CGPath]);
  id v29 = v28;
  -[CAShapeLayer setPath:](self->_highlightLayer, "setPath:", [v29 CGPath]);
  v30 = (void *)MEMORY[0x1E4F427D0];
  [(VKQuadHighlightView *)self bounds];
  v31 = objc_msgSend(v30, "bezierPathWithRect:");
  [v31 appendPath:v29];
  [v31 setUsesEvenOddFillRule:1];
  id v32 = v31;
  -[CAShapeLayer setPath:](self->_shadowLayerMaskLayer, "setPath:", [v32 CGPath]);
}

- (VKQuad)quad
{
  return self->_quad;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_highlightLayer, 0);
  objc_storeStrong((id *)&self->_shadowLayerMaskLayer, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_bottomLeft, 0);
  objc_storeStrong((id *)&self->_bottomRight, 0);
  objc_storeStrong((id *)&self->_topRight, 0);
  objc_storeStrong((id *)&self->_topLeft, 0);
}

@end