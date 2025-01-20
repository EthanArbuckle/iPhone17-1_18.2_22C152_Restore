@interface EQKitMathMLMStackCarry
- (EQKitMathMLMStackCarry)initWithChild:(id)a3;
- (EQKitMathMLMStackCarry)initWithChildren:(id)a3;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (id)schemataChildren;
- (void)dealloc;
@end

@implementation EQKitMathMLMStackCarry

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  uint64_t v5 = [a4 parseChildrenAsArrayFromXMLNode:a3];

  return [(EQKitMathMLMStackCarry *)self initWithChildren:v5];
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMStackCarry mathMLAttributes]::sAttributesSet, &-[EQKitMathMLMStackCarry mathMLAttributes]::sAttributesData, &dword_223837CC4);
  }
  return &-[EQKitMathMLMStackCarry mathMLAttributes]::sAttributesSet;
}

- (EQKitMathMLMStackCarry)initWithChildren:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)EQKitMathMLMStackCarry;
  v4 = [(EQKitMathMLMStackCarry *)&v15 init];
  if (v4)
  {
    uint64_t v5 = (NSArray *)a3;
    v4->mChildren = v5;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v9++) setParent:v4];
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

- (EQKitMathMLMStackCarry)initWithChild:(id)a3
{
  v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", a3, 0);
  uint64_t v5 = [(EQKitMathMLMStackCarry *)self initWithChildren:v4];

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMStackCarry;
  [(EQKitMathMLMStackCarry *)&v3 dealloc];
}

- (id)schemataChildren
{
  return self->mChildren;
}

@end