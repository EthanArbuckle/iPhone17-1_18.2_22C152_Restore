@interface UIDocumentPasswordView
- (BOOL)_canDrawContent;
- (UIDocumentPasswordView)initWithDocumentName:(id)a3;
- (UIDocumentPasswordViewDelegate)passwordDelegate;
- (UITextField)passwordField;
- (double)_labelHorizontalOffset;
- (double)_textFieldWidth;
- (id)_labelFont;
- (id)_labelTextColor;
- (void)_passwordEntered:(id)a3;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setPasswordDelegate:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation UIDocumentPasswordView

- (UIDocumentPasswordView)initWithDocumentName:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)UIDocumentPasswordView;
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v5, v6, v7);
  if (v8)
  {
    v9 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v4, v5, v6, v7);
    v8->_label = v9;
    [(UILabel *)v9 setFont:[(UIDocumentPasswordView *)v8 _labelFont]];
    [(UILabel *)v8->_label setTextColor:[(UIDocumentPasswordView *)v8 _labelTextColor]];
    [(UILabel *)v8->_label setBaselineAdjustment:1];
    label = v8->_label;
    if (a3) {
      id v11 = (id)[NSString stringWithFormat:_UINSLocalizedStringWithDefaultValue(@"The document “%@” is password protected.", @"The document “%@” is password protected.", a3];
    }
    else {
      id v11 = _UINSLocalizedStringWithDefaultValue(@"This document is password protected.", @"This document is password protected.");
    }
    [(UILabel *)label setText:v11];
    [(UILabel *)v8->_label setLineBreakMode:0];
    [(UIView *)v8->_label setBackgroundColor:+[UIColor clearColor]];
    [(UILabel *)v8->_label setTextAlignment:1];
    [(UILabel *)v8->_label setNumberOfLines:0];
    [(UIView *)v8 addSubview:v8->_label];
    v12 = -[UITextField initWithFrame:]([UIDocumentPasswordField alloc], "initWithFrame:", v4, v5, v6, v7);
    v8->_passwordTextField = v12;
    [(UITextField *)v12 setPlaceholder:_UINSLocalizedStringWithDefaultValue(@"Password", @"Password")];
    [(UITextField *)v8->_passwordTextField setContentVerticalAlignment:0];
    [(UIDocumentPasswordField *)v8->_passwordTextField setAutocapitalizationType:0];
    [(UIDocumentPasswordField *)v8->_passwordTextField setAutocorrectionType:1];
    [(UITextField *)v8->_passwordTextField setBorderStyle:3];
    [(UITextField *)v8->_passwordTextField setTextAlignment:1];
    [(UIDocumentPasswordField *)v8->_passwordTextField setReturnKeyType:1];
    [(UITextField *)v8->_passwordTextField setClearsOnBeginEditing:1];
    [(UITextField *)v8->_passwordTextField setSecureTextEntry:1];
    [(UITextField *)v8->_passwordTextField setDelegate:v8];
    [(UIView *)v8 addSubview:v8->_passwordTextField];
    [(UIControl *)v8->_passwordTextField addTarget:v8 action:sel__passwordEntered_ forControlEvents:0x80000];
    [(UIView *)v8 setBackgroundColor:+[UIColor systemGroupedBackgroundColor]];
  }
  return v8;
}

- (void)dealloc
{
  [(UIView *)self->_label removeFromSuperview];

  [(UITextField *)self->_passwordTextField removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)UIDocumentPasswordView;
  [(UIView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)UIDocumentPasswordView;
  [(UIView *)&v14 layoutSubviews];
  [(UIView *)self bounds];
  double width = v15.size.width;
  if (!CGRectIsEmpty(v15))
  {
    [(UIDocumentPasswordView *)self _labelHorizontalOffset];
    double v5 = v4;
    [(UIView *)self bounds];
    UIRoundToViewScale(self);
    double v7 = v6;
    [(UIDocumentPasswordView *)self _labelHorizontalOffset];
    double v9 = width - (v8 + v8);
    [(UIDocumentPasswordView *)self _textFieldWidth];
    double v11 = (width - v10) * 0.5;
    [(UIDocumentPasswordView *)self _textFieldWidth];
    double v13 = v12;
    -[UILabel setFrame:](self->_label, "setFrame:", v5, v7, v9, 62.0);
    -[UITextField setFrame:](self->_passwordTextField, "setFrame:", v11, v7 + 62.0 + 8.0, v13, 31.0);
  }
}

- (BOOL)_canDrawContent
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)UIDocumentPasswordView;
  -[UIView drawRect:](&v16, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v5 = 0;
  }
  else {
    double v5 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextSaveGState(v5);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    double v7 = DeviceRGB;
    CGGradientRef v8 = CGGradientCreateWithColorComponents(DeviceRGB, components, locations, 2uLL);
    if (v8)
    {
      double v9 = v8;
      [(UIView *)self bounds];
      CGFloat x = v19.origin.x;
      CGFloat y = v19.origin.y;
      CGFloat width = v19.size.width;
      CGFloat height = v19.size.height;
      CGFloat MidX = CGRectGetMidX(v19);
      v20.origin.CGFloat x = x;
      v20.origin.CGFloat y = y;
      v20.size.CGFloat width = width;
      v20.size.CGFloat height = height;
      CGFloat v15 = CGRectGetMaxY(v20) * 0.5;
      v17.CGFloat y = 0.0;
      v17.CGFloat x = MidX;
      v18.CGFloat x = MidX;
      v18.CGFloat y = v15;
      CGContextDrawLinearGradient(v5, v9, v17, v18, 0);
      CGContextSetFillColor(v5, dbl_186B9E6C0);
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      v22.size.CGFloat width = CGRectGetWidth(v21);
      v22.origin.CGFloat x = 0.0;
      v22.origin.CGFloat y = v15;
      v22.size.CGFloat height = v15;
      CGContextFillRect(v5, v22);
      CGGradientRelease(v9);
    }
    CGColorSpaceRelease(v7);
  }
  CGContextRestoreGState(v5);
}

- (void)textFieldDidBeginEditing:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    passwordDelegate = self->passwordDelegate;
    [(UIDocumentPasswordViewDelegate *)passwordDelegate didBeginEditingPassword:a3 inView:self];
  }
}

- (void)textFieldDidEndEditing:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    passwordDelegate = self->passwordDelegate;
    [(UIDocumentPasswordViewDelegate *)passwordDelegate didEndEditingPassword:a3 inView:self];
  }
}

- (void)_passwordEntered:(id)a3
{
  passwordDelegate = self->passwordDelegate;
  double v5 = [(UITextField *)self->_passwordTextField text];
  [(UIDocumentPasswordViewDelegate *)passwordDelegate userDidEnterPassword:v5 forPasswordView:self];
}

- (id)_labelFont
{
  return (id)[off_1E52D39B8 systemFontOfSize:16.5];
}

- (id)_labelTextColor
{
  return +[UIColor secondaryLabelColor];
}

- (double)_labelHorizontalOffset
{
  return 15.0;
}

- (double)_textFieldWidth
{
  return 290.0;
}

- (UIDocumentPasswordViewDelegate)passwordDelegate
{
  return self->passwordDelegate;
}

- (void)setPasswordDelegate:(id)a3
{
  self->passwordDelegate = (UIDocumentPasswordViewDelegate *)a3;
}

- (UITextField)passwordField
{
  return &self->_passwordTextField->super;
}

@end