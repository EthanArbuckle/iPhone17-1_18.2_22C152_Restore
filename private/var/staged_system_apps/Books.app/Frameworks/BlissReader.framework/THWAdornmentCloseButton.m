@interface THWAdornmentCloseButton
- (CGSize)buttonSize;
- (NSAttributedString)closeButtonAlternateTitle;
- (NSAttributedString)closeButtonTitle;
- (THWAdornmentCloseButton)init;
- (THWAdornmentCloseButton)initWithCoder:(id)a3;
- (THWAdornmentCloseButton)initWithFrame:(CGRect)a3;
- (THWAdornmentCloseButton)initWithFrame:(CGRect)a3 theme:(int)a4;
- (UIImage)closeButtonAlternateImage;
- (UIImage)closeButtonImage;
- (int)theme;
- (void)dealloc;
- (void)p_initWithFrame:(CGRect)a3 theme:(int)a4;
- (void)p_initializeTheme:(int)a3;
- (void)setButtonSize:(CGSize)a3;
- (void)setCloseButtonAlternateImage:(id)a3;
- (void)setCloseButtonAlternateTitle:(id)a3;
- (void)setCloseButtonImage:(id)a3;
- (void)setCloseButtonTitle:(id)a3;
- (void)setTheme:(int)a3;
- (void)updateImage;
@end

@implementation THWAdornmentCloseButton

- (THWAdornmentCloseButton)initWithFrame:(CGRect)a3 theme:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)THWAdornmentCloseButton;
  v9 = -[THWAdornmentCloseButton initWithFrame:](&v12, "initWithFrame:");
  v10 = v9;
  if (v9) {
    -[THWAdornmentCloseButton p_initWithFrame:theme:](v9, "p_initWithFrame:theme:", v4, x, y, width, height);
  }
  return v10;
}

- (THWAdornmentCloseButton)initWithFrame:(CGRect)a3
{
  return -[THWAdornmentCloseButton initWithFrame:theme:](self, "initWithFrame:theme:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (THWAdornmentCloseButton)init
{
  return -[THWAdornmentCloseButton initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
}

- (THWAdornmentCloseButton)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THWAdornmentCloseButton;
  v3 = [(THWAdornmentCloseButton *)&v6 initWithCoder:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    [(THWAdornmentCloseButton *)v3 frame];
    -[THWAdornmentCloseButton p_initWithFrame:theme:](v4, "p_initWithFrame:theme:", 0);
  }
  return v4;
}

- (void)p_initWithFrame:(CGRect)a3 theme:(int)a4
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[THWAdornmentCloseButton p_initializeTheme:](self, "p_initializeTheme:", *(void *)&a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(THWAdornmentCloseButton *)self buttonSize];
  double v8 = v7;
  [(THWAdornmentCloseButton *)self buttonSize];
  -[THWAdornmentCloseButton setFrame:](self, "setFrame:", x, y, v8, v9);

  [(THWAdornmentCloseButton *)self updateImage];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWAdornmentCloseButton;
  [(THWAdornmentCloseButton *)&v3 dealloc];
}

- (void)setTheme:(int)a3
{
  if (self->_theme != a3)
  {
    self->_theme = a3;
    -[THWAdornmentCloseButton p_initializeTheme:](self, "p_initializeTheme:");
    [(THWAdornmentCloseButton *)self updateImage];
  }
}

- (void)updateImage
{
  [(THWAdornmentCloseButton *)self setImage:[(THWAdornmentCloseButton *)self closeButtonImage] forState:0];
  [(THWAdornmentCloseButton *)self setImage:[(THWAdornmentCloseButton *)self closeButtonImage] forState:2];
  if ([(THWAdornmentCloseButton *)self closeButtonAlternateImage])
  {
    objc_super v3 = [(THWAdornmentCloseButton *)self closeButtonAlternateImage];
    [(THWAdornmentCloseButton *)self setImage:v3 forState:1];
  }
}

- (void)p_initializeTheme:(int)a3
{
  if (a3) {
    CFStringRef v4 = @"ib_media_close-N";
  }
  else {
    CFStringRef v4 = @"ib_media_close_white-N";
  }
  [(THWAdornmentCloseButton *)self setCloseButtonImage:+[UIImage th_imageNamed:v4]];
  [(THWAdornmentCloseButton *)self setCloseButtonTitle:0];
  [(THWAdornmentCloseButton *)self setCloseButtonAlternateTitle:0];

  -[THWAdornmentCloseButton setButtonSize:](self, "setButtonSize:", 44.0, 44.0);
}

- (int)theme
{
  return self->_theme;
}

- (UIImage)closeButtonImage
{
  return self->_closeButtonImage;
}

- (void)setCloseButtonImage:(id)a3
{
}

- (UIImage)closeButtonAlternateImage
{
  return self->_closeButtonAlternateImage;
}

- (void)setCloseButtonAlternateImage:(id)a3
{
}

- (NSAttributedString)closeButtonTitle
{
  return self->_closeButtonTitle;
}

- (void)setCloseButtonTitle:(id)a3
{
}

- (NSAttributedString)closeButtonAlternateTitle
{
  return self->_closeButtonAlternateTitle;
}

- (void)setCloseButtonAlternateTitle:(id)a3
{
}

- (CGSize)buttonSize
{
  double width = self->_buttonSize.width;
  double height = self->_buttonSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setButtonSize:(CGSize)a3
{
  self->_buttonSize = a3;
}

@end