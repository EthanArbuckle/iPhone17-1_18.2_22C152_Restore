@interface NSValue(PKPath)
+ (id)valueWithCGPoint:()PKPath;
- (double)CGPointValue;
@end

@implementation NSValue(PKPath)

+ (id)valueWithCGPoint:()PKPath
{
  *(double *)v4 = a1;
  *(double *)&v4[1] = a2;
  v2 = [MEMORY[0x263F08D40] valueWithBytes:v4 objCType:"{CGPoint=dd}"];

  return v2;
}

- (double)CGPointValue
{
  [a1 getValue:&v2];
  return v2;
}

@end