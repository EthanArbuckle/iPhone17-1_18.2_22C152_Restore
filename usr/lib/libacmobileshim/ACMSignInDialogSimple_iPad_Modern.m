@interface ACMSignInDialogSimple_iPad_Modern
- (double)widgetConstraintConstant;
- (double)widgetConstraintMultiplier;
- (id)createCancelItem;
- (id)createIForgotItem;
- (id)widget;
- (unint64_t)supportedInterfaceOrientations;
- (void)buildWidgetContentGroupHorizontalConstraints;
@end

@implementation ACMSignInDialogSimple_iPad_Modern

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (id)createIForgotItem
{
  v2 = [objc_alloc(MEMORY[0x263F1C468]) initWithTitle:+[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", @"Forgot your ID or Password?") style:0 target:self action:sel_onIForgot_];

  return v2;
}

- (id)createCancelItem
{
  v2 = [objc_alloc(MEMORY[0x263F1C468]) initWithTitle:+[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", @"Cancel") style:0 target:0 action:0];

  return v2;
}

- (double)widgetConstraintMultiplier
{
  return 1.34375;
}

- (double)widgetConstraintConstant
{
  return -290.0;
}

- (void)buildWidgetContentGroupHorizontalConstraints
{
  v3 = (void *)MEMORY[0x263F08938];
  uint64_t v4 = [[-[ACMSignInDialogSimple_iPad_Modern widget](self) widget] view];
  [[-[ACMSignInDialogSimple_iPad_Modern widget](self, "widget") view] frame];
  [((id)-[ACMSignInDialogSimple_iPad_Modern view](self, "view")) addConstraint:objc_msgSend(v3, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 7, 0, 0, 7, 1.0, v5)];
  uint64_t v6 = [MEMORY[0x263F08938] constraintWithItem:[-[ACMSignInDialogSimple_iPad_Modern widget](self, "widget") view] attribute:9 relatedBy:0 toItem:[-[ACMSignInDialogSimple_iPad_Modern view](self, "view") view] attribute:9 multiplier:1.0 constant:0.0];
  v7 = (void *)[(ACMSignInDialogSimple_iPad_Modern *)self view];

  [v7 addConstraint:v6];
}

- (id)widget
{
  widget = self->super.super._widget;
  if (!widget)
  {
    v4.receiver = self;
    v4.super_class = (Class)ACMSignInDialogSimple_iPad_Modern;
    widget = [(ACMSignInDialogSimple_Modern *)&v4 widget];
    [widget setHideMargin:1];
  }
  return widget;
}

@end