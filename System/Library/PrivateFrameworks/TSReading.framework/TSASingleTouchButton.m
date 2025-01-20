@interface TSASingleTouchButton
- (BOOL)showsTouchOnTopWhenHighlighted;
- (CGPoint)_pressFeedbackPosition;
- (UIImage)touchImage;
- (id)_pressFeedbackImage;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setShowsTouchOnTopWhenHighlighted:(BOOL)a3;
- (void)setTouchImage:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TSASingleTouchButton

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSASingleTouchButton;
  [(TSASingleTouchButton *)&v3 dealloc];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a4, "allTouches"), "count") == 1)
  {
    v7.receiver = self;
    v7.super_class = (Class)TSASingleTouchButton;
    [(TSASingleTouchButton *)&v7 touchesBegan:a3 withEvent:a4];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a4, "allTouches"), "count") == 1)
  {
    v7.receiver = self;
    v7.super_class = (Class)TSASingleTouchButton;
    [(TSASingleTouchButton *)&v7 touchesEnded:a3 withEvent:a4];
  }
  else if ([(TSASingleTouchButton *)self isHighlighted])
  {
    [(TSASingleTouchButton *)self setHighlighted:0];
  }
}

- (CGPoint)_pressFeedbackPosition
{
  [(TSASingleTouchButton *)self bounds];
  CGFloat MidX = CGRectGetMidX(v7);
  [(TSASingleTouchButton *)self bounds];
  double MidY = CGRectGetMidY(v8);
  double v5 = MidX;
  result.y = MidY;
  result.x = v5;
  return result;
}

- (id)_pressFeedbackImage
{
  id result = [(TSASingleTouchButton *)self touchImage];
  if (!result)
  {
    objc_super v3 = (void *)MEMORY[0x263F1C6B0];
    return (id)[v3 imageNamed:@"TSA_ButtonBarPressedIndicator"];
  }
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)TSASingleTouchButton;
  [(TSASingleTouchButton *)&v5 layoutSubviews];
  if (self->_showsTouchOnTopWhenHighlighted)
  {
    uint64_t v3 = [(TSASingleTouchButton *)self viewWithTag:1];
    if (v3)
    {
      v4 = (void *)v3;
      [(TSASingleTouchButton *)self _pressFeedbackPosition];
      objc_msgSend(v4, "setCenter:");
    }
  }
}

- (void)setShowsTouchOnTopWhenHighlighted:(BOOL)a3
{
  if (self->_showsTouchOnTopWhenHighlighted != a3)
  {
    BOOL v3 = a3;
    self->_showsTouchOnTopWhenHighlighted = a3;
    objc_super v5 = (void *)[(TSASingleTouchButton *)self viewWithTag:1];
    if (v5 || !v3)
    {
      if (v5)
      {
        [v5 removeFromSuperview];
      }
    }
    else
    {
      id v6 = [(TSASingleTouchButton *)self _pressFeedbackImage];
      CGRect v7 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v6];
      [v7 setUserInteractionEnabled:0];
      [v7 setOpaque:0];
      int v8 = [(TSASingleTouchButton *)self isHighlighted];
      double v9 = 0.0;
      if (v8) {
        double v9 = 1.0;
      }
      [v7 setAlpha:v9];
      [v7 setTag:1];
      [(TSASingleTouchButton *)self _pressFeedbackPosition];
      objc_msgSend(v7, "setCenter:");
      [(TSASingleTouchButton *)self addSubview:v7];

      [(TSASingleTouchButton *)self setNeedsLayout];
    }
  }
}

- (void)setTouchImage:(id)a3
{
  if (self->_touchImage != a3)
  {
    id v5 = a3;

    self->_touchImage = (UIImage *)a3;
    uint64_t v6 = [(TSASingleTouchButton *)self viewWithTag:1];
    if (v6)
    {
      CGRect v7 = (void *)v6;
      id v8 = [(TSASingleTouchButton *)self _pressFeedbackImage];
      [v8 size];
      [v7 setBounds:TSDRectWithSize()];
      [v7 setImage:v8];
      [(TSASingleTouchButton *)self setNeedsLayout];
    }
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TSASingleTouchButton;
  -[TSASingleTouchButton setHighlighted:](&v8, sel_setHighlighted_);
  if (self->_showsTouchOnTopWhenHighlighted)
  {
    id v5 = (void *)[(TSASingleTouchButton *)self viewWithTag:1];
    if (v3)
    {
      if (objc_msgSend((id)-[TSASingleTouchButton subviews](self, "subviews"), "lastObject") != v5)
      {
        id v6 = v5;
        [v5 removeFromSuperview];
        [(TSASingleTouchButton *)self addSubview:v5];
      }
      [v5 setAlpha:1.0];
    }
    else
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __39__TSASingleTouchButton_setHighlighted___block_invoke;
      v7[3] = &unk_2646AF7B8;
      v7[4] = v5;
      [MEMORY[0x263F1CB60] animateWithDuration:v7 animations:0.25];
    }
  }
}

uint64_t __39__TSASingleTouchButton_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (BOOL)showsTouchOnTopWhenHighlighted
{
  return self->_showsTouchOnTopWhenHighlighted;
}

- (UIImage)touchImage
{
  return self->_touchImage;
}

@end