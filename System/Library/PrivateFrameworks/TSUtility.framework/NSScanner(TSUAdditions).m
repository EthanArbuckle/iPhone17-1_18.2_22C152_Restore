@interface NSScanner(TSUAdditions)
- (double)tsu_scanCGFloat:()TSUAdditions;
@end

@implementation NSScanner(TSUAdditions)

- (double)tsu_scanCGFloat:()TSUAdditions
{
  double v5 = 0.0;
  [a1 scanDouble:&v5];
  double result = v5;
  *a3 = v5;
  return result;
}

@end