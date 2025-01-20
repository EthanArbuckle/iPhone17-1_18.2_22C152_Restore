@interface EQKitMathMLMAction
- (BOOL)isEmbellishedOperator;
- (Schemata)layoutSchemata;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (id)operatorCore;
- (void)dealloc;
@end

@implementation EQKitMathMLMAction

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)EQKitMathMLMAction;
  v6 = [(EQKitMathMLMAction *)&v10 init];
  if (v6)
  {
    v7 = (void *)[a4 parseChildrenAsArrayFromXMLNode:a3];
    if ([v7 count])
    {
      v8 = (EQKitMathMLNode *)(id)[v7 objectAtIndex:0];
      v6->mExpression = v8;
      [(EQKitMathMLNode *)v8 setParent:v6];
    }
    else
    {
      [a4 reportError:5 withNode:a3];

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMAction;
  [(EQKitMathMLMAction *)&v3 dealloc];
}

- (const)mathMLAttributes
{
  return 0;
}

- (Schemata)layoutSchemata
{
  return (Schemata *)EQKit::Layout::Schemata::node(self->mExpression, (uint64_t)retstr);
}

- (BOOL)isEmbellishedOperator
{
  return [(EQKitMathMLNode *)self->mExpression isEmbellishedOperator];
}

- (id)operatorCore
{
  return [(EQKitMathMLNode *)self->mExpression operatorCore];
}

@end