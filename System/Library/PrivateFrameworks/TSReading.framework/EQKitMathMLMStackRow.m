@interface EQKitMathMLMStackRow
- (BOOL)isBaseFontNameUsed;
- (EQKitMathMLMStackRow)initWithChildren:(id)a3;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (id)schemataChildren;
- (void)dealloc;
@end

@implementation EQKitMathMLMStackRow

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  uint64_t v5 = [a4 parseChildrenAsArrayFromXMLNode:a3];
  return [(EQKitMathMLMStackRow *)self initWithChildren:v5];
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMStackRow mathMLAttributes]::sAttributesSet, &-[EQKitMathMLMStackRow mathMLAttributes]::sAttributesData, -[EQKitMathMLMTable mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMStackRow mathMLAttributes]::sAttributesSet;
}

- (EQKitMathMLMStackRow)initWithChildren:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)EQKitMathMLMStackRow;
  v4 = [(EQKitMathMLMStackRow *)&v15 init];
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

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMStackRow;
  [(EQKitMathMLMStackRow *)&v3 dealloc];
}

- (BOOL)isBaseFontNameUsed
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  mChildren = self->mChildren;
  uint64_t v3 = [(NSArray *)mChildren countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(mChildren);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * v6) isBaseFontNameUsed])
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [(NSArray *)mChildren countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (id)schemataChildren
{
  return self->mChildren;
}

@end