@interface UIKeyboardStickerButtonView
- (UIButton)launchStickersButton;
- (UIKeyboardStickerButtonView)initWithFrame:(CGRect)a3;
- (id)accessibilityIdentifier;
- (unint64_t)accessibilityTraits;
- (void)handleTap;
- (void)layoutSubviews;
- (void)setLaunchStickersButton:(id)a3;
@end

@implementation UIKeyboardStickerButtonView

- (UIKeyboardStickerButtonView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)UIKeyboardStickerButtonView;
  v7 = -[UICollectionReusableView initWithFrame:](&v16, sel_initWithFrame_);
  if (v7)
  {
    v8 = +[UIImageSymbolConfiguration configurationWithPointSize:7 weight:3 scale:30.0];
    v9 = +[UIImage _systemImageNamed:@"sticker" withConfiguration:v8];
    v10 = +[UIButton systemButtonWithImage:v9 target:v7 action:sel_handleTap];
    -[UIButton setFrame:](v10, "setFrame:", x, y, width, height);
    v11 = [(UIButton *)v10 imageView];
    [v11 setContentMode:1];

    v12 = +[UIColor secondaryLabelColor];
    [(UIButton *)v10 setTintColor:v12];

    launchStickersButton = v7->_launchStickersButton;
    v7->_launchStickersButton = v10;
    v14 = v10;

    [(UIView *)v7 addSubview:v7->_launchStickersButton];
  }
  return v7;
}

- (id)accessibilityIdentifier
{
  return @"StickerApp Button";
}

- (unint64_t)accessibilityTraits
{
  return 1;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardStickerButtonView;
  [(UIView *)&v4 layoutSubviews];
  launchStickersButton = self->_launchStickersButton;
  [(UIView *)self bounds];
  -[UIButton setFrame:](launchStickersButton, "setFrame:");
}

- (void)handleTap
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"window";
  v3 = [(UIView *)self window];
  v8[1] = @"windowScene";
  v9[0] = v3;
  objc_super v4 = [(UIView *)self window];
  v5 = [v4 windowScene];
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"UIEmojiAndStickerShouldPresentPickerNotification" object:0 userInfo:v6];
}

- (UIButton)launchStickersButton
{
  return self->_launchStickersButton;
}

- (void)setLaunchStickersButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end