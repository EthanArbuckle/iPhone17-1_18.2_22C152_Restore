@interface EQKitMathMLMRoot
- (id)schemataIndex;
- (id)schemataRadicand;
@end

@implementation EQKitMathMLMRoot

- (id)schemataRadicand
{
  return self->super.mFirst;
}

- (id)schemataIndex
{
  return self->super.mSecond;
}

@end