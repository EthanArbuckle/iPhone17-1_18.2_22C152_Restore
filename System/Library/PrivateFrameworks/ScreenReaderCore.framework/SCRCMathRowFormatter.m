@interface SCRCMathRowFormatter
- (BOOL)isNumberOverride;
- (NSMutableArray)childrenStack;
- (SCRCMathRowFormatter)init;
- (SCRCMathRowFormatter)initWithIsNumberOverride:(BOOL)a3;
- (id)mathEquation;
- (void)_addDictionary:(id)a3;
- (void)addCloseParenthesis:(BOOL)a3;
- (void)addIdentifier:(id)a3;
- (void)addNumber:(id)a3 implicit:(BOOL)a4;
- (void)addOpenParenthesis;
- (void)addOperator:(id)a3 implicit:(BOOL)a4;
- (void)addRadicalWithRootIndex:(id)a3;
- (void)addSubscript:(id)a3 superscript:(id)a4;
- (void)appendMathEquation:(id)a3;
- (void)setChildrenStack:(id)a3;
- (void)setIsNumberOverride:(BOOL)a3;
@end

@implementation SCRCMathRowFormatter

- (void).cxx_destruct
{
}

- (void)addNumber:(id)a3 implicit:(BOOL)a4
{
  v11[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    BOOL v4 = a4;
    v10[0] = @"AXMType";
    v10[1] = @"AXMContent";
    v11[0] = @"Number";
    v11[1] = a3;
    v6 = NSDictionary;
    id v7 = a3;
    v8 = [v6 dictionaryWithObjects:v11 forKeys:v10 count:2];

    v9 = (void *)[v8 mutableCopy];
    if (v4) {
      [v9 setObject:MEMORY[0x263EFFA88] forKey:@"AXMIsImplicit"];
    }
    [(SCRCMathRowFormatter *)self _addDictionary:v9];
  }
}

- (id)mathEquation
{
  v17[3] = *MEMORY[0x263EF8340];
  v3 = [(SCRCMathRowFormatter *)self childrenStack];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(SCRCMathRowFormatter *)self childrenStack];
    v6 = [v5 firstObject];

    if ([v6 count] == 1)
    {
      uint64_t v7 = [v6 firstObject];
    }
    else
    {
      if ([(SCRCMathRowFormatter *)self isNumberOverride])
      {
        v16[0] = @"AXMType";
        v16[1] = @"AXMChildren";
        v17[0] = @"Row";
        v17[1] = v6;
        v16[2] = @"AXMIsNumberOverride";
        v17[2] = MEMORY[0x263EFFA88];
        v9 = NSDictionary;
        v10 = v17;
        v11 = v16;
        uint64_t v12 = 3;
      }
      else
      {
        v14[0] = @"AXMType";
        v14[1] = @"AXMChildren";
        v15[0] = @"Row";
        v15[1] = v6;
        v9 = NSDictionary;
        v10 = v15;
        v11 = v14;
        uint64_t v12 = 2;
      }
      uint64_t v7 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:v12];
    }
    v8 = (void *)v7;
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)_addDictionary:(id)a3
{
  id v20 = a3;
  if (v20)
  {
    uint64_t v4 = [(SCRCMathRowFormatter *)self childrenStack];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      v6 = [(SCRCMathRowFormatter *)self childrenStack];
      uint64_t v7 = [v6 lastObject];

      if ([v7 count])
      {
        v8 = [v7 lastObject];
        v9 = [v8 objectForKeyedSubscript:@"AXMType"];
        if ([v9 isEqualToString:@"RootOperation"])
        {
          v10 = [v7 lastObject];
          v11 = [v10 objectForKeyedSubscript:@"AXMRadicandObject"];

          if (!v11)
          {
            uint64_t v12 = [v7 lastObject];
            v13 = (void *)[v12 mutableCopy];

            [v13 setObject:v20 forKeyedSubscript:@"AXMRadicandObject"];
            [v7 removeLastObject];
            [v7 addObject:v13];

LABEL_12:
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v14 = [v7 count];
      id v15 = v20;
      if (v14
        && ([v20 objectForKeyedSubscript:@"AXMType"],
            v16 = objc_claimAutoreleasedReturnValue(),
            int v17 = [v16 isEqualToString:@"SubSuperScript"],
            v16,
            id v15 = v20,
            v17))
      {
        v18 = (void *)[v20 mutableCopy];
        v19 = [v7 lastObject];
        [v18 setObject:v19 forKey:@"AXMBaseObject"];

        [v7 removeLastObject];
        [v7 addObject:v18];
      }
      else
      {
        [v7 addObject:v15];
      }
      goto LABEL_12;
    }
  }
LABEL_13:
}

- (NSMutableArray)childrenStack
{
  return self->_childrenStack;
}

- (SCRCMathRowFormatter)initWithIsNumberOverride:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SCRCMathRowFormatter;
  uint64_t v4 = [(SCRCMathRowFormatter *)&v10 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    childrenStack = v4->_childrenStack;
    v4->_childrenStack = (NSMutableArray *)v5;

    uint64_t v7 = v4->_childrenStack;
    v8 = objc_opt_new();
    [(NSMutableArray *)v7 addObject:v8];

    v4->_isNumberOverride = a3;
  }
  return v4;
}

- (SCRCMathRowFormatter)init
{
  return [(SCRCMathRowFormatter *)self initWithIsNumberOverride:0];
}

- (void)addOperator:(id)a3 implicit:(BOOL)a4
{
  BOOL v4 = a4;
  v14[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    if ([v6 length] == 1)
    {
      v8 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v7, "characterAtIndex:", 0));
      v13[0] = @"AXMType";
      v13[1] = @"AXMContent";
      v14[0] = @"Operator";
      v14[1] = v7;
      v13[2] = @"AXMUnichar";
      void v14[2] = v8;
      v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
      objc_super v10 = (void *)[v9 mutableCopy];
    }
    else
    {
      v11[0] = @"AXMType";
      v11[1] = @"AXMContent";
      v12[0] = @"Operator";
      v12[1] = v7;
      v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
      objc_super v10 = (void *)[v8 mutableCopy];
    }

    if (v4) {
      [v10 setObject:MEMORY[0x263EFFA88] forKey:@"AXMIsImplicit"];
    }
    if ([(SCRCMathRowFormatter *)self isNumberOverride]) {
      [v10 setObject:MEMORY[0x263EFFA88] forKey:@"AXMIsNumberOverride"];
    }
    [(SCRCMathRowFormatter *)self _addDictionary:v10];
  }
}

