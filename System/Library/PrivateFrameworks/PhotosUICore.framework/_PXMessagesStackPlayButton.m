@interface _PXMessagesStackPlayButton
- (_PXMessagesStackPlayButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation _PXMessagesStackPlayButton

- (void).cxx_destruct
{
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_PXMessagesStackPlayButton;
  [(_PXMessagesStackPlayButton *)&v3 layoutSubviews];
  [(_PXMessagesStackPlayButton *)self bounds];
  PXRectGetCenter();
}

- (_PXMessagesStackPlayButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_PXMessagesStackPlayButton;
  objc_super v3 = -[_PXMessagesStackPlayButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E4FB1EB0], "px_videoOverlayButtonWithStyle:", 1);
    v4 = (UIView *)objc_claimAutoreleasedReturnValue();
    [(UIView *)v4 setUserInteractionEnabled:0];
    [(_PXMessagesStackPlayButton *)v3 addSubview:v4];
    videoOverlayButton = v3->_videoOverlayButton;
    v3->_videoOverlayButton = v4;
  }
  return v3;
}

@end