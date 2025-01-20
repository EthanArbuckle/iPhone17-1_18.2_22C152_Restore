@interface _TVRMAlertButton
- (BOOL)showingBackgroundEffect;
- (UIView)burnView;
- (UIView)plusDView;
- (void)layoutSubviews;
- (void)setBurnView:(id)a3;
- (void)setPlusDView:(id)a3;
- (void)setShowingBackgroundEffect:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _TVRMAlertButton

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_TVRMAlertButton;
  [(_TVRMAlertButton *)&v5 layoutSubviews];
  [(_TVRMAlertButton *)self insertSubview:self->_burnView atIndex:0];
  [(_TVRMAlertButton *)self insertSubview:self->_plusDView atIndex:1];
  burnView = self->_burnView;
  [(_TVRMAlertButton *)self bounds];
  -[UIView setFrame:](burnView, "setFrame:");
  plusDView = self->_plusDView;
  [(_TVRMAlertButton *)self bounds];
  -[UIView setFrame:](plusDView, "setFrame:");
  [(UIView *)self->_burnView setHidden:!self->_showingBackgroundEffect];
  [(UIView *)self->_plusDView setHidden:!self->_showingBackgroundEffect];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_TVRMAlertButton;
  [(_TVRMAlertButton *)&v5 touchesBegan:a3 withEvent:a4];
  [(_TVRMAlertButton *)self setShowingBackgroundEffect:1];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_TVRMAlertButton;
  id v6 = a4;
  id v7 = a3;
  [(_TVRMAlertButton *)&v10 touchesMoved:v7 withEvent:v6];
  v8 = objc_msgSend(v7, "anyObject", v10.receiver, v10.super_class);

  [v8 locationInView:self];
  uint64_t v9 = -[_TVRMAlertButton pointInside:withEvent:](self, "pointInside:withEvent:", v6);

  [(_TVRMAlertButton *)self setShowingBackgroundEffect:v9];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_TVRMAlertButton;
  [(_TVRMAlertButton *)&v5 touchesEnded:a3 withEvent:a4];
  [(_TVRMAlertButton *)self setShowingBackgroundEffect:0];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_TVRMAlertButton;
  [(_TVRMAlertButton *)&v5 touchesCancelled:a3 withEvent:a4];
  [(_TVRMAlertButton *)self setShowingBackgroundEffect:0];
}

- (void)setShowingBackgroundEffect:(BOOL)a3
{
  if (self->_showingBackgroundEffect != a3)
  {
    self->_showingBackgroundEffect = a3;
    [(_TVRMAlertButton *)self setNeedsLayout];
  }
}

- (BOOL)showingBackgroundEffect
{
  return self->_showingBackgroundEffect;
}

- (UIView)burnView
{
  return self->_burnView;
}

- (void)setBurnView:(id)a3
{
}

- (UIView)plusDView
{
  return self->_plusDView;
}

- (void)setPlusDView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plusDView, 0);
  objc_storeStrong((id *)&self->_burnView, 0);
}

@end