@interface CarMoreButton
- (CarMoreButton)init;
- (id)accessibilityIdentifier;
- (unint64_t)options;
- (void)_updateImage;
- (void)didMoveToWindow;
- (void)setOptions:(unint64_t)a3;
@end

@implementation CarMoreButton

- (CarMoreButton)init
{
  return -[CarCardRoundedButton initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (void)setOptions:(unint64_t)a3
{
  if (self->_options != a3)
  {
    self->_options = a3;
    [(CarMoreButton *)self _updateImage];
  }
}

- (void)_updateImage
{
  if ((~[(CarMoreButton *)self options] & 6) != 0)
  {
    if (([(CarMoreButton *)self options] & 2) != 0)
    {
      CFStringRef v3 = @"phone.fill";
    }
    else
    {
      if (([(CarMoreButton *)self options] & 4) == 0)
      {
        uint64_t v4 = 0;
        goto LABEL_9;
      }
      CFStringRef v3 = @"square.and.arrow.up";
    }
  }
  else
  {
    CFStringRef v3 = @"ellipsis";
  }
  uint64_t v4 = +[UIImage _mapsCar_systemImageNamed:v3 textStyle:UIFontTextStyleFootnote];
LABEL_9:
  id v5 = (id)v4;
  [(CarMoreButton *)self setImage:v4 forState:0];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)CarMoreButton;
  [(CarFocusableButton *)&v4 didMoveToWindow];
  CFStringRef v3 = [(CarMoreButton *)self window];

  if (v3) {
    [(CarMoreButton *)self _updateImage];
  }
}

- (id)accessibilityIdentifier
{
  return @"CarMoreButton";
}

- (unint64_t)options
{
  return self->_options;
}

@end