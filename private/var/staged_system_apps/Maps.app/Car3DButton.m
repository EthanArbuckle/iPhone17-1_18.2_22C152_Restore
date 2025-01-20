@interface Car3DButton
- (Car3DButton)initWithFrame:(CGRect)a3;
- (unint64_t)buttonState;
- (void)setButtonState:(unint64_t)a3;
@end

@implementation Car3DButton

- (Car3DButton)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)Car3DButton;
  v3 = -[CarFocusableImageButton initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[UIImage _mapsCar_systemImageNamed:@"view.2d" textStyle:UIFontTextStyleSubheadline];
    image2D = v3->_image2D;
    v3->_image2D = (UIImage *)v4;

    uint64_t v6 = +[UIImage _mapsCar_systemImageNamed:@"view.3d" textStyle:UIFontTextStyleSubheadline];
    image3D = v3->_image3D;
    v3->_image3D = (UIImage *)v6;

    [(CarFocusableBlurControl *)v3 setCastsShadow:0];
    [(Car3DButton *)v3 setAccessibilityIdentifier:@"Car3DButton.Unspecified"];
  }
  return v3;
}

- (void)setButtonState:(unint64_t)a3
{
  if (self->_buttonState != a3)
  {
    self->_buttonState = a3;
    if (a3)
    {
      if (a3 == 1)
      {
        uint64_t v4 = self->_image2D;
        [(Car3DButton *)self setAccessibilityIdentifier:@"Car3DButton.2D"];
        v5 = +[NSBundle mainBundle];
        uint64_t v6 = [v5 localizedStringForKey:@"CarPlay_2D" value:@"localized string not found" table:0];
        objc_super v9 = v6;
        v7 = &v9;
        goto LABEL_9;
      }
      if (a3 == 2)
      {
        uint64_t v4 = self->_image3D;
        [(Car3DButton *)self setAccessibilityIdentifier:@"Car3DButton.3D"];
        v5 = +[NSBundle mainBundle];
        uint64_t v6 = [v5 localizedStringForKey:@"CarPlay_3D" value:@"localized string not found" table:0];
        v10 = v6;
        v7 = &v10;
LABEL_9:
        v8 = +[NSArray arrayWithObjects:v7 count:1];
        [(Car3DButton *)self setAccessibilityUserInputLabels:v8];

        goto LABEL_10;
      }
    }
    else
    {
      [(Car3DButton *)self setAccessibilityIdentifier:@"Car3DButton.Unspecified"];
      [(Car3DButton *)self setAccessibilityUserInputLabels:&__NSArray0__struct];
    }
    uint64_t v4 = 0;
LABEL_10:
    [(CarFocusableImageButton *)self setImage:v4];
  }
}

- (unint64_t)buttonState
{
  return self->_buttonState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image3D, 0);

  objc_storeStrong((id *)&self->_image2D, 0);
}

@end