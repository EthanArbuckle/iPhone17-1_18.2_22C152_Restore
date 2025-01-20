@interface EQKitMathMLMTable
- (BOOL)isBaseFontNameUsed;
- (NSString)description;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (id)schemataChildren;
- (void)dealloc;
@end

@implementation EQKitMathMLMTable

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  [a4 pushState:2];
  v7 = (void *)[a4 parseChildrenAsArrayFromXMLNode:a3];
  v20.receiver = self;
  v20.super_class = (Class)EQKitMathMLMTable;
  v8 = [(EQKitMathMLMTable *)&v20 init];
  v9 = v8;
  if (a4)
  {
    if (a3)
    {
      if (v8)
      {
        v10 = v7;
        v9->mChildren = v10;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v17;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v10);
              }
              [*(id *)(*((void *)&v16 + 1) + 8 * v14++) setParent:v9];
            }
            while (v12 != v14);
            uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
          }
          while (v12);
        }
      }
    }
  }
  [a4 popState];
  return v9;
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMTable mathMLAttributes]::sAttributesSet, -[EQKitMathMLMTable mathMLAttributes]::sAttributesData, (int *)&-[EQKitMathMLMTr mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMTable mathMLAttributes]::sAttributesSet;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMTable;
  [(EQKitMathMLMTable *)&v3 dealloc];
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

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@ %p %@>", NSStringFromClass(v4), self, self->mChildren];
}

- (id)schemataChildren
{
  return self->mChildren;
}

@end