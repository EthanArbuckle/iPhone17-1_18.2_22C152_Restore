@interface NSScanner
- (BOOL)tsu_scanCGFloat:(double *)a3;
@end

@implementation NSScanner

- (BOOL)tsu_scanCGFloat:(double *)a3
{
  uint64_t v5 = 0;
  BOOL result = [(NSScanner *)self scanDouble:&v5];
  *(void *)a3 = v5;
  return result;
}

@end