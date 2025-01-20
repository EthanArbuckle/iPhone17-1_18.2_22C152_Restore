@interface _UITextFieldBezelBackgroundProvider
+ (id)bezelStyleMetricsProvider;
- (id)preferredMetricsProvider;
- (int64_t)associatedBorderStyle;
- (void)addToTextField:(id)a3;
- (void)drawInBounds:(CGRect)a3;
- (void)enabledDidChangeAnimated:(BOOL)a3;
@end

@implementation _UITextFieldBezelBackgroundProvider

+ (id)bezelStyleMetricsProvider
{
  v2 = -[_UITextFieldPaddedMetricsProvider initWithPerEdgePadding:]([_UITextFieldPaddedMetricsProvider alloc], "initWithPerEdgePadding:", 4.0, 7.0, 1.0, 7.0);
  return v2;
}

- (id)preferredMetricsProvider
{
  return +[_UITextFieldBezelBackgroundProvider bezelStyleMetricsProvider];
}

- (int64_t)associatedBorderStyle
{
  return 2;
}

- (void)addToTextField:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UITextFieldBezelBackgroundProvider;
  id v3 = a3;
  [(_UITextFieldDrawingBackgroundProvider *)&v8 addToTextField:v3];
  v4 = objc_msgSend(v3, "_contentView", v8.receiver, v8.super_class);
  v5 = [v3 backgroundColor];

  if (v5)
  {
    [v5 alphaComponent];
    BOOL v7 = v6 == 1.0;
  }
  else
  {
    BOOL v7 = 0;
  }
  [v4 setOpaque:v7];
}

- (void)enabledDidChangeAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UITextFieldBezelBackgroundProvider;
  [(_UITextFieldBackgroundProvider *)&v4 enabledDidChangeAnimated:a3];
  [(_UITextFieldDrawingBackgroundProvider *)self setNeedsDisplay];
}

- (void)drawInBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(_UITextFieldDrawingBackgroundProvider *)self drawsContent])
  {
    id v14 = [(_UITextFieldBackgroundProvider *)self textField];
    objc_super v8 = [v14 traitCollection];
    uint64_t v9 = [v8 userInterfaceStyle];

    if (v9 == 2) {
      +[UIColor darkGrayColor];
    }
    else {
    v10 = +[UIColor lightGrayColor];
    }
    [v10 set];

    CGFloat v11 = x + 1.0;
    CGFloat v12 = y + 1.0;
    UIRectFrameUsingOperation(1, v11, v12, width, height);
    v13 = +[UIColor grayColor];
    [v13 set];

    UIRectFrameUsingOperation(1, v11 + -1.0, v12 + -1.0, width, height);
  }
}

@end