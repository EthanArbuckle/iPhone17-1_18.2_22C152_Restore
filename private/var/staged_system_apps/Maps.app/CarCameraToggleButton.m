@interface CarCameraToggleButton
- (CarCameraToggleButton)initWithFrame:(CGRect)a3;
- (id)accessibilityUserInputLabels;
- (unint64_t)buttonState;
- (void)setButtonState:(unint64_t)a3;
@end

@implementation CarCameraToggleButton

- (CarCameraToggleButton)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CarCameraToggleButton;
  v3 = -[CarFocusableImageButton initWithImage:edgeInsets:](&v12, "initWithImage:edgeInsets:", 0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  if (v3)
  {
    uint64_t v4 = +[UIImage _mapsCar_systemImageNamed:@"location.north.line.fill" textStyle:UIFontTextStyleCallout];
    detailImage = v3->_detailImage;
    v3->_detailImage = (UIImage *)v4;

    v6 = +[CarDisplayController sharedInstance];
    v7 = [v6 screenTraitCollection];
    v8 = +[UIImage imageNamed:@"CameraModeOverview" inBundle:0 compatibleWithTraitCollection:v7];
    uint64_t v9 = [v8 imageWithRenderingMode:2];
    overviewImage = v3->_overviewImage;
    v3->_overviewImage = (UIImage *)v9;

    [(CarCameraToggleButton *)v3 setAccessibilityIdentifier:@"CarCameraToggleButton.Unspecified"];
  }
  return v3;
}

- (void)setButtonState:(unint64_t)a3
{
  if (self->_buttonState == a3) {
    return;
  }
  self->_buttonState = a3;
  if (a3 > 2) {
    CFStringRef v5 = @".Unknown";
  }
  else {
    CFStringRef v5 = *(&off_1012FED68 + a3);
  }
  v6 = [@"CarCameraToggleButton" stringByAppendingString:v5];
  [(CarCameraToggleButton *)self setAccessibilityIdentifier:v6];

  if (a3 == 2)
  {
    v7 = &OBJC_IVAR___CarCameraToggleButton__detailImage;
  }
  else
  {
    if (a3 != 1)
    {
      id v8 = 0;
      goto LABEL_11;
    }
    v7 = &OBJC_IVAR___CarCameraToggleButton__overviewImage;
  }
  id v8 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + *v7);
LABEL_11:
  id v9 = v8;
  [(CarFocusableImageButton *)self setImage:v8];
}

- (id)accessibilityUserInputLabels
{
  v3 = +[NSBundle mainBundle];
  uint64_t v4 = [v3 localizedStringForKey:@"CarPlay_Camera" value:@"localized string not found" table:0];

  unint64_t v5 = [(CarCameraToggleButton *)self buttonState];
  if (v5 == 1)
  {
    v6 = +[NSBundle mainBundle];
    v7 = v6;
    CFStringRef v8 = @"CarPlay_Overview";
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_6;
    }
    v6 = +[NSBundle mainBundle];
    v7 = v6;
    CFStringRef v8 = @"CarPlay_Detail";
  }
  uint64_t v9 = [v6 localizedStringForKey:v8 value:@"localized string not found" table:0];

  uint64_t v4 = (void *)v9;
LABEL_6:
  objc_super v12 = v4;
  v10 = +[NSArray arrayWithObjects:&v12 count:1];

  return v10;
}

- (unint64_t)buttonState
{
  return self->_buttonState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailImage, 0);

  objc_storeStrong((id *)&self->_overviewImage, 0);
}

@end