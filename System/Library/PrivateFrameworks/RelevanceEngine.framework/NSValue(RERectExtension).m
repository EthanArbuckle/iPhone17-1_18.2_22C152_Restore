@interface NSValue(RERectExtension)
+ (id)re_valueWithCGRect:()RERectExtension;
- (double)re_CGRectValue;
@end

@implementation NSValue(RERectExtension)

+ (id)re_valueWithCGRect:()RERectExtension
{
  *(double *)v7 = a2;
  *(double *)&v7[1] = a3;
  *(double *)&v7[2] = a4;
  *(double *)&v7[3] = a5;
  v5 = [a1 value:v7 withObjCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  return v5;
}

- (double)re_CGRectValue
{
  long long v1 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  v3[0] = *MEMORY[0x263F001A8];
  v3[1] = v1;
  [a1 getValue:v3 size:32];
  return *(double *)v3;
}

@end