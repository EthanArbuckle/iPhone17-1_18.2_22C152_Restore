@interface MTMPUHalfTintedTransportButton
- (BOOL)_shouldForwardSelectedState;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isEnabled;
- (BOOL)shouldTrack;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTMPUHalfTintedTransportButton)initWithFrame:(CGRect)a3;
- (UIButton)_regularButton;
- (UIButton)_tintedButton;
- (UIColor)regularImageColor;
- (UIColor)tintedImageColor;
- (UIImage)regularImage;
- (UIImage)tintedImage;
- (UIImageView)regularImageView;
- (UIImageView)tintedImageView;
- (double)regularImageAlpha;
- (double)tintedImageAlpha;
- (id)_handleButtonHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_newButton;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_applyImage:(id)a3 toButton:(id)a4;
- (void)_updateRegularImage;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setRegularImage:(id)a3;
- (void)setRegularImageAlpha:(double)a3;
- (void)setRegularImageColor:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTintedImage:(id)a3;
- (void)setTintedImageAlpha:(double)a3;
- (void)setTintedImageColor:(id)a3;
@end

@implementation MTMPUHalfTintedTransportButton

- (MTMPUHalfTintedTransportButton)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MTMPUHalfTintedTransportButton;
  v3 = -[MTMPUHalfTintedTransportButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MTMPUTransportButtonEventHandler);
    transportButtonEventHandler = v3->_transportButtonEventHandler;
    v3->_transportButtonEventHandler = v4;

    [(MTMPUTransportButtonEventHandler *)v3->_transportButtonEventHandler setButton:v3];
    uint64_t v6 = [(MTMPUHalfTintedTransportButton *)v3 _newButton];
    regularButton = v3->_regularButton;
    v3->_regularButton = (UIButton *)v6;

    [(UIButton *)v3->_regularButton setHidden:1];
    [(UIButton *)v3->_regularButton setUserInteractionEnabled:0];
    [(MTMPUHalfTintedTransportButton *)v3 addSubview:v3->_regularButton];
    uint64_t v8 = [(MTMPUHalfTintedTransportButton *)v3 _newButton];
    tintedButton = v3->_tintedButton;
    v3->_tintedButton = (UIButton *)v8;

    [(UIButton *)v3->_tintedButton setHidden:1];
    [(UIButton *)v3->_tintedButton setUserInteractionEnabled:0];
    [(MTMPUHalfTintedTransportButton *)v3 addSubview:v3->_tintedButton];
  }
  return v3;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)MTMPUHalfTintedTransportButton;
  [(MTMPUHalfTintedTransportButton *)&v11 layoutSubviews];
  [(MTMPUHalfTintedTransportButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIButton setFrame:](self->_regularButton, "setFrame:");
  -[UIButton setFrame:](self->_tintedButton, "setFrame:", v4, v6, v8, v10);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  transportButtonEventHandler = self->_transportButtonEventHandler;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__MTMPUHalfTintedTransportButton_hitTest_withEvent___block_invoke;
  v12[3] = &unk_1E6E1FDB0;
  CGFloat v14 = x;
  CGFloat v15 = y;
  v12[4] = self;
  id v13 = v7;
  id v9 = v7;
  double v10 = [(MTMPUTransportButtonEventHandler *)transportButtonEventHandler performHitTestingBlock:v12];

  return v10;
}

uint64_t __52__MTMPUHalfTintedTransportButton_hitTest_withEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleButtonHitTest:withEvent:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (id)_handleButtonHitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MTMPUHalfTintedTransportButton;
  -[MTMPUHalfTintedTransportButton hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
  double v6 = v5;
  if (v5 == self->_regularButton || v5 == self->_tintedButton)
  {
    id v7 = self;

    double v6 = v7;
  }

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UIButton sizeThatFits:](self->_regularButton, "sizeThatFits:");
  double v7 = v6;
  double v9 = v8;
  -[UIButton sizeThatFits:](self->_tintedButton, "sizeThatFits:", width, height);
  if (v7 >= v10) {
    double v10 = v7;
  }
  if (v9 >= v11) {
    double v11 = v9;
  }
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  double v5 = self;
  transportButtonEventHandler = self->_transportButtonEventHandler;
  id v7 = a4;
  id v8 = a3;
  [(MTMPUTransportButtonEventHandler *)transportButtonEventHandler beginTrackingWithTouch:v8 withEvent:v7];
  v10.receiver = v5;
  v10.super_class = (Class)MTMPUHalfTintedTransportButton;
  LOBYTE(v5) = [(MTMPUHalfTintedTransportButton *)&v10 beginTrackingWithTouch:v8 withEvent:v7];

  return (char)v5;
}

- (void)cancelTrackingWithEvent:(id)a3
{
  transportButtonEventHandler = self->_transportButtonEventHandler;
  id v5 = a3;
  [(MTMPUTransportButtonEventHandler *)transportButtonEventHandler cancelTrackingWithEvent:v5];
  v6.receiver = self;
  v6.super_class = (Class)MTMPUHalfTintedTransportButton;
  [(MTMPUHalfTintedTransportButton *)&v6 cancelTrackingWithEvent:v5];
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  transportButtonEventHandler = self->_transportButtonEventHandler;
  id v7 = a4;
  id v8 = a3;
  [(MTMPUTransportButtonEventHandler *)transportButtonEventHandler endTrackingWithTouch:v8 withEvent:v7];
  v9.receiver = self;
  v9.super_class = (Class)MTMPUHalfTintedTransportButton;
  [(MTMPUHalfTintedTransportButton *)&v9 endTrackingWithTouch:v8 withEvent:v7];
}

