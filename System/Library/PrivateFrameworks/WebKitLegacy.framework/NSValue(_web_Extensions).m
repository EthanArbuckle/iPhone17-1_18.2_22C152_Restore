@interface NSValue(_web_Extensions)
+ (uint64_t)_web_valueWithCGRect:()_web_Extensions;
- (double)_web_CGRectValue;
@end

@implementation NSValue(_web_Extensions)

+ (uint64_t)_web_valueWithCGRect:()_web_Extensions
{
  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  *(double *)&v5[3] = a4;
  return [MEMORY[0x1E4F29238] valueWithBytes:v5 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
}

- (double)_web_CGRectValue
{
  [a1 getValue:&v2];
  return v2;
}

@end