@interface REScriptASTObjectBuilder
- (REScriptASTObjectBuilder)initWithTable:(id)a3;
- (REScriptSymbolTable)table;
- (id)_errorForUnsupportedNode:(id)a3;
- (id)buildObjectWithBinaryExpressionListNode:(id)a3 previousExpression:(id)a4 error:(id *)a5;
- (id)buildObjectWithBinaryExpressionNode:(id)a3 previousExpression:(id)a4 error:(id *)a5;
- (id)buildObjectWithExpressionNode:(id)a3 error:(id *)a4;
- (id)buildObjectWithFunctionNode:(id)a3 error:(id *)a4;
- (id)buildObjectWithIdentifierNode:(id)a3 error:(id *)a4;
- (id)buildObjectWithLiteralNode:(id)a3 error:(id *)a4;
- (id)buildObjectWithMemberExpressionNode:(id)a3 error:(id *)a4;
- (id)buildObjectWithNode:(id)a3 error:(id *)a4;
- (id)buildObjectWithPrefixExpressionNode:(id)a3 error:(id *)a4;
- (id)buildObjectWithSubscriptExpressionNode:(id)a3 error:(id *)a4;
- (id)buildObjectWithTopLevelBinaryExpression:(id)a3 error:(id *)a4;
- (id)buildObjectWithTopLevelBinaryExpressionListNode:(id)a3 error:(id *)a4;
- (id)objectTypeErrorDescription;
@end

@implementation REScriptASTObjectBuilder

- (REScriptASTObjectBuilder)initWithTable:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REScriptASTObjectBuilder;
  v6 = [(REScriptASTObjectBuilder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_table, a3);
  }

  return v7;
}

- (id)buildObjectWithNode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = 0;
    v7 = (id *)&v20;
    uint64_t v8 = [(REScriptASTObjectBuilder *)self buildObjectWithIdentifierNode:v6 error:&v20];
LABEL_19:
    uint64_t v9 = v8;
    uint64_t v10 = (uint64_t)*v7;
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v19 = 0;
    v7 = (id *)&v19;
    uint64_t v8 = [(REScriptASTObjectBuilder *)self buildObjectWithLiteralNode:v6 error:&v19];
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = 0;
    v7 = (id *)&v18;
    uint64_t v8 = [(REScriptASTObjectBuilder *)self buildObjectWithExpressionNode:v6 error:&v18];
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = 0;
    v7 = (id *)&v17;
    uint64_t v8 = [(REScriptASTObjectBuilder *)self buildObjectWithPrefixExpressionNode:v6 error:&v17];
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = 0;
    v7 = (id *)&v16;
    uint64_t v8 = [(REScriptASTObjectBuilder *)self buildObjectWithFunctionNode:v6 error:&v16];
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = 0;
    v7 = (id *)&v15;
    uint64_t v8 = [(REScriptASTObjectBuilder *)self buildObjectWithMemberExpressionNode:v6 error:&v15];
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = 0;
    v7 = (id *)&v14;
    uint64_t v8 = [(REScriptASTObjectBuilder *)self buildObjectWithSubscriptExpressionNode:v6 error:&v14];
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = 0;
    v7 = (id *)&v13;
    uint64_t v8 = [(REScriptASTObjectBuilder *)self buildObjectWithTopLevelBinaryExpression:v6 error:&v13];
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = 0;
    v7 = (id *)&v12;
    uint64_t v8 = [(REScriptASTObjectBuilder *)self buildObjectWithTopLevelBinaryExpressionListNode:v6 error:&v12];
    goto LABEL_19;
  }
  uint64_t v10 = 0;
  uint64_t v9 = 0;
LABEL_20:
  if (!(v9 | v10))
  {
    uint64_t v10 = [(REScriptASTObjectBuilder *)self _errorForUnsupportedNode:v6];
  }
  if (a4) {
    *a4 = (id) v10;
  }

  return (id)v9;
}