- (void)addIdentifier:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v8[0] = @"AXMType";
    v8[1] = @"AXMContent";
    v9[0] = @"Identifier";
    v9[1] = a3;
    BOOL v4 = NSDictionary;
    id v5 = a3;
    id v6 = [v4 dictionaryWithObjects:v9 forKeys:v8 count:2];

    uint64_t v7 = (void *)[v6 mutableCopy];
    if ([(SCRCMathRowFormatter *)self isNumberOverride]) {
      [v7 setObject:MEMORY[0x263EFFA88] forKey:@"AXMIsNumberOverride"];
    }
    [(SCRCMathRowFormatter *)self _addDictionary:v7];
  }
}

- (void)addRadicalWithRootIndex:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v8[0] = @"AXMType";
    v8[1] = @"AXMRootIndexObject";
    v9[0] = @"RootOperation";
    v9[1] = a3;
    BOOL v4 = NSDictionary;
    id v5 = a3;
    id v6 = [v4 dictionaryWithObjects:v9 forKeys:v8 count:2];

    uint64_t v7 = (void *)[v6 mutableCopy];
    if ([(SCRCMathRowFormatter *)self isNumberOverride]) {
      [v7 setObject:MEMORY[0x263EFFA88] forKey:@"AXMIsNumberOverride"];
    }
    [(SCRCMathRowFormatter *)self _addDictionary:v7];
  }
}

- (void)addOpenParenthesis
{
  id v3 = [(SCRCMathRowFormatter *)self childrenStack];
  v2 = objc_opt_new();
  [v3 addObject:v2];
}

- (void)addCloseParenthesis:(BOOL)a3
{
  BOOL v3 = a3;
  v13[4] = *MEMORY[0x263EF8340];
  id v5 = [(SCRCMathRowFormatter *)self childrenStack];
  unint64_t v6 = [v5 count];

  if (v6 >= 2)
  {
    uint64_t v7 = [(SCRCMathRowFormatter *)self childrenStack];
    v8 = [v7 lastObject];

    v9 = [(SCRCMathRowFormatter *)self childrenStack];
    [v9 removeLastObject];

    v12[0] = @"AXMType";
    v12[1] = @"AXMChildren";
    v13[0] = @"Fenced";
    v13[1] = v8;
    void v12[2] = @"AXMOpenOperator";
    v12[3] = @"AXMCloseOperator";
    v13[2] = CFSTR("(");
    void v13[3] = @"");
    objc_super v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];
    v11 = (void *)[v10 mutableCopy];

    if (v3) {
      [v11 setObject:MEMORY[0x263EFFA88] forKey:@"AXMIsImplicit"];
    }
    if ([(SCRCMathRowFormatter *)self isNumberOverride]) {
      [v11 setObject:MEMORY[0x263EFFA88] forKey:@"AXMIsNumberOverride"];
    }
    [(SCRCMathRowFormatter *)self _addDictionary:v11];
  }
}

- (void)addSubscript:(id)a3 superscript:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(SCRCMathRowFormatter *)self childrenStack];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = [MEMORY[0x263EFF9A0] dictionaryWithObject:@"SubSuperScript" forKey:@"AXMType"];
    if (v10) {
      [v9 setObject:v10 forKey:@"AXMSubscriptObject"];
    }
    if (v6) {
      [v9 setObject:v6 forKey:@"AXMSuperscriptObject"];
    }
    if ([(SCRCMathRowFormatter *)self isNumberOverride]) {
      [v9 setObject:MEMORY[0x263EFFA88] forKey:@"AXMIsNumberOverride"];
    }
    [(SCRCMathRowFormatter *)self _addDictionary:v9];
  }
}

- (void)appendMathEquation:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SCRCMathRowFormatter *)self childrenStack];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [v4 objectForKey:@"AXMType"];
    int v8 = [v7 isEqualToString:@"Row"];

    if (v8)
    {
      uint64_t v9 = [v4 objectForKey:@"AXMChildren"];
    }
    else
    {
      v13[0] = v4;
      uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    }
    id v10 = (void *)v9;
    v11 = [(SCRCMathRowFormatter *)self childrenStack];
    uint64_t v12 = [v11 lastObject];

    [v12 addObjectsFromArray:v10];
  }
}

- (void)setChildrenStack:(id)a3
{
}

- (BOOL)isNumberOverride
{
  return self->_isNumberOverride;
}

- (void)setIsNumberOverride:(BOOL)a3
{
  self->_isNumberOverride = a3;
}

@end