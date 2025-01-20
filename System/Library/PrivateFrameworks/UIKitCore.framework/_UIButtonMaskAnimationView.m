@interface _UIButtonMaskAnimationView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (CGRect)_frameForLine;
- (UIColor)borderColor;
- (_UIButtonMaskAnimationView)init;
- (_UIButtonMaskAnimationViewDelegate)delegate;
- (double)borderWidth;
- (unint64_t)hardEdge;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)layoutSubviews;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setHardEdge:(unint64_t)a3;
@end

@implementation _UIButtonMaskAnimationView

- (_UIButtonMaskAnimationView)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UIButtonMaskAnimationView;
  v2 = [(UIView *)&v7 init];
  if (v2)
  {
    v3 = [UIView alloc];
    uint64_t v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    hardEdgeLine = v2->_hardEdgeLine;
    v2->_hardEdgeLine = (UIView *)v4;

    [(UIView *)v2 addSubview:v2->_hardEdgeLine];
  }
  return v2;
}

- (CGRect)_frameForLine
{
  double v4 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  unint64_t v7 = [(_UIButtonMaskAnimationView *)self hardEdge];
  v8 = [(UIView *)self layer];
  [v8 cornerRadius];
  double v10 = v9;

  if (v7)
  {
    [(_UIButtonMaskAnimationView *)self borderWidth];
    double v12 = v11;
    switch(v7)
    {
      case 1uLL:
        goto LABEL_4;
      case 2uLL:
        goto LABEL_6;
      case 4uLL:
        [(UIView *)self bounds];
        double v10 = v13 - v12 - v10;
LABEL_4:
        [(UIView *)self bounds];
        double v6 = v14 - (v12 + v12);
        double v5 = v12;
        double v3 = v10;
        double v4 = v12;
        break;
      case 8uLL:
        [(UIView *)self bounds];
        double v10 = v15 - v12 - v10;
LABEL_6:
        [(UIView *)self bounds];
        double v5 = v16 - (v12 + v12);
        double v6 = v12;
        double v3 = v12;
        double v4 = v10;
        break;
      default:
        break;
    }
  }
  double v17 = v4;
  double v18 = v3;
  double v19 = v6;
  double v20 = v5;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)_UIButtonMaskAnimationView;
  [(UIView *)&v4 layoutSubviews];
  hardEdgeLine = self->_hardEdgeLine;
  [(_UIButtonMaskAnimationView *)self _frameForLine];
  -[UIView setFrame:](hardEdgeLine, "setFrame:");
}

- (double)borderWidth
{
  v2 = [(UIView *)self layer];
  [v2 borderWidth];
  double v4 = v3;

  return v4;
}

- (void)setBorderWidth:(double)a3
{
  double v5 = [(UIView *)self layer];
  [v5 setBorderWidth:a3];

  [(UIView *)self setNeedsLayout];
}

- (UIColor)borderColor
{
  double v3 = [(UIView *)self layer];
  uint64_t v4 = [v3 borderColor];

  if (v4)
  {
    double v5 = [(UIView *)self layer];
    double v6 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v5 borderColor]);
  }
  else
  {
    double v6 = 0;
  }
  return (UIColor *)v6;
}

- (void)setBorderColor:(id)a3
{
  id v4 = a3;
  double v5 = [(UIView *)self layer];
  id v6 = v4;
  objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));

  [(UIView *)self->_hardEdgeLine setBackgroundColor:v6];
}

- (unint64_t)hardEdge
{
  return self->_hardEdge;
}

- (void)setHardEdge:(unint64_t)a3
{
  self->_hardEdge = a3;
  [(UIView *)self setNeedsLayout];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIButtonMaskAnimationView;
  if ([(UIView *)&v7 _shouldAnimatePropertyWithKey:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEqualToString:@"borderColor"];
  }

  return v5;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v5 = [v8 keyPath];
    int v6 = [v5 isEqualToString:@"opacity"];

    if (v6)
    {
      objc_super v7 = [(UIView *)self layer];
      [v7 removeAnimationForKey:@"borderWidth"];
    }
  }
  [(_UIButtonMaskAnimationViewDelegate *)self->_delegate _updateMaskState];
}

- (_UIButtonMaskAnimationViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_UIButtonMaskAnimationViewDelegate *)a3;
}

- (void).cxx_destruct
{
}

@end