@interface EQKitMathMLMSqrt
- (id)schemataIndex;
- (id)schemataRadicand;
@end

@implementation EQKitMathMLMSqrt

- (id)schemataRadicand
{
  return self->super.mChild;
}

- (id)schemataIndex
{
  return 0;
}

@end