- (BOOL)isEnabled
{
  v4.receiver = self;
  v4.super_class = (Class)MTMPUHalfTintedTransportButton;
  return [(MTMPUHalfTintedTransportButton *)&v4 isEnabled]
      || [(MTMPUTransportButtonEventHandler *)self->_transportButtonEventHandler shouldFakeEnabled];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MTMPUHalfTintedTransportButton;
  -[MTMPUHalfTintedTransportButton setEnabled:](&v5, sel_setEnabled_);
  [(UIButton *)self->_regularButton setEnabled:v3];
  [(UIButton *)self->_tintedButton setEnabled:v3];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MTMPUHalfTintedTransportButton;
  -[MTMPUHalfTintedTransportButton setHighlighted:](&v5, sel_setHighlighted_);
  [(UIButton *)self->_regularButton setHighlighted:v3];
  [(UIButton *)self->_tintedButton setHighlighted:v3];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MTMPUHalfTintedTransportButton;
  -[MTMPUHalfTintedTransportButton setSelected:](&v5, sel_setSelected_);
  if ([(MTMPUHalfTintedTransportButton *)self _shouldForwardSelectedState])
  {
    [(UIButton *)self->_regularButton setSelected:v3];
    [(UIButton *)self->_tintedButton setSelected:v3];
  }
}

- (BOOL)shouldTrack
{
  v4.receiver = self;
  v4.super_class = (Class)MTMPUHalfTintedTransportButton;
  return [(MTMPUHalfTintedTransportButton *)&v4 shouldTrack]
      || [(MTMPUTransportButtonEventHandler *)self->_transportButtonEventHandler shouldForceTrackingEnabled];
}

- (double)regularImageAlpha
{
  [(UIButton *)self->_regularButton alpha];
  return result;
}

- (UIImageView)regularImageView
{
  return [(UIButton *)self->_regularButton imageView];
}

- (void)setRegularImage:(id)a3
{
  objc_super v5 = (UIImage *)a3;
  if (self->_regularImage != v5)
  {
    objc_storeStrong((id *)&self->_regularImage, a3);
    [(MTMPUHalfTintedTransportButton *)self _updateRegularImage];
    [(UIButton *)self->_regularButton setHidden:v5 == 0];
  }
}

- (void)setRegularImageAlpha:(double)a3
{
}

- (void)setRegularImageColor:(id)a3
{
  objc_super v5 = (UIColor *)a3;
  if (self->_regularImageColor != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_regularImageColor, a3);
    [(UIButton *)self->_regularButton setTintColor:v6];
    objc_super v5 = v6;
    if ((v6 != 0) == (self->_regularImageColor == 0))
    {
      [(MTMPUHalfTintedTransportButton *)self _updateRegularImage];
      objc_super v5 = v6;
    }
  }
}

- (void)setTintedImage:(id)a3
{
  objc_super v6 = (UIImage *)a3;
  if (self->_tintedImage != v6)
  {
    objc_storeStrong((id *)&self->_tintedImage, a3);
    objc_super v5 = [(UIImage *)v6 imageWithRenderingMode:2];
    [(MTMPUHalfTintedTransportButton *)self _applyImage:v5 toButton:self->_tintedButton];

    [(UIButton *)self->_tintedButton setHidden:v6 == 0];
  }
}

- (void)setTintedImageAlpha:(double)a3
{
}

- (void)setTintedImageColor:(id)a3
{
}

- (double)tintedImageAlpha
{
  [(UIButton *)self->_tintedButton alpha];
  return result;
}

- (UIColor)tintedImageColor
{
  return [(UIButton *)self->_tintedButton tintColor];
}

- (UIImageView)tintedImageView
{
  return [(UIButton *)self->_tintedButton imageView];
}

- (void)_applyImage:(id)a3 toButton:(id)a4
{
}

- (id)_newButton
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIButton)_regularButton
{
  return self->_regularButton;
}

- (BOOL)_shouldForwardSelectedState
{
  return 1;
}

- (UIButton)_tintedButton
{
  return self->_tintedButton;
}

- (void)_updateRegularImage
{
  if (self->_regularImageColor) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  id v4 = [(UIImage *)self->_regularImage imageWithRenderingMode:v3];
  [(MTMPUHalfTintedTransportButton *)self _applyImage:v4 toButton:self->_regularButton];
}

- (UIImage)regularImage
{
  return self->_regularImage;
}

- (UIColor)regularImageColor
{
  return self->_regularImageColor;
}

- (UIImage)tintedImage
{
  return self->_tintedImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintedImage, 0);
  objc_storeStrong((id *)&self->_regularImageColor, 0);
  objc_storeStrong((id *)&self->_regularImage, 0);
  objc_storeStrong((id *)&self->_transportButtonEventHandler, 0);
  objc_storeStrong((id *)&self->_tintedButton, 0);

  objc_storeStrong((id *)&self->_regularButton, 0);
}

@end