@interface TVRUIPageButton
- (CALayer)contentLayer;
- (CAShapeLayer)leftWing;
- (CAShapeLayer)rightWing;
- (CGPath)_newScaledPathForPath:(CGPath *)a3 forSize:(CGSize)a4;
- (TVRUIPageButton)initWithType:(int64_t)a3 hasTapAction:(BOOL)a4;
- (UIBezierPath)wingPath;
- (id)newChevronWingLayer;
- (void)_setupSublayers;
- (void)_updateLayers;
- (void)layoutSubviews;
- (void)setContentLayer:(id)a3;
- (void)setLeftWing:(id)a3;
- (void)setRightWing:(id)a3;
- (void)setWingPath:(id)a3;
@end

@implementation TVRUIPageButton

- (TVRUIPageButton)initWithType:(int64_t)a3 hasTapAction:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TVRUIPageButton;
  v4 = [(TVRUIButton *)&v7 initWithType:a3 hasTapAction:a4];
  v5 = v4;
  if (v4) {
    [(TVRUIPageButton *)v4 _setupSublayers];
  }
  return v5;
}

- (void)_setupSublayers
{
  v3 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
  contentLayer = self->_contentLayer;
  self->_contentLayer = v3;

  v5 = [(TVRUIPageButton *)self newChevronWingLayer];
  leftWing = self->_leftWing;
  self->_leftWing = v5;

  -[CAShapeLayer setAnchorPoint:](self->_leftWing, "setAnchorPoint:", 1.0, 0.5);
  CGAffineTransformMakeRotation(&v15, -0.279253);
  objc_super v7 = self->_leftWing;
  CGAffineTransform v14 = v15;
  [(CAShapeLayer *)v7 setAffineTransform:&v14];
  v8 = [(TVRUIPageButton *)self newChevronWingLayer];
  rightWing = self->_rightWing;
  self->_rightWing = v8;

  -[CAShapeLayer setAnchorPoint:](self->_rightWing, "setAnchorPoint:", 0.0, 0.5);
  CGAffineTransformMakeRotation(&v13, 0.279253);
  v10 = self->_rightWing;
  CGAffineTransform v12 = v13;
  [(CAShapeLayer *)v10 setAffineTransform:&v12];
  [(CALayer *)self->_contentLayer addSublayer:self->_leftWing];
  [(CALayer *)self->_contentLayer addSublayer:self->_rightWing];
  v11 = [(TVRUIPageButton *)self layer];
  [v11 addSublayer:self->_contentLayer];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIPageButton;
  [(TVRUIButton *)&v3 layoutSubviews];
  [(TVRUIPageButton *)self _updateLayers];
}

- (void)_updateLayers
{
  objc_super v3 = [(TVRUIPageButton *)self layer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[CALayer setFrame:](self->_contentLayer, "setFrame:", v5, v7, v9, v11);
  -[CAShapeLayer setBounds:](self->_leftWing, "setBounds:", 0.0, 0.0, 12.0, 6.0);
  -[CAShapeLayer setBounds:](self->_rightWing, "setBounds:", 0.0, 0.0, 12.0, 6.0);
  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  CGFloat v12 = CGRectGetMidX(v17) + 2.0;
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  -[CAShapeLayer setPosition:](self->_leftWing, "setPosition:", v12, CGRectGetMidY(v18));
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  CGFloat v13 = CGRectGetMidX(v19) + -2.0;
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  -[CAShapeLayer setPosition:](self->_rightWing, "setPosition:", v13, CGRectGetMidY(v20));
  id v14 = [(TVRUIPageButton *)self wingPath];
  CGAffineTransform v15 = -[TVRUIPageButton _newScaledPathForPath:forSize:](self, "_newScaledPathForPath:forSize:", [v14 CGPath], 12.0, 6.0);

  [(CAShapeLayer *)self->_leftWing setPath:v15];
  [(CAShapeLayer *)self->_rightWing setPath:v15];
  CGPathRelease(v15);
}

- (CGPath)_newScaledPathForPath:(CGPath *)a3 forSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  CGRect PathBoundingBox = CGPathGetPathBoundingBox(a3);
  result = 0;
  if (height != 0.0 && PathBoundingBox.size.height != 0.0)
  {
    if (PathBoundingBox.size.width / PathBoundingBox.size.height <= width / height) {
      double v8 = height / PathBoundingBox.size.height;
    }
    else {
      double v8 = width / PathBoundingBox.size.width;
    }
    memset(&v9, 0, sizeof(v9));
    CGAffineTransformMakeScale(&v9, v8, v8);
    return CGPathCreateMutableCopyByTransformingPath(a3, &v9);
  }
  return result;
}

- (UIBezierPath)wingPath
{
  wingPath = self->_wingPath;
  if (!wingPath)
  {
    objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 11.5, 2.5, 1.5);
    double v4 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
    [(UIBezierPath *)v4 setLineCapStyle:0];
    [(UIBezierPath *)v4 setLineJoinStyle:0];
    [(UIBezierPath *)v4 setLineWidth:1.0];
    [(UIBezierPath *)v4 setMiterLimit:10.0];
    double v5 = self->_wingPath;
    self->_wingPath = v4;

    wingPath = self->_wingPath;
  }
  return wingPath;
}

- (id)newChevronWingLayer
{
  id v3 = objc_alloc_init(MEMORY[0x263F15880]);
  id v4 = [MEMORY[0x263F825C8] systemWhiteColor];
  objc_msgSend(v3, "setFillColor:", objc_msgSend(v4, "CGColor"));

  id v5 = [(TVRUIPageButton *)self wingPath];
  objc_msgSend(v3, "setPath:", objc_msgSend(v5, "CGPath"));

  return v3;
}

- (CAShapeLayer)leftWing
{
  return self->_leftWing;
}

- (void)setLeftWing:(id)a3
{
}

- (CAShapeLayer)rightWing
{
  return self->_rightWing;
}

- (void)setRightWing:(id)a3
{
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (void)setContentLayer:(id)a3
{
}

- (void)setWingPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wingPath, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_rightWing, 0);
  objc_storeStrong((id *)&self->_leftWing, 0);
}

@end