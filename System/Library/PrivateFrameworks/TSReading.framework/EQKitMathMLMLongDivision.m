@interface EQKitMathMLMLongDivision
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (id)schemataDivisor;
- (id)schemataStack;
- (void)dealloc;
@end

@implementation EQKitMathMLMLongDivision

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)EQKitMathMLMLongDivision;
  v6 = [(EQKitMathMLMLongDivision *)&v13 init];
  if (v6)
  {
    v7 = (void *)[a4 parseChildrenAsArrayFromXMLNode:a3];
    if ((unint64_t)[v7 count] < 3)
    {
      [a4 reportError:5 withNode:a3];

      return 0;
    }
    else
    {
      v8 = (EQKitMathMLNode *)(id)[v7 objectAtIndex:0];
      v6->mDivisor = v8;
      [(EQKitMathMLNode *)v8 setParent:v6];
      v9 = (void *)[v7 mutableCopy];
      [v9 removeObjectAtIndex:0];
      v10 = objc_alloc_init(EQKitMathMLMStackLine);
      [v9 insertObject:v10 atIndex:1];
      v11 = [[EQKitMathMLMStack alloc] initWithChildren:v9];
      v6->mStack = v11;
      [(EQKitMathMLNode *)v11 setParent:v6];
    }
  }
  return v6;
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMLongDivision mathMLAttributes]::sAttributesSet, &-[EQKitMathMLMLongDivision mathMLAttributes]::sAttributesData, &-[EQKitMathMLMStack mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMLongDivision mathMLAttributes]::sAttributesSet;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMLongDivision;
  [(EQKitMathMLMLongDivision *)&v3 dealloc];
}

- (id)schemataDivisor
{
  return self->mDivisor;
}

- (id)schemataStack
{
  return self->mStack;
}

@end