- (id)buildObjectWithExpressionNode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 prefixExpression];
  uint64_t v8 = [(REScriptASTObjectBuilder *)self buildObjectWithNode:v7 error:a4];

  uint64_t v9 = [v6 binaryExpressions];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [(REScriptASTObjectBuilder *)self buildObjectWithBinaryExpressionListNode:v9 previousExpression:v8 error:a4];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [(REScriptASTObjectBuilder *)self buildObjectWithBinaryExpressionNode:v9 previousExpression:v8 error:a4];
LABEL_5:
    v11 = (void *)v10;
    if (v10) {
      goto LABEL_9;
    }
  }
  if (*a4)
  {
    v11 = 0;
  }
  else
  {
    [(REScriptASTObjectBuilder *)self _errorForUnsupportedNode:v9];
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:

  return v11;
}

- (id)buildObjectWithTopLevelBinaryExpression:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 binaryOperator];
  uint64_t v8 = [v7 type];

  if ((unint64_t)(v8 - 29) > 1)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v9 = [v6 expression];
    uint64_t v10 = [(REScriptASTObjectBuilder *)self buildObjectWithNode:v9 error:a4];
  }
  return v10;
}

- (id)buildObjectWithTopLevelBinaryExpressionListNode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 expressions];
  uint64_t v8 = [v7 firstObject];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(REScriptASTObjectBuilder *)self buildObjectWithTopLevelBinaryExpression:v8 error:a4], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v10 = (void *)v9;
    v11 = [v6 expressions];
    uint64_t v12 = (void *)[v11 mutableCopy];

    [v12 removeObjectAtIndex:0];
    uint64_t v13 = [[REScriptASTBinaryExpressionListNode alloc] initWithExpressions:v12];
    uint64_t v14 = [(REScriptASTObjectBuilder *)self buildObjectWithBinaryExpressionListNode:v13 previousExpression:v10 error:a4];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)buildObjectWithBinaryExpressionListNode:(id)a3 previousExpression:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 expressions];
  uint64_t v11 = [v10 count];

  uint64_t v12 = v9;
  if (v11)
  {
    uint64_t v13 = 0;
    id v14 = v9;
    while (1)
    {
      uint64_t v15 = [v8 expressions];
      uint64_t v16 = [v15 objectAtIndexedSubscript:v13];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      uint64_t v17 = [(REScriptASTObjectBuilder *)self buildObjectWithBinaryExpressionNode:v16 previousExpression:v14 error:a5];
      if (!v17) {
        break;
      }
      uint64_t v12 = (void *)v17;

      ++v13;
      id v14 = v12;
      if (v11 == v13) {
        goto LABEL_6;
      }
    }
    if (a5 && !*a5)
    {
      *a5 = [(REScriptASTObjectBuilder *)self _errorForUnsupportedNode:v16];
    }

    uint64_t v18 = 0;
  }
  else
  {
LABEL_6:
    id v14 = v12;
    uint64_t v18 = v14;
  }

  return v18;
}

- (id)_errorForUnsupportedNode:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  v4 = NSString;
  id v5 = a3;
  id v6 = [(REScriptASTObjectBuilder *)self objectTypeErrorDescription];
  v7 = [v4 stringWithFormat:@"Unsupported expression found when creating %@", v6];

  uint64_t v12 = @"REErrorTokenKey";
  id v8 = [v5 token];

  v13[0] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v10 = RECreateErrorWithCodeMessageAndUseInfo(209, v7, v9);

  return v10;
}

- (REScriptSymbolTable)table
{
  return self->_table;
}

- (void).cxx_destruct
{
}

- (id)objectTypeErrorDescription
{
  return @"object";
}

- (id)buildObjectWithIdentifierNode:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)buildObjectWithLiteralNode:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)buildObjectWithPrefixExpressionNode:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)buildObjectWithBinaryExpressionNode:(id)a3 previousExpression:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)buildObjectWithFunctionNode:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)buildObjectWithMemberExpressionNode:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)buildObjectWithSubscriptExpressionNode:(id)a3 error:(id *)a4
{
  return 0;
}

@end