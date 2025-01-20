@interface SiriUITextField
+ (id)imageWithImage:(id)a3 tintColor:(id)a4;
- (BOOL)_shouldRepeatInsertText:(id)a3;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)clearButtonRectForBounds:(CGRect)a3;
- (CGRect)leftViewRectForBounds:(CGRect)a3;
- (CGRect)rightViewRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (SiriUITextField)initWithFrame:(CGRect)a3;
- (id)textInputContextIdentifier;
- (void)_configureClearButton;
@end

@implementation SiriUITextField

- (SiriUITextField)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SiriUITextField;
  v3 = -[SiriUITextField initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SiriUITextField *)v3 setRightViewMode:0];
    [(SiriUITextField *)v4 setClearButtonMode:1];
    [(SiriUITextField *)v4 setClearButtonStyle:1];
    [(SiriUITextField *)v4 setLoadKeyboardsForSiriLanguage:1];
    [(SiriUITextField *)v4 _configureClearButton];
  }
  return v4;
}

- (id)textInputContextIdentifier
{
  return @"Type2Siri";
}

- (void)_configureClearButton
{
  v3 = (void *)MEMORY[0x263F1C6B0];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v3 imageNamed:@"clear" inBundle:v4 compatibleWithTraitCollection:0];
  objc_super v6 = [v5 imageWithRenderingMode:2];
  id v12 = [v6 _imageThatSuppressesAccessibilityHairlineThickening];

  v7 = objc_opt_class();
  v8 = [MEMORY[0x263F1C550] whiteColor];
  v9 = [v7 imageWithImage:v12 tintColor:v8];

  v10 = [(SiriUITextField *)self _clearButton];
  [v10 setImage:v9 forState:1];

  v11 = [(SiriUITextField *)self _clearButton];
  [v11 setImage:v9 forState:0];
}

- (BOOL)_shouldRepeatInsertText:(id)a3
{
  return 0;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat v5 = a3.origin.x + 10.0;
  CGFloat v6 = a3.origin.y + 1.0;
  [(SiriUITextField *)self clearButtonRect];
  double v8 = width - (v7 + 10.0);
  double v9 = v5;
  double v10 = v6;
  double v11 = height;
  result.size.CGFloat height = v11;
  result.size.double width = v8;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)leftViewRectForBounds:(CGRect)a3
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.CGFloat height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)SiriUITextField;
  -[SiriUITextField clearButtonRectForBounds:](&v20, sel_clearButtonRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10 + -0.5;
  id v12 = (void *)MEMORY[0x263EFF960];
  v13 = [MEMORY[0x263EFF960] currentLocale];
  v14 = [v13 languageCode];
  LODWORD(v12) = [v12 characterDirectionForLanguage:v14] != 2;

  if (((v12 ^ SiriLanguageIsRTL()) & 1) == 0)
  {
    [(SiriUITextField *)self bounds];
    double Width = CGRectGetWidth(v21);
    v22.origin.x = v5;
    v22.origin.y = v11;
    v22.size.double width = v7;
    v22.size.CGFloat height = v9;
    double v5 = Width - CGRectGetMaxX(v22);
  }
  double v16 = v5;
  double v17 = v11;
  double v18 = v7;
  double v19 = v9;
  result.size.CGFloat height = v19;
  result.size.double width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.CGFloat height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  id v4 = a3;
  if ([(SiriUITextField *)self isFirstResponder])
  {
    v17.receiver = self;
    v17.super_class = (Class)SiriUITextField;
    [(SiriUITextField *)&v17 caretRectForPosition:v4];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x263F001A8];
    double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.double width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

+ (id)imageWithImage:(id)a3 tintColor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 size];
  UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  double v8 = *MEMORY[0x263F00148];
  double v9 = *(double *)(MEMORY[0x263F00148] + 8);
  [v6 size];
  double v11 = v10;
  double v13 = v12;
  CGContextSetBlendMode(CurrentContext, kCGBlendModeNormal);
  objc_msgSend(v6, "drawInRect:", v8, v9, v11, v13);

  CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceIn);
  [v5 setFill];

  v18.origin.x = v8;
  v18.origin.y = v9;
  v18.size.double width = v11;
  v18.size.CGFloat height = v13;
  CGContextFillRect(CurrentContext, v18);
  double v14 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v14;
}

@end