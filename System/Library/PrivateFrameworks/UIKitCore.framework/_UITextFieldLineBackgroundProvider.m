@interface _UITextFieldLineBackgroundProvider
+ (id)lineStyleMetricsProvider;
- (id)preferredMetricsProvider;
- (int64_t)associatedBorderStyle;
- (void)drawInBounds:(CGRect)a3;
- (void)enabledDidChangeAnimated:(BOOL)a3;
@end

@implementation _UITextFieldLineBackgroundProvider

+ (id)lineStyleMetricsProvider
{
  v2 = -[_UITextFieldPaddedMetricsProvider initWithSymmetricalPadding:]([_UITextFieldPaddedMetricsProvider alloc], "initWithSymmetricalPadding:", 2.0, 2.0);
  return v2;
}

- (id)preferredMetricsProvider
{
  return +[_UITextFieldLineBackgroundProvider lineStyleMetricsProvider];
}

- (int64_t)associatedBorderStyle
{
  return 1;
}

- (void)enabledDidChangeAnimated:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UITextFieldLineBackgroundProvider;
  [(_UITextFieldBackgroundProvider *)&v5 enabledDidChangeAnimated:a3];
  v4 = [(_UITextFieldBackgroundProvider *)self textField];
  [v4 setNeedsDisplay];
}

- (void)drawInBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(_UITextFieldDrawingBackgroundProvider *)self drawsContent])
  {
    id v9 = [(_UITextFieldBackgroundProvider *)self textField];
    if ([v9 isEnabled]) {
      +[UIColor labelColor];
    }
    else {
    v8 = +[UIColor grayColor];
    }
    [v8 set];
    UIRectFrameUsingOperation(1, x, y, width, height);
  }
}

@end