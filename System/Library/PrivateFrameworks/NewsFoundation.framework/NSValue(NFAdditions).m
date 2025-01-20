@interface NSValue(NFAdditions)
+ (id)nf_valueWithCGPoint:()NFAdditions;
+ (id)nf_valueWithCGRect:()NFAdditions;
- (double)nf_CGPointValue;
- (double)nf_CGRectValue;
@end

@implementation NSValue(NFAdditions)

+ (id)nf_valueWithCGRect:()NFAdditions
{
  *(double *)v6 = a1;
  *(double *)&v6[1] = a2;
  *(double *)&v6[2] = a3;
  *(double *)&v6[3] = a4;
  v4 = [MEMORY[0x263F08D40] valueWithBytes:v6 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  return v4;
}

- (double)nf_CGRectValue
{
  memset(v2, 0, sizeof(v2));
  _getNSValueBytes(a1, v2, 0x20uLL);
  return *(double *)v2;
}

+ (id)nf_valueWithCGPoint:()NFAdditions
{
  *(double *)v4 = a1;
  *(double *)&v4[1] = a2;
  v2 = [MEMORY[0x263F08D40] valueWithBytes:v4 objCType:"{CGPoint=dd}"];
  return v2;
}

- (double)nf_CGPointValue
{
  v2[0] = 0;
  v2[1] = 0;
  _getNSValueBytes(a1, v2, 0x10uLL);
  return *(double *)v2;
}

@end