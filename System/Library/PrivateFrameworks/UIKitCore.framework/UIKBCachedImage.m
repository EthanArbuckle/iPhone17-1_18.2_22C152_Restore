@interface UIKBCachedImage
+ (BOOL)supportsSecureCoding;
- (BOOL)hasFormatColor;
- (UIColor)formatColor;
- (void)setFormatColor:(id)a3;
@end

@implementation UIKBCachedImage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)hasFormatColor
{
  return CGImageGetProperty() != 0;
}

- (UIColor)formatColor
{
  [(UIImage *)self CGImage];
  if (CGImageGetProperty()) {
    +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:");
  }
  else {
  v2 = +[UIColor whiteColor];
  }
  return (UIColor *)v2;
}

- (void)setFormatColor:(id)a3
{
  if (a3)
  {
    v4 = self;
    id v5 = a3;
    [(UIImage *)v4 CGImage];
    id v6 = v5;
    [v6 CGColor];

    CGImageSetProperty();
  }
}

@end