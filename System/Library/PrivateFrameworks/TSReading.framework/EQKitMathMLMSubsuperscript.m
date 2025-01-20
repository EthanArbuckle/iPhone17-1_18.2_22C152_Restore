@interface EQKitMathMLMSubsuperscript
- (BOOL)isEmbellishedOperator;
- (id)operatorCore;
- (id)schemataKernel;
- (id)schemataSubscript;
- (id)schemataSuperscript;
@end

@implementation EQKitMathMLMSubsuperscript

- (BOOL)isEmbellishedOperator
{
  return [(EQKitMathMLNode *)self->super.mFirst isEmbellishedOperator];
}

- (id)operatorCore
{
  return [(EQKitMathMLNode *)self->super.mFirst operatorCore];
}

- (id)schemataKernel
{
  return self->super.mFirst;
}

- (id)schemataSubscript
{
  return self->super.mSecond;
}

- (id)schemataSuperscript
{
  return self->super.mThird;
}

@end