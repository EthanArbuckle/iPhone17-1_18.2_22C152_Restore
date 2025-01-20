@interface EQKitMathMLMStackGroup
- (BOOL)isBaseFontNameUsed;
- (EQKitMathMLMStackGroup)initWithChildren:(id)a3;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (id)schemataChildren;
- (void)dealloc;
@end

@implementation EQKitMathMLMStackGroup

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  uint64_t v5 = [a4 parseChildrenAsArrayFromXMLNode:a3];

  return [(EQKitMathMLMStackGroup *)self initWithChildren:v5];
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMStackGroup mathMLAttributes]::sAttributesSet, (int *)&-[EQKitMathMLMStackGroup mathMLAttributes]::sAttributesData, (int *)&-[EQKitMathMLMStackLine mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMStackGroup mathMLAttributes]::sAttributesSet;
}

- (EQKitMathMLMStackGroup)initWithChildren:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)EQKitMathMLMStackGroup;
  v4 = [(EQKitMathMLMStackGroup *)&v22 init];
  if (v4)
  {
    uint64_t v5 = [a3 count];
    if (v5)
    {
      uint64_t v6 = v5;
      v7 = 0;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v9 = [a3 objectAtIndex:i];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v7)
                {
                  v7 = (void *)[a3 mutableCopy];
                  a3 = v7;
                }
                v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v9, 0);
                v11 = [[EQKitMathMLMStackRow alloc] initWithChildren:v10];
                [v7 replaceObjectAtIndex:i withObject:v11];
              }
            }
          }
        }
      }
    }
    else
    {
      v7 = 0;
    }
    v4->mChildren = (NSArray *)a3;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    mChildren = v4->mChildren;
    uint64_t v13 = [(NSArray *)mChildren countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(mChildren);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * j) setParent:v4];
        }
        uint64_t v14 = [(NSArray *)mChildren countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v14);
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMStackGroup;
  [(EQKitMathMLMStackGroup *)&v3 dealloc];
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