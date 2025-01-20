@interface EQKitMathMLMStackCarries
- (BOOL)isBaseFontNameUsed;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (id)schemataChildren;
- (void)dealloc;
@end

@implementation EQKitMathMLMStackCarries

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)EQKitMathMLMStackCarries;
  v6 = [(EQKitMathMLMStackCarries *)&v24 init];
  if (v6)
  {
    v7 = (void *)[a4 parseChildrenAsArrayFromXMLNode:a3];
    uint64_t v8 = [v7 count];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      v11 = 0;
      do
      {
        uint64_t v12 = [v7 objectAtIndex:v10];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v11)
            {
              v11 = (void *)[v7 mutableCopy];
              v7 = v11;
            }
            v13 = [[EQKitMathMLMStackCarry alloc] initWithChild:v12];
            [v11 replaceObjectAtIndex:v10 withObject:v13];
          }
        }
        ++v10;
      }
      while (v9 != v10);
    }
    else
    {
      v11 = 0;
    }
    v14 = v7;
    v6->mChildren = v14;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * v18++) setParent:v6];
        }
        while (v16 != v18);
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v16);
    }
  }
  return v6;
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMStackCarries mathMLAttributes]::sAttributesSet, (int *)&-[EQKitMathMLMStackCarries mathMLAttributes]::sAttributesData, (int *)&-[EQKitMathMLMStackCarry mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMStackCarries mathMLAttributes]::sAttributesSet;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMStackCarries;
  [(EQKitMathMLMStackCarries *)&v3 dealloc];
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