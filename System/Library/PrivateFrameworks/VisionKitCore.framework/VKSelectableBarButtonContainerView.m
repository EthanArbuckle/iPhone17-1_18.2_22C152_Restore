@interface VKSelectableBarButtonContainerView
- (BOOL)selected;
- (CGSize)_buttonSize;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIButton)button;
- (UIImage)image;
- (VKSelectableBarButtonContainerView)init;
- (double)compactPadding;
- (double)cornerRadiusRatio;
- (double)padding;
- (double)width;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setButton:(id)a3;
- (void)setCompactPadding:(double)a3;
- (void)setCornerRadiusRatio:(double)a3;
- (void)setImage:(id)a3;
- (void)setPadding:(double)a3;
- (void)setSelected:(BOOL)a3;
- (void)setWidth:(double)a3;
- (void)updateForMiniBarState:(BOOL)a3;
@end

@implementation VKSelectableBarButtonContainerView

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)VKSelectableBarButtonContainerView;
  [(VKSelectableBarButtonContainerView *)&v4 didMoveToWindow];
  v3 = [(VKSelectableBarButtonContainerView *)self window];

  if (v3)
  {
    [(VKSelectableBarButtonContainerView *)self setNeedsLayout];
    [(VKSelectableBarButtonContainerView *)self layoutIfNeeded];
  }
}

- (VKSelectableBarButtonContainerView)init
{
  v7.receiver = self;
  v7.super_class = (Class)VKSelectableBarButtonContainerView;
  v2 = [(VKSelectableBarButtonContainerView *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_width = 44.0;
    uint64_t v4 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    [(UIButton *)v3->_button setClipsToBounds:1];
    v3->_padding = 4.0;
    v3->_compactPadding = 3.0;
    v3->_cornerRadiusRatio = 0.5;
    [(VKSelectableBarButtonContainerView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(VKSelectableBarButtonContainerView *)v3 addSubview:v3->_button];
  }
  return v3;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  v5 = [(VKSelectableBarButtonContainerView *)self button];
  [v5 setImage:v4 forState:0];

  v6 = [(VKSelectableBarButtonContainerView *)self button];
  [v6 setContentMode:4];

  [(VKSelectableBarButtonContainerView *)self setNeedsLayout];
}

- (UIImage)image
{
  v2 = [(VKSelectableBarButtonContainerView *)self button];
  v3 = [v2 imageForState:0];

  return (UIImage *)v3;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)VKSelectableBarButtonContainerView;
  [(VKSelectableBarButtonContainerView *)&v18 layoutSubviews];
  v3 = [(VKSelectableBarButtonContainerView *)self button];
  [v3 intrinsicContentSize];
  double v5 = v4;
  [(VKSelectableBarButtonContainerView *)self bounds];
  double v10 = VKMCenterOfRect(v6, v7, v8, v9);
  objc_msgSend(v3, "setFrame:", VKMRectWithCenterAndSize(v10, v11, v5));
  [(VKSelectableBarButtonContainerView *)self cornerRadiusRatio];
  double v13 = v5 * v12;
  v14 = [v3 layer];
  [v14 setCornerRadius:v13];

  uint64_t v15 = *MEMORY[0x1E4F39EA8];
  v16 = [v3 layer];
  [v16 setCornerCurve:v15];

  v17 = [v3 layer];
  [v17 setMasksToBounds:1];
}

- (void)updateForMiniBarState:(BOOL)a3
{
  [(VKSelectableBarButtonContainerView *)self setNeedsLayout];
  [(VKSelectableBarButtonContainerView *)self layoutIfNeeded];
}

- (CGSize)intrinsicContentSize
{
  [(VKSelectableBarButtonContainerView *)self _buttonSize];
  if (v2 < 44.0) {
    double v2 = 44.0;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  CGFloat v6 = [(VKSelectableBarButtonContainerView *)self button];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7;

  [(VKSelectableBarButtonContainerView *)self width];
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  self->_selected = a3;
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  double v5 = [(VKSelectableBarButtonContainerView *)self button];
  [v5 setSelected:v3];

  CGFloat v6 = (void *)MEMORY[0x1E4F39CF8];
  [v6 commit];
}

- (CGSize)_buttonSize
{
  BOOL v3 = [(VKSelectableBarButtonContainerView *)self button];
  [v3 intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(VKSelectableBarButtonContainerView *)self traitCollection];
  if (objc_msgSend(v8, "vk_hasCompactHeight")) {
    [(VKSelectableBarButtonContainerView *)self compactPadding];
  }
  else {
    [(VKSelectableBarButtonContainerView *)self padding];
  }
  double v10 = v9;
  if (v5 < v7) {
    double v5 = v7;
  }

  double v11 = v5 + v10;
  double v12 = v5 + v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (double)padding
{
  return self->_padding;
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
}

- (double)compactPadding
{
  return self->_compactPadding;
}

- (void)setCompactPadding:(double)a3
{
  self->_compactPadding = a3;
}

- (double)cornerRadiusRatio
{
  return self->_cornerRadiusRatio;
}

- (void)setCornerRadiusRatio:(double)a3
{
  self->_cornerRadiusRatio = a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_double width = a3;
}

- (void).cxx_destruct
{
}

@end