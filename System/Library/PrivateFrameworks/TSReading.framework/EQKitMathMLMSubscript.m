@interface EQKitMathMLMSubscript
- (BOOL)isEmbellishedOperator;
- (id)operatorCore;
- (id)schemataKernel;
- (id)schemataSubscript;
- (id)schemataSuperscript;
@end

@implementation EQKitMathMLMSubscript

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
  return 0;
}

@end