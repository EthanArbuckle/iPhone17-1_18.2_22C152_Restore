@interface EQKitMathMLMath
- (AttributeCollection)attributeCollection;
- (BOOL)isAttributeDefaultInheritableFromStyle:(int)a3;
- (BOOL)isBaseFontNameUsed;
- (BOOL)isEmbellishedOperator;
- (BOOL)isNumber;
- (BOOL)isSpaceLike;
- (EQKitLayoutNode)parent;
- (EQKitMathMLMath)init;
- (NSString)description;
- (Schemata)layoutSchemata;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (id)layoutStyleNode;
- (id)newLayout;
- (id)operatorCore;
- (int)isOperatorPaddingRequired;
- (int64_t)scriptLevelWithBase:(int64_t)a3;
- (void)dealloc;
@end

@implementation EQKitMathMLMath

- (EQKitMathMLMath)init
{
  return (EQKitMathMLMath *)[(EQKitMathMLMath *)self initFromXMLNode:0 parser:0];
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  if (!a3 || !a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EQKitMathMLMath.mm", 53, @"invalid arguments");
  }
  v12.receiver = self;
  v12.super_class = (Class)EQKitMathMLMath;
  v7 = [(EQKitMathMLMath *)&v12 init];
  if (v7)
  {
    v8 = operator new(0x230uLL, MEMORY[0x263F8C180]);
    if (v8)
    {
      v9 = v8;
      v7->mAttributeCollection = EQKit::AttributeCollection::AttributeCollection(v8);
      [a4 setAttributeCollection:v9];
      v10 = (EQKitMathMLNode *)(id)[a4 parseChildrenAsNodeFromXMLNode:a3];
      v7->mExpression = v10;
      [(EQKitMathMLNode *)v10 setParent:v7];
    }
    else
    {
      v7->mAttributeCollection = 0;
    }
    if (v7->mExpression)
    {
      v7->mEnvironment = (EQKitEnvironmentInstance *)(id)[a4 environment];
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMath mathMLAttributes]::sAttributesSet, &-[EQKitMathMLMath mathMLAttributes]::sAttributesData, -[EQKitMathMLMFenced mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMath mathMLAttributes]::sAttributesSet;
}

- (void)dealloc
{
  mAttributeCollection = self->mAttributeCollection;
  if (mAttributeCollection) {
    (*(void (**)(void *, SEL))(*(void *)mAttributeCollection + 8))(mAttributeCollection, a2);
  }

  v4.receiver = self;
  v4.super_class = (Class)EQKitMathMLMath;
  [(EQKitMathMLMath *)&v4 dealloc];
}

- (AttributeCollection)attributeCollection
{
  return (AttributeCollection *)self->mAttributeCollection;
}

- (id)newLayout
{
  v3 = [EQKitLayout alloc];
  mEnvironment = self->mEnvironment;

  return [(EQKitLayout *)v3 initWithRoot:self environment:mEnvironment];
}

- (EQKitLayoutNode)parent
{
  return 0;
}

- (Schemata)layoutSchemata
{
  if (self->mExpression) {
    objc_super v4 = (EQKit::Layout::Schemata *)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:");
  }
  else {
    objc_super v4 = (EQKit::Layout::Schemata *)[MEMORY[0x263EFF8C0] array];
  }

  return (Schemata *)EQKit::Layout::Schemata::row(v4, (uint64_t)retstr);
}

- (id)layoutStyleNode
{
  return 0;
}

- (int64_t)scriptLevelWithBase:(int64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isNumber
{
  return 0;
}

- (BOOL)isSpaceLike
{
  return 0;
}

- (BOOL)isEmbellishedOperator
{
  return 0;
}

- (id)operatorCore
{
  return 0;
}

- (int)isOperatorPaddingRequired
{
  return 1;
}

- (BOOL)isBaseFontNameUsed
{
  return [(EQKitMathMLNode *)self->mExpression isBaseFontNameUsed];
}

- (BOOL)isAttributeDefaultInheritableFromStyle:(int)a3
{
  return 0;
}

- (NSString)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@ %p expr=%@>", NSStringFromClass(v4), self, self->mExpression];
}

@end