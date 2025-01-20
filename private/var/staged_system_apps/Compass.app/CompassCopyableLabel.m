@interface CompassCopyableLabel
- (BOOL)canBecomeFirstResponder;
- (CompassCopyableLabel)initWithFrame:(CGRect)a3;
- (void)_openMenu:(id)a3;
- (void)copy:(id)a3;
@end

@implementation CompassCopyableLabel

- (CompassCopyableLabel)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CompassCopyableLabel;
  v3 = -[CompassCopyableLabel initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIEditMenuInteraction *)[objc_alloc((Class)UIEditMenuInteraction) initWithDelegate:v3];
    editMenuInteraction = v3->_editMenuInteraction;
    v3->_editMenuInteraction = v4;

    [(CompassCopyableLabel *)v3 addInteraction:v3->_editMenuInteraction];
    id v6 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:v3 action:"_openMenu:"];
    [(CompassCopyableLabel *)v3 addGestureRecognizer:v6];
  }
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)copy:(id)a3
{
  id v5 = +[UIPasteboard generalPasteboard];
  v4 = [(CompassCopyableLabel *)self text];
  [v5 setString:v4];
}

- (void)_openMenu:(id)a3
{
  id v5 = a3;
  if ([v5 state] == (id)1)
  {
    [(CompassCopyableLabel *)self becomeFirstResponder];
    [v5 locationInView:self];
    v4 = +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", 0);
    [(UIEditMenuInteraction *)self->_editMenuInteraction presentEditMenuWithConfiguration:v4];
  }
}

- (void).cxx_destruct
{
}

@end