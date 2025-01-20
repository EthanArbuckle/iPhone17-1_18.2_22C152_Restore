@interface ColorAnalyzer
- (BOOL)isDarkColor:(CGColor *)a3;
- (double)colorLuminance:(CGColor *)a3;
@end

@implementation ColorAnalyzer

- (BOOL)isDarkColor:(CGColor *)a3
{
  v4 = self;

  return [v4 isDarkColor:a3];
}

- (double)colorLuminance:(CGColor *)a3
{
  v4 = self;

  [v4 colorLuminance:a3];
  return result;
}

@end