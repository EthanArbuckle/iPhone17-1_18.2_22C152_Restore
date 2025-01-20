@interface UISearchField
+ (double)defaultHeight;
- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged;
- (CGRect)_availableTextRectExcludingButtonsForBounds:(CGRect)a3;
- (CGRect)iconRect;
- (CGRect)rightViewRectForBounds:(CGRect)a3;
- (UISearchField)initWithFrame:(CGRect)a3;
- (id)_placeholderColor;
@end

@implementation UISearchField

+ (double)defaultHeight
{
  return 29.0;
}

- (UISearchField)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)UISearchField;
  v3 = -[UITextField initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = _UIImageWithName(@"UISearchFieldIcon.png");
    [v4 size];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    [v4 scale];
    _UIGraphicsBeginImageContextWithOptions(0, 0, v6, v8, v9);
    objc_msgSend(v4, "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 1.0);
    v10 = [(UIView *)v3 _interactionTintColor];

    if (v10)
    {
      v11 = [(UIView *)v3 _interactionTintColor];
    }
    else
    {
      v12 = +[UIColor colorWithWhite:0.0 alpha:0.2];
      v11 = +[UIColor _composedColorFromSourceColor:destinationColor:tintColor:alpha:](1.0, (uint64_t)UIColor, v12, 0, 0);
    }
    [v11 set];

    [v4 size];
    CGFloat v14 = v13;
    [v4 size];
    v19.size.height = v15;
    v19.origin.x = 0.0;
    v19.origin.y = 0.0;
    v19.size.width = v14;
    UIRectFillUsingBlendMode(v19, kCGBlendModeSourceIn);
    v16 = _UIGraphicsGetImageFromCurrentImageContext(0);

    UIGraphicsEndImageContext();
    [(UITextField *)v3 setIcon:v16];
    [(UITextField *)v3 setBorderStyle:3];
  }
  return v3;
}

- (id)_placeholderColor
{
  int v2 = _AXDarkenSystemColors();
  double v3 = 0.25;
  if (!v2) {
    double v3 = 0.5;
  }
  return +[UIColor colorWithWhite:v3 alpha:1.0];
}

- (CGRect)iconRect
{
  v14.receiver = self;
  v14.super_class = (Class)UISearchField;
  [(UITextField *)&v14 iconRect];
  double v4 = v3;
  double v6 = v5;
  UIRoundToViewScale(self);
  double v8 = v7;
  UIRoundToViewScale(self);
  double v10 = v9;
  double v11 = v8;
  double v12 = v4;
  double v13 = v6;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v10;
  result.origin.x = v11;
  return result;
}

- (CGRect)_availableTextRectExcludingButtonsForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  UIRoundToViewScale(self);
  double v8 = _UICGRectInsetZeroClamped(x, y, width, height, v7, 2.0);
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UISearchField;
  -[UITextField rightViewRectForBounds:](&v8, sel_rightViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v7 = v6 + 6.0;
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v7;
  return result;
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 0;
}

@end