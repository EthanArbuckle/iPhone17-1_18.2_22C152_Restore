@interface UIFont
- (double)_compass_scaledValueForValue:(double)a3;
@end

@implementation UIFont

- (double)_compass_scaledValueForValue:(double)a3
{
  [(UIFont *)self _scaledValueForValue:a3];
  return ceil(v3);
}

@end