@interface EQKitMathMLMRow
- (BOOL)isBaseFontNameUsed;
- (BOOL)isEmbellishedOperator;
- (EQKitMathMLMRow)init;
- (EQKitMathMLMRow)initWithChildren:(id)a3;
- (EQKitMathMLMRow)initWithChildren:(id)a3 node:(_xmlNode *)a4;
- (NSString)description;
- (Schemata)layoutSchemata;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (id)operatorCore;
- (id)schemataChildren;
- (int)isOperatorPaddingRequired;
- (void)dealloc;
@end

@implementation EQKitMathMLMRow

- (EQKitMathMLMRow)init
{
  uint64_t v3 = [MEMORY[0x263EFF8C0] array];

  return [(EQKitMathMLMRow *)self initWithChildren:v3];
}

- (EQKitMathMLMRow)initWithChildren:(id)a3
{
  return [(EQKitMathMLMRow *)self initWithChildren:a3 node:0];
}

- (EQKitMathMLMRow)initWithChildren:(id)a3 node:(_xmlNode *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)EQKitMathMLMRow;
  v6 = [(EQKitMathMLMRow *)&v17 init];
  if (v6)
  {
    v6->mChildren = (NSArray *)a3;
    v6->mFlags.mImplied = a4 == 0;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    mChildren = v6->mChildren;
    uint64_t v8 = [(NSArray *)mChildren countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(mChildren);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) setParent:v6];
        }
        uint64_t v9 = [(NSArray *)mChildren countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v9);
    }
  }
  return v6;
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  uint64_t v6 = objc_msgSend(a4, "parseChildrenAsArrayFromXMLNode:");

  return [(EQKitMathMLMRow *)self initWithChildren:v6 node:a3];
}

- (const)mathMLAttributes
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMRow;
  [(EQKitMathMLMRow *)&v3 dealloc];
}

- (Schemata)layoutSchemata
{
  return (Schemata *)EQKit::Layout::Schemata::row((EQKit::Layout::Schemata *)self->mChildren, (uint64_t)retstr);
}

- (BOOL)isEmbellishedOperator
{
  v2 = EQKitLayoutFilterOutSpaceLike(self->mChildren);
  if ([(NSArray *)v2 count] != 1) {
    return 0;
  }
  id v3 = [(NSArray *)v2 objectAtIndex:0];

  return [v3 isEmbellishedOperator];
}

- (id)operatorCore
{
  v2 = EQKitLayoutFilterOutSpaceLike(self->mChildren);
  if ([(NSArray *)v2 count] != 1) {
    return 0;
  }
  id v3 = [(NSArray *)v2 objectAtIndex:0];

  return (id)[v3 operatorCore];
}

- (int)isOperatorPaddingRequired
{
  return 2;
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
  uint64_t v5 = NSStringFromClass(v4);
  if (self->mFlags.mImplied) {
    uint64_t v6 = @"implied ";
  }
  else {
    uint64_t v6 = &stru_26D688A48;
  }
  return (NSString *)[v3 stringWithFormat:@"<%@ %p %@%@>", v5, self, v6, self->mChildren];
}

- (id)schemataChildren
{
  return self->mChildren;
}

@end