@interface EQKitMathMLMFenced
- (BOOL)isBaseFontNameUsed;
- (EQKitMathMLMFenced)init;
- (EQKitMathMLMFenced)initWithChildren:(id)a3;
- (EQKitMathMLMFenced)initWithChildren:(id)a3 node:(_xmlNode *)a4;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (id)schemataChildren;
- (int)isOperatorPaddingRequired;
- (void)dealloc;
@end

@implementation EQKitMathMLMFenced

- (EQKitMathMLMFenced)init
{
  uint64_t v3 = [MEMORY[0x263EFF8C0] array];

  return [(EQKitMathMLMFenced *)self initWithChildren:v3];
}

- (EQKitMathMLMFenced)initWithChildren:(id)a3
{
  return [(EQKitMathMLMFenced *)self initWithChildren:a3 node:0];
}

- (EQKitMathMLMFenced)initWithChildren:(id)a3 node:(_xmlNode *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)EQKitMathMLMFenced;
  v5 = [(EQKitMathMLMFenced *)&v16 init];
  if (v5)
  {
    v6 = (NSArray *)a3;
    v5->mChildren = v6;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v10++) setParent:v5];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  uint64_t v6 = objc_msgSend(a4, "parseChildrenAsArrayFromXMLNode:");

  return [(EQKitMathMLMFenced *)self initWithChildren:v6 node:a3];
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMFenced mathMLAttributes]::sAttributesSet, -[EQKitMathMLMFenced mathMLAttributes]::sAttributesData, -[EQKitMathMLMFraction mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMFenced mathMLAttributes]::sAttributesSet;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMFenced;
  [(EQKitMathMLMFenced *)&v3 dealloc];
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

- (int)isOperatorPaddingRequired
{
  return 2;
}

- (id)schemataChildren
{
  return self->mChildren;
}

@end