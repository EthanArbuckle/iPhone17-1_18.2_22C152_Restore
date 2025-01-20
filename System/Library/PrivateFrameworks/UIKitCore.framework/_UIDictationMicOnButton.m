@interface _UIDictationMicOnButton
- (CAShapeLayer)shapeLayer;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setShapeLayer:(id)a3;
- (void)setupShapeLayer;
@end

@implementation _UIDictationMicOnButton

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDictationMicOnButton;
  [(UIView *)&v3 didMoveToSuperview];
  [(_UIDictationMicOnButton *)self setupShapeLayer];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)_UIDictationMicOnButton;
  [(UIButton *)&v11 layoutSubviews];
  objc_super v3 = [(UIButton *)self imageView];
  v4 = [v3 layer];
  [v4 setCompositingFilter:*MEMORY[0x1E4F3A370]];

  v5 = [(UIButton *)self imageView];
  [v5 position];
  double v7 = v6;
  double v9 = v8;
  v10 = [(_UIDictationMicOnButton *)self shapeLayer];
  objc_msgSend(v10, "setPosition:", v7, v9);
}

- (void)setupShapeLayer
{
  objc_super v3 = [(_UIDictationMicOnButton *)self shapeLayer];

  if (v3)
  {
    id v27 = [(UIButton *)self imageView];
    [v27 position];
    double v5 = v4;
    double v7 = v6;
    double v8 = [(_UIDictationMicOnButton *)self shapeLayer];
    objc_msgSend(v8, "setPosition:", v5, v7);
  }
  else
  {
    double v9 = [MEMORY[0x1E4F39C88] layer];
    [(_UIDictationMicOnButton *)self setShapeLayer:v9];

    double v10 = *MEMORY[0x1E4F1DAD8];
    double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", *MEMORY[0x1E4F1DAD8], v11, 30.0, 30.0, 6.0);
    id v12 = objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 CGPath];
    v14 = [(_UIDictationMicOnButton *)self shapeLayer];
    [v14 setPath:v13];

    id v15 = [(UIView *)self tintColor];
    uint64_t v16 = [v15 CGColor];
    v17 = [(_UIDictationMicOnButton *)self shapeLayer];
    [v17 setFillColor:v16];

    v18 = [(_UIDictationMicOnButton *)self shapeLayer];
    objc_msgSend(v18, "setBounds:", v10, v11, 30.0, 30.0);

    v19 = [(UIButton *)self imageView];
    [v19 position];
    double v21 = v20;
    double v23 = v22;
    v24 = [(_UIDictationMicOnButton *)self shapeLayer];
    objc_msgSend(v24, "setPosition:", v21, v23);

    id v27 = [(UIView *)self layer];
    double v8 = [(_UIDictationMicOnButton *)self shapeLayer];
    v25 = [(UIButton *)self imageView];
    v26 = [v25 layer];
    [v27 insertSublayer:v8 below:v26];
  }
}

- (CAShapeLayer)shapeLayer
{
  return self->_shapeLayer;
}

- (void)setShapeLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end