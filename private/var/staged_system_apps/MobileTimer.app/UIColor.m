@interface UIColor
- (id)highlightedShade;
- (id)normalShade;
@end

@implementation UIColor

- (id)normalShade
{
  return [(UIColor *)self colorWithAlphaComponent:0.28];
}

- (id)highlightedShade
{
  return [(UIColor *)self colorWithAlphaComponent:0.1];
}

@end