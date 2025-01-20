@interface NSValue(PXEdgeInsets)
+ (id)valueWithPXEdgeInsets:()PXEdgeInsets;
- (double)PXEdgeInsetsValue;
@end

@implementation NSValue(PXEdgeInsets)

- (double)PXEdgeInsetsValue
{
  v2[0] = PXEdgeInsetsNull;
  v2[1] = unk_259D74BA0;
  [a1 getValue:v2];
  return *(double *)v2;
}

+ (id)valueWithPXEdgeInsets:()PXEdgeInsets
{
  *(double *)v6 = a1;
  *(double *)&v6[1] = a2;
  *(double *)&v6[2] = a3;
  *(double *)&v6[3] = a4;
  v4 = (void *)[objc_alloc(MEMORY[0x263F08D40]) initWithBytes:v6 objCType:"{UIEdgeInsets=dddd}"];

  return v4;
}

@end